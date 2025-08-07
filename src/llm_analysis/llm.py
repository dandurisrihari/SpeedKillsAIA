#!/usr/bin/env python3
"""
LLM Analysis Module - AI-powered analysis for kernel instrumentation

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
    """AI-powered analyzer for kernel instrumentation data"""
    
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
        """Limit text length for web UI display"""
        if len(text) <= max_length:
            return text
        
        # Truncate and add indicator
        truncated = text[:max_length - 100]
        return f"{truncated}\n\n... [Output truncated for web display. Full analysis available in saved report.]"
    
    def analyze_function(self, function_name: str, source_code: str, file_path: str = "", 
                        custom_prompt: str = "", model_id: str = "gpt-3.5-turbo", for_web_ui: bool = False) -> Dict[str, Any]:
        """Analyze a specific function for security issues and best practices"""
        
        # Check if LLM is available
        if not self.is_available():
            return {
                "status": "unavailable",
                "analysis": "LLM analysis is not available. Please check OpenAI API configuration.",
                "error": "LLM analysis is not available. Please check OpenAI API configuration.",
                "function_name": function_name,
                "file_path": file_path,
                "model_used": model_id,
                "custom_prompt": custom_prompt
            }
        
        base_prompt = f"""
You are a security expert analyzing kernel code. Please analyze the following function for:
1. Security vulnerabilities (buffer overflows, race conditions, etc.)
2. Code quality and best practices
3. Performance considerations
4. Potential attack vectors

Function: {function_name}
File: {file_path}

Source Code:
{source_code}

{f"Additional focus: {custom_prompt}" if custom_prompt else ""}

Please provide a structured analysis with specific recommendations.
"""
        
        messages = [
            {"role": "system", "content": "You are an expert kernel security analyst."},
            {"role": "user", "content": base_prompt}
        ]
        
        # Use appropriate token limits based on context
        max_tokens = 1500 if for_web_ui else 2000
        analysis, error = self._make_request(messages, model_id, max_tokens)
        
        # Limit output for web UI
        if for_web_ui and analysis:
            analysis = self._limit_tokens_for_web_ui(analysis)
        
        return {
            "status": "success" if analysis else "error",
            "analysis": analysis or "Failed to generate analysis",
            "error": error if error else ("Function analysis failed" if not analysis else None),
            "function_name": function_name,
            "file_path": file_path,
            "model_used": model_id,
            "custom_prompt": custom_prompt
        }
    
    def analyze_dma_operation(self, dma_operation: Dict[str, Any], function_code: str = "", 
                            call_graph: List[str] = None, custom_prompt: str = "", 
                            model_id: str = "gpt-3.5-turbo", for_web_ui: bool = False) -> Dict[str, Any]:
        """Analyze DMA operations for security and correctness"""
        
        call_graph_str = " -> ".join(call_graph) if call_graph else "Not available"
        
        base_prompt = f"""
You are a security expert analyzing DMA operations in kernel code. Please analyze:
1. DMA coherency and synchronization issues
2. Potential race conditions
3. Memory safety concerns
4. Attack vectors related to DMA

DMA Operation Details:
- Function: {dma_operation.get('dma_function', 'Unknown')}
- Caller: {dma_operation.get('caller_function', 'Unknown')}
- File: {dma_operation.get('file_path', 'Unknown')}
- Line: {dma_operation.get('line_number', 'Unknown')}

Call Graph: {call_graph_str}

{f"Associated Function Code:\n{function_code}" if function_code else ""}

{f"Additional focus: {custom_prompt}" if custom_prompt else ""}

