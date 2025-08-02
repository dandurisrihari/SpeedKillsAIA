#!/usr/bin/env python3
"""
Test suite for utility modules
"""

import unittest
import sys
import os
import tempfile
from unittest.mock import patch, MagicMock
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from preprocess.utils.progress import ProgressUI
from preprocess.utils.deduplication import KernelLogDeduplicator
from preprocess.utils.file_tracker import FileTracker
from preprocess.core.models import FunctionEntry, DMAOperation, UserCopyOperation, ProcessInfo, ParseResults


class TestProgressUI(unittest.TestCase):
    """Test cases for ProgressUI"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.progress = ProgressUI()
    
    @patch('builtins.print')
    def test_print_message(self, mock_print):
        """Test progress message printing"""
        self.progress.print_message("Test message")
        mock_print.assert_called_with("Test message", end='\n', flush=True)
    
    @patch('builtins.print')
    def test_print_progress(self, mock_print):
        """Test progress bar printing"""
        self.progress.print_progress(50, 100, "Processing")
        mock_print.assert_called()
        
        # Test that it includes percentage
        call_args = str(mock_print.call_args)
        self.assertIn('50.0%', call_args)


class TestKernelLogDeduplicator(unittest.TestCase):
    """Test cases for KernelLogDeduplicator"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.deduplicator = KernelLogDeduplicator()
    
    def test_dma_operation_deduplication(self):
        """Test DMA operation deduplication tracker"""
        # Create duplicate DMA operations
        dma1 = DMAOperation(
            dma_function="dma_map_page",
            caller_function="test_caller",
            file_path="/test/file.c",
            line_number=200,
            first_seen_timestamp=156.0,
            stack_trace=[]
        )
        dma2 = DMAOperation(
            dma_function="dma_map_page",
            caller_function="test_caller",
            file_path="/test/file.c",
            line_number=200,
            first_seen_timestamp=157.0,
            stack_trace=[]
        )
        
        # Test deduplication
        self.assertFalse(self.deduplicator.dma_operations.is_duplicate(dma1))
        self.assertTrue(self.deduplicator.dma_operations.is_duplicate(dma2))
        self.assertEqual(self.deduplicator.dma_operations.duplicate_count, 1)
        self.assertEqual(self.deduplicator.dma_operations.unique_count, 1)
    
    def test_function_entry_deduplication(self):
        """Test function entry deduplication tracker"""
        # Create test data - function tracker expects (function_entry, file_path) tuples
        func1 = FunctionEntry(
            function_name="test_func",
            line_number=100,
            first_seen_timestamp=156.0
        )
        func2 = FunctionEntry(
            function_name="test_func",
            line_number=100,
            first_seen_timestamp=157.0
        )
        
        # Test deduplication with file path
        file_path = "/test/file.c"
        self.assertFalse(self.deduplicator.functions.is_duplicate((func1, file_path)))
        self.assertTrue(self.deduplicator.functions.is_duplicate((func2, file_path)))
        self.assertEqual(self.deduplicator.functions.duplicate_count, 1)
        self.assertEqual(self.deduplicator.functions.unique_count, 1)
    
    def test_user_copy_operation_deduplication(self):
        """Test user copy operation deduplication tracker"""
        # Create duplicate user copy operations
        copy1 = UserCopyOperation(
            copy_function="copy_from_user",
            caller_function="test_caller",
            file_path="/test/file.c",
            line_number=300,
            first_seen_timestamp=156.0,
            process_info=None
        )
        copy2 = UserCopyOperation(
            copy_function="copy_from_user",
            caller_function="test_caller",
            file_path="/test/file.c",
            line_number=300,
            first_seen_timestamp=157.0,
            process_info=None
        )
        
        # Test deduplication
        self.assertFalse(self.deduplicator.user_copy_operations.is_duplicate(copy1))
        self.assertTrue(self.deduplicator.user_copy_operations.is_duplicate(copy2))
        self.assertEqual(self.deduplicator.user_copy_operations.duplicate_count, 1)
        self.assertEqual(self.deduplicator.user_copy_operations.unique_count, 1)
    
    def test_total_duplicates(self):
        """Test total duplicate count across all categories"""
        # Add some duplicates to each category
        dma = DMAOperation("dma_map", "caller", "/file.c", 100, 156.0, [])
        func = FunctionEntry("test_func", 100, 156.0)
        copy = UserCopyOperation("copy_from_user", "caller", "/file.c", 200, 156.0)
        
        # Add originals (not duplicates)
        self.deduplicator.dma_operations.is_duplicate(dma)
        self.deduplicator.functions.is_duplicate((func, "/file.c"))
        self.deduplicator.user_copy_operations.is_duplicate(copy)
        
        # Add duplicates
        self.deduplicator.dma_operations.is_duplicate(dma)
        self.deduplicator.functions.is_duplicate((func, "/file.c"))
        self.deduplicator.user_copy_operations.is_duplicate(copy)
        
        self.assertEqual(self.deduplicator.total_duplicates, 3)
    
    def test_reset_all(self):
        """Test resetting all trackers"""
        # Add some data
        dma = DMAOperation("dma_map", "caller", "/file.c", 100, 156.0, [])
        self.deduplicator.dma_operations.is_duplicate(dma)
        self.deduplicator.dma_operations.is_duplicate(dma)  # duplicate
        
        # Reset
        self.deduplicator.reset_all()
        
        # Should be reset
        self.assertEqual(self.deduplicator.total_duplicates, 0)
        self.assertEqual(self.deduplicator.dma_operations.unique_count, 0)


