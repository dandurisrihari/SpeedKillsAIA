#!/usr/bin/env python3
"""
Struct Definitions Extraction Tool

Extracts struct definitions from .i files and generates JSON output
in the format required for LLM analysis context.

Usage:
    python -m src.preprocess.struct_tool --source-dir data/kernel_sources/nxp -o nxp_structs.json
    python -m src.preprocess.struct_tool --files file1.i file2.i -o structs.json
"""

import argparse
import json
import sys
from pathlib import Path
from typing import List, Dict, Any

# Add the parent directory to sys.path to enable imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from src.preprocess.utils.struct_extractor import extract_structs_by_file


def find_i_files(source_dir: Path) -> List[Path]:
    """Find all .i files in the source directory recursively"""
    i_files = []
    for i_file in source_dir.rglob("*.i"):
        if i_file.is_file():
            i_files.append(i_file)
    return sorted(i_files)


def generate_struct_json(files: List[Path], output_file: Path) -> Dict[str, Any]:
    """
    Generate struct definitions JSON file in the new format
    
    Args:
        files: List of .i files to process
        output_file: Output JSON file path
        
    Returns:
        Dictionary containing the generated data
    """
    print(f"🔍 Processing {len(files)} .i files...")
    
    # Extract struct definitions grouped by file
    struct_data = extract_structs_by_file(files)
    
    # Create metadata
    metadata = {
        "description": "Struct definitions extracted from kernel source files",
        "format": "file-based struct definitions",
        "files_processed": len(files),
        "struct_files_found": len(struct_data),
        "source_files": [str(f) for f in files]
    }
    
    # Build final JSON structure
    result = {
        "metadata": metadata,
        "struct_definitions": struct_data
    }
    
    # Write to file
    output_file.parent.mkdir(parents=True, exist_ok=True)
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(result, f, indent=2, ensure_ascii=False)
    
    print(f"✅ Generated struct definitions file: {output_file}")
    print(f"📊 Statistics:")
    print(f"   • Files processed: {len(files)}")
    print(f"   • Files with structs: {len(struct_data)}")
    
    # Show sample of what was found
    if struct_data:
        print(f"📋 Sample files with struct definitions:")
        for i, item in enumerate(struct_data[:3]):
            file_name = Path(item["file"]).name
            struct_count = item["all_struct_definitions"].count("struct ") + item["all_struct_definitions"].count("union ")
            print(f"   • {file_name}: ~{struct_count} definitions")
        
        if len(struct_data) > 3:
            print(f"   ... and {len(struct_data) - 3} more files")
    
    return result


def main():
    """Main function for the struct extraction tool"""
    parser = argparse.ArgumentParser(
        description="Extract struct definitions from kernel .i files",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Extract from entire source directory
  python -m src.preprocess.struct_tool --source-dir data/kernel_sources/nxp -o nxp_structs.json
  
  # Extract from specific files
  python -m src.preprocess.struct_tool --files file1.i file2.i -o structs.json
  
  # Extract from multiple directories
  python -m src.preprocess.struct_tool --source-dir data/kernel_sources/nxp --source-dir data/kernel_sources/ti -o combined_structs.json
        """
    )
    
    parser.add_argument(
        '--source-dir', 
        action='append',
        help="Source directory to scan for .i files (can be used multiple times)"
    )
    parser.add_argument(
        '--files', 
        nargs='*',
        help="Specific .i files to process"
    )
    parser.add_argument(
        '-o', '--output', 
        required=True,
        help="Output JSON file path"
    )
    
    args = parser.parse_args()
    
    # Collect all files to process
    files_to_process = []
    
    # Add files from source directories
    if args.source_dir:
        for source_dir_str in args.source_dir:
            source_dir = Path(source_dir_str)
            if not source_dir.exists():
                print(f"❌ Source directory does not exist: {source_dir}")
                sys.exit(1)
            
            i_files = find_i_files(source_dir)
            files_to_process.extend(i_files)
            print(f"🔍 Found {len(i_files)} .i files in {source_dir}")
    
    # Add specific files
    if args.files:
        for file_str in args.files:
            file_path = Path(file_str)
            if not file_path.exists():
                print(f"❌ File does not exist: {file_path}")
                sys.exit(1)
            files_to_process.append(file_path)
    
    if not files_to_process:
        print("❌ No .i files found to process")
        print("Use --source-dir to scan directories or --files to specify individual files")
        sys.exit(1)
    
    # Remove duplicates while preserving order
    files_to_process = list(dict.fromkeys(files_to_process))
    
    # Generate the struct JSON
    output_path = Path(args.output)
    try:
        generate_struct_json(files_to_process, output_path)
        print(f"🎉 Struct extraction completed successfully!")
    except Exception as e:
        print(f"❌ Error generating struct JSON: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
