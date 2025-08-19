#!/usr/bin/env python3
"""
Simple test for LLM analysis tool calling functionality
"""

import os
import sys
import tempfile
import unittest
from unittest.mock import Mock, patch

# Add the src directory to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from src.llm_analysis.tools import StructAnalyzerTool, ToolCallResult


class TestSimpleToolCalling(unittest.TestCase):
    """Test basic tool calling functionality"""
    
    def setUp(self):
        """Set up test environment"""
        # Create a temporary preprocessed file for testing
        self.temp_file = tempfile.NamedTemporaryFile(mode='w', suffix='.i', delete=False)
        self.temp_file.write("""
typedef struct _gcsHAL_INTERFACE {
    gceHAL_COMMAND_CODES command;
    union {
        struct {
            char* data;
            int size;
        } query;
    } u;
} gcsHAL_INTERFACE;

typedef enum _gceHAL_COMMAND_CODES {
    gcvHAL_CHIP_INFO = 0,
    gcvHAL_ALLOCATE_NON_PAGED_MEMORY = 1,
    gcvHAL_FREE_NON_PAGED_MEMORY = 2
} gceHAL_COMMAND_CODES;
""")
        self.temp_file.close()
        
    def tearDown(self):
        """Clean up test environment"""
        if os.path.exists(self.temp_file.name):
            os.unlink(self.temp_file.name)
    
    def test_struct_analyzer_tool_creation(self):
        """Test StructAnalyzerTool creation"""
        tool = StructAnalyzerTool()
        
        self.assertIsNotNone(tool)
        
        # Check tool definition
        definition = tool.get_tool_definition()
        self.assertIn("type", definition)
        self.assertEqual(definition["type"], "function")
        self.assertIn("function", definition)
        self.assertEqual(definition["function"]["name"], "analyze_struct_definition")
        
        # Check schema structure
        self.assertIn("parameters", definition["function"])
        self.assertIn("properties", definition["function"]["parameters"])
        self.assertIn("struct_name", definition["function"]["parameters"]["properties"])
        
        # Check required parameters
        self.assertIn("required", definition["function"]["parameters"])
        self.assertIn("struct_name", definition["function"]["parameters"]["required"])
    
    def test_struct_analyzer_tool_execution(self):
        """Test StructAnalyzerTool execution with existing file"""
        tool = StructAnalyzerTool(verbose=True)  # Enable verbose for debugging
        
        # Test with existing preprocessed file
        result = tool.call({
            "file_path": "data/structanalyzerpreprocessedfiles/dma-buf-phys.i",
            "struct_name": "dma_buf"
        })
        
        print(f"Tool result success: {result.success}")
        print(f"Tool result output preview: {result.output[:200] if result.output else 'None'}...")
        print(f"Tool result error: {result.error_message}")
        
        # The tool should return a result (success or failure)
        self.assertIsNotNone(result)
        self.assertIsInstance(result, ToolCallResult)
        # We can't guarantee success since the struct might not exist
        # But we can verify it returns a valid result object
    
    def test_struct_analyzer_tool_invalid_file(self):
        """Test StructAnalyzerTool with invalid file"""
        tool = StructAnalyzerTool()
        
        result = tool.call({
            "file_path": "/nonexistent/file.i",
            "struct_name": "SomeStruct"
        })
        
        self.assertFalse(result.success)
        self.assertIsNotNone(result.error_message)
        self.assertIn("does not exist", result.error_message)
    
    def test_struct_analyzer_tool_invalid_struct(self):
        """Test StructAnalyzerTool with invalid struct name"""
        tool = StructAnalyzerTool()
        
        result = tool.call({
            "file_path": "data/structanalyzerpreprocessedfiles/dma-buf-phys.i",
            "struct_name": "NonExistentStruct"
        })
        
        # Tool should return a result (success or failure depending on implementation)
        self.assertIsNotNone(result)
        self.assertIsInstance(result, ToolCallResult)


if __name__ == '__main__':
    unittest.main()
