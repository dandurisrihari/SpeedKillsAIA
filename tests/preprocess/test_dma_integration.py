#!/usr/bin/env python3
"""
Integration tests for DMA parsing with different log formats
Tests the complete parsing pipeline from log files to JSON output
"""

import unittest
import tempfile
import json
import os
from src.preprocess.core.engine import KernelLogParserEngine


def parse_log_file(log_file_path):
    """Wrapper function for testing"""
    engine = KernelLogParserEngine(show_ui=False)
    return engine.parse_log_file(log_file_path)


class TestDMAParsingIntegration(unittest.TestCase):
    """Test complete DMA parsing pipeline"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.temp_dir = tempfile.mkdtemp()
    
    def tearDown(self):
        """Clean up test fixtures"""
        import shutil
        shutil.rmtree(self.temp_dir)
    
    def create_test_log(self, content, filename="test.log"):
        """Helper to create a temporary log file"""
        log_path = os.path.join(self.temp_dir, filename)
        with open(log_path, 'w') as f:
            f.write(content)
        return log_path
    
    def test_ti_boot_log_parsing(self):
        """Test parsing TI boot log format with stack traces"""
        ti_boot_content = """[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd081]
[    5.011096] DMA_INSTRUMENT: About to call dma_alloc_coherent from function rproc_alloc_carveout at drivers/remoteproc/remoteproc_core.c:709
[    5.011099] DMA_STACK_START: Stack trace for dma_alloc_coherent called from rproc_alloc_carveout
[    5.011103] CPU: 1 PID: 195 Comm: systemd-udevd Not tainted 6.1.80-dirty #34
[    5.011108] Hardware name: Texas Instruments J721E SK (DT)
[    5.011110] Call trace:
[    5.011113]  dump_backtrace.part.0+0xdc/0xf0
[    5.011129]  show_stack+0x18/0x30
[    5.011133]  dump_stack_lvl+0x68/0x84
[    5.011140]  dump_stack+0x18/0x34
[    5.011144]  rproc_alloc_carveout+0x90/0x278
[    5.011148]  rproc_alloc_registered_carveouts+0x78/0x128
[    5.011152]  rproc_boot+0x2a0/0x550
[    5.011483] DMA_STACK_END: End of stack trace for dma_alloc_coherent
[    5.341102] DMA_INSTRUMENT: About to call dma_alloc_coherent from function rpmsg_probe at drivers/rpmsg/virtio_rpmsg_bus.c:941
[    5.353864] DMA_STACK_START: Stack trace for dma_alloc_coherent called from rpmsg_probe
[    5.354000]  dump_backtrace.part.0+0xdc/0xf0
[    5.354100]  show_stack+0x18/0x30
[    5.504066] DMA_STACK_END: End of stack trace for dma_alloc_coherent
"""
        
        log_path = self.create_test_log(ti_boot_content, "ti_boot.log")
        result = parse_log_file(log_path)
        
        # Should have parsed DMA operations
        self.assertIn('dma_operations', result)
        dma_ops = result['dma_operations']
        self.assertEqual(len(dma_ops), 2, "Should find 2 DMA operations")
        
        # Check first DMA operation
        dma1 = dma_ops[0]
        self.assertEqual(dma1['dma_function'], 'dma_alloc_coherent')
        self.assertEqual(dma1['caller_function'], 'rproc_alloc_carveout')
        self.assertEqual(dma1['file_path'], 'drivers/remoteproc/remoteproc_core.c')
        self.assertEqual(dma1['line_number'], 709)
        
        # Check stack trace for first operation
        self.assertIn('stack_trace', dma1)
        stack1 = dma1['stack_trace']
        expected_stack1 = [
            'dump_backtrace',  # .part.0 should be stripped
            'show_stack',
            'dump_stack_lvl', 
            'dump_stack',
            'rproc_alloc_carveout',
            'rproc_alloc_registered_carveouts',
            'rproc_boot'
        ]
        self.assertEqual(stack1, expected_stack1)
        
        # Check second DMA operation has different caller and shorter stack trace
        dma2 = dma_ops[1]
        self.assertEqual(dma2['dma_function'], 'dma_alloc_coherent')
        self.assertEqual(dma2['caller_function'], 'rpmsg_probe')  # Different caller
        stack2 = dma2['stack_trace']
        expected_stack2 = ['dump_backtrace', 'show_stack']
        self.assertEqual(stack2, expected_stack2)
    
    def test_iso_timestamp_log_parsing(self):
        """Test parsing log with ISO timestamps"""
        iso_content = """2025-08-05T19:04:36,338434+00:00 Starting kernel log analysis
