#!/usr/bin/env python3
"""
Tests for the tools functionality - struct analyzer integration
"""

import pytest
import json
import tempfile
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock
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
        assert "file_path" in required
        
        # Check properties
        props = definition["function"]["parameters"]["properties"]
        assert "file_path" in props
        assert "struct_name" in props
        assert "format" in props
        assert "depth" in props
        assert "list_structures" in props
        assert "max_results" in props
    
    def test_invalid_file_path(self):
        """Test handling of invalid file paths"""
        tool = StructAnalyzerTool()
        result = tool.call({"file_path": "/nonexistent/file.i"})
        
        assert not result.success
        assert "File not found" in result.error_message
    
    def test_missing_struct_name_without_list(self):
        """Test that struct_name is required when not listing structures"""
        tool = StructAnalyzerTool()
        
        # Create a temporary file
        with tempfile.NamedTemporaryFile(suffix='.i', delete=False) as temp_file:
            temp_file.write(b"struct test_struct { int field; };")
            temp_path = temp_file.name
        
        try:
            result = tool.call({
                "file_path": temp_path,
                "list_structures": False
            })
            
            assert not result.success
            assert "struct_name is required" in result.error_message
        finally:
            Path(temp_path).unlink(missing_ok=True)
    
    @patch('subprocess.run')
    def test_successful_struct_analysis(self, mock_run):
        """Test successful struct analysis"""
        tool = StructAnalyzerTool()
        
        # Create a temporary file
        with tempfile.NamedTemporaryFile(suffix='.i', delete=False) as temp_file:
            temp_file.write(b"struct test_struct { int field; };")
            temp_path = temp_file.name
        
        # Mock successful subprocess execution
        mock_result = Mock()
        mock_result.returncode = 0
        mock_result.stderr = ""
        mock_run.return_value = mock_result
        
        # Mock temporary output file
        expected_output = "struct test_struct {\n  int field;\n};"
        
        try:
            with patch('tempfile.NamedTemporaryFile') as mock_temp, \
                 patch('builtins.open', mock_data=expected_output) as mock_open:
                
                # Configure mock temporary file
                mock_temp_file = Mock()
                mock_temp_file.name = "/tmp/test_output.txt"
                mock_temp.__enter__.return_value = mock_temp_file
                
                # Configure mock file reading
                mock_open.return_value.__enter__.return_value.read.return_value = expected_output
                
                result = tool.call({
                    "file_path": temp_path,
                    "struct_name": "test_struct",
                    "format": "text"
                })
                
                # Note: This test will depend on the actual subprocess call
                # For now, we just verify the call structure
                assert mock_run.called
                call_args = mock_run.call_args[0][0]
                assert "python3" in call_args
                assert "-m" in call_args
                assert "src.structanalyzer" in call_args
                assert temp_path in call_args
                assert "test_struct" in call_args
        
        finally:
            Path(temp_path).unlink(missing_ok=True)
    
    @patch('subprocess.run')
    def test_list_structures(self, mock_run):
        """Test listing structures functionality"""
        tool = StructAnalyzerTool()
        
        # Create a temporary file
        with tempfile.NamedTemporaryFile(suffix='.i', delete=False) as temp_file:
            temp_file.write(b"struct test_struct { int field; };")
            temp_path = temp_file.name
        
        # Mock successful subprocess execution
        mock_result = Mock()
        mock_result.returncode = 0
        mock_result.stderr = ""
        mock_result.stdout = "Found 1 structures/unions:\n1. test_struct"
        mock_run.return_value = mock_result
        
        try:
            result = tool.call({
                "file_path": temp_path,
                "list_structures": True,
                "max_results": 10
            })
            
            # Verify subprocess call
            assert mock_run.called
            call_args = mock_run.call_args[0][0]
            assert "--list-structures" in call_args
            assert "--max-results" in call_args
            assert "10" in call_args
        
        finally:
            Path(temp_path).unlink(missing_ok=True)
    
    @patch('subprocess.run')
    def test_json_output_parsing(self, mock_run):
        """Test JSON output parsing"""
        tool = StructAnalyzerTool()
        
        # Create a temporary file
        with tempfile.NamedTemporaryFile(suffix='.i', delete=False) as temp_file:
            temp_file.write(b"struct test_struct { int field; };")
            temp_path = temp_file.name
        
        # Mock successful subprocess execution
        mock_result = Mock()
        mock_result.returncode = 0
        mock_result.stderr = ""
        mock_run.return_value = mock_result
        
        # Mock JSON output
        expected_json = {"struct_name": "test_struct", "fields": [{"name": "field", "type": "int"}]}
        
        try:
            with patch('tempfile.NamedTemporaryFile') as mock_temp, \
                 patch('builtins.open') as mock_open:
                
                # Configure mock temporary file
                mock_temp_file = Mock()
                mock_temp_file.name = "/tmp/test_output.json"
                mock_temp.__enter__.return_value = mock_temp_file
                
                # Configure mock file reading
                mock_open.return_value.__enter__.return_value.read.return_value = json.dumps(expected_json)
                
                result = tool.call({
                    "file_path": temp_path,
                    "struct_name": "test_struct",
                    "format": "json"
                })
                
                # Verify format argument
                call_args = mock_run.call_args[0][0]
                assert "--format" in call_args
                assert "json" in call_args
        
        finally:
            Path(temp_path).unlink(missing_ok=True)


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
        
        # Mock the tool
        mock_tool = Mock()
        mock_result = ToolCallResult(success=True, output="test output")
        mock_tool.call.return_value = mock_result
        manager.tools["analyze_struct_definition"] = mock_tool
        
        result = manager.call_tool("analyze_struct_definition", {"file_path": "/test/file"})
        
        assert result.success
        assert result.output == "test output"
        mock_tool.call.assert_called_once_with({"file_path": "/test/file"})
    
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
