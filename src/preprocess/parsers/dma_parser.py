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
        self.current_stack_info = []  # For informational lines
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
            # Smart selection: if we have more informational lines than function names,
            # it suggests this is a debugging context that wants comprehensive info.
            # Otherwise, prioritize clean function names for analysis.
            if len(self.current_stack_info) >= len(self.current_stack_trace):
                final_stack = self.current_stack_info if self.current_stack_info else self.current_stack_trace
            else:
                final_stack = self.current_stack_trace if self.current_stack_trace else self.current_stack_info
            
            return True, ('stack_end', self.stack_dma_function, final_stack)
        
        # If collecting stack, capture the line
        if self.collecting_stack:
            # Split on timestamp pattern to get content
            content = None
            if '+00:00 ' in line:
                # Format: "2025-08-05 12:27:38.582859+00:00  dump_backtrace+0x90/0xe8"
                parts = line.split('+00:00 ', 1)
                if len(parts) > 1:
                    content = parts[1]
            elif line.startswith('[') and '] ' in line:
                # Format: "[    5.011113]  dump_backtrace.part.0+0xdc/0xf0"
                bracket_end = line.find('] ')
                if bracket_end != -1:
                    content = line[bracket_end + 2:]
            
            if content:
                # Handle different stack trace formats:
                # 1. Function calls: " dump_backtrace+0x90/0xe8" or "dump_backtrace+0x90/0xe8"
                # 2. Coral format: "[<ffff000008089938>] dump_backtrace+0x0/0x3a8"
                # 3. TI boot format: " dump_backtrace.part.0+0xdc/0xf0"
                # 4. Informational lines: "CPU:", "Hardware name:", etc.
                
                if '+0x' in content and not content.startswith('[<'):
                    # Standard/TI format - extract function name (with or without leading space)
                    function_name = content.strip().split('+')[0]
                    # Handle TI format with .part.0 suffix
                    if '.part.' in function_name:
                        function_name = function_name.split('.part.')[0]
                    if function_name and not function_name.startswith('0x'):
                        self.current_stack_trace.append(function_name)
                elif content.startswith('[<') and '>]' in content and '+0x' in content:
                    # Coral format - extract function name after the address bracket
                    bracket_end = content.find('>] ')
                    if bracket_end != -1:
                        function_part = content[bracket_end + 3:].strip()
                        function_name = function_part.split('+')[0]
                        if function_name and not function_name.startswith('0x'):
                            self.current_stack_trace.append(function_name)
                # Store informational lines separately
                elif any(keyword in content for keyword in ['CPU:', 'Hardware name:', 'Call trace:', 'Comm:']):
                    self.current_stack_info.append(content.strip())
                return True, ('stack_line', content)
            return True, ('stack_line', line)
        
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
        self.current_stack_info = []
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
        self.current_stack_info = []
        self.stack_dma_function = None
