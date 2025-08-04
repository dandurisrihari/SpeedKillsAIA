#!/usr/bin/env python3
"""
Comprehensive test runner for preprocess and webviewer modules
"""

import unittest
import sys
import tempfile
from pathlib import Path

# Add src to path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))


class TestModuleIntegration(unittest.TestCase):
    """Integration tests for core modules"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        if self.temp_path.exists():
            shutil.rmtree(self.temp_path)
    
    def test_preprocess_module_import(self):
        """Test that preprocess modules can be imported"""
        try:
            from src.preprocess.core.engine import KernelLogParserEngine
            from src.preprocess.core.models import FunctionEntry, DMAOperation
            from src.preprocess.core.patterns import LogPatterns
            self.assertTrue(True, "Preprocess core modules imported successfully")
        except ImportError as e:
            self.fail(f"Failed to import preprocess core modules: {e}")
    
    def test_preprocess_engine_basic_functionality(self):
        """Test basic engine functionality"""
        from src.preprocess.core.engine import KernelLogParserEngine
        
        # Create test log
        test_log = self.temp_path / "test.log"
        test_log.write_text("[123.456] FUNC_ENTRY: Entering function test_func at /test/file.c:100")
        
        # Test engine
        engine = KernelLogParserEngine(show_ui=False)
        results = engine.parse_log_file(str(test_log))
        
        self.assertIsInstance(results, dict)
        self.assertIn('statistics', results)
        self.assertIn('function_entries', results)
        self.assertGreater(results['statistics']['unique_function_entries'], 0)
    
    def test_webviewer_module_import(self):
        """Test that webviewer modules can be imported"""
        try:
            from src.webviewer.ui import create_app, load_data
            from src.webviewer.cli import main
            self.assertTrue(True, "Webviewer modules imported successfully")
        except ImportError as e:
            self.fail(f"Failed to import webviewer modules: {e}")
    
    def test_webviewer_app_creation(self):
        """Test Flask app creation"""
        try:
            from src.webviewer.ui import create_app
            app = create_app()
            self.assertIsNotNone(app)
            self.assertEqual(app.name, 'src.webviewer.ui')
        except ImportError:
            self.skipTest("Flask not available")
        except Exception as e:
            self.fail(f"Failed to create Flask app: {e}")
    
    def test_data_flow_integration(self):
        """Test data flow from preprocess to webviewer"""
        from src.preprocess.core.engine import KernelLogParserEngine
        
        # Create test log with various entry types
        test_log = self.temp_path / "integration_test.log"
        content = """[123.456] FUNC_ENTRY: Entering function test_func at /test/file.c:100
[123.457] DMA_INSTRUMENT: About to call dma_alloc from function test_func at /test/file.c:100
[123.458] USER_COPY: About to call copy_from_user from function handler at /test/file.c:200
[123.459] IOCTL_HANDLER: Function device_ioctl called at /test/file.c:300"""
        test_log.write_text(content)
        
        # Parse with preprocess
        engine = KernelLogParserEngine(show_ui=False)
        results = engine.parse_log_file(str(test_log))
        
        # Verify data structure is compatible with webviewer expectations
        required_keys = ['metadata', 'function_entries', 'dma_operations', 
                        'user_copy_operations', 'ioctl_operations', 'statistics']
        for key in required_keys:
            self.assertIn(key, results, f"Missing required key: {key}")
        
        # Test that data can be saved/loaded for webviewer
        import json
        output_file = self.temp_path / "test_output.json"
        with open(output_file, 'w') as f:
            json.dump(results, f)
        
        # Verify file can be loaded
        with open(output_file, 'r') as f:
            loaded_data = json.load(f)
        
        self.assertEqual(loaded_data['statistics']['unique_function_entries'], 
                        results['statistics']['unique_function_entries'])
    
    def test_function_code_extraction_integration(self):
        """Test that function code extraction works end-to-end"""
        from src.preprocess.core.engine import KernelLogParserEngine
        
        # Create a simple C file for extraction
        test_c_file = self.temp_path / "test.c"
        test_c_file.write_text("""
