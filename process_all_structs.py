#!/usr/bin/env python3
"""
Process all JSON files with Function Entries, DMA Operations, User Copy Operations, 
and IOCTL handlers to extract and add struct definitions from associated .i files.
"""

import json
import os
import sys
from pathlib import Path
from typing import Dict, List, Set, Optional
from dataclasses import asdict
import argparse

# Add src to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from src.preprocess.utils.struct_extractor import StructExtractor, StructDefinition, extract_structs_by_file

class StructProcessor:
    """Process JSON files to add struct definitions from related .i files"""
    
    def __init__(self, data_dir: str = "data", source_dir: str = "data/kernel_sources"):
        self.data_dir = Path(data_dir)
        self.source_dir = Path(source_dir)
        self.struct_extractor = StructExtractor()
        
    def find_related_i_files(self, file_paths: Set[str]) -> List[Path]:
        """Find .i files related to the given source file paths"""
        i_files = []
        
        # Search for .i files in kernel_sources directory
        for root, dirs, files in os.walk(self.source_dir):
            for file in files:
                if file.endswith('.i'):
                    i_file_path = Path(root) / file
                    
                    # Check if this .i file is related to any of our source files
                    for source_path in file_paths:
                        if self._is_related_file(source_path, str(i_file_path)):
                            i_files.append(i_file_path)
                            break
        
        return i_files
    
    def _is_related_file(self, source_path: str, i_file_path: str) -> bool:
        """Check if a source file is related to a .i file"""
        source_name = Path(source_path).stem
        i_file_name = Path(i_file_path).stem
        
        # Direct match
        if source_name == i_file_name:
            return True
        
        # Check if they're in similar directory structures
        source_parts = Path(source_path).parts
        i_file_parts = Path(i_file_path).parts
        
        # Look for common directory patterns or file name patterns
        for part in source_parts:
            if part in i_file_parts:
                return True
        
        return False
    
    def extract_file_paths_from_operations(self, json_data: Dict) -> Set[str]:
        """Extract all file paths from function entries, DMA ops, user copy ops, and IOCTL ops"""
        file_paths = set()
        
        # From functions_by_file
        if 'functions_by_file' in json_data:
            file_paths.update(json_data['functions_by_file'].keys())
        
        # From function_entries (fallback)
        if 'function_entries' in json_data:
            for entry in json_data['function_entries']:
                if 'file_path' in entry:
                    file_paths.add(entry['file_path'])
        
        # From DMA operations
        if 'dma_operations' in json_data:
            for dma in json_data['dma_operations']:
                if 'file_path' in dma:
                    file_paths.add(dma['file_path'])
        
        # From user copy operations
        if 'user_copy_operations' in json_data:
            for copy_op in json_data['user_copy_operations']:
                if 'file_path' in copy_op:
                    file_paths.add(copy_op['file_path'])
        
        # From IOCTL operations
        if 'ioctl_operations' in json_data:
            for ioctl in json_data['ioctl_operations']:
                if 'file_path' in ioctl:
                    file_paths.add(ioctl['file_path'])
        
        return file_paths
    
    def process_json_file(self, json_file_path: Path) -> bool:
        """Process a single JSON file to add struct definitions"""
        print(f"Processing {json_file_path.name}...")
        
        # Load JSON data
        try:
            with open(json_file_path, 'r') as f:
                data = json.load(f)
        except Exception as e:
            print(f"  ❌ Error loading JSON file: {e}")
            return False
        
        # Check if it has any of our target operation types
        has_operations = any(key in data for key in [
            'function_entries', 'functions_by_file', 
            'dma_operations', 'user_copy_operations', 'ioctl_operations'
        ])
        
        if not has_operations:
            print(f"  ⏭️  No relevant operations found, skipping")
            return False
        
        # Count operations
        func_count = len(data.get('function_entries', [])) + sum(
            len(funcs) for funcs in data.get('functions_by_file', {}).values()
        )
        dma_count = len(data.get('dma_operations', []))
        copy_count = len(data.get('user_copy_operations', []))
        ioctl_count = len(data.get('ioctl_operations', []))
        
        print(f"  📊 Operations found:")
        print(f"     Functions: {func_count}")
        print(f"     DMA ops: {dma_count}")
        print(f"     User copy ops: {copy_count}")
        print(f"     IOCTL ops: {ioctl_count}")
        
        # Extract file paths from all operations
        file_paths = self.extract_file_paths_from_operations(data)
        print(f"  📁 Source files referenced: {len(file_paths)}")
        
        if not file_paths:
            print(f"  ⏭️  No file paths found, skipping")
            return False
        
        # Find related .i files
        i_files = self.find_related_i_files(file_paths)
        print(f"  🔍 Found {len(i_files)} related .i files")
        
        if not i_files:
            print(f"  ⚠️  No related .i files found")
            return False
        
        # Extract struct definitions grouped by file using the new format
        print(f"  📦 Extracting structs grouped by file...")
        struct_definitions_by_file = extract_structs_by_file([str(f) for f in i_files])
        
        if not struct_definitions_by_file:
            print(f"  ⚠️  No structs extracted from any files")
            return False
        
        print(f"  ✅ Found struct definitions in {len(struct_definitions_by_file)} files")
        
        # Add struct definitions to JSON data in new format
        data['struct_definitions'] = struct_definitions_by_file
        
        # Update metadata if it exists
        if 'metadata' in data:
            metadata = data['metadata']
            if 'struct_files_processed' not in metadata:
                metadata['struct_files_processed'] = []
            metadata['struct_files_processed'].extend([entry['file'] for entry in struct_definitions_by_file])
            metadata['total_struct_files'] = len(struct_definitions_by_file)
        
        # Update statistics if it exists
        if 'statistics' in data:
            stats = data['statistics']
            stats['struct_files_with_definitions'] = len(struct_definitions_by_file)
            stats['struct_files_processed'] = len(i_files)
        
        # Save updated JSON
        backup_path = json_file_path.with_suffix('.json.backup')
        try:
            # Create backup
            if not backup_path.exists():
                json_file_path.rename(backup_path)
                print(f"  💾 Backup created: {backup_path.name}")
            
            # Write updated file
            with open(json_file_path, 'w') as f:
                json.dump(data, f, indent=2)
            
            print(f"  ✅ Updated with struct definitions from {len(struct_definitions_by_file)} files")
            return True
            
        except Exception as e:
            # Restore backup if save failed
            if backup_path.exists():
                backup_path.rename(json_file_path)
            print(f"  ❌ Error saving file: {e}")
            return False
    
    def process_all_files(self) -> Dict[str, bool]:
        """Process all JSON files in the data directory"""
        results = {}
        
        json_files_dir = self.data_dir / "json_files"
        if not json_files_dir.exists():
            print(f"❌ Directory not found: {json_files_dir}")
            return results
        
        json_files = list(json_files_dir.glob("*.json"))
        if not json_files:
            print(f"❌ No JSON files found in {json_files_dir}")
            return results
        
        print(f"🚀 Processing {len(json_files)} JSON files...")
        print("=" * 60)
        
        for json_file in sorted(json_files):
            # Skip backup files
            if json_file.name.endswith('.backup'):
                continue
                
            success = self.process_json_file(json_file)
            results[json_file.name] = success
            print()
        
        return results

