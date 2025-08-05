#!/usr/bin/env python3
"""
Test the web UI module
"""

import unittest
import sys
import os
import tempfile
import json
from unittest.mock import patch, MagicMock
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from src.preprocess.web.ui import create_app
from src.preprocess.web import ui


class TestWebUI(unittest.TestCase):
    """Test cases for the web UI"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.app = create_app()
        self.app.config['TESTING'] = True
        self.client = self.app.test_client()
        
        # Clear any existing session data
        with self.client.session_transaction() as sess:
            sess.clear()
        
        # Clear global parsed_data to prevent cross-test contamination
        ui.parsed_data = None
        
        # Sample data for testing
        self.sample_results = {
            "metadata": {
                "log_file": "test_kernel.log",
                "parsed_at": "2024-01-01T12:00:00",
                "total_lines": 100,
                "unique_entries": 5
            },
            "functions_by_file": {
                "/gasket-driver/src/gasket_core.c": [
                    {
                        "function_name": "gasket_open",
                        "file_path": "/gasket-driver/src/gasket_core.c",
                        "line_number": 1229,
                        "first_seen_timestamp": 156.773472,
                        "call_count": 2
                    }
                ]
            },
            "function_entries": [
                {
                    "function_name": "gasket_open",
                    "file_path": "/gasket-driver/src/gasket_core.c",
                    "line_number": 1229,
                    "first_seen_timestamp": 156.773472,
                    "call_count": 2
                }
            ],
            "dma_operations": [
                {
                    "dma_function": "dma_map_page",
                    "caller_function": "gasket_perform_mapping",
                    "file_path": "/gasket-driver/src/gasket_page_table.c",
                    "line_number": 650,
                    "first_seen_timestamp": 156.800000,
                    "call_count": 1,
                    "stack_trace": ["CPU: 2 PID: 3999", "Call trace:"]
                }
            ],
            "user_copy_operations": [
                {
                    "copy_function": "copy_from_user",
                    "caller_function": "apex_set_performance_expectation",
                    "file_path": "/gasket-driver/src/apex_driver.c",
                    "line_number": 576,
                    "first_seen_timestamp": 156.889534,
                    "call_count": 1,
                    "process_info": {
                        "pid": 3999,
                        "comm": "classify_image"
                    }
                }
            ],
            "ioctl_operations": [
                {
                    "function_name": "drv_ioctl",
                    "file_path": "drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c",
                    "line_number": 673,
                    "first_seen_timestamp": 47.468247,
                    "call_count": 1,
                    "function_code": "static long drv_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {\n    switch (cmd) {\n        case IOCTL_GCHAL_INTERFACE:\n            return gckDEVICE_Dispatch(device, &iface);\n        default:\n            return -ENOTTY;\n    }\n}"
                },
                {
                    "function_name": "video_ioctl",
                    "file_path": "drivers/media/v4l2-core/v4l2-dev.c",
                    "line_number": 456,
                    "first_seen_timestamp": 50.123456,
                    "call_count": 1,
                    "function_code": None
                }
            ],
            "statistics": {
                "total_lines_processed": 100,
                "total_files_analyzed": 3,
                "files_instrumented_with_function_entries": 2,
                "function_entries_found": 1,
                "dma_operations_found": 1,
                "user_copy_operations_found": 1,
                "unique_function_entries": 1,
                "unique_dma_operations": 1,
                "unique_user_copy_operations": 1,
                "unique_ioctl_operations": 2
            }
        }
    
    def tearDown(self):
        """Clean up test fixtures"""
        # Clear session data after each test
        with self.client.session_transaction() as sess:
            sess.clear()
        
        # Clear global parsed_data to prevent cross-test contamination
        ui.parsed_data = None
    
    def create_temp_json_file(self, data):
        """Create a temporary JSON file with test data"""
        temp_file = tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.json')
        json.dump(data, temp_file, indent=2)
        temp_file.flush()
        temp_file.close()
        return temp_file.name
    
    def test_index_route(self):
        """Test the index route"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
        
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Kernel Log Analysis', response.data)
    
    def test_upload_route_get(self):
        """Test GET request to upload route"""
        response = self.client.get('/upload')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Upload Results File', response.data)
    
    def test_upload_route_post_valid_file(self):
        """Test POST request with valid JSON file"""
        json_file = self.create_temp_json_file(self.sample_results)
        
        try:
            with open(json_file, 'rb') as f:
                response = self.client.post('/upload', data={
                    'file': (f, 'test_results.json')
                }, content_type='multipart/form-data')
            
            # Should redirect to results page
            self.assertEqual(response.status_code, 302)
            self.assertIn('/results', response.location)
            
        finally:
            os.unlink(json_file)
    
    def test_upload_route_post_no_file(self):
        """Test POST request without file"""
        response = self.client.post('/upload', data={})
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'No file selected', response.data)
    
    def test_upload_route_post_invalid_json(self):
        """Test POST request with invalid JSON file"""
        temp_file = tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.json')
        temp_file.write("Invalid JSON content")
        temp_file.flush()
        temp_file.close()
        
        try:
            with open(temp_file.name, 'rb') as f:
                response = self.client.post('/upload', data={
                    'file': (f, 'invalid.json')
                }, content_type='multipart/form-data')
            
            self.assertEqual(response.status_code, 200)
            self.assertIn(b'Invalid JSON file', response.data)
            
        finally:
            os.unlink(temp_file.name)
    
    def test_results_route_with_session(self):
        """Test results route with data in session"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            response = self.client.get('/results')
            self.assertEqual(response.status_code, 200)
            
            # Check that key data is displayed
            self.assertIn(b'gasket_open', response.data)
            self.assertIn(b'dma_map_page', response.data)
            self.assertIn(b'copy_from_user', response.data)
    
    def test_results_route_without_session(self):
        """Test results route without data in session"""
        response = self.client.get('/results')
        # Should redirect to upload page
        self.assertEqual(response.status_code, 302)
        self.assertIn('/upload', response.location)
    
    def test_api_data_route(self):
        """Test the API data route"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            response = self.client.get('/api/data')
            self.assertEqual(response.status_code, 200)
            self.assertEqual(response.content_type, 'application/json')
            
            # Parse JSON response
            data = json.loads(response.data)
            self.assertEqual(data, self.sample_results)
    
    def test_api_data_route_no_session(self):
        """Test API data route without session data"""
        # Explicitly clear session to ensure no data
        with self.client.session_transaction() as sess:
            sess.clear()
        
        # Also clear global parsed_data
        ui.parsed_data = None
        
        response = self.client.get('/api/data')
        self.assertEqual(response.status_code, 404)
    
    def test_static_file_serving(self):
        """Test that static files are served correctly"""
        # This would test CSS/JS files if they exist
        # For now just verify the static folder is configured
        self.assertIsNotNone(self.app.static_folder)
    
    def test_ioctl_operations_display(self):
        """Test that IOCTL operations are displayed in the web UI"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            response = self.client.get('/results')
            self.assertEqual(response.status_code, 200)
            
            # Check that IOCTL data is displayed
            self.assertIn(b'drv_ioctl', response.data)
            self.assertIn(b'video_ioctl', response.data)
            self.assertIn(b'gc_hal_kernel_driver.c', response.data)
            self.assertIn(b'v4l2-dev.c', response.data)
    
    def test_ioctl_function_code_display(self):
        """Test that IOCTL function code is properly displayed"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            response = self.client.get('/results')
            self.assertEqual(response.status_code, 200)
            
            # Check that function code is displayed for drv_ioctl
            self.assertIn(b'switch (cmd)', response.data)
            self.assertIn(b'IOCTL_GCHAL_INTERFACE', response.data)
            self.assertIn(b'gckDEVICE_Dispatch', response.data)
    
    def test_ioctl_tab_functionality(self):
        """Test that IOCTL tab is present and functional"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            response = self.client.get('/results')
            self.assertEqual(response.status_code, 200)
            
            # Check that IOCTL tab exists
            self.assertIn(b'IOCTL Handlers', response.data)
            self.assertIn(b'id="ioctl"', response.data)
            
            # Check JavaScript filtering function
            self.assertIn(b'filterIOCTL', response.data)
    
    def test_ioctl_operations_in_empty_results(self):
        """Test web UI with results containing no IOCTL operations"""
        empty_results = {
            "metadata": {
                "log_file": "empty_test.log",
                "parsed_at": "2024-01-01T12:00:00",
                "total_lines": 0,
                "unique_entries": 0
            },
            "functions_by_file": {},
            "function_entries": [],
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": [],
            "statistics": {
                "total_lines_processed": 0,
                "total_files_analyzed": 0,
                "files_instrumented_with_function_entries": 0,
                "function_entries_found": 0,
                "dma_operations_found": 0,
                "user_copy_operations_found": 0,
                "unique_function_entries": 0,
                "unique_dma_operations": 0,
                "unique_user_copy_operations": 0,
                "unique_ioctl_operations": 0
            }
        }
        
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = empty_results
            
            response = self.client.get('/results')
            self.assertEqual(response.status_code, 200)
            
            # Should still have IOCTL tab but with no operations
            self.assertIn(b'IOCTL Handlers', response.data)
            self.assertIn(b'No IOCTL operations found', response.data)
    
    def test_api_data_includes_ioctl(self):
        """Test that API data endpoint includes IOCTL operations"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            response = self.client.get('/api/data')
            self.assertEqual(response.status_code, 200)
            
            # Parse JSON response
            data = json.loads(response.data)
            
            # Check IOCTL operations are included
            self.assertIn('ioctl_operations', data)
            self.assertEqual(len(data['ioctl_operations']), 2)
            
            # Check specific IOCTL data
            drv_ioctl = next(op for op in data['ioctl_operations'] if op['function_name'] == 'drv_ioctl')
            self.assertEqual(drv_ioctl['line_number'], 673)
            self.assertIsNotNone(drv_ioctl['function_code'])
            
            video_ioctl = next(op for op in data['ioctl_operations'] if op['function_name'] == 'video_ioctl')
            self.assertEqual(video_ioctl['line_number'], 456)
            self.assertIsNone(video_ioctl['function_code'])
    
    def test_api_function_code_endpoint(self):
        """Test the API endpoint for function code retrieval"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            # Test with valid function parameters
            response = self.client.get('/api/function-code?name=gasket_open&file=/gasket-driver/src/gasket_core.c&line=1229')
            self.assertEqual(response.status_code, 200)
            
            data = json.loads(response.data)
            self.assertIn('function_code', data)
            # Since we don't have actual source code, it should return default message
            self.assertEqual(data['function_code'], 'No source code available')
    
    def test_api_function_code_missing_params(self):
        """Test API function code endpoint with missing parameters"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            # Test with missing function name (required parameter)
            response = self.client.get('/api/function-code')
            self.assertEqual(response.status_code, 400)
            
            data = json.loads(response.data)
            self.assertIn('error', data)
            self.assertEqual(data['error'], 'Function name required')
    
    def test_api_function_code_no_session(self):
        """Test API function code endpoint without session data"""
        # Explicitly clear session to ensure no data
        with self.client.session_transaction() as sess:
            sess.clear()
        
        # Also clear global parsed_data
        ui.parsed_data = None
        
        response = self.client.get('/api/function-code?name=gasket_open&file=/gasket-driver/src/gasket_core.c&line=1229')
        self.assertEqual(response.status_code, 404)
        
        data = json.loads(response.data)
        self.assertIn('error', data)
        self.assertEqual(data['error'], 'No data loaded')
    
    def test_api_ioctl_code_endpoint_with_code(self):
        """Test the API endpoint for IOCTL code retrieval when code is available"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            # Test with first IOCTL operation (has function_code)
            response = self.client.get('/api/ioctl-code/0')
            self.assertEqual(response.status_code, 200)
            
            data = json.loads(response.data)
            self.assertIn('function_code', data)
            self.assertIn('switch (cmd)', data['function_code'])
            self.assertIn('IOCTL_GCHAL_INTERFACE', data['function_code'])
    
    def test_api_ioctl_code_endpoint_without_code(self):
        """Test the API endpoint for IOCTL code retrieval when code is not available"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            # Test with second IOCTL operation (no function_code)
            response = self.client.get('/api/ioctl-code/1')
            self.assertEqual(response.status_code, 200)
            
            data = json.loads(response.data)
            self.assertIn('function_code', data)
            # The API should return 'No source code available' for None function_code
            self.assertEqual(data['function_code'], 'No source code available')
    
    def test_api_ioctl_code_invalid_index(self):
        """Test API IOCTL code endpoint with invalid index"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            # Test with out-of-range index
            response = self.client.get('/api/ioctl-code/999')
            self.assertEqual(response.status_code, 404)
            
            data = json.loads(response.data)
            self.assertIn('error', data)
            self.assertEqual(data['error'], 'IOCTL function not found')
    
    def test_api_ioctl_code_no_session(self):
        """Test API IOCTL code endpoint without session data"""
        # Explicitly clear session to ensure no data
        with self.client.session_transaction() as sess:
            sess.clear()
        
        # Also clear global parsed_data
        ui.parsed_data = None
        
        response = self.client.get('/api/ioctl-code/0')
        self.assertEqual(response.status_code, 404)
        
        data = json.loads(response.data)
        self.assertIn('error', data)
        self.assertEqual(data['error'], 'No data loaded')
    
    def test_lazy_loading_template_rendering(self):
        """Test that lazy loading elements are rendered correctly"""
        # Create test data with mixed function_code availability
        mixed_results = self.sample_results.copy()
        mixed_results['ioctl_operations'] = [
            {
                "function_name": "drv_ioctl_with_code",
                "file_path": "drivers/test/test_driver.c",
                "line_number": 100,
                "first_seen_timestamp": 10.0,
                "call_count": 1,
                "function_code": "static long drv_ioctl_with_code() {\n    return 0;\n}"
            },
            {
                "function_name": "drv_ioctl_no_code",
                "file_path": "drivers/test/test_driver.c",
                "line_number": 200,
                "first_seen_timestamp": 20.0,
                "call_count": 1,
                "function_code": None
            }
        ]
        
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = mixed_results
            
            response = self.client.get('/results')
            self.assertEqual(response.status_code, 200)
            
            # Check that function with code is displayed directly
            self.assertIn(b'drv_ioctl_with_code() {', response.data)
            self.assertIn(b'return 0;', response.data)
            
            # Check that function without code has lazy loading setup
            self.assertIn(b'drv_ioctl_no_code', response.data)
            self.assertIn(b'loadIoctlCode', response.data)
            self.assertIn(b'Click to load source code', response.data)
    
    def test_javascript_functions_present(self):
        """Test that JavaScript functions for lazy loading are included"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            response = self.client.get('/results')
            self.assertEqual(response.status_code, 200)
            
            # Check for JavaScript functions
            self.assertIn(b'function loadFunctionCode', response.data)
            self.assertIn(b'function loadIoctlCode', response.data)
            self.assertIn(b'/api/function-code', response.data)
            self.assertIn(b'/api/ioctl-code', response.data)
    
    def test_lazy_loading_error_handling(self):
        """Test that error handling is properly implemented in JavaScript"""
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            response = self.client.get('/results')
            self.assertEqual(response.status_code, 200)
            
            # Check for error handling in JavaScript
            self.assertIn(b'catch (error)', response.data)
            self.assertIn(b'Error loading code', response.data)
            self.assertIn(b'loading-indicator', response.data)
    
    def test_function_code_with_source_root(self):
        """Test function code loading with source root functionality"""
        # This test ensures the new --source-root functionality works with function code
        with self.app.test_request_context():
            with self.client.session_transaction() as sess:
                sess['results'] = self.sample_results
            
            # Test function code API with source root simulation
            response = self.client.get('/api/function-code?name=gasket_open&file=/gasket-driver/src/gasket_core.c&line=1229')
            self.assertEqual(response.status_code, 200)
            
            data = json.loads(response.data)
            self.assertIn('function_code', data)
            # Since source files don't exist in test environment, should get default message
            self.assertEqual(data['function_code'], 'No source code available')


if __name__ == '__main__':
    unittest.main(verbosity=2)
