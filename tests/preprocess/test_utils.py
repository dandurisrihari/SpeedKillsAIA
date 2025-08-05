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

from src.preprocess.utils.progress import ProgressUI
from src.preprocess.utils.deduplication import KernelLogDeduplicator
from src.preprocess.utils.file_tracker import FileTracker
from src.preprocess.utils.function_extractor import FunctionCodeExtractor
from src.preprocess.core.models import FunctionEntry, DMAOperation, UserCopyOperation, IOCTLOperation, ProcessInfo, ParseResults, ParseMetadata, ParseStatistics


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
            first_seen_time_str="2023-01-01 12:00:00",
            stack_trace=[]
        )
        dma2 = DMAOperation(
            dma_function="dma_map_page",
            caller_function="test_caller",
            file_path="/test/file.c",
            line_number=200,
            first_seen_timestamp=157.0,
            first_seen_time_str="2023-01-01 12:00:01",
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
            first_seen_timestamp=156.0,
            first_seen_time_str="2023-01-01 12:00:00"
        )
        func2 = FunctionEntry(
            function_name="test_func",
            line_number=100,
            first_seen_timestamp=157.0,
            first_seen_time_str="2023-01-01 12:00:01"
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
            first_seen_time_str="2023-01-01 12:00:00",
            process_info=None
        )
        copy2 = UserCopyOperation(
            copy_function="copy_from_user",
            caller_function="test_caller",
            file_path="/test/file.c",
            line_number=300,
            first_seen_timestamp=157.0,
            first_seen_time_str="2023-01-01 12:00:01",
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
        dma = DMAOperation("dma_map", "caller", "/file.c", 100, 156.0, "2023-01-01 12:00:00", [])
        func = FunctionEntry("test_func", 100, 156.0, "2023-01-01 12:00:00")
        copy = UserCopyOperation("copy_from_user", "caller", "/file.c", 200, 156.0, "2023-01-01 12:00:00")
        
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


class TestFunctionCodeExtractor(unittest.TestCase):
    """Test cases for FunctionCodeExtractor"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.extractor = FunctionCodeExtractor()
    
    def test_extract_function_simple(self):
        """Test extracting a simple function"""
        # Create a temporary C file with a simple function
        with tempfile.NamedTemporaryFile(mode='w', suffix='.c', delete=False) as f:
            f.write("""
#include <stdio.h>

int simple_function(int x) {
    return x * 2;
}

int another_function(void) {
    return 42;
}
""")
            temp_file = f.name
        
        try:
            # Extract function at line 4 (simple_function)
            result = self.extractor.extract_function_at_line(temp_file, 4)
            
            self.assertIsNotNone(result)
            function_name, function_code, start_line, end_line = result
            self.assertEqual(function_name, "simple_function")
            self.assertIn("return x * 2", function_code)
            self.assertNotIn("another_function", function_code)
        finally:
            os.unlink(temp_file)
    
    def test_extract_function_with_source_root(self):
        """Test extracting function with source root path resolution"""
        # Create temporary directory structure
        with tempfile.TemporaryDirectory() as temp_dir:
            drivers_dir = os.path.join(temp_dir, "drivers", "test")
            os.makedirs(drivers_dir)
            
            test_file = os.path.join(drivers_dir, "test_driver.c")
            with open(test_file, 'w') as f:
                f.write("""
int driver_ioctl(unsigned int cmd, unsigned long arg) {
    if (cmd == 0) {
        return -1;
    }
    return 0;
}
""")
            
            # Create extractor with source root
            extractor = FunctionCodeExtractor(source_root_path=temp_dir)
            
            # Test with relative path
            relative_path = "drivers/test/test_driver.c"
            result = extractor.extract_function_at_line(relative_path, 2)
            
            self.assertIsNotNone(result)
            function_name, function_code, start_line, end_line = result
            self.assertEqual(function_name, "driver_ioctl")
            self.assertIn("return -1", function_code)
    
    def test_extract_function_file_not_found(self):
        """Test behavior when file is not found"""
        result = self.extractor.extract_function_at_line("/nonexistent/file.c", 10)
        self.assertIsNone(result)
    
    def test_extract_function_line_outside_function(self):
        """Test behavior when line is not inside a function"""
        # Create a temporary C file
        with tempfile.NamedTemporaryFile(mode='w', suffix='.c', delete=False) as f:
            f.write("""
#include <stdio.h>

// This is a comment
#define MACRO_VALUE 42

int function_after_line_10(void) {
    return 1;
}
""")
            temp_file = f.name
        
        try:
            # Try to extract function at line 4 (comment line)
            result = self.extractor.extract_function_at_line(temp_file, 4)
            self.assertIsNone(result)
        finally:
            os.unlink(temp_file)
    
    @patch('preprocess.utils.function_extractor.ts.Parser.parse')
    def test_extract_function_tree_sitter_error(self, mock_parse):
        """Test behavior when tree-sitter fails"""
        # Mock tree-sitter parse to raise an exception
        mock_parse.side_effect = Exception("Tree-sitter error")
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.c', delete=False) as f:
            f.write("int test() { return 0; }")
            temp_file = f.name
        
        try:
            result = self.extractor.extract_function_at_line(temp_file, 1)
            self.assertIsNone(result)
        finally:
            os.unlink(temp_file)


class TestKernelLogDeduplicatorWithIOCTL(unittest.TestCase):
    """Test cases for KernelLogDeduplicator with IOCTL operations"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.deduplicator = KernelLogDeduplicator()
    
    def test_ioctl_operation_deduplication(self):
        """Test IOCTL operation deduplication"""
        # Create duplicate IOCTL operations
        ioctl1 = IOCTLOperation("drv_ioctl", "driver.c", 100, 10.0, "code1")
        ioctl2 = IOCTLOperation("drv_ioctl", "driver.c", 100, 20.0, "code2")  # Later timestamp
        ioctl3 = IOCTLOperation("other_ioctl", "driver.c", 200, 15.0, "code3")  # Different function
        
        # Test deduplication directly
        self.assertFalse(self.deduplicator.ioctl_operations.is_duplicate(ioctl1))
        self.assertTrue(self.deduplicator.ioctl_operations.is_duplicate(ioctl2))  # Should be duplicate
        self.assertFalse(self.deduplicator.ioctl_operations.is_duplicate(ioctl3))  # Different function
        
        # Check duplicate count
        self.assertEqual(self.deduplicator.ioctl_operations.duplicate_count, 1)
        self.assertEqual(self.deduplicator.ioctl_operations.unique_count, 2)


if __name__ == '__main__':
    unittest.main(verbosity=2)
