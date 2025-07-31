#!/usr/bin/env python3
"""
Base analyzer for all instrumentation types
"""

from typing import List, Dict, Any, Optional
import tree_sitter

from ..parser import TreeSitterParser
import logging
from typing import List, Dict, Any, Optional
from abc import ABC, abstractmethod

from tree_sitter import Language, Parser
try:
    from tree_sitter_c import language
    tree_sitter_c = language()
except ImportError:
    tree_sitter_c = None

from ..instrument_types.base import InstrumentationType


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

    def _is_inside_preprocessor_conditional(self, node: tree_sitter.Node) -> bool:
        """Check if the node is inside a preprocessor conditional block"""
        current = node
        while current:
            if current.type in ('preproc_if', 'preproc_ifdef', 'preproc_elif', 'preproc_else'):
                return True
            current = current.parent
        return False

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
