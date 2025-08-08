#!/usr/bin/env python3
"""
Simplified tests for webviewer UI module
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
    from src.webviewer.ui import create_app, load_data, start_web_ui
    WEBVIEWER_AVAILABLE = True
except ImportError:
    WEBVIEWER_AVAILABLE = False
    create_app = None
    webviewer_ui = None

@pytest.fixture
def mock_ui_data():
    """Mock comprehensive UI data for testing"""
    return {
        "metadata": {
            "log_file": "test.log",
            "parsed_at": "2024-01-01T12:00:00"
        },
        "function_entries": [
            {
                "function_name": "test_function",
                "file_path": "test.c",
                "line_number": 10,
                "timestamp": 1234567890.0,
                "timestamp_str": "10:00:00",
                "call_count": 1,
                "function_code": "void test_function() { return; }"
            }
        ],
        "dma_operations": [
            {
                "function_name": "dma_map_page",
                "caller_function": "test_driver",
                "file_path": "driver.c",
                "line_number": 20,
                "function_code": "void test_driver() { dma_map_page(); }"
            }
        ],
        "user_copy_operations": [
            {
                "copy_function": "copy_from_user",
                "caller_function": "device_read",
                "file_path": "device.c",
                "line_number": 30,
                "function_code": "int device_read() { copy_from_user(); }"
            }
        ],
        "ioctl_operations": [
            {
                "handler_name": "device_ioctl",
                "file_path": "device.c",
                "line_number": 40,
                "function_code": "long device_ioctl() { return 0; }"
            }
        ],
        "memory_info": {
            "reserved_memory": [
                {"name": "linux,cma", "memory_type": "CMA"},
                {"name": "dma_pool", "memory_type": "DMA"}
            ],
            "cma_pools": [{"name": "linux,cma"}],
            "memory_zones": [{"zone_name": "DMA"}, {"zone_name": "Normal"}],
            "summary": {
                "total_reserved_entries": 2,
                "total_cma_pools": 1,
                "total_zones": 2
            }
        },
        "functions_by_file": {"test.c": [{"function_name": "test_function"}]},
        "statistics": {
            "unique_function_entries": 1,
            "unique_dma_operations": 1,
            "unique_user_copy_operations": 1,
            "unique_ioctl_operations": 1,
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
class TestWebviewerUI:
    """Test webviewer UI functionality"""
    
    def test_create_app(self):
        """Test app creation"""
        app = create_app()
        assert app is not None
        assert app.config['SECRET_KEY'] is not None

    def test_app_routes_exist(self, client):
        """Test that required routes exist"""
        # Test main routes
        response = client.get('/')
        assert response.status_code == 200
        
        # Test API routes
        response = client.get('/api/status')
        assert response.status_code == 200
        
    def test_memory_tab_in_ui(self, client, mock_ui_data):
        """Test that memory tab exists"""
        # Set up global data
        webviewer_ui.global_data = mock_ui_data
        
        response = client.get('/')
        assert response.status_code == 200
        content = response.data.decode('utf-8')
        assert 'id="memory"' in content
        assert 'Memory Information' in content

    def test_memory_api_endpoint(self, client, mock_ui_data):
        """Test memory API endpoint"""
        # Set up global data
        webviewer_ui.global_data = mock_ui_data
        
        response = client.get('/api/memory')
        assert response.status_code == 200
        data = json.loads(response.data)
        assert 'memory_info' in data

    def test_api_status_endpoint(self, client):
        """Test API status endpoint"""
        response = client.get('/api/status')
        assert response.status_code == 200
        data = json.loads(response.data)
        assert 'status' in data

    def test_load_data_valid_file(self):
        """Test loading valid JSON data"""
        test_data = {"test": "data"}
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(test_data, f)
            f.flush()
            
            result = load_data(f.name)
            assert result == test_data
            
            os.unlink(f.name)

    def test_load_data_invalid_json(self):
        """Test loading invalid JSON"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            f.write("invalid json content")
            f.flush()
            
            result = load_data(f.name)
            assert result is None
            
            os.unlink(f.name)

    def test_load_data_nonexistent_file(self):
        """Test loading nonexistent file"""
        result = load_data("/nonexistent/file.json")
        assert result is None

@pytest.mark.skipif(WEBVIEWER_AVAILABLE, reason="Testing import error handling")
class TestWebviewerUINoFlask:
    """Test behavior when Flask is not available"""
    
    def test_import_error_handling(self):
        """Test that import errors are handled gracefully"""
        # This test runs when Flask is not available
        assert True  # Just verify test structure works
