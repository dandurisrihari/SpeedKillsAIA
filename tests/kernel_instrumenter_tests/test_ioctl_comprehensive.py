#!/usr/bin/env python3
"""
IOCTL Instrumentation Comprehensive Tests

This module tests the complete ioctl instrumentation functionality including
the actual instrumentation code generation and placement.
"""

import unittest
import tempfile
import sys
from pathlib import Path

# Add src to path for imports
test_dir = Path(__file__).parent
sys.path.insert(0, str(test_dir.parent.parent / "src"))

from kernel_instrumenter.kernel_instrument import KernelInstrumenter


class TestIoctlInstrumentationComprehensive(unittest.TestCase):
    """Comprehensive tests for ioctl instrumentation functionality"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        
    def test_ioctl_instrumentation_code_generation(self):
        """Test that proper instrumentation code is generated for ioctl handlers"""
        test_file = Path(self.test_dir) / "ioctl_test.c"
        test_content = '''#include <linux/module.h>
#include <linux/fs.h>

static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    int result = 0;
    
    switch (cmd) {
        case 0x1000:
            result = handle_read_command(arg);
            break;
        case 0x1001:
            result = handle_write_command(arg);
            break;
        default:
            return -EINVAL;
    }
    
    return result;
}'''
        test_file.write_text(test_content)
        
        # Test actual instrumentation (not dry-run)
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=False, verbose=True)
        result = instrumenter.instrument_file(test_file)
        
        self.assertTrue(result['success'], f"Instrumentation should succeed: {result}")
        self.assertTrue(result['modified'], "File should be modified")
        
        # Read the instrumented file
        instrumented_content = test_file.read_text()
        
        # Should contain our instrumentation
        self.assertIn('IOCTL_HANDLER', instrumented_content, 
                     "Should contain ioctl handler instrumentation")
        self.assertIn('printk', instrumented_content, 
                     "Should contain printk statement")
        self.assertIn('device_ioctl', instrumented_content, 
                     "Should mention the function name in instrumentation")
        self.assertIn('__FILE__', instrumented_content, 
                     "Should include file name in instrumentation")
        self.assertIn('__LINE__', instrumented_content, 
                     "Should include line number in instrumentation")
        
        # Verify backup was created
        backup_file = test_file.with_suffix(test_file.suffix + '.backup')
        self.assertTrue(backup_file.exists(), "Backup file should be created")
        
        # Backup should contain original content
        backup_content = backup_file.read_text()
        self.assertEqual(backup_content, test_content, "Backup should contain original content")

    def test_ioctl_instrumentation_placement(self):
        """Test that instrumentation is placed at the correct location"""
        test_file = Path(self.test_dir) / "placement_test.c"
        test_content = '''static long my_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    // This is the first line of the function
    int local_var = 0;
    
    if (cmd == 0x1000) {
        local_var = 1;
    }
    
    return local_var;
}'''
        test_file.write_text(test_content)
        
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=False, verbose=False)
        result = instrumenter.instrument_file(test_file)
        
        self.assertTrue(result['success'])
        self.assertTrue(result['modified'])
        
        instrumented_content = test_file.read_text()
        lines = instrumented_content.split('\n')
        
        # Find the function start and instrumentation
        function_line = -1
        instrumentation_line = -1
        
        for i, line in enumerate(lines):
            if 'my_ioctl' in line and '(' in line:
                function_line = i
            if 'IOCTL_HANDLER' in line:
                instrumentation_line = i
                break
        
        self.assertNotEqual(function_line, -1, "Should find function definition")
        self.assertNotEqual(instrumentation_line, -1, "Should find instrumentation")
        
        # Instrumentation should be near the beginning of the function
        self.assertGreaterEqual(instrumentation_line, function_line,
                              "Instrumentation should be at or after function definition")
        self.assertLess(instrumentation_line - function_line, 5, 
                       "Instrumentation should be close to function start")

    def test_multiple_ioctl_handlers_instrumentation(self):
        """Test instrumentation of multiple ioctl handlers in one file"""
        test_file = Path(self.test_dir) / "multiple_ioctl.c"
        test_content = '''#include <linux/module.h>

static long first_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}

static int regular_function(void) {
    return 1;
}

static long second_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}

static long third_unlocked_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}'''
        test_file.write_text(test_content)
        
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=False, verbose=False)
        result = instrumenter.instrument_file(test_file)
        
        self.assertTrue(result['success'])
        self.assertTrue(result['modified'])
        
        instrumented_content = test_file.read_text()
        
        # Should have instrumented all three ioctl handlers
        ioctl_instrumentations = instrumented_content.count('IOCTL_HANDLER')
        self.assertGreaterEqual(ioctl_instrumentations, 3, 
                               "Should instrument all ioctl handlers")
        
        # Verify specific function names are mentioned in instrumentation
        self.assertIn('first_ioctl', instrumented_content)
        self.assertIn('second_ioctl', instrumented_content)
        self.assertIn('third_unlocked_ioctl', instrumented_content)
        
        # Regular function should not be instrumented
        self.assertNotIn('regular_function called', instrumented_content)

    def test_ioctl_with_complex_body(self):
        """Test instrumentation of ioctl handler with complex function body"""
        test_file = Path(self.test_dir) / "complex_ioctl.c"
        test_content = '''#include <linux/module.h>
#include <linux/uaccess.h>

static long complex_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    struct my_ioctl_data data;
    int ret = 0;
    
    /* Copy data from user space */
    if (copy_from_user(&data, (void __user *)arg, sizeof(data))) {
        return -EFAULT;
    }
    
    /* Process the command */
    switch (cmd) {
        case CMD_READ_DATA:
            ret = process_read(&data);
            if (ret < 0) {
                goto error_exit;
            }
            break;
            
        case CMD_WRITE_DATA:
            ret = process_write(&data);
            if (ret < 0) {
                goto error_exit;
            }
            break;
            
        case CMD_RESET:
            ret = device_reset();
            break;
            
        default:
            ret = -EINVAL;
            goto error_exit;
    }
    
    /* Copy result back to user */
    if (copy_to_user((void __user *)arg, &data, sizeof(data))) {
        ret = -EFAULT;
        goto error_exit;
    }
    
    return 0;
    
error_exit:
    cleanup_resources(&data);
    return ret;
}'''
        test_file.write_text(test_content)
        
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=False, verbose=False)
        result = instrumenter.instrument_file(test_file)
        
        self.assertTrue(result['success'])
        self.assertTrue(result['modified'])
        
        instrumented_content = test_file.read_text()
        
        # Should contain instrumentation
        self.assertIn('IOCTL_HANDLER', instrumented_content)
        self.assertIn('complex_ioctl', instrumented_content)
        
        # Original complex logic should be preserved
        self.assertIn('copy_from_user', instrumented_content)
        self.assertIn('copy_to_user', instrumented_content)
        self.assertIn('switch (cmd)', instrumented_content)
        self.assertIn('error_exit:', instrumented_content)
        self.assertIn('cleanup_resources', instrumented_content)

    def test_ioctl_instrumentation_headers(self):
        """Test that required headers are properly handled"""
        test_file = Path(self.test_dir) / "header_test.c"
        test_content = '''// Simple file without kernel headers
static long simple_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}'''
        test_file.write_text(test_content)
        
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=False, verbose=False)
        result = instrumenter.instrument_file(test_file)
        
        self.assertTrue(result['success'])
        self.assertTrue(result['modified'])
        
        instrumented_content = test_file.read_text()
        
        # Should add required headers for printk
        self.assertIn('#include <linux/kernel.h>', instrumented_content)
        self.assertIn('#include <linux/printk.h>', instrumented_content)

    def test_ioctl_edge_cases(self):
        """Test edge cases in ioctl handler detection and instrumentation"""
        test_file = Path(self.test_dir) / "edge_cases.c"
        test_content = '''#include <linux/module.h>

// Function with ioctl in name but wrong signature
static void ioctl_helper(void) {
    return;
}

// Function with correct signature but no ioctl in name
static long control_func(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}

// Function with partial ioctl signature
static int partial_ioctl(unsigned int cmd) {
    return 0;
}

// Correct ioctl handler
static long proper_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}'''
        test_file.write_text(test_content)
        
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=False, verbose=False)
        result = instrumenter.instrument_file(test_file)
        
        # Should succeed even with edge cases
        self.assertTrue(result['success'])
        
        instrumented_content = test_file.read_text()
        
        # Should instrument at least the proper ioctl handler
        self.assertIn('IOCTL_HANDLER', instrumented_content)
        
        # Should handle the control_func if signature detection works
        # (this depends on the sophistication of signature detection)

    def test_ioctl_instrumentation_preserves_formatting(self):
        """Test that instrumentation preserves original code formatting"""
        test_file = Path(self.test_dir) / "formatting_test.c"
        test_content = '''#include <linux/module.h>

    static long formatted_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
        int result = 0;
        
        if (cmd == 0x1000) {
            result = handle_command();
        } else {
            result = -EINVAL;
        }
        
        return result;
    }'''
        test_file.write_text(test_content)
        
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=False, verbose=False)
        result = instrumenter.instrument_file(test_file)
        
        self.assertTrue(result['success'])
        self.assertTrue(result['modified'])
        
        instrumented_content = test_file.read_text()
        
        # Original formatting should be mostly preserved
        self.assertIn('if (cmd == 0x1000)', instrumented_content)
        self.assertIn('} else {', instrumented_content)
        self.assertIn('return result;', instrumented_content)
        
        # Instrumentation should be properly indented
        lines = instrumented_content.split('\n')
        instrumentation_line = None
        for line in lines:
            if 'IOCTL_HANDLER' in line:
                instrumentation_line = line
                break
        
        self.assertIsNotNone(instrumentation_line, "Should find instrumentation line")
        # Should have some indentation (not at column 0)
        self.assertTrue(instrumentation_line.startswith('    '), 
                       "Instrumentation should be properly indented")

    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir, ignore_errors=True)


if __name__ == '__main__':
    unittest.main()
