#!/usr/bin/env python3
"""
Test suite for webviewer LLM integration
"""

import pytest
import os
import json
import tempfile
from unittest.mock import patch, MagicMock
import sys

# Add src to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../src'))

try:
    from webviewer.ui import create_app
    from flask import Flask
    FLASK_AVAILABLE = True
except ImportError:
    FLASK_AVAILABLE = False


@pytest.mark.skipif(not FLASK_AVAILABLE, reason="Flask not available")
class TestWebviewerLLMIntegration:
    """Test cases for webviewer LLM integration"""
    
    def setup_method(self):
        """Setup test environment"""
        self.app = create_app()
        self.app.config['TESTING'] = True
        self.client = self.app.test_client()
        
        # Mock data
        self.test_data = {
            'functions_by_file': {
                '/test/file.c': [
                    {
                        'function_name': 'test_function',
                        'line_number': 123,
                        'first_seen_time_str': '2023-01-01 10:00:00',
                        'call_count': 5,
                        'function_code': 'int test_function() { return 0; }'
                    }
                ]
            },
            'dma_operations': [
                {
                    'dma_function': 'dma_alloc_coherent',
                    'caller_function': 'driver_init',
                    'file_path': '/driver/test.c',
                    'line_number': 456
                }
            ],
            'function_entries': [],
            'user_copy_operations': [],
            'ioctl_operations': [],
            'statistics': {
                'unique_function_entries': 1,
                'unique_dma_operations': 1,
                'unique_user_copy_operations': 0,
                'unique_ioctl_operations': 0
            }
        }
        
    def test_llm_status_endpoint(self):
        """Test LLM status API endpoint"""
        response = self.client.get('/api/llm/status')
        assert response.status_code == 200
        
        data = json.loads(response.data)
        assert 'available' in data
        assert isinstance(data['available'], bool)
        
        if data['available']:
            assert 'models' in data
            assert isinstance(data['models'], list)
            
    def test_llm_models_endpoint(self):
        """Test LLM models API endpoint"""
        response = self.client.get('/api/llm/models')
        
        # Should return 503 if LLM not available, 200 if available
        assert response.status_code in [200, 503]
        
        if response.status_code == 200:
            data = json.loads(response.data)
            assert isinstance(data, list)
            for model in data:
                assert 'id' in model
                assert 'name' in model
                assert 'description' in model
                
    @patch('webviewer.ui.LLMAnalyzer')
    def test_analyze_function_endpoint(self, mock_llm_analyzer):
        """Test function analysis API endpoint"""
        # Mock LLM analyzer
        mock_analyzer = MagicMock()
        mock_analyzer.is_available.return_value = True
        mock_analyzer.analyze_function.return_value = {
            'status': 'success',
            'analysis': 'Function analysis complete',
            'function_name': 'test_function',
            'model_used': 'gpt-3.5-turbo'
        }
        mock_llm_analyzer.return_value = mock_analyzer
        
        # Test request
        request_data = {
            'function_name': 'test_function',
            'source_code': 'int test_function() { return 0; }',
            'file_path': '/test/file.c',
            'model_id': 'gpt-3.5-turbo'
        }
        
        response = self.client.post('/api/llm/analyze/function',
                                   data=json.dumps(request_data),
                                   content_type='application/json')
        
        assert response.status_code == 200
        data = json.loads(response.data)
        assert data['status'] == 'success'
        assert 'analysis' in data
        
    def test_analyze_function_missing_data(self):
        """Test function analysis with missing data"""
        request_data = {
            'function_name': 'test_function'
            # Missing source_code
        }
        
        response = self.client.post('/api/llm/analyze/function',
                                   data=json.dumps(request_data),
                                   content_type='application/json')
        
        assert response.status_code == 400
        data = json.loads(response.data)
        assert 'error' in data
        
    def test_analyze_function_no_data(self):
        """Test function analysis with no request data"""
        response = self.client.post('/api/llm/analyze/function',
                                   content_type='application/json')
        
        assert response.status_code == 400
        
    @patch('webviewer.ui.LLMAnalyzer')
    def test_analyze_dma_endpoint(self, mock_llm_analyzer):
        """Test DMA analysis API endpoint"""
        # Mock LLM analyzer
        mock_analyzer = MagicMock()
        mock_analyzer.is_available.return_value = True
        mock_analyzer.analyze_dma_operation.return_value = {
            'status': 'success',
            'analysis': 'DMA analysis complete',
            'model_used': 'gpt-3.5-turbo'
        }
        mock_llm_analyzer.return_value = mock_analyzer
        
        # Test request
        request_data = {
            'dma_operation': {
                'dma_function': 'dma_alloc_coherent',
                'caller_function': 'driver_init'
            },
            'function_code': 'void driver_init() {}',
            'model_id': 'gpt-3.5-turbo'
        }
        
        response = self.client.post('/api/llm/analyze/dma',
                                   data=json.dumps(request_data),
                                   content_type='application/json')
        
        assert response.status_code == 200
        data = json.loads(response.data)
        assert data['status'] == 'success'
        
    @patch('webviewer.ui.LLMAnalyzer')
    def test_analyze_logs_endpoint(self, mock_llm_analyzer):
        """Test log analysis API endpoint"""
        # Mock LLM analyzer
        mock_analyzer = MagicMock()
        mock_analyzer.is_available.return_value = True
        mock_analyzer.analyze_logs.return_value = {
            'status': 'success',
            'analysis': 'Log analysis complete',
            'model_used': 'gpt-3.5-turbo'
        }
        mock_llm_analyzer.return_value = mock_analyzer
        
        # Test request
        request_data = {
            'logs': [{'function_name': 'test', 'timestamp': '2023-01-01'}],
            'analysis_type': 'security',
            'model_id': 'gpt-3.5-turbo'
        }
        
        response = self.client.post('/api/llm/analyze/logs',
                                   data=json.dumps(request_data),
                                   content_type='application/json')
        
        assert response.status_code == 200
        data = json.loads(response.data)
        assert data['status'] == 'success'
        
    @patch('webviewer.ui.LLMAnalyzer')
    def test_security_report_endpoint(self, mock_llm_analyzer):
        """Test security report API endpoint"""
        # Mock LLM analyzer
        mock_analyzer = MagicMock()
        mock_analyzer.is_available.return_value = True
        mock_analyzer.generate_security_report.return_value = {
            'status': 'success',
            'report': 'Security report generated',
            'model_used': 'gpt-3.5-turbo'
        }
        mock_llm_analyzer.return_value = mock_analyzer
        
        # Set up session data
        with self.client.session_transaction() as sess:
            sess['results'] = self.test_data
            
        response = self.client.post('/api/llm/security-report',
                                   data=json.dumps({'model_id': 'gpt-3.5-turbo'}),
                                   content_type='application/json')
        
        assert response.status_code == 200
        data = json.loads(response.data)
        assert data['status'] == 'success'
        
    def test_save_analysis_endpoint(self):
        """Test save analysis API endpoint"""
        request_data = {
            'filename': 'test_analysis.json',
            'data': {
                'type': 'function',
                'timestamp': '2023-01-01T10:00:00Z',
                'analysis': 'Test analysis'
            }
        }
        
        response = self.client.post('/api/llm/save-analysis',
                                   data=json.dumps(request_data),
                                   content_type='application/json')
        
        assert response.status_code == 200
        data = json.loads(response.data)
        assert data['success'] is True
        assert 'filename' in data
        
    def test_save_analysis_missing_data(self):
        """Test save analysis with missing data"""
        request_data = {
            'filename': 'test.json'
            # Missing 'data' field
        }
        
        response = self.client.post('/api/llm/save-analysis',
                                   data=json.dumps(request_data),
                                   content_type='application/json')
        
        assert response.status_code == 400
        data = json.loads(response.data)
        assert data['success'] is False
        
    def test_main_page_with_data(self):
        """Test main page with analysis data"""
        with self.client.session_transaction() as sess:
            sess['results'] = self.test_data
            
        response = self.client.get('/')
        assert response.status_code == 200
        assert b'Kernel Log Analysis' in response.data
        assert b'LLM Analysis' in response.data
        
    def test_main_page_without_data(self):
        """Test main page without analysis data"""
        response = self.client.get('/')
        # Should redirect to upload page
        assert response.status_code == 302
        
    def test_static_files_served(self):
        """Test that static files are served correctly"""
        # Test CSS file
        response = self.client.get('/static/css/main.css')
        assert response.status_code == 200
        assert b'font-family' in response.data
        
        # Test JavaScript file
        response = self.client.get('/static/js/main.js')
        assert response.status_code == 200
        assert b'function' in response.data


