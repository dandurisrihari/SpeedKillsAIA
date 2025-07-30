#!/usr/bin/env python3
"""
Test script to verify the modular structure without requiring tree-sitter
"""

import sys
import os

# Add the current directory to Python path
sys.path.insert(0, os.path.dirname(__file__))

def test_imports():
    """Test that all modules can be imported correctly"""
    print("Testing modular imports...")
    
    try:
        # Test individual module imports
        print("✓ Testing config module...")
        from config import DMAAPIConfig
        print(f"  - Found {len(DMAAPIConfig.DMA_APIS)} DMA APIs")
        
        print("✓ Testing __init__ module...")
        import __init__
        print(f"  - Package version: {__init__.__version__}")
        
        print("✓ All imports successful!")
        return True
        
    except ImportError as e:
        print(f"✗ Import error: {e}")
        return False
    except Exception as e:
        print(f"✗ Unexpected error: {e}")
        return False

def test_structure():
    """Test the directory structure"""
    print("\nTesting directory structure...")
    
    expected_files = [
        'config.py',
        'parser.py', 
        'analyzer.py',
        'instrumenter.py',
        'processor.py',
        'core.py',
        'cli.py',
        '__init__.py',
        'dma_instrument.py',
        'dma_api_Instrument.py',
        'README.md'
    ]
    
    missing_files = []
    for file in expected_files:
        if not os.path.exists(file):
            missing_files.append(file)
        else:
            print(f"✓ {file}")
    
    if missing_files:
        print(f"✗ Missing files: {missing_files}")
        return False
    else:
        print("✓ All expected files present!")
        return True

def main():
    """Run all tests"""
    print("=" * 60)
    print("DMA Instrumentation Tool - Modular Structure Test")
    print("=" * 60)
    
    structure_ok = test_structure()
    imports_ok = test_imports()
    
    print("\n" + "=" * 60)
    if structure_ok and imports_ok:
        print("✅ All tests passed! Modular structure is working correctly.")
        print("\nNext steps:")
        print("1. Install tree-sitter: pip install tree_sitter tree_sitter-c")
        print("2. Test with: python dma_instrument.py --help")
        return 0
    else:
        print("❌ Some tests failed. Please check the issues above.")
        return 1

if __name__ == "__main__":
    sys.exit(main())
