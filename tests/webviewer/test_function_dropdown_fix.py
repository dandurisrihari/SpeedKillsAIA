#!/usr/bin/env python3
"""
Tests for function dropdown functionality fixes

This test suite ensures that:
1. Function dropdown populates correctly with both data structures
2. API endpoints work properly for function code retrieval
3. Data structure compatibility is maintained
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
    from src.webviewer import create_app, load_data
    FLASK_AVAILABLE = True
except ImportError:
    FLASK_AVAILABLE = False


class TestFunctionDropdownFix(unittest.TestCase):
    """Test cases for function dropdown fixes"""
    
    def setUp(self):
        """Set up test fixtures"""
        # Test data with functions_by_file structure (like test_data.json)
        self.test_data_functions_by_file = {
            "metadata": {
                "log_file": "test_log.log",
                "analysis_timestamp": "2025-08-05T10:00:00Z",
                "total_lines": 100
            },
            "statistics": {
                "unique_function_entries": 2,
                "unique_dma_operations": 1,
                "unique_user_copy_operations": 1,
                "unique_ioctl_operations": 1,
                "total_files": 1,
                "files_need_analysis": 1,
                "files_instrumented_with_function_entries": 0
            },
            "functions_by_file": {
                "/test/driver.c": [
                    {
                        "function_name": "test_function",
                        "line_number": 42,
                        "first_seen_time_str": "2025-08-05 10:00:00",
                        "call_count": 5,
                        "function_code": "int test_function(void) {\n    // Test function\n    return 0;\n}"
                    },
                    {
                        "function_name": "another_function", 
                        "line_number": 100,
                        "first_seen_time_str": "2025-08-05 10:01:00",
                        "call_count": 3,
                        "function_code": "void another_function(void) {\n    // Another test function\n}"
                    }
                ]
            }
        }
        
        # Test data with function_entries structure (flat)
        self.test_data_function_entries = {
            "metadata": {
                "log_file": "test_log.log",
                "analysis_timestamp": "2025-08-05T10:00:00Z",
                "total_lines": 100
            },
            "statistics": {
                "unique_function_entries": 2,
                "unique_dma_operations": 1,
                "unique_user_copy_operations": 1,
                "unique_ioctl_operations": 1,
                "total_files": 1,
                "files_need_analysis": 1,
                "files_instrumented_with_function_entries": 0
            },
            "function_entries": [
                {
                    "function_name": "test_function",
                    "file_path": "/test/driver.c",
                    "line_number": 42,
                    "first_seen_time_str": "2025-08-05 10:00:00",
                    "call_count": 5,
                    "function_code": "int test_function(void) {\n    // Test function\n    return 0;\n}"
                },
                {
                    "function_name": "another_function",
                    "file_path": "/test/driver.c", 
                    "line_number": 100,
                    "first_seen_time_str": "2025-08-05 10:01:00",
                    "call_count": 3,
                    "function_code": "void another_function(void) {\n    // Another test function\n}"
                }
            ]
        }

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_api_data_returns_both_structures(self):
        """Test that /api/data endpoint returns both function_entries and functions_by_file"""
        app = create_app()
        app.parsed_data = self.test_data_functions_by_file.copy()
        
        with app.test_client() as client:
            response = client.get('/api/data')
            self.assertEqual(response.status_code, 200)
            
            data = response.get_json()
            
            # Should have both structures
            self.assertIn('functions_by_file', data)
            self.assertIn('function_entries', data)
            
            # function_entries should be created from functions_by_file
            function_entries = data['function_entries']
            self.assertEqual(len(function_entries), 2)
            
            # Verify function entries have file_path
            for func in function_entries:
                self.assertIn('file_path', func)
                self.assertEqual(func['file_path'], '/test/driver.c')

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_api_data_creates_functions_by_file_from_function_entries(self):
        """Test that /api/data creates functions_by_file from function_entries"""
        app = create_app()
        app.parsed_data = self.test_data_function_entries.copy()
        
        with app.test_client() as client:
            response = client.get('/api/data')
            self.assertEqual(response.status_code, 200)
            
            data = response.get_json()
            
            # Should have both structures
            self.assertIn('functions_by_file', data)
            self.assertIn('function_entries', data)
            
            # functions_by_file should be created from function_entries
            functions_by_file = data['functions_by_file']
            self.assertIn('/test/driver.c', functions_by_file)
            self.assertEqual(len(functions_by_file['/test/driver.c']), 2)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_function_code_api_with_functions_by_file(self):
        """Test /api/function-code endpoint with functions_by_file structure"""
        app = create_app()
        app.parsed_data = self.test_data_functions_by_file.copy()
        
        with app.test_client() as client:
            # Test successful function code retrieval
            response = client.get('/api/function-code?name=test_function&file=/test/driver.c&line=42')
            self.assertEqual(response.status_code, 200)
            
            data = response.get_json()
            self.assertEqual(data['function_name'], 'test_function')
            self.assertIn('int test_function(void)', data['function_code'])
            self.assertEqual(data['file_path'], '/test/driver.c')
            self.assertEqual(data['line_number'], 42)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_function_code_api_with_function_entries(self):
        """Test /api/function-code endpoint with function_entries structure"""
        app = create_app()
        app.parsed_data = self.test_data_function_entries.copy()
        
        with app.test_client() as client:
            # Test successful function code retrieval
            response = client.get('/api/function-code?name=test_function&file=/test/driver.c&line=42')
            self.assertEqual(response.status_code, 200)
            
            data = response.get_json()
            self.assertEqual(data['function_name'], 'test_function')
            self.assertIn('int test_function(void)', data['function_code'])
            self.assertEqual(data['file_path'], '/test/driver.c')
            self.assertEqual(data['line_number'], 42)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_function_code_api_missing_parameters(self):
        """Test /api/function-code endpoint error handling"""
        app = create_app()
        app.parsed_data = self.test_data_functions_by_file.copy()
        
        with app.test_client() as client:
            # Test missing function name
            response = client.get('/api/function-code')
            self.assertEqual(response.status_code, 400)
            
            data = response.get_json()
            self.assertIn('error', data)
            self.assertIn('Function name required', data['error'])

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_function_code_api_function_not_found(self):
        """Test /api/function-code endpoint when function is not found"""
        app = create_app()
        app.parsed_data = self.test_data_functions_by_file.copy()
        
        with app.test_client() as client:
            # Test non-existent function
            response = client.get('/api/function-code?name=nonexistent_function')
            self.assertEqual(response.status_code, 404)
            
            data = response.get_json()
            self.assertIn('error', data)
            self.assertIn('Function not found', data['error'])

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_function_code_api_no_data_loaded(self):
        """Test /api/function-code endpoint when no data is loaded"""
        app = create_app()
        # Clear all global data sources
        import src.webviewer.ui as webviewer_ui
        webviewer_ui.parsed_data = None
        webviewer_ui.global_data = None
        
        with app.test_client() as client:
            response = client.get('/api/function-code?name=test_function')
            self.assertEqual(response.status_code, 404)
            
            data = response.get_json()
            self.assertIn('error', data)
            self.assertIn('No data loaded', data['error'])

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_backward_compatibility_both_structures(self):
        """Test that both data structures can coexist and work properly"""
        # Start with functions_by_file only
        data_with_functions_by_file = self.test_data_functions_by_file.copy()
        
        app = create_app()
        app.parsed_data = data_with_functions_by_file
        
        with app.test_client() as client:
            # /api/data should create function_entries from functions_by_file
            response = client.get('/api/data')
            self.assertEqual(response.status_code, 200)
            
            api_data = response.get_json()
            self.assertIn('function_entries', api_data)
            self.assertIn('functions_by_file', api_data)
            
            # Both should work for function code lookup
            response = client.get('/api/function-code?name=test_function&file=/test/driver.c')
            self.assertEqual(response.status_code, 200)
            
            # Verify the response has correct data
            func_data = response.get_json()
            self.assertEqual(func_data['function_name'], 'test_function')
            self.assertIn('int test_function(void)', func_data['function_code'])

    def test_javascript_function_population_logic(self):
        """Test the logic that JavaScript uses to populate function dropdown"""
        # This simulates what the JavaScript populateFunctionSelect function does
        
        # Test with functions_by_file structure
        data = self.test_data_functions_by_file.copy()
        functions = []
        
        if 'function_entries' in data and data['function_entries']:
            functions = data['function_entries']
        elif 'functions_by_file' in data:
            # Flatten functions_by_file structure
            for file_path, file_functions in data['functions_by_file'].items():
                for func in file_functions:
                    if 'file_path' not in func:
                        func['file_path'] = file_path
                    functions.append(func)
        
        # Should have found 2 functions
        self.assertEqual(len(functions), 2)
        
        # Each function should have the required fields
        for func in functions:
            self.assertIn('function_name', func)
            self.assertIn('file_path', func) 
            self.assertIn('line_number', func)
            self.assertEqual(func['file_path'], '/test/driver.c')


if __name__ == '__main__':
    unittest.main()
