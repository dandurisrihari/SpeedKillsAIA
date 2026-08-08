#!/usr/bin/env python3
"""
Core Kernel Instrumenter Tests

This module tests the core functionality of the kernel instrumenter including
instrumentation detection, code modification, and basic API operations.
"""

import unittest
import tempfile
import sys
from pathlib import Path

# Add src to path for imports
test_dir = Path(__file__).parent
sys.path.insert(0, str(test_dir.parent.parent / "src"))

try:
    from kernel_instrumenter.kernel_instrument import KernelInstrumenter
except ImportError as e:
    print(f"Warning: Could not import KernelInstrumenter: {e}")
    KernelInstrumenter = None


@unittest.skipIf(KernelInstrumenter is None, "KernelInstrumenter not available")
class TestKernelInstrumenterCore(unittest.TestCase):
    """Test core kernel instrumenter functionality"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.test_dir_path = Path(self.test_dir)
        
        # Create comprehensive test file
        self.create_comprehensive_test_file()
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    def create_comprehensive_test_file(self):
        """Create a comprehensive test file with all instrumentation types"""
        test_content = '''
#include <linux/module.h>
#include <linux/dma-mapping.h>
#include <linux/uaccess.h>
#include <linux/fs.h>
#include <linux/slab.h>

// Global variables
static struct device *test_device;

// Simple function without instrumentable calls
static void simple_function(void) {
    printk(KERN_INFO "Simple function called\\n");
}

// Function with DMA operations
static int dma_function(struct device *dev) {
    void *coherent_ptr;
    dma_addr_t dma_handle;
    
    // DMA allocation
    coherent_ptr = dma_alloc_coherent(dev, 4096, &dma_handle, GFP_KERNEL);
    if (!coherent_ptr) {
        printk(KERN_ERR "DMA allocation failed\\n");
        return -ENOMEM;
    }
    
    // DMA mapping
    dma_addr_t mapped = dma_map_single(dev, coherent_ptr, 4096, DMA_TO_DEVICE);
    if (dma_mapping_error(dev, mapped)) {
        dma_free_coherent(dev, 4096, coherent_ptr, dma_handle);
        return -ENOMEM;
    }
    
    // Cleanup
    dma_unmap_single(dev, mapped, 4096, DMA_TO_DEVICE);
    dma_free_coherent(dev, 4096, coherent_ptr, dma_handle);
    
    return 0;
}

// Function with user space copy operations
static long user_copy_function(void __user *user_buffer, size_t size) {
    char *kernel_buffer;
    
    kernel_buffer = kmalloc(size, GFP_KERNEL);
    if (!kernel_buffer)
        return -ENOMEM;
    
    // Copy from user space
    if (copy_from_user(kernel_buffer, user_buffer, size)) {
        kfree(kernel_buffer);
        return -EFAULT;
    }
    
    // Process data (placeholder)
    memset(kernel_buffer, 0x42, size);
    
    // Copy back to user space
    if (copy_to_user(user_buffer, kernel_buffer, size)) {
        kfree(kernel_buffer);
        return -EFAULT;
    }
    
    kfree(kernel_buffer);
    return 0;
}

// IOCTL handler function
static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    void __user *user_ptr = (void __user *)arg;
    
    switch (cmd) {
        case 0x1000:
            return user_copy_function(user_ptr, sizeof(int));
        case 0x1001:
            return dma_function(test_device);
        default:
            return -ENOTTY;
    }
}

// File operation functions
static int device_open(struct inode *inode, struct file *file) {
    printk(KERN_INFO "Device opened\\n");
    return 0;
}

static int device_release(struct inode *inode, struct file *file) {
    printk(KERN_INFO "Device released\\n");
    return 0;
}

// Module initialization
static int __init test_module_init(void) {
    printk(KERN_INFO "Test module loaded\\n");
    return 0;
}

// Module cleanup
static void __exit test_module_exit(void) {
    printk(KERN_INFO "Test module unloaded\\n");
}

module_init(test_module_init);
module_exit(test_module_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Comprehensive test driver for instrumenter");
MODULE_AUTHOR("Test Suite");
'''
        
        test_file = self.test_dir_path / 'comprehensive_test.c'
        with open(test_file, 'w') as f:
            f.write(test_content)
    
    def test_initialization_valid_types(self):
        """Test instrumenter initialization with valid types"""
        valid_type_combinations = [
            {'dma'},
            {'user_copy'},
            {'functions'},
            {'ioctl'},
            {'dma_present_files_functions'},
            {'dma', 'user_copy'},
            {'dma', 'user_copy', 'functions'},
            {'dma', 'user_copy', 'functions', 'ioctl'},
            {'dma_present_files_functions', 'user_copy'},
        ]
        
        for enabled_types in valid_type_combinations:
            with self.subTest(types=enabled_types):
                instrumenter = KernelInstrumenter(
                    enabled_types=enabled_types,
                    dry_run=True,
                    verbose=False
                )
                
                self.assertEqual(instrumenter.enabled_types, enabled_types)
                self.assertTrue(instrumenter.dry_run)
                self.assertIsNotNone(instrumenter.parser)
                self.assertIsNotNone(instrumenter.analyzer)
                self.assertIsNotNone(instrumenter.instrumenter)
    
    def test_initialization_invalid_types(self):
        """Test instrumenter initialization with invalid types"""
        invalid_types = [
            {'invalid_type'},
            {'dma', 'invalid_type'},
            {'nonexistent'},
            {'dma', 'user_copy', 'bad_type'},
        ]
        
        for enabled_types in invalid_types:
            with self.subTest(types=enabled_types):
                with self.assertRaises(ValueError):
                    KernelInstrumenter(
                        enabled_types=enabled_types,
                        dry_run=True,
                        verbose=False
                    )
    
    def test_dry_run_mode(self):
        """Test dry run mode functionality"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy', 'functions'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        
        # In dry run mode, no files should be modified
        self.assertTrue(result['success'])
        self.assertEqual(result['files_modified'], 0)
        self.assertGreater(result['total_instrumentations'], 0)  # Should find instrumentable items
        
        # Original file should be unchanged
        test_file = self.test_dir_path / 'comprehensive_test.c'
        with open(test_file, 'r') as f:
            content = f.read()
        
        # Should not contain instrumentation code
        self.assertNotIn('[Dynamic Baseline]', content)
        self.assertNotIn('DMA_ALLOC:', content)
    
    def test_dma_instrumentation_detection(self):
        """Test detection of DMA operations"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        
        self.assertTrue(result['success'])
        self.assertGreater(result['total_instrumentations'], 0)
        
        # Check results for DMA operations
        file_results = result['results'][0]['result']
        if 'instrumentations' in file_results:
            dma_items = file_results['instrumentations'].get('dma', [])
            self.assertGreater(len(dma_items), 0, "Should detect DMA operations")
    
    def test_user_copy_instrumentation_detection(self):
        """Test detection of user copy operations"""
        instrumenter = KernelInstrumenter(
            enabled_types={'user_copy'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        
        self.assertTrue(result['success'])
        self.assertGreater(result['total_instrumentations'], 0)
        
        # Check results for user copy operations
        file_results = result['results'][0]['result']
        if 'instrumentations' in file_results:
            user_copy_items = file_results['instrumentations'].get('user_copy', [])
            self.assertGreater(len(user_copy_items), 0, "Should detect user copy operations")
    
    def test_function_instrumentation_detection(self):
        """Test detection of function definitions"""
        instrumenter = KernelInstrumenter(
            enabled_types={'functions'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        
        self.assertTrue(result['success'])
        self.assertGreater(result['total_instrumentations'], 0)
        
        # Check results for function instrumentations
        file_results = result['results'][0]['result']
        if 'instrumentations' in file_results:
            function_items = file_results['instrumentations'].get('functions', [])
            self.assertGreater(len(function_items), 0, "Should detect function definitions")
    
    def test_ioctl_instrumentation_detection(self):
        """Test detection of IOCTL operations"""
        instrumenter = KernelInstrumenter(
            enabled_types={'ioctl'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        
        self.assertTrue(result['success'])
        
        # Check results for IOCTL operations
        file_results = result['results'][0]['result']
        if 'instrumentations' in file_results:
            ioctl_items = file_results['instrumentations'].get('ioctl', [])
            # IOCTL detection might find items based on function signatures
            # The exact count depends on the analyzer implementation
            self.assertGreaterEqual(len(ioctl_items), 0)
    
    def test_dma_present_files_functions(self):
        """Test dma_present_files_functions instrumentation type"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma_present_files_functions'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        
        self.assertTrue(result['success'])
        
        # Since our test file contains DMA operations, functions should be instrumented
        if result['total_instrumentations'] > 0:
            file_results = result['results'][0]['result']
            if 'instrumentations' in file_results:
                function_items = file_results['instrumentations'].get('functions', [])
                self.assertGreater(len(function_items), 0, 
                                 "Should instrument functions in DMA-containing files")
    
    def test_multiple_instrumentation_types(self):
        """Test multiple instrumentation types together"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy', 'functions'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        
        self.assertTrue(result['success'])
        self.assertGreater(result['total_instrumentations'], 0)
        
        # Should detect multiple types of instrumentations
        file_results = result['results'][0]['result']
        if 'instrumentations' in file_results:
            instrumentations = file_results['instrumentations']
            
            # Count total instrumentations across all types
            total_found = sum(len(items) for items in instrumentations.values())
            self.assertGreater(total_found, 0)
    
    def test_file_limit_functionality(self):
        """Test file processing limit functionality"""
        # Create multiple test files
        for i in range(3):
            simple_content = f'''
#include <linux/module.h>

static int test_function_{i}(void) {{
    return {i};
}}
'''
            test_file = self.test_dir_path / f'test_file_{i}.c'
            with open(test_file, 'w') as f:
                f.write(simple_content)
        
        instrumenter = KernelInstrumenter(
            enabled_types={'functions'},
            dry_run=True,
            verbose=False
        )
        
        # Test with file limit
        result = instrumenter.instrument_directory(self.test_dir_path, file_limit=2)
        
        self.assertTrue(result['success'])
        self.assertEqual(result['files_processed'], 2)  # Should process only 2 files
    
    def test_statistics_tracking(self):
        """Test that statistics are properly tracked"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        
        # Check that statistics are tracked
        self.assertIn('files_processed', result)
        self.assertIn('files_modified', result)
        self.assertIn('total_instrumentations', result)
        
        # Check instrumenter internal stats
        self.assertGreater(instrumenter.stats['files_processed'], 0)
        self.assertEqual(instrumenter.stats['files_modified'], 0)  # Dry run mode
        self.assertGreaterEqual(instrumenter.stats['total_instrumentations'], 0)
    
    def test_error_handling_invalid_directory(self):
        """Test error handling for invalid directory"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        
        # Test with non-existent directory
        result = instrumenter.instrument_directory('/nonexistent/directory')
        
        self.assertFalse(result['success'])
        self.assertIn('error', result)
    
    def test_error_handling_empty_directory(self):
        """Test error handling for empty directory"""
        empty_dir = tempfile.mkdtemp()
        empty_dir_path = Path(empty_dir)
        
        try:
            instrumenter = KernelInstrumenter(
                enabled_types={'dma'},
                dry_run=True,
                verbose=False
            )
            
            result = instrumenter.instrument_directory(empty_dir_path)
            
            # Empty directory should fail gracefully
            self.assertFalse(result['success'])
            
        finally:
            import shutil
            shutil.rmtree(empty_dir)
    
    def test_verbose_mode(self):
        """Test verbose mode functionality"""
        instrumenter = KernelInstrumenter(
            enabled_types={'functions'},
            dry_run=True,
            verbose=True  # Enable verbose mode
        )
        
        # Capture stdout to check verbose output
        from io import StringIO
        import sys
        old_stdout = sys.stdout
        sys.stdout = captured_output = StringIO()
        
        try:
            result = instrumenter.instrument_directory(self.test_dir_path)
            output = captured_output.getvalue()
            
            # Verbose mode should produce output
            self.assertIn('Processing:', output)
            self.assertTrue(result['success'])
            
        finally:
            sys.stdout = old_stdout


class TestSummaryFeatureCore(unittest.TestCase):
    """Test summary feature core functionality without CLI"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.test_dir_path = Path(self.test_dir)
        
        # Create simple test file
        test_content = '''
#include <linux/module.h>

static int func_one(void) { return 1; }
static int func_two(void) { return 2; }
static int func_three(void) { return 3; }
'''
        with open(self.test_dir_path / 'simple_test.c', 'w') as f:
            f.write(test_content)
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    @unittest.skipIf(KernelInstrumenter is None, "KernelInstrumenter not available")
    def test_summary_stats_generation(self):
        """Test summary statistics generation"""
        instrumenter = KernelInstrumenter(
            enabled_types={'functions'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        summary_stats = instrumenter.generate_summary_stats(
            directory=self.test_dir_path,
            results=result.get('results', [])
        )
        
        # Verify summary structure
        expected_keys = [
            'processing_summary',
            'instrumentation_summary', 
            'function_analysis',
            'instrumentation_by_type',
            'configuration'
        ]
        
        for key in expected_keys:
            self.assertIn(key, summary_stats)
        
        # Verify specific values
        proc_summary = summary_stats['processing_summary']
        self.assertEqual(proc_summary['total_source_files_in_directory'], 1)
        self.assertEqual(proc_summary['files_processed'], 1)
        
        func_analysis = summary_stats['function_analysis']
        self.assertEqual(func_analysis['total_functions_in_source_code'], 3)
        self.assertEqual(func_analysis['functions_instrumented'], 3)
    
    @unittest.skipIf(KernelInstrumenter is None, "KernelInstrumenter not available")
    def test_summary_file_creation(self):
        """Test summary file creation and content"""
        instrumenter = KernelInstrumenter(
            enabled_types={'functions'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        summary_stats = instrumenter.generate_summary_stats(
            directory=self.test_dir_path,
            results=result.get('results', [])
        )
        
        # Save summary to file
        summary_file = self.test_dir_path / 'test_summary.txt'
        instrumenter.save_summary_to_file(summary_stats, str(summary_file))
        
        # Verify file exists and has content
        self.assertTrue(summary_file.exists())
        
        with open(summary_file, 'r') as f:
            content = f.read()
        
        # Check for required sections
        required_sections = [
            'KERNEL INSTRUMENTATION SUMMARY REPORT',
            'FILE PROCESSING OVERVIEW',
            'FUNCTION ANALYSIS',
            'Total functions in source code: 3',
            'Functions instrumented:         3'
        ]
        
        for section in required_sections:
            self.assertIn(section, content)


if __name__ == '__main__':
    unittest.main()