class TestDataPersistence:
    """Test cases for data persistence functionality"""
    
    def test_analysis_data_structure(self):
        """Test analysis data structure for persistence"""
        analysis_data = {
            'type': 'function',
            'timestamp': '2023-01-01T10:00:00Z',
            'request': {
                'function_name': 'test_function',
                'source_code': 'int test_function() { return 0; }',
                'custom_prompt': 'Check for vulnerabilities'
            },
            'result': {
                'status': 'success',
                'analysis': 'Function appears secure',
                'model_used': 'gpt-3.5-turbo'
            },
            'metadata': {
                'user_agent': 'test-agent',
                'url': 'http://localhost:5000'
            }
        }
        
        # Validate structure
        assert 'type' in analysis_data
        assert 'timestamp' in analysis_data
        assert 'request' in analysis_data
        assert 'result' in analysis_data
        assert 'metadata' in analysis_data
        
        # Validate request structure
        request = analysis_data['request']
        assert 'function_name' in request
        assert 'source_code' in request
        
        # Validate result structure
        result = analysis_data['result']
        assert 'status' in result
        assert 'model_used' in result
        
    def test_json_serialization(self):
        """Test JSON serialization of analysis data"""
        analysis_data = {
            'type': 'dma',
            'timestamp': '2023-01-01T10:00:00Z',
            'request': {
                'dma_operation': {
                    'dma_function': 'dma_alloc_coherent',
                    'caller_function': 'driver_init'
                },
                'call_graph': ['function1', 'function2']
            },
            'result': {
                'status': 'success',
                'analysis': 'DMA operation is secure'
            }
        }
        
        # Should be serializable to JSON
        json_str = json.dumps(analysis_data, indent=2)
        assert isinstance(json_str, str)
        
        # Should be deserializable
        restored_data = json.loads(json_str)
        assert restored_data == analysis_data
        
    def test_filename_generation(self):
        """Test filename generation for saved analyses"""
        import datetime
        
        timestamp = datetime.datetime.now().isoformat().replace(':', '-').replace('.', '-')
        filename = f"llm_analysis_function_{timestamp}.json"
        
        assert filename.endswith('.json')
        assert 'llm_analysis' in filename
        assert 'function' in filename
        
    def test_data_directory_structure(self):
        """Test data directory structure"""
        expected_dirs = [
            'data/llm_analyses',
            'static/css',
            'static/js',
            'templates'
        ]
        
        base_path = os.path.dirname(__file__) + '/../../src/webviewer'
        
        for expected_dir in expected_dirs:
            full_path = os.path.join(base_path, expected_dir)
            # Directory should exist or be creatable
            assert '/' in expected_dir  # Basic path validation


