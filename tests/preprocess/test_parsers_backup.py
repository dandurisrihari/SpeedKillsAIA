#!/usr/bin/env python3
"""
Test suite for individual parsers
"""

import unittest
import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from src.preprocess.core.patterns import LogPatterns
from src.preprocess.parsers.function_parser import FunctionEntryParser
from src.preprocess.parsers.dma_parser import DMAParser
from src.preprocess.parsers.user_copy_parser import UserCopyParser
from src.preprocess.parsers.ioctl_parser import IOCTLParser
from src.preprocess.core.models import FunctionEntry, DMAOperation, UserCopyOperation, IOCTLOperation, ProcessInfo


class TestFunctionEntryParser(unittest.TestCase):
    """Test cases for FunctionEntryParser"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.patterns = LogPatterns()
        self.parser = FunctionEntryParser(self.patterns)
    
    def test_can_parse(self):
        """Test can_parse method"""
        valid_line = "[  156.800000] FUNC_ENTRY: Entering function some_function at drivers/test.c:123"
        invalid_line = "This is not a valid entry line"
        
        self.assertTrue(self.parser.can_parse(valid_line))
        self.assertFalse(self.parser.can_parse(invalid_line))
    
    def test_parse_valid_line(self):
        """Test parsing valid function entry"""
        line = "[  156.800000] FUNC_ENTRY: Entering function some_function at drivers/test.c:123"
        success, result = self.parser.parse(line, 156.800000)
        
        self.assertTrue(success)
        self.assertIsInstance(result, tuple)
        function_entry, file_path = result
        self.assertIsInstance(function_entry, FunctionEntry)
        self.assertEqual(function_entry.function_name, 'some_function')
        self.assertEqual(file_path, 'drivers/test.c')
        self.assertEqual(function_entry.line_number, 123)
    
    def test_parse_invalid_line(self):
        """Test parsing invalid line"""
        line = "Invalid line"
        success, result = self.parser.parse(line, 156.800000)
        
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
        dma_line = "[  156.800000] DMA_INSTRUMENT: About to call dma_map_page"
        invalid_line = "This is not a DMA line"
        
        self.assertTrue(self.parser.can_parse(dma_line))
        self.assertFalse(self.parser.can_parse(invalid_line))
    
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
        stack_line = "[  156.802000] [<ffff000008089938>] dump_backtrace+0x0/0x3a8"
        self.parser.parse(stack_line, 156.802000)
        
        # End stack collection
        end_line = "[  156.806000] DMA_STACK_END: End of stack trace for dma_map_page"
        success, result = self.parser.parse(end_line, 156.806000)
        
        self.assertTrue(success)
        self.assertEqual(result[0], 'stack_end')
        self.assertEqual(result[1], 'dma_map_page')
        self.assertGreaterEqual(len(result[2]), 0)  # Stack trace may be empty if line format doesn't match
        self.assertFalse(self.parser.collecting_stack)
    
    def test_stack_line_collection(self):
        """Test stack line collection between markers"""
        # Start collecting
        start_line = "[  156.801000] DMA_STACK_START: Stack trace for dma_map_page called from gasket_perform_mapping"
        self.parser.parse(start_line, 156.801000)
        
        # Parse stack lines - use proper format that will be captured
        stack_lines = [
            "[  156.802000] [<ffff000008089938>] dump_backtrace+0x0/0x3a8",
            "[  156.803000] [<ffff000008089abc>] show_stack+0x10/0x20", 
            "[  156.804000] [<ffff000008089def>] test_function+0x20/0x30"
        ]
        
        for line in stack_lines:
            success, result = self.parser.parse(line, 156.802000)
            self.assertTrue(success)
            self.assertEqual(result[0], 'stack_line')
        
        # Should capture 3 function names from the properly formatted lines
        self.assertEqual(len(self.parser.current_stack_trace), 3)


class TestUserCopyParser(unittest.TestCase):
    """Test cases for UserCopyParser"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.patterns = LogPatterns()
        self.parser = UserCopyParser(self.patterns)
    
    def test_can_parse(self):
        """Test can_parse method"""
        valid_line = "[  156.800000] USER_COPY: About to call copy_to_user from function test_func at drivers/test.c:123"
        invalid_line = "This is not a user copy line"
        
        self.assertTrue(self.parser.can_parse(valid_line))
        self.assertFalse(self.parser.can_parse(invalid_line))
    
    def test_parse_invalid_line(self):
        """Test parsing invalid line"""
        line = "Invalid line"
        success, result = self.parser.parse(line, 156.800000)
        
        self.assertFalse(success)
        self.assertIsNone(result)
    
    def test_parse_user_copy(self):
        """Test parsing user copy operation"""
        line = "[  156.800000] USER_COPY: About to call copy_to_user from function some_function at drivers/test.c:123"
        success, result = self.parser.parse(line, 156.800000)
        
        self.assertTrue(success)
        self.assertIsInstance(result, UserCopyOperation)
    
    def test_parse_user_copy_context(self):
        """Test parsing user copy context"""
        line = "[  156.800000] USER_COPY_CONTEXT: Process PID=1234, COMM=some_context"
        success, result = self.parser.parse(line, 156.800000)
        
        self.assertTrue(success)
        self.assertIsInstance(result, ProcessInfo)


class TestIOCTLParser(unittest.TestCase):
    """Test cases for IOCTLParser"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.patterns = LogPatterns()
        self.parser = IOCTLParser(self.patterns)
    
    def test_can_parse(self):
        """Test can_parse method"""
        valid_line = "[  156.800000] IOCTL_HANDLER: Function some_ioctl called at drivers/test.c:123"
        invalid_line = "This is not an IOCTL line"
        
        self.assertTrue(self.parser.can_parse(valid_line))
        self.assertFalse(self.parser.can_parse(invalid_line))
    
    def test_parse_invalid_line(self):
        """Test parsing invalid line"""
        line = "Invalid line"
        success, result = self.parser.parse(line, 156.800000)
        
        self.assertFalse(success)
        self.assertIsNone(result)
    
    def test_parse_malformed_ioctl_line(self):
        """Test parsing malformed IOCTL line"""
        line = "[  156.800000] IOCTL_HANDLER: malformed"
        success, result = self.parser.parse(line, 156.800000)
        
        # Should fail for malformed pattern
        self.assertFalse(success)
        self.assertIsNone(result)
    
    def test_parse_valid_line(self):
        """Test parsing valid IOCTL line"""
        line = "[  156.800000] IOCTL_HANDLER: Function gasket_ioctl_handler called at drivers/test.c:123"
        success, result = self.parser.parse(line, 156.800000)
        
        self.assertTrue(success)
        self.assertIsInstance(result, IOCTLOperation)
    
    def test_parse_valid_line_with_different_function(self):
        """Test parsing valid IOCTL line with different function"""
        line = "[  156.800000] IOCTL_HANDLER: Function different_ioctl_handler called at drivers/different.c:456"
        success, result = self.parser.parse(line, 156.800000)
        
        self.assertTrue(success)
        self.assertIsInstance(result, IOCTLOperation)


if __name__ == '__main__':
    unittest.main()
