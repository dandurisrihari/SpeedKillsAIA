#!/usr/bin/env python3
"""
DMA API analyzer
"""

from typing import List, Dict, Any
import tree_sitter
from .base_analyzer import BaseAnalyzer
from ..instrumentation_types.dma_config import DMAInstrumentationType


class DMAAnalyzer(BaseAnalyzer):
    """Analyzer specialized for DMA API calls"""
    
    def __init__(self, parser, instrumentation_type: DMAInstrumentationType):
        super().__init__(parser, instrumentation_type)
        self.dma_apis = instrumentation_type.api_functions

    def is_target_call(self, node: tree_sitter.Node, source_bytes: bytes) -> bool:
        """Check if a node represents a DMA API call"""
        if node.type != 'call_expression':
            return False
        
        function_node = node.child_by_field_name('function')
        if not function_node:
            return False
        
        function_name = self.get_text_from_node(function_node, source_bytes)
        return function_name in self.dma_apis

    def get_function_name_from_call(self, call_node: tree_sitter.Node, source_bytes: bytes) -> str:
        """Extract function name from a call expression node"""
        function_node = call_node.child_by_field_name('function')
        if function_node:
            return self.get_text_from_node(function_node, source_bytes)
        return None

    def analyze_call_context(self, call_node: tree_sitter.Node, source_bytes: bytes) -> Dict[str, Any]:
        """Analyze the context of a DMA call and determine instrumentation strategy"""
        function_name = self.get_function_name_from_call(call_node, source_bytes)
        if not function_name:
            return None

        # Skip if not inside a function definition (e.g., in includes, module declarations)
        if not self._is_inside_function(call_node):
            return None

        # Analyze context
        in_preprocessor = self._is_inside_preprocessor_conditional(call_node)
        in_assignment = self._is_inside_assignment(call_node)
        in_conditional = self._is_inside_conditional(call_node)
        in_switch = self._is_inside_switch(call_node)
        is_multiline = self._is_multiline_call(call_node, source_bytes)
        
        # Find safe instrumentation point
        safe_point = self._find_safe_instrumentation_point(call_node)
        complete_statement = self._find_complete_statement(call_node)

        # Determine instrumentation strategy and target line
        target_line = call_node.start_point[0]
        strategy = 'before_call'
        
        if in_preprocessor:
            # For preprocessor blocks, check if this is part of a spanning assignment
            preprocessor_safe_point = self._find_preprocessor_safe_point(call_node, source_bytes)
            if preprocessor_safe_point:
                target_line = preprocessor_safe_point.start_point[0]
                # Check if the safe point is an assignment that spans outside the preprocessor
                if (preprocessor_safe_point.type == 'assignment_expression' and 
                    preprocessor_safe_point.start_point[0] < call_node.start_point[0]):
                    strategy = 'before_assignment'
                elif (preprocessor_safe_point.type == 'ERROR' and 
                      preprocessor_safe_point.start_point[0] < call_node.start_point[0]):
                    # This is likely an incomplete assignment (ERROR node) that spans into the preprocessor
                    strategy = 'before_assignment'
                elif preprocessor_safe_point.type.startswith('preproc_'):
                    # We're instrumenting before the entire preprocessor block to avoid assignment issues
                    strategy = 'before_preprocessor_block'
                else:
                    strategy = 'before_statement_in_preprocessor'
            else:
                strategy = 'before_call'
        elif in_conditional and safe_point:
            # If inside if/else conditional, instrument before the entire conditional block
            target_line = safe_point.start_point[0]
            strategy = 'before_conditional'
        elif in_switch:
            # For switch statements, instrument before the individual statement
            if complete_statement:
                target_line = complete_statement.start_point[0]
                strategy = 'before_statement'
            else:
                # Fallback: instrument directly before the call
                strategy = 'before_call'
        elif in_assignment:
            strategy = 'before_assignment' 
            if complete_statement:
                target_line = complete_statement.start_point[0]
        elif is_multiline and complete_statement:
            target_line = complete_statement.start_point[0]
            strategy = 'before_statement'
        # If no special context, instrument directly before the call (default)

        return {
            'function_name': function_name,
            'line_number': target_line,
            'call_line_number': call_node.start_point[0],
            'column': call_node.start_point[1],
            'in_preprocessor': in_preprocessor,
            'in_assignment': in_assignment,
            'in_conditional': in_conditional,
            'in_switch': in_switch,
            'is_multiline': is_multiline,
            'instrumentation_strategy': strategy,
            'instrumentation_type': 'dma_call'
        }

    def find_calls_recursive(self, node: tree_sitter.Node, source_bytes: bytes, results: List[Dict[str, Any]]) -> None:
        """Recursively find all DMA API calls in the AST"""
        # Check current node first
        if self.is_target_call(node, source_bytes):
            call_info = self.analyze_call_context(node, source_bytes)
            if call_info:
                results.append(call_info)
        
        # Always traverse all children, regardless of node type
        for child in node.children:
            self.find_calls_recursive(child, source_bytes, results)

    def find_calls_in_file(self, source_code: str) -> List[Dict[str, Any]]:
        """Find all DMA API calls in a source file"""
        try:
            tree = self.parser.parse(source_code)
            source_bytes = bytes(source_code, 'utf8')
            
            results = []
            self.find_calls_recursive(tree.root_node, source_bytes, results)
            
            # Sort results by line number to ensure consistent ordering
            results.sort(key=lambda x: x['line_number'])
            
            # Format results with indentation
            source_lines = source_code.split('\n')
            formatted_results = []
            
            for call_info in results:
                line_number = call_info['line_number']
                if line_number < len(source_lines):
                    line = source_lines[line_number]
                    indentation = ' ' * (len(line) - len(line.lstrip()))
                    call_info['indentation'] = indentation
                    formatted_results.append(call_info)
            
            return formatted_results
            
        except Exception as e:
            print(f"Error analyzing DMA calls: {e}")
            return []
