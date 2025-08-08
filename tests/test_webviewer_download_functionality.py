#!/usr/bin/env python3
"""
Comprehensive tests for webviewer download functionality.

This test suite verifies that the download buttons and functionality work correctly
after analysis is completed in the web UI.
"""

import json
import pytest
import requests
import time
import threading
from pathlib import Path
import tempfile
import os
import sys

# Add src to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent / 'src'))

from webviewer.ui import create_app, load_data
from webviewer import start_web_ui


class TestWebViewerDownloadFunctionality:
    """Test suite for webviewer download functionality."""
    
    @pytest.fixture(scope="class")
    def test_data(self):
        """Create test data for download functionality testing."""
        return {
            "statistics": {
                "unique_function_entries": 2,
                "unique_dma_operations": 1,
                "unique_user_copy_operations": 1,
                "unique_ioctl_operations": 1,
                "total_files": 2,
                "files_instrumented_with_function_entries": 1
            },
            "functions_by_file": {
                "/path/to/test_file1.c": [
                    {
                        "function_name": "test_function_1",
                        "line_number": 10,
                        "parameters": "void",
                        "return_type": "int",
                        "function_code": "int test_function_1(void) {\n    return 0;\n}"
                    }
                ],
                "/path/to/test_file2.c": [
                    {
                        "function_name": "test_function_2",
                        "line_number": 20,
                        "parameters": "int param",
                        "return_type": "void",
                        "function_code": "void test_function_2(int param) {\n    // Test function\n}"
                    }
                ]
            },
            "function_entries": [
                {
                    "function_name": "test_function_1",
                    "file_path": "/path/to/test_file1.c",
                    "line_number": 10,
                    "parameters": "void",
                    "return_type": "int",
                    "function_code": "int test_function_1(void) {\n    return 0;\n}"
                },
                {
                    "function_name": "test_function_2",
                    "file_path": "/path/to/test_file2.c",
                    "line_number": 20,
                    "parameters": "int param",
                    "return_type": "void",
                    "function_code": "void test_function_2(int param) {\n    // Test function\n}"
                }
            ],
            "dma_operations": [
                {
                    "dma_function": "dma_alloc_coherent",
                    "caller_function": "test_driver_init",
                    "file_path": "/path/to/driver.c",
                    "line_number": 150,
                    "parameters": "struct device *dev, size_t size, dma_addr_t *handle, gfp_t flag",
                    "function_code": "static int test_driver_init(void) {\n    void *virt = dma_alloc_coherent(dev, 1024, &handle, GFP_KERNEL);\n    return 0;\n}"
                }
            ],
            "user_copy_operations": [
                {
                    "copy_function": "copy_from_user",
                    "caller_function": "test_ioctl_handler",
                    "file_path": "/path/to/ioctl.c",
                    "line_number": 75,
                    "parameters": "void *to, const void __user *from, unsigned long n",
                    "function_code": "static long test_ioctl_handler(struct file *file, unsigned int cmd, unsigned long arg) {\n    if (copy_from_user(&data, (void __user *)arg, sizeof(data))) {\n        return -EFAULT;\n    }\n    return 0;\n}"
                }
            ],
            "ioctl_operations": [
                {
                    "function_name": "test_ioctl_handler",
                    "file_path": "/path/to/ioctl.c",
                    "line_number": 70,
                    "handler_type": "unlocked_ioctl",
                    "function_code": "static long test_ioctl_handler(struct file *file, unsigned int cmd, unsigned long arg) {\n    // IOCTL implementation\n    return 0;\n}"
                }
            ]
        }
    
    @pytest.fixture(scope="class")
    def test_json_file(self, test_data, tmp_path_factory):
        """Create a temporary JSON file with test data."""
        tmp_dir = tmp_path_factory.mktemp("test_data")
        json_file = tmp_dir / "test_download_data.json"
        
        with open(json_file, 'w') as f:
            json.dump(test_data, f, indent=2)
        
        return json_file
    
    @pytest.fixture(scope="class")
    def flask_app(self, test_data):
        """Create Flask app instance for testing."""
        app = create_app()
        app.config['TESTING'] = True
        
        # Load test data into the app
        app.parsed_data = test_data
        
        with app.app_context():
            yield app
    
    @pytest.fixture(scope="class")
    def test_client(self, flask_app):
        """Create test client for Flask app."""
        return flask_app.test_client()
    
    @pytest.fixture(scope="class")
    def running_server(self, test_json_file):
        """Start a real web server for integration testing."""
        import socket
        
        # Find an available port
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.bind(('', 0))
            port = s.getsockname()[1]
        
        # Start server in a separate thread
        server_thread = threading.Thread(
            target=start_web_ui,
            args=[str(test_json_file)],
            kwargs={'port': port, 'host': '127.0.0.1', 'auto_open': False}
        )
        server_thread.daemon = True
        server_thread.start()
        
        # Wait for server to start
        time.sleep(2)
        
        base_url = f"http://127.0.0.1:{port}"
        
        # Verify server is running
        max_attempts = 10
        for attempt in range(max_attempts):
            try:
                response = requests.get(f"{base_url}/api/status", timeout=1)
                if response.status_code == 200:
                    break
            except requests.exceptions.RequestException:
                if attempt == max_attempts - 1:
                    pytest.skip("Could not start test server")
                time.sleep(1)
        
        yield base_url
        
        # Server will be stopped automatically when thread ends
    
    def test_download_buttons_present_in_template(self, test_client):
        """Test that download buttons are present in the main template."""
        response = test_client.get('/')
        assert response.status_code == 200
        
        html_content = response.get_data(as_text=True)
        
        # Check for download buttons in HTML
        assert 'Download JSON' in html_content, "Download JSON button not found in template"
        assert 'Download CSV' in html_content, "Download CSV button not found in template"
        assert 'Download Report' in html_content, "Download Report button not found in template"
        
        # Check for download button onclick handlers
        assert 'downloadAnalysisResults' in html_content, "Download function calls not found"
        assert "onclick=\"downloadAnalysisResults('json')\"" in html_content
        assert "onclick=\"downloadAnalysisResults('csv')\"" in html_content
        assert "onclick=\"downloadAnalysisResults('html')\"" in html_content
    
    def test_download_javascript_functions_present(self, test_client):
        """Test that JavaScript download functions are present in the template."""
        response = test_client.get('/')
        assert response.status_code == 200
        
        html_content = response.get_data(as_text=True)
        
        # Check for JavaScript download functions
        assert 'function downloadAnalysisResults' in html_content, "downloadAnalysisResults function not found"
        assert 'function downloadJSON' in html_content, "downloadJSON function not found"
        assert 'function downloadCSV' in html_content, "downloadCSV function not found"
        assert 'function downloadHTML' in html_content, "downloadHTML function not found"
        assert 'function generateCSVReport' in html_content, "generateCSVReport function not found"
        assert 'function generateHTMLReport' in html_content, "generateHTMLReport function not found"
    
    def test_api_data_endpoint(self, test_client):
        """Test that the /api/data endpoint returns valid data."""
        response = test_client.get('/api/data')
        assert response.status_code == 200
        
        data = response.get_json()
        assert data is not None, "API data endpoint returned no data"
        assert 'statistics' in data, "Statistics not found in API data"
        assert 'functions_by_file' in data, "Functions data not found in API data"
        assert 'dma_operations' in data, "DMA operations not found in API data"
        assert 'user_copy_operations' in data, "User copy operations not found in API data"
        assert 'ioctl_operations' in data, "IOCTL operations not found in API data"
    
    def test_download_functionality_integration(self, running_server):
        """Integration test for download functionality with real server."""
        base_url = running_server
        
        # Test main page loads
        response = requests.get(base_url)
        assert response.status_code == 200, f"Main page failed to load from {base_url}"
        
        # Check download buttons are present
        html_content = response.text
        assert 'Download JSON' in html_content, "Download JSON button not found"
        assert 'Download CSV' in html_content, "Download CSV button not found"
        assert 'Download Report' in html_content, "Download Report button not found"
        
        # Test API data endpoint works
        api_response = requests.get(f"{base_url}/api/data")
        assert api_response.status_code == 200, "API data endpoint failed"
        
        api_data = api_response.json()
        assert 'statistics' in api_data, "API data missing statistics"
        assert api_data['statistics']['unique_function_entries'] == 2, "Incorrect function count"
    
    def test_results_dashboard_visibility(self, test_client):
        """Test that results dashboard with download buttons is visible."""
        response = test_client.get('/')
        assert response.status_code == 200
        
        html_content = response.get_data(as_text=True)
        
        # Check for results dashboard
        assert 'results-dashboard' in html_content, "Results dashboard not found"
        assert 'resultsDashboard' in html_content, "Results dashboard ID not found"
        
        # Check for results actions section
        assert 'results-actions' in html_content, "Results actions section not found"
        
        # Check download buttons are in the results section
        assert 'downloadJsonBtn' in html_content, "Download JSON button ID not found"
        assert 'downloadCsvBtn' in html_content, "Download CSV button ID not found"
        assert 'downloadHtmlBtn' in html_content, "Download HTML button ID not found"
    
    def test_comprehensive_analysis_button(self, test_client):
        """Test that comprehensive analysis button is present."""
        response = test_client.get('/')
        assert response.status_code == 200
        
        html_content = response.get_data(as_text=True)
        
        # Check for comprehensive analysis section
        assert 'Analyze All Components' in html_content, "Analyze All Components button not found"
        assert '/api/analyze/comprehensive' in html_content, "Comprehensive analysis API endpoint not found"
    
    def test_download_buttons_css_styling(self, test_client):
        """Test that download buttons have proper CSS styling."""
        response = test_client.get('/')
        assert response.status_code == 200
        
        html_content = response.get_data(as_text=True)
        
        # Check for download button CSS class
        assert '.download-btn' in html_content, "Download button CSS class not found"
        assert 'download-btn' in html_content, "Download button class not applied to buttons"
    
    def test_external_js_file_loading(self, test_client):
        """Test that external JavaScript files are referenced."""
        response = test_client.get('/')
        assert response.status_code == 200
        
        html_content = response.get_data(as_text=True)
        
        # Check for external JS file references (they may not exist, but should be referenced)
        assert 'static/js/main.js' in html_content or 'js/main.js' in html_content, "Main JS file not referenced"
        assert 'static/js/llm.js' in html_content or 'js/llm.js' in html_content, "LLM JS file not referenced"
    
    def test_comprehensive_analysis_api_endpoint(self, test_client):
        """Test the comprehensive analysis API endpoint."""
        response = test_client.post('/api/analyze/comprehensive', 
                                  json={
                                      'component_types': ['functions', 'dma_operations'],
                                      'batch_size': 5,
                                      'model_id': 'gpt-3.5-turbo'
                                  })
        
        # Should return success even without LLM configured
        assert response.status_code == 200
        data = response.get_json()
        assert 'status' in data
        assert 'results' in data
    
    def test_download_json_format_validation(self, test_client):
        """Test that the data from API is valid JSON for download."""
        response = test_client.get('/api/data')
        assert response.status_code == 200
        
        data = response.get_json()
        
        # Test that data can be JSON serialized (for download)
        json_string = json.dumps(data, indent=2)
        assert len(json_string) > 0, "JSON serialization failed"
        
        # Test that it can be parsed back
        parsed_data = json.loads(json_string)
        assert parsed_data == data, "JSON round-trip failed"
    
    def test_download_csv_data_structure(self, test_client):
        """Test that data structure is suitable for CSV generation."""
        response = test_client.get('/api/data')
        assert response.status_code == 200
        
        data = response.get_json()
        
        # Test functions data for CSV conversion
        if 'functions_by_file' in data:
            for file_path, functions in data['functions_by_file'].items():
                assert isinstance(functions, list), f"Functions in {file_path} should be a list"
                for func in functions:
                    assert 'function_name' in func, "Function should have name for CSV"
        
        # Test DMA operations for CSV
        if 'dma_operations' in data:
            for dma in data['dma_operations']:
                assert 'dma_function' in dma, "DMA operation should have function name"
                assert 'caller_function' in dma, "DMA operation should have caller function"
        
        # Test user copy operations for CSV
        if 'user_copy_operations' in data:
            for copy_op in data['user_copy_operations']:
                assert 'copy_function' in copy_op, "User copy should have function name"
                assert 'caller_function' in copy_op, "User copy should have caller function"


