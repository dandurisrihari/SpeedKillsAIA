#!/usr/bin/env python3
"""
Test suite for core data models
"""

import unittest
from datetime import datetime

import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from preprocess.core.models import (
    FunctionEntry, ProcessInfo, DMAOperation, UserCopyOperation, IOCTLOperation,
    ParseStatistics, ParseMetadata, ParseResults
)


class TestDataModels(unittest.TestCase):
    """Test cases for core data models"""
    
    def test_function_entry_creation(self):
        """Test FunctionEntry creation and attributes"""
        entry = FunctionEntry(
            function_name="test_func",
            line_number=123,
            first_seen_timestamp=100.5
        )
        
        self.assertEqual(entry.function_name, "test_func")
        self.assertEqual(entry.line_number, 123)
        self.assertEqual(entry.first_seen_timestamp, 100.5)
        self.assertEqual(entry.entry_type, "function_entry")
    
    def test_process_info_creation(self):
        """Test ProcessInfo creation"""
        process = ProcessInfo(pid=1234, comm="test_process")
        
        self.assertEqual(process.pid, 1234)
        self.assertEqual(process.comm, "test_process")
    
    def test_dma_operation_creation(self):
        """Test DMAOperation creation with stack trace"""
        dma = DMAOperation(
            dma_function="dma_map_page",
            caller_function="test_caller",
            file_path="/test/file.c",
            line_number=456,
            first_seen_timestamp=200.5,
            stack_trace=["line1", "line2"]
        )
        
        self.assertEqual(dma.dma_function, "dma_map_page")
        self.assertEqual(dma.caller_function, "test_caller")
        self.assertEqual(dma.file_path, "/test/file.c")
        self.assertEqual(dma.line_number, 456)
        self.assertEqual(dma.first_seen_timestamp, 200.5)
        self.assertEqual(len(dma.stack_trace), 2)
    
    def test_user_copy_operation_creation(self):
        """Test UserCopyOperation creation"""
        process = ProcessInfo(pid=5678, comm="copy_test")
        copy_op = UserCopyOperation(
            copy_function="copy_from_user",
            caller_function="test_copy",
            file_path="/test/copy.c",
            line_number=789,
            first_seen_timestamp=300.5,
            process_info=process
        )
        
        self.assertEqual(copy_op.copy_function, "copy_from_user")
        self.assertEqual(copy_op.caller_function, "test_copy")
        self.assertEqual(copy_op.file_path, "/test/copy.c")
        self.assertEqual(copy_op.line_number, 789)
        self.assertEqual(copy_op.first_seen_timestamp, 300.5)
        self.assertIsNotNone(copy_op.process_info)
        self.assertEqual(copy_op.process_info.pid, 5678)
    
    def test_parse_statistics_defaults(self):
        """Test ParseStatistics default values"""
        stats = ParseStatistics()
        
        self.assertEqual(stats.unique_function_entries, 0)
        self.assertEqual(stats.unique_dma_operations, 0)
        self.assertEqual(stats.unique_user_copy_operations, 0)
        self.assertEqual(stats.files_with_functions, 0)
        self.assertEqual(stats.total_files_analyzed, 0)
        self.assertEqual(stats.files_instrumented_with_function_entries, 0)
        self.assertEqual(stats.total_duplicates_skipped, 0)
    
    def test_parse_metadata_defaults(self):
        """Test ParseMetadata default values"""
        metadata = ParseMetadata()
        
        self.assertEqual(metadata.parser_version, "2.0.0")
        self.assertIsNotNone(metadata.parsed_at)
        self.assertIsNone(metadata.log_file)
        self.assertEqual(metadata.total_lines, 0)
        self.assertEqual(metadata.parsed_lines, 0)
        self.assertEqual(metadata.unique_entries, 0)
    
    def test_parse_results_to_dict(self):
        """Test ParseResults to_dict conversion"""
        metadata = ParseMetadata(log_file="test.log", total_lines=100)
        statistics = ParseStatistics(unique_function_entries=5)
        
        function_entry = FunctionEntry("test_func", 123, 100.5)
        functions_by_file = {"test.c": [function_entry]}
        
        dma_op = DMAOperation("dma_test", "caller", "file.c", 456, 200.5)
        dma_operations = [dma_op]
        
        copy_op = UserCopyOperation("copy_test", "caller", "copy.c", 789, 300.5)
        user_copy_operations = [copy_op]
        
        results = ParseResults(
            metadata=metadata,
            functions_by_file=functions_by_file,
            dma_operations=dma_operations,
            user_copy_operations=user_copy_operations,
            ioctl_operations=[],
            statistics=statistics
        )
        
        data_dict = results.to_dict()
        
        # Check structure
        self.assertIn('metadata', data_dict)
        self.assertIn('functions_by_file', data_dict)
        self.assertIn('dma_operations', data_dict)
        self.assertIn('user_copy_operations', data_dict)
        self.assertIn('statistics', data_dict)
        
        # Check metadata
        self.assertEqual(data_dict['metadata']['log_file'], "test.log")
        self.assertEqual(data_dict['metadata']['total_lines'], 100)
        
        # Check functions
        self.assertIn('test.c', data_dict['functions_by_file'])
        self.assertEqual(len(data_dict['functions_by_file']['test.c']), 1)
        
        # Check DMA operations
        self.assertEqual(len(data_dict['dma_operations']), 1)
        self.assertEqual(data_dict['dma_operations'][0]['dma_function'], "dma_test")
        
        # Check user copy operations
        self.assertEqual(len(data_dict['user_copy_operations']), 1)
        self.assertEqual(data_dict['user_copy_operations'][0]['copy_function'], "copy_test")


