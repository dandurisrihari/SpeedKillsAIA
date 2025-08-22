#!/bin/bash
set -euo pipefail

# Define platforms
PLATFORMS=("nxp" "ti" "coral" "aws")

# Input/output directories
INPUT_DIR="data/json_files"
OUTPUT_DIR="data/llmanalysis"
LOG_DIR="data/llmanalysis"

# Loop over platforms and run for both dmesg + boot in background
for PLATFORM in "${PLATFORMS[@]}"; do
    for TYPE in dmesg boot; do
        INPUT_FILE="${INPUT_DIR}/${PLATFORM}_${TYPE}.json"

        if [[ -f "$INPUT_FILE" ]]; then
            OUTPUT_FILE="${OUTPUT_DIR}/${PLATFORM}_${TYPE}_llm_analysis.yaml"
            LOG_FILE="${LOG_DIR}/${PLATFORM}_${TYPE}_llm_analysis.log"

            echo "Launching analysis for $PLATFORM ($TYPE)..."
            python3 -m src.llm_analysis "$INPUT_FILE" \
                --output "$OUTPUT_FILE" \
                -v --verbose-log "$LOG_FILE" --csv-export &
        else
            echo "Skipping: $INPUT_FILE not found"
        fi
    done
done

# Wait for all background processes to finish
wait
echo "✅ All analyses completed."
