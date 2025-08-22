#!/usr/bin/env python3
"""
Output utilities for analysis results
"""

import yaml
import csv
from collections import OrderedDict
from typing import Dict, List
from .models import AnalysisResult
from .top_analysis import TopAnalyzer


class OutputFormatter:
    """Formatter for analysis results output"""
    
    def __init__(self, verbose: bool = False):
        self.verbose = verbose
    
    def _log_verbose(self, message: str):
        """Log verbose messages if verbose mode is enabled"""
        if self.verbose:
            print(f"[VERBOSE] {message}")
    
    def export_to_yaml(self, results: Dict[str, List[AnalysisResult]], output_file: str):
        """Export analysis results to YAML file with top analysis"""
        print(f"[PROGRESS] Starting YAML export to: {output_file}")
        self._log_verbose(f"Starting YAML export to: {output_file}")
        
        output_data = OrderedDict()
        
        # Add regular analysis results
        total_results = sum(len(analysis_results) for analysis_results in results.values())
        processed_results = 0
        
        for operation_type, analysis_results in results.items():
            print(f"[PROGRESS] Processing {len(analysis_results)} results for {operation_type}")
            self._log_verbose(f"Processing {len(analysis_results)} results for {operation_type}")
            output_data[operation_type] = [result.to_dict() for result in analysis_results]
            processed_results += len(analysis_results)
        
        # Generate and add top analysis
        print(f"[PROGRESS] Generating top analysis for YAML export")
        self._log_verbose("Generating top analysis for YAML export")
        top_analyzer = TopAnalyzer(verbose=self.verbose)
        top_analysis = top_analyzer.generate_top_analysis(results)
        output_data['Top_Analysis'] = top_analysis
        
        # Configure YAML to preserve order
        yaml.add_representer(OrderedDict, lambda dumper, data: dumper.represent_mapping('tag:yaml.org,2002:map', data.items()))
        
        print(f"[PROGRESS] Writing YAML file with {processed_results} results...")
        with open(output_file, 'w') as f:
            yaml.dump(output_data, f, default_flow_style=False, indent=2, sort_keys=False)
        
        print(f"[PROGRESS] ✅ Results exported to: {output_file}")
        self._log_verbose(f"Results exported to: {output_file}")
    
    def export_to_csv(self, results: Dict[str, List[AnalysisResult]], output_file: str):
        """Export analysis results to CSV file with rankings by category"""
        print(f"[PROGRESS] Starting CSV export to: {output_file}")
        self._log_verbose(f"Starting CSV export to: {output_file}")
        
        # Collect all results into a single list with their operation types
        all_results = []
        for operation_type, analysis_results in results.items():
            for result in analysis_results:
                all_results.append({
                    'operation_type': operation_type,
                    'result': result
                })
        
        # Generate rankings for each category
        aia_rankings = self._generate_category_rankings(all_results, 'aia_relevant_function')
        kd_rankings = self._generate_category_rankings(all_results, 'relevant_kd_entry_point')
        msg_rankings = self._generate_category_rankings(all_results, 'message_structure_handling')
        
        print(f"[PROGRESS] Writing CSV file with {len(all_results)} results...")
        
        with open(output_file, 'w', newline='', encoding='utf-8') as csvfile:
            writer = csv.writer(csvfile)
            
            # Write header
            writer.writerow([
                'Rank',
                'Function_Name',
                'Operation_Type',
                'Category',
                'Score',
                'Reasoning_Summary',
                'Message_Structures',
                'SMIDs_Identified'
            ])
            
            # Write AIARelevantFunction rankings
            for rank, item in enumerate(aia_rankings, 1):
                result = item['result']
                writer.writerow([
                    rank,
                    result.function_name,
                    item['operation_type'],
                    'AIARelevantFunction',
                    result.aia_relevant_function,
                    self._get_reasoning_summary(result.reasoning),
                    '; '.join(result.message_structures_identified) if result.message_structures_identified else 'None',
                    '; '.join(result.smids_identified) if result.smids_identified else 'None'
                ])
            
            # Write Relevant_KD_Entry_Point rankings
            for rank, item in enumerate(kd_rankings, 1):
                result = item['result']
                writer.writerow([
                    rank,
                    result.function_name,
                    item['operation_type'],
                    'Relevant_KD_Entry_Point',
                    result.relevant_kd_entry_point,
                    self._get_reasoning_summary(result.reasoning),
                    '; '.join(result.message_structures_identified) if result.message_structures_identified else 'None',
                    '; '.join(result.smids_identified) if result.smids_identified else 'None'
                ])
            
            # Write Message_Structure_Handling rankings
            for rank, item in enumerate(msg_rankings, 1):
                result = item['result']
                writer.writerow([
                    rank,
                    result.function_name,
                    item['operation_type'],
                    'Message_Structure_Handling',
                    result.message_structure_handling,
                    self._get_reasoning_summary(result.reasoning),
                    '; '.join(result.message_structures_identified) if result.message_structures_identified else 'None',
                    '; '.join(result.smids_identified) if result.smids_identified else 'None'
                ])
        
        print(f"[PROGRESS] ✅ CSV results exported to: {output_file}")
        self._log_verbose(f"CSV results exported to: {output_file}")
    
    def _generate_category_rankings(self, all_results: List[dict], category_field: str) -> List[dict]:
        """Generate rankings for a specific category, sorted by score (highest to lowest)"""
        return sorted(all_results, key=lambda x: getattr(x['result'], category_field), reverse=True)
    
    def _get_reasoning_summary(self, reasoning: List[str]) -> str:
        """Get a concise summary of reasoning for CSV export"""
        if not reasoning:
            return 'No reasoning provided'
        
        # Join all reasoning and truncate if too long
        full_reasoning = ' '.join(reasoning)
        if len(full_reasoning) > 200:
            return full_reasoning[:197] + '...'
        return full_reasoning
    
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
