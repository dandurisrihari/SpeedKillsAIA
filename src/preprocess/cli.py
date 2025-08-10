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
from .core.engine import KernelLogParserEngine
from .struct_tool import generate_struct_json, find_i_files


def create_parser():
    """Create and return the argument parser"""
    parser = argparse.ArgumentParser(
        description="Kernel Log Parser - Parse AI accelerator instrumentation logs and extract struct definitions"
    )
    
    # Add subcommands
    subparsers = parser.add_subparsers(dest='command', help='Available commands')
    
    # Parse command (default behavior)
    parse_parser = subparsers.add_parser('parse', help='Parse kernel log files')
    
    # Use a mutually exclusive group for input methods
    input_group = parse_parser.add_mutually_exclusive_group(required=True)
    input_group.add_argument(
        "log_file", 
        nargs='?',
        help="Path to the kernel log file to parse"
    )
    input_group.add_argument(
        "--input",
        help="Path to the kernel log file to parse (alternative to positional argument)"
    )
    
    parse_parser.add_argument(
        "-o", "--output", 
        help="Output JSON file path (optional)"
    )
    parse_parser.add_argument(
        "--no-ui", 
        action="store_true",
        help="Disable progress UI"
    )
    parse_parser.add_argument(
        "--web-ui", 
        action="store_true",
        help="Start web UI after processing"
    )
    parse_parser.add_argument(
        "--source-root",
        help="Root path to prepend to relative file paths in logs (for function code extraction)"
    )
    parse_parser.add_argument(
        "--strace-log",
        help="Path to strace log file for device access analysis (processed after dmesg log)"
    )
    parse_parser.add_argument(
        "--quiet", 
        action="store_true",
        help="Suppress output and run quietly"
    )
    parse_parser.add_argument(
        "--verbose", 
        action="store_true",
        help="Enable verbose output"
    )
    
    # Struct extraction command
    struct_parser = subparsers.add_parser('extract-structs', help='Extract struct definitions from .i files')
    struct_parser.add_argument(
        '--source-dir',
        action='append',
        help="Source directory to scan for .i files (can be used multiple times)"
    )
    struct_parser.add_argument(
        '--files',
        nargs='*',
        help="Specific .i files to process"
    )
    struct_parser.add_argument(
        '-o', '--output',
        required=True,
        help="Output JSON file path"
    )
    
    parser.add_argument(
        "--version", 
        action="version", 
        version="Kernel Log Parser 2.0.0"
    )
    
    # If no subcommand is provided, default to parse
    if len(sys.argv) == 1 or (len(sys.argv) > 1 and not sys.argv[1].startswith('-') and sys.argv[1] not in ['parse', 'extract-structs']):
        # Default to parse command for backward compatibility
        if len(sys.argv) > 1 and not sys.argv[1] in ['parse', 'extract-structs']:
            sys.argv.insert(1, 'parse')
    
    return parser


def validate_arguments(args):
    """Validate command line arguments"""
    # Determine which log file to use
    log_file_path = args.input or args.log_file
    if not log_file_path:
        print("Error: Log file is required (use positional argument or --input)", file=sys.stderr)
        sys.exit(1)
    
    # Validate input file
    log_file = Path(log_file_path)
    if not log_file.exists():
        print(f"Error: Log file not found: {log_file}", file=sys.stderr)
        sys.exit(1)
    
    # Update args to use the determined log file
    if not args.log_file:
        args.log_file = log_file_path
    
    # Validate strace log if provided
    if args.strace_log:
        strace_file = Path(args.strace_log)
        if not strace_file.exists():
            print(f"Error: Strace log file not found: {strace_file}", file=sys.stderr)
            sys.exit(1)
    
    # Validate output directory if specified
    if args.output:
        output_path = Path(args.output)
        output_dir = output_path.parent
        if not output_dir.exists():
            print(f"Error: Output directory does not exist: {output_dir}", file=sys.stderr)
            sys.exit(1)


def main():
    """Main CLI entry point with subcommands"""
    parser = create_parser()
    args = parser.parse_args()
    
    # Handle different commands
    command = getattr(args, 'command', 'parse')
    
    if command == 'extract-structs':
        handle_struct_command(args)
    else:  # default to parse
        handle_parse_command(args)


