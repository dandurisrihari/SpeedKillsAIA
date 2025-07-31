#!/usr/bin/env python3
"""
Enhanced Multi-Type Kernel Instrumentation Tool

This tool extends the original DMA instrumentation to support multiple types:
- DMA APIs (original functionality)
- copy_from_user/copy_to_user operations  
- Function entry points

Provides comprehensive user choice options for individual or combined instrumentation.
"""

import argparse
import sys
import os
import subprocess
import re
from pathlib import Path


def run_original_tool(directory, dry_run=False, dma_only=False):
    """Run the original CLI tool with specified options."""
    cmd = ['python', 'cli.py']
    if dry_run:
        cmd.append('--dry-run')
    if dma_only:
        cmd.append('--dma-only')
    cmd.append(directory)
    
    result = subprocess.run(cmd, capture_output=True, text=True)
    print(result.stdout)
    if result.stderr:
        print(result.stderr, file=sys.stderr)
    return result.returncode == 0


def instrument_user_copy_operations(directory, dry_run=False):
    """Add instrumentation for copy_from_user/copy_to_user operations."""
    user_copy_functions = [
        'copy_from_user', 'copy_to_user', '__copy_from_user', '__copy_to_user',
        'get_user', 'put_user'
    ]
    
    print(f"[USER_COPY] Instrumenting user copy operations in {directory}")
    
    # Find all .c files
    c_files = list(Path(directory).rglob("*.c"))
    instrumented_count = 0
    
    for file_path in c_files:
        try:
            with open(file_path, 'r') as f:
                content = f.read()
            
            original_lines = content.split('\n')
            new_lines = []
            
            # First pass: check if file actually has user copy operations
            has_user_copy_operations = False
            for line in original_lines:
                for func in user_copy_functions:
                    pattern = rf'\b{re.escape(func)}\s*\('
                    if re.search(pattern, line) and not line.strip().startswith('//') and not line.strip().startswith('*') and not line.strip().startswith('#'):
                        # Check if this is not a function definition/declaration
                        is_function_definition = False
                        
                        # Function definition patterns
                        func_def_patterns = [
                            rf'^\s*extern\s+.*\b{re.escape(func)}\s*\(',
                            rf'^\s*(static\s+|inline\s+)+.*\b{re.escape(func)}\s*\(',
                            rf'^\s*(?!return\s|if\s|while\s|for\s|switch\s)\w+(\s+\w+)*\s+\**\s*{re.escape(func)}\s*\(',
                            rf'^\s*(static\s+|inline\s+|extern\s+)+\w+.*\b{re.escape(func)}\s*\('
                        ]
                        
                        for def_pattern in func_def_patterns:
                            if re.match(def_pattern, line):
                                is_function_definition = True
                                break
                        
                        # Additional checks for declarations
                        if 'extern' in line and re.search(rf'\b{re.escape(func)}\s*\(.*\)\s*;', line):
                            is_function_definition = True
                        if (line.strip().endswith(';') and not line.strip().startswith('//') and
                            (line.strip().startswith('extern ') or 
                             re.match(r'^\s*(static\s+|inline\s+)*\w+(\s+\w+)*\s+\**\s*\w+\s*\([^)]*\)\s*;', line.strip()))):
                            is_function_definition = True
                        
                        if not is_function_definition:
                            has_user_copy_operations = True
                            break
                            
                # Also check for macro calls that might contain user copy functions
                if not has_user_copy_operations:
                    # Look for patterns like MACRO_NAME(...) that might contain user copy calls
                    macro_matches = re.findall(r'\b([A-Z_][A-Z0-9_]*)\s*\(', line)
                    
                    for macro_name in macro_matches:
                        # Check if the macro name itself contains a user copy function name
                        for func in user_copy_functions:
                            func_upper = func.upper()
                            if func_upper in macro_name:
                                has_user_copy_operations = True
                                break
                        
                        # Also check if any user copy function names appear in this line
                        if not has_user_copy_operations:
                            for func in user_copy_functions:
                                if func in line and not line.strip().startswith('#define'):
                                    has_user_copy_operations = True
                                    break
                        
                        if has_user_copy_operations:
                            break
                
                if has_user_copy_operations:
                    break
            
            # Skip file if no user copy operations found
            if not has_user_copy_operations:
                continue
            
            # Second pass: perform instrumentation
            modified = False
            header_added = False
            needs_printk_header = 'linux/printk.h' not in content and '#include <linux/printk.h>' not in content
            
            for i, line in enumerate(original_lines):
                # Add headers after the first include statement if needed
                if needs_printk_header and line.strip().startswith('#include') and not header_added:
                    new_lines.append(line)
                    new_lines.append('#include <linux/printk.h>')
                    header_added = True
                    modified = True
                    continue
                
                # Check if this line contains a user copy function call
                instrumentation_added = False
                
                for func in user_copy_functions:
                    # Create a regex pattern to match the function call more precisely
                    # This will match: func(...) but not function definitions or comments
                    pattern = rf'\b{re.escape(func)}\s*\('
                    
                    if re.search(pattern, line) and not line.strip().startswith('//') and not line.strip().startswith('*') and not line.strip().startswith('#'):
                        # Improved function definition detection
                        # Function definitions have these patterns:
                        # 1. [modifiers] return_type [*] function_name(
                        # 2. [modifiers] function_name( (for functions like constructors)
                        # 3. extern declarations: extern type function_name(
                        
                        # More comprehensive function definition patterns
                        func_def_patterns = [
                            # extern declaration
                            rf'^\s*extern\s+.*\b{re.escape(func)}\s*\(',
                            # static/inline with return type on same line
                            rf'^\s*(static\s+|inline\s+)+.*\b{re.escape(func)}\s*\(',
                            # return type and function name on same line (but not control statements)
                            rf'^\s*(?!return\s|if\s|while\s|for\s|switch\s)\w+(\s+\w+)*\s+\**\s*{re.escape(func)}\s*\(',
                            # function definition starting with modifiers
                            rf'^\s*(static\s+|inline\s+|extern\s+)+\w+.*\b{re.escape(func)}\s*\('
                        ]
                        
                        is_function_definition = False
                        for def_pattern in func_def_patterns:
                            if re.match(def_pattern, line):
                                is_function_definition = True
                                break
                        
                        # Additional check: if line contains 'extern' it's likely a declaration
                        if 'extern' in line and re.search(rf'\b{re.escape(func)}\s*\(.*\)\s*;', line):
                            is_function_definition = True
                        
                        # Additional check: if line ends with semicolon AND looks like a declaration
                        # Only treat as declaration if it has declaration-like patterns
                        if (line.strip().endswith(';') and not line.strip().startswith('//') and
                            (line.strip().startswith('extern ') or 
                             re.match(r'^\s*(static\s+|inline\s+)*\w+(\s+\w+)*\s+\**\s*\w+\s*\([^)]*\)\s*;', line.strip()))):
                            is_function_definition = True
                        
                        # Skip if this looks like a function definition/declaration
                        if is_function_definition:
                            continue
                            
                        # This looks like a function call, add instrumentation
                        indent = len(line) - len(line.lstrip())
                        instrumentation = ' ' * indent + f'printk(KERN_INFO "[USER_COPY_TRACE] {func} called at {file_path.name}:%d\\n", __LINE__ + 1);'
                        new_lines.append(instrumentation)
                        modified = True
                        instrumentation_added = True
                        break
                
                # Also check for macro calls that might expand to user copy operations
                if not instrumentation_added:
                    # Look for patterns like MACRO_NAME(...) that might contain user copy calls
                    # This includes macros that might contain user copy function names in their names
                    macro_pattern = r'\b[A-Z_][A-Z0-9_]*\s*\('
                    macro_matches = re.findall(r'\b([A-Z_][A-Z0-9_]*)\s*\(', line)
                    
                    for macro_name in macro_matches:
                        should_instrument_macro = False
                        detected_func = None
                        
                        # Check if the macro name itself contains a user copy function name
                        for func in user_copy_functions:
                            func_upper = func.upper()
                            if func_upper in macro_name:
                                should_instrument_macro = True
                                detected_func = func
                                break
                        
                        # Also check if any user copy function names appear later in this line
                        # (this handles macros that expand to user copy calls)
                        if not should_instrument_macro:
                            for func in user_copy_functions:
                                if func in line and not line.strip().startswith('#define'):
                                    should_instrument_macro = True
                                    detected_func = func
                                    break
                        
                        if should_instrument_macro:
                            indent = len(line) - len(line.lstrip())
                            if detected_func:
                                instrumentation = ' ' * indent + f'printk(KERN_INFO "[USER_COPY_TRACE] {macro_name} (contains {detected_func}) called at {file_path.name}:%d\\n", __LINE__ + 1);'
                            else:
                                instrumentation = ' ' * indent + f'printk(KERN_INFO "[USER_COPY_TRACE] {macro_name} (user copy macro) called at {file_path.name}:%d\\n", __LINE__ + 1);'
                            new_lines.append(instrumentation)
                            modified = True
                            instrumentation_added = True
                            break
                
                # Add the original line
                new_lines.append(line)
            
            if modified:
                if not dry_run:
                    # Create backup
                    backup_path = str(file_path) + '.backup'
                    if not os.path.exists(backup_path):
                        with open(backup_path, 'w') as f:
                            f.write(content)
                    
                    # Write modified content
                    with open(file_path, 'w') as f:
                        f.write('\n'.join(new_lines))
                    
                    print(f"  ✓ Instrumented: {file_path}")
                else:
                    print(f"  ✓ Would instrument: {file_path}")
                
                instrumented_count += 1
                    
        except Exception as e:
            print(f"Error processing {file_path}: {e}", file=sys.stderr)
    
    if instrumented_count > 0:
        print(f"[USER_COPY] Processed {instrumented_count} files")
    else:
        print(f"[USER_COPY] No user copy operations found")
    
    return True


