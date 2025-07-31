#!/usr/bin/env python3
"""
Comprehensive kernel instrumentation tool for DMA APIs, user copy APIs, and function entry points

This tool provides a unified interface for instrumenting Linux kernel modules with:
- DMA API call tracking and logging
- User space copy operation monitoring
- Function entry point instrumentation

Features:
- Tree-sitter based C code parsing for precise instrumentation
- Multiple instrumentation types with configurable options
- Dry-run mode for previewing changes
- Comprehensive error handling and logging
- Modular architecture for extensibility
"""

import sys
import argparse
import shutil
from pathlib import Path
from typing import Set, List, Dict, Any
import sys
import os

# Add parent directories to Python path for imports when running directly
current_dir = os.path.dirname(os.path.abspath(__file__))
parent_dir = os.path.dirname(current_dir)
grandparent_dir = os.path.dirname(parent_dir)

if grandparent_dir not in sys.path:
    sys.path.insert(0, grandparent_dir)

# Import our modular components
try:
    # Try relative imports first (when used as module)
    from .parsing.parser import TreeSitterParser
    from .analyzers.multi_analyzer import MultiAnalyzer
    from .instrumenters.multi_instrumenter import MultiInstrumenter
except ImportError:
    # Fallback for direct execution
    try:
        from src.kernel_instrumenter.parsing.parser import TreeSitterParser
        from src.kernel_instrumenter.analyzers.multi_analyzer import MultiAnalyzer
        from src.kernel_instrumenter.instrumenters.multi_instrumenter import MultiInstrumenter
    except ImportError:
        # Last resort - absolute imports from current location
        sys.path.insert(0, current_dir)
        from parsing.parser import TreeSitterParser
        from analyzers.multi_analyzer import MultiAnalyzer
        from instrumenters.multi_instrumenter import MultiInstrumenter


