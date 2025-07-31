#!/usr/bin/env python3
"""
Comprehensive test runner for the kernel instrumenter

This script runs all tests including basic functionality and conditional handling.
"""

import os
import sys
import subprocess
from pathlib import Path

# Get the project root directory
PROJECT_ROOT = Path(__file__).parent.parent.parent

def run_test_script(script_name):
    """Run a test script and return the result"""
    script_path = PROJECT_ROOT / 'tests' / 'kernel_instrumenter_tests' / script_name
    
    if not script_path.exists():
        print(f"❌ Test script not found: {script_path}")
        return False
    
    result = subprocess.run([
        sys.executable, str(script_path)
    ], capture_output=True, text=True, cwd=str(PROJECT_ROOT))
    
    print(result.stdout)
    if result.stderr:
        print("STDERR:")
        print(result.stderr)
    
    return result.returncode == 0

def main():
    """Run all kernel instrumenter tests"""
    print("🧪 Running Complete Kernel Instrumenter Test Suite")
    print("=" * 60)
    
    tests = [
        ('Basic Functionality Tests', 'test_kernel_instrumenter_final.py'),
        ('Conditional Handling Tests', 'test_conditional_handling.py')
    ]
    
    passed = 0
    failed = 0
    
    for test_name, script_name in tests:
        print(f"\n📋 {test_name}")
        print("-" * 40)
        
        try:
            if run_test_script(script_name):
                passed += 1
                print(f"✅ {test_name} PASSED")
            else:
                failed += 1
                print(f"❌ {test_name} FAILED")
        except Exception as e:
            failed += 1
            print(f"❌ {test_name} FAILED with exception: {e}")
    
    print("\n" + "=" * 60)
    print(f"📊 Overall Test Results: {passed} passed, {failed} failed")
    
    if failed == 0:
        print("🎉 All tests passed! The kernel instrumenter is fully functional.")
        print("\n✨ Ready for production use:")
        print("   • DMA API instrumentation")
        print("   • User copy API instrumentation") 
        print("   • Function entry point instrumentation")
        print("   • Conditional statement handling")
        print("   • Multi-line call handling")
        print("   • Safe dry-run mode")
        return True
    else:
        print("⚠️  Some tests failed. Please review the output above.")
        return False

if __name__ == '__main__':
    success = main()
    sys.exit(0 if success else 1)
