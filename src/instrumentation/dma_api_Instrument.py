#!/usr/bin/env python3
"""
Linux Kernel Module DMA Instrumentation Tool

This script recursively processes C files in a given directory and instruments
them by adding print statements before DMA allocation API calls.

The tool uses tree-sitter to parse C files and identify DMA API calls, then
adds instrumentation code before each call to track memory allocations.
"""

import os
import sys
import argparse
import shutil
from pathlib import Path
from typing import List, Dict, Any, Optional

try:
    import tree_sitter
    import tree_sitter_c as tsc
    TREE_SITTER_AVAILABLE = True
except ImportError as e:
    print(f"❌ Tree-sitter not available: {e}")
    print("This tool requires tree-sitter and tree-sitter-c to be installed.")
    print("Please install them with: pip install tree_sitter tree_sitter-c")
    sys.exit(1)


class DMAAPIConfig:
    """Configuration class for DMA API definitions and instrumentation settings"""
    
    # Comprehensive list of DMA APIs to instrument
    DMA_APIS = {
        # Allocation APIs
        'dma_alloc_coherent', 'dma_alloc_attrs', 'dma_alloc_wc',
        'dma_alloc_noncoherent', 'dma_zalloc_coherent',
        'pci_alloc_consistent', 'pci_zalloc_consistent',
        'dmam_alloc_coherent', 'dmam_alloc_attrs',
        '__dma_alloc_coherent', 'arm_dma_alloc',

        # DMA Pool APIs
        'dma_pool_create', 'dma_pool_destroy',
        'dma_pool_alloc', 'dma_pool_zalloc', 'dma_pool_free',

        # Mapping APIs (Streaming)
        'dma_map_single', 'dma_unmap_single',
        'dma_map_page', 'dma_unmap_page',
        'dma_map_sg', 'dma_unmap_sg',
        'dma_sync_single_for_cpu', 'dma_sync_single_for_device',
        'dma_sync_sg_for_cpu', 'dma_sync_sg_for_device',
        'dma_mapping_error',

        # dma-buf APIs (Shared Buffers)
        'dma_buf_export', 'dma_buf_fd', 'dma_buf_get', 'dma_buf_put',
        'dma_buf_attach', 'dma_buf_detach',
        'dma_buf_map_attachment', 'dma_buf_unmap_attachment',
        'dma_buf_begin_cpu_access', 'dma_buf_end_cpu_access',
        'dma_buf_begin_cpu_access_partial', 'dma_buf_end_cpu_access_partial',
        'dma_buf_mmap', 'dma_buf_kmap', 'dma_buf_kunmap',
        'dma_buf_kmap_atomic', 'dma_buf_kunmap_atomic',
        'dma_buf_vmap', 'dma_buf_vunmap',

        # DMA Engine APIs
        'dma_request_channel', 'dma_release_channel',
        'dmaengine_submit', 'dma_async_issue_pending',
        'dmaengine_prep_slave_single', 'dmaengine_prep_slave_sg',
        'dmaengine_prep_interleaved_dma', 'dmaengine_prep_dma_memcpy',
        'dmaengine_prep_dma_cyclic',
        'dmaengine_terminate_all',
        'dmaengine_desc_get_callback',
        'dmaengine_desc_set_callback', 'dmaengine_desc_set_callback_param',

        # Misc DMA APIs
        'dma_supported', 'dma_get_cache_alignment',
        'dma_set_mask', 'dma_set_coherent_mask',
        'dma_get_required_mask',
        'dma_get_sgtable', 'dma_mmap_attrs',
    }

    # File and directory patterns to skip during processing
    SKIP_PATTERNS = [
        '.backup', '.orig', '.tmp', '/build/', '/.git/',
        '__pycache__', '.o', '.ko', '.so'
    ]
    
    # Template for the instrumentation code to insert before DMA calls
    INSTRUMENTATION_TEMPLATE = 'printk(KERN_INFO "DMA_INSTRUMENT: About to call {function_name} at %s:%d\\n", __FILE__, __LINE__);'


