#!/usr/bin/env python3
"""
Multi-type instrumenter that handles all instrumentation types
"""

import shutil
from pathlib import Path
from typing import List, Dict, Any, Set

from ..analyzers.multi_analyzer import MultiAnalyzer
from ..instrumentation_types import DMAInstrumentationType, UserCopyInstrumentationType, FunctionInstrumentationType


class MultiInstrumenter:
    """
    Handles instrumentation of C files with multiple instrumentation types
    
    This class coordinates instrumentation across different types:
    - DMA API calls
    - User space copy operations  
    - Function entry points
    """
    
    def __init__(self, analyzer: MultiAnalyzer, enabled_types: Set[str]):
        """
        Initialize the multi-instrumenter
        
        Args:
            analyzer: Configured MultiAnalyzer instance
            enabled_types: Set of enabled instrumentation type names
        """
        self.analyzer = analyzer
        self.enabled_types = enabled_types
        self.modifications: List[Dict[str, Any]] = []
        
        # Initialize instrumentation type configs
        self.type_configs = {}
        if 'dma' in enabled_types:
            self.type_configs['dma'] = DMAInstrumentationType()
        if 'user_copy' in enabled_types:
            self.type_configs['user_copy'] = UserCopyInstrumentationType()
        if 'functions' in enabled_types:
            self.type_configs['functions'] = FunctionInstrumentationType()

    # ============================================================================
    # UTILITY METHODS
    # ============================================================================

    def _is_already_instrumented(self, source_lines: List[str], line_number: int) -> bool:
        """Check if a line is already instrumented by looking for our markers"""
        if line_number > 0 and len(source_lines) > line_number - 1:
            prev_line = source_lines[line_number - 1]
            # Check for any of our instrumentation markers
            markers = ['DMA_INSTRUMENT', 'USER_COPY', 'FUNC_ENTRY']
            return any(marker in prev_line for marker in markers)
        return False

    def _create_instrumentation_line(self, item_info: Dict[str, Any]) -> str:
        """Create the instrumentation line for any instrumentation type"""
        function_name = item_info['function_name']
        item_type = item_info['instrumentation_type']
        indentation = item_info.get('indentation', '    ')
        
        # Get the appropriate template
        if item_type == 'dma_call':
            template = self.type_configs['dma'].template
        elif item_type == 'user_copy':
            template = self.type_configs['user_copy'].template
        elif item_type == 'function_entry':
            template = self.type_configs['functions'].template
        else:
            return f"{indentation}/* Unknown instrumentation type: {item_type} */"
        
        instrumentation = template.format(function_name=function_name)
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

    def _has_required_headers(self, source_lines: List[str]) -> bool:
        """Check if the source file already has required headers for instrumentation"""
        source_text = '\n'.join(source_lines[:50])  # Check first 50 lines
        
        # Check for existing kernel headers or our marker
        has_kernel_h = '#include <linux/kernel.h>' in source_text
        has_printk_h = '#include <linux/printk.h>' in source_text
        has_our_marker = '/* MULTI_INSTRUMENT: Auto-added headers */' in source_text
        
        return has_our_marker or has_kernel_h or has_printk_h

    def _get_all_required_headers(self) -> List[str]:
        """Get all required headers for enabled instrumentation types"""
        all_headers = set()
        
        for type_name in self.enabled_types:
            if type_name in self.type_configs:
                config = self.type_configs[type_name]
                all_headers.update(config.required_headers)
        
        return sorted(list(all_headers))

    def _add_required_headers(self, source_lines: List[str]) -> int:
        """Add required headers for instrumentation to the source file"""
        if self._has_required_headers(source_lines):
            return 0
        
        # Find the best location to insert headers
        insert_line = 0
        for i, line in enumerate(source_lines):
            stripped = line.strip()
            if not stripped or stripped.startswith('/*') or stripped.startswith('//') or stripped.startswith('*'):
                continue
            if stripped.startswith('#include'):
                insert_line = i
                break
            if stripped.startswith('#') or stripped:
                insert_line = i
                break
        
        # Build header block
        header_lines = [
            '',  # Empty line before
            '/* MULTI_INSTRUMENT: Auto-added headers */'
        ]
        
        # Add all required headers
        for header in self._get_all_required_headers():
            header_lines.append(header)
        
        header_lines.append('')  # Empty line after
        
        # Insert headers
        for i, header_line in enumerate(header_lines):
            source_lines.insert(insert_line + i, header_line)
        
        return len(header_lines)

    def _should_skip_instrumentation(self, source_lines: List[str], line_number: int) -> bool:
        """Check if we should skip instrumentation for this line"""
        if line_number < 0 or line_number >= len(source_lines):
            return True
        return self._is_already_instrumented(source_lines, line_number)

    # ============================================================================
    # MAIN INSTRUMENTATION METHOD
    # ============================================================================

    def instrument_file(self, file_path: Path, dry_run: bool = False) -> bool:
        """
        Instrument a single C file with selected instrumentation types
        
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

        # Find all instrumentable items
        analysis_results = self.analyzer.find_all_instrumentable_items(source_code)
        total_items = self.analyzer.get_total_items_count(analysis_results)
        
        if total_items == 0:
            return False

        summary = self.analyzer.get_summary_string(analysis_results)
        print(f"Found {summary} in {file_path}")
        
        # Combine all items and sort by line number in reverse order
        all_items = []
        for item_type, items in analysis_results.items():
            for item in items:
                item['instrumentation_type'] = item.get('instrumentation_type', item_type)
                all_items.append(item)
        
        # Sort by line number in reverse order to avoid line number shifts
        all_items.sort(key=lambda x: x['line_number'], reverse=True)
        
        source_lines = source_code.split('\n')
        
        # Add required headers if instrumentation will be performed
        header_lines_added = 0
        if total_items > 0:
            header_lines_added = self._add_required_headers(source_lines)
            if header_lines_added > 0:
                print(f"  ✓ Added {header_lines_added} header lines for instrumentation support")
                # Adjust line numbers for added headers
                for item in all_items:
                    item['line_number'] += header_lines_added
                    if 'call_line_number' in item:
                        item['call_line_number'] += header_lines_added
                    if 'def_line_number' in item:
                        item['def_line_number'] += header_lines_added
        
        modifications_made = header_lines_added
        
        # Process each instrumentable item
        for item_info in all_items:
            line_number = item_info['line_number']
            function_name = item_info['function_name']
            item_type = item_info.get('instrumentation_type', 'unknown')
            strategy = item_info.get('instrumentation_strategy', 'before_call')
            
            # Skip if already instrumented or invalid
            if self._should_skip_instrumentation(source_lines, line_number):
                print(f"  - Skipping {item_type} {function_name} at line {line_number + 1} (already instrumented)")
                continue
            
            # All strategies now result in instrumentation - no more skipping
            instrumentation = self._create_instrumentation_line(item_info)
            source_lines.insert(line_number, instrumentation)
            modifications_made += 1
            
            # More descriptive output based on strategy
            if strategy == 'before_statement_in_preprocessor':
                print(f"  ✓ Instrumented {item_type} {function_name} at line {line_number + 1} (in preprocessor block)")
            elif strategy == 'before_preprocessor_block':
                print(f"  ✓ Instrumented {item_type} {function_name} at line {line_number + 1} (before preprocessor block)")
            elif strategy == 'before_conditional':
                print(f"  ✓ Instrumented {item_type} {function_name} at line {line_number + 1} (before conditional)")
            elif strategy == 'before_statement':
                print(f"  ✓ Instrumented {item_type} {function_name} at line {line_number + 1} (before statement)")
            elif strategy == 'before_assignment':
                print(f"  ✓ Instrumented {item_type} {function_name} at line {line_number + 1} (before assignment)")
            else:
                print(f"  ✓ Instrumented {item_type} {function_name} at line {line_number + 1}")
        
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

    def instrument_code(self, source_code: str, analysis_results: Dict[str, List[Dict[str, Any]]]) -> str:
        """
        Instrument source code based on analysis results
        
        Args:
            source_code: Original source code string
            analysis_results: Dictionary of analysis results from MultiAnalyzer
            
        Returns:
            str: Instrumented source code
        """
        # Combine all items and sort by line number in reverse order
        all_items = []
        for item_type, items in analysis_results.items():
            for item in items:
                item['instrumentation_type'] = item.get('instrumentation_type', item_type)
                all_items.append(item)
        
        # Sort by line number in reverse order to avoid line number shifts
        all_items.sort(key=lambda x: x['line_number'], reverse=True)
        
        source_lines = source_code.split('\n')
        
        # Add required headers if instrumentation will be performed
        total_items = sum(len(items) for items in analysis_results.values())
        header_lines_added = 0
        if total_items > 0:
            header_lines_added = self._add_required_headers(source_lines)
            # Adjust line numbers for added headers
            for item in all_items:
                item['line_number'] += header_lines_added
                if 'call_line_number' in item:
                    item['call_line_number'] += header_lines_added
                if 'def_line_number' in item:
                    item['def_line_number'] += header_lines_added
        
        # Process each instrumentable item
        for item_info in all_items:
            line_number = item_info['line_number']
            function_name = item_info['function_name']
            item_type = item_info.get('instrumentation_type', 'unknown')
            strategy = item_info.get('instrumentation_strategy', 'before_call')
            
            # Skip if already instrumented or invalid
            if self._should_skip_instrumentation(source_lines, line_number):
                continue
            
            # Handle different instrumentation strategies
            if strategy == 'skip_preprocessor':
                continue
            
            # Normal case - add instrumentation before the statement
            instrumentation = self._create_instrumentation_line(item_info)
            source_lines.insert(line_number, instrumentation)
        
        return '\n'.join(source_lines)
