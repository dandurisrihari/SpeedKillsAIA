#!/usr/bin/env python3
"""
Tests for the enhanced web UI with comprehensive analysis features
"""

import pytest
import json
import tempfile
import os
from unittest.mock import Mock, patch, MagicMock

# Import the webviewer module
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent.parent.parent / 'src'))

try:
    import src.webviewer.ui as webviewer_ui
    from src.webviewer.ui import create_app
    WEBVIEWER_AVAILABLE = True
except ImportError:
    WEBVIEWER_AVAILABLE = False
    create_app = None
    webviewer_ui = None

@pytest.fixture
def mock_data():
    """Mock data for testing"""
    return {
        "metadata": {
            "log_file": "test_kernel.log",
            "parsed_at": "2024-01-01T12:00:00"
        },
        "dma_operations": [
            {
                "function_name": "test_dma_alloc",
                "device_name": "test_device",
                "size": 4096,
                "direction": "bidirectional",
                "line_number": 100,
                "file_path": "/kernel/drivers/test.c",
                "function_code": "void test_dma_alloc() { dma_alloc_coherent(...); }"
            }
        ],
        "aia_accelerators": [
            {
                "accelerator_name": "test_aia",
                "initialization_function": "init_test_aia",
                "file_path": "/kernel/drivers/aia/test.c",
                "line_number": 200,
                "function_code": "int init_test_aia() { /* init code */ }"
            }
        ],
        "user_copy_operations": [
            {
                "copy_function": "copy_from_user",
                "caller_function": "aia_ioctl_handler",
                "file_path": "/kernel/drivers/aia.c",
                "line_number": 300,
                "function_code": "long aia_ioctl_handler() { copy_from_user(...); }"
            }
        ],
        "ioctl_operations": [
            {
                "handler_name": "aia_device_ioctl",
                "file_path": "/kernel/drivers/aia.c",
                "line_number": 400,
                "ioctl_commands": ["AIA_ALLOC_MEM", "AIA_FREE_MEM"],
                "function_code": "long aia_device_ioctl() { switch(cmd) { ... } }"
            }
        ]
    }

@pytest.fixture
def app():
    """Create test Flask app"""
    if not WEBVIEWER_AVAILABLE:
        pytest.skip("Webviewer not available")
    
    app = create_app()
    app.config['TESTING'] = True
    return app

@pytest.fixture
def client(app):
    """Create test client"""
    return app.test_client()

class TestEnhancedWebUI:
    """Test enhanced web UI functionality"""
    
    def test_index_page_loads_with_analyze_all_section(self, client, mock_data):
        """Test that the index page loads with the new analyze all section"""
        # Set up global data
        webviewer_ui.global_data = mock_data
        
        response = client.get('/')
        assert response.status_code == 200
        assert b'analyze-all-section' in response.data
        assert b'batch-analysis' in response.data

    def test_comprehensive_analysis_endpoint(self, client, mock_data):
        """Test the comprehensive analysis endpoint"""
        # Set up global data
        webviewer_ui.global_data = mock_data
        
        response = client.post('/api/analyze/comprehensive', 
                              json={
                                  'component_types': ['dma_operations', 'aia_accelerators'],
                                  'batch_size': 2
                              })
        assert response.status_code == 200
        data = json.loads(response.data)
        assert 'status' in data
        assert 'results' in data
        assert 'statistics' in data

@pytest.mark.skipif(not WEBVIEWER_AVAILABLE, reason="Webviewer not available")
class TestEnhancedUIIntegration:
    """Integration tests for enhanced UI features"""
    
    def test_comprehensive_analysis_with_no_data(self, client):
        """Test comprehensive analysis with no data"""
        # Clear global data
        webviewer_ui.global_data = {}
        
        response = client.post('/api/analyze/comprehensive', 
                              json={'component_types': ['dma_operations']})
        assert response.status_code == 200
        data = json.loads(response.data)
        assert data['status'] == 'completed'
        assert len(data['results']) == 0
