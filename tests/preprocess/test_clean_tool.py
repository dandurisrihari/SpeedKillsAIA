#!/usr/bin/env python3
"""
Tests for the cleaned preprocess tool without web components

These tests verify that the core preprocessing functionality works
correctly after removing all web viewer components.
"""

import unittest
import tempfile
import shutil
import json
import os
import sys
from pathlib import Path
from tempfile import TemporaryDirectory
from unittest.mock import patch

# Add src to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from src.preprocess.tool import KernelLogParserTool, main


class TestCleanPreprocessTool(unittest.TestCase):
    """Test the preprocess tool after web component removal"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
        
        # Create test log file
        self.test_log = self.temp_path / "test_kernel.log"
        self.test_log.write_text("""
[    1.123456] FUNC_ENTRY: test_function in test.c:100
[    2.234567] DMA_MAPPING: dma_alloc_coherent called by test_function in test.c:150
[    3.345678] USER_COPY: copy_from_user called by test_function in test.c:200
[    4.456789] IOCTL: test_ioctl called with cmd=0x12345678 in test.c:250
""")
        
        # Create test strace log file
        self.test_strace_log = self.temp_path / "test_strace.log"
        self.test_strace_log.write_text("""
openat(AT_FDCWD, "/dev/test_device", O_RDWR) = 3
ioctl(3, 0x12345678, 0x7fff12345678) = 0
write(3, "test data", 9) = 9
close(3) = 0
""")
        
        # Create test source directory
        self.source_dir = self.temp_path / "source"
        self.source_dir.mkdir()
        (self.source_dir / "test.c").write_text("""
// Test source file
void test_function(void) {
    // Line 100: Function entry
    printk("Function entry");
    
    // Line 150: DMA allocation
    dma_alloc_coherent(dev, size, &dma_handle, GFP_KERNEL);
    
    // Line 200: User copy
    copy_from_user(kernel_buf, user_buf, size);
    
    // Line 250: IOCTL
    test_ioctl(file, cmd, arg);
}
""")
        
        # Create output file path
        self.output_file = self.temp_path / "results.json"
        
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    def test_tool_initialization(self):
        """Test that the tool can be initialized without web components"""
        tool = KernelLogParserTool()
        self.assertIsNotNone(tool)
        self.assertIsNone(tool.results)
    
    def test_tool_with_source_root(self):
        """Test tool initialization with source root"""
        tool = KernelLogParserTool(source_root_path=str(self.source_dir))
        self.assertEqual(tool.source_root_path, str(self.source_dir))
    
    def test_process_log_basic(self):
        """Test basic log processing without source root."""
        with TemporaryDirectory() as temp_dir:
            log_file = Path(temp_dir) / "test_kernel.log"
            log_file.write_text("""
[123.456] funcEntry: test_func drivers/test/file.c:100
[123.457] DMA instrument: dma_alloc, test_func, drivers/test/file.c:100
[123.458] DMA instrument: dma_free, test_func, drivers/test/file.c:100
[123.459] UserCopy: copy_from_user, test_func, drivers/test/file.c:100
[123.460] Invalid log line that should be ignored
""".strip())
            
            tool = KernelLogParserTool()
            results = tool.process_log(str(log_file))
            
            # Test basic structure
            self.assertIsInstance(results, dict)
            self.assertIn('metadata', results)
            self.assertIn('functions_by_file', results)
            self.assertIn('dma_operations', results)
            self.assertIn('user_copy_operations', results)
            self.assertIn('statistics', results)
            
            # Test metadata
            metadata = results['metadata']
            self.assertEqual(metadata['log_file'], str(log_file))
            self.assertGreater(metadata['total_lines'], 0)
            
            # Test parsing results - functions by file is used for verification
            self.assertIn('functions_by_file', results)
    
    def test_process_log_with_output(self):
        """Test log processing with JSON output"""
        tool = KernelLogParserTool()
        results = tool.process_log(
            str(self.test_log), 
            str(self.output_file)
        )
        
        self.assertIsNotNone(results)
        self.assertTrue(self.output_file.exists())
        
        # Verify JSON output is valid
        with open(self.output_file, 'r') as f:
            saved_results = json.load(f)
        
        self.assertEqual(results, saved_results)
    
    def test_process_log_with_source_root(self):
        """Test log processing with source root for function code extraction"""
        tool = KernelLogParserTool()
        results = tool.process_log(
            str(self.test_log),
            source_root_path=str(self.source_dir)
        )
        
        self.assertIsNotNone(results)
        # Should have functions organized by file since we have source files
        self.assertIn('functions_by_file', results)
    
    def test_process_log_with_strace(self):
        """Test log processing with strace log for device access analysis"""
        tool = KernelLogParserTool()
        results = tool.process_log(
            str(self.test_log),
            str(self.output_file),
            strace_log_path=str(self.test_strace_log)
        )
        
        self.assertIsNotNone(results)
        self.assertIn('device_info', results)
        
        device_info = results['device_info']
        self.assertIsNotNone(device_info)
        self.assertIn('total_accesses', device_info)
        self.assertIn('unique_devices', device_info)
    
    def test_process_log_nonexistent_file(self):
        """Test processing non-existent log file"""
        tool = KernelLogParserTool()
        results = tool.process_log("nonexistent.log")
        
        self.assertIsNone(results)
    
    def test_no_web_ui_method(self):
        """Test that web UI methods are not available"""
        tool = KernelLogParserTool()
        
        # The start_web_ui method should not exist
        self.assertFalse(hasattr(tool, 'start_web_ui'))
    
    def test_process_batch(self):
        """Test batch processing functionality"""
        # Create second log file
        test_log2 = self.temp_path / "test2.log"
        test_log2.write_text("""
