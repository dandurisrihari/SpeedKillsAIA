#!/usr/bin/env python3
"""
Tests for timestamp parsing across different log formats
"""

import unittest
from src.preprocess.core.patterns import LogPatterns
from src.preprocess.parsers.dma_parser import DMAParser


class TestTimestampParsing(unittest.TestCase):
    """Test timestamp parsing functionality"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.patterns = LogPatterns()
        # Use DMAParser instead of BaseParser since BaseParser is abstract
        self.parser = DMAParser(self.patterns)
    
    def test_ti_boot_timestamp_format(self):
        """Test TI boot log timestamp format [    5.011096]"""
        test_cases = [
            "[    5.011096] DMA_INSTRUMENT: message",
            "[5.011096] DMA_INSTRUMENT: message",
            "[   10.123456] DMA_INSTRUMENT: message",
            "[  123.456789] DMA_INSTRUMENT: message",
        ]
        
        for line in test_cases:
            with self.subTest(line=line):
                timestamp_data = self.parser.extract_timestamp(line)
                self.assertIsNotNone(timestamp_data, f"Failed to parse timestamp from: {line}")
                self.assertIsInstance(timestamp_data, tuple)
                self.assertEqual(len(timestamp_data), 2)
                
                time_str, numeric_time = timestamp_data
                self.assertIsInstance(time_str, str)
                self.assertIsInstance(numeric_time, float)
                
                # Verify the numeric value is correct
                expected_time = float(line.split(']')[0].strip('[').strip())
                self.assertEqual(numeric_time, expected_time)
    
    def test_iso_timestamp_format(self):
        """Test ISO 8601 timestamp format"""
        test_cases = [
            ("2025-08-05T19:04:36,338434+00:00 DMA_INSTRUMENT: message", "19:04:36,338434"),
            ("2025-08-05T12:27:38.582859+00:00 DMA_INSTRUMENT: message", "12:27:38.582859"),
            ("2025-08-03T19:04:36,338434-05:00 DMA_INSTRUMENT: message", "19:04:36,338434"),
        ]
        
        for line, expected_time_str in test_cases:
            with self.subTest(line=line):
                timestamp_data = self.parser.extract_timestamp(line)
                self.assertIsNotNone(timestamp_data, f"Failed to parse timestamp from: {line}")
                self.assertIsInstance(timestamp_data, tuple)
                
                time_str, numeric_time = timestamp_data
                self.assertEqual(time_str, expected_time_str)
                self.assertIsInstance(numeric_time, float)
    
    def test_invalid_timestamp_formats(self):
        """Test that invalid timestamp formats return None"""
        invalid_lines = [
            "No timestamp here",
            "DMA_INSTRUMENT: missing timestamp",
            "[invalid] DMA_INSTRUMENT: message",
            "[abc.def] DMA_INSTRUMENT: message",
            "",  # Empty line
        ]
        
        for line in invalid_lines:
            with self.subTest(line=line):
                timestamp_data = self.parser.extract_timestamp(line)
                self.assertIsNone(timestamp_data, f"Should not parse timestamp from: {line}")
    
    def test_timestamp_pattern_regex(self):
        """Test the underlying regex pattern directly"""
        pattern = self.patterns.get_pattern('timestamp')
        
        # Test TI boot format
        ti_matches = [
            "[    5.011096] message",
            "[5.011096] message", 
            "[  123.456789] message",
        ]
        
        for line in ti_matches:
            with self.subTest(line=line):
                match = pattern.match(line)
                self.assertIsNotNone(match, f"Pattern should match: {line}")
                self.assertIsNotNone(match.group(1), "Should capture TI timestamp")
                self.assertIsNone(match.group(2), "Should not capture ISO timestamp")
        
        # Test ISO format
        iso_matches = [
            "2025-08-05T19:04:36,338434+00:00 message",
            "2025-08-05T12:27:38.582859+00:00 message",
        ]
        
        for line in iso_matches:
            with self.subTest(line=line):
                match = pattern.match(line)
                self.assertIsNotNone(match, f"Pattern should match: {line}")
                self.assertIsNone(match.group(1), "Should not capture TI timestamp") 
                self.assertIsNotNone(match.group(2), "Should capture ISO timestamp")


class TestTimestampIntegration(unittest.TestCase):
    """Test timestamp parsing integration with parsers"""
    
    def setUp(self):
        """Set up test fixtures"""
        from src.preprocess.parsers.dma_parser import DMAParser
        from src.preprocess.parsers.function_parser import FunctionEntryParser
        
        self.patterns = LogPatterns()
        self.dma_parser = DMAParser(self.patterns)
        self.function_parser = FunctionEntryParser(self.patterns)
    
    def test_dma_parser_with_ti_timestamps(self):
        """Test DMA parser works with TI boot timestamps"""
        lines = [
            "[    5.011096] DMA_INSTRUMENT: About to call dma_alloc_coherent from function rproc_alloc_carveout at drivers/remoteproc/remoteproc_core.c:709",
            "[    5.011099] DMA_STACK_START: Stack trace for dma_alloc_coherent called from rproc_alloc_carveout",
            "[    5.011113]  dump_backtrace.part.0+0xdc/0xf0",
            "[    5.011483] DMA_STACK_END: End of stack trace for dma_alloc_coherent"
        ]
        
        results = []
        for line in lines:
            timestamp_data = self.function_parser.extract_timestamp(line)
            if timestamp_data and self.dma_parser.can_parse(line):
                success, result = self.dma_parser.parse(line, timestamp_data)
                if success:
                    results.append(result)
        
        # Should have parsed all lines successfully
        self.assertEqual(len(results), 4)
        
        # First result should be DMAOperation
        from src.preprocess.core.models import DMAOperation
        self.assertIsInstance(results[0], DMAOperation)
        self.assertEqual(results[0].dma_function, "dma_alloc_coherent")
        
        # Second result should be stack_start
        self.assertEqual(results[1], 'stack_start')
        
        # Third result should be stack_line
        self.assertIsInstance(results[2], tuple)
        self.assertEqual(results[2][0], 'stack_line')
        
        # Fourth result should be stack_end with trace
        self.assertIsInstance(results[3], tuple)
        self.assertEqual(results[3][0], 'stack_end')
        self.assertEqual(results[3][1], 'dma_alloc_coherent')
        self.assertEqual(results[3][2], ['dump_backtrace'])  # Should have stripped .part.0
    
    def test_dma_parser_with_iso_timestamps(self):
        """Test DMA parser works with ISO timestamps"""
        lines = [
            "2025-08-05T19:04:36,338434+00:00 DMA_INSTRUMENT: About to call dma_alloc_coherent from function carveout_dma_heap_allocate at drivers/dma-heap/cma_heap.c:123",
            "2025-08-05T19:04:36,338500+00:00 DMA_STACK_START: Stack trace for dma_alloc_coherent called from carveout_dma_heap_allocate",
            "2025-08-05T19:04:36,338600+00:00  dump_backtrace+0x90/0xe8",
            "2025-08-05T19:04:36,338700+00:00 DMA_STACK_END: End of stack trace for dma_alloc_coherent"
        ]
        
        results = []
        for line in lines:
            timestamp_data = self.function_parser.extract_timestamp(line)
            if timestamp_data and self.dma_parser.can_parse(line):
                success, result = self.dma_parser.parse(line, timestamp_data)
                if success:
                    results.append(result)
        
        # Should have parsed all lines successfully
        self.assertEqual(len(results), 4)
        
        # Check that timestamps are properly extracted
        from src.preprocess.core.models import DMAOperation
        dma_op = results[0]
        self.assertIsInstance(dma_op, DMAOperation)
        self.assertEqual(dma_op.first_seen_time_str, "19:04:36,338434")
        # Check that we get a reasonable timestamp (don't hardcode the exact value)
        self.assertIsInstance(dma_op.first_seen_timestamp, float)
        self.assertGreater(dma_op.first_seen_timestamp, 1000000000)  # Should be a valid epoch timestamp


if __name__ == '__main__':
    unittest.main()
