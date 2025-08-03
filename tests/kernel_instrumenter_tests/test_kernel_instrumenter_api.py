#!/usr/bin/env python3
"""
KernelInstrumenter Class Tests

This module tests the KernelInstrumenter class directly, testing its API
and functionality independent of the CLI interface.
"""

import unittest
import tempfile
import sys
from pathlib import Path

# Add src to path for imports
test_dir = Path(__file__).parent
sys.path.insert(0, str(test_dir.parent.parent / "src"))

from kernel_instrumenter.kernel_instrument import KernelInstrumenter


class TestKernelInstrumenterAPI(unittest.TestCase):
    """Test the KernelInstrumenter class API"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.test_file_path = Path(self.test_dir) / "test_driver.c"
        
        # Create a comprehensive test C file
        test_content = '''
#include <linux/module.h>
#include <linux/dma-mapping.h>
#include <linux/uaccess.h>
#include <linux/slab.h>

static void helper_function(void) {
    printk(KERN_INFO "Helper function called\\n");
}

static int complex_dma_function(struct device *dev) {
    void *coherent_ptr;
    void *attrs_ptr;
    dma_addr_t dma_handle;
    struct scatterlist sg;
    char user_buffer[256];
    char *kernel_buffer;
    
    // Multiple DMA allocations
    coherent_ptr = dma_alloc_coherent(dev, 4096, &dma_handle, GFP_KERNEL);
    if (!coherent_ptr) {
        return -ENOMEM;
    }
    
    attrs_ptr = dma_alloc_attrs(dev, 2048, &dma_handle, GFP_KERNEL, 0);
    if (!attrs_ptr) {
        dma_free_coherent(dev, 4096, coherent_ptr, dma_handle);
        return -ENOMEM;
    }
    
    // DMA mapping operations
    dma_map_single(dev, coherent_ptr, 4096, DMA_TO_DEVICE);
    dma_map_sg(dev, &sg, 1, DMA_BIDIRECTIONAL);
    
    // User space copy operations
    kernel_buffer = kmalloc(256, GFP_KERNEL);
    if (kernel_buffer) {
        if (copy_from_user(kernel_buffer, user_buffer, 256)) {
            kfree(kernel_buffer);
            goto cleanup;
        }
        
        if (copy_to_user(user_buffer, "response", 8)) {
            kfree(kernel_buffer);
            goto cleanup;
        }
        
        kfree(kernel_buffer);
    }
    
cleanup:
    dma_unmap_sg(dev, &sg, 1, DMA_BIDIRECTIONAL);
    dma_unmap_single(dev, dma_handle, 4096, DMA_TO_DEVICE);
    dma_free_attrs(dev, 2048, attrs_ptr, dma_handle, 0);
    dma_free_coherent(dev, 4096, coherent_ptr, dma_handle);
    
    return 0;
}

static int another_function(void) {
    return helper_function() ? 0 : -1;
}

static int __init test_module_init(void) {
    printk(KERN_INFO "Test module loaded\\n");
    return complex_dma_function(NULL);
}

static void __exit test_module_exit(void) {
    printk(KERN_INFO "Test module unloaded\\n");
}

module_init(test_module_init);
module_exit(test_module_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Comprehensive test driver");
MODULE_AUTHOR("Test Suite");
'''
        
        with open(self.test_file_path, 'w') as f:
            f.write(test_content)
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    def test_initialization_dma_only(self):
        """Test KernelInstrumenter initialization with DMA only"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        
        self.assertEqual(instrumenter.enabled_types, {'dma'})
        self.assertTrue(instrumenter.dry_run)
        self.assertFalse(instrumenter.verbose)
        self.assertIsNotNone(instrumenter.parser)
        self.assertIsNotNone(instrumenter.analyzer)
        self.assertIsNotNone(instrumenter.instrumenter)
    
    def test_initialization_multiple_types(self):
        """Test KernelInstrumenter initialization with multiple types"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy', 'functions'},
            dry_run=False,
            verbose=True
        )
        
        self.assertEqual(instrumenter.enabled_types, {'dma', 'user_copy', 'functions'})
        self.assertFalse(instrumenter.dry_run)
        self.assertTrue(instrumenter.verbose)
    
    def test_initialization_ioctl_only(self):
        """Test KernelInstrumenter initialization with ioctl only"""
        instrumenter = KernelInstrumenter(
            enabled_types={'ioctl'},
            dry_run=True,
            verbose=False
        )
        
        self.assertEqual(instrumenter.enabled_types, {'ioctl'})
        self.assertTrue(instrumenter.dry_run)
        self.assertFalse(instrumenter.verbose)
        self.assertIsNotNone(instrumenter.parser)
        self.assertIsNotNone(instrumenter.analyzer)
        self.assertIsNotNone(instrumenter.instrumenter)
    
    def test_instrument_file_dma_dry_run(self):
        """Test instrumenting a single file with DMA in dry-run mode"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_file(self.test_file_path)
        
        self.assertTrue(result['success'])
        self.assertFalse(result['modified'])
        self.assertIn('instrumentations', result)
        self.assertIn('dma', result['instrumentations'])
        
        # Should find multiple DMA calls
        dma_calls = result['instrumentations']['dma']
        self.assertGreater(len(dma_calls), 0)
        
        # Verify specific DMA functions are found
        found_functions = [call['function_name'] for call in dma_calls]
        self.assertIn('dma_alloc_coherent', found_functions)
        self.assertIn('dma_alloc_attrs', found_functions)
        self.assertIn('dma_free_coherent', found_functions)
    
    def test_instrument_file_user_copy_dry_run(self):
        """Test instrumenting a single file with user copy in dry-run mode"""
        instrumenter = KernelInstrumenter(
            enabled_types={'user_copy'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_file(self.test_file_path)
        
        self.assertTrue(result['success'])
        self.assertFalse(result['modified'])
        self.assertIn('user_copy', result['instrumentations'])
        
        # Should find user copy operations
        user_copy_calls = result['instrumentations']['user_copy']
        self.assertGreater(len(user_copy_calls), 0)
        
        # Verify specific user copy functions are found
        found_functions = [call['function_name'] for call in user_copy_calls]
        self.assertIn('copy_from_user', found_functions)
        self.assertIn('copy_to_user', found_functions)
    
    def test_instrument_file_functions_dry_run(self):
        """Test instrumenting a single file with functions in dry-run mode"""
        instrumenter = KernelInstrumenter(
            enabled_types={'functions'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_file(self.test_file_path)
        
        self.assertTrue(result['success'])
        self.assertFalse(result['modified'])
        self.assertIn('functions', result['instrumentations'])
        
        # Should find function definitions
        functions = result['instrumentations']['functions']
        self.assertGreater(len(functions), 0)
        
        # Verify specific functions are found
        found_functions = [func['function_name'] for func in functions]
        self.assertIn('helper_function', found_functions)
        self.assertIn('complex_dma_function', found_functions)
        self.assertIn('another_function', found_functions)
    
    def test_instrument_file_ioctl_dry_run(self):
        """Test instrumenting a file with ioctl handlers in dry-run mode"""
        # Create a test file with ioctl handlers
        ioctl_file_path = Path(self.test_dir) / "ioctl_driver.c"
        ioctl_content = '''
#include <linux/module.h>
#include <linux/fs.h>

static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    switch (cmd) {
        case 0x1000:
            return handle_command_1(arg);
        case 0x1001:
            return handle_command_2(arg);
        default:
            return -EINVAL;
    }
}

static long driver_unlocked_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return device_ioctl(file, cmd, arg);
}

static int regular_function(void) {
    return 0;
}
'''
        ioctl_file_path.write_text(ioctl_content)
        
        instrumenter = KernelInstrumenter(
            enabled_types={'ioctl'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_file(ioctl_file_path)
        
        self.assertTrue(result['success'])
        self.assertFalse(result['modified'])  # Dry run doesn't modify
        self.assertIn('ioctl', result['instrumentations'])
        
        # Should find ioctl handlers
        ioctl_handlers = result['instrumentations']['ioctl']
        self.assertGreater(len(ioctl_handlers), 0)
        
        # Verify specific handlers are found
        found_handlers = [handler['function_name'] for handler in ioctl_handlers]
        self.assertIn('device_ioctl', found_handlers)
        # May also find driver_unlocked_ioctl depending on detection sophistication
    
    def test_instrument_file_multiple_types(self):
        """Test instrumenting with multiple types"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy', 'functions'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_file(self.test_file_path)
        
        self.assertTrue(result['success'])
        self.assertFalse(result['modified'])
        
        # Should have all types
        self.assertIn('dma', result['instrumentations'])
        self.assertIn('user_copy', result['instrumentations'])
        self.assertIn('functions', result['instrumentations'])
        
        # Each type should have found items
        self.assertGreater(len(result['instrumentations']['dma']), 0)
        self.assertGreater(len(result['instrumentations']['user_copy']), 0)
        self.assertGreater(len(result['instrumentations']['functions']), 0)
    
    def test_instrument_file_actual_modification(self):
        """Test actual file modification (not dry-run)"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=False,
            verbose=False
        )
        
        # Read original content
        with open(self.test_file_path, 'r') as f:
            original_content = f.read()
        
        result = instrumenter.instrument_file(self.test_file_path)
        
        self.assertTrue(result['success'])
        self.assertTrue(result['modified'])
        self.assertIn('backup_path', result)
        
        # Verify backup was created
        backup_path = result['backup_path']
        self.assertTrue(backup_path.exists())
        
        # Verify backup contains original content
        with open(backup_path, 'r') as f:
            backup_content = f.read()
        self.assertEqual(backup_content, original_content)
        
        # Verify instrumentation was added
        with open(self.test_file_path, 'r') as f:
            modified_content = f.read()
        
        self.assertNotEqual(modified_content, original_content)
        self.assertIn('printk(KERN_INFO "DMA_INSTRUMENT:', modified_content)
    
    def test_instrument_directory_dry_run(self):
        """Test instrumenting a directory in dry-run mode"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(Path(self.test_dir))
        
        self.assertTrue(result['success'])
        self.assertEqual(result['files_processed'], 1)
        self.assertEqual(result['files_modified'], 0)  # Dry run
        self.assertGreater(result['total_instrumentations'], 0)
        self.assertIn('results', result)
        self.assertEqual(len(result['errors']), 0)
    
    def test_instrument_directory_with_limit(self):
        """Test instrumenting directory with file limit"""
        # Create multiple test files
        for i in range(3):
            test_file = Path(self.test_dir) / f"driver_{i}.c"
            with open(test_file, 'w') as f:
                f.write(f'''
#include <linux/dma-mapping.h>
void test_func_{i}(void) {{
    dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);
}}
''')
        
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(
            Path(self.test_dir),
            file_limit=2
        )
        
        self.assertTrue(result['success'])
        self.assertEqual(result['files_processed'], 2)  # Limited to 2
        self.assertGreaterEqual(len(result['results']), 2)
    
    def test_instrument_code_direct(self):
        """Test direct code instrumentation"""
        source_code = '''
#include <linux/dma-mapping.h>

void test_function(void) {
    void *ptr = dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);
    dma_free_coherent(NULL, 1024, ptr, 0);
}
'''
        
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        
        instrumented_code = instrumenter.instrument_code(source_code, 'dma')
        
        self.assertNotEqual(instrumented_code, source_code)
        self.assertIn('printk(KERN_INFO "DMA_INSTRUMENT:', instrumented_code)
        self.assertIn('dma_alloc_coherent', instrumented_code)
    
    def test_error_handling_nonexistent_file(self):
        """Test error handling for non-existent file"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_file(Path("/nonexistent/file.c"))
        
        self.assertFalse(result['success'])
        self.assertIn('error', result)
    
    def test_error_handling_nonexistent_directory(self):
        """Test error handling for non-existent directory"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(Path("/nonexistent/directory"))
        
        self.assertFalse(result['success'])
        self.assertIn('error', result)
    
    def test_statistics_tracking(self):
        """Test that statistics are properly tracked"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy', 'functions'},
            dry_run=True,
            verbose=False
        )
        
        # Process a file
        result = instrumenter.instrument_file(self.test_file_path)
        
        # Check statistics
        self.assertEqual(instrumenter.stats['files_processed'], 1)
        self.assertEqual(instrumenter.stats['files_modified'], 0)  # Dry run
        self.assertGreater(instrumenter.stats['total_instrumentations'], 0)
        
        # Check per-type statistics
        self.assertIn('dma', instrumenter.stats['instrumentations_by_type'])
        self.assertIn('user_copy', instrumenter.stats['instrumentations_by_type'])
        self.assertIn('functions', instrumenter.stats['instrumentations_by_type'])
        
        self.assertGreater(instrumenter.stats['instrumentations_by_type']['dma'], 0)
        self.assertGreater(instrumenter.stats['instrumentations_by_type']['user_copy'], 0)
        self.assertGreater(instrumenter.stats['instrumentations_by_type']['functions'], 0)
    
    def test_dma_present_files_functions_mode(self):
        """Test the dma_present_files_functions instrumentation mode"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma_present_files_functions'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_file(self.test_file_path)
        
        self.assertTrue(result['success'])
        self.assertIn('functions', result['instrumentations'])
        
        # Should instrument functions since file contains DMA
        functions = result['instrumentations']['functions']
        self.assertGreater(len(functions), 0)


class TestKernelInstrumenterEdgeCases(unittest.TestCase):
    """Test edge cases and error conditions"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    def test_empty_file(self):
        """Test handling of empty C file"""
        empty_file = Path(self.test_dir) / "empty.c"
        empty_file.touch()
        
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_file(empty_file)
        
        self.assertTrue(result['success'])
        self.assertFalse(result['modified'])
        self.assertEqual(len(result['instrumentations']['dma']), 0)
    
    def test_file_with_only_comments(self):
        """Test handling of file with only comments"""
        comment_file = Path(self.test_dir) / "comments.c"
        with open(comment_file, 'w') as f:
            f.write('''
/*
 * This file contains only comments
 * No actual code to instrument
 * dma_alloc_coherent() is mentioned but in comments
 */

// Another comment with copy_to_user() mentioned
''')
        
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_file(comment_file)
        
        self.assertTrue(result['success'])
        self.assertEqual(len(result['instrumentations']['dma']), 0)
        self.assertEqual(len(result['instrumentations']['user_copy']), 0)
    
    def test_malformed_c_code(self):
        """Test handling of malformed C code"""
        malformed_file = Path(self.test_dir) / "malformed.c"
        with open(malformed_file, 'w') as f:
            f.write('''
#include <linux/dma-mapping.h>

void incomplete_function( {
    dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);
    // Missing closing brace and other syntax errors
    if (condition) {
        // Unclosed if statement
''')
        
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        
        # Should handle malformed code gracefully
        result = instrumenter.instrument_file(malformed_file)
        
        # Even malformed code should not crash the instrumenter
        self.assertTrue(result['success'])


if __name__ == '__main__':
    unittest.main(verbosity=2)
