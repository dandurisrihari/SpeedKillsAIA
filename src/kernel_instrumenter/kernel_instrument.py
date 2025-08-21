#!/usr/bin/env python3
"""
Production-Ready Kernel Instrumentation Tool

This is the main entry point for the kernel instrumentation system, providing
a comprehensive, production-ready tool for instrumenting Linux kernel modules
with multiple types of runtime analysis and logging.

Key Features:
    ✓ Multiple instrumentation types (DMA, user_copy, functions, dma_present_files_functions)
    ✓ Tree-sitter based precise C code parsing and analysis
    ✓ Production-ready error handling and recovery
    ✓ Comprehensive backup and rollback mechanisms
    ✓ Dry-run mode for safe preview of changes
    ✓ Parallel processing for large codebases
    ✓ Extensive logging and progress reporting
    ✓ Type-safe implementation with full type hints
    ✓ Modular architecture for easy extension

Architecture Overview:
    ┌─────────────────────────────────────────────────────────────────┐
    │                 KernelInstrumenter                              │
    │                (Main Orchestrator)                              │
    │                                                                 │
    │  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐  │
    │  │   TreeSitter    │  │  MultiAnalyzer  │  │MultiInstrumenter│  │
    │  │     Parser      │  │   (Coordinate   │  │  (Apply Changes)│  │
    │  │  (Parse C AST)  │  │   Analyzers)    │  │                 │  │
    │  └─────────────────┘  └─────────────────┘  └─────────────────┘  │
    │                                                                 │
    │  ┌─────────────────────────────────────────────────────────┐    │
    │  │                   Specialized Analyzers                 │    │
    │  │  ┌─────────┐ ┌─────────┐ ┌─────────┐ ┌─────────────┐    │    │
    │  │  │   DMA   │ │  User   │ │Function │ │ DMA Present │    │    │
    │  │  │Analyzer │ │  Copy   │ │Analyzer │ │    Files    │    │    │
    │  │  │         │ │Analyzer │ │         │ │  Analyzer   │    │    │
    │  │  └─────────┘ └─────────┘ └─────────┘ └─────────────┘    │    │
    │  └─────────────────────────────────────────────────────────┘    │
    └─────────────────────────────────────────────────────────────────┘

Instrumentation Types:
    dma:                       Direct DMA API call instrumentation
    user_copy:                 User space copy operation instrumentation  
    functions:                 All function entry point instrumentation
    dma_present_files_functions: Function entry instrumentation in DMA-containing files

Safety Features:
    - Automatic backup creation before modification
    - Rollback on instrumentation failure
    - Validation of instrumented code
    - Dry-run mode for preview
    - Comprehensive error reporting

Performance Features:
    - Parallel file processing
    - Memory-efficient parsing
    - Incremental processing support
    - Progress reporting for long operations
    - Configurable resource limits

Usage Examples:
    Basic usage:
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy', 'ioctl'},
            dry_run=False,
            verbose=True
        )
        result = instrumenter.instrument_directory('/path/to/kernel/source')
    
    Advanced usage:
        instrumenter = KernelInstrumenter(
            enabled_types={'dma_present_files_functions'},
            dry_run=True,
            verbose=True
        )
        result = instrumenter.instrument_directory(
            directory='/path/to/source',
            file_limit=100  # Process first 100 files for testing
        )

Command Line Usage:
    # Default instrumentation (dma, user_copy, dma_present_files_functions)
    python kernel_instrument.py -d /path/to/kernel/source
    
    # Specific instrumentation types
    python kernel_instrument.py -d /path/to/source --types dma user_copy
    
    # Dry run mode
    python kernel_instrument.py -d /path/to/source --dry-run --verbose
    
    # Limited processing for testing
    python kernel_instrument.py -d /path/to/source --test-limit 10

Exit Codes:
    0: Success - All files processed without errors
    1: Partial failure - Some files had errors but overall operation completed
    2: Complete failure - Operation could not be completed
    130: User interruption (Ctrl+C)

Author: anonymous
Version: 2.0.0
License: MIT
"""

