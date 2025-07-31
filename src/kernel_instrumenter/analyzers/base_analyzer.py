#!/usr/bin/env python3
"""
Base analyzer for all instrumentation types
"""

from typing import List, Dict, Any, Optional
import tree_sitter

from ..parsing.parser import TreeSitterParser
from ..instrumentation_types.base import InstrumentationType


class BaseAnalyzer:
    """
    Base analyzer class for finding instrumentable code elements
    
    This class provides common functionality for all specialized analyzers.
    """
    
    def __init__(self, parser: TreeSitterParser, instrumentation_type: InstrumentationType):
        """
        Initialize analyzer with parser and instrumentation type
        
        Args:
            parser: Initialized TreeSitterParser instance
            instrumentation_type: The type of instrumentation this analyzer handles
        """
        self.parser = parser
        self.instrumentation_type = instrumentation_type

    def get_text_from_node(self, node: tree_sitter.Node, source_bytes: bytes) -> str:
        """Extract text content from a tree-sitter node"""
        return source_bytes[node.start_byte:node.end_byte].decode('utf-8')

    def _is_inside_function(self, node: tree_sitter.Node) -> bool:
        """Check if the node is inside a function definition"""
        current = node
        while current and current.parent:
            parent = current.parent
            if parent.type == 'function_definition':
                return True
            current = parent
        return False

    def _is_inside_preprocessor_conditional(self, node: tree_sitter.Node) -> bool:
        """Check if the node is inside a preprocessor conditional block"""
        current = node
        while current:
            if current.type in ('preproc_if', 'preproc_ifdef', 'preproc_elif', 'preproc_else'):
                return True
            current = current.parent
        return False

    def _find_preprocessor_safe_point(self, call_node: tree_sitter.Node, source_bytes: bytes = None) -> Optional[tree_sitter.Node]:
        """Find a safe point to instrument when inside preprocessor conditionals"""
        # Check if this call appears to be part of an assignment that spans outside the preprocessor block
        # We'll do this by examining the source text before the preprocessor block
        
        # First, find the preprocessor block that contains this call
        current = call_node
        preprocessor_node = None
        while current and current.parent:
            parent = current.parent
            if parent.type.startswith('preproc_'):
                preprocessor_node = parent
                break
            current = parent
        
        if preprocessor_node and source_bytes:
            # Check for assignment spanning preprocessor pattern by looking for ERROR nodes before the preprocessor
            # that contain assignment operators
            root_node = call_node
            while root_node.parent:
                root_node = root_node.parent
            
            # Look for ERROR nodes that might be incomplete assignments before the preprocessor
            def find_error_before_preprocessor(node):
                if (node.type == 'ERROR' and 
                    node.end_point[0] <= preprocessor_node.start_point[0]):
                    # Check if this ERROR node contains an assignment operator
                    error_text = source_bytes[node.start_byte:node.end_byte].decode('utf-8', errors='ignore')
                    if '=' in error_text and ('->' in error_text or '.' in error_text):
                        # This looks like an incomplete assignment like "mdlPriv->kvaddr ="
                        return node
                
                for child in node.children:
                    result = find_error_before_preprocessor(child)
                    if result:
                        return result
                return None
            
            error_assignment = find_error_before_preprocessor(root_node)
            if error_assignment:
                # We found an incomplete assignment before the preprocessor - instrument before it
                return error_assignment
            
            # Alternative approach: check if there's text pattern indicating assignment spanning
            # Get the lines around the preprocessor to see if there's a hanging assignment
            preprocessor_start_line = preprocessor_node.start_point[0]
            if preprocessor_start_line > 0:
                # Find line breaks and get text around the preprocessor
                lines = source_bytes.decode('utf-8', errors='ignore').split('\n')
                if preprocessor_start_line < len(lines):
                    # Check the line before the preprocessor
                    prev_line = lines[preprocessor_start_line - 1].strip() if preprocessor_start_line > 0 else ""
                    
                    # Look for assignment patterns that might span into the preprocessor
                    if ('=' in prev_line and 
                        (prev_line.endswith('=') or prev_line.endswith('= ')) and
                        ('->' in prev_line or '.' in prev_line)):
                        # This looks like "mdlPriv->kvaddr =" - instrument before the assignment
                        # We need to find the statement containing this assignment
                        return preprocessor_node  # For now, instrument before the preprocessor
        
        if preprocessor_node:
            # If the call is inside the preprocessor block (on a later line), 
            # check if this could be a spanning assignment by looking at indentation
            preprocessor_start_line = preprocessor_node.start_point[0]
            call_line = call_node.start_point[0]
            
            if call_line > preprocessor_start_line:
                # Only consider it a spanning assignment if:
                # 1. The call is NOT inside a function definition (assignments don't span function boundaries)
                # 2. The call appears to be a direct child of the preprocessor block (not deeply nested)
                if not self._is_inside_function(call_node):
                    call_column = call_node.start_point[1]
                    # If the call is indented, it's likely inside a preprocessor block that's part of an assignment
                    if call_column > 0:  # Indented call suggests it might be continuation of an assignment
                        # For safety, instrument before the preprocessor block instead of inside it
                        return preprocessor_node
        
        # Fallback: First check for assignments using AST
        current = call_node
        while current and current.parent:
            parent = current.parent
            if parent.type == 'assignment_expression':
                # Check if the assignment starts before the call (different lines)
                assignment_start = parent.start_point[0]
                call_line = call_node.start_point[0]
                
                if assignment_start < call_line:
                    return parent  # Return the assignment as the safe point
            current = parent
        
        # Final fallback: instrument before the individual statement within the preprocessor block
        return self._find_complete_statement(call_node)

    def _get_source_bytes_from_node(self, node: tree_sitter.Node) -> Optional[bytes]:
        """Helper to get source bytes from a node - this needs to be implemented"""
        # This is a placeholder - we need access to the source bytes
        # In practice, this would be passed down from the analyzer
        return None

    def _is_inside_assignment(self, node: tree_sitter.Node) -> bool:
        """Check if the node is the right-hand side of an assignment"""
        current = node
        while current and current.parent:
            parent = current.parent
            if parent.type == 'assignment_expression':
                right_node = parent.child_by_field_name('right')
                if right_node and self._node_contains(right_node, current):
                    return True
            current = parent
        return False
    
    def _node_contains(self, parent: tree_sitter.Node, child: tree_sitter.Node) -> bool:
        """Check if parent node contains child node"""
        return (parent.start_byte <= child.start_byte and 
                parent.end_byte >= child.end_byte)

    def _find_complete_statement(self, call_node: tree_sitter.Node) -> Optional[tree_sitter.Node]:
        """Find the complete statement that contains this function call"""
        current = call_node
        while current and current.parent:
            parent = current.parent
            if parent.type in ('expression_statement', 'declaration'):
                return parent
            elif parent.type == 'compound_statement':
                return current
            current = parent
        return current

    def _is_multiline_call(self, call_node: tree_sitter.Node, source_bytes: bytes) -> bool:
        """Check if a function call spans multiple lines"""
        call_text = self.get_text_from_node(call_node, source_bytes)
        return '\n' in call_text

    def _is_inside_conditional(self, node: tree_sitter.Node) -> bool:
        """Check if the node is inside a simple conditional statement (if/else only)"""
        current = node
        while current and current.parent:
            parent = current.parent
            if parent.type in ('if_statement', 'else_clause'):
                return True
            current = parent
        return False

    def _is_inside_switch(self, node: tree_sitter.Node) -> bool:
        """Check if the node is inside a switch statement"""
        current = node
        while current and current.parent:
            parent = current.parent
            if parent.type in ('switch_statement', 'case_statement'):
                return True
            current = parent
        return False

    def _find_enclosing_conditional(self, node: tree_sitter.Node) -> Optional[tree_sitter.Node]:
        """Find the enclosing conditional statement if any (if/else only, not switch)"""
        current = node
        while current and current.parent:
            parent = current.parent
            if parent.type in ('if_statement', 'else_clause'):
                return parent
            current = parent
        return None

    def _find_safe_instrumentation_point(self, call_node: tree_sitter.Node) -> Optional[tree_sitter.Node]:
        """Find a safe point to insert instrumentation that won't break syntax"""
        # Check if we're inside a simple conditional (if/else)
        conditional = self._find_enclosing_conditional(call_node)
        if conditional:
            # For if/else statements, instrument before the entire conditional
            return conditional
        
        # For switch statements or other cases, find the complete statement
        return self._find_complete_statement(call_node)
