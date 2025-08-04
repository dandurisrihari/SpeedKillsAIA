#!/usr/bin/env python3
"""
Function code extractor using tree-sitter C parser

Extracts complete function source code from C files given a file path and line number.
"""

import os
from pathlib import Path
from typing import Optional, Tuple, Any

try:
    import tree_sitter_c as tsc
    import tree_sitter as ts
    TREE_SITTER_AVAILABLE = True
except ImportError:
    TREE_SITTER_AVAILABLE = False
    tsc = None
    ts = None


class FunctionCodeExtractor:
    """Extracts function source code using tree-sitter C parser"""
    
    def __init__(self, source_root_path: Optional[str] = None):
        """
        Initialize the extractor
        
        Args:
            source_root_path: Optional base path to prepend to relative paths in logs
        """
        self.source_root_path = Path(source_root_path) if source_root_path else None
        
        if TREE_SITTER_AVAILABLE:
            # Initialize tree-sitter C parser
            self.language = ts.Language(tsc.language())
            self.parser = ts.Parser(self.language)
        else:
            self.language = None
            self.parser = None
    
    def extract_function_at_line(self, file_path: str, line_number: int) -> Optional[Tuple[str, str, int, int]]:
        """
        Extract function source code containing the specified line number
        
        Args:
            file_path: Path to the C file (can be relative if source_root_path is set)
            line_number: Line number within the function
            
        Returns:
            Tuple of (function_name, function_code, start_line, end_line) or None if not found
        """
        if not TREE_SITTER_AVAILABLE:
            return None
            
        # Resolve the full file path
        full_path = self._resolve_file_path(file_path)
        if not full_path or not full_path.exists():
            return None
        
        try:
            # Read the source file
            with open(full_path, 'r', encoding='utf-8', errors='ignore') as f:
                source_code = f.read()
            
            # Parse with tree-sitter
            tree = self.parser.parse(source_code.encode('utf-8'))
            source_bytes = source_code.encode('utf-8')
            
            # Find the function containing the specified line
            function_node = self._find_function_at_line(tree.root_node, line_number - 1, source_bytes)  # Convert to 0-based
            
            if function_node:
                # Extract function name
                function_name = self._get_function_name(function_node, source_bytes)
                
                # Extract function source code
                start_byte = function_node.start_byte
                end_byte = function_node.end_byte
                function_code = source_bytes[start_byte:end_byte].decode('utf-8', errors='ignore')
                
                # Get line numbers
                start_line = function_node.start_point[0] + 1  # Convert to 1-based
                end_line = function_node.end_point[0] + 1
                
                return function_name, function_code, start_line, end_line
            
        except Exception as e:
            print(f"Error extracting function from {full_path}: {e}")
        
        return None
    
    def _resolve_file_path(self, file_path: str) -> Optional[Path]:
        """Resolve file path, optionally prepending source_root_path"""
        path = Path(file_path)
        
        # If it's already absolute and exists, return it
        if path.is_absolute() and path.exists():
            return path
        
        # If we have a source root, try prepending it
        if self.source_root_path:
            full_path = self.source_root_path / file_path
            if full_path.exists():
                return full_path
        
        # Try as relative to current directory
        if path.exists():
            return path
        
        return None
    
    def _find_function_at_line(self, node: Any, target_line: int, source_bytes: bytes) -> Optional[Any]:
        """Find the function definition node that contains the target line"""
        # Check if this node is a function definition and contains the target line
        if node.type == 'function_definition':
            start_line = node.start_point[0]
            end_line = node.end_point[0]
            
            if start_line <= target_line <= end_line:
                return node
        
        # Recursively search child nodes
        for child in node.children:
            result = self._find_function_at_line(child, target_line, source_bytes)
            if result:
                return result
        
        return None
    
    def _get_function_name(self, function_node: Any, source_bytes: bytes) -> str:
        """Extract function name from function definition node"""
        # Look for the function declarator
        for child in function_node.children:
            if child.type == 'function_declarator':
                # Get the function name (first child of function_declarator)
                for declarator_child in child.children:
                    if declarator_child.type == 'identifier':
                        return source_bytes[declarator_child.start_byte:declarator_child.end_byte].decode('utf-8', errors='ignore')
            
            # Handle pointer declarators
            elif child.type in ('pointer_declarator', 'identifier'):
                # Traverse to find the identifier
                identifier = self._find_identifier_in_declarator(child, source_bytes)
                if identifier:
                    return identifier
        
        return "unknown_function"
    
    def _find_identifier_in_declarator(self, node: Any, source_bytes: bytes) -> Optional[str]:
        """Find identifier in a declarator node"""
        if node.type == 'identifier':
            return source_bytes[node.start_byte:node.end_byte].decode('utf-8', errors='ignore')
        
        for child in node.children:
            result = self._find_identifier_in_declarator(child, source_bytes)
            if result:
                return result
        
        return None
    
    def extract_function_code(self, file_path: str, function_name: str, line_number: int) -> Optional[str]:
        """
        Extract function source code by function name and line number
        
        Args:
            file_path: Path to the C file
            function_name: Name of the function to extract
            line_number: Line number within the function
            
        Returns:
            Function source code as string, or None if not found
        """
        result = self.extract_function_at_line(file_path, line_number)
        if result:
            extracted_name, code, start_line, end_line = result
            # Verify the function name matches (case-insensitive)
            if extracted_name.lower() == function_name.lower():
                return code
        return None
