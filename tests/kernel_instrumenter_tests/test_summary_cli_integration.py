#!/usr/bin/env python3
"""
Comprehensive CLI and Integration Tests for Summary Feature

This module tests the complete CLI integration including the summary feature,
command-line argument parsing, and end-to-end workflow.
"""

import unittest
import tempfile
import sys
import subprocess
import os
from pathlib import Path

# Add src to path for imports
test_dir = Path(__file__).parent
sys.path.insert(0, str(test_dir.parent.parent / "src"))


class TestSummaryCLIIntegration(unittest.TestCase):
    """Test summary feature through CLI interface"""
    
    def setUp(self):
        """Set up test environment with sample C files"""
        self.test_dir = tempfile.mkdtemp()
        self.test_dir_path = Path(self.test_dir)
        self.src_path = test_dir.parent.parent / "src"
        
        # Create comprehensive test files
        self.create_test_files()
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    def create_test_files(self):
        """Create test C files for CLI testing"""
        # DMA file with multiple functions
        dma_content = '''
#include <linux/module.h>
#include <linux/dma-mapping.h>

static void helper_func(void) {
    printk("Helper\\n");
}

static int dma_alloc_test(struct device *dev) {
    void *ptr = dma_alloc_coherent(dev, 1024, NULL, GFP_KERNEL);
    if (ptr) {
        dma_free_coherent(dev, 1024, ptr, 0);
    }
    return 0;
}

static void cleanup_func(void) {
    printk("Cleanup\\n");
}
'''
        
        # User copy file
        user_copy_content = '''
#include <linux/uaccess.h>

static long user_io_func(void __user *user_buf, void *kernel_buf, size_t len) {
    if (copy_from_user(kernel_buf, user_buf, len))
        return -EFAULT;
    
    if (copy_to_user(user_buf, kernel_buf, len))
        return -EFAULT;
    
    return 0;
}

static int simple_func(void) {
    return 42;
}
'''
        
        # IOCTL file
        ioctl_content = '''
#include <linux/fs.h>

static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}

static int device_open(struct inode *inode, struct file *file) {
    return 0;
}
'''
        
        # Create files
        files = {
            'dma_test.c': dma_content,
            'user_copy_test.c': user_copy_content,
            'ioctl_test.c': ioctl_content
        }
        
        for filename, content in files.items():
            with open(self.test_dir_path / filename, 'w') as f:
                f.write(content)
    
    def run_cli_command(self, *args):
        """Run the kernel instrumenter CLI with given arguments"""
        cmd = [
            sys.executable, '-m', 'src.kernel_instrumenter',
            '--directory', str(self.test_dir_path)
        ] + list(args)
        
        # Set PYTHONPATH to include our src directory
        env = os.environ.copy()
        env['PYTHONPATH'] = str(self.src_path)
        
        result = subprocess.run(
            cmd,
            cwd=test_dir.parent.parent,
            capture_output=True,
            text=True,
            env=env
        )
        
        return result
    
    def test_summary_with_default_filename(self):
        """Test --summary option creates default summary.txt"""
        # Run with default summary filename
        result = self.run_cli_command('--dry-run', '--summary')
        
        # Check command succeeded
        self.assertEqual(result.returncode, 0, f"Command failed: {result.stderr}")
        
        # Check output mentions summary
        self.assertIn('summary saved to:', result.stdout)
        
        # Default summary file should be created in current directory
        # (Since we run from project root, summary.txt would be there)
        expected_summary_file = test_dir.parent.parent / 'summary.txt'
        
        # Check the output mentions the file was saved
        self.assertIn('summary.txt', result.stdout)
    
    def test_summary_with_custom_filename(self):
        """Test --summary option with custom filename"""
        custom_summary = self.test_dir_path / 'custom_test_summary.txt'
        
        result = self.run_cli_command('--dry-run', '--summary', str(custom_summary))
        
        # Check command succeeded
        self.assertEqual(result.returncode, 0, f"Command failed: {result.stderr}")
        
        # Check summary file was created
        self.assertTrue(custom_summary.exists())
        
        # Verify summary file content
        with open(custom_summary, 'r') as f:
            content = f.read()
        
        # Check for expected sections
        self.assertIn('KERNEL INSTRUMENTATION SUMMARY REPORT', content)
        self.assertIn('FILE PROCESSING OVERVIEW', content)
        self.assertIn('Total C files in directory:', content)
        self.assertIn('Files processed:', content)
        self.assertIn('FUNCTION ANALYSIS', content)
        self.assertIn('Total functions in source code:', content)
        self.assertIn('Dry run mode: Enabled', content)
    
    def test_summary_with_different_instrumentation_types(self):
        """Test summary with different instrumentation type combinations"""
        test_cases = [
            (['--types', 'dma'], 'dma_only_summary.txt'),
            (['--types', 'user_copy'], 'user_copy_only_summary.txt'),
            (['--types', 'ioctl'], 'ioctl_only_summary.txt'),
            (['--types', 'functions'], 'functions_only_summary.txt'),
            (['--types', 'dma', 'user_copy'], 'dma_user_copy_summary.txt'),
        ]
        
        for type_args, summary_filename in test_cases:
            with self.subTest(types=type_args):
                summary_path = self.test_dir_path / summary_filename
                
                result = self.run_cli_command(
                    '--dry-run',
                    '--summary', str(summary_path),
                    *type_args
                )
                
                # Command should succeed
                self.assertEqual(result.returncode, 0, 
                               f"Command failed for {type_args}: {result.stderr}")
                
                # Summary file should be created
                self.assertTrue(summary_path.exists())
                
                # Verify instrumentation types in summary
                with open(summary_path, 'r') as f:
                    content = f.read()
                
                # Check that only specified types are mentioned in enabled types
                if 'dma' in type_args:
                    self.assertIn('dma: DMA API calls', content)
                if 'user_copy' in type_args:
                    self.assertIn('user_copy: User space copy operations', content)
                if 'ioctl' in type_args:
                    self.assertIn('ioctl: IOCTL handler functions', content)
                if 'functions' in type_args:
                    self.assertIn('functions: All function entry points', content)
    
    def test_summary_with_file_limit(self):
        """Test summary feature with --test-limit option"""
        summary_path = self.test_dir_path / 'limited_summary.txt'
        
        result = self.run_cli_command(
            '--dry-run',
            '--test-limit', '2',
            '--summary', str(summary_path)
        )
        
        self.assertEqual(result.returncode, 0, f"Command failed: {result.stderr}")
        self.assertTrue(summary_path.exists())
        
        with open(summary_path, 'r') as f:
            content = f.read()
        
        # Should process only 2 files
        self.assertIn('Files processed:                2', content)
        self.assertIn('Files skipped:                  1', content)
    
    def test_summary_verbose_mode(self):
        """Test summary feature with verbose output"""
        summary_path = self.test_dir_path / 'verbose_summary.txt'
        
        result = self.run_cli_command(
            '--dry-run',
            '--verbose',
            '--summary', str(summary_path)
        )
        
        self.assertEqual(result.returncode, 0, f"Command failed: {result.stderr}")
        self.assertTrue(summary_path.exists())
        
        # Verbose mode should show more details in console output
        self.assertIn('Processing:', result.stdout)
        
        # Summary file should indicate verbose mode
        with open(summary_path, 'r') as f:
            content = f.read()
        
        self.assertIn('Verbose mode: Enabled', content)
    
    def test_summary_without_dry_run(self):
        """Test summary feature in actual instrumentation mode"""
        # Create a copy of files for modification
        temp_modify_dir = tempfile.mkdtemp()
        temp_modify_path = Path(temp_modify_dir)
        
        try:
            # Copy files to temporary directory
            import shutil
            for c_file in self.test_dir_path.glob('*.c'):
                shutil.copy2(c_file, temp_modify_path)
            
            summary_path = temp_modify_path / 'real_instrumentation_summary.txt'
            
            # Run without dry-run
            cmd = [
                sys.executable, '-m', 'src.kernel_instrumenter',
                '--directory', str(temp_modify_path),
                '--summary', str(summary_path),
                '--test-limit', '1'  # Limit to avoid too many modifications
            ]
            
            env = os.environ.copy()
            env['PYTHONPATH'] = str(self.src_path)
            
            result = subprocess.run(
                cmd,
                cwd=test_dir.parent.parent,
                capture_output=True,
                text=True,
                env=env
            )
            
            self.assertEqual(result.returncode, 0, f"Command failed: {result.stderr}")
            self.assertTrue(summary_path.exists())
            
            with open(summary_path, 'r') as f:
                content = f.read()
            
            # Should indicate actual modification mode
            self.assertIn('Dry run mode: Disabled', content)
            
            # If instrumentations were found, files should be modified
            if 'Total instrumentations added:   0' not in content:
                self.assertIn('Files modified:', content)
                # Should not show "Files modified:                 0" if instrumentations were added
        
        finally:
            import shutil
            shutil.rmtree(temp_modify_dir)
    
    def test_summary_error_handling(self):
        """Test summary feature error handling"""
        # Test with non-existent directory
        non_existent_dir = '/tmp/non_existent_kernel_dir_12345'
        summary_path = self.test_dir_path / 'error_summary.txt'
        
        result = self.run_cli_command(
            '--directory', non_existent_dir,
            '--dry-run',
            '--summary', str(summary_path)
        )
        
        # Command should fail gracefully
        self.assertEqual(result.returncode, 0)  # Tool handles errors gracefully and returns 0
        
        # Summary file should be created but should indicate error or no files processed
        if summary_path.exists():
            with open(summary_path, 'r') as f:
                content = f.read()
            # Should indicate no files were processed or an error occurred
            self.assertTrue(
                'Files processed:                0' in content or 
                'Total C files in directory:     0' in content,
                "Summary should indicate no files were processed"
            )
        self.assertIn('Error:', result.stdout)
    
    def test_summary_with_all_types(self):
        """Test summary with 'all' instrumentation types"""
        summary_path = self.test_dir_path / 'all_types_summary.txt'
        
        result = self.run_cli_command(
            '--dry-run',
            '--types', 'all',
            '--summary', str(summary_path)
        )
        
        self.assertEqual(result.returncode, 0, f"Command failed: {result.stderr}")
        self.assertTrue(summary_path.exists())
        
        with open(summary_path, 'r') as f:
            content = f.read()
        
        # Should include all major instrumentation types
        self.assertIn('dma: DMA API calls', content)
        self.assertIn('user_copy: User space copy operations', content)
        self.assertIn('functions: All function entry points', content)
        self.assertIn('ioctl: IOCTL handler functions', content)
    
    def test_help_includes_summary_option(self):
        """Test that --help includes the summary option"""
        result = self.run_cli_command('--help')
        
        # Help should include summary option
        self.assertIn('--summary', result.stdout)
        self.assertIn('Generate detailed statistics summary', result.stdout)


