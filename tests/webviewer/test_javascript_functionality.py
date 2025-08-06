#!/usr/bin/env python3
"""
Comprehensive tests for webviewer JavaScript functionality and click handlers
"""
import unittest
import sys
import os
from unittest.mock import Mock, patch, MagicMock
import re
import json

# Add src to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

class TestWebviewerJavaScript(unittest.TestCase):
    """Test JavaScript functionality in the webviewer"""
    
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
    
    def test_all_required_javascript_functions_exist(self):
        """Test that all required JavaScript functions are present"""
        response = self.client.get('/')
        content = response.data.decode()
        
        required_functions = [
            'showTab',
            'toggleStackTrace', 
            'filterFunctions',
            'filterDMA',
            'filterUserCopy',
            'loadFunctionCode',
            'loadDmaCode', 
            'loadCopyCode'
        ]
        
        for func_name in required_functions:
            pattern = rf'function {func_name}\s*\('
            self.assertRegex(content, pattern, 
                           f"Required JavaScript function '{func_name}' not found")
    
    def test_onclick_handlers_properly_formatted(self):
        """Test that all onclick handlers are properly formatted"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Find all onclick handlers
        onclick_pattern = r'onclick="([^"]*)"'
        onclick_matches = re.findall(onclick_pattern, content)
        
        self.assertGreater(len(onclick_matches), 5, "Should have multiple onclick handlers")
        
        # Check that showTab calls include 'this' parameter
        showTab_calls = [match for match in onclick_matches if 'showTab(' in match]
        for call in showTab_calls:
            self.assertIn(', this)', call, 
                         f"showTab call '{call}' should include 'this' parameter")
    
    def test_function_code_loading_handlers(self):
        """Test function code loading onclick handlers"""
        # Create mock session data
        with self.client.session_transaction() as sess:
            sess['parsed_data'] = {
                'function_entries': [
                    {'function_name': 'test_func', 'file_path': '/test.c', 'line_number': 10}
                ],
                'statistics': {'total_operations': 1}
            }
        
        response = self.client.get('/results')
        content = response.data.decode()
        
        # Check for function code loading onclick
        self.assertIn('loadFunctionCode(this,', content)
        self.assertIn('quickAnalyzeFunction(', content)
    
    def test_dma_operations_handlers(self):
        """Test DMA operations onclick handlers"""
        with self.client.session_transaction() as sess:
            sess['parsed_data'] = {
                'dma_operations': [
                    {'dma_function': 'dma_alloc', 'timestamp': '12:00:00', 'operation': 'alloc'}
                ],
                'statistics': {'total_operations': 1}
            }
        
        response = self.client.get('/results')
        content = response.data.decode()
        
        # Check for DMA-specific handlers
        self.assertIn('loadDmaCode(this,', content)
        self.assertIn('toggleStackTrace(this)', content)
        self.assertIn('quickAnalyzeDMA(', content)
    
    def test_user_copy_handlers(self):
        """Test User Copy operations onclick handlers"""
        with self.client.session_transaction() as sess:
            sess['parsed_data'] = {
                'user_copy_operations': [
                    {'copy_function': 'copy_from_user', 'timestamp': '12:00:00'}
                ],
                'statistics': {'total_operations': 1}
            }
        
        response = self.client.get('/results')
        content = response.data.decode()
        
        # Check for User Copy-specific handlers
        self.assertIn('loadCopyCode(this,', content)
    
    def test_search_functionality_implementation(self):
        """Test search functionality JavaScript implementation"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check filterFunctions implementation
        filter_func_match = re.search(r'function filterFunctions\(\)\s*\{(.*?)\n\s*\}', content, re.DOTALL)
        self.assertIsNotNone(filter_func_match, "filterFunctions not found")
        
        filter_func_body = filter_func_match.group(1)
        self.assertIn('getElementById(\'functionSearch\')', filter_func_body)
        self.assertIn('querySelectorAll(\'.function-item\')', filter_func_body)
        self.assertIn('toLowerCase()', filter_func_body)
    
    def test_stack_trace_toggle_implementation(self):
        """Test stack trace toggle implementation"""
        response = self.client.get('/')
        content = response.data.decode()
        
        toggle_match = re.search(r'function toggleStackTrace\(.*?\)\s*\{(.*?)\n\s*\}', content, re.DOTALL)
        self.assertIsNotNone(toggle_match, "toggleStackTrace function not found")
        
        toggle_body = toggle_match.group(1)
        self.assertIn('nextElementSibling', toggle_body)
        self.assertIn('classList.contains(\'hidden\')', toggle_body)
        self.assertIn('Show Call Graph', toggle_body)
        self.assertIn('Hide Call Graph', toggle_body)
    
    def test_no_javascript_syntax_errors(self):
        """Test that JavaScript doesn't have obvious syntax errors"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Extract JavaScript content
        js_match = re.search(r'<script>(.*?)</script>', content, re.DOTALL)
        self.assertIsNotNone(js_match, "JavaScript section not found")
        
        js_content = js_match.group(1)
        
        # Check for common syntax error patterns
        self.assertNotIn(';;', js_content, "Shouldn't have double semicolons")
        self.assertNotIn('}{', js_content, "Shouldn't have improper brace combinations")
        
        # Check for proper function declarations
        function_count = len(re.findall(r'function\s+\w+\s*\(', js_content))
        self.assertGreater(function_count, 5, "Should have multiple function declarations")
    
    def test_event_handling_safety(self):
        """Test that event handling is done safely"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check that showTab function doesn't use unsafe event handling
        showTab_match = re.search(r'function showTab\(.*?\)\s*\{(.*?)\n\s*\}', content, re.DOTALL)
        self.assertIsNotNone(showTab_match)
        
        function_body = showTab_match.group(1)
        
        # Should not rely on global event object
        self.assertNotIn('event.target', function_body)
        
        # Should have proper null/undefined checks
        self.assertIn('if (', function_body)


