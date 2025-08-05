#!/usr/bin/env python3
"""
Pattern definitions for kernel log parsing

Centralized regular expression patterns for parsing different types of log entries.
"""

import re
from typing import Dict, Pattern


class LogPatterns:
    """Centralized pattern definitions for kernel log parsing"""
    
    def __init__(self):
        """Initialize all patterns"""
        self._patterns = {
            'timestamp': re.compile(r'(?:^\[\s*(\d+\.\d+)\]|^(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}[,\.]\d+[+\-]\d{2}:\d{2})\s)'),
            'func_entry': re.compile(r'FUNC_ENTRY: Entering function (\w+) at ([^:]+):(\d+)'),
            'dma_instrument': re.compile(r'DMA_INSTRUMENT: About to call (\w+) from function (\w+) at ([^:]+):(\d+)'),
            'dma_stack_start': re.compile(r'DMA_STACK_START: Stack trace for (\w+) called from (\w+)'),
            'dma_stack_end': re.compile(r'DMA_STACK_END: End of stack trace for (\w+)'),
            'user_copy': re.compile(r'USER_COPY: About to call (\w+) from function (\w+) at ([^:]+):(\d+)'),
            'user_copy_context': re.compile(r'USER_COPY_CONTEXT: Process PID=(\d+), COMM=(.+)'),
            'ioctl_handler': re.compile(r'IOCTL_HANDLER: Function (\w+) called at ([^:]+):(\d+)'),
            # Memory parsing patterns
            'reserved_memory_cma': re.compile(r'Reserved memory: created CMA memory pool at (0x[0-9a-fA-F]+), size (\d+)\s*(\w+)'),
            'reserved_memory_dma': re.compile(r'Reserved memory: created DMA memory pool at (0x[0-9a-fA-F]+), size (\d+)\s*(\w+)'),
            'of_reserved_mem_init': re.compile(r'OF: reserved mem: initialized node ([^,]+), compatible id (.+)'),
            'of_reserved_mem_range': re.compile(r'OF: reserved mem: (0x[0-9a-fA-F]+)\.\.(0x[0-9a-fA-F]+) \((\d+) KiB\) (map|nomap) (reusable|non-reusable) (.+)'),
            'memory_zone': re.compile(r'\s+(\w+)\s+(?:\[mem (0x[0-9a-fA-F]+)-(0x[0-9a-fA-F]+)\]|empty)'),
            'memory_zone_unavailable': re.compile(r'On node \d+, zone (\w+): (\d+) pages in unavailable ranges'),
            'memory_node': re.compile(r'\s+node\s+(\d+):\s+\[mem (0x[0-9a-fA-F]+)-(0x[0-9a-fA-F]+)\]'),
        }
    
    @property
    def patterns(self) -> Dict[str, Pattern]:
        """Get all patterns"""
        return self._patterns.copy()
    
    def get_pattern(self, name: str) -> Pattern:
        """Get a specific pattern by name"""
        if name not in self._patterns:
            raise ValueError(f"Unknown pattern: {name}")
        return self._patterns[name]
    
    def match_timestamp(self, line: str) -> re.Match:
        """Match timestamp pattern"""
        return self._patterns['timestamp'].match(line)
    
    def search_func_entry(self, line: str) -> re.Match:
        """Search for function entry pattern"""
        return self._patterns['func_entry'].search(line)
    
    def search_dma_instrument(self, line: str) -> re.Match:
        """Search for DMA instrument pattern"""
        return self._patterns['dma_instrument'].search(line)
    
    def search_dma_stack_start(self, line: str) -> re.Match:
        """Search for DMA stack start pattern"""
        return self._patterns['dma_stack_start'].search(line)
    
    def search_dma_stack_end(self, line: str) -> re.Match:
        """Search for DMA stack end pattern"""
        return self._patterns['dma_stack_end'].search(line)
    
    def search_user_copy(self, line: str) -> re.Match:
        """Search for user copy pattern"""
        return self._patterns['user_copy'].search(line)
    
    def search_user_copy_context(self, line: str) -> re.Match:
        """Search for user copy context pattern"""
        return self._patterns['user_copy_context'].search(line)
    
    def search_ioctl_handler(self, line: str) -> re.Match:
        """Search for ioctl handler pattern"""
        return self._patterns['ioctl_handler'].search(line)
    
    # Memory parsing search methods
    def search_reserved_memory_cma(self, line: str) -> re.Match:
        """Search for CMA memory pool pattern"""
        return self._patterns['reserved_memory_cma'].search(line)
    
    def search_reserved_memory_dma(self, line: str) -> re.Match:
        """Search for DMA memory pool pattern"""
        return self._patterns['reserved_memory_dma'].search(line)
    
    def search_of_reserved_mem_init(self, line: str) -> re.Match:
        """Search for OF reserved memory initialization pattern"""
        return self._patterns['of_reserved_mem_init'].search(line)
    
    def search_of_reserved_mem_range(self, line: str) -> re.Match:
        """Search for OF reserved memory range pattern"""
        return self._patterns['of_reserved_mem_range'].search(line)
    
    def search_memory_zone(self, line: str) -> re.Match:
        """Search for memory zone pattern"""
        return self._patterns['memory_zone'].search(line)
    
    def search_memory_zone_unavailable(self, line: str) -> re.Match:
        """Search for memory zone unavailable pages pattern"""
        return self._patterns['memory_zone_unavailable'].search(line)
    
    def search_memory_node(self, line: str) -> re.Match:
        """Search for memory node pattern"""
        return self._patterns['memory_node'].search(line)
    
    # Additional match methods for comprehensive tests (for backward compatibility)
    def match_function_entry(self, line: str) -> dict:
        """Match function entry pattern and return structured data"""
        match = self.search_func_entry(line)
        if match:
            return {
                'function_name': match.group(1),
                'file_path': match.group(2),
                'line_number': int(match.group(3))
            }
        return None
    
    def match_dma_operation(self, line: str) -> dict:
        """Match DMA operation pattern and return structured data"""
        match = self.search_dma_instrument(line)
        if match:
            return {
                'dma_function': match.group(1),
                'caller_function': match.group(2),
                'file_path': match.group(3),
                'line_number': int(match.group(4))
            }
        return None
    
    def match_user_copy_operation(self, line: str) -> dict:
        """Match user copy operation pattern and return structured data"""
        match = self.search_user_copy(line)
        if match:
            return {
                'copy_function': match.group(1),
                'caller_function': match.group(2),
                'file_path': match.group(3),
                'line_number': int(match.group(4))
            }
        return None
    
    def match_ioctl_operation(self, line: str) -> dict:
        """Match IOCTL operation pattern and return structured data"""
        match = self.search_ioctl_handler(line)
        if match:
            return {
                'function_name': match.group(1),
                'file_path': match.group(2),
                'line_number': int(match.group(3))
            }
        return None


# Alias for backward compatibility
PatternMatcher = LogPatterns