class TreeSitterParser:
    """Handles tree-sitter parsing initialization and operations for C code"""
    
    def __init__(self):
        """Initialize the tree-sitter parser for C language"""
        self.language = None
        self.parser = None
        self._initialize_parser()
    
    def _initialize_parser(self) -> None:
        """Initialize tree-sitter parser for C with fallback to legacy API"""
        try:
            # Try modern tree-sitter API first
            self.language = tree_sitter.Language(tsc.language())
            self.parser = tree_sitter.Parser(self.language)
            print("✓ Using modern tree-sitter API")
        except Exception:
            try:
                # Fall back to legacy API if modern API fails
                self.language = tree_sitter.Language(tsc.language(), "c")
                self.parser = tree_sitter.Parser()
                self.parser.set_language(self.language)
                print("✓ Using legacy tree-sitter API")
            except Exception as e:
                raise RuntimeError(f"Failed to initialize tree-sitter parser: {e}")
    
    def parse(self, source_code: str) -> tree_sitter.Tree:
        """Parse source code and return the Abstract Syntax Tree (AST)"""
        if not self.parser:
            raise RuntimeError("Parser not initialized")
        return self.parser.parse(bytes(source_code, 'utf8'))


class DMACallAnalyzer:
    """Analyzes C code to find DMA API calls using tree-sitter AST parsing"""
    
    def __init__(self, parser: TreeSitterParser):
        """Initialize analyzer with a configured tree-sitter parser"""
        self.parser = parser
        self.dma_apis = DMAAPIConfig.DMA_APIS

    def get_text_from_node(self, node: tree_sitter.Node, source_bytes: bytes) -> str:
        """Extract text content from a tree-sitter node"""
        return source_bytes[node.start_byte:node.end_byte].decode('utf-8')

    def is_dma_allocation_call(self, node: tree_sitter.Node, source_bytes: bytes) -> bool:
        """Check if a node represents a DMA allocation call"""
        if node.type != 'call_expression':
            return False
        
        function_node = node.child_by_field_name('function')
        if not function_node:
            return False
        
        function_name = self.get_text_from_node(function_node, source_bytes)
        return function_name in self.dma_apis
    
    def _is_inside_preprocessor_conditional(self, node: tree_sitter.Node) -> bool:
        """Check if the node is inside a preprocessor conditional block"""
        current = node
        while current:
            if current.type in ('preproc_if', 'preproc_ifdef', 'preproc_elif', 'preproc_else'):
                return True
            current = current.parent
        return False

    def _is_inside_assignment(self, node: tree_sitter.Node) -> bool:
        """Check if the node is the right-hand side of an assignment"""
        current = node
        while current and current.parent:
            parent = current.parent
            if parent.type == 'assignment_expression':
                # Check if we're the right-hand side (not the left-hand side)
                right_node = parent.child_by_field_name('right')
                if right_node and self._node_contains(right_node, current):
                    return True
            current = parent
        return False
    
    def _node_contains(self, parent: tree_sitter.Node, child: tree_sitter.Node) -> bool:
        """Check if parent node contains child node"""
        return (parent.start_byte <= child.start_byte and 
                parent.end_byte >= child.end_byte)

    def _find_assignment_start(self, call_node: tree_sitter.Node) -> Optional[tree_sitter.Node]:
        """Find the assignment statement that contains this DMA call"""
        current = call_node
        while current and current.parent:
            parent = current.parent
            if parent.type == 'assignment_expression':
                # Find the statement containing this assignment
                assignment_stmt = parent
                while assignment_stmt and assignment_stmt.parent:
                    if assignment_stmt.parent.type == 'expression_statement':
                        return assignment_stmt.parent
                    assignment_stmt = assignment_stmt.parent
                return parent
            current = parent
        return None

    def get_function_name_from_node(self, call_node: tree_sitter.Node, source_bytes: bytes) -> Optional[str]:
        """Extract function name from a call expression node"""
        function_node = call_node.child_by_field_name('function')
        if function_node:
            return self.get_text_from_node(function_node, source_bytes)
        return None

    def _find_dma_calls_recursive(self, node: tree_sitter.Node, source_bytes: bytes, 
                                results: List[Dict[str, Any]], in_condition: bool = False) -> None:
        """Recursively traverse the AST to find all DMA allocation calls"""
        
        if node.type == 'if_statement':
            condition_node = node.child_by_field_name('condition')
            if condition_node:
                self._find_dma_calls_recursive(condition_node, source_bytes, results, True)
            
            consequence = node.child_by_field_name('consequence')
            if consequence:
                self._find_dma_calls_recursive(consequence, source_bytes, results, in_condition)
            
            alternative = node.child_by_field_name('alternative')
            if alternative:
                self._find_dma_calls_recursive(alternative, source_bytes, results, in_condition)
            return
            
        elif self.is_dma_allocation_call(node, source_bytes):
            function_name = self.get_function_name_from_node(node, source_bytes)
            if function_name:
                # Check context
                in_preprocessor = self._is_inside_preprocessor_conditional(node)
                in_assignment = self._is_inside_assignment(node)
                assignment_start = self._find_assignment_start(node) if in_assignment else None
                
                # Determine instrumentation location
                target_line = node.start_point[0]  # Default to call line
                instrumentation_strategy = 'before_call'
                
                if in_assignment and assignment_start:
                    # For assignments, instrument before the assignment
                    target_line = assignment_start.start_point[0]
                    instrumentation_strategy = 'before_assignment'
                elif in_preprocessor:
                    # For preprocessor conditionals, use inline strategy
                    instrumentation_strategy = 'inline_with_temp'
                
                results.append({
                    'node': node,
                    'function_name': function_name,
                    'line_number': target_line,
                    'call_line_number': node.start_point[0],
                    'column': node.start_point[1],
                    'in_condition': in_condition,
                    'in_preprocessor': in_preprocessor,
                    'in_assignment': in_assignment,
                    'instrumentation_strategy': instrumentation_strategy,
                })
        
        for child in node.children:
            self._find_dma_calls_recursive(child, source_bytes, results, in_condition)

    def find_dma_calls_in_file(self, source_code: str) -> List[Dict[str, Any]]:
        """Find all DMA allocation calls in a source file"""
        try:
            tree = self.parser.parse(source_code)
            source_bytes = bytes(source_code, 'utf8')
            
            results = []
            self._find_dma_calls_recursive(tree.root_node, source_bytes, results)
            
            source_lines = source_code.split('\n')
            formatted_results = []
            
            for call_info in results:
                line_number = call_info['line_number']
                if line_number < len(source_lines):
                    line = source_lines[line_number]
                    indentation = ' ' * (len(line) - len(line.lstrip()))
                    
                    formatted_results.append({
                        'function_name': call_info['function_name'],
                        'line_number': line_number,
                        'call_line_number': call_info['call_line_number'],
                        'column': call_info['column'],
                        'indentation': indentation,
                        'in_condition': call_info.get('in_condition', False),
                        'in_preprocessor': call_info.get('in_preprocessor', False),
                        'in_assignment': call_info.get('in_assignment', False),
                        'instrumentation_strategy': call_info.get('instrumentation_strategy', 'before_call'),
                    })
            
            return formatted_results
            
        except Exception as e:
            print(f"Error parsing source code: {e}")
            return []


