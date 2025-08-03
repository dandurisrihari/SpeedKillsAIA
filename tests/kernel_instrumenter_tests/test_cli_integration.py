#!/usr/bin/env python3
"""
CLI Integration Tests for kernel_instrument.py

This module tests the main CLI entry point and command-line interface
functionality of the kernel instrumentation tool.
"""

import unittest
import tempfile
import subprocess
import sys
import os
from pathlib import Path

class TestCLIIntegration(unittest.TestCase):
    """Test the kernel_instrument.py CLI interface"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.test_file_path = Path(self.test_dir) / "test_driver.c"
        
        # Create a test C file with DMA and user copy operations
        test_content = '''
#include <linux/module.h>
#include <linux/dma-mapping.h>
#include <linux/uaccess.h>

static int test_function(void) {
    void *dma_ptr;
    char buffer[256];
    
    // DMA allocation
    dma_ptr = dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);
    if (!dma_ptr) {
        return -ENOMEM;
    }
    
    // User copy operation
    if (copy_to_user(buffer, "test", 4)) {
        dma_free_coherent(NULL, 1024, dma_ptr, 0);
        return -EFAULT;
    }
    
    dma_free_coherent(NULL, 1024, dma_ptr, 0);
    return 0;
}

static int __init test_init(void) {
    return test_function();
}

static void __exit test_exit(void) {
    printk(KERN_INFO "Test module unloaded\\n");
}

module_init(test_init);
module_exit(test_exit);
MODULE_LICENSE("GPL");
'''
        
        with open(self.test_file_path, 'w') as f:
            f.write(test_content)
        
        # Path to the kernel_instrument.py script
        self.script_path = Path(__file__).parent.parent.parent / "src" / "kernel_instrumenter" / "kernel_instrument.py"
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    def run_cli_command(self, args, expect_success=True):
        """
        Run the CLI command and return the result
        
        Args:
            args: List of command line arguments
            expect_success: Whether to expect the command to succeed
            
        Returns:
            Tuple of (returncode, stdout, stderr)
        """
        cmd = [sys.executable, str(self.script_path)] + args
        
        try:
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=30,
                cwd=self.script_path.parent.parent.parent
            )
            
            if expect_success and result.returncode != 0:
                self.fail(f"Command failed: {' '.join(cmd)}\nStdout: {result.stdout}\nStderr: {result.stderr}")
            
            return result.returncode, result.stdout, result.stderr
        
        except subprocess.TimeoutExpired:
            self.fail(f"Command timed out: {' '.join(cmd)}")
    
    def test_help_command(self):
        """Test the --help option"""
        returncode, stdout, stderr = self.run_cli_command(["--help"])
        
        self.assertEqual(returncode, 0)
        self.assertIn("Comprehensive kernel instrumentation tool", stdout)
        self.assertIn("--directory", stdout)
        self.assertIn("--types", stdout)
        self.assertIn("--dry-run", stdout)
        self.assertIn("--verbose", stdout)
    
    def test_dry_run_dma_only(self):
        """Test dry-run mode with DMA only instrumentation"""
        returncode, stdout, stderr = self.run_cli_command([
            "-d", self.test_dir,
            "--types", "dma",
            "--dry-run",
            "--verbose"
        ])
        
        self.assertEqual(returncode, 0)
        self.assertIn("DRY RUN MODE", stdout)
        self.assertIn("dma_alloc_coherent", stdout)
        self.assertIn("dma_free_coherent", stdout)
        
        # Ensure original file is unchanged
        with open(self.test_file_path, 'r') as f:
            content = f.read()
        self.assertNotIn("printk(KERN_INFO \"DMA_INSTRUMENT:", content)
    
    def test_dry_run_user_copy_only(self):
        """Test dry-run mode with user copy only instrumentation"""
        returncode, stdout, stderr = self.run_cli_command([
            "-d", self.test_dir,
            "--types", "user_copy",
            "--dry-run",
            "--verbose"
        ])
        
        self.assertEqual(returncode, 0)
        self.assertIn("DRY RUN MODE", stdout)
        self.assertIn("copy_to_user", stdout)
    
    def test_dry_run_functions_only(self):
        """Test dry-run mode with function instrumentation only"""
        returncode, stdout, stderr = self.run_cli_command([
            "-d", self.test_dir,
            "--types", "functions",
            "--dry-run",
            "--verbose"
        ])
        
        self.assertEqual(returncode, 0)
        self.assertIn("DRY RUN MODE", stdout)
        self.assertIn("test_function", stdout)
    
    def test_dry_run_ioctl_only(self):
        """Test dry-run mode with ioctl instrumentation only"""
        # Create a test file with ioctl handler
        ioctl_file = Path(self.test_dir) / "ioctl_test.c"
        ioctl_content = '''
#include <linux/module.h>
#include <linux/fs.h>

static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    switch (cmd) {
        case 0x1000:
            return 0;
        default:
            return -EINVAL;
    }
}
'''
        ioctl_file.write_text(ioctl_content)
        
        returncode, stdout, stderr = self.run_cli_command([
            "-d", self.test_dir,
            "--types", "ioctl",
            "--dry-run",
            "--verbose"
        ])
        
        self.assertEqual(returncode, 0)
        self.assertIn("DRY RUN MODE", stdout)
        self.assertIn("device_ioctl", stdout)
    
    def test_dry_run_multiple_types(self):
        """Test dry-run mode with multiple instrumentation types"""
        returncode, stdout, stderr = self.run_cli_command([
            "-d", self.test_dir,
            "--types", "dma", "user_copy", "functions",
            "--dry-run",
            "--verbose"
        ])
        
        self.assertEqual(returncode, 0)
        self.assertIn("DRY RUN MODE", stdout)
        # Should find all types
        self.assertIn("dma:", stdout)
        self.assertIn("user_copy:", stdout)
        self.assertIn("functions:", stdout)
    
    def test_dry_run_all_types(self):
        """Test dry-run mode with all instrumentation types"""
        returncode, stdout, stderr = self.run_cli_command([
            "-d", self.test_dir,
            "--types", "all",
            "--dry-run",
            "--verbose"
        ])
        
        self.assertEqual(returncode, 0)
        self.assertIn("DRY RUN MODE", stdout)
    
    def test_actual_instrumentation_dma(self):
        """Test actual DMA instrumentation (not dry-run)"""
        returncode, stdout, stderr = self.run_cli_command([
            "-d", self.test_dir,
            "--types", "dma",
            "--verbose"
        ])
        
        self.assertEqual(returncode, 0)
        self.assertIn("✅ Instrumentation completed successfully!", stdout)
        
        # Check that backup was created
        backup_path = self.test_file_path.with_suffix(self.test_file_path.suffix + '.backup')
        self.assertTrue(backup_path.exists())
        
        # Check that instrumentation was added
        with open(self.test_file_path, 'r') as f:
            content = f.read()
        self.assertIn("printk(KERN_INFO \"DMA_INSTRUMENT:", content)
        self.assertIn("dma_alloc_coherent", content)
    
    def test_test_limit_option(self):
        """Test the --test-limit option"""
        # Create multiple test files
        for i in range(3):
            test_file = Path(self.test_dir) / f"test_file_{i}.c"
            with open(test_file, 'w') as f:
                f.write('''
#include <linux/module.h>
#include <linux/dma-mapping.h>

void test_func(void) {
    dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);
}
''')
        
        returncode, stdout, stderr = self.run_cli_command([
            "-d", self.test_dir,
            "--types", "dma",
            "--test-limit", "2",
            "--dry-run",
            "--verbose"
        ])
        
        self.assertEqual(returncode, 0)
        self.assertIn("Processing first 2 files", stdout)
    
    def test_missing_directory_error(self):
        """Test error handling for missing directory argument"""
        returncode, stdout, stderr = self.run_cli_command([
            "--types", "dma"
        ], expect_success=False)
        
        self.assertNotEqual(returncode, 0)
        self.assertIn("required", stderr)
    
    def test_invalid_directory_error(self):
        """Test error handling for invalid directory"""
        returncode, stdout, stderr = self.run_cli_command([
            "-d", "/nonexistent/directory",
            "--types", "dma",
            "--dry-run"
        ], expect_success=False)
        
        self.assertNotEqual(returncode, 0)
        self.assertIn("does not exist", stdout)
    
    def test_empty_directory(self):
        """Test handling of directory with no C files"""
        empty_dir = tempfile.mkdtemp()
        try:
            returncode, stdout, stderr = self.run_cli_command([
                "-d", empty_dir,
                "--types", "dma",
                "--dry-run"
            ], expect_success=False)
            
            self.assertNotEqual(returncode, 0)
            self.assertIn("No .c files found", stdout)
        finally:
            os.rmdir(empty_dir)
    
    def test_verbose_output_detail(self):
        """Test verbose output provides detailed information"""
        returncode, stdout, stderr = self.run_cli_command([
            "-d", self.test_dir,
            "--types", "dma",
            "--dry-run",
            "--verbose"
        ])
        
        self.assertEqual(returncode, 0)
        self.assertIn("Processing:", stdout)
        self.assertIn("Found", stdout)
        self.assertIn("Enabled instrumentation types:", stdout)
        self.assertIn("Instrumentation Summary", stdout)
    
    def test_non_verbose_output(self):
        """Test that non-verbose mode produces less output"""
        returncode, stdout, stderr = self.run_cli_command([
            "-d", self.test_dir,
            "--types", "dma",
            "--dry-run"
        ])
        
        self.assertEqual(returncode, 0)
        # Non-verbose should still show summary but less detail
        self.assertIn("Found", stdout)
        self.assertNotIn("Processing:", stdout)


class TestCLIEdgeCases(unittest.TestCase):
    """Test edge cases and error conditions in CLI"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.script_path = Path(__file__).parent.parent.parent / "src" / "kernel_instrumenter" / "kernel_instrument.py"
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    def run_cli_command(self, args, expect_success=True):
        """Helper to run CLI commands"""
        cmd = [sys.executable, str(self.script_path)] + args
        
        try:
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=30,
                cwd=self.script_path.parent.parent.parent
            )
            
            if expect_success and result.returncode != 0:
                self.fail(f"Command failed: {' '.join(cmd)}\nStdout: {result.stdout}\nStderr: {result.stderr}")
            
            return result.returncode, result.stdout, result.stderr
        
        except subprocess.TimeoutExpired:
            self.fail(f"Command timed out: {' '.join(cmd)}")
    
    def test_malformed_c_file(self):
        """Test handling of malformed C files"""
        malformed_file = Path(self.test_dir) / "malformed.c"
        with open(malformed_file, 'w') as f:
            f.write("This is not valid C code { { { incomplete")
        
        returncode, stdout, stderr = self.run_cli_command([
            "-d", self.test_dir,
            "--types", "dma",
            "--dry-run",
            "--verbose"
        ])
        
        # Should handle malformed files gracefully
        self.assertEqual(returncode, 0)  # Should complete even with malformed files
    
    def test_file_with_no_instrumentable_content(self):
        """Test handling of C files with no instrumentable content"""
        simple_file = Path(self.test_dir) / "simple.c"
        with open(simple_file, 'w') as f:
            f.write('''
#include <stdio.h>

int main() {
    printf("Hello world\\n");
    return 0;
}
''')
        
        returncode, stdout, stderr = self.run_cli_command([
            "-d", self.test_dir,
            "--types", "dma",
            "--dry-run",
            "--verbose"
        ])
        
        self.assertEqual(returncode, 0)
        self.assertIn("No instrumentable items found", stdout)
    
    def test_invalid_instrumentation_type(self):
        """Test error handling for invalid instrumentation types"""
        returncode, stdout, stderr = self.run_cli_command([
            "-d", self.test_dir,
            "--types", "invalid_type",
            "--dry-run"
        ], expect_success=False)
        
        self.assertNotEqual(returncode, 0)
        self.assertIn("invalid choice", stderr)


if __name__ == '__main__':
    # Set up test environment
    test_dir = Path(__file__).parent
    sys.path.insert(0, str(test_dir.parent.parent / "src"))
    
    # Run tests
    unittest.main(verbosity=2)
