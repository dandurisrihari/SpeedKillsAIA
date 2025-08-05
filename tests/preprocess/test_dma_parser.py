#!/usr/bin/env python3
"""
Tests for DMA parser with different log formats and timestamp parsing
"""

import unittest
from src.preprocess.parsers.dma_parser import DMAParser
from src.preprocess.core.patterns import LogPatterns
from src.preprocess.core.models import DMAOperation


class TestDMAParser(unittest.TestCase):
    """Test DMA parser functionality"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.patterns = LogPatterns()
        self.parser = DMAParser(self.patterns)
    
    def test_can_parse_dma_markers(self):
        """Test that parser can identify DMA-related lines"""
        test_cases = [
            ("[    5.011096] DMA_INSTRUMENT: About to call dma_alloc_coherent from function rproc_alloc_carveout", True),
            ("[    5.011099] DMA_STACK_START: Stack trace for dma_alloc_coherent called from rproc_alloc_carveout", True),
            ("[    5.011483] DMA_STACK_END: End of stack trace for dma_alloc_coherent", True),
            ("2025-08-05T19:04:36,338434+00:00 DMA_INSTRUMENT: About to call dma_alloc_coherent", True),
            ("[    5.011113]  dump_backtrace.part.0+0xdc/0xf0", False),  # Should be False when not collecting
            ("[    5.011113] Some random log message", False),
        ]
        
        for line, expected in test_cases:
            with self.subTest(line=line):
                self.assertEqual(self.parser.can_parse(line), expected)
    
    def test_parse_dma_instrument_ti_format(self):
        """Test parsing DMA_INSTRUMENT lines in TI format"""
        line = "[    5.011096] DMA_INSTRUMENT: About to call dma_alloc_coherent from function rproc_alloc_carveout at drivers/remoteproc/remoteproc_core.c:709"
        timestamp_data = ("5.011096", 5.011096)
        
        success, result = self.parser.parse(line, timestamp_data)
        
        self.assertTrue(success)
        self.assertIsInstance(result, DMAOperation)
        self.assertEqual(result.dma_function, "dma_alloc_coherent")
        self.assertEqual(result.caller_function, "rproc_alloc_carveout")
        self.assertEqual(result.file_path, "drivers/remoteproc/remoteproc_core.c")
        self.assertEqual(result.line_number, 709)
        self.assertEqual(result.first_seen_timestamp, 5.011096)
    
    def test_parse_dma_instrument_iso_format(self):
        """Test parsing DMA_INSTRUMENT lines in ISO format"""
        line = "2025-08-05T19:04:36,338434+00:00 DMA_INSTRUMENT: About to call dma_alloc_coherent from function rproc_alloc_carveout at drivers/remoteproc/remoteproc_core.c:709"
        timestamp_data = ("19:04:36,338434", 1754251476.338434)
        
        success, result = self.parser.parse(line, timestamp_data)
        
        self.assertTrue(success)
        self.assertIsInstance(result, DMAOperation)
        self.assertEqual(result.dma_function, "dma_alloc_coherent")
        self.assertEqual(result.caller_function, "rproc_alloc_carveout")
    
    def test_stack_trace_collection_ti_format(self):
        """Test complete stack trace collection for TI boot format"""
        test_lines = [
            ("[    5.011099] DMA_STACK_START: Stack trace for dma_alloc_coherent called from rproc_alloc_carveout", ("5.011099", 5.011099)),
            ("[    5.011113]  dump_backtrace.part.0+0xdc/0xf0", ("5.011113", 5.011113)),
            ("[    5.011129]  show_stack+0x18/0x30", ("5.011129", 5.011129)),
            ("[    5.011133]  dump_stack_lvl+0x68/0x84", ("5.011133", 5.011133)),
            ("[    5.011144]  rproc_alloc_carveout+0x90/0x278", ("5.011144", 5.011144)),
            ("[    5.011148]  rproc_alloc_registered_carveouts+0x78/0x128", ("5.011148", 5.011148)),
            ("[    5.011483] DMA_STACK_END: End of stack trace for dma_alloc_coherent", ("5.011483", 5.011483)),
        ]
        
        expected_stack = [
            "dump_backtrace",
            "show_stack", 
            "dump_stack_lvl",
            "rproc_alloc_carveout",
            "rproc_alloc_registered_carveouts"
        ]
        
        # Process all lines
        for line, timestamp_data in test_lines:
            success, result = self.parser.parse(line, timestamp_data)
            self.assertTrue(success, f"Failed to parse: {line}")
        
        # Check that we collected the stack correctly
        self.assertEqual(len(self.parser.current_stack_trace), len(expected_stack))
        self.assertEqual(self.parser.current_stack_trace, expected_stack)
        self.assertFalse(self.parser.collecting_stack)  # Should be reset after END
    
    def test_stack_trace_collection_iso_format(self):
        """Test stack trace collection for ISO timestamp format"""
        test_lines = [
            ("2025-08-05 12:27:38.582859+00:00 DMA_STACK_START: Stack trace for dma_alloc_coherent called from rproc_alloc_carveout", ("12:27:38.582859", 1754251658.582859)),
            ("2025-08-05 12:27:38.583000+00:00  dump_backtrace+0x90/0xe8", ("12:27:38.583000", 1754251658.583000)),
            ("2025-08-05 12:27:38.583100+00:00  show_stack+0x18/0x30", ("12:27:38.583100", 1754251658.583100)),
            ("2025-08-05 12:27:38.583200+00:00 DMA_STACK_END: End of stack trace for dma_alloc_coherent", ("12:27:38.583200", 1754251658.583200)),
        ]
        
        expected_stack = ["dump_backtrace", "show_stack"]
        
        # Reset parser state
        self.parser.collecting_stack = False
        self.parser.current_stack_trace = []
        
        # Process all lines
        for line, timestamp_data in test_lines:
            success, result = self.parser.parse(line, timestamp_data)
            self.assertTrue(success, f"Failed to parse: {line}")
        
        # Check final stack trace result (from stack_end tuple)
        success, result = self.parser.parse(test_lines[-1][0], test_lines[-1][1])
        self.assertTrue(success)
        self.assertIsInstance(result, tuple)
        self.assertEqual(result[0], 'stack_end')
        self.assertEqual(result[1], 'dma_alloc_coherent')
        self.assertEqual(result[2], expected_stack)
    
    def test_stack_trace_collection_coral_format(self):
        """Test stack trace collection for Coral format with address brackets"""
        test_lines = [
            ("2025-08-05 12:27:38.582859+00:00 DMA_STACK_START: Stack trace for dma_alloc_coherent called from carveout_dma_heap_allocate", ("12:27:38.582859", 1754251658.582859)),
            ("2025-08-05 12:27:38.583000+00:00 [<ffff000008089938>] dump_backtrace+0x0/0x3a8", ("12:27:38.583000", 1754251658.583000)),
            ("2025-08-05 12:27:38.583100+00:00 [<ffff000008089cf4>] show_stack+0x14/0x20", ("12:27:38.583100", 1754251658.583100)),
            ("2025-08-05 12:27:38.583200+00:00 DMA_STACK_END: End of stack trace for dma_alloc_coherent", ("12:27:38.583200", 1754251658.583200)),
        ]
        
        expected_stack = ["dump_backtrace", "show_stack"]
        
        # Reset parser state
        self.parser.collecting_stack = False
        self.parser.current_stack_trace = []
        
        # Process all lines
        for line, timestamp_data in test_lines:
            success, result = self.parser.parse(line, timestamp_data)
            self.assertTrue(success, f"Failed to parse: {line}")
        
        # Check final stack trace result
        success, result = self.parser.parse(test_lines[-1][0], test_lines[-1][1])
        self.assertTrue(success)
        self.assertIsInstance(result, tuple)
        self.assertEqual(result[2], expected_stack)
    
    def test_ti_part_suffix_handling(self):
        """Test that TI .part.0 suffixes are properly stripped"""
        line = "[    5.011113]  dump_backtrace.part.0+0xdc/0xf0"
        timestamp_data = ("5.011113", 5.011113)
        
        # Start collecting stack first
        self.parser.collecting_stack = True
        self.parser.current_stack_trace = []
        
        success, result = self.parser.parse(line, timestamp_data)
        
        self.assertTrue(success)
        self.assertEqual(len(self.parser.current_stack_trace), 1)
        self.assertEqual(self.parser.current_stack_trace[0], "dump_backtrace")  # .part.0 should be stripped
    
    def test_stack_collection_state_management(self):
        """Test that stack collection state is properly managed"""
        start_line = "[    5.011099] DMA_STACK_START: Stack trace for dma_alloc_coherent called from rproc_alloc_carveout"
        end_line = "[    5.011483] DMA_STACK_END: End of stack trace for dma_alloc_coherent"
        
        # Initially not collecting
        self.assertFalse(self.parser.collecting_stack)
        
        # After START, should be collecting
        success, result = self.parser.parse(start_line, ("5.011099", 5.011099))
        self.assertTrue(success)
        self.assertEqual(result, 'stack_start')
        self.assertTrue(self.parser.collecting_stack)
        self.assertEqual(self.parser.stack_dma_function, 'dma_alloc_coherent')
        
        # After END, should stop collecting
        success, result = self.parser.parse(end_line, ("5.011483", 5.011483))
        self.assertTrue(success)
        self.assertIsInstance(result, tuple)
        self.assertEqual(result[0], 'stack_end')
        self.assertFalse(self.parser.collecting_stack)
    
    def test_reset_stack_collection(self):
        """Test reset functionality"""
        # Set up some state
        self.parser.collecting_stack = True
        self.parser.current_stack_trace = ["func1", "func2"]
        self.parser.stack_dma_function = "test_function"
        
        # Reset
        self.parser.reset_stack_collection()
        
        # Verify everything is reset
        self.assertFalse(self.parser.collecting_stack)
        self.assertEqual(self.parser.current_stack_trace, [])
        self.assertIsNone(self.parser.stack_dma_function)
    
    def test_invalid_lines_handling(self):
        """Test handling of invalid or non-DMA lines"""
        invalid_lines = [
            "[    5.011000] Some random kernel message",
            "Not a timestamp line at all",
            "[    5.011000] INVALID_MARKER: This shouldn't parse",
            "",  # Empty line
        ]
        
        for line in invalid_lines:
            with self.subTest(line=line):
                success, result = self.parser.parse(line, ("5.011000", 5.011000))
                self.assertFalse(success)
                self.assertIsNone(result)


if __name__ == '__main__':
    unittest.main()
