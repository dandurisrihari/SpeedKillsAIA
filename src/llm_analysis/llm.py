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
    
    def __init__(self, model_id=None):
        """Initialize LLM analyzer with OpenAI API configuration"""
        self.client = None
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
        
        truncation_msg = "... Output truncated for web display"
        # Try to cut at a sentence boundary
        cutoff = text[:max_length-len(truncation_msg)].rfind('.')
        if cutoff > (max_length-len(truncation_msg)) * 0.8:  # If we find a sentence end near the limit
            return text[:cutoff + 1] + truncation_msg
        else:
            return text[:max_length-len(truncation_msg)] + truncation_msg
    
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
    
    def analyze_function(self, function_name: str, source_code: str, file_path: str = "", 
                        custom_prompt: str = "", model_id: str = "gpt-3.5-turbo", 
                        for_web_ui: bool = False) -> Dict[str, Any]:
        """Analyze general function for AIA integration patterns"""
        
        function_data = {
            "function_name": function_name,
            "file_path": file_path,
            "source_code": source_code
        }
        
        # Use AIA-specific analysis for general functions (focuses on AIARelevantFunction and Entry Points)
        return self._analyze_aia_integration(
            code_block=function_data,
            function_code=source_code,
            custom_prompt=custom_prompt,
            model_id=model_id,
            for_web_ui=for_web_ui,
            analysis_type="general_function"
        )
    
    def analyze_dma_operation(self, dma_operation: Dict[str, Any], function_code: str = "", 
                            call_graph: List[str] = None, custom_prompt: str = "", 
                            model_id: str = "gpt-3.5-turbo", for_web_ui: bool = False) -> Dict[str, Any]:
        """Analyze DMA operations for AIA integration patterns"""
        
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
            custom_prompt=custom_prompt,
            model_id=model_id,
            for_web_ui=for_web_ui,
            analysis_type="dma_operation"
        )
        
        # Add DMA-specific fields for backward compatibility
        result.update({
            "dma_operation": dma_operation
        })
        
        return result
    
    def analyze_user_copy_operation(self, user_copy_operation: Dict[str, Any], function_code: str = "", 
                                  custom_prompt: str = "", model_id: str = "gpt-3.5-turbo", 
                                  for_web_ui: bool = False) -> Dict[str, Any]:
        """Analyze user copy operations for AIA integration patterns"""
        
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
            custom_prompt=custom_prompt,
            model_id=model_id,
            for_web_ui=for_web_ui,
            analysis_type="user_copy_operation"
        )
        
        # Add user copy-specific fields for backward compatibility
        result.update({
            "user_copy_operation": user_copy_operation
        })
        
        return result
    
    def analyze_ioctl_handler(self, ioctl_operation: Dict[str, Any], function_code: str = "", 
                            custom_prompt: str = "", model_id: str = "gpt-3.5-turbo", 
                            for_web_ui: bool = False) -> Dict[str, Any]:
        """Analyze IOCTL handler operations for AIA integration patterns"""
        
        # Use AIA-specific analysis for ioctl handlers (focuses on Message Structure Handling)
        return self._analyze_aia_integration(
            code_block=ioctl_operation,
            function_code=function_code,
            custom_prompt=custom_prompt,
            model_id=model_id,
            for_web_ui=for_web_ui,
            analysis_type="ioctl_handler"
        )

    def analyze_function(self, function_name: str, source_code: str, file_path: str = "", 
                        custom_prompt: str = "", model_id: str = "gpt-3.5-turbo", 
                        for_web_ui: bool = False) -> Dict[str, Any]:
        """Analyze general function for AIA integration patterns"""
        
        function_data = {
            "function_name": function_name,
            "file_path": file_path,
            "source_code": source_code
        }
        
        # Use AIA-specific analysis for general functions (focuses on AIARelevantFunction and Entry Points)
        return self._analyze_aia_integration(
            code_block=function_data,
            function_code=source_code,
            custom_prompt=custom_prompt,
            model_id=model_id,
            for_web_ui=for_web_ui,
            analysis_type="general_function"
        )

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
  • SMID (shared memory identifier)
  • Device virtual address, physical address, DMA address
  • Memory size, flags, or similar metadata
These structures may represent requests by user space for AIA to access certain memory pages, or responses from kernel about memory regions accessible to the AIA.
"""
        elif analysis_type == "user_copy_operation":
            # For user copy operations: Default focus on Message Structure Handling
            primary_focus = """
3. Message Structure Handling (PRIMARY FOCUS)
Assign a confidence score if the code block handles message structures exchanged between user space and kernel, especially involving Shared Memory Identifiers (SMIDs). These are usually detected via:
• Use of copy_from_user() / copy_to_user()
• Structures passed between user space and kernel that include:
  • SMID (shared memory identifier)
  • Device virtual address, physical address, DMA address
  • Memory size, flags, or similar metadata
These structures may represent requests by user space for AIA to access certain memory pages, or responses from kernel about memory regions accessible to the AIA.
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
Reasoning:
  - Describe the rationale behind each confidence score
  - Reference specific APIs used (e.g., get_user_pages, dma_map_page, copy_from_user)
  - Mention any relevant ioctl code names or struct fields (e.g., smid, phys_addr)
  - Indicate if there's a flow from user space to kernel to AIA
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
            "confidence_scores": confidence_scores
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