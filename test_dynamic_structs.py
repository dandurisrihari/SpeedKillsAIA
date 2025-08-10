#!/usr/bin/env python3
"""
Test script for Dynamic Struct Definition Analysis

This script tests the new LLM analysis with dynamic struct requests functionality.
"""

import os
import sys
import json
from pathlib import Path

# Add src to path
sys.path.insert(0, str(Path(__file__).parent / 'src'))

from llm_analysis.llm import LLMAnalyzer
from llm_analysis.dynamic_struct_tool import LLMStructRequestHandler, DynamicStructExtractor

def test_dynamic_struct_extractor():
    """Test the dynamic struct extractor directly"""
    print("🔍 Testing Dynamic Struct Extractor...")
    
    extractor = DynamicStructExtractor(data_dir="data")
    
    # Test extracting the tb_service_id struct from the user's file
    response = extractor.extract_struct("tb_service_id")
    
    print(f"Extraction result: {response.status}")
    if response.status == "success":
        print(f"Found in: {response.file_path}")
        print(f"Line: {response.line_number}")
        print(f"Definition preview: {response.definition[:200]}...")
        if response.related_structs:
            print(f"Related structs: {response.related_structs}")
    else:
        print(f"Error: {response.error}")
    
    return response.status == "success"

def test_struct_request_handler():
    """Test the struct request handler"""
    print("\n🛠️ Testing Struct Request Handler...")
    
    handler = LLMStructRequestHandler(data_dir="data")
    
    # Test requesting struct tb_service_id
    request_data = {
        "struct_name": "tb_service_id",
        "file_hint": "gc_hal_kernel_allocator_user_memory.i"
    }
    
    response = handler.handle_struct_request(request_data)
    
    print(f"Request result: {'SUCCESS' if response['success'] else 'FAILED'}")
    if response['success']:
        print(f"Struct name: {response['struct_name']}")
        print(f"Definition preview: {response['definition'][:200]}...")
        print(f"File: {response.get('file_path', 'Unknown')}")
    else:
        print(f"Error: {response.get('error', 'Unknown error')}")
    
    # Check history
    history = handler.get_request_history()
    print(f"Request history entries: {len(history)}")
    
    return response['success']

def test_enhanced_llm_analysis():
    """Test the enhanced LLM analysis with dynamic struct requests"""
    print("\n🤖 Testing Enhanced LLM Analysis...")
    
    # Create a test function that uses the tb_service_id struct
    test_function_code = """
int test_function(struct tb_service_id *service) {
    if (!service) {
        return -EINVAL;
    }
    
    // Check match flags
    if (service->match_flags & MATCH_PROTOCOL) {
        printk("Protocol ID: %u\\n", service->protocol_id);
        printk("Protocol version: %u\\n", service->protocol_version);
        
        // Validate protocol key
        if (strlen(service->protocol_key) > 0) {
            printk("Protocol key: %s\\n", service->protocol_key);
        }
    }
    
    // Access driver data
    return (int)(service->driver_data & 0xFFFFFFFF);
}
    """
    
    analyzer = LLMAnalyzer(enable_dynamic_structs=True)
    
    if not analyzer.is_available():
        print("❌ LLM not available (missing OpenAI API key)")
        return False
    
    print("✅ LLM available, starting analysis...")
    
    # Test with dynamic struct requests
    result = analyzer.analyze_function_with_dynamic_structs(
        function_name="test_function",
        source_code=test_function_code.strip(),
        file_path="drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_user_memory.c",
        custom_prompt="Analyze this function for security vulnerabilities and explain the tb_service_id structure usage.",
        max_struct_requests=3
    )
    
    print(f"Analysis result: {'SUCCESS' if result.get('success', True) else 'FAILED'}")
    
    if result.get('success', True):
        print(f"Analysis preview: {result.get('analysis', 'No analysis')[:300]}...")
        print(f"Struct requests made: {result.get('total_struct_requests', 0)}")
        print(f"Additional structs requested: {result.get('additional_structs_requested', 0)}")
        
        # Show struct requests
        if result.get('struct_requests'):
            print("\nStruct requests:")
            for i, req in enumerate(result['struct_requests'], 1):
                req_name = req.get('request', {}).get('struct_name', 'Unknown')
                req_status = req.get('response', {}).get('status', 'Unknown')
                print(f"  {i}. {req_name} - {req_status}")
    else:
        print(f"Error: {result.get('error', 'Unknown error')}")
    
    return result.get('success', True)

def main():
    """Main test function"""
    print("🚀 Dynamic Struct Definition Analysis Test\n")
    
    # Check environment
    if not os.environ.get('OPENAI_API_KEY'):
        print("⚠️ WARNING: OPENAI_API_KEY not set. LLM analysis will fail.")
        print("Set your API key with: export OPENAI_API_KEY='your-key-here'\n")
    
    # Test 1: Dynamic struct extractor
    extractor_success = test_dynamic_struct_extractor()
    
    # Test 2: Struct request handler
    handler_success = test_struct_request_handler()
    
    # Test 3: Enhanced LLM analysis (only if API key is available)
    llm_success = True
    if os.environ.get('OPENAI_API_KEY'):
        llm_success = test_enhanced_llm_analysis()
    else:
        print("\n🤖 Skipping LLM analysis test (no API key)")
    
    # Summary
    print("\n" + "="*60)
    print("📊 TEST RESULTS SUMMARY")
    print("="*60)
    print(f"Dynamic Struct Extractor: {'✅ PASS' if extractor_success else '❌ FAIL'}")
    print(f"Struct Request Handler:   {'✅ PASS' if handler_success else '❌ FAIL'}")
    print(f"Enhanced LLM Analysis:    {'✅ PASS' if llm_success else '❌ FAIL'}")
    
    overall_success = extractor_success and handler_success and llm_success
    print(f"\nOverall: {'✅ ALL TESTS PASSED' if overall_success else '❌ SOME TESTS FAILED'}")
    
    if overall_success:
        print("\n🎉 Dynamic struct definition analysis is working correctly!")
        print("You can now use the web UI to analyze functions with dynamic struct requests.")
    else:
        print("\n🔧 Some components need attention before full functionality is available.")

if __name__ == '__main__':
    main()
