#!/usr/bin/env python3
"""
Additional comprehensive tests for edge cases and error conditions
"""

import unittest
import tempfile
import shutil
import os
import sys
import subprocess
from pathlib import Path

# Add the src directory to the path so we can import the kernel tool
current_dir = os.path.dirname(os.path.abspath(__file__))
repo_root = os.path.dirname(os.path.dirname(current_dir))
instrumentation_dir = os.path.join(repo_root, 'src', 'kernel_instrumenter')
sys.path.insert(0, instrumentation_dir)

import kernel_instrument


class TestEnhancedInstrumentationEdgeCases(unittest.TestCase):
    """Extended edge case tests for the kernel instrumentation tool."""
    
    def setUp(self):
        """Set up test environment before each test."""
        self.test_dir = tempfile.mkdtemp()
    
    def tearDown(self):
        """Clean up test environment after each test."""
        shutil.rmtree(self.test_dir, ignore_errors=True)
    
    def test_empty_files(self):
        """Test instrumentation on empty files."""
        empty_file = os.path.join(self.test_dir, 'empty.c')
        with open(empty_file, 'w') as f:
            f.write('')
        
        success = kernel_instrument.instrument_user_copy_operations(self.test_dir, dry_run=True)
        self.assertTrue(success)
    
    def test_comments_only_file(self):
        """Test file with only comments."""
        comment_file = os.path.join(self.test_dir, 'comments.c')
        with open(comment_file, 'w') as f:
            f.write('''// This file has only comments
/* 
 * Multi-line comment
 * copy_from_user should not be detected here
 */
// Another comment with copy_to_user
''')
        
        success = kernel_instrument.instrument_user_copy_operations(self.test_dir, dry_run=True)
        self.assertTrue(success)
    
    def test_string_literals_with_user_copy_names(self):
        """Test file with user copy function names in string literals."""
        string_file = os.path.join(self.test_dir, 'strings.c')
        with open(string_file, 'w') as f:
            f.write('''#include <linux/kernel.h>

void test_function(void) {
    printk("This copy_from_user is in a string");
    char *msg = "copy_to_user should not be detected";
    // This get_user is in a comment
}
''')
        
        success = kernel_instrument.instrument_user_copy_operations(self.test_dir, dry_run=True)
        self.assertTrue(success)
    
    def test_macro_definitions(self):
        """Test file with user copy function names in macro definitions."""
        macro_file = os.path.join(self.test_dir, 'macros.c')
        with open(macro_file, 'w') as f:
            f.write('''#include <linux/kernel.h>

#define COPY_FROM_USER_WRAPPER(dst, src, size) copy_from_user(dst, src, size)
#define USER_COPY_FUNC copy_to_user

int test_macro(void) {
    // This should be detected as it's an actual call
    if (COPY_FROM_USER_WRAPPER(buffer, user_ptr, 10)) {
        return -EFAULT;
    }
    return 0;
}
''')
        
        success = kernel_instrument.instrument_user_copy_operations(self.test_dir, dry_run=False)
        self.assertTrue(success)
        
        # Check that the actual call was instrumented
        with open(macro_file, 'r') as f:
            content = f.read()
            self.assertIn('USER_COPY_TRACE', content)
    
    def test_function_declarations(self):
        """Test that function declarations are not instrumented."""
        decl_file = os.path.join(self.test_dir, 'declarations.c')
        with open(decl_file, 'w') as f:
            f.write('''#include <linux/uaccess.h>

// Function declarations - should NOT be instrumented
extern unsigned long copy_from_user(void *to, const void __user *from, unsigned long n);
static inline unsigned long copy_to_user(void __user *to, const void *from, unsigned long n);

// Function calls - SHOULD be instrumented  
int test_calls(void) {
    if (copy_from_user(buffer, user_ptr, 10)) {
        return -EFAULT;
    }
    
    if (copy_to_user(user_ptr, buffer, 10)) {
        return -EFAULT;
    }
    
    return 0;
}
''')
        
        kernel_instrument.instrument_user_copy_operations(self.test_dir, dry_run=False)
        
        with open(decl_file, 'r') as f:
            content = f.read()
            lines = content.split('\n')
            
            # Count instrumentation lines
            instrumentation_lines = [line for line in lines if 'USER_COPY_TRACE' in line]
            # Should have exactly 2 instrumentations (for the calls, not declarations)
            self.assertEqual(len(instrumentation_lines), 2)
    
    def test_complex_function_signatures(self):
        """Test complex function signatures are handled correctly."""
        complex_file = os.path.join(self.test_dir, 'complex.c')
        with open(complex_file, 'w') as f:
            f.write('''#include <linux/uaccess.h>

// Complex function definition - should NOT be instrumented
static inline unsigned long 
__must_check copy_from_user(void *to, const void __user *from, unsigned long n)
{
    return raw_copy_from_user(to, from, n);
}

// Function call in complex expression - SHOULD be instrumented
int test_complex(void) {
    return copy_from_user(buffer, user_ptr, size) ? -EFAULT : 0;
}
''')
        
        kernel_instrument.instrument_user_copy_operations(self.test_dir, dry_run=False)
        
        with open(complex_file, 'r') as f:
            content = f.read()
            lines = content.split('\n')
            
            # Count instrumentation lines
            instrumentation_lines = [line for line in lines if 'USER_COPY_TRACE' in line]
            # Should have exactly 1 instrumentation (for the call, not definition)
            self.assertEqual(len(instrumentation_lines), 1)
    
    def test_file_permissions(self):
        """Test handling of read-only files."""
        readonly_file = os.path.join(self.test_dir, 'readonly.c')
        with open(readonly_file, 'w') as f:
            f.write('''#include <linux/uaccess.h>
int test(void) { copy_from_user(buf, user, 10); return 0; }''')
        
        # Make file read-only
        os.chmod(readonly_file, 0o444)
        
        # Should handle gracefully in dry run
        success = kernel_instrument.instrument_user_copy_operations(self.test_dir, dry_run=True)
        self.assertTrue(success)
        
        # Restore permissions for cleanup
        os.chmod(readonly_file, 0o644)
    
    def test_very_long_lines(self):
        """Test handling of very long lines."""
        long_line_file = os.path.join(self.test_dir, 'long_lines.c')
        with open(long_line_file, 'w') as f:
            # Create a very long line with user copy function
            long_line = 'if (' + 'very_long_variable_name_' * 20 + ' && copy_from_user(buffer, user_ptr, size)) { return -EFAULT; }'
            f.write(f'''#include <linux/uaccess.h>
int test_long(void) {{
    {long_line}
    return 0;
}}''')
        
        success = kernel_instrument.instrument_user_copy_operations(self.test_dir, dry_run=False)
        self.assertTrue(success)
        
        with open(long_line_file, 'r') as f:
            content = f.read()
            self.assertIn('USER_COPY_TRACE', content)


