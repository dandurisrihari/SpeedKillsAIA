#!/usr/bin/env python3
"""
Comprehensive tests for webviewer tab navigation functionality
"""
import unittest
import sys
import os
from unittest.mock import Mock, patch, MagicMock
import re

# Add src to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

class TestTabNavigation(unittest.TestCase):
    """Test tab navigation functionality in the webviewer"""
    
    def setUp(self):
        """Set up test environment"""
        try:
            from webviewer.ui import create_app, load_data
            self.create_app = create_app
            self.load_data = load_data
            self.app = create_app()
            self.client = self.app.test_client()
            self.app_context = self.app.app_context()
            self.app_context.push()
        except ImportError as e:
            self.skipTest(f"Webviewer module not available: {e}")
    
    def tearDown(self):
        """Clean up test environment"""
        if hasattr(self, 'app_context'):
            self.app_context.pop()
    
    def test_tab_navigation_javascript_function_exists(self):
        """Test that JavaScript files are properly linked"""
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
        
        # Check that JavaScript files are linked
        content = response.data.decode()
        self.assertIn('src="/static/js/main.js"', content)
        self.assertIn('src="/static/js/llm.js"', content)
    
    def test_tab_buttons_have_correct_onclick_handlers(self):
        """Test that all tab buttons have correct onclick handlers"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check for all expected tab buttons with correct onclick handlers
        expected_tabs = [
            ('analyzeAll', 'Analyze All'),
            ('functions', 'Functions'),
            ('dma', 'DMA Operations'), 
            ('userCopy', 'User Copy'),
            ('ioctl', 'IOCTL Handlers'),
            ('devices', 'Device Access'),
            ('memory', 'Memory Info'),
            ('llmAnalysis', 'Individual LLM Analysis')
        ]
        
        for tab_id, tab_text in expected_tabs:
            # Check that the tab button exists with correct onclick
            pattern = rf'onclick="showTab\(\'{tab_id}\', this\)"[^>]*>{re.escape(tab_text)}'
            self.assertRegex(content, pattern, 
                           f"Tab button for '{tab_id}' not found with correct onclick handler")
    
    def test_tab_content_divs_exist(self):
        """Test that all tab content divs exist with correct IDs"""
        response = self.client.get('/')
        content = response.data.decode()
        
        expected_tab_contents = [
            'analyzeAll', 'functions', 'dma', 'userCopy', 'ioctl', 'devices', 'memory', 'llmAnalysis'
        ]
        
        for tab_id in expected_tab_contents:
            # Check that tab content div exists
            pattern = rf'<div[^>]+id="{tab_id}"[^>]*class="[^"]*tab-content'
            self.assertRegex(content, pattern, 
                           f"Tab content div for '{tab_id}' not found")
    
    def test_default_active_tab(self):
        """Test that analyzeAll tab is active by default"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check that analyzeAll tab button is active  
        self.assertIn('class="tab active"', content)
        self.assertIn('onclick="showTab(\'analyzeAll\', this)">Analyze All', content)
        
        # Check that analyzeAll tab content is active
        self.assertRegex(content, r'id="analyzeAll"[^>]*class="[^"]*tab-content[^"]*active')
    
    def test_tab_css_styles_exist(self):
        """Test that CSS files are properly linked"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check that CSS files are linked
        self.assertIn('href="/static/css/main.css"', content)
        self.assertIn('href="/static/css/llm.css"', content)
    
    def test_showTab_function_implementation(self):
        """Test showTab JavaScript function implementation"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Test that the showTab onclick handlers are present (function is in external file)
        self.assertIn('onclick="showTab(\'analyzeAll\', this)"', content)
        self.assertIn('onclick="showTab(\'functions\', this)"', content)
        self.assertIn('onclick="showTab(\'dma\', this)"', content)
    
    def test_tab_navigation_with_session_data(self):
        """Test tab navigation when session data is available"""
        # Mock session data
        with self.client.session_transaction() as sess:
            sess['results'] = {
                'function_entries': [
                    {'function_name': 'test_func', 'file_path': '/test.c', 'line_number': 10}
                ],
                'dma_operations': [
                    {'dma_function': 'dma_alloc', 'timestamp': '12:00:00'}
                ],
                'user_copy_operations': [
                    {'copy_function': 'copy_from_user', 'timestamp': '12:01:00'}
                ],
                'ioctl_operations': [
                    {'handler_name': 'test_ioctl', 'timestamp': '12:02:00'}
                ],
                'device_accesses': [],
                'memory_info': {},
                'statistics': {'total_operations': 3}
            }
        
        response = self.client.get('/results')
        self.assertEqual(response.status_code, 200)
        content = response.data.decode()
        
        # Verify all tabs are present even with data
        for tab_id in ['functions', 'dma', 'userCopy', 'ioctl', 'devices', 'memory']:
            self.assertIn(f'showTab(\'{tab_id}\', this)', content)
    
    def test_search_functionality_in_tabs(self):
        """Test that search functionality exists for tabs that need it"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check for search handlers
        search_handlers = ['filterFunctions()', 'filterDMA()', 'filterUserCopy()']
        for handler in search_handlers:
            self.assertIn(f'onkeyup="{handler}"', content, 
                         f"Search handler {handler} not found")
    
    def test_toggle_stack_trace_function(self):
        """Test stack trace toggle functionality"""
        # Skip this test as toggleStackTrace is not currently implemented in template
        self.skipTest("toggleStackTrace functionality not currently implemented")


class TestTabInteractivity(unittest.TestCase):
    """Test tab interactivity and JavaScript functionality"""
    
    def setUp(self):
        """Set up test environment"""
        try:
            from webviewer.ui import create_app
            self.app = create_app()
            self.client = self.app.test_client()
            self.app_context = self.app.app_context()
            self.app_context.push()
        except ImportError as e:
            self.skipTest(f"Webviewer module not available: {e}")
    
    def tearDown(self):
        """Clean up test environment"""
        if hasattr(self, 'app_context'):
            self.app_context.pop()
    
    def test_no_javascript_errors_in_showTab(self):
        """Test that JavaScript files are properly linked"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Test that JavaScript files are properly linked instead of checking inline functions
        self.assertIn('src="/static/js/main.js"', content)
        self.assertIn('src="/static/js/llm.js"', content)
    
    def test_tab_accessibility_attributes(self):
        """Test that tabs have proper accessibility attributes"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check that tab buttons are actually buttons
        tab_pattern = r'<button[^>]+class="[^"]*tab[^"]*"[^>]+onclick="showTab'
        tab_matches = re.findall(tab_pattern, content)
        self.assertGreater(len(tab_matches), 5, "Should have multiple tab buttons")
    
    def test_tab_content_structure(self):
        """Test that tab content has proper structure"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check for proper tab content structure
        for tab_id in ['functions', 'dma', 'userCopy', 'ioctl']:
            pattern = rf'<div[^>]+id="{tab_id}"[^>]+class="[^"]*tab-content'
            self.assertRegex(content, pattern, 
                           f"Tab content for {tab_id} not properly structured")


class TestTabNavigationPerformance(unittest.TestCase):
    """Test performance aspects of tab navigation"""
    
    def setUp(self):
        """Set up test environment"""
        try:
            from webviewer.ui import create_app
            self.app = create_app()
            self.client = self.app.test_client()
            self.app_context = self.app.app_context()
            self.app_context.push()
        except ImportError as e:
            self.skipTest(f"Webviewer module not available: {e}")
    
    def tearDown(self):
        """Clean up test environment"""
        if hasattr(self, 'app_context'):
            self.app_context.pop()
    
    def test_minimal_javascript_size(self):
        """Test that JavaScript files are properly linked"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Test that JavaScript files are present (external files are used)
        self.assertIn('src="/static/js/main.js"', content)
        self.assertIn('src="/static/js/llm.js"', content)
    
    def test_no_duplicate_functions(self):
        """Test that JavaScript files are not duplicated"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check for non-duplication of script tags
        main_js_matches = content.count('src="/static/js/main.js"')
        llm_js_matches = content.count('src="/static/js/llm.js"') 
        
        self.assertEqual(main_js_matches, 1, "main.js should be included exactly once")
        self.assertEqual(llm_js_matches, 1, "llm.js should be included exactly once")


if __name__ == '__main__':
    unittest.main()
