#!/usr/bin/env python3
"""
Integration tests for the LLM analysis module
"""

import pytest
import json
import tempfile
import os
from unittest.mock import Mock, patch, MagicMock
from src.llm_analysis.json_analyzer import JSONAnalyzer
from src.llm_analysis.models import GPTModel, AnalysisResult


class TestJSONAnalyzerIntegration:
    """Integration tests for JSONAnalyzer"""
    
    @pytest.fixture
    def sample_json_data(self):
        """Sample JSON data for testing"""
        return {
            "metadata": {
                "parser_version": "2.0.0",
                "parsed_at": "2025-08-17T10:00:00.000000"
            },
            "functions_by_file": {
                "driver.c": [
                    {
                        "function_name": "gpu_init",
                        "function_code": "int gpu_init(struct device *dev) { /* GPU initialization */ return 0; }"
                    }
                ]
            },
            "dma_operations": [
                {
                    "function_name": "dma_alloc_coherent",
                    "function_code": "void* dma_alloc_coherent(struct device *dev, size_t size) {}",
                    "stack_trace": "dma_alloc_coherent+0x10\ngpu_probe+0x20"
                }
            ],
            "user_copy_operations": [
                {
                    "function_name": "copy_from_user",
                    "function_code": "copy_from_user(kernel_buf, user_buf, size)",
                    "operation": "copy_from_user"
                }
            ],
            "ioctl_operations": [
                {
                    "function_name": "gpu_ioctl",
                    "function_code": "long gpu_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {}",
                    "ioctl_cmd": "DRM_IOCTL_GPU_SUBMIT"
                }
            ]
        }
    
    @pytest.fixture
    def temp_json_file(self, sample_json_data):
        """Create temporary JSON file"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(sample_json_data, f)
            temp_file = f.name
        yield temp_file
        os.unlink(temp_file)
    
    @pytest.fixture
    def mock_openai_response(self):
        """Mock OpenAI response"""
        return """
Function/Code_Block_Name: "test_function"
AIARelevantFunction: 85
Relevant_KD_Entry_Point: 50
Message_Structure_Handling: 30
SMIDs identified: ["test_smid"]
Reasoning:
  - This function is directly related to GPU acceleration for AI workloads
  - Uses DMA operations for memory management
  - Critical for AI inference performance