Provide specific security recommendations for this DMA operation.
"""
        
        messages = [
            {"role": "system", "content": "You are an expert in kernel DMA security analysis."},
            {"role": "user", "content": base_prompt}
        ]
        
        # Use appropriate token limits based on context
        max_tokens = 1500 if for_web_ui else 2000
        analysis, error = self._make_request(messages, model_id, max_tokens)
        
        # Limit output for web UI
        if for_web_ui and analysis:
            analysis = self._limit_tokens_for_web_ui(analysis)
        
        return {
            "status": "success" if analysis else "error",
            "analysis": analysis or "Failed to generate DMA analysis",
            "error": error if error else ("DMA analysis failed" if not analysis else None),
            "dma_operation": dma_operation,
            "model_used": model_id,
            "custom_prompt": custom_prompt
        }
    
    def analyze_user_copy_operation(self, user_copy_operation: Dict[str, Any], function_code: str = "", 
                                  custom_prompt: str = "", model_id: str = "gpt-3.5-turbo", 
                                  for_web_ui: bool = False) -> Dict[str, Any]:
        """Analyze user copy operations for security issues"""
        
        base_prompt = f"""
You are a security expert analyzing user-space to kernel-space data copy operations. Please analyze:
1. Buffer overflow vulnerabilities
2. Input validation issues
3. Privilege escalation possibilities
4. Memory corruption vulnerabilities
5. TOCTOU (Time of Check to Time of Use) vulnerabilities

User Copy Operation Details:
- Function: {user_copy_operation.get('copy_function', 'Unknown')}
- Caller: {user_copy_operation.get('caller_function', 'Unknown')}
- File: {user_copy_operation.get('file_path', 'Unknown')}
- Line: {user_copy_operation.get('line_number', 'Unknown')}

{f"Associated Function Code:\n{function_code}" if function_code else ""}

{f"Additional focus: {custom_prompt}" if custom_prompt else ""}

Provide specific security recommendations for this user copy operation.
"""
        
        messages = [
            {"role": "system", "content": "You are an expert in kernel security analysis, particularly user-space interfaces."},
            {"role": "user", "content": base_prompt}
        ]
        
        # Use appropriate token limits based on context
        max_tokens = 1500 if for_web_ui else 2000
        analysis, error = self._make_request(messages, model_id, max_tokens)
        
        # Limit output for web UI
        if for_web_ui and analysis:
            analysis = self._limit_tokens_for_web_ui(analysis)
        
        return {
            "status": "success" if analysis else "error",
            "analysis": analysis or "Failed to generate user copy analysis",
            "error": error if error else ("User copy analysis failed" if not analysis else None),
            "user_copy_operation": user_copy_operation,
            "model_used": model_id,
            "custom_prompt": custom_prompt
        }
    
    def analyze_ioctl_handler(self, ioctl_operation: Dict[str, Any], function_code: str = "", 
                            custom_prompt: str = "", model_id: str = "gpt-3.5-turbo", 
                            for_web_ui: bool = False) -> Dict[str, Any]:
        """Analyze IOCTL handler operations for security issues"""
        
        base_prompt = f"""
You are a security expert analyzing IOCTL handler functions in kernel code. Please analyze:
1. Input validation and sanitization
2. Privilege escalation vulnerabilities
3. Buffer overflow and underflow issues
4. Integer overflow/underflow vulnerabilities
5. Improper access control
6. Information disclosure vulnerabilities

IOCTL Handler Details:
- Function: {ioctl_operation.get('function_name', 'Unknown')}
- File: {ioctl_operation.get('file_path', 'Unknown')}
- Line: {ioctl_operation.get('line_number', 'Unknown')}

{f"Function Code:\n{function_code}" if function_code else ""}

{f"Additional focus: {custom_prompt}" if custom_prompt else ""}

Provide specific security recommendations for this IOCTL handler.
"""
        
        messages = [
            {"role": "system", "content": "You are an expert in kernel security analysis, particularly IOCTL interfaces."},
            {"role": "user", "content": base_prompt}
        ]
        
        # Use appropriate token limits based on context
        max_tokens = 1500 if for_web_ui else 2000
        analysis, error = self._make_request(messages, model_id, max_tokens)
        
        # Limit output for web UI
        if for_web_ui and analysis:
            analysis = self._limit_tokens_for_web_ui(analysis)
        
        return {
            "status": "success" if analysis else "error",
            "analysis": analysis or "Failed to generate IOCTL analysis",
            "error": error if error else ("IOCTL analysis failed" if not analysis else None),
            "ioctl_operation": ioctl_operation,
            "model_used": model_id,
            "custom_prompt": custom_prompt
        }
    
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