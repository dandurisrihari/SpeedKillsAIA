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

from llm_analysis.tools import StructAnalyzerTool


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
        self.assertIn("file_path", definition["function"]["parameters"]["properties"])
        self.assertIn("struct_name", definition["function"]["parameters"]["properties"])
    
    def test_struct_analyzer_tool_execution(self):
        """Test StructAnalyzerTool execution with C format"""
        tool = StructAnalyzerTool(verbose=True)  # Enable verbose for debugging
        
        # Test with valid struct
        result = tool.call({
            "file_path": self.temp_file.name,
            "struct_name": "gcsHAL_INTERFACE"
        })
        
        print(f"Tool result success: {result.success}")
        print(f"Tool result output preview: {result.output[:200] if result.output else 'None'}...")
        print(f"Tool result error: {result.error_message}")
        
        self.assertTrue(result.success)
        if result.output:
            self.assertIsInstance(result.output, str)
            # Check for C header format indicators
            self.assertIn("/*", result.output)  # Should have C comments
            self.assertIn("typedef", result.output)  # Should have typedef declarations
            # Just check it has some content
            self.assertTrue(len(result.output) > 0)
        
        # Test listing structures with our temp file
        list_result = tool.call({
            "file_path": self.temp_file.name,
            "list_structures": True,
            "max_results": 10
        })
        
        print(f"List result success: {list_result.success}")
        print(f"List result output: {list_result.output}")
        
        self.assertTrue(list_result.success)
        if list_result.output:
            self.assertIn("gcsHAL_INTERFACE", list_result.output)
    
    def test_struct_analyzer_tool_invalid_file(self):
        """Test StructAnalyzerTool with invalid file"""
        tool = StructAnalyzerTool()
        
        result = tool.call({
            "file_path": "/nonexistent/file.i",
            "struct_name": "SomeStruct"
        })
        
        self.assertFalse(result.success)
        self.assertIsNotNone(result.error_message)
        self.assertIn("File not found", result.error_message)
    
    def test_struct_analyzer_tool_invalid_struct(self):
        """Test StructAnalyzerTool with invalid struct name"""
        tool = StructAnalyzerTool()
        
        result = tool.call({
            "file_path": self.temp_file.name,
            "struct_name": "NonExistentStruct"
        })
        
        # Tool should still succeed but return no results
        self.assertTrue(result.success)
        self.assertIsInstance(result.output, str)


if __name__ == '__main__':
    unittest.main()
