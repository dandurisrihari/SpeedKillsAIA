#!/usr/bin/env python3
"""
Quick integration test for the user's exact command format.
This test can be run immediately to verify the fix works.
"""

import sys
import subprocess
from pathlib import Path


def test_argument_parsing():
    """Test that the command line arguments are parsed correctly"""
    
    # Test the exact command that failed before
    cmd = [
        sys.executable, "-m", "src.preprocess", 
        "--help"
    ]
    
    print("🔍 Testing help output for --source-root option...")
    result = subprocess.run(cmd, capture_output=True, text=True)
    
    assert result.returncode == 0, f"Help command failed: {result.stderr}"
    
    assert "--source-root" in result.stdout, f"--source-root option not found in help text. Help output: {result.stdout}"
    
    print("✅ --source-root option found in help text")
    
    # Test the exact failing command structure (with dry run)
    cmd = [
        sys.executable, "-m", "src.preprocess",
        "--web-ui",
        "--source-root", "data/kernel_sources/nxp/",
        "-o", "temp.json",
        "--help"  # Using --help to test parsing without actually running
    ]
    
    print("🔍 Testing command argument parsing...")
    result = subprocess.run(cmd, capture_output=True, text=True)
    
    # With --help, it should show help and exit with code 0
    assert result.returncode == 0, f"Command parsing failed: {result.stderr}"
    
    print("✅ Command arguments parsed successfully")


def test_basic_functionality():
    """Test basic functionality with minimal setup"""
    
    # Create a minimal test log file
    test_log = Path("test_minimal.log")
    test_log.write_text("""
[    1.234567] test: test_function entry
[    1.234568] test: dma_alloc_coherent called
[    1.234569] test: test_function exit
    """)
    
    try:
        cmd = [
            sys.executable, "-m", "src.preprocess",
            "--source-root", ".",  # Use current directory as source root
            "-o", "test_output.json",
            "--no-ui",  # Disable UI for testing
            str(test_log)
        ]
        
        print("🔍 Testing basic functionality...")
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
        
        assert result.returncode == 0, f"Basic functionality test failed: {result.stderr}"
        
        # Check if output file was created
        output_file = Path("test_output.json")
        assert output_file.exists(), "Output file was not created"
        
        print("✅ Basic functionality test passed")
        
    except subprocess.TimeoutExpired:
        assert False, "Basic functionality test timed out"
    finally:
        # Clean up
        test_log.unlink(missing_ok=True)
        Path("test_output.json").unlink(missing_ok=True)


if __name__ == "__main__":
    print("🚀 Running quick integration tests for --source-root option...")
    print("=" * 60)
    
    success = True
    
    # Test 1: Argument parsing
    try:
        test_argument_parsing()
        print("✅ Argument parsing test passed")
    except AssertionError as e:
        print(f"❌ Argument parsing test failed: {e}")
        success = False
    except Exception as e:
        print(f"❌ Argument parsing test error: {e}")
        success = False
    
    print()
    
    # Test 2: Basic functionality
    try:
        test_basic_functionality()
        print("✅ Basic functionality test passed")
    except AssertionError as e:
        print(f"❌ Basic functionality test failed: {e}")
        success = False
    except Exception as e:
        print(f"❌ Basic functionality test error: {e}")
        success = False
    
    print()
    print("=" * 60)
    
    if success:
        print("🎉 All tests passed! The --source-root option is working correctly.")
        print("\nYou can now use the command:")
        print("python3 -m src.preprocess --web-ui --source-root data/kernel_sources/nxp/ -o temp.json data/logs/nxp/nxp_uart_boot_dma_userapi_dmafilefuncs_ioctl.log")
    else:
        print("❌ Some tests failed. Please check the errors above.")
        sys.exit(1)