2025-08-05T19:04:36,338500+00:00 DMA_INSTRUMENT: About to call dma_alloc_coherent from function carveout_dma_heap_allocate at drivers/dma-heap/cma_heap.c:123
2025-08-05T19:04:36,338600+00:00 DMA_STACK_START: Stack trace for dma_alloc_coherent called from carveout_dma_heap_allocate
2025-08-05T19:04:36,338700+00:00  dump_backtrace+0x90/0xe8
2025-08-05T19:04:36,338800+00:00  show_stack+0x18/0x30
2025-08-05T19:04:36,338900+00:00  carveout_dma_heap_allocate+0x50/0x100
2025-08-05T19:04:36,339000+00:00 DMA_STACK_END: End of stack trace for dma_alloc_coherent
"""
        
        log_path = self.create_test_log(iso_content, "iso_format.log")
        result = parse_log_file(log_path)
        
        # Should have parsed DMA operations
        self.assertIn('dma_operations', result)
        dma_ops = result['dma_operations']
        self.assertEqual(len(dma_ops), 1)
        
        # Check DMA operation
        dma = dma_ops[0]
        self.assertEqual(dma['dma_function'], 'dma_alloc_coherent')
        self.assertEqual(dma['caller_function'], 'carveout_dma_heap_allocate')
        self.assertEqual(dma['file_path'], 'drivers/dma-heap/cma_heap.c')
        self.assertEqual(dma['line_number'], 123)
        
        # Check timestamp format
        self.assertEqual(dma['first_seen_time_str'], '19:04:36,338500')
        
        # Check stack trace
        expected_stack = [
            'dump_backtrace',
            'show_stack', 
            'carveout_dma_heap_allocate'
        ]
        self.assertEqual(dma['stack_trace'], expected_stack)
    
    def test_coral_format_log_parsing(self):
        """Test parsing Coral format with address brackets"""
        coral_content = """2025-08-05T19:04:36,338434+00:00 Starting Coral analysis
2025-08-05T19:04:36,338500+00:00 DMA_INSTRUMENT: About to call dma_alloc_coherent from function carveout_dma_heap_allocate at drivers/dma-heap/cma_heap.c:45
2025-08-05T19:04:36,338600+00:00 DMA_STACK_START: Stack trace for dma_alloc_coherent called from carveout_dma_heap_allocate
2025-08-05T19:04:36,338700+00:00 [<ffff000008089938>] dump_backtrace+0x0/0x3a8
2025-08-05T19:04:36,338800+00:00 [<ffff000008089cf4>] show_stack+0x14/0x20
2025-08-05T19:04:36,338900+00:00 [<ffff000008089d18>] dump_stack_lvl+0x68/0x84
2025-08-05T19:04:36,339000+00:00 [<ffff000008089d3c>] dump_stack+0x18/0x34
2025-08-05T19:04:36,339100+00:00 [<ffff00000851b2a4>] carveout_dma_heap_allocate+0x50/0x100
2025-08-05T19:04:36,339200+00:00 DMA_STACK_END: End of stack trace for dma_alloc_coherent
"""
        
        log_path = self.create_test_log(coral_content, "coral_format.log")
        result = parse_log_file(log_path)
        
        # Should have parsed DMA operations
        self.assertIn('dma_operations', result)
        dma_ops = result['dma_operations']
        self.assertEqual(len(dma_ops), 1)
        
        # Check DMA operation
        dma = dma_ops[0]
        self.assertEqual(dma['dma_function'], 'dma_alloc_coherent')
        self.assertEqual(dma['caller_function'], 'carveout_dma_heap_allocate')
        
        # Check Coral-specific stack trace format is parsed correctly
        expected_stack = [
            'dump_backtrace',
            'show_stack',
            'dump_stack_lvl',
            'dump_stack',
            'carveout_dma_heap_allocate'
        ]
        self.assertEqual(dma['stack_trace'], expected_stack)
    
    def test_mixed_format_log_parsing(self):
        """Test parsing log with mixed timestamp formats"""
        mixed_content = """[    5.011096] DMA_INSTRUMENT: About to call dma_alloc_coherent from function rproc_alloc_carveout at drivers/remoteproc/remoteproc_core.c:709
