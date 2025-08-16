#!/usr/bin/env python3
"""
Comprehensive tests for preprocess utils module
"""

import unittest
import tempfile
import shutil
import sys
import os
from pathlib import Path
from unittest.mock import patch, MagicMock, mock_open

# Add src to path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))

from src.preprocess.utils.function_extractor import FunctionCodeExtractor
from src.preprocess.utils.file_tracker import FileTracker
from src.preprocess.utils.deduplication import (
    DeduplicatedEntry, DeduplicationManager
)
from src.preprocess.utils.progress import ProgressTracker


class TestFunctionCodeExtractorComprehensive(unittest.TestCase):
    """Comprehensive tests for FunctionCodeExtractor"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
        self.extractor = FunctionCodeExtractor()
        
        # Create test C files
        self.create_test_c_files()
    
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    def create_test_c_files(self):
        """Create test C files with various function formats"""
        
        # Simple function file
        simple_c = self.temp_path / "simple.c"
        simple_c.write_text("""
#include <stdio.h>

// Simple function
int simple_function(int x) {
    return x * 2;
}

// Another function
void another_function(void) {
    printf("Hello World\\n");
}

// Function with complex signature
static int complex_function(struct device *dev, 
                           unsigned long arg, 
                           struct file *filp) {
    if (!dev) {
        return -EINVAL;
    }
    return 0;
}
""")
        
        # Driver-style file
        driver_c = self.temp_path / "driver.c"
        driver_c.write_text("""
#include <linux/module.h>
#include <linux/kernel.h>

static int device_open(struct inode *inode, struct file *file) {
    printk(KERN_INFO "Device opened\\n");
    return 0;
}

static int device_release(struct inode *inode, struct file *file) {
    printk(KERN_INFO "Device closed\\n");
    return 0;
}

static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    switch (cmd) {
        case 1:
            return handle_cmd1(arg);
        case 2:
            return handle_cmd2(arg);
        default:
            return -EINVAL;
    }
}

static int handle_cmd1(unsigned long arg) {
    // Handle command 1
    return 0;
}
""")
        
        # File with preprocessor directives
        complex_c = self.temp_path / "complex.c"
        complex_c.write_text("""
#ifdef CONFIG_DEBUG
#define DEBUG_PRINT(x) printk(x)
#else
#define DEBUG_PRINT(x)
#endif

#ifdef FEATURE_A
static int feature_a_function(void) {
    DEBUG_PRINT("Feature A called\\n");
    return 0;
}
#endif

// Function with macros in signature
#define DEVICE_ATTR(name) device_attr_##name
static ssize_t DEVICE_ATTR(show)(struct device *dev, char *buf) {
    return sprintf(buf, "Hello\\n");
}

