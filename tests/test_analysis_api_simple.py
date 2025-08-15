#!/usr/bin/env python3
"""
Simple test suite for webviewer analysis API endpoints.
Tests that all analysis buttons have working backend API endpoints.
"""

import pytest
import json
import sys
import os

# Add the src directory to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from src.webviewer.ui import create_app


class TestAnalysisAPIEndpoints:
    """Test suite for analysis API endpoints."""
    
    @classmethod
    def setup_class(cls):
        """Set up test class with Flask app."""
        cls.app = create_app()
        cls.app.config['TESTING'] = True
        cls.client = cls.app.test_client()
    
    def test_comprehensive_analysis_endpoint(self):
        """Test /api/analyze/comprehensive endpoint."""
        response = self.client.post('/api/analyze/comprehensive',
                                   data=json.dumps({
                                       'component_types': ['dma_operations', 'user_copy_operations'],
                                       'batch_size': 5,
                                       'model_id': 'gpt-3.5-turbo'
                                   }),
                                   content_type='application/json')
        
        assert response.status_code == 200
        data = json.loads(response.data)
        assert 'status' in data
        assert data['status'] in ['completed', 'success']
        assert 'results' in data
        assert isinstance(data['results'], list)
    
    def test_function_analysis_endpoint(self):
        """Test /api/llm/analyze/function endpoint."""
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
    
    def test_dma_analysis_endpoint(self):
        """Test /api/llm/analyze/dma endpoint."""
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
    
    def test_user_copy_analysis_endpoint(self):
        """Test /api/llm/analyze/user-copy endpoint."""
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
    
    def test_ioctl_analysis_endpoint(self):
        """Test /api/llm/analyze/ioctl endpoint.""" 
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
    
    def test_logs_analysis_endpoint(self):
        """Test /api/llm/analyze/logs endpoint."""
        response = self.client.post('/api/llm/analyze/logs',
                                   data=json.dumps({
                                       'logs': [
                                           {
                                               'function_name': 'test_function',
                                               'timestamp': '2023-01-01 12:00:00',
                                               'message': 'kernel: test log entry'
                                           }
                                       ],
                                       'analysis_type': 'security',
                                       'model_id': 'gpt-3.5-turbo'
                                   }),
                                   content_type='application/json')
        
        assert response.status_code in [200, 503]
        data = json.loads(response.data)
        assert 'error' in data or 'analysis' in data
    
    def test_all_endpoints_return_json(self):
        """Test that all endpoints return valid JSON (not HTML)."""
        endpoints_and_data = [
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
                'logs': [{'function_name': 'test', 'message': 'test log'}]
            })
        ]
        
        for endpoint, test_data in endpoints_and_data:
            response = self.client.post(endpoint,
                                       data=json.dumps(test_data),
                                       content_type='application/json')
            
            # Should not return 404 (endpoint exists)
            assert response.status_code != 404, f"Endpoint {endpoint} not found"
            
            # Should return valid JSON (not HTML)
            try:
                json.loads(response.data)
            except json.JSONDecodeError:
                pytest.fail(f"Endpoint {endpoint} returned invalid JSON: {response.data}")
            
            # Response should not contain HTML doctype
            response_text = response.data.decode('utf-8')
            assert '<!doctype' not in response_text.lower(), \
                f"Endpoint {endpoint} returned HTML instead of JSON"
    
    def test_comprehensive_analysis_request_body_fix(self):
        """Test that comprehensive analysis works with proper request body."""
        # This tests the fix where we added request body to the JavaScript fetch call
        response = self.client.post('/api/analyze/comprehensive',
                                   data=json.dumps({
                                       'component_types': ['dma_operations', 'user_copy_operations', 'ioctl_calls', 'functions'],
                                       'batch_size': 20,
                                       'model_id': 'gpt-3.5-turbo',
                                       'custom_prompt': ''
                                   }),
                                   content_type='application/json')
        
        assert response.status_code == 200
        data = json.loads(response.data)
        assert data['status'] in ['completed', 'success']
        assert 'results' in data
        assert 'total' in data
        
        # If no data is loaded, we should get an error message but still valid structure
        if data.get('error') == 'No data loaded':
            assert data['total'] == 0
            assert data['results'] == []
        else:
            # If data is loaded, verify full response structure
            assert 'statistics' in data
            stats = data['statistics']
            assert 'total_analyzed' in stats
            assert 'batch_size' in stats
            assert 'component_types' in stats
            assert 'llm_available' in stats


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
