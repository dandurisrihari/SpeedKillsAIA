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

from config import DMAAPIConfig
from analyzer import DMACallAnalyzer


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
        Check if a line is already instrumented by looking for our marker
        
        This prevents duplicate instrumentation when running the tool multiple times.
        
        Args:
            source_lines: List of source code lines
            line_number: Line number to check
            
        Returns:
            bool: True if already instrumented, False otherwise
        """
        if line_number > 0 and len(source_lines) > line_number - 1:
            return 'DMA_INSTRUMENT' in source_lines[line_number - 1]
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

    def instrument_file(self, file_path: Path, dry_run: bool = False) -> bool:
        """
        Instrument a single C file with DMA allocation logging
        
        This is the main entry point for file instrumentation. It:
        1. Reads and analyzes the source file
        2. Finds all DMA calls using the analyzer
        3. Applies appropriate instrumentation strategies
        4. Creates backups and writes modified files
        5. Tracks all modifications made
        
        Args:
            file_path: Path to the C file to instrument
            dry_run: If True, show what would be done without modifying files
            
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

        # Find all DMA calls in the file
        dma_calls = self.analyzer.find_dma_calls_in_file(source_code)
        
        if not dma_calls:
            return False

        print(f"Found {len(dma_calls)} DMA allocation calls in {file_path}")
        
        # Sort calls by line number in reverse order to avoid line number shifts
        dma_calls.sort(key=lambda x: x['line_number'], reverse=True)
        
        source_lines = source_code.split('\n')
        modifications_made = 0
        
        # Process each DMA call with appropriate strategy
        for call_info in dma_calls:
            line_number = call_info['line_number']
            function_name = call_info['function_name']
            strategy = call_info.get('instrumentation_strategy', 'before_call')
            
            # Skip if already instrumented or invalid
            if self._should_skip_instrumentation(source_lines, line_number):
                print(f"  - Skipping {function_name} at line {line_number + 1} (already instrumented)")
                continue
            
            base_indent = self._get_line_indentation(source_lines, line_number)
            
            # Apply instrumentation strategy based on context analysis
            if strategy == 'skip_preprocessor':
                # Skip instrumentation for problematic preprocessor cases
                print(f"  - Skipping {function_name} at line {line_number + 1} (inside preprocessor conditional)")
                continue
                
            elif strategy == 'before_preprocessor_assignment':
                # Handle DMA calls in preprocessor conditional assignments
                if self._handle_preprocessor_assignment(source_lines, call_info):
                    modifications_made += 1
                    print(f"  ✓ Instrumented {function_name} before preprocessor assignment at line {line_number + 1}")
                else:
                    # Fallback: skip this case
                    print(f"  - Skipping {function_name} at line {line_number + 1} (complex preprocessor case)")
                    
            elif strategy == 'inline_with_temp' or call_info.get('in_preprocessor', False):
                # For other preprocessor conditionals, skip to avoid syntax errors
                print(f"  - Skipping {function_name} at line {line_number + 1} (inside preprocessor block)")
                
            elif call_info.get('is_multiline', False) and self._is_single_statement_after_control(source_lines, line_number):
                # Handle multi-line calls in conditional statements
                if self._handle_multiline_call_in_conditional(source_lines, call_info):
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
                    print(f"  ✓ Successfully instrumented {file_path} with {modifications_made} changes")
                    
                    # Track this modification
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
