# SpeedKillsAIA Test Suite

This directory contains comprehensive tests for the SpeedKillsAIA modular system, specifically focusing on `src.kernel_instrumenter` and `src.preprocess` modules.

## Test Structure

### Module Tests
- **`test_module_structure.py`** - Tests module imports, version info, API availability, and command-line interfaces
- **`test_kernel_instrumenter_module.py`** - Comprehensive tests for kernel_instrumenter module functionality  
- **`test_preprocess_module.py`** - Comprehensive tests for preprocess module functionality
- **`test_integration.py`** - Integration tests across the complete module system

### Test Categories

#### 1. Import and Structure Tests
- Module import validation
- Version consistency checking
- API availability verification
- Module metadata validation

#### 2. Functionality Tests
- Core class instantiation
- Method availability and signatures
- Error handling and edge cases
- Configuration management

#### 3. Command Line Interface Tests
- `python -m src.module_name` execution
- Help command functionality
- Standalone runner scripts
- Parameter validation

#### 4. Integration Tests
- Cross-module functionality
- Complete workflow simulation
- Performance baseline tests
- Error propagation testing

## Running Tests

### Quick Module Structure Test
```bash
source setup.sh
python tests/test_module_structure.py -v
```

### Run All Module Tests
```bash
source setup.sh
python tests/run_all_module_tests.py
```

### Run Specific Test Categories
```bash
source setup.sh

# Module structure only
pytest tests/test_module_structure.py -v

# Kernel instrumenter module
pytest tests/test_kernel_instrumenter_module.py -v

# Preprocess module  
pytest tests/test_preprocess_module.py -v

# Integration tests
pytest tests/test_integration.py -v

# All new module tests
pytest tests/test_*.py -v
```

### Run with Pytest Configuration
```bash
source setup.sh
cd tests
pytest -c pytest.ini
```

## Test Requirements

### Environment Setup
- Run `source setup.sh` before testing
- Python 3.8+ required
- All dependencies from `requirements.txt`

### Dependencies
- `pytest` - Test framework
- `tree_sitter` - For kernel instrumenter tests
- `flask` - For web UI testing (optional)

## Test Configuration

### Pytest Settings (`pytest.ini`)
- Verbose output by default
- Short traceback format  
- Colored output
- Timeout configuration
- Warning filters

### Test Markers
- `unit` - Unit tests for individual components
- `integration` - Integration tests across modules
- `cli` - Command-line interface tests
- `slow` - Tests that take longer to run
- `module` - Tests for module structure
- `kernel_instrumenter` - Kernel instrumenter specific
- `preprocess` - Preprocess module specific

## Expected Test Results

### Successful Run
- All import tests should pass
- Module structure tests should pass
- Command-line interface tests should pass
- Basic functionality tests should pass
- Some integration tests may skip if optional dependencies missing

### Common Issues
- **Import errors**: Ensure `source setup.sh` was run
- **Tree-sitter errors**: Expected in test environment, tests handle gracefully
- **Flask not available**: Web UI tests will skip gracefully
- **File not found**: Some tests create temporary files and clean up

## Test Coverage

### What's Tested
- ✅ Module imports and structure
- ✅ Version consistency
- ✅ API availability
- ✅ Command-line interfaces
- ✅ Basic class instantiation
- ✅ Error handling
- ✅ Configuration management
- ✅ Standalone runners

### What's Not Tested (Existing Test Suites)
- Detailed kernel instrumentation logic (see `kernel_instrumenter_tests/`)
- Complete log parsing scenarios (see `preprocess/`)
- Tree-sitter parsing details
- Web UI functionality
- File I/O operations

## Existing Test Integration

The new module tests complement existing test suites:

### Kernel Instrumenter Tests
- Located in `kernel_instrumenter_tests/`
- Comprehensive instrumentation testing
- Integration with existing test data
- Run via `run_all_module_tests.py`

### Preprocess Tests
- Located in `preprocess/`
- Parser functionality testing
- Web UI component testing
- Run via `run_all_module_tests.py`

## Continuous Integration

### Test Commands for CI
```bash
# Setup
source setup.sh

# Run all tests
python tests/run_all_module_tests.py

# Run with coverage (if available)
pytest tests/ --cov=src --cov-report=html

# Run fast tests only
pytest tests/ -m "not slow"
```

### Exit Codes
- `0` - All tests passed
- `1` - Some tests failed
- `2` - Test execution error

## Development Guidelines

### Adding New Tests
1. Create test files following `test_*.py` naming
2. Use appropriate test markers
3. Include setup/teardown for temporary files
4. Handle expected exceptions gracefully
5. Update this README with new test categories

### Test Best Practices
- Use descriptive test names
- Include docstrings for test classes/methods
- Use `pytest.skip()` for environment-dependent tests
- Clean up temporary files in `finally` blocks
- Mock external dependencies when appropriate

## Troubleshooting

### Common Test Failures

**ImportError: No module named 'src.module_name'**
- Solution: Run `source setup.sh` first

**TreeSitter not found**
- Expected in test environment
- Tests should skip gracefully

**Command line tests timeout**
- May indicate environment issues
- Check that `python -m src.module_name --help` works manually

**File permission errors**
- Ensure test runner is executable: `chmod +x tests/run_all_module_tests.py`

### Debug Mode
```bash
# Run with maximum verbosity
pytest tests/ -vvv --tb=long

# Run single test for debugging
pytest tests/test_module_structure.py::TestModuleImports::test_kernel_instrumenter_import -v
```
