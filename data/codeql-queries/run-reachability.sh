#!/usr/bin/env bash
#
# Runs ReachableFunctions.ql against CodeQL databases and writes, per database:
#   <outdir>/reachable-functions.csv      entryPoint, function, depth, hasBody, location
#   <outdir>/reachable-by-entrypoint.txt  the same table as one block per handler
#   <outdir>/reachable-functions.txt      unique function names across all handlers
#
# and once for the whole run:
#   results/summary.csv                   one row per database
#   results/summary.txt                  the same table, with column definitions
#
# Usage:
#   ./run-reachability.sh                      every database under data/codeql-dbs
#   ./run-reachability.sh DATABASE             one database, into results/<name>
#   ./run-reachability.sh DATABASE OUTPUT_DIR  one database, explicit output directory
#
# A database may cover several drivers; every ioctl handler in it becomes its own
# entry point and its own block in the output.
#
# Each database is scoped to the tree its driver sources live in, so the kernel
# headers every build drags in under /usr/src are excluded. Export SOURCE_FILTER
# (a space-separated list of CodeQL `matches` patterns) to override that scope, or
# TARGET_FUNCTION to pin a single handler; both rewrite the query for this run
# only.
#
# Results from previous runs are deleted first, so each run fully replaces them.

set -euo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly QUERY="${SCRIPT_DIR}/ReachableFunctions.ql"
readonly DB_ROOT="${SCRIPT_DIR}/../codeql-dbs"
readonly OUTPUT_ROOT="${SCRIPT_DIR}/results"
readonly SUMMARY_CSV="${OUTPUT_ROOT}/summary.csv"
readonly SUMMARY_TXT="${OUTPUT_ROOT}/summary.txt"

# Fallback for a database not listed in db_filter. It is deliberately broad, and
# a vendor kernel checked out under this tree would leak its headers into the
# results, so prefer an explicit case below.
readonly DEFAULT_FILTER='%/Accelerators_Research/%'

die() {
  echo "error: $*" >&2
  exit 1
}

# Gets the path patterns for a database, as a space-separated list; patterns
# therefore cannot contain spaces.
#
# Each entry names the driver's own subtree, not the checkout that contains it.
# That distinction matters for the in-tree drivers: NXP and TI ship a whole
# vendor kernel, so scoping to the checkout would count several hundred
# `static inline` functions from include/ and arch/ as driver code.
db_filter() {
  case "$1" in
    aws-codeql-db) echo '%/aws_inferentia/%' ;;
    google-codeql-db) echo '%/gasket-driver/%' ;;
    hailo-codeql-db) echo '%/hailort-drivers/%' ;;
    nvidia-codeql-db)
      # nvgpu and nvmap are separate trees inside the L4T release, and scoping to
      # nvgpu alone would silently drop the nvmap_ioctl entry point.
      echo '%/source/kernel/nvgpu/% %/source/kernel/nvidia/%'
      ;;
    nxp-codeql-db) echo '%/drivers/mxc/gpu-viv/%' ;;
    ti-codeql-db) echo '%/ti-linux-kernel%/drivers/%' ;;
    *) echo "${DEFAULT_FILTER}" ;;
  esac
}

# Starts the run-wide summary. Called after any wipe of the output tree so the
# file it creates survives.
init_summary() {
  mkdir -p -- "${OUTPUT_ROOT}"
  printf 'database,ioctlEntryPoints,reachableFunctions,maxCallDepth,pathFilter,entryPointBreakdown\n' \
    >"${SUMMARY_CSV}"
}

