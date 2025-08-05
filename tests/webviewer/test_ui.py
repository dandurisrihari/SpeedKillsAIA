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
        # Reset global parsed_data before each test
        if FLASK_AVAILABLE:
            import src.webviewer.ui
            src.webviewer.ui.parsed_data = None
            
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
            },
            "memory_info": {
                "reserved_memory": [
                    {
                        "start_address": "0x00000000c4000000",
                        "end_address": "0x00000000ffffffff",
                        "size_kb": 983040,
                        "size_readable": "960 MiB",
                        "name": "linux,cma",
                        "memory_type": "CMA",
                        "compatible_id": "linux,cma",
                        "mapping_type": "reusable",
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    },
                    {
                        "start_address": "0x0000000094300000",
                        "end_address": "0x00000000943fffff",
                        "size_kb": 1024,
                        "size_readable": "1 MiB",
                        "name": "dma_pool",
                        "memory_type": "DMA",
                        "compatible_id": None,
                        "mapping_type": "nomap",
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    }
                ],
                "memory_zones": [
                    {
                        "zone_name": "DMA",
                        "start_address": "0x0000000040000000",
                        "end_address": "0x00000000ffffffff",
                        "status": "active",
                        "unavailable_pages": None,
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    },
                    {
                        "zone_name": "Normal",
                        "start_address": None,
                        "end_address": None,
                        "status": "empty",
                        "unavailable_pages": 128,
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    }
                ],
                "memory_nodes": [
                    {
                        "node_id": 0,
                        "start_address": "0x0000000040000000",
                        "end_address": "0x0000000055ffffff",
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    }
                ],
                "total_reserved_memory_kb": 984064,
                "cma_pools": [
                    {
                        "start_address": "0x00000000c4000000",
                        "end_address": "0x00000000ffffffff",
                        "size_kb": 983040,
                        "size_readable": "960 MiB",
                        "name": "linux,cma",
                        "memory_type": "CMA",
                        "compatible_id": "linux,cma",
                        "mapping_type": "reusable",
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    }
                ],
                "dma_pools": [
                    {
                        "start_address": "0x0000000094300000",
                        "end_address": "0x00000000943fffff",
                        "size_kb": 1024,
                        "size_readable": "1 MiB",
                        "name": "dma_pool",
                        "memory_type": "DMA",
                        "compatible_id": None,
                        "mapping_type": "nomap",
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    }
                ],
                "summary": {
                    "total_reserved_entries": 2,
                    "total_zones": 2,
                    "total_nodes": 1,
                    "total_cma_pools": 1,
                    "total_dma_pools": 1
                }
            }
        }
        
        # Create a complete test data structure with functions_by_file for tests that need it
        self.complete_test_data = self.test_json_data.copy()
        self.complete_test_data['functions_by_file'] = {
            'test.c': self.complete_test_data['function_entries']
        }

    def tearDown(self):
        """Clean up after each test"""
        # Reset global parsed_data after each test
        if FLASK_AVAILABLE:
            import src.webviewer.ui
            src.webviewer.ui.parsed_data = None

    def _set_global_test_data(self, data=None):
        """Helper method to set global parsed_data correctly"""
        if FLASK_AVAILABLE:
            import src.webviewer.ui
            src.webviewer.ui.parsed_data = data or self.complete_test_data

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

    # Memory Information Tests
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_tab_in_ui(self):
        """Test memory tab is present in the UI"""
        app = create_app()
        # Set test data
        self._set_global_test_data()
        
        with app.test_client() as client:
            response = client.get('/')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            # Check for memory tab
            self.assertIn('🧠 Memory Info', content)
            self.assertIn('onclick="showTab(\'memory\')"', content)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_statistics_display(self):
        """Test memory statistics are displayed in stats grid"""
        app = create_app()
        self._set_global_test_data()
        
        with app.test_client() as client:
            response = client.get('/')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            # Check for memory statistics
            self.assertIn('Reserved Memory', content)
            self.assertIn('CMA Pools', content)
            self.assertIn('Memory Zones', content)
            self.assertIn('Memory Nodes', content)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_content_display(self):
        """Test memory content sections are displayed"""
        app = create_app()
        self._set_global_test_data()
        
        with app.test_client() as client:
            response = client.get('/')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            # Check for memory content sections
            self.assertIn('id="memory"', content)
            self.assertIn('Memory Information', content)
            self.assertIn('Reserved Memory Entries', content)
            self.assertIn('Memory Zones', content)
            self.assertIn('Memory Nodes', content)
            # Check specific memory data
            self.assertIn('linux,cma', content)
            self.assertIn('960 MiB', content)
            self.assertIn('CMA', content)
            self.assertIn('DMA', content)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_api_endpoint(self):
        """Test memory info API endpoint"""
        app = create_app()
        
        with app.test_client() as client:
            # Test with session data
            with client.session_transaction() as sess:
                sess['results'] = self.test_json_data
                
            response = client.get('/api/memory-info')
            self.assertEqual(response.status_code, 200)
            
            data = json.loads(response.data)
            self.assertIn('reserved_memory', data)
            self.assertIn('memory_zones', data)
            self.assertIn('memory_nodes', data)
            self.assertIn('summary', data)
            
            # Verify specific memory data
            self.assertEqual(len(data['reserved_memory']), 2)
            self.assertEqual(len(data['memory_zones']), 2)
            self.assertEqual(len(data['memory_nodes']), 1)
            self.assertEqual(data['summary']['total_cma_pools'], 1)
            self.assertEqual(data['summary']['total_dma_pools'], 1)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available") 
    def test_memory_api_endpoint_no_data(self):
        """Test memory info API endpoint with no data"""
        app = create_app()
        
        with app.test_client() as client:
            response = client.get('/api/memory-info')
            self.assertEqual(response.status_code, 404)
            
            data = json.loads(response.data)
            self.assertIn('error', data)
            self.assertEqual(data['error'], 'No data loaded')

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_api_endpoint_no_memory_info(self):
        """Test memory info API endpoint with data but no memory info"""
        app = create_app()
        
        # Create test data without memory_info
        test_data_no_memory = self.test_json_data.copy()
        del test_data_no_memory['memory_info']
        
        with app.test_client() as client:
            with client.session_transaction() as sess:
                sess['results'] = test_data_no_memory
                
            response = client.get('/api/memory-info')
            self.assertEqual(response.status_code, 404)
            
            data = json.loads(response.data)
            self.assertIn('error', data)
            self.assertEqual(data['error'], 'No memory information available')

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_tab_styling(self):
        """Test memory tab styling classes are present"""
        app = create_app()
        self._set_global_test_data()
        
        with app.test_client() as client:
            response = client.get('/')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            # Check for memory-specific CSS classes
            self.assertIn('memory-tab', content)
            self.assertIn('memory-grid', content)
            self.assertIn('memory-item', content)
            self.assertIn('memory-type-badge', content)
            self.assertIn('zone-badge', content)
            self.assertIn('node-badge', content)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_javascript_functions(self):
        """Test memory-related JavaScript functions are present"""
        app = create_app()
        self._set_global_test_data()
        
        with app.test_client() as client:
            response = client.get('/')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            # Check for memory JavaScript function
            self.assertIn('function showMemoryTab', content)
            self.assertIn('memory-tab-content', content)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_empty_state(self):
        """Test memory section displays empty state when no memory info"""
        app = create_app()
        
        # Create test data without memory_info
        test_data_no_memory = self.test_json_data.copy()
        del test_data_no_memory['memory_info']
        
        # Add functions_by_file structure that the template expects
        test_data_no_memory['functions_by_file'] = {
            'test.c': test_data_no_memory['function_entries']
        }
        
        # Set the global parsed_data, not app.parsed_data
        import src.webviewer.ui
        src.webviewer.ui.parsed_data = test_data_no_memory
        
        with app.test_client() as client:
            response = client.get('/')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            # Should still have memory tab but show empty state
            self.assertIn('🧠 Memory Info', content)
            self.assertIn('No memory information available in the parsed data', content)


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
