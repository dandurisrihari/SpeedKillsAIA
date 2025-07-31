#!/usr/bin/env python3

import re
from pathlib import Path

# Test the user copy detection logic
user_copy_functions = [
    'copy_from_user', 'copy_to_user', '__copy_from_user', '__copy_to_user',
    'get_user', 'put_user'
]

test_file = '/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/tests/enhanced_instrumentation/test_data/sample_sources/function_test.c'

with open(test_file, 'r') as f:
    content = f.read()

lines = content.split('\n')
print(f"Checking file: {test_file}")
print("=" * 60)

for i, line in enumerate(lines, 1):
    for func in user_copy_functions:
        pattern = rf'\b{re.escape(func)}\s*\('
        
        if re.search(pattern, line) and not line.strip().startswith('//') and not line.strip().startswith('*') and not line.strip().startswith('#'):
            func_def_pattern = rf'^\s*(static\s+|inline\s+|extern\s+)?\w+\s+\**\s*{re.escape(func)}\s*\('
            if not re.match(func_def_pattern, line):
                print(f"Line {i}: MATCH FOUND for {func}")
                print(f"  Content: {line}")
                print(f"  Pattern: {pattern}")
                print(f"  Func def pattern: {func_def_pattern}")
                print()

print("No matches found" if True else "")
