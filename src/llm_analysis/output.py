#!/usr/bin/env python3
"""
Output utilities for analysis results
"""

import yaml
from collections import OrderedDict
from typing import Dict, List
from .models import AnalysisResult


class OutputFormatter:
    """Formatter for analysis results output"""
    
    def __init__(self, verbose: bool = False):
        self.verbose = verbose
    
    def _log_verbose(self, message: str):
        """Log verbose messages if verbose mode is enabled"""
        if self.verbose:
            print(f"[VERBOSE] {message}")
    
    def export_to_yaml(self, results: Dict[str, List[AnalysisResult]], output_file: str):
        """Export analysis results to YAML file"""
        self._log_verbose(f"Starting YAML export to: {output_file}")
        
        output_data = {}
        
        for operation_type, analysis_results in results.items():
            self._log_verbose(f"Processing {len(analysis_results)} results for {operation_type}")
            output_data[operation_type] = [result.to_dict() for result in analysis_results]
        
        # Configure YAML to preserve order
        yaml.add_representer(OrderedDict, lambda dumper, data: dumper.represent_mapping('tag:yaml.org,2002:map', data.items()))
        
        with open(output_file, 'w') as f:
            yaml.dump(output_data, f, default_flow_style=False, indent=2, sort_keys=False)
        
        self._log_verbose(f"Results exported to: {output_file}")
    
    def print_summary(self, results: Dict[str, List[AnalysisResult]]):
        """Print a summary of analysis results"""
        print("\n" + "="*80)
        print("ANALYSIS RESULTS SUMMARY")
        print("="*80)
        
        for operation_type, analysis_results in results.items():
            print(f"\n{operation_type.upper()} ({len(analysis_results)} functions):")
            print("-" * 60)
            
            for result in analysis_results:
                print(f"\nFunction: {result.function_name}")
                print(f"  AIA Relevant Function: {result.aia_relevant_function}%")
                print(f"  KD Entry Point: {result.relevant_kd_entry_point}%")
                print(f"  Message Structure Handling: {result.message_structure_handling}%")
                if result.smids_identified:
                    print(f"  SMIDs Identified: {', '.join(result.smids_identified)}")
                if self.verbose and result.reasoning:
                    print(f"  Reasoning: {'; '.join(result.reasoning[:2])}")  # Show first 2 reasoning points
    
    def count_total_functions(self, results: Dict[str, List[AnalysisResult]]) -> int:
        """Count total functions analyzed"""
        return sum(len(analysis_list) for analysis_list in results.values())
