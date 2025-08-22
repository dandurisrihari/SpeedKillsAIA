#!/usr/bin/env python3
"""
OpenAI API client for LLM analysis
"""

import os
import json
import time
import logging
from typing import Optional, List, Dict, Any
import openai
import tiktoken
from dotenv import load_dotenv
from .tools import StructAnalyzerTool

logger = logging.getLogger(__name__)

from .models import AnalysisResult
from .tools import ToolManager
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
        self.default_struct_depth = 5  # Default depth for struct analysis
        self._load_environment()
        self._setup_client()
        self._setup_tokenizer()
        
        # Initialize tool manager if tools are enabled
        if self.enable_tools:
            self.tool_manager = ToolManager(verbose=verbose, default_depth=self.default_struct_depth)
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

2. Relevant KD Entry Point: The code block represents an entry point from user space to kernel, commonly through ioctl() or device probe functions. These:Act as dispatch points in a switch-case or if/else over ioctl codes, Handle user commands and trigger deeper kernel logic leading to execution of AIARelevantFunction. Identify which ioctl code is being handled (e.g., IOCTL_AIA_ALLOC_MEM, IOCTL_AIA_GET_PHYSICAL_ADDRESS, IOCTL_AIA_COPY_MEM, IOCTL_AIA_USER_SHARED_MEM). You need to include this ioctl command code in your reasoning. Basically this is entry point which leads to AIARelevantFunction execution.

3. Message Structure Handling: The code block handles message structures exchanged between user space and kernel, These contain copy_from_user() / copy_to_user() calls and passes structures involving Shared Memory Identifiers (SMIDs). SMID (Shared Memory Identifier) are a way of kernel letting userspace know it's user virtual address pages are accessed by AIA using this SMID These are usually part of the structure that is passed in copy_from_user() / copy_to_user(). In your reasoning you need to mention what structs are used as arguments in copy_from_user() / copy_to_user() calls, analyze the feilds in the structures that qualify under SMID's. Some examples of SMID (shared memory identifier) are: Device virtual address, physical address, DMA address, AIA virtualaddresses, file descriptors(fd). Metadata like Memory size, flags, or similar ranges, helps you to identify the structure of interest. While Metadata are not SMID's they help you to identify Message_Structures. You need to identify SMID's and also message structure. Its ok if there are few false positives, try to be reasonably inclusive in your analysis for both Message_Structures and SMID's identification.

Please respond in EXACTLY this format:
Function/Code_Block_Name: <function_name_or_description>
AIARelevantFunction: <0–100>
Relevant_KD_Entry_Point: <0–100>
    IOCTL CODE: <ioctl_code_if_applicable>
Message_Structure_Handling: <0–100>
    Message_Structures identified: <list any message structures found, or "None identified">
    SMID's identified: <list any SMIDs found, or "None identified">

