#!/usr/bin/env python3
"""
Command-line interface module for DMA instrumentation tool

This module provides the command-line interface and main entry point for the
DMA instrumentation system.
"""

import sys
import argparse

from core import DMAInstrumenter


def main():
    """
    Main entry point for the DMA instrumentation command-line tool
    
    Provides a command-line interface for the DMA instrumentation system with
    comprehensive argument parsing, error handling, and user feedback. This
    function serves as the primary interface for users wanting to instrument
    kernel module source code.
    
    Command Line Features:
    - Directory specification for source code location
    - Dry-run mode for previewing changes without modification
    - Test limit option for processing subset of files
    - Comprehensive help and usage documentation
    
    Error Handling:
    - Graceful handling of user interruption (Ctrl+C)
    - Comprehensive error reporting with appropriate exit codes
    - Informative error messages for troubleshooting
    
    Usage Examples:
        # Instrument all files in a directory
        python -m dma_instrumentation /path/to/kernel/module
        
        # Preview changes without modifying files
        python -m dma_instrumentation --dry-run /path/to/kernel/module
        
        # Process only first 5 files for testing
        python -m dma_instrumentation --test-limit 5 /path/to/kernel/module
    """
    # Set up argument parser with comprehensive help
    parser = argparse.ArgumentParser(
        description="""Instrument Linux kernel module C files with DMA allocation logging.
        
        This tool adds instrumentation code before DMA API calls to track memory allocations.
        It uses tree-sitter to parse C files and identify DMA function calls, then inserts
        printk statements before each call to log when DMA operations occur.
        
        The tool processes all .c files in the specified directory recursively and creates
        backup files (.backup) before making any modifications.""",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    
    # Required positional argument for source directory
    parser.add_argument(
        'directory',
        help='Directory containing kernel module source code to instrument'
    )
    
    # Optional dry-run mode for previewing changes
    parser.add_argument(
        '--dry-run', '-n',
        action='store_true',
        help='Preview changes without modifying files'
    )
    
    # Optional test limit for processing subset of files
    parser.add_argument(
        '--test-limit',
        type=int,
        metavar='N',
        help='Limit processing to first N files (for testing)'
    )
    
    # Parse command line arguments
    args = parser.parse_args()
    
    try:
        # Initialize the DMA instrumenter with all components
        instrumenter = DMAInstrumenter()
        
        # Process the specified directory with user options
        instrumenter.process_directory(
            args.directory,
            dry_run=args.dry_run,
            max_files=args.test_limit
        )
        
    except KeyboardInterrupt:
        # Handle user interruption gracefully
        print("\nOperation cancelled by user.")
        sys.exit(1)
    except Exception as e:
        # Handle any other errors with informative messaging
        print(f"\nError: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    """
    Script entry point - runs main() when executed directly
    
    This allows the script to be used both as a standalone command-line tool
    and as an importable module for other Python programs.
    """
    main()
