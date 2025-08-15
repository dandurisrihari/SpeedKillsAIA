#!/bin/bash

set -u
trap 'echo "An error occurred at line $LINENO. Exiting."' ERR

# Absolute path for the PID file to avoid confusion
PID_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/webviewer_pids.txt"

PLATFORMS=("nxp" "ti" "coral" "aws")

run_preprocess() {
  local platform=$1
  local output_suffix=$2
  local log_type=$3

  echo "Running preprocess for $platform - $output_suffix"
  python3 -m src.preprocess \
    --source-root "data/kernel_sources/${platform}/" \
    -o "data/json_files/${platform}_${output_suffix}.json" \
    --strace-log "data/logs/${platform}/${platform}_strace.log" \
    --log "data/logs/${platform}/${platform}_${log_type}_dma_userapi_dmafilefuncs_ioctl.log"

  if [[ $? -ne 0 ]]; then
    echo "❌ Error processing $platform - $output_suffix"
  else
    echo "✅ Successfully processed $platform - $output_suffix"
  fi
}

launch_viewer() {
  CMD=$1
  echo "Running: $CMD"
  $CMD &                   # Run in background
  PID=$!
  echo "$PID" >> "$PID_FILE"
  echo "  → PID: $PID"
}

do_process() {
  for platform in "${PLATFORMS[@]}"; do
    echo "=== Processing platform: $platform ==="
    run_preprocess "$platform" "dmesg" "dmesg"
    run_preprocess "$platform" "boot" "uart_boot"
    echo "=== Done with $platform ==="
    echo
  done
}

do_start() {
  # Clear any existing PIDs
  > "$PID_FILE"
  echo "Launching web viewers..."

  launch_viewer "python3 -m src.webviewer data/json_files/nxp_boot.json --port 8080"
  launch_viewer "python3 -m src.webviewer data/json_files/nxp_dmesg.json --port 8081"
  launch_viewer "python3 -m src.webviewer data/json_files/ti_boot.json --port 8082"
  launch_viewer "python3 -m src.webviewer data/json_files/ti_dmesg.json --port 8083"
  launch_viewer "python3 -m src.webviewer data/json_files/coral_boot.json --port 8084"
  launch_viewer "python3 -m src.webviewer data/json_files/coral_dmesg.json --port 8085"

  launch_viewer "python3 -m src.webviewer data/json_files/aws_dmesg.json --port 8086"
  launch_viewer "python3 -m src.webviewer data/json_files/aws_dmesg.json --port 8087"

  echo "All web viewers launched in background."
  echo "Use '$0 stop' to kill them."
}

do_stop() {
  if [[ -f "$PID_FILE" ]]; then
    echo "Stopping all webviewer processes..."
    while read -r PID; do
      if kill -0 "$PID" 2>/dev/null; then
        kill "$PID"
        echo "  → Killed PID $PID"
      else
        echo "  → PID $PID already stopped"
      fi
    done < "$PID_FILE"
    rm -f "$PID_FILE"
    echo "All processes stopped."
  else
    echo "No PID file found. Nothing to stop."
  fi
}

show_help() {
  cat <<EOF
Usage: $0 [process|start|stop]
  process   Run preprocess for all platforms
  start     Launch all web viewers
  stop      Stop all web viewer processes
EOF
}

############################
# Main logic

case "${1:-}" in
  process) do_process ;;
  start) do_start ;;
  stop) do_stop ;;
  -h|--help|help) show_help ;;
  *)
    echo "Unknown or missing command."
    show_help
    exit 1
  ;;
esac