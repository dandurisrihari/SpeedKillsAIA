#!/usr/bin/env python3

import sys
import os
sys.path.insert(0, '/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA')

from src.kernel_instrumenter.parsing.parser import TreeSitterParser

def debug_ast(source_code: str):
    parser = TreeSitterParser()
    tree = parser.parse(source_code)
    
    def print_node(node, depth=0):
        indent = "  " * depth
        print(f"{indent}{node.type}: {node.start_point} - {node.end_point}")
        if node.type == 'call_expression':
            call_text = source_code[node.start_byte:node.end_byte]
            print(f"{indent}  CALL TEXT: {call_text}")
            # Check if inside function
            current = node
            while current and current.parent:
                parent = current.parent
                if parent.type == 'function_definition':
                    print(f"{indent}  INSIDE FUNCTION: YES")
                    break
                current = parent
            else:
                print(f"{indent}  INSIDE FUNCTION: NO")
        elif node.type == 'function_definition':
            print(f"{indent}  FUNCTION DETECTED")
        for child in node.children:
            print_node(child, depth + 1)
    
    print_node(tree.root_node)

if __name__ == "__main__":
    with open('/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/test_assignment_preprocessor.c', 'r') as f:
        source_code = f.read()
    
    debug_ast(source_code)
