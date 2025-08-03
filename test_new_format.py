#!/usr/bin/env python3
"""
Test script for new log format with ISO 8601 timestamps
"""

import sys
import os

# Add the src directory to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from preprocess.core.engine import KernelLogParserEngine

def test_new_format():
    """Test parsing logs with ISO 8601 timestamp format"""
    
    # Sample logs with new format
    sample_logs = [
        "2025-08-03T19:04:36,338434+00:00 FUNC_ENTRY:",
        "2025-08-03T19:04:36,338494+00:00 USER_COPY: About to call copy_to_user from function drv_ioctl at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:778",
        "2025-08-03T19:04:36,338497+00:00 USER_COPY_CONTEXT: Process PID=19795, COMM=label_image",
        "2025-08-03T19:04:36,338571+00:00 IOCTL_HANDLER: Function drv_ioctl called at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:778"
    ]
    
    print("🧪 Testing New ISO 8601 Timestamp Format")
    print("=" * 50)
    
    # Create parser engine
    engine = KernelLogParserEngine(show_ui=False)
    
    # Test timestamp extraction
    print("\n📅 Testing timestamp extraction:")
    for i, line in enumerate(sample_logs, 1):
        timestamp = engine.function_parser.extract_timestamp(line)
        print(f"  Line {i}: {timestamp}")
        if timestamp is None:
            print(f"    ❌ Failed to extract timestamp from: {line[:50]}...")
        else:
            print(f"    ✅ Extracted timestamp: {timestamp}")
    
    # Test full parsing
    print("\n🔍 Testing full parsing:")
    parsed_count = 0
    for i, line in enumerate(sample_logs, 1):
        print(f"\n📝 Line {i}: {line[:80]}...")
        result = engine.parse_line(line, i)
        if result:
            parsed_count += 1
            print(f"    ✅ Successfully parsed")
        else:
            print(f"    ❌ Failed to parse")
    
    print(f"\n📊 Results:")
    print(f"  Lines parsed: {parsed_count}/{len(sample_logs)}")
    print(f"  User copy operations: {len(engine.user_copy_operations)}")
    print(f"  IOCTL operations: {len(engine.ioctl_operations)}")
    
    # Show details
    if engine.user_copy_operations:
        uc = engine.user_copy_operations[0]
        print(f"\n👤 First User Copy Operation:")
        print(f"  Function: {uc.copy_function}")
        print(f"  Caller: {uc.caller_function}")
        print(f"  File: {uc.file_path}")
        print(f"  Line: {uc.line_number}")
        print(f"  Timestamp: {uc.first_seen_timestamp}")
    
    if engine.ioctl_operations:
        io = engine.ioctl_operations[0]
        print(f"\n🔧 First IOCTL Operation:")
        print(f"  Function: {io.function_name}")
        print(f"  File: {io.file_path}")
        print(f"  Line: {io.line_number}")
        print(f"  Timestamp: {io.first_seen_timestamp}")
    
    print(f"\n✅ Test completed!")
    return parsed_count > 0

if __name__ == "__main__":
    success = test_new_format()
    sys.exit(0 if success else 1)
