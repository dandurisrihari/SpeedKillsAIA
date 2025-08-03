#!/usr/bin/env python3
"""
IOCTL handler analyzer
"""

from typing import List, Dict, Any, Optional
import tree_sitter
import re

from .base_analyzer import BaseAnalyzer
from ..instrumentation_types.ioctl_config import IoctlInstrumentationType


class IoctlAnalyzer(BaseAnalyzer):
    """Analyzer specialized for IOCTL handler functions"""
    
    def __init__(self, parser, instrumentation_type: IoctlInstrumentationType):
        super().__init__(parser, instrumentation_type)
        self.ioctl_patterns = instrumentation_type.ioctl_patterns

    def is_ioctl_handler_function(self, function_name: str) -> bool:
        """Check if a function name indicates it's an ioctl handler"""
        if not function_name:
            return False
            
        function_name_lower = function_name.lower()
        
        # Check for direct pattern matches
        for pattern in self.ioctl_patterns:
            if pattern in function_name_lower:
                return True
        
        # Check for common ioctl handler naming conventions
        # Pattern: <driver>_ioctl, <device>_ioctl, etc.
        ioctl_patterns = [
            r'.*_ioctl$',           # ends with _ioctl
            r'.*_unlocked_ioctl$',  # ends with _unlocked_ioctl
            r'.*_compat_ioctl$',    # ends with _compat_ioctl
            r'ioctl_.*',            # starts with ioctl_
            r'.*ioctl.*handler.*',  # contains ioctl and handler
            r'.*handler.*ioctl.*',  # contains handler and ioctl
        ]
        
        for pattern in ioctl_patterns:
            if re.match(pattern, function_name_lower):
                return True
                
        return False

    def has_ioctl_signature(self, function_def_node: tree_sitter.Node, source_bytes: bytes) -> bool:
        """Check if a function has a typical ioctl handler signature"""
        declarator = function_def_node.child_by_field_name('declarator')
        if not declarator:
            return False
            
        # Look for function_declarator with parameters
        func_declarator = None
        if declarator.type == 'function_declarator':
            func_declarator = declarator
        elif declarator.type == 'pointer_declarator':
            inner = declarator.child_by_field_name('declarator')
            if inner and inner.type == 'function_declarator':
                func_declarator = inner
                
        if not func_declarator:
            return False
            
        # Get parameters
        parameters = func_declarator.child_by_field_name('parameters')
        if not parameters:
            return False
            
        # Convert to text and check for common ioctl signatures
        params_text = self.get_text_from_node(parameters, source_bytes).lower()
        
        # Common ioctl signatures:
        # long (*unlocked_ioctl)(struct file *file, unsigned int cmd, unsigned long arg)
        # int (*ioctl)(struct inode *inode, struct file *file, unsigned int cmd, unsigned long arg) 
        ioctl_signature_patterns = [
            'unsigned int.*cmd',      # cmd parameter
            'unsigned long.*arg',     # arg parameter
            'struct file',            # file parameter
            'struct inode',          # inode parameter (older style)
        ]
        
        matches = 0
        for pattern in ioctl_signature_patterns:
            if re.search(pattern, params_text):
                matches += 1
                
        # Consider it an ioctl if it has at least 2 signature elements
        # (cmd + arg, or file + cmd, etc.)
        return matches >= 2

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

    def analyze_ioctl_handler(self, function_def_node: tree_sitter.Node, source_bytes: bytes) -> Optional[Dict[str, Any]]:
        """Analyze an ioctl handler function and determine instrumentation strategy"""
        function_name = self.get_function_name_from_definition(function_def_node, source_bytes)
        if not function_name:
            return None

        # Check if it's an ioctl handler by name or signature
        is_ioctl_by_name = self.is_ioctl_handler_function(function_name)
        is_ioctl_by_signature = self.has_ioctl_signature(function_def_node, source_bytes)
        
        if not (is_ioctl_by_name or is_ioctl_by_signature):
            return None

        # Find the function body
        body = function_def_node.child_by_field_name('body')
        if not body or body.type != 'compound_statement':
            return None

        # Find the first statement in the function body for instrumentation
        # We want to instrument at the very beginning of the function
        first_statement_line = None
        opening_brace_line = body.start_point[0]
        
        # Look for the first actual statement after the opening brace
        for child in body.children:
            if child.type != '{' and child.type != '}' and not child.type.startswith('comment'):
                first_statement_line = child.start_point[0]
                break
        
        # If no statements found, instrument right after the opening brace
        if first_statement_line is None:
            first_statement_line = opening_brace_line + 1

        # Get indentation by looking at the first statement or using default
        indentation = '    '  # Default indentation
        source_lines = source_bytes.decode('utf-8').split('\n')
        
        if first_statement_line < len(source_lines):
            line_content = source_lines[first_statement_line]
            if line_content.strip():  # If there's content on the line
                indentation = ' ' * (len(line_content) - len(line_content.lstrip()))
            elif first_statement_line > 0:  # Look at previous line for context
                prev_line = source_lines[first_statement_line - 1]
                indentation = ' ' * (len(prev_line) - len(prev_line.lstrip()) + 4)

        return {
            'function_name': function_name,
            'line_number': first_statement_line,
            'column': 0,
            'indentation': indentation,
            'instrumentation_type': 'ioctl_handler',
            'detected_by_name': is_ioctl_by_name,
            'detected_by_signature': is_ioctl_by_signature,
            'strategy': 'function_entry'
        }

    def find_ioctl_handlers_recursive(self, node: tree_sitter.Node, source_bytes: bytes, results: List[Dict[str, Any]]) -> None:
        """Recursively find all ioctl handler functions in the AST"""
        # Check if current node is a function definition
        if self.is_function_definition(node):
            handler_info = self.analyze_ioctl_handler(node, source_bytes)
            if handler_info:
                results.append(handler_info)
        
        # Always traverse all children
        for child in node.children:
            self.find_ioctl_handlers_recursive(child, source_bytes, results)

    def find_calls_in_file(self, source_code: str) -> List[Dict[str, Any]]:
        """Find all ioctl handler functions in a source file"""
        try:
            tree = self.parser.parse(source_code)
            source_bytes = bytes(source_code, 'utf8')
            
            results = []
            self.find_ioctl_handlers_recursive(tree.root_node, source_bytes, results)
            
            # Sort results by line number to ensure consistent ordering
            results.sort(key=lambda x: x['line_number'])
            
            return results
            
        except Exception as e:
            print(f"Error analyzing ioctl handlers: {e}")
            return []