class FileInstrumenter:
    """Handles the actual instrumentation of C files by adding print statements"""
    
    def __init__(self, analyzer: DMACallAnalyzer):
        """Initialize the file instrumenter with a DMA call analyzer"""
        self.analyzer = analyzer
        self.modifications: List[Dict[str, Any]] = []
    
    def _is_already_instrumented(self, source_lines: List[str], line_number: int) -> bool:
        """Check if a line is already instrumented by looking for our marker"""
        if line_number > 0 and len(source_lines) > line_number - 1:
            return 'DMA_INSTRUMENT' in source_lines[line_number - 1]
        return False
    
    def _create_instrumentation_line(self, function_name: str, indentation: str) -> str:
        """Create the instrumentation line for a DMA function call"""
        instrumentation = DMAAPIConfig.INSTRUMENTATION_TEMPLATE.format(function_name=function_name)
        return f"{indentation}{instrumentation}"
    
    def _create_backup(self, file_path: Path) -> Path:
        """Create a backup of the original file before modification"""
        backup_path = Path(f"{file_path}.backup")
        if not backup_path.exists():
            shutil.copy2(file_path, backup_path)
        return backup_path
    
    def _get_line_indentation(self, source_lines: List[str], line_number: int) -> str:
        """Get the indentation string of a given line"""
        if line_number < len(source_lines):
            line = source_lines[line_number]
            return line[:len(line) - len(line.lstrip())]
        return ""

    def _instrument_with_temp_variable(self, source_lines: List[str], call_info: Dict[str, Any]) -> bool:
        """Instrument DMA calls inside assignments using temporary variable approach"""
        call_line_number = call_info['call_line_number']
        function_name = call_info['function_name']
        
        if call_line_number >= len(source_lines):
            return False
            
        # Find the line with the DMA call
        original_line = source_lines[call_line_number]
        base_indent = self._get_line_indentation(source_lines, call_line_number)
        
        # Create instrumentation with same indentation as the call
        instrumentation = self._create_instrumentation_line(function_name, base_indent)
        
        # Insert instrumentation before the DMA call line
        source_lines.insert(call_line_number, instrumentation)
        
        return True

    def _is_single_statement_after_control(self, source_lines: List[str], line_number: int) -> bool:
        """Check if this line is a single statement after if/else/while/for without braces"""
        if line_number <= 0:
            return False
            
        prev_line = source_lines[line_number - 1].strip()
        
        control_patterns = ['if (', 'else if (', 'else', 'while (', 'for (', 'do']
        
        for pattern in control_patterns:
            if prev_line.startswith(pattern):
                if not prev_line.endswith('{') and not prev_line.endswith(';'):
                    return True
                    
        return False

    def _wrap_with_braces(self, source_lines: List[str], line_number: int, function_name: str, base_indent: str) -> None:
        """Wrap a single statement with braces to include instrumentation"""
        original_line = source_lines[line_number]
        instrumentation = self._create_instrumentation_line(function_name, base_indent + "    ")
        
        prev_line = source_lines[line_number - 1]
        if not prev_line.rstrip().endswith('{'):
            source_lines[line_number - 1] = prev_line.rstrip() + " {"
        
        source_lines.insert(line_number, instrumentation)
        source_lines[line_number + 1] = base_indent + "    " + original_line.lstrip()
        source_lines.insert(line_number + 2, base_indent + "}")

    def _should_skip_instrumentation(self, source_lines: List[str], line_number: int) -> bool:
        """Check if we should skip instrumentation for this line"""
        if line_number < 0 or line_number >= len(source_lines):
            return True
            
        if self._is_already_instrumented(source_lines, line_number):
            return True
            
        return False

    def instrument_file(self, file_path: Path, dry_run: bool = False) -> bool:
        """Instrument a single C file with DMA allocation logging"""
        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                source_code = f.read()
        except Exception as e:
            print(f"Error reading {file_path}: {e}")
            return False

        if not source_code.strip():
            return False

        dma_calls = self.analyzer.find_dma_calls_in_file(source_code)
        
        if not dma_calls:
            return False

        print(f"Found {len(dma_calls)} DMA allocation calls in {file_path}")
        
        # Sort calls by line number in reverse order
        dma_calls.sort(key=lambda x: x['line_number'], reverse=True)
        
        source_lines = source_code.split('\n')
        modifications_made = 0
        
        for call_info in dma_calls:
            line_number = call_info['line_number']
            function_name = call_info['function_name']
            strategy = call_info.get('instrumentation_strategy', 'before_call')
            
            if self._should_skip_instrumentation(source_lines, line_number):
                print(f"  - Skipping {function_name} at line {line_number + 1} (already instrumented)")
                continue
            
            base_indent = self._get_line_indentation(source_lines, line_number)
            
            # Handle different instrumentation strategies
            if strategy == 'inline_with_temp' or call_info.get('in_preprocessor', False):
                # For preprocessor conditionals or assignments, use temp variable approach
                if self._instrument_with_temp_variable(source_lines, call_info):
                    modifications_made += 1
                    print(f"  ✓ Instrumented {function_name} (inline) at line {call_info['call_line_number'] + 1}")
                    
            elif self._is_single_statement_after_control(source_lines, line_number):
                # Handle single statements after control structures
                self._wrap_with_braces(source_lines, line_number, function_name, base_indent)
                modifications_made += 1
                print(f"  ✓ Wrapped {function_name} with braces at line {line_number + 1}")
                
            else:
                # Normal case - add instrumentation before the statement
                instrumentation = self._create_instrumentation_line(function_name, base_indent)
                source_lines.insert(line_number, instrumentation)
                modifications_made += 1
                print(f"  ✓ Instrumented {function_name} at line {line_number + 1}")
        
        # Write the modified file
        if modifications_made > 0:
            modified_source = '\n'.join(source_lines)
            
            if not dry_run:
                backup_path = self._create_backup(file_path)
                
                try:
                    with open(file_path, 'w', encoding='utf-8') as f:
                        f.write(modified_source)
                    print(f"  ✓ Successfully instrumented {file_path} with {modifications_made} changes")
                    
                    self.modifications.append({
                        'file': str(file_path),
                        'backup': str(backup_path),
                        'changes': modifications_made
                    })
                    
                except Exception as e:
                    print(f"Error writing {file_path}: {e}")
                    return False
            else:
                print(f"  - DRY RUN: Would instrument {modifications_made} locations in {file_path}")
        
        return modifications_made > 0


