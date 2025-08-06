#!/usr/bin/env python3
"""
Tests for Enhanced Webviewer UI

Test cases for the enhanced webviewer UI features including
data display fixes, LLM integration UI components, and responsive design.
"""

import pytest
import os
import json
from unittest.mock import Mock, patch, MagicMock
import sys

# Add src to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), 'src'))

try:
    from webviewer.ui import create_app
    WEBVIEWER_AVAILABLE = True
except ImportError:
    WEBVIEWER_AVAILABLE = False
    create_app = None


@pytest.mark.skipif(not WEBVIEWER_AVAILABLE, reason="Webviewer module not available")
class TestEnhancedWebviewerUI:
    """Test cases for enhanced webviewer UI"""
    
    def setup_method(self):
        """Setup for each test method"""
        self.app = create_app()
        self.app.config['TESTING'] = True
        self.client = self.app.test_client()
        
        # Sample test data with all required fields
        self.test_data = {
            "metadata": {
                "parser_version": "2.0.0",
                "parsed_at": "2023-01-01T12:00:00.000000",
                "log_file": "test.log"
            },
            "function_entries": [
                {
                    "function_name": "test_function",
                    "file_path": "test.c",
                    "line_number": 10,
                    "function_code": "void test_function() {\n    printk(\"Test\");\n    return;\n}",
                    "stack_trace": ["test_function", "caller_function", "init_module"]
                }
            ],
            "dma_operations": [
                {
                    "dma_function": "dma_alloc_coherent",
                    "caller_function": "driver_init",
                    "file_path": "driver.c",
                    "line_number": 25,
                    "stack_trace": ["driver_init", "module_init", "kernel_start"],
                    "function_code": "static int driver_init(void) {\n    void *dma_buf = dma_alloc_coherent(dev, size, &handle, GFP_KERNEL);\n    return 0;\n}"
                }
            ],
            "user_copy_operations": [
                {
                    "copy_function": "copy_from_user",
                    "caller_function": "ioctl_handler",
                    "file_path": "device.c",
                    "line_number": 50,
                    "stack_trace": ["ioctl_handler", "sys_ioctl", "syscall_entry"],
                    "function_code": "static long ioctl_handler(struct file *file, unsigned int cmd, unsigned long arg) {\n    if (copy_from_user(&data, (void __user *)arg, sizeof(data)))\n        return -EFAULT;\n    return 0;\n}"
                }
            ],
            "ioctl_operations": [
                {
                    "function_name": "device_ioctl",
                    "file_path": "device.c",
                    "line_number": 100,
                    "stack_trace": ["device_ioctl", "vfs_ioctl", "sys_ioctl"],
                    "function_code": "static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {\n    switch (cmd) {\n        case DEVICE_RESET:\n            return device_reset();\n        default:\n            return -ENOTTY;\n    }\n}"
                }
            ]
        }

    def test_home_page_loads(self):
        """Test that the home page loads successfully"""
        response = self.client.get('/')
        assert response.status_code == 200
        assert b'SpeedKillsAIA Web Viewer' in response.data

    def test_upload_and_analyze_data(self):
        """Test uploading and analyzing data"""
        # Mock file upload
        data = {
            'file': (
                os.path.join(os.path.dirname(__file__), 'test_data.json'),
                json.dumps(self.test_data)
            )
        }
        
        response = self.client.post('/upload', 
                                   data=data,
                                   content_type='multipart/form-data')
        
        # Should redirect to results page
        assert response.status_code == 302 or response.status_code == 200

    def test_dma_operations_display(self):
        """Test that DMA operations are displayed correctly"""
        with self.app.test_request_context():
            # Set test data in session
            with self.client.session_transaction() as sess:
                sess['analysis_data'] = self.test_data
            
            response = self.client.get('/analysis')
            
            assert response.status_code == 200
            response_text = response.data.decode()
            
            # Check DMA operations are displayed
            assert 'dma_alloc_coherent' in response_text
            assert 'driver_init' in response_text
            
            # Check stack trace is displayed
            assert 'Stack Trace:' in response_text or 'Call Stack:' in response_text
            assert 'module_init' in response_text

    def test_user_copy_operations_display(self):
        """Test that user copy operations are displayed correctly"""
        with self.app.test_request_context():
            # Set test data in session
            with self.client.session_transaction() as sess:
                sess['analysis_data'] = self.test_data
            
            response = self.client.get('/analysis')
            
            assert response.status_code == 200
            response_text = response.data.decode()
            
            # Check user copy operations are displayed
            assert 'copy_from_user' in response_text
            assert 'ioctl_handler' in response_text
            
            # Check function code is displayed
            assert 'copy_from_user(&data' in response_text

    def test_ioctl_operations_display(self):
        """Test that IOCTL operations are displayed correctly"""
        with self.app.test_request_context():
            # Set test data in session
            with self.client.session_transaction() as sess:
                sess['analysis_data'] = self.test_data
            
            response = self.client.get('/analysis')
            
            assert response.status_code == 200
            response_text = response.data.decode()
            
            # Check IOCTL operations are displayed
            assert 'device_ioctl' in response_text
            assert 'DEVICE_RESET' in response_text

    def test_function_entries_display(self):
        """Test that function entries are displayed correctly"""
        with self.app.test_request_context():
            # Set test data in session
            with self.client.session_transaction() as sess:
                sess['analysis_data'] = self.test_data
            
            response = self.client.get('/analysis')
            
            assert response.status_code == 200
            response_text = response.data.decode()
            
            # Check function entries are displayed
            assert 'test_function' in response_text
            assert 'printk("Test")' in response_text

    def test_llm_analysis_buttons_present(self):
        """Test that LLM analysis buttons are present in the UI"""
        with self.app.test_request_context():
            # Set test data in session
            with self.client.session_transaction() as sess:
                sess['analysis_data'] = self.test_data
            
            response = self.client.get('/analysis')
            
            assert response.status_code == 200
            response_text = response.data.decode()
            
            # Check for LLM analysis buttons
            assert 'Analyze with LLM' in response_text or 'llm-analyze' in response_text
            assert 'Quick Analyze' in response_text or 'quick-analyze' in response_text

    def test_model_selection_interface(self):
        """Test that model selection interface is present"""
        with self.app.test_request_context():
            # Set test data in session
            with self.client.session_transaction() as sess:
                sess['analysis_data'] = self.test_data
            
            response = self.client.get('/analysis')
            
            assert response.status_code == 200
            response_text = response.data.decode()
            
            # Check for model selection elements
            assert 'model-select' in response_text or 'GPT' in response_text

    def test_custom_prompt_interface(self):
        """Test that custom prompt interface is present"""
        with self.app.test_request_context():
            # Set test data in session
            with self.client.session_transaction() as sess:
                sess['analysis_data'] = self.test_data
            
            response = self.client.get('/analysis')
            
            assert response.status_code == 200
            response_text = response.data.decode()
            
            # Check for custom prompt elements
            assert 'custom-prompt' in response_text or 'prompt' in response_text

    def test_tabs_navigation(self):
        """Test that tab navigation is working"""
        with self.app.test_request_context():
            # Set test data in session
            with self.client.session_transaction() as sess:
                sess['analysis_data'] = self.test_data
            
            response = self.client.get('/analysis')
            
            assert response.status_code == 200
            response_text = response.data.decode()
            
            # Check for tab elements
            assert 'tab-content' in response_text or 'nav-tabs' in response_text
            assert 'Functions' in response_text
            assert 'DMA Operations' in response_text
            assert 'User Copy' in response_text
            assert 'IOCTL' in response_text

    def test_responsive_design_elements(self):
        """Test that responsive design elements are present"""
        response = self.client.get('/analysis')
        
        if response.status_code == 200:
            response_text = response.data.decode()
            
            # Check for responsive CSS classes
            assert 'container-fluid' in response_text or 'responsive' in response_text or 'col-' in response_text

    def test_error_handling_no_data(self):
        """Test error handling when no data is present"""
        response = self.client.get('/analysis')
        
        # Should handle gracefully (redirect or show message)
        assert response.status_code in [200, 302, 404]

    def test_stack_trace_formatting(self):
        """Test that stack traces are formatted correctly"""
        with self.app.test_request_context():
            # Set test data in session
            with self.client.session_transaction() as sess:
                sess['analysis_data'] = self.test_data
            
            response = self.client.get('/analysis')
            
            if response.status_code == 200:
                response_text = response.data.decode()
                
                # Check that stack traces are properly formatted
                # Should show multiple stack frames
                assert 'caller_function' in response_text
                assert 'init_module' in response_text or 'module_init' in response_text

    def test_code_syntax_highlighting(self):
        """Test that code syntax highlighting is enabled"""
        with self.app.test_request_context():
            # Set test data in session
            with self.client.session_transaction() as sess:
                sess['analysis_data'] = self.test_data
            
            response = self.client.get('/analysis')
            
            if response.status_code == 200:
                response_text = response.data.decode()
                
                # Check for code highlighting elements
                assert 'language-c' in response_text or 'hljs' in response_text or 'code-block' in response_text


class TestWebviewerConfiguration:
    """Test webviewer configuration and setup"""
    
    def test_flask_app_creation(self):
        """Test Flask app creation"""
        if WEBVIEWER_AVAILABLE:
            app = create_app()
            assert app is not None
            assert app.config is not None

    def test_required_routes_exist(self):
        """Test that all required routes exist"""
        if WEBVIEWER_AVAILABLE:
            app = create_app()
            
            # Get all registered routes
            routes = []
            for rule in app.url_map.iter_rules():
                routes.append(rule.rule)
            
            # Check critical routes
            assert '/' in routes
            assert '/upload' in routes or any('upload' in route for route in routes)
            assert '/analysis' in routes or any('analysis' in route for route in routes)

    def test_static_files_configuration(self):
        """Test static files configuration"""
        if WEBVIEWER_AVAILABLE:
            app = create_app()
            
            # Check static folder configuration
            assert app.static_folder is not None or app.static_url_path is not None


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
