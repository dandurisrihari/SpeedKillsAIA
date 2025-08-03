#!/usr/bin/env python3
"""
IOCTL Handler Analyzer Tests

This module tests the IoctlAnalyzer class and its functionality for detecting
and instrumenting ioctl handler functions in kernel modules.
"""

import unittest
import tempfile
import sys
from pathlib import Path

# Add src to path for imports
test_dir = Path(__file__).parent
sys.path.insert(0, str(test_dir.parent.parent / "src"))

from kernel_instrumenter.kernel_instrument import KernelInstrumenter


class TestIoctlAnalyzer(unittest.TestCase):
    """Test the IoctlAnalyzer class functionality"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.test_file_path = Path(self.test_dir) / "test_ioctl_driver.c"
        
    def test_ioctl_analyzer_import(self):
        """Test that IoctlAnalyzer can be imported successfully"""
        try:
            from kernel_instrumenter.analyzers.ioctl_analyzer import IoctlAnalyzer
            from kernel_instrumenter.instrumentation_types.ioctl_config import IoctlInstrumentationType
            self.assertTrue(True, "IoctlAnalyzer imported successfully")
        except ImportError as e:
            self.fail(f"Failed to import IoctlAnalyzer: {e}")
    
    def test_ioctl_instrumentation_type_creation(self):
        """Test that IoctlInstrumentationType can be created"""
        try:
            from kernel_instrumenter.instrumentation_types.ioctl_config import IoctlInstrumentationType
            
            ioctl_type = IoctlInstrumentationType()
            self.assertEqual(ioctl_type.name, "IOCTL Handlers")
            self.assertIn('ioctl', ioctl_type.ioctl_patterns)
            self.assertIn('unlocked_ioctl', ioctl_type.ioctl_patterns)
            self.assertIn('compat_ioctl', ioctl_type.ioctl_patterns)
            self.assertEqual(ioctl_type.marker_prefix, "IOCTL_HANDLER")
        except Exception as e:
            self.fail(f"Failed to create IoctlInstrumentationType: {e}")
    
    def test_ioctl_handler_name_detection(self):
        """Test detection of ioctl handlers by name patterns"""
        try:
            from kernel_instrumenter.analyzers.ioctl_analyzer import IoctlAnalyzer
            from kernel_instrumenter.instrumentation_types.ioctl_config import IoctlInstrumentationType
            from kernel_instrumenter.parsing.parser import TreeSitterParser
            
            parser = TreeSitterParser()
            ioctl_type = IoctlInstrumentationType()
            analyzer = IoctlAnalyzer(parser, ioctl_type)
            
            # Test various ioctl handler name patterns
            test_names = [
                'device_ioctl',
                'driver_unlocked_ioctl', 
                'my_compat_ioctl',
                'ioctl_handler',
                'some_ioctl_func',
                'handle_ioctl_request'
            ]
            
            for name in test_names:
                self.assertTrue(analyzer.is_ioctl_handler_function(name), 
                              f"Should detect {name} as ioctl handler")
                
            # Test names that should NOT be detected
            non_ioctl_names = [
                'regular_function',
                'setup_device',
                'cleanup_driver',
                'process_data'
            ]
            
            for name in non_ioctl_names:
                self.assertFalse(analyzer.is_ioctl_handler_function(name),
                               f"Should NOT detect {name} as ioctl handler")
                
        except Exception as e:
            self.fail(f"Failed to test ioctl name detection: {e}")

    def test_basic_ioctl_handler_detection(self):
        """Test detection of basic ioctl handler functions"""
        # Create test file with basic ioctl handler
        test_content = '''
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/uaccess.h>

static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    switch (cmd) {
        case 0x1000:
            return 0;
        default:
            return -EINVAL;
    }
}

static int regular_function(void) {
    return 0;
}
'''
        self.test_file_path.write_text(test_content)
        
        # Test with KernelInstrumenter
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=True, verbose=False)
        result = instrumenter.instrument_file(self.test_file_path)
        
        self.assertTrue(result['success'], "Should successfully analyze ioctl handlers")
        self.assertIn('ioctl', result['instrumentations'], "Should find ioctl instrumentations")
        
        ioctl_items = result['instrumentations']['ioctl']
        self.assertGreater(len(ioctl_items), 0, "Should find at least one ioctl handler")
        
        # Verify the detected ioctl handler
        handler_found = False
        for item in ioctl_items:
            if item['function_name'] == 'device_ioctl':
                handler_found = True
                self.assertEqual(item['instrumentation_type'], 'ioctl_handler')
                self.assertTrue(item['detected_by_name'])
                break
                
        self.assertTrue(handler_found, "Should detect device_ioctl function")

    def test_ioctl_signature_detection(self):
        """Test detection of ioctl handlers by function signature"""
        test_content = '''
#include <linux/module.h>
#include <linux/fs.h>

// This has ioctl signature but not obvious name
static long my_control_handler(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}

// This has partial ioctl signature
static int another_handler(unsigned int cmd, unsigned long arg) {
    return 0;
}

// This doesn't have ioctl signature
static void normal_function(void) {
    return;
}
'''
        self.test_file_path.write_text(test_content)
        
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=True, verbose=False)
        result = instrumenter.instrument_file(self.test_file_path)
        
        self.assertTrue(result['success'])
        ioctl_items = result['instrumentations']['ioctl']
        
        # Should detect at least the function with full ioctl signature
        signature_detected = False
        for item in ioctl_items:
            if item['function_name'] == 'my_control_handler':
                signature_detected = True
                self.assertTrue(item.get('detected_by_signature', False))
                break
        
        self.assertTrue(signature_detected, "Should detect handler by signature")

    def test_mixed_ioctl_handlers(self):
        """Test detection of multiple ioctl handlers with different patterns"""
        test_content = '''
#include <linux/module.h>
#include <linux/fs.h>

// Standard unlocked ioctl
static long driver_unlocked_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}

// Compatibility ioctl  
static long driver_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}

// Old-style ioctl (rare but possible)
static int driver_ioctl(struct inode *inode, struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}

// Regular function (should not be detected)
static int setup_device(void) {
    return 0;
}
'''
        self.test_file_path.write_text(test_content)
        
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=True, verbose=False)
        result = instrumenter.instrument_file(self.test_file_path)
        
        self.assertTrue(result['success'])
        ioctl_items = result['instrumentations']['ioctl']
        
        # Should detect at least 3 ioctl handlers
        self.assertGreaterEqual(len(ioctl_items), 3, "Should detect multiple ioctl handlers")
        
        detected_names = {item['function_name'] for item in ioctl_items}
        expected_names = {'driver_unlocked_ioctl', 'driver_compat_ioctl', 'driver_ioctl'}
        
        for expected_name in expected_names:
            self.assertIn(expected_name, detected_names, f"Should detect {expected_name}")
        
        # Regular function should not be detected
        self.assertNotIn('setup_device', detected_names, "Should not detect regular function")

    def test_ioctl_instrumentation_placement(self):
        """Test that instrumentation is placed correctly in ioctl handlers"""
        test_content = '''
static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    int ret = 0;
    
    switch (cmd) {
        case CMD_READ:
            ret = handle_read(arg);
            break;
        case CMD_WRITE:
            ret = handle_write(arg);
            break;
        default:
            ret = -EINVAL;
    }
    
    return ret;
}
'''
        self.test_file_path.write_text(test_content)
        
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=True, verbose=False)
        result = instrumenter.instrument_file(self.test_file_path)
        
        self.assertTrue(result['success'])
        ioctl_items = result['instrumentations']['ioctl']
        self.assertGreater(len(ioctl_items), 0)
        
        # Check instrumentation placement
        for item in ioctl_items:
            if item['function_name'] == 'device_ioctl':
                # Should be placed at the beginning of function body
                self.assertEqual(item['strategy'], 'function_entry')
                self.assertIsNotNone(item['indentation'])
                break

    def test_empty_file_handling(self):
        """Test handling of empty files"""
        self.test_file_path.write_text('')
        
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=True, verbose=False)
        result = instrumenter.instrument_file(self.test_file_path)
        
        self.assertTrue(result['success'])
        self.assertFalse(result['modified'])
        self.assertEqual(len(result['instrumentations']['ioctl']), 0)

    def test_file_without_ioctl_handlers(self):
        """Test handling of files without ioctl handlers"""
        test_content = '''
#include <linux/module.h>

static int init_module(void) {
    return 0;
}

static void cleanup_module(void) {
    return;
}

static int helper_function(int param) {
    return param * 2;
}
'''
        self.test_file_path.write_text(test_content)
        
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=True, verbose=False)
        result = instrumenter.instrument_file(self.test_file_path)
        
        self.assertTrue(result['success'])
        self.assertFalse(result['modified'])
        self.assertEqual(len(result['instrumentations']['ioctl']), 0)
        self.assertEqual(result['message'], 'No instrumentable items found')

    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir, ignore_errors=True)


class TestIoctlInstrumentationIntegration(unittest.TestCase):
    """Test integration of ioctl instrumentation with the full system"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        
    def test_ioctl_with_multiple_types(self):
        """Test ioctl instrumentation combined with other types"""
        test_file = Path(self.test_dir) / "multi_test.c"
        test_content = '''
#include <linux/module.h>
#include <linux/dma-mapping.h>
#include <linux/uaccess.h>

static void regular_function(void) {
    printk("Regular function\\n");
}

static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    void *dma_buffer;
    char user_data[256];
    
    // DMA allocation inside ioctl
    dma_buffer = dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);
    
    // User copy operation
    if (copy_from_user(user_data, (void __user *)arg, sizeof(user_data))) {
        return -EFAULT;
    }
    
    dma_free_coherent(NULL, 1024, dma_buffer, 0);
    return 0;
}
'''
        test_file.write_text(test_content)
        
        # Test with multiple instrumentation types including ioctl
        instrumenter = KernelInstrumenter({'dma', 'user_copy', 'functions', 'ioctl'}, 
                                        dry_run=True, verbose=False)
        result = instrumenter.instrument_file(test_file)
        
        self.assertTrue(result['success'])
        
        # Should find instrumentations of multiple types
        self.assertIn('dma', result['instrumentations'])
        self.assertIn('user_copy', result['instrumentations'])
        self.assertIn('functions', result['instrumentations'])
        self.assertIn('ioctl', result['instrumentations'])
        
        # Check that ioctl handler is detected
        ioctl_items = result['instrumentations']['ioctl']
        self.assertGreater(len(ioctl_items), 0)
        
        # Check that DMA calls are detected
        dma_items = result['instrumentations']['dma']
        self.assertGreater(len(dma_items), 0)
        
        # Check that user copy calls are detected
        user_copy_items = result['instrumentations']['user_copy']
        self.assertGreater(len(user_copy_items), 0)

    def test_ioctl_all_types_option(self):
        """Test that 'all' types option includes ioctl"""
        test_file = Path(self.test_dir) / "ioctl_all_test.c"
        test_content = '''
static long test_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}
'''
        test_file.write_text(test_content)
        
        # Test with 'all' types - should include ioctl
        instrumenter = KernelInstrumenter({'dma', 'user_copy', 'functions', 'ioctl'}, 
                                        dry_run=True, verbose=False)
        result = instrumenter.instrument_file(test_file)
        
        self.assertTrue(result['success'])
        self.assertIn('ioctl', result['instrumentations'])
        self.assertGreater(len(result['instrumentations']['ioctl']), 0)

    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir, ignore_errors=True)


if __name__ == '__main__':
    unittest.main()
