#!/usr/bin/env python3
"""
Test function code extraction functionality for all operation types
"""

import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

import unittest
from pathlib import Path
from src.preprocess.core.engine import KernelLogParserEngine


class TestFunctionCodeExtraction(unittest.TestCase):
    """Test function code extraction for all operation types"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = Path(__file__).parent
        self.engine = KernelLogParserEngine(show_ui=False)
        
        # Create test log file with realistic paths
        self.test_log_path = self.test_dir / "test_function_extraction.log"
        self._create_test_log()
    
    def _create_test_log(self):
        """Create test log file with realistic file paths"""
        test_driver_path = (self.test_dir / ".." / "kernel_instrumenter_tests" / 
                           "test_data" / "test_dma_driver.c")
        
        log_content = f"""[  123.456789] FUNC_ENTRY: Entering function allocate_dma_buffer at {test_driver_path}:16
[  123.456790] FUNC_ENTRY: Entering function simple_function at {test_driver_path}:9
[  123.456791] DMA_INSTRUMENT: About to call dma_alloc_coherent from function allocate_dma_buffer at {test_driver_path}:19
[  123.456792] DMA_INSTRUMENT: About to call dma_alloc_coherent from function allocate_dma_buffer at {test_driver_path}:19
[  123.456793] USER_COPY: About to call copy_from_user from function some_handler at {test_driver_path}:30
[  123.456794] USER_COPY: About to call copy_from_user from function some_handler at {test_driver_path}:30
[  123.456795] IOCTL_HANDLER: Function device_ioctl called at {test_driver_path}:35
[  123.456796] FUNC_ENTRY: Entering function simple_function at {test_driver_path}:9
[  123.456797] IOCTL_HANDLER: Function device_ioctl called at {test_driver_path}:35"""
        
        with open(self.test_log_path, 'w') as f:
            f.write(log_content)
    
    def test_function_code_extraction_all_types(self):
        """Test that function code extraction works for all operation types"""
        results = self.engine.parse_log_file(str(self.test_log_path))
        
        # Test function entries from functions_by_file
        total_functions = sum(len(funcs) for funcs in results['functions_by_file'].values())
        self.assertGreater(total_functions, 0, 
                          "Should have function entries")
        
        for file_path, functions in results['functions_by_file'].items():
            for func in functions:
                self.assertIn('call_count', func, "Should have call_count")
                self.assertGreater(func['call_count'], 0, "Call count should be > 0")
                # Function code may or may not be extracted depending on file existence
                self.assertIn('function_code', func, "Should have function_code field")
        
        # Test DMA operations
        self.assertGreater(len(results['dma_operations']), 0, 
                          "Should have DMA operations")
        
        for dma in results['dma_operations']:
            self.assertIn('call_count', dma, "Should have call_count")
            self.assertGreater(dma['call_count'], 0, "Call count should be > 0")
            self.assertIn('function_code', dma, "Should have function_code field")
        
        # Test User Copy operations
        self.assertGreater(len(results['user_copy_operations']), 0, 
                          "Should have user copy operations")
        
        for copy_op in results['user_copy_operations']:
            self.assertIn('call_count', copy_op, "Should have call_count")
            self.assertGreater(copy_op['call_count'], 0, "Call count should be > 0")
            self.assertIn('function_code', copy_op, "Should have function_code field")
        
        # Test IOCTL operations
        self.assertGreater(len(results['ioctl_operations']), 0, 
                          "Should have IOCTL operations")
        
        for ioctl in results['ioctl_operations']:
            self.assertIn('call_count', ioctl, "Should have call_count")
            self.assertGreater(ioctl['call_count'], 0, "Call count should be > 0")
            self.assertIn('function_code', ioctl, "Should have function_code field")
    
    def test_call_count_tracking(self):
        """Test that call counts are properly tracked for duplicates"""
        results = self.engine.parse_log_file(str(self.test_log_path))
        
        # Check that duplicates are properly counted
        # We have 2x simple_function, 2x dma_alloc_coherent, 2x copy_from_user, 2x device_ioctl
        
        # Find the simple_function entries from functions_by_file
        simple_funcs = []
        for file_path, functions in results['functions_by_file'].items():
            for f in functions:
                if f['function_name'] == 'simple_function':
                    simple_funcs.append(f)
        
        if simple_funcs:
            self.assertEqual(simple_funcs[0]['call_count'], 2, 
                           "simple_function should be called 2 times")
        
        # Find the DMA operations
        dma_ops = [d for d in results['dma_operations'] 
                  if d['dma_function'] == 'dma_alloc_coherent']
        if dma_ops:
            self.assertEqual(dma_ops[0]['call_count'], 2, 
                           "dma_alloc_coherent should be called 2 times")
        
        # Find the user copy operations
        copy_ops = [c for c in results['user_copy_operations'] 
                   if c['copy_function'] == 'copy_from_user']
        if copy_ops:
            self.assertEqual(copy_ops[0]['call_count'], 2, 
                           "copy_from_user should be called 2 times")
        
        # Find the IOCTL operations
        ioctl_ops = [i for i in results['ioctl_operations'] 
                    if i['function_name'] == 'device_ioctl']
        if ioctl_ops:
            self.assertEqual(ioctl_ops[0]['call_count'], 2, 
                           "device_ioctl should be called 2 times")
    
    def test_unique_operation_extraction(self):
        """Test that function code is only extracted for unique operations"""
        results = self.engine.parse_log_file(str(self.test_log_path))
        
        # Verify that we have unique entries, not duplicates
        # Each type should have only 1 unique entry despite having 2 calls
        
        total_unique_functions = sum(len(funcs) for funcs in results['functions_by_file'].values())
        self.assertEqual(total_unique_functions, 2, 
                        "Should have 2 unique function entries")
        
        self.assertEqual(len(results['dma_operations']), 1, 
                        "Should have 1 unique DMA operation")
        
        self.assertEqual(len(results['user_copy_operations']), 1, 
                        "Should have 1 unique user copy operation")
        
        self.assertEqual(len(results['ioctl_operations']), 1, 
                        "Should have 1 unique IOCTL operation")
    
    def tearDown(self):
        """Clean up test files"""
        if self.test_log_path.exists():
            self.test_log_path.unlink()


if __name__ == '__main__':
    unittest.main()
