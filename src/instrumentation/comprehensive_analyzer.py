#!/usr/bin/env python3
"""
Focused analyzer for kernel instrumentation

This module provides analysis capabilities for finding three specific types
of kernel operations: DMA calls, user space copy operations, and function entries.
"""

from typing import List, Dict, Any, Optional, Set
import tree_sitter

from config_new import KernelAPIs, InstrumentationType, InstrumentationConfig
from parser import TreeSitterParser


class ComprehensiveKernelAnalyzer:
    """
    Analyzes C code to find specific kernel operations for instrumentation
    
    This class detects:
    - DMA API calls (dma_alloc_coherent, dma_map_single, etc.)
    - User space copy operations (copy_from_user, copy_to_user, etc.)
    - Function definitions for entry point instrumentation
    """
    
    def __init__(self, parser: TreeSitterParser, config: InstrumentationConfig):
        """
        Initialize analyzer with parser and configuration
        
        Args:
            parser: Initialized TreeSitterParser instance
            config: InstrumentationConfig specifying what to instrument
        """
        self.parser = parser
        self.config = config
        self.enabled_types = config.get_enabled_types()
        
        # API sets for different instrumentation types
        self.dma_apis = KernelAPIs.DMA_APIS if InstrumentationType.DMA_CALLS in self.enabled_types else set()
        self.user_copy_apis = KernelAPIs.USER_COPY_APIS if InstrumentationType.USER_COPY_OPS in self.enabled_types else set()

    # ============================================================================
    # UTILITY METHODS - Basic AST node operations
    # ============================================================================

    def get_text_from_node(self, node: tree_sitter.Node, source_bytes: bytes) -> str:
        """Extract text content from a tree-sitter node"""
        return source_bytes[node.start_byte:node.end_byte].decode('utf-8')

    def is_target_function_call(self, node: tree_sitter.Node, source_bytes: bytes) -> Optional[InstrumentationType]:
        """
        Check if a node represents a function call we want to instrument
        
        Returns:
            InstrumentationType if this is a target call, None otherwise
        """
        if node.type != 'call_expression':
            return None
        
        # Extract the function name
        function_node = node.child_by_field_name('function')
        if not function_node:
            return None
        
        function_name = self.get_text_from_node(function_node, source_bytes)
        
        # Check which type of API this is
        if function_name in self.dma_apis:
            return InstrumentationType.DMA_CALLS
        elif function_name in self.user_copy_apis:
            return InstrumentationType.USER_COPY_OPS
        
        return None

    def is_function_definition(self, node: tree_sitter.Node) -> bool:
        """Check if a node represents a function definition"""
        return (node.type == 'function_definition' and 
                InstrumentationType.FUNCTION_ENTRIES in self.enabled_types)

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
            declarator_name = declarator.child_by_field_name('declarator')
            if declarator_name:
                return self.get_text_from_node(declarator_name, source_bytes)
        elif declarator.type == 'pointer_declarator':
            inner_declarator = declarator.child_by_field_name('declarator')
            if inner_declarator and inner_declarator.type == 'function_declarator':
                declarator_name = inner_declarator.child_by_field_name('declarator')
                if declarator_name:
                    return self.get_text_from_node(declarator_name, source_bytes)
        elif declarator.type == 'identifier':
            return self.get_text_from_node(declarator, source_bytes)
            
        return None

    def get_function_name_from_call(self, call_node: tree_sitter.Node, source_bytes: bytes) -> Optional[str]:
        """Extract function name from a call expression node"""
        function_node = call_node.child_by_field_name('function')
        if function_node:
            return self.get_text_from_node(function_node, source_bytes)
        return None

    # ============================================================================
    # CONTEXT ANALYSIS METHODS - Determine call context and environment
    # ============================================================================
    
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

    def _is_multiline_call(self, call_node: tree_sitter.Node, source_bytes: bytes) -> bool:
        """Check if a function call spans multiple lines"""
        call_text = self.get_text_from_node(call_node, source_bytes)
        return '\n' in call_text

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

    # ============================================================================
    # AST TRAVERSAL METHODS - Find and analyze all target operations
    # ============================================================================

    def _find_instrumentable_nodes_recursive(self, node: tree_sitter.Node, source_bytes: bytes, 
                                           api_call_results: List[Dict[str, Any]], 
                                           function_results: List[Dict[str, Any]], 
                                           in_condition: bool = False) -> None:
        """
        Recursively traverse the AST to find all instrumentable operations
        
        Args:
            node: Current AST node being processed
            source_bytes: Source code as bytes
            api_call_results: List to collect found API calls (DMA and user copy)
            function_results: List to collect found function definitions
            in_condition: Whether we're inside a conditional expression
        """
        
        # Special handling for if statements to track conditional context
        if node.type == 'if_statement':
            condition_node = node.child_by_field_name('condition')
            if condition_node:
                self._find_instrumentable_nodes_recursive(condition_node, source_bytes, api_call_results, function_results, True)
            
            consequence = node.child_by_field_name('consequence')
            if consequence:
                self._find_instrumentable_nodes_recursive(consequence, source_bytes, api_call_results, function_results, in_condition)
            
            alternative = node.child_by_field_name('alternative')
            if alternative:
                self._find_instrumentable_nodes_recursive(alternative, source_bytes, api_call_results, function_results, in_condition)
            return
            
        # Check if current node is a function definition
        elif self.is_function_definition(node):
            function_name = self.get_function_name_from_definition(node, source_bytes)
            if function_name and not function_name.startswith('__') and function_name != 'main':
                # Find the function body to instrument at the beginning
                body = node.child_by_field_name('body')
                if body and body.type == 'compound_statement':
                    first_statement_line = body.start_point[0] + 1  # After opening brace
                    
                    function_results.append({
                        'function_name': function_name,
                        'line_number': first_statement_line,
                        'def_line_number': node.start_point[0],
                        'column': node.start_point[1],
                        'instrumentation_strategy': 'function_entry',
                        'instrumentation_type': InstrumentationType.FUNCTION_ENTRIES
                    })
            
        # Check if current node is an API call we want to instrument
        else:
            api_type = self.is_target_function_call(node, source_bytes)
            if api_type:
                function_name = self.get_function_name_from_call(node, source_bytes)
                if function_name:
                    # Analyze the context and environment of this API call
                    in_preprocessor = self._is_inside_preprocessor_conditional(node)
                    in_assignment = self._is_inside_assignment(node)
                    is_multiline = self._is_multiline_call(node, source_bytes)
                    complete_statement = self._find_complete_statement(node)
                    
                    # Determine the best instrumentation strategy based on context
                    target_line = node.start_point[0]  # Default to call line
                    instrumentation_strategy = 'before_call'
                    
                    if in_preprocessor:
                        instrumentation_strategy = 'skip_preprocessor'
                    elif is_multiline and complete_statement:
                        target_line = complete_statement.start_point[0]
                        instrumentation_strategy = 'before_statement'
                    
                    # Store all the metadata for this API call
                    api_call_results.append({
                        'node': node,
                        'function_name': function_name,
                        'line_number': target_line,
                        'call_line_number': node.start_point[0],
                        'call_end_line': node.end_point[0],
                        'column': node.start_point[1],
                        'in_condition': in_condition,
                        'in_preprocessor': in_preprocessor,
                        'in_assignment': in_assignment,
                        'is_multiline': is_multiline,
                        'instrumentation_strategy': instrumentation_strategy,
                        'instrumentation_type': api_type
                    })
        
        # Continue traversing child nodes
        for child in node.children:
            self._find_instrumentable_nodes_recursive(child, source_bytes, api_call_results, function_results, in_condition)

    def find_all_instrumentable_items(self, source_code: str) -> Dict[str, List[Dict[str, Any]]]:
        """
        Find all instrumentable items based on the current configuration
        
        Args:
            source_code: C source code as string
            
        Returns:
            Dict containing lists of found items by type
        """
        try:
            # Parse source code into AST
            tree = self.parser.parse(source_code)
            source_bytes = bytes(source_code, 'utf8')
            
            # Find all instrumentable items in the AST
            api_call_results = []
            function_results = []
            self._find_instrumentable_nodes_recursive(tree.root_node, source_bytes, api_call_results, function_results)
            
            # Format results with indentation and line information
            source_lines = source_code.split('\n')
            
            # Format API call results (DMA and user copy)
            formatted_api_calls = []
            for call_info in api_call_results:
                line_number = call_info['line_number']
                if line_number < len(source_lines):
                    line = source_lines[line_number]
                    indentation = ' ' * (len(line) - len(line.lstrip()))
                    
                    formatted_api_calls.append({
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
                        'instrumentation_type': call_info['instrumentation_type']
                    })
            
            # Format function definition results
            formatted_functions = []
            for func_info in function_results:
                line_number = func_info['line_number']
                if line_number < len(source_lines):
                    indentation = "    "  # Standard 4-space indentation for function body
                    
                    formatted_functions.append({
                        'function_name': func_info['function_name'],
                        'line_number': line_number,
                        'def_line_number': func_info['def_line_number'],
                        'column': func_info['column'],
                        'indentation': indentation,
                        'instrumentation_strategy': func_info.get('instrumentation_strategy', 'function_entry'),
                        'instrumentation_type': InstrumentationType.FUNCTION_ENTRIES
                    })
            
            # Separate results by type for easier processing
            results = {
                'dma_calls': [item for item in formatted_api_calls if item['instrumentation_type'] == InstrumentationType.DMA_CALLS],
                'user_copy_ops': [item for item in formatted_api_calls if item['instrumentation_type'] == InstrumentationType.USER_COPY_OPS],
                'functions': formatted_functions,
                'all_api_calls': formatted_api_calls  # Combined API calls
            }
            
            return results
            
        except Exception as e:
            print(f"Error parsing source code: {e}")
            return {'dma_calls': [], 'user_copy_ops': [], 'functions': [], 'all_api_calls': []}

    def get_text_from_node(self, node: tree_sitter.Node, source_bytes: bytes) -> str:
        """Extract text content from a tree-sitter node"""
        return source_bytes[node.start_byte:node.end_byte].decode('utf-8')

    def is_target_api_call(self, node: tree_sitter.Node, source_bytes: bytes) -> Optional[InstrumentationType]:
        """
        Check if a node represents a target API call and return its type
        
        Args:
            node: Tree-sitter AST node to check
            source_bytes: Source code as bytes
            
        Returns:
            InstrumentationType if node is a target call, None otherwise
        """
        if node.type != 'call_expression':
            return None
        
        function_node = node.child_by_field_name('function')
        if not function_node:
            return None
        
        function_name = self.get_text_from_node(function_node, source_bytes)
        
        # Check each enabled API set
        for instr_type, api_set in self.api_sets.items():
            if function_name in api_set:
                return instr_type
        
        return None

    def is_function_definition(self, node: tree_sitter.Node, source_bytes: bytes) -> bool:
        """Check if a node represents a function definition"""
        return node.type == 'function_definition'

    def get_function_name_from_definition(self, function_def_node: tree_sitter.Node, source_bytes: bytes) -> Optional[str]:
        """Extract function name from a function definition node"""
        if function_def_node.type != 'function_definition':
            return None
            
        declarator = function_def_node.child_by_field_name('declarator')
        if not declarator:
            return None
            
        # Handle different declarator types
        if declarator.type == 'function_declarator':
            declarator_name = declarator.child_by_field_name('declarator')
            if declarator_name:
                return self.get_text_from_node(declarator_name, source_bytes)
        elif declarator.type == 'pointer_declarator':
            inner_declarator = declarator.child_by_field_name('declarator')
            if inner_declarator and inner_declarator.type == 'function_declarator':
                declarator_name = inner_declarator.child_by_field_name('declarator')
                if declarator_name:
                    return self.get_text_from_node(declarator_name, source_bytes)
        elif declarator.type == 'identifier':
            return self.get_text_from_node(declarator, source_bytes)
            
        return None

    def get_function_name_from_call(self, call_node: tree_sitter.Node, source_bytes: bytes) -> Optional[str]:
        """Extract function name from a call expression node"""
        function_node = call_node.child_by_field_name('function')
        if function_node:
            return self.get_text_from_node(function_node, source_bytes)
        return None

    # ============================================================================
    # CONTEXT ANALYSIS METHODS - Same as original DMACallAnalyzer
    # ============================================================================
    
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

    def _find_assignment_start(self, call_node: tree_sitter.Node) -> Optional[tree_sitter.Node]:
        """Find the assignment statement that contains this call"""
        current = call_node
        while current and current.parent:
            parent = current.parent
            if parent.type == 'assignment_expression':
                assignment_stmt = parent
                while assignment_stmt and assignment_stmt.parent:
                    if assignment_stmt.parent.type == 'expression_statement':
                        return assignment_stmt.parent
                    assignment_stmt = assignment_stmt.parent
                return parent
            current = parent
        return None

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

    def _find_statement_end_line(self, call_node: tree_sitter.Node, source_bytes: bytes) -> int:
        """Find the line where the complete statement ends"""
        statement = self._find_complete_statement(call_node)
        if statement:
            return statement.end_point[0]
        else:
            return call_node.end_point[0]

    def _is_multiline_call(self, call_node: tree_sitter.Node, source_bytes: bytes) -> bool:
        """Check if a function call spans multiple lines"""
        call_text = self.get_text_from_node(call_node, source_bytes)
        return '\n' in call_text

    def _find_assignment_with_preprocessor(self, call_node: tree_sitter.Node) -> Optional[tree_sitter.Node]:
        """Find assignment that spans across preprocessor conditionals"""
        current = call_node
        while current and current.parent:
            parent = current.parent
            if parent.type == 'assignment_expression':
                return parent
            elif parent.type in ('preproc_if', 'preproc_ifdef', 'preproc_elif', 'preproc_else'):
                pp_parent = parent.parent
                if pp_parent and pp_parent.type == 'assignment_expression':
                    return pp_parent
            current = parent
        return None

    # ============================================================================
    # AST TRAVERSAL METHODS
    # ============================================================================

    def _find_instrumentable_nodes_recursive(self, node: tree_sitter.Node, source_bytes: bytes, 
                                           results: Dict[InstrumentationType, List[Dict[str, Any]]], 
                                           in_condition: bool = False) -> None:
        """
        Recursively traverse the AST to find all instrumentable items
        
        Args:
            node: Current AST node being processed
            source_bytes: Source code as bytes
            results: Dictionary mapping instrumentation types to their found items
            in_condition: Whether we're inside a conditional expression
        """
        
        # Special handling for if statements
        if node.type == 'if_statement':
            condition_node = node.child_by_field_name('condition')
            if condition_node:
                self._find_instrumentable_nodes_recursive(condition_node, source_bytes, results, True)
            
            consequence = node.child_by_field_name('consequence')
            if consequence:
                self._find_instrumentable_nodes_recursive(consequence, source_bytes, results, in_condition)
            
            alternative = node.child_by_field_name('alternative')
            if alternative:
                self._find_instrumentable_nodes_recursive(alternative, source_bytes, results, in_condition)
            return
            
        # Check if current node is a function definition
        elif (InstrumentationType.FUNCTION_ENTRIES in self.enabled_types and 
              self.is_function_definition(node, source_bytes)):
            function_name = self.get_function_name_from_definition(node, source_bytes)
            if function_name and not function_name.startswith('__') and function_name != 'main':
                body = node.child_by_field_name('body')
                if body and body.type == 'compound_statement':
                    first_statement_line = body.start_point[0] + 1
                    
                    if InstrumentationType.FUNCTION_ENTRIES not in results:
                        results[InstrumentationType.FUNCTION_ENTRIES] = []
                    
                    results[InstrumentationType.FUNCTION_ENTRIES].append({
                        'function_name': function_name,
                        'line_number': first_statement_line,
                        'def_line_number': node.start_point[0],
                        'column': node.start_point[1],
                        'instrumentation_strategy': 'function_entry',
                        'instrumentation_type': InstrumentationType.FUNCTION_ENTRIES
                    })
            
        # Check if current node is a target API call
        else:
            api_type = self.is_target_api_call(node, source_bytes)
            if api_type:
                function_name = self.get_function_name_from_call(node, source_bytes)
                if function_name:
                    # Analyze context
                    in_preprocessor = self._is_inside_preprocessor_conditional(node)
                    in_assignment = self._is_inside_assignment(node)
                    assignment_start = self._find_assignment_start(node) if in_assignment else None
                    preprocessor_assignment = self._find_assignment_with_preprocessor(node) if in_preprocessor else None
                    is_multiline = self._is_multiline_call(node, source_bytes)
                    complete_statement = self._find_complete_statement(node)
                    statement_end_line = self._find_statement_end_line(node, source_bytes)
                    
                    # Determine instrumentation strategy
                    target_line = node.start_point[0]
                    instrumentation_strategy = 'before_call'
                    
                    if in_preprocessor and preprocessor_assignment:
                        target_line = preprocessor_assignment.start_point[0]
                        instrumentation_strategy = 'before_preprocessor_assignment'
                    elif in_assignment and assignment_start:
                        target_line = assignment_start.start_point[0]
                        instrumentation_strategy = 'before_assignment'
                    elif in_preprocessor:
                        instrumentation_strategy = 'skip_preprocessor'
                    elif is_multiline and complete_statement:
                        target_line = complete_statement.start_point[0]
                        instrumentation_strategy = 'before_statement'
                    
                    if api_type not in results:
                        results[api_type] = []
                    
                    results[api_type].append({
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
                        'instrumentation_type': api_type
                    })
        
        # Continue traversing child nodes
        for child in node.children:
            self._find_instrumentable_nodes_recursive(child, source_bytes, results, in_condition)

    def find_all_instrumentable_items(self, source_code: str) -> Dict[str, List[Dict[str, Any]]]:
        """
        Find all instrumentable items in a source file
        
        Args:
            source_code: C source code as string
            
        Returns:
            Dict mapping instrumentation type names to lists of found items
        """
        try:
            tree = self.parser.parse(source_code)
            source_bytes = bytes(source_code, 'utf8')
            
            # Find all instrumentable items
            results = {}
            self._find_instrumentable_nodes_recursive(tree.root_node, source_bytes, results)
            
            # Format results with indentation and line information
            source_lines = source_code.split('\n')
            formatted_results = {}
            
            for instr_type, items in results.items():
                formatted_items = []
                
                for item_info in items:
                    line_number = item_info['line_number']
                    
                    # Determine indentation
                    if instr_type == InstrumentationType.FUNCTION_ENTRIES:
                        indentation = "    "  # Standard function body indentation
                    elif line_number < len(source_lines):
                        line = source_lines[line_number]
                        indentation = line[:len(line) - len(line.lstrip())]
                    else:
                        indentation = ""
                    
                    formatted_item = {
                        'function_name': item_info['function_name'],
                        'line_number': line_number,
                        'column': item_info['column'],
                        'indentation': indentation,
                        'instrumentation_strategy': item_info.get('instrumentation_strategy', 'before_call'),
                        'instrumentation_type': instr_type
                    }
                    
                    # Add call-specific fields if present
                    if 'call_line_number' in item_info:
                        formatted_item['call_line_number'] = item_info['call_line_number']
                    if 'call_end_line' in item_info:
                        formatted_item['call_end_line'] = item_info['call_end_line']
                    if 'def_line_number' in item_info:
                        formatted_item['def_line_number'] = item_info['def_line_number']
                    if 'in_condition' in item_info:
                        formatted_item['in_condition'] = item_info['in_condition']
                    if 'in_preprocessor' in item_info:
                        formatted_item['in_preprocessor'] = item_info['in_preprocessor']
                    if 'in_assignment' in item_info:
                        formatted_item['in_assignment'] = item_info['in_assignment']
                    if 'is_multiline' in item_info:
                        formatted_item['is_multiline'] = item_info['is_multiline']
                    
                    formatted_items.append(formatted_item)
                
                # Use string representation of enum for JSON serialization
                formatted_results[instr_type.value] = formatted_items
            
            return formatted_results
            
        except Exception as e:
            print(f"Error parsing source code: {e}")
            return {}

    # ============================================================================
    # LEGACY COMPATIBILITY METHODS
    # ============================================================================

    def find_dma_calls_in_file(self, source_code: str) -> List[Dict[str, Any]]:
        """Legacy method for backward compatibility with DMA-only instrumentation"""
        all_results = self.find_all_instrumentable_items(source_code)
        return all_results.get('dma_calls', [])
