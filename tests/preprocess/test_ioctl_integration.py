#!/usr/bin/env python3
"""
Integration tests for IOCTL functionality
"""

import unittest
import sys
import os
import tempfile
import json
from unittest.mock import patch, MagicMock

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from src.preprocess.core.engine import KernelLogParserEngine
from src.preprocess.core.models import IOCTLOperation, ParseResults
from src.preprocess.parsers.ioctl_parser import IOCTLParser
from src.preprocess.utils.function_extractor import FunctionCodeExtractor
from src.preprocess.core.patterns import LogPatterns


class TestIOCTLIntegration(unittest.TestCase):
    """Integration tests for IOCTL parsing and function extraction"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.engine = KernelLogParserEngine()
    
    def test_ioctl_end_to_end_parsing(self):
        """Test complete IOCTL parsing workflow"""
        # Create a temporary log file with IOCTL entries
        log_content = """[   47.468247] IOCTL_HANDLER: Function drv_ioctl called at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:673
[   48.123456] FUNC_ENTRY: Entering function test_func at /test/file.c:100
[   49.789012] IOCTL_HANDLER: Function video_ioctl called at drivers/media/v4l2-core/v4l2-dev.c:456
[   50.000000] DMA_INSTRUMENT: About to call dma_map_page from function test_dma at /test/dma.c:200
"""
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(log_content)
            log_file = f.name
        
        try:
            # Parse the log file
            results = self.engine.parse_log_file(log_file)
            
            # Should have parsed IOCTL operations
            self.assertIsNotNone(results)
            self.assertIn('ioctl_operations', results)
            self.assertEqual(len(results['ioctl_operations']), 2)
            
            # Check first IOCTL operation
            ioctl1 = results['ioctl_operations'][0]
            self.assertEqual(ioctl1['function_name'], "drv_ioctl")
            self.assertEqual(ioctl1['file_path'], "drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c")
            self.assertEqual(ioctl1['line_number'], 673)
            self.assertEqual(ioctl1['first_seen_timestamp'], 47.468247)
            
            # Check second IOCTL operation
            ioctl2 = results['ioctl_operations'][1]
            self.assertEqual(ioctl2['function_name'], "video_ioctl")
            self.assertEqual(ioctl2['file_path'], "drivers/media/v4l2-core/v4l2-dev.c")
            self.assertEqual(ioctl2['line_number'], 456)
            self.assertEqual(ioctl2['first_seen_timestamp'], 49.789012)
            
            # Should also have other operations
            self.assertEqual(len(results['function_entries']), 1)
            self.assertEqual(len(results['dma_operations']), 1)
            
        finally:
            os.unlink(log_file)
    
    def test_ioctl_with_function_extraction(self):
        """Test IOCTL parsing with function code extraction"""
        # Create temporary C source file
        with tempfile.TemporaryDirectory() as temp_dir:
            drivers_dir = os.path.join(temp_dir, "drivers", "test")
            os.makedirs(drivers_dir)
            
            source_file = os.path.join(drivers_dir, "test_driver.c")
            with open(source_file, 'w') as f:
                f.write("""#include <linux/module.h>
#include <linux/fs.h>

static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    switch (cmd) {
        case 0x1000:
            return handle_cmd_1000(arg);
        case 0x2000:
            return handle_cmd_2000(arg);
        default:
            return -EINVAL;
    }
}

static int device_open(struct inode *inode, struct file *file) {
    return 0;
}
""")
            
            # Create log with IOCTL entry pointing to our source file
            log_content = f"[   50.123456] IOCTL_HANDLER: Function device_ioctl called at drivers/test/test_driver.c:4\n"
            
            with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
                f.write(log_content)
                log_file = f.name
            
            try:
                # Parse with source root path
                engine = KernelLogParserEngine(show_ui=False, source_root_path=temp_dir)
                results = engine.parse_log_file(log_file)
                
                # Should have one IOCTL operation with function code
                self.assertEqual(len(results['ioctl_operations']), 1)
                
                ioctl_op = results['ioctl_operations'][0]
                self.assertEqual(ioctl_op['function_name'], "device_ioctl")
                self.assertIsNotNone(ioctl_op['function_code'])
                self.assertIn("device_ioctl", ioctl_op['function_code'])
                self.assertIn("switch (cmd)", ioctl_op['function_code'])
                self.assertIn("return -EINVAL", ioctl_op['function_code'])
                
            finally:
                os.unlink(log_file)
    
    def test_ioctl_statistics_calculation(self):
        """Test that IOCTL operations are included in statistics"""
        log_content = """[   47.468247] IOCTL_HANDLER: Function drv_ioctl called at drivers/gpu/driver.c:100
