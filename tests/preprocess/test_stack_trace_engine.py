#!/usr/bin/env python3
"""
Tests for engine stack trace attachment logic
Tests the deduplication and stack trace management in the engine
"""

import unittest
from unittest.mock import Mock, patch
from src.preprocess.core.engine import KernelLogParserEngine
from src.preprocess.core.models import DMAOperation


class TestStackTraceAttachment(unittest.TestCase):
    """Test stack trace attachment in the engine"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.engine = KernelLogParserEngine(show_ui=False)
    
    def test_stack_trace_attachment_to_pending_operation(self):
        """Test that stack traces are properly attached to pending DMA operations"""
        # Create a DMA operation
        dma_op = DMAOperation(
            dma_function='dma_alloc_coherent',
            caller_function='rproc_alloc_carveout',
            file_path='drivers/remoteproc/remoteproc_core.c',
            line_number=709,
            first_seen_timestamp=5.011096,
            first_seen_time_str='5.011096'
        )
        
        # Simulate DMA operation being processed
        self.engine._handle_dma_result(dma_op)
        
        # Should have one DMA operation and it should be pending
        self.assertEqual(len(self.engine.dma_operations), 1)
        self.assertIsNotNone(self.engine.pending_dma_operation)
        self.assertEqual(self.engine.pending_dma_operation.dma_function, 'dma_alloc_coherent')
        
        # Simulate stack trace end
        stack_trace = ['dump_backtrace', 'show_stack', 'rproc_alloc_carveout']
        stack_end_result = ('stack_end', 'dma_alloc_coherent', stack_trace)
        
        self.engine._handle_dma_result(stack_end_result)
        
        # Check that stack trace was attached
        attached_op = self.engine.dma_operations[0]
        self.assertEqual(attached_op.stack_trace, stack_trace)
        self.assertIsNone(self.engine.pending_dma_operation)  # Should be cleared
    
    def test_stack_trace_attachment_with_deduplication(self):
        """Test stack trace attachment when operations are deduplicated"""
        # Create first DMA operation
        dma_op1 = DMAOperation(
            dma_function='dma_alloc_coherent',
            caller_function='rproc_alloc_carveout',
            file_path='drivers/remoteproc/remoteproc_core.c',
            line_number=709,
            first_seen_timestamp=5.011096,
            first_seen_time_str='5.011096'
        )
        
        # Process first operation
        self.engine._handle_dma_result(dma_op1)
        first_op = self.engine.dma_operations[0]
        
        # Attach stack trace to first operation
        stack_trace1 = ['dump_backtrace', 'show_stack', 'rproc_alloc_carveout']
        stack_end_result1 = ('stack_end', 'dma_alloc_coherent', stack_trace1)
        self.engine._handle_dma_result(stack_end_result1)
        
        # Verify first operation has stack trace
        self.assertEqual(first_op.stack_trace, stack_trace1)
        
        # Create duplicate DMA operation (same function, caller, file, line)
        dma_op2 = DMAOperation(
            dma_function='dma_alloc_coherent',
            caller_function='rproc_alloc_carveout', 
            file_path='drivers/remoteproc/remoteproc_core.c',
            line_number=709,
            first_seen_timestamp=6.012000,  # Different timestamp
            first_seen_time_str='6.012000'
        )
        
        # Process duplicate operation (should be deduplicated)
        self.engine._handle_dma_result(dma_op2)
        
        # Should still only have one operation
        self.assertEqual(len(self.engine.dma_operations), 1)
        
        # But pending operation should be set to existing operation for stack attachment
        self.assertIsNotNone(self.engine.pending_dma_operation)
        self.assertEqual(self.engine.pending_dma_operation, first_op)
        
        # Attach new stack trace
        stack_trace2 = ['dump_backtrace', 'show_stack', 'different_function']
        stack_end_result2 = ('stack_end', 'dma_alloc_coherent', stack_trace2)
        self.engine._handle_dma_result(stack_end_result2)
        
        # Original operation should still have original stack trace (not overwritten)
        self.assertEqual(first_op.stack_trace, stack_trace1)
    
    def test_mismatched_stack_trace_function(self):
        """Test that stack traces are not attached if function names don't match"""
        # Create a DMA operation
        dma_op = DMAOperation(
            dma_function='dma_alloc_coherent',
            caller_function='rproc_alloc_carveout',
            file_path='drivers/remoteproc/remoteproc_core.c',
            line_number=709,
            first_seen_timestamp=5.011096,
            first_seen_time_str='5.011096'
        )
        
        self.engine._handle_dma_result(dma_op)
        
        # Simulate stack trace end with different function name
        stack_trace = ['dump_backtrace', 'show_stack']
        stack_end_result = ('stack_end', 'dma_free_coherent', stack_trace)  # Wrong function!
        
        self.engine._handle_dma_result(stack_end_result)
        
        # Stack trace should NOT be attached due to function mismatch
        attached_op = self.engine.dma_operations[0]
        self.assertEqual(attached_op.stack_trace, [])  # Should remain empty
    
    def test_stack_trace_not_overwritten(self):
        """Test that existing stack traces are not overwritten"""
        # Create a DMA operation with existing stack trace
        dma_op = DMAOperation(
            dma_function='dma_alloc_coherent',
            caller_function='rproc_alloc_carveout',
            file_path='drivers/remoteproc/remoteproc_core.c',
            line_number=709,
            first_seen_timestamp=5.011096,
            first_seen_time_str='5.011096'
        )
        dma_op.stack_trace = ['existing_function']
        
        self.engine._handle_dma_result(dma_op)
        
        # Try to attach new stack trace
        new_stack_trace = ['dump_backtrace', 'show_stack']
        stack_end_result = ('stack_end', 'dma_alloc_coherent', new_stack_trace)
        
        self.engine._handle_dma_result(stack_end_result)
        
        # Original stack trace should be preserved
        attached_op = self.engine.dma_operations[0]
        self.assertEqual(attached_op.stack_trace, ['existing_function'])
    
    def test_empty_stack_trace_handling(self):
        """Test handling of empty stack traces"""
        # Create a DMA operation
        dma_op = DMAOperation(
            dma_function='dma_alloc_coherent',
            caller_function='rproc_alloc_carveout',
            file_path='drivers/remoteproc/remoteproc_core.c',
            line_number=709,
            first_seen_timestamp=5.011096,
            first_seen_time_str='5.011096'
        )
        
        self.engine._handle_dma_result(dma_op)
        
        # Simulate stack trace end with empty stack
        stack_end_result = ('stack_end', 'dma_alloc_coherent', [])
        
        self.engine._handle_dma_result(stack_end_result)
        
        # Empty stack trace should not be attached
        attached_op = self.engine.dma_operations[0]
        self.assertEqual(attached_op.stack_trace, [])
    
    def test_no_pending_operation_handling(self):
        """Test handling of stack trace end when no operation is pending"""
        # Simulate stack trace end without a pending operation
        stack_trace = ['dump_backtrace', 'show_stack']
        stack_end_result = ('stack_end', 'dma_alloc_coherent', stack_trace)
        
        # This should not raise an exception
        try:
            self.engine._handle_dma_result(stack_end_result)
        except Exception as e:
            self.fail(f"Should not raise exception: {e}")
        
        # No operations should be created
        self.assertEqual(len(self.engine.dma_operations), 0)


