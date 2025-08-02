# SpeedKillsAIA Tools - Module Usage Guide

## Overview
The `src/` directory contains standardized Python modules for AI accelerator security research. Each module can be run independently and follows Python packaging best practices.

## Available Modules

### 1. Kernel Instrumenter (`src/kernel_instrumenter`)
**Purpose**: Instrument kernel modules with logging for DMA operations, user copy functions, and function entries.

**Module Usage**:
```bash
# Run as module (requires setup.sh)
source setup.sh
python -m src.kernel_instrumenter --directory /path/to/kernel/source --dry-run

# Standalone runner (handles setup automatically)
python run_kernel_instrumenter.py --directory /path/to/kernel/source --dry-run
```

**Python API**:
```python
from src.kernel_instrumenter import KernelInstrumenter

instrumenter = KernelInstrumenter(
    enabled_types={'dma', 'user_copy', 'functions'},
    dry_run=False,
    verbose=True
)
instrumenter.instrument_directory('/path/to/kernel/source')
```

### 2. Log Preprocessor (`src/preprocess`)
**Purpose**: Parse and analyze kernel instrumentation logs with stack trace capture.

**Module Usage**:
```bash
# Run as module (requires setup.sh)
source setup.sh
python -m src.preprocess data/logs/nxp/nxp_dmesgtraces_inference_dma_userapi_dmafilefuncs.log --web-ui

# Standalone runner (handles setup automatically)
python run_tool.py data/logs/nxp/nxp_dmesgtraces_inference_dma_userapi_dmafilefuncs.log --web-ui --port 8080
```

**Python API**:
```python
from src.preprocess import KernelLogParserTool, parse_kernel_log

# Simple usage
results = parse_kernel_log("logfile.log")

# Advanced usage
tool = KernelLogParserTool()
results = tool.process_log("logfile.log")
tool.start_web_ui(port=8080, host="0.0.0.0")
```

## Module Structure Standards

Each module follows this structure:
```
src/module_name/
├── __init__.py          # Module exports and metadata
├── __main__.py          # Module entry point (python -m src.module_name)
├── main_file.py         # Primary functionality with main() function
├── config/              # Configuration management
├── core/                # Core functionality
├── cli/                 # Command-line interface
└── submodules/          # Specialized components
```

## Environment Setup

### Method 1: Source setup.sh (Manual)
```bash
source setup.sh
python -m src.kernel_instrumenter [options]
python -m src.preprocess [options]
```

### Method 2: Standalone Runners (Automatic)
```bash
python run_kernel_instrumenter.py [options]
python run_tool.py [options]
```

### Method 3: Main Package Interface
```bash
source setup.sh
python -m src  # Shows tool menu
```

## Common Usage Patterns

### 1. Instrument Kernel Source
```bash
# Dry-run to preview changes
python run_kernel_instrumenter.py --directory data/kernel_sources/nxp/drivers --dry-run --verbose

# Apply DMA and user copy instrumentation
python run_kernel_instrumenter.py --directory data/kernel_sources/nxp/drivers --types dma user_copy
```

### 2. Analyze Kernel Logs
```bash
# Process log and view in web UI
python run_tool.py data/logs/nxp/nxp_dmesgtraces_inference_dma_userapi_dmafilefuncs.log --web-ui --port 8080

# Batch process multiple logs
python run_tool.py data/logs/nxp/*.log --batch --output-dir results/

# Interactive mode
python run_tool.py --interactive
```

### 3. Combined Workflow
```bash
# 1. Instrument kernel source
python run_kernel_instrumenter.py --directory /kernel/source --types all

# 2. Build and run instrumented kernel (external step)

# 3. Analyze resulting logs
python run_tool.py /path/to/kernel.log --web-ui
```

## Module Import Examples

### Import Specific Classes
```python
from src.kernel_instrumenter import KernelInstrumenter, DMAAnalyzer
from src.preprocess import KernelLogParserEngine, parse_kernel_log
```

### Import Full Modules
```python
import src.kernel_instrumenter as ki
import src.preprocess as preprocess

# Use module functionality
instrumenter = ki.KernelInstrumenter()
results = preprocess.parse_kernel_log("log.txt")
```

### Check Module Information
```python
import src.kernel_instrumenter as ki
import src.preprocess as preprocess

print("Kernel Instrumenter:", ki.get_version_info())
print("Preprocess:", preprocess.get_version_info())
```

## Testing Module Functionality

### Test Imports
```bash
source setup.sh
python -c "from src.kernel_instrumenter import *; print('✅ kernel_instrumenter imports work')"
python -c "from src.preprocess import *; print('✅ preprocess imports work')"
```

### Test Command Line
```bash
python -m src.kernel_instrumenter --help
python -m src.preprocess --help
```

### Test Standalone Runners
```bash
python run_kernel_instrumenter.py --help
python run_tool.py --help
```

## Error Troubleshooting

### ImportError: No module named 'src.module_name'
- **Solution**: Run `source setup.sh` first, or use standalone runners

### tree_sitter not found
- **Solution**: Virtual environment not activated, run `source setup.sh`

### Flask not available
- **Solution**: Install dependencies with `pip install flask` or use `source setup.sh`

### Permission denied
- **Solution**: Make runners executable with `chmod +x run_*.py`

## Module Features

### src.kernel_instrumenter
- ✅ Tree-sitter based C parsing
- ✅ Multiple instrumentation types (DMA, user_copy, functions)
- ✅ Dry-run mode for safe preview
- ✅ Comprehensive backup and recovery
- ✅ Production-ready error handling

### src.preprocess  
- ✅ Function entry parsing
- ✅ DMA operation parsing with stack traces
- ✅ User copy operation tracking
- ✅ Web UI for interactive analysis
- ✅ Batch processing capabilities
- ✅ Deduplication and statistics

## Development Notes

- All modules follow Python packaging standards
- Each module has proper `__init__.py` with exports
- `__main__.py` files enable `python -m` execution
- Standalone runners handle environment setup automatically
- All core logic preserved and functional
- Version information and metadata included
- Comprehensive error handling and logging