[   48.123456] IOCTL_HANDLER: Function video_ioctl called at drivers/media/video.c:200
[   49.789012] IOCTL_HANDLER: Function drv_ioctl called at drivers/gpu/driver.c:100
[   50.000000] FUNC_ENTRY: Entering function test_func at /test/file.c:300
"""
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(log_content)
            log_file = f.name
        
        try:
            results = self.engine.parse_log_file(log_file)
            
            # Check statistics
            stats = results['statistics']
            self.assertEqual(stats['total_lines_processed'], 4)
            self.assertEqual(stats['ioctl_operations_found'], 3)  # Total IOCTL lines
            self.assertEqual(len(results['ioctl_operations']), 2)  # Unique IOCTL operations after deduplication
            
        finally:
            os.unlink(log_file)
    
    def test_ioctl_json_export(self):
        """Test IOCTL operations in JSON export"""
        log_content = "[   47.468247] IOCTL_HANDLER: Function test_ioctl called at test/driver.c:123\n"
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(log_content)
            log_file = f.name
        
        try:
            results = self.engine.parse_log_file(log_file)
            
            # Convert to dict and check JSON serialization (results is already a dict)
            json_str = json.dumps(results, indent=2)
            
            # Parse back from JSON
            parsed_data = json.loads(json_str)
            
            # Check IOCTL operations in JSON
            self.assertIn('ioctl_operations', parsed_data)
            self.assertEqual(len(parsed_data['ioctl_operations']), 1)
            
            ioctl_data = parsed_data['ioctl_operations'][0]
            self.assertEqual(ioctl_data['function_name'], "test_ioctl")
            self.assertEqual(ioctl_data['file_path'], "test/driver.c")
            self.assertEqual(ioctl_data['line_number'], 123)
            self.assertEqual(ioctl_data['first_seen_timestamp'], 47.468247)
            
        finally:
            os.unlink(log_file)
    
    def test_ioctl_mixed_with_other_operations(self):
        """Test IOCTL operations mixed with other operation types"""
        log_content = """[   10.000000] FUNC_ENTRY: Entering function init_module at /driver/init.c:50
[   11.111111] IOCTL_HANDLER: Function device_ioctl called at /driver/ioctl.c:100
[   12.222222] DMA_INSTRUMENT: About to call dma_alloc_coherent from function alloc_buffer at /driver/dma.c:200
[   13.333333] USER_COPY: About to call copy_from_user from function handle_write at /driver/io.c:300
[   14.444444] IOCTL_HANDLER: Function device_ioctl called at /driver/ioctl.c:150
"""
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(log_content)
            log_file = f.name
        
        try:
            results = self.engine.parse_log_file(log_file)
            
            # Should have all operation types
            self.assertEqual(len(results['function_entries']), 1)
            self.assertEqual(len(results['dma_operations']), 1)
            self.assertEqual(len(results['user_copy_operations']), 1)
            self.assertEqual(len(results['ioctl_operations']), 2)  # Two different line numbers
            
            # Check that IOCTL operations are correctly parsed
            ioctl_ops = results['ioctl_operations']
            self.assertEqual(len(ioctl_ops), 2)
            
            # First IOCTL operation
            self.assertEqual(ioctl_ops[0]['function_name'], "device_ioctl")
            self.assertEqual(ioctl_ops[0]['file_path'], "/driver/ioctl.c")
            self.assertEqual(ioctl_ops[0]['line_number'], 100)
            
            # Second IOCTL operation
            self.assertEqual(ioctl_ops[1]['function_name'], "device_ioctl")
            self.assertEqual(ioctl_ops[1]['file_path'], "/driver/ioctl.c")
            self.assertEqual(ioctl_ops[1]['line_number'], 150)
            
        finally:
            os.unlink(log_file)
    
    @patch('preprocess.utils.function_extractor.FunctionCodeExtractor.extract_function_at_line')
    def test_ioctl_function_extraction_failure(self, mock_extract):
        """Test IOCTL parsing when function extraction fails"""
        # Mock function extraction to return None (failure)
        mock_extract.return_value = None
        
        log_content = "[   47.468247] IOCTL_HANDLER: Function test_ioctl called at /nonexistent/file.c:123\n"
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(log_content)
            log_file = f.name
        
        try:
            # Create engine with source root path
            engine = KernelLogParserEngine(show_ui=False, source_root_path="/some/path")
            results = engine.parse_log_file(log_file)
            
            # Should still have IOCTL operation, but without function code
            self.assertEqual(len(results['ioctl_operations']), 1)
            
            ioctl_op = results['ioctl_operations'][0]
            self.assertEqual(ioctl_op['function_name'], "test_ioctl")
            self.assertIsNone(ioctl_op['function_code'])
        finally:
            os.unlink(log_file)


class TestIOCTLParserStandalone(unittest.TestCase):
    """Standalone tests for IOCTLParser"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.patterns = LogPatterns()
        self.parser = IOCTLParser(self.patterns)
    
    def test_parser_initialization(self):
        """Test IOCTLParser initialization"""
        self.assertIsNotNone(self.parser)
        self.assertIsNotNone(self.parser.patterns)
    
    def test_can_parse_method(self):
        """Test IOCTLParser can_parse method with various inputs"""
        test_cases = [
            ("[47.468247] IOCTL_HANDLER: Function drv_ioctl called at driver.c:673", True),
            ("[50.123] IOCTL_HANDLER: Function test called at test.c:1", True),
            ("[100.999] FUNC_ENTRY: Entering function test", False),
            ("[200.000] DMA_INSTRUMENT: About to call dma_function", False),
            ("Not a log line", False),
            ("", False),
        ]
        
        for line, expected in test_cases:
            with self.subTest(line=line):
                result = self.parser.can_parse(line)
                self.assertEqual(result, expected, f"Failed for line: {line}")
    
    def test_parse_method_edge_cases(self):
        """Test IOCTLParser parse method with edge cases"""
        # Test with unusual but valid function names
        test_cases = [
            "[47.1] IOCTL_HANDLER: Function _private_ioctl called at driver.c:1",
            "[47.2] IOCTL_HANDLER: Function ioctl123 called at driver.c:2",
            "[47.3] IOCTL_HANDLER: Function IOCTL_HANDLER_FUNC called at driver.c:3",
            "[47.4] IOCTL_HANDLER: Function a called at b.c:4",
        ]
        
        for line in test_cases:
            with self.subTest(line=line):
                success, result = self.parser.parse(line, 47.0)
                self.assertTrue(success, f"Should parse: {line}")
                self.assertIsNotNone(result)
                
                ioctl_op = result
                self.assertIsInstance(ioctl_op, IOCTLOperation)


if __name__ == '__main__':
    unittest.main(verbosity=2)
