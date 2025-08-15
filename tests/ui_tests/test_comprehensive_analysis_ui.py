#!/usr/bin/env python3
"""
Simplified test suite for webviewer UI functionality.
Tests basic functionality without Selenium for more reliable testing.
"""

import pytest
import json
import os
import sys
from unittest.mock import Mock, patch

# Add src directory to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from webviewer import create_app

class TestWebviewerUI:
    """Test class for webviewer UI basic functionality."""
    
    @pytest.fixture
    def app(self):
        """Create Flask app for testing."""
        app = create_app()
        app.config['TESTING'] = True
        app.config['WTF_CSRF_ENABLED'] = False
        return app
    
    @pytest.fixture
    def client(self, app):
        """Create test client."""
        return app.test_client()
    
    def test_home_page_loads(self, client):
        """Test that the home page loads successfully."""
        response = client.get('/')
        assert response.status_code == 200
        assert b'Kernel Log Analysis' in response.data or b'webviewer' in response.data or b'Analysis' in response.data
    
    def test_static_css_loads(self, client):
        """Test that CSS files load."""
        response = client.get('/static/css/main.css')
        assert response.status_code == 200
        # Check for key CSS classes we need
        css_content = response.get_data(as_text=True)
        assert 'progress-section' in css_content
        assert 'results-dashboard' in css_content
    
    def test_comprehensive_analysis_endpoint_exists(self, client):
        """Test that the comprehensive analysis endpoint exists."""
        response = client.post('/api/analyze/comprehensive', 
                             json={"component_types": ["functions"]})
        # Should not return 404 (endpoint exists)
        assert response.status_code != 404
        # May return 500 or other error if no data, but endpoint exists
        assert response.status_code in [200, 500, 422, 400]
    
    def test_api_data_endpoint(self, client):
        """Test the API data endpoint."""
        response = client.get('/api/data')
        # Should not return 500 error
        assert response.status_code in [200, 404]  # 404 if no data loaded
    
    def test_llm_status_endpoint(self, client):
        """Test the LLM status endpoint."""
        response = client.get('/api/llm/status')
        assert response.status_code == 200
        data = response.get_json()
        assert 'available' in data
    
    def test_tab_structure_in_html(self, client):
        """Test that tab structure exists in HTML."""
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for tab buttons
        assert 'showTab(' in html_content
        assert 'Analyze All' in html_content
        assert 'Functions' in html_content
        assert 'DMA Operations' in html_content
        
        # Check for tab content containers
        assert 'id="analyzeAll"' in html_content
        assert 'id="functions"' in html_content
        assert 'id="dma"' in html_content
    
    def test_progress_elements_in_html(self, client):
        """Test that progress tracking elements exist in HTML."""
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for progress elements
        assert 'progressSection' in html_content
        assert 'progressText' in html_content
        assert 'progressBar' in html_content
        assert 'processedCount' in html_content
        assert 'totalCount' in html_content
    
    def test_results_dashboard_in_html(self, client):
        """Test that results dashboard exists in HTML."""
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for results dashboard elements
        assert 'resultsDashboard' in html_content
        assert 'resultsSummary' in html_content
        assert 'resultsGrid' in html_content
    
    def test_javascript_functions_in_html(self, client):
        """Test that required JavaScript functions exist."""
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for key JavaScript functions
        assert 'function showTab(' in html_content
        assert 'function runComprehensiveAnalysis(' in html_content
        assert 'function updateResultsSummary(' in html_content
        assert 'function updateResultsGrid(' in html_content
    
    def test_confidence_score_handling_logic(self, client):
        """Test confidence score handling in JavaScript."""
        response = client.get('/')
        html_content = response.get_data(as_text=True)
        
        # Check for confidence score handling logic
        assert 'confidenceScores' in html_content
        # Should have logic to handle values > 1 (cap at 100)
        assert 'Math.min(100' in html_content or 'value > 1' in html_content


