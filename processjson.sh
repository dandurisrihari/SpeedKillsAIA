#!/bin/bash

set -u
trap 'echo "An error occurred at line $LINENO. Exiting."' ERR

PLATFORMS=("nxp" "ti" "coral" "aws" "hailo" "nvidia")

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

do_process() {
  for platform in "${PLATFORMS[@]}"; do
    echo "=== Processing platform: $platform ==="
    run_preprocess "$platform" "dmesg" "dmesg"
    run_preprocess "$platform" "boot" "uart_boot"
    echo "=== Done with $platform ==="
    echo
  done
}

############################
# Main logic

do_process