class TestIOCTLOperation(unittest.TestCase):
    """Test cases for IOCTLOperation model"""
    
    def test_ioctl_operation_creation(self):
        """Test IOCTLOperation creation with all fields"""
        ioctl = IOCTLOperation(
            function_name="drv_ioctl",
            file_path="drivers/gpu/kernel_driver.c",
            line_number=673,
            first_seen_timestamp=47.468247,
            function_code="int drv_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {\n    return 0;\n}"
        )
        
        self.assertEqual(ioctl.function_name, "drv_ioctl")
        self.assertEqual(ioctl.file_path, "drivers/gpu/kernel_driver.c")
        self.assertEqual(ioctl.line_number, 673)
        self.assertEqual(ioctl.first_seen_timestamp, 47.468247)
        self.assertIsNotNone(ioctl.function_code)
        self.assertIn("drv_ioctl", ioctl.function_code)
    
    def test_ioctl_operation_creation_without_code(self):
        """Test IOCTLOperation creation without function code"""
        ioctl = IOCTLOperation(
            function_name="video_ioctl",
            file_path="drivers/media/v4l2-dev.c",
            line_number=456,
            first_seen_timestamp=50.123456
        )
        
        self.assertEqual(ioctl.function_name, "video_ioctl")
        self.assertEqual(ioctl.file_path, "drivers/media/v4l2-dev.c")
        self.assertEqual(ioctl.line_number, 456)
        self.assertEqual(ioctl.first_seen_timestamp, 50.123456)
        self.assertIsNone(ioctl.function_code)
    
    def test_ioctl_operation_to_dict(self):
        """Test IOCTLOperation to_dict method"""
        ioctl = IOCTLOperation(
            function_name="test_ioctl",
            file_path="test.c",
            line_number=123,
            first_seen_timestamp=100.0,
            function_code="int test_ioctl() { return 0; }"
        )
        
        data_dict = ioctl.to_dict()
        
        self.assertEqual(data_dict['function_name'], "test_ioctl")
        self.assertEqual(data_dict['file_path'], "test.c")
        self.assertEqual(data_dict['line_number'], 123)
        self.assertEqual(data_dict['first_seen_timestamp'], 100.0)
        self.assertEqual(data_dict['function_code'], "int test_ioctl() { return 0; }")


class TestParseResultsWithIOCTL(unittest.TestCase):
    """Test cases for ParseResults with IOCTL operations"""
    
    def test_parse_results_with_ioctl_operations(self):
        """Test ParseResults containing IOCTL operations"""
        function_entry = FunctionEntry("test_func", 100, 50.0)
        dma_op = DMAOperation("dma_test", "caller", "test.c", 200, 60.0)
        user_copy_op = UserCopyOperation("copy_test", "caller_func", "test.c", 300, 70.0)
        ioctl_op = IOCTLOperation("ioctl_test", "test.c", 400, 80.0, "int ioctl_test() { return 0; }")
        
        metadata = ParseMetadata()
        metadata.log_file = "test.log"
        statistics = ParseStatistics(
            unique_function_entries=1,
            unique_dma_operations=1,
            unique_user_copy_operations=1,
            unique_ioctl_operations=1,
            files_with_functions=1,
            total_files_analyzed=1,
            files_instrumented_with_function_entries=1
        )
        
        results = ParseResults(
            metadata=metadata,
            statistics=statistics,
            functions_by_file={"test.c": [function_entry]},
            dma_operations=[dma_op],
            user_copy_operations=[user_copy_op],
            ioctl_operations=[ioctl_op]
        )
        
        self.assertEqual(len(results.ioctl_operations), 1)
        self.assertEqual(results.ioctl_operations[0].function_name, "ioctl_test")
        
        # Test to_dict includes IOCTL operations
        data_dict = results.to_dict()
        self.assertIn('ioctl_operations', data_dict)
        self.assertEqual(len(data_dict['ioctl_operations']), 1)
        self.assertEqual(data_dict['ioctl_operations'][0]['function_name'], "ioctl_test")


if __name__ == '__main__':
    unittest.main(verbosity=2)