class DirectoryProcessor:
    """Handles processing of directories and file filtering"""
    
    def __init__(self, instrumenter: FileInstrumenter):
        """Initialize directory processor with a file instrumenter"""
        self.instrumenter = instrumenter
    
    def _should_skip_file(self, file_path: Path) -> bool:
        """Check if file should be skipped based on configured patterns"""
        path_str = str(file_path)
        return any(pattern in path_str for pattern in DMAAPIConfig.SKIP_PATTERNS)
    
    def _find_c_files(self, directory: Path, max_files: Optional[int] = None) -> List[Path]:
        """Find all C files in directory recursively, respecting skip patterns
        
        Args:
            directory: Directory to search
            max_files: Optional limit on number of files to return (for testing)
            
        Returns:
            List of C file paths to process
        """
        c_files = []
        for file_path in directory.rglob("*.c"):
            if not self._should_skip_file(file_path):
                c_files.append(file_path)
                if max_files and len(c_files) >= max_files:
                    print(f"Limited to first {max_files} files for testing")
                    break
        return c_files
    
    def process_directory(self, directory_path: str, dry_run: bool = False, max_files: Optional[int] = None) -> None:
        """Recursively process all C files in a directory
        
        Args:
            directory_path: Path to directory containing C files
            dry_run: If True, preview changes without modifying files
            max_files: Optional limit on number of files to process
        """
        directory = Path(directory_path)
        
        if not directory.exists():
            print(f"Error: Directory {directory_path} does not exist")
            return
        
        print(f"Processing directory: {directory_path}")
        print(f"DRY RUN: {dry_run}")
        print("-" * 60)
        
        # Find all C files to process
        c_files = self._find_c_files(directory, max_files)
        
        if not c_files:
            print("No C files found in the directory")
            return
        
        print(f"Found {len(c_files)} C files to process")
        print("-" * 60)
        
        processed_files = 0
        instrumented_files = 0
        
        # Process each file
        for file_path in c_files:
            processed_files += 1
            print(f"\n[{processed_files}/{len(c_files)}] Processing: {file_path}")
            
            try:
                if self.instrumenter.instrument_file(file_path, dry_run):
                    instrumented_files += 1
            except Exception as e:
                print(f"  - Error processing file: {e}")
                continue
        
        # Print summary of what was accomplished
        self._print_summary(processed_files, instrumented_files)
    
    def _print_summary(self, processed_files: int, instrumented_files: int) -> None:
        """Print a summary of the processing results"""
        print("\n" + "=" * 60)
        print(f"SUMMARY:")
        print(f"- Processed files: {processed_files}")
        print(f"- Instrumented files: {instrumented_files}")
        print(f"- Total modifications: {sum(mod['changes'] for mod in self.instrumenter.modifications)}")


