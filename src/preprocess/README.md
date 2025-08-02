# Kernel Log Parser - Modular Implementation

## Overview

This is a production-ready, modular kernel log parser designed for AI accelerator instrumentation logs. It extracts function entries, DMA operations, and user copy operations with proper deduplication and statistics tracking.

## Architecture

The parser follows a modular architecture with clear separation of concerns:

```
src/preprocess/
├── core/                    # Core data models and parsing engine
│   ├── models.py           # Data structures for parsing results
│   ├── patterns.py         # Regex patterns for log parsing
│   └── engine.py           # Main parsing engine coordinator
├── parsers/                # Specialized parsers for different log types
│   ├── base.py             # Abstract base parser
│   ├── function_parser.py  # FUNC_ENTRY parser
│   ├── dma_parser.py       # DMA_INSTRUMENT and stack trace parser
│   └── user_copy_parser.py # USER_COPY parser
├── utils/                  # Utility modules
│   ├── progress.py         # Progress UI utilities
│   ├── deduplication.py    # Deduplication logic
│   └── file_tracker.py     # File tracking utilities
├── web/                    # Web interface components
│   └── ui.py               # Flask web UI for viewing results
└── cli.py                  # Command-line interface
```

## Usage

### Command Line Interface

```bash
# Parse a kernel log file
python -m src.preprocess.cli kernel.log

# Parse and save to JSON
python -m src.preprocess.cli kernel.log -o results.json

# Disable progress UI
python -m src.preprocess.cli kernel.log --no-ui
```

### Python API

```python
# Simple usage
from src.preprocess import parse_kernel_log
results = parse_kernel_log("kernel.log")

# Advanced usage
from src.preprocess.core import KernelLogParserEngine
parser = KernelLogParserEngine(show_ui=True)
results = parser.parse_log_file("kernel.log", "output.json")
```

### Web Interface

```python
from src.preprocess.web import create_app, main

# Start web server for viewing results
main("results.json")
```

## Features

- **Modular Design**: Each component has a single responsibility
- **Comprehensive Testing**: Full test suite with 40+ test cases
- **Deduplication**: Smart deduplication of similar entries
- **Progress Tracking**: Real-time progress indicators
- **File Statistics**: Track which files contain instrumentation
- **Stack Trace Capture**: Complete DMA stack trace collection
- **Multiple Output Formats**: JSON output and web visualization
- **Error Handling**: Robust error handling for malformed logs

## Data Models

### Function Entry
- Function name and location
- File path and line number
- First seen timestamp

### DMA Operation
- DMA function and caller information
- Complete stack trace capture
- File location details

### User Copy Operation
- Copy function details
- Process information (PID, command)
- Location and timing data

## Statistics Tracked

- Total lines processed
- Unique entries found by type
- Files analyzed
- Files with function entries
- Duplicate entries skipped

## Testing

Run the comprehensive test suite:

```bash
cd tests/preprocess
python -m pytest -v
```

Test categories:
- **Core Models**: Data structure validation
- **Pattern Matching**: Regex pattern testing
- **Individual Parsers**: Parser-specific functionality
- **Utilities**: Progress, deduplication, file tracking
- **Integration**: End-to-end parsing workflows

## Configuration

The parser automatically detects and handles:
- Different log formats
- Malformed log entries
- Missing timestamps
- Incomplete stack traces

## Performance

- Memory-efficient streaming parser
- Progress tracking for large files
- Optimized regex patterns
- Smart deduplication to reduce memory usage

## Legacy Migration

This modular implementation replaces the previous monolithic parser with:
- Better maintainability
- Improved testability
- Cleaner separation of concerns
- Enhanced error handling
- Comprehensive documentation