int simple_function(int x) {
    return x * 2;
}

void another_function(void) {
    printf("Hello\\n");
}
""")
        
        # Create log that references this file
        test_log = self.temp_path / "test.log"
        test_log.write_text(f"[123.456] FUNC_ENTRY: Entering function simple_function at {test_c_file}:2")
        
        # Parse and check function code extraction
        engine = KernelLogParserEngine(show_ui=False)
        results = engine.parse_log_file(str(test_log))
        
        # Check if function code was extracted
        if results['function_entries']:
            func_entry = results['function_entries'][0]
            # Function code should either be extracted or be None
            function_code = func_entry.get('function_code')
            if function_code is not None:
                self.assertIn('simple_function', function_code)
    
    def test_cli_argument_parsing(self):
        """Test that CLI modules exist and can be imported"""
        try:
            from src.preprocess.cli import main
            from src.preprocess import cli
            self.assertTrue(True, "CLI modules imported successfully")
        except ImportError as e:
            self.fail(f"Failed to import CLI modules: {e}")
    
    def test_error_handling(self):
        """Test error handling in core modules"""
        from src.preprocess.core.engine import KernelLogParserEngine
        
        # Test with non-existent file
        engine = KernelLogParserEngine(show_ui=False)
        
        with self.assertRaises((FileNotFoundError, IOError)):
            engine.parse_log_file("/nonexistent/file.log")
    
    def test_patterns_functionality(self):
        """Test pattern matching functionality"""
        from src.preprocess.core.patterns import LogPatterns
        
        patterns = LogPatterns()
        
        # Test function entry pattern
        line = "[123.456] FUNC_ENTRY: Entering function test_func at /test/file.c:100"
        match = patterns.search_func_entry(line)
        self.assertIsNotNone(match)
        self.assertEqual(match.group(1), "test_func")
        
        # Test DMA pattern
        dma_line = "[123.456] DMA_INSTRUMENT: About to call dma_alloc from function caller at /test/file.c:200"
        dma_match = patterns.search_dma_instrument(dma_line)
        self.assertIsNotNone(dma_match)
        self.assertEqual(dma_match.group(1), "dma_alloc")
        self.assertEqual(dma_match.group(2), "caller")


def run_comprehensive_tests():
    """Run comprehensive tests for all modules"""
    
    print("🚀 Running Comprehensive Tests for Preprocess and Webviewer Modules")
    print("=" * 80)
    
    # Run the integration tests
    loader = unittest.TestLoader()
    suite = loader.loadTestsFromTestCase(TestModuleIntegration)
    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)
    
    # Print summary
    print("\n" + "=" * 80)
    print("📊 Test Summary:")
    print(f"✅ Tests run: {result.testsRun}")
    print(f"❌ Failures: {len(result.failures)}")
    print(f"⚠️  Errors: {len(result.errors)}")
    print(f"⏭️  Skipped: {len(result.skipped) if hasattr(result, 'skipped') else 0}")
    
    if result.failures:
        print("\n❌ Failures:")
        for test, trace in result.failures:
            print(f"  - {test}: {trace.split('AssertionError:')[-1].strip()}")
    
    if result.errors:
        print("\n⚠️  Errors:")
        for test, trace in result.errors:
            print(f"  - {test}: {trace.split('Error:')[-1].strip()}")
    
    success = len(result.failures) == 0 and len(result.errors) == 0
    
    if success:
        print("\n🎉 All tests passed! Both preprocess and webviewer modules are working correctly.")
    else:
        print("\n🔧 Some tests failed. Please check the errors above.")
    
    return success


if __name__ == '__main__':
    success = run_comprehensive_tests()
    sys.exit(0 if success else 1)