def instrument_function_entries_only(directory, dry_run=False):
    """Add instrumentation for function entries only (no DMA)."""
    print(f"[FUNCTIONS] Instrumenting function entries in {directory}")
    
    # Use the original tool which includes function instrumentation by default
    cmd = ['python', 'cli.py']
    if dry_run:
        cmd.append('--dry-run')
    # Note: The original tool does function instrumentation by default
    cmd.append(directory)
    
    result = subprocess.run(cmd, capture_output=True, text=True)
    print(result.stdout)
    if result.stderr:
        print(result.stderr, file=sys.stderr)
    return result.returncode == 0


def determine_enabled_types_enhanced(args):
    """
    Enhanced type determination with multiple selection methods.
    
    Priority order:
    1. --only-* flags (exclusive)
    2. Individual --dma, --user-copy, --functions flags (combinable)
    3. --no-* flags (exclusion from default all)
    4. Default: DMA + functions (user copy requires explicit selection)
    """
    # Check exclusive --only-* flags first
    only_flags = []
    if getattr(args, 'only_dma', False):
        only_flags.append('dma')
    if getattr(args, 'only_user_copy', False):
        only_flags.append('user_copy')
    if getattr(args, 'only_functions', False):
        only_flags.append('functions')
    
    if only_flags:
        return set(only_flags)
    
    # Check individual selection flags
    individual_flags = []
    if getattr(args, 'dma', False):
        individual_flags.append('dma')
    if getattr(args, 'user_copy', False):
        individual_flags.append('user_copy')
    if getattr(args, 'functions', False):
        individual_flags.append('functions')
    
    if individual_flags:
        return set(individual_flags)
    
    # Default behavior with exclusions
    enabled_types = {'dma', 'functions'}  # Default: DMA + functions (user copy explicit)
    
    # Apply --no-* exclusions
    if getattr(args, 'no_dma', False):
        enabled_types.discard('dma')
    if getattr(args, 'no_user_copy', False):
        enabled_types.discard('user_copy')
    if getattr(args, 'no_functions', False):
        enabled_types.discard('functions')
    
    return enabled_types


