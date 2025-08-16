#!/usr/bin/env python3
"""
Simple tests for the basic CLI functionality
"""

import unittest
import tempfile
import json
from pathlib import Path
from unittest.mock import patch, MagicMock
import sys
import io

from src.preprocess.cli import create_parser, main, validate_arguments


class TestSimpleCLI(unittest.TestCase):
    """Test the simplified CLI interface"""

    def setUp(self):
        self.temp_dir = Path(tempfile.mkdtemp())
        
        # Create a simple test log
        self.test_log = self.temp_dir / "test.log"
        self.test_log.write_text("""
[    0.123456] FUNC_ENTRY: test_function at /drivers/test.c:100
[    0.234567] DMA_MAPPING: dma_alloc_coherent called by test_function at /drivers/test.c:200
[    0.345678] USER_COPY: copy_from_user called by test_function at /drivers/test.c:300
""")

    def test_create_parser(self):
        """Test that parser is created correctly"""
        parser = create_parser()
        self.assertIsNotNone(parser)
        
        # Check that help text contains required arguments
        help_text = parser.format_help()
        self.assertIn("--log", help_text)
        self.assertIn("--output", help_text)
        self.assertIn("--source-root", help_text)
        self.assertIn("--strace-log", help_text)

    def test_valid_arguments(self):
        """Test argument validation with valid arguments"""
        parser = create_parser()
        args = parser.parse_args(['--log', str(self.test_log)])
        
        # Should not raise an exception
        validate_arguments(args)

    def test_invalid_log_file(self):
        """Test argument validation with invalid log file"""
        parser = create_parser()
        args = parser.parse_args(['--log', '/nonexistent/file.log'])
        
        with self.assertRaises(SystemExit):
            with patch('sys.stderr', new_callable=io.StringIO):
                validate_arguments(args)

    @patch('src.preprocess.cli.KernelLogParserEngine')
    def test_main_basic(self, mock_engine_class):
        """Test basic main function execution"""
        # Setup mock
        mock_engine = MagicMock()
        mock_engine_class.return_value = mock_engine
        
        # Mock successful parsing
        mock_results = {
            'statistics': {
                'unique_function_entries': 1,
                'unique_dma_operations': 1,
                'unique_user_copy_operations': 1,
                'total_files': 1,
                'files_need_analysis': 1
            }
        }
        mock_engine.parse_log_file.return_value = mock_results
        
        # Test main with mocked arguments
        with patch('sys.argv', ['cli.py', '--log', str(self.test_log)]):
            with patch('sys.stdout', new_callable=io.StringIO) as mock_stdout:
                main()
                
                output = mock_stdout.getvalue()
                self.assertIn("Successfully processed", output)
                self.assertIn("Function Entries: 1", output)

    def tearDown(self):
        # Clean up temp files
        import shutil
        shutil.rmtree(self.temp_dir)


if __name__ == '__main__':
    unittest.main()
