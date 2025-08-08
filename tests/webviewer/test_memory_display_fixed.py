#!/usr/bin/env python3
"""
Simplified tests for webviewer memory display functionality
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
def mock_memory_data():
    """Mock memory data for testing"""
    return {
        "metadata": {
            "log_file": "test_memory.log",
            "parsed_at": "2024-01-01T12:00:00"
        },
        "memory_info": {
            "reserved_memory": [
                {
                    "start_address": "0x40000000",
                    "end_address": "0x5fffffff",
                    "size_kb": 524288,
                    "size_readable": "512 MiB",
                    "name": "test_pool",
                    "memory_type": "CMA",
                    "compatible_id": "test,cma"
                }
            ],
            "cma_pools": [],
            "memory_zones": [],
            "total_reserved_memory_kb": 524288,
            "summary": {
                "total_reserved_entries": 1,
                "total_cma_pools": 0,
                "total_zones": 0
            }
        },
        "function_entries": [],
        "dma_operations": [],
        "user_copy_operations": [],
        "ioctl_operations": [],
        "functions_by_file": {},
        "statistics": {
            "unique_function_entries": 0,
            "unique_dma_operations": 0,
            "unique_user_copy_operations": 0,
            "unique_ioctl_operations": 0,
            "total_files": 1,
            "files_need_analysis": 1
        }
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

@pytest.mark.skipif(not WEBVIEWER_AVAILABLE, reason="Webviewer not available")
class TestMemoryDisplay:
    """Simplified memory display tests"""
    
    def test_memory_tab_exists(self, client, mock_memory_data):
        """Test that the memory tab exists in the interface"""
        # Set up global data
        webviewer_ui.global_data = mock_memory_data
        
        response = client.get('/')
        assert response.status_code == 200
        # Just check that we can load the page
        assert b'Memory Info' in response.data or b'memory' in response.data

    def test_memory_api_endpoint(self, client, mock_memory_data):
        """Test the memory API endpoint"""
        # Set up global data
        webviewer_ui.global_data = mock_memory_data
        
        response = client.get('/api/memory')
        assert response.status_code == 200
        data = json.loads(response.data)
        assert 'memory_info' in data or 'results' in data

    def test_memory_with_no_data(self, client):
        """Test memory display with no data"""
        # Clear global data
        webviewer_ui.global_data = {}
        
        response = client.get('/')
        assert response.status_code == 200
        # Should still load without errors
