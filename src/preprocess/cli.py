#!/usr/bin/env python3
"""
Simple command-line interface for the kernel log parser

This is a simplified CLI that wraps the comprehensive tool for basic usage.
For advanced features, use the main tool: python -m src.preprocess.tool
"""

import sys
import argparse
from pathlib import Path
from .tool import KernelLogParserTool


def main():
    """Simple CLI entry point"""
    parser = argparse.ArgumentParser(
        description="Kernel Log Parser - Parse AI accelerator instrumentation logs"
    )
    parser.add_argument(
        "log_file", 
        help="Path to the kernel log file to parse"
    )
    parser.add_argument(
        "-o", "--output", 
        help="Output JSON file path (optional)"
    )
    parser.add_argument(
        "--no-ui", 
        action="store_true",
        help="Disable progress UI"
    )
    parser.add_argument(
        "--web-ui", 
        action="store_true",
        help="Start web UI after processing"
    )
    parser.add_argument(
        "--version", 
        action="version", 
        version="Kernel Log Parser 2.0.0"
    )
    
    args = parser.parse_args()
    
    # Validate input file
    log_file = Path(args.log_file)
    if not log_file.exists():
        print(f"Error: Log file not found: {log_file}", file=sys.stderr)
        sys.exit(1)
    
    # Create tool and process file
    tool = KernelLogParserTool()
    
    try:
        # Process the log file
        results = tool.process_log(str(log_file), args.output, show_ui=not args.no_ui)
        
        if results:
            # Print summary
            print("\n" + "="*60)
            print("PARSING SUMMARY")
            print("="*60)
            print(f"Function Entries: {len(results.get('function_entries', []))}")
            print(f"DMA Operations: {len(results.get('dma_operations', []))}")
            print(f"User Copy Operations: {len(results.get('user_copy_operations', []))}")
            
            stats = results.get('statistics', {})
            print(f"Total Files Analyzed: {stats.get('total_files_analyzed', 0)}")
            print(f"Files with Function Entries: {stats.get('files_instrumented_with_function_entries', 0)}")
            
            if args.output:
                print(f"Results saved to: {args.output}")
            
            # Start web UI if requested
            if args.web_ui:
                print("\nStarting web UI...")
                tool.start_web_ui(args.output)
        else:
            print("Failed to process log file", file=sys.stderr)
            sys.exit(1)
        
    except Exception as e:
        print(f"Error parsing log file: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()