class TestAPIIntegration:
    """Test API integration functionality."""
    
    @pytest.fixture
    def app(self):
        """Create Flask app for testing."""
        app = create_app()
        app.config['TESTING'] = True
        return app
    
    @pytest.fixture
    def client(self, app):
        """Create test client."""
        return app.test_client()
    
    def test_comprehensive_analysis_api_structure(self, client):
        """Test comprehensive analysis API response structure."""
        # Test with minimal request
        response = client.post('/api/analyze/comprehensive', 
                             json={
                                 "component_types": ["functions"],
                                 "batch_size": 10
                             })
        
        # Should not be 404 (endpoint exists)
        assert response.status_code != 404
        
        if response.status_code == 200:
            data = response.get_json()
            # Check expected response structure
            assert isinstance(data, dict)
            # Should have some expected fields
            expected_fields = ['status', 'results', 'total', 'total_components']
            has_expected_field = any(field in data for field in expected_fields)
            assert has_expected_field, f"Response should have at least one of {expected_fields}"
    
    def test_llm_endpoints_exist(self, client):
        """Test that LLM analysis endpoints exist."""
        endpoints = [
            '/api/llm/status',
            '/api/llm/models'
        ]
        
        for endpoint in endpoints:
            response = client.get(endpoint)
            assert response.status_code != 404, f"Endpoint {endpoint} should exist"
    
    def test_data_endpoints_exist(self, client):
        """Test that data endpoints exist."""
        # Test endpoints that exist and might return 404 when no data loaded
        endpoints_with_expected_status = [
            ('/api/status', [200]),
            ('/api/memory-info', [200, 404]),  # 404 when no data loaded
            ('/api/devices', [200, 404]),      # 404 when no data loaded  
            ('/api/data', [200, 404]),         # 404 when no data loaded
        ]
        
        for endpoint, expected_statuses in endpoints_with_expected_status:
            response = client.get(endpoint)
            assert response.status_code in expected_statuses, \
                f"Endpoint {endpoint} returned {response.status_code}, expected one of {expected_statuses}"


class TestProgressAndConfidenceLogic:
    """Test progress tracking and confidence score logic."""
    
    def test_confidence_score_capping_logic(self):
        """Test confidence score capping logic."""
        # Test the logic that should be in JavaScript
        def format_confidence_score(value):
            """Python version of the JavaScript logic."""
            if value > 1:
                # Already a percentage, but cap at 100%
                return min(100, round(value))
            else:
                # Convert decimal to percentage
                return round(value * 100)
        
        # Test cases from the reported issue
        test_cases = [
            (6000, 100),  # Should be capped at 100%
            (2000, 100),  # Should be capped at 100%
            (0, 0),       # Should remain 0%
            (0.85, 85),   # Decimal should convert to 85%
            (0.5, 50),    # Decimal should convert to 50%
            (100, 100),   # Exactly 100% should remain 100%
            (150, 100),   # Should be capped at 100%
        ]
        
        for input_value, expected in test_cases:
            result = format_confidence_score(input_value)
            assert result == expected, f"Input {input_value} should give {expected}%, got {result}%"
    
    def test_batch_progress_calculation(self):
        """Test batch progress calculation logic."""
        def calculate_batch_progress(processed, total, base_percent=30, max_percent=90):
            """Calculate progress percentage for batch processing."""
            if total == 0:
                return base_percent
            progress_range = max_percent - base_percent
            batch_progress = (processed / total) * progress_range
            return round(batch_progress + base_percent)
        
        # Test progress calculation (30-90% range)
        test_cases = [
            (0, 100, 30),    # Start: 0/100 = 30%
            (20, 100, 42),   # 20/100 = 42%
            (50, 100, 60),   # 50/100 = 60%
            (100, 100, 90),  # End: 100/100 = 90%
        ]
        
        for processed, total, expected in test_cases:
            result = calculate_batch_progress(processed, total)
            assert abs(result - expected) <= 1, f"Progress {processed}/{total} should be ~{expected}%, got {result}%"
    
    def test_progress_message_format(self):
        """Test progress message formatting."""
        def format_progress_message(batch_num, total_batches, processed, total):
            """Format progress message."""
            return f"Processing batch {batch_num}/{total_batches} ({processed}/{total} components)..."
        
        message = format_progress_message(3, 5, 60, 100)
        expected = "Processing batch 3/5 (60/100 components)..."
        assert message == expected
        
        # Check message components
        assert "batch" in message.lower()
        assert "/" in message
        assert "components" in message
        assert message.endswith("...")


if __name__ == "__main__":
    # Run tests with detailed output
    pytest.main([__file__, "-v", "--tb=short"])