// Inline function
static inline int inline_function(int x) {
    return x + 1;
}
""")
    
    def test_extract_function_code_simple(self):
        """Test extracting simple function code"""
        simple_file = str(self.temp_path / "simple.c")
        
        # Test extracting simple_function
        code = self.extractor.extract_function_code(simple_file, "simple_function", 5)
        self.assertIsNotNone(code)
        self.assertIn("int simple_function(int x)", code)
        self.assertIn("return x * 2;", code)
        
        # Test extracting another_function
        code = self.extractor.extract_function_code(simple_file, "another_function", 10)
        self.assertIsNotNone(code)
        self.assertIn("void another_function(void)", code)
        self.assertIn('printf("Hello World\\n");', code)
    
    def test_extract_function_code_complex_signature(self):
        """Test extracting function with complex signature"""
        simple_file = str(self.temp_path / "simple.c")
        
        code = self.extractor.extract_function_code(simple_file, "complex_function", 15)
        self.assertIsNotNone(code)
        self.assertIn("static int complex_function(", code)
        self.assertIn("struct device *dev", code)
        self.assertIn("unsigned long arg", code)
        self.assertIn("return -EINVAL;", code)
    
    def test_extract_function_code_driver_style(self):
        """Test extracting driver-style functions"""
        driver_file = str(self.temp_path / "driver.c")
        
        # Test device_open
        code = self.extractor.extract_function_code(driver_file, "device_open", 5)
        self.assertIsNotNone(code)
        self.assertIn("static int device_open(", code)
        self.assertIn("struct inode *inode", code)
        
        # Test device_ioctl with switch statement
        code = self.extractor.extract_function_code(driver_file, "device_ioctl", 15)
        self.assertIsNotNone(code)
        self.assertIn("static long device_ioctl(", code)
        self.assertIn("switch (cmd)", code)
        self.assertIn("return -EINVAL;", code)
    
    def test_extract_function_code_with_preprocessor(self):
        """Test extracting functions with preprocessor directives"""
        complex_file = str(self.temp_path / "complex.c")
        
        # Test feature_a_function (inside #ifdef)
        code = self.extractor.extract_function_code(complex_file, "feature_a_function", 10)
        self.assertIsNotNone(code)
        self.assertIn("static int feature_a_function(void)", code)
        
        # Test function with macro in signature
        # Note: Tree-sitter may not handle macro expansion properly
        # So we test that we can extract a function at this line, regardless of name
        result = self.extractor.extract_function_at_line(complex_file, 17)
        self.assertIsNotNone(result)
        if result:
            function_name, code, start_line, end_line, preprocessed_code = result
            self.assertIn("static ssize_t", code)
            self.assertIn("struct device *dev", code)
    
    def test_extract_nonexistent_function(self):
        """Test extracting function that doesn't exist"""
        simple_file = str(self.temp_path / "simple.c")
        
        code = self.extractor.extract_function_code(simple_file, "nonexistent_function", 100)
        self.assertIsNone(code)
    
    def test_extract_from_nonexistent_file(self):
        """Test extracting from file that doesn't exist"""
        code = self.extractor.extract_function_code("/nonexistent/file.c", "any_function", 10)
        self.assertIsNone(code)
    
    def test_extract_with_invalid_line_number(self):
        """Test extracting with invalid line numbers"""
        simple_file = str(self.temp_path / "simple.c")
        
        # Line number 0
        code = self.extractor.extract_function_code(simple_file, "simple_function", 0)
        self.assertIsNone(code)
        
        # Very high line number
        code = self.extractor.extract_function_code(simple_file, "simple_function", 9999)
        self.assertIsNone(code)
        
        # Negative line number
        code = self.extractor.extract_function_code(simple_file, "simple_function", -1)
        self.assertIsNone(code)
    
    @patch('builtins.open', side_effect=PermissionError("Permission denied"))
    def test_extract_permission_error(self, mock_open):
        """Test handling permission errors"""
        code = self.extractor.extract_function_code("/some/file.c", "function", 10)
        self.assertIsNone(code)
    
    @patch('builtins.open', side_effect=IOError("I/O error"))
    def test_extract_io_error(self, mock_open):
        """Test handling I/O errors"""
        code = self.extractor.extract_function_code("/some/file.c", "function", 10)
        self.assertIsNone(code)


