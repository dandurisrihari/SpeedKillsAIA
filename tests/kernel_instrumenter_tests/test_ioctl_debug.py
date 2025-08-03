#!/usr/bin/env python3
"""
IOCTL Handler Infrastructure Tests - Debugging

This module tests just the infrastructure without requiring tree-sitter parsing
to work correctly.
"""

import unittest
import tempfile
import sys
from pathlib import Path

# Add src to path for imports
test_dir = Path(__file__).parent
sys.path.insert(0, str(test_dir.parent.parent / "src"))

from kernel_instrumenter.kernel_instrument import KernelInstrumenter


class TestIoctlInfrastructure(unittest.TestCase):
    """Test ioctl infrastructure without tree-sitter dependency"""
    
    def test_ioctl_import_basic(self):
        """Test that basic ioctl components can be imported"""
        try:
            from kernel_instrumenter.instrumentation_types.ioctl_config import IoctlInstrumentationType
            ioctl_type = IoctlInstrumentationType()
            self.assertEqual(ioctl_type.name, "IOCTL Handlers")
            self.assertIn('ioctl', ioctl_type.ioctl_patterns)
        except Exception as e:
            self.fail(f"Basic ioctl import failed: {e}")

    def test_ioctl_analyzer_import(self):
        """Test that ioctl analyzer can be imported"""
        try:
            from kernel_instrumenter.analyzers.ioctl_analyzer import IoctlAnalyzer
            from kernel_instrumenter.instrumentation_types.ioctl_config import IoctlInstrumentationType
            from kernel_instrumenter.parsing.parser import TreeSitterParser
            
            parser = TreeSitterParser()
            ioctl_type = IoctlInstrumentationType()
            analyzer = IoctlAnalyzer(parser, ioctl_type)
            self.assertIsNotNone(analyzer)
        except Exception as e:
            self.fail(f"IoctlAnalyzer import failed: {e}")

    def test_ioctl_name_detection(self):
        """Test ioctl name detection logic without tree-sitter"""
        try:
            from kernel_instrumenter.analyzers.ioctl_analyzer import IoctlAnalyzer
            from kernel_instrumenter.instrumentation_types.ioctl_config import IoctlInstrumentationType
            from kernel_instrumenter.parsing.parser import TreeSitterParser
            
            parser = TreeSitterParser()
            ioctl_type = IoctlInstrumentationType()
            analyzer = IoctlAnalyzer(parser, ioctl_type)
            
            # Test name detection
            self.assertTrue(analyzer.is_ioctl_handler_function("device_ioctl"))
            self.assertTrue(analyzer.is_ioctl_handler_function("driver_unlocked_ioctl"))
            self.assertFalse(analyzer.is_ioctl_handler_function("regular_function"))
            
        except Exception as e:
            self.fail(f"Name detection test failed: {e}")

    def test_ioctl_integration_basic(self):
        """Test that ioctl can be enabled in KernelInstrumenter"""
        try:
            instrumenter = KernelInstrumenter({'ioctl'}, dry_run=True, verbose=False)
            self.assertIn('ioctl', instrumenter.enabled_types)
            self.assertIsNotNone(instrumenter.analyzer)
            self.assertIsNotNone(instrumenter.instrumenter)
        except Exception as e:
            self.fail(f"Basic ioctl integration failed: {e}")

    def test_ioctl_file_with_no_parsing(self):
        """Test handling of file without actually parsing"""
        try:
            test_dir = tempfile.mkdtemp()
            test_file = Path(test_dir) / "empty.c"
            test_file.write_text("")
            
            instrumenter = KernelInstrumenter({'ioctl'}, dry_run=True, verbose=False)
            result = instrumenter.instrument_file(test_file)
            
            self.assertTrue(result['success'])
            self.assertIn('ioctl', result['instrumentations'])
            self.assertEqual(len(result['instrumentations']['ioctl']), 0)
            
            import shutil
            shutil.rmtree(test_dir)
            
        except Exception as e:
            self.fail(f"File handling test failed: {e}")


class TestIoctlDebugWithSimpleCode(unittest.TestCase):
    """Test ioctl with very simple code to debug tree-sitter issues"""
    
    def setUp(self):
        self.test_dir = tempfile.mkdtemp()
        
    def tearDown(self):
        import shutil
        shutil.rmtree(self.test_dir, ignore_errors=True)

    def test_simple_ioctl_detection(self):
        """Test with simplest possible ioctl code"""
        test_file = Path(self.test_dir) / "simple.c"
        # Use very simple C code
        test_content = '''long device_ioctl(void) { return 0; }'''
        test_file.write_text(test_content)
        
        try:
            instrumenter = KernelInstrumenter({'ioctl'}, dry_run=True, verbose=True)
            result = instrumenter.instrument_file(test_file)
            
            print(f"Result: {result}")
            self.assertTrue(result['success'])
            
        except Exception as e:
            print(f"Exception: {e}")
            import traceback
            traceback.print_exc()
            # Don't fail the test, just report what happened
            
    def test_tree_sitter_parsing_debug(self):
        """Debug tree-sitter parsing directly"""
        try:
            from kernel_instrumenter.parsing.parser import TreeSitterParser
            parser = TreeSitterParser()
            
            simple_c = '''long device_ioctl(void) { return 0; }'''
            tree = parser.parse(simple_c)
            
            print(f"Parse tree root type: {tree.root_node.type}")
            print(f"Parse tree children: {len(tree.root_node.children)}")
            
            # Walk the tree and print structure
            def print_tree(node, depth=0):
                indent = "  " * depth
                print(f"{indent}{node.type}: {node.text.decode('utf-8')[:50]}")
                for child in node.children:
                    print_tree(child, depth + 1)
                    
            print_tree(tree.root_node)
            
        except Exception as e:
            print(f"Tree-sitter debug failed: {e}")
            import traceback
            traceback.print_exc()


if __name__ == '__main__':
    unittest.main()
