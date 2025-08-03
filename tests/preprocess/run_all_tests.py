#!/usr/bin/env python3
"""
Comprehensive test runner for all IOCTL functionality and preprocess module tests
"""

import unittest
import sys
import os

# Add the src directory to the Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

def run_all_tests():
    """Run all tests in the preprocess test suite"""
    
    # Discover and run all tests in the tests/preprocess directory
    test_dir = os.path.dirname(__file__)
    loader = unittest.TestLoader()
    
    # Load all test modules
    suite = loader.discover(test_dir, pattern='test_*.py')
    
    # Run the tests
    runner = unittest.TextTestRunner(verbosity=2, stream=sys.stdout)
    result = runner.run(suite)
    
    # Print summary
    print(f"\n{'='*60}")
    print("TEST SUMMARY")
    print(f"{'='*60}")
    print(f"Tests run: {result.testsRun}")
    print(f"Failures: {len(result.failures)}")
    print(f"Errors: {len(result.errors)}")
    print(f"Skipped: {len(result.skipped) if hasattr(result, 'skipped') else 0}")
    
    if result.failures:
        print(f"\nFAILURES ({len(result.failures)}):")
        for test, traceback in result.failures:
            print(f"  - {test}: {traceback.split('AssertionError:')[-1].strip() if 'AssertionError:' in traceback else 'See details above'}")
    
    if result.errors:
        print(f"\nERRORS ({len(result.errors)}):")
        for test, traceback in result.errors:
            print(f"  - {test}: {traceback.split('Error:')[-1].strip() if 'Error:' in traceback else 'See details above'}")
    
    success_rate = ((result.testsRun - len(result.failures) - len(result.errors)) / result.testsRun * 100) if result.testsRun > 0 else 0
    print(f"\nSuccess rate: {success_rate:.1f}%")
    
    return result.wasSuccessful()


def run_specific_test_module(module_name):
    """Run tests from a specific module"""
    
    test_dir = os.path.dirname(__file__)
    loader = unittest.TestLoader()
    
    try:
        # Load specific test module
        suite = loader.loadTestsFromName(module_name)
        
        # Run the tests
        runner = unittest.TextTestRunner(verbosity=2)
        result = runner.run(suite)
        
        return result.wasSuccessful()
        
    except Exception as e:
        print(f"Error loading test module '{module_name}': {e}")
        return False


def run_ioctl_tests_only():
    """Run only IOCTL-related tests"""
    
    print("Running IOCTL-specific tests...")
    print("="*50)
    
    test_dir = os.path.dirname(__file__)
    loader = unittest.TestLoader()
    
    # Load specific IOCTL test files
    ioctl_test_files = [
        'test_ioctl_integration.py',
        'test_cli_ioctl.py'
    ]
    
    suite = unittest.TestSuite()
    
    for test_file in ioctl_test_files:
        try:
            module_tests = loader.loadTestsFromName(test_file[:-3])  # Remove .py extension
            suite.addTests(module_tests)
        except Exception as e:
            print(f"Warning: Could not load {test_file}: {e}")
    
    # Also add IOCTL-related tests from other modules
    try:
        from test_parsers import TestIOCTLParser
        from test_models import TestIOCTLOperation, TestParseResultsWithIOCTL
        from test_utils import TestFunctionCodeExtractor, TestKernelLogDeduplicatorWithIOCTL
        
        # Add specific test classes
        suite.addTests(loader.loadTestsFromTestCase(TestIOCTLParser))
        suite.addTests(loader.loadTestsFromTestCase(TestIOCTLOperation))
        suite.addTests(loader.loadTestsFromTestCase(TestParseResultsWithIOCTL))
        suite.addTests(loader.loadTestsFromTestCase(TestFunctionCodeExtractor))
        suite.addTests(loader.loadTestsFromTestCase(TestKernelLogDeduplicatorWithIOCTL))
        
    except ImportError as e:
        print(f"Warning: Could not import some test classes: {e}")
    
    # Run the tests
    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)
    
    return result.wasSuccessful()


if __name__ == '__main__':
    import argparse
    
    parser = argparse.ArgumentParser(description='Run preprocess module tests')
    parser.add_argument('--module', '-m', help='Run tests from specific module')
    parser.add_argument('--ioctl-only', action='store_true', help='Run only IOCTL-related tests')
    parser.add_argument('--list-modules', action='store_true', help='List available test modules')
    
    args = parser.parse_args()
    
    if args.list_modules:
        print("Available test modules:")
        test_files = [f for f in os.listdir(os.path.dirname(__file__)) if f.startswith('test_') and f.endswith('.py')]
        for test_file in sorted(test_files):
            print(f"  - {test_file[:-3]}")  # Remove .py extension
        sys.exit(0)
    
    if args.ioctl_only:
        success = run_ioctl_tests_only()
    elif args.module:
        success = run_specific_test_module(args.module)
    else:
        success = run_all_tests()
    
    sys.exit(0 if success else 1)
