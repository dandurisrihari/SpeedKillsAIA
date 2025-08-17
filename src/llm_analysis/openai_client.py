#!/usr/bin/env python3
"""
OpenAI API client for LLM analysis
"""

import os
from typing import Optional
import openai
from dotenv import load_dotenv

from .models import AnalysisResult


class OpenAIClient:
    """Client for OpenAI API interactions"""
    
    def __init__(self, model: str = "gpt-3.5-turbo", verbose: bool = False):
        self.model = model
        self.verbose = verbose
        self._load_environment()
        self._setup_client()
    
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
    
    def _log_verbose(self, message: str):
        """Log verbose messages if verbose mode is enabled"""
        if self.verbose:
            print(f"[VERBOSE] {message}")
    
    def analyze_function(self, function_code: str, stack_trace: Optional[str] = None, operation_type: str = "") -> AnalysisResult:
        """Analyze a function using OpenAI API"""
        from .prompts import create_analysis_prompt
        from .response_parser import ResponseParser
        
        prompt = create_analysis_prompt(function_code, stack_trace, operation_type)
        
        try:
            self._log_verbose(f"Sending request to OpenAI using model: {self.model}")
            
            response = self.client.chat.completions.create(
                model=self.model,
                messages=[
                    {"role": "system", "content": "You are an expert Linux Kernel Driver developer specializing in AI Accelerator integration."},
                    {"role": "user", "content": prompt}
                ],
                max_tokens=1500,
                temperature=0.1
            )
            
            response_text = response.choices[0].message.content
            self._log_verbose(f"Received response from OpenAI")
            
            parser = ResponseParser(verbose=self.verbose)
            return parser.parse_response(response_text)
            
        except Exception as e:
            self._log_verbose(f"Error calling OpenAI API: {e}")
            return AnalysisResult(
                function_name="API Error",
                aia_relevant_function=0,
                relevant_kd_entry_point=0,
                message_structure_handling=0,
                smids_identified=[],
                reasoning=[f"OpenAI API error: {str(e)}"]
            )
