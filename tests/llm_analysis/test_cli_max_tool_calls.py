#!/usr/bin/env python3
"""
Tests for CLI integration of max_tool_calls parameter
"""

import pytest
import argparse
from unittest.mock import patch, Mock
from src.llm_analysis.cli import create_parser, main
from src.llm_analysis.json_analyzer import JSONAnalyzer


class TestCLIMaxToolCalls:
    """Test CLI integration for max_tool_calls parameter"""
    
    def test_cli_parser_max_tool_calls_argument(self):
        """Test that the CLI parser correctly handles --max-tool-calls argument"""
        parser = create_parser()
        
        # Test default value
        args = parser.parse_args(['test.json'])
        assert args.max_tool_calls == 5
        
        # Test custom value
        args = parser.parse_args(['test.json', '--max-tool-calls', '10'])
        assert args.max_tool_calls == 10
        
        # Test zero value
        args = parser.parse_args(['test.json', '--max-tool-calls', '0'])
        assert args.max_tool_calls == 0
        
        # Test large value
        args = parser.parse_args(['test.json', '--max-tool-calls', '100'])
        assert args.max_tool_calls == 100

    def test_cli_parser_max_tool_calls_with_other_args(self):
        """Test max-tool-calls works with other CLI arguments"""
        parser = create_parser()
        
        # Test with verbose and model
        args = parser.parse_args([
            'test.json', 
            '--verbose', 
            '--model', 'gpt-4',
            '--max-tool-calls', '15'
        ])
        assert args.max_tool_calls == 15
        assert args.verbose is True
        assert args.model == 'gpt-4'
        
        # Test with disable-tools (should still parse max-tool-calls)
        args = parser.parse_args([
            'test.json',
            '--disable-tools',
            '--max-tool-calls', '3'
        ])
        assert args.max_tool_calls == 3
        assert args.disable_tools is True

    def test_cli_invalid_max_tool_calls_value(self):
        """Test that invalid max-tool-calls values are handled"""
        parser = create_parser()
        
        # Test invalid string value
        with pytest.raises(SystemExit):
            parser.parse_args(['test.json', '--max-tool-calls', 'invalid'])
        
        # Test negative value (should parse but might not be practical)
        args = parser.parse_args(['test.json', '--max-tool-calls', '-1'])
        assert args.max_tool_calls == -1

    @patch('src.llm_analysis.cli.JSONAnalyzer')
    @patch('src.llm_analysis.cli.validate_input_files')
    @patch('src.llm_analysis.cli.Path.exists')
    def test_cli_passes_max_tool_calls_to_analyzer(self, mock_exists, mock_validate, mock_analyzer_class):
        """Test that CLI correctly passes max_tool_calls to JSONAnalyzer"""
        # Mock file validation
        mock_validate.return_value = ['test.json']
        mock_exists.return_value = True
        
        # Mock analyzer instance
        mock_analyzer = Mock()
        mock_analyzer.analyze_json_file.return_value = {'test': []}
        mock_analyzer.export_results_to_yaml.return_value = None
        mock_analyzer.print_results_summary.return_value = None
        mock_analyzer_class.return_value = mock_analyzer
        
        # Test with custom max-tool-calls value
        test_args = [
            'test.json',
            '--max-tool-calls', '7',
            '--verbose'
        ]
        
        with patch('sys.argv', ['cli.py'] + test_args):
            try:
                main()
            except SystemExit:
                pass  # Expected due to mocking
        
        # Verify that JSONAnalyzer was called with the correct max_tool_calls
        mock_analyzer_class.assert_called_once()
        call_kwargs = mock_analyzer_class.call_args.kwargs
        assert call_kwargs['max_tool_calls'] == 7
        assert call_kwargs['verbose'] is True
        assert call_kwargs['enable_tools'] is True  # Default when not disabled

    @patch('src.llm_analysis.cli.JSONAnalyzer')
    @patch('src.llm_analysis.cli.validate_input_files')
    @patch('src.llm_analysis.cli.Path.exists')
    def test_cli_max_tool_calls_with_disabled_tools(self, mock_exists, mock_validate, mock_analyzer_class):
        """Test max_tool_calls parameter when tools are disabled"""
        # Mock file validation
        mock_validate.return_value = ['test.json']
        mock_exists.return_value = True
        
        # Mock analyzer instance
        mock_analyzer = Mock()
        mock_analyzer.analyze_json_file.return_value = {'test': []}
        mock_analyzer.export_results_to_yaml.return_value = None
        mock_analyzer.print_results_summary.return_value = None
        mock_analyzer_class.return_value = mock_analyzer
        
        # Test with tools disabled but max-tool-calls still specified
        test_args = [
            'test.json',
            '--disable-tools',
            '--max-tool-calls', '12'
        ]
        
        with patch('sys.argv', ['cli.py'] + test_args):
            try:
                main()
            except SystemExit:
                pass  # Expected due to mocking
        
        # Verify the parameters passed to JSONAnalyzer
        mock_analyzer_class.assert_called_once()
        call_kwargs = mock_analyzer_class.call_args.kwargs
        assert call_kwargs['max_tool_calls'] == 12  # Should still pass the value
        assert call_kwargs['enable_tools'] is False  # Tools should be disabled

    def test_cli_help_includes_max_tool_calls(self):
        """Test that CLI help text includes information about max-tool-calls"""
        parser = create_parser()
        
        # Get help text
        help_text = parser.format_help()
        
        # Check that max-tool-calls is mentioned
        assert '--max-tool-calls' in help_text
        assert 'Maximum number of tool calling rounds' in help_text
        assert 'default: 5' in help_text

    @patch('src.llm_analysis.json_analyzer.OpenAIClient')
    def test_json_analyzer_passes_max_tool_calls(self, mock_openai_client_class):
        """Test that JSONAnalyzer correctly passes max_tool_calls to OpenAIClient"""
        mock_client = Mock()
        mock_openai_client_class.return_value = mock_client
        
        # Create JSONAnalyzer with custom max_tool_calls
        analyzer = JSONAnalyzer(
            model='gpt-4o-mini',
            verbose=True,
            enable_tools=True,
            max_tool_calls=8
        )
        
        # Verify that OpenAIClient was initialized with correct parameters
        mock_openai_client_class.assert_called_once()
        call_kwargs = mock_openai_client_class.call_args.kwargs
        assert call_kwargs['max_tool_calls'] == 8
        assert call_kwargs['enable_tools'] is True
        assert call_kwargs['model'] == 'gpt-4o-mini'
        assert call_kwargs['verbose'] is True

    @patch('src.llm_analysis.json_analyzer.OpenAIClient')
    def test_json_analyzer_default_max_tool_calls(self, mock_openai_client_class):
        """Test that JSONAnalyzer uses default max_tool_calls when not specified"""
        mock_client = Mock()
        mock_openai_client_class.return_value = mock_client
        
        # Create JSONAnalyzer without specifying max_tool_calls
        analyzer = JSONAnalyzer(
            model='gpt-4o-mini',
            verbose=False,
            enable_tools=True
        )
        
        # Verify that OpenAIClient was initialized with default max_tool_calls
        mock_openai_client_class.assert_called_once()
        call_kwargs = mock_openai_client_class.call_args.kwargs
        assert call_kwargs['max_tool_calls'] == 5  # Default value
        assert call_kwargs['enable_tools'] is True
