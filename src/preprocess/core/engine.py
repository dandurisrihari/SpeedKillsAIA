#!/usr/bin/env python3
"""
Main kernel log parser engine

This module contains the core parsing engine that coordinates all individual parsers
and manages the overall parsing workflow. It handles file processing, result aggregation,
and provides a clean interface for the parsing process.

The engine follows these key principles:
- Modular design with separate parsers for different log types
- Efficient streaming processing for large files  
- Comprehensive error handling and logging
- Deduplication to reduce memory usage and improve performance
- Progress tracking for user feedback
- Extensible architecture for adding new parser types

Key Components:
- KernelLogParserEngine: Main orchestrating class
- Individual parsers: Function, DMA, UserCopy, IOCTL
- Deduplication system: Reduces duplicate entries
- Function code extraction: Gets source code for operations
- Progress tracking: Real-time user feedback
"""

import json
import sys
from pathlib import Path
from typing import Dict, List, Any, Optional, Union
from collections import defaultdict

from .models import (
    ParseResults, ParseMetadata, ParseStatistics, 
    FunctionEntry, DMAOperation, UserCopyOperation, IOCTLOperation, ProcessInfo,
    MemoryInfo, DeviceInfo
)
from .patterns import LogPatterns
from ..parsers.function_parser import FunctionEntryParser
from ..parsers.dma_parser import DMAParser
from ..parsers.user_copy_parser import UserCopyParser
from ..parsers.ioctl_parser import IOCTLParser
from ..parsers.memory_parser import MemoryParser
from ..parsers.strace_parser import StraceParser
from ..utils.progress import ProgressUI
from ..utils.deduplication import KernelLogDeduplicator
from ..utils.file_tracker import FileTracker
from ..utils.function_extractor import FunctionCodeExtractor


