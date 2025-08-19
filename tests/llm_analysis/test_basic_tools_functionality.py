#!/usr/bin/env python3
"""
Basic functionality test for struct analyzer tool integration
"""

import tempfile
import json
from pathlib import Path
from src.llm_analysis.tools import StructAnalyzerTool, ToolManager


def test_struct_analyzer_tool_basic():
    """Basic test of struct analyzer tool functionality"""
    print("Testing StructAnalyzerTool basic functionality...")
    
    # Create a simple test file
    test_c_content = """
typedef struct _test_struct {
    int field1;
    char *field2;
    unsigned long smid;
} test_struct;

typedef enum _test_enum {
    VALUE1 = 0,
    VALUE2 = 1
} test_enum;
"""
    
    with tempfile.NamedTemporaryFile(mode='w', suffix='.i', delete=False) as temp_file:
        temp_file.write(test_c_content)
        temp_path = temp_file.name
    
    try:
        # Test tool definition
        tool = StructAnalyzerTool(verbose=True)
        definition = tool.get_tool_definition()
        
        print(f"✓ Tool definition created: {definition['function']['name']}")
        
        # Test invalid file path
        result = tool.call({"file_path": "/nonexistent/file.i"})
        assert not result.success
        print(f"✓ Invalid file path handled: {result.error_message}")
        
        # Test missing struct name
        result = tool.call({"file_path": temp_path, "list_structures": False})
        assert not result.success
        print(f"✓ Missing struct name handled: {result.error_message}")
        
        print("✓ Basic StructAnalyzerTool tests passed")
        
    finally:
        Path(temp_path).unlink(missing_ok=True)


def test_tool_manager_basic():
    """Basic test of tool manager functionality"""
    print("Testing ToolManager basic functionality...")
    
    manager = ToolManager(verbose=True)
    
    # Test tool registration
    assert manager.has_tool("analyze_struct_definition")
    print("✓ Tool registration verified")
    
    # Test tool definitions
    definitions = manager.get_tool_definitions()
    assert len(definitions) == 1
    assert definitions[0]["function"]["name"] == "analyze_struct_definition"
    print("✓ Tool definitions retrieved")
    
    # Test unknown tool
    result = manager.call_tool("unknown_tool", {})
    assert not result.success
    assert "Unknown tool" in result.error_message
    print("✓ Unknown tool handling verified")
    
    print("✓ Basic ToolManager tests passed")


if __name__ == "__main__":
    test_struct_analyzer_tool_basic()
    test_tool_manager_basic()
    print("\n✓ All basic functionality tests passed!")
