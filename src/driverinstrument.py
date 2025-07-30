#!/usr/bin/env python3
"""
Linux Kernel Module DMA Instrumentation Tool

This script recursively processes C files in a given directory and instruments
them by adding print statements before DMA allocation API calls.
"""

import os
import sys
import argparse
import shutil
import re
from pathlib import Path

# Try tree-sitter first, fall back to regex if it fails
USE_TREE_SITTER = False

try:
    import tree_sitter
    print("✓ tree-sitter imported successfully")
    
    try:
        import tree_sitter_c as tsc
        print("✓ tree-sitter-c imported successfully")
        
        # Test the API to see what works
        try:
            # Try modern API
            language = tree_sitter.Language(tsc.language())
            parser = tree_sitter.Parser(language)
            print("✓ Tree-sitter modern API working")
            USE_TREE_SITTER = True
        except Exception as e1:
            try:
                # Try older API
                language = tree_sitter.Language(tsc.language(), "c")
                parser = tree_sitter.Parser()
                parser.set_language(language)
                print("✓ Tree-sitter legacy API working")
                USE_TREE_SITTER = True
            except Exception as e2:
                print(f"❌ Both tree-sitter APIs failed: {e1}, {e2}")
                print("🔄 Falling back to regex-based parsing")
                USE_TREE_SITTER = False
                
    except ImportError:
        print("❌ tree-sitter-c not available, falling back to regex")
        USE_TREE_SITTER = False
        
except ImportError:
    print("❌ tree-sitter not available, using regex-based parsing")
    USE_TREE_SITTER = False


class DMAInstrumenterTreeSitter:
    """Tree-sitter based instrumenter"""
    
    def __init__(self):
        # Initialize tree-sitter parser for C
        try:
            # Try modern API first
            self.language = tree_sitter.Language(tsc.language())
            self.parser = tree_sitter.Parser(self.language)
            print("✓ Using modern tree-sitter API")
        except:
            # Fall back to legacy API
            self.language = tree_sitter.Language(tsc.language(), "c")
            self.parser = tree_sitter.Parser()
            self.parser.set_language(self.language)
            print("✓ Using legacy tree-sitter API")
        
        self.dma_apis = {
            'dma_alloc_coherent', 'dma_alloc_attrs', 'dma_alloc_wc',
            'dma_alloc_noncoherent', 'dma_zalloc_coherent',
            'pci_alloc_consistent', 'pci_zalloc_consistent',
            'dmam_alloc_coherent', 'dmam_alloc_attrs',
            'dma_pool_alloc', 'dma_pool_zalloc',
            '__dma_alloc_coherent', 'arm_dma_alloc',
            'dma_map_single', 'dma_map_page', 'dma_map_sg',
        }
        self.modifications = []

    def get_text_from_node(self, node, source_bytes):
        return source_bytes[node.start_byte:node.end_byte].decode('utf-8')

    def is_dma_allocation_call(self, node, source_bytes):
        if node.type != 'call_expression':
            return False
            
        function_node = node.child_by_field_name('function')
        if not function_node:
            return False
            
        if function_node.type == 'identifier':
            func_name = self.get_text_from_node(function_node, source_bytes)
            return func_name in self.dma_apis
        elif function_node.type == 'field_expression':
            field_node = function_node.child_by_field_name('field')
            if field_node:
                func_name = self.get_text_from_node(field_node, source_bytes)
                return func_name in self.dma_apis
        return False

    def find_dma_calls(self, node, source_bytes, results):
        if self.is_dma_allocation_call(node, source_bytes):
            results.append(node)
        for child in node.children:
            self.find_dma_calls(child, source_bytes, results)

    def get_function_name_from_node(self, call_node, source_bytes):
        function_node = call_node.child_by_field_name('function')
        if not function_node:
            return "unknown"
        if function_node.type == 'identifier':
            return self.get_text_from_node(function_node, source_bytes)
        elif function_node.type == 'field_expression':
            field_node = function_node.child_by_field_name('field')
            if field_node:
                return self.get_text_from_node(field_node, source_bytes)
        return "unknown_dma_func"

    def find_dma_calls_in_file(self, source_code):
        try:
            source_bytes = bytes(source_code, 'utf8')
            tree = self.parser.parse(source_bytes)
            
            dma_calls = []
            self.find_dma_calls(tree.root_node, source_bytes, dma_calls)
            
            results = []
            for call_node in dma_calls:
                func_name = self.get_function_name_from_node(call_node, source_bytes)
                line_number = call_node.start_point[0]
                results.append({
                    'line_number': line_number,
                    'function_name': func_name,
                    'node': call_node
                })
            
            return results
        except Exception as e:
            print(f"Tree-sitter parsing failed: {e}")
            return []


