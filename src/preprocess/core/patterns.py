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
            'timestamp': re.compile(r'^\[\s*(\d+\.\d+)\]'),
            'func_entry': re.compile(r'FUNC_ENTRY: Entering function (\w+) at ([^:]+):(\d+)'),
            'dma_instrument': re.compile(r'DMA_INSTRUMENT: About to call (\w+) from function (\w+) at ([^:]+):(\d+)'),
            'dma_stack_start': re.compile(r'DMA_STACK_START: Stack trace for (\w+) called from (\w+)'),
            'dma_stack_end': re.compile(r'DMA_STACK_END: End of stack trace for (\w+)'),
            'user_copy': re.compile(r'USER_COPY: About to call (\w+) from function (\w+) at ([^:]+):(\d+)'),
            'user_copy_context': re.compile(r'USER_COPY_CONTEXT: Process PID=(\d+), COMM=(.+)'),
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