# Restates the summary with its column definitions, since the CSV header alone
# does not say which counts may be added up and which may not.
write_summary_notes() {
  {
    cat <<'EOF'
Static ioctl reachability summary
=================================

One row per CodeQL database.

  database             CodeQL database the row was produced from.
  ioctlEntryPoints     Number of ioctl handlers found in it. A database may hold
                       several drivers, each with its own handlers.
  reachableFunctions   Distinct functions reachable from any of those handlers,
                       after the path and has-body filters. This is the driver's
                       static attack surface and the figure to quote.
  maxCallDepth         Longest of the per-function shortest call chains. -1 would
                       mean the query's depth bound was hit.
  pathFilter           Source-path patterns the analysis was scoped to.
  entryPointBreakdown  Per-handler reachable counts, as name=count. Handlers call
                       into shared helpers and sometimes into each other, so these
                       overlap: they do NOT sum to reachableFunctions.

EOF
    # Only the scalar columns; the breakdown is too wide for a shared table.
    awk -F, '
      NR == 1 { next }
      { printf "%-24s %12s %10s %9s\n", $1, $2, $3, $4 }
    ' "${SUMMARY_CSV}" |
      cat <(printf '%-24s %12s %10s %9s\n' "database" "entryPoints" "reachable" "maxDepth") -

    printf '\nPer-handler breakdown\n'
    awk -F, 'NR > 1 {
      gsub(/"/, "", $5)
      gsub(/"/, "", $6)
      printf "\n%s  (scope: %s)\n", $1, $5
      count = split($6, handlers, "; ")
      for (i = 1; i <= count; i++) {
        split(handlers[i], pair, "=")
        printf "  %-52s %s\n", pair[1], pair[2]
      }
    }' "${SUMMARY_CSV}"
  } >"${SUMMARY_TXT}"
}

command -v codeql >/dev/null 2>&1 || die "codeql is not on PATH"
[[ -f "${QUERY}" ]] || die "query not found: ${QUERY}"
[[ $# -le 2 ]] || die "usage: $(basename -- "$0") [DATABASE [OUTPUT_DIR]]"

readonly SCRATCH="$(mktemp -d)"
readonly RUN_QUERY="${SCRATCH}/ReachableFunctions.ql"
trap 'rm -rf "${SCRATCH}"' EXIT
cp "${SCRIPT_DIR}/qlpack.yml" "${SCRIPT_DIR}/codeql-pack.lock.yml" "${SCRATCH}/" 2>/dev/null || true

# Renders patterns as a QL string, or as a string-set literal when there are
# several; `matches` against a set holds if any member matches.
ql_pattern_literal() {
  local rendered=() pattern
  for pattern in "$@"; do
    # & and \ are substitution metacharacters in the sed that injects this.
    [[ "${pattern}" != *'"'* && "${pattern}" != *'\'* && "${pattern}" != *'&'* ]] ||
      die "path pattern must not contain quotes, backslashes or ampersands: ${pattern}"
    rendered+=("\"${pattern}\"")
  done
  if [[ ${#rendered[@]} -eq 1 ]]; then
    printf '%s' "${rendered[0]}"
  else
    local IFS=','
    printf '[%s]' "${rendered[*]}"
  fi
}

# Applies this run's overrides to a throwaway copy, so the checked-in query keeps
# its defaults.
prepare_query() {
  cp "${QUERY}" "${RUN_QUERY}"

  if [[ -n "${TARGET_FUNCTION:-}" ]]; then
    [[ "${TARGET_FUNCTION}" =~ ^[A-Za-z_][A-Za-z0-9_]*$ ]] ||
      die "TARGET_FUNCTION is not a C identifier: ${TARGET_FUNCTION}"
    sed -i "s|^string targetFunctionName() { result = \".*\" }$|string targetFunctionName() { result = \"${TARGET_FUNCTION}\" }|" \
      "${RUN_QUERY}"
  fi

  sed -i "s|^string sourcePathPattern() { result = .* }$|string sourcePathPattern() { result = $1 }|" \
    "${RUN_QUERY}"
}

SUMMARY=()

analyse_database() {
  local database="$1" output_dir="$2"
  local name bqrs csv txt grouped handlers functions max_depth entry_counts entry_list
  local patterns=()

  [[ -f "${database}/codeql-database.yml" ]] || die "not a CodeQL database: ${database}"
  [[ -n "${output_dir}" && "${output_dir}" != "/" ]] ||
    die "refusing to clear output directory: ${output_dir}"

  name="$(basename -- "${database}")"
  # Unquoted expansion is deliberate: the filter is a space-separated pattern list.
  read -r -a patterns <<<"${SOURCE_FILTER:-$(db_filter "${name}")}"
  prepare_query "$(ql_pattern_literal "${patterns[@]}")"

  rm -rf -- "${output_dir}"
  mkdir -p -- "${output_dir}"

  bqrs="${output_dir}/reachable-functions.bqrs"
  csv="${output_dir}/reachable-functions.csv"
  txt="${output_dir}/reachable-functions.txt"
  grouped="${output_dir}/reachable-by-entrypoint.txt"

  echo "=============================================================="
  echo "database : ${database}"
  echo "target   : ${TARGET_FUNCTION:-<all ioctl handlers>}"
  echo "filter   : ${patterns[*]}"
  echo "output   : ${output_dir}"

  codeql query run --database="${database}" --output="${bqrs}" -- "${RUN_QUERY}"
  codeql bqrs decode --format=csv --output="${csv}" -- "${bqrs}"

  if [[ "$(wc -l <"${csv}")" -le 1 ]]; then
    echo "warning: no results; the path filter probably does not match this database" >&2
  fi

  # Columns 1-4 are identifiers and integers, so none of them can contain a comma
  # and a plain field split is enough. Only the trailing location column can.
  tail -n +2 "${csv}" | cut -d, -f2 | tr -d '"' | sort -u >"${txt}"

  # First pass counts each block so its header can carry the size, second pass prints.
  awk -F, '
    NR == FNR { if (FNR > 1) { gsub(/"/, "", $1); total[$1]++ } ; next }
    FNR == 1 { next }
    {
      gsub(/"/, "", $1); gsub(/"/, "", $2); gsub(/"/, "", $4)
      if ($1 != current) {
        if (current != "") printf "\n"
        printf "===== %s  (%d reachable)\n", $1, total[$1]
        printf "%5s  %-4s  %s\n", "depth", "body", "function"
        current = $1
      }
      printf "%5d  %-4s  %s\n", $3, $4, $2
    }
  ' "${csv}" "${csv}" >"${grouped}"

  handlers="$(tail -n +2 "${csv}" | cut -d, -f1 | tr -d '"' | sort -u | wc -l)"
  functions="$(wc -l <"${txt}")"
  max_depth="$(awk -F, 'FNR > 1 { if ($3 + 0 > deepest) deepest = $3 + 0 } END { print deepest + 0 }' "${csv}")"
  entry_counts="$(awk -F, 'FNR > 1 { gsub(/"/, "", $1); reached[$1]++ }
                          END { for (entry in reached) print entry, reached[entry] }' "${csv}" | sort)"

  # Per-handler counts are folded into one cell so the database stays a single row.
  # A here-string of "" still feeds awk one empty record, hence the explicit guard.
  if [[ -z "${entry_counts}" ]]; then
    entry_list=""
  else
    entry_list="$(awk '{ printf "%s%s=%s", separator, $1, $2; separator = "; " }' <<<"${entry_counts}")"
  fi
  printf '%s,%s,%s,%s,"%s","%s"\n' \
    "${name}" "${handlers}" "${functions}" "${max_depth}" "${patterns[*]}" "${entry_list}" \
    >>"${SUMMARY_CSV}"

  echo
  echo "entry points:"
  if [[ -z "${entry_counts}" ]]; then
    echo "  <none found>"
  else
    awk '{ printf "  %-52s %s reachable\n", $1, $2 }' <<<"${entry_counts}"
  fi
  echo

  SUMMARY+=("$(printf '%-24s %9s %10s' "${name}" "${handlers}" "${functions}")")
}

if [[ $# -ge 1 ]]; then
  init_summary
  analyse_database "$1" "${2:-${OUTPUT_ROOT}/$(basename -- "$1")}"
else
  [[ -d "${DB_ROOT}" ]] || die "database directory not found: ${DB_ROOT}"
  # Wiping the whole root also drops directories left behind by databases that are gone.
  rm -rf -- "${OUTPUT_ROOT}"
  init_summary
  found=0
  for manifest in "${DB_ROOT}"/*/codeql-database.yml; do
    [[ -f "${manifest}" ]] || continue
    found=1
    database="$(dirname -- "${manifest}")"
    analyse_database "${database}" "${OUTPUT_ROOT}/$(basename -- "${database}")"
  done
  [[ "${found}" -eq 1 ]] || die "no CodeQL databases found under ${DB_ROOT}"
fi

echo "=============================================================="
printf '%-24s %9s %10s\n' "database" "handlers" "functions"
printf '%s\n' "${SUMMARY[@]}"
write_summary_notes
echo
echo "summary: ${SUMMARY_CSV}"
echo "         ${SUMMARY_TXT}"
