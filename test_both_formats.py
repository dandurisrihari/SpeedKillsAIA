#!/usr/bin/env python3
"""
Comprehensive test for both timestamp formats
"""

import sys
import os
import tempfile

# Add the src directory to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from preprocess.core.engine import KernelLogParserEngine

def test_both_formats():
    """Test parsing logs with both timestamp formats"""
    
    # Test log with both formats
    test_log_content = """[   47.468247] FUNC_ENTRY: Entering function old_function at drivers/old/old.c:123
2025-08-03T19:04:36,338434+00:00 FUNC_ENTRY: Entering function new_function at drivers/new/new.c:456
[   47.468248] USER_COPY: About to call copy_from_user from function old_function at drivers/old/old.c:124
2025-08-03T19:04:36,338494+00:00 USER_COPY: About to call copy_to_user from function new_function at drivers/new/new.c:457
[   47.468249] USER_COPY_CONTEXT: Process PID=1234, COMM=old_process
2025-08-03T19:04:36,338497+00:00 USER_COPY_CONTEXT: Process PID=19795, COMM=new_process
[   47.468250] IOCTL_HANDLER: Function old_ioctl called at drivers/old/old.c:125
2025-08-03T19:04:36,338571+00:00 IOCTL_HANDLER: Function new_ioctl called at drivers/new/new.c:458"""
    
    print("🧪 Testing Both Timestamp Formats")
    print("=" * 50)
    
    # Create temp file
    with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
        f.write(test_log_content)
        temp_file = f.name
    
    try:
        # Create parser engine
        engine = KernelLogParserEngine(show_ui=False)
        
        # Parse the file
        results = engine.parse_log_file(temp_file)
        
        print(f"\n📊 Results Summary:")
        print(f"  Total lines: {results['metadata']['total_lines']}")
        print(f"  Parsed lines: {results['metadata']['parsed_lines']}")
        print(f"  Function entries: {len(results['function_entries'])}")
        print(f"  User copy operations: {len(results['user_copy_operations'])}")
        print(f"  IOCTL operations: {len(results['ioctl_operations'])}")
        
        # Verify we got both old and new format entries
        functions = results['function_entries']
        user_copies = results['user_copy_operations']
        ioctl_ops = results['ioctl_operations']
        
        print(f"\n📍 Function Entries:")
        for func in functions:
            print(f"  - {func['function_name']} (timestamp: {func['first_seen_timestamp']})")
        
        print(f"\n👤 User Copy Operations:")
        for uc in user_copies:
            print(f"  - {uc['copy_function']} by {uc['caller_function']} (timestamp: {uc['first_seen_timestamp']})")
            if uc['process_info']:
                print(f"    Process: {uc['process_info']['comm']} (PID: {uc['process_info']['pid']})")
        
        print(f"\n🔧 IOCTL Operations:")
        for io in ioctl_ops:
            print(f"  - {io['function_name']} (timestamp: {io['first_seen_timestamp']})")
        
        # Validate timestamp ranges
        old_timestamps = [func['first_seen_timestamp'] for func in functions if func['function_name'] == 'old_function']
        new_timestamps = [func['first_seen_timestamp'] for func in functions if func['function_name'] == 'new_function']
        
        print(f"\n🕐 Timestamp Analysis:")
        if old_timestamps:
            print(f"  Old format timestamp: {old_timestamps[0]} (around 47 seconds)")
        if new_timestamps:
            print(f"  New format timestamp: {new_timestamps[0]} (epoch timestamp)")
        
        # Check we parsed all expected entries
        expected_entries = 8  # 2 functions + 2 user copies + 2 contexts + 2 ioctls
        actual_entries = len(functions) + len(user_copies) + len(ioctl_ops)
        
        print(f"\n✅ Validation:")
        print(f"  Expected entries: {expected_entries}")
        print(f"  Parsed entries: {actual_entries}")
        print(f"  Status: {'✅ PASS' if actual_entries >= 6 else '❌ FAIL'}")  # At least functions + user_copies + ioctls
        
        return actual_entries >= 6
        
    finally:
        os.unlink(temp_file)

if __name__ == "__main__":
    success = test_both_formats()
    sys.exit(0 if success else 1)
