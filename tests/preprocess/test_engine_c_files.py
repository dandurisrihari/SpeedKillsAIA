#!/usr/bin/env python3
"""
Test suite for engine .c file counting functionality
"""

import unittest
import tempfile
import shutil
from pathlib import Path
import sys
import os

# Add src to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

try:
    from preprocess.core.engine import KernelLogParserEngine
except ImportError:
    pass


class TestCFileCountingEngine(unittest.TestCase):
    """Test the engine's ability to count .c files recursively"""
    
    def setUp(self):
        """Set up test directory structure with various file types"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
        
        # Create complex directory structure
        self.create_test_structure()
    
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    def create_test_structure(self):
        """Create a realistic kernel source-like structure"""
        # Root level .c files
        (self.temp_path / "main.c").write_text("// Main file")
        (self.temp_path / "init.c").write_text("// Init file")
        
        # Drivers directory
        drivers_dir = self.temp_path / "drivers"
        drivers_dir.mkdir()
        (drivers_dir / "pci.c").write_text("// PCI driver")
        (drivers_dir / "usb.c").write_text("// USB driver")
        (drivers_dir / "Makefile").write_text("# Makefile")
        (drivers_dir / "driver.h").write_text("// Header file")
        
        # Nested gpu drivers
        gpu_dir = drivers_dir / "gpu"
        gpu_dir.mkdir()
        (gpu_dir / "nvidia.c").write_text("// NVIDIA driver")
        (gpu_dir / "radeon.c").write_text("// Radeon driver")
        (gpu_dir / "intel.c").write_text("// Intel driver")
        
        # Very deep nesting
        deep_dir = gpu_dir / "vendor" / "specific" / "implementation"
        deep_dir.mkdir(parents=True)
        (deep_dir / "vendor_specific.c").write_text("// Vendor specific code")
        
        # Kernel lib directory
        lib_dir = self.temp_path / "lib"
        lib_dir.mkdir()
        (lib_dir / "string.c").write_text("// String functions")
        (lib_dir / "math.c").write_text("// Math functions")
        (lib_dir / "crypto.c").write_text("// Crypto functions")
        
        # Non-.c files that should be ignored
        (self.temp_path / "README.md").write_text("# Readme")
        (self.temp_path / "LICENSE").write_text("License text")
        (drivers_dir / "config.txt").write_text("Config")
        (lib_dir / "header.h").write_text("// Header")
        (lib_dir / "script.py").write_text("# Python script")
        
        # Edge cases
        (self.temp_path / "file.c.bak").write_text("// Backup file - should be ignored")
        (self.temp_path / "not_c.cc").write_text("// C++ file - should be ignored")
        (self.temp_path / "fake.C").write_text("// Uppercase C - should be ignored")
        
        # Empty directories
        (self.temp_path / "empty_dir").mkdir()
        (self.temp_path / "empty_nested" / "empty_sub").mkdir(parents=True)
    
    def test_count_c_files_basic(self):
        """Test basic .c file counting"""
        engine = KernelLogParserEngine(show_ui=False)
        
        count = engine._count_total_c_files(str(self.temp_path))
        
        # Expected files:
        # main.c, init.c (root: 2)
        # drivers/pci.c, drivers/usb.c (drivers: 2) 
        # drivers/gpu/nvidia.c, drivers/gpu/radeon.c, drivers/gpu/intel.c (gpu: 3)
        # drivers/gpu/vendor/specific/implementation/vendor_specific.c (deep: 1)
        # lib/string.c, lib/math.c, lib/crypto.c (lib: 3)
        # Total: 11
        expected_count = 11
        
        self.assertEqual(count, expected_count)
    
    def test_count_c_files_nonexistent_directory(self):
        """Test counting in non-existent directory"""
        engine = KernelLogParserEngine(show_ui=False)
        
        count = engine._count_total_c_files("/path/that/does/not/exist")
        
        self.assertEqual(count, 0)
    
    def test_count_c_files_empty_directory(self):
        """Test counting in empty directory"""
        empty_dir = self.temp_path / "truly_empty"
        empty_dir.mkdir()
        
        engine = KernelLogParserEngine(show_ui=False)
        count = engine._count_total_c_files(str(empty_dir))
        
        self.assertEqual(count, 0)
    
    def test_count_c_files_only_non_c_files(self):
        """Test directory with only non-.c files"""
        non_c_dir = self.temp_path / "no_c_files"
        non_c_dir.mkdir()
        (non_c_dir / "test.h").write_text("// Header")
        (non_c_dir / "test.py").write_text("# Python")
        (non_c_dir / "test.txt").write_text("Text")
        (non_c_dir / "Makefile").write_text("# Make")
        
        engine = KernelLogParserEngine(show_ui=False)
        count = engine._count_total_c_files(str(non_c_dir))
        
        self.assertEqual(count, 0)
    
    def test_count_c_files_case_sensitivity(self):
        """Test that only lowercase .c files are counted"""
        case_test_dir = self.temp_path / "case_test"
        case_test_dir.mkdir()
        
        # Only .c should be counted
        (case_test_dir / "valid.c").write_text("// Valid C file")
        (case_test_dir / "invalid.C").write_text("// Uppercase C")
        (case_test_dir / "invalid.cc").write_text("// C++ file")
        (case_test_dir / "invalid.cpp").write_text("// C++ file")
        (case_test_dir / "backup.c.old").write_text("// Backup")
        
        engine = KernelLogParserEngine(show_ui=False)
        count = engine._count_total_c_files(str(case_test_dir))
        
        self.assertEqual(count, 1)  # Only valid.c should be counted
    
    def test_count_c_files_with_permissions_issue(self):
        """Test handling of permission errors gracefully"""
        engine = KernelLogParserEngine(show_ui=False)
        
        # Try to access a system directory that might have permission issues
        # This should not crash and should return 0
        count = engine._count_total_c_files("/root")  # Typically not accessible
        
        # Should handle gracefully and return 0
        self.assertIsInstance(count, int)
        self.assertGreaterEqual(count, 0)
    
    def test_count_c_files_integration_with_engine(self):
        """Test .c file counting integrated with full engine workflow"""
        # Create a simple log file with absolute paths that match our temp directory
        test_log = self.temp_path / "test.log"
        test_log.write_text(f"""
