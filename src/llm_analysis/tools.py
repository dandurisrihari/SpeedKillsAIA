#!/usr/bin/env python3
"""
Tool definitions and implementations for LLM function calling
"""

import json
import subprocess
import tempfile
from pathlib import Path
from typing import Dict, List, Any, Optional
from dataclasses import dataclass


@dataclass
class ToolCallResult:
    """Result of a tool call"""
    success: bool
    output: Any
    error_message: Optional[str] = None


class StructAnalyzerTool:
    """Tool for analyzing C structures using the structanalyzer module"""
    
    def __init__(self, verbose: bool = False):
        self.verbose = verbose
        self.tool_definition = {
            "type": "function",
            "function": {
                "name": "analyze_struct_definition",
                "description": "Analyze C struct/union/enum definitions. Use this when you encounter struct or union types in the code that you need to understand better. You must provide the struct_name to analyze.",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "struct_name": {
                            "type": "string",
                            "description": "Name of the structure/union/enum to analyze (e.g., 'gcsHAL_INTERFACE', 'gasket_dev'). REQUIRED."
                        }
                    },
                    "required": ["struct_name"]
                }
            }
        }
    
    def _log_verbose(self, message: str):
        """Log verbose messages if verbose mode is enabled"""
        if self.verbose:
            print(f"[STRUCT_ANALYZER_TOOL] {message}")
    
    def get_tool_definition(self) -> Dict[str, Any]:
        """Get the tool definition for OpenAI function calling"""
        return self.tool_definition
    
    def call(self, arguments: Dict[str, Any]) -> ToolCallResult:
        """Execute the struct analyzer tool"""
        try:
            self._log_verbose(f"Calling struct analyzer with arguments: {arguments}")
            
            # Extract parameters - file_path comes from the context set by ToolManager
            struct_name = arguments.get("struct_name")
            depth = 1  # Fixed depth to limit analysis complexity
            
            # Validate struct_name is provided
            if not struct_name:
                return ToolCallResult(
                    success=False,
                    output=None,
                    error_message="struct_name is required"
                )
            
            # Get file_path from the tool manager context (set automatically)
            file_path_or_content = arguments.get("file_path")  # This should now be a path
            
            # Validate file path
            if not file_path_or_content:
                return ToolCallResult(
                    success=False,
                    output=None,
                    error_message="No preprocessed file path available. Cannot analyze struct definitions."
                )
            
            # At this point, file_path_or_content should be a valid file path
            # (either original file path or temp file created by ToolManager)
            input_file_path = file_path_or_content
            self._log_verbose(f"Using file: {input_file_path}")
            
            # Verify the file exists
            if not Path(input_file_path).exists():
                return ToolCallResult(
                    success=False,
                    output=None,
                    error_message=f"Input file does not exist: {input_file_path}"
                )
            
            # Build command for struct analysis
            cmd = ["python3", "-m", "src.structanalyzer", input_file_path, struct_name]
            
            # Add format parameter (always use C format to generate .h files)
            cmd.extend(["--format", "c"])
            
            # Add depth parameter (fixed to 1)
            cmd.extend(["--depth", "1"])
            
            # Add verbose flag
            cmd.extend(["-v"])
            
            # Create temporary output file with .h extension
            with tempfile.NamedTemporaryFile(mode='w', suffix='.h', delete=False) as temp_file:
                temp_output = temp_file.name
            
            cmd.extend(["--output", temp_output])
            
            self._log_verbose(f"Executing command: {' '.join(cmd)}")
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                cwd="/media/sri/D/Research/Accelerators_Research/SpeedKillsAIA"
            )
            
            if result.returncode != 0:
                Path(temp_output).unlink(missing_ok=True)
                return ToolCallResult(
                    success=False,
                    output=None,
                    error_message=f"Command failed: {result.stderr}"
                )
            
            # Read the generated .h file content
            try:
                with open(temp_output, 'r') as f:
                    output_content = f.read()
                Path(temp_output).unlink(missing_ok=True)
                
                self._log_verbose(f"Generated C header content:\n{output_content[:200]}...")
                
            except Exception as e:
                Path(temp_output).unlink(missing_ok=True)
                return ToolCallResult(
                    success=False,
                    output=None,
                    error_message=f"Failed to read output file: {e}"
                )
            
            self._log_verbose(f"Successfully executed struct analyzer")
            
            # Return the C header content directly
            return ToolCallResult(success=True, output=output_content)
            
        except Exception as e:
            self._log_verbose(f"Error in struct analyzer tool: {e}")
            return ToolCallResult(
                success=False,
                output=None,
                error_message=f"Unexpected error: {e}"
            )


