#!/usr/bin/env python3
"""
LLM Analysis Logger - Comprehensive logging for LLM interactions
"""

import os
import json
from datetime import datetime
from pathlib import Path
from typing import Dict, Any, List, Optional


class LLMLogger:
    """Logger for comprehensive LLM analysis interactions"""
    
    def __init__(self, verbose: bool = False, log_dir: str = "logs/llm_analysis", custom_log_file: Optional[str] = None):
        self.verbose = verbose
        self.log_dir = Path(log_dir)
        self.log_file = None
        self.session_id = None
        self.custom_log_file = custom_log_file
        
        if self.verbose:
            self._setup_logging()
    
    def _setup_logging(self):
        """Setup logging directory and file"""
        if self.custom_log_file:
            # Use custom log file path
            self.log_file = Path(self.custom_log_file)
            # Create directory if it doesn't exist
            self.log_file.parent.mkdir(parents=True, exist_ok=True)
            # Generate session ID from filename
            self.session_id = f"llm_session_{self.log_file.stem}"
        else:
            # Use default auto-generated log file
            # Create logs directory if it doesn't exist
            self.log_dir.mkdir(parents=True, exist_ok=True)
            
            # Generate session ID and log file name
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            self.session_id = f"llm_session_{timestamp}"
            self.log_file = self.log_dir / f"{self.session_id}.log"
        
        # Write session header
        self._write_header()
    
    def _write_header(self):
        """Write session header to log file"""
        if not self.log_file:
            return
            
        header = f"""
================================================================================
LLM ANALYSIS SESSION LOG
================================================================================
Session ID: {self.session_id}
Start Time: {datetime.now().strftime("%Y-%m-%d %H:%M:%S")}
Log File: {self.log_file}
================================================================================

"""
        with open(self.log_file, 'w') as f:
            f.write(header)
        
        print(f"[LLM_LOGGER] Logging to: {self.log_file}")
    
    def _write_log(self, content: str):
        """Write content to log file"""
        if not self.verbose or not self.log_file:
            return
            
        timestamp = datetime.now().strftime("%H:%M:%S.%f")[:-3]
        
        with open(self.log_file, 'a') as f:
            f.write(f"[{timestamp}] {content}\n")
    
    def log_function_analysis_start(self, function_name: str, function_code: str, 
                                  preprocessed_file_path: Optional[str] = None,
                                  enable_tools: bool = False):
        """Log the start of function analysis"""
        if not self.verbose:
            return
            
        # Show full function code - no truncation
        code_preview = function_code
            
        # Handle preprocessed file content (truncate if it's actually content, not a path)
        preprocessed_info = "None"
        if preprocessed_file_path:
            if len(preprocessed_file_path) > 200:  # Looks like content, not a path
                preprocessed_info = f"Available ({len(preprocessed_file_path)} characters)"
            else:
                preprocessed_info = preprocessed_file_path  # Probably an actual path
            
        content = f"""
{'='*80}
STARTING FUNCTION ANALYSIS
{'='*80}
Function Name: {function_name}
Preprocessed File: {preprocessed_info}
Tools Enabled: {enable_tools}
Function Code Length: {len(function_code)} characters
Total Lines: {len(function_code.split('\\n'))}

FUNCTION CODE PREVIEW:
{'-'*40}
{code_preview}
{'-'*40}
"""
        self._write_log(content)
    
    def log_prompt_sent(self, model: str, messages: List[Dict[str, Any]], 
                       tools: Optional[List[Dict[str, Any]]] = None,
                       token_count: int = 0, context_limit: int = 0, is_follow_up: bool = False):
        """Log the prompt sent to OpenAI"""
        if not self.verbose:
            return
            
        prompt_type = "FOLLOW-UP PROMPT WITH CONVERSATION HISTORY" if is_follow_up else "PROMPT SENT TO LLM"
        content = f"""
{'='*60}
{prompt_type}
{'='*60}
Model: {model}
Token Count: {token_count}
Context Limit: {context_limit}
Tools Available: {len(tools) if tools else 0}
{f"NOTE: This includes complete conversation history with {len(messages)} messages" if is_follow_up else ""}

MESSAGES:
{'-'*30}
"""
        
        for i, message in enumerate(messages):
            content += f"\nMessage {i+1} ({message['role']}):\n"
            msg_content = message.get('content', '')
            # Don't truncate prompt messages - user wants to see full content
            content += f"{msg_content}\n"
        
        if tools:
            content += f"\nAVAILABLE TOOLS:\n{'-'*20}\n"
            for tool in tools:
                tool_info = tool.get('function', {})
                content += f"- {tool_info.get('name', 'Unknown')}: {tool_info.get('description', 'No description')}\n"
                
                # Format parameters nicely
                params = tool_info.get('parameters', {}).get('properties', {})
                if params:
                    content += "  Parameters:\n"
                    for param_name, param_info in params.items():
                        param_type = param_info.get('type', 'unknown')
                        param_desc = param_info.get('description', 'No description')
                        content += f"    - {param_name} ({param_type}): {param_desc}\n"
                content += "\n"
        
        self._write_log(content)
    
    def log_llm_response(self, response_content: str, tool_calls: Optional[List] = None):
        """Log the LLM response"""
        if not self.verbose:
            return
            
        content = f"""
{'='*60}
LLM RESPONSE RECEIVED
{'='*60}
Response Length: {len(response_content)} characters

RESPONSE CONTENT:
{'-'*30}
{response_content}
"""
        
        if tool_calls:
            content += f"\n\nTOOL CALLS MADE:\n{'-'*20}\n"
            for i, tool_call in enumerate(tool_calls):
                func_name = tool_call.function.name
                try:
                    args = json.loads(tool_call.function.arguments)
                    # Apply same content detection to tool call arguments
                    processed_args = {}
                    for key, value in args.items():
                        if isinstance(value, str) and len(value) > 1000:
                            if (value.startswith('#') and '\n' in value and 
                                ('include' in value or 'built-in' in value or 'compiler_types.h' in value)):
                                processed_args[key] = f"[PREPROCESSED_FILE_CONTENT: {len(value)} characters, truncated for readability. Original file: {value.split('\"')[1] if '\"' in value else 'unknown'}]"
                            else:
                                processed_args[key] = value
                        elif key == "file_path" and isinstance(value, str) and value.startswith("[PREPROCESSED_FILE_CONTENT:"):
                            # Don't log file_path if it's already a preprocessed content placeholder
                            processed_args[key] = "[CONTENT_OMITTED_FROM_LOG]"
                        else:
                            processed_args[key] = value
                    formatted_args = json.dumps(processed_args, indent=2)
                except:
                    formatted_args = tool_call.function.arguments
                
                content += f"\nTool Call {i+1}:\n"
                content += f"  Function: {func_name}\n"
                content += f"  ID: {tool_call.id}\n"
                content += f"  Arguments:\n{formatted_args}\n"
        
        self._write_log(content)
    
    def log_tool_execution(self, tool_name: str, arguments: Dict[str, Any], 
                          result_success: bool, result_output: str = None, 
                          error_message: str = None):
        """Log tool execution details"""
        if not self.verbose:
            return
            
        # Apply content detection to arguments - only truncate preprocessed file content
        processed_arguments = {}
        for key, value in arguments.items():
            if isinstance(value, str) and len(value) > 1000:
                # Only truncate if this looks like preprocessed C file content
                if (value.startswith('#') and '\n' in value and 
                    ('include' in value or 'built-in' in value or 'compiler_types.h' in value)):
                    processed_arguments[key] = f"[PREPROCESSED_FILE_CONTENT: {len(value)} characters, truncated for readability. Original file: {value.split('\"')[1] if '\"' in value else 'unknown'}]"
                else:
                    # Keep other content intact - user wants to see tool calls fully
                    processed_arguments[key] = value
            elif key == "file_path" and isinstance(value, str) and value.startswith("[PREPROCESSED_FILE_CONTENT:"):
                # Don't log file_path if it's already a preprocessed content placeholder
                processed_arguments[key] = "[CONTENT_OMITTED_FROM_LOG]"
            else:
                processed_arguments[key] = value

        content = f"""
{'='*60}
TOOL EXECUTION
{'='*60}
Tool Name: {tool_name}
Success: {result_success}

ARGUMENTS:
{'-'*20}
{json.dumps(processed_arguments, indent=2)}

"""
        
        if result_success and result_output:
            # Format struct analyzer output nicely
            if tool_name == "analyze_struct_definition" and result_output:
                content += f"STRUCT ANALYZER OUTPUT:\n{'-'*30}\n"
                # Pretty format C header content
                lines = result_output.split('\n')
                formatted_lines = []
                indent_level = 0
                
                for line in lines:
                    stripped = line.strip()
                    if not stripped:
                        formatted_lines.append("")
                        continue
                        
                    # Handle indentation for C structures
                    if stripped.startswith('}'):
                        indent_level = max(0, indent_level - 1)
                    
                    formatted_lines.append("  " * indent_level + stripped)
                    
                    if stripped.endswith('{') or stripped.startswith('struct ') or stripped.startswith('union '):
                        indent_level += 1
                
                content += '\n'.join(formatted_lines)  # Show full output - no truncation
            else:
                content += f"TOOL OUTPUT:\n{'-'*20}\n{result_output}"
        
        if not result_success and error_message:
            content += f"ERROR MESSAGE:\n{'-'*20}\n{error_message}"
        
        self._write_log(content)
    
    def log_tool_response_to_llm(self, tool_call_id: str, response_content: str):
        """Log the tool response sent back to LLM"""
        if not self.verbose:
            return
            
        # Show full response content - no truncation
        content = f"""
{'='*60}
TOOL RESPONSE SENT TO LLM
{'='*60}
Tool Call ID: {tool_call_id}
Response Length: {len(response_content)} characters

RESPONSE CONTENT:
{'-'*30}
{response_content}
"""
        self._write_log(content)
    
    def log_final_llm_response(self, response_content: str):
        """Log the final LLM response after tool calls"""
        if not self.verbose:
            return
            
        content = f"""
{'='*60}
FINAL LLM RESPONSE (AFTER TOOLS)
{'='*60}
Response Length: {len(response_content)} characters

FINAL RESPONSE:
{'-'*30}
{response_content}
"""
        self._write_log(content)
    
    def log_parsed_results(self, function_name: str, aia_relevant: int, 
                          kd_entry_point: int, message_handling: int, 
                          message_structures: List[str], smids: List[str], reasoning: List[str]):
        """Log the final parsed analysis results"""
        if not self.verbose:
            return
            
        content = f"""
{'='*60}
FINAL PARSED RESULTS
{'='*60}
Function: {function_name}
AIA Relevant Function: {aia_relevant}%
KD Entry Point: {kd_entry_point}%
Message Structure Handling: {message_handling}%
Message Structures Identified: {message_structures if message_structures else 'None'}
SMIDs Identified: {smids if smids else 'None'}

REASONING:
{'-'*20}
"""
        
        for i, reason in enumerate(reasoning):
            content += f"{i+1}. {reason}\n\n"
        
        self._write_log(content)
    
    def log_analysis_complete(self, function_name: str, total_time: float = None):
        """Log completion of function analysis"""
        if not self.verbose:
            return
            
        content = f"""
{'='*80}
ANALYSIS COMPLETE: {function_name}
{'='*80}
"""
        
        if total_time:
            content += f"Total Time: {total_time:.2f} seconds\n"
        
        content += f"Completed at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
        
        self._write_log(content)
    
    def log_session_summary(self, total_functions: int, total_time: float = None):
        """Log session summary"""
        if not self.verbose:
            return
            
        content = f"""

{'='*80}
SESSION SUMMARY
{'='*80}
Total Functions Analyzed: {total_functions}
"""
        
        if total_time:
            content += f"Total Session Time: {total_time:.2f} seconds\n"
        
        content += f"Session End Time: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
        content += f"Log File: {self.log_file}\n"
        content += "="*80 + "\n"
        
        self._write_log(content)
        print(f"[LLM_LOGGER] Session complete. Full log saved to: {self.log_file}")


# Global logger instance
_logger_instance = None

def get_logger(verbose: bool = False, custom_log_file: Optional[str] = None) -> LLMLogger:
    """Get the global logger instance"""
    global _logger_instance
    
    # Import enhanced logger for detailed verbose logging
    try:
        from .llm_logger_enhanced import get_enhanced_logger
        if verbose:
            # Use enhanced logger for verbose mode with colors and detailed formatting
            return get_enhanced_logger(verbose=verbose, custom_log_file=custom_log_file)
    except ImportError:
        pass
    
    # Fallback to original logger
    if (_logger_instance is None or 
        _logger_instance.verbose != verbose or 
        _logger_instance.custom_log_file != custom_log_file):
        _logger_instance = LLMLogger(verbose=verbose, custom_log_file=custom_log_file)
    return _logger_instance
