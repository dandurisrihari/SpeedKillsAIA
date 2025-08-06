#!/usr/bin/env python3
"""
API Endpoint Regression Tests

These tests ensure that API endpoint fixes don't regress:
1. /api/data endpoint returns 200, not 404
2. /api/function-code endpoint returns 200 for valid functions
3. Data access patterns work correctly
4. Global vs session data handling works
"""

import pytest
import json
import tempfile
import os
from unittest.mock import patch, MagicMock

# Test data
MINIMAL_TEST_DATA = {
    "metadata": {"log_file": "test.log"},
    "statistics": {"unique_function_entries": 1},
    "function_entries": [
        {
            "function_name": "test_func",
            "file_path": "/test.c",
            "line_number": 10,
            "function_code": "void test_func(void) { return; }"
        }
    ],
    "functions_by_file": {
        "/test.c": [
            {
                "function_name": "test_func",
                "line_number": 10,
                "function_code": "void test_func(void) { return; }"
            }
        ]
    }
}


class TestAPIEndpointRegression:
    """Test API endpoints that were causing 404 errors"""

    @pytest.fixture
    def test_app(self):
        """Create test Flask app with mock data"""
        try:
            from src.webviewer.ui import create_app
            
            app = create_app()
            app.config['TESTING'] = True
            
            # Set up test data in app instance
            app.parsed_data = MINIMAL_TEST_DATA
            
            # Also set global parsed_data for fallback
            import src.webviewer.ui as ui_module
            ui_module.parsed_data = MINIMAL_TEST_DATA
            
            return app
            
        except ImportError:
            pytest.skip("Webviewer module not available")

    def test_api_data_endpoint_returns_200(self, test_app):
        """Test that /api/data returns 200, not 404"""
        with test_app.test_client() as client:
            response = client.get('/api/data')
            
            assert response.status_code == 200, f"Expected 200, got {response.status_code}"
            
            data = response.get_json()
            assert data is not None
            assert 'metadata' in data
            assert 'function_entries' in data

    def test_api_data_endpoint_handles_missing_data_gracefully(self):
        """Test that /api/data returns some response when no data is loaded"""
        try:
            from src.webviewer.ui import create_app
            
            app = create_app()
            app.config['TESTING'] = True
            
            # Don't set any data - should handle gracefully
            with app.test_client() as client:
                response = client.get('/api/data')
                
                # Should not crash - either 200 with empty data or 404
                assert response.status_code in [200, 404]
                
                if response.status_code == 404:
                    data = response.get_json()
                    assert 'error' in data
                    assert data['error'] == 'No data loaded'
                else:
                    # If 200, should still return valid JSON
                    data = response.get_json()
                    assert data is not None
                
        except ImportError:
            pytest.skip("Webviewer module not available")

    def test_api_function_code_endpoint_returns_200(self, test_app):
        """Test that /api/function-code returns 200 for valid functions"""
        with test_app.test_client() as client:
            response = client.get('/api/function-code?name=test_func&file=/test.c&line=10')
            
            assert response.status_code == 200, f"Expected 200, got {response.status_code}"
            
            data = response.get_json()
            assert data['function_name'] == 'test_func'
            assert data['file_path'] == '/test.c'
            assert data['line_number'] == 10
            assert 'function_code' in data

    def test_api_function_code_endpoint_handles_missing_function(self, test_app):
        """Test that /api/function-code returns 404 for missing functions"""
        with test_app.test_client() as client:
            response = client.get('/api/function-code?name=missing_func&file=/test.c&line=10')
            
            assert response.status_code == 404
            data = response.get_json()
            assert 'error' in data
            assert data['error'] == 'Function not found'

    def test_api_function_code_endpoint_requires_name(self, test_app):
        """Test that /api/function-code returns 400 when name is missing"""
        with test_app.test_client() as client:
            response = client.get('/api/function-code?file=/test.c&line=10')
            
            assert response.status_code == 400
            data = response.get_json()
            assert 'error' in data
            assert data['error'] == 'Function name required'

    def test_data_access_patterns(self, test_app):
        """Test that data can be accessed via session, app instance, and global fallback"""
        with test_app.test_client() as client:
            with client.session_transaction() as session:
                # Test with session data
                session['results'] = {'test': 'session_data'}
                
            # Should use session data
            response = client.get('/api/data')
            assert response.status_code == 200
            data = response.get_json()
            assert data['test'] == 'session_data'

    def test_global_parsed_data_fallback(self, test_app):
        """Test that global parsed_data is used as fallback"""
        # Clear app data but keep global data
        test_app.parsed_data = None
        
        with test_app.test_client() as client:
            response = client.get('/api/data')
            
            # Should still work via global fallback
            assert response.status_code == 200
            data = response.get_json()
            assert 'metadata' in data

    def test_function_code_works_with_both_data_structures(self, test_app):
        """Test that function code endpoint works with both function_entries and functions_by_file"""
        # Test with function_entries structure
        with test_app.test_client() as client:
            response = client.get('/api/function-code?name=test_func&file=/test.c&line=10')
            assert response.status_code == 200
            
        # Test with functions_by_file structure only
        data_by_file_only = {
            "functions_by_file": {
                "/test.c": [
                    {
                        "function_name": "test_func",
                        "line_number": 10,
                        "function_code": "void test_func(void) { return; }"
                    }
                ]
            }
        }
        
        test_app.parsed_data = data_by_file_only
        
        with test_app.test_client() as client:
            response = client.get('/api/function-code?name=test_func&file=/test.c&line=10')
            assert response.status_code == 200
            data = response.get_json()
            assert data['function_name'] == 'test_func'

    def test_api_status_endpoint_exists(self, test_app):
        """Test that /api/status endpoint exists and works"""
        with test_app.test_client() as client:
            response = client.get('/api/status')
            
            # Should not be 404
            assert response.status_code in [200, 500], f"Got unexpected status {response.status_code}"

    def test_api_llm_status_endpoint_exists(self, test_app):
        """Test that /api/llm/status endpoint exists"""
        with test_app.test_client() as client:
            response = client.get('/api/llm/status')
            
            # Should not be 404
            assert response.status_code in [200, 500, 503], f"Got unexpected status {response.status_code}"


