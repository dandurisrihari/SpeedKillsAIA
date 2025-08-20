#!/usr/bin/env python3
"""
Top Analysis Module for generating top 10 summaries by category

This module provides functionality to generate top 10 function summaries
for each analysis category (AIARelevantFunction, Relevant_KD_Entry_Point, 
Message_Structure_Handling) with their scores, reasoning, and additional 
details like identified structures and SMIDs.
"""

from typing import Dict, List, Any
from collections import OrderedDict
import re
from .models import AnalysisResult


class TopAnalyzer:
    """Analyzer for generating top 10 summaries by category"""
    
    def __init__(self, verbose: bool = False):
        self.verbose = verbose
    
    def _log_verbose(self, message: str):
        """Log verbose messages if verbose mode is enabled"""
        if self.verbose:
            print(f"[TOP_ANALYZER] {message}")
    
    def _extract_category_reasoning(self, reasoning: List[str], category: str) -> str:
        """Extract reasoning specific to a category from the reasoning list"""
        category_patterns = {
            'AIARelevantFunction': r'\*\*AIARelevantFunction\s*\((\d+)%\)\*\*[:\s]*(.+?)(?=\*\*|$)',
            'Relevant_KD_Entry_Point': r'\*\*Relevant[_\s]*KD[_\s]*Entry[_\s]*Point\s*\((\d+)%\)\*\*[:\s]*(.+?)(?=\*\*|$)',
            'Message_Structure_Handling': r'\*\*Message[_\s]*Structure[_\s]*Handling\s*\((\d+)%\)\*\*[:\s]*(.+?)(?=\*\*|$)'
        }
        
        full_reasoning = ' '.join(reasoning)
        pattern = category_patterns.get(category, '')
        
        if pattern:
            match = re.search(pattern, full_reasoning, re.IGNORECASE | re.DOTALL)
            if match:
                return match.group(2).strip()
        
        # Fallback: return full reasoning if no specific pattern found
        return full_reasoning[:200] + "..." if len(full_reasoning) > 200 else full_reasoning
    
    def generate_top_analysis(self, results: Dict[str, List[AnalysisResult]]) -> Dict[str, Any]:
        """
        Generate top 10 analysis for each category across all results
        
        Args:
            results: Dictionary with operation types as keys and AnalysisResult lists as values
            
        Returns:
            Dictionary containing top 10 analysis for each category
        """
        self._log_verbose("Starting top analysis generation...")
        
        # Flatten all results into a single list
        all_results = []
        for operation_type, analysis_results in results.items():
            for result in analysis_results:
                # Add operation type for context
                result_with_context = {
                    'result': result,
                    'operation_type': operation_type
                }
                all_results.append(result_with_context)
        
        self._log_verbose(f"Processing {len(all_results)} total results across all categories")
        
        # Generate top 10 for each category
        top_analysis = OrderedDict()
        
        categories = [
            ('AIARelevantFunction', 'aia_relevant_function'),
            ('Relevant_KD_Entry_Point', 'relevant_kd_entry_point'), 
            ('Message_Structure_Handling', 'message_structure_handling')
        ]
        
        for category_name, score_field in categories:
            self._log_verbose(f"Generating top 10 for {category_name}")
            
            # Sort by score (descending) and take top 10
            sorted_results = sorted(
                all_results,
                key=lambda x: getattr(x['result'], score_field),
                reverse=True
            )[:10]
            
            category_data = OrderedDict()
            category_data['description'] = f"Top 10 functions ranked by {category_name} score"
            category_data['functions'] = []
            
            for i, item in enumerate(sorted_results, 1):
                result = item['result']
                operation_type = item['operation_type']
                score = getattr(result, score_field)
                
                function_data = OrderedDict([
                    ('rank', i),
                    ('function_name', result.function_name),
                    ('operation_type', operation_type),
                    ('score', score),
                    ('reasoning', self._extract_category_reasoning(result.reasoning, category_name))
                ])
                
                # Add Message_Structures and SMIDs for Message_Structure_Handling category
                if category_name == 'Message_Structure_Handling':
                    # Create copies to avoid YAML anchor references
                    function_data['message_structures_identified'] = list(result.message_structures_identified) if result.message_structures_identified else []
                    function_data['smids_identified'] = list(result.smids_identified) if result.smids_identified else []
                
                category_data['functions'].append(function_data)
            
            top_analysis[category_name] = category_data
        
        # Generate overall top functions across all categories
        self._log_verbose("Generating overall top functions across all categories")
        
        overall_top = []
        for item in all_results:
            result = item['result']
            operation_type = item['operation_type']
            
            # Add entries for each category score
            for category_name, score_field in categories:
                score = getattr(result, score_field)
                overall_top.append({
                    'function_name': result.function_name,
                    'operation_type': operation_type,
                    'category': category_name,
                    'score': score,
                    'reasoning': self._extract_category_reasoning(result.reasoning, category_name),
                    'message_structures': list(result.message_structures_identified) if category_name == 'Message_Structure_Handling' and result.message_structures_identified else [],
                    'smids': list(result.smids_identified) if category_name == 'Message_Structure_Handling' and result.smids_identified else []
                })
        
        # Sort by score and take top entries
        overall_sorted = sorted(overall_top, key=lambda x: x['score'], reverse=True)
        
        top_analysis['Overall_Top_Scores'] = OrderedDict([
            ('description', 'All function scores sorted from highest to lowest across all categories'),
            ('total_entries', len(overall_sorted)),
            ('entries', overall_sorted)
        ])
        
        self._log_verbose("Top analysis generation completed")
        return top_analysis
    
    def format_for_verbose_log(self, top_analysis: Dict[str, Any]) -> str:
        """
        Format top analysis for verbose log file display
        
        Args:
            top_analysis: Top analysis data generated by generate_top_analysis
            
        Returns:
            Formatted string for log file
        """
        self._log_verbose("Formatting top analysis for verbose log")
        
        log_content = []
        log_content.append("=" * 100)
        log_content.append("TOP ANALYSIS SUMMARY")
        log_content.append("=" * 100)
        log_content.append("")
        
        # Format each category
        for category, data in top_analysis.items():
            if category == 'Overall_Top_Scores':
                continue  # Handle this separately
                
            log_content.append(f"🎯 {category.upper()}")
            log_content.append("-" * 80)
            log_content.append(f"Description: {data['description']}")
            log_content.append("")
            
            for func_data in data['functions']:
                log_content.append(f"#{func_data['rank']:2d}. {func_data['function_name']} "
                                 f"[{func_data['operation_type']}] - Score: {func_data['score']}%")
                log_content.append(f"     Reasoning: {func_data['reasoning']}")
                
                # Add structures and SMIDs for Message_Structure_Handling
                if category == 'Message_Structure_Handling':
                    if func_data.get('message_structures_identified'):
                        log_content.append(f"     Message Structures: {', '.join(func_data['message_structures_identified'])}")
                    if func_data.get('smids_identified'):
                        log_content.append(f"     SMIDs: {', '.join(func_data['smids_identified'])}")
                
                log_content.append("")
            
            log_content.append("")
        
        # Add overall top scores section
        if 'Overall_Top_Scores' in top_analysis:
            overall_data = top_analysis['Overall_Top_Scores']
            log_content.append("🏆 OVERALL TOP SCORES (ALL CATEGORIES)")
            log_content.append("-" * 80)
            log_content.append(f"Description: {overall_data['description']}")
            log_content.append(f"Total Entries: {overall_data['total_entries']}")
            log_content.append("")
            
            for i, entry in enumerate(overall_data['entries'], 1):
                log_content.append(f"#{i:3d}. {entry['function_name']} [{entry['operation_type']}]")
                log_content.append(f"      Category: {entry['category']} - Score: {entry['score']}%")
                log_content.append(f"      Reasoning: {entry['reasoning']}")
                
                # Add structures and SMIDs for Message_Structure_Handling entries
                if entry['category'] == 'Message_Structure_Handling':
                    if entry['message_structures']:
                        log_content.append(f"      Message Structures: {', '.join(entry['message_structures'])}")
                    if entry['smids']:
                        log_content.append(f"      SMIDs: {', '.join(entry['smids'])}")
                
                log_content.append("")
        
        log_content.append("=" * 100)
        log_content.append("END TOP ANALYSIS SUMMARY")
        log_content.append("=" * 100)
        
        return "\n".join(log_content)
