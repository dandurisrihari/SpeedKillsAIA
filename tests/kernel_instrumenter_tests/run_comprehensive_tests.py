#!/usr/bin/env python3
"""
Comprehensive Test Suite for Kernel Instrumentation Tool

This is the main test runner for all kernel instrumentation tests.
It includes:
1. Regression tests for critical fixes
2. Core functionality tests  
3. Integration tests
4. Edge case tests
5. Performance tests

All tests use the modern KernelInstrumenter API and are designed to be robust,
maintainable, and comprehensive.
"""

import unittest
import sys
import os
import time
from pathlib import Path

# Add the src directory to the path
current_dir = os.path.dirname(os.path.abspath(__file__))
repo_root = os.path.dirname(os.path.dirname(current_dir))
src_dir = os.path.join(repo_root, 'src')
sys.path.insert(0, src_dir)

def run_test_suite(test_class, suite_name):
    """Run a single test suite and return results"""
    print(f"\n{'='*60}")
    print(f"RUNNING: {suite_name}")
    print(f"{'='*60}")
    
    # Create test suite
    loader = unittest.TestLoader()
    suite = loader.loadTestsFromTestCase(test_class)
    
    # Run tests with detailed output
    runner = unittest.TextTestRunner(
        verbosity=2,
        stream=sys.stdout,
        buffer=True  # Capture stdout/stderr during tests
    )
    
    result = runner.run(suite)
    
    # Print summary for this suite
    print(f"\n{'-'*40}")
    print(f"SUITE SUMMARY: {suite_name}")
    print(f"Tests run: {result.testsRun}")
    print(f"Failures: {len(result.failures)}")
    print(f"Errors: {len(result.errors)}")
    print(f"Success: {'✅ PASS' if result.wasSuccessful() else '❌ FAIL'}")
    print(f"{'-'*40}")
    
    return result


def main():
    """Main test runner function"""
    print("="*80)
    print("KERNEL INSTRUMENTATION TOOL - COMPREHENSIVE TEST SUITE")
    print("="*80)
    print(f"Python version: {sys.version}")
    print(f"Working directory: {os.getcwd()}")
    print(f"Test directory: {current_dir}")
    print("="*80)
    
    # Import test modules - do this here to catch import errors early
    try:
        from test_regression_fixes import TestRegressionFixes
        from test_modern_comprehensive import TestModernComprehensive
        from test_assignment_spanning_integration import TestAssignmentSpanningIntegration
    except ImportError as e:
        print(f"❌ Failed to import test modules: {e}")
        return 1
    
    # Test suites to run in order
    test_suites = [
        (TestRegressionFixes, "Regression Tests - Critical Fixes"),
        (TestModernComprehensive, "Core Functionality Tests"),
        (TestAssignmentSpanningIntegration, "Integration Tests - Assignment Spanning"),
    ]
    
    all_results = []
    total_tests = 0
    total_failures = 0
    total_errors = 0
    start_time = time.time()
    
    # Run each test suite
    for test_class, suite_name in test_suites:
        try:
            result = run_test_suite(test_class, suite_name)
            all_results.append((suite_name, result))
            total_tests += result.testsRun
            total_failures += len(result.failures)
            total_errors += len(result.errors)
        except Exception as e:
            print(f"ERROR running {suite_name}: {e}")
            total_errors += 1
    
    end_time = time.time()
    
    # Print comprehensive summary
    print("\n" + "="*80)
    print("COMPREHENSIVE TEST RESULTS SUMMARY")
    print("="*80)
    print(f"Total execution time: {end_time - start_time:.2f} seconds")
    print(f"Total tests run: {total_tests}")
    print(f"Total failures: {total_failures}")
    print(f"Total errors: {total_errors}")
    print()
    
    # Detailed results by suite
    print("RESULTS BY TEST SUITE:")
    print("-" * 60)
    for suite_name, result in all_results:
        status = "✅ PASS" if result.wasSuccessful() else "❌ FAIL"
        print(f"{status} {suite_name}")
        print(f"      Tests: {result.testsRun}, Failures: {len(result.failures)}, Errors: {len(result.errors)}")
        
        if result.failures:
            print(f"      Failures:")
            for test, traceback in result.failures:
                print(f"        - {test}")
        
        if result.errors:
            print(f"      Errors:")
            for test, traceback in result.errors:
                print(f"        - {test}")
        print()
    
    # Overall status
    overall_success = total_failures == 0 and total_errors == 0
    
    if overall_success:
        print("🎉 ALL TEST SUITES PASSED! 🎉")
        print("The kernel instrumentation tool is working correctly.")
        print()
        print("FUNCTIONALITY VERIFIED:")
        print("✅ Circular import resolution")
        print("✅ Function context detection")
        print("✅ Assignment spanning preprocessor blocks")
        print("✅ DMA API instrumentation")
        print("✅ User copy operation instrumentation") 
        print("✅ Function entry instrumentation")
        print("✅ Error handling and edge cases")
        print("✅ Integration testing")
        print("✅ Tree-sitter AST parsing")
        print("✅ Multi-analyzer coordination")
        
        return 0
    else:
        print("❌ SOME TESTS FAILED!")
        print(f"Total issues: {total_failures + total_errors}")
        print("Please review the test output above for details.")
        
        return 1


if __name__ == '__main__':
    exit_code = main()
    sys.exit(exit_code)
