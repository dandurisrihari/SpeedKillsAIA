#!/usr/bin/env python3

import re

# Test the function definition detection regex
test_lines = [
    # Function declarations - should NOT be instrumented
    "extern unsigned long copy_from_user(void *to, const void __user *from, unsigned long n);",
    "static inline unsigned long copy_to_user(void __user *to, const void *from, unsigned long n);",
    
    # Complex function definition - should NOT be instrumented
    "static inline unsigned long",
    "__must_check copy_from_user(void *to, const void __user *from, unsigned long n)",
    
    # Function calls - SHOULD be instrumented
    "    if (copy_from_user(buffer, user_ptr, 10)) {",
    "    if (copy_to_user(user_ptr, buffer, 10)) {",
    "    return copy_from_user(buffer, user_ptr, size) ? -EFAULT : 0;",
    
    # Macro call - SHOULD be instrumented
    "    if (COPY_FROM_USER_WRAPPER(buffer, user_ptr, 10)) {",
]

user_copy_functions = ['copy_from_user', 'copy_to_user', '__copy_from_user', '__copy_to_user', 'get_user', 'put_user']

print("Testing UPDATED function definition detection:")
print("=" * 60)

for i, line in enumerate(test_lines):
    print(f"Line {i+1}: {line}")
    
    for func in user_copy_functions:
        pattern = rf'\b{re.escape(func)}\s*\('
        
        if re.search(pattern, line) and not line.strip().startswith('//') and not line.strip().startswith('*') and not line.strip().startswith('#'):
            # Use the updated detection logic
            func_def_patterns = [
                rf'^\s*extern\s+.*\b{re.escape(func)}\s*\(',
                rf'^\s*(static\s+|inline\s+)+.*\b{re.escape(func)}\s*\(',
                rf'^\s*(?!return\s|if\s|while\s|for\s|switch\s)\w+(\s+\w+)*\s+\**\s*{re.escape(func)}\s*\(',
                rf'^\s*(static\s+|inline\s+|extern\s+)+\w+.*\b{re.escape(func)}\s*\('
            ]
            
            is_function_definition = False
            for def_pattern in func_def_patterns:
                if re.match(def_pattern, line):
                    is_function_definition = True
                    print(f"  MATCHED definition pattern: {def_pattern}")
                    break
            
            # Additional checks
            if 'extern' in line and re.search(rf'\b{re.escape(func)}\s*\(.*\)\s*;', line):
                is_function_definition = True
                print(f"  MATCHED extern declaration pattern")
            if line.strip().endswith(';') and not line.strip().startswith('//'):
                is_function_definition = True
                print(f"  MATCHED semicolon ending pattern")
            
            print(f"  MATCH for {func}")
            print(f"    Pattern: {pattern}")
            print(f"    Is function definition: {is_function_definition}")
            print(f"    Should instrument: {not is_function_definition}")
            break
    else:
        print("  No matches")
    print()