class TestDataStructureHandling:
    """Test that both function_entries and functions_by_file structures are handled"""

    @pytest.fixture
    def temp_json_functions_by_file(self):
        """Create temp file with functions_by_file structure"""
        data = {
            "functions_by_file": {
                "/driver.c": [
                    {"function_name": "init", "line_number": 1, "function_code": "int init() { return 0; }"},
                    {"function_name": "cleanup", "line_number": 10, "function_code": "void cleanup() {}"}
                ],
                "/utils.c": [
                    {"function_name": "helper", "line_number": 5, "function_code": "void helper() {}"}
                ]
            },
            "metadata": {"log_file": "test.log"},
            "statistics": {"unique_function_entries": 3}
        }
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(data, f)
            temp_path = f.name
        
        yield temp_path
        
        if os.path.exists(temp_path):
            os.unlink(temp_path)

    def test_load_data_creates_function_entries_from_functions_by_file(self, temp_json_functions_by_file):
        """Test that load_data creates function_entries from functions_by_file"""
        try:
            from src.webviewer.ui import load_data
            
            data = load_data(temp_json_functions_by_file)
            
            assert data is not None
            assert 'function_entries' in data
            assert 'functions_by_file' in data
            
            # Should have 3 functions total
            function_entries = data['function_entries']
            assert len(function_entries) == 3
            
            # All functions should have file_path set
            for func in function_entries:
                assert 'file_path' in func
                assert func['file_path'] in ['/driver.c', '/utils.c']
                
        except ImportError:
            pytest.skip("Webviewer module not available")

    def test_api_handles_functions_by_file_structure(self, temp_json_functions_by_file):
        """Test that API endpoints work with functions_by_file structure"""
        try:
            from src.webviewer.ui import load_data, create_app
            
            data = load_data(temp_json_functions_by_file)
            app = create_app()
            app.config['TESTING'] = True
            app.parsed_data = data
            
            with app.test_client() as client:
                # Test that we can find functions
                response = client.get('/api/function-code?name=init&file=/driver.c&line=1')
                assert response.status_code == 200
                
                response_data = response.get_json()
                assert response_data['function_name'] == 'init'
                assert response_data['file_path'] == '/driver.c'
                
        except ImportError:
            pytest.skip("Webviewer module not available")


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
