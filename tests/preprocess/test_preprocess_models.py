#!/usr/bin/env python3
"""
Fixed tests for data models with correct constructor signatures
"""

import unittest
import sys
from pathlib import Path

# Add the src directory to Python path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))

from src.preprocess.core.models import (
    FunctionEntry, DMAOperation, UserCopyOperation, IOCTLOperation,
    ProcessInfo, ParseStatistics, ParseResults, ParseMetadata
)


class TestDataModels(unittest.TestCase):
    """Test data model creation and methods"""
    
    def test_function_entry_creation(self):
        """Test creating a FunctionEntry object"""
        entry = FunctionEntry(
            function_name="test_func", 
            line_number=123, 
            first_seen_timestamp=100.5,
            first_seen_time_str="2023-01-01 12:00:00"
        )
        
        self.assertEqual(entry.function_name, "test_func")
        self.assertEqual(entry.line_number, 123)
        self.assertEqual(entry.first_seen_timestamp, 100.5)
        self.assertEqual(entry.first_seen_time_str, "2023-01-01 12:00:00")
        self.assertEqual(entry.entry_type, "function_entry")
        self.assertIsNone(entry.function_code)
        self.assertEqual(entry.call_count, 1)

    def test_dma_operation_creation(self):
        """Test creating a DMAOperation object"""
        dma = DMAOperation(
            dma_function="dma_map_page",
            caller_function="test_driver_func",
            file_path="/test/path.c",
            line_number=100,
            first_seen_timestamp=200.5,
            first_seen_time_str="2023-01-01 12:01:00"
        )
        
        self.assertEqual(dma.dma_function, "dma_map_page")
        self.assertEqual(dma.caller_function, "test_driver_func")
        self.assertEqual(dma.file_path, "/test/path.c")
        self.assertEqual(dma.line_number, 100)
        self.assertEqual(dma.first_seen_timestamp, 200.5)
        self.assertEqual(dma.first_seen_time_str, "2023-01-01 12:01:00")
        self.assertEqual(dma.stack_trace, [])
        self.assertIsNone(dma.function_code)
        self.assertEqual(dma.call_count, 1)

    def test_user_copy_operation_creation(self):
        """Test creating a UserCopyOperation object"""
        copy_op = UserCopyOperation(
            copy_function="copy_from_user",
            caller_function="device_write",
            file_path="/test/device.c",
            line_number=50,
            first_seen_timestamp=300.5,
            first_seen_time_str="2023-01-01 12:02:00"
        )
        
        self.assertEqual(copy_op.copy_function, "copy_from_user")
        self.assertEqual(copy_op.caller_function, "device_write")
        self.assertEqual(copy_op.file_path, "/test/device.c")
        self.assertEqual(copy_op.line_number, 50)
        self.assertEqual(copy_op.first_seen_timestamp, 300.5)
        self.assertEqual(copy_op.first_seen_time_str, "2023-01-01 12:02:00")
        self.assertIsNone(copy_op.process_info)
        self.assertIsNone(copy_op.function_code)
        self.assertEqual(copy_op.call_count, 1)

    def test_process_info_creation(self):
        """Test creating a ProcessInfo object"""
        proc = ProcessInfo(pid=1234, comm="test_process")
        
        self.assertEqual(proc.pid, 1234)
        self.assertEqual(proc.comm, "test_process")

    def test_parse_statistics_defaults(self):
        """Test ParseStatistics default values"""
        stats = ParseStatistics()
        
        self.assertEqual(stats.unique_function_entries, 0)
        self.assertEqual(stats.unique_dma_operations, 0)
        self.assertEqual(stats.unique_user_copy_operations, 0)
        self.assertEqual(stats.unique_ioctl_operations, 0)
        self.assertEqual(stats.total_function_entries_found, 0)
        self.assertEqual(stats.total_dma_operations_found, 0)
        self.assertEqual(stats.total_user_copy_operations_found, 0)
        self.assertEqual(stats.total_ioctl_operations_found, 0)
        self.assertEqual(stats.files_with_functions_entrypoint_instrumented, 0)
        self.assertEqual(stats.total_files, 0)
        self.assertEqual(stats.files_need_analysis, 0)  # New field
        self.assertEqual(stats.files_instrumented_with_function_entries, 0)
        self.assertEqual(stats.total_duplicates_skipped, 0)

    def test_parse_results_to_dict(self):
        """Test converting ParseResults to dictionary"""
        function_entry = FunctionEntry(
            "test_func", 
            123, 
            100.5, 
            "2023-01-01 12:00:00"
        )
        
        metadata = ParseMetadata()
        statistics = ParseStatistics()
        
        results = ParseResults(
            metadata=metadata,
            functions_by_file={"/test/file.c": [function_entry]},
            dma_operations=[],
            user_copy_operations=[],
            ioctl_operations=[],
            statistics=statistics
        )
        
        result_dict = results.to_dict()
        
        # Check structure
        self.assertIn('metadata', result_dict)
        self.assertIn('functions_by_file', result_dict)
        self.assertIn('dma_operations', result_dict)
        self.assertIn('user_copy_operations', result_dict)
        self.assertIn('ioctl_operations', result_dict)
        self.assertIn('statistics', result_dict)
        
        # Check new fields in statistics
        stats = result_dict['statistics']
        self.assertIn('total_files', stats)
        self.assertIn('files_need_analysis', stats)


