#!/usr/bin/env python3
"""
Test CSV export functionality for LLM analysis
"""

import unittest
import tempfile
import csv
from pathlib import Path
import sys
import os

# Add src to path for imports
test_dir = Path(__file__).parent
sys.path.insert(0, str(test_dir.parent.parent / "src"))

try:
    from llm_analysis.models import AnalysisResult
    from llm_analysis.output import OutputFormatter
except ImportError as e:
    print(f"Warning: Could not import LLM analysis modules: {e}")
    AnalysisResult = None
    OutputFormatter = None


@unittest.skipIf(AnalysisResult is None or OutputFormatter is None, "LLM analysis modules not available")
class TestCSVExport(unittest.TestCase):
    """Test CSV export functionality"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.test_dir_path = Path(self.test_dir)
        
        # Create sample analysis results
        self.sample_results = {
            'functions_by_file': [
                AnalysisResult(
                    function_name='test_function_1',
                    aia_relevant_function=90,
                    relevant_kd_entry_point=75,
                    message_structure_handling=85,
                    message_structures_identified=['struct test_msg'],
                    smids_identified=['dma_addr', 'buffer_size'],
                    reasoning=['This function handles DMA operations', 'High relevance for AIA']
                ),
                AnalysisResult(
                    function_name='test_function_2', 
                    aia_relevant_function=60,
                    relevant_kd_entry_point=95,
                    message_structure_handling=70,
                    message_structures_identified=['struct ioctl_msg'],
                    smids_identified=['user_ptr'],
                    reasoning=['Entry point function', 'Handles user space calls']
                )
            ],
            'dma_operations': [
                AnalysisResult(
                    function_name='dma_alloc_function',
                    aia_relevant_function=95,
                    relevant_kd_entry_point=50,
                    message_structure_handling=60,
                    message_structures_identified=['dma_descriptor'],
                    smids_identified=['phys_addr', 'virt_addr'],
                    reasoning=['DMA allocation function', 'Critical for memory sharing']
                )
            ]
        }
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    def test_csv_export_creates_file(self):
        """Test that CSV export creates a file"""
        formatter = OutputFormatter(verbose=False)
        csv_file = self.test_dir_path / 'test_results.csv'
        
        formatter.export_to_csv(self.sample_results, str(csv_file))
        
        self.assertTrue(csv_file.exists())
        self.assertGreater(csv_file.stat().st_size, 0)
    
    def test_csv_export_structure(self):
        """Test CSV export structure and content"""
        formatter = OutputFormatter(verbose=False)
        csv_file = self.test_dir_path / 'test_results.csv'
        
        formatter.export_to_csv(self.sample_results, str(csv_file))
        
        # Read and validate CSV content
        with open(csv_file, 'r', encoding='utf-8') as f:
            reader = csv.reader(f)
            rows = list(reader)
        
        # Check header
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
        self.assertEqual(rows[0], expected_header)
        
        # Should have data rows (3 functions * 3 categories = 9 data rows + 1 header = 10 total)
        self.assertEqual(len(rows), 10)  # 1 header + 9 data rows
    
    def test_csv_rankings_order(self):
        """Test that CSV rankings are ordered correctly (highest to lowest)"""
        formatter = OutputFormatter(verbose=False)
        csv_file = self.test_dir_path / 'test_results.csv'
        
        formatter.export_to_csv(self.sample_results, str(csv_file))
        
        # Read CSV content
        with open(csv_file, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            rows = list(reader)
        
        # Group by category and check ordering
        categories = {}
        for row in rows:
            category = row['Category']
            if category not in categories:
                categories[category] = []
            categories[category].append(int(row['Score']))
        
        # Check each category is sorted descending
        for category, scores in categories.items():
            self.assertEqual(scores, sorted(scores, reverse=True), 
                           f"Category {category} scores are not sorted in descending order")
    
    def test_csv_content_values(self):
        """Test specific content values in CSV"""
        formatter = OutputFormatter(verbose=False)
        csv_file = self.test_dir_path / 'test_results.csv'
        
        formatter.export_to_csv(self.sample_results, str(csv_file))
        
        # Read CSV content
        with open(csv_file, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            rows = list(reader)
        
        # Find the DMA function with highest AIA score
        aia_rows = [row for row in rows if row['Category'] == 'AIARelevantFunction']
        highest_aia = max(aia_rows, key=lambda x: int(x['Score']))
        
        self.assertEqual(highest_aia['Function_Name'], 'dma_alloc_function')
        self.assertEqual(int(highest_aia['Score']), 95)
        self.assertEqual(highest_aia['Operation_Type'], 'dma_operations')
        
        # Check message structures and SMIDs are properly formatted
        self.assertIn('dma_descriptor', highest_aia['Message_Structures'])
        self.assertIn('phys_addr', highest_aia['SMIDs_Identified'])
        self.assertIn('virt_addr', highest_aia['SMIDs_Identified'])
    
    def test_csv_with_empty_fields(self):
        """Test CSV export with empty message structures and SMIDs"""
        # Create result with empty fields
        empty_result = {
            'test_operations': [
                AnalysisResult(
                    function_name='empty_function',
                    aia_relevant_function=30,
                    relevant_kd_entry_point=40,
                    message_structure_handling=20,
                    message_structures_identified=[],
                    smids_identified=[],
                    reasoning=[]
                )
            ]
        }
        
        formatter = OutputFormatter(verbose=False)
        csv_file = self.test_dir_path / 'empty_test.csv'
        
        formatter.export_to_csv(empty_result, str(csv_file))
        
        # Read and check content
        with open(csv_file, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            rows = list(reader)
        
        # Check that empty fields are handled properly
        for row in rows:
            if row['Function_Name'] == 'empty_function':
                self.assertEqual(row['Message_Structures'], 'None')
                self.assertEqual(row['SMIDs_Identified'], 'None')
                self.assertEqual(row['Reasoning_Summary'], 'No reasoning provided')


if __name__ == '__main__':
    unittest.main()
