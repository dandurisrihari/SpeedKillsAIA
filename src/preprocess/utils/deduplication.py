#!/usr/bin/env python3
"""
Deduplication utilities for kernel log parsing
"""

from typing import Set, Tuple, TypeVar, Generic, Callable, Any, Dict

T = TypeVar('T')


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
        """Manually add a key to the seen set"""
        self._seen_keys.add(key)
        if key not in self._call_counts:
            self._call_counts[key] = 1
    
    @property
    def duplicate_count(self) -> int:
        """Get number of duplicates encountered"""
        return self._duplicate_count
    
    @property
    def unique_count(self) -> int:
        """Get number of unique items seen"""
        return len(self._seen_keys)
    
    def reset(self):
        """Reset the tracker"""
        self._seen_keys.clear()
        self._duplicate_count = 0
        self._call_counts.clear()


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