[    5.567890] FUNC_ENTRY: another_function in another.c:50
[    6.678901] DMA_MAPPING: dma_free_coherent called by another_function in another.c:75
""")
        
        tool = KernelLogParserTool()
        results = tool.process_batch([str(self.test_log), str(test_log2)])
        
        self.assertIsInstance(results, list)
        self.assertEqual(len(results), 2)
        
        for result in results:
            self.assertIsInstance(result, dict)
            self.assertIn('functions_by_file', result)


class TestCleanMainFunction(unittest.TestCase):
    """Test the main CLI function without web components"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
        
        # Create test log file
        self.test_log = self.temp_path / "cli_test.log"
        self.test_log.write_text("""
[    1.123456] FUNC_ENTRY: cli_test_function in cli_test.c:100
[    2.234567] DMA_MAPPING: dma_alloc_coherent called by cli_test_function in cli_test.c:150
""")
        
        self.output_file = self.temp_path / "cli_results.json"
    
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    @patch('sys.argv')
    def test_main_basic_parsing(self, mock_argv):
        """Test main function with basic log parsing"""
        mock_argv.return_value = [
            'preprocess',
            '--log', str(self.test_log),
            '-o', str(self.output_file)
        ]
        
        # Mock sys.argv for argument parsing
        with patch('sys.argv', ['preprocess', '--log', str(self.test_log), '-o', str(self.output_file)]):
            try:
                main()
            except SystemExit as e:
                # main() calls sys.exit on success, which is expected
                self.assertEqual(e.code, None)  # None means success
        
        # Verify output file was created
        self.assertTrue(self.output_file.exists())
        
        # Verify JSON is valid
        with open(self.output_file, 'r') as f:
            results = json.load(f)
        
        self.assertIsInstance(results, dict)
        self.assertIn('functions_by_file', results)
    
    @patch('sys.argv')
    def test_main_missing_log_file(self, mock_argv):
        """Test main function with missing log file"""
        with patch('sys.argv', ['preprocess', '--log', 'nonexistent.log']):
            with self.assertRaises(SystemExit) as context:
                main()
            
            # Should exit with error code
            self.assertEqual(context.exception.code, 1)
    
    @patch('sys.argv')
    def test_main_help(self, mock_argv):
        """Test main function help output"""
        with patch('sys.argv', ['preprocess', '--help']):
            with self.assertRaises(SystemExit) as context:
                main()
            
            # Help should exit with code 0
            self.assertEqual(context.exception.code, 0)
    
    @patch('sys.argv')
    def test_main_version(self, mock_argv):
        """Test main function version output"""
        with patch('sys.argv', ['preprocess', '--version']):
            with self.assertRaises(SystemExit) as context:
                main()
            
            # Version should exit with code 0
            self.assertEqual(context.exception.code, 0)


class TestConfigurationCleaning(unittest.TestCase):
    """Test that configuration has been properly cleaned of web components"""
    
    def test_import_config_without_web(self):
        """Test that config can be imported without web UI settings"""
        try:
            from src.preprocess.config.settings import ParserSettings, OutputSettings
            
            # Should not have WebUISettings
            with self.assertRaises(ImportError):
                from src.preprocess.config.settings import WebUISettings
                
        except ImportError as e:
            self.fail(f"Failed to import clean config: {e}")
    
    def test_parser_settings_creation(self):
        """Test that ParserSettings can be created and used"""
        from src.preprocess.config.settings import ParserSettings
        
        settings = ParserSettings()
        self.assertIsInstance(settings, ParserSettings)
        self.assertTrue(hasattr(settings, 'show_ui'))
        self.assertTrue(hasattr(settings, 'source_root_path'))
    
    def test_output_settings_creation(self):
        """Test that OutputSettings can be created and used"""
        from src.preprocess.config.settings import OutputSettings
        
        settings = OutputSettings()
        self.assertIsInstance(settings, OutputSettings)
        self.assertTrue(hasattr(settings, 'indent_json'))
        self.assertTrue(hasattr(settings, 'include_statistics'))


if __name__ == '__main__':
    unittest.main()
