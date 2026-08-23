#!/usr/bin/env bash
#
# Scores the dynamic instrumentation baseline against the same ground-truth sets
# used for the static ioctl reachability evaluation.
#
# Reads <platform>_dynamic_dmesg.log and <platform>_stats.log from this directory
# and writes:
#   dynamic-ground-truth-eval.csv        one row per platform
#   dynamic-ground-truth-functions.csv   one row per ground-truth function
#   dynamic-ground-truth-eval.txt        the same, with definitions and caveats
#
# Usage:
#   ./evaluate-dynamic-ground-truth.sh [BASELINE_DIR]
#
# The observed count O is the number of "[Dynamic Baseline] <function>" markers
# in the boot log, matching the figure in <platform>_stats.log. With G the
# ground-truth set and T the functions in the driver source:
#   TP = |O n G|, FN = |G \ O|
#   precision = TP / |O|      recall = TP / |G|
#   effortReduction = 1 - |O| / T
#
# A name defined `static` in several translation units is several functions and
# fires a marker from each; every one of those counts.
#
# |O| is the denominator for precision, matching the static evaluation. The same
# caveat applies: G is a short list of known-interesting functions rather than an
# exhaustive labelling, so this precision is the density of ground-truth
# functions in the observed set, not classifier precision.

set -euo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BASELINE_DIR="${1:-${SCRIPT_DIR}}"

# Log-file prefixes. The Coral platform is filed under its board name here and
# under its driver name in the CodeQL results.
readonly PLATFORMS=(coral nxp ti hailo nvidia aws)

die() {
  echo "error: $*" >&2
  exit 1
}

platform_label() {
  case "$1" in
    coral) echo "Google TPU" ;;
    nxp) echo "NXP NPU" ;;
    ti) echo "TI MMA" ;;
    hailo) echo "Hailo NPU" ;;
    nvidia) echo "NVIDIA GPU" ;;
    aws) echo "AWS Inferentia" ;;
    *) die "unknown platform: $1" ;;
  esac
}

# Gets the ground-truth function names for a platform, space separated. Kept
# identical to evaluate-ground-truth.sh so the two runs stay comparable.
ground_truth() {
  case "$1" in
    coral) echo "gasket_perform_mapping" ;;
    nxp) echo "_GFPAlloc gckMMU_FillFlatMappingWithPage16M import_page_map gckOS_MapPagesEx" ;;
    ti) echo "dma_heap_buffer_alloc dma_buf_phys_convert" ;;
    hailo) echo "hailo_desc_list_create hailo_vdma_buffer_map" ;;
    nvidia) echo "nvmap_ioctl_create_from_va nvgpu_vm_map_buffer" ;;
    aws) echo "mc_alloc_internal ncdev_mem_buf_copy ncdev_mem_get_pa_deprecated" ;;
    *) die "unknown platform: $1" ;;
  esac
}

[[ -d "${BASELINE_DIR}" ]] || die "baseline directory not found: ${BASELINE_DIR}"

readonly SUMMARY_CSV="${BASELINE_DIR}/dynamic-ground-truth-eval.csv"
readonly DETAIL_CSV="${BASELINE_DIR}/dynamic-ground-truth-functions.csv"
readonly REPORT_TXT="${BASELINE_DIR}/dynamic-ground-truth-eval.txt"
readonly WORK_DIR="$(mktemp -d)"
trap 'rm -rf "${WORK_DIR}"' EXIT

# Writes "count name" per observed function, most frequent first.
#
# -a matters: at least one boot log carries non-UTF8 bytes, and without it grep
# treats the whole file as binary and reports nothing.
observed_counts() {
  grep -ao '\[Dynamic Baseline\][[:space:]]\+[A-Za-z_][A-Za-z0-9_]*' "$1" |
    awk '{ print $NF }' |
    sort |
    uniq -c |
    sort -rn
}

printf 'platform,label,groundTruth,found,missed,observed,totalInSource,effortReduction,precision,recall,f1\n' \
  >"${SUMMARY_CSV}"
printf 'platform,function,status,timesLogged\n' >"${DETAIL_CSV}"

total_tp=0
total_gt=0
total_observed=0
MISS_NOTES=()

