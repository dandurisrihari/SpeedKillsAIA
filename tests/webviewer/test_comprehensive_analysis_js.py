#!/usr/bin/env python3
"""
Tests for comprehensive analysis functionality - simplified and working version
"""

import pytest
import json
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent.parent.parent / 'src'))

try:
    from src.webviewer.ui import create_app
    FLASK_AVAILABLE = True
except ImportError:
    create_app = None
    FLASK_AVAILABLE = False

@pytest.fixture
def client():
    """Create a test client for the Flask app"""
    if not FLASK_AVAILABLE:
        pytest.skip("Flask/Webviewer not available")
    
    app = create_app()
    app.config['TESTING'] = True
    
    with app.test_client() as client:
        yield client

class TestComprehensiveAnalysisUI:
    """Test comprehensive analysis UI functionality"""
    
    def test_analyze_all_button_functionality(self, client):
        """Test that the comprehensive analysis button exists and has correct attributes"""
        # Set test data directly in the module
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
        
        # Check for analyze all button
        assert 'analyzeAllBtn' in html_content
        assert 'runComprehensiveAnalysis' in html_content
        assert 'Analyze All Components' in html_content

    def test_results_dashboard_elements(self, client):
        """Test that results dashboard elements are present"""
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = {
            'metadata': {'log_file': 'test.log'},
            'functions_by_file': {},
            'statistics': {}
        }
        
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for results dashboard elements
        assert 'resultsDashboard' in html_content
        assert 'resultsSummary' in html_content
        assert 'resultsGrid' in html_content
        assert 'Comprehensive Analysis Results' in html_content

    def test_control_elements_present(self, client):
        """Test that control elements are present in the template"""
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = {
            'metadata': {'log_file': 'test.log'},
            'functions_by_file': {},
            'statistics': {}
        }
        
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for control elements
        assert 'analyzeAllModel' in html_content
        assert 'analyzeAllPrompt' in html_content
        assert 'batchSize' in html_content
        assert 'maxComponents' in html_content
        assert 'confidenceThreshold' in html_content

    def test_api_data_endpoint(self, client):
        """Test the /api/data endpoint returns proper JSON"""
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = {
            'metadata': {'log_file': 'test.log'},
            'functions_by_file': {},
            'dma_operations': [],
            'statistics': {}
        }
        
        response = client.get('/api/data')
        assert response.status_code == 200
        assert response.content_type == 'application/json'
        
        data = json.loads(response.get_data(as_text=True))
        assert 'functions_by_file' in data
        assert 'dma_operations' in data
        assert 'statistics' in data

    def test_confidence_bar_css_classes(self, client):
        """Test that confidence bar CSS classes are properly included"""
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = {
            'metadata': {'log_file': 'test.log'},
            'functions_by_file': {},
            'statistics': {}
        }
        
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for confidence-related classes and elements
        assert 'confidence' in html_content.lower()
        assert 'progress-bar' in html_content

    def test_result_card_structure(self, client):
        """Test that result card structure elements are present"""
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = {
            'metadata': {'log_file': 'test.log'},
            'functions_by_file': {},
            'statistics': {}
        }
        
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for result structure elements
        assert 'results-grid' in html_content
        assert 'results-summary' in html_content
        assert 'results-dashboard' in html_content

class TestBatchProcessingControls:
    """Test batch processing controls functionality"""
    
    def test_batch_size_options(self, client):
        """Test that batch size options are present"""
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = {
            'metadata': {'log_file': 'test.log'},
            'functions_by_file': {},
            'statistics': {}
        }
        
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for batch size options
        assert 'value="1"' in html_content
        assert 'value="3"' in html_content
        assert 'value="5"' in html_content
        assert 'Slowest, Most Reliable' in html_content
        assert 'Recommended' in html_content

    def test_max_components_options(self, client):
        """Test that max components options are present"""
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = {
            'metadata': {'log_file': 'test.log'},
            'functions_by_file': {},
            'statistics': {}
        }
        
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for max components options
        assert 'value="10"' in html_content
        assert 'value="25"' in html_content
        assert 'value="50"' in html_content
        assert 'Quick Test' in html_content
        assert 'Balanced' in html_content

    def test_progress_tracking_elements(self, client):
        """Test that progress tracking elements are present"""
        import src.webviewer.ui as ui_module
        ui_module.parsed_data = {
            'metadata': {'log_file': 'test.log'},
            'functions_by_file': {},
            'statistics': {}
        }
        
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for progress elements
        assert 'progressSection' in html_content
        assert 'progressBar' in html_content
        assert 'progressText' in html_content
        assert 'processedCount' in html_content
        assert 'totalCount' in html_content