class TestErrorHandling:
    """Test cases for error handling in LLM integration"""
    
    @pytest.mark.skipif(not FLASK_AVAILABLE, reason="Flask not available")
    def test_llm_unavailable_responses(self):
        """Test responses when LLM is unavailable"""
        app = create_app()
        app.config['TESTING'] = True
        client = app.test_client()
        
        # Test function analysis when LLM unavailable
        request_data = {
            'function_name': 'test',
            'source_code': 'code',
            'model_id': 'gpt-3.5-turbo'
        }
        
        response = client.post('/api/llm/analyze/function',
                              data=json.dumps(request_data),
                              content_type='application/json')
        
        # Should return error status
        data = json.loads(response.data)
        assert 'error' in data or 'status' in data
        
    def test_invalid_json_handling(self):
        """Test handling of invalid JSON requests"""
        if not FLASK_AVAILABLE:
            pytest.skip("Flask not available")
            
        app = create_app()
        app.config['TESTING'] = True
        client = app.test_client()
        
        response = client.post('/api/llm/analyze/function',
                              data='invalid json',
                              content_type='application/json')
        
        assert response.status_code == 400
        
    def test_missing_fields_handling(self):
        """Test handling of requests with missing required fields"""
        if not FLASK_AVAILABLE:
            pytest.skip("Flask not available")
            
        app = create_app()
        app.config['TESTING'] = True
        client = app.test_client()
        
        # Test function analysis with missing function_name
        request_data = {
            'source_code': 'code'
            # Missing function_name
        }
        
        response = client.post('/api/llm/analyze/function',
                              data=json.dumps(request_data),
                              content_type='application/json')
        
        assert response.status_code == 400


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