class TestDownloadFunctionalityEdgeCases:
    """Test edge cases for download functionality."""
    
    def test_empty_data_download(self):
        """Test download functionality with empty data."""
        app = create_app()
        app.config['TESTING'] = True
        app.parsed_data = {
            "statistics": {"unique_function_entries": 0},
            "functions_by_file": {},
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": []
        }
        
        with app.test_client() as client:
            response = client.get('/api/data')
            assert response.status_code == 200
            
            data = response.get_json()
            assert data is not None
            assert 'statistics' in data
    
    def test_missing_data_fields(self):
        """Test download functionality with missing data fields."""
        app = create_app()
        app.config['TESTING'] = True
        app.parsed_data = {
            "statistics": {"unique_function_entries": 1},
            "functions_by_file": {
                "/test/file.c": [
                    {"function_name": "test_func"}  # Missing other fields
                ]
            }
        }
        
        with app.test_client() as client:
            response = client.get('/api/data')
            assert response.status_code == 200
            
            data = response.get_json()
            assert data is not None
    
    def test_large_data_download(self):
        """Test download functionality with large dataset."""
        # Create large dataset
        large_data = {
            "statistics": {"unique_function_entries": 1000},
            "functions_by_file": {}
        }
        
        # Generate many functions
        for i in range(100):
            file_path = f"/test/file_{i}.c"
            functions = []
            for j in range(10):
                functions.append({
                    "function_name": f"test_function_{i}_{j}",
                    "line_number": j * 10,
                    "function_code": f"void test_function_{i}_{j}(void) {{ /* Function {i}_{j} */ }}"
                })
            large_data["functions_by_file"][file_path] = functions
        
        app = create_app()
        app.config['TESTING'] = True
        app.parsed_data = large_data
        
        with app.test_client() as client:
            response = client.get('/api/data')
            assert response.status_code == 200
            
            data = response.get_json()
            assert data is not None
            assert len(data['functions_by_file']) == 100


