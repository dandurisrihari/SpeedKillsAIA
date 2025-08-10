#!/usr/bin/env python3
"""
Extract all struct definitions from a single .i file and output as JSON

Usage:
    python extract_all_structs.py file.i > structs.json
    python extract_all_structs.py file.i --pretty
"""
import sys
import json
import argparse
from pathlib import Path
from src.preprocess.utils.struct_extractor import StructExtractor


def main():
    parser = argparse.ArgumentParser(description='Extract all struct definitions from .i file as JSON')
    parser.add_argument('input_file', help='Path to .i file to process')
    parser.add_argument('--pretty', action='store_true', help='Pretty print JSON output')
    parser.add_argument('--output', '-o', help='Output file (default: stdout)')
    
    args = parser.parse_args()
    
    input_path = Path(args.input_file)
    if not input_path.exists():
        print(f"Error: File {input_path} does not exist", file=sys.stderr)
        sys.exit(1)
    
    # Extract structs
    extractor = StructExtractor()
    struct_definitions = extractor.extract_from_file(input_path)
    
    # Convert to dictionaries for JSON serialization
    structs_data = []
    for struct_def in struct_definitions:
        structs_data.append(struct_def.to_dict())
    
    # Prepare JSON output
    output_data = {
        'source_file': str(input_path),
        'total_structs': len(structs_data),
        'extracted_at': str(datetime.now().isoformat()),
        'struct_definitions': structs_data
    }
    
    # Format JSON
    if args.pretty:
        json_output = json.dumps(output_data, indent=2, ensure_ascii=False)
    else:
        json_output = json.dumps(output_data, ensure_ascii=False)
    
    # Output
    if args.output:
        with open(args.output, 'w') as f:
            f.write(json_output)
        print(f"Extracted {len(structs_data)} struct definitions to {args.output}", file=sys.stderr)
    else:
        print(json_output)


if __name__ == '__main__':
    from datetime import datetime
    main()
