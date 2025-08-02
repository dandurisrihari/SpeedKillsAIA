#!/usr/bin/env python3
"""
Main kernel log parser engine

Coordinates all parsers and manages the parsing process.
"""

import json
from pathlib import Path
from typing import Dict, List, Any, Optional, Union
from collections import defaultdict

from .models import (
    ParseResults, ParseMetadata, ParseStatistics, 
    FunctionEntry, DMAOperation, UserCopyOperation, ProcessInfo
)
from .patterns import LogPatterns
from ..parsers.function_parser import FunctionEntryParser
from ..parsers.dma_parser import DMAParser
from ..parsers.user_copy_parser import UserCopyParser
from ..utils.progress import ProgressUI
from ..utils.deduplication import KernelLogDeduplicator
from ..utils.file_tracker import FileTracker


class KernelLogParserEngine:
    """Main parsing engine that coordinates all parsers"""
    
    def __init__(self, show_ui: bool = True):
        self.show_ui = show_ui
        self.ui = ProgressUI(show_ui)
        
        # Initialize patterns and parsers
        self.patterns = LogPatterns()
        self.function_parser = FunctionEntryParser(self.patterns)
        self.dma_parser = DMAParser(self.patterns)
        self.user_copy_parser = UserCopyParser(self.patterns)
        
        # Initialize tracking utilities
        self.deduplicator = KernelLogDeduplicator()
        self.file_tracker = FileTracker()
        
        # Results storage
        self.functions_by_file = defaultdict(list)
        self.dma_operations = []
        self.user_copy_operations = []
        self.pending_user_copy = None  # For attaching process info
        
        # Stack trace storage for DMA operations
        self.pending_stack_traces = {}  # dma_function -> stack_trace
        
        # Metadata
        self.metadata = ParseMetadata()
    
    def parse_log_file(self, log_file_path, output_file: Optional[str] = None):
        """Parse entire log file and return structured results"""
        # Convert to Path object if string
        if isinstance(log_file_path, str):
            log_file_path = Path(log_file_path)
            
        if not log_file_path.exists():
            raise FileNotFoundError(f"Log file not found: {log_file_path}")
        
        self.metadata.log_file = str(log_file_path)
        
        self.ui.print_message(f"\n🔍 Parsing Kernel Log: {log_file_path.name}")
        self.ui.print_message("=" * 60)
        
        # Count total lines
        with open(log_file_path, 'r', encoding='utf-8', errors='ignore') as file:
            total_lines = sum(1 for _ in file)
        
        self.metadata.total_lines = total_lines
        self.ui.print_message(f"📊 Total lines to process: {total_lines}")
        
        # Parse the file
        with open(log_file_path, 'r', encoding='utf-8', errors='ignore') as file:
            for line_num, line in enumerate(file, 1):
                self._parse_line(line, line_num)
                
                # Update progress every 100 lines
                if line_num % 100 == 0 or line_num == total_lines:
                    self.ui.print_progress(line_num, total_lines)
        
        # Build final results
        results = self._build_results()
        
        # Convert to dict format for API compatibility
        results_dict = results.to_dict()
        
        # Write to output file if specified
        if output_file:
            with open(output_file, 'w') as f:
                json.dump(results_dict, f, indent=2)
        
        # Print summary
        self.ui.print_summary(results.metadata, results.statistics)
        self.ui.print_file_analysis(results.functions_by_file)
        
        return results_dict
    
    def _parse_line(self, line: str, line_num: int) -> bool:
        """Parse a single log line using appropriate parser"""
        line = line.strip()
        if not line:
            return False
        
        # Extract timestamp
        timestamp = self.function_parser.extract_timestamp(line)
        if timestamp is None:
            return False
        
        parsed = False
        
        # Try DMA parser first (handles stack collection state)
        if self.dma_parser.can_parse(line):
            success, result = self.dma_parser.parse(line, timestamp)
            if success:
                parsed = True
                self._handle_dma_result(result)
        
        # Try function parser
        elif self.function_parser.can_parse(line):
            success, result = self.function_parser.parse(line, timestamp)
            if success:
                parsed = True
                self._handle_function_result(result)
        
        # Try user copy parser
        elif self.user_copy_parser.can_parse(line):
            success, result = self.user_copy_parser.parse(line, timestamp)
            if success:
                parsed = True
                self._handle_user_copy_result(result)
        
        if parsed:
            self.metadata.parsed_lines += 1
        
        return parsed
    
    def _handle_function_result(self, result):
        """Handle function parser result"""
        function_entry, file_path = result
        
        # Track file
        self.file_tracker.add_file(file_path, has_function_entry=True)
        
        # Check for duplicates
        if not self.deduplicator.functions.is_duplicate((function_entry, file_path)):
            self.functions_by_file[file_path].append(function_entry)
            self.ui.print_operation("📍 Function", 
                f"{function_entry.function_name} in {file_path}:{function_entry.line_number}")
    
    def _handle_dma_result(self, result):
        """Handle DMA parser result"""
        if isinstance(result, DMAOperation):
            # Track file
            self.file_tracker.add_file(result.file_path)
            
            # Check for duplicates
            if not self.deduplicator.dma_operations.is_duplicate(result):
                self.dma_operations.append(result)
                self.ui.print_operation("🔄 DMA", 
                    f"{result.dma_function} called by {result.caller_function}")
        
        elif isinstance(result, tuple):
            result_type = result[0]
            if result_type == 'stack_end':
                # Attach stack trace to the most recent matching DMA operation
                _, dma_function, stack_trace = result
                if self.dma_operations and dma_function and stack_trace:
                    # Find the most recent DMA operation with matching function name
                    for i in range(len(self.dma_operations) - 1, -1, -1):
                        dma_op = self.dma_operations[i]
                        if dma_op.dma_function == dma_function:
                            dma_op.stack_trace = stack_trace
                            break
    
    def _handle_user_copy_result(self, result):
        """Handle user copy parser result"""
        if isinstance(result, UserCopyOperation):
            # Track file
            self.file_tracker.add_file(result.file_path)
            
            # Check for duplicates
            if not self.deduplicator.user_copy_operations.is_duplicate(result):
                self.user_copy_operations.append(result)
                self.pending_user_copy = result
                self.ui.print_operation("👤 User Copy", 
                    f"{result.copy_function} called by {result.caller_function}")
        
        elif isinstance(result, ProcessInfo):
            # Attach to most recent user copy operation
            if (self.pending_user_copy and 
                self.pending_user_copy.process_info is None):
                self.pending_user_copy.process_info = result
                self.ui.print_operation("", f"Process: {result.comm} (PID: {result.pid})")
    
    def _build_results(self) -> ParseResults:
        """Build final ParseResults object"""
        # Calculate statistics
        file_stats = self.file_tracker.get_statistics(self.functions_by_file)
        
        statistics = ParseStatistics(
            unique_function_entries=sum(len(funcs) for funcs in self.functions_by_file.values()),
            unique_dma_operations=len(self.dma_operations),
            unique_user_copy_operations=len(self.user_copy_operations),
            files_with_functions=file_stats['files_with_functions'],
            total_files_analyzed=file_stats['total_files_analyzed'],
            files_instrumented_with_function_entries=file_stats['files_instrumented_with_function_entries'],
            total_duplicates_skipped=self.deduplicator.total_duplicates
        )
        
        # Update metadata
        self.metadata.unique_entries = (
            statistics.unique_function_entries +
            statistics.unique_dma_operations +
            statistics.unique_user_copy_operations
        )
        
        return ParseResults(
            metadata=self.metadata,
            functions_by_file=dict(self.functions_by_file),
            dma_operations=self.dma_operations,
            user_copy_operations=self.user_copy_operations,
            statistics=statistics
        )
    
    def save_results(self, results: ParseResults, output_file: Path):
        """Save results to JSON file"""
        with open(output_file, 'w') as f:
            json.dump(results.to_dict(), f, indent=2, default=str)
        
        self.ui.print_message(f"\n💾 Results saved to: {output_file}")