class DMAInstrumenterRegex:
    """Regex-based instrumenter (fallback)"""
    
    def __init__(self):
        self.dma_apis = [
            'dma_alloc_coherent', 'dma_alloc_attrs', 'dma_alloc_wc',
            'dma_alloc_noncoherent', 'dma_zalloc_coherent',
            'pci_alloc_consistent', 'pci_zalloc_consistent',
            'dmam_alloc_coherent', 'dmam_alloc_attrs',
            'dma_pool_alloc', 'dma_pool_zalloc',
            '__dma_alloc_coherent', 'arm_dma_alloc',
            'dma_map_single', 'dma_map_page', 'dma_map_sg',
            'dma_sync_single_for_cpu', 'dma_sync_single_for_device',
            'dma_sync_sg_for_cpu', 'dma_sync_sg_for_device',
        ]
        
        # Create regex pattern for function calls
        api_pattern = '|'.join(re.escape(api) for api in self.dma_apis)
        self.function_call_pattern = re.compile(
            rf'^(\s*).*?\b({api_pattern})\s*\(',
            re.MULTILINE
        )
        self.modifications = []

    def find_dma_calls_in_file(self, source_code):
        """Find all DMA allocation calls using regex"""
        matches = []
        
        for match in self.function_call_pattern.finditer(source_code):
            line_start = source_code.rfind('\n', 0, match.start()) + 1
            line_end = source_code.find('\n', match.end())
            if line_end == -1:
                line_end = len(source_code)
            
            line_number = source_code[:match.start()].count('\n')
            indentation = match.group(1)
            function_name = match.group(2)
            full_line = source_code[line_start:line_end]
            
            # Skip if this line is already instrumented
            if 'DMA_INSTRUMENT' in full_line:
                continue
                
            # Skip if this is inside a comment
            line_before_call = source_code[line_start:match.start()]
            if '/*' in line_before_call and '*/' not in line_before_call:
                continue
            if '//' in line_before_call:
                continue
                
            matches.append({
                'line_number': line_number,
                'function_name': function_name,
                'indentation': indentation,
            })
        
        return matches


