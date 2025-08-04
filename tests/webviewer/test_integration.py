#!/usr/bin/env python3
"""
Integration tests for webviewer module
"""

import unittest
import sys
import json
import tempfile
from pathlib import Path
from unittest.mock import patch, MagicMock

# Add the src directory to Python path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))

try:
    import flask
    from src.webviewer import create_app, load_data, start_web_ui, main
    FLASK_AVAILABLE = True
except ImportError:
    FLASK_AVAILABLE = False


class TestWebviewerIntegration(unittest.TestCase):
    """Integration tests for webviewer module"""
    
    def setUp(self):
        """Set up test fixtures"""
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
                    "function_code": "static int gasket_open(struct inode *inode, struct file *filp)\\n{\\n\\treturn 0;\\n}",
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

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_full_webviewer_workflow(self):
        """Test complete webviewer workflow from JSON to web UI"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(self.test_json_data, f)
            json_file = f.name
        
        try:
            # Test data loading
            result = load_data(json_file)
            self.assertTrue(result)
            
            # Access the global parsed_data
            from src.webviewer.ui import parsed_data
            self.assertIsNotNone(parsed_data)
            self.assertEqual(parsed_data['metadata']['parser_version'], '2.0.0')
            
            # Test app creation with data
            app = create_app()
            
            with app.test_client() as client:
                # Test main page (should redirect to upload without session data)
                response = client.get('/')
                self.assertIn(response.status_code, [200, 302])  # OK or redirect
                
                # Test API endpoints
                response = client.get('/api/status')
                self.assertEqual(response.status_code, 200)
                
                # Test function code API with valid data
                with client.session_transaction() as sess:
                    sess['results'] = parsed_data
                
                response = client.get('/api/function-code?name=gasket_open&file=gasket-driver/src/gasket_core.c&line=1230')
                if response.status_code == 200:
                    api_data = json.loads(response.data)
                    self.assertIn('function_code', api_data)
                
        finally:
            Path(json_file).unlink()

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_api_endpoints_with_real_data(self):
        """Test API endpoints with realistic data"""
        app = create_app()
        
        with app.test_client() as client:
            with client.session_transaction() as sess:
                sess['results'] = self.test_json_data
            
            # Test data API
            response = client.get('/api/data')
            self.assertEqual(response.status_code, 200)
            data = json.loads(response.data)
            self.assertEqual(data['metadata']['parser_version'], '2.0.0')
            
            # Test search APIs
            search_categories = ['functions', 'dma', 'user_copy', 'ioctl']
            for category in search_categories:
                response = client.get(f'/api/search/{category}?q=test')
                # Should not 404 (may return empty results)
                self.assertNotEqual(response.status_code, 404)
            
            # Test function code API
            response = client.get('/api/function-code?name=gasket_open&file=gasket-driver/src/gasket_core.c&line=1230')
            if response.status_code == 200:
                data = json.loads(response.data)
                self.assertIn('function_code', data)
            
            # Test DMA code API
            response = client.get('/api/dma-code/0')
            # Should exist or return appropriate error
            self.assertIn(response.status_code, [200, 404])
            
            # Test user copy code API
            response = client.get('/api/user-copy-code/0')
            self.assertIn(response.status_code, [200, 404])
            
            # Test IOCTL code API
            response = client.get('/api/ioctl-code/0')
            self.assertIn(response.status_code, [200, 404])

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_file_upload_functionality(self):
        """Test file upload functionality"""
        app = create_app()
        
        with app.test_client() as client:
            # Test GET upload page
            response = client.get('/upload')
            self.assertEqual(response.status_code, 200)
            
            # Test POST with no file
            response = client.post('/upload')
            self.assertEqual(response.status_code, 200)
            self.assertIn(b'No file selected', response.data)
            
            # Test POST with invalid file
            response = client.post('/upload', data={'file': (open('/dev/null', 'rb'), 'test.txt')})
            self.assertEqual(response.status_code, 200)
            self.assertIn(b'JSON file', response.data)

    @patch('src.webviewer.ui.app.run')
    @patch('webbrowser.open')
    def test_start_web_ui_integration(self, mock_browser, mock_app_run):
        """Test start_web_ui integration"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(self.test_json_data, f)
            json_file = f.name
        
        try:
            # Mock app.run to prevent hanging
            mock_app_run.return_value = None
            
            # Test successful startup
            result = start_web_ui(json_file=json_file, port=5000, host='127.0.0.1', auto_open=True)
            self.assertTrue(result)
            
            # Verify app.run was called with correct parameters
            mock_app_run.assert_called_once_with(host='127.0.0.1', port=5000, debug=False)
            
        finally:
            Path(json_file).unlink()

    def test_module_imports(self):
        """Test that all required components can be imported"""
        # Test importing main components
        if FLASK_AVAILABLE:
            from src.webviewer import create_app, load_data, start_web_ui, main
            self.assertTrue(callable(create_app))
            self.assertTrue(callable(load_data))
            self.assertTrue(callable(start_web_ui))
            self.assertTrue(callable(main))

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_error_handling_in_routes(self):
        """Test error handling in web routes"""
        app = create_app()
        
        with app.test_client() as client:
            # Test invalid API endpoints
            response = client.get('/api/function-code?name=nonexistent')
            self.assertEqual(response.status_code, 404)  # No data loaded
            
            # Test missing required params
            response = client.get('/api/function-code')
            self.assertEqual(response.status_code, 400)  # Missing function name
            
            # Test accessing results without session data
            response = client.get('/results')
            self.assertEqual(response.status_code, 302)  # Should redirect
            
            # Test search with invalid category
            response = client.get('/api/search/invalid_category')
            # Should handle gracefully
            self.assertNotEqual(response.status_code, 500)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_session_data_handling(self):
        """Test session data handling"""
        app = create_app()
        
        # Process test data to add missing fields
        processed_data = self.test_json_data.copy()
        
        # Create functions_by_file structure
        functions_by_file = {}
        for func in processed_data['function_entries']:
            file_path = func.get('file_path', 'unknown')
            if file_path not in functions_by_file:
                functions_by_file[file_path] = []
            functions_by_file[file_path].append(func)
        processed_data['functions_by_file'] = functions_by_file
        
        with app.test_client() as client:
            # Set session data
            with client.session_transaction() as sess:
                sess['results'] = processed_data
            
            # Test results page with session data
            response = client.get('/results')
            self.assertEqual(response.status_code, 200)
            
            # Test API with session data
            response = client.get('/api/data')
            self.assertEqual(response.status_code, 200)
            
            # Clear session and test redirect
            with client.session_transaction() as sess:
                sess.clear()
            
            response = client.get('/results')
            self.assertEqual(response.status_code, 302)  # Should redirect to upload


if __name__ == '__main__':
    unittest.main()