class TestIOCTLOperation(unittest.TestCase):
    """Test IOCTL operation model"""
    
    def test_ioctl_operation_creation(self):
        """Test creating an IOCTLOperation object"""
        ioctl = IOCTLOperation(
            function_name="test_ioctl_handler",
            file_path="/test/ioctl.c",
            line_number=200,
            first_seen_timestamp=400.5,
            first_seen_time_str="2023-01-01 12:03:00"
        )
        
        self.assertEqual(ioctl.function_name, "test_ioctl_handler")
        self.assertEqual(ioctl.file_path, "/test/ioctl.c")
        self.assertEqual(ioctl.line_number, 200)
        self.assertEqual(ioctl.first_seen_timestamp, 400.5)
        self.assertEqual(ioctl.first_seen_time_str, "2023-01-01 12:03:00")
        self.assertIsNone(ioctl.function_code)
        self.assertEqual(ioctl.call_count, 1)

    def test_ioctl_operation_creation_without_code(self):
        """Test creating an IOCTLOperation without function code"""
        ioctl = IOCTLOperation(
            function_name="simple_ioctl",
            file_path="/simple/ioctl.c",
            line_number=100,
            first_seen_timestamp=500.0,
            first_seen_time_str="2023-01-01 12:04:00"
        )
        
        self.assertIsNone(ioctl.function_code)

    def test_ioctl_operation_to_dict(self):
        """Test converting IOCTLOperation to dictionary"""
        ioctl = IOCTLOperation(
            function_name="test_ioctl",
            file_path="/test/ioctl.c",
            line_number=150,
            first_seen_timestamp=600.0,
            first_seen_time_str="2023-01-01 12:05:00",
            function_code="void test_ioctl(void) { /* code */ }"
        )
        
        ioctl_dict = ioctl.to_dict()
        
        self.assertEqual(ioctl_dict['function_name'], "test_ioctl")
        self.assertEqual(ioctl_dict['file_path'], "/test/ioctl.c")
        self.assertEqual(ioctl_dict['line_number'], 150)
        self.assertEqual(ioctl_dict['first_seen_timestamp'], 600.0)
        self.assertEqual(ioctl_dict['first_seen_time_str'], "2023-01-01 12:05:00")
        self.assertEqual(ioctl_dict['function_code'], "void test_ioctl(void) { /* code */ }")
        self.assertEqual(ioctl_dict['call_count'], 1)


class TestParseResultsWithIOCTL(unittest.TestCase):
    """Test ParseResults with IOCTL operations"""
    
    def test_parse_results_with_ioctl_operations(self):
        """Test ParseResults containing IOCTL operations"""
        function_entry = FunctionEntry(
            "test_func", 
            100, 
            50.0, 
            "2023-01-01 12:00:00"
        )
        ioctl_op = IOCTLOperation(
            function_name="test_ioctl",
            file_path="/test/ioctl.c",
            line_number=200,
            first_seen_timestamp=100.0,
            first_seen_time_str="2023-01-01 12:01:00"
        )
        
        metadata = ParseMetadata()
        statistics = ParseStatistics()
        statistics.unique_ioctl_operations = 1
        
        results = ParseResults(
            metadata=metadata,
            functions_by_file={"/test/file.c": [function_entry]},
            dma_operations=[],
            user_copy_operations=[],
            ioctl_operations=[ioctl_op],
            statistics=statistics
        )
        
        result_dict = results.to_dict()
        
        # Check IOCTL operations in result
        self.assertEqual(len(result_dict['ioctl_operations']), 1)
        ioctl_dict = result_dict['ioctl_operations'][0]
        self.assertEqual(ioctl_dict['function_name'], "test_ioctl")
        
        # Check statistics
        self.assertEqual(result_dict['statistics']['unique_ioctl_operations'], 1)


if __name__ == '__main__':
    unittest.main()
