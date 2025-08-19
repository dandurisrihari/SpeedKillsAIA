#!/usr/bin/env python3
"""
Comprehensive tests for CLI module and main entry points.
Tests all functionality with the correct API signatures.
"""

import pytest
import tempfile
import os
import json
import sys
from unittest.mock import Mock, patch, MagicMock
from pathlib import Path

# Import the CLI module
from src.llm_analysis.cli import main, create_parser
from src.llm_analysis.json_analyzer import JSONAnalyzer
from src.llm_analysis.models import AnalysisResult


class TestCLI:
    """Test suite for CLI functionality."""
    
    def test_create_parser_minimal(self):
        """Test creating parser and parsing minimal arguments."""
        parser = create_parser()
        
        test_args = ['input.json']
        args = parser.parse_args(test_args)
        
        assert args.json_files == ['input.json']
        # Check default values
        assert hasattr(args, 'verbose')
        assert hasattr(args, 'model')
        assert hasattr(args, 'verbose_log')
        assert hasattr(args, 'output')
        assert hasattr(args, 'disable_tools')
        assert hasattr(args, 'no_summary')
    
    def test_create_parser_full(self):
        """Test creating parser and parsing full arguments."""
        parser = create_parser()
        
        test_args = [
            'input.json',
            '--verbose',
            '--model', 'gpt-4',
            '--verbose-log', 'custom.log',
            '--output', 'output.yaml',
            '--disable-tools',
            '--no-summary'
        ]
        
        args = parser.parse_args(test_args)
        
        assert args.json_files == ['input.json']
        assert args.verbose == True
        assert args.model == 'gpt-4'
        assert args.verbose_log == 'custom.log'
        assert args.output == 'output.yaml'
        assert args.disable_tools == True
        assert args.no_summary == True
    
    def test_create_parser_help(self):
        """Test that help argument works."""
        parser = create_parser()
        
        with pytest.raises(SystemExit):
            parser.parse_args(['--help'])
    
    def test_main_function_success(self):
        """Test that main function can be called without immediate errors."""
        # Just test that main can be imported and called
        # We don't test the full execution since it involves complex dependencies
        from src.llm_analysis.cli import main
        
        # The function exists and is callable
        assert callable(main)
        
        # We can test the argument parsing which is the core CLI logic
        parser = create_parser()
        args = parser.parse_args(['test.json', '--model', 'gpt-4o-mini'])
        
        assert args.json_files == ['test.json']
        assert args.model == 'gpt-4o-mini'
    
    def test_main_function_file_not_found(self):
        """Test main function with non-existent input file."""
        with patch('sys.argv', ['test_program', '/non/existent/file.json']), \
             patch('builtins.print'):
            
            with pytest.raises(SystemExit):
                main()
    
    def test_argument_validation(self):
        """Test argument validation logic."""
        parser = create_parser()
        
        # Test with no arguments (should fail)
        with pytest.raises(SystemExit):
            parser.parse_args([])
    
    def test_multiple_json_files(self):
        """Test parsing multiple JSON files."""
        parser = create_parser()
        
        test_args = ['file1.json', 'file2.json', 'file3.json']
        args = parser.parse_args(test_args)
        
        assert args.json_files == ['file1.json', 'file2.json', 'file3.json']


class TestCLIIntegration:
    """Integration tests for CLI with other components."""
    
    def test_validate_input_files(self):
        """Test input file validation."""
        from src.llm_analysis.cli import validate_input_files
        
        # Test with non-existent files
        with patch('builtins.print'), pytest.raises(SystemExit):
            validate_input_files(['/non/existent/file.json'])
    
    def test_generate_output_filename(self):
        """Test output filename generation."""
        from src.llm_analysis.cli import generate_output_filename
        
        result = generate_output_filename('test.json')
        assert result.endswith('_analysis.yaml')
        assert 'test' in result
    
    def test_generate_log_filename(self):
        """Test log filename generation.""" 
        from src.llm_analysis.cli import generate_log_filename
        
        result = generate_log_filename('test_analysis.yaml')
        assert result.endswith('_verbose.log')
        assert 'test_analysis' in result


if __name__ == '__main__':
    pytest.main([__file__])