class ToolManager:
    """Manager for all available tools"""
    
    def __init__(self, verbose: bool = False):
        self.verbose = verbose
        self.tools = {}
        self.current_preprocessed_file_content = None  # Store current preprocessed file content
        self.temp_input_file_path = None  # Reusable temp file for current function analysis
        self.temp_input_file_handle = None  # Keep reference to temp file handle
        self._register_tools()
    
    def set_preprocessed_file_path(self, file_path_or_content: Optional[str]):
        """Set the current preprocessed file path or content for tool calls"""
        # Clean up any existing temp file first
        self.cleanup_temp_file()
        
        self.current_preprocessed_file_content = file_path_or_content
        
        # If it's content (not a file path), create a temporary file now
        if file_path_or_content and self._is_content_not_path(file_path_or_content):
            self._create_temp_file_from_content(file_path_or_content)
    
    def _is_content_not_path(self, file_path_or_content: str) -> bool:
        """Determine if the input is file content rather than a file path"""
        # Better heuristics for detecting file path vs content
        if len(file_path_or_content) < 1000 and '\n' not in file_path_or_content:
            # Could be a file path, check if it exists
            try:
                return not Path(file_path_or_content).exists()
            except (OSError, ValueError):
                # File name too long or invalid - definitely content
                return True
        return True  # Assume it's content if it's long or has newlines
    
    def _create_temp_file_from_content(self, content: str):
        """Create a temporary file from content and store the path for reuse"""
        try:
            import tempfile
            self.temp_input_file_handle = tempfile.NamedTemporaryFile(mode='w', suffix='.i', delete=False)
            self.temp_input_file_handle.write(content)
            self.temp_input_file_handle.close()
            self.temp_input_file_path = self.temp_input_file_handle.name
            if self.verbose:
                print(f"[TOOL_MANAGER] Created reusable temp file: {self.temp_input_file_path}")
        except Exception as e:
            if self.verbose:
                print(f"[TOOL_MANAGER] Failed to create temp file: {e}")
            self.temp_input_file_path = None
            self.temp_input_file_handle = None
    
    def cleanup_temp_file(self):
        """Clean up the temporary file if it exists"""
        if self.temp_input_file_path:
            try:
                Path(self.temp_input_file_path).unlink(missing_ok=True)
                if self.verbose:
                    print(f"[TOOL_MANAGER] Cleaned up temp file: {self.temp_input_file_path}")
            except Exception as e:
                if self.verbose:
                    print(f"[TOOL_MANAGER] Error cleaning up temp file: {e}")
            finally:
                self.temp_input_file_path = None
                self.temp_input_file_handle = None
    
    def _register_tools(self):
        """Register all available tools"""
        self.tools["analyze_struct_definition"] = StructAnalyzerTool(verbose=self.verbose)
    
    def get_tool_definitions(self) -> List[Dict[str, Any]]:
        """Get all tool definitions for OpenAI function calling"""
        return [tool.get_tool_definition() for tool in self.tools.values()]
    
    def call_tool(self, function_name: str, arguments: Dict[str, Any]) -> ToolCallResult:
        """Call a specific tool by name"""
        if function_name not in self.tools:
            return ToolCallResult(
                success=False,
                output=None,
                error_message=f"Unknown tool: {function_name}"
            )
        
        # Automatically inject the current preprocessed file content for struct analysis
        if function_name == "analyze_struct_definition":
            if self.current_preprocessed_file_content:
                # Use the pre-created temp file path if available, otherwise use original content/path
                file_to_use = self.temp_input_file_path or self.current_preprocessed_file_content
                arguments["file_path"] = file_to_use
                if self.verbose:
                    if self.temp_input_file_path:
                        print(f"[TOOL_MANAGER] Using reusable temp file: {self.temp_input_file_path}")
                    else:
                        content_preview = str(file_to_use)[:100].replace('\n', '\\n')
                        print(f"[TOOL_MANAGER] Using file path: {content_preview}...")
            else:
                return ToolCallResult(
                    success=False,
                    output=None,
                    error_message="No preprocessed file path or content available for struct analysis. This function may not have preprocessed code."
                )
        
        return self.tools[function_name].call(arguments)
    
    def has_tool(self, function_name: str) -> bool:
        """Check if a tool is available"""
        return function_name in self.tools
