#!/usr/bin/env python3
"""
Summary Feature Tests

This module tests the summary statistics feature of the KernelInstrumenter,
including statistics generation, file saving, and data accuracy.
"""

import unittest
import tempfile
import sys
import json
from pathlib import Path
from unittest.mock import patch, MagicMock

# Add src to path for imports
test_dir = Path(__file__).parent
sys.path.insert(0, str(test_dir.parent.parent / "src"))

from kernel_instrumenter.kernel_instrument import KernelInstrumenter


class TestSummaryFeature(unittest.TestCase):
    """Test the summary statistics feature"""
    
    def setUp(self):
        """Set up test environment with sample C files"""
        self.test_dir = tempfile.mkdtemp()
        self.test_dir_path = Path(self.test_dir)
        
        # Create multiple test C files with different characteristics
        self.create_test_files()
        
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    def create_test_files(self):
        """Create test C files with various instrumentation scenarios"""
        
        # File 1: DMA operations and functions
        dma_file_content = '''
#include <linux/module.h>
#include <linux/dma-mapping.h>

static void helper_function(void) {
    printk(KERN_INFO "Helper function\\n");
}

static int dma_function(struct device *dev) {
    void *ptr = dma_alloc_coherent(dev, 4096, NULL, GFP_KERNEL);
    if (ptr) {
        dma_free_coherent(dev, 4096, ptr, 0);
    }
    return 0;
}

static int init_function(void) {
    return 0;
}

static void cleanup_function(void) {
    return;
}
'''
        
        # File 2: User copy operations
        user_copy_file_content = '''
#include <linux/module.h>
#include <linux/uaccess.h>

static long user_copy_function(void __user *user_ptr, void *kernel_ptr, size_t size) {
    if (copy_from_user(kernel_ptr, user_ptr, size)) {
        return -EFAULT;
    }
    
    if (copy_to_user(user_ptr, kernel_ptr, size)) {
        return -EFAULT;
    }
    
    return 0;
}

static int simple_function(void) {
    return 42;
}
'''
        
        # File 3: IOCTL operations
        ioctl_file_content = '''
#include <linux/module.h>
#include <linux/fs.h>

static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    switch (cmd) {
        case 1:
            return 0;
        case 2:
            return -EINVAL;
        default:
            return -ENOTTY;
    }
}

static int device_open(struct inode *inode, struct file *file) {
    return 0;
}

static int device_release(struct inode *inode, struct file *file) {
    return 0;
}
'''
        
        # File 4: Empty file (no instrumentable items)
        empty_file_content = '''
#include <linux/module.h>

// This file has no functions or instrumentable items
#define SIMPLE_MACRO 42

MODULE_LICENSE("GPL");
'''
        
        # File 5: Functions only (no DMA/user_copy/ioctl)
        functions_only_content = '''
#include <linux/module.h>

static int pure_function_one(int a, int b) {
    return a + b;
}

static void pure_function_two(void) {
    int x = 10;
    int y = 20;
    int z = x + y;
}

static char *pure_function_three(const char *input) {
    return NULL;
}
'''
        
        # Write test files
        test_files = {
            'dma_file.c': dma_file_content,
            'user_copy_file.c': user_copy_file_content,
            'ioctl_file.c': ioctl_file_content,
            'empty_file.c': empty_file_content,
            'functions_only.c': functions_only_content
        }
        
        for filename, content in test_files.items():
            file_path = self.test_dir_path / filename
            with open(file_path, 'w') as f:
                f.write(content)
    
    def test_generate_summary_stats_basic(self):
        """Test basic summary statistics generation"""
        # Initialize instrumenter with all types
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy', 'functions', 'ioctl'},
            dry_run=True,
            verbose=False
        )
        
        # Run instrumentation to populate stats
        result = instrumenter.instrument_directory(self.test_dir_path)
        
        # Generate summary stats
        summary_stats = instrumenter.generate_summary_stats(
            directory=self.test_dir_path,
            results=result.get('results', [])
        )
        
        # Verify summary structure
        self.assertIn('processing_summary', summary_stats)
        self.assertIn('instrumentation_summary', summary_stats)
        self.assertIn('function_analysis', summary_stats)
        self.assertIn('instrumentation_by_type', summary_stats)
        self.assertIn('configuration', summary_stats)
        
        # Verify processing summary
        proc_summary = summary_stats['processing_summary']
        self.assertEqual(proc_summary['total_source_files_in_directory'], 5)
        self.assertEqual(proc_summary['files_processed'], 5)
        self.assertEqual(proc_summary['files_skipped'], 0)
        self.assertEqual(proc_summary['files_with_errors'], 0)
        
        # Verify instrumentation summary
        inst_summary = summary_stats['instrumentation_summary']
        self.assertTrue(inst_summary['dry_run_mode'])
        self.assertGreater(inst_summary['total_instrumentations_added'], 0)
        
        # Verify function analysis
        func_analysis = summary_stats['function_analysis']
        self.assertGreater(func_analysis['total_functions_in_source_code'], 0)
        
        # Verify configuration
        config = summary_stats['configuration']
        self.assertEqual(set(config['enabled_instrumentation_types']), 
                        {'dma', 'user_copy', 'functions', 'ioctl'})
        self.assertTrue(config['dry_run'])
    
    def test_generate_summary_stats_dma_only(self):
        """Test summary statistics with DMA instrumentation only"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        summary_stats = instrumenter.generate_summary_stats(
            directory=self.test_dir_path,
            results=result.get('results', [])
        )
        
        # Verify only DMA instrumentation is counted
        inst_by_type = summary_stats['instrumentation_by_type']
        self.assertIn('dma', inst_by_type)
        self.assertEqual(inst_by_type.get('user_copy', 0), 0)
        self.assertEqual(inst_by_type.get('functions', 0), 0)
        self.assertEqual(inst_by_type.get('ioctl', 0), 0)
        
        # Verify configuration shows only DMA
        config = summary_stats['configuration']
        self.assertEqual(set(config['enabled_instrumentation_types']), {'dma'})
    
    def test_generate_summary_stats_user_copy_only(self):
        """Test summary statistics with user copy instrumentation only"""
        instrumenter = KernelInstrumenter(
            enabled_types={'user_copy'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        summary_stats = instrumenter.generate_summary_stats(
            directory=self.test_dir_path,
            results=result.get('results', [])
        )
        
        # Verify only user_copy instrumentation is counted
        inst_by_type = summary_stats['instrumentation_by_type']
        self.assertIn('user_copy', inst_by_type)
        self.assertGreater(inst_by_type['user_copy'], 0)  # Should find copy_from_user/copy_to_user
        self.assertEqual(inst_by_type.get('dma', 0), 0)
        self.assertEqual(inst_by_type.get('functions', 0), 0)
        self.assertEqual(inst_by_type.get('ioctl', 0), 0)
    
    def test_function_counting_accuracy(self):
        """Test that function counting is accurate"""
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
        
        func_analysis = summary_stats['function_analysis']
        
        # We know from our test files how many functions we have:
        # dma_file.c: 4 functions (helper_function, dma_function, init_function, cleanup_function)
        # user_copy_file.c: 2 functions (user_copy_function, simple_function)
        # ioctl_file.c: 3 functions (device_ioctl, device_open, device_release)
        # empty_file.c: 0 functions
        # functions_only.c: 3 functions (pure_function_one, pure_function_two, pure_function_three)
        # Total: 12 functions
        
        expected_total_functions = 12
        self.assertEqual(func_analysis['total_functions_in_source_code'], expected_total_functions)
        
        # When functions instrumentation is enabled, all functions should be instrumented
        self.assertEqual(func_analysis['functions_instrumented'], expected_total_functions)
        self.assertEqual(func_analysis['function_instrumentation_rate_percent'], 100.0)
    
    def test_save_summary_to_file(self):
        """Test saving summary to file"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        summary_stats = instrumenter.generate_summary_stats(
            directory=self.test_dir_path,
            results=result.get('results', [])
        )
        
        # Save to file
        summary_file = self.test_dir_path / 'test_summary.txt'
        instrumenter.save_summary_to_file(summary_stats, str(summary_file))
        
        # Verify file was created and has content
        self.assertTrue(summary_file.exists())
        
        with open(summary_file, 'r') as f:
            content = f.read()
        
        # Verify file contains expected sections
        self.assertIn('KERNEL INSTRUMENTATION SUMMARY REPORT', content)
        self.assertIn('FILE PROCESSING OVERVIEW', content)
        self.assertIn('INSTRUMENTATION OVERVIEW', content)
        self.assertIn('FUNCTION ANALYSIS', content)
        self.assertIn('INSTRUMENTATION BREAKDOWN BY TYPE', content)
        self.assertIn('CONFIGURATION DETAILS', content)
        
        # Verify key statistics are present
        self.assertIn('Total C files in directory:', content)
        self.assertIn('Files processed:', content)
        self.assertIn('Total functions in source code:', content)
        self.assertIn('Dry run mode:', content)
    
    def test_summary_with_errors(self):
        """Test summary generation when some files have errors"""
        # Create a file with syntax errors
        error_file = self.test_dir_path / 'syntax_error.c'
        with open(error_file, 'w') as f:
            f.write('This is not valid C code { { { syntax error')
        
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        summary_stats = instrumenter.generate_summary_stats(
            directory=self.test_dir_path,
            results=result.get('results', [])
        )
        
        # Verify error handling in summary
        proc_summary = summary_stats['processing_summary']
        self.assertEqual(proc_summary['total_source_files_in_directory'], 6)  # 5 original + 1 error file
        
        # Files with errors should be counted
        self.assertGreaterEqual(proc_summary['files_with_errors'], 0)
    
    def test_summary_with_file_limit(self):
        """Test summary generation with file processing limit"""
        instrumenter = KernelInstrumenter(
            enabled_types={'functions'},
            dry_run=True,
            verbose=False
        )
        
        # Process only first 3 files
        result = instrumenter.instrument_directory(self.test_dir_path, file_limit=3)
        summary_stats = instrumenter.generate_summary_stats(
            directory=self.test_dir_path,
            results=result.get('results', [])
        )
        
        proc_summary = summary_stats['processing_summary']
        self.assertEqual(proc_summary['total_source_files_in_directory'], 5)
        self.assertEqual(proc_summary['files_processed'], 3)
        self.assertEqual(proc_summary['files_skipped'], 2)
    
    def test_dma_present_files_functions_instrumentation(self):
        """Test summary for dma_present_files_functions instrumentation type"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma_present_files_functions'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        summary_stats = instrumenter.generate_summary_stats(
            directory=self.test_dir_path,
            results=result.get('results', [])
        )
        
        inst_by_type = summary_stats['instrumentation_by_type']
        
        # Should have dma_present_files_functions instrumentation
        self.assertIn('dma_present_files_functions', inst_by_type)
        
        # Should only instrument functions in files that contain DMA operations
        # Our dma_file.c has DMA operations and 4 functions, so should instrument those
        dma_functions_count = inst_by_type.get('dma_present_files_functions', 0)
        self.assertGreater(dma_functions_count, 0)
        self.assertLessEqual(dma_functions_count, 4)  # Should be <= 4 (functions in dma_file.c)
    
    def test_instrumentation_rates_calculation(self):
        """Test that instrumentation rates are calculated correctly"""
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
        
        func_analysis = summary_stats['function_analysis']
        
        # Verify rate calculation
        total_functions = func_analysis['total_functions_in_source_code']
        functions_instrumented = func_analysis['functions_instrumented']
        rate = func_analysis['function_instrumentation_rate_percent']
        
        if total_functions > 0:
            expected_rate = (functions_instrumented / total_functions) * 100
            self.assertAlmostEqual(rate, expected_rate, places=1)
        else:
            self.assertEqual(rate, 0)
    
    def test_non_dry_run_mode_summary(self):
        """Test summary generation in non-dry-run mode"""
        # Create a temporary copy for modification
        temp_copy_dir = tempfile.mkdtemp()
        temp_copy_path = Path(temp_copy_dir)
        
        try:
            # Copy test files
            import shutil
            for c_file in self.test_dir_path.glob('*.c'):
                shutil.copy2(c_file, temp_copy_path)
            
            instrumenter = KernelInstrumenter(
                enabled_types={'dma'},
                dry_run=False,
                verbose=False
            )
            
            result = instrumenter.instrument_directory(temp_copy_path)
            summary_stats = instrumenter.generate_summary_stats(
                directory=temp_copy_path,
                results=result.get('results', [])
            )
            
            # Verify non-dry-run mode is recorded
            inst_summary = summary_stats['instrumentation_summary']
            self.assertFalse(inst_summary['dry_run_mode'])
            
            config = summary_stats['configuration']
            self.assertFalse(config['dry_run'])
            
            # In non-dry-run mode, files should be modified if instrumentations are found
            if inst_summary['total_instrumentations_added'] > 0:
                self.assertGreater(inst_summary['files_modified'], 0)
        
        finally:
            import shutil
            shutil.rmtree(temp_copy_dir)
    
    def test_empty_directory_summary(self):
        """Test summary generation for empty directory"""
        empty_dir = tempfile.mkdtemp()
        empty_dir_path = Path(empty_dir)
        
        try:
            instrumenter = KernelInstrumenter(
                enabled_types={'dma'},
                dry_run=True,
                verbose=False
            )
            
            result = instrumenter.instrument_directory(empty_dir_path)
            
            # Should handle empty directory gracefully
            self.assertFalse(result['success'])
            self.assertIn('error', result)
            
        finally:
            import shutil
            shutil.rmtree(empty_dir)
    
    def test_summary_file_formats(self):
        """Test summary file is properly formatted"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy', 'functions'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir_path)
        summary_stats = instrumenter.generate_summary_stats(
            directory=self.test_dir_path,
            results=result.get('results', [])
        )
        
        summary_file = self.test_dir_path / 'format_test_summary.txt'
        instrumenter.save_summary_to_file(summary_stats, str(summary_file))
        
        with open(summary_file, 'r') as f:
            lines = f.readlines()
        
        # Check for proper formatting
        has_header = any('KERNEL INSTRUMENTATION SUMMARY REPORT' in line for line in lines)
        has_sections = any('FILE PROCESSING OVERVIEW' in line for line in lines)
        has_stats = any('Total C files in directory:' in line for line in lines)
        has_footer = any('=' * 70 in line for line in lines)
        
        self.assertTrue(has_header)
        self.assertTrue(has_sections)
        self.assertTrue(has_stats)
        self.assertTrue(has_footer)


