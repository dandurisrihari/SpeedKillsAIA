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
    
    def extract_timestamp(self, line: str) -> Optional[tuple]:
        """Extract timestamp from log line, returning both original format and numeric value"""
        match = self.patterns.match_timestamp(line)
        if not match:
            return None
            
        # Handle bracket format: [123.456]
        if match.group(1):
            timestamp_str = match.group(1)
            return (timestamp_str, float(timestamp_str))
        
        # Handle ISO 8601 format: 2025-08-03T19:04:36,338434+00:00
        elif match.group(2):
            iso_timestamp = match.group(2)
            
            # Extract just the time part for display: 19:04:36,338434
            time_part = iso_timestamp.split('T')[1] if 'T' in iso_timestamp else iso_timestamp
            if '+' in time_part:
                time_part = time_part.split('+')[0]
            elif '-' in time_part and time_part.count('-') > 0:
                # Handle negative timezone offset
                parts = time_part.split('-')
                if len(parts) > 1:
                    time_part = parts[0]
            
            # Parse numeric value for sorting
            try:
                # Replace comma with dot for microseconds if needed
                iso_for_parsing = iso_timestamp.replace(',', '.')
                # Parse the timestamp
                import datetime
                dt = datetime.datetime.fromisoformat(iso_for_parsing)
                numeric_timestamp = dt.timestamp()
            except (ValueError, AttributeError):
                # Fallback: extract just the seconds since midnight as float
                if ',' in time_part:
                    clean_time = time_part.replace(',', '.')
                else:
                    clean_time = time_part
                
                time_components = clean_time.split(':')
                if len(time_components) >= 3:
                    hours = int(time_components[0])
                    minutes = int(time_components[1])
                    seconds_with_micro = float(time_components[2])
                    numeric_timestamp = hours * 3600 + minutes * 60 + seconds_with_micro
                else:
                    numeric_timestamp = 0.0
                    
            return (time_part, numeric_timestamp)
                
        return None
    
    @abstractmethod
    def can_parse(self, line: str) -> bool:
        """Check if this parser can handle the given line"""
        pass
    
    @abstractmethod
    def parse(self, line: str, timestamp: float, context: Any = None) -> Tuple[bool, Any]:
        """Parse the line and return (success, parsed_data)"""
        pass
