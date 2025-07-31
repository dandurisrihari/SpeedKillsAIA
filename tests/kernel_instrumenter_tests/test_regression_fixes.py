#!/usr/bin/env python3
"""
Regression tests for critical fixes in kernel instrumentation

This test suite ensures that previously fixed issues do not reoccur:
1. Circular import issues with Python's built-in 'types' module
2. Function context detection (preventing instrumentation outside functions) 
3. Assignment spanning preprocessor blocks
4. Tree-sitter AST parsing edge cases
"""

import unittest
import tempfile
import shutil
import os
import sys
from pathlib import Path

# Add the src directory to the path
current_dir = os.path.dirname(os.path.abspath(__file__))
repo_root = os.path.dirname(os.path.dirname(current_dir))
src_dir = os.path.join(repo_root, 'src')
sys.path.insert(0, src_dir)

# Import components for testing
from kernel_instrumenter.parsing.parser import TreeSitterParser
from kernel_instrumenter.analyzers.dma_analyzer import DMAAnalyzer
from kernel_instrumenter.analyzers.user_copy_analyzer import UserCopyAnalyzer
from kernel_instrumenter.instrumentation_types.dma_config import DMAInstrumentationType
from kernel_instrumenter.instrumentation_types.user_copy_config import UserCopyInstrumentationType


