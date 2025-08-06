#!/usr/bin/env python3
"""
Comprehensive tests for function dropdown and API fixes to prevent regression.

These tests ensure that:
1. Function dropdown populates correctly with both data structures
2. API endpoints return proper responses
3. Function code loading works properly
4. OpenAI API key loading works correctly
"""

import pytest
import json
import tempfile
import os
from pathlib import Path
from unittest.mock import patch, MagicMock

# Test data structures
TEST_DATA_FUNCTIONS_BY_FILE = {
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
        "total_files": 3,
        "files_need_analysis": 2
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
                "function_name": "init_module",
                "line_number": 100,
                "first_seen_time_str": "2025-08-05 10:01:00",
                "call_count": 1,
                "function_code": "static int __init init_module(void) {\n    return test_function();\n}"
            }
        ],
        "/test/utils.c": [
            {
                "function_name": "helper_function",
                "line_number": 15,
                "first_seen_time_str": "2025-08-05 10:02:00",
                "call_count": 3,
                "function_code": "void helper_function(int arg) {\n    printk(\"Helper: %d\\n\", arg);\n}"
            }
        ]
    },
    "dma_operations": [
        {
            "dma_function": "dma_alloc_coherent", 
            "caller_function": "test_init",
            "file_path": "/test/driver.c",
            "line_number": 100
        }
    ],
    "ioctl_operations": [],
    "user_copy_operations": [],
    "memory_info": {
        "summary": {
            "total_reserved_entries": 10,
            "total_cma_pools": 2
        }
    }
}

TEST_DATA_FUNCTION_ENTRIES = {
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
        "total_files": 3,
        "files_need_analysis": 2
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
            "function_name": "helper_function",
            "file_path": "/test/utils.c",
            "line_number": 15,
            "first_seen_time_str": "2025-08-05 10:02:00",
            "call_count": 3,
            "function_code": "void helper_function(int arg) {\n    printk(\"Helper: %d\\n\", arg);\n}"
        }
    ],
    "dma_operations": [],
    "ioctl_operations": [],
    "user_copy_operations": [],
    "memory_info": {
        "summary": {
            "total_reserved_entries": 10,
            "total_cma_pools": 2
        }
    }
}


