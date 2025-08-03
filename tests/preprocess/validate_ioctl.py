#!/usr/bin/env python3
"""
Test import validation script - checks if all imports work correctly
"""

import sys
import os

# Add the src directory to the Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

def test_imports():
    """Test that all required modules can be imported"""
    
    print("Testing imports for IOCTL functionality...")
    
    try:
        # Test core modules
        from preprocess.core.models import IOCTLOperation, ParseResults
        from preprocess.core.patterns import LogPatterns
        from preprocess.core.engine import KernelLogParserEngine
        print("✅ Core modules imported successfully")
        
        # Test IOCTL parser
        from preprocess.parsers.ioctl_parser import IOCTLParser
        print("✅ IOCTL parser imported successfully")
        
        # Test function extractor
        from preprocess.utils.function_extractor import FunctionCodeExtractor
        print("✅ Function extractor imported successfully")
        
        # Test updated deduplication
        from preprocess.utils.deduplication import KernelLogDeduplicator
        print("✅ Deduplication utilities imported successfully")
        
        # Test CLI module
        from preprocess.cli import main
        from preprocess.tool import KernelLogParserTool
        print("✅ CLI modules imported successfully")
        
        # Test web UI
        from preprocess.web.ui import create_app
        print("✅ Web UI imported successfully")
        
        print("\n🎉 All imports successful! IOCTL functionality is ready.")
        return True
        
    except ImportError as e:
        print(f"❌ Import error: {e}")
        return False
    except Exception as e:
        print(f"❌ Unexpected error: {e}")
        return False


def test_basic_functionality():
    """Test basic functionality of key components"""
    
    print("\nTesting basic functionality...")
    
    try:
        # Test IOCTL pattern matching
        from preprocess.core.patterns import LogPatterns
        patterns = LogPatterns()
        
        test_line = "[47.468247] IOCTL_HANDLER: Function drv_ioctl called at drivers/gpu/driver.c:673"
        match = patterns.search_ioctl_handler(test_line)
        
        if match:
            print("✅ IOCTL pattern matching works")
            print(f"   Function: {match.group(1)}")
            print(f"   File: {match.group(2)}")
            print(f"   Line: {match.group(3)}")
        else:
            print("❌ IOCTL pattern matching failed")
            return False
        
        # Test IOCTL operation creation
        from preprocess.core.models import IOCTLOperation
        ioctl_op = IOCTLOperation(
            function_name="test_ioctl",
            file_path="test.c",
            line_number=100,
            first_seen_timestamp=50.0,
            function_code="int test_ioctl() { return 0; }"
        )
        
        if ioctl_op.function_name == "test_ioctl":
            print("✅ IOCTLOperation model works")
        else:
            print("❌ IOCTLOperation model failed")
            return False
        
        # Test IOCTL parser
        from preprocess.parsers.ioctl_parser import IOCTLParser
        parser = IOCTLParser(patterns)
        
        can_parse = parser.can_parse(test_line)
        if can_parse:
            print("✅ IOCTLParser can_parse works")
        else:
            print("❌ IOCTLParser can_parse failed")
            return False
        
        success, result = parser.parse(test_line, 47.468247)
        if success and result:
            print("✅ IOCTLParser parse works")
        else:
            print("❌ IOCTLParser parse failed")
            return False
        
        print("\n🎉 Basic functionality tests passed!")
        return True
        
    except Exception as e:
        print(f"❌ Functionality test error: {e}")
        return False


if __name__ == '__main__':
    print("IOCTL Functionality Validation")
    print("=" * 40)
    
    imports_ok = test_imports()
    
    if imports_ok:
        functionality_ok = test_basic_functionality()
        
        if functionality_ok:
            print("\n✅ All validation tests passed!")
            print("The IOCTL functionality is properly installed and working.")
            sys.exit(0)
        else:
            print("\n❌ Functionality tests failed!")
            sys.exit(1)
    else:
        print("\n❌ Import tests failed!")
        print("Please check that all required modules are properly installed.")
        sys.exit(1)
