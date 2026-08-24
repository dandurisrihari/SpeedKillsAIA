#!/bin/bash
#
# Runs the post-analysis stats pipeline over this directory:
#   1. unique  - unique_<name>.csv per analysis CSV (per-category, score > 0, sorted by score)
#   2. ber     - BER.csv per run directory
#   3. average - average_BER.csv across the timestamped run directories
#
set -u

ANALYSIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${ANALYSIS_DIR}/../.." && pwd)"
STATS_DIR="${PROJECT_ROOT}/src/statscalculation"
PYTHON="${PYTHON:-python3}"

usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [COMMAND]

Commands:
  all        Run unique, ber and average in order (default)
  unique     Create unique_<name>.csv for every analysis CSV (recursive)
  ber        Create BER.csv in every run directory (recursive)
  average    Create average_BER.csv from the timestamped run directories
  help       Show this message

Environment:
  PYTHON     Python interpreter to use (default: python3)

Operates on: ${ANALYSIS_DIR}
EOF
}

run_unique() {
  echo "=== unique_*.csv ==="
  "${PYTHON}" "${STATS_DIR}/uniqueanalysis.py" "${ANALYSIS_DIR}" --recursive
}

run_ber() {
  echo "=== BER.csv ==="
  "${PYTHON}" "${STATS_DIR}/ber.py" "${ANALYSIS_DIR}" --recursive
}

run_average() {
  echo "=== average_BER.csv ==="
  "${PYTHON}" "${STATS_DIR}/averageber.py" "${ANALYSIS_DIR}"
}

case "${1:-all}" in
  all)
    run_unique && echo && run_ber && echo && run_average
    ;;
  unique)
    run_unique
    ;;
  ber)
    run_ber
    ;;
  average)
    run_average
    ;;
  help | -h | --help)
    usage
    ;;
  *)
    echo "Unknown command: $1" >&2
    echo >&2
    usage >&2
    exit 1
    ;;
esac
