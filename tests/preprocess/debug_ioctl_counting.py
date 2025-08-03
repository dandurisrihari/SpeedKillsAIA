#!/usr/bin/env python3
"""
Debug IOCTL call counting issue
"""

import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from preprocess.core.engine import KernelLogParserEngine

def test_ioctl_counting():
    """Test IOCTL call counting with debug output"""
    
    # Create simple test log with multiple IOCTL calls
    test_log_content = """[   47.468133] IOCTL_HANDLER: Function drv_ioctl called at drivers/test.c:100
[   47.468247] IOCTL_HANDLER: Function drv_ioctl called at drivers/test.c:100
[   47.502159] IOCTL_HANDLER: Function drv_ioctl called at drivers/test.c:100
[   47.502262] IOCTL_HANDLER: Function other_ioctl called at drivers/test.c:200
[   47.506682] IOCTL_HANDLER: Function drv_ioctl called at drivers/test.c:100"""
    
    # Write test file
    with open('debug_ioctl_test.log', 'w') as f:
        f.write(test_log_content)
    
    try:
        print("🧪 Testing IOCTL call counting...")
        print("Test log content:")
        print(test_log_content)
        print("\n" + "="*50)
        
        # Parse with UI to see what happens
        engine = KernelLogParserEngine(show_ui=True)
        
        # Add some debug output for the deduplication process
        print("\n🔧 Checking deduplication tracker before parsing...")
        
        # Debug the deduplication tracker itself
        original_is_duplicate = engine.deduplicator.ioctl_operations.is_duplicate
        
        def debug_is_duplicate(item):
            result = original_is_duplicate(item)
            key = (item.function_name, item.file_path, item.line_number)
            count = engine.deduplicator.ioctl_operations._call_counts.get(key, 0)
            print(f"    is_duplicate({item.function_name}): {result}, count after: {count}")
            return result
        
        engine.deduplicator.ioctl_operations.is_duplicate = debug_is_duplicate
        
        # Also debug the _set_call_counts method
        original_set_call_counts = engine._set_call_counts
        
        def debug_set_call_counts():
            print("\n🔢 Setting call counts...")
            for ioctl in engine.ioctl_operations:
                before_count = ioctl.call_count
                call_count = engine.deduplicator.ioctl_operations.get_call_count(ioctl)
                ioctl.call_count = call_count
                print(f"  {ioctl.function_name}: {before_count} → {call_count}")
            return original_set_call_counts()
        
        engine._set_call_counts = debug_set_call_counts
        
        results = engine.parse_log_file('debug_ioctl_test.log')
        
        print("\n📊 RESULTS:")
        print(f"Total IOCTL operations: {len(results['ioctl_operations'])}")
        
        for i, ioctl in enumerate(results['ioctl_operations']):
            print(f"\nIOCTL {i+1}:")
            print(f"  Function: {ioctl['function_name']}")
            print(f"  Location: {ioctl['file_path']}:{ioctl['line_number']}")
            print(f"  Call count: {ioctl['call_count']}")
        
        print("\n🔍 EXPECTED:")
        print("  drv_ioctl at drivers/test.c:100 should have call_count = 4")
        print("  other_ioctl at drivers/test.c:200 should have call_count = 1")
        
        # Verify correctness
        drv_ioctl = next((op for op in results['ioctl_operations'] 
                         if op['function_name'] == 'drv_ioctl'), None)
        other_ioctl = next((op for op in results['ioctl_operations'] 
                           if op['function_name'] == 'other_ioctl'), None)
        
        print("\n✅ VERIFICATION:")
        if drv_ioctl and drv_ioctl['call_count'] == 4:
            print("  ✅ drv_ioctl count is correct (4)")
        else:
            print(f"  ❌ drv_ioctl count is wrong: {drv_ioctl['call_count'] if drv_ioctl else 'NOT FOUND'}")
            
        if other_ioctl and other_ioctl['call_count'] == 1:
            print("  ✅ other_ioctl count is correct (1)")
        else:
            print(f"  ❌ other_ioctl count is wrong: {other_ioctl['call_count'] if other_ioctl else 'NOT FOUND'}")
            
    finally:
        # Cleanup
        if os.path.exists('debug_ioctl_test.log'):
            os.remove('debug_ioctl_test.log')

if __name__ == '__main__':
    test_ioctl_counting()
