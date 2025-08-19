#!/usr/bin/env python3
"""
Command Line Interface for JSON Analysis Tool

Provides a command-line interface for analyzing JSON files containing kernel
operation data using OpenAI APIs for AI Accelerator relevance assessment.
"""

import argparse
import sys
from pathlib import Path
from typing import Optional

from .json_analyzer import JSONAnalyzer
from .models import GPTModel


def create_parser() -> argparse.ArgumentParser:
    """Create command line argument parser"""
    parser = argparse.ArgumentParser(
        description="Analyze JSON files containing kernel operations for AI Accelerator relevance",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Analyze with default GPT-4o-mini model and tools enabled
  python -m llm_analysis.cli data/json_files/coral_boot.json
  
  # Use GPT-4 model with verbose output and auto-generated log file
  python -m llm_analysis.cli data/json_files/coral_boot.json --model gpt-4 --verbose
  
  # Specify custom verbose log file location
  python -m llm_analysis.cli data/json_files/coral_boot.json --verbose --verbose-log my_analysis.log
  
  # Disable struct analyzer tools for faster processing
  python -m llm_analysis.cli data/json_files/coral_boot.json --disable-tools

Tool Calling:
  By default, the LLM can call the struct analyzer tool to analyze C structures
  from preprocessed files. This allows the LLM to understand struct layouts,
  field types, and dependencies when analyzing functions that use those structs.
  
  The tool analyzes structures like:
    python3 -m src.structanalyzer file.i struct_name --format c --depth 3
  
  And feeds the generated C header content to the LLM for better analysis.
"""
    )
    
    parser.add_argument(
        'json_files',
        nargs='+',
        help='JSON file(s) to analyze (supports multiple files and wildcards)'
    )
    
    parser.add_argument(
        '--model', '-m',
        choices=GPTModel.all_models(),
        default=GPTModel.GPT_4O_MINI.value,
        help='OpenAI GPT model to use for analysis (default: gpt-4o-mini)'
    )
    
    parser.add_argument(
        '--output', '-o',
        help='Output YAML file to save results (default: auto-generated based on input filename)'
    )
    
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Enable verbose output to see detailed analysis progress'
    )
    
    parser.add_argument(
        '--verbose-log', '-l',
        type=str,
        default=None,
        help='Verbose log file path. If not provided and --verbose is enabled, auto-generate in the same directory as the output YAML file'
    )
    
    parser.add_argument(
        '--no-summary',
        action='store_true',
        help='Skip printing summary to console'
    )
    
    parser.add_argument(
        '--disable-tools',
        action='store_true',
        help='Disable function calling tools (struct analyzer integration) - tools are enabled by default to allow LLM to analyze C structures from preprocessed files'
    )
    
    return parser


def validate_input_files(json_files: list) -> list:
    """Validate that input files exist and are readable"""
    valid_files = []
    
    for file_path in json_files:
        path = Path(file_path)
        if not path.exists():
            print(f"ERROR: File not found: {file_path}")
            sys.exit(1)
        if not path.is_file():
            print(f"ERROR: Not a file: {file_path}")
            sys.exit(1)
        if not path.suffix.lower() == '.json':
            print(f"WARNING: File does not have .json extension: {file_path}")
        
        valid_files.append(str(path.absolute()))
    
    return valid_files


def generate_output_filename(input_file: str, output_dir: Optional[str] = None) -> str:
    """Generate output filename based on input filename"""
    input_path = Path(input_file)
    output_name = f"{input_path.stem}_analysis.yaml"
    
    if output_dir:
        return str(Path(output_dir) / output_name)
    else:
        return str(input_path.parent / output_name)


def generate_log_filename(yaml_output_file: str) -> str:
    """Generate log filename based on YAML output file path"""
    yaml_path = Path(yaml_output_file)
    log_name = f"{yaml_path.stem}_verbose.log"
    return str(yaml_path.parent / log_name)


def main():
    """Main CLI entry point"""
    parser = create_parser()
    args = parser.parse_args()
    
    # Validate input files
    json_files = validate_input_files(args.json_files)
    
    # Determine verbose log file path if verbose is enabled
    verbose_log_file = None
    if args.verbose:
        if args.verbose_log:
            # Use user-specified log file path
            verbose_log_file = args.verbose_log
        else:
            # Auto-generate based on first output file
            if args.output and len(json_files) == 1:
                first_output = args.output
            else:
                first_output = generate_output_filename(json_files[0])
            verbose_log_file = generate_log_filename(first_output)
    
    # Initialize analyzer
    try:
        analyzer = JSONAnalyzer(
            model=args.model, 
            verbose=args.verbose,
            enable_tools=not args.disable_tools,
            verbose_log_file=verbose_log_file
        )
        
        if args.verbose:
            print(f"Initialized JSON Analyzer with model: {args.model}")
            print(f"Files to analyze: {len(json_files)}")
            for i, file_path in enumerate(json_files, 1):
                print(f"  {i}. {file_path}")
        
    except ValueError as e:
        print(f"ERROR: {e}")
        print("\nPlease create a .env file in the project root with your OpenAI API key:")
        print("OPENAI_API_KEY=your_api_key_here")
        sys.exit(1)
    except Exception as e:
        print(f"ERROR: Failed to initialize analyzer: {e}")
        sys.exit(1)
    
    # Process each file
    for file_path in json_files:
        try:
            print(f"\nAnalyzing: {file_path}")
            print("-" * 80)
            
            # Analyze the JSON file
            results = analyzer.analyze_json_file(file_path)
            
            if not results:
                print(f"WARNING: No analyzable data found in {file_path}")
                continue
            
            # Determine output file
            if args.output and len(json_files) == 1:
                output_file = args.output
            else:
                output_file = generate_output_filename(file_path)
            
            # Export results
            analyzer.export_results_to_yaml(results, output_file)
            print(f"Results saved to: {output_file}")
            
            # Print summary unless disabled
            if not args.no_summary:
                analyzer.print_results_summary(results)
            
            # Count total functions analyzed
            total_functions = sum(len(analysis_list) for analysis_list in results.values())
            print(f"\nCompleted analysis of {total_functions} functions from {file_path}")
            
        except Exception as e:
            print(f"ERROR analyzing {file_path}: {e}")
            if args.verbose:
                import traceback
                traceback.print_exc()
            continue
    
    print(f"\nAnalysis complete for {len(json_files)} file(s)")


if __name__ == '__main__':
    main()
