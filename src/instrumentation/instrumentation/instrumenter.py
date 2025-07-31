#!/usr/bin/env python3
"""
File instrumentation module

This module handles the actual instrumentation of C files by adding print
statements before DMA API calls. It supports various instrumentation strategies
based on the context analysis provided by the analyzer.
"""

import shutil
from pathlib import Path
from typing import List, Dict, Any

from ..config import DMAAPIConfig
from ..analysis import DMACallAnalyzer


class FileInstrumenter:
    """
    Handles the actual instrumentation of C files by adding print statements
    
    This class is responsible for:
    - Applying instrumentation strategies determined by DMACallAnalyzer
    - Handling different code contexts (preprocessor, assignments, multi-line calls)
    - Creating backup files before modification
    - Managing file I/O operations
    - Tracking modifications made to files
    
    The instrumenter supports multiple instrumentation strategies:
    - Normal instrumentation before function calls
    - Special handling for preprocessor conditionals
    - Assignment-aware instrumentation
    - Multi-line call handling
    - Control structure wrapping with braces
    """
    
    def __init__(self, analyzer: DMACallAnalyzer):
        """
        Initialize the file instrumenter with a DMA call analyzer
        
        Args:
            analyzer: Configured DMACallAnalyzer instance
        """
        self.analyzer = analyzer
        self.modifications: List[Dict[str, Any]] = []

    # ============================================================================
    # UTILITY METHODS - Helper functions for instrumentation
    # ============================================================================

    def _is_already_instrumented(self, source_lines: List[str], line_number: int) -> bool:
        """
        Check if a line is already instrumented by looking for our markers
        
        This prevents duplicate instrumentation when running the tool multiple times.
        
        Args:
            source_lines: List of source code lines
            line_number: Line number to check
            
        Returns:
            bool: True if already instrumented, False otherwise
        """
        if line_number > 0 and len(source_lines) > line_number - 1:
            prev_line = source_lines[line_number - 1]
            return 'DMA_INSTRUMENT' in prev_line or 'FUNC_ENTRY' in prev_line
        return False
    
    def _create_instrumentation_line(self, function_name: str, indentation: str) -> str:
        """
        Create the instrumentation line for a DMA function call
        
        Args:
            function_name: Name of the DMA function being instrumented
            indentation: Indentation string to match surrounding code
            
        Returns:
            str: Formatted instrumentation code
        """
        instrumentation = DMAAPIConfig.INSTRUMENTATION_TEMPLATE.format(function_name=function_name)
        return f"{indentation}{instrumentation}"

    def _create_function_entry_line(self, function_name: str, indentation: str) -> str:
        """
        Create the instrumentation line for function entry logging
        
        Args:
            function_name: Name of the function being instrumented
            indentation: Indentation string to match surrounding code
            
        Returns:
            str: Formatted function entry instrumentation code
        """
        instrumentation = DMAAPIConfig.FUNCTION_ENTRY_TEMPLATE.format(function_name=function_name)
        return f"{indentation}{instrumentation}"
    
    def _create_backup(self, file_path: Path) -> Path:
        """
        Create a backup of the original file before modification
        
        Args:
            file_path: Path to the file to backup
            
        Returns:
            Path: Path to the created backup file
        """
        backup_path = Path(f"{file_path}.backup")
        if not backup_path.exists():
            shutil.copy2(file_path, backup_path)
        return backup_path
    
    def _get_line_indentation(self, source_lines: List[str], line_number: int) -> str:
        """
        Get the indentation string of a given line
        
        Args:
            source_lines: List of source code lines
            line_number: Line number to get indentation from
            
        Returns:
            str: Indentation string (spaces/tabs)
        """
        if line_number < len(source_lines):
            line = source_lines[line_number]
            return line[:len(line) - len(line.lstrip())]
        return ""

    def _has_required_headers(self, source_lines: List[str]) -> bool:
        """
        Check if the source file already has the required headers for instrumentation
        
        Args:
            source_lines: List of source code lines
            
        Returns:
            bool: True if headers are present, False otherwise
        """
        source_text = '\n'.join(source_lines[:50])  # Check first 50 lines for headers
        
        # Check for existing printk-related headers
        has_kernel_h = '#include <linux/kernel.h>' in source_text
        has_printk_h = '#include <linux/printk.h>' in source_text
        has_our_marker = DMAAPIConfig.HEADER_MARKER in source_text
        
        # If we already added headers, or if kernel.h is present, consider it sufficient
        return has_our_marker or has_kernel_h or has_printk_h

    def _add_required_headers(self, source_lines: List[str]) -> int:
        """
        Add required headers for instrumentation to the source file
        
        This method adds the necessary kernel headers at the appropriate location
        in the source file to ensure instrumentation code compiles properly.
        
        Args:
            source_lines: List of source code lines to modify
            
        Returns:
            int: Number of lines added (for adjusting line numbers)
        """
        if self._has_required_headers(source_lines):
            return 0
        
        # Find the best location to insert headers
        insert_line = 0
        
        # Skip initial comments and find the first include or after license header
        for i, line in enumerate(source_lines):
            stripped = line.strip()
            
            # Skip empty lines and comments at the top
            if not stripped or stripped.startswith('/*') or stripped.startswith('//') or stripped.startswith('*'):
                continue
                
            # If we find an existing include, insert before it
            if stripped.startswith('#include'):
                insert_line = i
                break
                
            # If we find other preprocessor directives or code, insert before them
            if stripped.startswith('#') or stripped:
                insert_line = i
                break
        
        # Build header block to insert
        header_lines = [
            '',  # Empty line before our headers
            DMAAPIConfig.HEADER_MARKER
        ]
        
        # Add each required header
        for header in DMAAPIConfig.REQUIRED_HEADERS:
            header_lines.append(header)
        
        header_lines.append('')  # Empty line after our headers
        
        # Insert headers at the determined location
        for i, header_line in enumerate(header_lines):
            source_lines.insert(insert_line + i, header_line)
        
        return len(header_lines)

    # ============================================================================
    # SPECIALIZED INSTRUMENTATION HANDLERS
    # ============================================================================

    def _handle_preprocessor_assignment(self, source_lines: List[str], call_info: Dict[str, Any]) -> bool:
        """
        Handle DMA calls inside preprocessor conditional assignments
        
        This handles complex cases like:
        var = 
        #if condition
            dma_alloc_coherent(...)
        #else
            dma_alloc_wc(...)
        #endif
        
        Strategy: Find the assignment line before the preprocessor block
        and add instrumentation there to avoid breaking syntax.
        
        Args:
            source_lines: List of source code lines
            call_info: Information about the DMA call
            
        Returns:
            bool: True if successfully instrumented, False otherwise
        """
        function_name = call_info['function_name']
        line_number = call_info['line_number']
        
        # Find the assignment line (should be before the preprocessor block)
        assignment_line = -1
        for i in range(line_number - 1, max(0, line_number - 10), -1):
            line = source_lines[i].strip()
            if '=' in line and not line.startswith('#'):
                assignment_line = i
                break
        
        if assignment_line == -1:
            return False
        
        # Add instrumentation before the assignment
        base_indent = self._get_line_indentation(source_lines, assignment_line)
        instrumentation = self._create_instrumentation_line(function_name, base_indent)
        
        # Insert instrumentation before the assignment line
        source_lines.insert(assignment_line, instrumentation)
        
        return True

    def _instrument_with_temp_variable(self, source_lines: List[str], call_info: Dict[str, Any]) -> bool:
        """
        Instrument DMA calls inside assignments using temporary variable approach
        
        This method is used when normal instrumentation would break the
        assignment syntax. It inserts instrumentation immediately before
        the DMA call line.
        
        Args:
            source_lines: List of source code lines
            call_info: Information about the DMA call
            
        Returns:
            bool: True if successfully instrumented, False otherwise
        """
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
        """
        Check if this line is a single statement after if/else/while/for without braces
        
        This detects patterns like:
        if (condition)
            dma_alloc_coherent(...);
        
        Which need to be wrapped with braces for instrumentation.
        
        Args:
            source_lines: List of source code lines
            line_number: Line number to check
            
        Returns:
            bool: True if single statement after control, False otherwise
        """
        if line_number <= 0:
            return False
            
        prev_line = source_lines[line_number - 1].strip()
        
        control_patterns = ['if (', 'else if (', 'else', 'while (', 'for (', 'do']
        
        for pattern in control_patterns:
            if prev_line.startswith(pattern):
                if not prev_line.endswith('{') and not prev_line.endswith(';'):
                    return True
                    
        return False

    def _handle_multiline_call_in_conditional(self, source_lines: List[str], call_info: Dict[str, Any]) -> bool:
        """
        Handle multi-line DMA calls inside conditional statements
        
        This handles cases where a multi-line function call appears
        inside a conditional without braces:
        
        if (condition)
            dma_alloc_coherent(device,
                               size,
                               &handle,
                               flags);
        
        Strategy: Add braces around the entire multi-line call.
        
        Args:
            source_lines: List of source code lines
            call_info: Information about the DMA call
            
        Returns:
            bool: True if successfully handled, False otherwise
        """
        line_number = call_info['line_number']
        call_end_line = call_info.get('call_end_line', call_info['call_line_number'])
        function_name = call_info['function_name']
        
        # Check if this is inside a conditional without braces
        if line_number > 0:
            prev_line = source_lines[line_number - 1].strip()
            control_patterns = ['if (', 'else if (', 'else', 'while (', 'for (']
            
            is_conditional = any(prev_line.startswith(pattern) for pattern in control_patterns)
            has_braces = prev_line.endswith('{')
            
            if is_conditional and not has_braces:
                # Add opening brace to the conditional line
                source_lines[line_number - 1] = source_lines[line_number - 1].rstrip() + ' {'
                
                # Add instrumentation at the beginning of the block
                base_indent = self._get_line_indentation(source_lines, line_number - 1)
                instrumentation = self._create_instrumentation_line(function_name, base_indent + "    ")
                source_lines.insert(line_number, instrumentation)
                
                # Add closing brace after the complete function call
                # Find the line after the function call ends
                closing_brace_line = call_end_line + 2  # +1 for the inserted instrumentation, +1 for after the call
                source_lines.insert(closing_brace_line, base_indent + '}')
                
                return True
        
        return False

    def _wrap_with_braces(self, source_lines: List[str], line_number: int, function_name: str, base_indent: str) -> None:
        """
        Wrap a single statement with braces to include instrumentation
        
        This transforms:
        if (condition)
            dma_alloc_coherent(...);
        
        Into:
        if (condition) {
            // instrumentation
            dma_alloc_coherent(...);
        }
        
        Args:
            source_lines: List of source code lines
            line_number: Line number of the statement
            function_name: Name of the DMA function
            base_indent: Base indentation level
        """
        original_line = source_lines[line_number]
        instrumentation = self._create_instrumentation_line(function_name, base_indent + "    ")
        
        prev_line = source_lines[line_number - 1]
        if not prev_line.rstrip().endswith('{'):
            source_lines[line_number - 1] = prev_line.rstrip() + " {"
        
        source_lines.insert(line_number, instrumentation)
        source_lines[line_number + 1] = base_indent + "    " + original_line.lstrip()
        source_lines.insert(line_number + 2, base_indent + "}")

    def _should_skip_instrumentation(self, source_lines: List[str], line_number: int) -> bool:
        """
        Check if we should skip instrumentation for this line
        
        Args:
            source_lines: List of source code lines
            line_number: Line number to check
            
        Returns:
            bool: True if should skip, False otherwise
        """
        if line_number < 0 or line_number >= len(source_lines):
            return True
            
        if self._is_already_instrumented(source_lines, line_number):
            return True
            
        return False

    # ============================================================================
    # MAIN INSTRUMENTATION METHOD
    # ============================================================================

    def instrument_file(self, file_path: Path, dry_run: bool = False, instrument_functions: bool = True) -> bool:
        """
        Instrument a single C file with DMA allocation and function entry logging
        
        This is the main entry point for file instrumentation. It:
        1. Reads and analyzes the source file
        2. Finds all DMA calls and function definitions using the analyzer
        3. Applies appropriate instrumentation strategies
        4. Creates backups and writes modified files
        5. Tracks all modifications made
        
        Args:
            file_path: Path to the C file to instrument
            dry_run: If True, show what would be done without modifying files
            instrument_functions: If True, also instrument function entries
            
        Returns:
            bool: True if any modifications were made, False otherwise
        """
        try:
            # Read the source file
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                source_code = f.read()
        except Exception as e:
            print(f"Error reading {file_path}: {e}")
            return False

        # Skip empty files
        if not source_code.strip():
            return False

        # Find all instrumentable items in the file
        if instrument_functions:
            instrumentable_items = self.analyzer.find_all_instrumentable_items(source_code)
            dma_calls = instrumentable_items['dma_calls']
            functions = instrumentable_items['functions']
        else:
            # Fallback to DMA-only instrumentation
            dma_calls = self.analyzer.find_dma_calls_in_file(source_code)
            functions = []
        
        total_items = len(dma_calls) + len(functions)
        if total_items == 0:
            return False

        print(f"Found {len(dma_calls)} DMA calls and {len(functions)} functions in {file_path}")
        
        # Combine all items and sort by line number in reverse order to avoid line number shifts
        all_items = []
        
        # Add DMA calls
        for call_info in dma_calls:
            call_info['item_type'] = 'dma_call'
            all_items.append(call_info)
        
        # Add function definitions
        for func_info in functions:
            func_info['item_type'] = 'function_entry'
            all_items.append(func_info)
        
        # Sort by line number in reverse order
        all_items.sort(key=lambda x: x['line_number'], reverse=True)
        
        source_lines = source_code.split('\n')
        
        # Add required headers if instrumentation will be performed
        header_lines_added = 0
        if total_items > 0:
            header_lines_added = self._add_required_headers(source_lines)
            if header_lines_added > 0:
                print(f"  ✓ Added {header_lines_added} header lines for instrumentation support")
                # Adjust line numbers for all items since we added headers at the top
                for item in all_items:
                    item['line_number'] += header_lines_added
                    if 'call_line_number' in item:
                        item['call_line_number'] += header_lines_added
                    if 'call_end_line' in item:
                        item['call_end_line'] += header_lines_added
                    if 'def_line_number' in item:
                        item['def_line_number'] += header_lines_added
        
        modifications_made = header_lines_added
        
        # Process each instrumentable item with appropriate strategy
        for item_info in all_items:
            line_number = item_info['line_number']
            function_name = item_info['function_name']
            item_type = item_info['item_type']
            strategy = item_info.get('instrumentation_strategy', 'before_call')
            
            # Skip if already instrumented or invalid
            if self._should_skip_instrumentation(source_lines, line_number):
                print(f"  - Skipping {item_type} {function_name} at line {line_number + 1} (already instrumented)")
                continue
            
            base_indent = self._get_line_indentation(source_lines, line_number)
            
            # Handle function entry instrumentation
            if item_type == 'function_entry':
                instrumentation = self._create_function_entry_line(function_name, item_info.get('indentation', base_indent))
                source_lines.insert(line_number, instrumentation)
                modifications_made += 1
                print(f"  ✓ Instrumented function entry {function_name} at line {line_number + 1}")
                continue
            
            # Handle DMA call instrumentation (existing logic)
            # Apply instrumentation strategy based on context analysis
            if strategy == 'skip_preprocessor':
                # Skip instrumentation for problematic preprocessor cases
                print(f"  - Skipping {function_name} at line {line_number + 1} (inside preprocessor conditional)")
                continue
                
            elif strategy == 'before_preprocessor_assignment':
                # Handle DMA calls in preprocessor conditional assignments
                if self._handle_preprocessor_assignment(source_lines, item_info):
                    modifications_made += 1
                    print(f"  ✓ Instrumented {function_name} before preprocessor assignment at line {line_number + 1}")
                else:
                    # Fallback: skip this case
                    print(f"  - Skipping {function_name} at line {line_number + 1} (complex preprocessor case)")
                    
            elif strategy == 'inline_with_temp' or item_info.get('in_preprocessor', False):
                # For other preprocessor conditionals, skip to avoid syntax errors
                print(f"  - Skipping {function_name} at line {line_number + 1} (inside preprocessor block)")
                
            elif item_info.get('is_multiline', False) and self._is_single_statement_after_control(source_lines, line_number):
                # Handle multi-line calls in conditional statements
                if self._handle_multiline_call_in_conditional(source_lines, item_info):
                    modifications_made += 1
                    print(f"  ✓ Instrumented multi-line {function_name} in conditional at line {line_number + 1}")
                else:
                    # Fallback to regular instrumentation
                    instrumentation = self._create_instrumentation_line(function_name, base_indent)
                    source_lines.insert(line_number, instrumentation)
                    modifications_made += 1
                    print(f"  ✓ Instrumented {function_name} at line {line_number + 1}")
                    
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
        
        # Write the modified file or show dry-run results
        if modifications_made > 0:
            modified_source = '\n'.join(source_lines)
            
            if not dry_run:
                # Create backup and write modified file
                backup_path = self._create_backup(file_path)
                
                try:
                    with open(file_path, 'w', encoding='utf-8') as f:
                        f.write(modified_source)
                    print(f"  ✓ Instrumented {modifications_made} locations, backup saved as {backup_path.name}")
                except Exception as e:
                    print(f"  ✗ Error writing instrumented file: {e}")
                    return False
            else:
                print(f"  - DRY RUN: Would instrument {modifications_made} locations in {file_path}")
        
        return modifications_made > 0
