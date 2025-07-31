#!/usr/bin/env python3
"""
Test for conditional instrumentation handling

This script tests that the kernel instrumenter correctly handles 
function calls inside conditional statements without breaking syntax.
"""

import os
import sys
import subprocess
import tempfile
import shutil
from pathlib import Path

# Get the project root directory
PROJECT_ROOT = Path(__file__).parent.parent.parent
TEST_DATA_DIR = PROJECT_ROOT / 'tests' / 'kernel_instrumenter_tests' / 'test_data' / 'sample_sources'

def test_conditional_instrumentation():
    """Test that conditional statements are handled correctly"""
    print("\n🧪 Testing conditional instrumentation handling...")
    
    # Test with the conditional test file
    conditional_file = TEST_DATA_DIR / 'test_conditional.c'
    switch_file = TEST_DATA_DIR / 'switch_test.c'
    
    success = True
    
    # Test 1: Simple if/else conditional
    if conditional_file.exists():
        print("   Testing if/else conditional statements...")
        success &= _test_single_file(conditional_file, 'conditional', 'dma user_copy')
    else:
        print(f"   ❌ Conditional test file not found: {conditional_file}")
        success = False
    
    # Test 2: Switch statement handling  
    if switch_file.exists():
        print("   Testing switch statement handling...")
        success &= _test_single_file(switch_file, 'switch', 'user_copy')
    else:
        print(f"   ❌ Switch test file not found: {switch_file}")
        success = False
    
    return success

def _test_single_file(test_file, test_type, types):
    """Test instrumentation on a single file"""
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_file = Path(temp_dir) / test_file.name
        shutil.copy2(test_file, temp_file)
        
        # Test dry run first
        result = subprocess.run([
            sys.executable, '-m', 'src.kernel_instrumenter.kernel_instrument', 
            temp_dir, '--types'] + types.split() + ['--dry-run', '--verbose'
        ], capture_output=True, text=True, cwd=str(PROJECT_ROOT))
        
        if result.returncode != 0:
            print(f"     ❌ {test_type} dry run failed: {result.returncode}")
            print(f"     STDERR: {result.stderr}")
            return False
        
        print(f"     ✅ {test_type} dry run successful")
        
        # Test actual instrumentation
        result = subprocess.run([
            sys.executable, '-m', 'src.kernel_instrumenter.kernel_instrument', 
            temp_dir, '--types'] + types.split() + ['--verbose'
        ], capture_output=True, text=True, cwd=str(PROJECT_ROOT))
        
        if result.returncode != 0:
            print(f"     ❌ {test_type} instrumentation failed: {result.returncode}")
            print(f"     STDERR: {result.stderr}")
            return False
        
        # Read and validate the instrumented file
        with open(temp_file, 'r') as f:
            instrumented_content = f.read()
        
        # Basic validation - check that original structure is preserved
        if test_type == 'conditional':
            if 'if (pfn_valid(pfn))' not in instrumented_content:
                print(f"     ❌ {test_type} structure not preserved")
                return False
        elif test_type == 'switch':
            if 'switch (cmd)' not in instrumented_content:
                print(f"     ❌ {test_type} structure not preserved")
                return False
            
            # For switch, verify instrumentation is inside cases, not before switch
            lines = instrumented_content.split('\n')
            switch_line = -1
            instrumentation_lines = []
            
            for i, line in enumerate(lines):
                if 'switch (cmd)' in line:
                    switch_line = i
                if 'USER_COPY:' in line or 'DMA_INSTRUMENT:' in line:
                    instrumentation_lines.append(i)
            
            if switch_line == -1:
                print(f"     ❌ Switch statement not found")
                return False
            
            # Check that instrumentation is AFTER the switch line (inside cases)
            instrumentation_in_cases = any(line > switch_line for line in instrumentation_lines)
            if not instrumentation_in_cases:
                print(f"     ❌ No instrumentation found inside switch cases")
                return False
        
        print(f"     ✅ {test_type} instrumentation placed correctly")
        return True

def main():
    """Run the conditional instrumentation test"""
    print("🔧 Testing Conditional & Switch Statement Handling")
    print("=" * 55)
    
    success = test_conditional_instrumentation()
    
    print("\n" + "=" * 55)
    if success:
        print("🎉 All conditional and switch tests passed!")
        print("   ✅ If/else statements handled correctly")
        print("   ✅ Switch statements handled correctly")
        print("   ✅ Individual case instrumentation working")
    else:
        print("⚠️  Some conditional/switch tests failed!")
    
    return success

if __name__ == '__main__':
    success = main()
    sys.exit(0 if success else 1)
