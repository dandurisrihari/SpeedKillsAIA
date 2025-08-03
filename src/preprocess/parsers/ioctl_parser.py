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
    
    def parse(self, line: str, timestamp: float, context=None) -> Tuple[bool, Optional[object]]:
        """
        Parse IOCTL-related lines
        
        Example line:
        [   47.468247] IOCTL_HANDLER: Function drv_ioctl called at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:673
        
        Returns:
            Tuple of (success, IOCTLOperation or None)
        """
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
                first_seen_timestamp=timestamp
            )
            
            return True, operation
        
        return False, None
