# Kernel Instrumenter Test Suite

This directory contains comprehensive tests for the kernel instrumentation tool.

## Test Structure

### Core Test Files

- **`run_comprehensive_tests.py`** - Main test runner that executes all test suites
- **`test_regression_fixes.py`** - Critical regression tests for known issues
- **`test_modern_comprehensive.py`** - Core functionality tests for all instrumentation types
- **`test_assignment_spanning_integration.py`** - Integration tests for assignment spanning fixes

### Test Suites

#### 1. Regression Tests - Critical Fixes (test_regression_fixes.py)
Tests for critical issues that were discovered and fixed:
- **Circular Import Resolution**: Ensures no conflicts with Python's built-in 'types' module
- **Function Context Detection**: Validates instrumentation only occurs within function scope
- **Assignment Spanning Preprocessor**: Handles assignments that span preprocessor blocks
- **Error Node Detection**: Proper handling of incomplete/malformed assignments
- **Comment Filtering**: Ensures calls in comments are not instrumented

#### 2. Core Functionality Tests (test_modern_comprehensive.py)
Comprehensive testing of all instrumentation features:
- **DMA Instrumentation**: Tests `dma_alloc_coherent`, `dma_free_coherent`, etc.
- **User Copy Instrumentation**: Tests `copy_to_user`, `copy_from_user`, etc.
- **Function Instrumentation**: Tests function entry point logging
- **Complex Code Structures**: Real-world code patterns and edge cases
- **File Instrumentation**: End-to-end file processing workflow
- **Error Handling**: Graceful handling of malformed C code

#### 3. Integration Tests - Assignment Spanning (test_assignment_spanning_integration.py)
Full pipeline tests for the assignment spanning preprocessor fix:
- **Complete Pipeline**: Tests the full instrumentation workflow
- **Mixed Instrumentation**: Tests multiple instrumentation types together
- **Real File Modification**: Tests actual file write/read operations

## Running Tests

### Run All Tests
```bash
python tests/kernel_instrumenter_tests/run_comprehensive_tests.py
```

### Run Individual Test Suites
```bash
# Regression tests only
python -m unittest tests.kernel_instrumenter_tests.test_regression_fixes

# Core functionality tests only
python -m unittest tests.kernel_instrumenter_tests.test_modern_comprehensive

# Integration tests only
python -m unittest tests.kernel_instrumenter_tests.test_assignment_spanning_integration
```

## Test Data

The `test_data/` directory contains:
- Sample C source files for testing
- Expected output files for validation
- Complex real-world code examples

## What the Tests Verify

### ✅ Critical Fixes Validated
1. **Assignment Spanning Preprocessor**: Prevents compilation errors when assignments span `#ifdef` blocks
2. **Function Context Validation**: Ensures traces are only placed within function scope
3. **Circular Import Resolution**: Avoids conflicts with Python's standard library
4. **Error Node Handling**: Gracefully handles malformed C code without crashing

### ✅ Core Features Validated
1. **Trace Placement**: Verifies traces are placed before target function calls
2. **Multiple Instrumentation Types**: Tests DMA, user copy, and function instrumentation
3. **Complex Code Handling**: Validates instrumentation in nested structures, preprocessor blocks
4. **File I/O Operations**: Tests actual file modification and backup creation

### ✅ Integration Scenarios Validated
1. **Real Workflow**: Tests the complete instrumentation pipeline
2. **Mixed Operations**: Validates multiple instrumentation types in the same code
3. **Error Recovery**: Ensures robust error handling and rollback capabilities

## Expected Output Formats

The tests validate that instrumentation produces the correct trace formats:

- **DMA traces**: `printk(KERN_INFO "DMA_INSTRUMENT: About to call...`
- **User copy traces**: `printk(KERN_INFO "USER_COPY: About to call...`
- **Function traces**: `printk(KERN_INFO "FUNC_ENTRY: Entering function...`

## Test Results Summary

When all tests pass, you should see:
```
🎉 ALL TEST SUITES PASSED! 🎉
Total tests run: 24
Total failures: 0
Total errors: 0
```

This indicates the kernel instrumentation tool is working correctly and all critical fixes are validated.