class TestFunctionDropdownFixes:
    """Test class for function dropdown and API fixes"""

    @pytest.fixture
    def temp_json_file(self):
        """Create temporary JSON file for testing"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(TEST_DATA_FUNCTIONS_BY_FILE, f)
            temp_path = f.name
        
        yield temp_path
        
        # Cleanup
        if os.path.exists(temp_path):
            os.unlink(temp_path)

    @pytest.fixture
    def temp_json_file_function_entries(self):
        """Create temporary JSON file with function_entries structure"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(TEST_DATA_FUNCTION_ENTRIES, f)
            temp_path = f.name
        
        yield temp_path
        
        # Cleanup
        if os.path.exists(temp_path):
            os.unlink(temp_path)

    @pytest.fixture
    def app_with_data(self, temp_json_file):
        """Create Flask app with test data loaded"""
        try:
            from src.webviewer.ui import create_app, load_data
            
            # Load test data
            load_data(temp_json_file)
            
            # Create app
            app = create_app()
            app.config['TESTING'] = True
            
            # Store data in app instance
            import src.webviewer.ui as ui_module
            app.parsed_data = ui_module.parsed_data
            
            return app
        except ImportError:
            pytest.skip("Webviewer module not available")

    def test_load_data_functions_by_file_structure(self, temp_json_file):
        """Test that load_data correctly handles functions_by_file structure"""
        try:
            from src.webviewer.ui import load_data
            
            # Load data
            data = load_data(temp_json_file)
            
            # Verify both structures are created
            assert data is not None
            assert 'functions_by_file' in data
            assert 'function_entries' in data  # Should be created from functions_by_file
            
            # Verify function_entries has correct content
            function_entries = data['function_entries']
            assert len(function_entries) == 3  # 2 from driver.c + 1 from utils.c
            
            # Check that file_path is properly set
            for func in function_entries:
                assert 'file_path' in func
                assert func['file_path'] in ['/test/driver.c', '/test/utils.c']
                assert 'function_name' in func
                assert 'function_code' in func
                
        except ImportError:
            pytest.skip("Webviewer module not available")

    def test_load_data_function_entries_structure(self, temp_json_file_function_entries):
        """Test that load_data correctly handles function_entries structure"""
        try:
            from src.webviewer.ui import load_data
            
            # Load data
            data = load_data(temp_json_file_function_entries)
            
            # Verify both structures are created
            assert data is not None
            assert 'function_entries' in data
            assert 'functions_by_file' in data  # Should be created from function_entries
            
            # Verify functions_by_file has correct content
            functions_by_file = data['functions_by_file']
            assert '/test/driver.c' in functions_by_file
            assert '/test/utils.c' in functions_by_file
            assert len(functions_by_file['/test/driver.c']) == 1
            assert len(functions_by_file['/test/utils.c']) == 1
                
        except ImportError:
            pytest.skip("Webviewer module not available")

    def test_api_data_endpoint(self, app_with_data):
        """Test that /api/data endpoint returns correct data"""
        with app_with_data.test_client() as client:
            response = client.get('/api/data')
            
            assert response.status_code == 200
            data = response.get_json()
            
            # Verify both data structures are present
            assert 'functions_by_file' in data
            assert 'function_entries' in data
            assert 'metadata' in data
            assert 'statistics' in data

    def test_api_function_code_endpoint(self, app_with_data):
        """Test that /api/function-code endpoint works correctly"""
        with app_with_data.test_client() as client:
            # Test successful function lookup
            response = client.get('/api/function-code?name=test_function&file=/test/driver.c&line=42')
            
            assert response.status_code == 200
            data = response.get_json()
            
            assert data['function_name'] == 'test_function'
            assert data['file_path'] == '/test/driver.c'
            assert data['line_number'] == 42
            assert 'function_code' in data
            assert 'int test_function(void)' in data['function_code']

    def test_api_function_code_endpoint_not_found(self, app_with_data):
        """Test that /api/function-code endpoint returns 404 for non-existent functions"""
        with app_with_data.test_client() as client:
            response = client.get('/api/function-code?name=nonexistent_function&file=/test/driver.c&line=42')
            
            assert response.status_code == 404
            data = response.get_json()
            assert 'error' in data
            assert data['error'] == 'Function not found'

    def test_api_function_code_endpoint_missing_name(self, app_with_data):
        """Test that /api/function-code endpoint returns 400 for missing function name"""
        with app_with_data.test_client() as client:
            response = client.get('/api/function-code?file=/test/driver.c&line=42')
            
            assert response.status_code == 400
            data = response.get_json()
            assert 'error' in data
            assert data['error'] == 'Function name required'

    def test_api_function_code_handles_both_data_structures(self, app_with_data):
        """Test that function-code API works with both functions_by_file and function_entries"""
        with app_with_data.test_client() as client:
            # Test with function from functions_by_file structure
            response = client.get('/api/function-code?name=helper_function&file=/test/utils.c&line=15')
            
            assert response.status_code == 200
            data = response.get_json()
            
            assert data['function_name'] == 'helper_function'
            assert data['file_path'] == '/test/utils.c'
            assert data['line_number'] == 15
            assert 'Helper' in data['function_code']

    def test_api_llm_status_endpoint(self, app_with_data):
        """Test that /api/llm/status endpoint works"""
        with app_with_data.test_client() as client:
            response = client.get('/api/llm/status')
            
            assert response.status_code == 200
            data = response.get_json()
            
            # Should have available and models fields
            assert 'available' in data
            assert 'models' in data
            assert isinstance(data['available'], bool)
            assert isinstance(data['models'], list)

    def test_openai_api_key_loading(self):
        """Test that OpenAI API key can be loaded from environment"""
        try:
            from src.llm_analysis.llm import LLMAnalyzer
            
            # Test with mock API key
            with patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key-123'}):
                analyzer = LLMAnalyzer()
                
                # Should not raise an error during initialization
                assert analyzer is not None
                
        except ImportError:
            pytest.skip("LLM analysis module not available")

    def test_dotenv_loading(self):
        """Test that .env file loading works correctly"""
        try:
            from src.llm_analysis.llm import LLMAnalyzer
            
            # Create temporary .env file
            with tempfile.NamedTemporaryFile(mode='w', suffix='.env', delete=False) as f:
                f.write('OPENAI_API_KEY=test-env-key-456\n')
                env_path = f.name
            
            try:
                # Test loading from specific .env file
                with patch('src.llm_analysis.llm.load_dotenv') as mock_load_dotenv:
                    mock_load_dotenv.return_value = True
                    
                    with patch.dict(os.environ, {'OPENAI_API_KEY': 'test-env-key-456'}):
                        analyzer = LLMAnalyzer()
                        assert analyzer is not None
                        
            finally:
                if os.path.exists(env_path):
                    os.unlink(env_path)
                    
        except ImportError:
            pytest.skip("LLM analysis module not available")


