#!/usr/bin/env python3
"""
Integration test for LLM analysis with tool calling functionality
"""

import os
import sys
import unittest
from unittest.mock import Mock, patch

from src.llm_analysis.models import AnalysisResult

# Add the src directory to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

from src.llm_analysis.tools import StructAnalyzerTool, ToolManager
from src.llm_analysis.openai_client import OpenAIClient
from src.llm_analysis.processors import process_function_with_llm


class TestToolIntegration(unittest.TestCase):
    """Test full integration of tool calling with LLM analysis"""
    
    def test_struct_analyzer_with_real_file(self):
        """Test StructAnalyzerTool with a real preprocessed file"""
        tool = StructAnalyzerTool(verbose=True)
        
        # Use the real dma-buf-phys file that should exist
        preprocessed_file = "data/structanalyzerpreprocessedfiles/dma-buf-phys.i"
        
        if not os.path.exists(preprocessed_file):
            self.skipTest(f"Preprocessed file not found: {preprocessed_file}")
        
        # Test analyzing a specific structure
        result = tool.call({
            "file_path": preprocessed_file,
            "struct_name": "dma_buf_phys_data",
            "depth": 3
        })
        
        print(f"Real file analysis - Success: {result.success}")
        if result.success:
            print(f"Generated C header (first 500 chars):\n{result.output[:500]}")
            
            # Verify it's a proper C header
            self.assertIn("#ifndef", result.output)
            self.assertIn("#define", result.output)
            self.assertIn("typedef", result.output)
            self.assertIn("dma_buf_phys_data", result.output)
        else:
            print(f"Error: {result.error_message}")
        
        self.assertTrue(result.success)
    
    def test_tool_manager(self):
        """Test ToolManager functionality"""
        manager = ToolManager(verbose=True)
        
        # Check tool registration
        self.assertTrue(manager.has_tool("analyze_struct_definition"))
        
        # Get tool definitions
        definitions = manager.get_tool_definitions()
        self.assertEqual(len(definitions), 1)
        self.assertEqual(definitions[0]["function"]["name"], "analyze_struct_definition")
        
        # Test tool calling through manager
        preprocessed_file = "data/structanalyzerpreprocessedfiles/dma-buf-phys.i"
        
        if os.path.exists(preprocessed_file):
            # Set the preprocessed file path
            manager.set_preprocessed_file_path(preprocessed_file)
            
            result = manager.call_tool("analyze_struct_definition", {
                "struct_name": "dma_buf_phys_data"
            })
            
            self.assertTrue(result.success)
            self.assertIn("dma_buf_phys_data", result.output)
    
    @patch('openai.OpenAI')
    def test_openai_client_with_tools(self, mock_openai):
        """Test OpenAI client with tool calling enabled"""
        # Mock the OpenAI response with tool calls
        mock_response = Mock()
        mock_response.choices = [Mock()]
        mock_response.choices[0].message = Mock()
        mock_response.choices[0].message.content = "I need to analyze the struct definition."
        mock_response.choices[0].message.tool_calls = [Mock()]
        mock_response.choices[0].message.tool_calls[0].id = "call_123"
        mock_response.choices[0].message.tool_calls[0].function = Mock()
        mock_response.choices[0].message.tool_calls[0].function.name = "analyze_struct_definition"
        mock_response.choices[0].message.tool_calls[0].function.arguments = '{"file_path": "test.i", "struct_name": "test_struct"}'
        
        # Mock the follow-up response after tool call
        mock_followup_response = Mock()
        mock_followup_response.choices = [Mock()]
        mock_followup_response.choices[0].message = Mock()
        mock_followup_response.choices[0].message.content = "Based on the struct analysis, this is a complex data structure."
        mock_followup_response.choices[0].message.tool_calls = None
        
        mock_openai.return_value.chat.completions.create.side_effect = [mock_response, mock_followup_response]
        
        client = OpenAIClient()
        
        # Test function analysis with tools enabled
        function_code = """
        int process_dma_data(struct dma_buf_phys_data *data) {
            return data->size;
        }
        """
        
        result = client.analyze_function(
            function_code=function_code,
            function_name="process_dma_data",
            preprocessed_file_path="data/structanalyzerpreprocessedfiles/dma-buf-phys.i",
            enable_tools=True
        )
        
        # Verify that the client attempted to make tool calls
        self.assertIsInstance(result, AnalysisResult)
        self.assertEqual(result.function_name, "process_dma_data")
        
        # Verify OpenAI was called with tools
        calls = mock_openai.return_value.chat.completions.create.call_args_list
        self.assertGreater(len(calls), 0)
        
        # Check that tools were passed in the first call
        first_call_kwargs = calls[0][1]
        self.assertIn('tools', first_call_kwargs)
        self.assertGreater(len(first_call_kwargs['tools']), 0)
        self.assertEqual(first_call_kwargs['tools'][0]['function']['name'], 'analyze_struct_definition')
    
    @patch('openai.OpenAI')
    def test_processor_with_tools(self, mock_openai):
        """Test processor with tool calling functionality"""
        # Mock simple response without tool calls
        mock_response = Mock()
        mock_response.choices = [Mock()]
        mock_response.choices[0].message = Mock()
        mock_response.choices[0].message.content = "This function processes DMA buffer data."
        mock_response.choices[0].message.tool_calls = None
        
        mock_openai.return_value.chat.completions.create.return_value = mock_response
        
        client = OpenAIClient()
        
        # Test function data with preprocessed file path
        function_data = {
            'function_name': 'process_dma_data',
            'function_code': 'int process_dma_data(struct dma_buf_phys_data *data) { return data->size; }',
            'preprocessed_file_path': 'data/structanalyzerpreprocessedfiles/dma-buf-phys.i'
        }
        
        result = process_function_with_llm(
            function_data=function_data,
            client=client,
            enable_tools=True
        )
        
        # Verify the result structure
        self.assertIn('function_name', result)
        self.assertIn('analysis', result)
        self.assertIn('preprocessed_file_path', result)
        self.assertEqual(result['function_name'], 'process_dma_data')
        self.assertEqual(result['preprocessed_file_path'], 'data/structanalyzerpreprocessedfiles/dma-buf-phys.i')


if __name__ == '__main__':
    unittest.main()
