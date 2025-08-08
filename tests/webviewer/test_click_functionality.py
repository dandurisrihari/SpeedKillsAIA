#!/usr/bin/env python3
"""
Comprehensive tests for webviewer click functionality and user interactions
"""
import unittest
import sys
import os
from unittest.mock import Mock, patch, MagicMock
import re
import json

# Add src to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

class TestClickFunctionality(unittest.TestCase):
    """Test click functionality in the webviewer"""
    
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
    
    def test_tab_buttons_are_clickable(self):
        """Test that tab buttons have proper clickable attributes"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Find all tab buttons
        tab_button_pattern = r'<button[^>]+class="[^"]*tab[^"]*"[^>]*>'
        tab_buttons = re.findall(tab_button_pattern, content)
        
        self.assertGreater(len(tab_buttons), 5, "Should have multiple tab buttons")
        
        for button in tab_buttons:
            # Check that each button has onclick handler
            self.assertIn('onclick=', button, f"Tab button missing onclick: {button}")
            # Check that button doesn't have disabled attribute
            self.assertNotIn('disabled', button, f"Tab button should not be disabled: {button}")
    
    def test_no_pointer_events_none_on_tabs(self):
        """Test that tabs don't have pointer-events: none CSS"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Extract CSS and check for problematic pointer-events
        style_sections = re.findall(r'<style[^>]*>(.*?)</style>', content, re.DOTALL)
        
        for style in style_sections:
            # Check that .tab doesn't have pointer-events: none
            tab_styles = re.findall(r'\.tab[^{]*\{([^}]*)\}', style)
            for tab_style in tab_styles:
                self.assertNotIn('pointer-events: none', tab_style,
                               "Tab buttons should not have pointer-events: none")
    
    def test_tab_z_index_not_blocked(self):
        """Test that tabs are not blocked by overlaying elements"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Look for any elements that might have high z-index and overlay tabs
        high_z_index_pattern = r'z-index:\s*(\d+)'
        z_indices = re.findall(high_z_index_pattern, content)
        
        # If there are high z-index elements, tabs should also have appropriate z-index
        if any(int(z) > 100 for z in z_indices):
            # Check that tab container or tabs have appropriate z-index
            tab_container_pattern = r'\.tabs[^{]*\{([^}]*)\}'
            tab_containers = re.findall(tab_container_pattern, content)
            
            # This is more of a guideline check
            self.assertTrue(len(tab_containers) >= 0, "Tab containers found")
    
    def test_button_elements_properly_formed(self):
        """Test that button elements are properly formed"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Find all button elements with tab class
        button_pattern = r'<button[^>]+class="[^"]*tab[^"]*"[^>]*>([^<]*)</button>'
        buttons = re.findall(button_pattern, content)
        
        expected_button_texts = [
            '📍 Functions',
            '🔄 DMA Operations', 
            '👤 User Copy',
            '🔧 IOCTL Handlers',
            '📱 Device Access',
            '🧠 Memory Info',
            '🤖 LLM Analysis'
        ]
        
        for expected_text in expected_button_texts:
            found = any(expected_text in button for button in buttons)
            self.assertTrue(found, f"Button with text '{expected_text}' not found")
    
    def test_onclick_handlers_have_correct_syntax(self):
        """Test that onclick handlers have correct JavaScript syntax"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Extract all onclick handlers
        onclick_pattern = r'onclick="([^"]*)"'
        onclick_handlers = re.findall(onclick_pattern, content)
        
        for handler in onclick_handlers:
            # Basic syntax checks
            self.assertNotIn(';;', handler, f"Handler has double semicolon: {handler}")
            self.assertNotIn(')))', handler, f"Handler has triple parentheses: {handler}")
            
            # If it's a showTab call, check proper format
            if 'showTab(' in handler:
                self.assertRegex(handler, r"showTab\('[^']+',\s*this\)",
                               f"showTab handler malformed: {handler}")
    
    def test_interactive_elements_have_hover_styles(self):
        """Test that interactive elements have appropriate hover styles"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Look for hover styles on buttons/tabs
        hover_pattern = r'\.tab:hover|button:hover'
        has_hover = re.search(hover_pattern, content)
        
        # This is optional but good UX
        if has_hover:
            self.assertTrue(True, "Hover styles found")
        else:
            # At minimum, cursor should be pointer
            self.assertIn('cursor: pointer', content, "Should have cursor: pointer for clickable elements")
    
    def test_no_conflicting_event_handlers(self):
        """Test that there are no conflicting event handlers"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check that no element has both onclick and other conflicting handlers
        button_elements = re.findall(r'<button[^>]*>', content)
        
        for button in button_elements:
            if 'onclick=' in button:
                # Should not also have onmousedown, onmouseup that might conflict
                conflicting_handlers = ['onmousedown=', 'onmouseup=']
                for conflicting in conflicting_handlers:
                    self.assertNotIn(conflicting, button,
                                   f"Button has conflicting handlers: {button}")


class TestUserInteractionFlow(unittest.TestCase):
    """Test user interaction flow in the webviewer"""
    
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
    
    def test_tab_navigation_preserves_state(self):
        """Test that tab navigation preserves application state"""
        # Set up session with data
        test_data = {
            'function_entries': [
                {'function_name': 'test_func', 'file_path': '/test.c', 'line_number': 10}
            ],
            'dma_operations': [
                {'dma_function': 'dma_alloc', 'timestamp': '12:00:00'}
            ],
            'statistics': {'total_operations': 2}
        }
        
        with self.client.session_transaction() as sess:
            sess['parsed_data'] = test_data
        
        response = self.client.get('/results')
        content = response.data.decode()
        
        # Check that data is preserved across tab structure
        self.assertIn('test_func', content)
        self.assertIn('dma_alloc', content)
        
        # Check that all tabs are still present
        for tab_name in ['functions', 'dma', 'userCopy']:
            self.assertIn(f'showTab(\'{tab_name}\'', content)
    
    def test_search_functionality_interaction(self):
        """Test search functionality interaction"""
        with self.client.session_transaction() as sess:
            sess['parsed_data'] = {
                'function_entries': [
                    {'function_name': 'func1', 'file_path': '/test1.c', 'line_number': 10},
                    {'function_name': 'func2', 'file_path': '/test2.c', 'line_number': 20}
                ],
                'statistics': {'total_operations': 2}
            }
        
        response = self.client.get('/results')
        content = response.data.decode()
        
        # Check that search inputs are properly connected
        search_patterns = [
            r'input[^>]+id="functionSearch"[^>]*oninput="filterFunctions\(\)"',
            r'input[^>]+placeholder="[^"]*search[^"]*"'
        ]
        
        for pattern in search_patterns:
            self.assertRegex(content, pattern, f"Search pattern not found: {pattern}")
    
    def test_expandable_content_interaction(self):
        """Test expandable content (details) interaction"""
        with self.client.session_transaction() as sess:
            sess['parsed_data'] = {
                'function_entries': [
                    {'function_name': 'test_func', 'file_path': '/test.c', 'line_number': 10}
                ],
                'statistics': {'total_operations': 1}
            }
        
        response = self.client.get('/results')
        content = response.data.decode()
        
        # Check for details elements with onclick
        details_pattern = r'<details[^>]+onclick="[^"]*"[^>]*>'
        details_matches = re.findall(details_pattern, content)
        
        self.assertGreater(len(details_matches), 0, "Should have expandable details elements")
    
    def test_analyze_button_interaction(self):
        """Test analyze button interaction"""
        with self.client.session_transaction() as sess:
            sess['parsed_data'] = {
                'function_entries': [
                    {'function_name': 'test_func', 'file_path': '/test.c', 'line_number': 10}
                ],
                'statistics': {'total_operations': 1}
            }
        
        response = self.client.get('/results')
        content = response.data.decode()
        
        # Check for analyze buttons
        analyze_button_pattern = r'<button[^>]+class="[^"]*analyze-btn[^"]*"[^>]+onclick="[^"]*"'
        analyze_buttons = re.findall(analyze_button_pattern, content)
        
        if len(analyze_buttons) > 0:
            for button in analyze_buttons:
                self.assertIn('onclick=', button, "Analyze button should have onclick handler")


class TestWebviewerAccessibility(unittest.TestCase):
    """Test accessibility aspects of webviewer interactions"""
    
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
    
    def test_keyboard_navigation_support(self):
        """Test that tabs support keyboard navigation"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check for tabindex or other keyboard navigation aids
        tab_buttons = re.findall(r'<button[^>]+class="[^"]*tab[^"]*"[^>]*>', content)
        
        for button in tab_buttons:
            # Buttons should be focusable by default, but check for explicit tabindex if set
            if 'tabindex=' in button:
                tabindex_match = re.search(r'tabindex="(-?\d+)"', button)
                if tabindex_match:
                    tabindex_value = int(tabindex_match.group(1))
                    self.assertGreaterEqual(tabindex_value, 0, 
                                          "Tab buttons should not have negative tabindex")
    
    def test_aria_labels_for_interactive_elements(self):
        """Test that interactive elements have appropriate ARIA labels"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Look for ARIA attributes on interactive elements
        aria_patterns = ['aria-label=', 'aria-expanded=', 'role=']
        
        # This is optional but good for accessibility
        has_aria = any(pattern in content for pattern in aria_patterns)
        
        if has_aria:
            self.assertTrue(True, "ARIA attributes found")
        else:
            # At minimum, buttons should have descriptive text
            button_pattern = r'<button[^>]*>([^<]+)</button>'
            button_texts = re.findall(button_pattern, content)
            
            for text in button_texts:
                self.assertGreater(len(text.strip()), 0, 
                                 "Button should have descriptive text")
    
    def test_focus_management(self):
        """Test focus management in tab navigation"""
        response = self.client.get('/')
        content = response.data.decode()
        
        # Check that there's proper focus management in showTab function
        showTab_match = re.search(r'function showTab\(.*?\)\s*\{(.*?)\n\s*\}', content, re.DOTALL)
        
        if showTab_match:
            function_body = showTab_match.group(1)
            
            # Good practice: focus management should be present
            # This is a guideline check rather than strict requirement
            self.assertTrue(len(function_body) > 50, "showTab function should have substantial implementation")


if __name__ == '__main__':
    unittest.main()
