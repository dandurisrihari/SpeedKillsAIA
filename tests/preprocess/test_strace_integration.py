#!/usr/bin/env python3
"""
Tests for strace integration in CLI and engine

Tests the integration of strace log processing with the main parsing engine
and command-line interface.
"""

import pytest
import tempfile
import json
from pathlib import Path
from unittest.mock import patch, MagicMock

from src.preprocess.cli import create_parser, validate_arguments, main
from src.preprocess.core.engine import KernelLogParserEngine


class TestStraceCLIIntegration:
    """Test strace functionality in CLI"""
    
    def test_cli_parser_has_strace_option(self):
        """Test that CLI parser includes strace-log option"""
        parser = create_parser()
        
        # Check that strace-log argument is available
        help_text = parser.format_help()
        assert "--strace-log" in help_text
        assert "strace log file" in help_text.lower()
    
    def test_argument_parsing_with_strace(self):
        """Test argument parsing with strace-log option"""
        parser = create_parser()
        
        # Test with strace log
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as main_log, \
             tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as strace_log:
            
            main_log.write("test log content")
            strace_log.write("test strace content")
            main_log.flush()
            strace_log.flush()
            
            try:
                args = parser.parse_args([main_log.name, "--strace-log", strace_log.name])
                assert args.log_file == main_log.name
                assert args.strace_log == strace_log.name
            finally:
                Path(main_log.name).unlink()
                Path(strace_log.name).unlink()
    
    def test_validate_arguments_with_strace(self):
        """Test argument validation with strace file"""
        parser = create_parser()
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as main_log, \
             tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as strace_log:
            
            main_log.write("test content")
            strace_log.write("test strace content")
            main_log.flush()
            strace_log.flush()
            
            try:
                args = parser.parse_args([main_log.name, "--strace-log", strace_log.name])
                
                # Should not raise exception
                validate_arguments(args)
                
                assert args.log_file == main_log.name
                assert args.strace_log == strace_log.name
            finally:
                Path(main_log.name).unlink()
                Path(strace_log.name).unlink()
    
    def test_validate_arguments_with_missing_strace(self):
        """Test validation fails with non-existent strace file"""
        parser = create_parser()
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as main_log:
            main_log.write("test content")
            main_log.flush()
            
            try:
                args = parser.parse_args([main_log.name, "--strace-log", "/nonexistent/strace.log"])
                
                with pytest.raises(SystemExit):
                    validate_arguments(args)
            finally:
                Path(main_log.name).unlink()


class TestStraceEngineIntegration:
    """Test strace functionality in parsing engine"""
    
    def setup_method(self):
        """Set up test fixtures"""
        self.engine = KernelLogParserEngine()
    
    def test_parse_strace_log_method_exists(self):
        """Test that engine has strace parsing method"""
        assert hasattr(self.engine, 'parse_strace_log')
        assert callable(getattr(self.engine, 'parse_strace_log'))
    
    def test_parse_strace_log_with_sample_data(self):
        """Test strace log parsing with sample data"""
        sample_strace_content = """22533 19:29:55.111030 newfstatat(AT_FDCWD, "/dev/apex_0", {st_mode=S_IFCHR|0660, st_rdev=makedev(0x78, 0), ...}, 0) = 0 <0.000125>
22533 19:29:55.112081 openat(AT_FDCWD, "/dev/bus/usb", O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 4 <0.000132>
22533 19:29:55.362041 openat(AT_FDCWD, "/dev/apex_0", O_RDWR <unfinished ...>
22533 19:29:56.257606 openat(AT_FDCWD, "/dev/apex_0", O_RDWR) = 5 <0.020349>
22533 19:29:55.018907 execve("./classify_image", ["./classify_image"], 0xffffce59d7d8 /* 23 vars */) = 0 <0.003054>"""
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as strace_file:
            strace_file.write(sample_strace_content)
            strace_file.flush()
            
            try:
                result = self.engine.parse_strace_log(strace_file.name)
                
                assert result is not None
                assert 'device_accesses' in result
                assert 'unique_devices' in result
                assert 'total_accesses' in result
                assert 'unique_device_count' in result
                
                # Should find 4 device accesses (4 lines with /dev/, 1 non-device line)
                assert result['total_accesses'] == 4
                assert result['unique_device_count'] == 2  # /dev/apex_0 and /dev/bus/usb
                assert "/dev/apex_0" in result['unique_devices']
                assert "/dev/bus/usb" in result['unique_devices']
                
            finally:
                Path(strace_file.name).unlink()
    
    def test_parse_strace_log_nonexistent_file(self):
        """Test strace parsing with non-existent file"""
        result = self.engine.parse_strace_log("/nonexistent/file.log")
        assert result is None
    
    def test_parse_strace_log_empty_file(self):
        """Test strace parsing with empty file"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as strace_file:
            strace_file.flush()  # Empty file
            
            try:
                result = self.engine.parse_strace_log(strace_file.name)
                
                assert result is not None
                assert result['total_accesses'] == 0
                assert result['unique_device_count'] == 0
                
            finally:
                Path(strace_file.name).unlink()


class TestEndToEndStraceIntegration:
    """End-to-end integration tests with both dmesg and strace logs"""
    
    def test_combined_parsing_workflow(self):
        """Test complete workflow with both dmesg and strace logs"""
        # Sample dmesg content
        dmesg_content = """[    0.000000] Linux version 5.15.0
