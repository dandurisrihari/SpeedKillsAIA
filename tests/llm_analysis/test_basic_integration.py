#!/usr/bin/env python3
"""
Basic integration test for the LLM analysis module
"""

import pytest
import json
import tempfile
import os
from unittest.mock import Mock, patch
from src.llm_analysis.json_analyzer import JSONAnalyzer


class TestBasicIntegration:
    """Basic integration tests"""
    
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
                        "function_code": "int gpu_init(struct device *dev) { return 0; }"
                    }
                ]
            },
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": []
        }
    
    @pytest.fixture
    def temp_json_file(self, sample_json_data):
        """Create temporary JSON file"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(sample_json_data, f)
            temp_file = f.name
        yield temp_file
        os.unlink(temp_file)
    
    def test_analyzer_initialization(self):
        """Test JSONAnalyzer can be initialized"""
        analyzer = JSONAnalyzer(verbose=False)
        
        assert analyzer.model is not None
        assert analyzer.verbose == False
        assert analyzer.parser is not None
        assert analyzer.output_formatter is not None
    
    def test_analyzer_parse_file(self, temp_json_file):
        """Test that analyzer can parse JSON files"""
        analyzer = JSONAnalyzer(verbose=False)
        
        # Test that parser works
        parsed_data = analyzer.parser.parse_file(temp_json_file)
        
        assert 'functions_by_file' in parsed_data
        assert 'dma_operations' in parsed_data
        assert 'user_copy_operations' in parsed_data
        assert 'ioctl_operations' in parsed_data
        
        # Check that functions were parsed correctly
        assert len(parsed_data['functions_by_file']) > 0
    
    def test_components_integration(self):
        """Test that all components can work together"""
        analyzer = JSONAnalyzer(verbose=True)
        
        # Verify all components are properly initialized
        assert analyzer.parser is not None
        assert analyzer.openai_client is not None
        assert analyzer.output_formatter is not None
        assert analyzer.function_processor is not None
        assert analyzer.dma_processor is not None
        assert analyzer.user_copy_processor is not None
        assert analyzer.ioctl_processor is not None
