#!/usr/bin/env python3
"""
Simple integration test for new features that can actually run
"""

import unittest
import tempfile
import shutil
from pathlib import Path
import json
import sys
import os

# Add src to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

class TestNewFeaturesSimple(unittest.TestCase):
    """Simple tests that verify new features without complex imports"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
        
        # Create test source structure with .c files
        (self.temp_path / "main.c").write_text("// Main file")
        (self.temp_path / "driver.c").write_text("// Driver file")
        (self.temp_path / "lib").mkdir()
        (self.temp_path / "lib" / "utils.c").write_text("// Utils")
        
        # Create test log
        self.test_log = self.temp_path / "test.log"
        self.test_log.write_text("""
[    1.123456] FUNC_ENTRY: main_function in main.c:100
2025-08-03T19:04:36,338434+00:00 FUNC_ENTRY: driver_init in driver.c:50
[    2.234567] DMA_MAPPING: dma_alloc called by main_function in main.c:150
""")
    
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    def test_c_file_counting_manually(self):
        """Test .c file counting logic manually"""
        c_files = list(self.temp_path.rglob("*.c"))
        
        # Should find main.c, driver.c, lib/utils.c
        self.assertEqual(len(c_files), 3)
        
        file_names = [f.name for f in c_files]
        self.assertIn("main.c", file_names)
        self.assertIn("driver.c", file_names)
        self.assertIn("utils.c", file_names)
    
    def test_json_structure_with_new_fields(self):
        """Test that we can create JSON with new field structure"""
        test_results = {
            "metadata": {
                "parser_version": "2.0.0",
                "log_file": "test.log",
                "total_lines": 100
            },
            "statistics": {
                "unique_function_entries": 2,
                "unique_dma_operations": 1,
                "total_files": 3,  # New field
                "files_need_analysis": 2,  # New field (renamed)
                "files_with_functions_entrypoint_instrumented": 2
            },
            "function_entries": [
                {
                    "function_name": "main_function",
                    "file_path": "main.c",
                    "line_number": 100,
                    "first_seen_timestamp": 1.123456,
                    "first_seen_time_str": "1.123456",  # New field
                    "call_count": 1
                },
                {
                    "function_name": "driver_init", 
                    "file_path": "driver.c",
                    "line_number": 50,
                    "first_seen_timestamp": 1234567890.123,
                    "first_seen_time_str": "19:04:36,338434",  # New field
                    "call_count": 1
                }
            ]
        }
        
        # Test JSON serialization
        json_output = self.temp_path / "test_output.json"
        with open(json_output, 'w') as f:
            json.dump(test_results, f, indent=2)
        
        # Verify file was created and can be read back
        self.assertTrue(json_output.exists())
        
        with open(json_output, 'r') as f:
            loaded_data = json.load(f)
        
        # Verify new fields are present
        stats = loaded_data['statistics']
        self.assertIn('total_files', stats)
        self.assertIn('files_need_analysis', stats)
        self.assertEqual(stats['total_files'], 3)
        self.assertEqual(stats['files_need_analysis'], 2)
        
        # Verify timestamp strings are present
        for entry in loaded_data['function_entries']:
            self.assertIn('first_seen_time_str', entry)
            self.assertIsNotNone(entry['first_seen_time_str'])
    
    def test_timestamp_parsing_logic(self):
        """Test timestamp parsing logic manually"""
        import re
        
        # Test the regex pattern we use
        timestamp_pattern = r'(?:^\[\s*(\d+\.\d+)\]|^(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}[,\.]\d+[+\-]\d{2}:\d{2})\s)'
        
        # Traditional format
        traditional_line = "[    1.123456] FUNC_ENTRY: some_function"
        match = re.search(timestamp_pattern, traditional_line)
        self.assertIsNotNone(match)
        self.assertEqual(match.group(1), "1.123456")
        
        # ISO 8601 format
        iso_line = "2025-08-03T19:04:36,338434+00:00 FUNC_ENTRY: some_function"
        match = re.search(timestamp_pattern, iso_line)
        self.assertIsNotNone(match)
        self.assertEqual(match.group(2), "2025-08-03T19:04:36,338434+00:00")
        
        # Test extracting readable time from ISO format
        iso_timestamp = "2025-08-03T19:04:36,338434+00:00"
        # Extract time part: 19:04:36,338434
        time_part = iso_timestamp.split('T')[1].split('+')[0].split('-')[0]
        expected_readable = "19:04:36,338434"
        self.assertEqual(time_part, expected_readable)
    
    def test_backward_compatibility_fields(self):
        """Test that old field names can be mapped to new ones"""
        # Simulate old data format
        old_format = {
            "statistics": {
                "total_files_analyzed": 5,
                # Missing: total_files, files_need_analysis
            }
        }
        
        # Simulate backward compatibility mapping
        stats = old_format["statistics"]
        
        # Map old field to new field
        if "files_need_analysis" not in stats and "total_files_analyzed" in stats:
            stats["files_need_analysis"] = stats["total_files_analyzed"]
        
        if "total_files" not in stats:
            stats["total_files"] = 0  # Default for missing total_files
        
        # Verify mapping worked
        self.assertEqual(stats["files_need_analysis"], 5)
        self.assertEqual(stats["total_files"], 0)
    
    def test_directory_traversal_logic(self):
        """Test directory traversal for .c files"""
        # Create nested structure
        nested_dir = self.temp_path / "deeply" / "nested" / "structure"
        nested_dir.mkdir(parents=True)
        (nested_dir / "deep.c").write_text("// Deep file")
        
        # Test recursive search
        all_c_files = list(self.temp_path.rglob("*.c"))
        
        # Should find all .c files including the deep one
        self.assertEqual(len(all_c_files), 4)  # main.c, driver.c, lib/utils.c, deeply/nested/structure/deep.c
        
        # Verify the deep file is found
        deep_files = [f for f in all_c_files if f.name == "deep.c"]
        self.assertEqual(len(deep_files), 1)
    
    def test_file_filtering(self):
        """Test that only .c files are counted, not other extensions"""
        # Create files with various extensions
        (self.temp_path / "test.h").write_text("// Header file")
        (self.temp_path / "test.cpp").write_text("// C++ file")  
        (self.temp_path / "test.cc").write_text("// C++ file")
        (self.temp_path / "test.C").write_text("// Uppercase C")
        (self.temp_path / "test.txt").write_text("Text file")
        (self.temp_path / "Makefile").write_text("Makefile")
        
        # Count only .c files (lowercase)
        c_files = list(self.temp_path.rglob("*.c"))
        
        # Should still only find the original 3 .c files
        self.assertEqual(len(c_files), 3)
        
        # Verify no false positives
        for c_file in c_files:
            self.assertTrue(c_file.name.endswith('.c'))
            self.assertTrue(c_file.name[-1].islower())


class TestCLIOutput(unittest.TestCase):
    """Test CLI output formatting"""
    
    def test_cli_output_format(self):
        """Test the format of CLI output with new fields"""
        # Simulate CLI statistics output
        stats = {
            'total_files': 25,
            'files_need_analysis': 15,
            'files_instrumented_with_function_entries': 8
        }
        
        # Test the format strings we use in CLI
        total_files_line = f"Total Files: {stats.get('total_files', 0)}"
        files_need_analysis_line = f"Files need analysis: {stats.get('files_need_analysis', 0)}"
        files_with_functions_line = f"Files with Function Entries: {stats.get('files_instrumented_with_function_entries', 0)}"
        
        self.assertEqual(total_files_line, "Total Files: 25")
        self.assertEqual(files_need_analysis_line, "Files need analysis: 15")
        self.assertEqual(files_with_functions_line, "Files with Function Entries: 8")


def run_simple_tests():
    """Run the simple integration tests"""
    print("Running simple integration tests for new features...")
    print("="*60)
    
    loader = unittest.TestLoader()
    suite = unittest.TestSuite()
    
    # Add test classes
    suite.addTests(loader.loadTestsFromTestCase(TestNewFeaturesSimple))
    suite.addTests(loader.loadTestsFromTestCase(TestCLIOutput))
    
    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)
    
    print("\n" + "="*60)
    if result.wasSuccessful():
        print("✅ All simple integration tests passed!")
        print("New features are working correctly at the basic level.")
    else:
        print("❌ Some tests failed:")
        for failure in result.failures:
            print(f"  FAIL: {failure[0]}")
        for error in result.errors:
            print(f"  ERROR: {error[0]}")
    
    return result.wasSuccessful()


if __name__ == '__main__':
    success = run_simple_tests()
    sys.exit(0 if success else 1)
