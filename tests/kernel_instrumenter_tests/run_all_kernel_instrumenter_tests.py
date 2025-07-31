#!/usr/bin/env python3
"""
Master Test Runner for Enhanced Multi-Type Kernel Instrumentation Tool

This script runs all comprehensive test suites for the kernel instrumentation tool:
1. Core functionality tests
2. Edge case and error handling tests  
3. Performance and stress tests
4. Integration tests
"""

import unittest
import sys
import os
import time
from pathlib import Path

# Add the src directory to the path
current_dir = os.path.dirname(os.path.abspath(__file__))
repo_root = os.path.dirname(os.path.dirname(current_dir))
instrumentation_dir = os.path.join(repo_root, 'src', 'kernel_instrumenter')
sys.path.insert(0, instrumentation_dir)

# Import test modules
try:
    from test_kernel_instrument import TestEnhancedInstrumentation, TestEnhancedInstrumentationIntegration
    from test_edge_cases import TestEnhancedInstrumentationEdgeCases, TestEnhancedInstrumentationPerformance
    from test_regression_fixes import TestRegressionFixes
except ImportError as e:
    print(f"Failed to import test modules: {e}")
    sys.exit(1)


def run_test_suite(test_class, suite_name):
    """Run a specific test suite and return results."""
    print(f"\n{'='*60}")
    print(f"RUNNING: {suite_name}")
    print(f"{'='*60}")
    
    loader = unittest.TestLoader()
    suite = loader.loadTestsFromTestCase(test_class)
    runner = unittest.TextTestRunner(verbosity=2, stream=sys.stdout)
    
    start_time = time.time()
    result = runner.run(suite)
    end_time = time.time()
    
    print(f"\n{suite_name} completed in {end_time - start_time:.2f} seconds")
    print(f"Tests: {result.testsRun}, Failures: {len(result.failures)}, Errors: {len(result.errors)}")
    
    return result


def main():
    """Main test runner function."""
    print("="*80)
    print("KERNEL INSTRUMENTATION TOOL - MASTER TEST SUITE")
    print("="*80)
    print(f"Python version: {sys.version}")
    print(f"Working directory: {os.getcwd()}")
    print(f"Test directory: {current_dir}")
    print("="*80)
    
    # Test suites to run
    test_suites = [
        (TestEnhancedInstrumentation, "Core Functionality Tests"),
        (TestEnhancedInstrumentationIntegration, "Integration Tests"),
        (TestEnhancedInstrumentationEdgeCases, "Edge Case Tests"),
        (TestEnhancedInstrumentationPerformance, "Performance Tests"),
        (TestRegressionFixes, "Regression Fix Tests")
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
        print("✅ DMA API instrumentation")
        print("✅ User copy operation instrumentation") 
        print("✅ Function entry instrumentation")
        print("✅ CLI flag combinations and validation")
        print("✅ Backup file creation")
        print("✅ Error handling and edge cases")
        print("✅ Performance with large codebases")
        print("✅ Integration testing")
        print("✅ Regression fixes (circular imports, function context, assignment spanning)")
        
        return 0
    else:
        print("❌ SOME TESTS FAILED!")
        print(f"Total issues: {total_failures + total_errors}")
        print("Please review the test output above for details.")
        
        return 1


if __name__ == '__main__':
    exit_code = main()
    sys.exit(exit_code)