class TestRegressionFixes(unittest.TestCase):
    """Test cases for critical regression fixes"""
    
    def setUp(self):
        """Set up test environment"""
        self.test_dir = tempfile.mkdtemp()
        self.parser = TreeSitterParser()
        self.dma_analyzer = DMAAnalyzer(self.parser, DMAInstrumentationType())
        self.user_copy_analyzer = UserCopyAnalyzer(self.parser, UserCopyInstrumentationType())
    
    def tearDown(self):
        """Clean up test environment"""
        shutil.rmtree(self.test_dir, ignore_errors=True)

    def test_circular_import_resolution(self):
        """Test that circular import with Python's 'types' module is resolved"""
        # This test ensures that importing our instrumentation_types doesn't conflict
        # with Python's built-in types module
        try:
            # These imports should work without circular import issues
            from kernel_instrumenter.instrumentation_types import dma_config
            from kernel_instrumenter.instrumentation_types import user_copy_config
            from kernel_instrumenter.instrumentation_types import function_config
            
            # Verify that Python's built-in types is still accessible
            import types
            self.assertTrue(hasattr(types, 'ModuleType'))
            
            # Verify our types work correctly
            dma_type = dma_config.DMAInstrumentationType()
            self.assertIsNotNone(dma_type.api_functions)
            
        except ImportError as e:
            self.fail(f"Circular import detected: {e}")

    def test_function_context_detection(self):
        """Test that instrumentation is only placed inside functions"""
        # Test case: DMA call outside function should be ignored
        source_outside_function = '''
#include <linux/module.h>
#include <linux/dma-mapping.h>

// This call is outside any function - should NOT be instrumented
static void *global_ptr = dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);

int test_function(void) {
    // This call is inside a function - SHOULD be instrumented
    void *ptr = dma_alloc_coherent(dev, 1024, &dma_handle, GFP_KERNEL);
    return 0;
}
'''
        
        # Parse and analyze
        tree = self.parser.parse(source_outside_function)
        source_bytes = source_outside_function.encode('utf-8')
        
        calls = self.dma_analyzer.find_calls_in_file(source_outside_function)
        
        # Should find only 1 call (the one inside the function)
        # The global assignment should be ignored due to function context check
        self.assertEqual(len(calls), 1, "Should only instrument calls inside functions")
        
        # Verify the detected call is the one inside the function
        call = calls[0]
        self.assertEqual(call['function_name'], 'dma_alloc_coherent')
        # The call inside function should be on line > 5 (where the function starts)
        self.assertGreater(call['line_number'], 5)

    def test_assignment_spanning_preprocessor_detection(self):
        """Test detection and correct handling of assignments spanning preprocessor blocks"""
        # This is the exact case that was causing compilation errors
        source_spanning_assignment = '''
void test_function(void) {
    struct my_data *mdlPriv;
    
    mdlPriv->kvaddr =
#if defined(CONFIG_X86_64)
        dma_alloc_coherent(dev, NumPages * PAGE_SIZE, &mdlPriv->dmaHandle, gfp);
#elif defined(CONFIG_ARM64)
        dma_alloc_wc(dev, NumPages * PAGE_SIZE, &mdlPriv->dmaHandle, gfp);
#endif
}
'''
        
        # Parse and analyze
        tree = self.parser.parse(source_spanning_assignment)
        source_bytes = source_spanning_assignment.encode('utf-8')
        
        calls = self.dma_analyzer.find_calls_in_file(source_spanning_assignment)
        
        # Should find 2 calls
        self.assertEqual(len(calls), 2, "Should detect both DMA calls in preprocessor")
        
        # Both calls should use 'before_assignment' strategy
        for call in calls:
            self.assertEqual(call['instrumentation_strategy'], 'before_assignment', 
                           f"Call {call['function_name']} should use 'before_assignment' strategy")
        
        # Both calls should be instrumented at the same line (before the assignment)
        line_numbers = [call['line_number'] for call in calls]
        self.assertEqual(len(set(line_numbers)), 1, 
                        "Both calls should be instrumented at the same line")
        
        # The instrumentation line should be before the preprocessor (line 5 in this case)
        instrumentation_line = line_numbers[0]
        self.assertEqual(instrumentation_line, 4, # 0-indexed, so line 5 becomes 4
                        "Should instrument before the assignment line")

    def test_error_node_assignment_detection(self):
        """Test that ERROR nodes representing incomplete assignments are correctly detected"""
        # This tests the specific tree-sitter AST issue where assignments spanning
        # preprocessor blocks are parsed as ERROR nodes
        source_error_assignment = '''
void test_func(void) {
    ptr->field =
#ifdef CONFIG_TEST
        some_function();
#endif
}
'''
        
        tree = self.parser.parse(source_error_assignment)
        
        # Check that we can find ERROR nodes in the AST
        def find_error_nodes(node):
            error_nodes = []
            if node.type == 'ERROR':
                error_nodes.append(node)
            for child in node.children:
                error_nodes.extend(find_error_nodes(child))
            return error_nodes
        
        error_nodes = find_error_nodes(tree.root_node)
        
        # Should find at least one ERROR node (the incomplete assignment)
        self.assertGreater(len(error_nodes), 0, "Should detect ERROR nodes for incomplete assignment")
        
        # Check that at least one ERROR node contains assignment syntax
        source_bytes = source_error_assignment.encode('utf-8')
        found_assignment_error = False
        for error_node in error_nodes:
            error_text = source_bytes[error_node.start_byte:error_node.end_byte].decode('utf-8')
            if '=' in error_text and '->' in error_text:
                found_assignment_error = True
                break
        
        self.assertTrue(found_assignment_error, 
                       "Should find ERROR node containing assignment operator")

    def test_multiline_assignment_spanning(self):
        """Test more complex multiline assignment spanning cases"""
        source_complex_spanning = '''
void complex_test(void) {
    struct complex_struct *data;
    
    // Multi-line assignment with complex preprocessor
    data->very_long_field_name_that_spans_multiple_lines =
#if defined(CONFIG_OPTION_A)
        dma_alloc_coherent(device, 
                          LARGE_SIZE_CONSTANT, 
                          &data->dma_handle, 
                          GFP_KERNEL | __GFP_ZERO);
#elif defined(CONFIG_OPTION_B) 
        dma_alloc_wc(device, LARGE_SIZE_CONSTANT, &data->dma_handle, GFP_KERNEL);
#else
        NULL; // fallback
#endif
}
'''
        
        tree = self.parser.parse(source_complex_spanning)
        source_bytes = source_complex_spanning.encode('utf-8')
        
        calls = self.dma_analyzer.find_calls_in_file(source_complex_spanning)
        
        # Should detect both DMA allocation calls
        self.assertEqual(len(calls), 2, "Should detect both DMA calls in complex preprocessor")
        
        # Both should use before_assignment strategy
        for call in calls:
            self.assertEqual(call['instrumentation_strategy'], 'before_assignment',
                           f"Complex spanning assignment should use before_assignment strategy")
        
        # Verify function names
        function_names = {call['function_name'] for call in calls}
        expected_functions = {'dma_alloc_coherent', 'dma_alloc_wc'}
        self.assertEqual(function_names, expected_functions,
                        "Should detect both allocation functions")

    def test_nested_preprocessor_with_assignment(self):
        """Test nested preprocessor conditionals with assignments"""
        source_nested = '''
void nested_test(void) {
    struct test_data *ptr;
    
    ptr->buffer =
#ifdef CONFIG_ARCH_X86
  #ifdef CONFIG_64BIT
        dma_alloc_coherent(dev, size, &ptr->handle, GFP_KERNEL);
  #else
        dma_alloc_wc(dev, size, &ptr->handle, GFP_KERNEL);
  #endif
#else
        kmalloc(size, GFP_KERNEL);
#endif
}
'''
        
        tree = self.parser.parse(source_nested)
        source_bytes = source_nested.encode('utf-8')
        
        calls = self.dma_analyzer.find_calls_in_file(source_nested)
        
        # Should detect both DMA calls despite nested preprocessor
        self.assertEqual(len(calls), 2, "Should handle nested preprocessor conditionals")
        
        for call in calls:
            self.assertEqual(call['instrumentation_strategy'], 'before_assignment',
                           "Nested preprocessor should still use before_assignment")

    def test_user_copy_spanning_assignment(self):
        """Test that user copy operations also handle spanning assignments correctly"""
        source_user_copy_spanning = '''
int copy_test(void) {
    int result;
    
    result =
#ifdef CONFIG_HARDENED_USERCOPY
        copy_from_user(kernel_buf, user_buf, size);
#else
        __copy_from_user(kernel_buf, user_buf, size);
#endif
    
    return result;
}
'''
        
        tree = self.parser.parse(source_user_copy_spanning)
        source_bytes = source_user_copy_spanning.encode('utf-8')
        
        calls = self.user_copy_analyzer.find_calls_in_file(source_user_copy_spanning)
        
        # Should detect both user copy calls
        self.assertEqual(len(calls), 2, "Should detect both user copy variants")
        
        for call in calls:
            self.assertEqual(call['instrumentation_strategy'], 'before_assignment',
                           "User copy spanning assignment should use before_assignment")

    def test_no_false_positives_in_comments(self):
        """Test that calls in comments are not instrumented"""
        source_with_comments = '''
void test_comments(void) {
    // This dma_alloc_coherent call is in a comment - should NOT be detected
    /* 
     * Another dma_alloc_wc call in a multi-line comment
     * copy_from_user should also be ignored here
     */
    
    // Real call below:
    void *ptr = dma_alloc_coherent(dev, size, &handle, GFP_KERNEL);
}
'''
        
        tree = self.parser.parse(source_with_comments)
        source_bytes = source_with_comments.encode('utf-8')
        
        dma_calls = self.dma_analyzer.find_calls_in_file(source_with_comments)
        user_copy_calls = self.user_copy_analyzer.find_calls_in_file(source_with_comments)
        
        # Should only detect the real call, not the ones in comments
        self.assertEqual(len(dma_calls), 1, "Should not detect calls in comments")
        self.assertEqual(len(user_copy_calls), 0, "Should not detect user copy calls in comments")
        
        # Verify the detected call is the real one
        call = dma_calls[0]
        self.assertEqual(call['function_name'], 'dma_alloc_coherent')

    def test_preprocessor_without_assignment(self):
        """Test that regular preprocessor blocks without spanning assignments work correctly"""
        source_regular_preprocessor = '''
void regular_preprocessor_test(void) {
    struct test_data *data;
    
#ifdef CONFIG_DMA_COHERENT
    void *coherent_ptr = dma_alloc_coherent(dev, size, &handle1, GFP_KERNEL);
#endif

#ifdef CONFIG_DMA_WC  
    void *wc_ptr = dma_alloc_wc(dev, size, &handle2, GFP_KERNEL);
#endif
    
    // Regular assignment without preprocessor
    data->regular_field = dma_alloc_coherent(dev, 1024, &data->handle, GFP_KERNEL);
}
'''
        
        tree = self.parser.parse(source_regular_preprocessor)
        source_bytes = source_regular_preprocessor.encode('utf-8')
        
        calls = self.dma_analyzer.find_calls_in_file(source_regular_preprocessor)
        
        # Should detect all 3 calls
        self.assertEqual(len(calls), 3, "Should detect all DMA calls")
        
        # Check strategies - the first two should be in preprocessor, the last should be regular
        strategies = [call['instrumentation_strategy'] for call in calls]
        
        # First two calls should be before_statement_in_preprocessor (no spanning assignment)
        # Last call should be before_call or before_statement (regular assignment)
        preprocessor_calls = [s for s in strategies if 'preprocessor' in s]
        self.assertGreaterEqual(len(preprocessor_calls), 2, 
                               "Should detect calls inside preprocessor blocks")


def run_regression_tests():
    """Run all regression tests"""
    unittest.main(verbosity=2)


if __name__ == '__main__':
    run_regression_tests()