class KernelInstrumenter:
    """
    Main kernel instrumentation orchestrator
    
    This class coordinates all components to provide comprehensive kernel
    module instrumentation across multiple types of API calls and code patterns.
    """
    
    def __init__(self, enabled_types: Set[str], dry_run: bool = False, verbose: bool = False):
        """
        Initialize the kernel instrumenter
        
        Args:
            enabled_types: Set of instrumentation types to enable ('dma', 'user_copy', 'functions')
            dry_run: If True, preview changes without modifying files
            verbose: Enable verbose output
        """
        self.enabled_types = enabled_types
        self.dry_run = dry_run
        self.verbose = verbose
        
        # Initialize components
        self.parser = TreeSitterParser()
        self.analyzer = MultiAnalyzer(self.parser, enabled_types)
        self.instrumenter = MultiInstrumenter(self.analyzer, enabled_types)
        
        self.stats = {
            'files_processed': 0,
            'files_modified': 0,
            'total_instrumentations': 0,
            'instrumentations_by_type': {t: 0 for t in enabled_types}
        }
    
    def instrument_file(self, file_path: Path) -> Dict[str, Any]:
        """
        Instrument a single C file
        
        Args:
            file_path: Path to the C file to instrument
            
        Returns:
            Dictionary with instrumentation results and statistics
        """
        try:
            if self.verbose:
                print(f"Processing: {file_path}")
            
            # Read source code
            with open(file_path, 'r', encoding='utf-8') as f:
                source_code = f.read()
            
            # Analyze file for instrumentable items
            analysis_results = self.analyzer.find_all_instrumentable_items(source_code)
            
            # Check if any instrumentation is needed
            total_items = sum(len(items) for items in analysis_results.values())
            if total_items == 0:
                if self.verbose:
                    print(f"  No instrumentable items found in {file_path}")
                return {
                    'success': True,
                    'modified': False,
                    'instrumentations': {},
                    'message': 'No instrumentable items found'
                }
            
            # Perform instrumentation
            if self.dry_run:
                if self.verbose:
                    print(f"  [DRY RUN] Would instrument {total_items} items in {file_path}")
                    for inst_type, items in analysis_results.items():
                        if items:
                            print(f"    {inst_type}: {len(items)} items")
                return {
                    'success': True,
                    'modified': False,
                    'instrumentations': analysis_results,
                    'message': f'Would instrument {total_items} items'
                }
            else:
                # Create backup
                backup_path = file_path.with_suffix(file_path.suffix + '.backup')
                shutil.copy2(file_path, backup_path)
                
                try:
                    # Perform actual instrumentation
                    instrumented_code = self.instrumenter.instrument_code(source_code, analysis_results)
                    
                    # Write instrumented code
                    with open(file_path, 'w', encoding='utf-8') as f:
                        f.write(instrumented_code)
                    
                    if self.verbose:
                        print(f"  Instrumented {total_items} items in {file_path}")
                        for inst_type, items in analysis_results.items():
                            if items:
                                print(f"    {inst_type}: {len(items)} items")
                    
                    # Update statistics
                    self.stats['files_modified'] += 1
                    self.stats['total_instrumentations'] += total_items
                    for inst_type, items in analysis_results.items():
                        self.stats['instrumentations_by_type'][inst_type] += len(items)
                    
                    return {
                        'success': True,
                        'modified': True,
                        'instrumentations': analysis_results,
                        'backup_path': backup_path,
                        'message': f'Instrumented {total_items} items'
                    }
                    
                except Exception as e:
                    # Restore from backup on error
                    shutil.copy2(backup_path, file_path)
                    backup_path.unlink()  # Remove backup
                    raise e
                    
        except Exception as e:
            return {
                'success': False,
                'modified': False,
                'error': str(e),
                'message': f'Error processing file: {e}'
            }
    
    def instrument_directory(self, directory: Path, file_limit: int = None) -> Dict[str, Any]:
        """
        Instrument all C files in a directory
        
        Args:
            directory: Path to directory containing C files
            file_limit: Optional limit on number of files to process (for testing)
            
        Returns:
            Dictionary with overall instrumentation results
        """
        if not directory.exists():
            return {
                'success': False,
                'error': f'Directory does not exist: {directory}'
            }
        
        if not directory.is_dir():
            return {
                'success': False,
                'error': f'Path is not a directory: {directory}'
            }
        
        # Find all C files
        c_files = list(directory.rglob('*.c'))
        if not c_files:
            return {
                'success': False,
                'error': f'No .c files found in directory: {directory}'
            }
        
        # Apply file limit if specified
        if file_limit and file_limit > 0:
            c_files = c_files[:file_limit]
            print(f"Processing first {len(c_files)} files (limit: {file_limit})")
        
        results = []
        errors = []
        
        print(f"Found {len(c_files)} C files to process")
        print(f"Enabled instrumentation types: {', '.join(self.enabled_types)}")
        if self.dry_run:
            print("DRY RUN MODE: No files will be modified")
        print()
        
        # Process each file
        for file_path in c_files:
            self.stats['files_processed'] += 1
            result = self.instrument_file(file_path)
            results.append({
                'file': file_path,
                'result': result
            })
            
            if not result['success']:
                errors.append(f"{file_path}: {result.get('error', 'Unknown error')}")
        
        # Print summary
        print(f"\n--- Instrumentation Summary ---")
        print(f"Files processed: {self.stats['files_processed']}")
        print(f"Files modified: {self.stats['files_modified']}")
        print(f"Total instrumentations: {self.stats['total_instrumentations']}")
        print("Instrumentations by type:")
        for inst_type, count in self.stats['instrumentations_by_type'].items():
            print(f"  {inst_type}: {count}")
        
        if errors:
            print(f"\nErrors encountered: {len(errors)}")
            for error in errors:
                print(f"  {error}")
        
        return {
            'success': len(errors) == 0,
            'files_processed': self.stats['files_processed'],
            'files_modified': self.stats['files_modified'],
            'total_instrumentations': self.stats['total_instrumentations'],
            'results': results,
            'errors': errors
        }

    def instrument_code(self, source_code: str, instrumentation_type: str) -> str:
        """
        Instrument source code directly without file I/O
        
        Args:
            source_code: C source code to instrument
            instrumentation_type: Type of instrumentation ('dma', 'user_copy', 'functions')
            
        Returns:
            Instrumented source code
        """
        # Filter enabled types to only the requested type
        if instrumentation_type not in self.enabled_types:
            # Temporarily add the type to enabled types
            original_types = self.enabled_types.copy()
            self.enabled_types.add(instrumentation_type)
            
            # Re-initialize analyzer and instrumenter with the new type
            self.analyzer = MultiAnalyzer(self.parser, self.enabled_types)
            self.instrumenter = MultiInstrumenter(self.analyzer, self.enabled_types)
            
            try:
                # Analyze code for the specific type
                analysis_results = self.analyzer.find_all_instrumentable_items(source_code)
                
                # Filter to only the requested type
                filtered_results = {instrumentation_type: analysis_results.get(instrumentation_type, [])}
                
                # Instrument the code
                if any(filtered_results.values()):
                    return self.instrumenter.instrument_code(source_code, filtered_results)
                else:
                    return source_code
            finally:
                # Restore original enabled types
                self.enabled_types = original_types
                self.analyzer = MultiAnalyzer(self.parser, self.enabled_types)
                self.instrumenter = MultiInstrumenter(self.analyzer, self.enabled_types)
        else:
            # Type is already enabled
            analysis_results = self.analyzer.find_all_instrumentable_items(source_code)
            
            # Filter to only the requested type
            filtered_results = {instrumentation_type: analysis_results.get(instrumentation_type, [])}
            
            # Instrument the code
            if any(filtered_results.values()):
                return self.instrumenter.instrument_code(source_code, filtered_results)
            else:
                return source_code


