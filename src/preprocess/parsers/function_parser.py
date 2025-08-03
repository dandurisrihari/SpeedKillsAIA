#!/usr/bin/env python3
"""
Function entry parser
"""

from typing import Tuple, Optional
from .base import BaseParser
from ..core.models import FunctionEntry
from ..core.patterns import LogPatterns


class FunctionEntryParser(BaseParser):
    """Parser for FUNC_ENTRY log lines"""
    
    def can_parse(self, line: str) -> bool:
        """Check if line contains FUNC_ENTRY"""
        return 'FUNC_ENTRY:' in line
    
    def parse(self, line: str, timestamp_data=None, context=None) -> Tuple[bool, Optional[FunctionEntry]]:
        """
        Parse FUNC_ENTRY line
        
        Args:
            timestamp_data: Tuple of (readable_time_str, numeric_timestamp) or single float for backward compatibility
        
        Returns:
            Tuple of (success, FunctionEntry or None)
        """
        match = self.patterns.search_func_entry(line)
        if not match:
            return False, None
        
        function_name = match.group(1)
        file_path = match.group(2)
        line_number = int(match.group(3))
        
        # Handle both old (float) and new (tuple) timestamp formats
        if isinstance(timestamp_data, tuple):
            time_str, numeric_timestamp = timestamp_data
        else:
            # Backward compatibility: assume it's a float
            numeric_timestamp = timestamp_data or 0.0
            time_str = str(numeric_timestamp)
        
        function_entry = FunctionEntry(
            function_name=function_name,
            line_number=line_number,
            first_seen_timestamp=numeric_timestamp,
            first_seen_time_str=time_str
        )
        
        return True, (function_entry, file_path)
