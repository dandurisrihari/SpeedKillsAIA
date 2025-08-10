#!/usr/bin/env python3
"""
LLM Analysis Module - LLM Assisted analysis for kernel instrumentation

This module provides LLM-based analysis capabilities for kernel log data,
function analysis, DMA operations, and security assessments.
"""

import os
import json
import logging
from datetime import datetime
from typing import Dict, List, Optional, Any
from pathlib import Path

# Import struct context provider for automatic struct inclusion
try:
    from .struct_context import StructContextProvider
    STRUCT_CONTEXT_AVAILABLE = True
except ImportError:
    STRUCT_CONTEXT_AVAILABLE = False
    StructContextProvider = None

# Import dynamic struct tool for LLM struct requests
try:
    from .dynamic_struct_tool import LLMStructRequestHandler
    DYNAMIC_STRUCT_AVAILABLE = True
except ImportError:
    DYNAMIC_STRUCT_AVAILABLE = False
    LLMStructRequestHandler = None

# Load environment variables from .env file
try:
    from dotenv import load_dotenv
    # Try to load .env from current directory or parent directories
    env_path = Path(__file__).parent.parent.parent / '.env'
    if env_path.exists():
        load_dotenv(env_path)
    else:
        # Try current working directory
        load_dotenv()
    DOTENV_AVAILABLE = True
except ImportError:
    DOTENV_AVAILABLE = False
    # Still try to load from environment variables

# Import OpenAI after loading .env
try:
    import openai
    from openai import OpenAI
    OPENAI_AVAILABLE = True