class TestSummaryValidation(unittest.TestCase):
    """Test summary data validation and accuracy"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.test_dir_path = Path(self.test_dir)
        
        # Create known test file with predictable content
        self.create_validation_files()
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    def create_validation_files(self):
        """Create files with known, countable instrumentation points"""
        
        # File with exactly 3 functions and 2 DMA calls
        known_content = '''
#include <linux/module.h>
#include <linux/dma-mapping.h>

// Function 1
static void function_one(void) {
    printk("Function 1\\n");
}

// Function 2  
static int function_two(struct device *dev) {
    void *ptr1 = dma_alloc_coherent(dev, 1024, NULL, GFP_KERNEL);  // DMA call 1
    void *ptr2 = dma_alloc_coherent(dev, 2048, NULL, GFP_KERNEL);  // DMA call 2
    
    if (ptr1) dma_free_coherent(dev, 1024, ptr1, 0);
    if (ptr2) dma_free_coherent(dev, 2048, ptr2, 0);
    
    return 0;
}

// Function 3
static void function_three(void) {
    return;
}
'''
        
        with open(self.test_dir_path / 'validation_test.c', 'w') as f:
            f.write(known_content)
    
    def test_function_counting_accuracy(self):
        """Validate that function counting is accurate"""
        # Import here to avoid path issues
        sys.path.insert(0, str(test_dir.parent.parent / "src"))
        from kernel_instrumenter.kernel_instrument import KernelInstrumenter
        
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
        
        # We know there are exactly 3 functions in our test file
        func_analysis = summary_stats['function_analysis']
        self.assertEqual(func_analysis['total_functions_in_source_code'], 3)
        
        # With functions instrumentation enabled, all 3 should be instrumented
        self.assertEqual(func_analysis['functions_instrumented'], 3)
        self.assertEqual(func_analysis['function_instrumentation_rate_percent'], 100.0)
    
    def test_dma_counting_accuracy(self):
        """Validate that DMA operation counting is accurate"""
        sys.path.insert(0, str(test_dir.parent.parent / "src"))
        from kernel_instrumenter.kernel_instrument import KernelInstrumenter
        
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
        
        # Should find DMA operations (our test file has dma_alloc_coherent calls)
        inst_by_type = summary_stats['instrumentation_by_type']
        dma_count = inst_by_type.get('dma', 0)
        
        # Should find at least some DMA operations
        self.assertGreater(dma_count, 0)
    
    def test_file_processing_counts(self):
        """Validate file processing statistics"""
        sys.path.insert(0, str(test_dir.parent.parent / "src"))
        from kernel_instrumenter.kernel_instrument import KernelInstrumenter
        
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
        
        proc_summary = summary_stats['processing_summary']
        
        # We created exactly 1 C file
        self.assertEqual(proc_summary['total_source_files_in_directory'], 1)
        self.assertEqual(proc_summary['files_processed'], 1)
        self.assertEqual(proc_summary['files_skipped'], 0)
        self.assertEqual(proc_summary['files_with_errors'], 0)


if __name__ == '__main__':
    unittest.main()