class TestEnhancedInstrumentationPerformance(unittest.TestCase):
    """Performance and stress tests for the enhanced instrumentation tool."""
    
    def setUp(self):
        """Set up test environment before each test."""
        self.test_dir = tempfile.mkdtemp()
    
    def tearDown(self):
        """Clean up test environment after each test."""
        shutil.rmtree(self.test_dir, ignore_errors=True)
    
    def test_many_files(self):
        """Test instrumentation on many files."""
        # Create 50 small test files
        for i in range(50):
            test_file = os.path.join(self.test_dir, f'test_{i}.c')
            has_user_copy = i % 3 == 0  # Every 3rd file has user copy operations
            
            if has_user_copy:
                content = f'''#include <linux/uaccess.h>
int test_{i}(void) {{
    copy_from_user(buf, user, 10);
    return 0;
}}'''
            else:
                content = f'''#include <linux/kernel.h>
int test_{i}(void) {{
    printk("No user copy here");
    return 0;
}}'''
            
            with open(test_file, 'w') as f:
                f.write(content)
        
        # Should complete within reasonable time
        import time
        start_time = time.time()
        success = kernel_instrument.instrument_user_copy_operations(self.test_dir, dry_run=True)
        end_time = time.time()
        
        self.assertTrue(success)
        self.assertLess(end_time - start_time, 10.0)  # Should complete within 10 seconds
    
    def test_large_files(self):
        """Test instrumentation on large files."""
        large_file = os.path.join(self.test_dir, 'large.c')
        
        # Create a large file with some user copy operations
        lines = ['#include <linux/uaccess.h>']
        for i in range(1000):
            if i % 100 == 0:
                lines.append(f'    copy_from_user(buf_{i}, user_{i}, 10);')
            else:
                lines.append(f'    // This is line {i} with some code')
        
        lines.insert(1, 'int large_function(void) {')
        lines.append('    return 0;')
        lines.append('}')
        
        with open(large_file, 'w') as f:
            f.write('\n'.join(lines))
        
        success = kernel_instrument.instrument_user_copy_operations(self.test_dir, dry_run=True)
        self.assertTrue(success)


if __name__ == '__main__':
    print("=" * 80)
    print("ENHANCED INSTRUMENTATION TOOL - ADDITIONAL EDGE CASE TESTS")
    print("=" * 80)
    print()
    
    # Run tests
    loader = unittest.TestLoader()
    suite = unittest.TestSuite()
    
    suite.addTests(loader.loadTestsFromTestCase(TestEnhancedInstrumentationEdgeCases))
    suite.addTests(loader.loadTestsFromTestCase(TestEnhancedInstrumentationPerformance))
    
    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)
    
    print()
    print("=" * 80)
    print("ADDITIONAL TESTS SUMMARY")
    print("=" * 80)
    print(f"Tests run: {result.testsRun}")
    print(f"Failures: {len(result.failures)}")
    print(f"Errors: {len(result.errors)}")
    
    if result.wasSuccessful():
        print("\n✅ ALL ADDITIONAL TESTS PASSED!")
        sys.exit(0)
    else:
        print("\n❌ SOME ADDITIONAL TESTS FAILED!")
        sys.exit(1)