class TestFileTracker(unittest.TestCase):
    """Test cases for FileTracker"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.tracker = FileTracker()
    
    def test_add_file(self):
        """Test file tracking"""
        self.tracker.add_file("/test/file1.c")
        self.tracker.add_file("/test/file2.c", has_function_entry=True)
        
        self.assertEqual(len(self.tracker.all_files_encountered), 2)
        self.assertEqual(len(self.tracker.files_with_instrumentations), 1)
        self.assertIn("/test/file1.c", self.tracker.all_files_encountered)
        self.assertIn("/test/file2.c", self.tracker.files_with_instrumentations)
    
    def test_duplicate_tracking(self):
        """Test that duplicate file paths are not double-counted"""
        # Track same file multiple times
        self.tracker.add_file("/test/file1.c")
        self.tracker.add_file("/test/file1.c")
        
        self.tracker.add_file("/test/file1.c", has_function_entry=True)
        self.tracker.add_file("/test/file1.c", has_function_entry=True)
        
        # Should only count once
        self.assertEqual(len(self.tracker.all_files_encountered), 1)
        self.assertEqual(len(self.tracker.files_with_instrumentations), 1)
    
    def test_get_statistics(self):
        """Test statistics generation"""
        # Track some files
        self.tracker.add_file("/test/file1.c")
        self.tracker.add_file("/test/file2.c", has_function_entry=True)
        
        functions_by_file = {"/test/file2.c": ["func1"]}
        stats = self.tracker.get_statistics(functions_by_file)
        
        self.assertEqual(stats['total_files_analyzed'], 2)
        self.assertEqual(stats['files_instrumented_with_function_entries'], 1)
        self.assertEqual(stats['files_with_functions'], 1)
    
    def test_reset(self):
        """Test tracker reset"""
        # Add some data
        self.tracker.add_file("/test/file1.c", has_function_entry=True)
        
        # Reset
        self.tracker.reset()
        
        # Should be empty
        self.assertEqual(len(self.tracker.all_files_encountered), 0)
        self.assertEqual(len(self.tracker.files_with_instrumentations), 0)


if __name__ == '__main__':
    unittest.main(verbosity=2)
