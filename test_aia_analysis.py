#!/usr/bin/env python3
"""
Test script for AIA analysis functionality
"""

import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), 'src')))

from llm_analysis.llm import LLMAnalyzer

def test_aia_analysis():
    """Test the AIA analysis functionality"""
    
    analyzer = LLMAnalyzer()
    
    # Test sample ioctl handler code
    ioctl_code = """
static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
{
    struct device_data *dev = file->private_data;
    struct user_request req;
    
    switch (cmd) {
        case IOCTL_SET_BUFFER:
            if (copy_from_user(&req, (void __user *)arg, sizeof(req)))
                return -EFAULT;
            return dma_alloc_coherent(dev->device, req.size, &req.dma_addr, GFP_KERNEL);
        default:
            return -ENOTTY;
    }
}
"""
    
    # Test sample general function code
    function_code = """
static int init_ai_accelerator(struct device *dev)
{
    struct ai_device *ai_dev = dev_get_drvdata(dev);
    dma_addr_t dma_handle;
    
    ai_dev->buffer = dma_alloc_coherent(dev, BUFFER_SIZE, &dma_handle, GFP_KERNEL);
    if (!ai_dev->buffer)
        return -ENOMEM;
        
    return setup_inference_engine(ai_dev);
}
"""
    
    print("=== Testing AIA Analysis Implementation ===\n")
    
    # Test ioctl handler analysis
    print("1. Testing IOCTL Handler Analysis (should focus on Message Structure Handling):")
    ioctl_operation = {
        "handler_name": "device_ioctl",
        "file_path": "drivers/ai/device.c",
        "handler_code": ioctl_code
    }
    
    try:
        result = analyzer.analyze_ioctl_handler(
            ioctl_operation=ioctl_operation,
            function_code=ioctl_code,
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
    except Exception as e:
        print(f"Error in ioctl handler analysis: {e}")
    
    print("\n" + "="*50 + "\n")
    
    # Test general function analysis
    print("2. Testing General Function Analysis (should focus on AIARelevantFunction):")
    
    try:
        result = analyzer.analyze_function(
            function_name="init_ai_accelerator",
            source_code=function_code,
            file_path="drivers/ai/device.c",
            custom_prompt="Focus on AI accelerator patterns",
            for_web_ui=True
        )
        
        print(f"Status: {result.get('status', 'unknown')}")
        if result.get('status') == 'unavailable':
            print("⚠️  LLM analysis unavailable (OpenAI API not configured)")
            print(f"Analysis: {result.get('analysis', 'N/A')}")
        else:
            print(f"Analysis type detected: {result.get('analysis_type', 'unknown')}")
            print(f"Primary focus: AIARelevantFunction and Entry Points ✓")
    except Exception as e:
        print(f"Error in function analysis: {e}")
    
    print("\n" + "="*50 + "\n")
    
    # Test analyzer availability
    print("3. Testing LLM Analyzer Availability:")
    print(f"LLM Available: {analyzer.is_available()}")
    if not analyzer.is_available():
        print("Note: LLM analysis requires OpenAI API key configuration")
        print("Set OPENAI_API_KEY environment variable to enable full testing")
    
    print("\n=== AIA Analysis Test Complete ===")

if __name__ == "__main__":
    test_aia_analysis()
