#!/usr/bin/env python3
"""
Comprehensive tests for modern KernelInstrumenter functionality.
Tests core features across all instrumentation types.
"""

import unittest
import os
import tempfile
import sys
from pathlib import Path

# Add src to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from kernel_instrumenter import KernelInstrumenter


class TestModernComprehensive(unittest.TestCase):
    """Comprehensive tests for KernelInstrumenter functionality."""
    
    def setUp(self):
        """Set up test environment."""
        self.instrumenter = KernelInstrumenter(enabled_types={'dma', 'user_copy', 'functions'})
        self.test_dir = tempfile.mkdtemp()
    
    def tearDown(self):
        """Clean up test environment."""
        import shutil
        shutil.rmtree(self.test_dir, ignore_errors=True)
    
    def test_dma_instrumentation_basic(self):
        """Test basic DMA function instrumentation."""
        source_code = """
void test_function() {
    dma_alloc_coherent(dev, size, handle, flags);
    return;
}
"""
        result = self.instrumenter.instrument_code(source_code, "dma")
        self.assertIn("DMA_INSTRUMENT:", result)
        self.assertIn("dma_alloc_coherent", result)
    
    def test_user_copy_instrumentation_basic(self):
        """Test basic user copy function instrumentation."""
        source_code = """
int copy_data(void *dest, void *src, size_t len) {
    copy_to_user(dest, src, len);
    return 0;
}
"""
        result = self.instrumenter.instrument_code(source_code, "user_copy")
        self.assertIn("USER_COPY:", result)
        self.assertIn("copy_to_user", result)
    
    def test_function_instrumentation_basic(self):
        """Test basic function instrumentation."""
        print("✓ Using modern tree-sitter API")
        source_code = """
static int device_open(struct inode *inode, struct file *file) {
    return 0;
}
"""
        result = self.instrumenter.instrument_code(source_code, "functions")
        self.assertIn('[Dynamic Baseline] device_open\\n', result)
        self.assertIn("device_open", result)
    
    def test_multiple_function_types(self):
        """Test instrumentation of multiple function types in same code."""
        print("✓ Using modern tree-sitter API")
        source_code = """
void mixed_function() {
    dma_alloc_coherent(dev, size, handle, flags);
    copy_to_user(dest, src, len);
    printk("Debug message");
}
"""
        # Test DMA instrumentation
        dma_result = self.instrumenter.instrument_code(source_code, "dma")
        self.assertIn("DMA_INSTRUMENT:", dma_result)
        
        # Test user copy instrumentation
        user_result = self.instrumenter.instrument_code(source_code, "user_copy")
        self.assertIn("USER_COPY:", user_result)
    
    def test_complex_code_structure(self):
        """Test instrumentation with complex code structures."""
        print("✓ Using modern tree-sitter API")
        source_code = """
#include <linux/module.h>
#include <linux/dma-mapping.h>

static int complex_function(struct device *dev) {
    void *coherent_mem;
    dma_addr_t dma_handle;
    
    coherent_mem = dma_alloc_coherent(dev, 1024, &dma_handle, GFP_KERNEL);
    if (!coherent_mem) {
        return -ENOMEM;
    }
    
    // Use the memory
    memset(coherent_mem, 0, 1024);
    
    dma_free_coherent(dev, 1024, coherent_mem, dma_handle);
    return 0;
}
"""
        result = self.instrumenter.instrument_code(source_code, "dma")
        self.assertIn("DMA_INSTRUMENT:", result)
        # Should instrument both alloc and free
        dma_traces = result.count("DMA_INSTRUMENT:")
        self.assertGreaterEqual(dma_traces, 2)
    
    def test_preprocessor_directives(self):
        """Test handling of preprocessor directives."""
        print("✓ Using modern tree-sitter API")
        source_code = """
#ifdef CONFIG_DMA_ENGINE
void dma_test() {
    #if defined(DMA_COHERENT)
    dma_alloc_coherent(dev, size, handle, flags);
    #endif
}
#endif
"""
        result = self.instrumenter.instrument_code(source_code, "dma")
        # Should handle preprocessor blocks properly
        self.assertIn("DMA_INSTRUMENT:", result)
    
    def test_function_context_validation(self):
        """Test that instrumentation only occurs within function context."""
        print("✓ Using modern tree-sitter API")
        source_code = """
// Global variable declaration
static struct device *global_dev;

void valid_function() {
    dma_alloc_coherent(dev, size, handle, flags);
}

// This should not be instrumented (outside function)
// dma_alloc_coherent(dev, size, handle, flags);
"""
        result = self.instrumenter.instrument_code(source_code, "dma")
        self.assertIn("DMA_INSTRUMENT:", result)
        # Should only have one trace (inside the function)
        trace_count = result.count("DMA_INSTRUMENT:")
        self.assertEqual(trace_count, 1)
    
    def test_nested_function_calls(self):
        """Test instrumentation with nested function calls."""
        print("✓ Using modern tree-sitter API")
        source_code = """
void nested_calls() {
    if (condition) {
        dma_alloc_coherent(dev, size, handle, flags);
        if (other_condition) {
            copy_to_user(dest, src, len);
        }
    }
}
"""
        # Test DMA instrumentation
        dma_result = self.instrumenter.instrument_code(source_code, "dma")
        self.assertIn("DMA_INSTRUMENT:", dma_result)
        
        # Test user copy instrumentation
        user_result = self.instrumenter.instrument_code(source_code, "user_copy")
        self.assertIn("USER_COPY:", user_result)
    
    def test_error_handling(self):
        """Test error handling with malformed code."""
        malformed_code = """
void incomplete_function( {
    dma_alloc_coherent(dev, size
}
"""
        # Should not crash on malformed code
        try:
            result = self.instrumenter.instrument_code(malformed_code, "dma")
            # Should return original code if parsing fails
            self.assertIsNotNone(result)
        except Exception as e:
            self.fail(f"Instrumenter should handle malformed code gracefully: {e}")
    
    def test_instrumentation_placement(self):
        """Test that traces are placed correctly before target calls."""
        print("✓ Using modern tree-sitter API")
        source_code = """
void placement_test() {
    int result;
    result = dma_alloc_coherent(dev, size, handle, flags);
    return;
}
"""
        result = self.instrumenter.instrument_code(source_code, "dma")
        
        # Find the trace and the function call
        trace_pos = result.find("DMA_INSTRUMENT:")
        call_pos = result.find("dma_alloc_coherent")
        
        # Trace should come before the function call
        self.assertLess(trace_pos, call_pos)
        self.assertNotEqual(trace_pos, -1)
        self.assertNotEqual(call_pos, -1)
    
    def test_assignment_handling(self):
        """Test instrumentation with assignment statements."""
        print("✓ Using modern tree-sitter API")
        source_code = """
void assignment_test() {
    void *ptr = dma_alloc_coherent(dev, size, handle, flags);
    int bytes = copy_to_user(dest, src, len);
}
"""
        # Test DMA instrumentation
        dma_result = self.instrumenter.instrument_code(source_code, "dma")
        self.assertIn("DMA_INSTRUMENT:", dma_result)
        self.assertIn("void *ptr =", dma_result)
        
        # Test user copy instrumentation
        user_result = self.instrumenter.instrument_code(source_code, "user_copy")
        self.assertIn("USER_COPY:", user_result)
        self.assertIn("int bytes =", user_result)
    
    def test_file_instrumentation(self):
        """Test full file instrumentation workflow."""
        print("✓ Using modern tree-sitter API")
        source_code = """
#include <linux/module.h>
#include <linux/dma-mapping.h>

static int test_driver_probe(struct platform_device *pdev) {
    void *coherent_mem = dma_alloc_coherent(&pdev->dev, 1024, &handle, GFP_KERNEL);
    return 0;
}

static int test_driver_remove(struct platform_device *pdev) {
    dma_free_coherent(&pdev->dev, 1024, coherent_mem, handle);
    return 0;
}
"""
        # Create test file
        test_file = os.path.join(self.test_dir, "test_driver.c")
        with open(test_file, 'w') as f:
            f.write(source_code)
        
        # Test file instrumentation
        result = self.instrumenter.instrument_file(Path(test_file))
        success = result.get('success', False)
        self.assertTrue(success)
        
        # Verify instrumentation was applied
        with open(test_file, 'r') as f:
            result = f.read()
        
        self.assertIn("DMA_INSTRUMENT:", result)
        trace_count = result.count("DMA_INSTRUMENT:")
        self.assertGreaterEqual(trace_count, 2)  # Should instrument both alloc and free


if __name__ == '__main__':
    unittest.main()
