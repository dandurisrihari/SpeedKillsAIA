#!/usr/bin/env python3
"""
IOCTL operation parser for handling ioctl handler logs
"""

from typing import Tuple, Optional
from .base import BaseParser
from ..core.models import IOCTLOperation
from ..core.patterns import LogPatterns


class IOCTLParser(BaseParser):
    """Parser for IOCTL operations"""
    
    def __init__(self, patterns: LogPatterns):
        super().__init__(patterns)
    
    def can_parse(self, line: str) -> bool:
        """Check if line contains IOCTL-related content"""
        return 'IOCTL_HANDLER:' in line
    
    def parse(self, line: str, timestamp_data=None, context=None) -> Tuple[bool, Optional[object]]:
        """
        Parse IOCTL-related lines
        
        Args:
            timestamp_data: Tuple of (readable_time_str, numeric_timestamp) or single float for backward compatibility
        
        Example line:
        [   47.468247] IOCTL_HANDLER: Function drv_ioctl called at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:673
        
        Returns:
            Tuple of (success, IOCTLOperation or None)
        """
        # Handle both old (float) and new (tuple) timestamp formats
        if isinstance(timestamp_data, tuple):
            time_str, numeric_timestamp = timestamp_data
        else:
            numeric_timestamp = timestamp_data or 0.0
            time_str = str(numeric_timestamp)
        
        # Parse IOCTL_HANDLER line
        match = self.patterns.search_ioctl_handler(line)
        if match:
            function_name = match.group(1)
            file_path = match.group(2)
            line_number = int(match.group(3))
            
            operation = IOCTLOperation(
                function_name=function_name,
                file_path=file_path,
                line_number=line_number,
                first_seen_timestamp=numeric_timestamp,
                first_seen_time_str=time_str
            )
            
            return True, operation
        
        return False, None
