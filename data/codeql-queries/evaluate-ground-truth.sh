#!/usr/bin/env bash
#
# Scores the static ioctl reachability results against a ground-truth set of
# known-reachable functions, one set per platform.
#
# Reads the output of run-reachability.sh under results/ and writes:
#   results/ground-truth-eval.csv        one row per platform
#   results/ground-truth-functions.csv   one row per ground-truth function
#   results/ground-truth-eval.txt        the same, with definitions and caveats
#
# Usage:
#   ./evaluate-ground-truth.sh [RESULTS_DIR]
#
# Definitions, with G the ground-truth set, P the reported reachable set, and T
# the functions in the driver source:
#   TP = |P n G|, FN = |G \ P|, FP = |P \ G|
#   precision = TP / |P|      recall = TP / |G|
#   effortReduction = 1 - |P| / T
#
# T is read from the instrumenter's <platform>_stats.log in the dynamic baseline
# directory, so that the static and dynamic effort-reduction figures share a
# denominator and can be put side by side. Override its location with
# BASELINE_DIR.
#
# Note that |P| is the denominator for precision, as requested. See the caveat
# printed in the report: G lists a few known-reachable functions rather than an
# exhaustive labelling, so |P \ G| counts unlabelled functions as false
# positives and this precision is better read as the density of ground-truth
# functions in the reported surface than as classifier precision.

set -euo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
RESULTS_DIR="${1:-${SCRIPT_DIR}/results}"
BASELINE_DIR="${BASELINE_DIR:-${SCRIPT_DIR}/../dynamic_analysis_baseline}"

readonly PLATFORMS=(google nxp ti hailo nvidia aws)

die() {
  echo "error: $*" >&2
  exit 1
}

# Gets the human-readable name of a platform.
platform_label() {
  case "$1" in
    google) echo "Google TPU" ;;
    nxp) echo "NXP NPU" ;;
    ti) echo "TI MMA" ;;
    hailo) echo "Hailo NPU" ;;
    nvidia) echo "NVIDIA GPU" ;;
    aws) echo "AWS Inferentia" ;;
    *) die "unknown platform: $1" ;;
  esac
}

# Gets the results directory name holding that platform's run.
platform_db() {
  case "$1" in
    google) echo "google-codeql-db" ;;
    nxp) echo "nxp-codeql-db" ;;
    ti) echo "ti-codeql-db" ;;
    hailo) echo "hailo-codeql-db" ;;
    nvidia) echo "nvidia-codeql-db" ;;
    aws) echo "aws-codeql-db" ;;
    *) die "unknown platform: $1" ;;
  esac
}

# Gets the stats-log prefix for a platform. The Coral board is filed under its
# board name in the dynamic baseline and its driver name in the CodeQL results.
stats_prefix() {
  case "$1" in
    google) echo "coral" ;;
    *) echo "$1" ;;
  esac
}

# Gets the number of functions in the driver source, or 0 when unavailable.
total_in_source() {
  local stats="${BASELINE_DIR}/$(stats_prefix "$1")_stats.log"
  [[ -f "${stats}" ]] || { echo 0; return; }
  grep -ao 'Total functions in source code: [0-9]\+' "${stats}" |
    awk '{ print $NF }' |
    head -1
}

# Gets the ground-truth function names for a platform, space separated.
ground_truth() {
  case "$1" in
    google) echo "gasket_perform_mapping" ;;
    nxp) echo "_GFPAlloc gckMMU_FillFlatMappingWithPage16M import_page_map gckOS_MapPagesEx" ;;
    ti) echo "dma_heap_buffer_alloc dma_buf_phys_convert" ;;
    hailo) echo "hailo_desc_list_create hailo_vdma_buffer_map" ;;
    nvidia) echo "nvmap_ioctl_create_from_va nvgpu_vm_map_buffer" ;;
    aws) echo "mc_alloc_internal ncdev_mem_buf_copy ncdev_mem_get_pa_deprecated" ;;
    *) die "unknown platform: $1" ;;
  esac
}

[[ -d "${RESULTS_DIR}" ]] || die "results directory not found: ${RESULTS_DIR}"

