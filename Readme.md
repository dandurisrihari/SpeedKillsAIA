# SpeedKillsAIA (DeputyHunt)

**LLM-Assisted Framework for Confused Deputy Attack Detection on AI Accelerators**

SpeedKillsAIA (DeputyHunt) is a framework designed to detect and analyze confused deputy attacks targeting AI accelerator systems.

## Overview

The framework consists of four main components:

- **`src/kernel_instrumenter`** → Instruments kernel driver source code
- **`src/preprocess`** → Takes in log files and extracts relevant information in JSON format  
- **`src/llm_analysis`** → Takes in gathered information (JSON format) and produces CSV, YAML, log files containing analysis
- **`src/structanalyzer`** → Helps LLM do structure analysis, can be used independently as module as well

## Quick Start

### Environment Setup
```bash
source setup.sh
```

### Running Individual Components
```bash
python3 -m src.kernel_instrumenter --help
python3 -m src.preprocess --help
python3 -m src.llm_analysis --help
python3 -m src.structanalyzer --help
```

### Helper Scripts
- **`processjson.sh`** - Helper script to run preprocess component.
- **`llmanalysis.sh`** - Helper script to run llm_analysis component.

### Exploit Scripts
- **`exploits/`** - Contains exploit scripts for each AI Accelerator (AIA) (AWS, NXP, TI, CORAL)