#!/usr/bin/env python3
"""
Multi-type analyzer that coordinates multiple specialized analyzers
"""

from typing import List, Dict, Any, Set
from ..parser import TreeSitterParser
from ..instrumentation_types import InstrumentationType, DMAInstrumentationType, UserCopyInstrumentationType, FunctionInstrumentationType
from .dma_analyzer import DMAAnalyzer
from .user_copy_analyzer import UserCopyAnalyzer
from .function_analyzer import FunctionAnalyzer


class MultiAnalyzer:
    """
    Coordinates multiple specialized analyzers for comprehensive code analysis
    
    This analyzer manages multiple instrumentation types and provides a unified
    interface for finding all types of instrumentable code elements.
    """
    
    def __init__(self, parser: TreeSitterParser, enabled_types: Set[str]):
        """
        Initialize multi-analyzer with enabled instrumentation types
        
        Args:
            parser: Initialized TreeSitterParser instance
            enabled_types: Set of enabled instrumentation type names ('dma', 'user_copy', 'functions')
        """
        self.parser = parser
        self.analyzers = {}
        
        # Initialize enabled analyzers
        if 'dma' in enabled_types:
            dma_type = DMAInstrumentationType()
            self.analyzers['dma'] = DMAAnalyzer(parser, dma_type)
            
        if 'user_copy' in enabled_types:
            user_copy_type = UserCopyInstrumentationType()
            self.analyzers['user_copy'] = UserCopyAnalyzer(parser, user_copy_type)
            
        if 'functions' in enabled_types:
            function_type = FunctionInstrumentationType()
            self.analyzers['functions'] = FunctionAnalyzer(parser, function_type)

    def get_enabled_types(self) -> List[str]:
        """Get list of enabled instrumentation types"""
        return list(self.analyzers.keys())

    def find_all_instrumentable_items(self, source_code: str) -> Dict[str, List[Dict[str, Any]]]:
        """
        Find all instrumentable items of all enabled types in a source file
        
        Args:
            source_code: C source code as string
            
        Returns:
            Dict mapping instrumentation type names to lists of found items
        """
        results = {}
        
        try:
            # Run each enabled analyzer
            for analyzer_name, analyzer in self.analyzers.items():
                if analyzer_name == 'dma':
                    results['dma'] = analyzer.find_calls_in_file(source_code)
                elif analyzer_name == 'user_copy':
                    results['user_copy'] = analyzer.find_calls_in_file(source_code)
                elif analyzer_name == 'functions':
                    results['functions'] = analyzer.find_functions_in_file(source_code)
                else:
                    results[analyzer_name] = []
                    
        except Exception as e:
            print(f"Error in multi-analysis: {e}")
            # Return empty results for all types
            for analyzer_name in self.analyzers.keys():
                results[analyzer_name] = []
        
        return results

    def get_total_items_count(self, analysis_results: Dict[str, List[Dict[str, Any]]]) -> int:
        """Get total count of instrumentable items across all types"""
        return sum(len(items) for items in analysis_results.values())

    def get_summary_string(self, analysis_results: Dict[str, List[Dict[str, Any]]]) -> str:
        """Get a human-readable summary of analysis results"""
        parts = []
        for analyzer_name, items in analysis_results.items():
            if items:
                count = len(items)
                type_name = {
                    'dma': 'DMA calls',
                    'user_copy': 'user copy calls', 
                    'functions': 'functions'
                }.get(analyzer_name, analyzer_name)
                parts.append(f"{count} {type_name}")
        
        if not parts:
            return "no instrumentable items"
        
        return " and ".join(parts)
