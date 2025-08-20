#!/usr/bin/env python3
"""
Tests for max_tool_calls functionality in OpenAI client
"""

import pytest
import json
from unittest.mock import Mock, patch, call
from src.llm_analysis.openai_client import OpenAIClient
from src.llm_analysis.models import GPTModel, AnalysisResult
from src.llm_analysis.tools import ToolCallResult


class TestMaxToolCalls:
    """Test the max_tool_calls parameter and multiple tool calling rounds"""
    
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-api-key'})
    def test_max_tool_calls_parameter_initialization(self):
        """Test that max_tool_calls parameter is properly initialized"""
        # Default value
        client = OpenAIClient()
        assert client.max_tool_calls == 5
        
        # Custom value
        client = OpenAIClient(max_tool_calls=10)
        assert client.max_tool_calls == 10
        
        # Zero value
        client = OpenAIClient(max_tool_calls=0)
        assert client.max_tool_calls == 0
        
        # Negative value (should still work, though not practical)
        client = OpenAIClient(max_tool_calls=-1)
        assert client.max_tool_calls == -1

    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_single_tool_call_round(self, mock_openai_class):
        """Test that single tool call works correctly"""
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        # Mock tool call in first response
        mock_tool_call = Mock()
        mock_tool_call.id = "call_123"
        mock_tool_call.function.name = "analyze_struct_definition"
        mock_tool_call.function.arguments = json.dumps({"struct_name": "test_struct"})
        
        # First response with tool call
        mock_first_response = Mock()
        mock_first_response.choices = [Mock()]
        mock_first_response.choices[0].message.content = "I need to analyze the struct."
        mock_first_response.choices[0].message.tool_calls = [mock_tool_call]
        
        # Second response without tool calls (final)
        mock_final_response = Mock()
        mock_final_response.choices = [Mock()]
        mock_final_response.choices[0].message.content = """
Function/Code_Block_Name: test_function
AIARelevantFunction: 90
Relevant_KD_Entry_Point: 20
Message_Structure_Handling: 30
Message_Structures identified: [test_struct]
SMIDs identified: [size_field]
Reasoning:
  - Found struct usage requiring analysis
"""
        mock_final_response.choices[0].message.tool_calls = None
        
        # Set up the mock to return different responses for each call
        mock_client.chat.completions.create.side_effect = [mock_first_response, mock_final_response]
        
        client = OpenAIClient(enable_tools=True, max_tool_calls=5, verbose=True)
        
        result = client.analyze_function(
            function_code="void test_function() { struct test_struct s; }",
            function_name="test_function",
            preprocessed_file_path="/test/file.i"
        )
        
        # Verify the result
        assert isinstance(result, AnalysisResult)
        assert result.function_name == "test_function"
        assert result.aia_relevant_function == 90
        
        # Verify that exactly 2 API calls were made (initial + 1 follow-up)
        assert mock_client.chat.completions.create.call_count == 2

    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_multiple_tool_call_rounds(self, mock_openai_class):
        """Test multiple rounds of tool calls"""
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        # Round 1: Tool call
        mock_tool_call_1 = Mock()
        mock_tool_call_1.id = "call_123"
        mock_tool_call_1.function.name = "analyze_struct_definition"
        mock_tool_call_1.function.arguments = json.dumps({"struct_name": "struct_a"})
        
        mock_response_1 = Mock()
        mock_response_1.choices = [Mock()]
        mock_response_1.choices[0].message.content = "I need to analyze struct_a."
        mock_response_1.choices[0].message.tool_calls = [mock_tool_call_1]
        
        # Round 2: Another tool call
        mock_tool_call_2 = Mock()
        mock_tool_call_2.id = "call_456"
        mock_tool_call_2.function.name = "analyze_struct_definition"
        mock_tool_call_2.function.arguments = json.dumps({"struct_name": "struct_b"})
        
        mock_response_2 = Mock()
        mock_response_2.choices = [Mock()]
        mock_response_2.choices[0].message.content = "Now I need to analyze struct_b."
        mock_response_2.choices[0].message.tool_calls = [mock_tool_call_2]
        
        # Round 3: Final response without tool calls
        mock_final_response = Mock()
        mock_final_response.choices = [Mock()]
        mock_final_response.choices[0].message.content = """
Function/Code_Block_Name: test_function
AIARelevantFunction: 95
Relevant_KD_Entry_Point: 25
Message_Structure_Handling: 35
Message_Structures identified: [struct_a, struct_b]
SMIDs identified: [field_a, field_b]
Reasoning:
  - Analyzed multiple related structures
"""
        mock_final_response.choices[0].message.tool_calls = None
        
        mock_client.chat.completions.create.side_effect = [
            mock_response_1, mock_response_2, mock_final_response
        ]
        
        client = OpenAIClient(enable_tools=True, max_tool_calls=5, verbose=True)
        
        result = client.analyze_function(
            function_code="void test_function() { struct struct_a a; struct struct_b b; }",
            function_name="test_function",
            preprocessed_file_path="/test/file.i"
        )
        
        # Verify the result includes both structures
        assert isinstance(result, AnalysisResult)
        assert result.function_name == "test_function"
        assert result.aia_relevant_function == 95
        assert "struct_a" in str(result.message_structures_identified)
        assert "struct_b" in str(result.message_structures_identified)
        
        # Verify that exactly 3 API calls were made
        assert mock_client.chat.completions.create.call_count == 3

    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_max_tool_calls_limit_reached(self, mock_openai_class):
        """Test that tool calls stop when max limit is reached"""
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        # Create tool call that would continue indefinitely
        def create_tool_call_response(call_id):
            mock_tool_call = Mock()
            mock_tool_call.id = call_id
            mock_tool_call.function.name = "analyze_struct_definition"
            mock_tool_call.function.arguments = json.dumps({"struct_name": f"struct_{call_id}"})
            
            mock_response = Mock()
            mock_response.choices = [Mock()]
            mock_response.choices[0].message.content = f"I need to analyze struct_{call_id}."
            mock_response.choices[0].message.tool_calls = [mock_tool_call]
            return mock_response
        
        # Final forced response when limit is reached
        mock_final_response = Mock()
        mock_final_response.choices = [Mock()]
        mock_final_response.choices[0].message.content = """
Function/Code_Block_Name: test_function
AIARelevantFunction: 80
Relevant_KD_Entry_Point: 15
Message_Structure_Handling: 25
Message_Structures identified: [various_structs]
SMIDs identified: [various_fields]
Reasoning:
  - Reached maximum tool call limit
"""
        mock_final_response.choices[0].message.tool_calls = None
        
        # Set max_tool_calls to 2, so after 2 rounds it should force a final response
        max_calls = 2
        responses = [create_tool_call_response(f"call_{i}") for i in range(max_calls)]
        responses.append(mock_final_response)  # Forced final response
        
        mock_client.chat.completions.create.side_effect = responses
        
        client = OpenAIClient(enable_tools=True, max_tool_calls=max_calls, verbose=True)
        
        result = client.analyze_function(
            function_code="void test_function() { /* complex function */ }",
            function_name="test_function",
            preprocessed_file_path="/test/file.i"
        )
        
        # Verify the result
        assert isinstance(result, AnalysisResult)
        assert result.function_name == "test_function"
        
        # Verify that exactly max_calls + 1 API calls were made (max_calls + forced final)
        assert mock_client.chat.completions.create.call_count == max_calls + 1

    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_max_tool_calls_zero_disables_tools(self, mock_openai_class):
        """Test that max_tool_calls=0 effectively disables tool calls"""
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        # Response that would normally trigger tool calls, but with max_tool_calls=0
        mock_response = Mock()
        mock_response.choices = [Mock()]
        mock_response.choices[0].message.content = """
Function/Code_Block_Name: test_function
AIARelevantFunction: 50
Relevant_KD_Entry_Point: 10
Message_Structure_Handling: 15
Message_Structures identified: [None identified]
SMIDs identified: [None identified]
Reasoning:
  - No tool calls were made due to limit
"""
        mock_response.choices[0].message.tool_calls = None
        
        mock_client.chat.completions.create.return_value = mock_response
        
        client = OpenAIClient(enable_tools=True, max_tool_calls=0, verbose=True)
        
        result = client.analyze_function(
            function_code="void test_function() { struct complex_struct s; }",
            function_name="test_function",
            preprocessed_file_path="/test/file.i"
        )
        
        # Verify the result
        assert isinstance(result, AnalysisResult)
        assert result.function_name == "test_function"
        
        # Verify that only 1 API call was made (no tool calls due to limit=0)
        assert mock_client.chat.completions.create.call_count == 1

    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_tool_call_error_handling_in_multiple_rounds(self, mock_openai_class):
        """Test error handling during multiple tool call rounds"""
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        # Round 1: Successful tool call
        mock_tool_call_1 = Mock()
        mock_tool_call_1.id = "call_success"
        mock_tool_call_1.function.name = "analyze_struct_definition"
        mock_tool_call_1.function.arguments = json.dumps({"struct_name": "valid_struct"})
        
        mock_response_1 = Mock()
        mock_response_1.choices = [Mock()]
        mock_response_1.choices[0].message.content = "Analyzing valid struct."
        mock_response_1.choices[0].message.tool_calls = [mock_tool_call_1]
        
        # Round 2: Tool call with error (invalid JSON)
        mock_tool_call_2 = Mock()
        mock_tool_call_2.id = "call_error"
        mock_tool_call_2.function.name = "analyze_struct_definition"
        mock_tool_call_2.function.arguments = "invalid_json_here"  # Invalid JSON
        
        mock_response_2 = Mock()
        mock_response_2.choices = [Mock()]
        mock_response_2.choices[0].message.content = "Trying another struct."
        mock_response_2.choices[0].message.tool_calls = [mock_tool_call_2]
        
        # Round 3: Final response
        mock_final_response = Mock()
        mock_final_response.choices = [Mock()]
        mock_final_response.choices[0].message.content = """
Function/Code_Block_Name: test_function
AIARelevantFunction: 70
Relevant_KD_Entry_Point: 20
Message_Structure_Handling: 25
Message_Structures identified: [valid_struct]
SMIDs identified: [some_field]
Reasoning:
  - One successful analysis, one failed
"""
        mock_final_response.choices[0].message.tool_calls = None
        
        mock_client.chat.completions.create.side_effect = [
            mock_response_1, mock_response_2, mock_final_response
        ]
        
        client = OpenAIClient(enable_tools=True, max_tool_calls=5, verbose=True)
        
        result = client.analyze_function(
            function_code="void test_function() { struct valid_struct v; }",
            function_name="test_function",
            preprocessed_file_path="/test/file.i"
        )
        
        # Verify the result (should handle errors gracefully)
        assert isinstance(result, AnalysisResult)
        assert result.function_name == "test_function"
        assert result.aia_relevant_function == 70
        
        # Verify that 3 API calls were made despite the error
        assert mock_client.chat.completions.create.call_count == 3

    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_verbose_logging_for_multiple_rounds(self, mock_openai_class):
        """Test that verbose logging works correctly with multiple tool call rounds"""
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        # Create a simple 2-round scenario
        mock_tool_call = Mock()
        mock_tool_call.id = "call_123"
        mock_tool_call.function.name = "analyze_struct_definition"
        mock_tool_call.function.arguments = json.dumps({"struct_name": "test_struct"})
        
        mock_first_response = Mock()
        mock_first_response.choices = [Mock()]
        mock_first_response.choices[0].message.content = "Analyzing struct."
        mock_first_response.choices[0].message.tool_calls = [mock_tool_call]
        
        mock_final_response = Mock()
        mock_final_response.choices = [Mock()]
        mock_final_response.choices[0].message.content = """
Function/Code_Block_Name: test_function
AIARelevantFunction: 85
Relevant_KD_Entry_Point: 15
Message_Structure_Handling: 20
Message_Structures identified: [test_struct]
SMIDs identified: [field]
Reasoning:
  - Completed analysis
"""
        mock_final_response.choices[0].message.tool_calls = None
        
        mock_client.chat.completions.create.side_effect = [mock_first_response, mock_final_response]
        
        # Capture print output to verify verbose logging
        with patch('builtins.print') as mock_print:
            client = OpenAIClient(enable_tools=True, max_tool_calls=3, verbose=True)
            
            result = client.analyze_function(
                function_code="void test_function() { struct test_struct s; }",
                function_name="test_function",
                preprocessed_file_path="/test/file.i"
            )
            
            # Verify the result
            assert isinstance(result, AnalysisResult)
            
            # Check that verbose logging includes tool call round information
            verbose_calls = [call for call in mock_print.call_args_list if 'Tool call round' in str(call)]
            assert len(verbose_calls) > 0  # Should have at least one "Tool call round X/Y" message

    def test_analyze_function_parameter_passing(self):
        """Test that analyze_function properly uses the max_tool_calls setting"""
        with patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'}):
            # Test with different max_tool_calls values
            client1 = OpenAIClient(max_tool_calls=1)
            client2 = OpenAIClient(max_tool_calls=10)
            
            assert client1.max_tool_calls == 1
            assert client2.max_tool_calls == 10
            
            # The actual tool calling behavior is tested in the integration tests above
