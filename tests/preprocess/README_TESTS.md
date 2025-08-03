# Preprocess Module Test Suite

This directory contains comprehensive tests for the preprocess module, including the new IOCTL functionality.

## Test Structure

### Core Test Files

- **`test_models.py`** - Tests for data models (`FunctionEntry`, `DMAOperation`, `UserCopyOperation`, `IOCTLOperation`, `ParseResults`, etc.)
- **`test_patterns.py`** - Tests for log pattern matching, including the new IOCTL pattern
- **`test_parsers.py`** - Tests for individual parsers (`FunctionEntryParser`, `DMAParser`, `UserCopyParser`, `IOCTLParser`)
- **`test_utils.py`** - Tests for utility modules (`ProgressUI`, `KernelLogDeduplicator`, `FileTracker`, `FunctionCodeExtractor`)
- **`test_web.py`** - Tests for web UI functionality, including IOCTL display and function code viewing
- **`test_integration.py`** - Integration tests for the complete parsing workflow

### IOCTL-Specific Test Files

- **`test_ioctl_integration.py`** - Comprehensive integration tests for IOCTL functionality
- **`test_cli_ioctl.py`** - Tests for CLI functionality with `--source-root` parameter and IOCTL support

## New IOCTL Functionality Tests

The following new functionality is covered by the test suite:

### 1. IOCTL Log Parsing
- Pattern matching for `IOCTL_HANDLER: Function {name} called at {file}:{line}` format
- Parsing function name, file path, and line number from IOCTL logs
- Error handling for malformed IOCTL log entries

### 2. Function Code Extraction
- Tree-sitter C parser integration for extracting complete function source code
- Path resolution with `--source-root` parameter for relative paths
- Handling of missing source files and parsing errors
- Support for various C function formats and edge cases

### 3. Web UI Enhancements
- IOCTL operations tab in the web interface
- Expandable function code display using `<details>` elements
- JavaScript filtering functionality for IOCTL operations
- CSS styling for IOCTL-specific UI elements

### 4. CLI Integration
- `--source-root` parameter for resolving relative file paths
- Integration with existing parsing workflow
- Error handling for invalid source root paths

### 5. Data Model Updates
- `IOCTLOperation` model with `function_code` field
- Updated `ParseResults` to include IOCTL operations
- Updated statistics calculation to include IOCTL metrics
- JSON serialization support for IOCTL data

### 6. Deduplication
- IOCTL operation deduplication based on function name, file path, and line number
- Preservation of earliest timestamp for deduplicated operations
- Integration with existing deduplication utilities

## Running Tests

### Run All Tests
```bash
cd tests/preprocess
python run_all_tests.py
```

### Run IOCTL-Specific Tests Only
```bash
python run_all_tests.py --ioctl-only
```

### Run Specific Test Module
```bash
python run_all_tests.py --module test_ioctl_integration
```

### List Available Test Modules
```bash
python run_all_tests.py --list-modules
```

### Run Individual Test Files
```bash
python -m unittest test_parsers.TestIOCTLParser
python -m unittest test_models.TestIOCTLOperation
python -m unittest test_utils.TestFunctionCodeExtractor
```

## Test Coverage

The test suite covers:

### Parsing Tests
- ✅ IOCTL log pattern recognition
- ✅ Function name extraction
- ✅ File path and line number parsing
- ✅ Error handling for malformed logs

### Function Extraction Tests
- ✅ Tree-sitter C parser integration
- ✅ Function boundary detection
- ✅ Source code extraction
- ✅ Path resolution with source root
- ✅ Error handling for missing files

### Integration Tests
- ✅ End-to-end IOCTL parsing workflow
- ✅ Mixed operation type parsing
- ✅ Statistics calculation
- ✅ JSON export functionality
- ✅ Deduplication logic

### Web UI Tests
- ✅ IOCTL tab rendering
- ✅ Function code display
- ✅ JavaScript filtering
- ✅ API endpoint integration

### CLI Tests
- ✅ `--source-root` parameter handling
- ✅ Argument parsing
- ✅ Error handling
- ✅ Integration with parsing engine

## Mock and Test Data

Tests use:
- Temporary files for log and source code testing
- Mock objects for external dependencies (tree-sitter, file system)
- Sample log data representing real IOCTL scenarios
- Comprehensive edge case coverage

## Dependencies

Test requirements:
- `unittest` (standard library)
- `tempfile` (standard library)
- `unittest.mock` (standard library)
- Tree-sitter libraries (for function extraction tests)

## Notes

- Tests are designed to be independent and can run in any order
- Temporary files are automatically cleaned up after tests
- Mock objects are used to isolate functionality being tested
- All IOCTL functionality is backward compatible with existing features
- Tests validate both success and error scenarios

## Example Test Data

### Sample IOCTL Log Entry
```
[47.468247] IOCTL_HANDLER: Function drv_ioctl called at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:673
```

### Sample Function Code
```c
static long drv_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    switch (cmd) {
        case IOCTL_GCHAL_INTERFACE:
            return gckDEVICE_Dispatch(device, &iface);
        default:
            return -ENOTTY;
    }
}
```

### Expected Test Results
- IOCTL operation parsed correctly
- Function code extracted using tree-sitter
- Data serialized to JSON format
- Web UI displays function code in expandable section
- CLI accepts source root parameter for path resolution
