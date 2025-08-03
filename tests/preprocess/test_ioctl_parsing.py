#!/usr/bin/env python3

import sys
import os

# Add the src directory to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from preprocess.core.engine import KernelLogParserEngine

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
    for i, log_line in enumerate(sample_logs, 1):
        print(f"\n📝 Test {i}: {log_line}")
        result = engine.parse_line(log_line)
        
        if result and result.ioctl_operation:
            ioctl = result.ioctl_operation
            print(f"✅ Parsed successfully:")
            print(f"   Function: {ioctl.function_name}")
            print(f"   File: {ioctl.file_path}")
            print(f"   Line: {ioctl.line_number}")
            print(f"   Timestamp: {ioctl.timestamp}")
            if ioctl.function_code:
                print(f"   Function Code: {len(ioctl.function_code)} characters")
            else:
                print(f"   Function Code: Not extracted (file not found)")
        else:
            print(f"❌ Failed to parse")
    
    print("\n" + "=" * 50)
    print("✅ IOCTL parsing test completed!")

if __name__ == "__main__":
    test_ioctl_parsing()
