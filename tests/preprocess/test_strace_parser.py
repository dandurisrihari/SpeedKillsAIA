#!/usr/bin/env python3
"""
Tests for strace parser functionality

Tests the strace log parsing capabilities including device access extraction
and pattern matching for various system calls.
"""

import pytest
from src.preprocess.parsers.strace_parser import StraceParser
from src.preprocess.core.models import DeviceAccess


class TestStraceParser:
    """Test cases for StraceParser"""
    
    def setup_method(self):
        """Set up test fixtures"""
        self.parser = StraceParser()
    
    def test_parser_initialization(self):
        """Test parser initializes correctly"""
        assert self.parser.device_info is not None
        assert len(self.parser.device_info.device_accesses) == 0
        assert len(self.parser.device_info.unique_devices) == 0
    
    def test_can_parse_device_lines(self):
        """Test parser can identify device access lines"""
        # Valid device access lines
        openat_line = '22533 19:29:55.362041 openat(AT_FDCWD, "/dev/apex_0", O_RDWR <unfinished ...>'
        newfstatat_line = '22533 19:29:55.111030 newfstatat(AT_FDCWD, "/dev/apex_0", {st_mode=S_IFCHR|0660, st_rdev=makedev(0x78, 0), ...}, 0) = 0 <0.000125>'
        
        assert self.parser.can_parse(openat_line)
        assert self.parser.can_parse(newfstatat_line)
        
        # Invalid lines
        regular_line = '22533 19:29:55.018907 execve("./classify_image", ["./classify_image"], 0xffffce59d7d8 /* 23 vars */) = 0 <0.003054>'
        assert not self.parser.can_parse(regular_line)
    
    def test_parse_openat_unfinished(self):
        """Test parsing openat call marked as unfinished"""
        line = '22533 19:29:55.362041 openat(AT_FDCWD, "/dev/apex_0", O_RDWR <unfinished ...>'
        
        success, device_access = self.parser.parse(line)
        
        assert success
        assert device_access is not None
        assert device_access.device_path == "/dev/apex_0"
        assert device_access.access_type == "openat"
        assert device_access.pid == 22533
        assert device_access.timestamp_str == "19:29:55.362041"
        assert device_access.flags == "O_RDWR"
        assert device_access.result is None  # unfinished
    
    def test_parse_openat_complete(self):
        """Test parsing complete openat call with result"""
        line = '22533 19:29:56.257606 openat(AT_FDCWD, "/dev/apex_0", O_RDWR) = 5 <0.020349>'
        
        success, device_access = self.parser.parse(line)
        
        assert success
        assert device_access is not None
        assert device_access.device_path == "/dev/apex_0"
        assert device_access.access_type == "openat"
        assert device_access.pid == 22533
        assert device_access.timestamp_str == "19:29:56.257606"
        assert device_access.flags == "O_RDWR"
        assert device_access.result == "5"
    
    def test_parse_newfstatat(self):
        """Test parsing newfstatat system call"""
        line = '22533 19:29:55.111030 newfstatat(AT_FDCWD, "/dev/apex_0", {st_mode=S_IFCHR|0660, st_rdev=makedev(0x78, 0), ...}, 0) = 0 <0.000125>'
        
        success, device_access = self.parser.parse(line)
        
        assert success
        assert device_access is not None
        assert device_access.device_path == "/dev/apex_0"
        assert device_access.access_type == "newfstatat"
        assert device_access.pid == 22533
        assert device_access.timestamp_str == "19:29:55.111030"
        assert device_access.result == "0"
    
    def test_parse_usb_device(self):
        """Test parsing USB device access"""
        line = '22533 19:29:55.112081 openat(AT_FDCWD, "/dev/bus/usb", O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 4 <0.000132>'
        
        success, device_access = self.parser.parse(line)
        
        assert success
        assert device_access is not None
        assert device_access.device_path == "/dev/bus/usb"
        assert device_access.access_type == "openat"
        assert device_access.flags == "O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY"
    
    def test_timestamp_parsing(self):
        """Test timestamp conversion to float"""
        # Test basic timestamp parsing
        timestamp_str = "19:29:55.362041"
        timestamp_float = self.parser._parse_timestamp(timestamp_str)
        
        # Expected: 19*3600 + 29*60 + 55 + 0.362041 = 68400 + 1740 + 55 + 0.362041 = 70195.362041
        expected = 19 * 3600 + 29 * 60 + 55 + 0.362041
        assert abs(timestamp_float - expected) < 0.000001
    
    def test_device_info_aggregation(self):
        """Test that device info is properly aggregated"""
        lines = [
            '22533 19:29:55.362041 openat(AT_FDCWD, "/dev/apex_0", O_RDWR) = 5 <0.020349>',
            '22533 19:29:56.257606 openat(AT_FDCWD, "/dev/apex_0", O_RDWR) = 6 <0.020209>',
            '22533 19:29:55.112081 openat(AT_FDCWD, "/dev/bus/usb", O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 4 <0.000132>'
        ]
        
        for line in lines:
            self.parser.parse(line)
        
        device_info = self.parser.get_device_info()
        
        # Should have 3 accesses but only 2 unique devices
        assert len(device_info.device_accesses) == 3
        assert len(device_info.unique_devices) == 2
        assert "/dev/apex_0" in device_info.unique_devices
        assert "/dev/bus/usb" in device_info.unique_devices
    
    def test_invalid_lines(self):
        """Test handling of invalid or malformed lines"""
        invalid_lines = [
            'invalid line',
            '22533 invalid timestamp openat(...)',
            '22533 19:29:55.362041 somecall("/not/dev/path") = 0',
            ''
        ]
        
        for line in invalid_lines:
            success, device_access = self.parser.parse(line)
            assert not success
            assert device_access is None
    
    def test_reset_functionality(self):
        """Test parser reset functionality"""
        # Add some data
        line = '22533 19:29:55.362041 openat(AT_FDCWD, "/dev/apex_0", O_RDWR) = 5 <0.020349>'
        self.parser.parse(line)
        
        assert len(self.parser.device_info.device_accesses) == 1
        
        # Reset and verify clean state
        self.parser.reset()
        assert len(self.parser.device_info.device_accesses) == 0
        assert len(self.parser.device_info.unique_devices) == 0
    
    def test_device_info_to_dict(self):
        """Test DeviceInfo serialization to dictionary"""
        lines = [
            '22533 19:29:55.362041 openat(AT_FDCWD, "/dev/apex_0", O_RDWR) = 5 <0.020349>',
            '22533 19:29:55.112081 openat(AT_FDCWD, "/dev/bus/usb", O_RDONLY) = 4 <0.000132>'
        ]
        
        for line in lines:
            self.parser.parse(line)
        
        device_info = self.parser.get_device_info()
        result_dict = device_info.to_dict()
        
        assert 'device_accesses' in result_dict
        assert 'unique_devices' in result_dict
        assert 'total_accesses' in result_dict
        assert 'unique_device_count' in result_dict
        
        assert result_dict['total_accesses'] == 2
        assert result_dict['unique_device_count'] == 2
        assert len(result_dict['device_accesses']) == 2
        
        # Check device access structure
        access = result_dict['device_accesses'][0]
        assert 'device_path' in access
        assert 'access_type' in access
        assert 'timestamp' in access
        assert 'timestamp_str' in access
        assert 'pid' in access