def main():
    """
    Main entry point for the kernel instrumentation tool
    """
    parser = argparse.ArgumentParser(
        description="""Comprehensive kernel instrumentation tool for DMA APIs, user copy APIs, and function entry points.
        
        This tool instruments Linux kernel module C files with comprehensive logging for:
        - DMA API calls (dma_alloc_*, dma_free_*, etc.)
        - User space copy operations (copy_to_user, copy_from_user, etc.)
        - Function entry points (all function definitions)
        
        Uses tree-sitter for precise C code parsing and provides dry-run mode for safe preview.""",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    
    parser.add_argument(
        'directory',
        type=Path,
        help='Directory containing kernel module C files to instrument'
    )
    
    parser.add_argument(
        '--types',
        choices=['dma', 'user_copy', 'functions', 'all'],
        nargs='+',
        default=['all'],
        help='Instrumentation types to enable (default: all)'
    )
    
    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Preview changes without modifying files'
    )
    
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Enable verbose output'
    )
    
    parser.add_argument(
        '--test-limit',
        type=int,
        metavar='N',
        help='Limit processing to first N files (for testing)'
    )
    
    args = parser.parse_args()
    
    # Determine enabled types
    if 'all' in args.types:
        enabled_types = {'dma', 'user_copy', 'functions'}
    else:
        enabled_types = set(args.types)
    
    try:
        # Create instrumenter
        instrumenter = KernelInstrumenter(
            enabled_types=enabled_types,
            dry_run=args.dry_run,
            verbose=args.verbose
        )
        
        # Perform instrumentation
        result = instrumenter.instrument_directory(
            directory=args.directory,
            file_limit=args.test_limit
        )
        
        if result['success']:
            print("\n✅ Instrumentation completed successfully!")
            return 0
        else:
            print("\n❌ Instrumentation completed with errors!")
            return 1
            
    except KeyboardInterrupt:
        print("\n\n⚠️  Operation cancelled by user")
        return 130
    except Exception as e:
        print(f"\n❌ Fatal error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


if __name__ == '__main__':
    sys.exit(main())
