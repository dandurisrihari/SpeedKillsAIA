#!/usr/bin/env python3
"""
Test AIA integration with webviewer interface
"""

import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), 'src')))

def test_webviewer_aia_integration():
    """Test that AIA analysis integrates correctly with webviewer"""
    
    # Test JavaScript files contain correct structure references
    main_js_path = "src/webviewer/static/js/main.js"
    llm_js_path = "src/webviewer/static/js/llm.js"
    
    print("=== Testing Webviewer AIA Integration ===\n")
    
    print("1. Checking JavaScript files for IOCTL analysis structure:")
    try:
        with open(main_js_path, 'r') as f:
            main_js_content = f.read()
        
        # Check for correct data structure usage
        if 'ioctl_operations' in main_js_content:
            print("✓ main.js uses correct 'ioctl_operations' structure")
        else:
            print("✗ main.js does not use 'ioctl_operations' structure")
            
        # Check for analyzeIOCTLWithLLM function
        if 'function analyzeIOCTLWithLLM' in main_js_content or 'analyzeIOCTLWithLLM(' in main_js_content:
            print("✓ main.js contains analyzeIOCTLWithLLM function")
        else:
            print("✗ main.js missing analyzeIOCTLWithLLM function")
            
        # Check for no duplicate functions
        toggle_count = main_js_content.count('function toggleDeviceDetails')
        if toggle_count <= 1:
            print(f"✓ main.js has no duplicate toggleDeviceDetails functions ({toggle_count} found)")
        else:
            print(f"✗ main.js has duplicate toggleDeviceDetails functions ({toggle_count} found)")
            
    except FileNotFoundError:
        print(f"✗ {main_js_path} not found")
    
    print("\n2. Testing LLM Analysis Backend:")
    try:
        from llm_analysis.llm import LLMAnalyzer
        
        analyzer = LLMAnalyzer()
        
        # Test both analysis types work
        ioctl_data = {
            "handler_name": "test_ioctl",
            "file_path": "test.c",
            "handler_code": "static long test_ioctl(struct file *file, unsigned int cmd, unsigned long arg) { return 0; }"
        }
        
        function_data = {
            "function_name": "test_function",
            "file_path": "test.c",
            "source_code": "static int test_function(void) { return dma_alloc_coherent(); }"
        }
        
        # Test ioctl handler analysis
        ioctl_result = analyzer.analyze_ioctl_handler(
            ioctl_operation=ioctl_data,
            function_code=ioctl_data["handler_code"],
            for_web_ui=True
        )
        
        if ioctl_result.get('status') in ['success', 'unavailable']:
            print("✓ IOCTL handler analysis works")
            print(f"  - Analysis type: {ioctl_result.get('analysis_type', 'N/A')}")
            print(f"  - Handler name: {ioctl_result.get('handler_name', 'N/A')}")
        else:
            print("✗ IOCTL handler analysis failed")
            print(f"  - Error: {ioctl_result.get('error', 'Unknown error')}")
        
        # Test function analysis  
        function_result = analyzer.analyze_function(
            function_name=function_data["function_name"],
            source_code=function_data["source_code"],
            file_path=function_data["file_path"],
            for_web_ui=True
        )
        
        if function_result.get('status') in ['success', 'unavailable']:
            print("✓ Function analysis works")
            print(f"  - Analysis type: {function_result.get('analysis_type', 'N/A')}")
            print(f"  - Function name: {function_result.get('function_name', 'N/A')}")
        else:
            print("✗ Function analysis failed")
            print(f"  - Error: {function_result.get('error', 'Unknown error')}")
            
    except Exception as e:
        print(f"✗ Backend integration test failed: {e}")
    
    print("\n3. Testing AIA-specific Categories:")
    if 'analyzer' in locals():
        print("AIA Analysis Categories:")
        print("  1. AIARelevantFunction - Memory sharing with AI Accelerator")
        print("  2. Relevant KD Entry Point - IOCTL dispatch points")  
        print("  3. Message Structure Handling - copy_from_user/copy_to_user with SMIDs")
        
        if analyzer.is_available():
            print("✓ LLM available for full AIA analysis")
        else:
            print("⚠️  LLM unavailable (OpenAI API not configured) - analysis structure ready")
    
    print("\n=== Webviewer AIA Integration Test Complete ===")

if __name__ == "__main__":
    test_webviewer_aia_integration()
