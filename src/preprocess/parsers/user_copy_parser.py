#!/usr/bin/env python3
"""
User copy operation parser
"""

from typing import Tuple, Optional
from .base import BaseParser
from ..core.models import UserCopyOperation, ProcessInfo
from ..core.patterns import LogPatterns


class UserCopyParser(BaseParser):
    """Parser for USER_COPY operations"""
    
    def can_parse(self, line: str) -> bool:
        """Check if line contains USER_COPY content"""
        return 'USER_COPY' in line
    
    def parse(self, line: str, timestamp_data=None, context=None) -> Tuple[bool, Optional[object]]:
        """
        Parse USER_COPY related lines
        
        Args:
            timestamp_data: Tuple of (readable_time_str, numeric_timestamp) or single float for backward compatibility
        
        Returns:
            Tuple of (success, result)
            result can be UserCopyOperation or ProcessInfo
        """
        # Handle both old (float) and new (tuple) timestamp formats
        if isinstance(timestamp_data, tuple):
            time_str, numeric_timestamp = timestamp_data
        else:
            numeric_timestamp = timestamp_data or 0.0
            time_str = str(numeric_timestamp)
        
        # Try USER_COPY_CONTEXT first
        process_info = self._parse_user_copy_context(line)
        if process_info:
            return True, process_info
        
        # Try USER_COPY
        user_copy = self._parse_user_copy(line, time_str, numeric_timestamp)
        if user_copy:
            return True, user_copy
        
        return False, None
    
    def _parse_user_copy(self, line: str, time_str: str, numeric_timestamp: float) -> Optional[UserCopyOperation]:
        """Parse USER_COPY line"""
        match = self.patterns.search_user_copy(line)
        if not match:
            return None
        
        copy_function = match.group(1)
        caller_function = match.group(2)
        file_path = match.group(3)
        line_number = int(match.group(4))
        
        return UserCopyOperation(
            copy_function=copy_function,
            caller_function=caller_function,
            file_path=file_path,
            line_number=line_number,
            first_seen_timestamp=numeric_timestamp,
            first_seen_time_str=time_str
        )
    
    def _parse_user_copy_context(self, line: str) -> Optional[ProcessInfo]:
        """Parse USER_COPY_CONTEXT line"""
        match = self.patterns.search_user_copy_context(line)
        if not match:
            return None
        
        pid = int(match.group(1))
        comm = match.group(2).strip()
        
        return ProcessInfo(pid=pid, comm=comm)
