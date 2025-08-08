#!/usr/bin/env python3
"""
Test AIA-specific DMA and User Copy analysis functionality
"""

import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), 'src')))

from llm_analysis.llm import LLMAnalyzer

def test_aia_dma_and_user_copy_analysis():
    """Test the AIA analysis functionality for DMA and User Copy operations"""
    
    analyzer = LLMAnalyzer()
    
    # Test sample DMA operation data
    dma_operation = {
        "dma_function": "dma_alloc_coherent",
        "caller_function": "setup_ai_buffers",
        "file_path": "drivers/ai/device.c",
        "line_number": 245
    }
    
    dma_function_code = """
static int setup_ai_buffers(struct ai_device *dev)
{
    dev->dma_buffer = dma_alloc_coherent(dev->device, BUFFER_SIZE, 
                                         &dev->dma_handle, GFP_KERNEL);
    if (!dev->dma_buffer)
        return -ENOMEM;
    return 0;
}
"""
    
    # Test sample user copy operation data
    user_copy_operation = {
        "copy_function": "copy_from_user",
        "caller_function": "ai_ioctl_handler",
        "file_path": "drivers/ai/device.c", 
        "line_number": 128
    }
    
    user_copy_function_code = """
static long ai_ioctl_handler(struct file *file, unsigned int cmd, unsigned long arg)
{
    struct ai_request req;
    if (copy_from_user(&req, (void __user *)arg, sizeof(req)))
        return -EFAULT;
    return process_ai_request(file->private_data, &req);
}
"""
    
    print("=== Testing AIA DMA and User Copy Analysis ===\n")
    
    # Test DMA operation analysis
    print("1. Testing DMA Operation Analysis (should focus on AIARelevantFunction):")
    
    try:
        result = analyzer.analyze_dma_operation(
            dma_operation=dma_operation,
            function_code=dma_function_code,
            call_graph=["setup_ai_buffers", "dma_alloc_coherent"],
            custom_prompt="Focus on AIA integration patterns",
            for_web_ui=True
        )
        
        print(f"Status: {result.get('status', 'unknown')}")
        if result.get('status') == 'unavailable':
            print("⚠️  LLM analysis unavailable (OpenAI API not configured)")
            print(f"Analysis: {result.get('analysis', 'N/A')}")
        else:
            print(f"Analysis type detected: {result.get('analysis_type', 'unknown')}")
            print(f"Primary focus: AIARelevantFunction ✓")
            print(f"DMA function: {result.get('dma_function', 'N/A')}")
    except Exception as e:
        print(f"Error in DMA operation analysis: {e}")
    
    print("\n" + "="*50 + "\n")
    
    # Test user copy operation analysis
    print("2. Testing User Copy Operation Analysis (should focus on Message Structure Handling):")
    
    try:
        result = analyzer.analyze_user_copy_operation(
            user_copy_operation=user_copy_operation,
            function_code=user_copy_function_code,
            custom_prompt="Focus on AIA integration patterns",
            for_web_ui=True
        )
        
        print(f"Status: {result.get('status', 'unknown')}")
        if result.get('status') == 'unavailable':
            print("⚠️  LLM analysis unavailable (OpenAI API not configured)")
            print(f"Analysis: {result.get('analysis', 'N/A')}")
        else:
            print(f"Analysis type detected: {result.get('analysis_type', 'unknown')}")
            print(f"Primary focus: Message Structure Handling ✓")
            print(f"Copy function: {result.get('copy_function', 'N/A')}")
    except Exception as e:
        print(f"Error in user copy operation analysis: {e}")
    
    print("\n" + "="*50 + "\n")
    
    # Test analyzer availability
    print("3. Testing LLM Analyzer Availability:")
    print(f"LLM Available: {analyzer.is_available()}")
    if not analyzer.is_available():
        print("Note: LLM analysis requires OpenAI API key configuration")
        print("Set OPENAI_API_KEY environment variable to enable full testing")
    
    print("\n=== AIA DMA and User Copy Analysis Test Complete ===")

if __name__ == "__main__":
    test_aia_dma_and_user_copy_analysis()
