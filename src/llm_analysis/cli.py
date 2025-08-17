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
  # Analyze with default GPT-3.5-turbo model
  python -m llm_analysis.cli data/json_files/coral_boot.json
  
  # Use GPT-4 model with verbose output
  python -m llm_analysis.cli data/json_files/coral_boot.json --model gpt-4 --verbose
  
  # Save results to specific output file
  python -m llm_analysis.cli data/json_files/coral_boot.json -o analysis_results.yaml
  
  # Analyze multiple files
  python -m llm_analysis.cli data/json_files/*.json --verbose

Available GPT Models:
  - gpt-3.5-turbo (default, fastest and most cost-effective)
  - gpt-4 (higher quality analysis)
  - gpt-4-turbo-preview (latest GPT-4 variant)
  - gpt-4o (optimized model)

Note: Make sure to set OPENAI_API_KEY in your .env file before running.
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
        default=GPTModel.GPT_3_5_TURBO.value,
        help='OpenAI GPT model to use for analysis (default: gpt-3.5-turbo)'
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
        '--no-summary',
        action='store_true',
        help='Skip printing summary to console'
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


def main():
    """Main CLI entry point"""
    parser = create_parser()
    args = parser.parse_args()
    
    # Validate input files
    json_files = validate_input_files(args.json_files)
    
    # Initialize analyzer
    try:
        analyzer = JSONAnalyzer(model=args.model, verbose=args.verbose)
        
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
