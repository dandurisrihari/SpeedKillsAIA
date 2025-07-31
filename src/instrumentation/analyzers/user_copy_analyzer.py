#!/usr/bin/env python3
"""
User copy API analyzer
"""

from typing import List, Dict, Any
import tree_sitter

from .base_analyzer import BaseAnalyzer
from ..instrumentation_types.user_copy_config import UserCopyInstrumentationType


class UserCopyAnalyzer(BaseAnalyzer):
    """Analyzer specialized for user space copy API calls"""
    
    def __init__(self, parser, instrumentation_type: UserCopyInstrumentationType):
        super().__init__(parser, instrumentation_type)
        self.user_copy_apis = instrumentation_type.api_functions

    def is_target_call(self, node: tree_sitter.Node, source_bytes: bytes) -> bool:
        """Check if a node represents a user copy API call"""
        if node.type != 'call_expression':
            return False
        
        function_node = node.child_by_field_name('function')
        if not function_node:
            return False
        
        function_name = self.get_text_from_node(function_node, source_bytes)
        return function_name in self.user_copy_apis

    def get_function_name_from_call(self, call_node: tree_sitter.Node, source_bytes: bytes) -> str:
        """Extract function name from a call expression node"""
        function_node = call_node.child_by_field_name('function')
        if function_node:
            return self.get_text_from_node(function_node, source_bytes)
        return None

    def analyze_call_context(self, call_node: tree_sitter.Node, source_bytes: bytes) -> Dict[str, Any]:
        """Analyze the context of a user copy call and determine instrumentation strategy"""
        function_name = self.get_function_name_from_call(call_node, source_bytes)
        if not function_name:
            return None

        # Analyze context
        in_preprocessor = self._is_inside_preprocessor_conditional(call_node)
        in_assignment = self._is_inside_assignment(call_node)
        is_multiline = self._is_multiline_call(call_node, source_bytes)
        complete_statement = self._find_complete_statement(call_node)

        # Determine instrumentation strategy
        target_line = call_node.start_point[0]
        strategy = 'before_call'
        
        if in_preprocessor:
            strategy = 'skip_preprocessor'
        elif in_assignment:
            strategy = 'before_assignment'
        elif is_multiline and complete_statement:
            target_line = complete_statement.start_point[0]
            strategy = 'before_statement'

        return {
            'function_name': function_name,
            'line_number': target_line,
            'call_line_number': call_node.start_point[0],
            'column': call_node.start_point[1],
            'in_preprocessor': in_preprocessor,
            'in_assignment': in_assignment,
            'is_multiline': is_multiline,
            'instrumentation_strategy': strategy,
            'instrumentation_type': 'user_copy'
        }

    def find_calls_recursive(self, node: tree_sitter.Node, source_bytes: bytes, results: List[Dict[str, Any]]) -> None:
        """Recursively find all user copy API calls in the AST"""
        if self.is_target_call(node, source_bytes):
            call_info = self.analyze_call_context(node, source_bytes)
            if call_info:
                results.append(call_info)
        
        # Continue traversing child nodes
        for child in node.children:
            self.find_calls_recursive(child, source_bytes, results)

    def find_calls_in_file(self, source_code: str) -> List[Dict[str, Any]]:
        """Find all user copy API calls in a source file"""
        try:
            tree = self.parser.parse(source_code)
            source_bytes = bytes(source_code, 'utf8')
            
            results = []
            self.find_calls_recursive(tree.root_node, source_bytes, results)
            
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
            print(f"Error analyzing user copy calls: {e}")
            return []
