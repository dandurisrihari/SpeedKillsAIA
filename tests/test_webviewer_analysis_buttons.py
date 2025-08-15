#!/usr/bin/env python3
"""
Comprehensive test suite for webviewer analysis button functionality.

This test suite ensures all analysis buttons work correctly:
- Analyze All Components button
- Function analysis button
- DMA analysis button
- User Copy analysis button
- IOCTL analysis button
- Log analysis button

Tests cover both frontend JavaScript functions and backend API endpoints.
"""

import pytest
import json
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import TimeoutException, WebDriverException
import requests
from threading import Thread
import subprocess
import sys
import os

# Add the src directory to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from src.webviewer.ui import create_app


class TestWebviewerAnalysisButtons:
    """Test suite for webviewer analysis button functionality."""
    
    @classmethod
    def setup_class(cls):
        """Set up test class with Flask app and browser."""
        # Create Flask app for testing
        cls.app = create_app()
        cls.app.config['TESTING'] = True
        cls.client = cls.app.test_client()
        
        # Start Flask server in background for Selenium tests
        cls.server_process = None
        cls.driver = None
        cls.base_url = "http://127.0.0.1:5555"  # Use different port for tests
        
        # Set up Chrome options for headless testing
        chrome_options = Options()
        chrome_options.add_argument("--headless")
        chrome_options.add_argument("--no-sandbox")
        chrome_options.add_argument("--disable-dev-shm-usage")
        chrome_options.add_argument("--disable-gpu")
        chrome_options.add_argument("--window-size=1920,1080")
        
        try:
            cls.driver = webdriver.Chrome(options=chrome_options)
            cls.driver.implicitly_wait(10)
        except WebDriverException as e:
            pytest.skip(f"Chrome WebDriver not available: {e}")
    
    @classmethod
    def teardown_class(cls):
        """Clean up after tests."""
        if cls.driver:
            cls.driver.quit()
        if cls.server_process:
            cls.server_process.terminate()
    
    def test_flask_app_creation(self):
        """Test that Flask app can be created successfully."""
        assert self.app is not None
        assert self.app.config['TESTING'] is True
    
    def test_api_analyze_comprehensive_endpoint_exists(self):
        """Test that the comprehensive analysis API endpoint exists."""
        response = self.client.post('/api/analyze/comprehensive',
                                   data=json.dumps({
                                       'component_types': ['dma_operations'],
                                       'batch_size': 5,
                                       'model_id': 'gpt-3.5-turbo'
                                   }),
                                   content_type='application/json')
        # Should return 200 even with no data loaded
        assert response.status_code == 200
        data = json.loads(response.data)
        assert 'status' in data
        assert data['status'] in ['completed', 'success']
    
    def test_api_llm_analyze_function_endpoint(self):
        """Test the LLM function analysis endpoint."""
        response = self.client.post('/api/llm/analyze/function',
                                   data=json.dumps({
                                       'function_name': 'test_function',
                                       'source_code': 'void test_function() { return; }',
                                       'file_path': '/test/file.c',
                                       'model_id': 'gpt-3.5-turbo'
                                   }),
                                   content_type='application/json')
        # Should return 200 or 503 (if LLM not available)
        assert response.status_code in [200, 503]
        data = json.loads(response.data)
        assert 'error' in data or 'analysis' in data
    
    def test_api_llm_analyze_dma_endpoint(self):
        """Test the LLM DMA analysis endpoint."""
        response = self.client.post('/api/llm/analyze/dma',
                                   data=json.dumps({
                                       'dma_operation': {
                                           'dma_function': 'dma_alloc_coherent',
                                           'caller_function': 'test_driver_init',
                                           'file_path': '/test/driver.c',
                                           'line_number': 123
                                       },
                                       'model_id': 'gpt-3.5-turbo'
                                   }),
                                   content_type='application/json')
        assert response.status_code in [200, 503]
        data = json.loads(response.data)
        assert 'error' in data or 'analysis' in data
    
    def test_api_llm_analyze_user_copy_endpoint(self):
        """Test the LLM user copy analysis endpoint."""
        response = self.client.post('/api/llm/analyze/user-copy',
                                   data=json.dumps({
                                       'user_copy_operation': {
                                           'copy_function': 'copy_from_user',
                                           'caller_function': 'test_ioctl',
                                           'file_path': '/test/device.c',
                                           'direction': 'from_user'
                                       },
                                       'model_id': 'gpt-3.5-turbo'
                                   }),
                                   content_type='application/json')
        assert response.status_code in [200, 503]
        data = json.loads(response.data)
        assert 'error' in data or 'analysis' in data
    
    def test_api_llm_analyze_ioctl_endpoint(self):
        """Test the LLM IOCTL analysis endpoint."""
        response = self.client.post('/api/llm/analyze/ioctl',
                                   data=json.dumps({
                                       'ioctl_operation': {
                                           'ioctl_command': 'TEST_IOCTL_CMD',
                                           'handler_function': 'test_ioctl_handler',
                                           'file_path': '/test/ioctl.c',
                                           'cmd_number': 42
                                       },
                                       'model_id': 'gpt-3.5-turbo'
                                   }),
                                   content_type='application/json')
        assert response.status_code in [200, 503]
        data = json.loads(response.data)
        assert 'error' in data or 'analysis' in data
    
    def test_api_llm_analyze_logs_endpoint(self):
        """Test the LLM logs analysis endpoint."""
        response = self.client.post('/api/llm/analyze/logs',
                                   data=json.dumps({
                                       'log_entries': ['kernel: test log entry'],
                                       'analysis_type': 'security',
                                       'model_id': 'gpt-3.5-turbo'
                                   }),
                                   content_type='application/json')
        assert response.status_code in [200, 400, 503]  # 400 for bad request is acceptable
        data = json.loads(response.data)
        assert 'error' in data or 'analysis' in data
    
    def test_api_endpoints_return_json(self):
        """Test that all API endpoints return valid JSON."""
        endpoints = [
            ('/api/analyze/comprehensive', {
                'component_types': ['dma_operations'],
                'batch_size': 5
            }),
            ('/api/llm/analyze/function', {
                'function_name': 'test',
                'source_code': 'void test() {}'
            }),
            ('/api/llm/analyze/dma', {
                'dma_operation': {'dma_function': 'test'}
            }),
            ('/api/llm/analyze/user-copy', {
                'user_copy_operation': {'copy_function': 'test'}
            }),
            ('/api/llm/analyze/ioctl', {
                'ioctl_operation': {'ioctl_command': 'test'}
            }),
            ('/api/llm/analyze/logs', {
                'log_entries': ['test log']
            })
        ]
        
        for endpoint, data in endpoints:
            response = self.client.post(endpoint,
                                       data=json.dumps(data),
                                       content_type='application/json')
            assert response.status_code in [200, 400, 503]
            try:
                json.loads(response.data)
            except json.JSONDecodeError:
                pytest.fail(f"Endpoint {endpoint} did not return valid JSON")
    
    @pytest.mark.skipif("not hasattr(TestWebviewerAnalysisButtons, 'driver') or "
                        "TestWebviewerAnalysisButtons.driver is None")
    def test_webui_loads_successfully(self):
        """Test that the web UI loads without errors."""
        if not self.driver:
            pytest.skip("WebDriver not available")
            
        try:
            # Navigate to the web UI
            self.driver.get("http://127.0.0.1:5000")
            
            # Wait for the page to load
            WebDriverWait(self.driver, 10).until(
                EC.presence_of_element_located((By.TAG_NAME, "body"))
            )
            
            # Check that the page title is correct
            assert "Kernel Log Analysis" in self.driver.title
        except WebDriverException as e:
            if "ERR_CONNECTION_REFUSED" in str(e):
                pytest.skip("Web server not running for UI test")
            else:
                raise
    
    @pytest.mark.skipif("not hasattr(TestWebviewerAnalysisButtons, 'driver') or "
                        "TestWebviewerAnalysisButtons.driver is None")
    def test_analyze_all_components_button_exists(self):
        """Test that the Analyze All Components button exists."""
        if not self.driver:
            pytest.skip("WebDriver not available")
            
        try:
            self.driver.get("http://127.0.0.1:5000")
            
            # Wait for the analyze all button to be present
            analyze_all_btn = WebDriverWait(self.driver, 10).until(
                EC.presence_of_element_located((By.ID, "analyzeAllBtn"))
            )
            
            assert analyze_all_btn is not None
            assert "Analyze All Components" in analyze_all_btn.text
        except WebDriverException as e:
            if "ERR_CONNECTION_REFUSED" in str(e):
                pytest.skip("Web server not running for UI test")
            else:
                raise
    
    @pytest.mark.skipif("not hasattr(TestWebviewerAnalysisButtons, 'driver') or "
                        "TestWebviewerAnalysisButtons.driver is None")
    def test_analysis_button_elements_exist(self):
        """Test that all analysis buttons exist in the UI."""
        if not self.driver:
            pytest.skip("WebDriver not available")
            
        try:
            self.driver.get("http://127.0.0.1:5000")
            
            # Wait for page to load
            WebDriverWait(self.driver, 10).until(
                EC.presence_of_element_located((By.TAG_NAME, "body"))
            )
            
            # Check for analysis buttons
            button_ids = [
                "analyzeAllBtn",
                "analyzeFunctionBtn", 
                "analyzeDMABtn",
                "analyzeLogsBtn",
                "analyzeCopyBtn",
                "analyzeIOCTLBtn"
            ]
            
            for button_id in button_ids:
                try:
                    button = self.driver.find_element(By.ID, button_id)
                    assert button is not None, f"Button {button_id} not found"
                except Exception as e:
                    pytest.fail(f"Could not find button {button_id}: {e}")
        except WebDriverException as e:
            if "ERR_CONNECTION_REFUSED" in str(e):
                pytest.skip("Web server not running for UI test")
            else:
                raise
    
    @pytest.mark.skipif("not hasattr(TestWebviewerAnalysisButtons, 'driver') or "
                        "TestWebviewerAnalysisButtons.driver is None")
    def test_javascript_functions_defined(self):
        """Test that required JavaScript functions are defined."""
        if not self.driver:
            pytest.skip("WebDriver not available")
            
        try:
            self.driver.get("http://127.0.0.1:5000")
            
            # Wait for page to load
            WebDriverWait(self.driver, 10).until(
                EC.presence_of_element_located((By.TAG_NAME, "body"))
            )
            
            # Check that JavaScript functions are defined
            js_functions = [
                "runComprehensiveAnalysis",
                "analyzeFunctionWithLLM",
                "analyzeDMAWithLLM", 
                "analyzeLogsWithLLM",
                "analyzeUserCopyWithLLM",
                "analyzeIOCTLWithLLM"
            ]
            
            for func_name in js_functions:
                result = self.driver.execute_script(
                    f"return typeof {func_name} === 'function';"
                )
                assert result is True, f"JavaScript function {func_name} is not defined"
        except WebDriverException as e:
            if "ERR_CONNECTION_REFUSED" in str(e):
                pytest.skip("Web server not running for UI test")
            else:
                raise
    
    def test_comprehensive_analysis_with_mock_data(self):
        """Test comprehensive analysis with mock data."""
        # Mock some test data
        test_data = {
            'component_types': ['dma_operations', 'user_copy_operations'],
            'batch_size': 2,
            'model_id': 'gpt-3.5-turbo',
            'custom_prompt': 'Test analysis'
        }
        
        response = self.client.post('/api/analyze/comprehensive',
                                   data=json.dumps(test_data),
                                   content_type='application/json')
        
        assert response.status_code == 200
        data = json.loads(response.data)
        assert 'status' in data
        assert data['status'] in ['completed', 'success']
        assert 'results' in data
        assert 'total' in data
        assert isinstance(data['results'], list)
        assert isinstance(data['total'], int)
    
    def test_error_handling_invalid_requests(self):
        """Test error handling for invalid API requests."""
        # Test with missing required data
        response = self.client.post('/api/llm/analyze/function',
                                   data=json.dumps({}),
                                   content_type='application/json')
        assert response.status_code == 400
        
        # Test with invalid JSON
        response = self.client.post('/api/analyze/comprehensive',
                                   data="invalid json",
                                   content_type='application/json')
        assert response.status_code == 400
    
    def test_api_endpoint_constants(self):
        """Test that API endpoint constants are properly defined."""
        # This tests the JavaScript API_ENDPOINTS object indirectly
        # by checking that all expected endpoints exist
        expected_endpoints = [
            '/api/analyze/comprehensive',
            '/api/llm/analyze/function',
            '/api/llm/analyze/dma', 
            '/api/llm/analyze/user-copy',
            '/api/llm/analyze/ioctl',
            '/api/llm/analyze/logs'
        ]
        
        for endpoint in expected_endpoints:
            # Test that endpoint exists (even if it returns error due to missing data)
            response = self.client.post(endpoint,
                                       data=json.dumps({}),
                                       content_type='application/json')
            # Should not return 404 (endpoint exists)
            assert response.status_code != 404, f"Endpoint {endpoint} not found"
    
    def test_response_format_consistency(self):
        """Test that API responses have consistent format."""
        test_data = {
            'component_types': ['dma_operations'],
            'batch_size': 1
        }
        
        response = self.client.post('/api/analyze/comprehensive',
                                   data=json.dumps(test_data),
                                   content_type='application/json')
        
        assert response.status_code == 200
        data = json.loads(response.data)
        
        # Check required fields
        required_fields = ['status', 'results', 'total']
        for field in required_fields:
            assert field in data, f"Required field {field} missing from response"
        
        # Check data types
        assert isinstance(data['results'], list)
        assert isinstance(data['total'], int)
        assert data['status'] in ['completed', 'success', 'error']


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
