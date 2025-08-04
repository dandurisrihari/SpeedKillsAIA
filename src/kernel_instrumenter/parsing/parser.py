#!/usr/bin/env python3
"""
Tree-sitter parser module for C code parsing

This module provides C code parsing capabilities using the tree-sitter library.
It handles initialization, configuration, and basic parsing operations.
"""

import sys
from typing import Optional

# Try to import required tree-sitter libraries
try:
    import tree_sitter
    import tree_sitter_c as tsc
    TREE_SITTER_AVAILABLE = True
except ImportError as e:
    TREE_SITTER_AVAILABLE = False
    tree_sitter = None
    tsc = None


class TreeSitterParser:
    """
    Handles tree-sitter parsing initialization and operations for C code
    
    This class encapsulates all tree-sitter related functionality:
    - Parser initialization with fallback to legacy API
    - Language configuration for C parsing
    - Source code parsing to Abstract Syntax Tree (AST)
    
    The parser supports both modern and legacy tree-sitter APIs to ensure
    compatibility across different tree-sitter versions.
    """
    
    def __init__(self):
        """Initialize the tree-sitter parser for C language"""
        self.language: Optional[tree_sitter.Language] = None
        self.parser: Optional[tree_sitter.Parser] = None
        self._initialize_parser()
    
    def _initialize_parser(self) -> None:
        """
        Initialize tree-sitter parser for C with fallback to legacy API
        
        Attempts to use the modern tree-sitter API first, then falls back
        to the legacy API if the modern one fails. This ensures compatibility
        with different versions of tree-sitter.
        
        Raises:
            RuntimeError: If both modern and legacy APIs fail to initialize
        """
        try:
            # Try modern tree-sitter API first (tree-sitter >= 0.20.0)
            self.language = tree_sitter.Language(tsc.language())
            self.parser = tree_sitter.Parser(self.language)
            print("✓ Using modern tree-sitter API")
        except Exception:
            try:
                # Fall back to legacy API (tree-sitter < 0.20.0)
                self.language = tree_sitter.Language(tsc.language(), "c")
                self.parser = tree_sitter.Parser()
                self.parser.set_language(self.language)
                print("✓ Using legacy tree-sitter API")
            except Exception as e:
                raise RuntimeError(f"Failed to initialize tree-sitter parser: {e}")
    
    def parse(self, source_code: str) -> tree_sitter.Tree:
        """
        Parse source code and return the Abstract Syntax Tree (AST)
        
        Args:
            source_code: C source code as string
            
        Returns:
            tree_sitter.Tree: Parsed AST of the source code
            
        Raises:
            RuntimeError: If parser is not initialized
        """
        if not self.parser:
            raise RuntimeError("Parser not initialized")
        return self.parser.parse(bytes(source_code, 'utf8'))
    
    def get_text_from_node(self, node: tree_sitter.Node, source_bytes: bytes) -> str:
        """
        Extract text content from a tree-sitter node
        
        Args:
            node: Tree-sitter AST node
            source_bytes: Source code as bytes
            
        Returns:
            str: Text content of the node
        """
        return source_bytes[node.start_byte:node.end_byte].decode('utf-8')
        """
        Initialize tree-sitter parser for C with fallback to legacy API
        
        Attempts to use the modern tree-sitter API first, then falls back
        to the legacy API if the modern one fails. This ensures compatibility
        with different versions of tree-sitter.
        
        Raises:
            RuntimeError: If both modern and legacy APIs fail to initialize
        """
        try:
            # Try modern tree-sitter API first (tree-sitter >= 0.20.0)
            self.language = tree_sitter.Language(tsc.language())
            self.parser = tree_sitter.Parser(self.language)
            print("✓ Using modern tree-sitter API")
        except Exception:
            try:
                # Fall back to legacy API (tree-sitter < 0.20.0)
                self.language = tree_sitter.Language(tsc.language(), "c")
                self.parser = tree_sitter.Parser()
                self.parser.set_language(self.language)
                print("✓ Using legacy tree-sitter API")
            except Exception as e:
                raise RuntimeError(f"Failed to initialize tree-sitter parser: {e}")
    
    def parse(self, source_code: str) -> tree_sitter.Tree:
        """
        Parse source code and return the Abstract Syntax Tree (AST)
        
        Args:
            source_code: C source code as string
            
        Returns:
            tree_sitter.Tree: Parsed AST of the source code
            
        Raises:
            RuntimeError: If parser is not initialized
        """
        if not self.parser:
            raise RuntimeError("Parser not initialized")
        return self.parser.parse(bytes(source_code, 'utf8'))
    
    def get_text_from_node(self, node: tree_sitter.Node, source_bytes: bytes) -> str:
        """
        Extract text content from a tree-sitter node
        
        Args:
            node: Tree-sitter AST node
            source_bytes: Source code as bytes
            
        Returns:
            str: Text content of the node
        """
        return source_bytes[node.start_byte:node.end_byte].decode('utf-8')
