#!/usr/bin/env python3
"""
Demonstration of LLM analysis with struct analyzer tool calling
"""

import os
import sys
import json

# Add the src directory to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from llm_analysis.tools import StructAnalyzerTool
from llm_analysis.processors import process_function_with_llm
from llm_analysis.openai_client import OpenAIClient


def demo_tool_calling():
    """Demonstrate the tool calling functionality"""
    
    print("=== LLM Analysis Tool Calling Demo ===\n")
    
    # 1. Demonstrate direct tool usage
    print("1. Direct tool usage:")
    tool = StructAnalyzerTool(verbose=False)
    
    # Analyze a structure
    result = tool.call({
        "file_path": "data/structanalyzerpreprocessedfiles/dma-buf-phys.i",
        "struct_name": "dma_buf_phys_data",
        "depth": 3
    })
    
    if result.success:
        print("✓ Successfully generated C header for dma_buf_phys_data")
        print(f"Generated header preview:\n{result.output[:300]}...\n")
    else:
        print(f"✗ Tool failed: {result.error_message}\n")
    
    # 2. Demonstrate function data format for LLM analysis
    print("2. Function data format for LLM analysis:")
    function_data = {
        'function_name': 'process_dma_buffer',
        'function_code': """
int process_dma_buffer(struct dma_buf_phys_data *buf_data) {
    if (!buf_data) {
        return -1;
    }
    
    // Access the physical address
    unsigned long long phys_addr = buf_data->phys;
    unsigned int fd = buf_data->fd;
    
    // Process the buffer
    if (fd > 0 && phys_addr != 0) {
        return map_physical_memory(phys_addr, fd);
    }
    
    return 0;
}
""",
        'preprocessed_file_path': 'data/structanalyzerpreprocessedfiles/dma-buf-phys.i'
    }
    
    print("Function data structure:")
    print(json.dumps({
        'function_name': function_data['function_name'],
        'preprocessed_file_path': function_data['preprocessed_file_path'],
        'function_code_preview': function_data['function_code'][:100] + "..."
    }, indent=2))
    
    print("\n3. Tool definition that LLM can use:")
    tool_def = tool.get_tool_definition()
    print(json.dumps(tool_def, indent=2))
    
    print("\n4. Available commands that LLM can make:")
    print("   - analyze_struct_definition: Analyze specific structures")
    print("   - list_structures: List all structures in a file")
    print("   - The tool always generates C header format for easy integration")
    
    # 5. Show how the tool would be called by LLM
    print("\n5. Example tool calls that LLM would make:")
    
    # List structures first
    list_result = tool.call({
        "file_path": "data/structanalyzerpreprocessedfiles/dma-buf-phys.i",
        "list_structures": True,
        "max_results": 5
    })
    
    if list_result.success:
        print("✓ LLM could first list available structures:")
        print(list_result.output[:200] + "..." if len(list_result.output) > 200 else list_result.output)
    
    # Analyze specific structure
    print("\n✓ Then LLM could analyze the specific structure it needs:")
    if result.success:
        print("Generated complete C header with typedefs and structure definitions")
        
        # Count lines in the output
        lines = result.output.count('\n')
        print(f"Generated header contains {lines} lines of C code")
        
        # Show structure
        if "struct dma_buf_phys_data" in result.output:
            print("✓ Contains the requested struct definition")
        if "typedef" in result.output:
            print("✓ Contains necessary typedef definitions")
    
    print("\n=== Tool calling is now ready for LLM integration! ===")


if __name__ == '__main__':
    # Check if required files exist
    test_file = "data/structanalyzerpreprocessedfiles/dma-buf-phys.i"
    if not os.path.exists(test_file):
        print(f"Warning: Test file {test_file} not found. Some demos may not work.")
    
    demo_tool_calling()
