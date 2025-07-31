#!/usr/bin/env python3
"""
Enhanced core coordination module for multi-type instrumentation

This module provides the main facade for the enhanced instrumentation system
that supports DMA APIs, user copy operations, and function entries.
"""

import sys
from typing import Set, Optional
from pathlib import Path

try:
    from .parsing.parser import TreeSitterParser
    from .analyzers.multi_analyzer import MultiAnalyzer
    from .instrumenters.multi_instrumenter import MultiInstrumenter as CoreMultiInstrumenter
except ImportError:
    from parsing.parser import TreeSitterParser
    from analyzers.multi_analyzer import MultiAnalyzer
    from instrumenters.multi_instrumenter import MultiInstrumenter as CoreMultiInstrumenter


class EnhancedDirectoryProcessor:
    """Enhanced directory processor for multi-type instrumentation"""
    
    def __init__(self, instrumenter: CoreMultiInstrumenter):
        """Initialize with multi-instrumenter"""
        self.instrumenter = instrumenter

    def _should_skip_file(self, file_path: Path) -> bool:
        """Check if file should be skipped based on patterns"""
        skip_patterns = ['.backup', '.orig', '.tmp', '/build/', '/.git/', '__pycache__', '.o', '.ko', '.so']
        path_str = str(file_path)
        return any(pattern in path_str for pattern in skip_patterns)
    
    def _find_c_files(self, directory: Path, max_files: Optional[int] = None) -> list[Path]:
        """Find all C files in directory recursively"""
        c_files = []
        for file_path in directory.rglob("*.c"):
            if not self._should_skip_file(file_path):
                c_files.append(file_path)
                if max_files and len(c_files) >= max_files:
                    break
        return c_files

    def process_directory(self, directory_path: str, dry_run: bool = False, max_files: Optional[int] = None) -> None:
        """Process all C files in a directory with multi-type instrumentation"""
        directory = Path(directory_path)
        
        if not directory.exists():
            print(f"Error: Directory {directory_path} does not exist")
            return
        
        # Print processing header
        print(f"Processing directory: {directory_path}")
        print(f"DRY RUN: {dry_run}")
        if max_files:
            print(f"Limited to first {max_files} files for testing")
        print("-" * 60)
        
        # Find all C files to process
        c_files = self._find_c_files(directory, max_files)
        
        if not c_files:
            print("No C files found in the directory")
            return
        
        print(f"Found {len(c_files)} C files to process")
        print("-" * 60)
        
        # Initialize counters
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
        
        # Print summary
        print("\n" + "=" * 60)
        print(f"SUMMARY:")
        print(f"- Processed files: {processed_files}")
        print(f"- Instrumented files: {instrumented_files}")
        print(f"- Success rate: {instrumented_files/processed_files*100:.1f}%" if processed_files > 0 else "- Success rate: 0%")
        print("=" * 60)


class MultiInstrumenter:
    """
    Main coordination class for multi-type instrumentation operations
    
    This facade coordinates all components for comprehensive instrumentation
    of DMA calls, user copy operations, and function entries.
    """
    
    def __init__(self, enabled_types: Set[str]):
        """
        Initialize the multi-type instrumenter
        
        Args:
            enabled_types: Set of instrumentation type names to enable
                          ('dma', 'user_copy', 'functions')
        """
        self.enabled_types = enabled_types
        
        try:
            # Initialize the tree-sitter parser
            self.parser = TreeSitterParser()
            
            # Initialize the multi-analyzer
            self.analyzer = MultiAnalyzer(self.parser, enabled_types)
            
            # Initialize the multi-instrumenter 
            self.instrumenter = CoreMultiInstrumenter(self.analyzer, enabled_types)
            
            # Initialize the enhanced directory processor
            self.directory_processor = EnhancedDirectoryProcessor(self.instrumenter)
            
            print("✓ Enhanced Multi-Type Instrumenter initialized successfully")
            print(f"✓ Enabled types: {', '.join(sorted(enabled_types))}")
            
        except Exception as e:
            print(f"Failed to initialize Multi-Type Instrumenter: {e}")
            sys.exit(1)

    def process_directory(self, directory_path: str, dry_run: bool = False, max_files: Optional[int] = None) -> None:
        """
        Process all C files in a directory with multi-type instrumentation
        
        Args:
            directory_path: Path to directory containing C files to instrument
            dry_run: If True, preview changes without modifying files
            max_files: Optional limit on number of files to process
        """
        self.directory_processor.process_directory(directory_path, dry_run, max_files)
