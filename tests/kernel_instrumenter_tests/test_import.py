#!/usr/bin/env python3
"""
Test module for import and basic functionality verification
"""

import unittest
import sys
from pathlib import Path

# Add the project source to Python path for imports
project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root / "src"))


class TestImports(unittest.TestCase):
    """Test cases for import and basic functionality verification"""
    
    def test_kernel_instrumenter_import(self):
        """Test that KernelInstrumenter can be imported successfully"""
        try:
            from kernel_instrumenter.kernel_instrument import KernelInstrumenter
            self.assertTrue(True, "KernelInstrumenter imported successfully")
        except ImportError as e:
            self.fail(f"Failed to import KernelInstrumenter: {e}")
    
    def test_kernel_instrumenter_initialization(self):
        """Test that KernelInstrumenter can be initialized"""
        from kernel_instrumenter.kernel_instrument import KernelInstrumenter
        
        try:
            instrumenter = KernelInstrumenter({'dma'}, dry_run=True, verbose=False)
            self.assertIsNotNone(instrumenter)
            self.assertIn('dma', instrumenter.enabled_types)
            self.assertTrue(instrumenter.dry_run)
            self.assertFalse(instrumenter.verbose)
        except Exception as e:
            self.fail(f"Failed to initialize KernelInstrumenter: {e}")
    
    def test_analyzer_imports(self):
        """Test that analyzer modules can be imported"""
        try:
            from kernel_instrumenter.analyzers.dma_analyzer import DMAAnalyzer
            from kernel_instrumenter.analyzers.user_copy_analyzer import UserCopyAnalyzer
            from kernel_instrumenter.analyzers.function_analyzer import FunctionAnalyzer
            from kernel_instrumenter.analyzers.multi_analyzer import MultiAnalyzer
            from kernel_instrumenter.analyzers.ioctl_analyzer import IoctlAnalyzer
            self.assertTrue(True, "All analyzer modules imported successfully")
        except ImportError as e:
            self.fail(f"Failed to import analyzer modules: {e}")
    
    def test_instrumenter_imports(self):
        """Test that instrumenter modules can be imported"""
        try:
            from kernel_instrumenter.instrumenters.multi_instrumenter import MultiInstrumenter
            self.assertTrue(True, "Instrumenter modules imported successfully")
        except ImportError as e:
            self.fail(f"Failed to import instrumenter modules: {e}")
    
    def test_basic_code_instrumentation(self):
        """Test basic code instrumentation functionality"""
        from kernel_instrumenter.kernel_instrument import KernelInstrumenter
        
        instrumenter = KernelInstrumenter({'dma'}, dry_run=True, verbose=False)
        
        test_code = '''
#include <linux/dma-mapping.h>

void test_function(void) {
    void *ptr = dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);
}
'''
        
        try:
            result = instrumenter.instrument_code(test_code, 'dma')
            self.assertIsInstance(result, str)
            self.assertGreater(len(result), 0)
        except Exception as e:
            self.fail(f"Basic code instrumentation failed: {e}")
    
    def test_tree_sitter_dependencies(self):
        """Test that tree-sitter dependencies are available"""
        try:
            import tree_sitter
            import tree_sitter_c
            self.assertTrue(True, "Tree-sitter dependencies available")
        except ImportError as e:
            self.fail(f"Tree-sitter dependencies missing: {e}")

    def test_ioctl_instrumenter_initialization(self):
        """Test that KernelInstrumenter can be initialized with ioctl type"""
        from kernel_instrumenter.kernel_instrument import KernelInstrumenter
        
        try:
            instrumenter = KernelInstrumenter({'ioctl'}, dry_run=True, verbose=False)
            self.assertIsNotNone(instrumenter)
            self.assertIn('ioctl', instrumenter.enabled_types)
            self.assertTrue(instrumenter.dry_run)
            self.assertFalse(instrumenter.verbose)
        except Exception as e:
            self.fail(f"Failed to initialize KernelInstrumenter with ioctl type: {e}")

    def test_ioctl_instrumentation_types_import(self):
        """Test that ioctl instrumentation types can be imported"""
        try:
            from kernel_instrumenter.instrumentation_types.ioctl_config import IoctlInstrumentationType
            ioctl_type = IoctlInstrumentationType()
            self.assertEqual(ioctl_type.name, "IOCTL Handlers")
            self.assertIsNotNone(ioctl_type.ioctl_patterns)
            self.assertTrue(len(ioctl_type.ioctl_patterns) > 0)
        except ImportError as e:
            self.fail(f"Failed to import ioctl instrumentation types: {e}")


if __name__ == '__main__':
    unittest.main()
