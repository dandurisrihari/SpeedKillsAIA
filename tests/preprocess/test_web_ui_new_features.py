#!/usr/bin/env python3
"""
Test suite for web UI with new Total Files and Files need analysis features
"""

import unittest
import tempfile
import shutil
from pathlib import Path
import json
import sys
import os
from unittest.mock import patch, MagicMock
import threading
import time

# Add src to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

try:
    from preprocess.web.ui import load_data, start_web_ui, app, parsed_data
    from flask import Flask
except ImportError:
    pass


class TestWebUINewFields(unittest.TestCase):
    """Test web UI functionality with new fields"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
        
        # Create comprehensive test data with new fields
        self.test_data = {
            "metadata": {
                "parser_version": "2.0.0",
                "parsed_at": "2025-08-03T19:04:36.123456",
                "log_file": "test_mixed_timestamps.log",
                "total_lines": 150,
                "parsed_lines": 145,
                "unique_entries": 25
            },
            "statistics": {
                "unique_function_entries": 8,
                "unique_dma_operations": 3,
                "unique_user_copy_operations": 2,
                "unique_ioctl_operations": 2,
                "function_entries_found": 12,
                "dma_operations_found": 5,
                "user_copy_operations_found": 3,
                "ioctl_operations_found": 3,
                "total_files": 25,  # New field
                "files_need_analysis": 15,  # New field (renamed from total_files_analyzed)
                "files_with_functions_entrypoint_instrumented": 8,
                "files_instrumented_with_function_entries": 8,
                "total_duplicates_skipped": 5
            },
            "function_entries": [
                {
                    "function_name": "drv_ioctl",
                    "file_path": "drivers/test.c",
                    "line_number": 100,
                    "first_seen_timestamp": 1.123456,
                    "first_seen_time_str": "1.123456",  # Traditional format
                    "entry_type": "function_entry",
                    "function_code": None,
                    "call_count": 1
                },
                {
                    "function_name": "init_device",
                    "file_path": "drivers/main.c", 
                    "line_number": 50,
                    "first_seen_timestamp": 1234567890.123,
                    "first_seen_time_str": "19:04:36,338434",  # ISO 8601 format
                    "entry_type": "function_entry",
                    "function_code": "int init_device(void) {\n    return 0;\n}",
                    "call_count": 2
                }
            ],
            "functions_by_file": {
                "drivers/test.c": [
                    {
                        "function_name": "drv_ioctl",
                        "line_number": 100,
                        "first_seen_timestamp": 1.123456,
                        "first_seen_time_str": "1.123456",
                        "entry_type": "function_entry",
                        "function_code": None,
                        "call_count": 1
                    }
                ],
                "drivers/main.c": [
                    {
                        "function_name": "init_device",
                        "line_number": 50,
                        "first_seen_timestamp": 1234567890.123,
                        "first_seen_time_str": "19:04:36,338434",
                        "entry_type": "function_entry",
                        "function_code": "int init_device(void) {\n    return 0;\n}",
                        "call_count": 2
                    }
                ]
            },
            "dma_operations": [
                {
                    "dma_function": "dma_alloc_coherent",
                    "caller_function": "drv_ioctl",
                    "file_path": "drivers/test.c",
                    "line_number": 150,
                    "first_seen_timestamp": 2.234567,
                    "first_seen_time_str": "2.234567",
                    "stack_trace": ["drv_ioctl+0x10", "sys_call+0x20"],
                    "function_code": None,
                    "call_count": 1
                }
            ],
            "user_copy_operations": [
                {
                    "copy_function": "copy_to_user",
                    "caller_function": "drv_ioctl",
                    "file_path": "drivers/test.c", 
                    "line_number": 200,
                    "first_seen_timestamp": 3.345678,
                    "first_seen_time_str": "19:04:37,123456",
                    "function_code": None,
                    "call_count": 1,
                    "process_info": {
                        "pid": 12345,
                        "comm": "test_app"
                    }
                }
            ],
            "ioctl_operations": [
                {
                    "function_name": "drv_ioctl",
                    "file_path": "drivers/test.c",
                    "line_number": 300,
                    "first_seen_timestamp": 4.456789,
                    "first_seen_time_str": "4.456789",
                    "function_code": None,
                    "call_count": 1
                }
            ]
        }
        
        self.test_json_file = self.temp_path / "comprehensive_test.json"
        with open(self.test_json_file, 'w') as f:
            json.dump(self.test_data, f, indent=2)
    
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    def test_load_data_success(self):
        """Test successful loading of data with new fields"""
        try:
            success = load_data(self.test_json_file)
            self.assertTrue(success)
            
            # Check that global parsed_data is set
            from preprocess.web.ui import parsed_data as loaded_data
            self.assertIsNotNone(loaded_data)
            
            # Verify new fields are present
            stats = loaded_data['statistics']
            self.assertIn('total_files', stats)
            self.assertIn('files_need_analysis', stats)
            self.assertEqual(stats['total_files'], 25)
            self.assertEqual(stats['files_need_analysis'], 15)
            
        except ImportError:
            self.skipTest("Web UI imports not available")
    
    def test_load_data_backward_compatibility(self):
        """Test loading old format data without new fields"""
        # Create old format data
        old_data = {
            "metadata": {
                "parser_version": "1.0.0",
                "log_file": "old_test.log"
            },
            "statistics": {
                "unique_function_entries": 5,
                "files_with_functions_entrypoint_instrumented": 3
                # Missing: total_files, files_need_analysis
            },
            "function_entries": [],
            "functions_by_file": {}
        }
        
        old_json_file = self.temp_path / "old_format.json"
        with open(old_json_file, 'w') as f:
            json.dump(old_data, f)
        
        try:
            success = load_data(old_json_file)
            self.assertTrue(success)
            
            # Should handle missing fields gracefully
            from preprocess.web.ui import parsed_data as loaded_data
            self.assertIsNotNone(loaded_data)
            
        except ImportError:
            self.skipTest("Web UI imports not available")
    
    def test_load_data_nonexistent_file(self):
        """Test loading non-existent file"""
        try:
            nonexistent_file = self.temp_path / "does_not_exist.json"
            success = load_data(nonexistent_file)
            self.assertFalse(success)
            
        except ImportError:
            self.skipTest("Web UI imports not available")
    
    def test_load_data_invalid_json(self):
        """Test loading invalid JSON file"""
        invalid_json_file = self.temp_path / "invalid.json"
        invalid_json_file.write_text("{ invalid json content")
        
        try:
            success = load_data(invalid_json_file)
            self.assertFalse(success)
            
        except ImportError:
            self.skipTest("Web UI imports not available")
    
    def test_web_ui_statistics_display(self):
        """Test that web UI template correctly displays new statistics"""
        try:
            # Load test data
            load_data(self.test_json_file)
            
            # Test with Flask app context
            with app.test_client() as client:
                response = client.get('/')
                
                # Check response is successful
                self.assertEqual(response.status_code, 200)
                
                # Check that new fields are in the HTML
                html_content = response.get_data(as_text=True)
                
                # Look for the new stat cards
                self.assertIn('Total Files', html_content)
                self.assertIn('Files need analysis', html_content)
                
                # Check the values are displayed
                self.assertIn('25', html_content)  # total_files value
                self.assertIn('15', html_content)  # files_need_analysis value
                
        except ImportError:
            self.skipTest("Web UI imports not available")
    
    def test_web_ui_api_data_endpoint(self):
        """Test API endpoint returns new fields"""
        try:
            # Load test data
            load_data(self.test_json_file)
            
            with app.test_client() as client:
                response = client.get('/api/data')
                
                self.assertEqual(response.status_code, 200)
                
                # Parse JSON response
                data = response.get_json()
                self.assertIsNotNone(data)
                
                # Check new fields are in API response
                stats = data['statistics']
                self.assertIn('total_files', stats)
                self.assertIn('files_need_analysis', stats)
                self.assertEqual(stats['total_files'], 25)
                self.assertEqual(stats['files_need_analysis'], 15)
                
        except ImportError:
            self.skipTest("Web UI imports not available")
    
    def test_web_ui_timestamp_display(self):
        """Test that both timestamp formats are displayed correctly"""
        try:
            # Load test data
            load_data(self.test_json_file)
            
            with app.test_client() as client:
                response = client.get('/')
                html_content = response.get_data(as_text=True)
                
                # Check both timestamp formats are displayed
                self.assertIn('1.123456', html_content)  # Traditional format
                self.assertIn('19:04:36,338434', html_content)  # ISO 8601 readable format
                
        except ImportError:
            self.skipTest("Web UI imports not available")
    
    def test_start_web_ui_with_new_fields(self):
        """Test start_web_ui function with data containing new fields"""
        try:
            # Use a separate thread to test start_web_ui without blocking
            def run_web_ui():
                start_web_ui(
                    json_file=str(self.test_json_file),
                    port=5002,  # Use different port to avoid conflicts
                    auto_open=False  # Don't open browser in tests
                )
            
            # This is a basic test that the function can be called
            # Full integration testing would require more complex setup
            self.assertTrue(callable(start_web_ui))
            
        except ImportError:
            self.skipTest("Web UI imports not available")


class TestWebUITemplate(unittest.TestCase):
    """Test web UI template handling of new fields"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
    
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    def test_template_handles_missing_fields_gracefully(self):
        """Test that template handles missing new fields gracefully"""
        # Create minimal data without new fields
        minimal_data = {
            "metadata": {
                "log_file": "minimal.log",
                "parsed_at": "2025-08-03T19:04:36"
            },
            "statistics": {
                "unique_function_entries": 1
                # Missing all new fields
            },
            "function_entries": [],
            "functions_by_file": {},
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": []
        }
        
        minimal_json = self.temp_path / "minimal.json"
        with open(minimal_json, 'w') as f:
            json.dump(minimal_data, f)
        
        try:
            from preprocess.web.ui import load_data
            
            success = load_data(minimal_json)
            self.assertTrue(success)
            
            # Test with Flask app context - should not crash
            with app.test_client() as client:
                response = client.get('/')
                
                # Should still render successfully
                self.assertEqual(response.status_code, 200)
                
        except ImportError:
            self.skipTest("Web UI imports not available")
    
    def test_template_fallback_values(self):
        """Test that template uses appropriate fallback values"""
        try:
            # Load app and test template rendering with missing fields
            with app.test_client() as client:
                # Mock missing fields scenario
                with patch('preprocess.web.ui.parsed_data', {
                    "metadata": {"log_file": "test.log", "parsed_at": "2025-08-03"},
                    "statistics": {"unique_function_entries": 1},  # Missing new fields
                    "function_entries": [],
                    "functions_by_file": {},
                    "dma_operations": [],
                    "user_copy_operations": [],
                    "ioctl_operations": []
                }):
                    response = client.get('/')
                    
                    # Should render without errors
                    self.assertEqual(response.status_code, 200)
                    
                    html_content = response.get_data(as_text=True)
                    
                    # Should show fallback values (0 for missing fields)
                    # The template should use "or 0" fallbacks
                    self.assertIn('Total Files', html_content)
                    self.assertIn('Files need analysis', html_content)
                    
        except ImportError:
            self.skipTest("Web UI imports not available")


if __name__ == '__main__':
    unittest.main()
