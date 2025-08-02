#!/usr/bin/env python3
"""
File tracking utilities for kernel log parsing
"""

from typing import Set
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
