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
        """Test that showTab function exists in the template"""
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
        
        # Check that showTab function is defined
        self.assertIn('function showTab', response.data.decode())
        self.assertIn('showTab(tabName, clickedElement)', response.data.decode())
    
    def test_tab_buttons_have_correct_onclick_handlers(self):
        """Test that all tab buttons have correct onclick handlers"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check for all expected tab buttons with correct onclick handlers
        expected_tabs = [
            ('functions', '📍 Functions'),
            ('dma', '🔄 DMA Operations'), 
            ('userCopy', '👤 User Copy'),
            ('ioctl', '🔧 IOCTL Handlers'),
            ('devices', '📱 Device Access'),
            ('memory', '🧠 Memory Info'),
            ('llmAnalysis', '🤖 LLM Analysis')
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
            'functions', 'dma', 'userCopy', 'ioctl', 'devices', 'memory', 'llmAnalysis'
        ]
        
        for tab_id in expected_tab_contents:
            # Check that tab content div exists
            pattern = rf'<div[^>]+id="{tab_id}"[^>]*class="[^"]*tab-content'
            self.assertRegex(content, pattern, 
                           f"Tab content div for '{tab_id}' not found")
    
    def test_default_active_tab(self):
        """Test that functions tab is active by default"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check that functions tab button is active
        self.assertIn('class="tab active"', content)
        self.assertIn('onclick="showTab(\'functions\', this)">📍 Functions', content)
        
        # Check that functions tab content is active
        self.assertRegex(content, r'id="functions"[^>]*class="[^"]*tab-content[^"]*active')
    
    def test_tab_css_styles_exist(self):
        """Test that required CSS styles for tabs exist"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check for essential tab CSS
        self.assertIn('.tab {', content)
        self.assertIn('cursor: pointer', content)
        self.assertIn('.tab.active {', content)
        self.assertIn('.tab-content {', content)
        self.assertIn('.tab-content.active {', content)
    
    def test_showTab_function_implementation(self):
        """Test showTab JavaScript function implementation"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Extract the showTab function
        showTab_match = re.search(r'function showTab\(.*?\)\s*\{(.*?)\n\s*\}', content, re.DOTALL)
        self.assertIsNotNone(showTab_match, "showTab function not found")
        
        function_body = showTab_match.group(1)
        
        # Check for essential functionality
        self.assertIn('querySelectorAll(\'.tab-content\')', function_body)
        self.assertIn('querySelectorAll(\'.tab\')', function_body)
        self.assertIn('classList.remove(\'active\')', function_body)
        self.assertIn('getElementById(tabName)', function_body)
        self.assertIn('classList.add(\'active\')', function_body)
    
    def test_tab_navigation_with_session_data(self):
        """Test tab navigation when session data is available"""
        # Mock session data
        with self.client.session_transaction() as sess:
            sess['parsed_data'] = {
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
        
        # Check for search functions
        search_functions = ['filterFunctions', 'filterDMA', 'filterUserCopy']
        for func_name in search_functions:
            self.assertIn(f'function {func_name}', content, 
                         f"Search function {func_name} not found")
    
    def test_toggle_stack_trace_function(self):
        """Test stack trace toggle functionality"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check for toggleStackTrace function
        self.assertIn('function toggleStackTrace', content)
        self.assertIn('Show Call Graph', content)
        self.assertIn('Hide Call Graph', content)


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
        """Test that showTab function has no obvious JavaScript errors"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Extract showTab function and check for common error patterns
        showTab_match = re.search(r'function showTab\(.*?\)\s*\{(.*?)\n\s*\}', content, re.DOTALL)
        self.assertIsNotNone(showTab_match)
        
        function_body = showTab_match.group(1)
        
        # Check that it doesn't use undefined variables
        self.assertNotIn('event.target', function_body, 
                        "showTab function should not use 'event.target' directly")
        
        # Check for proper null checking
        self.assertIn('if (targetContent)', function_body)
        self.assertIn('if (clickedElement)', function_body)
    
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
        """Test that JavaScript is not unnecessarily large"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Extract JavaScript content
        js_match = re.search(r'<script>(.*?)</script>', content, re.DOTALL)
        self.assertIsNotNone(js_match)
        
        js_content = js_match.group(1)
        js_lines = [line.strip() for line in js_content.split('\n') if line.strip()]
        
        # Should have reasonable number of JavaScript lines (not too bloated)
        self.assertLess(len(js_lines), 200, "JavaScript should be reasonably concise")
    
    def test_no_duplicate_functions(self):
        """Test that JavaScript functions are not duplicated"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check for function duplications
        function_names = ['showTab', 'toggleStackTrace', 'filterFunctions', 'filterDMA']
        for func_name in function_names:
            pattern = rf'function {func_name}\('
            matches = re.findall(pattern, content)
            self.assertLessEqual(len(matches), 1, 
                               f"Function {func_name} should not be duplicated")


if __name__ == '__main__':
    unittest.main()
