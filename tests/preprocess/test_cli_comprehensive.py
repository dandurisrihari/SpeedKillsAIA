#!/usr/bin/env python3
"""
Comprehensive tests for preprocess CLI functionality
"""

import unittest
import tempfile
import shutil
import sys
import os
import json
from pathlib import Path
from unittest.mock import patch, MagicMock
from io import StringIO

# Add src to path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))

from src.preprocess.cli import main, create_parser, validate_arguments
from src.preprocess.core.engine import KernelLogParserEngine


class TestPreprocessCLIComprehensive(unittest.TestCase):
    """Comprehensive tests for preprocess CLI"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
        self.test_log_file = self.temp_path / "test.log"
        self.test_output_file = self.temp_path / "output.json"
        
        # Create test log file
        self.create_test_log_file()
    
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    def create_test_log_file(self):
        """Create test log file"""
        content = """[  123.456789] FUNC_ENTRY: Entering function test_func at /test/file.c:100
[  123.456790] DMA_INSTRUMENT: About to call dma_alloc from function test_func at /test/file.c:100
[  123.456791] USER_COPY: About to call copy_from_user from function handler at /test/file.c:200
[  123.456792] IOCTL_HANDLER: Function device_ioctl called at /test/file.c:300"""
        
        self.test_log_file.write_text(content)
    
    def test_create_parser(self):
        """Test argument parser creation"""
        parser = create_parser()
        self.assertIsNotNone(parser)
        
        # Test with valid arguments
        args = parser.parse_args(['--input', str(self.test_log_file)])
        self.assertEqual(args.input, str(self.test_log_file))
        
        # Test with output argument
        args = parser.parse_args(['--input', str(self.test_log_file), 
                                '--output', str(self.test_output_file)])
        self.assertEqual(args.output, str(self.test_output_file))
    
    def test_validate_arguments_valid(self):
        """Test argument validation with valid arguments"""
        parser = create_parser()
        args = parser.parse_args(['--input', str(self.test_log_file)])
        
        # Should not raise any exceptions
        try:
            validate_arguments(args)
            validation_passed = True
        except SystemExit:
            validation_passed = False
        
        self.assertTrue(validation_passed)
    
    def test_validate_arguments_invalid_input(self):
        """Test argument validation with invalid input file"""
        parser = create_parser()
        nonexistent_file = str(self.temp_path / "nonexistent.log")
        args = parser.parse_args(['--input', nonexistent_file])
        
        with self.assertRaises(SystemExit):
            validate_arguments(args)
    
    def test_validate_arguments_invalid_output_dir(self):
        """Test argument validation with invalid output directory"""
        parser = create_parser()
        invalid_output = "/nonexistent/path/output.json"
        args = parser.parse_args(['--input', str(self.test_log_file), 
                                '--output', invalid_output])
        
        with self.assertRaises(SystemExit):
            validate_arguments(args)
    
    @patch('src.preprocess.cli.KernelLogParserEngine')
    def test_main_basic_functionality(self, mock_engine_class):
        """Test main function basic functionality"""
        # Mock engine
        mock_engine = MagicMock()
        mock_engine.parse_log_file.return_value = {
            'metadata': {'total_lines': 4, 'parsed_lines': 4},
            'statistics': {'total_function_entries_found': 1},
            'function_entries': [],
            'dma_operations': [],
            'user_copy_operations': [],
            'ioctl_operations': []
        }
        mock_engine_class.return_value = mock_engine
        
        test_args = ['--input', str(self.test_log_file)]
        
        with patch('sys.argv', ['preprocess'] + test_args):
            with patch('sys.stdout', new_callable=StringIO) as mock_stdout:
                try:
                    main()
                    execution_successful = True
                except SystemExit as e:
                    execution_successful = (e.code == 0)
        
        self.assertTrue(execution_successful)
        mock_engine.parse_log_file.assert_called_once_with(str(self.test_log_file), None)
    
    @patch('src.preprocess.cli.KernelLogParserEngine')
    def test_main_with_output_file(self, mock_engine_class):
        """Test main function with output file"""
        # Mock engine
        mock_engine = MagicMock()
        mock_result = {
            'metadata': {
                'parser_version': '2.0.0',
                'total_lines': 4,
                'parsed_lines': 4
            },
            'statistics': {'total_function_entries_found': 1},
            'function_entries': [{'function_name': 'test_func'}],
            'dma_operations': [],
            'user_copy_operations': [],
            'ioctl_operations': []
        }
        mock_engine.parse_log_file.return_value = mock_result
        mock_engine_class.return_value = mock_engine
        
        test_args = ['--input', str(self.test_log_file), 
                    '--output', str(self.test_output_file)]
        
        with patch('sys.argv', ['preprocess'] + test_args):
            try:
                main()
                execution_successful = True
            except SystemExit as e:
                execution_successful = (e.code == 0)
        
        self.assertTrue(execution_successful)
        
        # Check if output file was created
        if self.test_output_file.exists():
            with open(self.test_output_file, 'r') as f:
                output_data = json.load(f)
            self.assertIn('metadata', output_data)
            self.assertIn('statistics', output_data)
    
    @patch('src.preprocess.cli.KernelLogParserEngine')
    def test_main_with_quiet_mode(self, mock_engine_class):
        """Test main function with quiet mode"""
        mock_engine = MagicMock()
        mock_engine.parse_log_file.return_value = {
            'metadata': {'total_lines': 4},
            'statistics': {'total_function_entries_found': 1},
            'function_entries': [],
            'dma_operations': [],
            'user_copy_operations': [],
            'ioctl_operations': []
        }
        mock_engine_class.return_value = mock_engine
        
        test_args = ['--input', str(self.test_log_file), '--quiet']
        
        with patch('sys.argv', ['preprocess'] + test_args):
            with patch('sys.stdout', new_callable=StringIO) as mock_stdout:
                try:
                    main()
                    execution_successful = True
                except SystemExit as e:
                    execution_successful = (e.code == 0)
        
        self.assertTrue(execution_successful)
        # In quiet mode, minimal output should be produced
        if hasattr(mock_stdout, 'getvalue'):
            output = mock_stdout.getvalue()
            # Output should be minimal in quiet mode
            self.assertLess(len(output), 1000)  # Arbitrary threshold
    
    @patch('src.preprocess.cli.KernelLogParserEngine')
    def test_main_with_verbose_mode(self, mock_engine_class):
        """Test main function with verbose mode"""
        mock_engine = MagicMock()
        mock_engine.parse_log_file.return_value = {
            'metadata': {'total_lines': 4},
            'statistics': {'total_function_entries_found': 1},
            'function_entries': [],
            'dma_operations': [],
            'user_copy_operations': [],
            'ioctl_operations': []
        }
        mock_engine_class.return_value = mock_engine
        
        test_args = ['--input', str(self.test_log_file), '--verbose']
        
        with patch('sys.argv', ['preprocess'] + test_args):
            with patch('sys.stdout', new_callable=StringIO) as mock_stdout:
                try:
                    main()
                    execution_successful = True
                except SystemExit as e:
                    execution_successful = (e.code == 0)
        
        self.assertTrue(execution_successful)
    
    def test_main_with_help(self):
        """Test main function with help argument"""
        test_args = ['--help']
        
        with patch('sys.argv', ['preprocess'] + test_args):
            with patch('sys.stdout', new_callable=StringIO) as mock_stdout:
                with self.assertRaises(SystemExit) as cm:
                    main()
                
                # Help should exit with code 0
                self.assertEqual(cm.exception.code, 0)
                
                # Should produce help output
                if hasattr(mock_stdout, 'getvalue'):
                    help_output = mock_stdout.getvalue()
                    self.assertIn('usage:', help_output.lower())
    
    def test_main_with_invalid_arguments(self):
        """Test main function with invalid arguments"""
        test_args = ['--nonexistent-argument']
        
        with patch('sys.argv', ['preprocess'] + test_args):
            with patch('sys.stderr', new_callable=StringIO):
                with self.assertRaises(SystemExit) as cm:
                    main()
                
                # Should exit with non-zero code
                self.assertNotEqual(cm.exception.code, 0)
    
    @patch('src.preprocess.cli.KernelLogParserEngine')
    def test_main_engine_exception_handling(self, mock_engine_class):
        """Test main function handling engine exceptions"""
        # Mock engine to raise exception
        mock_engine = MagicMock()
        mock_engine.parse_log_file.side_effect = Exception("Engine error")
        mock_engine_class.return_value = mock_engine
        
        test_args = ['--input', str(self.test_log_file)]
        
        with patch('sys.argv', ['preprocess'] + test_args):
            with patch('sys.stderr', new_callable=StringIO) as mock_stderr:
                with self.assertRaises(SystemExit) as cm:
                    main()
                
                # Should exit with error code
                self.assertNotEqual(cm.exception.code, 0)
    
    @patch('src.preprocess.cli.KernelLogParserEngine')
    def test_main_output_permission_error(self, mock_engine_class):
        """Test main function handling output permission errors"""
        mock_engine = MagicMock()
        mock_engine.parse_log_file.side_effect = PermissionError("Permission denied")
        mock_engine_class.return_value = mock_engine
        
        test_args = ['--input', str(self.test_log_file), 
                    '--output', str(self.test_output_file)]
        
        with patch('sys.argv', ['preprocess'] + test_args):
            with patch('sys.stderr', new_callable=StringIO):
                with self.assertRaises(SystemExit) as cm:
                    main()
                
                # Should handle permission error gracefully
                self.assertNotEqual(cm.exception.code, 0)
    
    def test_argument_combinations(self):
        """Test various argument combinations"""
        parser = create_parser()
        
        # Test all combinations that should be valid
        valid_combinations = [
            ['--input', str(self.test_log_file)],
            ['--input', str(self.test_log_file), '--output', str(self.test_output_file)],
            ['--input', str(self.test_log_file), '--quiet'],
            ['--input', str(self.test_log_file), '--verbose'],
            ['--input', str(self.test_log_file), '--no-ui'],
        ]
        
        for args in valid_combinations:
            try:
                parsed_args = parser.parse_args(args)
                self.assertIsNotNone(parsed_args)
            except SystemExit:
                self.fail(f"Valid arguments failed: {args}")
    
    def test_input_file_formats(self):
        """Test handling different input file formats"""
        # Create files with different extensions
        log_files = [
            self.temp_path / "test.log",
            self.temp_path / "test.txt", 
            self.temp_path / "kernel.log",
            self.temp_path / "dmesg.out"
        ]
        
        for log_file in log_files:
            log_file.write_text("[123.456] FUNC_ENTRY: test at /test.c:1")
            
            parser = create_parser()
            args = parser.parse_args(['--input', str(log_file)])
            
            # Should accept various file extensions
            self.assertEqual(args.input, str(log_file))
    
    @patch('src.preprocess.cli.KernelLogParserEngine')
    def test_output_formats(self, mock_engine_class):
        """Test different output formats"""
        mock_engine = MagicMock()
        mock_engine.parse_log_file.return_value = {
            'metadata': {'total_lines': 1},
            'statistics': {'total_function_entries_found': 1},
            'function_entries': [{'function_name': 'test'}],
            'dma_operations': [],
            'user_copy_operations': [],
            'ioctl_operations': []
        }
        mock_engine_class.return_value = mock_engine
        
        # Test JSON output
        json_output = self.temp_path / "output.json"
        test_args = ['--input', str(self.test_log_file), 
                    '--output', str(json_output)]
        
        with patch('sys.argv', ['preprocess'] + test_args):
            try:
                main()
                # Check if JSON file was created and is valid
                if json_output.exists():
                    with open(json_output, 'r') as f:
                        data = json.load(f)
                        self.assertIn('metadata', data)
            except SystemExit:
                pass  # Expected for successful execution


class TestPreprocessCLIEdgeCases(unittest.TestCase):
    """Test edge cases for preprocess CLI"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
    
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    def test_empty_log_file(self):
        """Test CLI with empty log file"""
        empty_log = self.temp_path / "empty.log"
        empty_log.write_text("")
        
        parser = create_parser()
        args = parser.parse_args(['--input', str(empty_log)])
        
        # Should accept empty files
        self.assertEqual(args.input, str(empty_log))
    
    def test_very_long_file_paths(self):
        """Test CLI with very long file paths"""
        # Create nested directory structure
        deep_path = self.temp_path
        for i in range(10):
            deep_path = deep_path / f"very_long_directory_name_{i}"
        deep_path.mkdir(parents=True, exist_ok=True)
        
        long_file = deep_path / "test_file_with_very_long_name.log"
        long_file.write_text("[123.456] FUNC_ENTRY: test at /test.c:1")
        
        parser = create_parser()
        args = parser.parse_args(['--input', str(long_file)])
        
        self.assertEqual(args.input, str(long_file))
    
    def test_special_characters_in_paths(self):
        """Test CLI with special characters in file paths"""
        # Create files with special characters (if filesystem supports)
        special_files = []
        try:
            special_names = ["test space.log", "test-dash.log", "test_underscore.log"]
            for name in special_names:
                special_file = self.temp_path / name
                special_file.write_text("[123.456] FUNC_ENTRY: test at /test.c:1")
                special_files.append(special_file)
        except (OSError, UnicodeError):
            # Skip if filesystem doesn't support special characters
            return
        
        parser = create_parser()
        for special_file in special_files:
            args = parser.parse_args(['--input', str(special_file)])
            self.assertEqual(args.input, str(special_file))
    
    @patch('sys.stdin.isatty', return_value=False)
    def test_stdin_input(self, mock_isatty):
        """Test CLI with stdin input (if supported)"""
        parser = create_parser()
        
        # Test if parser handles stdin appropriately
        # Implementation depends on CLI design
        try:
            args = parser.parse_args(['--input', '-'])
            self.assertIsNotNone(args)
        except SystemExit:
            # Some CLI implementations may not support stdin
            pass
    
    def test_concurrent_access(self):
        """Test CLI with files that might be accessed concurrently"""
        test_log = self.temp_path / "concurrent.log"
        test_log.write_text("[123.456] FUNC_ENTRY: test at /test.c:1")
        
        parser = create_parser()
        
        # Simulate multiple argument parsing (as if multiple processes)
        for _ in range(5):
            args = parser.parse_args(['--input', str(test_log)])
            self.assertEqual(args.input, str(test_log))


if __name__ == '__main__':
    unittest.main()
