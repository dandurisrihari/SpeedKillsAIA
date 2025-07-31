#!/usr/bin/env python3

# Debug specific test cases that are failing

complex_content = '''#include <linux/uaccess.h>

// Complex function definition - should NOT be instrumented
static inline unsigned long 
__must_check copy_from_user(void *to, const void __user *from, unsigned long n)
{
    return raw_copy_from_user(to, from, n);
}

// Function call in complex expression - SHOULD be instrumented
int test_complex(void) {
    return copy_from_user(buffer, user_ptr, size) ? -EFAULT : 0;
}'''

macro_content = '''#include <linux/kernel.h>

#define COPY_FROM_USER_WRAPPER(dst, src, size) copy_from_user(dst, src, size)
#define USER_COPY_FUNC copy_to_user

int test_macro(void) {
    // This should be detected as it's an actual call
    if (COPY_FROM_USER_WRAPPER(buffer, user_ptr, 10)) {
        return -EFAULT;
    }
    return 0;
}'''

print("=== COMPLEX FUNCTION SIGNATURES TEST ===")
print(complex_content)
print("\n=== MACRO DEFINITIONS TEST ===")
print(macro_content)

print("\n=== ANALYSIS ===")
print("Complex test:")
print("- Line 'return copy_from_user(buffer, user_ptr, size) ? -EFAULT : 0;'")
print("  Should be instrumented but currently isn't because it ends with ';'")
print("  However, this is a legitimate function CALL, not a declaration")

print("\nMacro test:")
print("- Line 'if (COPY_FROM_USER_WRAPPER(buffer, user_ptr, 10)) {'")
print("  Contains copy_from_user in the macro expansion")
print("  Should be detected by the macro call detection logic")
