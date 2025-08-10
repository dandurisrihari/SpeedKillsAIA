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
    first_seen_time_str: str  # Human-readable timestamp format
    file_path: str = ""  # File path where the function is located
    entry_type: str = "function_entry"
    function_code: Optional[str] = None  # Will contain extracted function source code
    preprocessed_code: Optional[str] = None  # Will contain extracted .i file content
    call_count: int = 1  # Number of times this function was called


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
    first_seen_time_str: str  # Human-readable timestamp format
    stack_trace: List[str] = field(default_factory=list)
    function_code: Optional[str] = None  # Will contain extracted function source code
    preprocessed_code: Optional[str] = None  # Will contain extracted .i file content
    call_count: int = 1  # Number of times this DMA operation was called


@dataclass
class UserCopyOperation:
    """Represents a user copy operation"""
    copy_function: str
    caller_function: str
    file_path: str
    line_number: int
    first_seen_timestamp: float
    first_seen_time_str: str  # Human-readable timestamp format
    process_info: Optional[ProcessInfo] = None
    function_code: Optional[str] = None  # Will contain extracted function source code
    preprocessed_code: Optional[str] = None  # Will contain extracted .i file content
    call_count: int = 1  # Number of times this user copy operation was called


@dataclass
class IOCTLOperation:
    """Represents an IOCTL handler operation"""
    function_name: str
    file_path: str
    line_number: int
    first_seen_timestamp: float
    first_seen_time_str: str  # Human-readable timestamp format
    function_code: Optional[str] = None  # Will contain extracted function source code
    preprocessed_code: Optional[str] = None  # Will contain extracted .i file content
    call_count: int = 1  # Number of times this IOCTL operation was called
    
    def to_dict(self) -> Dict:
        """Convert to dictionary for JSON serialization"""
        return {
            'function_name': self.function_name,
            'file_path': self.file_path,
            'line_number': self.line_number,
            'first_seen_timestamp': self.first_seen_timestamp,
            'first_seen_time_str': self.first_seen_time_str,
            'function_code': self.function_code,
            'preprocessed_code': self.preprocessed_code,
            'call_count': self.call_count
        }


@dataclass
class ParseStatistics:
    """Statistics about the parsing operation"""
    unique_function_entries: int = 0
    unique_dma_operations: int = 0
    unique_user_copy_operations: int = 0
    unique_ioctl_operations: int = 0
    total_function_entries_found: int = 0
    total_dma_operations_found: int = 0
    total_user_copy_operations_found: int = 0
    total_ioctl_operations_found: int = 0
    files_with_functions_entrypoint_instrumented: int = 0
    total_files: int = 0  # Total .c files found in source root
    files_need_analysis: int = 0  # Previously total_files_analyzed
    files_instrumented_with_function_entries: int = 0
    total_duplicates_skipped: int = 0


@dataclass
class ReservedMemoryEntry:
    """Represents a reserved memory entry from kernel boot logs"""
    start_address: str
    end_address: str
    size_kb: int
    size_readable: str  # Human readable size (e.g., "960 MiB", "32 KiB")
    name: str
    memory_type: str  # "CMA", "DMA", "non-reusable", "reusable", etc.
    compatible_id: Optional[str] = None
    mapping_type: str = "unknown"  # "map", "nomap"
    timestamp: float = 0.0
    timestamp_str: str = ""
    components: List['ReservedMemoryEntry'] = field(default_factory=list)  # OF reserved mem entries that are part of this pool
    is_main_pool: bool = False  # True for main CMA/DMA pools, False for OF components


@dataclass
class MemoryZone:
    """Represents a memory zone from kernel boot logs"""
    zone_name: str  # "DMA", "DMA32", "Normal", "Movable"
    start_address: Optional[str] = None
    end_address: Optional[str] = None
    status: str = "unknown"  # "empty", "active", "unavailable"
    unavailable_pages: Optional[int] = None
    timestamp: float = 0.0
    timestamp_str: str = ""


@dataclass
class MemoryNode:
    """Represents a memory node range from kernel boot logs"""
    node_id: int
    start_address: str
    end_address: str
    timestamp: float = 0.0
    timestamp_str: str = ""