except ImportError:
    OPENAI_AVAILABLE = False
    openai = None
    OpenAI = None

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class LLMAnalyzer:
    """LLM Assisted analyzer for kernel instrumentation data"""
    
    def __init__(self, model_id=None, tool_caller=None, data_dir="data", enable_dynamic_structs=True):
        """Initialize LLM analyzer with OpenAI API configuration"""
        self.client = None
        self.tool_caller = tool_caller
        self.data_dir = data_dir
        self.enable_dynamic_structs = enable_dynamic_structs
        
        # Initialize struct context provider
        self.struct_provider = None
        if STRUCT_CONTEXT_AVAILABLE:
            try:
                # Let StructContextProvider find the appropriate JSON file automatically
                self.struct_provider = StructContextProvider()
                logger.info("Struct context provider initialized")
            except Exception as e:
                logger.warning(f"Failed to initialize struct context provider: {e}")
        
        # Initialize dynamic struct request handler
        self.struct_request_handler = None
        if DYNAMIC_STRUCT_AVAILABLE and enable_dynamic_structs:
            try:
                self.struct_request_handler = LLMStructRequestHandler(
                    data_dir=data_dir,
                    kernel_sources_dir=Path(data_dir) / "kernel_sources" if Path(data_dir).exists() else None
                )
                logger.info("Dynamic struct request handler initialized")
            except Exception as e:
                logger.warning(f"Failed to initialize dynamic struct handler: {e}")
        self.available_models = [
            {
                "id": "gpt-3.5-turbo",
                "name": "GPT-3.5 Turbo",
                "description": "Fast and cost-effective model for most tasks",
                "max_tokens": 4096
            },
            {
                "id": "gpt-4",
                "name": "GPT-4",
                "description": "Most capable model with enhanced reasoning",
                "max_tokens": 8192
            },
            {
                "id": "gpt-4-turbo-preview", 
                "name": "GPT-4 Turbo",
                "description": "Latest GPT-4 with improved performance",
                "max_tokens": 128000
            }
        ]
        self.model_id = model_id or "gpt-3.5-turbo"
        self.default_model = model_id or "gpt-3.5-turbo"
        self.system_prompt = "You are an expert kernel security analyst."
        
        # Initialize OpenAI client
        self._initialize_client()
    
    def _initialize_client(self):
        """Initialize OpenAI client with API key from environment"""
        if not OPENAI_AVAILABLE:
            logger.warning("OpenAI package not available")
            return
        
        api_key = os.getenv('OPENAI_API_KEY')
        if not api_key:
            logger.warning("OPENAI_API_KEY not found in environment variables")
            return
        
        try:
            self.client = OpenAI(api_key=api_key)
            logger.info("OpenAI client initialized successfully")
        except Exception as e:
            logger.error(f"Failed to initialize OpenAI client: {e}")
            self.client = None
    
    def is_available(self) -> bool:
        """Check if LLM analysis is available"""
        if not OPENAI_AVAILABLE:
            return False
        
        if not self.client:
            return False
        
        # Test the connection with a simple request
        try:
            response = self.client.models.list()
            return True
        except Exception as e:
            logger.error(f"OpenAI API test failed: {e}")
            return False
    
    def get_available_models(self) -> List[Dict[str, Any]]:
        """Get list of available AI models"""
        if not self.is_available():
            return []
        return self.available_models
    
    def set_model(self, model_id: str) -> bool:
        """Set the model to use for analysis"""
        # Check if the model is in our available models
        available_model_ids = [model["id"] for model in self.available_models]
        if model_id not in available_model_ids:
            return False
        
        self.model_id = model_id
        self.default_model = model_id
        return True
    
    def _make_request(self, messages: List[Dict[str, str]], model: str = "gpt-3.5-turbo", max_tokens: int = 2000) -> tuple:
        """Make a request to the OpenAI API with configurable token limits"""
        if not self.client:
            return None, "OpenAI client not available"
        
        try:
            response = self.client.chat.completions.create(
                model=model,
                messages=messages,
                max_tokens=max_tokens,
                temperature=0.3
            )
            return response.choices[0].message.content, None
        except Exception as e:
            logger.error(f"OpenAI API request failed: {e}")
            return None, str(e)
    
    def _limit_tokens_for_web_ui(self, text: str, max_length: int = 8000) -> str:
        """Limit text length for web UI to prevent token overflow"""
        if len(text) <= max_length:
            return text
        
        # Try to cut at a sentence boundary
        cutoff = text[:max_length].rfind('.')
        if cutoff > max_length * 0.8:  # If we find a sentence end near the limit
            return text[:cutoff + 1] + "..."
        else:
            return text[:max_length] + "..."
    
    def _parse_confidence_scores(self, analysis_text: str) -> Dict[str, int]:
        """Parse confidence scores from LLM analysis text"""
        import re
        
        # Default scores
        scores = {
            "AIARelevantFunction": 0,
            "Relevant_KD_Entry_Point": 0,
            "Message_Structure_Handling": 0
        }
        
        if not analysis_text:
            return scores
        
        # Try to find confidence scores in various formats
        patterns = [
            # Format: "AIARelevantFunction: 85%"
            r'AIARelevantFunction:\s*(\d+)%',
            r'Relevant_KD_Entry_Point:\s*(\d+)%',
            r'Message_Structure_Handling:\s*(\d+)%',
            # Alternative format: "AIA Relevant Function: 85%"
            r'AIA\s+Relevant\s+Function:\s*(\d+)%',
            r'Relevant\s+KD\s+Entry\s+Point:\s*(\d+)%',
            r'Message\s+Structure\s+Handling:\s*(\d+)%',
            # Simple format: "85% confidence"
            r'AIARelevantFunction.*?(\d+)%',
            r'Relevant_KD_Entry_Point.*?(\d+)%',
            r'Message_Structure_Handling.*?(\d+)%'
        ]
        
        # Try exact format first
        aia_match = re.search(r'AIARelevantFunction:\s*(\d+)%', analysis_text, re.IGNORECASE)
        if aia_match:
            scores["AIARelevantFunction"] = min(100, max(0, int(aia_match.group(1))))
        
        entry_match = re.search(r'Relevant_KD_Entry_Point:\s*(\d+)%', analysis_text, re.IGNORECASE)
        if entry_match:
            scores["Relevant_KD_Entry_Point"] = min(100, max(0, int(entry_match.group(1))))
        
        msg_match = re.search(r'Message_Structure_Handling:\s*(\d+)%', analysis_text, re.IGNORECASE)
        if msg_match:
            scores["Message_Structure_Handling"] = min(100, max(0, int(msg_match.group(1))))
        
        # If exact format didn't work, try alternative patterns
        if all(score == 0 for score in scores.values()):
            # Look for any percentage values and try to map them
            percentages = re.findall(r'(\d+)%', analysis_text)
            if percentages:
                # If we have at least 3 percentages, use the first 3
                if len(percentages) >= 3:
                    scores["AIARelevantFunction"] = min(100, max(0, int(percentages[0])))
                    scores["Relevant_KD_Entry_Point"] = min(100, max(0, int(percentages[1])))
                    scores["Message_Structure_Handling"] = min(100, max(0, int(percentages[2])))
                elif len(percentages) >= 1:
                    # If only one percentage, assume it's for the most relevant category
                    main_score = min(100, max(0, int(percentages[0])))
                    # Distribute based on keywords in the text
                    if any(keyword in analysis_text.lower() for keyword in ['dma', 'memory', 'buffer', 'page']):
                        scores["AIARelevantFunction"] = main_score
                    elif any(keyword in analysis_text.lower() for keyword in ['ioctl', 'entry', 'syscall']):
                        scores["Relevant_KD_Entry_Point"] = main_score
                    elif any(keyword in analysis_text.lower() for keyword in ['message', 'structure', 'copy_from_user', 'copy_to_user']):
                        scores["Message_Structure_Handling"] = main_score
                    else:
                        scores["AIARelevantFunction"] = main_score
        
        return scores
    
    def analyze_function_with_dynamic_structs(self, function_name: str, source_code: str, 
                                             file_path: str = "", custom_prompt: str = "", 
                                             model_id: str = "gpt-3.5-turbo", 
                                             max_struct_requests: int = 5) -> Dict[str, Any]:
        """Analyze function with ability to request additional struct definitions during analysis"""
        
        if not self.struct_request_handler:
            # Fallback to regular analysis
            return self.analyze_function(function_name, source_code, file_path, custom_prompt, model_id, True)
        
        # Clear previous request history
        self.struct_request_handler.clear_history()
        
        # Get initial struct context
        struct_data = {}
        struct_context = ""
        struct_summary = {"count": 0, "file": "", "has_definitions": False}
        
        if self.struct_provider:
            try:
                struct_data = self.struct_provider.get_relevant_structs_for_function(
                    function_name, file_path, source_code
                )
                struct_context = self.struct_provider.format_structs_for_llm(struct_data)
                struct_summary = self.struct_provider.get_structs_summary(struct_data)
            except Exception as e:
                logger.warning(f"Error getting initial struct context: {e}")
        
        # Enhanced prompt with tool calling instructions
        enhanced_prompt = f"""
You are analyzing the function '{function_name}' from file '{file_path}'.

{custom_prompt}

IMPORTANT: If you need additional struct definitions not provided in the initial context, 
you can request them by including a JSON request in your analysis in this format:

STRUCT_REQUEST: {{"struct_name": "struct_name_here", "file_hint": "optional_file_hint"}}

I will provide the struct definition and you can continue your analysis.

{struct_context}

Function to analyze:
```c
{source_code}
```

Please provide a comprehensive security analysis focusing on:
1. AIA integration patterns and relevance
2. Kernel driver entry points
3. Message structure handling
4. Memory safety and potential vulnerabilities
"""
        
        # Start iterative analysis with struct requests
        return self._iterative_analysis_with_struct_requests(
            function_name, source_code, file_path, enhanced_prompt, 
            model_id, max_struct_requests, struct_summary
        )
    
    def _iterative_analysis_with_struct_requests(self, function_name: str, source_code: str,
                                               file_path: str, initial_prompt: str,
                                               model_id: str, max_requests: int,
                                               initial_struct_summary: Dict) -> Dict[str, Any]:
        """Perform iterative analysis handling struct requests"""
        
        conversation_history = [
            {"role": "system", "content": self.system_prompt},
            {"role": "user", "content": initial_prompt}
        ]
        
        struct_requests_made = 0
        additional_structs = []
        
        for iteration in range(max_requests + 1):  # +1 for initial analysis
            try:
                # Make LLM request
                response, error = self._make_request(conversation_history, model_id)
                
                if error:
                    return {
                        "success": False,
                        "error": f"API request failed: {error}",
                        "function_code": source_code,
                        "struct_context": initial_struct_summary,
                        "struct_requests": self.struct_request_handler.get_request_history()
                    }
                
                if not response:
                    return {
                        "success": False,
                        "error": "Empty response from LLM",
                        "function_code": source_code,
                        "struct_context": initial_struct_summary,
                        "struct_requests": self.struct_request_handler.get_request_history()
                    }
                
                # Check if LLM is requesting struct information
                struct_request = self._parse_struct_request(response)
                
                if struct_request and struct_requests_made < max_requests:
                    # Handle the struct request
                    struct_response = self.struct_request_handler.handle_struct_request(struct_request)
                    
                    if struct_response.get("success"):
                        # Add struct definition to conversation
                        struct_info = f"""
STRUCT DEFINITION for '{struct_request['struct_name']}':
```c
{struct_response['definition']}
```
File: {struct_response.get('file_path', 'unknown')}
Line: {struct_response.get('line_number', 'unknown')}

Please continue your analysis with this additional context.
"""
                        conversation_history.append({"role": "assistant", "content": response})
                        conversation_history.append({"role": "user", "content": struct_info})
                        
                        additional_structs.append({
                            "struct_name": struct_request['struct_name'],
                            "definition": struct_response['definition'],
                            "file_path": struct_response.get('file_path'),
                            "line_number": struct_response.get('line_number')
                        })
                        
                        struct_requests_made += 1
                        continue
                    else:
                        # Struct not found, inform LLM
                        not_found_msg = f"STRUCT '{struct_request['struct_name']}' not found. Please continue analysis without it."
                        conversation_history.append({"role": "assistant", "content": response})
                        conversation_history.append({"role": "user", "content": not_found_msg})
                        struct_requests_made += 1
                        continue
                
                # No more struct requests, this is the final analysis
                break
                
            except Exception as e:
                logger.error(f"Error in iterative analysis iteration {iteration}: {e}")
                return {
                    "success": False,
                    "error": f"Analysis failed: {str(e)}",
                    "function_code": source_code,
                    "struct_context": initial_struct_summary,
                    "struct_requests": self.struct_request_handler.get_request_history()
                }
        
        # Parse final response
        # Parse confidence scores from analysis  
        confidence_scores = self._parse_confidence_scores(response)
        
        # Build result structure
        result = {
            "success": True if response else False,
            "status": "success" if response else "error",
            "analysis": response or "Failed to generate analysis with dynamic struct requests",
            "function_name": function_name,
            "file_path": file_path,
            "model_used": model_id,
            "confidence_scores": confidence_scores,
            "function_code": source_code,
            "struct_context": initial_struct_summary,
            "additional_structs_requested": len(additional_structs),
            "additional_structs": additional_structs,
            "struct_requests": self.struct_request_handler.get_request_history(),
            "conversation_history": conversation_history,
            "total_struct_requests": struct_requests_made
        }
        
        return result
    
    def _parse_struct_request(self, llm_response: str) -> Optional[Dict[str, str]]:
        """Parse struct request from LLM response"""
        import json
        import re
        
        # Look for STRUCT_REQUEST: {...} pattern
        pattern = r'STRUCT_REQUEST:\s*(\{[^}]+\})'
        match = re.search(pattern, llm_response, re.IGNORECASE)
        
        if match:
            try:
                request_json = match.group(1)
                request_data = json.loads(request_json)
                
                if 'struct_name' in request_data:
                    return request_data
            except json.JSONDecodeError:
                logger.warning(f"Invalid JSON in struct request: {match.group(1)}")
        
        return None

    def analyze_function(self, function_name: str, source_code: str, file_path: str = "", 
                        custom_prompt: str = "", model_id: str = "gpt-3.5-turbo", 
                        for_web_ui: bool = False, interactive_callback=None) -> Dict[str, Any]:
        """Analyze general function for AIA integration patterns with interactive tool calling"""
        
        # Get relevant struct definitions for this function
        struct_data = {}
        struct_context = ""
        struct_summary = {"count": 0, "file": "", "has_definitions": False}
        
        if self.struct_provider:
            try:
                struct_data = self.struct_provider.get_relevant_structs_for_function(
                    function_name, file_path, source_code
                )
                struct_context = self.struct_provider.format_structs_for_llm(struct_data)
                struct_summary = self.struct_provider.get_structs_summary(struct_data)
                
                # Smart filtering information for web UI
                if struct_summary.get("smart_filtered"):
                    logger.info(f"Smart-filtered struct context: {struct_summary['size_reduction_percent']}% reduction "
                              f"({struct_summary['original_size']:,} -> {struct_summary['filtered_size']:,} chars)")
                else:
                    logger.info(f"Added struct definitions from {struct_summary.get('file', 'unknown file')} to analysis context")
                
            except Exception as e:
                logger.warning(f"Error getting struct context: {e}")
        
        # Check if we need user confirmation for large requests
        from .tool_calling import estimate_token_count, should_request_confirmation_for_content
        
        # Prepare the content that will be sent to LLM
        enhanced_prompt = custom_prompt
        if struct_context:
            enhanced_prompt = f"{custom_prompt}\n\n{struct_context}"
        
        # Estimate total token count
        total_content = f"{enhanced_prompt}\n\nFunction to analyze:\n{source_code}"
        estimated_tokens = estimate_token_count(total_content, model_id)
        
        # Interactive confirmation if needed
        confirmation_needed = should_request_confirmation_for_content(
            len(total_content), estimated_tokens, model_id
        )
        
        if confirmation_needed and interactive_callback:
            confirmation_data = {
                "function_name": function_name,
                "file_path": file_path,
                "estimated_tokens": estimated_tokens,
                "content_length": len(total_content),
                "model": model_id,
                "struct_context_info": {
                    "file": struct_summary.get("file", ""),
                    "count": struct_summary.get("count", 0),
                    "smart_filtered": struct_summary.get("smart_filtered", False),
                    "size_reduction": struct_summary.get("size_reduction_percent", 0) if struct_summary.get("smart_filtered") else 0
                },
                "extracted_content_preview": struct_context[:500] + "..." if len(struct_context) > 500 else struct_context
            }
            
            # Call the interactive callback (web UI will handle confirmation)
            user_approved = interactive_callback(confirmation_data)
            
            if not user_approved:
                return {
                    "success": False,
                    "error": "Analysis cancelled by user",
                    "function_name": function_name,
                    "file_path": file_path,
                    "cancelled_by_user": True,
                    "estimated_tokens": estimated_tokens
                }
        
        function_data = {
            "function_name": function_name,
            "file_path": file_path,
            "source_code": source_code
        }
        
        # Use AIA-specific analysis for general functions (focuses on AIARelevantFunction and Entry Points)
        result = self._analyze_aia_integration(
            code_block=function_data,
            function_code=source_code,
            custom_prompt=enhanced_prompt,
            model_id=model_id,
            for_web_ui=for_web_ui,
            analysis_type="general_function"
        )
        
        # Add comprehensive struct information to the result
        result['struct_context'] = struct_summary
        result['struct_definitions_used'] = struct_summary.get('count', 0)
        result['struct_definitions_formatted'] = struct_context  # The formatted struct code for display
        result['function_code'] = source_code  # The actual function code
        result['estimated_tokens'] = estimated_tokens  # Token count info
        result['content_length'] = len(total_content)  # Total content size
        
        # Add smart filtering information if available
        if struct_summary.get("smart_filtered"):
            result['smart_filtering'] = {
                "enabled": True,
                "original_size": struct_summary.get('original_size', 0),
                "filtered_size": struct_summary.get('filtered_size', 0),
                "size_reduction_percent": struct_summary.get('size_reduction_percent', 0),
                "extraction_method": struct_summary.get('extraction_method', 'smart_filtering')
            }
        
        return result
    
    def analyze_dma_operation(self, dma_operation: Dict[str, Any], function_code: str = "", 
                            call_graph: List[str] = None, custom_prompt: str = "", 
                            model_id: str = "gpt-3.5-turbo", for_web_ui: bool = False) -> Dict[str, Any]:
        """Analyze DMA operations for AIA integration patterns"""
        
        # Get relevant struct definitions for this DMA operation
        struct_data = {}
        struct_context = ""
        struct_summary = {"count": 0, "file": "", "has_definitions": False}
        
        function_name = dma_operation.get('caller_function', dma_operation.get('dma_function', 'Unknown'))
        file_path = dma_operation.get('file_path', '')
        
        if self.struct_provider:
            try:
                struct_data = self.struct_provider.get_relevant_structs_for_function(
                    function_name, file_path, function_code
                )
                struct_context = self.struct_provider.format_structs_for_llm(struct_data)
                struct_summary = self.struct_provider.get_structs_summary(struct_data)
                logger.info(f"Added ALL struct definitions from {struct_summary.get('file', 'unknown file')} to DMA analysis context")
            except Exception as e:
                logger.warning(f"Error getting struct context for DMA: {e}")
        
        # Enhance the custom prompt with struct context
        enhanced_prompt = custom_prompt
        if struct_context:
            enhanced_prompt = f"{custom_prompt}\n\n{struct_context}"
        
        # Prepare DMA operation data for AIA analysis
        dma_data = {
            "dma_function": dma_operation.get('dma_function', 'Unknown'),
            "caller_function": dma_operation.get('caller_function', 'Unknown'), 
            "file_path": dma_operation.get('file_path', 'Unknown'),
            "line_number": dma_operation.get('line_number', 'Unknown'),
            "call_graph": call_graph or []
        }
        
        # Use AIA-specific analysis for DMA operations (focuses on AIARelevantFunction)
        result = self._analyze_aia_integration(
            code_block=dma_data,
            function_code=function_code,
            custom_prompt=enhanced_prompt,
            model_id=model_id,
            for_web_ui=for_web_ui,
            analysis_type="dma_operation"
        )
        
        # Add DMA-specific fields for backward compatibility
        result.update({
            "dma_operation": dma_operation,
            "struct_context": struct_summary,
            "struct_definitions_used": struct_summary.get('count', 0),
            "struct_definitions_formatted": struct_context,  # The formatted struct code for display
            "function_code": function_code  # The actual function code
        })
        
        return result
    
    def analyze_user_copy_operation(self, user_copy_operation: Dict[str, Any], function_code: str = "", 
                                  custom_prompt: str = "", model_id: str = "gpt-3.5-turbo", 
                                  for_web_ui: bool = False) -> Dict[str, Any]:
        """Analyze user copy operations for AIA integration patterns"""
        
        # Get relevant struct definitions for this user copy operation
        struct_data = {}
        struct_context = ""
        struct_summary = {"count": 0, "file": "", "has_definitions": False}
        
        function_name = user_copy_operation.get('caller_function', user_copy_operation.get('copy_function', 'Unknown'))
        file_path = user_copy_operation.get('file_path', '')
        
        if self.struct_provider:
            try:
                struct_data = self.struct_provider.get_relevant_structs_for_function(
                    function_name, file_path, function_code
                )
                struct_context = self.struct_provider.format_structs_for_llm(struct_data)
                struct_summary = self.struct_provider.get_structs_summary(struct_data)
                logger.info(f"Added ALL struct definitions from {struct_summary.get('file', 'unknown file')} to user copy analysis context")
            except Exception as e:
                logger.warning(f"Error getting struct context for user copy: {e}")
        
        # Enhance the custom prompt with struct context
        enhanced_prompt = custom_prompt
        if struct_context:
            enhanced_prompt = f"{custom_prompt}\n\n{struct_context}"
        
        # Prepare user copy operation data for AIA analysis
        user_copy_data = {
            "copy_function": user_copy_operation.get('copy_function', 'Unknown'),
            "caller_function": user_copy_operation.get('caller_function', 'Unknown'),
            "file_path": user_copy_operation.get('file_path', 'Unknown'),
            "line_number": user_copy_operation.get('line_number', 'Unknown')
        }
        
        # Use AIA-specific analysis for user copy operations (focuses on Message Structure Handling)
        result = self._analyze_aia_integration(
            code_block=user_copy_data,
            function_code=function_code,
            custom_prompt=enhanced_prompt,
            model_id=model_id,
            for_web_ui=for_web_ui,
            analysis_type="user_copy_operation"
        )
        
        # Add user copy-specific fields for backward compatibility
        result.update({
            "user_copy_operation": user_copy_operation,
            "struct_context": struct_summary,
            "struct_definitions_used": struct_summary.get('count', 0),
            "struct_definitions_formatted": struct_context,  # The formatted struct code for display
            "function_code": function_code  # The actual function code
        })
        
        return result
    
    def analyze_ioctl_handler(self, ioctl_operation: Dict[str, Any], function_code: str = "", 
                            custom_prompt: str = "", model_id: str = "gpt-3.5-turbo", 
                            for_web_ui: bool = False) -> Dict[str, Any]:
        """Analyze IOCTL handler operations for AIA integration patterns"""
        
        # Get relevant struct definitions for this IOCTL operation
        struct_data = {}
        struct_context = ""
        struct_summary = {"count": 0, "file": "", "has_definitions": False}
        
        function_name = ioctl_operation.get('function_name', 'Unknown')
        file_path = ioctl_operation.get('file_path', '')
        
        if self.struct_provider:
            try:
                struct_data = self.struct_provider.get_relevant_structs_for_function(
                    function_name, file_path, function_code
                )
                struct_context = self.struct_provider.format_structs_for_llm(struct_data)
                struct_summary = self.struct_provider.get_structs_summary(struct_data)
                logger.info(f"Added ALL struct definitions from {struct_summary.get('file', 'unknown file')} to IOCTL analysis context")
            except Exception as e:
                logger.warning(f"Error getting struct context for IOCTL: {e}")
        
        # Enhance the custom prompt with struct context
        enhanced_prompt = custom_prompt
        if struct_context:
            enhanced_prompt = f"{custom_prompt}\n\n{struct_context}"
        
        # Use AIA-specific analysis for ioctl handlers (focuses on Message Structure Handling)
        result = self._analyze_aia_integration(
            code_block=ioctl_operation,
            function_code=function_code,
            custom_prompt=enhanced_prompt,
            model_id=model_id,
            for_web_ui=for_web_ui,
            analysis_type="ioctl_handler"
        )
        
        # Add struct context information
        result.update({
            "struct_context": struct_summary,
            "struct_definitions_used": struct_summary.get('count', 0),
            "struct_definitions_formatted": struct_context,  # The formatted struct code for display
            "function_code": function_code  # The actual function code
        })
        
        return result

    def _analyze_aia_integration(self, code_block: Dict[str, Any], function_code: str = "", 
                               custom_prompt: str = "", model_id: str = "gpt-3.5-turbo", 
                               for_web_ui: bool = False, analysis_type: str = "general_function") -> Dict[str, Any]:
        """Core AIA integration analysis with category-specific focus"""
        
        # Check if LLM is available first
        if not self.is_available():
            # Return legacy format for backward compatibility with default confidence scores
            default_scores = {
                "AIARelevantFunction": 0,
                "Relevant_KD_Entry_Point": 0,
                "Message_Structure_Handling": 0
            }
            
            if analysis_type == "ioctl_handler":
                return {
                    "status": "unavailable",
                    "analysis": "LLM analysis is not available. Please check OpenAI API configuration.",
                    "error": "LLM analysis is not available. Please check OpenAI API configuration.",
                    "handler_name": code_block.get('handler_name', 'Unknown'),
                    "file_path": code_block.get('file_path', ''),
                    "model_used": model_id,
                    "custom_prompt": custom_prompt,
                    "confidence_scores": default_scores
                }
            else:
                return {
                    "status": "unavailable",
                    "analysis": "LLM analysis is not available. Please check OpenAI API configuration.",
                    "error": "LLM analysis is not available. Please check OpenAI API configuration.",
                    "function_name": code_block.get('function_name', 'Unknown'),
                    "file_path": code_block.get('file_path', ''),
                    "model_used": model_id,
                    "custom_prompt": custom_prompt,
                    "confidence_scores": default_scores
                }

        # Determine analysis focus based on code type
        if analysis_type == "ioctl_handler":
            # For ioctl handlers: Default focus on Message Structure Handling
            primary_focus = """
3. Message Structure Handling (PRIMARY FOCUS)
Assign a confidence score if the code block handles message structures exchanged between user space and kernel, especially involving Shared Memory Identifiers (SMIDs). These are usually detected via:
• Use of copy_from_user() / copy_to_user()
• Structures passed between user space and kernel that include:
  • SMID (shared memory identifier) - look for fields named: smid, shared_mem_id, memory_id, buffer_id, handle, token
  • Device virtual address, physical address, DMA address - look for: virt_addr, phys_addr, dma_addr, device_addr
  • Memory size, flags, or similar metadata - look for: size, length, flags, mem_flags, access_flags
  • Buffer descriptors - look for: buffer_desc, mem_desc, shared_buffer, dma_buffer
These structures may represent requests by user space for AIA to access certain memory pages, or responses from kernel about memory regions accessible to the AIA.

CRITICAL: If you identify any struct fields that could be SMIDs, explicitly mention them in your analysis. Common SMID field patterns:
- Fields ending with: _id, _handle, _token, _key
- Fields starting with: mem_, buf_, shared_, dma_
- Numeric fields passed alongside memory addresses
- Fields in structs used with copy_from_user/copy_to_user operations
"""
        elif analysis_type == "user_copy_operation":
            # For user copy operations: Default focus on Message Structure Handling
            primary_focus = """
3. Message Structure Handling (PRIMARY FOCUS)
Assign a confidence score if the code block handles message structures exchanged between user space and kernel, especially involving Shared Memory Identifiers (SMIDs). These are usually detected via:
• Use of copy_from_user() / copy_to_user()
• Structures passed between user space and kernel that include:
  • SMID (shared memory identifier) - look for fields named: smid, shared_mem_id, memory_id, buffer_id, handle, token
  • Device virtual address, physical address, DMA address - look for: virt_addr, phys_addr, dma_addr, device_addr
  • Memory size, flags, or similar metadata - look for: size, length, flags, mem_flags, access_flags
  • Buffer descriptors - look for: buffer_desc, mem_desc, shared_buffer, dma_buffer
These structures may represent requests by user space for AIA to access certain memory pages, or responses from kernel about memory regions accessible to the AIA.

CRITICAL: If you identify any struct fields that could be SMIDs, explicitly mention them in your analysis. Common SMID field patterns:
- Fields ending with: _id, _handle, _token, _key
- Fields starting with: mem_, buf_, shared_, dma_
- Numeric fields passed alongside memory addresses
- Fields in structs used with copy_from_user/copy_to_user operations
"""
        elif analysis_type == "dma_operation":
            # For DMA operations: Default focus on AIARelevantFunction
            primary_focus = """
1. AIARelevantFunction (PRIMARY FOCUS)
Assign a confidence score for whether the given function or code block is involved in sharing shared memory (SMem) with an AI Accelerator (AIA). Such functions often:
• Pin user pages to memory (get_user_pages, pin_user_pages)
• Obtain physical or DMA addresses of user pages
• Program these addresses into:
  • AIA device page tables (for memory mapping inside the AIA)
  • AIA MMIO (Memory Mapped I/O) registers to notify AIA of accessible memory
• Manage DMA buffers for communication between CPU and AIA
These functions are typically critical for giving the AIA access to host memory regions.
"""
        else:
            # For all other code: Default focus on AIARelevantFunction and Entry Points
            primary_focus = """
1. AIARelevantFunction (PRIMARY FOCUS)
Assign a confidence score for whether the given function or code block is involved in sharing shared memory (SMem) with an AI Accelerator (AIA). Such functions often:
• Pin user pages to memory (get_user_pages, pin_user_pages)
• Obtain physical or DMA addresses of user pages
• Program these addresses into:
  • AIA device page tables (for memory mapping inside the AIA)
  • AIA MMIO (Memory Mapped I/O) registers to notify AIA of accessible memory
• Manage DMA buffers for communication between CPU and AIA
These functions are typically critical for giving the AIA access to host memory regions.

2. Relevant KD Entry Point (SECONDARY FOCUS)
Assign a confidence score if the code block represents an entry point from user space to kernel, commonly through ioctl() functions. These:
• Act as dispatch points in a switch-case over ioctl codes
• Handle user commands and trigger deeper kernel logic leading to AIARelevantFunction
• Identify which ioctl code is being handled (e.g., IOCTL_AIA_ALLOC_SMEM, IOCTL_AIA_SEND_MSG)
If you find such code, identify the ioctl name or code value used and how the call flows into memory management or messaging logic.
"""

        base_prompt = f"""
You are an expert in Linux Kernel Driver (KD) development with specialization in AI Accelerator (AIA) integration. Analyze the given kernel source code and assign confidence scores (0–100%) across three categories.

{primary_focus}

ALL CATEGORIES FOR REFERENCE:

1. AIARelevantFunction
Functions involved in sharing shared memory (SMem) with AI Accelerator (AIA):
• Pin user pages to memory (get_user_pages, pin_user_pages)
• Obtain physical or DMA addresses of user pages
• Program addresses into AIA device page tables or MMIO registers
• Manage DMA buffers for CPU-AIA communication

2. Relevant KD Entry Point
Entry points from user space to kernel (ioctl functions):
• Dispatch points in switch-case over ioctl codes
• Handle user commands triggering AIARelevantFunction
• Identify ioctl codes (e.g., IOCTL_AIA_ALLOC_SMEM, IOCTL_AIA_SEND_MSG)

3. Message Structure Handling
Handle message structures between user space and kernel with SMIDs:
• Use copy_from_user() / copy_to_user()
• Structures with SMID, virtual/physical/DMA addresses, memory size, flags
• Represent AIA memory access requests/responses

Code Details:
- Function: {code_block.get('function_name', 'Unknown')}
- File: {code_block.get('file_path', 'Unknown')}
- Line: {code_block.get('line_number', 'Unknown')}

{f"Function Code:\n{function_code}" if function_code else ""}

{f"Additional focus: {custom_prompt}" if custom_prompt else ""}

OUTPUT FORMAT (YAML):
```yaml
Function/Code_Block_Name: <function_name_or_description>
AIARelevantFunction: <0–100%>
Relevant_KD_Entry_Point: <0–100%>
Message_Structure_Handling: <0–100%>
SMID_Fields_Detected: <list any potential SMID fields found, or "None" if none detected>
Struct_Analysis: <if struct definitions were provided, analyze them for SMID patterns>
Reasoning:
  - Describe the rationale behind each confidence score
  - Reference specific APIs used (e.g., get_user_pages, dma_map_page, copy_from_user)
  - Mention any relevant ioctl code names or struct fields (e.g., smid, phys_addr)
  - If struct definitions are available, analyze field names and types for SMID patterns
  - Indicate if there's a flow from user space to kernel to AIA
  - Specifically call out any fields that match SMID naming patterns
```

GOAL: Identify and trace the path through which:
• User space initiates a request (to share memory or send message to AIA)
• Kernel pins and maps memory appropriately
• AIA and userspace are informed of shared memory locations (via SMID or physical/DMA address)
"""
        
        messages = [
            {"role": "system", "content": "You are an expert in Linux Kernel Driver development with specialization in AI Accelerator (AIA) integration."},
            {"role": "user", "content": base_prompt}
        ]
        
        # Use appropriate token limits based on context
        max_tokens = 1500 if for_web_ui else 2000
        analysis, error = self._make_request(messages, model_id, max_tokens)
        
        # Limit output for web UI
        if for_web_ui and analysis:
            analysis = self._limit_tokens_for_web_ui(analysis)
        
        # Parse confidence scores from analysis
        confidence_scores = self._parse_confidence_scores(analysis)
        
        # Build return structure with both new AIA fields and legacy compatibility fields
        result = {
            "status": "success" if analysis else "error",
            "analysis": analysis or "Failed to generate AIA integration analysis",
            "error": error if error else ("AIA analysis failed" if not analysis else None),
            "code_block": code_block,
            "model_used": model_id,
            "custom_prompt": custom_prompt,
            "analysis_type": analysis_type,
            "confidence_scores": confidence_scores,
            # Add full request information for transparency
            "llm_request": {
                "system_prompt": "You are an expert in Linux Kernel Driver development with specialization in AI Accelerator (AIA) integration.",
                "user_prompt": base_prompt,
                "full_conversation": messages
            },
            "llm_response": analysis  # Store the raw LLM response
        }
        
        # Add legacy compatibility fields based on analysis type
        if analysis_type == "ioctl_handler":
            result.update({
                "handler_name": code_block.get('handler_name', 'Unknown'),
                "file_path": code_block.get('file_path', ''),
                "ioctl_commands": code_block.get('ioctl_commands', [])
            })
        elif analysis_type == "dma_operation":
            result.update({
                "dma_function": code_block.get('dma_function', 'Unknown'),
                "caller_function": code_block.get('caller_function', 'Unknown'),
                "file_path": code_block.get('file_path', ''),
                "line_number": code_block.get('line_number', 'Unknown')
            })
        elif analysis_type == "user_copy_operation":
            result.update({
                "copy_function": code_block.get('copy_function', 'Unknown'),
                "caller_function": code_block.get('caller_function', 'Unknown'),
                "file_path": code_block.get('file_path', ''),
                "line_number": code_block.get('line_number', 'Unknown')
            })
        else:
            result.update({
                "function_name": code_block.get('function_name', 'Unknown'),
                "file_path": code_block.get('file_path', '')
            })
        
        return result
    
    def analyze_logs(self, logs: List[Dict[str, Any]], analysis_type: str = "general", 
                    custom_prompt: str = "", model_id: str = "gpt-3.5-turbo") -> Dict[str, Any]:
        """Analyze log data for patterns and issues"""
        
        # Check if LLM is available
        if not self.is_available():
            return {
                "status": "unavailable",
                "analysis": "LLM analysis is not available. Please check OpenAI API configuration.",
                "error": "LLM analysis is not available. Please check OpenAI API configuration.",
                "analysis_type": analysis_type,
                "log_count": len(logs),
                "model_used": model_id,
                "custom_prompt": custom_prompt
            }
        
        # Create summary of log data
        summary = self._create_log_summary_from_list(logs)
        
        analysis_prompts = {
            "general": "Provide a general analysis of the kernel instrumentation data focusing on overall patterns, potential issues, and recommendations.",
            "security": "Focus specifically on security vulnerabilities, attack vectors, privilege escalation opportunities, and defensive recommendations.",
            "performance": "Analyze performance implications, bottlenecks, inefficiencies, and optimization opportunities."
        }
        
        base_prompt = f"""
You are analyzing kernel instrumentation logs. {analysis_prompts.get(analysis_type, analysis_prompts['general'])}

Log Data Summary:
{summary}

{f"Additional focus: {custom_prompt}" if custom_prompt else ""}

Provide actionable insights and specific recommendations.
"""
        
        messages = [
            {"role": "system", "content": "You are an expert kernel analyst specializing in log analysis."},
            {"role": "user", "content": base_prompt}
        ]
        
        analysis, error = self._make_request(messages, model_id)
        
        return {
            "status": "success" if analysis else "error",
            "analysis": analysis or "Failed to generate log analysis",
            "error": error if error else ("Log analysis failed" if not analysis else None),
            "analysis_type": analysis_type,
            "log_count": len(logs),
            "model_used": model_id,
            "custom_prompt": custom_prompt
        }
    
    def generate_security_report(self, all_data: Dict[str, Any], 
                               model_id: str = "gpt-4") -> Dict[str, Any]:
        """Generate comprehensive security report"""
        
        # Create comprehensive summary
        summary = self._create_comprehensive_summary(all_data)
        
        base_prompt = f"""
You are a senior security analyst creating a comprehensive security assessment report for a kernel subsystem. 

Based on the following instrumentation data, create a detailed security report including:
1. Executive Summary
2. Risk Assessment (Critical, High, Medium, Low)
3. Specific Vulnerabilities Found
4. Attack Vector Analysis
5. Recommendations for Mitigation
6. Security Best Practices

Instrumentation Data Summary:
{summary}

Provide a professional, actionable security report.
"""
        
        messages = [
            {"role": "system", "content": "You are a senior security consultant specializing in kernel security assessments."},
            {"role": "user", "content": base_prompt}
        ]
        
        analysis, error = self._make_request(messages, model_id)
        
        return {
            "status": "success" if analysis else "error",
            "report": analysis or "Failed to generate security report",
            "analysis": analysis or "Failed to generate security report",
            "data_summary": summary,
            "error": error if error else ("Security report generation failed" if not analysis else None),
            "report_type": "comprehensive_security",
            "model_used": model_id,
            "timestamp": datetime.now().isoformat()
        }
    
    def _create_log_summary_from_list(self, logs: List[Dict[str, Any]]) -> str:
        """Create a concise summary of log data from list format"""
        summary_parts = []
        
        # Basic statistics
        summary_parts.append(f"Total log entries: {len(logs)}")
        
        # Function names
        function_names = [log.get('function_name', 'Unknown') for log in logs]
        unique_functions = set(function_names)
        summary_parts.append(f"Unique functions: {len(unique_functions)}")
        
        # Sample entries
        if logs:
            sample_size = min(5, len(logs))
            sample_entries = []
            for i, log in enumerate(logs[:sample_size]):
                func_name = log.get('function_name', 'Unknown')
                timestamp = log.get('timestamp', 'Unknown')
                sample_entries.append(f"{i+1}. {func_name} at {timestamp}")
            summary_parts.append(f"Sample entries:\n" + "\n".join(sample_entries))
        
        return "\n\n".join(summary_parts)
    
    def _create_log_summary(self, log_data: Dict[str, Any]) -> str:
        """Create a concise summary of log data for analysis"""
        summary_parts = []
        
        # Statistics
        stats = log_data.get('statistics', {})
        summary_parts.append(f"Statistics: {json.dumps(stats, indent=2)}")
        
        # Functions
        functions = log_data.get('functions_by_file', {})
        func_count = sum(len(funcs) for funcs in functions.values())
        summary_parts.append(f"Total Functions: {func_count}")
        
        # DMA Operations
        dma_ops = log_data.get('dma_operations', [])
        summary_parts.append(f"DMA Operations: {len(dma_ops)}")
        
        # Sample functions (first few)
        if functions:
            sample_funcs = []
            for file_path, funcs in list(functions.items())[:2]:
                for func in funcs[:3]:
                    sample_funcs.append(f"{func.get('function_name')} in {file_path}")
            summary_parts.append(f"Sample Functions: {', '.join(sample_funcs)}")
        
        return "\n\n".join(summary_parts)
    
    def _create_comprehensive_summary(self, all_data: Dict[str, Any]) -> str:
        """Create comprehensive summary for security report"""
        summary_parts = []
        
        # Overall statistics
        stats = all_data.get('statistics', {})
        summary_parts.append(f"System Overview:\n{json.dumps(stats, indent=2)}")
        
        # Functions analysis
        functions = all_data.get('functions_by_file', {})
        total_funcs = sum(len(funcs) for funcs in functions.values())
        summary_parts.append(f"Total Instrumented Functions: {total_funcs}")
        summary_parts.append(f"Files Analyzed: {len(functions)}")
        
        # DMA operations
        dma_ops = all_data.get('dma_operations', [])
        summary_parts.append(f"DMA Operations Detected: {len(dma_ops)}")
        
        # IOCTL operations
        ioctl_ops = all_data.get('ioctl_operations', [])
        summary_parts.append(f"IOCTL Handlers: {len(ioctl_ops)}")
        
        # User copy operations
        user_copy_ops = all_data.get('user_copy_operations', [])
        summary_parts.append(f"User Copy Operations: {len(user_copy_ops)}")
        
        # Memory information
        memory_info = all_data.get('memory_info', {})
        if memory_info:
            summary_parts.append(f"Memory Analysis Available: Yes")
        
        return "\n\n".join(summary_parts)
    
    def analyze_function_with_tools(self, function_name: str, source_code: str, 
                                  file_path: str = "", custom_prompt: str = "", 
                                  model_id: str = "gpt-3.5-turbo", 
                                  max_tool_calls: int = 5) -> Dict[str, Any]:
        """Analyze function with tool calling support for enhanced context"""
        
        if not self.tool_caller:
            # Fall back to regular analysis if no tool caller available
            return self.analyze_function(function_name, source_code, file_path, custom_prompt, model_id, True)
        
        if not self.is_available():
            return {
                "status": "error",
                "error": "LLM service not available"
            }
        
        tool_requests = []
        enhanced_context = ""
        
        try:
            # Create enhanced prompt with tool calling instructions
            system_prompt = f"""You are analyzing the C function '{function_name}' for security vulnerabilities, performance issues, and code quality.

You have access to a tool that can fetch additional source code context. If you need:
- Source code of other functions that this function calls
- Struct or typedef definitions used in this function
- Macro definitions

You can request them using JSON format in your response:
REQUEST_TOOL: {{"type": "function", "name": "function_name"}}
REQUEST_TOOL: {{"type": "struct", "name": "struct_name"}}

After making tool requests, analyze the function thoroughly with the additional context.

Original custom prompt: {custom_prompt}"""
            
            user_prompt = f"""Function to analyze: {function_name}
File: {file_path}

Source code:
```c
{source_code}
```

Please analyze this function. If you need additional context (other function definitions, struct definitions, etc.), make tool requests first, then provide your analysis."""
            
            # Make initial LLM call
            response = self.client.chat.completions.create(
                model=model_id,
                messages=[
                    {"role": "system", "content": system_prompt},
                    {"role": "user", "content": user_prompt}
                ],
                max_tokens=4000,
                temperature=0.1
            )
            
            initial_response = response.choices[0].message.content
            
            # Extract tool requests from the response
            tool_requests_made = 0
            current_analysis = initial_response
            
            while tool_requests_made < max_tool_calls:
                # Look for tool requests in the response
                import re
                tool_matches = re.findall(r'REQUEST_TOOL:\s*(\{[^}]+\})', current_analysis)
                
                if not tool_matches:
                    break  # No more tool requests
                
                # Process each tool request
                new_context_parts = []
                for tool_match in tool_matches:
                    try:
                        tool_request = json.loads(tool_match)
                        
                        # Make the tool call
                        if tool_request.get('type') == 'function':
                            response = self.tool_caller.extractor.extract_function(
                                tool_request['name'], 
                                file_path if file_path else None
                            )
                        elif tool_request.get('type') == 'struct':
                            response = self.tool_caller.extractor.extract_struct(
                                tool_request['name'],
                                file_path if file_path else None
                            )
                        else:
                            continue
                        
                        # Store the request for history
                        tool_requests.append({
                            "request": tool_request,
                            "response": response.__dict__ if hasattr(response, '__dict__') else response
                        })
                        
                        # Add successful responses to context
                        if hasattr(response, 'status') and response.status == "success" and response.content:
                            context_type = tool_request['type']
                            context_name = tool_request['name']
                            new_context_parts.append(f"""
/*--- {context_type.upper()}: {context_name} ---*/
{response.content}
/*--- END {context_type.upper()}: {context_name} ---*/""")
                        
                        tool_requests_made += 1
                        
                    except Exception as e:
                        logger.warning(f"Failed to process tool request: {e}")
                        continue
                
                if not new_context_parts:
                    break  # No successful tool calls
                
                # Add new context and ask for updated analysis
                enhanced_context += "\n".join(new_context_parts)
                
                updated_prompt = f"""Based on the original function and the additional context provided below, please provide a comprehensive analysis.

Original function: {function_name}
```c
{source_code}
```

Additional context:
{enhanced_context}

Please provide your final analysis of the function, considering all the additional context."""
                
                # Make follow-up call with enhanced context
                response = self.client.chat.completions.create(
                    model=model_id,
                    messages=[
                        {"role": "system", "content": "You are a security and code quality analyst. Provide a thorough analysis of the given C function."},
                        {"role": "user", "content": updated_prompt}
                    ],
                    max_tokens=4000,
                    temperature=0.1
                )
                
                current_analysis = response.choices[0].message.content
            
            # Create the final result
            result = {
                "status": "success",
                "analysis": current_analysis,
                "function_name": function_name,
                "file_path": file_path,
                "model_used": model_id,
                "custom_prompt": custom_prompt,
                "tool_requests": tool_requests,
                "enhanced_context_used": bool(enhanced_context)
            }
            
            return result
            
        except Exception as e:
            logger.error(f"Error in tool-enhanced analysis: {e}")
            return {
                "status": "error",
                "error": str(e),
                "function_name": function_name,
                "file_path": file_path,
                "tool_requests": tool_requests
            }

# Helper function for backward compatibility
def get_llm_analyzer() -> LLMAnalyzer:
    """Get LLM analyzer instance"""
    return LLMAnalyzer()

# Exports for backward compatibility with tests
AVAILABLE_MODELS = [
    {
        "id": "gpt-3.5-turbo",
        "name": "GPT-3.5 Turbo",
        "description": "Fast and cost-effective model for most tasks",
        "max_tokens": 4096
    },
    {
        "id": "gpt-4",
        "name": "GPT-4",
        "description": "Most capable model with enhanced reasoning",
        "max_tokens": 8192
    },
    {
        "id": "gpt-4-turbo-preview", 
        "name": "GPT-4 Turbo",
        "description": "Latest GPT-4 with improved performance",
        "max_tokens": 128000
    }
]

SYSTEM_PROMPT = "You are an expert kernel security analyst."