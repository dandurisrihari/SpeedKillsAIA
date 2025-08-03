#!/usr/bin/env python3
"""
Test suite for individual parsers
"""

import unittest
import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from preprocess.core.patterns import LogPatterns
from preprocess.parsers.function_parser import FunctionEntryParser
from preprocess.parsers.dma_parser import DMAParser
from preprocess.parsers.user_copy_parser import UserCopyParser
from preprocess.parsers.ioctl_parser import IOCTLParser
from preprocess.core.models import FunctionEntry, DMAOperation, UserCopyOperation, IOCTLOperation, ProcessInfo


class TestFunctionEntryParser(unittest.TestCase):
    """Test cases for FunctionEntryParser"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.patterns = LogPatterns()
        self.parser = FunctionEntryParser(self.patterns)
    
    def test_can_parse(self):
        """Test can_parse method"""
        self.assertTrue(self.parser.can_parse("[  156.773472] FUNC_ENTRY: Entering function test"))
        self.assertFalse(self.parser.can_parse("[  156.773472] DMA_INSTRUMENT: About to call"))
        self.assertFalse(self.parser.can_parse("Not a log line"))
    
    def test_parse_valid_line(self):
        """Test parsing valid function entry line"""
        line = "[  156.773472] FUNC_ENTRY: Entering function gasket_open at /gasket-driver/src/gasket_core.c:1229"
        success, result = self.parser.parse(line, 156.773472)
        
        self.assertTrue(success)
        self.assertIsNotNone(result)
        
        function_entry, file_path = result
        self.assertIsInstance(function_entry, FunctionEntry)
        self.assertEqual(function_entry.function_name, "gasket_open")
        self.assertEqual(function_entry.line_number, 1229)
        self.assertEqual(function_entry.first_seen_timestamp, 156.773472)
        self.assertEqual(file_path, "/gasket-driver/src/gasket_core.c")
    
    def test_parse_invalid_line(self):
        """Test parsing invalid line"""
        line = "[  156.773472] Not a function entry"
        success, result = self.parser.parse(line, 156.773472)
        
        self.assertFalse(success)
        self.assertIsNone(result)


class TestDMAParser(unittest.TestCase):
    """Test cases for DMAParser"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.patterns = LogPatterns()
        self.parser = DMAParser(self.patterns)
    
    def test_can_parse(self):
        """Test can_parse method"""
        self.assertTrue(self.parser.can_parse("[  156.800000] DMA_INSTRUMENT: About to call"))
        self.assertTrue(self.parser.can_parse("[  156.801000] DMA_STACK_START: Stack trace"))
        self.assertTrue(self.parser.can_parse("[  156.806000] DMA_STACK_END: End of stack"))
        self.assertFalse(self.parser.can_parse("[  156.773472] FUNC_ENTRY: Entering"))
        self.assertFalse(self.parser.can_parse("Not a log line"))
    
    def test_parse_dma_instrument(self):
        """Test parsing DMA instrument line"""
        line = "[  156.800000] DMA_INSTRUMENT: About to call dma_map_page from function gasket_perform_mapping at /gasket-driver/src/gasket_page_table.c:650"
        success, result = self.parser.parse(line, 156.800000)
        
        self.assertTrue(success)
        self.assertIsInstance(result, DMAOperation)
        self.assertEqual(result.dma_function, "dma_map_page")
        self.assertEqual(result.caller_function, "gasket_perform_mapping")
        self.assertEqual(result.file_path, "/gasket-driver/src/gasket_page_table.c")
        self.assertEqual(result.line_number, 650)
        self.assertEqual(result.first_seen_timestamp, 156.800000)
    
    def test_parse_dma_stack_start(self):
        """Test parsing DMA stack start"""
        line = "[  156.801000] DMA_STACK_START: Stack trace for dma_map_page called from gasket_perform_mapping"
        success, result = self.parser.parse(line, 156.801000)
        
        self.assertTrue(success)
        self.assertEqual(result, 'stack_start')
        self.assertTrue(self.parser.collecting_stack)
        self.assertEqual(self.parser.stack_dma_function, 'dma_map_page')
    
    def test_parse_dma_stack_end(self):
        """Test parsing DMA stack end"""
        # First start collecting
        start_line = "[  156.801000] DMA_STACK_START: Stack trace for dma_map_page called from gasket_perform_mapping"
        self.parser.parse(start_line, 156.801000)
        
        # Add some stack content
        stack_line = "[  156.802000] CPU: 2 PID: 3999 Comm: classify_image"
        self.parser.parse(stack_line, 156.802000)
        
        # End stack collection
        end_line = "[  156.806000] DMA_STACK_END: End of stack trace for dma_map_page"
        success, result = self.parser.parse(end_line, 156.806000)
        
        self.assertTrue(success)
        self.assertEqual(result[0], 'stack_end')
        self.assertEqual(result[1], 'dma_map_page')
        self.assertGreater(len(result[2]), 0)  # Should have captured stack content
        self.assertFalse(self.parser.collecting_stack)
    
    def test_stack_line_collection(self):
        """Test stack line collection between markers"""
        # Start collecting
        start_line = "[  156.801000] DMA_STACK_START: Stack trace for dma_map_page called from gasket_perform_mapping"
        self.parser.parse(start_line, 156.801000)
        
        # Parse stack lines
        stack_lines = [
            "[  156.802000] CPU: 2 PID: 3999 Comm: classify_image",
            "[  156.803000] Call trace:",
            "[  156.804000] [<ffff000008089938>] dump_backtrace+0x0/0x3a8"
        ]
        
        for line in stack_lines:
            success, result = self.parser.parse(line, 156.802000)
            self.assertTrue(success)
            self.assertEqual(result[0], 'stack_line')
        
        self.assertEqual(len(self.parser.current_stack_trace), 3)


