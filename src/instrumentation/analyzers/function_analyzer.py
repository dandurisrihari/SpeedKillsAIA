#!/usr/bin/env python3
"""
Function entry analyzer
"""

from typing import List, Dict, Any, Optional
import tree_sitter

from .base_analyzer import BaseAnalyzer
from ..instrumentation_types.function_config import FunctionInstrumentationType


class FunctionAnalyzer(BaseAnalyzer):
    """Analyzer specialized for function entry points"""
    
    def __init__(self, parser, instrumentation_type: FunctionInstrumentationType):
        super().__init__(parser, instrumentation_type)

    def is_function_definition(self, node: tree_sitter.Node) -> bool:
        """Check if a node represents a function definition"""
        return node.type == 'function_definition'

    def get_function_name_from_definition(self, function_def_node: tree_sitter.Node, source_bytes: bytes) -> Optional[str]:
        """Extract function name from a function definition node"""
        if function_def_node.type != 'function_definition':
            return None
            
        # Look for the function declarator
        declarator = function_def_node.child_by_field_name('declarator')
        if not declarator:
            return None
            
        # Handle different declarator types
        if declarator.type == 'function_declarator':
            # Direct function declarator
            declarator_name = declarator.child_by_field_name('declarator')
            if declarator_name:
                return self.get_text_from_node(declarator_name, source_bytes)
        elif declarator.type == 'pointer_declarator':
            # Function pointer - look deeper
            inner_declarator = declarator.child_by_field_name('declarator')
            if inner_declarator and inner_declarator.type == 'function_declarator':
                declarator_name = inner_declarator.child_by_field_name('declarator')
                if declarator_name:
                    return self.get_text_from_node(declarator_name, source_bytes)
        elif declarator.type == 'identifier':
            # Simple identifier
            return self.get_text_from_node(declarator, source_bytes)
            
        return None

    def analyze_function_context(self, func_node: tree_sitter.Node, source_bytes: bytes) -> Dict[str, Any]:
        """Analyze a function definition and determine instrumentation strategy"""
        function_name = self.get_function_name_from_definition(func_node, source_bytes)
        if not function_name:
            return None

        # Skip internal/compiler-generated functions
        if function_name.startswith('__') or function_name == 'main':
            return None

        # Find the function body to instrument at the beginning
        body = func_node.child_by_field_name('body')
        if not body or body.type != 'compound_statement':
            return None

        # Find the first statement inside the function body
        first_statement_line = body.start_point[0] + 1  # After opening brace
        
        return {
            'function_name': function_name,
            'line_number': first_statement_line,
            'def_line_number': func_node.start_point[0],
            'column': func_node.start_point[1],
            'instrumentation_strategy': 'function_entry',
            'instrumentation_type': 'function_entry'
        }

    def find_functions_recursive(self, node: tree_sitter.Node, source_bytes: bytes, results: List[Dict[str, Any]]) -> None:
        """Recursively find all function definitions in the AST"""
        if self.is_function_definition(node):
            func_info = self.analyze_function_context(node, source_bytes)
            if func_info:
                results.append(func_info)
        
        # Continue traversing child nodes
        for child in node.children:
            self.find_functions_recursive(child, source_bytes, results)

    def find_functions_in_file(self, source_code: str) -> List[Dict[str, Any]]:
        """Find all function definitions in a source file"""
        try:
            tree = self.parser.parse(source_code)
            source_bytes = bytes(source_code, 'utf8')
            
            results = []
            self.find_functions_recursive(tree.root_node, source_bytes, results)
            
            # Format results with indentation
            formatted_results = []
            for func_info in results:
                # Function body typically has 4 spaces or 1 tab indentation
                func_info['indentation'] = "    "  # Standard 4-space indentation
                formatted_results.append(func_info)
            
            return formatted_results
            
        except Exception as e:
            print(f"Error analyzing functions: {e}")
            return []