readonly SUMMARY_CSV="${RESULTS_DIR}/ground-truth-eval.csv"
readonly DETAIL_CSV="${RESULTS_DIR}/ground-truth-functions.csv"
readonly REPORT_TXT="${RESULTS_DIR}/ground-truth-eval.txt"

# Gets the longest common directory prefix of the locations in a results CSV, so
# a missed function can be looked for in the driver sources it was built from.
source_root_of() {
  awk -F'"' 'FNR > 1 { split($(NF - 1), parts, ":"); print parts[1] }' "$1" |
    sort -u |
    awk '
      NR == 1 { prefix = $0; next }
      {
        len = 0
        for (i = 1; i <= length(prefix) && i <= length($0); i++) {
          if (substr(prefix, i, 1) != substr($0, i, 1)) break
          len = i
        }
        prefix = substr(prefix, 1, len)
      }
      END { sub(/\/[^\/]*$/, "", prefix); print prefix }
    '
}

# Distinguishes a call-graph miss from a function that is not in the sources at
# all; without this a ground-truth typo would be scored as an analysis failure.
# Emits "status|definingFile".
classify_miss() {
  local name="$1" root="$2" hit
  if [[ -z "${root}" || ! -d "${root}" ]]; then
    echo "missed-unknown|"
    return
  fi
  hit="$(grep -rlw --include='*.c' -- "${name}" "${root}" 2>/dev/null | head -1)"
  if [[ -n "${hit}" ]]; then
    echo "missed-in-source|${hit}"
  else
    echo "missed-not-in-source|"
  fi
}

printf 'platform,database,groundTruth,found,missed,reachable,totalInSource,effortReduction,precision,recall,f1\n' >"${SUMMARY_CSV}"
printf 'platform,function,status,minCallDepth,reachedFromEntryPoints,entryPointsOrDefiningFile\n' >"${DETAIL_CSV}"

total_tp=0
total_gt=0
total_reachable=0
MISS_NOTES=()

for platform in "${PLATFORMS[@]}"; do
  db="$(platform_db "${platform}")"
  csv="${RESULTS_DIR}/${db}/reachable-functions.csv"
  txt="${RESULTS_DIR}/${db}/reachable-functions.txt"
  [[ -f "${csv}" && -f "${txt}" ]] || die "missing results for ${platform}: run run-reachability.sh first"

  reachable="$(wc -l <"${txt}")"
  [[ "${reachable}" -gt 0 ]] || die "no reachable functions recorded for ${platform}"

  root=""
  gt=(); read -r -a gt <<<"$(ground_truth "${platform}")"
  tp=0

  for name in "${gt[@]}"; do
    if grep -qxF -- "${name}" "${txt}"; then
      # Columns 1-4 of the results CSV are comma-free, so a plain split is safe.
      depth="$(awk -F, -v target="\"${name}\"" '$2 == target { if (best == "" || $3 < best) best = $3 } END { print best }' "${csv}")"
      entries="$(awk -F, -v target="\"${name}\"" '$2 == target { gsub(/"/, "", $1); print $1 }' "${csv}" | sort -u)"
      count="$(printf '%s\n' "${entries}" | wc -l)"
      joined="$(paste -sd';' - <<<"${entries}")"
      printf '%s,%s,found,%s,%s,"%s"\n' "${platform}" "${name}" "${depth}" "${count}" "${joined}" >>"${DETAIL_CSV}"
      tp=$((tp + 1))
    else
      [[ -n "${root}" ]] || root="$(source_root_of "${csv}")"
      verdict="$(classify_miss "${name}" "${root}")"
      status="${verdict%%|*}"
      where="${verdict#*|}"
      printf '%s,%s,%s,,0,"%s"\n' "${platform}" "${name}" "${status}" "${where}" >>"${DETAIL_CSV}"
      MISS_NOTES+=("${platform}: ${name} (${status})${where:+ defined in ${where}}")
    fi
  done

  gt_count=${#gt[@]}
  in_source="$(total_in_source "${platform}")"
  read -r reduction precision recall f1 < <(
    awk -v tp="${tp}" -v n="${gt_count}" -v p="${reachable}" -v src="${in_source}" 'BEGIN {
      reduction = (src > 0) ? 1 - p / src : 0
      precision = (p > 0) ? tp / p : 0
      recall = (n > 0) ? tp / n : 0
      f1 = (precision + recall > 0) ? 2 * precision * recall / (precision + recall) : 0
      printf "%.6f %.6f %.6f %.6f\n", reduction, precision, recall, f1
    }'
  )

  printf '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n' \
    "${platform}" "${db}" "${gt_count}" "${tp}" "$((gt_count - tp))" \
    "${reachable}" "${in_source}" "${reduction}" \
    "${precision}" "${recall}" "${f1}" >>"${SUMMARY_CSV}"

  total_tp=$((total_tp + tp))
  total_gt=$((total_gt + gt_count))
  total_reachable=$((total_reachable + reachable))
