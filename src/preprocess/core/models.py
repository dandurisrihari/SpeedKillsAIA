#!/usr/bin/env python3
"""
Data models for kernel log parsing

Defines the core data structures used throughout the kernel log parser.
"""

from dataclasses import dataclass, field
from typing import Dict, List, Optional, Set
from datetime import datetime


@dataclass
class FunctionEntry:
    """Represents a single function entry from kernel logs"""
    function_name: str
    line_number: int
    first_seen_timestamp: float
    entry_type: str = "function_entry"


@dataclass
class ProcessInfo:
    """Process information for user copy operations"""
    pid: int
    comm: str


@dataclass
class DMAOperation:
    """Represents a DMA operation with optional stack trace"""
    dma_function: str
    caller_function: str
    file_path: str
    line_number: int
    first_seen_timestamp: float
    stack_trace: List[str] = field(default_factory=list)


@dataclass
class UserCopyOperation:
    """Represents a user copy operation"""
    copy_function: str
    caller_function: str
    file_path: str
    line_number: int
    first_seen_timestamp: float
    process_info: Optional[ProcessInfo] = None


@dataclass
class ParseStatistics:
    """Statistics about the parsing operation"""
    unique_function_entries: int = 0
    unique_dma_operations: int = 0
    unique_user_copy_operations: int = 0
    files_with_functions: int = 0
    total_files_analyzed: int = 0
    files_instrumented_with_function_entries: int = 0
    total_duplicates_skipped: int = 0


@dataclass
class ParseMetadata:
    """Metadata about the parsing operation"""
    parser_version: str = "2.0.0"
    parsed_at: str = field(default_factory=lambda: datetime.now().isoformat())
    log_file: Optional[str] = None
    total_lines: int = 0
    parsed_lines: int = 0
    unique_entries: int = 0


@dataclass
class ParseResults:
    """Complete results from kernel log parsing"""
    metadata: ParseMetadata
    functions_by_file: Dict[str, List[FunctionEntry]]
    dma_operations: List[DMAOperation]
    user_copy_operations: List[UserCopyOperation]
    statistics: ParseStatistics

    def to_dict(self) -> Dict:
        """Convert to dictionary for JSON serialization"""
        # Flatten functions_by_file into function_entries list
        function_entries = []
        for file_path, functions in self.functions_by_file.items():
            for func in functions:
                function_entries.append({
                    'function_name': func.function_name,
                    'file_path': file_path,
                    'line_number': func.line_number,
                    'first_seen_timestamp': func.first_seen_timestamp,
                    'entry_type': func.entry_type,
                    'call_count': 1  # For backward compatibility
                })
        
        return {
            'metadata': {
                'parser_version': self.metadata.parser_version,
                'parsed_at': self.metadata.parsed_at,
                'log_file': self.metadata.log_file,
                'total_lines': self.metadata.total_lines,
                'parsed_lines': self.metadata.parsed_lines,
                'unique_entries': self.metadata.unique_entries
            },
            'function_entries': function_entries,
            'functions_by_file': {
                file_path: [
                    {
                        'function_name': func.function_name,
                        'line_number': func.line_number,
                        'first_seen_timestamp': func.first_seen_timestamp,
                        'entry_type': func.entry_type
                    }
                    for func in functions
                ]
                for file_path, functions in self.functions_by_file.items()
            },
            'dma_operations': [
                {
                    'dma_function': dma.dma_function,
                    'caller_function': dma.caller_function,
                    'file_path': dma.file_path,
                    'line_number': dma.line_number,
                    'first_seen_timestamp': dma.first_seen_timestamp,
                    'stack_trace': dma.stack_trace,
                    'call_count': 1  # For backward compatibility
                }
                for dma in self.dma_operations
            ],
            'user_copy_operations': [
                {
                    'copy_function': copy_op.copy_function,
                    'caller_function': copy_op.caller_function,
                    'file_path': copy_op.file_path,
                    'line_number': copy_op.line_number,
                    'first_seen_timestamp': copy_op.first_seen_timestamp,
                    'call_count': 1,  # For backward compatibility
                    'process_info': {
                        'pid': copy_op.process_info.pid,
                        'comm': copy_op.process_info.comm
                    } if copy_op.process_info else None
                }
                for copy_op in self.user_copy_operations
            ],
            'statistics': {
                'total_lines_processed': self.metadata.total_lines,
                'unique_function_entries': self.statistics.unique_function_entries,
                'unique_dma_operations': self.statistics.unique_dma_operations,
                'unique_user_copy_operations': self.statistics.unique_user_copy_operations,
                'function_entries_found': self.statistics.unique_function_entries,
                'dma_operations_found': self.statistics.unique_dma_operations,
                'user_copy_operations_found': self.statistics.unique_user_copy_operations,
                'files_with_functions': self.statistics.files_with_functions,
                'total_files_analyzed': self.statistics.total_files_analyzed,
                'files_instrumented_with_function_entries': self.statistics.files_instrumented_with_function_entries,
                'total_duplicates_skipped': self.statistics.total_duplicates_skipped
            }
        }