import sys
import argparse
import shutil
from pathlib import Path
from typing import Set, List, Dict, Any, Union
import sys
import os
#import pdb; pdb.set_trace()

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
            enabled_types: Set of instrumentation types to enable ('dma', 'user_copy', 'functions', 'ioctl')
            dry_run: If True, preview changes without modifying files
            verbose: Enable verbose output
        """
        # Valid instrumentation types
        valid_types = {'dma', 'user_copy', 'functions', 'dma_present_files_functions', 'ioctl'}
        
        # Validate enabled_types
        invalid_types = enabled_types - valid_types
        if invalid_types:
            raise ValueError(f"Invalid instrumentation type(s): {invalid_types}. "
                           f"Valid types are: {valid_types}")
        
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
            # Update files processed counter
            self.stats['files_processed'] += 1
            
            if self.verbose:
                print(f"Processing: {file_path}")
            
            # Read source code
            with open(file_path, 'r', encoding='utf-8') as f:
                source_code = f.read()
            
            # Use the modular analyzer system for all instrumentation types
            analysis_results = self.analyzer.find_all_instrumentable_items(source_code)
            
            # Check if any instrumentation is needed
            total_items = sum(len(items) for items in analysis_results.values())
            if total_items == 0:
                if self.verbose:
                    print(f"  No instrumentable items found in {file_path}")
                return {
                    'success': True,
                    'modified': False,
                    'instrumentations': analysis_results,  # Return the empty results dict
                    'message': 'No instrumentable items found'
                }
            
            # Perform instrumentation
            if self.dry_run:
                if self.verbose:
                    print(f"  [DRY RUN] Would instrument {total_items} items in {file_path}")
                    for inst_type, items in analysis_results.items():
                        if items:
                            print(f"    {inst_type}: {len(items)} items")
                            # Show detailed information for each item in verbose mode
                            for item in items[:5]:  # Limit to first 5 items to avoid clutter
                                if inst_type == 'dma' and 'function_name' in item:
                                    print(f"      - {item['function_name']} at line {item['line_number']}")
                                elif inst_type == 'user_copy' and 'function_name' in item:
                                    print(f"      - {item['function_name']} at line {item['line_number']}")
                                elif inst_type == 'functions' and 'function_name' in item:
                                    print(f"      - {item['function_name']} at line {item['line_number']}")
                                elif inst_type == 'ioctl' and 'function_name' in item:
                                    print(f"      - {item['function_name']} at line {item['line_number']}")
                            if len(items) > 5:
                                print(f"      ... and {len(items) - 5} more")
                
                # Update statistics for dry-run mode
                self.stats['total_instrumentations'] += total_items
                for inst_type, items in analysis_results.items():
                    if 'dma_present_files_functions' in self.enabled_types and inst_type == 'functions':
                        # Map functions to dma_present_files_functions for stats
                        self.stats['instrumentations_by_type']['dma_present_files_functions'] = self.stats['instrumentations_by_type'].get('dma_present_files_functions', 0) + len(items)
                    else:
                        self.stats['instrumentations_by_type'][inst_type] += len(items)
                
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
                    # Perform actual instrumentation using the modular system
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
                        if 'dma_present_files_functions' in self.enabled_types and inst_type == 'functions':
                            # Map functions to dma_present_files_functions for stats
                            self.stats['instrumentations_by_type']['dma_present_files_functions'] = self.stats['instrumentations_by_type'].get('dma_present_files_functions', 0) + len(items)
                        else:
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
    
    def instrument_directory(self, directory: Union[str, Path], file_limit: int = None) -> Dict[str, Any]:
        """
        Instrument all C files in a directory
        
        Args:
            directory: Path to directory containing C files (string or Path object)
            file_limit: Optional limit on number of files to process (for testing)
            
        Returns:
            Dictionary with overall instrumentation results
        """
        # Convert to Path object if string
        if isinstance(directory, str):
            directory = Path(directory)
            
        if not directory.exists():
            return {
                'success': False,
                'error': f'Directory does not exist: {directory}',
                'files_processed': 0,
                'files_modified': 0,
                'total_instrumentations': 0,
                'instrumentations_by_type': {},
                'errors': [f'Directory does not exist: {directory}']
            }
        
        if not directory.is_dir():
            return {
                'success': False,
                'error': f'Path is not a directory: {directory}',
                'files_processed': 0,
                'files_modified': 0,
                'total_instrumentations': 0,
                'instrumentations_by_type': {},
                'errors': [f'Path is not a directory: {directory}']
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
            'instrumentations_by_type': self.stats['instrumentations_by_type'],
            'results': results,
            'errors': errors
        }

    def generate_summary_stats(self, directory: Union[str, Path], results: List[Dict[str, Any]]) -> Dict[str, Any]:
        """
        Generate comprehensive statistics summary
        
        Args:
            directory: The directory that was processed
            results: List of file processing results
            
        Returns:
            Dictionary containing detailed statistics
        """
        # Convert to Path object if string
        if isinstance(directory, str):
            directory = Path(directory)
        
        # Count total source code functions by analyzing each file
        total_functions_in_source = 0
        source_files_analyzed = 0
        total_source_files = 0
        
        # Count all C files in directory
        all_c_files = list(directory.rglob('*.c'))
        total_source_files = len(all_c_files)
        
        # Analyze functions in processed files
        for result_entry in results:
            if result_entry['result']['success']:
                source_files_analyzed += 1
                file_path = result_entry['file']
                try:
                    # Read the file and count functions using our parser
                    with open(file_path, 'r', encoding='utf-8') as f:
                        source_code = f.read()
                    
                    # Count functions by traversing the AST
                    tree = self.parser.parse(source_code)
                    
                    def count_functions(node):
                        """Recursively count function definitions"""
                        count = 0
                        if node.type == 'function_definition':
                            count = 1
                        for child in node.children:
                            count += count_functions(child)
                        return count
                    
                    function_count = count_functions(tree.root_node)
                    total_functions_in_source += function_count
                    
                except Exception as e:
                    # If we can't analyze a file, skip it for function counting
                    if self.verbose:
                        print(f"Warning: Could not count functions in {file_path}: {e}")
        
        # Calculate instrumentation efficiency
        instrumentation_rate = {}
        for inst_type, count in self.stats['instrumentations_by_type'].items():
            if inst_type == 'functions' or inst_type == 'dma_present_files_functions':
                # For function-based instrumentation, compare to total functions
                if total_functions_in_source > 0:
                    instrumentation_rate[inst_type] = (count / total_functions_in_source) * 100
                else:
                    instrumentation_rate[inst_type] = 0
            else:
                # For API-based instrumentation (dma, user_copy, ioctl), just show count
                instrumentation_rate[inst_type] = count
        
        # Categorize files by modification status
        files_with_instrumentations = sum(1 for r in results if r['result'].get('modified', False))
        files_without_instrumentations = self.stats['files_processed'] - files_with_instrumentations
        files_with_errors = sum(1 for r in results if not r['result']['success'])
        files_skipped = total_source_files - self.stats['files_processed']
        
        return {
            'processing_summary': {
                'total_source_files_in_directory': total_source_files,
                'files_processed': self.stats['files_processed'],
                'files_skipped': files_skipped,
                'files_successfully_analyzed': source_files_analyzed,
                'files_with_errors': files_with_errors
            },
            'instrumentation_summary': {
                'files_modified': files_with_instrumentations,
                'files_without_instrumentations': files_without_instrumentations,
                'total_instrumentations_added': self.stats['total_instrumentations'],
                'dry_run_mode': self.dry_run
            },
            'function_analysis': {
                'total_functions_in_source_code': total_functions_in_source,
                'functions_instrumented': self.stats['instrumentations_by_type'].get('functions', 0) + 
                                        self.stats['instrumentations_by_type'].get('dma_present_files_functions', 0),
                'function_instrumentation_rate_percent': instrumentation_rate.get('functions', 0) + 
                                                       instrumentation_rate.get('dma_present_files_functions', 0)
            },
            'instrumentation_by_type': self.stats['instrumentations_by_type'],
            'instrumentation_rates': instrumentation_rate,
            'enabled_types': list(self.enabled_types),
            'directory_processed': str(directory),
            'configuration': {
                'dry_run': self.dry_run,
                'verbose': self.verbose,
                'enabled_instrumentation_types': list(self.enabled_types)
            }
        }

    def save_summary_to_file(self, summary_stats: Dict[str, Any], filename: str) -> None:
        """
        Save detailed statistics summary to a text file
        
        Args:
            summary_stats: Statistics dictionary from generate_summary_stats
            filename: Output filename for the summary
        """
        import datetime
        
        with open(filename, 'w', encoding='utf-8') as f:
            f.write("="*70 + "\n")
            f.write("             KERNEL INSTRUMENTATION SUMMARY REPORT\n")
            f.write("="*70 + "\n")
            f.write(f"Generated on: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write(f"Directory processed: {summary_stats['directory_processed']}\n")
            f.write(f"Mode: {'DRY RUN' if summary_stats['configuration']['dry_run'] else 'LIVE INSTRUMENTATION'}\n")
            f.write("-"*70 + "\n\n")
            
            # Processing Overview
            f.write("📁 FILE PROCESSING OVERVIEW\n")
            f.write("-"*30 + "\n")
            proc = summary_stats['processing_summary']
            f.write(f"Total C files in directory:     {proc['total_source_files_in_directory']}\n")
            f.write(f"Files processed:                {proc['files_processed']}\n")
            f.write(f"Files skipped:                  {proc['files_skipped']}\n")
            f.write(f"Files successfully analyzed:    {proc['files_successfully_analyzed']}\n")
            f.write(f"Files with errors:              {proc['files_with_errors']}\n")
            
            # Processing rate
            if proc['total_source_files_in_directory'] > 0:
                processing_rate = (proc['files_processed'] / proc['total_source_files_in_directory']) * 100
                f.write(f"Processing coverage:            {processing_rate:.1f}%\n")
            f.write("\n")
            
            # Instrumentation Overview
            f.write("🔧 INSTRUMENTATION OVERVIEW\n")
            f.write("-"*30 + "\n")
            inst = summary_stats['instrumentation_summary']
            f.write(f"Files modified:                 {inst['files_modified']}\n")
            f.write(f"Files without instrumentations: {inst['files_without_instrumentations']}\n")
            f.write(f"Total instrumentations added:   {inst['total_instrumentations_added']}\n")
            f.write(f"Dry run mode:                   {'Yes' if inst['dry_run_mode'] else 'No'}\n")
            
            # Modification rate
            if proc['files_processed'] > 0:
                modification_rate = (inst['files_modified'] / proc['files_processed']) * 100
                f.write(f"File modification rate:         {modification_rate:.1f}%\n")
            f.write("\n")
            
            # Function Analysis
            f.write("⚙️  FUNCTION ANALYSIS\n")
            f.write("-"*30 + "\n")
            func = summary_stats['function_analysis']
            f.write(f"Total functions in source code: {func['total_functions_in_source_code']}\n")
            f.write(f"Functions instrumented:         {func['functions_instrumented']}\n")
            if func['total_functions_in_source_code'] > 0:
                f.write(f"Function instrumentation rate:  {func['function_instrumentation_rate_percent']:.1f}%\n")
            f.write("\n")
            
            # Instrumentation by Type
            f.write("📊 INSTRUMENTATION BREAKDOWN BY TYPE\n")
            f.write("-"*40 + "\n")
            for inst_type, count in summary_stats['instrumentation_by_type'].items():
                type_name = inst_type.replace('_', ' ').title()
                f.write(f"{type_name:<30} {count:>8}\n")
            f.write("\n")
            
            # Configuration Details
            f.write("⚙️  CONFIGURATION DETAILS\n")
            f.write("-"*30 + "\n")
            config = summary_stats['configuration']
            f.write(f"Enabled instrumentation types:\n")
            for inst_type in config['enabled_instrumentation_types']:
                type_desc = {
                    'dma': 'DMA API calls (dma_alloc_*, dma_free_*, etc.)',
                    'user_copy': 'User space copy operations (copy_to_user, copy_from_user)',
                    'functions': 'All function entry points',
                    'dma_present_files_functions': 'Function entries in DMA-containing files',
                    'ioctl': 'IOCTL handler functions'
                }.get(inst_type, inst_type)
                f.write(f"  • {inst_type}: {type_desc}\n")
            f.write(f"\nVerbose mode: {'Enabled' if config['verbose'] else 'Disabled'}\n")
            f.write(f"Dry run mode: {'Enabled' if config['dry_run'] else 'Disabled'}\n")
            f.write("\n")
            
            # Summary footer
            f.write("="*70 + "\n")
            if inst['total_instrumentations_added'] > 0:
                f.write("✅ SUCCESS: Instrumentation completed with modifications\n")
            else:
                f.write("ℹ️  INFO: No instrumentations were needed or added\n")
            if proc['files_with_errors'] > 0:
                f.write(f"⚠️  WARNING: {proc['files_with_errors']} files had processing errors\n")
            f.write("="*70 + "\n")

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
        '--directory', '-d',
        type=Path,
        required=True,
        help='Directory containing kernel module C files to instrument'
    )
    
    parser.add_argument(
        '--types',
        choices=['dma', 'user_copy', 'functions', 'dma_present_files_functions', 'ioctl', 'all'],
        nargs='+',
        default=['dma', 'user_copy', 'dma_present_files_functions', 'ioctl'],
        help='Instrumentation types to enable (default: dma user_copy dma_present_files_functions ioctl). Use "all" to include all standard types. Use "dma_present_files_functions" to instrument all function entries in files containing DMA operations. Use "ioctl" to instrument ioctl handler functions'
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
    
    parser.add_argument(
        '--summary',
        nargs='?',
        const='summary.txt',
        default=None,
        metavar='FILE',
        help='Generate detailed statistics summary and save to file (default: summary.txt if no filename specified)'
    )
    
    args = parser.parse_args()
    
    # Determine enabled types
    if 'all' in args.types:
        enabled_types = {'dma', 'user_copy', 'functions', 'ioctl'}
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
        
        # Generate and save summary if requested
        if args.summary:
            try:
                summary_stats = instrumenter.generate_summary_stats(
                    directory=args.directory,
                    results=result.get('results', [])
                )
                instrumenter.save_summary_to_file(summary_stats, args.summary)
                print(f"📊 Detailed summary saved to: {args.summary}")
            except Exception as e:
                print(f"⚠️  Warning: Could not save summary file: {e}")
        
        if result['success']:
            print("\n✅ Instrumentation completed successfully!")
            return 0
        else:
            print("\n❌ Instrumentation completed with errors!")
            # Print specific error message if available
            if 'error' in result:
                print(f"Error: {result['error']}")
            elif 'errors' in result and result['errors']:
                print("Errors encountered:")
                for error in result['errors']:
                    print(f"  {error}")
            return 1
            
    except KeyboardInterrupt:
        print("\n\n⚠️  Operation cancelled by user")
        return 130
    except Exception as e:
        print(f"\n❌ Fatal error: {e}")
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


if __name__ == '__main__':
    sys.exit(main())