class DMAInstrumenter:
    """Main instrumenter class that coordinates all components"""
    
    def __init__(self):
        """Initialize the DMA instrumenter with all necessary components"""
        try:
            # Initialize the tree-sitter parser for C code
            self.parser = TreeSitterParser()
            
            # Initialize the analyzer to find DMA calls
            self.analyzer = DMACallAnalyzer(self.parser)
            
            # Initialize the file instrumenter to add print statements
            self.file_instrumenter = FileInstrumenter(self.analyzer)
            
            # Initialize the directory processor for batch operations
            self.directory_processor = DirectoryProcessor(self.file_instrumenter)
            
            print("✓ DMA Instrumenter initialized successfully")
        except Exception as e:
            print(f"Failed to initialize DMA Instrumenter: {e}")
            sys.exit(1)

    def process_directory(self, directory_path: str, dry_run: bool = False, max_files: Optional[int] = None) -> None:
        """Process a directory using the directory processor
        
        Args:
            directory_path: Path to directory containing C files to instrument
            dry_run: If True, preview changes without modifying files
            max_files: Optional limit on number of files to process
        """
        self.directory_processor.process_directory(directory_path, dry_run, max_files)


def main():
    """Main entry point for the DMA instrumentation tool"""
    parser = argparse.ArgumentParser(
        description="""Instrument Linux kernel module C files with DMA allocation logging.
        
        This tool adds instrumentation code before DMA API calls to track memory allocations.
        It uses tree-sitter to parse C files and identify DMA function calls, then inserts
        printk statements before each call to log when DMA operations occur.
        
        The tool processes all .c files in the specified directory recursively and creates
        backup files (.backup) before making any modifications.""",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    
    parser.add_argument(
        'directory',
        help='Directory containing kernel module source code to instrument'
    )
    parser.add_argument(
        '--dry-run', '-n',
        action='store_true',
        help='Preview changes without modifying files'
    )
    parser.add_argument(
        '--test-limit',
        type=int,
        metavar='N',
        help='Limit processing to first N files (for testing)'
    )
    
    args = parser.parse_args()
    
    try:
        # Initialize the instrumenter
        instrumenter = DMAInstrumenter()
        
        # Process the specified directory
        instrumenter.process_directory(
            args.directory,
            dry_run=args.dry_run,
            max_files=args.test_limit
        )
        
    except KeyboardInterrupt:
        print("\nOperation cancelled by user.")
        sys.exit(1)
    except Exception as e:
        print(f"\nError: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()