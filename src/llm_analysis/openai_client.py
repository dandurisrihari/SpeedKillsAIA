#!/usr/bin/env python3
"""
OpenAI API client for LLM analysis
"""

import os
import json
import logging
from typing import Optional, List, Dict, Any
import openai
import tiktoken
from dotenv import load_dotenv
from .tools import StructAnalyzerTool

logger = logging.getLogger(__name__)

from .models import AnalysisResult
from .tools import ToolManager
from .prompts import create_analysis_prompt
from .response_parser import ResponseParser
from .llm_logger import get_logger


class OpenAIClient:
    """Client for OpenAI API interactions with function calling support"""
    
    def __init__(self, model: str = "gpt-4o-mini", verbose: bool = False, enable_tools: bool = True, logger=None):
        self.model = model
        self.verbose = verbose
        self.enable_tools = enable_tools
        self.max_tokens = 800  # Reduced max tokens to leave room for context
        self.temperature = 0.7  # Default temperature
        self._load_environment()
        self._setup_client()
        self._setup_tokenizer()
        
        # Initialize tool manager if tools are enabled
        if self.enable_tools:
            self.tool_manager = ToolManager(verbose=verbose)
        else:
            self.tool_manager = None
            
        # Initialize response parser
        self.response_parser = ResponseParser(verbose=verbose)
        
        # Use provided logger or create a new one
        if logger:
            self.logger = logger
        else:
            self.logger = get_logger(verbose=verbose)
    
    def _load_environment(self):
        """Load environment variables from .env file"""
        load_dotenv()
        self.api_key = os.getenv('OPENAI_API_KEY')
        if not self.api_key:
            raise ValueError("OPENAI_API_KEY not found in environment variables. Please create a .env file with your OpenAI API key.")
    
    def _setup_client(self):
        """Setup OpenAI client"""
        openai.api_key = self.api_key
        self.client = openai.OpenAI(api_key=self.api_key)
    
    def _setup_tokenizer(self):
        """Setup tiktoken encoder for accurate token counting"""
        try:
            self.tokenizer = tiktoken.encoding_for_model(self.model)
            self._log_verbose(f"Initialized tiktoken encoder for model: {self.model}")
        except KeyError:
            # Fallback to cl100k_base encoding for newer models
            self.tokenizer = tiktoken.get_encoding("cl100k_base")
            self._log_verbose(f"Using fallback cl100k_base encoding for model: {self.model}")
    
    def _get_model_context_size(self) -> int:
        """Get the context size for the current model"""
        model_context_sizes = {
            "gpt-4o-mini": 128000,
            "gpt-4o": 128000,
            "gpt-4-turbo": 128000,
            "gpt-4": 8192,  # Standard context window; update if using 32k variant
            "gpt-4-32k": 32768,
            "gpt-3.5-turbo": 16385,
            "gpt-3.5-turbo-16k": 16385,
        }
        # Default to a conservative size if model not found
        return model_context_sizes.get(self.model, 8192)
    
    def _log_verbose(self, message: str):
        """Log verbose messages if verbose mode is enabled"""
        if self.verbose:
            print(f"[VERBOSE] {message}")
    
    def _estimate_tokens(self, text: str) -> int:
        """
        Accurate token count using tiktoken for the current model.
        """
        try:
            return len(self.tokenizer.encode(text))
        except Exception as e:
            self._log_verbose(f"Error in token counting: {e}, falling back to character estimation")
            # Fallback to rough estimation (4 characters per token)
            return len(text) // 4
    
    def _truncate_function_code(self, function_code: str, max_chars: int = 6000) -> str:
        """
        Truncate function code if it's too long to avoid token limits.
        
        Args:
            function_code: The function code to potentially truncate
            max_chars: Maximum number of characters to allow
            
        Returns:
            Truncated function code with a note if truncation occurred
        """
        if len(function_code) <= max_chars:
            return function_code
        
        # Truncate and add a note
        truncated = function_code[:max_chars]
        # Try to truncate at a line boundary
        last_newline = truncated.rfind('\n')
        if last_newline > max_chars * 0.8:  # If we can get 80% and still be at a line boundary
            truncated = truncated[:last_newline]
        
        truncated += f"\n\n/* NOTE: Function truncated - original was {len(function_code)} characters, showing first {len(truncated)} characters */"
        
        if self.verbose:
            print(f"[VERBOSE] Truncated function code from {len(function_code)} to {len(truncated)} characters")
        
        return truncated
    
    def _get_analysis_instructions(self) -> str:
        """Get the analysis instructions for the system prompt"""
        return """Analyze the given kernel source code and assign confidence scores (0–100%) across three categories and identify message structures and structure fields of interest.

1. AIARelevantFunction: The given function or code block is involved in sharing shared memory (SMem) with an AI Accelerator (AIA). Such functions often: Pin user pages to memory (get_user_pages, pin_user_pages), Iterate over scatter gather userpages, Obtain physical or DMA addresses of user pages. Program these addresses into: AIA device page tables (for memory mapping inside the AIA), AIA MMIO (Memory Mapped I/O) registers to notify AIA of accessible memory, Manage DMA buffers for communication between CPU and AIA. These functions are typically critical for giving the AIA access to host memory regions. 

2. Relevant KD Entry Point: The code block represents an entry point from user space to kernel, commonly through ioctl() functions. These:Act as dispatch points in a switch-case or if/else over ioctl codes, Handle user commands and trigger deeper kernel logic leading to AIARelevantFunction Identify which ioctl code is being handled (e.g., IOCTL_AIA_ALLOC_SMEM, IOCTL_AIA_SEND_MSG) include this in your reasoning. Basically this is entry point which leads to AIARelevantFunction execution.

3. Message Structure Handling: The code block handles message structures exchanged between user space and kernel, These contain copy_from_user() / copy_to_user() calls and passes structures involving Shared Memory Identifiers (SMIDs). SMID (Shared Memory Identifier) are a way of kernel letting userspace know it's user virtual address pages are accessed by AIA using this SMID These are usually part of the structure that is passed in copy_from_user() / copy_to_user(). In your reasoning you need to mention what structs are used as arguments in copy_from_user() / copy_to_user() calls, analyze the feilds in the structures that qualify under SMID's. Some examples of SMID (shared memory identifier) are: Device virtual address, physical address, DMA address, AIA virtualaddresses, file descriptors(fd). Metadata like Memory size, flags, or similar ranges, helps you to identify the structure of interest. You need to identify SMID's and also message structure. Its ok if there are false positives, try to be more inclusive in your analysis for both Message_Structures and SMID's identification.

Please respond in EXACTLY this format:
Function/Code_Block_Name: <function_name_or_description>
AIARelevantFunction: <0–100>
Relevant_KD_Entry_Point: <0–100>
Message_Structure_Handling: <0–100>
    Message_Structures identified: <list any message structures found, or "None identified">
    SMID's identified: <list any SMIDs found, or "None identified">

Reasoning:
- Describe the rationale behind each confidence score
- Reference specific APIs used (e.g., get_user_pages, dma_map_page, copy_from_user)
- Mention any relevant ioctl code, e.g., IOCTL_AIA_ALLOC_SMEM
- Mention any relevant message structures and its fields (e.g., smid, phys_addr) Which can be potential SMID's"""

    def _create_user_message(self, function_code: str) -> str:
        """Create the user message with function code to analyze"""
        return f"""Function Code to analyze:
```c
{function_code}
```"""
    
    def analyze_function(self, function_code: str, function_name: str, 
                       preprocessed_file_path: Optional[str] = None,
                       enable_tools: bool = False) -> AnalysisResult:
        """
        Analyze a function using OpenAI's API with optional tool calling support.
        
        Args:
            function_code: The function code to analyze
            function_name: Name of the function
            preprocessed_file_path: Path to preprocessed file for struct analysis
            enable_tools: Whether to enable tool calling functionality
            
        Returns:
            AnalysisResult object
        """
        import time
        start_time = time.time()
        
        # Log analysis start
        self.logger.log_function_analysis_start(
            function_name=function_name,
            function_code=function_code,
            preprocessed_file_path=preprocessed_file_path,
            enable_tools=enable_tools
        )
        
        try:
            # Get dynamic context size for the model
            model_context_limit = self._get_model_context_size()
            
            # Reserve tokens for tools, response, and safety margin
            tools_tokens = 300 if enable_tools else 0
            response_tokens = self.max_tokens
            safety_margin = 1000  # Increased safety margin for larger models
            
            # Calculate system message tokens
            system_prompt = self._get_system_prompt()
            system_tokens = self._estimate_tokens(system_prompt)
            
            # Calculate available tokens for function code (accounting for system message)
            available_tokens = model_context_limit - tools_tokens - response_tokens - safety_margin - system_tokens
            available_chars = available_tokens * 3  # More conservative conversion for tiktoken
            
            # Be more generous with truncation for larger context models
            if model_context_limit >= 128000:  # For gpt-4o-mini and similar
                max_chars = min(available_chars, 8000)  # Allow up to 8k characters
            elif model_context_limit >= 16000:  # For gpt-3.5-turbo
                max_chars = min(available_chars, 3000)  # Allow up to 3k characters  
            else:  # For older models
                max_chars = min(available_chars, 2000)  # Stick to 2k characters
            
            self._log_verbose(f"Model: {self.model}, Context limit: {model_context_limit}, Max chars: {max_chars}")
            self._log_verbose(f"System tokens: {system_tokens}, Available tokens for function: {available_tokens}")
            
            # Truncate function code based on available space
            truncated_code = self._truncate_function_code(function_code, max_chars=max_chars)
            
            # Create the conversation with proper system and user messages
            messages = [
                {"role": "system", "content": self._get_system_prompt()},
                {"role": "user", "content": self._create_user_message(truncated_code)}
            ]
            
            # Log token estimation and message content
            if self.verbose:
                total_message_tokens = sum(self._estimate_tokens(msg["content"]) for msg in messages)
                self._log_verbose(f"Model: {self.model}, Context limit: {model_context_limit}")
                self._log_verbose(f"Estimated tokens - Messages: {total_message_tokens}, Tools: {tools_tokens}")
                self._log_verbose(f"Available tokens: {available_tokens}, Max chars: {max_chars}")
                self._log_verbose(f"System message tokens: {self._estimate_tokens(messages[0]['content'])}")
                self._log_verbose(f"User message tokens: {self._estimate_tokens(messages[1]['content'])}")
            
            # Debug: Print the actual messages being sent
            print(f"=== MESSAGES BEING SENT TO OPENAI ===")
            print(f"Model: {self.model}")
            print(f"System message length: {len(messages[0]['content'])} characters")
            print(f"User message length: {len(messages[1]['content'])} characters")
            total_tokens = sum(self._estimate_tokens(msg["content"]) for msg in messages)
            print(f"Total token count: {total_tokens}")
            print(f"Context limit: {model_context_limit} tokens")
            print(f"System message first 500 characters:")
            print(messages[0]['content'][:500])
            print(f"User message first 1000 characters:")
            print(messages[1]['content'][:1000])
            print(f"User message last 500 characters:")
            print(messages[1]['content'][-500:])
            print(f"=== END MESSAGE DEBUG ===")
            
            # Prepare tools if enabled
            tools = None
            if enable_tools and self.tool_manager:
                # Set the preprocessed file path for tool calls
                self.tool_manager.set_preprocessed_file_path(preprocessed_file_path)
                tools = self.tool_manager.get_tool_definitions()
            
            # Log prompt being sent
            total_tokens = sum(self._estimate_tokens(msg["content"]) for msg in messages)
            self.logger.log_prompt_sent(
                model=self.model,
                messages=messages,
                tools=tools,
                token_count=total_tokens,
                context_limit=model_context_limit
            )
            
            # Make the API call
            if tools:
                response = self.client.chat.completions.create(
                    model=self.model,
                    messages=messages,
                    tools=tools,
                    tool_choice="auto",
                    max_tokens=self.max_tokens,
                    temperature=self.temperature
                )
                
                # Log initial LLM response
                self.logger.log_llm_response(
                    response_content=response.choices[0].message.content or "",
                    tool_calls=response.choices[0].message.tool_calls
                )
                
                # Handle tool calls
                if response.choices[0].message.tool_calls:
                    final_messages, final_response = self._handle_function_calls(messages, response)
                    
                    # Log final response after tool calls
                    final_content = final_response.choices[0].message.content
                    self.logger.log_final_llm_response(final_content)
                    
                    # Parse and log results
                    result = self.response_parser.parse_response(final_content, function_name)
                    self._log_parsed_results(result, start_time)
                    return result
                else:
                    # Parse and log results
                    result = self.response_parser.parse_response(response.choices[0].message.content, function_name)
                    self._log_parsed_results(result, start_time)
                    return result
            else:
                response = self.client.chat.completions.create(
                    model=self.model,
                    messages=messages,
                    max_tokens=self.max_tokens,
                    temperature=self.temperature
                )
                
                # Log LLM response
                self.logger.log_llm_response(
                    response_content=response.choices[0].message.content,
                    tool_calls=None
                )
                
                # Parse and log results
                result = self.response_parser.parse_response(response.choices[0].message.content, function_name)
                self._log_parsed_results(result, start_time)
                return result
                
        except Exception as e:
            print(f"Error in analyze_function: {e}")
            print(f"Function: {function_name}")
            
            # Log error
            self.logger.log_analysis_complete(function_name, time.time() - start_time)
            
            # Return default analysis result on error
            return AnalysisResult(
                function_name=function_name,
                aia_relevant_function=0,
                relevant_kd_entry_point=0,
                message_structure_handling=0,
                message_structures_identified=[],
                smids_identified=[],
                reasoning=[]
            )
        finally:
            # Clean up any temporary files created during this function analysis
            if self.tool_manager:
                self.tool_manager.cleanup_temp_file()
    
    def _log_parsed_results(self, result: AnalysisResult, start_time: float):
        """Log the parsed results and completion"""
        import time
        
        self.logger.log_parsed_results(
            function_name=result.function_name,
            aia_relevant=result.aia_relevant_function,
            kd_entry_point=result.relevant_kd_entry_point,
            message_handling=result.message_structure_handling,
            message_structures=result.message_structures_identified,
            smids=result.smids_identified,
            reasoning=result.reasoning
        )
        
        elapsed_time = time.time() - start_time
        self.logger.log_analysis_complete(result.function_name, elapsed_time)
    
    def _get_system_prompt(self) -> str:
        """Get the system prompt with tool information and analysis instructions"""
        base_prompt = "You are an expert Linux Kernel Driver developer specializing in AI Accelerator integration."
        
        # Add analysis instructions
        analysis_instructions = self._get_analysis_instructions()
        
        if self.enable_tools and self.tool_manager:
            tool_prompt = """

You have access to tools that can help you analyze code more effectively:

1. analyze_struct_definition: Use this tool when you encounter struct/union/enum/typedef types that you need to understand better. 

IMPORTANT: You MUST provide struct_name when calling this tool.

Usage examples:
- {"struct_name": "gcsHAL_INTERFACE"} - Analyze a specific structure
- {"struct_name": "gasket_dev"} - Analyze with limited depth for focus

Required parameters:
- struct_name: The name of the structure you want to analyze (REQUIRED)

This is especially useful when you see struct types like gcsHAL_INTERFACE, gasket_dev, etc. and need to understand their fields for better SMID identification and message structure analysis."""
            
            return f"{base_prompt}\n\n{analysis_instructions}{tool_prompt}"
        
        return f"{base_prompt}\n\n{analysis_instructions}"
    
    def _handle_function_calls(self, messages: List[Dict[str, Any]], response) -> tuple:
        """Handle function calls and return updated messages and final response"""
        # Add the assistant's message with function calls to conversation
        assistant_message = {
            "role": "assistant",
            "content": response.choices[0].message.content,
            "tool_calls": []
        }
        
        # Build the assistant message with all tool calls
        for tool_call in response.choices[0].message.tool_calls:
            assistant_message["tool_calls"].append({
                "id": tool_call.id,
                "type": "function",
                "function": {
                    "name": tool_call.function.name,
                    "arguments": tool_call.function.arguments
                }
            })
        
        # Add assistant message once with all tool calls
        messages.append(assistant_message)
        
        # Process each tool call and add tool response messages
        for tool_call in response.choices[0].message.tool_calls:
            # Execute the function
            function_name = tool_call.function.name
            try:
                arguments = json.loads(tool_call.function.arguments)
                self._log_verbose(f"Executing function: {function_name} with args: {arguments}")
                
                # Log tool execution start
                self.logger.log_tool_execution(
                    tool_name=function_name,
                    arguments=arguments,
                    result_success=False  # Will update after execution
                )
                
                result = self.tool_manager.call_tool(function_name, arguments)
                
                if result.success:
                    function_result = {"result": result.output}
                    self._log_verbose(f"Function executed successfully")
                    
                    # Log successful tool execution
                    self.logger.log_tool_execution(
                        tool_name=function_name,
                        arguments=arguments,
                        result_success=True,
                        result_output=result.output
                    )
                else:
                    function_result = {"error": result.error_message}
                    self._log_verbose(f"Function execution failed: {result.error_message}")
                    
                    # Log failed tool execution
                    self.logger.log_tool_execution(
                        tool_name=function_name,
                        arguments=arguments,
                        result_success=False,
                        error_message=result.error_message
                    )
                
            except json.JSONDecodeError as e:
                function_result = {"error": f"Invalid JSON arguments: {e}"}
                self._log_verbose(f"JSON decode error: {e}")
                
                # Log JSON decode error
                self.logger.log_tool_execution(
                    tool_name=function_name,
                    arguments={"error": "JSON decode failed"},
                    result_success=False,
                    error_message=f"Invalid JSON arguments: {e}"
                )
            except Exception as e:
                function_result = {"error": f"Function execution error: {e}"}
                self._log_verbose(f"Function execution error: {e}")
                
                # Log execution error
                self.logger.log_tool_execution(
                    tool_name=function_name,
                    arguments={"error": "Execution failed"},
                    result_success=False,
                    error_message=f"Function execution error: {e}"
                )
            
            # Log tool response being sent back to LLM
            response_content = json.dumps(function_result)
            self.logger.log_tool_response_to_llm(tool_call.id, response_content)
            
            # Add function result to messages
            messages.append({
                "role": "tool",
                "tool_call_id": tool_call.id,
                "content": response_content
            })
        
        # Make follow-up request with function results
        # Log the complete conversation history being sent for follow-up
        follow_up_tokens = 0
        for msg in messages:
            content = msg.get("content") or ""
            if isinstance(content, str):
                follow_up_tokens += self._estimate_tokens(content)
            # Add estimation for tool calls if present
            if "tool_calls" in msg:
                follow_up_tokens += 100  # Rough estimate for tool call overhead
                
        self.logger.log_prompt_sent(
            model=self.model,
            messages=messages,
            tools=None,  # No tools needed in follow-up
            token_count=follow_up_tokens,
            context_limit=self._get_model_context_size(),
            is_follow_up=True
        )
        
        follow_up_response = self.client.chat.completions.create(
            model=self.model,
            messages=messages,
            max_tokens=2000,
            temperature=0.1
        )
        
        return messages, follow_up_response
