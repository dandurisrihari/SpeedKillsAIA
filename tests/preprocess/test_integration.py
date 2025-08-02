#!/usr/bin/env python3
"""
Integration test suite for the complete kernel log parser engine
"""

import unittest
import sys
import os
import tempfile
import json
from pathlib import Path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from preprocess.core.engine import KernelLogParserEngine


class TestKernelLogParserEngineIntegration(unittest.TestCase):
    """Integration tests for the complete parsing engine"""
    
    def setUp(self):
        """Set up test fixtures with sample log data"""
        self.engine = KernelLogParserEngine()
        
        # Sample log data representing a complete trace
        self.sample_log_data = """[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
[  156.773472] FUNC_ENTRY: Entering function gasket_open at /gasket-driver/src/gasket_core.c:1229
[  156.776821] FUNC_ENTRY: Entering function gasket_perform_mapping at /gasket-driver/src/gasket_page_table.c:640
[  156.800000] DMA_INSTRUMENT: About to call dma_map_page from function gasket_perform_mapping at /gasket-driver/src/gasket_page_table.c:650
[  156.801000] DMA_STACK_START: Stack trace for dma_map_page called from gasket_perform_mapping
[  156.802000] CPU: 2 PID: 3999 Comm: classify_image Tainted: G           OE     5.4.0-150-generic #167~18.04.1-Ubuntu
[  156.803000] Hardware name: Google Coral/Coral, BIOS Google_Coral.10068.27.0 03/30/2018
[  156.804000] Call trace:
[  156.805000] [<ffff000008089938>] dump_backtrace+0x0/0x3a8
[  156.806000] DMA_STACK_END: End of stack trace for dma_map_page
[  156.889534] USER_COPY: About to call copy_from_user from function apex_set_performance_expectation at /gasket-driver/src/apex_driver.c:576
[  156.903290] USER_COPY_CONTEXT: Process PID=3999, COMM=classify_image
[  157.000000] FUNC_ENTRY: Entering function gasket_open at /gasket-driver/src/gasket_core.c:1229
[  157.100000] DMA_INSTRUMENT: About to call dma_map_page from function gasket_perform_mapping at /gasket-driver/src/gasket_page_table.c:650"""
    
    def create_temp_log_file(self, content):
        """Create a temporary log file with given content"""
        temp_file = tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.log')
        temp_file.write(content)
        temp_file.flush()
        temp_file.close()
        return temp_file.name
    
    def test_complete_parsing_workflow(self):
        """Test the complete parsing workflow with sample data"""
        log_file = self.create_temp_log_file(self.sample_log_data)
        
        try:
            # Parse the log file
            results = self.engine.parse_log_file(log_file)
            
            # Verify parsing results structure
            self.assertIsInstance(results, dict)
            self.assertIn('function_entries', results)
            self.assertIn('dma_operations', results)
            self.assertIn('user_copy_operations', results)
            self.assertIn('statistics', results)
            
            # Verify function entries
            function_entries = results['function_entries']
            self.assertEqual(len(function_entries), 2)  # Two unique functions
            
            # Find gasket_open entry (should have count=2 due to deduplication)
            gasket_open = next((f for f in function_entries if f['function_name'] == 'gasket_open'), None)
            self.assertIsNotNone(gasket_open)
            self.assertEqual(gasket_open['call_count'], 2)
            self.assertEqual(gasket_open['file_path'], '/gasket-driver/src/gasket_core.c')
            self.assertEqual(gasket_open['line_number'], 1229)
            
            # Verify DMA operations
            dma_operations = results['dma_operations']
            self.assertEqual(len(dma_operations), 1)  # Two calls but deduplicated
            
            dma_op = dma_operations[0]
            self.assertEqual(dma_op['dma_function'], 'dma_map_page')
            self.assertEqual(dma_op['caller_function'], 'gasket_perform_mapping')
            self.assertEqual(dma_op['call_count'], 2)
            self.assertGreater(len(dma_op['stack_trace']), 0)  # Should have captured stack trace
            
            # Verify user copy operations
            user_copy_operations = results['user_copy_operations']
            self.assertEqual(len(user_copy_operations), 1)
            
            user_copy = user_copy_operations[0]
            self.assertEqual(user_copy['copy_function'], 'copy_from_user')
            self.assertEqual(user_copy['caller_function'], 'apex_set_performance_expectation')
            self.assertIsNotNone(user_copy['process_info'])
            self.assertEqual(user_copy['process_info']['pid'], 3999)
            self.assertEqual(user_copy['process_info']['comm'], 'classify_image')
            
            # Verify statistics
            stats = results['statistics']
            self.assertIn('total_lines_processed', stats)
            self.assertIn('total_files_analyzed', stats)
            self.assertIn('files_instrumented_with_function_entries', stats)
            self.assertIn('function_entries_found', stats)
            self.assertIn('dma_operations_found', stats)
            self.assertIn('user_copy_operations_found', stats)
            
            self.assertEqual(stats['function_entries_found'], 2)
            self.assertEqual(stats['dma_operations_found'], 1)
            self.assertEqual(stats['user_copy_operations_found'], 1)
            self.assertEqual(stats['files_instrumented_with_function_entries'], 2)  # Two unique files
            
        finally:
            # Clean up temp file
            os.unlink(log_file)
    
    def test_stack_trace_collection(self):
        """Test that stack traces are correctly collected between markers"""
        stack_trace_log = """[  156.800000] DMA_INSTRUMENT: About to call dma_map_page from function gasket_perform_mapping at /gasket-driver/src/gasket_page_table.c:650
[  156.801000] DMA_STACK_START: Stack trace for dma_map_page called from gasket_perform_mapping
[  156.802000] CPU: 2 PID: 3999 Comm: classify_image Tainted: G           OE     5.4.0-150-generic #167~18.04.1-Ubuntu
[  156.803000] Hardware name: Google Coral/Coral, BIOS Google_Coral.10068.27.0 03/30/2018
[  156.804000] Call trace:
[  156.805000] [<ffff000008089938>] dump_backtrace+0x0/0x3a8
[  156.806000] [<ffff000008089cfc>] show_stack+0x14/0x20
[  156.807000] [<ffff0000089d2d40>] dump_stack+0x98/0xc0
[  156.808000] [<ffff0000081f0000>] dma_map_page+0x0/0x100
[  156.809000] [<ffff0000081f0100>] gasket_perform_mapping+0x200/0x400
[  156.810000] DMA_STACK_END: End of stack trace for dma_map_page"""
        
        log_file = self.create_temp_log_file(stack_trace_log)
        
        try:
            results = self.engine.parse_log_file(log_file)
            
            # Should have one DMA operation with complete stack trace
            dma_operations = results['dma_operations']
            self.assertEqual(len(dma_operations), 1)
            
            dma_op = dma_operations[0]
            stack_trace = dma_op['stack_trace']
            
            # Should capture all lines between markers (8 lines)
            self.assertEqual(len(stack_trace), 8)
            
            # Verify specific stack trace content
            self.assertIn('CPU: 2 PID: 3999 Comm: classify_image', stack_trace[0])
            self.assertIn('Hardware name: Google Coral/Coral', stack_trace[1])
            self.assertIn('Call trace:', stack_trace[2])
            self.assertIn('dump_backtrace+0x0/0x3a8', stack_trace[3])
            
        finally:
            os.unlink(log_file)
    
    def test_empty_log_file(self):
        """Test parsing an empty log file"""
        log_file = self.create_temp_log_file("")
        
        try:
            results = self.engine.parse_log_file(log_file)
            
            # Should return empty results
            self.assertEqual(len(results['function_entries']), 0)
            self.assertEqual(len(results['dma_operations']), 0)
            self.assertEqual(len(results['user_copy_operations']), 0)
            self.assertEqual(results['statistics']['total_lines_processed'], 0)
            
        finally:
            os.unlink(log_file)
    
    def test_output_to_json_file(self):
        """Test writing results to JSON file"""
        log_file = self.create_temp_log_file(self.sample_log_data)
        output_file = tempfile.NamedTemporaryFile(delete=False, suffix='.json')
        output_file.close()
        
        try:
            # Parse and write to output file
            results = self.engine.parse_log_file(log_file, output_file.name)
            
            # Verify output file was created and contains valid JSON
            self.assertTrue(os.path.exists(output_file.name))
            
            with open(output_file.name, 'r') as f:
                written_results = json.load(f)
            
            # Verify the written data matches the returned results
            self.assertEqual(written_results, results)
            
        finally:
            os.unlink(log_file)
            os.unlink(output_file.name)
    
    def test_nonexistent_file(self):
        """Test handling of nonexistent log file"""
        with self.assertRaises(FileNotFoundError):
            self.engine.parse_log_file("/nonexistent/file.log")
    
    def test_malformed_log_lines(self):
        """Test handling of malformed log lines"""
        malformed_log = """This is not a valid log line
[Invalid timestamp] Some log entry
[  156.773472] FUNC_ENTRY: Invalid function entry without proper format
[  156.800000] DMA_INSTRUMENT: About to call dma_map_page from function gasket_perform_mapping at /gasket-driver/src/gasket_page_table.c:650
Some random text in the middle
[  156.889534] USER_COPY: About to call copy_from_user from function apex_set_performance_expectation at /gasket-driver/src/apex_driver.c:576"""
        
        log_file = self.create_temp_log_file(malformed_log)
        
        try:
            results = self.engine.parse_log_file(log_file)
            
            # Should parse valid entries and skip invalid ones
            self.assertEqual(len(results['dma_operations']), 1)
            self.assertEqual(len(results['user_copy_operations']), 1)
            self.assertEqual(len(results['function_entries']), 0)  # Invalid function entry should be skipped
            
        finally:
            os.unlink(log_file)


