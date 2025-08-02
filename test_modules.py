#!/usr/bin/env python3
"""
Module Validation Test Script

Tests that both src.kernel_instrumenter and src.preprocess modules work correctly
"""

import sys
from pathlib import Path

def test_imports():
    """Test that all modules can be imported"""
    print("🧪 Testing Module Imports")
    print("=" * 40)
    
    try:
        import src.kernel_instrumenter as ki
        print("✅ src.kernel_instrumenter imports successfully")
        print(f"   Version: {ki.__version__}")
        print(f"   Author: {ki.__author__}")
    except Exception as e:
        print(f"❌ src.kernel_instrumenter import failed: {e}")
        return False
    
    try:
        import src.preprocess as preprocess
        print("✅ src.preprocess imports successfully")
        print(f"   Version: {preprocess.__version__}")
        print(f"   Author: {preprocess.__author__}")
    except Exception as e:
        print(f"❌ src.preprocess import failed: {e}")
        return False
    
    return True

def test_main_classes():
    """Test that main classes can be instantiated"""
    print("\n🔧 Testing Main Classes")
    print("=" * 40)
    
    try:
        from src.kernel_instrumenter import KernelInstrumenter
        instrumenter = KernelInstrumenter(enabled_types={'dma'}, dry_run=True)
        print("✅ KernelInstrumenter instantiated successfully")
    except Exception as e:
        print(f"❌ KernelInstrumenter instantiation failed: {e}")
        return False
    
    try:
        from src.preprocess import KernelLogParserTool
        tool = KernelLogParserTool()
        print("✅ KernelLogParserTool instantiated successfully")
    except Exception as e:
        print(f"❌ KernelLogParserTool instantiation failed: {e}")
        return False
    
    return True

def test_convenience_functions():
    """Test convenience functions"""
    print("\n📋 Testing Convenience Functions")
    print("=" * 40)
    
    try:
        from src.kernel_instrumenter import get_version_info
        info = get_version_info()
        print("✅ kernel_instrumenter.get_version_info() works")
        print(f"   Capabilities: {len(info.get('capabilities', {}))}")
    except Exception as e:
        print(f"❌ kernel_instrumenter.get_version_info() failed: {e}")
        return False
    
    try:
        from src.preprocess import get_version_info
        info = get_version_info()
        print("✅ preprocess.get_version_info() works")
        print(f"   Capabilities: {len(info.get('capabilities', {}))}")
    except Exception as e:
        print(f"❌ preprocess.get_version_info() failed: {e}")
        return False
    
    return True

def test_all_exports():
    """Test that __all__ exports work"""
    print("\n📦 Testing Module Exports")
    print("=" * 40)
    
    try:
        # Test kernel_instrumenter exports
        import src.kernel_instrumenter
        ki_exports = getattr(src.kernel_instrumenter, '__all__', [])
        print(f"✅ src.kernel_instrumenter has {len(ki_exports)} exports")
    except Exception as e:
        print(f"❌ src.kernel_instrumenter export test failed: {e}")
        return False
    
    try:
        # Test preprocess exports  
        import src.preprocess
        pp_exports = getattr(src.preprocess, '__all__', [])
        print(f"✅ src.preprocess has {len(pp_exports)} exports")
    except Exception as e:
        print(f"❌ src.preprocess export test failed: {e}")
        return False
    
    return True

def main():
    """Run all tests"""
    print("🚀 SpeedKillsAIA Module Validation")
    print("=" * 50)
    
    tests = [
        test_imports,
        test_main_classes,
        test_convenience_functions,
        test_all_exports
    ]
    
    passed = 0
    total = len(tests)
    
    for test in tests:
        if test():
            passed += 1
        else:
            print("❌ Test failed, stopping validation")
            break
    
    print("\n" + "=" * 50)
    print(f"📊 Test Results: {passed}/{total} tests passed")
    
    if passed == total:
        print("🎉 All modules are properly configured and working!")
        print("\nYou can now use:")
        print("  python -m src.kernel_instrumenter [options]")
        print("  python -m src.preprocess [options]")
        print("  python run_kernel_instrumenter.py [options]")
        print("  python run_tool.py [options]")
        return True
    else:
        print("❌ Some tests failed. Please check the module configuration.")
        return False

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
