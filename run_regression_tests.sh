#!/bin/bash
"""
Regression Test Runner for IOCTL LLM Analysis and Device Access Fixes

This script runs all regression tests to ensure that the fixes for the issues
reported on August 6, 2025 are working correctly:

1. IOCTL analysis button network error (fixed: data structure consistency) 
2. Device access details toggle not working (fixed: JavaScript function logic)

Usage:
    ./run_regression_tests.sh
    or
    bash run_regression_tests.sh
"""

set -e  # Exit on any error

echo "========================================="
echo "Regression Test Runner"
echo "Testing IOCTL LLM Analysis & Device Access Fixes"
echo "========================================="
echo

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Test status tracking
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0

# Function to run a test and track results
run_test() {
    local test_name="$1"
    local test_command="$2"
    
    echo -e "${YELLOW}Running: $test_name${NC}"
    echo "Command: $test_command"
    echo "----------------------------------------"
    
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    
    if eval "$test_command"; then
        echo -e "${GREEN}✓ PASSED: $test_name${NC}"
        PASSED_TESTS=$((PASSED_TESTS + 1))
    else
        echo -e "${RED}✗ FAILED: $test_name${NC}"
        FAILED_TESTS=$((FAILED_TESTS + 1))
    fi
    echo
}

# Check if we're in the right directory
if [ ! -f "setup.sh" ] || [ ! -d "src/webviewer" ]; then
    echo -e "${RED}Error: Please run this script from the SpeedKillsAIA root directory${NC}"
    exit 1
fi

# Activate virtual environment
echo "Activating virtual environment..."
if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
else
    echo -e "${RED}Error: Virtual environment not found. Run setup.sh first.${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Virtual environment activated${NC}"
echo

# Check if webviewer is running (for integration tests)
echo "Checking if webviewer is running..."
if curl -s http://127.0.0.1:5000 > /dev/null 2>&1; then
    echo -e "${GREEN}✓ Webviewer is running${NC}"
    WEBVIEWER_RUNNING=true
else
    echo -e "${YELLOW}! Webviewer not running - some integration tests will be skipped${NC}"
    WEBVIEWER_RUNNING=false
fi
echo

# Run JavaScript regression tests
run_test "JavaScript Regression Tests" "node tests/test_js_regression.js"

# Run Python integration tests (only if webviewer is running)
if [ "$WEBVIEWER_RUNNING" = true ]; then
    run_test "Python Integration Tests" "python -m pytest tests/test_integration_fixes.py -v --tb=short"
else
    echo -e "${YELLOW}Skipping Python integration tests (webviewer not running)${NC}"
    echo
fi

# Run basic JavaScript syntax validation
run_test "JavaScript Syntax Validation" "node -c src/webviewer/static/js/main.js && node -c src/webviewer/static/js/llm.js"

# Check for correct data structure usage in files
run_test "Data Structure Consistency Check" "! grep -r 'ioctl_handlers' src/webviewer/static/js/ && grep -q 'ioctl_operations' src/webviewer/static/js/main.js"

# Verify no duplicate functions
run_test "Duplicate Function Check" "test \$(grep -c 'function toggleDeviceDetails' src/webviewer/static/js/main.js) -eq 1 && test \$(grep -c 'function analyzeIOCTLWithLLM' src/webviewer/static/js/main.js) -eq 1"

# Check that test files exist
run_test "Regression Test Files Exist" "test -f tests/test_js_regression.js && test -f tests/test_integration_fixes.py && test -f tests/test_ioctl_llm_device_access_regression.py"

# Summary
echo "========================================="
echo "REGRESSION TEST SUMMARY"
echo "========================================="
echo "Total Tests: $TOTAL_TESTS"
echo -e "Passed: ${GREEN}$PASSED_TESTS${NC}"
echo -e "Failed: ${RED}$FAILED_TESTS${NC}"
echo

if [ $FAILED_TESTS -eq 0 ]; then
    echo -e "${GREEN}🎉 ALL REGRESSION TESTS PASSED!${NC}"
    echo -e "${GREEN}The fixes for IOCTL LLM analysis and device access are working correctly.${NC}"
    exit 0
else
    echo -e "${RED}❌ SOME TESTS FAILED!${NC}"
    echo -e "${RED}Please review the failed tests and fix any issues.${NC}"
    exit 1
fi
