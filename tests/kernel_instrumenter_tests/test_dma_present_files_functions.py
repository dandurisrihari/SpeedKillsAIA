#!/usr/bin/env python3
"""
Test module for dma_present_files_functions mode
"""

import unittest
import sys
import tempfile
import os
from pathlib import Path

# Add the project source to Python path for imports
project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root / "src"))

from kernel_instrumenter.kernel_instrument import KernelInstrumenter


class TestDmaPresentFilesFunctions(unittest.TestCase):
    """Test cases for dma_present_files_functions instrumentation mode"""
    
    def setUp(self):
        """Set up test environment"""
        # Create temporary test files
        self.test_dir = Path(tempfile.mkdtemp())
        
        # Test file with DMA calls
        self.dma_file = self.test_dir / "dma_test.c"
        with open(self.dma_file, 'w') as f:
            f.write('''
#include <linux/dma-mapping.h>

static int func1(void) {
    void *ptr = dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);
    return 0;
}

static int func2(void) {
    // Another function in DMA file
    return 1;
}
''')
        
        # Test file without DMA calls
        self.no_dma_file = self.test_dir / "no_dma_test.c"
        with open(self.no_dma_file, 'w') as f:
            f.write('''
#include <linux/module.h>

static int func3(void) {
    return 0;
}

static int func4(void) {
    return 1;
}
''')
    
    def tearDown(self):
        """Clean up test environment"""
        import shutil
        shutil.rmtree(self.test_dir)
    
    def test_dma_present_files_functions_mode(self):
        """Test dma_present_files_functions mode only instruments functions in DMA-containing files"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma_present_files_functions'},
            dry_run=True,
            verbose=False
        )
        
        result = instrumenter.instrument_directory(self.test_dir)
        
        self.assertTrue(result['success'])
        self.assertGreater(result['files_processed'], 0)
        
        # Check that only functions in DMA-containing files are instrumented
        dma_file_found = False
        for file_result in result['results']:
            if file_result['file'].name == 'dma_test.c':
                dma_file_found = True
                # This file should have function instrumentations
                instrumentations = file_result['result']['instrumentations']
                if 'functions' in instrumentations:
                    self.assertGreater(len(instrumentations['functions']), 0)
        
        self.assertTrue(dma_file_found, "DMA test file should have been processed")
    
    def test_initialization_with_dma_present_files_functions(self):
        """Test KernelInstrumenter initialization with dma_present_files_functions type"""
        instrumenter = KernelInstrumenter(
            enabled_types={'dma_present_files_functions'},
            dry_run=True,
            verbose=False
        )
        
        self.assertIn('dma_present_files_functions', instrumenter.enabled_types)
        self.assertTrue(instrumenter.dry_run)
        self.assertFalse(instrumenter.verbose)


if __name__ == '__main__':
    unittest.main()