class TestEngineLineProcessing(unittest.TestCase):
    """Test engine line processing with different formats"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.engine = KernelLogParserEngine(show_ui=False)
    
    def test_ti_boot_format_processing(self):
        """Test processing TI boot format lines through the engine"""
        lines = [
            "[    5.011096] DMA_INSTRUMENT: About to call dma_alloc_coherent from function rproc_alloc_carveout at drivers/remoteproc/remoteproc_core.c:709",
            "[    5.011099] DMA_STACK_START: Stack trace for dma_alloc_coherent called from rproc_alloc_carveout",
            "[    5.011113]  dump_backtrace.part.0+0xdc/0xf0",
            "[    5.011129]  show_stack+0x18/0x30",
            "[    5.011483] DMA_STACK_END: End of stack trace for dma_alloc_coherent"
        ]
        
        # Process lines through engine
        for line in lines:
            self.engine._parse_line(line, len(lines))
        
        # Should have one DMA operation with stack trace
        self.assertEqual(len(self.engine.dma_operations), 1)
        
        dma_op = self.engine.dma_operations[0]
        self.assertEqual(dma_op.dma_function, 'dma_alloc_coherent')
        self.assertEqual(dma_op.caller_function, 'rproc_alloc_carveout')
        
        expected_stack = ['dump_backtrace', 'show_stack']  # .part.0 should be stripped
        self.assertEqual(dma_op.stack_trace, expected_stack)
    
    def test_iso_format_processing(self):
        """Test processing ISO format lines through the engine"""
        lines = [
            "2025-08-05T19:04:36,338500+00:00 DMA_INSTRUMENT: About to call dma_alloc_coherent from function carveout_dma_heap_allocate at drivers/dma-heap/cma_heap.c:123",
            "2025-08-05T19:04:36,338600+00:00 DMA_STACK_START: Stack trace for dma_alloc_coherent called from carveout_dma_heap_allocate",
            "2025-08-05T19:04:36,338700+00:00  dump_backtrace+0x90/0xe8",
            "2025-08-05T19:04:36,339000+00:00 DMA_STACK_END: End of stack trace for dma_alloc_coherent"
        ]
        
        # Process lines through engine
        for line in lines:
            self.engine._parse_line(line, len(lines))
        
        # Should have one DMA operation with stack trace
        self.assertEqual(len(self.engine.dma_operations), 1)
        
        dma_op = self.engine.dma_operations[0]
        self.assertEqual(dma_op.dma_function, 'dma_alloc_coherent')
        self.assertEqual(dma_op.caller_function, 'carveout_dma_heap_allocate')
        self.assertEqual(dma_op.stack_trace, ['dump_backtrace'])


if __name__ == '__main__':
    unittest.main()
