#!/usr/bin/env python3

import sys
import os

# Add the src directory to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from src.preprocess.core.engine import KernelLogParserEngine

def test_ioctl_parsing():
    """Test IOCTL log parsing with sample data."""
    
    # Sample IOCTL log entries
    sample_logs = [
        "[   47.468247] IOCTL_HANDLER: Function drv_ioctl called at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c:673",
        "[   52.123456] IOCTL_HANDLER: Function video_ioctl called at drivers/media/video/video_core.c:123",  
        "[   55.789012] IOCTL_HANDLER: Function audio_control called at sound/soc/core/audio_driver.c:456"
    ]
    
    print("🧪 Testing IOCTL Log Parsing")
    print("=" * 50)
    
    # Create parser engine
    engine = KernelLogParserEngine()
    
    # Parse the sample logs
    parsed_count = 0
    for i, log_line in enumerate(sample_logs, 1):
        print(f"\n📝 Test {i}: {log_line}")
        result = engine.parse_line(log_line)
        
        if result:
            parsed_count += 1
            print(f"✅ Line parsed successfully")
        else:
            print(f"❌ Failed to parse line")
    
    # Check the results stored in the engine
    print(f"\n📊 Results Summary:")
    print(f"   Lines parsed: {parsed_count}/{len(sample_logs)}")
    print(f"   IOCTL operations found: {len(engine.ioctl_operations)}")
    
    # Validate the IOCTL operations were captured
    assert len(engine.ioctl_operations) > 0, "No IOCTL operations were captured"
    
    # Check the first IOCTL operation
    first_ioctl = engine.ioctl_operations[0]
    print(f"\n🔧 First IOCTL Operation:")
    print(f"   Function: {first_ioctl.function_name}")
    print(f"   File: {first_ioctl.file_path}")
    print(f"   Line: {first_ioctl.line_number}")
    print(f"   Timestamp: {first_ioctl.first_seen_timestamp}")
    
    assert first_ioctl.function_name == "drv_ioctl"
    assert "gc_hal_kernel_driver.c" in first_ioctl.file_path
    assert first_ioctl.line_number == 673
    
    print("\n" + "=" * 50)
    print("✅ IOCTL parsing test completed successfully!")

if __name__ == "__main__":
    test_ioctl_parsing()
