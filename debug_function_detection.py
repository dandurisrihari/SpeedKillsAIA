#!/usr/bin/env python3

import sys
import os
sys.path.insert(0, '/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA')

from src.kernel_instrumenter.parsing.parser import TreeSitterParser
from src.kernel_instrumenter.analyzers.dma_analyzer import DMAAnalyzer
from src.kernel_instrumenter.instrumentation_types.dma_config import DMAInstrumentationType

def debug_function_detection(source_code: str):
    parser = TreeSitterParser()
    analyzer = DMAAnalyzer(parser, DMAInstrumentationType())
    
    # Parse and get AST
    tree = parser.parse(source_code)
    source_bytes = bytes(source_code, 'utf8')
    
    print("=== Checking every node for target calls ===")
    
    def check_node_recursive(node, depth=0):
        indent = "  " * depth
        is_target = analyzer.is_target_call(node, source_bytes)
        
        if is_target:
            func_name = analyzer.get_function_name_from_call(node, source_bytes)
            is_in_func = analyzer._is_inside_function(node)
            call_text = source_bytes[node.start_byte:node.end_byte].decode('utf-8')
            print(f"{indent}*** TARGET CALL FOUND ***")
            print(f"{indent}  Node type: {node.type}")
            print(f"{indent}  Function: {func_name}")
            print(f"{indent}  Line: {node.start_point[0]}")
            print(f"{indent}  Inside function: {is_in_func}")
            print(f"{indent}  Text: {call_text}")
            print()
            
        for child in node.children:
            check_node_recursive(child, depth + 1)
    
    check_node_recursive(tree.root_node)
    
    print("\n=== Using analyzer.find_calls_in_file ===")
    calls = analyzer.find_calls_in_file(source_code)
    
    print(f"Found {len(calls)} DMA calls:")
    for i, call in enumerate(calls):
        print(f"\nCall {i+1}:")
        print(f"  Function: {call['function_name']}")
        print(f"  Line: {call['line_number']}")
        print(f"  Strategy: {call['instrumentation_strategy']}")

if __name__ == "__main__":
    # Test the exact problematic case
    with open('/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/test_assignment_preprocessor.c', 'r') as f:
        source_code = f.read()
    
    debug_function_detection(source_code)
