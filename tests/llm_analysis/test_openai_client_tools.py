#!/usr/bin/env python3
"""
Tests for enhanced OpenAI client with function calling support
"""

import pytest
import json
from unittest.mock import Mock, patch
from src.llm_analysis.openai_client import OpenAIClient
from src.llm_analysis.models import GPTModel, AnalysisResult
from src.llm_analysis.tools import ToolCallResult


class TestOpenAIClientWithTools:
    """Test OpenAI client with function calling capabilities"""
    
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-api-key'})
    def test_init_with_tools_enabled(self):
        """Test initialization with tools enabled"""
        client = OpenAIClient(enable_tools=True)
        assert client.enable_tools == True
        assert client.tool_manager is not None
    
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-api-key'})
    def test_init_with_tools_disabled(self):
        """Test initialization with tools disabled"""
        client = OpenAIClient(enable_tools=False)
        assert client.enable_tools == False
        assert client.tool_manager is None
    
    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_analyze_function_without_tool_calls(self, mock_openai_class):
        """Test function analysis without tool calls"""
        # Mock the OpenAI client
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        # Mock response without tool calls
        mock_response = Mock()
        mock_response.choices = [Mock()]
        mock_response.choices[0].message.content = """
Function/Code_Block_Name: test_function
AIARelevantFunction: 85
Relevant_KD_Entry_Point: 50
Message_Structure_Handling: 30
SMIDs identified: [test_smid]
Reasoning:
  - This is a test function
"""
        mock_response.choices[0].message.tool_calls = None
        mock_client.chat.completions.create.return_value = mock_response
        
        # Test analysis
        client = OpenAIClient(enable_tools=True, verbose=True)
        result = client.analyze_function(
            function_code="void test_function() { }",
            function_name="test_function",
            preprocessed_file_path="/test/file.i"
        )
        
        # Verify request included tools
        call_args = mock_client.chat.completions.create.call_args
        assert 'tools' in call_args.kwargs
        assert 'tool_choice' in call_args.kwargs
        assert call_args.kwargs['tool_choice'] == 'auto'
        
        # Verify result
        assert result.function_name == "test_function"
        assert result.aia_relevant_function == 85
    
    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_analyze_function_with_tool_calls(self, mock_openai_class):
        """Test function analysis with tool calls"""
        # Mock the OpenAI client
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        # Mock tool call in first response
        mock_tool_call = Mock()
        mock_tool_call.id = "call_123"
        mock_tool_call.function.name = "analyze_struct_definition"
        mock_tool_call.function.arguments = json.dumps({
            "struct_name": "test_struct"
        })
        
        # First response with tool call
        mock_first_response = Mock()
        mock_first_response.choices = [Mock()]
        mock_first_response.choices[0].message.content = "I need to analyze the struct."
        mock_first_response.choices[0].message.tool_calls = [mock_tool_call]
        
        # Second response after tool execution
        mock_final_response = Mock()
        mock_final_response.choices = [Mock()]
        mock_final_response.choices[0].message.content = """
Function/Code_Block_Name: test_function
AIARelevantFunction: 90
Relevant_KD_Entry_Point: 60
Message_Structure_Handling: 80
Message_Structures identified: [test_struct]
SMIDs identified: [struct_smid]
Reasoning:
  - Function uses test_struct which contains SMID fields
  - Enhanced analysis with struct definition
"""
        mock_final_response.choices[0].message.tool_calls = None
        
        # Configure mock to return different responses
        mock_client.chat.completions.create.side_effect = [mock_first_response, mock_final_response]
        
        # Test analysis with mocked tool manager
        client = OpenAIClient(enable_tools=True, verbose=True)
        
        # Mock the tool manager
        mock_tool_result = ToolCallResult(
            success=True,
            output="struct test_struct { int smid; };"  # Return string instead of dict
        )
        client.tool_manager.call_tool = Mock(return_value=mock_tool_result)
        
        result = client.analyze_function(
            function_code="void test_function() { struct test_struct s; }",
            function_name="test_function", 
            preprocessed_file_path="/test/file.i"
        )
        
        # Verify tool was called
        client.tool_manager.call_tool.assert_called_once_with(
            "analyze_struct_definition",
            {"struct_name": "test_struct"}
        )
        
        # Verify two API calls were made
        assert mock_client.chat.completions.create.call_count == 2
        
        # Verify final result
        assert result.function_name == "test_function"
        assert result.aia_relevant_function == 90
    
    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_analyze_function_with_tool_error(self, mock_openai_class):
        """Test function analysis when tool execution fails"""
        # Mock the OpenAI client
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        # Mock tool call in first response
        mock_tool_call = Mock()
        mock_tool_call.id = "call_123"
        mock_tool_call.function.name = "analyze_struct_definition"
        mock_tool_call.function.arguments = json.dumps({
            "struct_name": "test_struct"
        })
        
        # First response with tool call
        mock_first_response = Mock()
        mock_first_response.choices = [Mock()]
        mock_first_response.choices[0].message.content = "I need to analyze the struct."
        mock_first_response.choices[0].message.tool_calls = [mock_tool_call]
        
        # Second response after tool execution
        mock_final_response = Mock()
        mock_final_response.choices = [Mock()]
        mock_final_response.choices[0].message.content = """
Function/Code_Block_Name: test_function
AIARelevantFunction: 70
Relevant_KD_Entry_Point: 40
Message_Structure_Handling: 30
Message_Structures identified: []
SMIDs identified: []
Reasoning:
  - Could not analyze struct definition due to tool error
  - Analysis based on available code only
"""
        mock_final_response.choices[0].message.tool_calls = None
        
        # Configure mock to return different responses
        mock_client.chat.completions.create.side_effect = [mock_first_response, mock_final_response]
        
        # Test analysis with mocked tool manager that returns error
        client = OpenAIClient(enable_tools=True, verbose=True)
        
        # Mock the tool manager to return error
        mock_tool_result = ToolCallResult(
            success=False,
            output=None,
            error_message="File not found: /nonexistent/file.i"
        )
        client.tool_manager.call_tool = Mock(return_value=mock_tool_result)
        
        result = client.analyze_function(
            function_code="void test_function() { struct test_struct s; }",
            function_name="test_function",
            preprocessed_file_path="/nonexistent/file.i"
        )
        
        # Verify tool was called and error was handled
        client.tool_manager.call_tool.assert_called_once()
        
        # Verify result still returned
        assert result.function_name == "test_function"
        assert result.aia_relevant_function == 70
    
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-api-key'})
    def test_system_prompt_with_tools(self):
        """Test system prompt includes tool information when tools are enabled"""
        client = OpenAIClient(enable_tools=True)
        system_prompt = client._get_system_prompt()
        
        assert "You have access to tools" in system_prompt
        assert "analyze_struct_definition" in system_prompt
        assert "struct/union/enum/typedef types" in system_prompt
    
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-api-key'})
    def test_system_prompt_without_tools(self):
        """Test system prompt when tools are disabled"""
        client = OpenAIClient(enable_tools=False)
        system_prompt = client._get_system_prompt()
        
        assert "You have access to tools" not in system_prompt
        assert system_prompt.startswith("You are an expert Linux Kernel Driver developer specializing in AI Accelerator integration.")
        assert "analyze_struct_definition" not in system_prompt
    
    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_analyze_function_without_tools(self, mock_openai_class):
        """Test function analysis with tools disabled"""
        # Mock the OpenAI client
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        # Mock response
        mock_response = Mock()
        mock_response.choices = [Mock()]
        mock_response.choices[0].message.content = """
Function/Code_Block_Name: test_function
AIARelevantFunction: 75
"""
        mock_response.choices[0].message.tool_calls = None
        mock_client.chat.completions.create.return_value = mock_response
        
        # Test analysis with tools disabled
        client = OpenAIClient(enable_tools=False)
        result = client.analyze_function(
            function_code="void test_function() { }",
            function_name="test_function"
        )
        
        # Verify request did not include tools
        call_args = mock_client.chat.completions.create.call_args
        assert 'tools' not in call_args.kwargs
        assert 'tool_choice' not in call_args.kwargs