[    5.011099] DMA_STACK_START: Stack trace for dma_alloc_coherent called from rproc_alloc_carveout
[    5.011113]  dump_backtrace.part.0+0xdc/0xf0
[    5.011483] DMA_STACK_END: End of stack trace for dma_alloc_coherent
2025-08-05T19:04:36,338500+00:00 DMA_INSTRUMENT: About to call dma_alloc_coherent from function carveout_dma_heap_allocate at drivers/dma-heap/cma_heap.c:123
2025-08-05T19:04:36,338600+00:00 DMA_STACK_START: Stack trace for dma_alloc_coherent called from carveout_dma_heap_allocate
2025-08-05T19:04:36,338700+00:00  dump_backtrace+0x90/0xe8
2025-08-05T19:04:36,339000+00:00 DMA_STACK_END: End of stack trace for dma_alloc_coherent
"""
        
        log_path = self.create_test_log(mixed_content, "mixed_format.log")
        result = parse_log_file(log_path)
        
        # Should have parsed both DMA operations
        self.assertIn('dma_operations', result)
        dma_ops = result['dma_operations']
        self.assertEqual(len(dma_ops), 2)
        
        # Check TI format operation
        ti_dma = dma_ops[0]
        self.assertEqual(ti_dma['dma_function'], 'dma_alloc_coherent')
        self.assertEqual(ti_dma['caller_function'], 'rproc_alloc_carveout')
        self.assertEqual(ti_dma['stack_trace'], ['dump_backtrace'])
        
        # Check ISO format operation  
        iso_dma = dma_ops[1]
        self.assertEqual(iso_dma['dma_function'], 'dma_alloc_coherent')
        self.assertEqual(iso_dma['caller_function'], 'carveout_dma_heap_allocate')
        self.assertEqual(iso_dma['stack_trace'], ['dump_backtrace'])
    
    def test_log_without_stack_traces(self):
        """Test parsing DMA operations without stack traces"""
        no_stack_content = """[    5.011096] DMA_INSTRUMENT: About to call dma_alloc_coherent from function rproc_alloc_carveout at drivers/remoteproc/remoteproc_core.c:709
[    5.341102] DMA_INSTRUMENT: About to call dma_free_coherent from function rproc_free_carveout at drivers/remoteproc/remoteproc_core.c:750
"""
        
        log_path = self.create_test_log(no_stack_content, "no_stack.log")
        result = parse_log_file(log_path)
        
        # Should have parsed DMA operations without stack traces
        self.assertIn('dma_operations', result)
        dma_ops = result['dma_operations']
        self.assertEqual(len(dma_ops), 2)
        
        # Both operations should have empty stack traces
        for dma in dma_ops:
            self.assertEqual(dma['stack_trace'], [])
    
    def test_orphaned_stack_traces(self):
        """Test handling of stack traces without corresponding DMA operations"""
        orphaned_content = """[    5.011099] DMA_STACK_START: Stack trace for dma_alloc_coherent called from rproc_alloc_carveout
[    5.011113]  dump_backtrace.part.0+0xdc/0xf0
[    5.011483] DMA_STACK_END: End of stack trace for dma_alloc_coherent
[    5.341102] DMA_INSTRUMENT: About to call dma_free_coherent from function rproc_free_carveout at drivers/remoteproc/remoteproc_core.c:750
"""
        
        log_path = self.create_test_log(orphaned_content, "orphaned.log")
        result = parse_log_file(log_path)
        
        # Should only have the DMA operation without the orphaned stack trace
        self.assertIn('dma_operations', result)
        dma_ops = result['dma_operations']
        self.assertEqual(len(dma_ops), 1)
        
        dma = dma_ops[0]
        self.assertEqual(dma['dma_function'], 'dma_free_coherent')
        self.assertEqual(dma['stack_trace'], [])  # No stack trace for this operation
    
    def test_metadata_generation(self):
        """Test that metadata is properly generated"""
        simple_content = """[    5.011096] DMA_INSTRUMENT: About to call dma_alloc_coherent from function rproc_alloc_carveout at drivers/remoteproc/remoteproc_core.c:709
"""
        
        log_path = self.create_test_log(simple_content, "simple.log")
        result = parse_log_file(log_path)
        
        # Check metadata
        self.assertIn('metadata', result)
        metadata = result['metadata']
        
        required_fields = [
            'parser_version',
            'parsed_at',
            'log_file',
            'total_lines',
            'parsed_lines',
            'unique_entries'
        ]
        
        for field in required_fields:
            self.assertIn(field, metadata, f"Missing metadata field: {field}")
        
        # Check basic values
        self.assertEqual(metadata['total_lines'], 1)
        self.assertEqual(metadata['parsed_lines'], 1)
        self.assertEqual(metadata['unique_entries'], 1)


if __name__ == '__main__':
    unittest.main()
