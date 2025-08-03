#!/usr/bin/env python3
"""
Test that ioctl instrumentation is included by default
"""

import unittest
import tempfile
import subprocess
import sys
from pathlib import Path

# Add src to path for imports
test_dir = Path(__file__).parent
sys.path.insert(0, str(test_dir.parent.parent / "src"))

from kernel_instrumenter.kernel_instrument import KernelInstrumenter


class TestIoctlDefaultBehavior(unittest.TestCase):
    """Test that ioctl instrumentation is enabled by default"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.script_path = test_dir.parent.parent / "src" / "kernel_instrumenter" / "kernel_instrument.py"
        
    def test_ioctl_included_in_default_types(self):
        """Test that ioctl is included when no --types argument is specified"""
        test_file = Path(self.test_dir) / "default_test.c"
        test_content = '''
#include <linux/module.h>
#include <linux/fs.h>

static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}

static int regular_function(void) {
    return 0;
}

MODULE_LICENSE("GPL");
'''
        test_file.write_text(test_content)
        
        try:
            # Run without specifying --types (should use defaults)
            result = subprocess.run([
                sys.executable, str(self.script_path),
                '--directory', str(self.test_dir),
                '--dry-run',
                '--verbose'
            ], capture_output=True, text=True, timeout=30)
            
            self.assertEqual(result.returncode, 0, f"Command failed: {result.stderr}")
            
            # Should include ioctl in enabled types
            self.assertIn('ioctl', result.stdout, "ioctl should be in enabled types by default")
            
            # Should detect the ioctl handler
            self.assertIn('device_ioctl', result.stdout, "Should detect ioctl handler by default")
            self.assertIn('ioctl: 1 items', result.stdout, "Should find ioctl instrumentation by default")
            
        except subprocess.TimeoutExpired:
            self.fail("Command timed out")
        except Exception as e:
            self.fail(f"Failed to run command: {e}")
    
    def test_ioctl_in_programmatic_api_defaults(self):
        """Test that ioctl works in the programmatic API with typical defaults"""
        test_file = Path(self.test_dir) / "api_test.c"
        test_content = '''
static long test_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}
'''
        test_file.write_text(test_content)
        
        # Test with typical default set that should include ioctl
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy', 'ioctl', 'dma_present_files_functions'}, 
            dry_run=True, 
            verbose=False
        )
        result = instrumenter.instrument_file(test_file)
        
        self.assertTrue(result['success'])
        self.assertIn('ioctl', result['instrumentations'])
        self.assertGreater(len(result['instrumentations']['ioctl']), 0)
        
        # Verify the detected ioctl handler details
        ioctl_items = result['instrumentations']['ioctl']
        handler_found = False
        for item in ioctl_items:
            if item['function_name'] == 'test_ioctl':
                handler_found = True
                self.assertEqual(item['instrumentation_type'], 'ioctl_handler')
                break
        
        self.assertTrue(handler_found, "Should detect test_ioctl function")
        
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir, ignore_errors=True)


if __name__ == '__main__':
    unittest.main()
