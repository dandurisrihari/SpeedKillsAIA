#!/usr/bin/env python3
"""
Test OpenAI client functionality - Fixed version
"""

import pytest
from unittest.mock import Mock, patch
from src.llm_analysis.openai_client import OpenAIClient
from src.llm_analysis.models import GPTModel, AnalysisResult


class TestOpenAIClient:
    """Test OpenAI client functionality"""
    
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-api-key'})
    def test_init_with_default_model(self):
        """Test initialization with default model"""
        client = OpenAIClient()
        assert client.api_key == "test-api-key"
        assert client.model == "gpt-3.5-turbo"
    
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'custom-key'})
    def test_init_with_custom_parameters(self):
        """Test initialization with custom parameters"""
        client = OpenAIClient(
            model=GPTModel.GPT_4_TURBO.value,
            verbose=True
        )
        assert client.api_key == "custom-key"
        assert client.model == GPTModel.GPT_4_TURBO.value
        assert client.verbose == True
    
    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_analyze_function_success(self, mock_openai_class):
        """Test successful function analysis"""
        # Mock the OpenAI client and response
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
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
        mock_client.chat.completions.create.return_value = mock_response
        
        client = OpenAIClient()
        result = client.analyze_function("test function code")
        
        assert result.function_name == "test_function"
        assert result.aia_relevant_function == 85
    
    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_analyze_function_api_error(self, mock_openai_class):
        """Test API error handling"""
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        # Mock API error
        mock_client.chat.completions.create.side_effect = Exception("API Error")
        
        client = OpenAIClient()
        result = client.analyze_function("test function")
        
        assert result.function_name == "API Error"
        assert result.aia_relevant_function == 0
    
    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_analyze_function_empty_response(self, mock_openai_class):
        """Test handling of empty response"""
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        mock_response = Mock()
        mock_response.choices = []
        mock_client.chat.completions.create.return_value = mock_response
        
        client = OpenAIClient()
        result = client.analyze_function("test function")
        
        assert result.function_name == "API Error"
        assert result.aia_relevant_function == 0
    
    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_analyze_function_different_models(self, mock_openai_class):
        """Test function analysis with different models"""
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        mock_response = Mock()
        mock_response.choices = [Mock()]
        mock_response.choices[0].message.content = """
Function/Code_Block_Name: test_function
AIARelevantFunction: 75
Relevant_KD_Entry_Point: 60
Message_Structure_Handling: 40
SMIDs identified: []
Reasoning:
  - Model test response
"""
        mock_client.chat.completions.create.return_value = mock_response
        
        # Test with GPT-3.5
        client = OpenAIClient(model=GPTModel.GPT_3_5_TURBO.value)
        result = client.analyze_function("void test() {}")
        
        # Verify the model was used
        call_args = mock_client.chat.completions.create.call_args
        assert call_args[1]['model'] == GPTModel.GPT_3_5_TURBO.value
        assert result.function_name == "test_function"
        assert result.aia_relevant_function == 75
    
    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_message_structure(self, mock_openai_class):
        """Test the structure of messages sent to OpenAI"""
        mock_client = Mock()
        mock_openai_class.return_value = mock_client
        
        mock_response = Mock()
        mock_response.choices = [Mock()]
        mock_response.choices[0].message.content = """
Function/Code_Block_Name: test_function
AIARelevantFunction: 50
Relevant_KD_Entry_Point: 50
Message_Structure_Handling: 50
SMIDs identified: []
Reasoning:
  - Test response
"""
        mock_client.chat.completions.create.return_value = mock_response
        
        client = OpenAIClient()
        client.analyze_function("void test() {}")
        
        call_args = mock_client.chat.completions.create.call_args
        messages = call_args[1]['messages']
        
        # Should have system and user messages
        assert len(messages) == 2
        assert messages[0]['role'] == 'system'
        assert messages[1]['role'] == 'user'
        assert "void test() {}" in messages[1]['content']
