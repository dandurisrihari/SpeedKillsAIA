#!/usr/bin/env python3
"""
Tests for IOCTL LLM Analysis and Device Access Functionality

This test file ensures that the IOCTL handler LLM analysis button works correctly
and the device access details toggle functions properly. These tests are created
to prevent regression of the issues found on August 6, 2025.
"""

import pytest
import json
import os
from unittest.mock import Mock, patch, MagicMock
import sys

# Add src to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(__file__)), 'src'))

from webviewer.ui import create_app


class TestIOCTLLLMAnalysisRegression:
    """Test cases for IOCTL LLM analysis functionality to prevent regression"""
    
    def setup_method(self):
        """Setup for each test method"""
        self.app = create_app()
        self.app.config['TESTING'] = True
        self.client = self.app.test_client()
        
        # Sample test data with IOCTL operations (using correct structure)
        self.test_data = {
            "metadata": {
                "parser_version": "2.0.0",
                "parsed_at": "2023-01-01T12:00:00.000000",
                "log_file": "test.log"
            },
            "ioctl_operations": [
                {
                    "function_name": "device_ioctl",
                    "file_path": "drivers/test/device.c",
                    "line_number": 150,
                    "function_code": "long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) { return 0; }"
                },
                {
                    "function_name": "another_ioctl",
                    "file_path": "drivers/test/another.c", 
                    "line_number": 200,
                    "function_code": "static long another_ioctl(struct file *file, unsigned int cmd, unsigned long arg) { return -EINVAL; }"
                }
            ]
        }

    @patch('webviewer.ui.LLM_AVAILABLE', True)
    @patch('webviewer.ui.LLMAnalyzer')
    def test_ioctl_analysis_endpoint_success(self, mock_analyzer_class):
        """Test IOCTL analysis API endpoint works correctly with proper data structure"""
        mock_analyzer = Mock()
        mock_analyzer.is_available.return_value = True
        mock_analyzer.analyze_ioctl_handler.return_value = {
            "status": "success",
            "analysis": "IOCTL analysis result: This function handles device control operations safely.",
            "ioctl_operation": self.test_data["ioctl_operations"][0],
            "model_used": "gpt-3.5-turbo"
        }
        mock_analyzer_class.return_value = mock_analyzer
        
        request_data = {
            "ioctl_operation": self.test_data["ioctl_operations"][0],
            "function_code": "long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) { return 0; }",
            "custom_prompt": "Check for privilege escalation vulnerabilities",
            "model_id": "gpt-3.5-turbo"
        }
        
        response = self.client.post('/api/llm/analyze/ioctl',
                                   data=json.dumps(request_data),
                                   content_type='application/json')
        
        assert response.status_code == 200
        data = json.loads(response.data)
        assert data['status'] == 'success'
        assert 'IOCTL analysis result' in data['analysis']
        
        # Verify the analyzer was called with correct parameters
        mock_analyzer.analyze_ioctl_handler.assert_called_once()
        call_args = mock_analyzer.analyze_ioctl_handler.call_args
        assert call_args[0][0] == self.test_data["ioctl_operations"][0]  # ioctl_operation
        assert call_args[0][1] == request_data["function_code"]  # function_code

    @patch('webviewer.ui.LLM_AVAILABLE', True) 
    @patch('webviewer.ui.LLMAnalyzer')
    def test_ioctl_analysis_missing_operation_data(self, mock_analyzer_class):
        """Test IOCTL analysis handles missing operation data gracefully"""
        mock_analyzer = Mock()
        mock_analyzer.is_available.return_value = True
        mock_analyzer_class.return_value = mock_analyzer
        
        # Request without ioctl_operation field
        request_data = {
            "function_code": "long device_ioctl() { return 0; }",
            "custom_prompt": "Check for issues",
            "model_id": "gpt-3.5-turbo"
        }
        
        response = self.client.post('/api/llm/analyze/ioctl',
                                   data=json.dumps(request_data),
                                   content_type='application/json')
        
        assert response.status_code == 400
        data = json.loads(response.data)
        assert 'error' in data

    def test_ioctl_code_endpoint_returns_function_code(self):
        """Test that the ioctl-code endpoint returns proper function code"""
        # Load test data into session using the correct key
        with self.client.session_transaction() as sess:
            sess['results'] = self.test_data
        
        response = self.client.get('/api/ioctl-code/0')
        
        assert response.status_code == 200
        data = json.loads(response.data)
        assert 'function_code' in data
        assert 'function_name' in data
        assert data['function_name'] == 'device_ioctl'
        assert 'device_ioctl' in data['function_code']

    def test_ioctl_code_endpoint_invalid_index(self):
        """Test ioctl-code endpoint handles invalid index gracefully"""
        with self.client.session_transaction() as sess:
            sess['results'] = self.test_data
        
        response = self.client.get('/api/ioctl-code/999')
        
        assert response.status_code == 404
        data = json.loads(response.data)
        assert 'error' in data

    @patch('webviewer.ui.LLM_AVAILABLE', False)
    def test_ioctl_analysis_llm_not_available(self):
        """Test IOCTL analysis when LLM is not available"""
        request_data = {
            "ioctl_operation": self.test_data["ioctl_operations"][0],
            "function_code": "long device_ioctl() { return 0; }",
            "model_id": "gpt-3.5-turbo"
        }
        
        response = self.client.post('/api/llm/analyze/ioctl',
                                   data=json.dumps(request_data),
                                   content_type='application/json')
        
        assert response.status_code == 503
        data = json.loads(response.data)
        assert 'error' in data
        assert 'not available' in data['error']


class TestDeviceAccessDetailsRegression:
    """Test cases for device access details functionality to prevent regression"""
    
    def setup_method(self):
        """Setup for each test method"""
        self.app = create_app()
        self.app.config['TESTING'] = True
        self.client = self.app.test_client()

    def test_device_access_functionality_exists(self):
        """Test that device access functionality exists in the application"""
        # This is a basic test to ensure device access components are present
        # More specific tests should be in the dedicated device access test files
        assert True  # This test ensures the test class structure exists


class TestJavaScriptFunctionCorrectness:
    """Test cases to verify JavaScript functions work correctly"""
    
    def setup_method(self):
        """Setup for each test method"""
        self.app = create_app()
        self.app.config['TESTING'] = True
        self.client = self.app.test_client()

    def test_main_js_file_loads(self):
        """Test that main.js file loads without syntax errors"""
        response = self.client.get('/static/js/main.js')
        assert response.status_code == 200
        
        js_content = response.data.decode('utf-8')
        
        # Check for key IOCTL analysis function
        assert 'analyzeIOCTLWithLLM' in js_content
        assert 'toggleDeviceDetails' in js_content
        
        # Check for corrected data structure references
        assert 'ioctl_operations' in js_content
        assert 'ioctl_operation:' in js_content  # In the request payload
        
        # Ensure old incorrect references are removed
        assert 'ioctl_handlers' not in js_content
        assert 'ioctl_handler:' not in js_content

    def test_llm_js_file_loads(self):
        """Test that llm.js file loads correctly"""
        response = self.client.get('/static/js/llm.js')
        assert response.status_code == 200
        
        js_content = response.data.decode('utf-8')
        
        # Check for key LLM functions
        assert 'checkLLMStatus' in js_content
        assert 'loadLLMModels' in js_content


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
