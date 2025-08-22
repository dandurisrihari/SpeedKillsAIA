#!/usr/bin/env python3
"""
Test CLI integration for CSV export functionality
"""

import unittest
import tempfile
import subprocess
import sys
import json
import csv
from pathlib import Path

# Add src to path for imports
test_dir = Path(__file__).parent
sys.path.insert(0, str(test_dir.parent.parent / "src"))


class TestCLICSVIntegration(unittest.TestCase):
    """Test CLI integration with CSV export"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.test_dir_path = Path(self.test_dir)
        
        # Create a minimal test JSON file
        self.test_json = {
            "functions_by_file": [
                {
                    "function_name": "test_function_1",
                    "file_path": "test.c",
                    "function_code": "int test_function_1(void) { return 0; }",
                    "preprocessed_code": "",
                    "line_number": 10
                }
            ],
            "dma_operations": [
                {
                    "function_name": "dma_alloc_test",
                    "function_code": "void* dma_alloc_test(size_t size) { return dma_alloc_coherent(dev, size, &handle, GFP_KERNEL); }",
                    "stack_trace": "",
                    "preprocessed_code": ""
                }
            ]
        }
        
        self.test_json_file = self.test_dir_path / "test_input.json"
        with open(self.test_json_file, 'w') as f:
            json.dump(self.test_json, f, indent=2)
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    def test_csv_export_option_in_help(self):
        """Test that CSV export option appears in help"""
        cmd = [sys.executable, '-m', 'src.llm_analysis', '--help']
        result = subprocess.run(cmd, cwd=test_dir.parent.parent, capture_output=True, text=True)
        
        self.assertEqual(result.returncode, 0)
        self.assertIn('--csv-export', result.stdout)
        self.assertIn('Export analysis results to CSV format', result.stdout)
    
    def test_csv_file_generation_path(self):
        """Test that CSV file path is generated correctly"""
        import sys
        sys.path.insert(0, str(test_dir.parent.parent / "src"))
        
        try:
            from llm_analysis.cli import generate_output_filename
            
            # Test with JSON input
            json_input = "/path/to/test_data.json"
            yaml_output = generate_output_filename(json_input)
            expected_yaml = "/path/to/test_data_analysis.yaml"
            self.assertEqual(yaml_output, expected_yaml)
            
            # CSV should replace .yaml with .csv
            expected_csv = "/path/to/test_data_analysis.csv"
            csv_output = yaml_output.replace('.yaml', '.csv').replace('.yml', '.csv')
            self.assertEqual(csv_output, expected_csv)
            
        except ImportError:
            self.skipTest("LLM analysis CLI module not available")


class TestCSVFormatValidation(unittest.TestCase):
    """Test CSV format and content validation"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.test_dir_path = Path(self.test_dir)
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    def test_csv_header_format(self):
        """Test that CSV has correct header format"""
        # Test our CSV export method
        import sys
        sys.path.insert(0, str(test_dir.parent.parent / "src"))
        
        try:
            from llm_analysis.models import AnalysisResult
            from llm_analysis.output import OutputFormatter
            
            # Create minimal test data
            results = {
                'test_operations': [
                    AnalysisResult(
                        function_name='test_func',
                        aia_relevant_function=50,
                        relevant_kd_entry_point=60,
                        message_structure_handling=70,
                        message_structures_identified=['test_struct'],
                        smids_identified=['test_smid'],
                        reasoning=['test reasoning']
                    )
                ]
            }
            
            formatter = OutputFormatter(verbose=False)
            csv_file = self.test_dir_path / 'header_test.csv'
            formatter.export_to_csv(results, str(csv_file))
            
            # Read and validate header
            with open(csv_file, 'r', encoding='utf-8') as f:
                reader = csv.reader(f)
                header = next(reader)
            
            expected_header = [
                'Rank',
                'Function_Name',
                'Operation_Type',
                'Category',
                'Score',
                'Reasoning_Summary',
                'Message_Structures',
                'SMIDs_Identified'
            ]
            
            self.assertEqual(header, expected_header)
            
        except ImportError:
            self.skipTest("LLM analysis modules not available")
    
    def test_csv_category_completeness(self):
        """Test that all three categories are included in CSV"""
        import sys
        sys.path.insert(0, str(test_dir.parent.parent / "src"))
        
        try:
            from llm_analysis.models import AnalysisResult
            from llm_analysis.output import OutputFormatter
            
            # Create test data
            results = {
                'test_operations': [
                    AnalysisResult(
                        function_name='test_func',
                        aia_relevant_function=80,
                        relevant_kd_entry_point=70,
                        message_structure_handling=90,
                        message_structures_identified=[],
                        smids_identified=[],
                        reasoning=[]
                    )
                ]
            }
            
            formatter = OutputFormatter(verbose=False)
            csv_file = self.test_dir_path / 'categories_test.csv'
            formatter.export_to_csv(results, str(csv_file))
            
            # Read and check categories
            with open(csv_file, 'r', encoding='utf-8') as f:
                reader = csv.DictReader(f)
                rows = list(reader)
            
            categories = set(row['Category'] for row in rows)
            expected_categories = {
                'AIARelevantFunction',
                'Relevant_KD_Entry_Point', 
                'Message_Structure_Handling'
            }
            
            self.assertEqual(categories, expected_categories)
            
            # Each category should have 1 entry (since we have 1 function)
            for category in expected_categories:
                category_rows = [row for row in rows if row['Category'] == category]
                self.assertEqual(len(category_rows), 1)
                
        except ImportError:
            self.skipTest("LLM analysis modules not available")


if __name__ == '__main__':
    unittest.main()
