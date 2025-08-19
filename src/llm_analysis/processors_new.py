#!/usr/bin/env python3
"""
Processors for different types of analysis data
"""

from typing import List, Dict, Any
from .models import AnalysisResult, FunctionEntry, DMAOperation
from .openai_client import OpenAIClient


def process_function_with_llm(function_data: Dict[str, Any], 
                             client: OpenAIClient,
                             enable_tools: bool = False) -> Dict[str, Any]:
    """
    Process a single function with LLM analysis
    
    Args:
        function_data: Dictionary containing function information
        client: OpenAI client instance
        enable_tools: Whether to enable tool calling functionality
        
    Returns:
        Dictionary with analysis results
    """
    try:
        # Extract function information
        function_name = function_data.get('function_name', 'Unknown')
        function_code = function_data.get('function_code', '')
        preprocessed_file_path = function_data.get('preprocessed_file_path')
        
        if not function_code:
            return {
                'function_name': function_name,
                'analysis': 'Error: No function code provided',
                'error': 'Missing function code'
            }
        
        # Perform LLM analysis with optional tool calling
        analysis_result = client.analyze_function(
            function_code=function_code,
            function_name=function_name,
            preprocessed_file_path=preprocessed_file_path,
            enable_tools=enable_tools
        )
        
        return {
            'function_name': function_name,
            'function_code': function_code,
            'preprocessed_file_path': preprocessed_file_path,
            'analysis': analysis_result,
            'tools_enabled': enable_tools
        }
        
    except Exception as e:
        return {
            'function_name': function_data.get('function_name', 'Unknown'),
            'analysis': f'Error during analysis: {str(e)}',
            'error': str(e)
        }


class BaseProcessor:
    """Base class for all processors"""
    
    def __init__(self, client: OpenAIClient, verbose: bool = False, enable_tools: bool = False):
        """Initialize processor with client and options"""
        self.client = client
        self.verbose = verbose
        self.enable_tools = enable_tools
    
    def _log_verbose(self, message: str):
        """Log message if verbose mode is enabled"""
        if self.verbose:
            print(f"[Processor] {message}")


class FunctionProcessor(BaseProcessor):
    """Processor for function analysis"""
    
    def process(self, functions: List[FunctionEntry]) -> List[AnalysisResult]:
        """Process function entries"""
        results = []
        
        self._log_verbose(f"Processing {len(functions)} function entries")
        
        for i, func_entry in enumerate(functions):
            function_name = f"{func_entry.file_path}:{func_entry.function_name}"
            function_code = func_entry.get_code()
            
            if not function_code:
                self._log_verbose(f"Skipping function {i+1}/{len(functions)}: {function_name} (no code)")
                continue
            
            self._log_verbose(f"Analyzing function {i+1}/{len(functions)}: {function_name}")
            
            # Use new function signature
            analysis_text = self.client.analyze_function(
                function_code=function_code,
                function_name=function_name,
                preprocessed_file_path=func_entry.preprocessed_file_path,
                enable_tools=self.enable_tools
            )
            
            result = AnalysisResult(
                function_name=function_name,
                analysis=analysis_text,
                operation_type="functions_by_file"
            )
            results.append(result)
        
        return results


class DMAProcessor(BaseProcessor):
    """Processor for DMA operations"""
    
    def process(self, dma_ops: List[DMAOperation]) -> List[AnalysisResult]:
        """Process DMA operations"""
        results = []
        
        self._log_verbose(f"Processing {len(dma_ops)} DMA operation entries")
        
        for i, dma_op in enumerate(dma_ops):
            function_name = f"{dma_op.file_path}:{dma_op.function_name}"
            function_code = dma_op.get_code()
            
            if not function_code:
                self._log_verbose(f"Skipping DMA operation {i+1}/{len(dma_ops)}: {function_name} (no code)")
                continue
            
            self._log_verbose(f"Analyzing DMA operation {i+1}/{len(dma_ops)}: {function_name}")
            
            # Use new function signature  
            analysis_text = self.client.analyze_function(
                function_code=function_code,
                function_name=function_name,
                preprocessed_file_path=dma_op.preprocessed_file_path,
                enable_tools=self.enable_tools
            )
            
            result = AnalysisResult(
                function_name=function_name,
                analysis=analysis_text,
                operation_type="dma_operations"
            )
            results.append(result)
        
        return results


class IOCTLProcessor(BaseProcessor):
    """Processor for IOCTL operations"""
    
    def process(self, ioctls: List[Dict[str, Any]]) -> List[AnalysisResult]:
        """Process IOCTL operations"""
        results = []
        
        self._log_verbose(f"Processing {len(ioctls)} IOCTL entries")
        
        for i, ioctl in enumerate(ioctls):
            function_name = ioctl.get('function_name', f'ioctl_{i}')
            function_code = ioctl.get('function_code', '')
            preprocessed_file_path = ioctl.get('preprocessed_file_path')
            
            if not function_code:
                self._log_verbose(f"Skipping IOCTL {i+1}/{len(ioctls)}: {function_name} (no code)")
                continue
            
            self._log_verbose(f"Analyzing IOCTL {i+1}/{len(ioctls)}: {function_name}")
            
            # Use new function signature
            analysis_text = self.client.analyze_function(
                function_code=function_code,
                function_name=function_name,
                preprocessed_file_path=preprocessed_file_path,
                enable_tools=self.enable_tools
            )
            
            result = AnalysisResult(
                function_name=function_name,
                analysis=analysis_text,
                operation_type="ioctl_operations"
            )
            results.append(result)
        
        return results


def create_processor(operation_type: str, client: OpenAIClient, 
                    verbose: bool = False, enable_tools: bool = False) -> BaseProcessor:
    """Factory function to create appropriate processor"""
    
    processors = {
        'functions_by_file': FunctionProcessor,
        'dma_operations': DMAProcessor, 
        'ioctl_operations': IOCTLProcessor
    }
    
    processor_class = processors.get(operation_type, FunctionProcessor)
    return processor_class(client, verbose=verbose, enable_tools=enable_tools)
