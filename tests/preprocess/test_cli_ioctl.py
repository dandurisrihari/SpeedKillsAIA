#!/usr/bin/env python3
"""
Tests for CLI functionality including IOCTL support and source-root parameter
"""

import unittest
import sys
import os
import tempfile
import json
from unittest.mock import patch, MagicMock
from io import StringIO

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from src.preprocess.cli import main
from src.preprocess.tool import KernelLogParserTool


class TestCLIWithIOCTL(unittest.TestCase):
    """Test CLI functionality with IOCTL support"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.test_log_content = """[   47.468247] IOCTL_HANDLER: Function drv_ioctl called at drivers/gpu/driver.c:100
[   48.123456] FUNC_ENTRY: Entering function test_func at /test/file.c:200
[   49.789012] DMA_INSTRUMENT: About to call dma_map_page from function test_dma at /test/dma.c:300
"""
    
    def test_kernel_log_parser_tool_with_source_root(self):
        """Test KernelLogParserTool with source_root_path parameter"""
        # Create temporary log file
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(self.test_log_content)
            log_file = f.name
        
        # Create temporary output file
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            output_file = f.name
        
        try:
            # Create tool and process log
            tool = KernelLogParserTool()
            result = tool.process_log(log_file, output_file, source_root_path="/test/kernel/sources")
            
            # Verify output file was created
            self.assertTrue(os.path.exists(output_file))
            
            # Verify JSON content
            with open(output_file, 'r') as f:
                data = json.load(f)
            
            self.assertIn('ioctl_operations', data)
            self.assertEqual(len(data['ioctl_operations']), 1)
            
            ioctl_op = data['ioctl_operations'][0]
            self.assertEqual(ioctl_op['function_name'], 'drv_ioctl')
            self.assertEqual(ioctl_op['file_path'], 'drivers/gpu/driver.c')
            
        finally:
            os.unlink(log_file)
            if os.path.exists(output_file):
                os.unlink(output_file)
    
    def test_main_with_source_root_integration(self):
        """Test main function with --source-root parameter"""
        # Create temporary files
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(self.test_log_content)
            log_file = f.name
        
        with tempfile.NamedTemporaryFile(delete=False) as f:
            output_file = f.name
        
        try:
            # Test the main function by directly calling it with patched sys.argv
            import sys
            original_argv = sys.argv[:]
            sys.argv = [
                'preprocess_cli.py',
                log_file,
                '--output', output_file,
                '--source-root', '/kernel/sources'
            ]
            
            # Run main function
            try:
                main()
            except SystemExit as e:
                # main() calls sys.exit(0) on success
                self.assertEqual(e.code, 0)
            finally:
                # Restore original argv
                sys.argv = original_argv
            
            # Verify output file was created and contains IOCTL data
            self.assertTrue(os.path.exists(output_file))
            
            with open(output_file, 'r') as f:
                data = json.load(f)
            
            self.assertIn('ioctl_operations', data)
            
        finally:
            os.unlink(log_file)
            if os.path.exists(output_file):
                os.unlink(output_file)
    
    @patch('src.preprocess.tool.KernelLogParserEngine')
    def test_source_root_passed_to_engine(self, mock_engine_class):
        """Test that source_root parameter is passed to the parsing engine constructor"""
        # Mock the engine class and instance
        mock_engine = MagicMock()
        mock_results = MagicMock()
        mock_results.to_dict.return_value = {'test': 'data'}
        mock_engine.parse_log_file.return_value = mock_results
        mock_engine_class.return_value = mock_engine
        
        # Create temporary files
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write("test log content")
            log_file = f.name
        
        with tempfile.NamedTemporaryFile(delete=False) as f:
            output_file = f.name
        
        try:
            # Create tool and process log with source_root_path
            tool = KernelLogParserTool()
            source_root = "/test/source/root"
            tool.process_log(log_file, output_file, source_root_path=source_root)
            
            # Verify that the engine was created with source_root_path
            mock_engine_class.assert_called_once_with(source_root_path=source_root)
            # Verify that parse_log_file was called correctly
            mock_engine.parse_log_file.assert_called_once_with(log_file, output_file)
            
        finally:
            os.unlink(log_file)
            if os.path.exists(output_file):
                os.unlink(output_file)


class TestCLIErrorHandling(unittest.TestCase):
    """Test CLI error handling scenarios"""
    
    def test_invalid_log_file(self):
        """Test CLI behavior with invalid log file"""
        with tempfile.NamedTemporaryFile(delete=False) as f:
            output_file = f.name
        
        try:
            # Create tool
            tool = KernelLogParserTool()
            
            # This should handle the error gracefully
            result = tool.process_log("/nonexistent/file.log", output_file)
            
            # Should return None or handle error appropriately
            # (Actual behavior depends on implementation)
            
        finally:
            if os.path.exists(output_file):
                os.unlink(output_file)
    
    def test_invalid_source_root(self):
        """Test CLI behavior with invalid source root"""
        # Create temporary log file
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write("[   47.468247] IOCTL_HANDLER: Function test called at driver.c:100\n")
            log_file = f.name
        
        with tempfile.NamedTemporaryFile(delete=False) as f:
            output_file = f.name
        
        try:
            # Process with invalid source root - should not crash
            tool = KernelLogParserTool()
            result = tool.process_log(log_file, output_file, source_root_path="/nonexistent/path")
            
            # Should still create output file
            self.assertTrue(os.path.exists(output_file))
            
            # Verify IOCTL operation exists but without function code
            with open(output_file, 'r') as f:
                data = json.load(f)
            
            self.assertIn('ioctl_operations', data)
            if len(data['ioctl_operations']) > 0:
                ioctl_op = data['ioctl_operations'][0]
                self.assertEqual(ioctl_op['function_name'], 'test')
                # Function code should be None since source file doesn't exist
                self.assertIsNone(ioctl_op['function_code'])
            
        finally:
            os.unlink(log_file)
            if os.path.exists(output_file):
                os.unlink(output_file)


if __name__ == '__main__':
    unittest.main(verbosity=2)
