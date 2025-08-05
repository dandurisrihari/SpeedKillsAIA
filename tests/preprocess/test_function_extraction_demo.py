#!/usr/bin/env python3
"""
Test function code extraction for all operation types with UI enabled
"""

import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from src.preprocess.core.engine import KernelLogParserEngine

def test_function_code_extraction_with_ui():
    """Test function code extraction for all types with UI enabled"""
    
    # Create test log content with correct patterns and existing file path
    test_driver_path = "/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/tests/kernel_instrumenter_tests/test_data/test_dma_driver.c"
    
    test_log_content = f"""[  123.456789] FUNC_ENTRY: Entering function allocate_dma_buffer at {test_driver_path}:16
[  123.456790] FUNC_ENTRY: Entering function simple_function at {test_driver_path}:9
[  123.456791] DMA_INSTRUMENT: About to call dma_alloc_coherent from function allocate_dma_buffer at {test_driver_path}:19
[  123.456792] DMA_INSTRUMENT: About to call dma_alloc_coherent from function allocate_dma_buffer at {test_driver_path}:19
[  123.456793] USER_COPY: About to call copy_from_user from function some_handler at {test_driver_path}:30
[  123.456794] USER_COPY: About to call copy_from_user from function some_handler at {test_driver_path}:30
[  123.456795] IOCTL_HANDLER: Function device_ioctl called at {test_driver_path}:35
[  123.456796] FUNC_ENTRY: Entering function simple_function at {test_driver_path}:9
[  123.456797] IOCTL_HANDLER: Function device_ioctl called at {test_driver_path}:35"""
    
    # Write test log file
    test_log_file = "test_all_types_with_ui.log"
    with open(test_log_file, 'w') as f:
        f.write(test_log_content)
    
    print("🚀 Testing Function Code Extraction for All Types")
    print("=" * 60)
    print("This test demonstrates function code extraction for:")
    print("📍 Function Entries")
    print("🔄 DMA Operations") 
    print("👤 User Copy Operations")
    print("🔧 IOCTL Operations")
    print()
    
    try:
        # Create engine with UI enabled
        engine = KernelLogParserEngine(show_ui=True)
        
        print("Starting parsing...")
        results = engine.parse_log_file(test_log_file)
        
        print()
        print("🔍 RESULTS SUMMARY:")
        print("=" * 40)
        
        # Function entries
        print(f"\n📍 FUNCTION ENTRIES: {len(results['function_entries'])}")
        for func in results['function_entries']:
            print(f"  • {func['function_name']} (called {func['call_count']} times)")
            if func.get('function_code'):
                print(f"    ✅ Function code extracted ({len(func['function_code'])} characters)")
            else:
                print(f"    ❌ No function code extracted")
        
        # DMA operations
        print(f"\n🔄 DMA OPERATIONS: {len(results['dma_operations'])}")
        for dma in results['dma_operations']:
            print(f"  • {dma['dma_function']} called by {dma['caller_function']} (called {dma['call_count']} times)")
            if dma.get('function_code'):
                print(f"    ✅ Function code extracted ({len(dma['function_code'])} characters)")
            else:
                print(f"    ❌ No function code extracted")
        
        # User copy operations
        print(f"\n👤 USER COPY OPERATIONS: {len(results['user_copy_operations'])}")
        for copy_op in results['user_copy_operations']:
            print(f"  • {copy_op['copy_function']} called by {copy_op['caller_function']} (called {copy_op['call_count']} times)")
            if copy_op.get('function_code'):
                print(f"    ✅ Function code extracted ({len(copy_op['function_code'])} characters)")
            else:
                print(f"    ❌ No function code extracted")
        
        # IOCTL operations
        print(f"\n🔧 IOCTL OPERATIONS: {len(results['ioctl_operations'])}")
        for ioctl in results['ioctl_operations']:
            print(f"  • {ioctl['function_name']} (called {ioctl['call_count']} times)")
            if ioctl.get('function_code'):
                print(f"    ✅ Function code extracted ({len(ioctl['function_code'])} characters)")
            else:
                print(f"    ❌ No function code extracted")
        
        print()
        print("✅ Test completed successfully!")
        
        # Save results to JSON to show function code is included
        import json
        with open('test_results_with_function_code.json', 'w') as f:
            json.dump(results, f, indent=2)
        print("📄 Results saved to test_results_with_function_code.json")
        
    finally:
        # Cleanup
        if os.path.exists(test_log_file):
            os.remove(test_log_file)

if __name__ == '__main__':
    test_function_code_extraction_with_ui()