Reasoning:
- Describe the rationale behind each confidence score
- Reference specific APIs used (e.g., get_user_pages, dma_map_page, copy_from_user)
- Mention any relevant ioctl code, e.g., IOCTL_AIA_ALLOC_SMEM, IOCTL_AIA_GET_PHYSICAL_ADDRESS, IOCTL_AIA_COPY_MEM, IOCTL_AIA_USER_SHARED_MEM etc
- Mention any relevant message structures and its fields (e.g., struct memory_descriptor, dev address, phys_addr) Which can be potential SMID's"""

    def _create_user_message(self, function_code: str) -> str:
        """Create the user message with function code to analyze"""
        return f"""Function Code to analyze:
```c
{function_code}
```"""
    
    def _get_system_prompt(self) -> str:
        """Get the system prompt with tool information and analysis instructions"""
        base_prompt = "You are an expert Linux Kernel Driver developer and also have security specializiation in AI Accelerator integration."
        
        # Add analysis instructions
        analysis_instructions = self._get_analysis_instructions()
        
        if self.enable_tools and self.tool_manager:
            tool_prompt = f"""

You have access to tools that can help you analyze code more effectively:

1. analyze_struct_definition: Use this tool to analyze struct/union/enum/typedef types encountered in the code.

IMPORTANT ANALYSIS WORKFLOW:
- **PROACTIVELY REQUEST STRUCTURE DEFINITIONS**: For EVERY struct, union, enum, or typedef you encounter in the function code, if you think you need its definition, you MUST call analyze_struct_definition to get its full definition.
- **DEPTH STRATEGY**: 
  * Use depth={self.default_struct_depth} as default (good balance of detail vs. readability and context size)
  * Use depth=0 for CRITICAL structures when you need COMPLETE nested definitions of all fields till basic primitive types (int char etc.)
  * Use depth=1-2 for simple structures or when you only need immediate fields
  * For SMID analysis, prefer higher depth (0 or {self.default_struct_depth}) to see all nested address/handle fields
- **COMPREHENSIVE ANALYSIS**: Before providing your analysis scores, ensure you have requested definitions for ALL structures mentioned in:
  - Function parameters
  - Local variables
  - copy_from_user/copy_to_user calls
  - Any structure fields accessed in the code
  - Return types
  - Cast operations

TOOL USAGE EXAMPLES:
- {{"struct_name": "gcsHAL_INTERFACE", "depth": {self.default_struct_depth}}} - Analyze with default depth ({self.default_struct_depth} levels)
- {{"struct_name": "gasket_dev", "depth": 0}} - Get COMPLETE structure definition (depth=0 means unlimited, shows ALL nested structures)
- {{"struct_name": "dma_buf", "depth": 3}} - Analyze with specific depth (3 levels of nested structures)
- {{"struct_name": "user_buffer", "depth": 1}} - Shallow analysis (only immediate fields, no nested expansion)

DEPTH PARAMETER EXPLANATION:
- depth=0: UNLIMITED depth - expands ALL nested structures completely (use for comprehensive analysis)
- depth=1: Only immediate fields (no nested struct expansion)
- depth=2-5: Specific levels of nesting (depth=5 is default, good balance)
- Higher depth values show more nested structure details but may be verbose

ANALYSIS APPROACH:
1. First pass: Identify ALL structures, unions, enums, and typedefs in the code
2. Request definitions for each identified type using analyze_struct_definition
3. With complete structure information, analyze for:
   - AIARelevantFunction patterns
   - KD Entry Points
   - Message Structure Handling and SMID identification
4. Provide comprehensive analysis based on both the function code AND the structure definitions

Remember: The quality of your analysis depends on understanding the complete structure definitions. Always request them BEFORE scoring."""
            
            return f"{base_prompt}\n\n{analysis_instructions}{tool_prompt}"
        
        return f"{base_prompt}\n\n{analysis_instructions}"
    
    def _handle_function_calls(self, messages: List[Dict[str, Any]], response) -> str:
        """Handle function calls and return final response content"""
        # Add assistant message with tool calls
        assistant_message = {
            "role": "assistant",
            "content": response.choices[0].message.content,
            "tool_calls": response.choices[0].message.tool_calls
        }
        messages.append(assistant_message)
        
        accumulated_structure_info = []  # Accumulate all structure definitions
        
        # Process each tool call and add tool response messages
        for tool_call in response.choices[0].message.tool_calls:
            # Execute the function
            function_name = tool_call.function.name
            try:
                arguments = json.loads(tool_call.function.arguments)
                
                # Set default depth if not provided
                if function_name == "analyze_struct_definition" and "depth" not in arguments:
                    arguments["depth"] = self.default_struct_depth
                    self._log_verbose(f"Setting default depth={self.default_struct_depth} for struct analysis")
                
                self._log_verbose(f"Executing function: {function_name} with args: {arguments}")
                
                result = self.tool_manager.call_tool(function_name, arguments)
                
                if result.success:
                    # Log successful tool execution
                    if hasattr(self.logger, 'log_tool_execution'):
                        self.logger.log_tool_execution(
                            tool_name=function_name,
                            arguments=arguments,
                            result_success=True,
                            result_output=result.output
                        )
                    
                    # Accumulate structure information for final analysis
                    struct_name = arguments.get('struct_name', 'unknown')
                    depth = arguments.get('depth', self.default_struct_depth)
                    structure_info = f"\n=== Structure Definition: {struct_name} (depth={depth}) ===\n{result.output}\n"
                    accumulated_structure_info.append(structure_info)
                    
                    response_content = f"Successfully analyzed structure {struct_name} with depth {depth}. Definition included in analysis context."
                    self._log_verbose(f"Function executed successfully, accumulated structure info for {struct_name}")
                else:
                    # Log failed tool execution with detailed error
                    if hasattr(self.logger, 'log_tool_execution'):
                        self.logger.log_tool_execution(
                            tool_name=function_name,
                            arguments=arguments,
                            result_success=False,
                            error_message=result.error_message
                        )
                    
                    # Include failed analysis info for LLM context
                    struct_name = arguments.get('struct_name', 'unknown')
                    failed_info = f"\n=== Failed Structure Analysis: {struct_name} ===\nError: {result.error_message}\nNote: Continue analysis without this structure definition.\n"
                    accumulated_structure_info.append(failed_info)
                    
                    response_content = f"Failed to analyze structure: {result.error_message}"
                    self._log_verbose(f"Function execution failed: {result.error_message}")
                
            except Exception as e:
                error_msg = f"Error parsing tool call arguments: {str(e)}"
                
                # Log tool execution error
                if hasattr(self.logger, 'log_tool_execution'):
                    self.logger.log_tool_execution(
                        tool_name=function_name,
                        arguments={"error": "Failed to parse arguments"},
                        result_success=False,
                        error_message=error_msg
                    )
                
                # Include parsing error info for LLM context  
                parsing_error_info = f"\n=== Tool Call Error ===\nFunction: {function_name}\nError: {error_msg}\n"
                accumulated_structure_info.append(parsing_error_info)
                
                response_content = f"Error: {error_msg}"
                self._log_verbose(error_msg)
            
            # Add function result to messages
            messages.append({
                "role": "tool",
                "tool_call_id": tool_call.id,
                "content": response_content
            })
        
        # Create final comprehensive prompt with all accumulated structure information
        if accumulated_structure_info:
            self._log_verbose(f"Accumulated {len(accumulated_structure_info)} structure definitions for final analysis")
            
            # Create enhanced prompt with all structure definitions
            structure_context = "\n".join(accumulated_structure_info)
            enhanced_prompt = f"""Now that you have analyzed the necessary structures, provide your comprehensive analysis of the function.

STRUCTURE DEFINITIONS CONTEXT:
{structure_context}

ANALYSIS REQUIREMENTS:
1. Use the structure definitions above to understand:
   - Field types and their purposes
   - Potential SMID fields (addresses, handles, descriptors)
   - Message structure layouts
   - Memory management patterns

2. Provide your analysis in the EXACT format specified:
   - Function/Code_Block_Name
   - AIARelevantFunction score (0-100)
   - Relevant_KD_Entry_Point score (0-100)
   - Message_Structure_Handling score (0-100)
   - Message_Structures identified
   - SMID's identified
   - Detailed reasoning

3. Base your scores on BOTH the function code AND the structure definitions provided above."""

            # Add the enhanced prompt as a user message
            messages.append({
                "role": "user",
                "content": enhanced_prompt
            })
        
        # Make final request with function results
        final_tokens = 0
        for msg in messages:
            content = msg.get("content", "")
            if content and isinstance(content, str):
                try:
                    final_tokens += self._estimate_tokens(content)
                except Exception as e:
                    self._log_verbose(f"Error in token counting: {e}, falling back to character estimation")
                    final_tokens += len(content) // 4
        
        # Log follow-up request
        self.logger.log_prompt_sent(
            model=self.model,
            messages=messages,
            tools=None,  # No more tools needed for final analysis
            token_count=final_tokens,
            context_limit=self._get_model_context_size(),
            is_follow_up=True
        )
        
        # Make the final call with increased max_tokens for comprehensive analysis
        final_response = self.client.chat.completions.create(
            model=self.model,
            messages=messages,
            max_tokens=4000,  # Increased for detailed analysis with structures
            temperature=0.1  # Lower temperature for more consistent analysis
        )
        
        # Log final LLM response
        final_content = final_response.choices[0].message.content
        self.logger.log_llm_response(
            response_content=final_content or "",
            tool_calls=None
        )
        
        if accumulated_structure_info:
            self._log_verbose("Final analysis completed with structure context")
        
        return final_content
    
    def analyze_function(self, function_code: str, function_name: str, 
                       preprocessed_file_path: Optional[str] = None,
                       enable_tools: Optional[bool] = None) -> AnalysisResult:
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
        
        # Use client's enable_tools setting if not explicitly provided
        if enable_tools is None:
            enable_tools = self.enable_tools
        
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
            tools_tokens = 500 if enable_tools else 0  # Increased for tool definitions
            response_tokens = self.max_tokens
            safety_margin = 1500  # Increased safety margin for tool calls
            
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
                total_message_tokens = 0
                for msg in messages:
                    content = msg.get("content", "")
                    if content and isinstance(content, str):
                        try:
                            total_message_tokens += self._estimate_tokens(content)
                        except Exception as e:
                            self._log_verbose(f"Error in token counting: {e}, falling back to character estimation")
                            total_message_tokens += len(content) // 4
                
                self._log_verbose(f"Model: {self.model}, Context limit: {model_context_limit}")
                self._log_verbose(f"Estimated tokens - Messages: {total_message_tokens}, Tools: {tools_tokens}")
                self._log_verbose(f"Available tokens: {available_tokens}, Max chars: {max_chars}")
            
            # Prepare tools if enabled
            tools = None
            if enable_tools and self.tool_manager:
                # Set the preprocessed file path for tool calls
                self.tool_manager.set_preprocessed_file_path(preprocessed_file_path)
                tools = self.tool_manager.get_tool_definitions()
            
            # Log prompt being sent
            total_tokens = 0
            for msg in messages:
                content = msg.get("content", "")
                if content and isinstance(content, str):
                    try:
                        total_tokens += self._estimate_tokens(content)
                    except Exception as e:
                        self._log_verbose(f"Error in token counting: {e}, falling back to character estimation")
                        total_tokens += len(content) // 4
            
            self.logger.log_prompt_sent(
                model=self.model,
                messages=messages,
                tools=tools,
                token_count=total_tokens,
                context_limit=model_context_limit
            )
            
            # Make the API call with tool_choice to encourage tool usage
            if tools:
                response = self.client.chat.completions.create(
                    model=self.model,
                    messages=messages,
                    tools=tools,
                    tool_choice="auto",  # Let the model decide when to use tools
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
                    final_content = self._handle_function_calls(messages, response)
                    
                    # Log final response after tool calls
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
            error_msg = f"Error in analyze_function: {e}"
            self._log_verbose(error_msg)
            print(error_msg)
            print(f"Function: {function_name}")
            
            # Log comprehensive error details
            if hasattr(self.logger, 'log_error'):
                self.logger.log_error(
                    error_type="FUNCTION_ANALYSIS_ERROR",
                    error_message=str(e),
                    context=f"Function: {function_name}, Model: {self.model}, Tools: {enable_tools}"
                )
            
            # Log analysis completion with error
            self.logger.log_analysis_complete(function_name, time.time() - start_time)
            
            # Return default analysis result on error
            return AnalysisResult(
                function_name=function_name,
                aia_relevant_function=0,
                relevant_kd_entry_point=0,
                message_structure_handling=0,
                message_structures_identified=[],
                smids_identified=[],
                reasoning=[f"Analysis failed due to error: {str(e)}"]
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
