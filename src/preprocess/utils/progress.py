#!/usr/bin/env python3
"""
Progress and UI utilities for kernel log parsing
"""

import sys
from typing import Optional


class ProgressUI:
    """Progress display for console applications"""
    
    def __init__(self, show_ui: bool = True):
        self.show_ui = show_ui
    
    def print_message(self, message: str, end: str = '\n'):
        """Print UI message if enabled"""
        if self.show_ui:
            print(message, end=end, flush=True)
    
    def print_progress(self, current: int, total: int, prefix: str = "Processing"):
        """Print progress bar"""
        if not self.show_ui:
            return
            
        percent = (current / total) * 100 if total > 0 else 0
        bar_length = 40
        filled = int(bar_length * current // total) if total > 0 else 0
        bar = '█' * filled + '░' * (bar_length - filled)
        
        self.print_message(f'\r{prefix}: |{bar}| {percent:.1f}% ({current}/{total})', end='')
        if current == total:
            self.print_message('')  # New line when complete
    
    def print_summary(self, metadata, statistics):
        """Print parsing summary"""
        if not self.show_ui:
            return
        
        self.print_message("\n" + "=" * 60)
        self.print_message("📋 PARSING SUMMARY")
        self.print_message("=" * 60)
        self.print_message(f"Total lines processed: {metadata.total_lines}")
        self.print_message(f"Lines with valid entries: {metadata.parsed_lines}")
        self.print_message(f"Unique entries found: {metadata.unique_entries}")
        self.print_message(f"Duplicates skipped: {statistics.total_duplicates_skipped}")
        self.print_message("")
        self.print_message(f"📍 Unique function entries: {statistics.unique_function_entries}")
        self.print_message(f"🔄 Unique DMA operations: {statistics.unique_dma_operations}")
        self.print_message(f"👤 Unique user copy operations: {statistics.unique_user_copy_operations}")
        self.print_message(f"📁 Total files analyzed: {statistics.total_files_analyzed}")
        self.print_message(f"🔧 Files instrumented with function entries: {statistics.files_instrumented_with_function_entries}")
        self.print_message(f"📄 Files with functions: {statistics.files_with_functions}")
    
    def print_file_analysis(self, functions_by_file):
        """Print file analysis summary"""
        if not self.show_ui or not functions_by_file:
            return
        
        self.print_message("\n📁 Files analyzed:")
        for file_path, functions in functions_by_file.items():
            self.print_message(f"  {file_path}: {len(functions)} unique functions")
    
    def print_operation(self, operation_type: str, details: str):
        """Print operation details"""
        if self.show_ui:
            self.print_message(f"  {operation_type}: {details}")
