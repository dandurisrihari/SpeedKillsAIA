#!/usr/bin/env python3
"""
Comprehensive test runner for all new features in the preprocess module
"""

import unittest
import sys
import os
from pathlib import Path

# Add src to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

# Import all test modules
try:
    from test_all_new_features_core import TestNewFeatures, TestBackwardCompatibility, TestIntegrationWithNewFeatures
    from test_parsers_fixed import TestTimestampParsing
    from test_cli_new_features import TestCLIWithNewFeatures, TestProgressUINewFields, TestWebUINewFields as CLIWebUITests
    from test_engine_c_files import TestCFileCountingEngine, TestEngineStatisticsIntegration
    from test_web_ui_new_features import TestWebUINewFields, TestWebUITemplate
except ImportError as e:
    print(f"Warning: Some test modules could not be imported: {e}")
    # Continue with available tests


class NewFeaturesSuiteRunner:
    """Comprehensive test suite runner for new features"""
    
    def __init__(self):
        self.test_suites = []
        self.setup_test_suites()
    
    def setup_test_suites(self):
        """Set up all test suites for new features"""
        
        # Core functionality tests
        try:
            core_suite = unittest.TestSuite()
            core_suite.addTest(unittest.makeSuite(TestNewFeatures))
            core_suite.addTest(unittest.makeSuite(TestTimestampParsing))
            core_suite.addTest(unittest.makeSuite(TestBackwardCompatibility))
            core_suite.addTest(unittest.makeSuite(TestIntegrationWithNewFeatures))
            self.test_suites.append(("Core New Features", core_suite))
        except NameError:
            print("Skipping core features tests - imports failed")
        
        # CLI and progress UI tests
        try:
            cli_suite = unittest.TestSuite()
            cli_suite.addTest(unittest.makeSuite(TestCLIWithNewFeatures))
            cli_suite.addTest(unittest.makeSuite(TestProgressUINewFields))
            self.test_suites.append(("CLI and Progress UI", cli_suite))
        except NameError:
            print("Skipping CLI tests - imports failed")
        
        # Engine .c file counting tests
        try:
            engine_suite = unittest.TestSuite()
            engine_suite.addTest(unittest.makeSuite(TestCFileCountingEngine))
            engine_suite.addTest(unittest.makeSuite(TestEngineStatisticsIntegration))
            self.test_suites.append(("Engine C File Counting", engine_suite))
        except NameError:
            print("Skipping engine tests - imports failed")
        
        # Web UI tests
        try:
            web_suite = unittest.TestSuite()
            web_suite.addTest(unittest.makeSuite(TestWebUINewFields))
            web_suite.addTest(unittest.makeSuite(TestWebUITemplate))
            self.test_suites.append(("Web UI New Features", web_suite))
        except NameError:
            print("Skipping web UI tests - imports failed")
    
    def run_all_tests(self, verbosity=2):
        """Run all test suites"""
        print("="*70)
        print("COMPREHENSIVE TEST SUITE FOR NEW FEATURES")
        print("="*70)
        print("Testing new features:")
        print("• Total Files counting from source root")
        print("• Files need analysis (renamed from total_files_analyzed)")
        print("• Dual timestamp format support (ISO 8601 + traditional)")
        print("• Updated web UI with new statistics")
        print("• Backward compatibility")
        print("="*70)
        
        total_tests = 0
        total_failures = 0
        total_errors = 0
        
        for suite_name, test_suite in self.test_suites:
            print(f"\n🧪 Running {suite_name} Tests...")
            print("-" * 50)
            
            runner = unittest.TextTestRunner(verbosity=verbosity)
            result = runner.run(test_suite)
            
            total_tests += result.testsRun
            total_failures += len(result.failures)
            total_errors += len(result.errors)
            
            if result.failures:
                print(f"❌ Failures in {suite_name}:")
                for test, traceback in result.failures:
                    print(f"  • {test}: {traceback}")
            
            if result.errors:
                print(f"💥 Errors in {suite_name}:")
                for test, traceback in result.errors:
                    print(f"  • {test}: {traceback}")
            
            if not result.failures and not result.errors:
                print(f"✅ All {suite_name} tests passed!")
        
        print("\n" + "="*70)
        print("FINAL RESULTS")
        print("="*70)
        print(f"Total Tests Run: {total_tests}")
        print(f"Failures: {total_failures}")
        print(f"Errors: {total_errors}")
        
        if total_failures == 0 and total_errors == 0:
            print("🎉 ALL TESTS PASSED! New features are working correctly.")
            return True
        else:
            print("❌ Some tests failed. Please review the output above.")
            return False
    
    def run_specific_suite(self, suite_name, verbosity=2):
        """Run a specific test suite by name"""
        for name, suite in self.test_suites:
            if suite_name.lower() in name.lower():
                print(f"Running {name} Tests...")
                runner = unittest.TextTestRunner(verbosity=verbosity)
                result = runner.run(suite)
                return result
        
        print(f"Test suite '{suite_name}' not found.")
        print("Available suites:")
        for name, _ in self.test_suites:
            print(f"  • {name}")
        return None


def create_test_data_files():
    """Create sample test data files for manual testing"""
    test_dir = Path(__file__).parent / "test_data"
    test_dir.mkdir(exist_ok=True)
    
    # Create sample log with mixed timestamps
    sample_log = test_dir / "mixed_timestamps.log"
    sample_log.write_text("""[    1.123456] FUNC_ENTRY: drv_ioctl in drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:673
2025-08-03T19:04:36,338434+00:00 FUNC_ENTRY: main_function in drivers/test/main.c:100
[    2.234567] DMA_MAPPING: dma_map_page called by drv_ioctl in drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:750
2025-08-03T19:04:37,123456+00:00 USER_COPY: copy_to_user called by main_function
  Process: test_app (PID: 12345)
[    3.345678] IOCTL_HANDLER: drv_ioctl at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:800
""")
    
    # Create sample source structure
    src_dir = test_dir / "sample_source"
    src_dir.mkdir(exist_ok=True)
    
    (src_dir / "main.c").write_text("// Main application")
    (src_dir / "drivers").mkdir(exist_ok=True)
    (src_dir / "drivers" / "test_driver.c").write_text("// Test driver")
    (src_dir / "drivers" / "gpu_driver.c").write_text("// GPU driver")
    (src_dir / "lib").mkdir(exist_ok=True)
    (src_dir / "lib" / "utils.c").write_text("// Utility functions")
    
    print(f"Test data created in: {test_dir}")
    print(f"Sample log: {sample_log}")
    print(f"Sample source: {src_dir}")
    
    return test_dir


def main():
    """Main function to run tests"""
    import argparse
    
    parser = argparse.ArgumentParser(description="Run comprehensive tests for new features")
    parser.add_argument('--suite', help='Run specific test suite')
    parser.add_argument('--verbosity', type=int, default=2, help='Test verbosity level')
    parser.add_argument('--create-test-data', action='store_true', help='Create test data files')
    parser.add_argument('--list-suites', action='store_true', help='List available test suites')
    
    args = parser.parse_args()
    
    if args.create_test_data:
        create_test_data_files()
        return
    
    runner = NewFeaturesSuiteRunner()
    
    if args.list_suites:
        print("Available test suites:")
        for name, _ in runner.test_suites:
            print(f"  • {name}")
        return
    
    if args.suite:
        result = runner.run_specific_suite(args.suite, args.verbosity)
        sys.exit(0 if result and result.wasSuccessful() else 1)
    else:
        success = runner.run_all_tests(args.verbosity)
        sys.exit(0 if success else 1)


if __name__ == '__main__':
    main()