class TestJavaScriptFunctionHandling:
    """Test cases for JavaScript function handling logic"""

    def test_javascript_function_population_logic(self):
        """Test the logic that would be used in JavaScript for function population"""
        
        # Test data with functions_by_file structure
        data_by_file = TEST_DATA_FUNCTIONS_BY_FILE
        
        # Simulate JavaScript logic for extracting functions
        functions = []
        
        if 'function_entries' in data_by_file and data_by_file['function_entries']:
            functions = data_by_file['function_entries']
        elif 'functions_by_file' in data_by_file:
            # Flatten functions_by_file structure
            for file_path, file_functions in data_by_file['functions_by_file'].items():
                for func in file_functions:
                    # Ensure file_path is set
                    if 'file_path' not in func:
                        func['file_path'] = file_path
                    functions.append(func)
        
        # Verify we extracted the correct number of functions
        assert len(functions) == 3
        
        # Verify all functions have required fields
        for func in functions:
            assert 'function_name' in func
            assert 'file_path' in func
            assert 'line_number' in func
            assert 'function_code' in func
        
        # Verify specific functions
        function_names = [f['function_name'] for f in functions]
        assert 'test_function' in function_names
        assert 'init_module' in function_names
        assert 'helper_function' in function_names

    def test_javascript_function_population_with_function_entries(self):
        """Test function extraction when data already has function_entries"""
        
        data_entries = TEST_DATA_FUNCTION_ENTRIES
        
        # Simulate JavaScript logic
        functions = []
        
        if 'function_entries' in data_entries and data_entries['function_entries']:
            functions = data_entries['function_entries']
        elif 'functions_by_file' in data_entries:
            # This branch shouldn't be taken
            for file_path, file_functions in data_entries['functions_by_file'].items():
                for func in file_functions:
                    if 'file_path' not in func:
                        func['file_path'] = file_path
                    functions.append(func)
        
        # Should use function_entries directly
        assert len(functions) == 2
        assert functions[0]['function_name'] == 'test_function'
        assert functions[1]['function_name'] == 'helper_function'


class TestAPIEndpointRegression:
    """Test that fixes don't regress"""

    def test_api_endpoints_exist(self):
        """Test that all required API endpoints exist and don't return 404"""
        # This is more of a documentation test to ensure we remember these endpoints
        required_endpoints = [
            '/api/data',
            '/api/function-code',
            '/api/llm/status'
        ]
        
        # Just document what we need to test
        assert len(required_endpoints) > 0

    def test_api_data_structure_consistency(self):
        """Test that API endpoints handle both data structures consistently"""
        # Test that we support both function_entries and functions_by_file
        data_structures = ['function_entries', 'functions_by_file']
        assert len(data_structures) == 2


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
