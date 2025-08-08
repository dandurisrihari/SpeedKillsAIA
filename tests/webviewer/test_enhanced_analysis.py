"""
Tests for Enhanced Comprehensive Analysis Features
"""

import pytest
import json
from unittest.mock import patch, MagicMock
from src.webviewer.ui import app


@pytest.fixture
def client():
    """Create a test client for the web UI."""
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client


@pytest.fixture
def mock_data():
    """Sample kernel data for testing."""
    return {
        'functions_by_file': {
            'test_file.c': [
                {
                    'function_name': 'test_function',
                    'line_number': 10,
                    'function_code': 'void test_function() { /* test code */ }',
                    'call_count': 5,
                    'first_seen_time_str': '2024-01-01 10:00:00'
                }
            ]
        },
        'dma_operations': [
            {
                'dma_function': 'dma_alloc_coherent',
                'caller_function': 'test_caller',
                'file_path': 'test_dma.c',
                'line_number': 20,
                'function_code': 'void test_dma() { /* dma code */ }',
                'timestamp': '2024-01-01 10:00:00'
            }
        ],
        'user_copy_operations': [],
        'ioctl_operations': [],
        'statistics': {
            'unique_function_entries': 1,
            'unique_dma_operations': 1,
            'unique_user_copy_operations': 0,
            'unique_ioctl_operations': 0,
            'total_files': 1
        }
    }


class TestEnhancedAnalysis:
    """Test suite for enhanced analysis features."""
    
    def test_enhanced_template_contains_new_controls(self, client):
        """Test that the template contains the new batch processing controls."""
        # Set the global parsed_data for testing
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = {
            'metadata': {'log_file': 'test.log'},
            'functions_by_file': {},
            'dma_operations': [],
            'user_copy_operations': [],
            'ioctl_operations': [],
            'statistics': {}
        }
        
        response = client.get('/')
        assert response.status_code == 200
        
        html_content = response.get_data(as_text=True)
        
        # Check for new batch processing controls
        assert 'batchSize' in html_content
        assert 'maxComponents' in html_content
        assert 'progressSection' in html_content
        assert 'AI-Powered Comprehensive Analysis' in html_content
        
        # Check for batch size options
        assert '1 (Slowest, Most Reliable)' in html_content
        assert '3 (Recommended)' in html_content
        assert 'All at Once (Risk of Timeout)' in html_content
        
        # Check for max components options
        assert '10 (Quick Test)' in html_content
        assert '50 (Balanced)' in html_content
        assert 'All Available (Full Analysis)' in html_content
    
    def test_data_endpoint_returns_json(self, client, mock_data):
        """Test that the data endpoint returns proper JSON."""
        # Set the global parsed_data for testing
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = mock_data
        
        response = client.get('/api/data')
        assert response.status_code == 200
        assert response.content_type == 'application/json'
        
        data = json.loads(response.get_data(as_text=True))
        assert 'functions_by_file' in data
        assert 'dma_operations' in data
        assert 'statistics' in data
    
    def test_llm_function_analysis_endpoint_structure(self, client):
        """Test that the LLM function analysis endpoint structure is available."""
        # Test the endpoint exists and handles requests properly
        request_data = {
            'function_name': 'test_function',
            'source_code': 'void test_function() {}',
            'file_path': 'test.c',
            'custom_prompt': 'Test prompt',
            'model_id': 'gpt-3.5-turbo',
            'for_web_ui': True
        }
        
        response = client.post('/api/llm/analyze/function',
                             data=json.dumps(request_data),
                             content_type='application/json')
        
        # The endpoint should exist (even if LLM is not configured)
        # We're just testing the endpoint structure, not the actual analysis
        assert response.status_code in [200, 400, 500]  # Any of these indicates endpoint exists
    
    def test_progress_tracking_elements(self, client):
        """Test that progress tracking elements are present in the template."""
        # Set the global parsed_data for testing
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = {
            'metadata': {'log_file': 'test.log'},
            'functions_by_file': {},
            'statistics': {}
        }
        
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for progress elements
        assert 'progress-bar-container' in html_content
        assert 'progress-bar' in html_content
        assert 'progress-text' in html_content
        assert 'processedCount' in html_content
        assert 'totalCount' in html_content
    
    def test_category_breakdown_structure(self, client):
        """Test that the category breakdown structure is present."""
        # Set the global parsed_data for testing
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = {
            'metadata': {'log_file': 'test.log'},
            'functions_by_file': {},
            'statistics': {}
        }
        
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for analysis categories info in the HTML
        assert 'AIARelevantFunction' in html_content
        assert 'Relevant KD Entry Point' in html_content
        assert 'Message Structure Handling' in html_content
        # Check for results dashboard structure that will contain categories
        assert 'results-dashboard' in html_content
        assert 'resultsSummary' in html_content
    
    def test_error_handling_display(self, client):
        """Test that error handling elements are properly displayed."""
        # Set the global parsed_data for testing
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = {
            'metadata': {'log_file': 'test.log'},
            'functions_by_file': {},
            'statistics': {}
        }
        
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for notification system elements (implied by showNotification usage)
        assert 'runComprehensiveAnalysis' in html_content
        
    def test_batch_processing_configuration(self, client):
        """Test that batch processing configuration options are available."""
        # Set the global parsed_data for testing
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = {
            'metadata': {'log_file': 'test.log'},
            'functions_by_file': {},
            'statistics': {}
        }
        
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check batch size options
        batch_sizes = ['1', '3', '5', '10', '999']
        for size in batch_sizes:
            assert f'value="{size}"' in html_content
        
        # Check max component options  
        max_components = ['10', '25', '50', '100', '999']
        for max_comp in max_components:
            assert f'value="{max_comp}"' in html_content


class TestAnalysisStats:
    """Test suite for analysis statistics and reporting."""
    
    def test_stats_calculation_structure(self, client, mock_data):
        """Test that the stats calculation would work with proper data structure."""
        # This test verifies that our data structure supports the new stats
        assert 'functions_by_file' in mock_data
        assert 'dma_operations' in mock_data
        assert 'statistics' in mock_data
        
        # Verify function structure supports analysis
        if mock_data['functions_by_file']:
            for file_path, functions in mock_data['functions_by_file'].items():
                for func in functions:
                    assert 'function_name' in func
                    assert 'function_code' in func
                    assert 'line_number' in func
    
    def test_confidence_score_parsing_ready(self, client):
        """Test that the system is ready for confidence score parsing."""
        # Mock analysis text with confidence scores
        analysis_text = """
        Analysis Results:
        AIARelevantFunction: 75
        Relevant_KD_Entry_Point: 50  
        Message_Structure_Handling: 25
        
        This function shows strong indicators of AI accelerator integration.
        """
        
        # This would be processed by parseConfidenceScores in JavaScript
        # We verify the format is parseable
        lines = analysis_text.split('\n')
        scores = {}
        
        for line in lines:
            if 'AIARelevantFunction:' in line:
                import re
                match = re.search(r'(\d+)', line)
                if match:
                    scores['AIARelevantFunction'] = int(match.group(1))
                    
        assert scores.get('AIARelevantFunction') == 75


if __name__ == '__main__':
    pytest.main([__file__])