def interactive_mode(args):
    """Interactive mode to let user choose instrumentation types."""
    print("=" * 60)
    print("INTERACTIVE KERNEL INSTRUMENTATION SETUP")
    print("=" * 60)
    print(f"Source path: {args.directory}")
    print()
    
    print("Available instrumentation types:")
    print("1. DMA APIs           - dma_alloc_coherent, dma_free_coherent, etc.")
    print("2. User Copy          - copy_from_user, copy_to_user, get_user, put_user")
    print("3. Function Entries   - All function definitions")
    print()
    
    enabled_types = set()
    
    # Ask for each type
    response = input("Instrument DMA APIs? [y/N]: ").strip().lower()
    if response in ['y', 'yes']:
        enabled_types.add('dma')
    
    response = input("Instrument User Copy operations? [y/N]: ").strip().lower()
    if response in ['y', 'yes']:
        enabled_types.add('user_copy')
    
    response = input("Instrument Function entries? [y/N]: ").strip().lower()
    if response in ['y', 'yes']:
        enabled_types.add('functions')
    
    if not enabled_types:
        print("No instrumentation types selected. Exiting.")
        return 1
    
    print()
    print(f"Selected types: {', '.join(sorted(enabled_types))}")
    
    if not args.dry_run:
        response = input("Proceed with instrumentation? [y/N]: ").strip().lower()
        if response not in ['y', 'yes']:
            print("Instrumentation cancelled.")
            return 0
    
    print()
    return execute_instrumentation(args, enabled_types)