def handle_parse_command(args):
    """Handle the parse command"""
    validate_arguments(args)
    
    # Get the validated log file path
    log_file = Path(args.log_file)
    
    # Create engine and process file
    engine = KernelLogParserEngine(source_root_path=args.source_root)
    
    try:
        # Process the main log file
        results = engine.parse_log_file(str(log_file), args.output)
        
        # Process strace log if provided
        if args.strace_log and results:
            print(f"Processing strace log: {args.strace_log}")
            strace_results = engine.parse_strace_log(args.strace_log)
            if strace_results:
                # Merge strace results into main results
                results['device_info'] = strace_results
                # Re-save the combined results if output file was specified
                if args.output:
                    import json
                    output_path = Path(args.output)
                    with open(output_path, 'w') as f:
                        json.dump(results, f, indent=2)
        
        if results:
            # Print summary
            print("\n" + "="*60)
            print("PARSING SUMMARY")
            print("="*60)
            print(f"Function Entries: {len(results.get('function_entries', []))}")
            print(f"DMA Operations: {len(results.get('dma_operations', []))}")
            print(f"User Copy Operations: {len(results.get('user_copy_operations', []))}")
            print(f"IOCTL Operations: {len(results.get('ioctl_operations', []))}")
            
            # Device access summary if available
            device_info = results.get('device_info')
            if device_info:
                print(f"Device Accesses: {device_info.get('total_accesses', 0)}")
                print(f"Unique Devices: {device_info.get('unique_device_count', 0)}")
                unique_devices = device_info.get('unique_devices', [])
                if unique_devices:
                    print(f"Devices: {', '.join(unique_devices)}")
            
            stats = results.get('statistics', {})
            print(f"Total Files: {stats.get('total_files', 0)}")
            print(f"Files need analysis: {stats.get('files_need_analysis', 0)}")
            print(f"Files with Function Entries: {stats.get('files_instrumented_with_function_entries', 0)}")
            
            if args.output:
                print(f"Results saved to: {args.output}")
            
            # Start web UI if requested
            if args.web_ui:
                print("\nStarting web UI...")
                # Create tool for web UI functionality
                tool = KernelLogParserTool()
                tool.start_web_ui(args.output)
        else:
            print("Failed to process log file", file=sys.stderr)
            sys.exit(1)
            
    except PermissionError as e:
        print(f"Permission error: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error parsing log file: {e}", file=sys.stderr)
        sys.exit(1)


def handle_struct_command(args):
    """Handle the extract-structs command"""
    # Collect all files to process
    files_to_process = []
    
    # Add files from source directories
    if args.source_dir:
        for source_dir_str in args.source_dir:
            source_dir = Path(source_dir_str)
            if not source_dir.exists():
                print(f"❌ Source directory does not exist: {source_dir}")
                sys.exit(1)
            
            i_files = find_i_files(source_dir)
            files_to_process.extend(i_files)
            print(f"🔍 Found {len(i_files)} .i files in {source_dir}")
    
    # Add specific files
    if args.files:
        for file_str in args.files:
            file_path = Path(file_str)
            if not file_path.exists():
                print(f"❌ File does not exist: {file_path}")
                sys.exit(1)
            files_to_process.append(file_path)
    
    if not files_to_process:
        print("❌ No .i files found to process")
        print("Use --source-dir to scan directories or --files to specify individual files")
        sys.exit(1)
    
    # Remove duplicates while preserving order
    files_to_process = list(dict.fromkeys(files_to_process))
    
    # Generate the struct JSON
    output_path = Path(args.output)
    try:
        generate_struct_json(files_to_process, output_path)
        print(f"🎉 Struct extraction completed successfully!")
    except Exception as e:
        print(f"❌ Error generating struct JSON: {e}")
        sys.exit(1)


def validate_arguments(args):
    """Validate command line arguments for parse command"""
    # Determine which log file to use
    log_file_path = args.input or args.log_file
    if not log_file_path:
        print("Error: Log file is required (use positional argument or --input)", file=sys.stderr)
        sys.exit(1)
    
    # Validate input file
    log_file = Path(log_file_path)
    if not log_file.exists():
        print(f"Error: Log file not found: {log_file}", file=sys.stderr)
        sys.exit(1)
    
    # Update args to use the determined log file
    if not args.log_file:
        args.log_file = log_file_path
    
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


if __name__ == "__main__":
    main()