class TestStraceParserIntegration:
    """Integration tests for strace parser with real log patterns"""
    
    def setup_method(self):
        """Set up test fixtures"""
        self.parser = StraceParser()
    
    def test_real_coral_patterns(self):
        """Test parsing patterns from real Coral device logs"""
        coral_lines = [
            '22533 19:29:55.111030 newfstatat(AT_FDCWD, "/dev/apex_0", {st_mode=S_IFCHR|0660, st_rdev=makedev(0x78, 0), ...}, 0) = 0 <0.000125>',
            '22533 19:29:55.362041 openat(AT_FDCWD, "/dev/apex_0", O_RDWR <unfinished ...>',
            '22533 19:29:56.257606 openat(AT_FDCWD, "/dev/apex_0", O_RDWR) = 5 <0.020349>',
            '22533 19:29:56.406254 openat(AT_FDCWD, "/dev/apex_0", O_RDWR) = 6 <0.020209>',
            '22533 19:29:55.112081 openat(AT_FDCWD, "/dev/bus/usb", O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 4 <0.000132>'
        ]
        
        successfully_parsed = 0
        for line in coral_lines:
            success, device_access = self.parser.parse(line)
            if success:
                successfully_parsed += 1
        
        assert successfully_parsed == len(coral_lines)  # All lines should parse
        
        device_info = self.parser.get_device_info()
        assert len(device_info.unique_devices) == 2  # /dev/apex_0 and /dev/bus/usb
        assert "/dev/apex_0" in device_info.unique_devices
        assert "/dev/bus/usb" in device_info.unique_devices
    
    def test_edge_cases(self):
        """Test edge cases and boundary conditions"""
        edge_cases = [
            # Very long device path
            '22533 19:29:55.362041 openat(AT_FDCWD, "/dev/very/long/device/path/test", O_RDWR) = 5 <0.020349>',
            # Device with numbers
            '22533 19:29:55.362041 openat(AT_FDCWD, "/dev/ttyUSB0", O_RDWR) = 5 <0.020349>',
            # Different timestamp precision
            '22533 19:29:55.1 openat(AT_FDCWD, "/dev/test", O_RDWR) = 5 <0.020349>',
        ]
        
        for line in edge_cases:
            success, device_access = self.parser.parse(line)
            assert success, f"Failed to parse: {line}"
            assert device_access is not None
