#!/bin/bash

# This script creates a directory structure for the cdaframework project
# in the current working directory. It checks for the existence of 
# directories and files before creating them.

# Define the list of directories to create as a bash array
dirs=(
    "src/preprocess"
    "src/parsers"
    "src/instrumentation"
    "src/llm_analysis"
    "src/detection"
    "src/utils"
    "exploits"
    "scripts"
    "data/kernel_sources"
    "data/logs"
    "data/docs"
    "results/reports"
    "results/findings"
    "results/annotated_sources"
    "tests"
)

# Define the list of files to create as a bash array
files=(
    "src/__init__.py"
    "src/preprocess/__init__.py"
    "src/preprocess/log_filter.py"
    "src/preprocess/strace_filter.py"
    "src/preprocess/source_filter.py"
    "src/parsers/__init__.py"
    "src/parsers/dmesg_parser.py"
    "src/parsers/strace_parser.py"
    "src/parsers/driver_source_parser.py"
    "src/instrumentation/__init__.py"
    "src/instrumentation/injector.py"
    "src/instrumentation/tracker.py"
    "src/llm_analysis/__init__.py"
    "src/llm_analysis/analyze_logs.py"
    "src/llm_analysis/analyze_strace.py"
    "src/llm_analysis/analyze_source.py"
    "src/llm_analysis/analyze_docs.py"
    "src/detection/__init__.py"
    "src/detection/detector.py"
    "src/utils/__init__.py"
    "src/utils/logger.py"
    "exploits/dma_privilege_escalation.py"
    "exploits/unvalidated_copy_trigger.py"
    "scripts/run_pipeline.py"
    "scripts/instrument_and_analyze.py"
    "tests/test_parsers.py"
    "tests/test_instrumentation.py"
    "tests/test_detection.py"
    "tests/test_llm_analysis.py"
    ".gitignore"
    "requirements.txt"
    "README.md"
    "setup.sh"
)

echo "Creating project structure in current directory..."

# Loop through the 'dirs' array and create each directory.
# The -d flag checks if the directory already exists.
for d in "${dirs[@]}"; do
    if [ ! -d "$d" ]; then
        echo "Creating directory: $d"
        mkdir -p "$d"
    else
        echo "Directory already exists, skipping: $d"
    fi
done

# Loop through the 'files' array and create each file.
# The -f flag checks if the file already exists.
for f in "${files[@]}"; do
    if [ ! -f "$f" ]; then
        echo "Creating file: $f"
        touch "$f"
    else
        echo "File already exists, skipping: $f"
    fi
done

echo "Project structure has been successfully created/verified in the current directory."