class TestNXPExample(unittest.TestCase):
    """Test with the specific NXP example that was failing"""
    
    def setUp(self):
        """Set up with the NXP example data"""
        self.engine = KernelLogParserEngine()
        
        # Exact NXP example from the conversation
        self.nxp_log_data = """[  156.800000] DMA_INSTRUMENT: About to call dma_map_page from function gasket_perform_mapping at /gasket-driver/src/gasket_page_table.c:650
[  156.801000] DMA_STACK_START: Stack trace for dma_map_page called from gasket_perform_mapping
[  156.802000] CPU: 2 PID: 3999 Comm: classify_image Tainted: G           OE     5.4.0-150-generic #167~18.04.1-Ubuntu
[  156.803000] Hardware name: Google Coral/Coral, BIOS Google_Coral.10068.27.0 03/30/2018
[  156.804000] Call trace:
[  156.805000] [<ffff000008089938>] dump_backtrace+0x0/0x3a8
[  156.806000] [<ffff000008089cfc>] show_stack+0x14/0x20
[  156.807000] [<ffff0000089d2d40>] dump_stack+0x98/0xc0
[  156.808000] [<ffff0000081f0000>] dma_map_page+0x0/0x100
[  156.809000] [<ffff0000081f0100>] gasket_perform_mapping+0x200/0x400
[  156.810000] [<ffff0000081f0200>] gasket_ioctl+0x300/0x500
[  156.811000] [<ffff0000081f0300>] do_vfs_ioctl+0x400/0x600
[  156.812000] [<ffff0000081f0400>] SyS_ioctl+0x500/0x700
[  156.813000] [<ffff0000081f0500>] el0_svc_naked+0x34/0x38
[  156.814000] [<ffff0000081f0600>] apex_set_performance_expectation+0x100/0x200
[  156.815000] [<ffff0000081f0700>] apex_ioctl+0x200/0x300
[  156.816000] [<ffff0000081f0800>] do_vfs_ioctl+0x300/0x400
[  156.817000] [<ffff0000081f0900>] SyS_ioctl+0x400/0x500
[  156.818000] [<ffff0000081f1000>] el0_svc_naked+0x34/0x38
[  156.819000] [<ffff0000081f1100>] classify_image_main+0x1000/0x2000
[  156.820000] [<ffff0000081f1200>] __libc_start_main+0x2000/0x3000
[  156.821000] DMA_STACK_END: End of stack trace for dma_map_page"""
    
    def test_nxp_stack_trace_capture(self):
        """Test that the NXP example captures all 20 stack trace lines"""
        log_file = tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.log')
        log_file.write(self.nxp_log_data)
        log_file.flush()
        log_file.close()
        
        try:
            results = self.engine.parse_log_file(log_file.name)
            
            # Should have one DMA operation
            dma_operations = results['dma_operations']
            self.assertEqual(len(dma_operations), 1)
            
            # Should capture all 20 lines between markers
            dma_op = dma_operations[0]
            stack_trace = dma_op['stack_trace']
            self.assertEqual(len(stack_trace), 20, f"Expected 20 stack trace lines, got {len(stack_trace)}")
            
            # Verify specific content
            self.assertIn('CPU: 2 PID: 3999 Comm: classify_image', stack_trace[0])
            self.assertIn('Hardware name: Google Coral/Coral', stack_trace[1])
            self.assertIn('Call trace:', stack_trace[2])
            self.assertIn('classify_image_main+0x1000/0x2000', stack_trace[-2])  # Second to last
            self.assertIn('__libc_start_main+0x2000/0x3000', stack_trace[-1])   # Last line
            
        finally:
            os.unlink(log_file.name)


if __name__ == '__main__':
    unittest.main(verbosity=2)
