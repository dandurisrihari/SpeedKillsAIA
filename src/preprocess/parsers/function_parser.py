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
    
    def parse(self, line: str, timestamp: float, context=None) -> Tuple[bool, Optional[FunctionEntry]]:
        """
        Parse FUNC_ENTRY line
        
        Returns:
            Tuple of (success, FunctionEntry or None)
        """
        match = self.patterns.search_func_entry(line)
        if not match:
            return False, None
        
        function_name = match.group(1)
        file_path = match.group(2)
        line_number = int(match.group(3))
        
        function_entry = FunctionEntry(
            function_name=function_name,
            line_number=line_number,
            first_seen_timestamp=timestamp
        )
        
        return True, (function_entry, file_path)
