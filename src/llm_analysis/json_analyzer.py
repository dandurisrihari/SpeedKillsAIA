#!/usr/bin/env python3
"""
JSON Analysis Tool for AI Accelerator (AIA) Kernel Driver Analysis

This module analyzes JSON files containing kernel operation data and uses OpenAI APIs
to assess functions for AI Accelerator relevance, kernel driver entry points, and
message structure handling.
"""

from typing import Dict, List
from pathlib import Path

from .models import GPTModel, AnalysisResult
from .parsers import JSONParser
from .openai_client import OpenAIClient
from .processors import FunctionProcessor, DMAProcessor, UserCopyProcessor, IOCTLProcessor
from .output import OutputFormatter


class JSONAnalyzer:
    """Main analyzer class for processing JSON files with OpenAI analysis"""
    
    def __init__(self, model: str = GPTModel.GPT_3_5_TURBO.value, verbose: bool = False):
        self.model = model
        self.verbose = verbose
        
        # Initialize components
        self.parser = JSONParser(verbose=verbose)
        self.openai_client = OpenAIClient(model=model, verbose=verbose)
        self.output_formatter = OutputFormatter(verbose=verbose)
        
        # Initialize processors
        self.function_processor = FunctionProcessor(self.openai_client)
        self.dma_processor = DMAProcessor(self.openai_client)
        self.user_copy_processor = UserCopyProcessor(self.openai_client)
        self.ioctl_processor = IOCTLProcessor(self.openai_client)
    
    def analyze_json_file(self, json_file_path: str) -> Dict[str, List[AnalysisResult]]:
        """Analyze a JSON file and return results grouped by operation type"""
        # Parse the JSON file
        parsed_data = self.parser.parse_file(json_file_path)
        
        results = {}
        
        # Process each operation type
        if parsed_data['functions_by_file']:
            results['functions_by_file'] = self.function_processor.process(
                parsed_data['functions_by_file']
            )
        
        if parsed_data['dma_operations']:
            results['dma_operations'] = self.dma_processor.process(
                parsed_data['dma_operations']
            )
        
        if parsed_data['user_copy_operations']:
            results['user_copy_operations'] = self.user_copy_processor.process(
                parsed_data['user_copy_operations']
            )
        
        if parsed_data['ioctl_operations']:
            results['ioctl_operations'] = self.ioctl_processor.process(
                parsed_data['ioctl_operations']
            )
        
        return results
    
    def export_results_to_yaml(self, results: Dict[str, List[AnalysisResult]], output_file: str):
        """Export analysis results to YAML file"""
        self.output_formatter.export_to_yaml(results, output_file)
    
    def print_results_summary(self, results: Dict[str, List[AnalysisResult]]):
        """Print a summary of analysis results"""
        self.output_formatter.print_summary(results)
    
    def count_total_functions(self, results: Dict[str, List[AnalysisResult]]) -> int:
        """Count total functions analyzed"""
        return self.output_formatter.count_total_functions(results)
