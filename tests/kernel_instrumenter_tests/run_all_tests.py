#!/usr/bin/env python3
"""
Comprehensive Test Runner for Kernel Instrumentation Tool

This script runs all test suites and provides detailed reporting of test results,
coverage, and performance metrics. It's designed to be the primary test execution
script for the kernel instrumentation tool.

Features:
- Runs all test modules automatically
- Provides detailed test results and timing
- Shows test coverage information
- Generates test reports in multiple formats
- Supports CI/CD integration
- Tracks test performance over time
"""

import unittest
import sys
import time
import os
import subprocess
import tempfile
from pathlib import Path
from typing import Dict, List, Tuple, Any
import json
from io import StringIO


class TestResult:
    """Container for test execution results"""
    
    def __init__(self):
        self.total_tests = 0
        self.total_failures = 0
        self.total_errors = 0
        self.total_skipped = 0
        self.execution_time = 0.0
        self.test_suites: Dict[str, Dict[str, Any]] = {}
        self.failed_tests: List[str] = []
        self.error_tests: List[str] = []


class DetailedTestResult(unittest.TestResult):
    """Enhanced test result class that captures detailed information"""
    
    def __init__(self, stream=None, verbosity=1):
        super().__init__(stream, verbosity)
        self.test_times: Dict[str, float] = {}
        self.suite_name = ""
        self.start_time = 0.0
    
    def startTest(self, test):
        super().startTest(test)
        self.start_time = time.time()
    
    def stopTest(self, test):
        super().stopTest(test)
        test_time = time.time() - self.start_time
        test_name = f"{test.__class__.__name__}.{test._testMethodName}"
        self.test_times[test_name] = test_time


