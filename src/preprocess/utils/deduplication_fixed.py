#!/usr/bin/env python3
"""
Deduplication utilities for kernel log parsing
"""

from typing import Set, Tuple, TypeVar, Generic, Callable, Any, Dict, Optional
from dataclasses import dataclass

T = TypeVar('T')


@dataclass
class DeduplicatedEntry:
    """Represents a deduplicated entry with its key and call count"""
    key: tuple
    count: int = 1
    first_data: dict = None
    
    def __post_init__(self):
        if self.first_data is None:
            self.first_data = {}
    
    @property
    def call_count(self) -> int:
        """Alias for count to match test expectations"""
        return self.count


class DeduplicationTracker(Generic[T]):
    """Generic deduplication tracker with call count support"""
    
    def __init__(self, key_extractor: Callable[[T], Tuple]):
        """
        Initialize deduplication tracker
        
        Args:
            key_extractor: Function that extracts a unique key tuple from an item
        """
        self._seen_keys: Set[Tuple] = set()
        self._key_extractor = key_extractor
        self._duplicate_count = 0
        self._call_counts: Dict[Tuple, int] = {}  # Track call counts for each unique key
    
    def is_duplicate(self, item: T) -> bool:
        """Check if item is a duplicate and update call count"""
        key = self._key_extractor(item)
        
        if key in self._seen_keys:
            self._duplicate_count += 1
            self._call_counts[key] += 1
            return True
        
        self._seen_keys.add(key)
        self._call_counts[key] = 1
        return False
    
    def get_call_count(self, item: T) -> int:
        """Get call count for a specific item"""
        key = self._key_extractor(item)
        return self._call_counts.get(key, 0)
    
    def add_key(self, key: Tuple):
        """Manually add a key to the seen set and increment call count"""
        if key in self._seen_keys:
            self._duplicate_count += 1
            self._call_counts[key] += 1
        else:
            self._seen_keys.add(key)
            self._call_counts[key] = 1
    
    def reset(self):
        """Reset the tracker"""
        self._seen_keys.clear()
        self._call_counts.clear()
        self._duplicate_count = 0
    
    @property
    def duplicate_count(self) -> int:
        """Get the number of duplicates found"""
        return self._duplicate_count
    
    @property
    def unique_count(self) -> int:
        """Get number of unique items seen"""
        return len(self._seen_keys)


class KernelLogDeduplicator:
    """Specialized deduplication for kernel log entries"""
    
    def __init__(self):
        # Function entries: (file_path, function_name, line_number)
        self.functions = DeduplicationTracker(
            lambda item: (item[1], item[0].function_name, item[0].line_number)
        )
        
        # DMA operations: (dma_function, caller_function, file_path, line_number)
        self.dma_operations = DeduplicationTracker(
            lambda item: (item.dma_function, item.caller_function, item.file_path, item.line_number)
        )
        
        # User copy operations: (copy_function, caller_function, file_path, line_number)
        self.user_copy_operations = DeduplicationTracker(
            lambda item: (item.copy_function, item.caller_function, item.file_path, item.line_number)
        )
        
        # IOCTL operations: (function_name, file_path, line_number)
        self.ioctl_operations = DeduplicationTracker(
            lambda item: (item.function_name, item.file_path, item.line_number)
        )
    
    @property
    def total_duplicates(self) -> int:
        """Get total number of duplicates across all categories"""
        return (self.functions.duplicate_count + 
                self.dma_operations.duplicate_count + 
                self.user_copy_operations.duplicate_count +
                self.ioctl_operations.duplicate_count)
    
    def reset_all(self):
        """Reset all deduplication trackers"""
        self.functions.reset()
        self.dma_operations.reset()
        self.user_copy_operations.reset()
        self.ioctl_operations.reset()
    
    def add_entry(self, entry_type: str, entry: Any) -> tuple:
        """
        Add an entry and return its key
        
        Args:
            entry_type: Type of entry ('function', 'dma', 'user_copy', 'ioctl')
            entry: The entry object to add
            
        Returns:
            The key tuple for the entry
        """
        if entry_type == "function":
            # For function entries, we need to handle the tuple format
            if isinstance(entry, tuple) and len(entry) == 2:
                key = (entry[1], entry[0].function_name, entry[0].line_number)
            elif isinstance(entry, dict):
                key = (entry['file_path'], entry['function_name'], entry['line_number'])
            else:
                key = (entry.file_path, entry.function_name, entry.line_number)
            self.functions.add_key(key)
            return key
        elif entry_type == "dma":
            if isinstance(entry, dict):
                key = (entry.get('dma_function', ''), entry.get('caller_function', ''), 
                      entry.get('file_path', ''), entry.get('line_number', 0))
            else:
                key = (entry.dma_function, entry.caller_function, entry.file_path, entry.line_number)
            self.dma_operations.add_key(key)
            return key
        elif entry_type == "user_copy":
            if isinstance(entry, dict):
                key = (entry.get('copy_function', ''), entry.get('caller_function', ''), 
                      entry.get('file_path', ''), entry.get('line_number', 0))
            else:
                key = (entry.copy_function, entry.caller_function, entry.file_path, entry.line_number)
            self.user_copy_operations.add_key(key)
            return key
        elif entry_type == "ioctl":
            if isinstance(entry, dict):
                key = (entry.get('function_name', ''), entry.get('file_path', ''), 
                      entry.get('line_number', 0))
            else:
                key = (entry.function_name, entry.file_path, entry.line_number)
            self.ioctl_operations.add_key(key)
            return key
        else:
            raise ValueError(f"Unknown entry type: {entry_type}")
    
    def get_all_entries(self) -> list:
        """Get all unique entries as a list"""
        all_keys = []
        all_keys.extend(self.functions._seen_keys)
        all_keys.extend(self.dma_operations._seen_keys)
        all_keys.extend(self.user_copy_operations._seen_keys)
        all_keys.extend(self.ioctl_operations._seen_keys)
        return all_keys
    
    def get_entry(self, key: tuple) -> Optional[DeduplicatedEntry]:
        """Get a deduplicated entry by its key"""
        # Check in all trackers for the key and return the entry if found
        for tracker in [self.functions, self.dma_operations, self.user_copy_operations, self.ioctl_operations]:
            if key in tracker._seen_keys:
                count = tracker._call_counts.get(key, 0)
                return DeduplicatedEntry(key, count)
        return None
    
    def clear_entries(self):
        """Clear all entries (alias for reset_all)"""
        self.reset_all()


class DeduplicationManager:
    """Manager for all deduplication operations"""
    
    def __init__(self):
        self._deduplicator = KernelLogDeduplicator()
    
    def add_entry(self, entry_type: str, entry: Any) -> tuple:
        """Add entry for deduplication"""
        return self._deduplicator.add_entry(entry_type, entry)
    
    def get_entry(self, key: tuple) -> Optional[DeduplicatedEntry]:
        """Get entry by key"""
        return self._deduplicator.get_entry(key)
    
    def get_all_entries(self) -> list:
        """Get all entries"""
        return self._deduplicator.get_all_entries()
    
    def clear_entries(self):
        """Clear all entries"""
        self._deduplicator.clear_entries()
    
    def __getattr__(self, name):
        """Delegate all attribute access to the internal deduplicator"""
        return getattr(self._deduplicator, name)