def test_download_functionality_manual_verification():
    """
    Manual verification test - prints instructions for human verification.
    
    This test provides instructions for manually verifying download functionality
    in a browser.
    """
    print("\n" + "="*70)
    print("MANUAL VERIFICATION INSTRUCTIONS FOR DOWNLOAD FUNCTIONALITY")
    print("="*70)
    print("\n1. Start the web server:")
    print("   source setup.sh && python -m src.webviewer test_results_with_function_code.json --port 5002")
    print("\n2. Open browser to: http://localhost:5002")
    print("\n3. Verify the following download buttons are visible:")
    print("   - 📥 Download JSON button")
    print("   - 📊 Download CSV button") 
    print("   - 🌐 Download Report button")
    print("\n4. Click each download button and verify:")
    print("   - JSON download: Creates a .json file with analysis data")
    print("   - CSV download: Creates a .csv file with tabular data")
    print("   - HTML download: Creates a .html report file")
    print("\n5. Check browser console (F12) for any JavaScript errors")
    print("\n6. If download buttons are missing:")
    print("   - Check browser console for JavaScript errors")
    print("   - Verify buttons appear after page loads completely")
    print("   - Try running comprehensive analysis first")
    print("\n" + "="*70)


if __name__ == "__main__":
    # Run the manual verification instructions
    test_download_functionality_manual_verification()
    
    # Run pytest programmatically for automated tests
    pytest.main([__file__, "-v", "--tb=short"])
