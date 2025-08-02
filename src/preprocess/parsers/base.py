#!/usr/bin/env python3
"""
Base parser interface and common functionality
"""

from abc import ABC, abstractmethod
from typing import Optional, Tuple, Any
from ..core.patterns import LogPatterns


class BaseParser(ABC):
    """Base class for all log entry parsers"""
    
    def __init__(self, patterns: LogPatterns):
        self.patterns = patterns
    
    def extract_timestamp(self, line: str) -> Optional[float]:
        """Extract timestamp from log line"""
        match = self.patterns.match_timestamp(line)
        return float(match.group(1)) if match else None
    
    @abstractmethod
    def can_parse(self, line: str) -> bool:
        """Check if this parser can handle the given line"""
        pass
    
    @abstractmethod
    def parse(self, line: str, timestamp: float, context: Any = None) -> Tuple[bool, Any]:
        """Parse the line and return (success, parsed_data)"""
        pass
