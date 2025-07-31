#!/usr/bin/env python3
"""
Command-line interface module for DMA instrumentation tool

This module provides the command-line interface and main entry point for the
DMA instrumentation system.
"""

import sys
import argparse
import logging
from typing import List, Optional
from pathlib import Path

from ..core import DMAInstrumenter


class CLIHandler:
    """
    Production-ready CLI handler for the kernel instrumentation tool.
    
    This class provides a programmatic interface to the CLI functionality,
    allowing other tools to integrate with the instrumentation system.
    """
    
    def __init__(self):
        """Initialize the CLI handler"""
        self.instrumenter = None
    
    def run(self, args: List[str]) -> int:
        """
        Run the CLI with the given arguments
        
        Args:
            args: Command line arguments list
            
        Returns:
            Exit code (0 for success, non-zero for error)
        """
        try:
            parser = self._create_parser()
            parsed_args = parser.parse_args(args)
            
            # Initialize instrumenter
            self.instrumenter = DMAInstrumenter()
            
            # Process directory
            self.instrumenter.process_directory(
                parsed_args.directory,
                dry_run=parsed_args.dry_run,
                max_files=getattr(parsed_args, 'test_limit', None)
            )
            
            return 0
            
        except KeyboardInterrupt:
            print("\nOperation cancelled by user.")
            return 130
        except Exception as e:
            print(f"\nError: {e}", file=sys.stderr)
            return 1
    
    def _create_parser(self) -> argparse.ArgumentParser:
        """Create the argument parser"""
        parser = argparse.ArgumentParser(
            description="Instrument Linux kernel module C files with DMA allocation logging"
        )
        
        parser.add_argument(
            'directory',
            help='Directory containing kernel module source code'
        )
        
        parser.add_argument(
            '--dry-run', '-n',
            action='store_true',
            help='Preview changes without modifying files'
        )
        
        parser.add_argument(
            '--test-limit',
            type=int,
            metavar='N',
            help='Limit processing to first N files (for testing)'
        )
        
        return parser


def parse_args():
    """Parse command line arguments"""
    parser = argparse.ArgumentParser(
        description="""Instrument Linux kernel module C files with DMA allocation and function entry logging.
        
        This tool adds instrumentation code before DMA API calls and function entries to track 
        memory allocations and function execution flow. It uses tree-sitter to parse C files 
        and identify DMA function calls and function definitions, then inserts printk statements 
        before each call/entry to log when DMA operations and function calls occur.
        
        The tool processes all .c files in the specified directory recursively and creates
        backup files (.backup) before making any modifications.""",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    
    return parser.parse_args()


def setup_logging(verbose: bool = False):
    """Setup logging configuration"""
    level = logging.DEBUG if verbose else logging.INFO
    logging.basicConfig(
        level=level,
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    )


def handle_signals():
    """Setup signal handlers for clean shutdown"""
    import signal
    
    def signal_handler(signum, frame):
        print("\nOperation cancelled by user.")
        sys.exit(130)
    
    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)


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
        description="""Instrument Linux kernel module C files with DMA allocation and function entry logging.
        
        This tool adds instrumentation code before DMA API calls and function entries to track 
        memory allocations and function execution flow. It uses tree-sitter to parse C files 
        and identify DMA function calls and function definitions, then inserts printk statements 
        before each call/entry to log when DMA operations and function calls occur.
        
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
    
    # Optional flag to disable function instrumentation
    parser.add_argument(
        '--dma-only', 
        action='store_true',
        help='Only instrument DMA calls, skip function entry instrumentation'
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
            max_files=args.test_limit,
            instrument_functions=not args.dma_only
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
