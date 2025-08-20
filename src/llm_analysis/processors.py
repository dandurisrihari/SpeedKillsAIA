#!/usr/bin/env python3
"""
Processors for different types of analysis data
"""

from typing import List, Dict, Any
from .models import AnalysisResult, FunctionEntry, DMAOperation, IOCTLOperation
from .openai_client import OpenAIClient
from .response_parser import ResponseParser


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
    
    def __init__(self, client: OpenAIClient):
        self.client = client
        self.response_parser = ResponseParser(verbose=client.verbose)
        self.enable_tools = client.enable_tools
    
    def _log_verbose(self, message: str):
        """Log verbose messages if verbose mode is enabled"""
        if self.client.verbose:
            print(f"[VERBOSE] {message}")


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
            
            # Show progress for each function
            progress_msg = f"[{i+1}/{len(functions)}] Analyzing: {function_name}"
            if len(progress_msg) > 100:
                # Truncate long function names
                display_name = function_name[:90] + "..."
                progress_msg = f"[{i+1}/{len(functions)}] Analyzing: {display_name}"
            print(progress_msg)
            
            self._log_verbose(f"Analyzing function {i+1}/{len(functions)}: {function_name}")
            
            # Use new function signature - this now returns AnalysisResult directly
            result = self.client.analyze_function(
                function_code=function_code,
                function_name=function_name,
                preprocessed_file_path=func_entry.preprocessed_file_path,
                enable_tools=self.enable_tools
            )
            
            # Update function name to include file path
            result.function_name = function_name
            results.append(result)
        
        return results


class DMAProcessor(BaseProcessor):
    """Processor for DMA operations"""
    
    def process(self, dma_ops: List[DMAOperation]) -> List[AnalysisResult]:
        """Process DMA operations"""
        results = []
        
        self._log_verbose(f"Processing {len(dma_ops)} DMA operation entries")
        
        for i, dma_op in enumerate(dma_ops):
            function_name = dma_op.function_name  # Use just the function name
            function_code = dma_op.get_code()
            
            if not function_code:
                self._log_verbose(f"Skipping DMA operation {i+1}/{len(dma_ops)}: {function_name} (no code)")
                continue
            
            # Show progress for each DMA operation
            progress_msg = f"[{i+1}/{len(dma_ops)}] Analyzing DMA operation: {function_name}"
            if len(progress_msg) > 100:
                # Truncate long function names
                display_name = function_name[:75] + "..."
                progress_msg = f"[{i+1}/{len(dma_ops)}] Analyzing DMA operation: {display_name}"
            print(progress_msg)
            
            self._log_verbose(f"Analyzing DMA operation {i+1}/{len(dma_ops)}: {function_name}")
            
            # Use new function signature - this now returns AnalysisResult directly
            result = self.client.analyze_function(
                function_code=function_code,
                function_name=function_name,
                preprocessed_file_path=dma_op.preprocessed_file_path,
                enable_tools=self.enable_tools
            )
            
            # Update function name to include file path
            result.function_name = function_name
            results.append(result)
        
        return results


class IOCTLProcessor(BaseProcessor):
    """Processor for IOCTL operations"""
    
    def process(self, ioctls: List[IOCTLOperation]) -> List[AnalysisResult]:
        """Process IOCTL operations"""
        results = []
        
        self._log_verbose(f"Processing {len(ioctls)} IOCTL entries")
        
        for i, ioctl in enumerate(ioctls):
            function_name = ioctl.function_name  # Use just the function name
            function_code = ioctl.get_code()
            preprocessed_file_path = getattr(ioctl, 'preprocessed_file_path', None)
            
            if not function_code:
                self._log_verbose(f"Skipping IOCTL {i+1}/{len(ioctls)}: {function_name} (no code)")
                continue
            
            # Show progress for each IOCTL operation
            progress_msg = f"[{i+1}/{len(ioctls)}] Analyzing IOCTL: {function_name}"
            if len(progress_msg) > 100:
                # Truncate long function names
                display_name = function_name[:80] + "..."
                progress_msg = f"[{i+1}/{len(ioctls)}] Analyzing IOCTL: {display_name}"
            print(progress_msg)
            
            self._log_verbose(f"Analyzing IOCTL {i+1}/{len(ioctls)}: {function_name}")
            
            # Use new function signature - this now returns AnalysisResult directly
            result = self.client.analyze_function(
                function_code=function_code,
                function_name=function_name,
                preprocessed_file_path=preprocessed_file_path,
                enable_tools=self.enable_tools
            )
            
            # Update function name if needed
            result.function_name = function_name
            results.append(result)
        
        return results


def create_processor(operation_type: str, client: OpenAIClient) -> BaseProcessor:
    """Factory function to create appropriate processor"""
    
    processors = {
        'functions_by_file': FunctionProcessor,
        'dma_operations': DMAProcessor, 
        'ioctl_operations': IOCTLProcessor
    }
    
    processor_class = processors.get(operation_type, FunctionProcessor)
    return processor_class(client)
