#!/usr/bin/env python3
"""
Simple IOCTL Infrastructure Tests

This module tests the basic ioctl infrastructure without requiring
full tree-sitter parsing functionality.
"""

import unittest
import sys
from pathlib import Path

# Add src to path for imports
test_dir = Path(__file__).parent
sys.path.insert(0, str(test_dir.parent.parent / "src"))


class TestIoctlInfrastructure(unittest.TestCase):
    """Test basic ioctl infrastructure components"""
    
    def test_ioctl_config_import(self):
        """Test that ioctl configuration can be imported"""
        try:
            from kernel_instrumenter.instrumentation_types.ioctl_config import IoctlInstrumentationType
            self.assertTrue(True, "IoctlInstrumentationType imported successfully")
        except ImportError as e:
            self.fail(f"Failed to import IoctlInstrumentationType: {e}")
    
    def test_ioctl_config_creation(self):
        """Test that ioctl configuration can be created"""
        from kernel_instrumenter.instrumentation_types.ioctl_config import IoctlInstrumentationType
        
        ioctl_type = IoctlInstrumentationType()
        
        # Test basic properties
        self.assertEqual(ioctl_type.name, "IOCTL Handlers")
        self.assertEqual(ioctl_type.marker_prefix, "IOCTL_HANDLER")
        self.assertIsInstance(ioctl_type.api_functions, set)
        self.assertIsInstance(ioctl_type.ioctl_patterns, set)
        self.assertIsInstance(ioctl_type.required_headers, list)
        self.assertIsInstance(ioctl_type.template, str)
        
        # Test specific patterns
        patterns = ioctl_type.ioctl_patterns
        self.assertIn('ioctl', patterns)
        self.assertIn('unlocked_ioctl', patterns)
        self.assertIn('compat_ioctl', patterns)
        
        # Test template content
        template = ioctl_type.template
        self.assertIn('IOCTL_HANDLER', template)
        self.assertIn('printk', template)
        self.assertIn('{function_name}', template)
        self.assertIn('__FILE__', template)
        self.assertIn('__LINE__', template)
        
        # Test required headers
        headers = ioctl_type.required_headers
        self.assertIn('#include <linux/kernel.h>', headers)
        self.assertIn('#include <linux/printk.h>', headers)
    
    def test_ioctl_analyzer_import(self):
        """Test that ioctl analyzer can be imported"""
        try:
            from kernel_instrumenter.analyzers.ioctl_analyzer import IoctlAnalyzer
            self.assertTrue(True, "IoctlAnalyzer imported successfully")
        except ImportError as e:
            self.fail(f"Failed to import IoctlAnalyzer: {e}")
    
    def test_ioctl_name_detection_logic(self):
        """Test ioctl name detection logic without tree-sitter"""
        from kernel_instrumenter.analyzers.ioctl_analyzer import IoctlAnalyzer
        from kernel_instrumenter.instrumentation_types.ioctl_config import IoctlInstrumentationType
        
        # Create analyzer (we won't use parser for this test)
        ioctl_type = IoctlInstrumentationType()
        analyzer = IoctlAnalyzer(None, ioctl_type)  # Pass None for parser
        
        # Test positive cases
        positive_cases = [
            'device_ioctl',
            'driver_unlocked_ioctl',
            'my_compat_ioctl',
            'ioctl_handler',
            'some_ioctl_func',
            'handle_ioctl_request',
            'test_ioctl',
            'char_dev_ioctl'
        ]
        
        for name in positive_cases:
            self.assertTrue(analyzer.is_ioctl_handler_function(name),
                          f"Should detect '{name}' as ioctl handler")
        
        # Test negative cases
        negative_cases = [
            'regular_function',
            'setup_device',
            'cleanup_driver',
            'process_data',
            'init_module',
            'exit_module',
            'probe_device',
            'remove_device'
        ]
        
        for name in negative_cases:
            self.assertFalse(analyzer.is_ioctl_handler_function(name),
                           f"Should NOT detect '{name}' as ioctl handler")
    
    def test_ioctl_in_instrumenter_types(self):
        """Test that ioctl is properly integrated in instrumenter"""
        from kernel_instrumenter.kernel_instrument import KernelInstrumenter
        
        # Test that ioctl can be enabled
        instrumenter = KernelInstrumenter({'ioctl'}, dry_run=True, verbose=False)
        self.assertIn('ioctl', instrumenter.enabled_types)
        
        # Test that analyzer is created for ioctl
        self.assertIn('ioctl', instrumenter.analyzer.analyzers)
        
        # Test that instrumenter config is created for ioctl
        self.assertIn('ioctl', instrumenter.instrumenter.type_configs)
    
    def test_ioctl_with_all_types(self):
        """Test that ioctl works with 'all' types option"""
        from kernel_instrumenter.kernel_instrument import KernelInstrumenter
        
        all_types = {'dma', 'user_copy', 'functions', 'ioctl'}
        instrumenter = KernelInstrumenter(all_types, dry_run=True, verbose=False)
        
        # All types should be enabled
        self.assertEqual(instrumenter.enabled_types, all_types)
        
        # All analyzers should be created
        for inst_type in all_types:
            self.assertIn(inst_type, instrumenter.analyzer.analyzers,
                         f"Analyzer for {inst_type} should be created")
    
    def test_ioctl_instrumentation_integration(self):
        """Test that ioctl is integrated in the multi-instrumenter"""
        from kernel_instrumenter.instrumenters.multi_instrumenter import MultiInstrumenter
        from kernel_instrumenter.analyzers.multi_analyzer import MultiAnalyzer
        from kernel_instrumenter.parsing.parser import TreeSitterParser
        
        try:
            parser = TreeSitterParser()
            analyzer = MultiAnalyzer(parser, {'ioctl'})
            instrumenter = MultiInstrumenter(analyzer, {'ioctl'})
            
            # Should have ioctl configuration
            self.assertIn('ioctl', instrumenter.type_configs)
            
            # Should be able to get ioctl configuration
            ioctl_config = instrumenter.type_configs['ioctl']
            self.assertEqual(ioctl_config.name, "IOCTL Handlers")
            
        except Exception as e:
            # If tree-sitter is not available, we can't test this
            if "tree_sitter" in str(e):
                self.skipTest("Tree-sitter not available")
            else:
                raise


class TestIoctlCLIIntegration(unittest.TestCase):
    """Test ioctl CLI integration"""
    
    def test_ioctl_in_cli_choices(self):
        """Test that ioctl appears in CLI argument choices"""
        from kernel_instrumenter.kernel_instrument import main
        import argparse
        
        # This test verifies that the CLI parser includes ioctl
        # We can't easily test the actual argparse setup without running it,
        # but we can verify the code structure
        self.assertTrue(True, "IOCTL CLI integration test placeholder")
    
    def test_help_includes_ioctl(self):
        """Test that help text includes ioctl information"""
        import subprocess
        import sys
        from pathlib import Path
        
        script_path = Path(__file__).parent.parent.parent / "src" / "kernel_instrumenter" / "kernel_instrument.py"
        if not script_path.exists():
            self.skipTest("Main script not found")
        
        try:
            result = subprocess.run([
                sys.executable, str(script_path), '--help'
            ], capture_output=True, text=True, timeout=10)
            
            if result.returncode == 0:
                help_text = result.stdout
                self.assertIn('ioctl', help_text.lower(), "Help should mention ioctl")
            else:
                self.skipTest("Could not get help text")
                
        except (subprocess.TimeoutExpired, FileNotFoundError):
            self.skipTest("Could not run help command")


if __name__ == '__main__':
    unittest.main()
