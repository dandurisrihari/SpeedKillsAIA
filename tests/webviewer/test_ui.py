#!/usr/bin/env python3
"""
Comprehensive tests for webviewer UI module
"""

import unittest
import sys
import json
import tempfile
from pathlib import Path
from unittest.mock import patch, MagicMock, mock_open

# Add the src directory to Python path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))

try:
    from src.webviewer.ui import create_app, load_data, start_web_ui
    FLASK_AVAILABLE = True
except ImportError:
    FLASK_AVAILABLE = False
    

class TestWebviewerUI(unittest.TestCase):
    """Test webviewer UI functionality"""
    
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
                    "function_name": "test_function",
                    "file_path": "test.c",
                    "line_number": 10,
                    "first_seen_timestamp": 1000.0,
                    "first_seen_time_str": "10:00:00",
                    "entry_type": "function_entry",
                    "function_code": "void test_function() { return; }",
                    "call_count": 1
                }
            ],
            "dma_operations": [
                {
                    "dma_function": "dma_map_page",
                    "caller_function": "test_driver",
                    "file_path": "driver.c",
                    "line_number": 20,
                    "first_seen_timestamp": 2000.0,
                    "first_seen_time_str": "20:00:00",
                    "function_code": "void test_driver() { dma_map_page(); }",
                    "call_count": 1,
                    "stack_trace": []
                }
            ],
            "user_copy_operations": [
                {
                    "copy_function": "copy_from_user",
                    "caller_function": "device_read",
                    "file_path": "device.c",
                    "line_number": 30,
                    "first_seen_timestamp": 3000.0,
                    "first_seen_time_str": "30:00:00",
                    "function_code": "int device_read() { copy_from_user(); }",
                    "call_count": 1
                }
            ],
            "ioctl_operations": [
                {
                    "function_name": "device_ioctl",
                    "file_path": "device.c",
                    "line_number": 40,
                    "first_seen_timestamp": 4000.0,
                    "first_seen_time_str": "40:00:00",
                    "function_code": "long device_ioctl() { return 0; }",
                    "call_count": 1
                }
            ],
            "statistics": {
                "unique_function_entries": 1,
                "unique_dma_operations": 1,
                "unique_user_copy_operations": 1,
                "unique_ioctl_operations": 1
            }
        }

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_create_app(self):
        """Test Flask app creation"""
        app = create_app()
        self.assertIsNotNone(app)
        self.assertEqual(app.config['SECRET_KEY'], 'kernel-log-parser-secret-key')

    def test_load_data_valid_file(self):
        """Test loading valid JSON data"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(self.test_json_data, f)
            json_file = f.name
        
        try:
            result = load_data(json_file)
            self.assertTrue(result)
            # Check that data was loaded into global variable
            from src.webviewer.ui import parsed_data
            self.assertEqual(parsed_data['metadata']['parser_version'], '2.0.0')
        finally:
            Path(json_file).unlink()

    def test_load_data_nonexistent_file(self):
        """Test loading nonexistent file"""
        result = load_data("nonexistent.json")
        self.assertFalse(result)

    def test_load_data_invalid_json(self):
        """Test loading invalid JSON file"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            f.write("invalid json content")
            json_file = f.name
        
        try:
            result = load_data(json_file)
            self.assertFalse(result)
        finally:
            Path(json_file).unlink()

    def test_load_data_none_input(self):
        """Test loading with None input"""
        result = load_data(None)
        self.assertFalse(result)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_app_routes_exist(self):
        """Test that required routes exist"""
        app = create_app()
        with app.test_client() as client:
            # Test main routes (they might redirect but should not 404)
            response = client.get('/')
            self.assertNotEqual(response.status_code, 404)
            
            response = client.get('/upload')
            self.assertNotEqual(response.status_code, 404)
            
            # API routes should exist
            response = client.get('/api/status')
            self.assertNotEqual(response.status_code, 404)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available") 
    def test_api_status_endpoint(self):
        """Test API status endpoint"""
        app = create_app()
        with app.test_client() as client:
            response = client.get('/api/status')
            self.assertEqual(response.status_code, 200)
            
            data = json.loads(response.data)
            self.assertIn('updated', data)
            self.assertIn('timestamp', data)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_api_data_endpoint_no_data(self):
        """Test API data endpoint with no data loaded"""
        app = create_app()
        with app.test_client() as client:
            response = client.get('/api/data')
            self.assertEqual(response.status_code, 404)
            
            data = json.loads(response.data)
            self.assertIn('error', data)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_api_function_code_endpoint_no_data(self):
        """Test function code API endpoint with no data"""
        app = create_app()
        with app.test_client() as client:
            response = client.get('/api/function-code?name=test_func&file=test.c&line=10')
            self.assertEqual(response.status_code, 404)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_api_function_code_missing_params(self):
        """Test function code API endpoint with missing parameters"""
        app = create_app()
        with app.test_client() as client:
            response = client.get('/api/function-code')
            self.assertEqual(response.status_code, 400)

    @patch('src.webviewer.ui.app.run')
    @patch('webbrowser.open')
    @patch('threading.Timer')
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_start_web_ui_with_data(self, mock_timer, mock_browser, mock_app_run):
        """Test starting web UI with valid data"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(self.test_json_data, f)
            json_file = f.name
        
        try:
            # Mock app.run to prevent hanging
            mock_app_run.return_value = None
            
            result = start_web_ui(json_file=json_file, port=5000, host='127.0.0.1', auto_open=True)
            self.assertTrue(result)
            
            # Verify app.run was called with correct parameters
            mock_app_run.assert_called_once_with(host='127.0.0.1', port=5000, debug=False)
        finally:
            Path(json_file).unlink()

    @patch('src.webviewer.ui.app.run')
    @patch('webbrowser.open')
    @patch('threading.Timer')
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_start_web_ui_no_auto_open(self, mock_timer, mock_browser, mock_app_run):
        """Test starting web UI without auto-opening browser"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(self.test_json_data, f)
            json_file = f.name
        
        try:
            # Mock app.run to prevent hanging
            mock_app_run.return_value = None
            
            result = start_web_ui(json_file=json_file, auto_open=False)
            self.assertTrue(result)
            
            # Browser should not be opened
            mock_timer.assert_not_called()
            
            # Verify app.run was called
            mock_app_run.assert_called_once_with(host='127.0.0.1', port=5000, debug=False)
        finally:
            Path(json_file).unlink()

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_start_web_ui_invalid_file(self):
        """Test starting web UI with invalid file"""
        result = start_web_ui(json_file="nonexistent.json")
        self.assertFalse(result)

    @patch('src.webviewer.ui.app.run')
    @patch('pathlib.Path.glob')
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_start_web_ui_auto_detect(self, mock_glob, mock_app_run):
        """Test starting web UI with auto-detect"""
        # Mock finding a JSON file
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(self.test_json_data, f)
            json_file = f.name
        
        try:
            mock_glob.return_value = [Path(json_file)]
            mock_app_run.return_value = None
            
            with patch('src.webviewer.ui.webbrowser.open') as mock_browser:
                result = start_web_ui(json_file=None)
                self.assertTrue(result)
                
                # Verify app.run was called
                mock_app_run.assert_called_once()
        finally:
            Path(json_file).unlink()

    @patch('pathlib.Path.glob', return_value=[])
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_start_web_ui_auto_detect_no_files(self, mock_glob):
        """Test auto-detect when no JSON files found"""
        result = start_web_ui(json_file=None)
        self.assertFalse(result)


class TestWebviewerUINoFlask(unittest.TestCase):
    """Test webviewer UI when Flask is not available"""
    
    @patch('src.webviewer.ui.FLASK_AVAILABLE', False)
    def test_import_error_handling(self):
        """Test handling when Flask is not available"""
        with self.assertRaises(ImportError):
            from src.webviewer.ui import create_app
            create_app()


if __name__ == '__main__':
    unittest.main()