for platform in "${PLATFORMS[@]}"; do
  log="${BASELINE_DIR}/${platform}_dynamic_dmesg.log"
  stats="${BASELINE_DIR}/${platform}_stats.log"
  [[ -f "${log}" ]] || die "missing boot log: ${log}"

  counts="${WORK_DIR}/${platform}.counts"
  observed_counts "${log}" >"${counts}"
  observed="$(awk '{ total += $1 } END { print total + 0 }' "${counts}")"
  [[ "${observed}" -gt 0 ]] || die "no [Dynamic Baseline] markers found in ${log}"

  # Denominator for coverage only; the instrumenter records it, so it is read
  # rather than recomputed.
  in_source=""
  [[ -f "${stats}" ]] &&
    in_source="$(grep -ao 'Total functions in source code: [0-9]\+' "${stats}" | awk '{ print $NF }' || true)"
  : "${in_source:=0}"

  gt=(); read -r -a gt <<<"$(ground_truth "${platform}")"
  tp=0

  for name in "${gt[@]}"; do
    times="$(awk -v target="${name}" '$2 == target { print $1 }' "${counts}")"
    if [[ -n "${times}" ]]; then
      printf '%s,%s,observed,%s\n' "${platform}" "${name}" "${times}" >>"${DETAIL_CSV}"
      tp=$((tp + 1))
    else
      printf '%s,%s,not-observed,0\n' "${platform}" "${name}" >>"${DETAIL_CSV}"
      MISS_NOTES+=("${platform}: ${name}")
    fi
  done

  gt_count=${#gt[@]}
  read -r reduction precision recall f1 < <(
    awk -v tp="${tp}" -v n="${gt_count}" -v o="${observed}" -v src="${in_source}" 'BEGIN {
      reduction = (src > 0) ? 1 - o / src : 0
      precision = (o > 0) ? tp / o : 0
      recall = (n > 0) ? tp / n : 0
      f1 = (precision + recall > 0) ? 2 * precision * recall / (precision + recall) : 0
      printf "%.6f %.6f %.6f %.6f\n", reduction, precision, recall, f1
    }'
  )

  printf '%s,"%s",%s,%s,%s,%s,%s,%s,%s,%s,%s\n' \
    "${platform}" "$(platform_label "${platform}")" "${gt_count}" "${tp}" \
    "$((gt_count - tp))" "${observed}" "${in_source}" \
    "${reduction}" "${precision}" "${recall}" "${f1}" >>"${SUMMARY_CSV}"

  total_tp=$((total_tp + tp))
  total_gt=$((total_gt + gt_count))
  total_observed=$((total_observed + observed))
done

read -r micro_p micro_r micro_f1 < <(
  awk -v tp="${total_tp}" -v n="${total_gt}" -v o="${total_observed}" 'BEGIN {
    precision = tp / o
    recall = tp / n
    f1 = (precision + recall > 0) ? 2 * precision * recall / (precision + recall) : 0
    printf "%.6f %.6f %.6f\n", precision, recall, f1
  }'
)

{
  cat <<'EOF'
Ground-truth evaluation of the dynamic instrumentation baseline
===============================================================

Scores the set O of functions actually executed during the instrumented boot and
workload against the ground-truth set G, using the same G and the same metric
definitions as the static ioctl reachability evaluation.

  TP = |O n G|    ground-truth functions the run exercised
  FN = |G \ O|    ground-truth functions it never reached
  precision = TP / |O|
  recall    = TP / |G|
  effortReduction = 1 - |O| / functions in driver source

effortReduction is the share of the driver's methods the baseline eliminates from
consideration: the fraction never executed, and so never in front of a reviewer.

O is the number of "[Dynamic Baseline] <function>" markers in the boot log, which
is the figure <platform>_stats.log reports. A function name declared `static` in
several translation units is several distinct functions, and each logs its own
marker; all of them count.

CAVEAT ON PRECISION. As in the static evaluation, G is a short list of known
functions rather than an exhaustive labelling, so every other observed function
is counted as a false positive. Precision here is the density of ground-truth
functions within the observed set and is bounded above by |G| / |O|. Recall is
the metric that carries meaning: it asks whether the workload actually drove the
code the ground truth names.

A not-observed function is a property of the workload, not a defect: dynamic
tracing only sees what the exercised paths executed.

EOF

  printf 'Per platform\n------------\n\n'
  printf '%-9s %-16s %5s %5s %6s %9s %9s %10s %9s %7s\n' \
    "platform" "label" "|G|" "TP" "FN" "|O|" "inSource" "effortRed" \
    "precision" "recall"
  awk -F, 'NR > 1 {
    gsub(/"/, "", $2)
    printf "%-9s %-16s %5s %5s %6s %9s %9s %9.1f%% %9.5f %7.3f\n",
      $1, $2, $3, $4, $5, $6, $7, $8 * 100, $9, $10
  }' "${SUMMARY_CSV}"

  printf '\nPooled: TP=%s |G|=%s |O|=%s  precision=%s  recall=%s  f1=%s\n' \
    "${total_tp}" "${total_gt}" "${total_observed}" "${micro_p}" "${micro_r}" "${micro_f1}"

  printf '\nPer ground-truth function\n-------------------------\n\n'
  printf '%-9s %-38s %-14s %12s\n' "platform" "function" "status" "timesLogged"
  awk -F, 'NR > 1 { printf "%-9s %-38s %-14s %12s\n", $1, $2, $3, $4 }' "${DETAIL_CSV}"

  if [[ ${#MISS_NOTES[@]} -gt 0 ]]; then
    printf '\nNot observed\n------------\n'
    printf '  %s\n' "${MISS_NOTES[@]}"
  else
    printf '\nEvery ground-truth function was exercised.\n'
  fi
} >"${REPORT_TXT}"

cat "${REPORT_TXT}"
echo
echo "wrote: ${SUMMARY_CSV}"
echo "       ${DETAIL_CSV}"
echo "       ${REPORT_TXT}"
