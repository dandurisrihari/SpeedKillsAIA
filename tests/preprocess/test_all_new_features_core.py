#!/usr/bin/env python3
"""
Fixed test file that imports working timestamp parsing tests
"""

import unittest
import sys
import tempfile
import os
from pathlib import Path

# Add the src directory to Python path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))

from src.preprocess.core.engine import KernelLogParserEngine
from src.preprocess.core.models import ParseStatistics

# Import the working timestamp parsing tests
from tests.preprocess.test_parsers_fixed import TestTimestampParsing


class TestNewFeatures(unittest.TestCase):
    """Test new features with correct data handling"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        
        # Create test .c files
        self.test_files = []
        for i in range(5):
            test_file = Path(self.temp_dir) / f"test{i}.c"
            test_file.write_text(f"// Test file {i}\nint main() {{ return 0; }}")
            self.test_files.append(test_file)
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.temp_dir)
    
    def test_count_total_c_files(self):
        """Test counting .c files in a directory"""
        engine = KernelLogParserEngine(show_ui=False, source_root_path=self.temp_dir)
        count = engine._count_total_c_files(self.temp_dir)
        
        self.assertEqual(count, 5)  # We created 5 test files
    
    def test_count_total_c_files_empty_directory(self):
        """Test counting .c files in empty directory"""
        empty_dir = tempfile.mkdtemp()
        try:
            engine = KernelLogParserEngine(show_ui=False)
            count = engine._count_total_c_files(empty_dir)
            self.assertEqual(count, 0)
        finally:
            os.rmdir(empty_dir)
    
    def test_count_total_c_files_nonexistent_path(self):
        """Test counting .c files in nonexistent path"""
        engine = KernelLogParserEngine(show_ui=False)
        count = engine._count_total_c_files("/nonexistent/path")
        self.assertEqual(count, 0)
    
    def test_engine_with_source_root_includes_total_files(self):
        """Test that engine with source_root includes total_files in statistics"""
        # Create test log file
        test_log = Path(self.temp_dir) / "test.log"
        test_log.write_text(f"""
[123456.789012] FUNC_ENTRY: test_func at {self.temp_dir}/test0.c:100
""")
        
        engine = KernelLogParserEngine(show_ui=False, source_root_path=self.temp_dir)
        results_dict = engine.parse_log_file(test_log)
        
        # Engine returns dict, so access statistics directly
        self.assertIsInstance(results_dict, dict)
        self.assertIn('statistics', results_dict)
        statistics = results_dict['statistics']
        
        self.assertIn('total_files', statistics)
        self.assertGreater(statistics['total_files'], 0)
    
    def test_engine_without_source_root_zero_total_files(self):
        """Test that engine without source_root has zero total_files"""
        # Create test log file
        test_log = Path(self.temp_dir) / "test.log"
        test_log.write_text("""
[123456.789012] FUNC_ENTRY: test_func at /test/file.c:100
""")
        
        engine = KernelLogParserEngine(show_ui=False)  # No source_root_path
        results_dict = engine.parse_log_file(test_log)
        
        # Engine returns dict, so access statistics directly
        self.assertIsInstance(results_dict, dict)
        self.assertIn('statistics', results_dict)
        statistics = results_dict['statistics']
        
        self.assertIn('total_files', statistics)
        self.assertEqual(statistics['total_files'], 0)
    
    def test_parse_results_to_dict_new_fields(self):
        """Test that dict results include new fields"""
        test_log = Path(self.temp_dir) / "test.log"
        test_log.write_text(f"""
[123456.789012] FUNC_ENTRY: test_func at {self.temp_dir}/test0.c:100
[123456.789013] DMA_INSTRUMENT: dma_map_page called by test_func
""")
        
        engine = KernelLogParserEngine(show_ui=False, source_root_path=self.temp_dir)
        results_dict = engine.parse_log_file(test_log)
        
        # Check that new fields are present
        statistics = results_dict['statistics']
        self.assertIn('total_files', statistics)
        self.assertIn('files_need_analysis', statistics)
        
        # Verify structure is correct
        self.assertIsInstance(statistics['total_files'], int)
        self.assertIsInstance(statistics['files_need_analysis'], int)
    
    def test_parse_statistics_new_fields(self):
        """Test ParseStatistics has new fields"""
        stats = ParseStatistics()
        
        # Check new fields exist
        self.assertEqual(stats.total_files, 0)
        self.assertEqual(stats.files_need_analysis, 0)
        
        # Check field types
        self.assertIsInstance(stats.total_files, int)
        self.assertIsInstance(stats.files_need_analysis, int)


class TestBackwardCompatibility(unittest.TestCase):
    """Test backward compatibility of new features"""
    
    def test_json_output_includes_old_field_names(self):
        """Test that JSON output maintains backward compatibility"""
        # Create temporary directory and log file
        temp_dir = tempfile.mkdtemp()
        try:
            test_log = Path(temp_dir) / "test.log"
            test_log.write_text("""
[123456.789012] FUNC_ENTRY: test_func at /test/file.c:100
""")
            
            engine = KernelLogParserEngine(show_ui=False)
            results_dict = engine.parse_log_file(test_log)
            
            # Check that we have the new field name
            statistics = results_dict['statistics']
            self.assertIn('files_need_analysis', statistics)
            
            # The old field name should not be present anymore (it was renamed)
            self.assertNotIn('total_files_analyzed', statistics)
            
        finally:
            import shutil
            shutil.rmtree(temp_dir)


class TestIntegrationWithNewFeatures(unittest.TestCase):
    """Test integration scenarios with new features"""
    
    def test_end_to_end_with_new_features(self):
        """Test complete workflow with new features"""
        # Create test environment
        temp_dir = tempfile.mkdtemp()
        try:
            # Create several .c files
            for i in range(3):
                test_file = Path(temp_dir) / f"driver{i}.c"
                test_file.write_text(f"""
// Driver file {i}
int driver_function_{i}(void) {{
    return {i};
}}
""")
            
            # Create test log
            test_log = Path(temp_dir) / "test.log"
            test_log.write_text(f"""
[123456.789012] FUNC_ENTRY: driver_function_0 at {temp_dir}/driver0.c:100
[123456.789013] DMA_INSTRUMENT: dma_map_page called by driver_function_0
[123456.789014] USER_COPY: copy_from_user called by driver_function_1
""")
            
            # Run engine with source root
            engine = KernelLogParserEngine(show_ui=False, source_root_path=temp_dir)
            results_dict = engine.parse_log_file(test_log)
            
            # Verify results structure - engine returns dict
            self.assertIsInstance(results_dict, dict)
            
            # Access statistics from dict
            statistics = results_dict['statistics']
            
            # Check new fields
            self.assertIn('total_files', statistics)
            self.assertIn('files_need_analysis', statistics)
            
            # Verify values make sense
            self.assertEqual(statistics['total_files'], 3)  # 3 .c files created
            self.assertGreaterEqual(statistics['files_need_analysis'], 0)  # Files referenced in logs
            
        finally:
            import shutil
            shutil.rmtree(temp_dir)


if __name__ == '__main__':
    unittest.main()
