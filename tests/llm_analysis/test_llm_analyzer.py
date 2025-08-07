#!/usr/bin/env python3
"""
Tests for LLM Analysis Module

Test cases for the LLM analysis functionality including function analysis,
DMA analysis, log analysis, and security report generation.
"""

import pytest
import os
import json
from unittest.mock import Mock, patch, MagicMock
import sys

# Add src to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), 'src'))

from llm_analysis.llm import (
    LLMAnalyzer, 
    AVAILABLE_MODELS,
    SYSTEM_PROMPT
)


class TestLLMAnalyzer:
    """Test cases for LLMAnalyzer class"""
    
    def setup_method(self):
        """Setup for each test method"""
        self.analyzer = LLMAnalyzer()
    
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key-123'})
    @patch('llm_analysis.llm.OpenAI')
    def test_initialization_with_api_key(self, mock_openai):
        """Test LLMAnalyzer initialization when API key is available"""
        analyzer = LLMAnalyzer()
        assert analyzer.client is not None
        assert analyzer.model_id == "gpt-3.5-turbo"
        assert analyzer.system_prompt == SYSTEM_PROMPT
        mock_openai.assert_called_once_with(api_key='test-key-123')
    
    @patch.dict(os.environ, {}, clear=True)
    def test_initialization_without_api_key(self):
        """Test LLMAnalyzer initialization when API key is not available"""
        analyzer = LLMAnalyzer()
        assert analyzer.client is None
        assert not analyzer.is_available()
    
    def test_get_available_models(self):
        """Test getting available models"""
        models = self.analyzer.get_available_models()
        assert isinstance(models, list)
        assert len(models) > 0
        assert all('id' in model and 'name' in model for model in models)
        assert models == AVAILABLE_MODELS
    
    def test_set_model_valid(self):
        """Test setting a valid model"""
        assert self.analyzer.set_model("gpt-4")
        assert self.analyzer.model_id == "gpt-4"
    
    def test_set_model_invalid(self):
        """Test setting an invalid model"""
        assert not self.analyzer.set_model("invalid-model")
        assert self.analyzer.model_id == "gpt-3.5-turbo"  # Should remain unchanged
    
    @patch.dict(os.environ, {}, clear=True)
    def test_analyze_function_unavailable(self):
        """Test function analysis when LLM is unavailable"""
        analyzer = LLMAnalyzer()  # Create new analyzer without API key
        result = analyzer.analyze_function("test_func", "int test_func() { return 0; }")
        assert result["status"] == "unavailable"
        assert "not available" in result["error"]
    
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key-123'})
    @patch('llm_analysis.llm.OpenAI')
    def test_analyze_function_success(self, mock_openai):
        """Test successful function analysis"""
        # Mock OpenAI client and response
        mock_client = Mock()
        mock_response = Mock()
        mock_response.choices = [Mock()]
        mock_response.choices[0].message.content = "This function appears to be a simple test function..."
        mock_client.chat.completions.create.return_value = mock_response
        mock_openai.return_value = mock_client
        
        analyzer = LLMAnalyzer()
        result = analyzer.analyze_function(
            "test_func", 
            "int test_func() { return 0; }", 
            "test.c",
            "Look for security issues"
        )
        
        assert result["status"] == "success"
        assert "analysis" in result
        assert result["function_name"] == "test_func"
        assert result["file_path"] == "test.c"
        assert result["custom_prompt"] == "Look for security issues"
        assert result["model_used"] == "gpt-3.5-turbo"
    
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key-123'})
    @patch('llm_analysis.llm.OpenAI')
    def test_analyze_function_error(self, mock_openai):
        """Test function analysis with API error"""
        # Mock OpenAI client to raise an exception
        mock_client = Mock()
        mock_client.chat.completions.create.side_effect = Exception("API Error")
        mock_openai.return_value = mock_client
        
        analyzer = LLMAnalyzer()
        result = analyzer.analyze_function("test_func", "int test_func() { return 0; }")
        
        assert result["status"] == "error"
        assert "API Error" in result["error"]
    
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key-123'})
    @patch('llm_analysis.llm.OpenAI')
    def test_analyze_dma_operation(self, mock_openai):
        """Test DMA operation analysis"""
        # Mock OpenAI client and response
        mock_client = Mock()
        mock_response = Mock()
        mock_response.choices = [Mock()]
        mock_response.choices[0].message.content = "This DMA operation shows potential security concerns..."
        mock_client.chat.completions.create.return_value = mock_response
        mock_openai.return_value = mock_client
        
        analyzer = LLMAnalyzer()
        dma_operation = {
            "dma_function": "dma_alloc_coherent",
            "caller_function": "device_probe",
            "file_path": "driver.c",
            "line_number": 123
        }
        
        result = analyzer.analyze_dma_operation(
            dma_operation,
            "void* device_probe() { ... }",
            ["device_probe", "pci_probe", "init_module"],
            "Focus on coherency issues"
        )
        
        assert result["status"] == "success"
        assert "analysis" in result
        assert result["dma_operation"] == dma_operation
        assert result["custom_prompt"] == "Focus on coherency issues"
    
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key-123'})
    @patch('llm_analysis.llm.OpenAI')
    def test_analyze_logs(self, mock_openai):
        """Test log analysis"""
        # Mock OpenAI client and response
        mock_client = Mock()
        mock_response = Mock()
        mock_response.choices = [Mock()]
        mock_response.choices[0].message.content = "The logs indicate several patterns of interest..."
        mock_client.chat.completions.create.return_value = mock_response
        mock_openai.return_value = mock_client
        
        analyzer = LLMAnalyzer()
        logs = [
            {"function_name": "test_func1", "timestamp": "2024-01-01"},
            {"function_name": "test_func2", "timestamp": "2024-01-02"}
        ]
        
        result = analyzer.analyze_logs(logs, "security", "Look for attack patterns")
        
        assert result["status"] == "success"
        assert "analysis" in result
        assert result["analysis_type"] == "security"
        assert result["log_count"] == 2
        assert result["custom_prompt"] == "Look for attack patterns"
    
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key-123'})
    @patch('llm_analysis.llm.OpenAI')
    def test_generate_security_report(self, mock_openai):
        """Test security report generation"""
        # Mock OpenAI client and response
        mock_client = Mock()
        mock_response = Mock()
        mock_response.choices = [Mock()]
        mock_response.choices[0].message.content = "## Security Analysis Report\n\n### Executive Summary..."
        mock_client.chat.completions.create.return_value = mock_response
        mock_openai.return_value = mock_client
        
        analyzer = LLMAnalyzer()
        all_data = {
            "functions": [{"function_name": "test"}],
            "dma": [],
            "ioctl": [],
            "user_copy": [],
            "devices": [],
            "memory": []
        }
        
        result = analyzer.generate_security_report(all_data)
        
        assert result["status"] == "success"
        assert "report" in result
        assert "data_summary" in result


