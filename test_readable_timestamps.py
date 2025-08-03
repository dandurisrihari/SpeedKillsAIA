#!/usr/bin/env python3
"""
Test script to verify readable timestamp format works correctly
"""

import sys
import os
sys.path.append('/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/src')

from preprocess.core.engine import KernelLogParserEngine
from preprocess.core.patterns import LogPatterns

def test_readable_timestamps():
    """Test that timestamps are stored in readable format"""
    # Initialize the engine
    patterns = LogPatterns()
    engine = KernelLogParserEngine(patterns)
    
    # Test with both timestamp formats
    test_lines = [
        "[   47.468247] FUNC_ENTRY: Entering function drv_ioctl at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:673",
        "2025-08-03T19:04:36,338434+00:00 FUNC_ENTRY: Entering function another_function at drivers/some/path.c:123"
    ]
    
    for line in test_lines:
        print(f"\nTesting line: {line}")
        
        # Extract timestamp
        timestamp_data = engine.function_parser.extract_timestamp(line)
        if timestamp_data:
            time_str, numeric_timestamp = timestamp_data
            print(f"  Readable timestamp: '{time_str}'")
            print(f"  Numeric timestamp: {numeric_timestamp}")
        else:
            print("  No timestamp extracted")
        
        # Parse the line
        success = engine.parse_line(line)
        print(f"  Parse success: {success}")
    
    # Print parsed results
    results = engine._build_results()
    print(f"\nParsed {len(results.functions_by_file)} files")
    
    for file_path, functions in results.functions_by_file.items():
        print(f"\nFile: {file_path}")
        for func in functions:
            print(f"  Function: {func.function_name}")
            print(f"    Readable time: '{func.first_seen_time_str}'")
            print(f"    Numeric time: {func.first_seen_timestamp}")
    
    # Test JSON output includes readable timestamps
    json_data = results.to_dict()
    if json_data['function_entries']:
        print(f"\nJSON output test:")
        for entry in json_data['function_entries']:
            print(f"  Function: {entry['function_name']}")
            print(f"    Readable time: '{entry['first_seen_time_str']}'")
            print(f"    Numeric time: {entry['first_seen_timestamp']}")

if __name__ == "__main__":
    test_readable_timestamps()