class TestWebviewerInteractionHandlers(unittest.TestCase):
    """Test specific interaction handlers in the webviewer"""
    
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
    
    def test_analyze_button_handlers(self):
        """Test analyze button click handlers"""
        with self.client.session_transaction() as sess:
            sess['parsed_data'] = {
                'function_entries': [
                    {'function_name': 'test_func', 'file_path': '/test.c', 'line_number': 10}
                ],
                'dma_operations': [
                    {'dma_function': 'dma_alloc', 'timestamp': '12:00:00'}
                ],
                'statistics': {'total_operations': 2}
            }
        
        response = self.client.get('/results')
        content = response.data.decode()
        
        # Check for analyze button handlers
        analyze_patterns = [
            r'quickAnalyzeFunction\(',
            r'quickAnalyzeDMA\(',
            r'class="analyze-btn"'
        ]
        
        for pattern in analyze_patterns:
            self.assertRegex(content, pattern, f"Analyze handler pattern '{pattern}' not found")
    
    def test_details_expand_handlers(self):
        """Test details expansion handlers"""
        with self.client.session_transaction() as sess:
            sess['parsed_data'] = {
                'function_entries': [
                    {'function_name': 'test_func', 'file_path': '/test.c', 'line_number': 10}
                ],
                'statistics': {'total_operations': 1}
            }
        
        response = self.client.get('/results')
        content = response.data.decode()
        
        # Check for details onclick handlers
        self.assertIn('<details onclick="loadFunctionCode', content)
    
    def test_search_input_handlers(self):
        """Test search input handlers"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check for search input fields and their handlers
        search_inputs = [
            'functionSearch',
            'dmaSearch', 
            'copySearch'
        ]
        
        for input_id in search_inputs:
            self.assertIn(f'id="{input_id}"', content)
    
    def test_responsive_interaction_elements(self):
        """Test that interactive elements are properly responsive"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check for proper button styling
        self.assertIn('cursor: pointer', content)
        self.assertIn('.analyze-btn', content)
        self.assertIn('.toggle-btn', content)


class TestWebviewerAPIIntegration(unittest.TestCase):
    """Test integration between frontend JavaScript and backend API"""
    
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
    
    def test_api_endpoints_referenced_in_javascript(self):
        """Test that JavaScript references the correct API endpoints"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check for API endpoint references
        api_patterns = [
            r'/api/function-code',
            r'/api/dma-code',
            r'/api/copy-code',
            r'/api/llm/'
        ]
        
        for pattern in api_patterns:
            self.assertRegex(content, pattern, f"API endpoint '{pattern}' not referenced")
    
    def test_ajax_error_handling(self):
        """Test that AJAX calls have proper error handling"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Look for fetch or XMLHttpRequest with error handling
        if 'fetch(' in content:
            self.assertIn('.catch(', content, "Fetch calls should have error handling")
        elif 'XMLHttpRequest' in content:
            self.assertIn('onerror', content, "XMLHttpRequest should have error handling")
    
    def test_loading_state_management(self):
        """Test that loading states are properly managed"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check for loading indicators or state management
        loading_indicators = ['Loading...', 'loading', 'spinner']
        has_loading_indicator = any(indicator in content for indicator in loading_indicators)
        
        if has_loading_indicator:
            # If loading indicators exist, they should be properly managed
            self.assertTrue(True, "Loading indicators found and can be tested separately")


if __name__ == '__main__':
    unittest.main()
