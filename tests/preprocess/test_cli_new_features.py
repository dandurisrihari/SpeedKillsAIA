#!/usr/bin/env python3
"""
Test suite for CLI functionality with new features
"""

import unittest
import tempfile
import shutil
from pathlib import Path
import json
import sys
import os
from unittest.mock import patch, MagicMock
import io

# Add src to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

try:
    from preprocess.cli import main as cli_main
    from preprocess.tool import KernelLogParserTool
except ImportError:
    pass  # Tests will be skipped if imports fail


class TestCLIWithNewFeatures(unittest.TestCase):
    """Test CLI functionality with new Total Files and Files need analysis features"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
        
        # Create test source structure
        (self.temp_path / "src").mkdir()
        (self.temp_path / "src" / "driver1.c").write_text("// Driver 1")
        (self.temp_path / "src" / "driver2.c").write_text("// Driver 2")
        (self.temp_path / "src" / "utils").mkdir()
        (self.temp_path / "src" / "utils" / "helper.c").write_text("// Helper functions")
        
        # Create test log file
        self.test_log = self.temp_path / "test.log"
        self.test_log.write_text("""
[    1.123456] FUNC_ENTRY: driver_init in src/driver1.c:100
2025-08-03T19:04:36,338434+00:00 FUNC_ENTRY: helper_func in src/utils/helper.c:50
[    2.789012] DMA_MAPPING: dma_alloc_coherent called by driver_init in src/driver1.c:150
""")
        
        self.output_file = self.temp_path / "results.json"
    
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    @patch('sys.argv')
    @patch('sys.stdout', new_callable=io.StringIO)
    def test_cli_displays_new_fields(self, mock_stdout, mock_argv):
        """Test that CLI displays new Total Files and Files need analysis fields"""
        mock_argv.return_value = [
            'cli.py', 
            str(self.test_log),
            '--output', str(self.output_file),
            '--source-root', str(self.temp_path),
            '--no-ui'
        ]
        
        try:
            cli_main()
            output = mock_stdout.getvalue()
            
            # Check that new fields are displayed
            self.assertIn("Total Files:", output)
            self.assertIn("Files need analysis:", output)
            self.assertIn("Files with Function Entries:", output)
            
            # Verify the JSON output contains new fields
            if self.output_file.exists():
                with open(self.output_file) as f:
                    results = json.load(f)
                
                stats = results['statistics']
                self.assertIn('total_files', stats)
                self.assertIn('files_need_analysis', stats)
                self.assertGreater(stats['total_files'], 0)
                
        except SystemExit:
            pass  # CLI calls sys.exit, which is expected
    
    def test_tool_with_source_root(self):
        """Test KernelLogParserTool with source root functionality"""
        tool = KernelLogParserTool()
        
        results = tool.process_log(
            str(self.test_log), 
            str(self.output_file),
            show_ui=False,
            source_root_path=str(self.temp_path)
        )
        
        # Verify results contain new fields
        self.assertIn('statistics', results)
        stats = results['statistics']
        
        self.assertIn('total_files', stats)
        self.assertIn('files_need_analysis', stats)
        self.assertEqual(stats['total_files'], 3)  # 3 .c files in our test structure
    
    def test_tool_without_source_root(self):
        """Test KernelLogParserTool without source root"""
        tool = KernelLogParserTool()
        
        results = tool.process_log(
            str(self.test_log), 
            str(self.output_file),
            show_ui=False,
            source_root_path=None
        )
        
        # Verify results have zero total files when no source root provided
        stats = results['statistics']
        self.assertEqual(stats['total_files'], 0)
        self.assertIn('files_need_analysis', stats)


class TestProgressUINewFields(unittest.TestCase):
    """Test that progress UI displays new fields correctly"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
    
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    @patch('sys.stdout', new_callable=io.StringIO)
    def test_progress_ui_shows_new_fields(self, mock_stdout):
        """Test that progress UI displays new Total Files and Files need analysis"""
        try:
            from preprocess.utils.progress import ProgressUI
            from preprocess.core.models import ParseStatistics, ParseMetadata
            
            ui = ProgressUI(show_ui=True)
            
            # Create test statistics with new fields
            stats = ParseStatistics(
                unique_function_entries=5,
                unique_dma_operations=2,
                unique_user_copy_operations=1,
                total_files=15,
                files_need_analysis=8,
                files_with_functions_entrypoint_instrumented=3,
                files_instrumented_with_function_entries=3
            )
            
            metadata = ParseMetadata(total_lines=100, unique_entries=8)
            
            # Print summary
            ui.print_summary(metadata, stats)
            
            output = mock_stdout.getvalue()
            
            # Verify new fields are displayed
            self.assertIn("Total files: 15", output)
            self.assertIn("Files need analysis: 8", output)
            self.assertIn("Files with functions entry Instrumented", output)
            
        except ImportError:
            self.skipTest("Progress UI imports not available")


