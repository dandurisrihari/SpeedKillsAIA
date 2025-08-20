#!/usr/bin/env python3
"""
Enhanced LLM Analysis Logger - Comprehensive logging for LLM interactions with colors and detailed formatting
"""

import os
import json
from datetime import datetime
from pathlib import Path
from typing import Dict, Any, List, Optional


class ColorCodes:
    """ANSI color codes for terminal and log file highlighting"""
    RESET = '\033[0m'
    BOLD = '\033[1m'
    
    # Standard colors
    RED = '\033[31m'
    GREEN = '\033[32m'
    YELLOW = '\033[33m'
    BLUE = '\033[34m'
    MAGENTA = '\033[35m'
    CYAN = '\033[36m'
    WHITE = '\033[37m'
    
    # Bright colors
    BRIGHT_RED = '\033[91m'
    BRIGHT_GREEN = '\033[92m'
    BRIGHT_YELLOW = '\033[93m'
    BRIGHT_BLUE = '\033[94m'
    BRIGHT_MAGENTA = '\033[95m'
    BRIGHT_CYAN = '\033[96m'
    
    # Background colors
    BG_RED = '\033[41m'
    BG_GREEN = '\033[42m'
    BG_YELLOW = '\033[43m'
    BG_BLUE = '\033[44m'


