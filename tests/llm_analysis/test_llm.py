#!/usr/bin/env python3
"""
Test suite for LLM Analysis module
"""

import pytest
import os
import json
import tempfile
from unittest.mock import patch, MagicMock
import sys

# Add src to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../src'))

from llm_analysis.llm import LLMAnalyzer, AVAILABLE_MODELS, call_llm, analyze_function_with_llm


class TestLLMAnalyzer:
    """Test cases for LLMAnalyzer class"""
    
    def setup_method(self):
        """Setup test environment"""
        self.analyzer = LLMAnalyzer()
        
    def test_initialization(self):
        """Test LLMAnalyzer initialization"""
        assert self.analyzer.model_id == "gpt-3.5-turbo"
        assert self.analyzer.system_prompt is not None
        
    def test_get_available_models(self):
        """Test getting available models"""
        models = self.analyzer.get_available_models()
        assert isinstance(models, list)
        assert len(models) > 0
        
        for model in models:
            assert 'id' in model
            assert 'name' in model
            assert 'description' in model
            assert 'max_tokens' in model
            
    def test_set_model_valid(self):
        """Test setting a valid model"""
        result = self.analyzer.set_model("gpt-4")
        assert result is True
        assert self.analyzer.model_id == "gpt-4"
        
    def test_set_model_invalid(self):
        """Test setting an invalid model"""
        result = self.analyzer.set_model("invalid-model")
        assert result is False
        assert self.analyzer.model_id == "gpt-3.5-turbo"  # Should remain unchanged
        
    @patch.dict(os.environ, {}, clear=True)
    def test_is_available_no_key(self):
        """Test availability check without API key"""
        analyzer = LLMAnalyzer()
        assert analyzer.is_available() is False
        
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key'})
    def test_is_available_with_key(self):
        """Test availability check with API key"""
        with patch('llm_analysis.llm.OpenAI'):
            analyzer = LLMAnalyzer()
            assert analyzer.is_available() is True
            
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key'})
    @patch('llm_analysis.llm.OpenAI')
    def test_analyze_function_success(self, mock_openai):
        """Test successful function analysis"""
        # Mock OpenAI response
        mock_response = MagicMock()
        mock_response.choices[0].message.content = "This function appears to be secure."
        mock_client = MagicMock()
        mock_client.chat.completions.create.return_value = mock_response
        mock_openai.return_value = mock_client
        
        analyzer = LLMAnalyzer()
        result = analyzer.analyze_function(
            function_name="test_function",
            source_code="int test_function() { return 0; }",
            file_path="/test/file.c"
        )
        
        assert result['status'] == 'success'
        assert 'analysis' in result
        assert result['function_name'] == 'test_function'
        assert result['file_path'] == '/test/file.c'
        
    def test_analyze_function_no_llm(self):
        """Test function analysis without LLM availability"""
        analyzer = LLMAnalyzer()
        result = analyzer.analyze_function(
            function_name="test_function",
            source_code="int test_function() { return 0; }"
        )
        
        assert result['status'] == 'unavailable'
        assert 'error' in result
        
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key'})
    @patch('llm_analysis.llm.OpenAI')
    def test_analyze_dma_operation_success(self, mock_openai):
        """Test successful DMA operation analysis"""
        # Mock OpenAI response
        mock_response = MagicMock()
        mock_response.choices[0].message.content = "DMA operation analysis complete."
        mock_client = MagicMock()
        mock_client.chat.completions.create.return_value = mock_response
        mock_openai.return_value = mock_client
        
        analyzer = LLMAnalyzer()
        dma_operation = {
            'dma_function': 'dma_alloc_coherent',
            'caller_function': 'driver_init',
            'file_path': '/driver/test.c',
            'line_number': 123
        }
        
        result = analyzer.analyze_dma_operation(
            dma_operation=dma_operation,
            function_code="void driver_init() { dma_alloc_coherent(...); }",
            call_graph=['driver_init', 'module_init']
        )
        
        assert result['status'] == 'success'
        assert 'analysis' in result
        assert result['dma_operation'] == dma_operation
        
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key'})
    @patch('llm_analysis.llm.OpenAI')
    def test_analyze_logs_success(self, mock_openai):
        """Test successful log analysis"""
        # Mock OpenAI response
        mock_response = MagicMock()
        mock_response.choices[0].message.content = "Log analysis shows normal operation."
        mock_client = MagicMock()
        mock_client.chat.completions.create.return_value = mock_response
        mock_openai.return_value = mock_client
        
        analyzer = LLMAnalyzer()
        logs = [
            {'function_name': 'test1', 'timestamp': '2023-01-01'},
            {'function_name': 'test2', 'timestamp': '2023-01-02'}
        ]
        
        result = analyzer.analyze_logs(
            logs=logs,
            analysis_type='security'
        )
        
        assert result['status'] == 'success'
        assert 'analysis' in result
        assert result['analysis_type'] == 'security'
        assert result['log_count'] == 2
        
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key'})
    @patch('llm_analysis.llm.OpenAI')
    def test_generate_security_report_success(self, mock_openai):
        """Test successful security report generation"""
        # Mock OpenAI response
        mock_response = MagicMock()
        mock_response.choices[0].message.content = "Security report generated successfully."
        mock_client = MagicMock()
        mock_client.chat.completions.create.return_value = mock_response
        mock_openai.return_value = mock_client
        
        analyzer = LLMAnalyzer()
        all_data = {
            'functions': [{'name': 'test_func'}],
            'dma': [{'function': 'dma_alloc'}],
            'ioctl': [],
            'user_copy': [],
            'devices': [],
            'memory': []
        }
        
        result = analyzer.generate_security_report(all_data)
        
        assert result['status'] == 'success'
        assert 'report' in result
        assert 'data_summary' in result
        
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key'})
    @patch('llm_analysis.llm.OpenAI')
    def test_openai_error_handling(self, mock_openai):
        """Test OpenAI API error handling"""
        # Mock OpenAI to raise an exception
        mock_client = MagicMock()
        mock_client.chat.completions.create.side_effect = Exception("API Error")
        mock_openai.return_value = mock_client
        
        analyzer = LLMAnalyzer()
        result = analyzer.analyze_function(
            function_name="test_function",
            source_code="int test_function() { return 0; }"
        )
        
        assert result['status'] == 'error'
        assert 'Function analysis failed' in result['error']


