#!/usr/bin/env python3
"""
IOCTL CLI Integration Tests

This module tests the ioctl functionality through the command-line interface
to ensure end-to-end functionality works correctly.
"""

import unittest
import tempfile
import subprocess
import sys
from pathlib import Path

# Add src to path for imports
test_dir = Path(__file__).parent
sys.path.insert(0, str(test_dir.parent.parent / "src"))


class TestIoctlCLIIntegration(unittest.TestCase):
    """Test ioctl functionality through CLI interface"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.script_path = test_dir.parent.parent / "src" / "kernel_instrumenter" / "kernel_instrument.py"
        
    def test_ioctl_help_option(self):
        """Test that ioctl appears in help text"""
        try:
            result = subprocess.run([
                sys.executable, str(self.script_path), '--help'
            ], capture_output=True, text=True, timeout=30)
            
            self.assertEqual(result.returncode, 0, "Help command should succeed")
            self.assertIn('ioctl', result.stdout, "Help should mention ioctl option")
            self.assertIn('ioctl handler functions', result.stdout, 
                         "Help should describe ioctl functionality")
        except subprocess.TimeoutExpired:
            self.fail("Help command timed out")
        except Exception as e:
            self.fail(f"Failed to run help command: {e}")

    def test_ioctl_dry_run_single_file(self):
        """Test ioctl instrumentation in dry-run mode with single file"""
        # Create test file with ioctl handler
        test_file = Path(self.test_dir) / "test_driver.c"
        test_content = '''
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

static int regular_function(void) {
    return 0;
}

MODULE_LICENSE("GPL");
'''
        test_file.write_text(test_content)
        
        try:
            result = subprocess.run([
                sys.executable, str(self.script_path),
                '--directory', str(self.test_dir),
                '--types', 'ioctl',
                '--dry-run',
                '--verbose'
            ], capture_output=True, text=True, timeout=30)
            
            # Should succeed
            self.assertEqual(result.returncode, 0, f"Command failed: {result.stderr}")
            
            # Should mention ioctl in output
            self.assertIn('ioctl', result.stdout, "Output should mention ioctl instrumentation")
            self.assertIn('device_ioctl', result.stdout, "Output should find device_ioctl function")
            self.assertIn('DRY RUN', result.stdout, "Output should indicate dry run mode")
            
        except subprocess.TimeoutExpired:
            self.fail("Command timed out")
        except Exception as e:
            self.fail(f"Failed to run command: {e}")

    def test_ioctl_with_multiple_types(self):
        """Test ioctl combined with other instrumentation types"""
        # Create test file with multiple instrumentation targets
        test_file = Path(self.test_dir) / "multi_driver.c"
        test_content = '''
#include <linux/module.h>
#include <linux/dma-mapping.h>
#include <linux/uaccess.h>

static void init_function(void) {
    printk("Initializing driver\\n");
}

static long driver_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    void *dma_buffer;
    char user_data[256];
    
    // DMA operation
    dma_buffer = dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);
    if (!dma_buffer) {
        return -ENOMEM;
    }
    
    // User copy operation
    if (copy_from_user(user_data, (void __user *)arg, sizeof(user_data))) {
        dma_free_coherent(NULL, 1024, dma_buffer, 0);
        return -EFAULT;
    }
    
    dma_free_coherent(NULL, 1024, dma_buffer, 0);
    return 0;
}
'''
        test_file.write_text(test_content)
        
        try:
            result = subprocess.run([
                sys.executable, str(self.script_path),
                '--directory', str(self.test_dir),
                '--types', 'dma', 'user_copy', 'functions', 'ioctl',
                '--dry-run',
                '--verbose'
            ], capture_output=True, text=True, timeout=30)
            
            self.assertEqual(result.returncode, 0, f"Command failed: {result.stderr}")
            
            # Should find all types of instrumentations
            self.assertIn('dma:', result.stdout, "Should find DMA instrumentations")
            self.assertIn('user_copy:', result.stdout, "Should find user_copy instrumentations")
            self.assertIn('functions:', result.stdout, "Should find function instrumentations")
            self.assertIn('ioctl:', result.stdout, "Should find ioctl instrumentations")
            
        except subprocess.TimeoutExpired:
            self.fail("Command timed out")
        except Exception as e:
            self.fail(f"Failed to run command: {e}")

    def test_ioctl_all_types_option(self):
        """Test that 'all' types option includes ioctl"""
        test_file = Path(self.test_dir) / "simple_ioctl.c"
        test_content = '''
static long simple_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}
'''
        test_file.write_text(test_content)
        
        try:
            result = subprocess.run([
                sys.executable, str(self.script_path),
                '--directory', str(self.test_dir),
                '--types', 'all',
                '--dry-run',
                '--verbose'
            ], capture_output=True, text=True, timeout=30)
            
            self.assertEqual(result.returncode, 0, f"Command failed: {result.stderr}")
            
            # Should include ioctl when using 'all'
            self.assertIn('ioctl:', result.stdout, "All types should include ioctl")
            
        except subprocess.TimeoutExpired:
            self.fail("Command timed out")
        except Exception as e:
            self.fail(f"Failed to run command: {e}")

    def test_ioctl_empty_directory(self):
        """Test ioctl instrumentation on empty directory"""
        empty_dir = Path(self.test_dir) / "empty"
        empty_dir.mkdir()
        
        try:
            result = subprocess.run([
                sys.executable, str(self.script_path),
                '--directory', str(empty_dir),
                '--types', 'ioctl',
                '--dry-run'
            ], capture_output=True, text=True, timeout=30)
            
            # Should fail gracefully with no C files found
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('No .c files found', result.stdout)
            
        except subprocess.TimeoutExpired:
            self.fail("Command timed out")
        except Exception as e:
            self.fail(f"Failed to run command: {e}")

    def test_ioctl_no_handlers_found(self):
        """Test handling when no ioctl handlers are found"""
        test_file = Path(self.test_dir) / "no_ioctl.c"
        test_content = '''
#include <linux/module.h>

static int init_module(void) {
    return 0;
}

static void cleanup_module(void) {
}

static int helper_function(void) {
    return 42;
}
'''
        test_file.write_text(test_content)
        
        try:
            result = subprocess.run([
                sys.executable, str(self.script_path),
                '--directory', str(self.test_dir),
                '--types', 'ioctl',
                '--dry-run',
                '--verbose'
            ], capture_output=True, text=True, timeout=30)
            
            self.assertEqual(result.returncode, 0, f"Command failed: {result.stderr}")
            
            # Should complete successfully but find no ioctl handlers
            self.assertIn('No instrumentable items found', result.stdout)
            
        except subprocess.TimeoutExpired:
            self.fail("Command timed out")
        except Exception as e:
            self.fail(f"Failed to run command: {e}")

    def test_ioctl_complex_signatures(self):
        """Test detection of ioctl handlers with various signature patterns"""
        test_file = Path(self.test_dir) / "complex_ioctl.c"
        test_content = '''
#include <linux/module.h>
#include <linux/fs.h>

// Standard unlocked ioctl
static long device_unlocked_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}

// Compatibility ioctl
static long device_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return device_unlocked_ioctl(file, cmd, arg);
}

// Function with ioctl-like signature but different name
static long control_handler(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}

// Regular function (should not be detected as ioctl)
static int setup_device(struct device *dev) {
    return 0;
}
'''
        test_file.write_text(test_content)
        
        try:
            result = subprocess.run([
                sys.executable, str(self.script_path),
                '--directory', str(self.test_dir),
                '--types', 'ioctl',
                '--dry-run',
                '--verbose'
            ], capture_output=True, text=True, timeout=30)
            
            self.assertEqual(result.returncode, 0, f"Command failed: {result.stderr}")
            
            # Should detect ioctl handlers
            self.assertIn('ioctl:', result.stdout, "Should find ioctl instrumentations")
            
            # Should mention specific handlers found
            output_lines = result.stdout
            self.assertTrue(
                'device_unlocked_ioctl' in output_lines or 'device_compat_ioctl' in output_lines,
                "Should detect at least one of the obvious ioctl handlers"
            )
            
        except subprocess.TimeoutExpired:
            self.fail("Command timed out")
        except Exception as e:
            self.fail(f"Failed to run command: {e}")

    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir, ignore_errors=True)


if __name__ == '__main__':
    unittest.main()