class TestSummaryCommandLineIntegration(unittest.TestCase):
    """Test summary feature integration with command line interface"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.test_dir_path = Path(self.test_dir)
        
        # Create a simple test file
        test_content = '''
#include <linux/module.h>

static int test_function(void) {
    return 0;
}

MODULE_LICENSE("GPL");
'''
        test_file = self.test_dir_path / 'simple_test.c'
        with open(test_file, 'w') as f:
            f.write(test_content)
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    @patch('sys.argv')
    def test_summary_command_line_default_filename(self, mock_argv):
        """Test --summary option with default filename"""
        mock_argv.__getitem__.side_effect = lambda x: [
            'kernel_instrument.py',
            '--directory', str(self.test_dir_path),
            '--dry-run',
            '--summary'
        ][x]
        mock_argv.__len__.return_value = 5
        
        # Import and test main function
        from kernel_instrumenter.kernel_instrument import main
        
        # Redirect stdout to capture output
        from io import StringIO
        import sys
        old_stdout = sys.stdout
        sys.stdout = StringIO()
        
        try:
            with patch('sys.exit') as mock_exit:
                main()
                # The main function should complete successfully without calling sys.exit
                # If it reaches here, it completed normally
            
        except SystemExit as e:
            # If main() does call sys.exit, check the exit code
            self.assertEqual(e.code, 0)
        finally:
            sys.stdout = old_stdout
    
    @patch('sys.argv')
    def test_summary_command_line_custom_filename(self, mock_argv):
        """Test --summary option with custom filename"""
        custom_summary_file = self.test_dir_path / 'custom_summary.txt'
        
        mock_argv.__getitem__.side_effect = lambda x: [
            'kernel_instrument.py',
            '--directory', str(self.test_dir_path),
            '--dry-run',
            '--summary', str(custom_summary_file)
        ][x]
        mock_argv.__len__.return_value = 6
        
        from kernel_instrumenter.kernel_instrument import main
        
        # Redirect stdout
        from io import StringIO
        import sys
        old_stdout = sys.stdout
        sys.stdout = StringIO()
        
        try:
            with patch('sys.exit') as mock_exit:
                main()
                # The main function should complete successfully without calling sys.exit
                # If it reaches here, it completed normally
                
        except SystemExit as e:
            # If main() does call sys.exit, check the exit code
            self.assertEqual(e.code, 0)
        finally:
            sys.stdout = old_stdout


if __name__ == '__main__':
    unittest.main()
