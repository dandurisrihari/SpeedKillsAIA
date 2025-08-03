#!/usr/bin/env python3
"""
Fixed tests for utils with correct constructor signatures
"""

import unittest
import sys
from pathlib import Path

# Add the src directory to Python path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))

from src.preprocess.core.models import (
    FunctionEntry, DMAOperation, UserCopyOperation, ProcessInfo
)
from src.preprocess.utils.deduplication import KernelLogDeduplicator


class TestKernelLogDeduplicator(unittest.TestCase):
    """Test deduplication functionality with correct constructors"""
    
    def setUp(self):
        """Set up test environment"""
        self.deduplicator = KernelLogDeduplicator()
    
    def test_function_entry_deduplication(self):
        """Test function entry deduplication"""
        func1 = FunctionEntry(
            function_name="test_func",
            line_number=100,
            first_seen_timestamp=156.0,
            first_seen_time_str="2023-01-01 12:00:00"
        )
        func2 = FunctionEntry(
            function_name="test_func",
            line_number=100,
            first_seen_timestamp=157.0,  # Different timestamp
            first_seen_time_str="2023-01-01 12:00:01"
        )
        
        file_path = "/test/file.c"
        
        # First entry should not be duplicate
        self.assertFalse(self.deduplicator.functions.is_duplicate((func1, file_path)))
        
        # Second entry with same function name and line should be duplicate
        self.assertTrue(self.deduplicator.functions.is_duplicate((func2, file_path)))
    
    def test_dma_operation_deduplication(self):
        """Test DMA operation deduplication"""
        dma1 = DMAOperation(
            dma_function="dma_map_page",
            caller_function="test_driver",
            file_path="/test/driver.c",
            line_number=200,
            first_seen_timestamp=300.0,
            first_seen_time_str="2023-01-01 12:01:00"
        )
        dma2 = DMAOperation(
            dma_function="dma_map_page",
            caller_function="test_driver",
            file_path="/test/driver.c",
            line_number=200,
            first_seen_timestamp=301.0,  # Different timestamp
            first_seen_time_str="2023-01-01 12:01:01"
        )
        
        # First DMA operation should not be duplicate
        self.assertFalse(self.deduplicator.dma_operations.is_duplicate(dma1))
        
        # Second operation with same details should be duplicate
        self.assertTrue(self.deduplicator.dma_operations.is_duplicate(dma2))
    
    def test_user_copy_operation_deduplication(self):
        """Test user copy operation deduplication"""
        copy1 = UserCopyOperation(
            copy_function="copy_from_user",
            caller_function="device_write",
            file_path="/test/device.c",
            line_number=150,
            first_seen_timestamp=400.0,
            first_seen_time_str="2023-01-01 12:02:00"
        )
        copy2 = UserCopyOperation(
            copy_function="copy_from_user",
            caller_function="device_write",
            file_path="/test/device.c",
            line_number=150,
            first_seen_timestamp=401.0,  # Different timestamp
            first_seen_time_str="2023-01-01 12:02:01"
        )
        
        # First copy operation should not be duplicate
        self.assertFalse(self.deduplicator.user_copy_operations.is_duplicate(copy1))
        
        # Second operation with same details should be duplicate
        self.assertTrue(self.deduplicator.user_copy_operations.is_duplicate(copy2))
    
    def test_total_duplicates(self):
        """Test total duplicate counting"""
        func = FunctionEntry(
            function_name="test_func",
            line_number=100,
            first_seen_timestamp=156.0,
            first_seen_time_str="2023-01-01 12:00:00"
        )
        
        file_path = "/test/file.c"
        
        # Check initial state
        self.assertEqual(self.deduplicator.total_duplicates, 0)
        
        # Add first entry (not a duplicate)
        self.assertFalse(self.deduplicator.functions.is_duplicate((func, file_path)))
        
        # Add same entry again (should be duplicate)
        self.assertTrue(self.deduplicator.functions.is_duplicate((func, file_path)))
        
        # Total duplicates should increase
        self.assertGreater(self.deduplicator.total_duplicates, 0)
    
    def test_reset_all(self):
        """Test resetting all deduplication state"""
        # Add some entries first
        func = FunctionEntry(
            function_name="test_func",
            line_number=100,
            first_seen_timestamp=156.0,
            first_seen_time_str="2023-01-01 12:00:00"
        )
        
        self.deduplicator.functions.is_duplicate((func, "/test/file.c"))
        
        # Reset all
        self.deduplicator.reset_all()
        
        # Should be back to initial state
        self.assertEqual(self.deduplicator.total_duplicates, 0)


if __name__ == '__main__':
    unittest.main()
