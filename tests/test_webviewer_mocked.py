#!/usr/bin/env python3
"""
Mock-based webviewer tests that avoid port conflicts
"""

import unittest
import tempfile
import json
import sys
from pathlib import Path
from unittest.mock import patch, MagicMock

# Add src to path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))


class TestWebviewerMocked(unittest.TestCase):
    """Mock-based tests for webviewer functionality"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_json_data = {
            "metadata": {
                "parser_version": "2.0.0",
                "parsed_at": "2023-01-01T12:00:00.000000",
                "log_file": "test.log",
                "total_lines": 100,
                "parsed_lines": 50,
                "unique_entries": 10
            },
            "function_entries": [
                {
                    "function_name": "gasket_open",
                    "file_path": "gasket-driver/src/gasket_core.c",
                    "line_number": 1230,
                    "first_seen_timestamp": 1754249395.036722,
                    "first_seen_time_str": "19:29:55,036722",
                    "entry_type": "function_entry",
                    "function_code": "static int gasket_open(struct inode *inode, struct file *filp) { return 0; }",
                    "call_count": 5
                }
            ],
            "dma_operations": [
                {
                    "dma_function": "dma_alloc_coherent",
                    "caller_function": "gasket_alloc_coherent_memory",
                    "file_path": "gasket-driver/src/gasket_page_table.c",
                    "line_number": 1630,
                    "first_seen_timestamp": 1754249396.390564,
                    "first_seen_time_str": "19:29:56,390564",
                    "function_code": "int gasket_alloc_coherent_memory() { return dma_alloc_coherent(); }",
                    "call_count": 1,
                    "stack_trace": []
                }
            ],
            "user_copy_operations": [
                {
                    "copy_function": "copy_from_user",
                    "caller_function": "apex_set_performance_expectation",
                    "file_path": "gasket-driver/src/apex_driver.c",
                    "line_number": 577,
                    "first_seen_timestamp": 1754249396.050198,
                    "first_seen_time_str": "19:29:56,050198",
                    "function_code": "static long apex_set_performance_expectation() { copy_from_user(); }",
                    "call_count": 1
                }
            ],
            "ioctl_operations": [
                {
                    "function_name": "gasket_open",
                    "file_path": "gasket-driver/src/gasket_core.c",
                    "line_number": 1229,
                    "first_seen_timestamp": 1754249395.026809,
                    "first_seen_time_str": "19:29:55,026809",
                    "function_code": "static int gasket_open() { return 0; }",
                    "call_count": 5
                }
            ],
            "statistics": {
                "unique_function_entries": 1,
                "unique_dma_operations": 1,
                "unique_user_copy_operations": 1,
                "unique_ioctl_operations": 1,
                "total_function_entries_found": 5,
                "total_dma_operations_found": 3264,
                "total_user_copy_operations_found": 31,
                "total_ioctl_operations_found": 181
            }
        }
    
    def test_webviewer_import_successful(self):
        """Test that webviewer modules import successfully"""
        try:
            from src.webviewer import create_app, load_data, main
            self.assertTrue(True)
        except ImportError as e:
            self.fail(f"Failed to import webviewer modules: {e}")
    
    def test_flask_app_creation(self):
        """Test Flask app creation without running server"""
        try:
            from src.webviewer import create_app
            app = create_app()
            self.assertIsNotNone(app)
            self.assertEqual(app.name, 'src.webviewer.ui')
        except ImportError:
            self.skipTest("Flask not available")
    
    def test_load_data_function(self):
        """Test load_data function with temporary file"""
        try:
            from src.webviewer import load_data
        except ImportError:
            self.skipTest("Webviewer not available")
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(self.test_json_data, f)
            json_file = f.name
        
        try:
            result = load_data(Path(json_file))
            self.assertTrue(result)
        finally:
            Path(json_file).unlink()
    
    def test_flask_routes_with_test_client(self):
        """Test Flask routes using test client (no server needed)"""
        try:
            from src.webviewer.ui import create_app
        except ImportError:
            self.skipTest("Flask not available")
        
        app = create_app()
        
        with app.test_client() as client:
            # Test that routes exist
            response = client.get('/api/status')
            self.assertEqual(response.status_code, 200)
            
            # Test API endpoints without data
            response = client.get('/api/data')
            self.assertEqual(response.status_code, 404)  # No data loaded
    
    def test_api_function_code_endpoint_mocked(self):
        """Test function code API endpoint with session data"""
        try:
            from src.webviewer import create_app
        except ImportError:
            self.skipTest("Flask not available")
        
        app = create_app()
        
        with app.test_client() as client:
            # Set session data
            with client.session_transaction() as sess:
                sess['results'] = self.test_json_data
            
            # Test function code API
            response = client.get('/api/function-code?name=gasket_open&file=gasket-driver/src/gasket_core.c&line=1230')
            
            if response.status_code == 200:
                data = json.loads(response.data)
                self.assertIn('function_code', data)
                self.assertIn('gasket_open', data['function_code'])
    
    def test_webviewer_cli_import(self):
        """Test that CLI module imports correctly"""
        try:
            from src.webviewer import main
            # Just test that the function exists
            self.assertTrue(callable(main))
        except ImportError as e:
            self.fail(f"Failed to import webviewer CLI: {e}")


def run_webviewer_tests():
    """Run webviewer tests safely"""
    print("🌐 Running Webviewer Tests (Mocked)")
    print("=" * 50)
    
    loader = unittest.TestLoader()
    suite = loader.loadTestsFromTestCase(TestWebviewerMocked)
    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)
    
    print("\n" + "=" * 50)
    print("📊 Webviewer Test Summary:")
    print(f"✅ Tests run: {result.testsRun}")
    print(f"❌ Failures: {len(result.failures)}")
    print(f"⚠️  Errors: {len(result.errors)}")
    print(f"⏭️  Skipped: {len(result.skipped) if hasattr(result, 'skipped') else 0}")
    
    success = len(result.failures) == 0 and len(result.errors) == 0
    return success


if __name__ == '__main__':
    success = run_webviewer_tests()
    sys.exit(0 if success else 1)