def validate_arguments_enhanced(args):
    """Enhanced argument validation."""
    # Check if source path exists
    if not os.path.exists(args.directory):
        print(f"Error: Source path '{args.directory}' does not exist.", file=sys.stderr)
        sys.exit(1)
    
    # Check for conflicting flag combinations
    only_flags = [getattr(args, 'only_dma', False), 
                  getattr(args, 'only_user_copy', False), 
                  getattr(args, 'only_functions', False)]
    
    individual_flags = [getattr(args, 'dma', False),
                       getattr(args, 'user_copy', False), 
                       getattr(args, 'functions', False)]
    
    no_flags = [getattr(args, 'no_dma', False), 
                getattr(args, 'no_user_copy', False), 
                getattr(args, 'no_functions', False)]
    
    # Check for conflicting combinations
    if any(only_flags) and any(individual_flags):
        print("Error: Cannot use --only-* flags with individual --dma/--user-copy/--functions flags.", file=sys.stderr)
        print("Use either --only-* for exclusive selection, or individual flags for combination.", file=sys.stderr)
        sys.exit(1)
    
    if any(only_flags) and any(no_flags):
        print("Error: Cannot use --only-* and --no-* flags together.", file=sys.stderr)
        print("Use --only-* for exclusive selection, or --no-* for exclusion from default.", file=sys.stderr)
        sys.exit(1)
    
    if any(individual_flags) and any(no_flags):
        print("Error: Cannot use individual flags (--dma, --user-copy, --functions) with --no-* flags.", file=sys.stderr)
        print("Use individual flags for explicit selection, or --no-* for exclusion from default.", file=sys.stderr)
        sys.exit(1)
    
    # Ensure at least one type is enabled
    enabled_types = determine_enabled_types_enhanced(args)
    if not enabled_types:
        print("Error: No instrumentation types enabled. At least one type must be enabled.", file=sys.stderr)
        sys.exit(1)


