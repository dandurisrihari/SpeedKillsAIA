#!/usr/bin/env python3
"""
Simplified tests for webviewer device access functionality
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
def mock_device_data():
    """Mock device data for testing"""
    return {
        "metadata": {
            "log_file": "test_device.log",
            "parsed_at": "2024-01-01T12:00:00"
        },
        "device_info": {
            "device_accesses": [
                {
                    "device_path": "/dev/test_device",
                    "access_type": "openat",
                    "timestamp": 1234567890.123,
                    "timestamp_str": "10:00:00.123",
                    "pid": 1234,
                    "flags": "O_RDWR",
                    "result": "3"
                }
            ],
            "unique_devices": ["/dev/test_device"],
            "total_accesses": 1,
            "unique_device_count": 1
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
            "total_files": 0,
            "files_need_analysis": 0
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
class TestDeviceAccess:
    """Simplified device access tests"""
    
    def test_device_tab_exists(self, client, mock_device_data):
        """Test that the device tab exists in the interface"""
        # Set up global data
        webviewer_ui.global_data = mock_device_data
        
        response = client.get('/')
        assert response.status_code == 200
        # Just check that we can load the page
        assert b'Device Access' in response.data or b'devices' in response.data

    def test_device_api_endpoint(self, client, mock_device_data):
        """Test the device API endpoint"""
        # Set up global data
        webviewer_ui.global_data = mock_device_data
        
        response = client.get('/api/devices')
        assert response.status_code == 200
        data = json.loads(response.data)
        assert 'devices' in data

    def test_device_search_endpoint(self, client, mock_device_data):
        """Test device search functionality"""
        # Set up global data
        webviewer_ui.global_data = mock_device_data
        
        response = client.get('/api/search/devices?q=test')
        assert response.status_code == 200
        data = json.loads(response.data)
        assert isinstance(data, list)
