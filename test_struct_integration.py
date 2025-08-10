#!/usr/bin/env python3
"""
Test script for struct context integration
"""

import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

def test_struct_context():
    """Test struct context provider"""
    try:
        from src.llm_analysis.struct_context import StructContextProvider
        
        provider = StructContextProvider()
        print("✅ StructContextProvider initialized successfully")
        
        # Test with a sample function
        structs = provider.get_relevant_structs_for_function(
            function_name="drv_ioctl",
            file_path="drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c",
            function_code="int drv_ioctl(struct file *file, unsigned int cmd, unsigned long arg)"
        )
        
        print(f"✅ Found {len(structs)} relevant structs")
        
        if structs:
            formatted = provider.format_structs_for_llm(structs[:3])  # Show first 3
            print("✅ Formatted structs for LLM:")
            print(formatted[:500] + "..." if len(formatted) > 500 else formatted)
            
            summary = provider.get_structs_summary(structs[:3])
            print("✅ Struct summary:", summary)
        
        return True
        
    except Exception as e:
        print(f"❌ Error testing struct context: {e}")
        return False

def test_llm_analyzer():
    """Test LLM analyzer with struct context"""
    try:
        from src.llm_analysis.llm import LLMAnalyzer
        
        analyzer = LLMAnalyzer(data_dir="data")
        print("✅ LLMAnalyzer initialized successfully")
        
        # Test a sample function analysis (won't actually call LLM without API key)
        result = analyzer.analyze_function(
            function_name="test_function",
            source_code="int test_function(struct file *file) { return 0; }",
            file_path="drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_driver.c",
            custom_prompt="Test analysis",
            for_web_ui=True
        )
        
        print(f"✅ Analysis result keys: {list(result.keys())}")
        if 'struct_context' in result:
            print(f"✅ Struct context included: {result['struct_context']}")
        
        return True
        
    except Exception as e:
        print(f"❌ Error testing LLM analyzer: {e}")
        return False

if __name__ == "__main__":
    print("🧪 Testing Struct Context Integration")
    print("=" * 50)
    
    success = True
    success &= test_struct_context()
    print()
    success &= test_llm_analyzer()
    
    print("\n" + "=" * 50)
    if success:
        print("🎉 All tests passed! Struct context integration is working.")
    else:
        print("⚠️  Some tests failed. Check the output above for details.")
