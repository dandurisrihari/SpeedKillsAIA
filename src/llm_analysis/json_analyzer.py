#!/usr/bin/env python3
"""
JSON Analysis Tool for AI Accelerator (AIA) Kernel Driver Analysis

This module analyzes JSON files containing kernel operation data and uses OpenAI APIs
to assess functions for AI Accelerator relevance, kernel driver entry points, and
message structure handling.
"""

from typing import Dict, List, Optional
from pathlib import Path

from .models import GPTModel, AnalysisResult, FunctionEntry
from .parsers import JSONParser
from .openai_client import OpenAIClient
from .processors import FunctionProcessor, DMAProcessor, IOCTLProcessor
from .output import OutputFormatter
from .llm_logger import get_logger
from .top_analysis import TopAnalyzer


class JSONAnalyzer:
    """Main analyzer class for processing JSON files with OpenAI analysis"""
    
    def __init__(self, model: str = GPTModel.GPT_4O_MINI.value, verbose: bool = False, enable_tools: bool = True, verbose_log_file: Optional[str] = None):
        self.model = model
        self.verbose = verbose
        self.enable_tools = enable_tools
        self.verbose_log_file = verbose_log_file
        
        # Initialize logger first (it may be used by other components)
        self.logger = get_logger(verbose=verbose, custom_log_file=verbose_log_file)
        
        # Initialize components
        self.parser = JSONParser(verbose=verbose)
        self.openai_client = OpenAIClient(model=model, verbose=verbose, enable_tools=enable_tools, logger=self.logger)
        self.output_formatter = OutputFormatter(verbose=verbose)
        
        # Initialize processors
        self.function_processor = FunctionProcessor(self.openai_client)
        self.dma_processor = DMAProcessor(self.openai_client)
        self.ioctl_processor = IOCTLProcessor(self.openai_client)
        
        # Note: Logger was already initialized above
    
    def analyze_json_file(self, json_file_path: str) -> Dict[str, List[AnalysisResult]]:
        """Analyze a JSON file and return results grouped by operation type"""
        import time
        session_start_time = time.time()
        
        # Parse the JSON file
        parsed_data = self.parser.parse_file(json_file_path)
        
        results = {}
        total_functions = 0
        
        # Process each operation type
        if parsed_data['functions_by_file']:
            results['functions_by_file'] = self.function_processor.process(
                parsed_data['functions_by_file']
            )
            total_functions += len(results['functions_by_file'])
        
        if parsed_data['dma_operations']:
            results['dma_operations'] = self.dma_processor.process(
                parsed_data['dma_operations']
            )
            total_functions += len(results['dma_operations'])
        
        if parsed_data['user_copy_operations']:
            # Note: UserCopyProcessor has been removed - treating as regular functions
            # Convert to function entries and process with function processor
            user_copy_functions = []
            for uc_op in parsed_data['user_copy_operations']:
                func_entry = FunctionEntry(
                    function_name=uc_op.function_name,
                    file_path="user_copy",  # placeholder file path
                    function_code=uc_op.function_code,
                    preprocessed_code=uc_op.preprocessed_code,
                    preprocessed_file_path=uc_op.preprocessed_file_path
                )
                user_copy_functions.append(func_entry)
            
            results['user_copy_operations'] = self.function_processor.process(
                user_copy_functions
            )
            total_functions += len(results['user_copy_operations'])
        
        if parsed_data['ioctl_operations']:
            results['ioctl_operations'] = self.ioctl_processor.process(
                parsed_data['ioctl_operations']
            )
            total_functions += len(results['ioctl_operations'])
        
        # Log session summary
        session_time = time.time() - session_start_time
        self.logger.log_session_summary(total_functions, session_time)
        
        # Generate and log top analysis if verbose logging is enabled
        if self.verbose and hasattr(self.logger, 'log_file') and self.logger.log_file:
            self._append_top_analysis_to_log(results)
        
        return results
    
    def _append_top_analysis_to_log(self, results: Dict[str, List[AnalysisResult]]):
        """Append top analysis to the verbose log file"""
        try:
            top_analyzer = TopAnalyzer(verbose=self.verbose)
            top_analysis = top_analyzer.generate_top_analysis(results)
            formatted_log = top_analyzer.format_for_verbose_log(top_analysis)
            
            # Append to the verbose log file
            with open(self.logger.log_file, 'a', encoding='utf-8') as f:
                f.write('\n\n')
                f.write(formatted_log)
                f.write('\n')
                
            if self.verbose:
                print(f"[JSONAnalyzer] Top analysis appended to verbose log: {self.logger.log_file}")
                
        except Exception as e:
            if self.verbose:
                print(f"[JSONAnalyzer] Error appending top analysis to log: {e}")
        
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
