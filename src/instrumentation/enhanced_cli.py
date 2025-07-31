#!/usr/bin/env python3
"""
Enhanced CLI for Multi-Type Kernel Instrumentation Tool

Provides comprehensive command-line interface with granular control over
instrumentation types: DMA APIs, user copy operations, and function entries.
"""

import argparse
import sys
import os
from typing import Set

try:
    from .enhanced_core import MultiInstrumenter
except ImportError:
    from enhanced_core import MultiInstrumenter


def determine_enabled_types(args) -> Set[str]:
    """
    Determine which instrumentation types should be enabled based on CLI arguments.
    
    Returns:
        Set of enabled type names: {'dma', 'user_copy', 'functions'}
    """
    all_types = {'dma', 'user_copy', 'functions'}
    
    # Check if any --only-* flags are used
    only_flags = []
    if getattr(args, 'only_dma', False):
        only_flags.append('dma')
    if getattr(args, 'only_user_copy', False):
        only_flags.append('user_copy')
    if getattr(args, 'only_functions', False):
        only_flags.append('functions')
    
    if only_flags:
        # If any --only-* flags are used, enable only those types
        enabled_types = set(only_flags)
    else:
        # Start with all types enabled
        enabled_types = all_types.copy()
        
        # Remove types disabled by --no-* flags
        if getattr(args, 'no_dma', False):
            enabled_types.discard('dma')
        if getattr(args, 'no_user_copy', False):
            enabled_types.discard('user_copy')
        if getattr(args, 'no_functions', False):
            enabled_types.discard('functions')
    
    return enabled_types


def create_argument_parser():
    """Create and configure the argument parser."""
    parser = argparse.ArgumentParser(
        description='Enhanced Multi-Type Kernel Instrumentation Tool',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Instrument all types (default)
  %(prog)s /path/to/kernel/source
  
  # Only DMA APIs
  %(prog)s --only-dma /path/to/kernel/source
  
  # Only user copy operations
  %(prog)s --only-user-copy /path/to/kernel/source
  
  # Only function entries
  %(prog)s --only-functions /path/to/kernel/source
  
  # DMA and user copy (no functions)
  %(prog)s --no-functions /path/to/kernel/source
  
  # Preview changes without modifying files
  %(prog)s --dry-run /path/to/kernel/source
  
  # Multiple only flags (DMA and user copy only)
  %(prog)s --only-dma --only-user-copy /path/to/kernel/source
        """
    )
    
    # Positional argument
    parser.add_argument(
        'source_path',
        help='Path to the source directory or file to instrument'
    )
    
    # Type selection - exclusive (only specified types)
    only_group = parser.add_argument_group('Type Selection (Exclusive)', 
                                          'Enable only specified types')
    only_group.add_argument(
        '--only-dma',
        action='store_true',
        help='Enable only DMA API instrumentation'
    )
    only_group.add_argument(
        '--only-user-copy',
        action='store_true',
        help='Enable only user copy operation instrumentation'
    )
    only_group.add_argument(
        '--only-functions',
        action='store_true',
        help='Enable only function entry instrumentation'
    )
    
    # Type exclusion - inclusive (all except specified)
    exclude_group = parser.add_argument_group('Type Exclusion (Inclusive)',
                                            'Disable specified types (others remain enabled)')
    exclude_group.add_argument(
        '--no-dma',
        action='store_true',
        help='Disable DMA API instrumentation'
    )
    exclude_group.add_argument(
        '--no-user-copy',
        action='store_true',
        help='Disable user copy operation instrumentation'
    )
    exclude_group.add_argument(
        '--no-functions',
        action='store_true',
        help='Disable function entry instrumentation'
    )
    
    # Processing options
    processing_group = parser.add_argument_group('Processing Options')
    processing_group.add_argument(
        '--dry-run',
        action='store_true',
        help='Preview changes without modifying files'
    )
    processing_group.add_argument(
        '--backup-dir',
        type=str,
        help='Custom directory for backup files (default: creates backup/ in target directory)'
    )
    processing_group.add_argument(
        '--verbose',
        action='store_true',
        help='Enable verbose output'
    )
    
    return parser


def validate_arguments(args):
    """Validate command-line arguments."""
    # Check if source path exists
    if not os.path.exists(args.source_path):
        print(f"Error: Source path '{args.source_path}' does not exist.", file=sys.stderr)
        sys.exit(1)
    
    # Check for conflicting flags
    only_flags = [args.only_dma, args.only_user_copy, args.only_functions]
    no_flags = [args.no_dma, args.no_user_copy, args.no_functions]
    
    if any(only_flags) and any(no_flags):
        print("Error: Cannot use --only-* and --no-* flags together.", file=sys.stderr)
        print("Use either --only-* flags to enable specific types, or --no-* flags to disable specific types.", file=sys.stderr)
        sys.exit(1)
    
    # Ensure at least one type is enabled
    enabled_types = determine_enabled_types(args)
    if not enabled_types:
        print("Error: No instrumentation types enabled. At least one type must be enabled.", file=sys.stderr)
        sys.exit(1)


def main():
    """Main entry point for the enhanced CLI."""
    parser = create_argument_parser()
    args = parser.parse_args()
    
    # Validate arguments
    validate_arguments(args)
    
    # Determine enabled types
    enabled_types = determine_enabled_types(args)
    
    if args.verbose:
        print(f"Enabled instrumentation types: {', '.join(sorted(enabled_types))}")
        print(f"Source path: {args.source_path}")
        print(f"Dry run: {args.dry_run}")
        if args.backup_dir:
            print(f"Backup directory: {args.backup_dir}")
    
    try:
        # Create and configure the multi-instrumenter
        instrumenter = MultiInstrumenter(
            enabled_types=enabled_types,
            backup_dir=args.backup_dir,
            dry_run=args.dry_run,
            verbose=args.verbose
        )
        
        # Process the source
        if os.path.isfile(args.source_path):
            # Single file
            result = instrumenter.instrument_file(args.source_path)
            if args.verbose:
                print(f"Processed file: {args.source_path}")
                if result and hasattr(result, 'modifications'):
                    print(f"Modifications made: {len(result.modifications)}")
        else:
            # Directory
            result = instrumenter.process_directory(args.source_path)
            if args.verbose and result:
                print(f"Processed {len(result)} files")
        
        if args.dry_run:
            print("\nDry run completed. No files were modified.")
        else:
            print("\nInstrumentation completed successfully.")
            
    except Exception as e:
        print(f"Error during instrumentation: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        sys.exit(1)


if __name__ == "__main__":
    main()