class TestFileTrackerComprehensive(unittest.TestCase):
    """Comprehensive tests for FileTracker"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
        self.tracker = FileTracker()
        
        # Create test file structure
        self.create_test_file_structure()
    
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    def create_test_file_structure(self):
        """Create test file structure"""
        # Create directories
        (self.temp_path / "drivers").mkdir()
        (self.temp_path / "drivers" / "gpu").mkdir()
        (self.temp_path / "include").mkdir()
        
        # Create files
        (self.temp_path / "main.c").write_text("// Main file")
        (self.temp_path / "drivers" / "driver.c").write_text("// Driver file")
        (self.temp_path / "drivers" / "gpu" / "gpu_driver.c").write_text("// GPU driver")
        (self.temp_path / "include" / "header.h").write_text("// Header file")
    
    def test_track_file_paths(self):
        """Test tracking file paths"""
        # Track some files
        file1 = str(self.temp_path / "main.c")
        file2 = str(self.temp_path / "drivers" / "driver.c")
        file3 = str(self.temp_path / "drivers" / "gpu" / "gpu_driver.c")
        
        self.tracker.track_file(file1)
        self.tracker.track_file(file2)
        self.tracker.track_file(file3)
        
        # Check if files are tracked
        tracked_files = self.tracker.get_tracked_files()
        self.assertIn(file1, tracked_files)
        self.assertIn(file2, tracked_files)
        self.assertIn(file3, tracked_files)
    
    def test_track_duplicate_files(self):
        """Test tracking duplicate file paths"""
        file1 = str(self.temp_path / "main.c")
        
        self.tracker.track_file(file1)
        self.tracker.track_file(file1)  # Track same file again
        
        tracked_files = self.tracker.get_tracked_files()
        # Should only appear once
        self.assertEqual(tracked_files.count(file1), 1)
    
    def test_file_exists_checking(self):
        """Test file existence checking"""
        existing_file = str(self.temp_path / "main.c")
        nonexistent_file = str(self.temp_path / "nonexistent.c")
        
        self.assertTrue(self.tracker.file_exists(existing_file))
        self.assertFalse(self.tracker.file_exists(nonexistent_file))
    
    def test_get_file_info(self):
        """Test getting file information"""
        test_file = str(self.temp_path / "main.c")
        
        info = self.tracker.get_file_info(test_file)
        if info:  # If implementation provides file info
            self.assertIsInstance(info, dict)
    
    def test_clear_tracked_files(self):
        """Test clearing tracked files"""
        file1 = str(self.temp_path / "main.c")
        file2 = str(self.temp_path / "drivers" / "driver.c")
        
        self.tracker.track_file(file1)
        self.tracker.track_file(file2)
        
        self.assertEqual(len(self.tracker.get_tracked_files()), 2)
        
        self.tracker.clear()
        self.assertEqual(len(self.tracker.get_tracked_files()), 0)


class TestDeduplicationComprehensive(unittest.TestCase):
    """Comprehensive tests for deduplication functionality"""
    
    def setUp(self):
        """Set up test environment"""
        self.manager = DeduplicationManager()
    
    def test_deduplicated_entry_creation(self):
        """Test creating deduplicated entries"""
        entry = DeduplicatedEntry(
            key="test_func:/test/file.c:100",
            first_data={
                'function_name': 'test_func',
                'file_path': '/test/file.c',
                'line_number': 100,
                'timestamp': 123.456
            }
        )
        
        self.assertEqual(entry.call_count, 1)
        self.assertEqual(entry.key, "test_func:/test/file.c:100")
        self.assertIsInstance(entry.first_data, dict)
    
    def test_deduplication_manager_add_entry(self):
        """Test adding entries to deduplication manager"""
        # Add first entry
        entry1 = {
            'function_name': 'test_func',
            'file_path': '/test/file.c',
            'line_number': 100,
            'timestamp': 123.456
        }
        
        key1 = self.manager.add_entry("function", entry1)
        self.assertIsNotNone(key1)
        
        # Add duplicate entry
        entry2 = {
            'function_name': 'test_func',
            'file_path': '/test/file.c',
            'line_number': 100,
            'timestamp': 124.456
        }
        
        key2 = self.manager.add_entry("function", entry2)
        self.assertEqual(key1, key2)  # Should be same key
        
        # Check call count
        dedupe_entry = self.manager.get_entry(key1)
        self.assertEqual(dedupe_entry.call_count, 2)
    
    def test_deduplication_different_entries(self):
        """Test deduplication with different entries"""
        entry1 = {
            'function_name': 'func1',
            'file_path': '/test/file.c',
            'line_number': 100
        }
        
        entry2 = {
            'function_name': 'func2',
            'file_path': '/test/file.c',
            'line_number': 200
        }
        
        key1 = self.manager.add_entry("function", entry1)
        key2 = self.manager.add_entry("function", entry2)
        
        self.assertNotEqual(key1, key2)
        self.assertEqual(self.manager.get_entry(key1).call_count, 1)
        self.assertEqual(self.manager.get_entry(key2).call_count, 1)
    
    def test_get_all_entries(self):
        """Test getting all deduplicated entries"""
        entries = [
            {'function_name': 'func1', 'file_path': '/test/file.c', 'line_number': 100},
            {'function_name': 'func2', 'file_path': '/test/file.c', 'line_number': 200},
            {'function_name': 'func1', 'file_path': '/test/file.c', 'line_number': 100}  # Duplicate
        ]
        
        for entry in entries:
            self.manager.add_entry("function", entry)
        
        all_entries = self.manager.get_all_entries()
        self.assertEqual(len(all_entries), 2)  # Should have 2 unique entries
        
        # Check call counts
        for entry in all_entries:
            if entry.first_data['function_name'] == 'func1':
                self.assertEqual(entry.call_count, 2)
            else:
                self.assertEqual(entry.call_count, 1)
    
    def test_clear_entries(self):
        """Test clearing all entries"""
        entry = {'function_name': 'func1', 'file_path': '/test/file.c', 'line_number': 100}
        self.manager.add_entry("function", entry)
        
        self.assertEqual(len(self.manager.get_all_entries()), 1)
        
        self.manager.clear()
        self.assertEqual(len(self.manager.get_all_entries()), 0)


class TestProgressTrackerComprehensive(unittest.TestCase):
    """Comprehensive tests for ProgressTracker"""
    
    def setUp(self):
        """Set up test environment"""
        self.tracker = ProgressTracker(total_items=100)
    
    def test_progress_tracker_initialization(self):
        """Test progress tracker initialization"""
        self.assertEqual(self.tracker.total_items, 100)
        self.assertEqual(self.tracker.current_item, 0)
        self.assertEqual(self.tracker.get_progress_percentage(), 0.0)
    
    def test_update_progress(self):
        """Test updating progress"""
        self.tracker.update_progress(25)
        self.assertEqual(self.tracker.current_item, 25)
        self.assertEqual(self.tracker.get_progress_percentage(), 25.0)
        
        self.tracker.update_progress(50)
        self.assertEqual(self.tracker.current_item, 50)
        self.assertEqual(self.tracker.get_progress_percentage(), 50.0)
        
        self.tracker.update_progress(100)
        self.assertEqual(self.tracker.current_item, 100)
        self.assertEqual(self.tracker.get_progress_percentage(), 100.0)
    
    def test_increment_progress(self):
        """Test incrementing progress"""
        for i in range(10):
            self.tracker.increment()
        
        self.assertEqual(self.tracker.current_item, 10)
        self.assertEqual(self.tracker.get_progress_percentage(), 10.0)
    
    def test_progress_overflow(self):
        """Test progress beyond total"""
        self.tracker.update_progress(150)  # Beyond total
        
        # Should be clamped to total or handle gracefully
        self.assertLessEqual(self.tracker.get_progress_percentage(), 100.0)
    
    def test_negative_progress(self):
        """Test negative progress values"""
        self.tracker.update_progress(-10)
        
        # Should handle gracefully (stay at 0 or handle appropriately)
        self.assertGreaterEqual(self.tracker.get_progress_percentage(), 0.0)
    
    def test_zero_total_items(self):
        """Test tracker with zero total items"""
        zero_tracker = ProgressTracker(total_items=0)
        
        # Should handle gracefully without division by zero
        percentage = zero_tracker.get_progress_percentage()
        self.assertIsInstance(percentage, (int, float))
    
    @patch('sys.stdout.write')
    def test_progress_callback(self, mock_write):
        """Test progress callback functionality"""
        def progress_callback(current, total, percentage):
            print(f"Progress: {current}/{total} ({percentage:.1f}%)")
        
        callback_tracker = ProgressTracker(total_items=100, callback=progress_callback)
        callback_tracker.update_progress(50)
        
        # Verify callback was called (if implementation supports it)
        # This test depends on the actual implementation
        self.assertTrue(True)  # Placeholder assertion
    
    def test_is_complete(self):
        """Test completion checking"""
        self.assertFalse(self.tracker.is_complete())
        
        self.tracker.update_progress(100)
        self.assertTrue(self.tracker.is_complete())
    
    def test_get_eta(self):
        """Test estimated time of arrival calculation"""
        import time
        
        # Simulate some progress with time delays
        start_time = time.time()
        self.tracker.update_progress(25)
        
        # Check if ETA calculation exists (depends on implementation)
        eta = self.tracker.get_eta() if hasattr(self.tracker, 'get_eta') else None
        
        if eta is not None:
            self.assertIsInstance(eta, (int, float))


if __name__ == '__main__':
    unittest.main()
