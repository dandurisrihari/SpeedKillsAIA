# DMA Instrumentation Tool - Modular Architecture

## Overview

The DMA Instrumentation Tool has been refactored into a modular architecture for better maintainability, testability, and extensibility. The tool instruments Linux kernel module C files by adding print statements before DMA API calls to track memory allocations.

## Architecture

### Module Structure

```
src/instrumentation/
├── __init__.py          # Package initialization and exports
├── config.py            # Configuration and DMA API definitions
├── parser.py            # Tree-sitter C code parsing
├── analyzer.py          # DMA call analysis and detection
├── instrumenter.py      # File instrumentation logic
├── processor.py         # Directory processing and batch operations
├── core.py              # Main coordinator facade class
├── cli.py               # Command-line interface
├── dma_instrument.py    # New main entry point
└── dma_api_Instrument.py # Legacy entry point (redirects to new code)
```

### Class Hierarchy

```
DMAInstrumenter (facade)
├── TreeSitterParser (C code parsing)
├── DMACallAnalyzer (AST analysis and call detection)
├── FileInstrumenter (source code modification)
└── DirectoryProcessor (batch file processing)
```

## Usage

### Command Line Interface

```bash
# New recommended entry point
python dma_instrument.py /path/to/kernel/source

# With options
python dma_instrument.py --dry-run /path/to/kernel/source
python dma_instrument.py --test-limit 5 /path/to/kernel/source

# Legacy entry point (still works)
python dma_api_Instrument.py /path/to/kernel/source
```

### Programmatic Usage

```python
from src.instrumentation import DMAInstrumenter

# Initialize the instrumenter
instrumenter = DMAInstrumenter()

# Process a directory
instrumenter.process_directory("/path/to/kernel/source")

# Process with options
instrumenter.process_directory(
    "/path/to/kernel/source", 
    dry_run=True, 
    max_files=10
)
```

### Individual Components

```python
from src.instrumentation import (
    DMAAPIConfig,
    TreeSitterParser,
    DMACallAnalyzer,
    FileInstrumenter,
    DirectoryProcessor
)

# Use individual components
parser = TreeSitterParser()
analyzer = DMACallAnalyzer(parser)
instrumenter = FileInstrumenter(analyzer)

# Instrument a single file
instrumenter.instrument_file(Path("example.c"), dry_run=True)
```

## Module Documentation

### config.py
- **DMAAPIConfig**: Centralized configuration class containing:
  - DMA API function names to instrument
  - File patterns to skip during processing
  - Instrumentation code templates

### parser.py
- **TreeSitterParser**: Handles tree-sitter initialization and C code parsing
  - Supports both modern and legacy tree-sitter APIs
  - Provides AST parsing and node text extraction

### analyzer.py
- **DMACallAnalyzer**: Analyzes C code AST to find DMA calls
  - Identifies DMA function calls
  - Analyzes call context (preprocessor, assignments, etc.)
  - Determines optimal instrumentation strategies

### instrumenter.py
- **FileInstrumenter**: Applies instrumentation to individual files
  - Handles various code contexts and edge cases
  - Creates backups before modification
  - Supports multiple instrumentation strategies

### processor.py
- **DirectoryProcessor**: Manages batch processing of directories
  - Recursive directory traversal
  - File filtering and progress tracking
  - Batch processing coordination

### core.py
- **DMAInstrumenter**: Main facade class coordinating all components
  - Simplified interface for common operations
  - Component initialization and error handling
  - Delegation to appropriate subcomponents

### cli.py
- **main()**: Command-line interface with argument parsing
  - Comprehensive help and error handling
  - Support for dry-run and testing modes

## Features

### DMA API Coverage
- 70+ DMA-related function APIs supported
- Comprehensive coverage of allocation, mapping, pool, and engine APIs
- Smart filtering to avoid false positives

### Context-Aware Instrumentation
- Handles preprocessor conditionals
- Manages assignment expressions
- Supports multi-line function calls
- Wraps single statements with braces when needed

### Robust Processing
- Creates backup files before modification
- Comprehensive error handling and reporting
- Progress tracking for batch operations
- Dry-run mode for safe previewing

### Extensibility
- Modular architecture allows easy extension
- Clear separation of concerns
- Well-documented interfaces
- Comprehensive type hints

## Benefits of Modular Architecture

1. **Maintainability**: Each module has a single responsibility
2. **Testability**: Individual components can be tested in isolation
3. **Reusability**: Components can be used independently
4. **Extensibility**: Easy to add new features or modify existing ones
5. **Documentation**: Clear module boundaries and responsibilities
6. **Debugging**: Easier to isolate and fix issues


## Dependencies

- Python 3.6+
- tree-sitter
- tree-sitter-c

Install with:
```bash
pip install tree_sitter tree_sitter-c
```
