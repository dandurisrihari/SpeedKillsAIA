# SpeedKillsAIA

**LLM-Assisted Framework for Confused Deputy Attack Detection on AI Accelerators**
SpeedKillsAIA is a framework designed to detect and analyze confused deputy attacks targeting AI accelerator systems. 

## Overview
src/kernel_instrumenter --> Instruments kernel driver source code
src/preprocess --> Takes in log files and extracts relevant information in json format
src/llm_analysis --> Takes in gathered information (json format) and produces csv, yaml, log files containing analysis
src/structanalyzer --> Helps LLM do structure analysis, can be used independently as module as well.

## Source env
source setup.sh

## Running individual componets
python3 -m src.kernel_instrumenter --help
python3 -m src.preprocess --help
python3 -m src.llm_analysis --help
python3 -m src.structanalyzer --help

## Helper scripts to run preprocess and llm_analysis componets
llmanalysis.sh
processjson.sh

## exploit scripts for each AIA 
exploits