[    1.123456] FUNC_ENTRY: main_function in {self.temp_path}/main.c:100
[    2.234567] FUNC_ENTRY: driver_init in {self.temp_path}/drivers/pci.c:50
""")
        
        # Create engine with source root
        engine = KernelLogParserEngine(show_ui=False, source_root_path=str(self.temp_path))
        
        # Parse the log - engine returns dict now
        results_dict = engine.parse_log_file(str(test_log))
        
        # Verify that total_files is correctly counted
        self.assertIsInstance(results_dict, dict)
        self.assertIn('statistics', results_dict)
        statistics = results_dict['statistics']
        
        self.assertEqual(statistics['total_files'], 11)  # All our .c files
        self.assertGreaterEqual(statistics['files_need_analysis'], 0)  # Files referenced in logs
        
        # Verify the data structure is correct
        self.assertIn('total_files', statistics)
        self.assertEqual(statistics['total_files'], 11)


class TestEngineStatisticsIntegration(unittest.TestCase):
    """Test integration between .c file counting and other statistics"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
        
        # Create simple structure
        (self.temp_path / "test1.c").write_text("// Test 1")
        (self.temp_path / "test2.c").write_text("// Test 2")
        (self.temp_path / "subdir").mkdir()
        (self.temp_path / "subdir" / "test3.c").write_text("// Test 3")
    
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    def test_statistics_relationship(self):
        """Test relationship between total_files and files_need_analysis"""
        test_log = self.temp_path / "test.log"
        test_log.write_text(f"""
[    1.123456] FUNC_ENTRY: func1 in {self.temp_path}/test1.c:100
[    2.234567] FUNC_ENTRY: func2 in {self.temp_path}/test2.c:50
[    3.345678] DMA_INSTRUMENT: dma_alloc called by func1
""")
        
        engine = KernelLogParserEngine(show_ui=False, source_root_path=str(self.temp_path))
        results_dict = engine.parse_log_file(str(test_log))
        
        # Engine returns dict, so access statistics directly
        self.assertIsInstance(results_dict, dict)
        self.assertIn('statistics', results_dict)
        stats = results_dict['statistics']
        
        # Total files should be count of all .c files in source root
        self.assertEqual(stats['total_files'], 3)
        
        # Files need analysis should be count of files referenced in logs
        self.assertGreaterEqual(stats['files_need_analysis'], 0)
        self.assertLessEqual(stats['files_need_analysis'], stats['total_files'])
        
        # Files with functions should be subset of files need analysis
        self.assertLessEqual(stats['files_with_functions_entrypoint_instrumented'], stats['files_need_analysis'])
    
    def test_no_source_root_behavior(self):
        """Test behavior when no source root is provided"""
        test_log = self.temp_path / "test.log"
        test_log.write_text(f"""
[    1.123456] FUNC_ENTRY: func1 in {self.temp_path}/test1.c:100
""")
        
        engine = KernelLogParserEngine(show_ui=False, source_root_path=None)
        results_dict = engine.parse_log_file(str(test_log))
        
        # Engine returns dict, so access statistics directly
        self.assertIsInstance(results_dict, dict)
        self.assertIn('statistics', results_dict)
        stats = results_dict['statistics']
        
        # Total files should be 0 when no source root provided
        self.assertEqual(stats['total_files'], 0)
        
        # Other statistics should still work
        self.assertGreaterEqual(stats['files_need_analysis'], 0)


if __name__ == '__main__':
    unittest.main()