class TestUserCopyParser(unittest.TestCase):
    """Test cases for UserCopyParser"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.patterns = LogPatterns()
        self.parser = UserCopyParser(self.patterns)
    
    def test_can_parse(self):
        """Test can_parse method"""
        self.assertTrue(self.parser.can_parse("[  156.889534] USER_COPY: About to call"))
        self.assertTrue(self.parser.can_parse("[  156.903290] USER_COPY_CONTEXT: Process"))
        self.assertFalse(self.parser.can_parse("[  156.773472] FUNC_ENTRY: Entering"))
        self.assertFalse(self.parser.can_parse("Not a log line"))
    
    def test_parse_user_copy(self):
        """Test parsing user copy line"""
        line = "[  156.889534] USER_COPY: About to call copy_from_user from function apex_set_performance_expectation at /gasket-driver/src/apex_driver.c:576"
        success, result = self.parser.parse(line, 156.889534)
        
        self.assertTrue(success)
        self.assertIsInstance(result, UserCopyOperation)
        self.assertEqual(result.copy_function, "copy_from_user")
        self.assertEqual(result.caller_function, "apex_set_performance_expectation")
        self.assertEqual(result.file_path, "/gasket-driver/src/apex_driver.c")
        self.assertEqual(result.line_number, 576)
        self.assertEqual(result.first_seen_timestamp, 156.889534)
        self.assertIsNone(result.process_info)
    
    def test_parse_user_copy_context(self):
        """Test parsing user copy context line"""
        line = "[  156.903290] USER_COPY_CONTEXT: Process PID=3999, COMM=classify_image"
        success, result = self.parser.parse(line, 156.903290)
        
        self.assertTrue(success)
        self.assertIsInstance(result, ProcessInfo)
        self.assertEqual(result.pid, 3999)
        self.assertEqual(result.comm, "classify_image")
    
    def test_parse_invalid_line(self):
        """Test parsing invalid line"""
        line = "[  156.889534] Not a user copy line"
        success, result = self.parser.parse(line, 156.889534)
        
        self.assertFalse(success)
        self.assertIsNone(result)


class TestIOCTLParser(unittest.TestCase):
    """Test cases for IOCTLParser"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.patterns = LogPatterns()
        self.parser = IOCTLParser(self.patterns)
    
    def test_can_parse(self):
        """Test can_parse method"""
        self.assertTrue(self.parser.can_parse("[47.468247] IOCTL_HANDLER: Function drv_ioctl called at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:673"))
        self.assertFalse(self.parser.can_parse("[  156.773472] FUNC_ENTRY: Entering function test"))
        self.assertFalse(self.parser.can_parse("Not a log line"))
    
    def test_parse_valid_line(self):
        """Test parsing valid IOCTL handler line"""
        line = "[47.468247] IOCTL_HANDLER: Function drv_ioctl called at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:673"
        success, result = self.parser.parse(line, 47.468247)
        
        self.assertTrue(success)
        self.assertIsNotNone(result)
        
        ioctl_op = result
        self.assertIsInstance(ioctl_op, IOCTLOperation)
        self.assertEqual(ioctl_op.function_name, "drv_ioctl")
        self.assertEqual(ioctl_op.line_number, 673)
        self.assertEqual(ioctl_op.first_seen_timestamp, 47.468247)
        self.assertEqual(ioctl_op.file_path, "drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c")
    
    def test_parse_valid_line_with_different_function(self):
        """Test parsing valid IOCTL handler line with different function name"""
        line = "[50.123456] IOCTL_HANDLER: Function video_ioctl called at drivers/media/v4l2-core/v4l2-dev.c:456"
        success, result = self.parser.parse(line, 50.123456)
        
        self.assertTrue(success)
        self.assertIsNotNone(result)
        
        ioctl_op = result
        self.assertIsInstance(ioctl_op, IOCTLOperation)
        self.assertEqual(ioctl_op.function_name, "video_ioctl")
        self.assertEqual(ioctl_op.line_number, 456)
        self.assertEqual(ioctl_op.first_seen_timestamp, 50.123456)
        self.assertEqual(ioctl_op.file_path, "drivers/media/v4l2-core/v4l2-dev.c")
    
    def test_parse_invalid_line(self):
        """Test parsing invalid line"""
        line = "[  156.773472] Not an IOCTL handler line"
        success, result = self.parser.parse(line, 156.773472)
        
        self.assertFalse(success)
        self.assertIsNone(result)
    
    def test_parse_malformed_ioctl_line(self):
        """Test parsing malformed IOCTL line missing parts"""
        line = "[47.468247] IOCTL_HANDLER: Function called at"
        success, result = self.parser.parse(line, 47.468247)
        
        self.assertFalse(success)
        self.assertIsNone(result)


if __name__ == '__main__':
    unittest.main(verbosity=2)