def execute_instrumentation(args, enabled_types):
    """Execute the instrumentation based on enabled types."""
    if args.verbose:
        print(f"Starting instrumentation with types: {', '.join(sorted(enabled_types))}")
        print()
    
    success = True
    
    try:
        # Execute based on enabled types
        if len(enabled_types) == 1:
            # Single type - use optimized path
            single_type = list(enabled_types)[0]
            if single_type == 'user_copy':
                success = instrument_user_copy_operations(args.directory, args.dry_run)
            elif single_type == 'functions':
                success = instrument_function_entries_only(args.directory, args.dry_run)
            elif single_type == 'dma':
                success = run_original_tool(args.directory, args.dry_run, dma_only=True)
        else:
            # Multiple types - execute in sequence
            if 'dma' in enabled_types or 'functions' in enabled_types:
                # Use original tool for DMA/functions
                dma_only = 'dma' in enabled_types and 'functions' not in enabled_types
                success = run_original_tool(args.directory, args.dry_run, dma_only)
            
            if success and 'user_copy' in enabled_types:
                # Add user copy instrumentation
                print()  # Add spacing between different types
                success = instrument_user_copy_operations(args.directory, args.dry_run)
        
        if success:
            if args.dry_run:
                print("\n✅ Dry run completed successfully.")
                print("   Use without --dry-run to apply changes.")
            else:
                print("\n✅ Instrumentation completed successfully!")
                print(f"   Instrumented types: {', '.join(sorted(enabled_types))}")
                print(f"   Backup files created with .backup extension")
        else:
            print("\n❌ Instrumentation failed.", file=sys.stderr)
            return 1
            
    except Exception as e:
        print(f"\n❌ Error during instrumentation: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1
    
    return 0


def main():
    parser = argparse.ArgumentParser(
        description='Enhanced Multi-Type Kernel Instrumentation Tool',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
INSTRUMENTATION TYPES:
  1. DMA APIs           - dma_alloc_coherent, dma_free_coherent, dma_map_single, etc.
  2. User Copy          - copy_from_user, copy_to_user, get_user, put_user, etc.
  3. Function Entries   - All function definitions

USAGE OPTIONS:

  A) Instrument ALL Types (Default):
     %(prog)s /path/to/source
     
  B) Instrument Individual Types:
     %(prog)s --only-dma /path/to/source          # Only DMA APIs
     %(prog)s --only-user-copy /path/to/source    # Only user copy operations  
     %(prog)s --only-functions /path/to/source    # Only function entries
     
  C) Instrument Multiple Specific Types:
     %(prog)s --dma --user-copy /path/to/source   # DMA + user copy (no functions)
     %(prog)s --dma --functions /path/to/source   # DMA + functions (no user copy)
     %(prog)s --user-copy --functions /path/to/source  # User copy + functions (no DMA)
     
  D) Exclude Specific Types:
     %(prog)s --no-dma /path/to/source            # Functions + user copy only
     %(prog)s --no-user-copy /path/to/source      # DMA + functions only
     %(prog)s --no-functions /path/to/source      # DMA + user copy only

  E) Interactive Mode:
     %(prog)s --interactive /path/to/source       # Ask user to choose each type

  F) Preview Changes (Dry Run):
     %(prog)s --dry-run --verbose /path/to/source
        """
    )
    
    parser.add_argument('directory', help='Source directory or file to instrument')
    
    # Individual type selection (new approach)
    select_group = parser.add_argument_group('Select Specific Types', 
                                           'Enable only the specified types (can combine multiple)')
    select_group.add_argument('--dma', action='store_true',
                            help='Enable DMA API instrumentation')
    select_group.add_argument('--user-copy', action='store_true',
                            help='Enable user copy operation instrumentation')
    select_group.add_argument('--functions', action='store_true',
                            help='Enable function entry instrumentation')
    
    # Exclusive type selection (only one type)
    only_group = parser.add_argument_group('Exclusive Type Selection', 
                                         'Enable ONLY the specified type (mutually exclusive)')
    only_group.add_argument('--only-dma', action='store_true', 
                          help='Enable ONLY DMA API instrumentation')
    only_group.add_argument('--only-user-copy', action='store_true',
                          help='Enable ONLY user copy operation instrumentation')
    only_group.add_argument('--only-functions', action='store_true',
                          help='Enable ONLY function entry instrumentation')
    
    # Type exclusion
    exclude_group = parser.add_argument_group('Exclude Types',
                                            'Disable specific types (others remain enabled)')
    exclude_group.add_argument('--no-dma', action='store_true',
                              help='Disable DMA API instrumentation')
    exclude_group.add_argument('--no-user-copy', action='store_true', 
                              help='Disable user copy instrumentation')
    exclude_group.add_argument('--no-functions', action='store_true',
                              help='Disable function entry instrumentation')
    
    # Processing options
    processing_group = parser.add_argument_group('Processing Options')
    processing_group.add_argument('--dry-run', action='store_true',
                                help='Preview changes without modifying files')
    processing_group.add_argument('--verbose', action='store_true',
                                help='Enable verbose output with detailed information')
    processing_group.add_argument('--interactive', action='store_true',
                                help='Interactive mode - ask user to confirm each type')
    
    args = parser.parse_args()
    
    # Interactive mode
    if args.interactive:
        return interactive_mode(args)
    
    # Validate arguments
    validate_arguments_enhanced(args)
    
    # Determine what to instrument
    enabled_types = determine_enabled_types_enhanced(args)
    
    if args.verbose:
        print("=" * 60)
        print("ENHANCED KERNEL INSTRUMENTATION TOOL")
        print("=" * 60)
        print(f"Source path: {args.directory}")
        print(f"Enabled types: {', '.join(sorted(enabled_types)) if enabled_types else 'None'}")
        print(f"Dry run mode: {args.dry_run}")
        print("=" * 60)
        print()
    
    # Execute instrumentation
    return execute_instrumentation(args, enabled_types)


if __name__ == "__main__":
    sys.exit(main())
