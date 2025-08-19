#!/usr/bin/env python3
"""
Operation processors for different types of kernel operations
"""

from typing import List
from .models import AnalysisResult, FunctionEntry, DMAOperation, UserCopyOperation, IOCTLOperation
from .openai_client import OpenAIClient


class BaseProcessor:
    """Base class for operation processors"""
    
    def __init__(self, openai_client: OpenAIClient):
        self.client = openai_client
    
    def _log_verbose(self, message: str):
        """Log verbose messages if verbose mode is enabled"""
        if self.client.verbose:
            print(f"[VERBOSE] {message}")


class FunctionProcessor(BaseProcessor):
    """Processor for function entries"""
    
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
            
            result = self.client.analyze_function(
                function_code=function_code,
                operation_type="functions_by_file",
                preprocessed_file_path=func_entry.preprocessed_file_path
            )
            result.function_name = function_name
            results.append(result)
        
        return results


class DMAProcessor(BaseProcessor):
    """Processor for DMA operations"""
    
    def process(self, dma_ops: List[DMAOperation]) -> List[AnalysisResult]:
        """Process DMA operations"""
        results = []
        
        self._log_verbose(f"Processing {len(dma_ops)} DMA operation entries")
        
        for i, dma_entry in enumerate(dma_ops):
            function_name = dma_entry.function_name
            function_code = dma_entry.get_code()
            stack_trace = dma_entry.stack_trace
            
            if not function_code:
                self._log_verbose(f"Skipping DMA operation {i+1}/{len(dma_ops)}: {function_name} (no code)")
                continue
            
            self._log_verbose(f"Analyzing DMA operation {i+1}/{len(dma_ops)}: {function_name}")
            
            result = self.client.analyze_function(
                function_code=function_code,
                stack_trace=stack_trace,
                operation_type="dma_operations",
                preprocessed_file_path=dma_entry.preprocessed_file_path
            )
            result.function_name = function_name
            results.append(result)
        
        return results


class UserCopyProcessor(BaseProcessor):
    """Processor for user copy operations"""
    
    def process(self, copy_ops: List[UserCopyOperation]) -> List[AnalysisResult]:
        """Process user copy operations"""
        results = []
        
        self._log_verbose(f"Processing {len(copy_ops)} user copy operation entries")
        
        for i, copy_entry in enumerate(copy_ops):
            function_name = copy_entry.function_name
            function_code = copy_entry.get_code()
            
            if not function_code:
                self._log_verbose(f"Skipping user copy operation {i+1}/{len(copy_ops)}: {function_name} (no code)")
                continue
            
            self._log_verbose(f"Analyzing user copy operation {i+1}/{len(copy_ops)}: {function_name}")
            
            result = self.client.analyze_function(
                function_code=function_code,
                operation_type="user_copy_operations",
                preprocessed_file_path=copy_entry.preprocessed_file_path
            )
            result.function_name = function_name
            results.append(result)
        
        return results


class IOCTLProcessor(BaseProcessor):
    """Processor for IOCTL operations"""
    
    def process(self, ioctl_ops: List[IOCTLOperation]) -> List[AnalysisResult]:
        """Process IOCTL operations"""
        results = []
        
        self._log_verbose(f"Processing {len(ioctl_ops)} ioctl operation entries")
        
        for i, ioctl_entry in enumerate(ioctl_ops):
            function_name = ioctl_entry.function_name
            function_code = ioctl_entry.get_code()
            
            if not function_code:
                self._log_verbose(f"Skipping ioctl operation {i+1}/{len(ioctl_ops)}: {function_name} (no code)")
                continue
            
            self._log_verbose(f"Analyzing ioctl operation {i+1}/{len(ioctl_ops)}: {function_name}")
            
            result = self.client.analyze_function(
                function_code=function_code,
                operation_type="ioctl_operations",
                preprocessed_file_path=ioctl_entry.preprocessed_file_path
            )
            result.function_name = function_name
            results.append(result)
        
        return results