class TestLegacyFunctions:
    """Test cases for legacy function interface"""
    
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key'})
    @patch('llm_analysis.llm.OpenAI')
    def test_call_llm_success(self, mock_openai):
        """Test legacy call_llm function"""
        # Mock OpenAI response
        mock_response = MagicMock()
        mock_response.choices[0].message.content = "Analysis complete."
        mock_client = MagicMock()
        mock_client.chat.completions.create.return_value = mock_response
        mock_openai.return_value = mock_client
        
        result = call_llm("Test prompt")
        assert result == "Analysis complete."
        
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key'})
    @patch('llm_analysis.llm.OpenAI')
    def test_call_llm_error(self, mock_openai):
        """Test legacy call_llm function with error"""
        # Mock OpenAI to raise an exception
        mock_openai.side_effect = Exception("API Error")
        
        result = call_llm("Test prompt")
        assert "Error calling LLM" in result
        
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key'})
    @patch('llm_analysis.llm.call_llm')
    def test_analyze_function_with_llm(self, mock_call_llm):
        """Test legacy analyze_function_with_llm function"""
        mock_call_llm.return_value = "Function analysis complete."
        
        result = analyze_function_with_llm(
            function_name="test_func",
            source_code="int test_func() { return 0; }",
            context="Test context"
        )
        
        assert result == "Function analysis complete."
        mock_call_llm.assert_called_once()


class TestDataPersistence:
    """Test cases for data persistence functionality"""
    
    def test_analysis_data_structure(self):
        """Test analysis data structure consistency"""
        analyzer = LLMAnalyzer()
        
        # Test function analysis result structure
        result = analyzer.analyze_function("test", "code", custom_prompt="test")
        assert 'status' in result
        
        if result['status'] == 'success':
            assert 'analysis' in result
            assert 'function_name' in result
            assert 'model_used' in result
            assert 'custom_prompt' in result
        else:
            assert 'error' in result
            
    def test_model_configuration(self):
        """Test model configuration consistency"""
        for model in AVAILABLE_MODELS:
            analyzer = LLMAnalyzer(model_id=model['id'])
            assert analyzer.model_id == model['id']
            
    def test_custom_prompt_handling(self):
        """Test custom prompt handling"""
        analyzer = LLMAnalyzer()
        
        # Test with custom prompt
        result = analyzer.analyze_function(
            "test", "code", custom_prompt="Check for vulnerabilities"
        )
        
        if result['status'] == 'success':
            assert result['custom_prompt'] == "Check for vulnerabilities"
        elif result['status'] == 'unavailable':
            # Expected when no API key
            pass
        else:
            # Error case
            assert 'error' in result


class TestIntegration:
    """Integration tests for LLM analysis"""
    
    def test_model_list_consistency(self):
        """Test that model list is consistent"""
        analyzer = LLMAnalyzer()
        models = analyzer.get_available_models()
        
        # Check that all models in the list are valid options
        for model in models:
            assert analyzer.set_model(model['id']) is True
            
    def test_analysis_flow(self):
        """Test complete analysis flow"""
        analyzer = LLMAnalyzer()
        
        # Test model selection
        assert analyzer.set_model("gpt-4") is True
        
        # Test function analysis (will fail without API key, but structure should be correct)
        result = analyzer.analyze_function(
            function_name="vulnerable_function",
            source_code="""
            int vulnerable_function(char *input) {
                char buffer[100];
                strcpy(buffer, input);  // Potential buffer overflow
                return strlen(buffer);
            }
            """,
            custom_prompt="Look for buffer overflow vulnerabilities"
        )
        
        # Should have proper structure regardless of success/failure
        assert isinstance(result, dict)
        assert 'status' in result
        
    def test_data_validation(self):
        """Test input data validation"""
        analyzer = LLMAnalyzer()
        
        # Test empty function name
        result = analyzer.analyze_function("", "code")
        # Should still process (empty name is valid input)
        assert isinstance(result, dict)
        
        # Test empty source code
        result = analyzer.analyze_function("func", "")
        # Should still process (empty code is valid input)
        assert isinstance(result, dict)


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