[    1.123456] ai_instrument: func_entry: test_function at test_file.c:42
[    2.234567] ai_instrument: dma_start: dma_alloc_coherent called from caller_func at /path/to/file.c:123"""
        
        # Sample strace content
        strace_content = """22533 19:29:55.111030 newfstatat(AT_FDCWD, "/dev/apex_0", {st_mode=S_IFCHR|0660, st_rdev=makedev(0x78, 0), ...}, 0) = 0 <0.000125>
22533 19:29:55.362041 openat(AT_FDCWD, "/dev/apex_0", O_RDWR) = 5 <0.020349>"""
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as dmesg_file, \
             tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as strace_file, \
             tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as output_file:
            
            dmesg_file.write(dmesg_content)
            strace_file.write(strace_content)
            dmesg_file.flush()
            strace_file.flush()
            
            try:
                engine = KernelLogParserEngine()
                
                # Parse main log
                main_results = engine.parse_log_file(dmesg_file.name, output_file.name)
                assert main_results is not None
                
                # Parse strace log
                strace_results = engine.parse_strace_log(strace_file.name)
                assert strace_results is not None
                
                # Combine results
                combined_results = main_results.copy()
                combined_results['device_info'] = strace_results
                
                # Verify combined results structure
                assert 'function_entries' in combined_results
                assert 'dma_operations' in combined_results
                assert 'device_info' in combined_results
                
                device_info = combined_results['device_info']
                assert device_info['total_accesses'] == 2
                assert device_info['unique_device_count'] == 1
                assert "/dev/apex_0" in device_info['unique_devices']
                
                # Save combined results
                with open(output_file.name, 'w') as f:
                    json.dump(combined_results, f, indent=2)
                
                # Verify file was written correctly
                with open(output_file.name, 'r') as f:
                    saved_results = json.load(f)
                    assert 'device_info' in saved_results
                    
            finally:
                Path(dmesg_file.name).unlink()
                Path(strace_file.name).unlink()
                Path(output_file.name).unlink()
    
    @patch('src.preprocess.cli.KernelLogParserEngine')
    def test_cli_main_with_strace_option(self, mock_engine_class):
        """Test CLI main function with strace option"""
        mock_engine = MagicMock()
        mock_engine_class.return_value = mock_engine
        
        # Mock the parse methods
        mock_engine.parse_log_file.return_value = {
            'function_entries': [],
            'dma_operations': [],
            'user_copy_operations': [],
            'ioctl_operations': [],
            'statistics': {'total_files': 0, 'files_need_analysis': 0, 'files_instrumented_with_function_entries': 0}
        }
        mock_engine.parse_strace_log.return_value = {
            'device_accesses': [],
            'unique_devices': [],
            'total_accesses': 0,
            'unique_device_count': 0
        }
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as main_log, \
             tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as strace_log:
            
            main_log.write("test log content")
            strace_log.write("test strace content")
            main_log.flush()
            strace_log.flush()
            
            try:
                # Mock sys.argv
                with patch('sys.argv', ['cli.py', main_log.name, '--strace-log', strace_log.name]):
                    try:
                        main()
                    except SystemExit as e:
                        # Expect successful exit
                        assert e.code == 0 or e.code is None
                
                # Verify engine methods were called
                mock_engine.parse_log_file.assert_called_once()
                mock_engine.parse_strace_log.assert_called_once_with(strace_log.name)
                
            finally:
                Path(main_log.name).unlink()
                Path(strace_log.name).unlink()


class TestStraceDataStructures:
    """Test strace-related data structures and serialization"""
    
    def test_device_access_serialization(self):
        """Test DeviceAccess object serialization"""
        from src.preprocess.core.models import DeviceAccess
        
        device_access = DeviceAccess(
            device_path="/dev/apex_0",
            access_type="openat",
            timestamp=70195.362041,
            timestamp_str="19:29:55.362041",
            pid=22533,
            flags="O_RDWR",
            result="5"
        )
        
        result_dict = device_access.to_dict()
        
        assert result_dict['device_path'] == "/dev/apex_0"
        assert result_dict['access_type'] == "openat"
        assert result_dict['timestamp'] == 70195.362041
        assert result_dict['timestamp_str'] == "19:29:55.362041"
        assert result_dict['pid'] == 22533
        assert result_dict['flags'] == "O_RDWR"
        assert result_dict['result'] == "5"
    
    def test_device_info_serialization(self):
        """Test DeviceInfo object serialization"""
        from src.preprocess.core.models import DeviceInfo, DeviceAccess
        
        device_info = DeviceInfo()
        
        # Add some device accesses
        access1 = DeviceAccess("/dev/apex_0", "openat", 123.456, "19:29:55.362041", 22533)
        access2 = DeviceAccess("/dev/bus/usb", "openat", 124.567, "19:29:56.362041", 22533)
        
        device_info.device_accesses.extend([access1, access2])
        device_info.unique_devices.update(["/dev/apex_0", "/dev/bus/usb"])
        
        result_dict = device_info.to_dict()
        
        assert 'device_accesses' in result_dict
        assert 'unique_devices' in result_dict
        assert 'total_accesses' in result_dict
        assert 'unique_device_count' in result_dict
        
        assert result_dict['total_accesses'] == 2
        assert result_dict['unique_device_count'] == 2
        assert len(result_dict['device_accesses']) == 2
        assert set(result_dict['unique_devices']) == {"/dev/apex_0", "/dev/bus/usb"}