@dataclass
class DeviceAccess:
    """Represents a device access from strace logs"""
    device_path: str  # e.g., "/dev/apex_0"
    access_type: str  # "openat", "newfstatat", etc.
    timestamp: float
    timestamp_str: str  # Human-readable timestamp format
    pid: int
    flags: Optional[str] = None  # Open flags like "O_RDWR"
    result: Optional[str] = None  # Return value or error
    
    def to_dict(self) -> Dict:
        """Convert to dictionary for JSON serialization"""
        return {
            'device_path': self.device_path,
            'access_type': self.access_type,
            'timestamp': self.timestamp,
            'timestamp_str': self.timestamp_str,
            'pid': self.pid,
            'flags': self.flags,
            'result': self.result
        }


@dataclass
class DeviceInfo:
    """Container for device access information"""
    device_accesses: List[DeviceAccess] = field(default_factory=list)
    unique_devices: Set[str] = field(default_factory=set)
    
    def to_dict(self) -> Dict:
        """Convert to dictionary for JSON serialization"""
        return {
            'device_accesses': [access.to_dict() for access in self.device_accesses],
            'unique_devices': list(self.unique_devices),
            'total_accesses': len(self.device_accesses),
            'unique_device_count': len(self.unique_devices)
        }


@dataclass
class MemoryInfo:
    """Container for all memory-related information parsed from logs"""
    reserved_memory: List[ReservedMemoryEntry] = field(default_factory=list)
    memory_zones: List[MemoryZone] = field(default_factory=list)
    memory_nodes: List[MemoryNode] = field(default_factory=list)
    total_reserved_memory_kb: int = 0
    cma_pools: List[ReservedMemoryEntry] = field(default_factory=list)
    dma_pools: List[ReservedMemoryEntry] = field(default_factory=list)
    
    def to_dict(self) -> Dict:
        """Convert to dictionary for JSON serialization"""
        return {
            'reserved_memory': [self._entry_to_dict(entry) for entry in self.reserved_memory],
            'memory_zones': [zone.__dict__ for zone in self.memory_zones],
            'memory_nodes': [node.__dict__ for node in self.memory_nodes],
            'total_reserved_memory_kb': self.total_reserved_memory_kb,
            'cma_pools': [self._entry_to_dict(pool) for pool in self.cma_pools],
            'dma_pools': [self._entry_to_dict(pool) for pool in self.dma_pools],
            'summary': {
                'total_reserved_entries': len(self.reserved_memory),
                'total_zones': len(self.memory_zones),
                'total_nodes': len(self.memory_nodes),
                'total_cma_pools': len(self.cma_pools),
                'total_dma_pools': len(self.dma_pools)
            }
        }
    
    def _entry_to_dict(self, entry: ReservedMemoryEntry) -> Dict:
        """Convert a ReservedMemoryEntry to dictionary with nested components"""
        entry_dict = entry.__dict__.copy()
        # Convert components list to dictionaries
        entry_dict['components'] = [self._entry_to_dict(component) for component in entry.components]
        return entry_dict


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
    ioctl_operations: List[IOCTLOperation]
    statistics: ParseStatistics
    memory_info: Optional[MemoryInfo] = None
    device_info: Optional[DeviceInfo] = None
    # Newly added: extracted C struct/union definitions from preprocessed .i files
    struct_definitions: Optional[List[Dict]] = None

    def to_dict(self) -> Dict:
        """Convert to dictionary for JSON serialization"""
        function_entries = []
        for file_path, functions in self.functions_by_file.items():
            for func in functions:
                function_entries.append({
                    'function_name': func.function_name,
                    'file_path': file_path,
                    'line_number': func.line_number,
                    'first_seen_timestamp': func.first_seen_timestamp,
                    'first_seen_time_str': func.first_seen_time_str,
                    'entry_type': func.entry_type,
                    'function_code': func.function_code,
                    'preprocessed_code': func.preprocessed_code,
                    'call_count': func.call_count
                })

        functions_by_file_dict = {
            file_path: [
                {
                    'function_name': func.function_name,
                    'line_number': func.line_number,
                    'first_seen_timestamp': func.first_seen_timestamp,
                    'first_seen_time_str': func.first_seen_time_str,
                    'entry_type': func.entry_type,
                    'function_code': func.function_code,
                    'preprocessed_code': func.preprocessed_code,
                    'call_count': func.call_count
                }
                for func in functions
            ]
            for file_path, functions in self.functions_by_file.items()
        }

        dma_ops = [
            {
                'dma_function': dma.dma_function,
                'caller_function': dma.caller_function,
                'file_path': dma.file_path,
                'line_number': dma.line_number,
                'first_seen_timestamp': dma.first_seen_timestamp,
                'first_seen_time_str': dma.first_seen_time_str,
                'stack_trace': dma.stack_trace,
                'function_code': dma.function_code,
                'preprocessed_code': dma.preprocessed_code,
                'call_count': dma.call_count
            }
            for dma in self.dma_operations
        ]

        user_copy_ops = [
            {
                'copy_function': copy_op.copy_function,
                'caller_function': copy_op.caller_function,
                'file_path': copy_op.file_path,
                'line_number': copy_op.line_number,
                'first_seen_timestamp': copy_op.first_seen_timestamp,
                'first_seen_time_str': copy_op.first_seen_time_str,
                'function_code': copy_op.function_code,
                'preprocessed_code': copy_op.preprocessed_code,
                'call_count': copy_op.call_count,
                'process_info': {
                    'pid': copy_op.process_info.pid,
                    'comm': copy_op.process_info.comm
                } if copy_op.process_info else None
            }
            for copy_op in self.user_copy_operations
        ]

        ioctl_ops = [
            {
                'function_name': ioctl_op.function_name,
                'file_path': ioctl_op.file_path,
                'line_number': ioctl_op.line_number,
                'first_seen_timestamp': ioctl_op.first_seen_timestamp,
                'first_seen_time_str': ioctl_op.first_seen_time_str,
                'function_code': ioctl_op.function_code,
                'preprocessed_code': ioctl_op.preprocessed_code,
                'call_count': ioctl_op.call_count
            }
            for ioctl_op in self.ioctl_operations
        ]

        stats_dict = {
            'total_lines_processed': self.metadata.total_lines,
            'unique_function_entries': self.statistics.unique_function_entries,
            'unique_dma_operations': self.statistics.unique_dma_operations,
            'unique_user_copy_operations': self.statistics.unique_user_copy_operations,
            'unique_ioctl_operations': self.statistics.unique_ioctl_operations,
            'total_function_entries_found': self.statistics.total_function_entries_found,
            'total_dma_operations_found': self.statistics.total_dma_operations_found,
            'total_user_copy_operations_found': self.statistics.total_user_copy_operations_found,
            'total_ioctl_operations_found': self.statistics.total_ioctl_operations_found,
            'function_entries_found': self.statistics.total_function_entries_found,
            'dma_operations_found': self.statistics.total_dma_operations_found,
            'user_copy_operations_found': self.statistics.total_user_copy_operations_found,
            'ioctl_operations_found': self.statistics.total_ioctl_operations_found,
            'files_with_functions_entrypoint_instrumented': self.statistics.files_with_functions_entrypoint_instrumented,
            'total_files': self.statistics.total_files,
            'files_need_analysis': self.statistics.files_need_analysis,
            'files_instrumented_with_function_entries': self.statistics.files_instrumented_with_function_entries,
            'total_duplicates_skipped': self.statistics.total_duplicates_skipped
        }

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
            'functions_by_file': functions_by_file_dict,
            'dma_operations': dma_ops,
            'user_copy_operations': user_copy_ops,
            'ioctl_operations': ioctl_ops,
            'statistics': stats_dict,
            'memory_info': self.memory_info.to_dict() if self.memory_info else None,
            'device_info': self.device_info.to_dict() if self.device_info else None,
            'struct_definitions': self.struct_definitions if self.struct_definitions else []
        }
