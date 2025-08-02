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

from preprocess.web.ui import create_app


class TestWebUI(unittest.TestCase):
    """Test cases for the web UI"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.app = create_app()
        self.app.config['TESTING'] = True
        self.client = self.app.test_client()
        
        # Sample data for testing
        self.sample_results = {
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
            "statistics": {
                "total_lines_processed": 100,
                "total_files_analyzed": 3,
                "files_instrumented_with_function_entries": 2,
                "function_entries_found": 1,
                "dma_operations_found": 1,
                "user_copy_operations_found": 1
            }
        }
    
    def create_temp_json_file(self, data):
        """Create a temporary JSON file with test data"""
        temp_file = tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.json')
        json.dump(data, temp_file, indent=2)
        temp_file.flush()
        temp_file.close()
        return temp_file.name
    
    def test_index_route(self):
        """Test the index route"""
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Kernel Log Parser Results', response.data)
    
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
    
    @patch('preprocess.web.ui.session', {'results': 'sample_results'})
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
    
    @patch('preprocess.web.ui.session', {'results': 'sample_results'})
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
        response = self.client.get('/api/data')
        self.assertEqual(response.status_code, 404)
    
    def test_static_file_serving(self):
        """Test that static files are served correctly"""
        # This would test CSS/JS files if they exist
        # For now just verify the static folder is configured
        self.assertIsNotNone(self.app.static_folder)


if __name__ == '__main__':
    unittest.main(verbosity=2)
