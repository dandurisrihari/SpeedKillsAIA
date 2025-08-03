#!/usr/bin/env python3
"""
Test suite for pattern matching
"""

import unittest
import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from preprocess.core.patterns import LogPatterns


class TestLogPatterns(unittest.TestCase):
    """Test cases for log pattern matching"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.patterns = LogPatterns()
    
    def test_timestamp_pattern(self):
        """Test timestamp pattern matching"""
        line = "[  156.773472] FUNC_ENTRY: Entering function test"
        match = self.patterns.match_timestamp(line)
        
        self.assertIsNotNone(match)
        self.assertEqual(match.group(1), "156.773472")
    
    def test_func_entry_pattern(self):
        """Test function entry pattern matching"""
        line = "[  156.773472] FUNC_ENTRY: Entering function gasket_open at /gasket-driver/src/gasket_core.c:1229"
        match = self.patterns.search_func_entry(line)
        
        self.assertIsNotNone(match)
        self.assertEqual(match.group(1), "gasket_open")
        self.assertEqual(match.group(2), "/gasket-driver/src/gasket_core.c")
        self.assertEqual(match.group(3), "1229")
    
    def test_dma_instrument_pattern(self):
        """Test DMA instrument pattern matching"""
        line = "[  156.800000] DMA_INSTRUMENT: About to call dma_map_page from function gasket_perform_mapping at /gasket-driver/src/gasket_page_table.c:650"
        match = self.patterns.search_dma_instrument(line)
        
        self.assertIsNotNone(match)
        self.assertEqual(match.group(1), "dma_map_page")
        self.assertEqual(match.group(2), "gasket_perform_mapping")
        self.assertEqual(match.group(3), "/gasket-driver/src/gasket_page_table.c")
        self.assertEqual(match.group(4), "650")
    
    def test_dma_stack_start_pattern(self):
        """Test DMA stack start pattern matching"""
        line = "[  156.801000] DMA_STACK_START: Stack trace for dma_map_page called from gasket_perform_mapping"
        match = self.patterns.search_dma_stack_start(line)
        
        self.assertIsNotNone(match)
        self.assertEqual(match.group(1), "dma_map_page")
        self.assertEqual(match.group(2), "gasket_perform_mapping")
    
    def test_dma_stack_end_pattern(self):
        """Test DMA stack end pattern matching"""
        line = "[  156.806000] DMA_STACK_END: End of stack trace for dma_map_page"
        match = self.patterns.search_dma_stack_end(line)
        
        self.assertIsNotNone(match)
        self.assertEqual(match.group(1), "dma_map_page")
    
    def test_user_copy_pattern(self):
        """Test user copy pattern matching"""
        line = "[  156.889534] USER_COPY: About to call copy_from_user from function apex_set_performance_expectation at /gasket-driver/src/apex_driver.c:576"
        match = self.patterns.search_user_copy(line)
        
        self.assertIsNotNone(match)
        self.assertEqual(match.group(1), "copy_from_user")
        self.assertEqual(match.group(2), "apex_set_performance_expectation")
        self.assertEqual(match.group(3), "/gasket-driver/src/apex_driver.c")
        self.assertEqual(match.group(4), "576")
    
    def test_user_copy_context_pattern(self):
        """Test user copy context pattern matching"""
        line = "[  156.903290] USER_COPY_CONTEXT: Process PID=3999, COMM=classify_image"
        match = self.patterns.search_user_copy_context(line)
        
        self.assertIsNotNone(match)
        self.assertEqual(match.group(1), "3999")
        self.assertEqual(match.group(2), "classify_image")
    
    def test_get_pattern_by_name(self):
        """Test getting pattern by name"""
        pattern = self.patterns.get_pattern('timestamp')
        self.assertIsNotNone(pattern)
        
        # Test invalid pattern name
        with self.assertRaises(ValueError):
            self.patterns.get_pattern('invalid_pattern')
    
    def test_patterns_property(self):
        """Test patterns property returns copy"""
        patterns_dict = self.patterns.patterns
        self.assertIsInstance(patterns_dict, dict)
        self.assertIn('timestamp', patterns_dict)
        self.assertIn('func_entry', patterns_dict)
    
    def test_invalid_lines(self):
        """Test patterns with invalid lines"""
        invalid_lines = [
            "This is not a kernel log line",
            "[invalid] timestamp format",
            "FUNC_ENTRY: Invalid format",
            "DMA_INSTRUMENT: Missing parts"
        ]
        
        for line in invalid_lines:
            self.assertIsNone(self.patterns.search_func_entry(line))
            self.assertIsNone(self.patterns.search_dma_instrument(line))
            self.assertIsNone(self.patterns.search_user_copy(line))
            self.assertIsNone(self.patterns.search_ioctl_handler(line))
    
    def test_ioctl_handler_pattern(self):
        """Test IOCTL handler pattern matching"""
        line = "[47.468247] IOCTL_HANDLER: Function drv_ioctl called at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:673"
        match = self.patterns.search_ioctl_handler(line)
        
        self.assertIsNotNone(match)
        self.assertEqual(match.group(1), "drv_ioctl")
        self.assertEqual(match.group(2), "drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c")
        self.assertEqual(match.group(3), "673")
    
    def test_ioctl_handler_pattern_variations(self):
        """Test IOCTL handler pattern with different function names"""
        test_cases = [
            ("[50.123] IOCTL_HANDLER: Function video_ioctl called at drivers/media/v4l2-core/v4l2-dev.c:456", 
             "video_ioctl", "drivers/media/v4l2-core/v4l2-dev.c", "456"),
            ("[100.500] IOCTL_HANDLER: Function test_ioctl_handler called at test/driver.c:123", 
             "test_ioctl_handler", "test/driver.c", "123"),
            ("[0.001] IOCTL_HANDLER: Function my_ioctl called at /absolute/path/driver.c:1", 
             "my_ioctl", "/absolute/path/driver.c", "1")
        ]
        
        for line, expected_func, expected_file, expected_line in test_cases:
            match = self.patterns.search_ioctl_handler(line)
            self.assertIsNotNone(match, f"Failed to match: {line}")
            self.assertEqual(match.group(1), expected_func)
            self.assertEqual(match.group(2), expected_file)
            self.assertEqual(match.group(3), expected_line)
    
    def test_ioctl_handler_invalid_patterns(self):
        """Test IOCTL handler pattern with invalid lines"""
        invalid_lines = [
            "[47.468247] FUNC_ENTRY: Entering function test",
            "[47.468247] DMA_INSTRUMENT: About to call dma_function",
            "[47.468247] IOCTL_HANDLER: Missing function name",
            "[47.468247] IOCTL_HANDLER: Function called at",
            "Not a log line at all"
        ]
        
        for line in invalid_lines:
            self.assertIsNone(self.patterns.search_ioctl_handler(line), f"Should not match: {line}")


if __name__ == '__main__':
    unittest.main(verbosity=2)
