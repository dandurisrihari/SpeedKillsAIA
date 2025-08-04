#!/usr/bin/env python3
"""
File tracking utilities for kernel log parsing
"""

from typing import Set
from pathlib import Path
from ..core.models import ParseStatistics


class FileTracker:
    """Track file analysis and instrumentation statistics"""
    
    def __init__(self):
        self.all_files_encountered: Set[str] = set()
        self.files_with_instrumentations: Set[str] = set()
    
    def add_file(self, file_path: str, has_function_entry: bool = False):
        """Add a file to tracking"""
        self.all_files_encountered.add(file_path)
        if has_function_entry:
            self.files_with_instrumentations.add(file_path)
    
    def get_statistics(self, functions_by_file: dict) -> dict:
        """Get file tracking statistics"""
        return {
            'total_files_analyzed': len(self.all_files_encountered),
            'files_instrumented_with_function_entries': len(self.files_with_instrumentations),
            'files_with_functions': len(functions_by_file)
        }
    
    def reset(self):
        """Reset file tracking"""
        self.all_files_encountered.clear()
        self.files_with_instrumentations.clear()
    
    def track_file(self, file_path: str):
        """Track a file (alias for add_file)"""
        self.add_file(file_path)
    
    def file_exists(self, file_path: str) -> bool:
        """Check if file exists on filesystem"""
        return Path(file_path).exists()
    
    def get_file_info(self, file_path: str) -> dict:
        """Get information about a tracked file"""
        return {
            'file_path': file_path,
            'tracked': file_path in self.all_files_encountered,
            'has_instrumentations': file_path in self.files_with_instrumentations
        }
    
    def clear_tracked_files(self):
        """Clear all tracked files (alias for reset)"""
        self.reset()
    
    def clear(self):
        """Clear all tracked files (alias for reset)"""
        self.reset()
    
    def get_tracked_files(self):
        """Get list of all tracked files"""
        return list(self.all_files_encountered)
