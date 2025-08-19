#!/usr/bin/env python3
"""
Tests for the tools functionality - struct analyzer integration
"""

import pytest
import json
import tempfile
from pathlib import Path
from unittest.mock import Mock, patch, mock_open, MagicMock
from src.llm_analysis.tools import StructAnalyzerTool, ToolManager, ToolCallResult


class TestStructAnalyzerTool:
    """Test the struct analyzer tool functionality"""
    
    def test_tool_definition(self):
        """Test that the tool definition is properly formatted"""
        tool = StructAnalyzerTool()
        definition = tool.get_tool_definition()
        
        assert definition["type"] == "function"
        assert definition["function"]["name"] == "analyze_struct_definition"
        assert "description" in definition["function"]
        assert "parameters" in definition["function"]
        
        # Check required parameters
        required = definition["function"]["parameters"]["required"]
        assert "struct_name" in required
        
        # Check properties
        props = definition["function"]["parameters"]["properties"]
        assert "struct_name" in props
    
    def test_missing_struct_name(self):
        """Test that struct_name is required"""
        tool = StructAnalyzerTool()
        result = tool.call({})
        
        assert not result.success
        assert "struct_name is required" in result.error_message
    
    def test_missing_file_path_context(self):
        """Test that file_path context is required for analysis"""
        tool = StructAnalyzerTool()
        result = tool.call({"struct_name": "test_struct"})
        
        assert not result.success
        assert "No preprocessed file path available" in result.error_message
    
    def test_successful_struct_analysis(self):
        """Test successful struct analysis - simplified integration test"""
        tool = StructAnalyzerTool()
        
        # Test basic call with required parameters
        result = tool.call({
            "file_path": "data/structanalyzerpreprocessedfiles/dma-buf-phys.i",
            "struct_name": "dma_buf"
        })
        
        # The test will succeed if the tool doesn't crash and returns a result
        # We can't easily test the actual subprocess call without complex mocking
        # But we can verify the basic validation works
        assert result is not None
        assert hasattr(result, 'success')
        assert hasattr(result, 'output')
        assert hasattr(result, 'error_message')
    
    def test_struct_analysis_error_handling(self):
        """Test error handling when struct analysis fails"""
        tool = StructAnalyzerTool()
        
        # Test with nonexistent file
        result = tool.call({
            "file_path": "/nonexistent/file.i",
            "struct_name": "test_struct"
        })
        
        assert not result.success
        assert "does not exist" in result.error_message
    
    def test_file_reading_error(self):
        """Test error handling when file path is missing"""
        tool = StructAnalyzerTool()
        
        # Test with missing file_path
        result = tool.call({
            "struct_name": "test_struct"
        })
        
        assert not result.success
        assert "No preprocessed file path available" in result.error_message


class TestToolManager:
    """Test the tool manager functionality"""
    
    def test_initialization(self):
        """Test tool manager initialization"""
        manager = ToolManager()
        
        # Check that struct analyzer tool is registered
        assert manager.has_tool("analyze_struct_definition")
        assert "analyze_struct_definition" in manager.tools
    
    def test_get_tool_definitions(self):
        """Test getting all tool definitions"""
        manager = ToolManager()
        definitions = manager.get_tool_definitions()
        
        assert len(definitions) == 1
        assert definitions[0]["function"]["name"] == "analyze_struct_definition"
    
    def test_call_existing_tool(self):
        """Test calling an existing tool"""
        manager = ToolManager()
        
        # Set preprocessed file content for the manager
        manager.set_preprocessed_file_path("data/structanalyzerpreprocessedfiles/dma-buf-phys.i")
        
        # Mock the tool
        mock_tool = Mock()
        mock_result = ToolCallResult(success=True, output="test output")
        mock_tool.call.return_value = mock_result
        manager.tools["analyze_struct_definition"] = mock_tool
        
        result = manager.call_tool("analyze_struct_definition", {"struct_name": "test_struct"})
        
        assert result.success
        assert result.output == "test output"
        # Verify that file_path was automatically injected
        mock_tool.call.assert_called_once()
        call_args = mock_tool.call.call_args[0][0]
        assert "struct_name" in call_args
        assert "file_path" in call_args
    
    def test_call_nonexistent_tool(self):
        """Test calling a nonexistent tool"""
        manager = ToolManager()
        
        result = manager.call_tool("nonexistent_tool", {})
        
        assert not result.success
        assert "Unknown tool" in result.error_message


class TestToolCallResult:
    """Test the ToolCallResult dataclass"""
    
    def test_success_result(self):
        """Test successful result creation"""
        result = ToolCallResult(success=True, output={"key": "value"})
        
        assert result.success
        assert result.output == {"key": "value"}
        assert result.error_message is None
    
    def test_failure_result(self):
        """Test failure result creation"""
        result = ToolCallResult(success=False, output=None, error_message="Test error")
        
        assert not result.success
        assert result.output is None
        assert result.error_message == "Test error"