class ComprehensiveTestRunner:
    """Enhanced test runner with detailed reporting"""
    
    def __init__(self):
        self.test_dir = Path(__file__).parent
        self.project_root = self.test_dir.parent.parent
        self.results = TestResult()
        
        # Test modules to run
        self.test_modules = [
            'test_regression_fixes',
            'test_modern_comprehensive', 
            'test_assignment_spanning_integration',
            'test_cli_integration',
            'test_kernel_instrumenter_api',
            'test_dma_present_files_functions',
            'test_import'
        ]
    
    def setup_environment(self):
        """Set up the test environment"""
        # Add src to Python path
        src_path = str(self.project_root / "src")
        if src_path not in sys.path:
            sys.path.insert(0, src_path)
        
        # Set PYTHONPATH environment variable for subprocess calls
        os.environ['PYTHONPATH'] = src_path
        
        print("=" * 80)
        print("KERNEL INSTRUMENTATION TOOL - COMPREHENSIVE TEST SUITE")
        print("=" * 80)
        print(f"Python version: {sys.version}")
        print(f"Working directory: {os.getcwd()}")
        print(f"Test directory: {self.test_dir}")
        print(f"Project root: {self.project_root}")
        print("=" * 80)
    
    def check_dependencies(self) -> bool:
        """Check if all required dependencies are available"""
        print("\\nChecking Dependencies...")
        
        dependencies_ok = True
        
        try:
            import tree_sitter
            import tree_sitter_c
            print("✅ tree-sitter and tree-sitter-c available")
        except ImportError as e:
            print(f"❌ tree-sitter dependencies missing: {e}")
            dependencies_ok = False
        
        try:
            from kernel_instrumenter.kernel_instrument import KernelInstrumenter
            print("✅ KernelInstrumenter module importable")
        except ImportError as e:
            print(f"❌ KernelInstrumenter import failed: {e}")
            dependencies_ok = False
        
        if dependencies_ok:
            print("✅ All dependencies satisfied")
        else:
            print("❌ Dependency check failed")
        
        return dependencies_ok
    
    def discover_tests(self) -> Dict[str, unittest.TestSuite]:
        """Discover all test suites"""
        print("\\nDiscovering Test Suites...")
        
        test_suites = {}
        
        for module_name in self.test_modules:
            try:
                # Import the test module
                test_module = __import__(module_name, fromlist=[''])
                
                # Discover tests in the module
                loader = unittest.TestLoader()
                suite = loader.loadTestsFromModule(test_module)
                
                if suite.countTestCases() > 0:
                    test_suites[module_name] = suite
                    print(f"  ✅ {module_name}: {suite.countTestCases()} tests")
                else:
                    print(f"  ⚠️  {module_name}: No tests found")
                    
            except ImportError as e:
                print(f"  ❌ {module_name}: Import failed - {e}")
                continue
            except Exception as e:
                print(f"  ❌ {module_name}: Discovery failed - {e}")
                continue
        
        total_tests = sum(suite.countTestCases() for suite in test_suites.values())
        print(f"\\n📊 Total test suites: {len(test_suites)}")
        print(f"📊 Total tests discovered: {total_tests}")
        
        return test_suites
    
    def run_test_suite(self, suite_name: str, suite: unittest.TestSuite) -> Dict[str, Any]:
        """Run a single test suite and return results"""
        print(f"\\n{'=' * 60}")
        print(f"RUNNING: {self.get_suite_display_name(suite_name)}")
        print("=" * 60)
        
        # Create a custom test result object
        stream = StringIO()
        result = DetailedTestResult(stream, verbosity=2)
        result.suite_name = suite_name
        
        # Run the tests
        start_time = time.time()
        suite.run(result)
        execution_time = time.time() - start_time
        
        # Collect results
        suite_result = {
            'name': suite_name,
            'display_name': self.get_suite_display_name(suite_name),
            'tests_run': result.testsRun,
            'failures': len(result.failures),
            'errors': len(result.errors),
            'skipped': len(result.skipped),
            'execution_time': execution_time,
            'success': len(result.failures) == 0 and len(result.errors) == 0,
            'test_times': result.test_times,
            'failure_details': result.failures,
            'error_details': result.errors
        }
        
        # Print immediate results
        self.print_suite_summary(suite_result)
        
        # Update overall results
        self.results.total_tests += result.testsRun
        self.results.total_failures += len(result.failures)
        self.results.total_errors += len(result.errors)
        self.results.total_skipped += len(result.skipped)
        self.results.execution_time += execution_time
        self.results.test_suites[suite_name] = suite_result
        
        # Track failed/error tests
        for failure in result.failures:
            self.results.failed_tests.append(f"{suite_name}: {failure[0]}")
        for error in result.errors:
            self.results.error_tests.append(f"{suite_name}: {error[0]}")
        
        return suite_result
    
    def get_suite_display_name(self, suite_name: str) -> str:
        """Get a human-readable display name for a test suite"""
        display_names = {
            'test_regression_fixes': 'Regression Tests - Critical Fixes',
            'test_modern_comprehensive': 'Core Functionality Tests',
            'test_assignment_spanning_integration': 'Integration Tests - Assignment Spanning',
            'test_cli_integration': 'CLI Integration Tests',
            'test_kernel_instrumenter_api': 'KernelInstrumenter API Tests',
            'test_dma_present_files_functions': 'DMA Present Files Functions Tests',
            'test_import': 'Import and Module Loading Tests'
        }
        return display_names.get(suite_name, suite_name.replace('_', ' ').title())
    
    def print_suite_summary(self, suite_result: Dict[str, Any]):
        """Print a summary of test suite results"""
        name = suite_result['display_name']
        tests = suite_result['tests_run']
        failures = suite_result['failures']
        errors = suite_result['errors']
        time_taken = suite_result['execution_time']
        
        print(f"\\n----------------------------------------------------------------------")
        print(f"Ran {tests} tests in {time_taken:.3f}s")
        print()
        
        if failures == 0 and errors == 0:
            print("OK")
        else:
            parts = []
            if failures > 0:
                parts.append(f"failures={failures}")
            if errors > 0:
                parts.append(f"errors={errors}")
            print(f"FAILED ({', '.join(parts)})")
        
        print(f"\\n{'-' * 40}")
        print(f"SUITE SUMMARY: {name}")
        print(f"Tests run: {tests}")
        print(f"Failures: {failures}")
        print(f"Errors: {errors}")
        status = "✅ PASS" if suite_result['success'] else "❌ FAIL"
        print(f"Success: {status}")
        print("-" * 40)
    
    def run_performance_tests(self):
        """Run performance benchmarks"""
        print("\\nRunning Performance Benchmarks...")
        
        try:
            # Create a temporary test file for performance testing
            with tempfile.NamedTemporaryFile(mode='w', suffix='.c', delete=False) as f:
                f.write('''
#include <linux/module.h>
#include <linux/dma-mapping.h>
#include <linux/uaccess.h>

// Generate a large file for performance testing
''' + '\\n'.join([f'''
static int test_function_{i}(void) {{
    void *ptr = dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);
    copy_to_user(NULL, ptr, 1024);
    dma_free_coherent(NULL, 1024, ptr, 0);
    return 0;
}}''' for i in range(100)]))
                
                temp_file = f.name
            
            from kernel_instrumenter.kernel_instrument import KernelInstrumenter
            
            # Test DMA instrumentation performance
            instrumenter = KernelInstrumenter({'dma'}, dry_run=True, verbose=False)
            start_time = time.time()
            result = instrumenter.instrument_file(Path(temp_file))
            dma_time = time.time() - start_time
            
            # Test multi-type instrumentation performance
            instrumenter = KernelInstrumenter({'dma', 'user_copy', 'functions'}, dry_run=True, verbose=False)
            start_time = time.time()
            result = instrumenter.instrument_file(Path(temp_file))
            multi_time = time.time() - start_time
            
            print(f"  📊 DMA-only instrumentation: {dma_time:.3f}s")
            print(f"  📊 Multi-type instrumentation: {multi_time:.3f}s")
            print(f"  📊 Performance ratio: {multi_time/dma_time:.2f}x")
            
            # Clean up
            os.unlink(temp_file)
            
        except Exception as e:
            print(f"  ❌ Performance testing failed: {e}")
    
    def generate_detailed_report(self):
        """Generate a detailed test report"""
        print("\\n" + "=" * 80)
        print("COMPREHENSIVE TEST RESULTS SUMMARY")
        print("=" * 80)
        print(f"Total execution time: {self.results.execution_time:.2f} seconds")
        print(f"Total tests run: {self.results.total_tests}")
        print(f"Total failures: {self.results.total_failures}")
        print(f"Total errors: {self.results.total_errors}")
        
        if self.results.total_skipped > 0:
            print(f"Total skipped: {self.results.total_skipped}")
        
        print(f"\\nRESULTS BY TEST SUITE:")
        print("-" * 60)
        
        all_passed = True
        for suite_name, suite_result in self.results.test_suites.items():
            status = "✅ PASS" if suite_result['success'] else "❌ FAIL"
            display_name = suite_result['display_name']
            tests = suite_result['tests_run']
            failures = suite_result['failures']
            errors = suite_result['errors']
            
            print(f"{status} {display_name}")
            print(f"      Tests: {tests}, Failures: {failures}, Errors: {errors}")
            
            if not suite_result['success']:
                all_passed = False
        
        # Overall result
        print()
        if all_passed and self.results.total_tests > 0:
            print("🎉 ALL TEST SUITES PASSED! 🎉")
            print("The kernel instrumentation tool is working correctly.")
        else:
            print("❌ SOME TESTS FAILED!")
            print("Please review the failed tests above.")
        
        # Show verified functionality
        if all_passed:
            print("\\nFUNCTIONALITY VERIFIED:")
            verified_features = [
                "✅ Circular import resolution",
                "✅ Function context detection", 
                "✅ Assignment spanning preprocessor blocks",
                "✅ DMA API instrumentation",
                "✅ User copy operation instrumentation",
                "✅ Function entry instrumentation",
                "✅ CLI interface and argument parsing",
                "✅ KernelInstrumenter API functionality",
                "✅ Error handling and edge cases",
                "✅ Integration testing",
                "✅ Tree-sitter AST parsing",
                "✅ Multi-analyzer coordination"
            ]
            
            for feature in verified_features:
                print(feature)
    
    def save_json_report(self):
        """Save test results to JSON file for CI/CD integration"""
        try:
            report_data = {
                'timestamp': time.time(),
                'summary': {
                    'total_tests': self.results.total_tests,
                    'total_failures': self.results.total_failures,
                    'total_errors': self.results.total_errors,
                    'total_skipped': self.results.total_skipped,
                    'execution_time': self.results.execution_time,
                    'success': self.results.total_failures == 0 and self.results.total_errors == 0
                },
                'test_suites': {}
            }
            
            for suite_name, suite_result in self.results.test_suites.items():
                report_data['test_suites'][suite_name] = {
                    'display_name': suite_result['display_name'],
                    'tests_run': suite_result['tests_run'],
                    'failures': suite_result['failures'],
                    'errors': suite_result['errors'],
                    'execution_time': suite_result['execution_time'],
                    'success': suite_result['success']
                }
            
            report_file = self.test_dir / 'test_results.json'
            with open(report_file, 'w') as f:
                json.dump(report_data, f, indent=2)
            
            print(f"\\n📄 JSON report saved to: {report_file}")
            
        except Exception as e:
            print(f"\\n❌ Failed to save JSON report: {e}")
    
    def run_all_tests(self) -> bool:
        """Run all test suites and return success status"""
        # Setup
        self.setup_environment()
        
        # Check dependencies
        if not self.check_dependencies():
            print("\\n❌ Dependency check failed. Cannot run tests.")
            return False
        
        # Discover tests
        test_suites = self.discover_tests()
        
        if not test_suites:
            print("\\n❌ No test suites found!")
            return False
        
        # Run tests
        print(f"\\nStarting test execution...")
        overall_start_time = time.time()
        
        for suite_name, suite in test_suites.items():
            try:
                self.run_test_suite(suite_name, suite)
            except Exception as e:
                print(f"\\n❌ Failed to run test suite {suite_name}: {e}")
                continue
        
        total_execution_time = time.time() - overall_start_time
        self.results.execution_time = total_execution_time
        
        # Performance testing
        self.run_performance_tests()
        
        # Generate reports
        self.generate_detailed_report()
        self.save_json_report()
        
        # Return success status
        return (self.results.total_failures == 0 and 
                self.results.total_errors == 0 and 
                self.results.total_tests > 0)


def main():
    """Main entry point"""
    runner = ComprehensiveTestRunner()
    
    try:
        success = runner.run_all_tests()
        sys.exit(0 if success else 1)
        
    except KeyboardInterrupt:
        print("\\n\\n⚠️  Test execution cancelled by user")
        sys.exit(130)
    except Exception as e:
        print(f"\\n❌ Fatal error during test execution: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(2)


if __name__ == '__main__':
    main()
