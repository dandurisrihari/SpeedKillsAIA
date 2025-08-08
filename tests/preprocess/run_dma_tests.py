#!/usr/bin/env python3
"""
Comprehensive test runner for DMA parsing functionality
Run this to ensure all DMA parsing features work correctly across all platforms
"""

import unittest
import sys
import os

# Add the project root to Python path
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '../..'))
sys.path.insert(0, project_root)

def run_dma_tests():
    """Run all DMA-related tests"""
    print("=" * 60)
    print("Running Comprehensive DMA Parser Tests")
    print("=" * 60)
    
    # Import test modules
    from tests.preprocess.test_dma_parser import TestDMAParser
    from tests.preprocess.test_timestamp_parsing import TestTimestampParsing, TestTimestampIntegration
    from tests.preprocess.test_dma_integration import TestDMAParsingIntegration
    from tests.preprocess.test_stack_trace_engine import TestStackTraceAttachment, TestEngineLineProcessing
    
    # Create test suite
    loader = unittest.TestLoader()
    suite = unittest.TestSuite()
    
    # Add DMA parser tests
    print("\n📋 Adding DMA Parser Tests...")
    suite.addTest(loader.loadTestsFromTestCase(TestDMAParser))
    
    # Add timestamp parsing tests
    print("📋 Adding Timestamp Parsing Tests...")
    suite.addTest(loader.loadTestsFromTestCase(TestTimestampParsing))
    suite.addTest(loader.loadTestsFromTestCase(TestTimestampIntegration))
    
    # Add integration tests
    print("📋 Adding Integration Tests...")
    suite.addTest(loader.loadTestsFromTestCase(TestDMAParsingIntegration))
    
    # Add engine tests
    print("📋 Adding Engine Stack Trace Tests...")
    suite.addTest(loader.loadTestsFromTestCase(TestStackTraceAttachment))
    suite.addTest(loader.loadTestsFromTestCase(TestEngineLineProcessing))
    
    # Run tests
    print("\nRunning Tests...")
    runner = unittest.TextTestRunner(verbosity=2, buffer=True)
    result = runner.run(suite)
    
    # Print summary
    print("\n" + "=" * 60)
    print("TEST SUMMARY")
    print("=" * 60)
    print(f"Tests run: {result.testsRun}")
    print(f"Failures: {len(result.failures)}")
    print(f"Errors: {len(result.errors)}")
    print(f"Skipped: {len(result.skipped) if hasattr(result, 'skipped') else 0}")
    
    if result.failures:
        print("\n❌ FAILURES:")
        for test, traceback in result.failures:
            print(f"  - {test}: {traceback.split(chr(10))[-2] if chr(10) in traceback else traceback}")
    
    if result.errors:
        print("\n💥 ERRORS:")
        for test, traceback in result.errors:
            print(f"  - {test}: {traceback.split(chr(10))[-2] if chr(10) in traceback else traceback}")
    
    if result.wasSuccessful():
        print("\n✅ ALL TESTS PASSED!")
        print("\n🎉 DMA parsing functionality verified for:")
        print("   • TI boot log format ([timestamp])")
        print("   • ISO timestamp format (YYYY-MM-DDTHH:MM:SS+TZ)")
        print("   • Coral address bracket format ([<address>])")
        print("   • Stack trace collection and attachment")
        print("   • Deduplication with stack trace preservation")
        print("   • Function name cleaning (.part.0 removal)")
        print("   • Mixed format log parsing")
        return True
    else:
        print("\n❌ SOME TESTS FAILED!")
        print("   Please fix the issues above before deploying.")
        return False


def run_specific_platform_test(platform):
    """Run tests for a specific platform"""
    print(f"Running tests for {platform.upper()} platform...")
    
    if platform.lower() == 'ti':
        # Run TI-specific tests
        from tests.preprocess.test_dma_integration import TestDMAParsingIntegration
        suite = unittest.TestSuite()
        suite.addTest(TestDMAParsingIntegration('test_ti_boot_log_parsing'))
        
    elif platform.lower() == 'coral':
        # Run Coral-specific tests
        from tests.preprocess.test_dma_integration import TestDMAParsingIntegration
        suite = unittest.TestSuite()
        suite.addTest(TestDMAParsingIntegration('test_coral_format_log_parsing'))
        
    elif platform.lower() == 'nxp':
        # Run NXP/ISO format tests
        from tests.preprocess.test_dma_integration import TestDMAParsingIntegration
        suite = unittest.TestSuite()
        suite.addTest(TestDMAParsingIntegration('test_iso_timestamp_log_parsing'))
        
    else:
        print(f"Unknown platform: {platform}")
        return False
    
    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)
    return result.wasSuccessful()


if __name__ == '__main__':
    import argparse
    
    parser = argparse.ArgumentParser(description='Run DMA parser tests')
    parser.add_argument('--platform', choices=['ti', 'coral', 'nxp'], 
                       help='Run tests for specific platform only')
    parser.add_argument('--quick', action='store_true',
                       help='Run only basic functionality tests')
    
    args = parser.parse_args()
    
    if args.platform:
        success = run_specific_platform_test(args.platform)
    elif args.quick:
        # Run only basic parser tests
        from tests.preprocess.test_dma_parser import TestDMAParser
        loader = unittest.TestLoader()
        suite = loader.loadTestsFromTestCase(TestDMAParser)
        runner = unittest.TextTestRunner(verbosity=2)
        result = runner.run(suite)
        success = result.wasSuccessful()
    else:
        success = run_dma_tests()
    
    sys.exit(0 if success else 1)