class EnhancedLLMLogger:
    """Enhanced logger for comprehensive LLM analysis interactions with colors and detailed formatting"""
    
    def __init__(self, verbose: bool = False, log_dir: str = "logs/llm_analysis", custom_log_file: Optional[str] = None):
        self.verbose = verbose
        self.log_dir = Path(log_dir)
        self.log_file = None
        self.session_id = None
        self.custom_log_file = custom_log_file
        self.function_counter = 0  # Track number of functions analyzed
        
        if self.verbose:
            self._setup_logging()
    
    def _strip_colors(self, text: str) -> str:
        """Remove ANSI color codes from text for clean file output"""
        import re
        # Remove ANSI escape sequences
        ansi_escape = re.compile(r'\x1B(?:[@-Z\\-_]|\[[0-?]*[ -/]*[@-~])')
        return ansi_escape.sub('', text)
    
    def _colorize(self, text: str, color_code: str) -> str:
        """Add color codes to text - will be stripped for file output"""
        return f"{color_code}{text}{ColorCodes.RESET}"
    
    def _error_highlight(self, text: str) -> str:
        """Highlight error text - clean version for file"""
        return f"ERROR: {text}"
    
    def _warning_highlight(self, text: str) -> str:
        """Highlight warning text - clean version for file"""
        return f"WARNING: {text}"
    
    def _success_highlight(self, text: str) -> str:
        """Highlight success text - clean version for file"""
        return f"SUCCESS: {text}"
    
    def _info_highlight(self, text: str) -> str:
        """Highlight info text - clean version for file"""
        return f"INFO: {text}"
    
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
        """Write content to log file with colors stripped"""
        if not self.verbose or not self.log_file:
            return
            
        timestamp = datetime.now().strftime("%H:%M:%S.%f")[:-3]
        # Strip color codes for clean file output
        clean_content = self._strip_colors(content)
        
        with open(self.log_file, 'a') as f:
            f.write(f"[{timestamp}] {clean_content}\n")
    
    def log_function_analysis_start(self, function_name: str, function_code: str, 
                                  preprocessed_file_path: Optional[str] = None,
                                  enable_tools: bool = False):
        """Log the start of function analysis"""
        if not self.verbose:
            return
        
        self.function_counter += 1
        
        # Handle preprocessed file content (truncate if it's actually content, not a path)
        preprocessed_info = "None"
        if preprocessed_file_path:
            if len(preprocessed_file_path) > 200:  # Looks like content, not a path
                preprocessed_info = f"Available ({len(preprocessed_file_path)} characters)"
            else:
                preprocessed_info = preprocessed_file_path  # Probably an actual path
        
        # Create detailed function analysis start log with clean separators
        content = f"""
################################################################################
FUNCTION ANALYSIS START - #{self.function_counter}
################################################################################

{self._info_highlight('ANALYSIS DETAILS')}
==================================================
Function Name: {function_name}
Preprocessed File: {preprocessed_info}
Tools Enabled: {enable_tools}
Function Code Length: {len(function_code)} characters
Total Lines: {len(function_code.split('\\n'))}
Analysis Start Time: {datetime.now().strftime('%H:%M:%S.%f')[:-3]}

{self._info_highlight('FUNCTION CODE TO ANALYZE')}
------------------------------------------------------------
{function_code}
------------------------------------------------------------

{self._info_highlight('STARTING LLM ANALYSIS PROCESS...')}
"""
        self._write_log(content)
    
    def log_prompt_sent(self, model: str, messages: List[Dict[str, Any]], 
                       tools: Optional[List[Dict[str, Any]]] = None,
                       token_count: int = 0, context_limit: int = 0, is_follow_up: bool = False):
        """Log the prompt sent to OpenAI"""
        if not self.verbose:
            return
        
        prompt_type = "FOLLOW-UP PROMPT WITH CONVERSATION HISTORY" if is_follow_up else "PROMPT SENT TO LLM"
        usage_percentage = (token_count / context_limit * 100) if context_limit > 0 else 0
        
        # Determine token usage color
        if usage_percentage > 90:
            token_color = ColorCodes.BRIGHT_RED
        elif usage_percentage > 70:
            token_color = ColorCodes.BRIGHT_YELLOW
        else:
            token_color = ColorCodes.BRIGHT_GREEN
        
        content = f"""
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
{prompt_type}
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

{self._info_highlight('REQUEST DETAILS')}
Model: {model}
Token Count: {token_count}
Context Limit: {context_limit}
Usage: {usage_percentage:.1f}%
Tools Available: {len(tools) if tools else 0}
{f"{self._info_highlight('NOTE')}: This includes complete conversation history with {len(messages)} messages" if is_follow_up else ""}

{self._info_highlight('MESSAGES BEING SENT')}
----------------------------------------
"""
        
        for i, message in enumerate(messages):
            role = message['role']
            content += f"\nMessage {i+1} ({role}):\n"
            msg_content = message.get('content', '')
            # Don't truncate prompt messages - user wants to see full content
            content += f"{msg_content}\n"
        
        if tools:
            content += f"\n{self._info_highlight('AVAILABLE TOOLS')}\n------------------------------\n"
            for tool in tools:
                tool_info = tool.get('function', {})
                tool_name = tool_info.get('name', 'Unknown')
                tool_desc = tool_info.get('description', 'No description')
                content += f"• {tool_name}: {tool_desc}\n"
                
                # Format parameters nicely
                params = tool_info.get('parameters', {}).get('properties', {})
                if params:
                    content += f"  Parameters:\n"
                    for param_name, param_info in params.items():
                        param_type = param_info.get('type', 'unknown')
                        param_desc = param_info.get('description', 'No description')
                        content += f"    - {param_name} ({param_type}): {param_desc}\n"
                content += "\n"
        
        content += f"\n{self._info_highlight('SENDING REQUEST TO OPENAI...')}\n"
        self._write_log(content)
    
    def log_llm_response(self, response_content: str, tool_calls: Optional[List] = None):
        """Log the LLM response"""
        if not self.verbose:
            return
        
        response_timestamp = datetime.now().strftime('%H:%M:%S.%f')[:-3]
        content = f"""
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
LLM RESPONSE RECEIVED
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

{self._success_highlight('RESPONSE DETAILS')}
Response Length: {len(response_content)} characters
Response Time: {response_timestamp}

{self._info_highlight('LLM RESPONSE CONTENT')}
----------------------------------------
{response_content}
----------------------------------------
"""
        
        if tool_calls:
            content += f"\n{self._warning_highlight('TOOL CALLS REQUESTED BY LLM')}\n------------------------------\n"
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
                content += f"  Call ID: {tool_call.id}\n"
                content += f"  Arguments:\n{formatted_args}\n"
            
            content += f"\n{self._info_highlight('EXECUTING TOOL CALLS...')}\n"
        else:
            content += f"\n{self._success_highlight('NO TOOL CALLS NEEDED - ANALYSIS COMPLETE')}\n"
        
        self._write_log(content)
    
    def log_tool_execution(self, tool_name: str, arguments: Dict[str, Any], 
                          result_success: bool, result_output: str = None, 
                          error_message: str = None):
        """Log tool execution details"""
        if not self.verbose:
            return
        
        execution_timestamp = datetime.now().strftime('%H:%M:%S.%f')[:-3]
        status_text = "SUCCESS" if result_success else "FAILED"
        
        content = f"""
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TOOL EXECUTION - {status_text}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Tool Name: {tool_name}
Execution Time: {execution_timestamp}
Status: {status_text}

INFO: TOOL ARGUMENTS
{json.dumps(arguments, indent=2)}
"""
        
        if result_success and result_output:
            content += f"""
SUCCESS: TOOL OUTPUT
----------------------------------------
{result_output}
----------------------------------------
"""
        elif error_message:
            content += f"""
ERROR: TOOL EXECUTION FAILED
----------------------------------------
{error_message}
----------------------------------------
"""
        
        self._write_log(content)
    
    def log_final_llm_response(self, response_content: str):
        """Log the final LLM response after tool executions"""
        if not self.verbose:
            return
        
        final_timestamp = datetime.now().strftime('%H:%M:%S.%f')[:-3]
        content = f"""
************************************************************
FINAL LLM RESPONSE (AFTER TOOLS)
************************************************************

{self._success_highlight('ENHANCED ANALYSIS COMPLETE')}
Response Length: {len(response_content)} characters
Final Response Time: {final_timestamp}

{self._info_highlight('COMPREHENSIVE ANALYSIS RESULT')}
--------------------------------------------------
{response_content}
--------------------------------------------------
"""
        self._write_log(content)
    
    def log_tool_response_to_llm(self, tool_call_id: str, response_content: str):
        """Log tool response being sent back to LLM"""
        if not self.verbose:
            return
        
        response_timestamp = datetime.now().strftime('%H:%M:%S.%f')[:-3]
        content = f"""
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
TOOL RESPONSE TO LLM
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Tool Call ID: {tool_call_id}
Response Time: {response_timestamp}
Response Length: {len(response_content)} characters

INFO: TOOL RESPONSE CONTENT
----------------------------------------
{response_content}
----------------------------------------
"""
        self._write_log(content)
    
    def log_parsed_results(self, function_name: str, aia_relevant: int, 
                          kd_entry_point: int, message_handling: int, 
                          message_structures: List[str], smids: List[str], reasoning: List[str]):
        """Log the final parsed analysis results"""
        if not self.verbose:
            return
        
        # Color code scores based on values
        def score_color(score):
            if score >= 80:
                return ColorCodes.BRIGHT_GREEN
            elif score >= 60:
                return ColorCodes.BRIGHT_YELLOW
            else:
                return ColorCodes.BRIGHT_RED
        
        content = f"""
============================================================
FINAL PARSED RESULTS
============================================================

{self._success_highlight('ANALYSIS SCORES')}
Function: {function_name}
AIA Relevant Function: {aia_relevant}%
KD Entry Point: {kd_entry_point}%
Message Structure Handling: {message_handling}%

{self._info_highlight('IDENTIFIED STRUCTURES')}
Message Structures: {message_structures if message_structures else 'None'}
SMIDs Identified: {smids if smids else 'None'}

{self._info_highlight('REASONING ANALYSIS')}
------------------------------
"""
        
        for i, reason in enumerate(reasoning):
            content += f"{i+1}. {reason}\n\n"
        
        self._write_log(content)
    
    def log_error(self, error_type: str, error_message: str, context: str = None):
        """Log errors with highlighting"""
        if not self.verbose:
            return
        
        error_timestamp = datetime.now().strftime('%H:%M:%S.%f')[:-3]
        content = f"""
{self._colorize('!' * 60, ColorCodes.BRIGHT_RED)}
{self._error_highlight(f'{error_type.upper()}')}
{self._colorize('!' * 60, ColorCodes.BRIGHT_RED)}

Error Time: {self._colorize(error_timestamp, ColorCodes.BRIGHT_CYAN)}
Error Type: {self._colorize(error_type, ColorCodes.BRIGHT_RED + ColorCodes.BOLD)}

{self._error_highlight('ERROR MESSAGE')}
{self._colorize('-' * 40, ColorCodes.RED)}
{error_message}
{self._colorize('-' * 40, ColorCodes.RED)}
"""
        
        if context:
            content += f"""
{self._info_highlight('ERROR CONTEXT')}
{self._colorize('-' * 40, ColorCodes.YELLOW)}
{context}
{self._colorize('-' * 40, ColorCodes.YELLOW)}
"""
        
        self._write_log(content)
    
    def log_analysis_complete(self, function_name: str, total_time: float = None):
        """Log completion of function analysis"""
        if not self.verbose:
            return
        
        content = f"""
################################################################################
ANALYSIS COMPLETE: {function_name}
################################################################################
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

================================================================================
SESSION SUMMARY
================================================================================
Total Functions Analyzed: {total_functions}
"""
        
        if total_time:
            content += f"Total Session Time: {total_time:.2f} seconds\n"
        
        content += f"Session End Time: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
        content += f"Log File: {self.log_file}\n"
        content += "="*80 + "\n"
        
        self._write_log(content)
        print(f"[LLM_LOGGER] Session complete. Full log saved to: {self.log_file}")


# Global logger instance for enhanced logging
_enhanced_logger_instance = None

def get_enhanced_logger(verbose: bool = False, custom_log_file: Optional[str] = None) -> EnhancedLLMLogger:
    """Get the global enhanced logger instance"""
    global _enhanced_logger_instance
    if (_enhanced_logger_instance is None or 
        _enhanced_logger_instance.verbose != verbose or 
        _enhanced_logger_instance.custom_log_file != custom_log_file):
        _enhanced_logger_instance = EnhancedLLMLogger(verbose=verbose, custom_log_file=custom_log_file)
    return _enhanced_logger_instance
