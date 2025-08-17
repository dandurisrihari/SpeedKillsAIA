#!/usr/bin/env python3
"""
Command-line interface for C Structure Analyzer
"""

import argparse
import sys
import json
from pathlib import Path
from typing import List, Optional, Optional

from .analyzer import CStructureAnalyzer
from .output import OutputFormatter, OutputManager


def create_parser() -> argparse.ArgumentParser:
    """Create command-line argument parser"""
    
    parser = argparse.ArgumentParser(
        prog='structanalyzer',
        description='Comprehensive C structure and union analyzer with typedef resolution',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Analyze a specific structure
  python3 -m src.structanalyzer file.c StructName
  
  # Analyze with custom depth
  python3 -m src.structanalyzer file.c StructName --depth 5
  
  # Generate specific output format
  python3 -m src.structanalyzer file.c StructName --format json
  
  # List all structures in a file
  python3 -m src.structanalyzer file.c --list-structures
  
  # List all structures with unlimited results
  python3 -m src.structanalyzer file.c --list-structures --max-results 0
  
  # Analyze with custom primitives
  python3 -m src.structanalyzer file.c StructName --primitives "my_int,my_ptr"
        """
    )
    
    # Positional arguments
    parser.add_argument('file_path', 
                       help='Path to the C source/preprocessed file to analyze')
    parser.add_argument('structure_name', 
                       nargs='?',
                       help='Name of the structure/union to analyze (required unless --list-structures)')
    
    # Analysis options
    parser.add_argument('--depth', '-d', 
                       type=int, 
                       default=3,
                       help='Maximum analysis depth for nested structures (default: 3)')
    
    # Output options
    parser.add_argument('--output', '-o', 
                       help='Output file path (default: auto-generated)')
    parser.add_argument('--format', '-f', 
                       choices=['text', 'c', 'json', 'csv', 'all'], 
                       default='all',
                       help='Output format (default: all)')
    
    # Display options
    parser.add_argument('--verbose', '-v',
                       action='store_true',
                       help='Enable verbose output during analysis')
    
    # Special modes
    parser.add_argument('--list-structures', '-l',
                       action='store_true',
                       help='List all structures/unions found in the file')
    
    parser.add_argument('--max-results',
                       type=int,
                       default=1000,
                       help='Maximum number of structures to list (default: 1000, 0 for unlimited)')
    
    # Primitive type customization
    parser.add_argument('--primitives',
                       help='Additional primitive types (comma-separated list)')
    
    return parser


def list_structures(analyzer: CStructureAnalyzer, max_results: Optional[int] = 1000) -> None:
    """List all structures found in the file"""
    
    print("Scanning for structures and unions...")
    
    # Get all structure names first to get accurate count
    all_structures = analyzer.parser.get_all_structure_names()
    total_count = len(all_structures)
    
    if not all_structures:
        print("ERROR: No structures or unions found in the file")
        return
    
    # Determine how many to show
    if max_results is None or max_results == 0:
        show_count = total_count
        structures_to_show = all_structures
        print(f"\nFound {total_count} structures/unions:")
    else:
        show_count = min(max_results, total_count)
        structures_to_show = all_structures[:show_count]
        print(f"\nFound {total_count} structures/unions (showing first {show_count}):")
    
    print("-" * 50)
    
    for i, struct_name in enumerate(structures_to_show, 1):
        try:
            # Quick check to see if it's a struct or union
            struct_info = analyzer.find_structure(struct_name, verbose=False)
            if struct_info.found:
                type_str = "union" if struct_info.is_union else "struct"
                field_count = struct_info.field_count
                print(f"{i:3d}. {type_str:6} {struct_name:30} ({field_count} fields)")
            else:
                print(f"{i:3d}. {'unknown':6} {struct_name:30} (not found)")
        except Exception:
            print(f"{i:3d}. {'error':6} {struct_name:30} (parse error)")
    
    # Show remaining count if truncated
    if max_results is not None and max_results > 0 and total_count > max_results:
        remaining = total_count - max_results
        print(f"     ... and {remaining} more structures")
        print(f"\nTip: Use --max-results 0 to show all {total_count} structures")


def show_typedef_summary(analyzer: CStructureAnalyzer) -> None:
    """Show summary of typedef mappings"""
    
    typedef_map = analyzer.primitive_manager.get_typedef_map()
    
    if not typedef_map:
        print("Typedef Mappings: None found")
        return
    
    print(f"Typedef Mappings ({len(typedef_map)} total):")
    print("-" * 50)
    
    # Group by category
    gct_types = {k: v for k, v in typedef_map.items() if k.startswith('gct')}
    gce_types = {k: v for k, v in typedef_map.items() if k.startswith('gce')}
    other_types = {k: v for k, v in typedef_map.items() if not k.startswith('gc')}
    
    if gct_types:
        print(f"GPU Core Types (gct*): {len(gct_types)}")
        for typedef_name, underlying in sorted(list(gct_types.items())[:10]):
            resolved = analyzer.primitive_manager.resolve_type(typedef_name)
            resolution = f" -> {resolved}" if resolved and resolved != underlying else ""
            print(f"   {typedef_name:15} -> {underlying}{resolution}")
        if len(gct_types) > 10:
            print(f"   ... and {len(gct_types) - 10} more")
        print()
    
    if gce_types:
        print(f"GPU Enums (gce*): {len(gce_types)}")
        for typedef_name, underlying in sorted(list(gce_types.items())[:5]):
            print(f"   {typedef_name:15} -> {underlying[:50]}")
        if len(gce_types) > 5:
            print(f"   ... and {len(gce_types) - 5} more")
        print()
    
    if other_types:
        print(f"System Types: {len(other_types)}")
        for typedef_name, underlying in sorted(list(other_types.items())[:10]):
            resolved = analyzer.primitive_manager.resolve_type(typedef_name)
            resolution = f" -> {resolved}" if resolved and resolved != underlying else ""
            print(f"   {typedef_name:15} -> {underlying}{resolution}")
        if len(other_types) > 10:
            print(f"   ... and {len(other_types) - 10} more")


def run_comprehensive_analysis(analyzer: CStructureAnalyzer, structure_name: str, 
                             max_depth: int, verbose: bool) -> None:
    """Run comprehensive analysis with typedef information"""
    
    print("Comprehensive C Structure Analysis")
    print("=" * 50)
    
    # Show typedef summary first
    show_typedef_summary(analyzer)
    print()
    
    # Run main analysis
    result = analyzer.analyze_structure(structure_name, max_depth, verbose)
    
    # Show results
    if result.analysis_complete:
        stats = result.get_statistics()
        print("Analysis Results:")
        print("-" * 20)
        print(f"Total Structures: {stats['total_structures']}")
        print(f"Total Fields: {stats['total_fields']}")
        print(f"Primitive Fields: {stats['total_primitives']}")
        print(f"Union Fields: {stats['total_unions']}")
        print(f"Analysis Time: {stats['analysis_time']:.3f}s")
        print(f"Success Rate: {stats['success_rate']:.1%}")
        
        # Save comprehensive output
        output_manager = OutputManager(".")
        saved_files = output_manager.save_multiple_formats(result, f"{structure_name}_comprehensive")
        
        print(f"\nGenerated Files:")
        for format_type, file_path in saved_files.items():
            if not file_path.startswith("Error"):
                print(f"  {format_type.upper()}: {file_path}")


def main() -> int:
    """Main entry point"""
    
    parser = create_parser()
    args = parser.parse_args()
    
    # Validate arguments
    if not args.list_structures and not args.structure_name:
        parser.error("structure_name is required unless --list-structures is used")
    
    # Validate depth parameter
    if args.depth < 0:
        print("ERROR: Depth must be non-negative (0 = unlimited)")
        return 1
    
    # Check if file exists
    if not Path(args.file_path).exists():
        print(f"ERROR: File not found: {args.file_path}")
        return 1
    
    # Parse custom primitives
    custom_primitives = None
    if args.primitives:
        custom_primitives = set(args.primitives.split(','))
    
    # Initialize analyzer
    try:
        analyzer = CStructureAnalyzer(args.file_path, custom_primitives)
    except Exception as e:
        print(f"ERROR: Failed to initialize analyzer: {e}")
        return 1
    
    # Handle special modes
    if args.list_structures:
        max_results = args.max_results if args.max_results > 0 else None
        list_structures(analyzer, max_results)
        return 0
    
    # Run comprehensive analysis (always enabled by default)
    print("C Structure Analyzer - Comprehensive Analysis")
    print("=" * 60)
    print(f"File: {args.file_path}")
    print(f"Structure: {args.structure_name}")
    print(f"Max Depth: {args.depth}")
    print(f"Output Format: {args.format}")
    if args.verbose:
        print("Verbose Mode: ON")
    print("=" * 60)
    
    # Show typedef summary first
    show_typedef_summary(analyzer)
    print()
    
    try:
        result = analyzer.analyze_structure(args.structure_name, args.depth, args.verbose)
    except Exception as e:
        print(f"ERROR: Analysis failed: {e}")
        return 1
    
    if not result.analysis_complete:
        print("ERROR: Analysis incomplete")
        return 1
    
    # Show basic results
    main_struct = result.get_main_structure()
    if main_struct and main_struct.found:
        type_str = "union" if main_struct.is_union else "struct"
        print(f"SUCCESS: Found {type_str}: {args.structure_name}")
        print(f"Location: Lines {main_struct.start_line}-{main_struct.end_line}")
        print(f"Fields: {main_struct.field_count}")
        if main_struct.union_count > 0:
            print(f"Union fields: {main_struct.union_count}")
    else:
        print(f"ERROR: Structure not found: {args.structure_name}")
        return 1
    
    # Generate output - default to all formats, detailed, and pretty
    output_manager = OutputManager(".")
    
    if args.format == 'all':
        # Generate all formats with comprehensive output
        saved_files = output_manager.save_multiple_formats(result, args.output)
        print("\nSaved files:")
        for format_type, file_path in saved_files.items():
            if not file_path.startswith("Error"):
                print(f"   {format_type.upper()}: {file_path}")
            else:
                print(f"   ERROR {format_type.upper()}: {file_path}")
            
    else:
        # Single format output with detailed formatting enabled
        try:
            output_path = output_manager.save_analysis(
                result, 
                args.output, 
                args.format, 
                detailed=True  # Always use detailed output
            )
            print(f"Results saved to: {output_path}")
        except Exception as e:
            print(f"ERROR: Failed to save output: {e}")
            return 1
    
    # Show summary statistics
    print("\n" + "=" * 60)
    print("ANALYSIS SUMMARY")
    print("=" * 60)
    
    stats = result.get_statistics()
    print(f"Analysis completed in {stats['analysis_time']:.3f}s")
    print(f"Total structures analyzed: {stats['total_structures']}")
    print(f"Total fields found: {stats['total_fields']}")
    print(f"Primitive fields: {stats['total_primitives']}")
    print(f"Nested structures: {stats['total_nested']}")
    print(f"Union fields: {stats['total_unions']}")
    print(f"Success rate: {stats['success_rate']:.1%}")
    
    # Show main structure details
    main_struct = result.get_main_structure()
    if main_struct and main_struct.found:
        print(f"Structure: {main_struct.name}")
        print(f"   Location: Lines {main_struct.start_line}-{main_struct.end_line}")
        print(f"   Fields: {main_struct.field_count}")
        if main_struct.primitive_count > 0:
            print(f"   Primitives: {main_struct.primitive_count}")
        if main_struct.union_count > 0:
            print(f"   Unions: {main_struct.union_count}")
    
    if result.errors:
        print(f"\nWarnings/Errors encountered: {len(result.errors)}")
        for error in result.errors[:3]:  # Show first 3 errors
            print(f"   - {error}")
        if len(result.errors) > 3:
            print(f"   ... and {len(result.errors) - 3} more")
    
    print("Analysis completed successfully!")
    return 0


if __name__ == '__main__':
    sys.exit(main())
