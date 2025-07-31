#!/usr/bin/env python3
"""
DMA call analyzer module

This module provides analysis capabilities for finding and analyzing DMA API calls
in C source code using tree-sitter AST parsing.
"""

from typing import List, Dict, Any, Optional
import tree_sitter

from config import DMAAPIConfig
from parser import TreeSitterParser


class DMACallAnalyzer:
    """
    Analyzes C code to find DMA API calls using tree-sitter AST parsing
    
    This class is responsible for:
    - Traversing the Abstract Syntax Tree (AST) of C code
    - Identifying DMA function calls based on configured API list
    - Analyzing the context of each call (preprocessor, assignment, etc.)
    - Determining the best instrumentation strategy for each call
    
    The analyzer handles complex cases like:
    - Multi-line function calls
    - Calls inside preprocessor conditionals
    - Calls in assignment expressions
    - Calls in control flow statements
    """
    
    def __init__(self, parser: TreeSitterParser):
        """
        Initialize analyzer with a configured tree-sitter parser
        
        Args:
            parser: Initialized TreeSitterParser instance
        """
        self.parser = parser
        self.dma_apis = DMAAPIConfig.DMA_APIS

    # ============================================================================
    # UTILITY METHODS - Basic AST node operations
    # ============================================================================

    def get_text_from_node(self, node: tree_sitter.Node, source_bytes: bytes) -> str:
        """
        Extract text content from a tree-sitter node
        
        Args:
            node: Tree-sitter AST node
            source_bytes: Source code as bytes
            
        Returns:
            str: Text content of the node
        """
        return self.parser.get_text_from_node(node, source_bytes)

    def is_dma_allocation_call(self, node: tree_sitter.Node, source_bytes: bytes) -> bool:
        """
        Check if a node represents a DMA allocation call
        
        Args:
            node: Tree-sitter AST node to check
            source_bytes: Source code as bytes
            
        Returns:
            bool: True if node is a DMA function call, False otherwise
        """
        # Only check call expression nodes
        if node.type != 'call_expression':
            return False
        
        # Extract the function name
        function_node = node.child_by_field_name('function')
        if not function_node:
            return False
        
        function_name = self.get_text_from_node(function_node, source_bytes)
        return function_name in self.dma_apis

    def is_function_definition(self, node: tree_sitter.Node, source_bytes: bytes) -> bool:
        """
        Check if a node represents a function definition
        
        Args:
            node: Tree-sitter AST node to check
            source_bytes: Source code as bytes
            
        Returns:
            bool: True if node is a function definition, False otherwise
        """
        return node.type == 'function_definition'

    def get_function_name_from_definition(self, function_def_node: tree_sitter.Node, source_bytes: bytes) -> Optional[str]:
        """
        Extract function name from a function definition node
        
        Args:
            function_def_node: Function definition AST node
            source_bytes: Source code as bytes
            
        Returns:
            Optional[str]: Function name or None if not found
        """
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

    # ============================================================================
    # CONTEXT ANALYSIS METHODS - Determine call context and environment
    # ============================================================================
    
    def _is_inside_preprocessor_conditional(self, node: tree_sitter.Node) -> bool:
        """
        Check if the node is inside a preprocessor conditional block
        
        Preprocessor conditionals (#if, #ifdef, #else, etc.) require special
        handling because inserting code inside them can break syntax.
        
        Args:
            node: AST node to check
            
        Returns:
            bool: True if inside preprocessor conditional, False otherwise
        """
        current = node
        while current:
            if current.type in ('preproc_if', 'preproc_ifdef', 'preproc_elif', 'preproc_else'):
                return True
            current = current.parent
        return False

    def _find_preprocessor_block(self, node: tree_sitter.Node) -> Optional[tree_sitter.Node]:
        """
        Find the preprocessor block that contains this node
        
        Args:
            node: AST node to start search from
            
        Returns:
            Optional[tree_sitter.Node]: Preprocessor block node or None
        """
        current = node
        while current:
            if current.type in ('preproc_if', 'preproc_ifdef', 'preproc_elif', 'preproc_else'):
                return current
            current = current.parent
        return None

    def _find_assignment_with_preprocessor(self, call_node: tree_sitter.Node) -> Optional[tree_sitter.Node]:
        """
        Find assignment that spans across preprocessor conditionals
        
        This handles cases like:
        var = 
        #if condition
            dma_alloc_coherent(...)
        #else 
            dma_alloc_wc(...)
        #endif
        
        Args:
            call_node: DMA function call node
            
        Returns:
            Optional[tree_sitter.Node]: Assignment expression or None
        """
        current = call_node
        while current and current.parent:
            parent = current.parent
            # Look for assignment expressions that might span preprocessor blocks
            if parent.type == 'assignment_expression':
                return parent
            # Also check if we're in a preprocessor block that's part of an assignment
            elif parent.type in ('preproc_if', 'preproc_ifdef', 'preproc_elif', 'preproc_else'):
                # Look at the parent of the preprocessor block
                pp_parent = parent.parent
                if pp_parent and pp_parent.type == 'assignment_expression':
                    return pp_parent
            current = parent
        return None

    def _is_inside_assignment(self, node: tree_sitter.Node) -> bool:
        """
        Check if the node is the right-hand side of an assignment
        
        Assignment expressions require special handling to ensure the
        instrumentation doesn't break the assignment syntax.
        
        Args:
            node: AST node to check
            
        Returns:
            bool: True if inside assignment RHS, False otherwise
        """
        current = node
        while current and current.parent:
            parent = current.parent
            if parent.type == 'assignment_expression':
                # Check if we're the right-hand side (not the left-hand side)
                right_node = parent.child_by_field_name('right')
                if right_node and self._node_contains(right_node, current):
                    return True
            current = parent
        return False
    
    def _node_contains(self, parent: tree_sitter.Node, child: tree_sitter.Node) -> bool:
        """
        Check if parent node contains child node
        
        Args:
            parent: Parent AST node
            child: Child AST node
            
        Returns:
            bool: True if parent contains child, False otherwise
        """
        return (parent.start_byte <= child.start_byte and 
                parent.end_byte >= child.end_byte)

    # ============================================================================
    # STATEMENT ANALYSIS METHODS - Find and analyze statement boundaries
    # ============================================================================

    def _find_assignment_start(self, call_node: tree_sitter.Node) -> Optional[tree_sitter.Node]:
        """
        Find the assignment statement that contains this DMA call
        
        This method locates the beginning of an assignment statement to
        ensure instrumentation is placed before the entire assignment.
        
        Args:
            call_node: DMA function call node
            
        Returns:
            Optional[tree_sitter.Node]: Assignment statement node or None
        """
        current = call_node
        while current and current.parent:
            parent = current.parent
            if parent.type == 'assignment_expression':
                # Find the statement containing this assignment
                assignment_stmt = parent
                while assignment_stmt and assignment_stmt.parent:
                    if assignment_stmt.parent.type == 'expression_statement':
                        return assignment_stmt.parent
                    assignment_stmt = assignment_stmt.parent
                return parent
            current = parent
        return None

    def _find_complete_statement(self, call_node: tree_sitter.Node) -> Optional[tree_sitter.Node]:
        """
        Find the complete statement that contains this function call
        
        This method identifies the full statement boundary to handle
        multi-line statements correctly.
        
        Args:
            call_node: DMA function call node
            
        Returns:
            Optional[tree_sitter.Node]: Complete statement node or None
        """
        current = call_node
        while current and current.parent:
            parent = current.parent
            if parent.type in ('expression_statement', 'declaration'):
                return parent
            elif parent.type == 'compound_statement':
                # If we reach a compound statement, return the immediate child
                return current
            current = parent
        return current

    def _find_statement_end_line(self, call_node: tree_sitter.Node, source_bytes: bytes) -> int:
        """
        Find the line where the complete statement ends (including multi-line calls)
        
        This is crucial for handling multi-line function calls where the
        closing parenthesis and semicolon may be on different lines.
        
        Args:
            call_node: DMA function call node
            source_bytes: Source code as bytes
            
        Returns:
            int: Line number where statement ends
        """
        # Find the complete statement that contains this call
        statement = self._find_complete_statement(call_node)
        if statement:
            return statement.end_point[0]
        else:
            # Fallback to the call's end line
            return call_node.end_point[0]

    def _is_multiline_call(self, call_node: tree_sitter.Node, source_bytes: bytes) -> bool:
        """
        Check if a function call spans multiple lines
        
        Multi-line calls require special handling to avoid breaking
        the function call syntax during instrumentation.
        
        Args:
            call_node: DMA function call node
            source_bytes: Source code as bytes
            
        Returns:
            bool: True if call spans multiple lines, False otherwise
        """
        call_text = self.get_text_from_node(call_node, source_bytes)
        return '\n' in call_text

    def get_function_name_from_node(self, call_node: tree_sitter.Node, source_bytes: bytes) -> Optional[str]:
        """
        Extract function name from a call expression node
        
        Args:
            call_node: Call expression AST node
            source_bytes: Source code as bytes
            
        Returns:
            Optional[str]: Function name or None if not found
        """
        function_node = call_node.child_by_field_name('function')
        if function_node:
            return self.get_text_from_node(function_node, source_bytes)
        return None

    # ============================================================================
    # AST TRAVERSAL METHODS - Find and analyze DMA calls and function definitions
    # ============================================================================

    def _find_instrumentable_nodes_recursive(self, node: tree_sitter.Node, source_bytes: bytes, 
                                           dma_results: List[Dict[str, Any]], 
                                           function_results: List[Dict[str, Any]], 
                                           in_condition: bool = False) -> None:
        """
        Recursively traverse the AST to find both DMA calls and function definitions
        
        This method performs a depth-first traversal of the AST, analyzing
        each node to:
        1. Identify DMA function calls and function definitions
        2. Analyze their context (preprocessor, assignment, etc.)
        3. Determine the best instrumentation strategy
        4. Collect metadata for instrumentation
        
        Args:
            node: Current AST node being processed
            source_bytes: Source code as bytes
            dma_results: List to collect found DMA calls
            function_results: List to collect found function definitions
            in_condition: Whether we're inside a conditional expression
        """
        
        # Special handling for if statements to track conditional context
        if node.type == 'if_statement':
            # Process condition separately (mark as in_condition=True)
            condition_node = node.child_by_field_name('condition')
            if condition_node:
                self._find_instrumentable_nodes_recursive(condition_node, source_bytes, dma_results, function_results, True)
            
            # Process consequence (body of if)
            consequence = node.child_by_field_name('consequence')
            if consequence:
                self._find_instrumentable_nodes_recursive(consequence, source_bytes, dma_results, function_results, in_condition)
            
            # Process alternative (else clause)
            alternative = node.child_by_field_name('alternative')
            if alternative:
                self._find_instrumentable_nodes_recursive(alternative, source_bytes, dma_results, function_results, in_condition)
            return
            
        # Check if current node is a function definition
        elif self.is_function_definition(node, source_bytes):
            function_name = self.get_function_name_from_definition(node, source_bytes)
            if function_name:
                # Skip internal/compiler-generated functions
                if not function_name.startswith('__') and function_name != 'main':
                    # Find the function body to instrument at the beginning
                    body = node.child_by_field_name('body')
                    if body and body.type == 'compound_statement':
                        # Find the first statement inside the function body
                        first_statement_line = body.start_point[0] + 1  # After opening brace
                        
                        function_results.append({
                            'function_name': function_name,
                            'line_number': first_statement_line,
                            'def_line_number': node.start_point[0],
                            'column': node.start_point[1],
                            'instrumentation_strategy': 'function_entry',
                            'instrumentation_type': 'function_entry'
                        })
            
        # Check if current node is a DMA function call
        elif self.is_dma_allocation_call(node, source_bytes):
            function_name = self.get_function_name_from_node(node, source_bytes)
            if function_name:
                # Analyze the context and environment of this DMA call
                in_preprocessor = self._is_inside_preprocessor_conditional(node)
                in_assignment = self._is_inside_assignment(node)
                assignment_start = self._find_assignment_start(node) if in_assignment else None
                preprocessor_assignment = self._find_assignment_with_preprocessor(node) if in_preprocessor else None
                is_multiline = self._is_multiline_call(node, source_bytes)
                complete_statement = self._find_complete_statement(node)
                statement_end_line = self._find_statement_end_line(node, source_bytes)
                
                # Determine the best instrumentation strategy based on context
                target_line = node.start_point[0]  # Default to call line
                instrumentation_strategy = 'before_call'
                
                if in_preprocessor and preprocessor_assignment:
                    # For preprocessor conditionals in assignments, instrument before the assignment
                    target_line = preprocessor_assignment.start_point[0]
                    instrumentation_strategy = 'before_preprocessor_assignment'
                elif in_assignment and assignment_start:
                    # For assignments, instrument before the assignment
                    target_line = assignment_start.start_point[0]
                    instrumentation_strategy = 'before_assignment'
                elif in_preprocessor:
                    # For other preprocessor conditionals, skip or use special handling
                    instrumentation_strategy = 'skip_preprocessor'
                elif is_multiline and complete_statement:
                    # For multiline calls, instrument before the complete statement
                    target_line = complete_statement.start_point[0]
                    instrumentation_strategy = 'before_statement'
                
                # Store all the metadata for this DMA call
                dma_results.append({
                    'node': node,
                    'function_name': function_name,
                    'line_number': target_line,
                    'call_line_number': node.start_point[0],
                    'call_end_line': statement_end_line,
                    'column': node.start_point[1],
                    'in_condition': in_condition,
                    'in_preprocessor': in_preprocessor,
                    'in_assignment': in_assignment,
                    'is_multiline': is_multiline,
                    'instrumentation_strategy': instrumentation_strategy,
                    'instrumentation_type': 'dma_call'
                })
        
        # Continue traversing child nodes
        for child in node.children:
            self._find_instrumentable_nodes_recursive(child, source_bytes, dma_results, function_results, in_condition)

    def _find_dma_calls_recursive(self, node: tree_sitter.Node, source_bytes: bytes, 
                                results: List[Dict[str, Any]], in_condition: bool = False) -> None:
        """
        Recursively traverse the AST to find all DMA allocation calls
        
        This method performs a depth-first traversal of the AST, analyzing
        each node to:
        1. Identify DMA function calls
        2. Analyze their context (preprocessor, assignment, etc.)
        3. Determine the best instrumentation strategy
        4. Collect metadata for instrumentation
        
        Args:
            node: Current AST node being processed
            source_bytes: Source code as bytes
            results: List to collect found DMA calls
            in_condition: Whether we're inside a conditional expression
        """
        
        # Special handling for if statements to track conditional context
        if node.type == 'if_statement':
            # Process condition separately (mark as in_condition=True)
            condition_node = node.child_by_field_name('condition')
            if condition_node:
                self._find_dma_calls_recursive(condition_node, source_bytes, results, True)
            
            # Process consequence (body of if)
            consequence = node.child_by_field_name('consequence')
            if consequence:
                self._find_dma_calls_recursive(consequence, source_bytes, results, in_condition)
            
            # Process alternative (else clause)
            alternative = node.child_by_field_name('alternative')
            if alternative:
                self._find_dma_calls_recursive(alternative, source_bytes, results, in_condition)
            return
            
        # Check if current node is a DMA function call
        elif self.is_dma_allocation_call(node, source_bytes):
            function_name = self.get_function_name_from_node(node, source_bytes)
            if function_name:
                # Analyze the context and environment of this DMA call
                in_preprocessor = self._is_inside_preprocessor_conditional(node)
                in_assignment = self._is_inside_assignment(node)
                assignment_start = self._find_assignment_start(node) if in_assignment else None
                preprocessor_assignment = self._find_assignment_with_preprocessor(node) if in_preprocessor else None
                is_multiline = self._is_multiline_call(node, source_bytes)
                complete_statement = self._find_complete_statement(node)
                statement_end_line = self._find_statement_end_line(node, source_bytes)
                
                # Determine the best instrumentation strategy based on context
                target_line = node.start_point[0]  # Default to call line
                instrumentation_strategy = 'before_call'
                
                if in_preprocessor and preprocessor_assignment:
                    # For preprocessor conditionals in assignments, instrument before the assignment
                    target_line = preprocessor_assignment.start_point[0]
                    instrumentation_strategy = 'before_preprocessor_assignment'
                elif in_assignment and assignment_start:
                    # For assignments, instrument before the assignment
                    target_line = assignment_start.start_point[0]
                    instrumentation_strategy = 'before_assignment'
                elif in_preprocessor:
                    # For other preprocessor conditionals, skip or use special handling
                    instrumentation_strategy = 'skip_preprocessor'
                elif is_multiline and complete_statement:
                    # For multiline calls, instrument before the complete statement
                    target_line = complete_statement.start_point[0]
                    instrumentation_strategy = 'before_statement'
                
                # Store all the metadata for this DMA call
                results.append({
                    'node': node,
                    'function_name': function_name,
                    'line_number': target_line,
                    'call_line_number': node.start_point[0],
                    'call_end_line': statement_end_line,
                    'column': node.start_point[1],
                    'in_condition': in_condition,
                    'in_preprocessor': in_preprocessor,
                    'in_assignment': in_assignment,
                    'is_multiline': is_multiline,
                    'instrumentation_strategy': instrumentation_strategy,
                })
        
        # Continue traversing child nodes
        for child in node.children:
            self._find_dma_calls_recursive(child, source_bytes, results, in_condition)

    def find_dma_calls_in_file(self, source_code: str) -> List[Dict[str, Any]]:
        """
        Find all DMA allocation calls in a source file
        
        This is the main entry point for DMA call analysis. It:
        1. Parses the source code into an AST
        2. Recursively finds all DMA calls
        3. Formats the results with proper indentation info
        4. Returns structured data for instrumentation
        
        Args:
            source_code: C source code as string
            
        Returns:
            List[Dict[str, Any]]: List of DMA calls with metadata
        """
        try:
            # Parse source code into AST
            tree = self.parser.parse(source_code)
            source_bytes = bytes(source_code, 'utf8')
            
            # Find all DMA calls in the AST
            results = []
            self._find_dma_calls_recursive(tree.root_node, source_bytes, results)
            
            # Format results with indentation and line information
            source_lines = source_code.split('\n')
            formatted_results = []
            
            for call_info in results:
                line_number = call_info['line_number']
                if line_number < len(source_lines):
                    line = source_lines[line_number]
                    indentation = ' ' * (len(line) - len(line.lstrip()))
                    
                    formatted_results.append({
                        'function_name': call_info['function_name'],
                        'line_number': line_number,
                        'call_line_number': call_info['call_line_number'],
                        'call_end_line': call_info.get('call_end_line', call_info['call_line_number']),
                        'column': call_info['column'],
                        'indentation': indentation,
                        'in_condition': call_info.get('in_condition', False),
                        'in_preprocessor': call_info.get('in_preprocessor', False),
                        'in_assignment': call_info.get('in_assignment', False),
                        'is_multiline': call_info.get('is_multiline', False),
                        'instrumentation_strategy': call_info.get('instrumentation_strategy', 'before_call'),
                    })
            
            return formatted_results
            
        except Exception as e:
            print(f"Error parsing source code: {e}")
            return []

    def find_all_instrumentable_items(self, source_code: str) -> Dict[str, List[Dict[str, Any]]]:
        """
        Find all instrumentable items (DMA calls and function definitions) in a source file
        
        This is the main entry point for comprehensive code analysis. It:
        1. Parses the source code into an AST
        2. Recursively finds all DMA calls and function definitions
        3. Formats the results with proper indentation info
        4. Returns structured data for instrumentation
        
        Args:
            source_code: C source code as string
            
        Returns:
            Dict containing 'dma_calls' and 'functions' lists with metadata
        """
        try:
            # Parse source code into AST
            tree = self.parser.parse(source_code)
            source_bytes = bytes(source_code, 'utf8')
            
            # Find all instrumentable items in the AST
            dma_results = []
            function_results = []
            self._find_instrumentable_nodes_recursive(tree.root_node, source_bytes, dma_results, function_results)
            
            # Format results with indentation and line information
            source_lines = source_code.split('\n')
            
            # Format DMA call results
            formatted_dma_calls = []
            for call_info in dma_results:
                line_number = call_info['line_number']
                if line_number < len(source_lines):
                    line = source_lines[line_number]
                    indentation = ' ' * (len(line) - len(line.lstrip()))
                    
                    formatted_dma_calls.append({
                        'function_name': call_info['function_name'],
                        'line_number': line_number,
                        'call_line_number': call_info['call_line_number'],
                        'call_end_line': call_info.get('call_end_line', call_info['call_line_number']),
                        'column': call_info['column'],
                        'indentation': indentation,
                        'in_condition': call_info.get('in_condition', False),
                        'in_preprocessor': call_info.get('in_preprocessor', False),
                        'in_assignment': call_info.get('in_assignment', False),
                        'is_multiline': call_info.get('is_multiline', False),
                        'instrumentation_strategy': call_info.get('instrumentation_strategy', 'before_call'),
                        'instrumentation_type': 'dma_call'
                    })
            
            # Format function definition results
            formatted_functions = []
            for func_info in function_results:
                line_number = func_info['line_number']
                if line_number < len(source_lines):
                    # For function entry, use the indentation of the first statement inside the function
                    if line_number < len(source_lines):
                        line = source_lines[line_number] if line_number < len(source_lines) else ""
                        # Function body typically has 4 spaces or 1 tab indentation
                        indentation = "    "  # Standard 4-space indentation for function body
                    else:
                        indentation = "    "
                    
                    formatted_functions.append({
                        'function_name': func_info['function_name'],
                        'line_number': line_number,
                        'def_line_number': func_info['def_line_number'],
                        'column': func_info['column'],
                        'indentation': indentation,
                        'instrumentation_strategy': func_info.get('instrumentation_strategy', 'function_entry'),
                        'instrumentation_type': 'function_entry'
                    })
            
            return {
                'dma_calls': formatted_dma_calls,
                'functions': formatted_functions
            }
            
        except Exception as e:
            print(f"Error parsing source code: {e}")
            return {'dma_calls': [], 'functions': []}
