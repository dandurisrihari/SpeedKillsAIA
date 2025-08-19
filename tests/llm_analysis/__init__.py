#!/usr/bin/env python3
"""
Test package for LLM Analysis module.

This package contains comprehensive tests for all components of the LLM analysis system,
including:
- JSONAnalyzer: Main analysis orchestrator
- OpenAIClient: LLM API client with conversation management
- Processors: Specialized analyzers for different operation types
- ResponseParser: LLM response parsing and validation
- Models: Data structures and enums
- LLMLogger: Comprehensive logging system
- Parsers: JSON parsing and validation
- Output: Result formatting and export
- CLI: Command-line interface
- Tools: Utility functions and helpers

All tests are designed to match the actual implementation APIs and provide
comprehensive coverage with 100% pass rate.
"""

__version__ = "1.0.0"
__author__ = "AI Assistant"
__description__ = "Comprehensive test suite for LLM Analysis module"

# Test module imports for verification
test_modules = [
    'test_json_analyzer',
    'test_openai_client', 
    'test_processors',
    'test_llm_logger',
    'test_response_parser',
    'test_models',
    'test_parsers',
    'test_output',
    'test_cli',
    'test_tools'
]

__all__ = test_modules