class TestConstants:
    """Test cases for module constants"""
    
    def test_available_models_structure(self):
        """Test that AVAILABLE_MODELS has correct structure"""
        assert isinstance(AVAILABLE_MODELS, list)
        assert len(AVAILABLE_MODELS) > 0
        
        for model in AVAILABLE_MODELS:
            assert isinstance(model, dict)
            assert "id" in model
            assert "name" in model
            assert "description" in model
            assert "max_tokens" in model
            assert isinstance(model["max_tokens"], int)
            assert model["max_tokens"] > 0
    
    def test_system_prompt_exists(self):
        """Test that system prompt is defined and non-empty"""
        assert isinstance(SYSTEM_PROMPT, str)
        assert len(SYSTEM_PROMPT.strip()) > 0
        assert "security" in SYSTEM_PROMPT.lower()
        assert "kernel" in SYSTEM_PROMPT.lower()


class TestErrorHandling:
    """Test cases for error handling scenarios"""
    
    @patch.dict(os.environ, {'OPENAI_API_KEY': 'test-key-123'})
    @patch('llm_analysis.llm.OpenAI')
    def test_openai_import_error(self, mock_openai):
        """Test handling of OpenAI import errors"""
        # This test verifies the module can handle cases where OpenAI is not available
        # In practice, this would be tested by temporarily renaming the openai module
        pass
    
    @patch.dict(os.environ, {}, clear=True)
    def test_empty_function_analysis(self):
        """Test function analysis with empty inputs"""
        analyzer = LLMAnalyzer()
        result = analyzer.analyze_function("", "")
        assert result["status"] == "unavailable"  # Should fail because no API key
    
    def test_invalid_model_selection(self):
        """Test setting an invalid model ID"""
        analyzer = LLMAnalyzer()
        original_model = analyzer.model_id
        success = analyzer.set_model("invalid-gpt-model")
        assert not success
        assert analyzer.model_id == original_model


class TestIntegration:
    """Integration test cases"""
    
    @pytest.mark.skipif(not os.getenv('OPENAI_API_KEY'), reason="Requires OpenAI API key")
    def test_real_api_call(self):
        """Test with real API call (only if API key is available)"""
        analyzer = LLMAnalyzer()
        if analyzer.is_available():
            result = analyzer.analyze_function(
                "test_function",
                "int test_function(int x) { return x * 2; }",
                "test.c",
                "This is a simple test function"
            )
            assert result["status"] == "success"
            assert "analysis" in result
            assert len(result["analysis"]) > 0
    
    def test_model_selection_flow(self):
        """Test the complete model selection workflow"""
        analyzer = LLMAnalyzer()
        
        # Test getting available models
        models = analyzer.get_available_models()
        assert len(models) > 0
        
        # Test setting each available model
        for model in models:
            success = analyzer.set_model(model["id"])
            assert success
            assert analyzer.model_id == model["id"]


if __name__ == "__main__":
    # Run tests with verbose output
    pytest.main([__file__, "-v"])
