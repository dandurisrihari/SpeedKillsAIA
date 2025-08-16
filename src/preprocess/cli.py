#!/usr/bin/env python3
"""
Simple command-line interface for the kernel log parser

This is a simplified CLI that wraps the comprehensive tool for basic usage.
For advanced features, use the main tool: python -m src.preprocess.tool
"""

import sys
import argparse
import json
from pathlib import Path
from .core.engine import KernelLogParserEngine


def create_parser():
    """Create and return the argument parser"""
    parser = argparse.ArgumentParser(
        description="Kernel Log Parser Tool - Simple JSON output"
    )
    
    parser.add_argument(
        "--log", 
        required=True,
        help="Path to kernel log file"
    )
    parser.add_argument(
        "-o", "--output", 
        help="Output JSON file path (optional)"
    )
    parser.add_argument(
        "--source-root", 
        help="Root directory path for resolving relative file paths"
    )
    parser.add_argument(
        "--strace-log", 
        help="Path to strace log file for device access analysis"
    )
    parser.add_argument(
        "--version", 
        action="version", 
        version="Kernel Log Parser 2.0.0"
    )
    
    return parser


def validate_arguments(args):
    """Validate command line arguments"""
    # Validate input file
    log_file = Path(args.log)
    if not log_file.exists():
        print(f"Error: Log file not found: {log_file}", file=sys.stderr)
        sys.exit(1)
    
    # Validate strace log if provided
    if args.strace_log:
        strace_file = Path(args.strace_log)
        if not strace_file.exists():
            print(f"Error: Strace log file not found: {strace_file}", file=sys.stderr)
            sys.exit(1)
    
    # Validate output directory if specified
    if args.output:
        output_path = Path(args.output)
        if not output_path.parent.exists():
            print(f"Error: Output directory does not exist: {output_path.parent}", file=sys.stderr)
            sys.exit(1)


def main():
    """Main entry point for CLI"""
    parser = create_parser()
    args = parser.parse_args()
    
    validate_arguments(args)
    
    # Create engine and process file
    engine = KernelLogParserEngine(source_root_path=args.source_root)
    
    try:
        # Process the main log file
        results = engine.parse_log_file(args.log, args.output)
        
        # Process strace log if provided
        if args.strace_log and results:
            print(f"Processing strace log: {args.strace_log}")
            strace_results = engine.parse_strace_log(args.strace_log)
            if strace_results:
                # Merge strace results into main results
                if hasattr(results, 'to_dict'):
                    results_dict = results.to_dict()
                else:
                    results_dict = results
                results_dict['device_info'] = strace_results
                
                # If output file was specified, save the updated results
                if args.output:
                    with open(args.output, 'w') as f:
                        json.dump(results_dict, f, indent=2)
        
        if results:
            # Print summary
            if hasattr(results, 'to_dict'):
                results_dict = results.to_dict()
            else:
                results_dict = results
                
            stats = results_dict.get('statistics', {})
            print(f"\n✅ Successfully processed {args.log}")
            print(f"Function Entries: {stats.get('unique_function_entries', 0)}")
            print(f"DMA Operations: {stats.get('unique_dma_operations', 0)}")
            print(f"User Copy Operations: {stats.get('unique_user_copy_operations', 0)}")
            print(f"Total Files: {stats.get('total_files', 0)}")
            print(f"Files Need Analysis: {stats.get('files_need_analysis', 0)}")
            
            if args.output:
                print(f"Results saved to: {args.output}")
        else:
            print("Failed to process log file", file=sys.stderr)
            sys.exit(1)
            
    except PermissionError as e:
        print(f"Permission error: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error parsing log file: {e}", file=sys.stderr)
        sys.exit(1)


# CLI entry point alias for external import
def cli_main():
    main()


if __name__ == "__main__":
    main()
