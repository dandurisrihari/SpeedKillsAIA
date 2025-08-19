#!/usr/bin/env python3
"""
Tests for LLM analysis tool calling functionality
"""

import json
import os
import sys
import tempfile
import unittest
from unittest.mock import Mock, patch, MagicMock

# Add the src directory to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from llm_analysis.openai_client import OpenAIClient
from llm_analysis.tools import StructAnalyzerTool
from llm_analysis.processors import process_function_with_llm, FunctionProcessor
from llm_analysis.models import FunctionEntry


class TestToolCalling(unittest.TestCase):
    """Test tool calling functionality"""
    
    def setUp(self):
        """Set up test environment"""
        self.mock_openai_client = Mock()
        self.test_file_path = "/tmp/test_file.i"
        
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
        self.assertEqual(tool.name, "analyze_struct")
        self.assertIn("type", tool.schema)
        self.assertEqual(tool.schema["type"], "function")
    
    def test_struct_analyzer_tool_execution(self):
        """Test StructAnalyzerTool execution"""
        tool = StructAnalyzerTool()
        
        # Test with valid struct
        result = tool.execute(
            file_path=self.temp_file.name,
            struct_name="gcsHAL_INTERFACE"
        )
        
        self.assertIsInstance(result, str)
        self.assertIn("gcsHAL_INTERFACE", result)
    
    def test_openai_client_with_tools(self):
        """Test OpenAIClient with tools enabled"""
        with patch('llm_analysis.openai_client.OpenAI') as mock_openai:
            # Mock response without tool calls
            mock_response = Mock()
            mock_response.choices = [Mock()]
            mock_response.choices[0].message.content = "Analysis result"
            mock_response.choices[0].message.tool_calls = None
            
            mock_openai.return_value.chat.completions.create.return_value = mock_response
            
            client = OpenAIClient(api_key="test_key", enable_tools=True)
            
            result = client.analyze_function(
                function_code="void test() { }",
                function_name="test",
                preprocessed_file_path=self.temp_file.name,
                enable_tools=True
            )
            
            self.assertEqual(result, "Analysis result")
    
    def test_openai_client_with_tool_calls(self):
        """Test OpenAIClient handling tool calls"""
        with patch('llm_analysis.openai_client.OpenAI') as mock_openai:
            # Mock tool call response
            mock_tool_call = Mock()
            mock_tool_call.id = "call_123"
            mock_tool_call.function.name = "analyze_struct"
            mock_tool_call.function.arguments = json.dumps({
                "file_path": self.temp_file.name,
                "struct_name": "gcsHAL_INTERFACE"
            })
            
            # First response with tool call
            mock_response1 = Mock()
            mock_response1.choices = [Mock()]
            mock_response1.choices[0].message.content = None
            mock_response1.choices[0].message.tool_calls = [mock_tool_call]
            
            # Second response after tool execution
            mock_response2 = Mock()
            mock_response2.choices = [Mock()]
            mock_response2.choices[0].message.content = "Final analysis with struct info"
            mock_response2.choices[0].message.tool_calls = None
            
            # Configure mock to return different responses
            mock_openai.return_value.chat.completions.create.side_effect = [
                mock_response1, mock_response2
            ]
            
            client = OpenAIClient(api_key="test_key", enable_tools=True)
            
            result = client.analyze_function(
                function_code="void test() { gcsHAL_INTERFACE* ptr; }",
                function_name="test",
                preprocessed_file_path=self.temp_file.name,
                enable_tools=True
            )
            
            self.assertEqual(result, "Final analysis with struct info")
            self.assertEqual(mock_openai.return_value.chat.completions.create.call_count, 2)
    
    def test_process_function_with_llm_tools_enabled(self):
        """Test process_function_with_llm with tools enabled"""
        with patch('llm_analysis.openai_client.OpenAI') as mock_openai:
            mock_response = Mock()
            mock_response.choices = [Mock()]
            mock_response.choices[0].message.content = "Analysis with tools"
            mock_response.choices[0].message.tool_calls = None
            
            mock_openai.return_value.chat.completions.create.return_value = mock_response
            
            client = OpenAIClient(api_key="test_key", enable_tools=True)
            
            function_data = {
                'function_name': 'test_function',
                'function_code': 'void test() { gcsHAL_INTERFACE* ptr; }',
                'preprocessed_file_path': self.temp_file.name
            }
            
            result = process_function_with_llm(
                function_data=function_data,
                client=client,
                enable_tools=True
            )
            
            self.assertEqual(result['function_name'], 'test_function')
            self.assertEqual(result['analysis'], 'Analysis with tools')
            self.assertTrue(result['tools_enabled'])
    
    def test_function_processor_with_tools(self):
        """Test FunctionProcessor with tools enabled"""
        with patch('llm_analysis.openai_client.OpenAI') as mock_openai:
            mock_response = Mock()
            mock_response.choices = [Mock()]
            mock_response.choices[0].message.content = "Function analysis"
            mock_response.choices[0].message.tool_calls = None
            
            mock_openai.return_value.chat.completions.create.return_value = mock_response
            
            client = OpenAIClient(api_key="test_key", enable_tools=True)
            processor = FunctionProcessor(client, verbose=False, enable_tools=True)
            
            # Create mock function entry
            func_entry = Mock(spec=FunctionEntry)
            func_entry.file_path = "test.c"
            func_entry.function_name = "test_func"
            func_entry.get_code.return_value = "void test_func() { }"
            func_entry.preprocessed_file_path = self.temp_file.name
            
            results = processor.process([func_entry])
            
            self.assertEqual(len(results), 1)
            self.assertEqual(results[0].function_name, "test.c:test_func")
            self.assertEqual(results[0].analysis, "Function analysis")


if __name__ == '__main__':
    unittest.main()