class DMAInstrumenter:
    """Main instrumenter that uses either tree-sitter or regex"""
    
    def __init__(self):
        if USE_TREE_SITTER:
            try:
                self.engine = DMAInstrumenterTreeSitter()
                print("✓ Using tree-sitter for parsing")
            except Exception as e:
                print(f"Failed to initialize tree-sitter: {e}")
                print("🔄 Falling back to regex parsing")
                self.engine = DMAInstrumenterRegex()
        else:
            self.engine = DMAInstrumenterRegex()
            print("✓ Using regex-based parsing")
        
        self.modifications = []

    def get_indentation(self, source_lines, line_number):
        """Get the indentation of a given line"""
        if line_number < len(source_lines):
            line = source_lines[line_number]
            return len(line) - len(line.lstrip())
        return 0

    def instrument_file(self, file_path, dry_run=False):
        """Instrument a single C file with DMA allocation logging"""
        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                source_code = f.read()
        except Exception as e:
            print(f"Error reading {file_path}: {e}")
            return False

        if not source_code.strip():
            return False

        # Find all DMA allocation calls
        dma_calls = self.engine.find_dma_calls_in_file(source_code)
        
        if not dma_calls:
            return False

        print(f"Found {len(dma_calls)} DMA allocation calls in {file_path}")
        
        # Sort calls by line number (reverse order to maintain line numbers during insertion)
        dma_calls.sort(key=lambda x: x['line_number'], reverse=True)
        
        # Convert source to lines for easier manipulation
        source_lines = source_code.split('\n')
        
        modifications_made = 0
        
        for call_info in dma_calls:
            line_number = call_info['line_number']
            function_name = call_info['function_name']
            
            # Get indentation
            if 'indentation' in call_info:
                indent_str = call_info['indentation']
            else:
                indent = self.get_indentation(source_lines, line_number)
                indent_str = ' ' * indent
            
            # Check if line is already instrumented
            if line_number > 0 and len(source_lines) > line_number - 1:
                if 'DMA_INSTRUMENT' in source_lines[line_number - 1]:
                    print(f"  - Skipping {function_name} at line {line_number + 1} (already instrumented)")
                    continue
            
            # Create the instrumentation line
            instrumentation = f'{indent_str}printk(KERN_INFO "DMA_INSTRUMENT: About to call {function_name} at %s:%d\\n", __FILE__, __LINE__);'
            
            # Insert the instrumentation line before the DMA call
            if line_number < len(source_lines):
                source_lines.insert(line_number, instrumentation)
                modifications_made += 1
                print(f"  - Instrumented {function_name} at line {line_number + 1}")
        
        if modifications_made > 0:
            modified_source = '\n'.join(source_lines)
            
            if not dry_run:
                # Create backup
                backup_path = f"{file_path}.backup"
                if not os.path.exists(backup_path):
                    shutil.copy2(file_path, backup_path)
                
                # Write modified source
                try:
                    with open(file_path, 'w', encoding='utf-8') as f:
                        f.write(modified_source)
                    print(f"  - Successfully instrumented {file_path}")
                    
                    self.modifications.append({
                        'file': file_path,
                        'backup': backup_path,
                        'changes': modifications_made
                    })
                    
                except Exception as e:
                    print(f"Error writing {file_path}: {e}")
                    return False
            else:
                print(f"  - DRY RUN: Would instrument {modifications_made} locations in {file_path}")
        
        return modifications_made > 0

    def should_skip_file(self, file_path):
        """Check if file should be skipped"""
        skip_patterns = [
            '.backup', '.orig', '.tmp', '/build/', '/.git/',
            '__pycache__', '.o', '.ko', '.so'
        ]
        path_str = str(file_path)
        return any(pattern in path_str for pattern in skip_patterns)

    def process_directory(self, directory_path, dry_run=False, max_files=None):
        """Recursively process all C files in a directory"""
        directory = Path(directory_path)
        
        if not directory.exists():
            print(f"Error: Directory {directory_path} does not exist")
            return
        
        print(f"Processing directory: {directory_path}")
        print(f"DRY RUN: {dry_run}")
        print("-" * 60)
        
        c_files = []
        for file_path in directory.rglob("*.c"):
            if not self.should_skip_file(file_path):
                c_files.append(file_path)
                if max_files and len(c_files) >= max_files:
                    print(f"Limited to first {max_files} files for testing")
                    break
        
        if not c_files:
            print("No C files found in the directory")
            return
        
        print(f"Found {len(c_files)} C files to process")
        print("-" * 60)
        
        processed_files = 0
        instrumented_files = 0
        
        for file_path in c_files:
            processed_files += 1
            print(f"\n[{processed_files}/{len(c_files)}] Processing: {file_path}")
            
            try:
                if self.instrument_file(file_path, dry_run):
                    instrumented_files += 1
            except Exception as e:
                print(f"  - Error processing file: {e}")
                continue
        
        print("\n" + "=" * 60)
        print(f"SUMMARY:")
        print(f"- Processed files: {processed_files}")
        print(f"- Instrumented files: {instrumented_files}")
        print(f"- Total modifications: {sum(mod['changes'] for mod in self.modifications)}")


def main():
    parser = argparse.ArgumentParser(
        description="Instrument Linux kernel module C files with DMA allocation logging",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    
    parser.add_argument('directory', help='Directory containing kernel module source code')
    parser.add_argument('--dry-run', '-n', action='store_true',
                        help='Preview changes without modifying files')
    parser.add_argument('--test-limit', type=int, metavar='N',
                        help='Limit processing to first N files (for testing)')
    
    args = parser.parse_args()
    
    if not os.path.isdir(args.directory):
        print(f"Error: {args.directory} is not a valid directory")
        sys.exit(1)
    
    try:
        instrumenter = DMAInstrumenter()
        instrumenter.process_directory(args.directory, args.dry_run, args.test_limit)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()