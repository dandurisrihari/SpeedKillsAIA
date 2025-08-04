#!/usr/bin/env python3
"""
Comprehensive tests for webviewer CLI module
"""

import unittest
import sys
import tempfile
import json
from pathlib import Path
from unittest.mock import patch, MagicMock, call
from io import StringIO

# Add the src directory to Python path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))

from src.webviewer.cli import main


class TestWebviewerCLI(unittest.TestCase):
    """Test webviewer CLI functionality"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.test_json_data = {
            "metadata": {
                "parser_version": "2.0.0",
                "parsed_at": "2023-01-01T12:00:00.000000",
                "log_file": "test.log",
                "total_lines": 100,
                "parsed_lines": 50,
                "unique_entries": 10
            },
            "function_entries": [
                {
                    "function_name": "test_function",
                    "file_path": "test.c",
                    "line_number": 10,
                    "first_seen_timestamp": 1000.0,
                    "first_seen_time_str": "10:00:00",
                    "entry_type": "function_entry",
                    "function_code": "void test_function() { return; }",
                    "call_count": 1
                }
            ],
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": [],
            "statistics": {
                "unique_function_entries": 1,
                "unique_dma_operations": 0,
                "unique_user_copy_operations": 0,
                "unique_ioctl_operations": 0
            }
        }
        
    def test_help_output(self):
        """Test help message output"""
        with patch('sys.argv', ['webviewer', '--help']):
            with patch('sys.exit', side_effect=SystemExit) as mock_exit:
                with patch('sys.stdout', new_callable=StringIO) as mock_stdout:
                    with self.assertRaises(SystemExit):
                        main()
                    
                    output = mock_stdout.getvalue()
                    self.assertIn("Web Viewer - Interactive interface", output)
                    self.assertIn("--port", output)
                    self.assertIn("--host", output)
                    self.assertIn("--auto-detect", output)

    def test_version_output(self):
        """Test version output"""
        with patch('sys.argv', ['webviewer', '--version']):
            with patch('sys.exit', side_effect=SystemExit) as mock_exit:
                with patch('sys.stdout', new_callable=StringIO) as mock_stdout:
                    with self.assertRaises(SystemExit):
                        main()
                    
                    output = mock_stdout.getvalue()
                    self.assertIn("Kernel Log Web Viewer 1.0.0", output)

    def test_missing_json_file_error(self):
        """Test error when no JSON file provided and auto-detect not enabled"""
        with patch('sys.argv', ['webviewer']):
            with patch('sys.stderr', new_callable=StringIO) as mock_stderr:
                with patch('sys.exit', side_effect=SystemExit) as mock_exit:
                    with self.assertRaises(SystemExit):
                        main()
                    mock_exit.assert_called_once_with(1)
                    
                    error_output = mock_stderr.getvalue()
                    self.assertIn("No JSON file specified", error_output)

    def test_nonexistent_json_file_error(self):
        """Test error when JSON file doesn't exist"""
        with patch('sys.argv', ['webviewer', 'nonexistent.json']):
            with patch('sys.stderr', new_callable=StringIO) as mock_stderr:
                with patch('sys.exit', side_effect=SystemExit) as mock_exit:
                    with self.assertRaises(SystemExit):
                        main()
                    mock_exit.assert_called_once_with(1)
                    
                    error_output = mock_stderr.getvalue()
                    self.assertIn("JSON file not found", error_output)

    @patch('src.webviewer.ui.start_web_ui')
    def test_successful_startup_with_file(self, mock_start_web_ui):
        """Test successful startup with valid JSON file"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(self.test_json_data, f)
            json_file = f.name
        
        try:
            mock_start_web_ui.return_value = True
            
            with patch('sys.argv', ['webviewer', json_file]):
                main()
                
                mock_start_web_ui.assert_called_once_with(
                    json_file=json_file,
                    port=5000,
                    host='127.0.0.1',
                    auto_open=True
                )
        finally:
            Path(json_file).unlink()

    @patch('src.webviewer.ui.start_web_ui')
    def test_custom_port_and_host(self, mock_start_web_ui):
        """Test startup with custom port and host"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(self.test_json_data, f)
            json_file = f.name
        
        try:
            mock_start_web_ui.return_value = True
            
            with patch('sys.argv', ['webviewer', json_file, '--port', '8080', '--host', '0.0.0.0']):
                main()
                
                mock_start_web_ui.assert_called_once_with(
                    json_file=json_file,
                    port=8080,
                    host='0.0.0.0',
                    auto_open=True
                )
        finally:
            Path(json_file).unlink()

    @patch('src.webviewer.ui.start_web_ui')
    def test_no_browser_option(self, mock_start_web_ui):
        """Test --no-browser option"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(self.test_json_data, f)
            json_file = f.name
        
        try:
            mock_start_web_ui.return_value = True
            
            with patch('sys.argv', ['webviewer', json_file, '--no-browser']):
                main()
                
                mock_start_web_ui.assert_called_once_with(
                    json_file=json_file,
                    port=5000,
                    host='127.0.0.1',
                    auto_open=False
                )
        finally:
            Path(json_file).unlink()

    @patch('src.webviewer.ui.start_web_ui')
    def test_auto_detect_option(self, mock_start_web_ui):
        """Test --auto-detect option"""
        mock_start_web_ui.return_value = True
        
        with patch('sys.argv', ['webviewer', '--auto-detect']):
            main()
            
            mock_start_web_ui.assert_called_once_with(
                json_file=None,
                port=5000,
                host='127.0.0.1',
                auto_open=True
            )

    def test_import_error_handling(self):
        """Test handling of import errors"""
        with patch('sys.argv', ['webviewer', '--auto-detect']):
            with patch('src.webviewer.ui.start_web_ui', side_effect=ImportError("Flask not found")):
                with patch('sys.stderr', new_callable=StringIO) as mock_stderr:
                    with patch('sys.exit', side_effect=SystemExit) as mock_exit:
                        with self.assertRaises(SystemExit):
                            main()
                        mock_exit.assert_called_once_with(1)
                        
                        error_output = mock_stderr.getvalue()
                        # When we mock start_web_ui to raise ImportError, it's caught as a general exception
                        self.assertIn("Error starting web UI: Flask not found", error_output)

    @patch('src.webviewer.ui.start_web_ui')
    def test_startup_failure_handling(self, mock_start_web_ui):
        """Test handling of startup failures"""
        mock_start_web_ui.return_value = False
        
        with patch('sys.argv', ['webviewer', '--auto-detect']):
            with patch('sys.stderr', new_callable=StringIO) as mock_stderr:
                with patch('sys.exit', side_effect=SystemExit) as mock_exit:
                    with self.assertRaises(SystemExit):
                        main()
                    mock_exit.assert_called_once_with(1)
                    
                    error_output = mock_stderr.getvalue()
                    self.assertIn("Failed to start web UI", error_output)

    @patch('src.webviewer.ui.start_web_ui')
    def test_keyboard_interrupt_handling(self, mock_start_web_ui):
        """Test handling of KeyboardInterrupt"""
        mock_start_web_ui.side_effect = KeyboardInterrupt()
        
        with patch('sys.argv', ['webviewer', '--auto-detect']):
            with patch('sys.stdout', new_callable=StringIO) as mock_stdout:
                main()
                
                output = mock_stdout.getvalue()
                self.assertIn("Web viewer stopped by user", output)

    @patch('src.webviewer.ui.start_web_ui')
    def test_general_exception_handling(self, mock_start_web_ui):
        """Test handling of general exceptions"""
        mock_start_web_ui.side_effect = Exception("Test error")
        
        with patch('sys.argv', ['webviewer', '--auto-detect']):
            with patch('sys.stderr', new_callable=StringIO) as mock_stderr:
                with patch('sys.exit', side_effect=SystemExit) as mock_exit:
                    with self.assertRaises(SystemExit):
                        main()
                    mock_exit.assert_called_once_with(1)
                    
                    error_output = mock_stderr.getvalue()
                    self.assertIn("Error starting web UI: Test error", error_output)


if __name__ == '__main__':
    unittest.main()
