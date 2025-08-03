#!/usr/bin/env python3
"""
DMA operation parser with stack trace handling
"""

from typing import Tuple, Optional, List
from .base import BaseParser
from ..core.models import DMAOperation
from ..core.patterns import LogPatterns


class DMAParser(BaseParser):
    """Parser for DMA operations and stack traces"""
    
    def __init__(self, patterns: LogPatterns):
        super().__init__(patterns)
        self.collecting_stack = False
        self.current_stack_trace = []
        self.stack_dma_function = None
    
    def can_parse(self, line: str) -> bool:
        """Check if line contains DMA-related content or if we're collecting stack"""
        # Always parse if we're collecting stack traces
        if self.collecting_stack:
            return True
        # Otherwise check for DMA markers
        return any(marker in line for marker in ['DMA_INSTRUMENT:', 'DMA_STACK_START:', 'DMA_STACK_END:'])
    
    def parse(self, line: str, timestamp_data=None, context=None) -> Tuple[bool, Optional[object]]:
        """
        Parse DMA-related lines
        
        Args:
            timestamp_data: Tuple of (readable_time_str, numeric_timestamp) or single float for backward compatibility
        
        Returns:
            Tuple of (success, result)
            result can be:
            - DMAOperation for DMA_INSTRUMENT
            - 'stack_start' for DMA_STACK_START
            - 'stack_end' for DMA_STACK_END
            - stack_line for lines between stack markers
        """
        # Handle both old (float) and new (tuple) timestamp formats
        if isinstance(timestamp_data, tuple):
            time_str, numeric_timestamp = timestamp_data
        else:
            numeric_timestamp = timestamp_data or 0.0
            time_str = str(numeric_timestamp)
        
        # Check for DMA_STACK_START first
        if self._parse_dma_stack_start(line):
            return True, 'stack_start'
        
        # Check for DMA_STACK_END
        if self._parse_dma_stack_end(line):
            return True, ('stack_end', self.stack_dma_function, self.current_stack_trace.copy())
        
        # If collecting stack, capture the line
        if self.collecting_stack:
            stack_content = line.split('] ', 1)
            if len(stack_content) > 1:
                stack_line = stack_content[1].strip()
                self.current_stack_trace.append(stack_line)
                return True, ('stack_line', stack_line)
        
        # Check for DMA_INSTRUMENT
        dma_op = self._parse_dma_instrument(line, time_str, numeric_timestamp)
        if dma_op:
            return True, dma_op
        
        return False, None
    
    def _parse_dma_instrument(self, line: str, time_str: str, numeric_timestamp: float) -> Optional[DMAOperation]:
        """Parse DMA_INSTRUMENT line"""
        match = self.patterns.search_dma_instrument(line)
        if not match:
            return None
        
        dma_function = match.group(1)
        caller_function = match.group(2)
        file_path = match.group(3)
        line_number = int(match.group(4))
        
        return DMAOperation(
            dma_function=dma_function,
            caller_function=caller_function,
            file_path=file_path,
            line_number=line_number,
            first_seen_timestamp=numeric_timestamp,
            first_seen_time_str=time_str
        )
    
    def _parse_dma_stack_start(self, line: str) -> bool:
        """Start collecting stack trace"""
        match = self.patterns.search_dma_stack_start(line)
        if not match:
            return False
        
        self.stack_dma_function = match.group(1)
        self.collecting_stack = True
        self.current_stack_trace = []
        return True
    
    def _parse_dma_stack_end(self, line: str) -> bool:
        """End collecting stack trace"""
        match = self.patterns.search_dma_stack_end(line)
        if not match:
            return False
        
        self.collecting_stack = False
        return True
    
    def reset_stack_collection(self):
        """Reset stack collection state"""
        self.collecting_stack = False
        self.current_stack_trace = []
        self.stack_dma_function = None
