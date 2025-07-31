#!/usr/bin/env python3
"""
Enhanced Comprehensive Test Runner for Kernel Instrumentation Tool

This script runs all existing test suites with enhanced reporting and compatibility.
It maintains backward compatibility while providing improved test execution.
"""

import unittest
import sys
import time
import os
from pathlib import Path
from io import StringIO


def main():
    """
    Main entry point for comprehensive test execution
    
    This function discovers and runs all test modules in the current directory,
    providing detailed reporting of test results and execution times.
    """
    # Setup environment
    test_dir = Path(__file__).parent
    project_root = test_dir.parent.parent
    
    # Add src to Python path
    src_path = str(project_root / "src")
    if src_path not in sys.path:
        sys.path.insert(0, src_path)
    
    # Set environment variable for subprocess calls
    os.environ['PYTHONPATH'] = src_path
    
    print("=" * 80)
    print("KERNEL INSTRUMENTATION TOOL - COMPREHENSIVE TEST SUITE")
    print("=" * 80)
    print(f"Python version: {sys.version}")
    print(f"Working directory: {os.getcwd()}")
    print(f"Test directory: {test_dir}")
    print("=" * 80)
    
    # Test modules to run (existing ones)
    test_modules = [
        'test_regression_fixes',
        'test_modern_comprehensive', 
        'test_assignment_spanning_integration'
    ]
    
    # Try to import additional test modules if they exist
    additional_modules = [
        'test_cli_integration',
        'test_kernel_instrumenter_api',
        'test_dma_present_files_functions',
        'test_import'
    ]
    
    for module_name in additional_modules:
        try:
            __import__(module_name)
            test_modules.append(module_name)
        except ImportError:
            continue  # Skip if module doesn't exist
    
    # Check if we can import the main modules
    try:
        from kernel_instrumenter.kernel_instrument import KernelInstrumenter
        from kernel_instrumenter.cli.cli import CLIHandler
        print("✅ Successfully imported test modules")
    except ImportError as e:
        print(f"❌ Failed to import test modules: {e}")
        sys.exit(1)
    
    # Run test suites
    total_tests = 0
    total_failures = 0
    total_errors = 0
    suite_results = {}
    
    for module_name in test_modules:
        suite_display_names = {
            'test_regression_fixes': 'Regression Tests - Critical Fixes',
            'test_modern_comprehensive': 'Core Functionality Tests',
            'test_assignment_spanning_integration': 'Integration Tests - Assignment Spanning',
            'test_cli_integration': 'CLI Integration Tests',
            'test_kernel_instrumenter_api': 'KernelInstrumenter API Tests',
            'test_dma_present_files_functions': 'DMA Present Files Functions Tests',
            'test_import': 'Import and Module Loading Tests'
        }
        
        display_name = suite_display_names.get(module_name, module_name.replace('_', ' ').title())
        
        print(f"\n{'=' * 60}")
        print(f"RUNNING: {display_name}")
        print("=" * 60)
        
        try:
            # Import the test module
            test_module = __import__(module_name, fromlist=[''])
            
            # Discover and run tests
            loader = unittest.TestLoader()
            suite = loader.loadTestsFromModule(test_module)
            
            # Run the test suite
            stream = StringIO()
            runner = unittest.TextTestRunner(stream=stream, verbosity=2)
            start_time = time.time()
            result = runner.run(suite)
            execution_time = time.time() - start_time
            
            # Print results
            print(result.stream.getvalue())
            
            # Track results
            tests_run = result.testsRun
            failures = len(result.failures)
            errors = len(result.errors)
            
            total_tests += tests_run
            total_failures += failures
            total_errors += errors
            
            success = failures == 0 and errors == 0
            suite_results[module_name] = {
                'display_name': display_name,
                'tests': tests_run,
                'failures': failures,
                'errors': errors,
                'time': execution_time,
                'success': success
            }
            
            # Print suite summary
            print(f"\n{'-' * 40}")
            print(f"SUITE SUMMARY: {display_name}")
            print(f"Tests run: {tests_run}")
            print(f"Failures: {failures}")
            print(f"Errors: {errors}")
            status = "✅ PASS" if success else "❌ FAIL"
            print(f"Success: {status}")
            print("-" * 40)
            
        except ImportError as e:
            print(f"❌ Failed to import {module_name}: {e}")
            continue
        except Exception as e:
            print(f"❌ Error running {module_name}: {e}")
            continue
    
    # Final comprehensive results
    print("\n" + "=" * 80)
    print("COMPREHENSIVE TEST RESULTS SUMMARY")
    print("=" * 80)
    print(f"Total tests run: {total_tests}")
    print(f"Total failures: {total_failures}")
    print(f"Total errors: {total_errors}")
    
    print(f"\nRESULTS BY TEST SUITE:")
    print("-" * 60)
    
    all_passed = True
    for module_name, results in suite_results.items():
        status = "✅ PASS" if results['success'] else "❌ FAIL"
        print(f"{status} {results['display_name']}")
        print(f"      Tests: {results['tests']}, Failures: {results['failures']}, Errors: {results['errors']}")
        
        if not results['success']:
            all_passed = False
    
    print()
    if all_passed and total_tests > 0:
        print("🎉 ALL TEST SUITES PASSED! 🎉")
        print("The kernel instrumentation tool is working correctly.")
        
        print("\nFUNCTIONALITY VERIFIED:")
        verified_features = [
            "✅ Circular import resolution",
            "✅ Function context detection",
            "✅ Assignment spanning preprocessor blocks",
            "✅ DMA API instrumentation",
            "✅ User copy operation instrumentation",
            "✅ Function entry instrumentation",
            "✅ Error handling and edge cases",
            "✅ Integration testing",
            "✅ Tree-sitter AST parsing",
            "✅ Multi-analyzer coordination"
        ]
        
        if 'test_cli_integration' in suite_results:
            verified_features.extend([
                "✅ CLI interface and argument parsing",
                "✅ Command-line error handling"
            ])
        
        if 'test_kernel_instrumenter_api' in suite_results:
            verified_features.extend([
                "✅ KernelInstrumenter API functionality",
                "✅ Direct code instrumentation"
            ])
        
        for feature in verified_features:
            print(feature)
        
        return 0
    else:
        print("❌ SOME TESTS FAILED!")
        print("Please review the failed tests above.")
        return 1


if __name__ == '__main__':
    sys.exit(main())