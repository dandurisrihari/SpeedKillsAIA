#!/usr/bin/env python3
"""
Simple webviewer tests that don't start actual servers
"""

import unittest
import sys
import json
import tempfile
from pathlib import Path
from unittest.mock import patch, MagicMock

# Add the src directory to Python path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))

try:
    from src.webviewer.ui import create_app, load_data
    FLASK_AVAILABLE = True
except ImportError:
    FLASK_AVAILABLE = False


class TestWebviewerSimple(unittest.TestCase):
    """Simple webviewer tests without server startup"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.test_data = {
            "metadata": {"parser_version": "2.0.0"},
            "function_entries": [],
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": [],
            "statistics": {}
        }

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_create_app(self):
        """Test app creation"""
        app = create_app()
        self.assertIsNotNone(app)
        self.assertEqual(app.name, 'src.webviewer.ui')

    def test_load_data_valid_file(self):
        """Test loading valid JSON data"""
        if not FLASK_AVAILABLE:
            self.skipTest("Flask not available")
            
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(self.test_data, f)
            json_file = Path(f.name)
        
        try:
            data = load_data(json_file)
            self.assertIsNotNone(data)
            self.assertEqual(data['metadata']['parser_version'], '2.0.0')
        finally:
            json_file.unlink()

    def test_load_data_invalid_file(self):
        """Test loading invalid file"""
        if not FLASK_AVAILABLE:
            self.skipTest("Flask not available")
            
        result = load_data(Path("nonexistent.json"))
        self.assertFalse(result)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_app_routes_exist(self):
        """Test that expected routes exist"""
        app = create_app()
        
        # Get list of routes
        routes = [rule.rule for rule in app.url_map.iter_rules()]
        
        # Check for expected routes
        expected_routes = ['/', '/upload', '/results', '/api/data', '/api/status']
        for route in expected_routes:
            self.assertIn(route, routes)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_app_config(self):
        """Test app configuration"""
        app = create_app()
        
        # Check basic Flask config
        self.assertIsNotNone(app.config)
        self.assertIn('SECRET_KEY', app.config)


if __name__ == '__main__':
    unittest.main()