class KernelLogParserEngine:
    """
    Main parsing engine that coordinates all parsers
    
    This is the central orchestrating class that manages the entire parsing workflow.
    It coordinates individual parsers, handles file I/O, manages deduplication,
    tracks statistics, and builds the final results.
    
    The engine processes log files line by line, attempting to match each line
    against known patterns using specialized parsers. When matches are found,
    it extracts relevant information, applies deduplication, and optionally
    extracts function source code.
    
    Key responsibilities:
    - File processing and line-by-line parsing
    - Parser coordination and result handling
    - Deduplication and statistics tracking
    - Function code extraction coordination
    - Progress reporting and user feedback
    - Result aggregation and output generation
    """
    
    def __init__(self, show_ui: bool = True, source_root_path: Optional[str] = None):
        """
        Initialize the parsing engine with configuration
        
        Args:
            show_ui: Whether to display progress UI during parsing
            source_root_path: Optional root path for resolving relative file paths
                            in log entries. Used for function code extraction.
        """
        self.show_ui = show_ui
        self.ui = ProgressUI(show_ui)
        self.source_root_path = source_root_path
        
        # Initialize patterns and parsers
        # Each parser handles a specific type of log entry
        self.patterns = LogPatterns()
        self.pattern_matcher = self.patterns  # Alias for backward compatibility
        self.function_parser = FunctionEntryParser(self.patterns)
        self.dma_parser = DMAParser(self.patterns)
        self.user_copy_parser = UserCopyParser(self.patterns)
        self.ioctl_parser = IOCTLParser(self.patterns)
        self.memory_parser = MemoryParser(self.patterns)
        
        # Initialize tracking utilities
        # Deduplicator removes duplicate entries to save memory and processing
        self.deduplicator = KernelLogDeduplicator()
        # File tracker maintains statistics about processed files
        self.file_tracker = FileTracker()
        
        # Function code extractor gets source code for function references
        self.function_extractor = FunctionCodeExtractor(source_root_path)
        
        # Progress callback for testing
        self._progress_callback = None
        
        # Results storage - organized by type for efficient processing
        self.functions_by_file = defaultdict(list)  # Grouped by file for organization
        self.dma_operations = []       # DMA operations with stack traces
        self.user_copy_operations = [] # User-space copy operations
        self.ioctl_operations = []     # IOCTL handler operations
        self.pending_user_copy = None  # For attaching process info to user copy ops
        self.pending_dma_operation = None  # For attaching stack traces to DMA ops
        
        # Total counters track all entries found before deduplication
        # This helps users understand the total activity vs unique operations
        self.total_function_entries_found = 0
        self.total_dma_operations_found = 0
        self.total_user_copy_operations_found = 0
        self.total_ioctl_operations_found = 0
        
        # Stack trace storage for DMA operations
        # DMA stack traces can span multiple lines, so we need temporary storage
        self.pending_stack_traces = {}  # dma_function -> stack_trace
        
        # Metadata about the parsing run
        self.metadata = ParseMetadata()
    
    def _count_total_c_files(self, source_root: str) -> int:
        """
        Count total .c files recursively in the source root directory
        
        Args:
            source_root: Path to the root directory to search
            
        Returns:
            Total number of .c files found
        """
        try:
            source_path = Path(source_root)
            if not source_path.exists() or not source_path.is_dir():
                return 0
                
            # Recursively search for all .c files
            c_files = list(source_path.rglob("*.c"))
            return len(c_files)
        except Exception as e:
            # If we can't count files, return 0 to avoid breaking the parser
            if self.show_ui:
                print(f"Warning: Could not count .c files in {source_root}: {e}")
            return 0
    
    def parse_log_file(self, log_file_path, output_file: Optional[str] = None):
        """Parse entire log file and return structured results"""
        # Convert to Path object if string
        if isinstance(log_file_path, str):
            log_file_path = Path(log_file_path)
            
        if not log_file_path.exists():
            raise FileNotFoundError(f"Log file not found: {log_file_path}")
        
        self.metadata.log_file = str(log_file_path)
        
        self.ui.print_message(f"\nParsing Kernel Log: {log_file_path.name}")
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
    
    def parse_line(self, line: str, line_num: int = 1) -> bool:
        """
        Public method to parse a single log line
        
        Args:
            line: Log line to parse
            line_num: Line number (optional, defaults to 1)
            
        Returns:
            True if line was successfully parsed, False otherwise
        """
        return self._parse_line(line, line_num)
    
    def _parse_line(self, line: str, line_num: int) -> bool:
        """Parse a single log line using appropriate parser"""
        line = line.strip()
        if not line:
            return False
        
        # Extract timestamp (returns tuple of readable_time_str, numeric_timestamp)
        timestamp_data = self.function_parser.extract_timestamp(line)
        if timestamp_data is None:
            return False
        
        parsed = False
        
        # Try DMA parser first (handles stack collection state)
        if self.dma_parser.can_parse(line):
            success, result = self.dma_parser.parse(line, timestamp_data)
            if success:
                parsed = True
                self._handle_dma_result(result)
        
        # Try function parser
        elif self.function_parser.can_parse(line):
            success, result = self.function_parser.parse(line, timestamp_data)
            if success:
                parsed = True
                self._handle_function_result(result)
        
        # Try user copy parser
        elif self.user_copy_parser.can_parse(line):
            success, result = self.user_copy_parser.parse(line, timestamp_data)
            if success:
                parsed = True
                self._handle_user_copy_result(result)
        
        # Try IOCTL parser
        elif self.ioctl_parser.can_parse(line):
            success, result = self.ioctl_parser.parse(line, timestamp_data)
            if success:
                parsed = True
                self._handle_ioctl_result(result)
        
        # Try memory parser
        elif self.memory_parser.can_parse(line):
            success, result = self.memory_parser.parse(line, timestamp_data)
            if success:
                parsed = True
                self._handle_memory_result(result)
        
        if parsed:
            self.metadata.parsed_lines += 1
        
        return parsed
    
    def _handle_function_result(self, result):
        """Handle function parser result"""
        function_entry, file_path = result
        
        # Track file
        self.file_tracker.add_file(file_path, has_function_entry=True)
        
        # Increment total counter
        self.total_function_entries_found += 1
        
        # Check for duplicates first
        if not self.deduplicator.functions.is_duplicate((function_entry, file_path)):
            # Extract function code for function entries
            function_data = self.function_extractor.extract_function_at_line(
                file_path, function_entry.line_number
            )
            
            if function_data:
                function_name, function_code, start_line, end_line, preprocessed_code, preprocessed_file_code = function_data
                function_entry.function_code = function_code
                function_entry.preprocessed_code = preprocessed_code
                function_entry.preprocessed_file_code = preprocessed_file_code
                self.ui.print_operation("Function", 
                    f"{function_entry.function_name} in {file_path}:{function_entry.line_number}")
                self.ui.print_operation("", f"Extracted function: {function_name} (lines {start_line}-{end_line})")
                if preprocessed_code:
                    self.ui.print_operation("", f"✅ Found preprocessed code ({len(preprocessed_code)} chars)")
                self.ui.print_function_code(function_name, function_code)
            else:
                self.ui.print_operation("Function", 
                    f"{function_entry.function_name} in {file_path}:{function_entry.line_number}")
                self.ui.print_operation("", "⚠️  Could not extract function code")
            
            self.functions_by_file[file_path].append(function_entry)
    
    def _handle_dma_result(self, result):
        """Handle DMA parser result"""
        if isinstance(result, DMAOperation):
            # Track file
            self.file_tracker.add_file(result.file_path)
            
            # Increment total counter
            self.total_dma_operations_found += 1
            
            # Check for duplicates first
            if not self.deduplicator.dma_operations.is_duplicate(result):
                # Extract function code only for unique operations
                function_data = self.function_extractor.extract_function_at_line(
                    result.file_path, result.line_number
                )
                
                if function_data:
                    function_name, function_code, start_line, end_line, preprocessed_code, preprocessed_file_code = function_data
                    result.function_code = function_code
                    result.preprocessed_code = preprocessed_code
                    result.preprocessed_file_code = preprocessed_file_code
                    self.ui.print_operation("DMA", 
                        f"{result.dma_function} called by {result.caller_function}")
                    self.ui.print_operation("", f"Extracted function: {function_name} (lines {start_line}-{end_line})")
                    if preprocessed_code:
                        self.ui.print_operation("", f"✅ Found preprocessed code ({len(preprocessed_code)} chars)")
                    self.ui.print_function_code(function_name, function_code)
                else:
                    self.ui.print_operation("DMA", 
                        f"{result.dma_function} called by {result.caller_function}")
                    self.ui.print_operation("", "⚠️  Could not extract function code")
                
                self.dma_operations.append(result)
                # Store for potential stack trace attachment
                self.pending_dma_operation = result
            else:
                # For duplicate operations, find the existing operation to attach stack trace to
                for existing_op in self.dma_operations:
                    if (existing_op.dma_function == result.dma_function and 
                        existing_op.caller_function == result.caller_function and
                        existing_op.file_path == result.file_path and
                        existing_op.line_number == result.line_number):
                        self.pending_dma_operation = existing_op
                        break
        
        elif isinstance(result, tuple):
            result_type = result[0]
            if result_type == 'stack_end':
                # Attach stack trace to the pending DMA operation
                _, dma_function, stack_trace = result
                if hasattr(self, 'pending_dma_operation') and self.pending_dma_operation and dma_function and stack_trace:
                    if self.pending_dma_operation.dma_function == dma_function:
                        # Only add stack trace if it's not empty and not already present
                        if stack_trace and not self.pending_dma_operation.stack_trace:
                            self.pending_dma_operation.stack_trace = stack_trace
                        self.pending_dma_operation = None  # Clear for next operation
    
    def _handle_user_copy_result(self, result):
        """Handle user copy parser result"""
        if isinstance(result, UserCopyOperation):
            # Track file
            self.file_tracker.add_file(result.file_path)
            
            # Increment total counter
            self.total_user_copy_operations_found += 1
            
            # Check for duplicates first
            if not self.deduplicator.user_copy_operations.is_duplicate(result):
                # Extract function code only for unique operations
                function_data = self.function_extractor.extract_function_at_line(
                    result.file_path, result.line_number
                )
                
                if function_data:
                    function_name, function_code, start_line, end_line, preprocessed_code, preprocessed_file_code = function_data
                    result.function_code = function_code
                    result.preprocessed_code = preprocessed_code
                    result.preprocessed_file_code = preprocessed_file_code
                    self.ui.print_operation("User Copy", 
                        f"{result.copy_function} called by {result.caller_function}")
                    self.ui.print_operation("", f"Extracted function: {function_name} (lines {start_line}-{end_line})")
                    if preprocessed_code:
                        self.ui.print_operation("", f"✅ Found preprocessed code ({len(preprocessed_code)} chars)")
                    self.ui.print_function_code(function_name, function_code)
                else:
                    self.ui.print_operation("User Copy", 
                        f"{result.copy_function} called by {result.caller_function}")
                    self.ui.print_operation("", "⚠️  Could not extract function code")
                
                self.user_copy_operations.append(result)
                self.pending_user_copy = result
        
        elif isinstance(result, ProcessInfo):
            # Attach to most recent user copy operation
            if (self.pending_user_copy and 
                self.pending_user_copy.process_info is None):
                self.pending_user_copy.process_info = result
                self.ui.print_operation("", f"Process: {result.comm} (PID: {result.pid})")
    
    def _handle_ioctl_result(self, result):
        """Handle IOCTL parser result"""
        if isinstance(result, IOCTLOperation):
            # Track file
            self.file_tracker.add_file(result.file_path)
            
            # Increment total counter
            self.total_ioctl_operations_found += 1
            
            # Check for duplicates first
            if not self.deduplicator.ioctl_operations.is_duplicate(result):
                # Extract function code only for unique operations
                function_data = self.function_extractor.extract_function_at_line(
                    result.file_path, result.line_number
                )
                
                if function_data:
                    function_name, function_code, start_line, end_line, preprocessed_code, preprocessed_file_code = function_data
                    result.function_code = function_code
                    result.preprocessed_code = preprocessed_code
                    result.preprocessed_file_code = preprocessed_file_code
                    self.ui.print_operation("IOCTL Handler", 
                        f"{result.function_name} at {result.file_path}:{result.line_number}")
                    self.ui.print_operation("", f"Extracted function: {function_name} (lines {start_line}-{end_line})")
                    if preprocessed_code:
                        self.ui.print_operation("", f"✅ Found preprocessed code ({len(preprocessed_code)} chars)")
                    self.ui.print_function_code(function_name, function_code)
                else:
                    self.ui.print_operation("IOCTL Handler", 
                        f"{result.function_name} at {result.file_path}:{result.line_number}")
                    self.ui.print_operation("", "⚠️  Could not extract function code")
                
                self.ioctl_operations.append(result)
    
    def _handle_memory_result(self, result):
        """Handle memory parser result"""
        if result:
            self.ui.print_operation("Memory Info", f"Parsed memory entry: {type(result).__name__}")
    
    def _build_results(self) -> ParseResults:
        """Build final ParseResults object"""
        # Set call counts for all operations
        self._set_call_counts()
        
        # Calculate statistics
        file_stats = self.file_tracker.get_statistics(self.functions_by_file)
        
        # Count total .c files if source root is provided
        total_files = 0
        if self.source_root_path:
            total_files = self._count_total_c_files(self.source_root_path)
        
        statistics = ParseStatistics(
            unique_function_entries=sum(len(funcs) for funcs in self.functions_by_file.values()),
            unique_dma_operations=len(self.dma_operations),
            unique_user_copy_operations=len(self.user_copy_operations),
            unique_ioctl_operations=len(self.ioctl_operations),
            total_function_entries_found=self.total_function_entries_found,
            total_dma_operations_found=self.total_dma_operations_found,
            total_user_copy_operations_found=self.total_user_copy_operations_found,
            total_ioctl_operations_found=self.total_ioctl_operations_found,
            files_with_functions_entrypoint_instrumented=file_stats['files_with_functions'],
            total_files=total_files,
            files_need_analysis=file_stats['total_files_analyzed'],
            files_instrumented_with_function_entries=file_stats['files_instrumented_with_function_entries'],
            total_duplicates_skipped=self.deduplicator.total_duplicates
        )
        
        # Update metadata
        self.metadata.unique_entries = (
            statistics.unique_function_entries +
            statistics.unique_dma_operations +
            statistics.unique_user_copy_operations +
            statistics.unique_ioctl_operations
        )
        
        return ParseResults(
            metadata=self.metadata,
            functions_by_file=dict(self.functions_by_file),
            dma_operations=self.dma_operations,
            user_copy_operations=self.user_copy_operations,
            ioctl_operations=self.ioctl_operations,
            statistics=statistics,
            memory_info=self.memory_parser.get_memory_info()
        )
    
    def _set_call_counts(self):
        """Set call counts for all operations based on deduplication tracker data"""
        # Set call counts for function entries
        for file_path, functions in self.functions_by_file.items():
            for func in functions:
                call_count = self.deduplicator.functions.get_call_count((func, file_path))
                func.call_count = call_count
        
        # Set call counts for DMA operations
        for dma in self.dma_operations:
            call_count = self.deduplicator.dma_operations.get_call_count(dma)
            dma.call_count = call_count
        
        # Set call counts for user copy operations
        for copy_op in self.user_copy_operations:
            call_count = self.deduplicator.user_copy_operations.get_call_count(copy_op)
            copy_op.call_count = call_count
        
        # Set call counts for IOCTL operations
        for ioctl in self.ioctl_operations:
            call_count = self.deduplicator.ioctl_operations.get_call_count(ioctl)
            ioctl.call_count = call_count
    
    def parse_strace_log(self, strace_file_path: str) -> Optional[Dict]:
        """
        Parse strace log file for device access information
        
        Args:
            strace_file_path: Path to the strace log file
            
        Returns:
            Device info dictionary or None if parsing fails
        """
        try:
            strace_file = Path(strace_file_path)
            if not strace_file.exists():
                self.ui.print_message(f"❌ Strace file not found: {strace_file}")
                return None
            
            self.ui.print_message(f"Processing strace log: {strace_file.name}")
            
            # Initialize strace parser
            strace_parser = StraceParser()
            
            # First pass: count total lines
            with open(strace_file, 'r', encoding='utf-8', errors='ignore') as f:
                total_lines = sum(1 for _ in f)
            
            # Process file line by line
            parsed_lines = 0
            
            with open(strace_file, 'r', encoding='utf-8', errors='ignore') as f:
                for line_num, line in enumerate(f, 1):
                    # Parse line for device access
                    success, device_access = strace_parser.parse(line.strip())
                    if success:
                        parsed_lines += 1
                    
                    # Show progress every 1000 lines or at the end
                    if line_num % 1000 == 0 or line_num == total_lines:
                        self.ui.print_progress(line_num, total_lines)
            
            device_info = strace_parser.get_device_info()
            
            # Print summary
            self.ui.print_message(f"Strace parsing complete:")
            self.ui.print_message(f"   • Total lines processed: {total_lines}")
            self.ui.print_message(f"   • Device accesses found: {len(device_info.device_accesses)}")
            self.ui.print_message(f"   • Unique devices: {len(device_info.unique_devices)}")
            
            if device_info.unique_devices:
                self.ui.print_message(f"   • Devices: {', '.join(sorted(device_info.unique_devices))}")
            
            return device_info.to_dict()
            
        except Exception as e:
            self.ui.print_message(f"❌ Error parsing strace log: {e}")
            return None
    
    def save_results(self, results: ParseResults, output_file: Path):
        """Save results to JSON file"""
        with open(output_file, 'w') as f:
            json.dump(results.to_dict(), f, indent=2, default=str)
        
        self.ui.print_message(f"\n💾 Results saved to: {output_file}")