done

# Micro-average: pooled counts, not the mean of the per-platform rates, so the
# larger surfaces are not given the same weight as the small ones.
read -r micro_p micro_r micro_f1 < <(
  awk -v tp="${total_tp}" -v n="${total_gt}" -v p="${total_reachable}" 'BEGIN {
    precision = tp / p
    recall = tp / n
    f1 = (precision + recall > 0) ? 2 * precision * recall / (precision + recall) : 0
    printf "%.6f %.6f %.6f\n", precision, recall, f1
  }'
)

{
  cat <<'EOF'
Ground-truth evaluation of static ioctl reachability
====================================================

Scores the reported reachable set P for each platform against a ground-truth set
G of functions known to be reachable through ioctl.

  TP = |P n G|    ground-truth functions the analysis reported
  FN = |G \ P|    ground-truth functions it missed
  precision = TP / |P|
  recall    = TP / |G|
  effortReduction = 1 - |P| / functions in driver source

effortReduction is the share of the driver's methods the analysis eliminates from
consideration: those it proves unreachable from any ioctl entry point, and so
never puts in front of a reviewer. The denominator is the instrumenter's count of
functions in the driver source, the same one the dynamic baseline uses, so the
two reductions are directly comparable.

A missed function is classified by looking for its name in the driver sources the
database was built from:
  missed-in-source      present in the sources, so the call graph did not reach it
  missed-not-in-source  not in the sources, e.g. a stale or misspelled name
  missed-unknown        the source tree could not be located

CAVEAT ON PRECISION. G lists a handful of known-reachable functions, not an
exhaustive labelling of the surface, so every unlabelled reachable function is
counted as a false positive. Precision here is therefore the density of
ground-truth functions within the reported surface, and is bounded above by
|G| / |P|; it is not classifier precision and should not be read as one. Recall
is the sound metric: it asks whether the analysis loses any function known to be
reachable. Report precision only alongside that definition.

EOF

  printf 'Per platform\n------------\n\n'
  printf '%-9s %-20s %5s %5s %6s %8s %9s %10s %9s %7s\n' \
    "platform" "database" "|G|" "TP" "FN" "|P|" "inSource" "effortRed" \
    "precision" "recall"
  awk -F, 'NR > 1 {
    printf "%-9s %-20s %5s %5s %6s %8s %9s %9.1f%% %9.5f %7.3f\n",
      $1, $2, $3, $4, $5, $6, $7, $8 * 100, $9, $10
  }' "${SUMMARY_CSV}"

  printf '\nPooled: TP=%s |G|=%s |P|=%s  precision=%s  recall=%s  f1=%s\n' \
    "${total_tp}" "${total_gt}" "${total_reachable}" "${micro_p}" "${micro_r}" "${micro_f1}"

  printf '\nPer ground-truth function\n-------------------------\n\n'
  printf '%-10s %-38s %-22s %6s %8s\n' "platform" "function" "status" "depth" "handlers"
  awk -F, 'NR > 1 { printf "%-10s %-38s %-22s %6s %8s\n", $1, $2, $3, $4, $5 }' "${DETAIL_CSV}"

  if [[ ${#MISS_NOTES[@]} -gt 0 ]]; then
    printf '\nMisses\n------\n'
    printf '  %s\n' "${MISS_NOTES[@]}"
  else
    printf '\nNo misses: every ground-truth function was reported reachable.\n'
  fi
} >"${REPORT_TXT}"

cat "${REPORT_TXT}"
echo
echo "wrote: ${SUMMARY_CSV}"
echo "       ${DETAIL_CSV}"
echo "       ${REPORT_TXT}"
