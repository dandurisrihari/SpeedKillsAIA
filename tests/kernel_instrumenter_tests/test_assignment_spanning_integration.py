#!/usr/bin/env python3
"""
Integration test for assignment spanning preprocessor fixes

This test ensures that the full instrumentation pipeline correctly handles
assignment spanning preprocessor blocks without causing compilation errors.
"""

import unittest
import tempfile
import shutil
import os
import sys
from pathlib import Path

# Add the src directory to the path
current_dir = os.path.dirname(os.path.abspath(__file__))
repo_root = os.path.dirname(os.path.dirname(current_dir))
src_dir = os.path.join(repo_root, 'src')
sys.path.insert(0, src_dir)

from kernel_instrumenter.kernel_instrument import KernelInstrumenter


class TestAssignmentSpanningIntegration(unittest.TestCase):
    """Integration tests for assignment spanning preprocessor fixes"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        
    def tearDown(self):
        """Clean up test environment"""
        shutil.rmtree(self.test_dir, ignore_errors=True)
    
    def test_full_pipeline_assignment_spanning(self):
        """Test the complete instrumentation pipeline with assignment spanning"""
        # Create a test file with assignment spanning preprocessor
        test_file = Path(self.test_dir) / "spanning_test.c"
        test_content = '''
#include <linux/module.h>
#include <linux/dma-mapping.h>

static int test_module_init(void) {
    struct test_data *data;
    
    // This assignment spans preprocessor blocks - critical test case
    data->buffer_ptr =
#if defined(CONFIG_X86_64)
        dma_alloc_coherent(device, PAGE_SIZE, &data->dma_handle, GFP_KERNEL);
#elif defined(CONFIG_ARM64)
        dma_alloc_wc(device, PAGE_SIZE, &data->dma_handle, GFP_KERNEL);
#else
        NULL;
#endif
    
    if (!data->buffer_ptr) {
        return -ENOMEM;
    }
    
    return 0;
}

static void test_module_exit(void) {
    struct test_data *data;
    
    if (data->buffer_ptr) {
        // Another spanning assignment for cleanup
        int result =
#if defined(CONFIG_X86_64)
            copy_to_user(user_buffer, data->buffer_ptr, PAGE_SIZE);
#else
            0;
#endif
        
        dma_free_coherent(device, PAGE_SIZE, data->buffer_ptr, data->dma_handle);
    }
}

MODULE_LICENSE("GPL");
'''
        
        with open(test_file, 'w') as f:
            f.write(test_content)
        
        # Test with DMA instrumentation
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=False,  # Actually perform instrumentation
            verbose=True
        )
        
        result = instrumenter.instrument_file(test_file)
        
        # Verify instrumentation was successful
        self.assertTrue(result['success'], f"Instrumentation failed: {result.get('error', 'Unknown error')}")
        self.assertTrue(result['modified'], "File should have been modified")
        
        # Read the instrumented file
        with open(test_file, 'r') as f:
            instrumented_content = f.read()
        
        # Verify that instrumentation was placed correctly (before assignment, not inside preprocessor)
        lines = instrumented_content.split('\n')
        
        # Find the line with the assignment
        assignment_line_idx = None
        for i, line in enumerate(lines):
            if 'data->buffer_ptr =' in line:
                assignment_line_idx = i
                break
        
        self.assertIsNotNone(assignment_line_idx, "Should find the assignment line")
        
        # Check that instrumentation appears before the assignment
        found_instrumentation_before_assignment = False
        for i in range(max(0, assignment_line_idx - 5), assignment_line_idx):
            if 'printk' in lines[i] or 'pr_info' in lines[i]:
                found_instrumentation_before_assignment = True
                break
        
        self.assertTrue(found_instrumentation_before_assignment, 
                       "Instrumentation should appear before the assignment, not inside preprocessor")
        
        # Verify that no instrumentation appears inside the preprocessor block
        preprocessor_start = None
        preprocessor_end = None
        for i, line in enumerate(lines):
            if '#if defined(CONFIG_X86_64)' in line:
                preprocessor_start = i
            elif '#endif' in line and preprocessor_start is not None:
                preprocessor_end = i
                break
        
        if preprocessor_start and preprocessor_end:
            # Check that no instrumentation is inside the preprocessor block
            for i in range(preprocessor_start + 1, preprocessor_end):
                line = lines[i].strip()
                # Skip empty lines and preprocessor directives
                if line and not line.startswith('#'):
                    self.assertNotIn('printk', line, 
                                   f"Found instrumentation inside preprocessor block at line {i+1}: {line}")
                    self.assertNotIn('pr_info', line, 
                                   f"Found instrumentation inside preprocessor block at line {i+1}: {line}")
    
    def test_user_copy_spanning_integration(self):
        """Test user copy operations with spanning assignments"""
        test_file = Path(self.test_dir) / "user_copy_spanning.c"
        test_content = '''
#include <linux/uaccess.h>

long test_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    char buffer[256];
    long result;
    
    // User copy with spanning assignment
    result =
#ifdef CONFIG_HARDENED_USERCOPY
        copy_from_user(buffer, (void __user *)arg, sizeof(buffer));
#else
        __copy_from_user(buffer, (void __user *)arg, sizeof(buffer));
#endif
    
    if (result != 0) {
        return -EFAULT;
    }
    
    return 0;
}
'''
        
        with open(test_file, 'w') as f:
            f.write(test_content)
        
        # Test with user copy instrumentation
        instrumenter = KernelInstrumenter(
            enabled_types={'user_copy'},
            dry_run=False,
            verbose=True
        )
        
        result = instrumenter.instrument_file(test_file)
        
        self.assertTrue(result['success'], f"User copy instrumentation failed: {result.get('error')}")
        self.assertTrue(result['modified'], "File should have been modified for user copy")
        
        # Verify the instrumented content
        with open(test_file, 'r') as f:
            instrumented_content = f.read()
        
        # Should have instrumentation before the assignment, not inside preprocessor
        lines = instrumented_content.split('\n')
        
        # Find assignment line
        assignment_line = None
        for i, line in enumerate(lines):
            if 'result =' in line and '#' not in line:
                assignment_line = i
                break
        
        self.assertIsNotNone(assignment_line, "Should find the result assignment")
        
        # Look for instrumentation before the assignment
        found_instrumentation = False
        for i in range(max(0, assignment_line - 3), assignment_line):
            if 'printk' in lines[i] or 'pr_info' in lines[i]:
                found_instrumentation = True
                break
        
        self.assertTrue(found_instrumentation, 
                       "Should find instrumentation before user copy spanning assignment")

    def test_mixed_instrumentation_spanning(self):
        """Test mixed DMA and user copy with spanning assignments"""
        test_file = Path(self.test_dir) / "mixed_spanning.c"
        test_content = '''
#include <linux/module.h>
#include <linux/dma-mapping.h>
#include <linux/uaccess.h>

int mixed_function(void __user *user_ptr, struct device *dev) {
    struct mixed_data *data;
    int copy_result;
    
    // Mixed spanning assignments
    data->dma_buffer =
#ifdef CONFIG_DMA_COHERENT
        dma_alloc_coherent(dev, 4096, &data->dma_handle, GFP_KERNEL);
#else
        dma_alloc_wc(dev, 4096, &data->dma_handle, GFP_KERNEL);
#endif
    
    if (!data->dma_buffer) {
        return -ENOMEM;
    }
    
    // User copy spanning assignment
    copy_result =
#ifdef CONFIG_ARCH_HAS_COPY_USER
        copy_from_user(data->dma_buffer, user_ptr, 4096);
#else
        __copy_from_user_inatomic(data->dma_buffer, user_ptr, 4096);
#endif
    
    return copy_result;
}
'''
        
        with open(test_file, 'w') as f:
            f.write(test_content)
        
        # Test with both DMA and user copy instrumentation
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy'},
            dry_run=False,
            verbose=True
        )
        
        result = instrumenter.instrument_file(test_file)
        
        self.assertTrue(result['success'], f"Mixed instrumentation failed: {result.get('error')}")
        self.assertTrue(result['modified'], "File should have been modified")
        
        # Verify both types of instrumentation are present
        with open(test_file, 'r') as f:
            instrumented_content = f.read()
        
        # Should have multiple instrumentation points
        instrumentation_count = instrumented_content.count('printk') + instrumented_content.count('pr_info')
        self.assertGreaterEqual(instrumentation_count, 2, 
                               "Should have instrumentation for both DMA and user copy calls")


def run_integration_tests():
    """Run integration tests"""
    unittest.main(verbosity=2)


if __name__ == '__main__':
    run_integration_tests()