def main():
    parser = argparse.ArgumentParser(
        description="Process JSON files to add struct definitions from related .i files"
    )
    parser.add_argument(
        '--data-dir', 
        default='data', 
        help='Data directory containing json_files subdirectory (default: data)'
    )
    parser.add_argument(
        '--source-dir', 
        default='data/kernel_sources', 
        help='Source directory containing .i files (default: data/kernel_sources)'
    )
    parser.add_argument(
        '--file', 
        help='Process only a specific JSON file (e.g., coral_boot.json)'
    )
    parser.add_argument(
        '--dry-run', 
        action='store_true', 
        help='Show what would be processed without making changes'
    )
    
    args = parser.parse_args()
    
    processor = StructProcessor(args.data_dir, args.source_dir)
    
    if args.file:
        # Process single file
        json_path = Path(args.data_dir) / "json_files" / args.file
        if not json_path.exists():
            print(f"❌ File not found: {json_path}")
            return 1
        
        if args.dry_run:
            print(f"🔍 DRY RUN: Would process {json_path}")
            return 0
        
        success = processor.process_json_file(json_path)
        return 0 if success else 1
    else:
        # Process all files
        if args.dry_run:
            print("🔍 DRY RUN: Would process all JSON files in data/json_files/")
            json_files = list(Path(args.data_dir).glob("json_files/*.json"))
            for f in sorted(json_files):
                if not f.name.endswith('.backup'):
                    print(f"  - {f.name}")
            return 0
        
        results = processor.process_all_files()
        
        # Summary
        print("=" * 60)
        print("📋 PROCESSING SUMMARY")
        print("=" * 60)
        
        successful = sum(1 for success in results.values() if success)
        total = len(results)
        
        for filename, success in sorted(results.items()):
            status = "✅" if success else "❌"
            print(f"{status} {filename}")
        
        print(f"\n🎯 Successfully processed: {successful}/{total} files")
        return 0 if successful == total else 1

if __name__ == "__main__":
    sys.exit(main())