"""
    
    def test_full_analysis_workflow(self, temp_json_file, mock_openai_response):
        """Test complete analysis workflow"""
        with patch('src.llm_analysis.openai_client.openai.OpenAI') as mock_openai_class:
            # Setup OpenAI mock
            mock_client = Mock()
            mock_openai_class.return_value = mock_client
            
            mock_response = Mock()
            mock_response.choices = [Mock()]
            mock_response.choices[0].message.content = mock_openai_response
            mock_client.chat.completions.create.return_value = mock_response
            
            # Create analyzer
            analyzer = JSONAnalyzer(
                model=GPTModel.GPT_4O.value,
                verbose=False
            )
            
            # Run analysis
            results = analyzer.analyze_json_file(temp_json_file)
            
            # Verify results structure
            assert 'functions_by_file' in results
            assert 'dma_operations' in results
            assert 'user_copy_operations' in results
            assert 'ioctl_operations' in results
            
            # Check that functions were analyzed
            assert len(results['functions_by_file']) > 0
            assert len(results['dma_operations']) > 0
            assert len(results['user_copy_operations']) > 0
            assert len(results['ioctl_operations']) > 0
            
            # Verify analysis results
            for category in results.values():
                if isinstance(category, list):
                    for result in category:
                        assert isinstance(result, AnalysisResult)
                        assert result.aia_relevant_function == 85
                        assert result.relevant_kd_entry_point == 50
    
    def test_analysis_with_output_file(self, temp_json_file, mock_openai_response):
        """Test analysis with output file generation"""
        with patch('src.llm_analysis.openai_client.openai.OpenAI') as mock_openai_class:
            # Setup OpenAI mock
            mock_client = Mock()
            mock_openai_class.return_value = mock_client
            
            mock_response = Mock()
            mock_response.choices = [Mock()]
            mock_response.choices[0].message.content = mock_openai_response
            mock_client.chat.completions.create.return_value = mock_response
            
            # Create analyzer
            analyzer = JSONAnalyzer(
                model=GPTModel.GPT_4O.value,
                verbose=False
            )
            
            # Create temporary output file
            with tempfile.NamedTemporaryFile(mode='w', suffix='.yaml', delete=False) as f:
                output_file = f.name
            
            try:
                # Run analysis with output
                results = analyzer.analyze_json_file(temp_json_file)
                
                # Save results to output file
                analyzer.output_formatter.export_to_yaml(results, output_file)
                
                # Verify output file was created
                assert os.path.exists(output_file)
                
                # Verify output file content
                import yaml
                with open(output_file, 'r') as f:
                    output_data = yaml.safe_load(f)
                
                assert 'functions_by_file' in output_data
                assert 'dma_operations' in output_data
                
            finally:
                if os.path.exists(output_file):
                    os.unlink(output_file)
    
    def test_analysis_with_different_models(self, temp_json_file, mock_openai_response):
        """Test analysis with different GPT models"""
        models_to_test = [GPTModel.GPT_3_5_TURBO, GPTModel.GPT_4, GPTModel.GPT_4_TURBO]
        
        for model in models_to_test:
            with patch('src.llm_analysis.openai_client.openai.OpenAI') as mock_openai_class:
                # Setup OpenAI mock
                mock_client = Mock()
                mock_openai_class.return_value = mock_client
                
                mock_response = Mock()
                mock_response.choices = [Mock()]
                mock_response.choices[0].message.content = mock_openai_response
                mock_client.chat.completions.create.return_value = mock_response
                
                # Create analyzer with specific model
                analyzer = JSONAnalyzer(
                    model=model.value,
                    verbose=False
                )
                
                # Run analysis
                results = analyzer.analyze_json_file(temp_json_file)
                
                # Verify model was used correctly
                call_args = mock_client.chat.completions.create.call_args
                assert call_args[1]['model'] == model.value
                
                # Verify results
                assert len(results) > 0
    
    def test_error_handling_invalid_json(self):
        """Test error handling for invalid JSON file"""
        # Create invalid JSON file
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            f.write("invalid json content {")
            temp_file = f.name
        
        try:
            analyzer = JSONAnalyzer()
            
            with pytest.raises(ValueError):
                analyzer.analyze_json_file(temp_file)
                
        finally:
            os.unlink(temp_file)
    
    def test_error_handling_missing_file(self):
        """Test error handling for missing file"""
        analyzer = JSONAnalyzer()
        
        with pytest.raises(ValueError):
            analyzer.analyze_json_file("non_existent_file.json")
    
    def test_analysis_with_api_errors(self, temp_json_file):
        """Test analysis handling when OpenAI API returns errors"""
        with patch('src.llm_analysis.openai_client.openai.OpenAI') as mock_openai_class:
            # Setup OpenAI mock to raise an error
            mock_client = Mock()
            mock_openai_class.return_value = mock_client
            mock_client.chat.completions.create.side_effect = Exception("API Error")
            
            analyzer = JSONAnalyzer()
            results = analyzer.analyze_json_file(temp_json_file)
            
            # Should still return results, but with default analysis
            assert 'functions_by_file' in results
            
            # Check that error results were generated
            for category in results.values():
                if isinstance(category, list):
                    for result in category:
                        assert isinstance(result, AnalysisResult)
                        # Should have default/error values
                        assert result.function_name == "API Error"
    
    def test_verbose_output(self, temp_json_file, mock_openai_response, capsys):
        """Test verbose output during analysis"""
        with patch('src.llm_analysis.openai_client.openai.OpenAI') as mock_openai_class:
            # Setup OpenAI mock
            mock_client = Mock()
            mock_openai_class.return_value = mock_client
            
            mock_response = Mock()
            mock_response.choices = [Mock()]
            mock_response.choices[0].message.content = mock_openai_response
            mock_client.chat.completions.create.return_value = mock_response
            
            # Create analyzer with verbose=True
            analyzer = JSONAnalyzer(
                model=GPTModel.GPT_4O.value,
                verbose=True
            )
            
            # Run analysis
            analyzer.analyze_json_file(temp_json_file)
            
            # Check that verbose output was generated
            captured = capsys.readouterr()
            assert "[VERBOSE]" in captured.out
    
    def test_empty_json_sections(self):
        """Test analysis with empty JSON sections"""
        empty_data = {
            "metadata": {"parser_version": "2.0.0"},
            "functions_by_file": {},
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": []
        }
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(empty_data, f)
            temp_file = f.name
        
        try:
            analyzer = JSONAnalyzer()
            results = analyzer.analyze_json_file(temp_file)
            
            # Should return empty results without errors
            assert len(results) == 0  # No sections should be added if they're empty
            
        finally:
            os.unlink(temp_file)
    
    def test_large_function_code_handling(self, mock_openai_response):
        """Test handling of large function code"""
        large_code = "int large_function() {\n" + "    // comment\n" * 1000 + "    return 0;\n}"
        
        large_data = {
            "functions_by_file": {
                "large.c": [
                    {
                        "function_name": "large_function",
                        "function_code": large_code
                    }
                ]
            },
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": []
        }
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(large_data, f)
            temp_file = f.name
        
        try:
            with patch('src.llm_analysis.openai_client.openai.OpenAI') as mock_openai_class:
                # Setup OpenAI mock
                mock_client = Mock()
                mock_openai_class.return_value = mock_client
                
                mock_response = Mock()
                mock_response.choices = [Mock()]
                mock_response.choices[0].message.content = mock_openai_response
                mock_client.chat.completions.create.return_value = mock_response
                
                analyzer = JSONAnalyzer()
                results = analyzer.analyze_json_file(temp_file)
                
                # Should handle large code without errors
                assert len(results['functions_by_file']) > 0
                
        finally:
            os.unlink(temp_file)
    
    def test_special_characters_in_code(self, mock_openai_response):
        """Test handling of special characters in function code"""
        special_code = '''
int special_function() {
    char *msg = "Hello\nWorld\t!";
    printf("Special chars: %s\\n", msg);
    return 0;
}
'''
        
        special_data = {
            "functions_by_file": {
                "special.c": [
                    {
                        "function_name": "special_function", 
                        "function_code": special_code
                    }
                ]
            },
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": []
        }
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(special_data, f)
            temp_file = f.name
        
        try:
            with patch('src.llm_analysis.openai_client.openai.OpenAI') as mock_openai_class:
                # Setup OpenAI mock
                mock_client = Mock()
                mock_openai_class.return_value = mock_client
                
                mock_response = Mock()
                mock_response.choices = [Mock()]
                mock_response.choices[0].message.content = mock_openai_response
                mock_client.chat.completions.create.return_value = mock_response
                
                analyzer = JSONAnalyzer()
                results = analyzer.analyze_json_file(temp_file)
                
                # Should handle special characters without errors
                assert len(results['functions_by_file']) > 0
                
        finally:
            os.unlink(temp_file)
