#!/usr/bin/env python3
"""
Strace log parser for device access extraction

Parses strace logs to extract device access information, specifically
looking for /dev/ device access patterns with timestamps.
"""

import re
from typing import Optional, Tuple, Dict, List
from ..core.models import DeviceAccess, DeviceInfo


class StraceParser:
    """Parser for strace logs to extract device access information"""
    
    def __init__(self):
        """Initialize the strace parser"""
        self.device_info = DeviceInfo()
        
        # Regex patterns for different strace lines
        self.patterns = {
            # Pattern for openat with /dev/ devices - unfinished calls
            'openat_unfinished': re.compile(
                r'^(\d+)\s+(\d{2}:\d{2}:\d{2}\.\d+)\s+openat\([^,]+,\s*"(/dev/[^"]+)",\s*([^<]+)<unfinished\s*\.\.\.>'
            ),
            
            # Pattern for openat with /dev/ devices - completed calls
            'openat_complete': re.compile(
                r'^(\d+)\s+(\d{2}:\d{2}:\d{2}\.\d+)\s+openat\([^,]+,\s*"(/dev/[^"]+)",\s*([^)]+)\)\s*=\s*([^<\s]+)\s*<[^>]*>'
            ),
            
            # Pattern for newfstatat with /dev/ devices  
            'newfstatat': re.compile(
                r'^(\d+)\s+(\d{2}:\d{2}:\d{2}\.\d+)\s+newfstatat\([^,]+,\s*"(/dev/[^"]+)",\s*\{[^}]*\},\s*\d+\)\s*=\s*([^<\s]+)\s*<[^>]*>'
            ),
            
            # Pattern for other syscalls that might access /dev/ devices
            'generic_dev': re.compile(
                r'^(\d+)\s+(\d{2}:\d{2}:\d{2}\.\d+)\s+(\w+)\([^)]*"(/dev/[^"]+)"[^)]*\)(?:\s*=\s*([^<\s]+))?\s*(?:<[^>]*>)?'
            )
        }
    
    def can_parse(self, line: str) -> bool:
        """Check if this line contains device access information"""
        return "/dev/" in line and any(pattern.search(line) for pattern in self.patterns.values())
    
    def parse(self, line: str) -> Tuple[bool, Optional[DeviceAccess]]:
        """
        Parse a single strace line for device access information
        
        Returns:
            Tuple of (success, DeviceAccess object or None)
        """
        line = line.strip()
        
        if not self.can_parse(line):
            return False, None
        
        # Try each pattern
        for access_type, pattern in self.patterns.items():
            match = pattern.search(line)
            if match:
                try:
                    if access_type in ['openat_unfinished', 'openat_complete']:
                        return self._parse_openat(match, line, access_type)
                    elif access_type == 'newfstatat':
                        return self._parse_newfstatat(match, line)
                    elif access_type == 'generic_dev':
                        return self._parse_generic_dev(match, line)
                except Exception as e:
                    # Log parsing error but continue
                    print(f"Warning: Failed to parse strace line: {e}")
                    continue
        
        return False, None
    
    def _parse_openat(self, match, line: str, access_type: str) -> Tuple[bool, DeviceAccess]:
        """Parse openat system call"""
        pid = int(match.group(1))
        timestamp_str = match.group(2)
        device_path = match.group(3)
        flags = match.group(4).strip() if match.group(4) else None
        
        # For unfinished calls, there's no result
        if access_type == 'openat_unfinished':
            result = None
        else:  # openat_complete
            result = match.group(5).strip() if match.group(5) else None
        
        # Convert timestamp to float (assuming it's time of day)
        timestamp = self._parse_timestamp(timestamp_str)
        
        device_access = DeviceAccess(
            device_path=device_path,
            access_type="openat",
            timestamp=timestamp,
            timestamp_str=timestamp_str,
            pid=pid,
            flags=flags,
            result=result
        )
        
        # Add to device info
        self.device_info.device_accesses.append(device_access)
        self.device_info.unique_devices.add(device_path)
        
        return True, device_access
    
    def _parse_newfstatat(self, match, line: str) -> Tuple[bool, DeviceAccess]:
        """Parse newfstatat system call"""
        pid = int(match.group(1))
        timestamp_str = match.group(2)
        device_path = match.group(3)
        result = match.group(4).strip() if match.group(4) else None
        
        timestamp = self._parse_timestamp(timestamp_str)
        
        device_access = DeviceAccess(
            device_path=device_path,
            access_type="newfstatat",
            timestamp=timestamp,
            timestamp_str=timestamp_str,
            pid=pid,
            result=result
        )
        
        # Add to device info
        self.device_info.device_accesses.append(device_access)
        self.device_info.unique_devices.add(device_path)
        
        return True, device_access
    
    def _parse_generic_dev(self, match, line: str) -> Tuple[bool, DeviceAccess]:
        """Parse generic device access system call"""
        pid = int(match.group(1))
        timestamp_str = match.group(2)
        syscall_name = match.group(3)
        device_path = match.group(4)
        result = match.group(5).strip() if match.group(5) else None
        
        timestamp = self._parse_timestamp(timestamp_str)
        
        device_access = DeviceAccess(
            device_path=device_path,
            access_type=syscall_name,
            timestamp=timestamp,
            timestamp_str=timestamp_str,
            pid=pid,
            result=result
        )
        
        # Add to device info
        self.device_info.device_accesses.append(device_access)
        self.device_info.unique_devices.add(device_path)
        
        return True, device_access
    
    def _parse_timestamp(self, timestamp_str: str) -> float:
        """
        Parse timestamp from strace format (HH:MM:SS.microseconds)
        Returns seconds since midnight as float
        """
        try:
            time_parts = timestamp_str.split(':')
            hours = int(time_parts[0])
            minutes = int(time_parts[1])
            seconds_microseconds = time_parts[2].split('.')
            seconds = int(seconds_microseconds[0])
            microseconds = int(seconds_microseconds[1])
            
            # Convert to total seconds since midnight
            total_seconds = hours * 3600 + minutes * 60 + seconds + microseconds / 1000000.0
            return total_seconds
        except (ValueError, IndexError):
            # Fallback to 0 if parsing fails
            return 0.0
    
    def get_device_info(self) -> DeviceInfo:
        """Get the collected device information"""
        return self.device_info
    
    def get_unique_devices(self) -> List[str]:
        """Get list of unique devices accessed"""
        return list(self.device_info.unique_devices)
    
    def get_device_access_count(self) -> int:
        """Get total number of device access operations"""
        return len(self.device_info.device_accesses)
    
    def reset(self):
        """Reset the parser state"""
        self.device_info = DeviceInfo()