class TestWebUINewFields(unittest.TestCase):
    """Test that web UI properly handles new fields"""
    
    def setUp(self):
        """Set up test environment"""
        self.temp_dir = tempfile.mkdtemp()
        self.temp_path = Path(self.temp_dir)
        
        # Create test JSON data with new fields
        self.test_data = {
            "metadata": {
                "parser_version": "2.0.0",
                "parsed_at": "2025-08-03T19:04:36",
                "log_file": "test.log",
                "total_lines": 100,
                "parsed_lines": 95,
                "unique_entries": 10
            },
            "statistics": {
                "unique_function_entries": 5,
                "unique_dma_operations": 2,
                "unique_user_copy_operations": 1,
                "unique_ioctl_operations": 1,
                "total_files": 20,
                "files_need_analysis": 12,
                "files_with_functions_entrypoint_instrumented": 5,
                "files_instrumented_with_function_entries": 5,
                "total_duplicates_skipped": 3
            },
            "function_entries": [],
            "functions_by_file": {},
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": []
        }
        
        self.test_json_file = self.temp_path / "test_data.json"
        with open(self.test_json_file, 'w') as f:
            json.dump(self.test_data, f)
    
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)
    
    def test_web_ui_load_data_with_new_fields(self):
        """Test that web UI loads data with new fields correctly"""
        try:
            from preprocess.web.ui import load_data
            
            success = load_data(self.test_json_file)
            self.assertTrue(success)
            
            # Access the global parsed_data
            from preprocess.web import ui
            data = ui.parsed_data
            
            self.assertIsNotNone(data)
            stats = data['statistics']
            
            # Verify new fields are present
            self.assertIn('total_files', stats)
            self.assertIn('files_need_analysis', stats)
            self.assertEqual(stats['total_files'], 20)
            self.assertEqual(stats['files_need_analysis'], 12)
            
        except ImportError:
            self.skipTest("Web UI imports not available")
    
    def test_web_ui_backward_compatibility(self):
        """Test that web UI handles old JSON format gracefully"""
        # Create old format data (without new fields)
        old_data = {
            "metadata": {
                "parser_version": "1.0.0",
                "log_file": "old_test.log"
            },
            "statistics": {
                "unique_function_entries": 3,
                "files_with_functions_entrypoint_instrumented": 2
                # Missing new fields: total_files, files_need_analysis
            },
            "function_entries": [],
            "functions_by_file": {}
        }
        
        old_json_file = self.temp_path / "old_data.json"
        with open(old_json_file, 'w') as f:
            json.dump(old_data, f)
        
        try:
            from preprocess.web.ui import load_data
            
            success = load_data(old_json_file)
            self.assertTrue(success)
            
            # Should handle missing fields gracefully
            from preprocess.web import ui
            data = ui.parsed_data
            
            self.assertIsNotNone(data)
            # The load_data function should add backward compatibility
            
        except ImportError:
            self.skipTest("Web UI imports not available")


if __name__ == '__main__':
    unittest.main()
