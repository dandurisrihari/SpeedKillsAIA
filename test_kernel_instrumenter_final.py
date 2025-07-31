#!/usr/bin/env python3
"""
Final test for the completed kernel instrumenter tool

This script tests the complete kernel_instrumenter implementation.
"""

import os
import sys
import subprocess
import tempfile
import shutil
from pathlib import Path

def test_help_command():
    """Test the help command works"""
    print("\n1. Testing help command...")
    result = subprocess.run([
        sys.executable, '-m', 'src.kernel_instrumenter.kernel_instrument', '--help'
    ], capture_output=True, text=True, cwd='/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA')
    
    if result.returncode == 0 and 'Comprehensive kernel instrumentation tool' in result.stdout:
        print("   ✅ Help command works correctly")
        return True
    else:
        print(f"   ❌ Help command failed: {result.returncode}")
        print(f"   STDOUT: {result.stdout}")
        print(f"   STDERR: {result.stderr}")
        return False

def test_dry_run():
    """Test dry run functionality"""
    print("\n2. Testing dry run functionality...")
    
    # Test with the existing sample sources
    sample_dir = '/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/tests/kernel_instrumenter_tests/test_data/sample_sources'
    
    result = subprocess.run([
        sys.executable, '-m', 'src.kernel_instrumenter.kernel_instrument', 
        sample_dir, '--dry-run', '--verbose'
    ], capture_output=True, text=True, cwd='/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA')
    
    if result.returncode == 0 and 'DRY RUN MODE' in result.stdout and 'completed successfully' in result.stdout:
        print("   ✅ Dry run works correctly")
        return True
    else:
        print(f"   ❌ Dry run failed: {result.returncode}")
        print(f"   STDOUT: {result.stdout}")
        print(f"   STDERR: {result.stderr}")
        return False

def test_specific_types():
    """Test specific instrumentation types"""
    print("\n3. Testing specific instrumentation types...")
    
    sample_dir = '/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/tests/kernel_instrumenter_tests/test_data/sample_sources'
    
    # Test DMA only
    result = subprocess.run([
        sys.executable, '-m', 'src.kernel_instrumenter.kernel_instrument', 
        sample_dir, '--types', 'dma', '--dry-run'
    ], capture_output=True, text=True, cwd='/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA')
    
    if result.returncode == 0 and 'Enabled instrumentation types: dma' in result.stdout:
        print("   ✅ DMA-only instrumentation works")
    else:
        print(f"   ❌ DMA-only test failed: {result.returncode}")
        return False
    
    # Test user_copy only
    result = subprocess.run([
        sys.executable, '-m', 'src.kernel_instrumenter.kernel_instrument', 
        sample_dir, '--types', 'user_copy', '--dry-run'
    ], capture_output=True, text=True, cwd='/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA')
    
    if result.returncode == 0 and 'Enabled instrumentation types: user_copy' in result.stdout:
        print("   ✅ User copy-only instrumentation works")
    else:
        print(f"   ❌ User copy-only test failed: {result.returncode}")
        return False
    
    # Test functions only
    result = subprocess.run([
        sys.executable, '-m', 'src.kernel_instrumenter.kernel_instrument', 
        sample_dir, '--types', 'functions', '--dry-run'
    ], capture_output=True, text=True, cwd='/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA')
    
    if result.returncode == 0 and 'Enabled instrumentation types: functions' in result.stdout:
        print("   ✅ Functions-only instrumentation works")
        return True
    else:
        print(f"   ❌ Functions-only test failed: {result.returncode}")
        return False

def test_direct_execution():
    """Test direct execution of the script"""
    print("\n4. Testing direct execution...")
    
    result = subprocess.run([
        sys.executable, 'kernel_instrument.py', '--help'
    ], capture_output=True, text=True, 
    cwd='/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/src/kernel_instrumenter')
    
    if result.returncode == 0 and 'Comprehensive kernel instrumentation tool' in result.stdout:
        print("   ✅ Direct execution works correctly")
        return True
    else:
        print(f"   ❌ Direct execution failed: {result.returncode}")
        print(f"   STDOUT: {result.stdout}")
        print(f"   STDERR: {result.stderr}")
        return False

def main():
    """Run all tests"""
    print("🔧 Testing Complete Kernel Instrumenter Implementation")
    print("=" * 60)
    
    tests = [
        test_help_command,
        test_dry_run,
        test_specific_types,
        test_direct_execution
    ]
    
    passed = 0
    failed = 0
    
    for test in tests:
        try:
            if test():
                passed += 1
            else:
                failed += 1
        except Exception as e:
            print(f"   ❌ Test failed with exception: {e}")
            failed += 1
    
    print("\n" + "=" * 60)
    print(f"🏁 Test Results: {passed} passed, {failed} failed")
    
    if failed == 0:
        print("🎉 All tests passed! The kernel instrumenter is working correctly.")
        return True
    else:
        print("⚠️  Some tests failed. Please review the output above.")
        return False

if __name__ == '__main__':
    success = main()
    sys.exit(0 if success else 1)
