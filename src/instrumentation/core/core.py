#!/usr/bin/env python3
"""
Main DMA instrumenter coordinator module

This module provides the main facade class that coordinates all DMA instrumentation
components and provides a unified interface for clients.
"""

import sys
from typing import Optional

from ..parsing import TreeSitterParser
from ..analysis import DMACallAnalyzer
from ..instrumentation import FileInstrumenter
from .processor import DirectoryProcessor


class DMAInstrumenter:
    """
    Main coordination class for DMA instrumentation operations
    
    This is the top-level facade class that coordinates all DMA instrumentation
    components and provides a simple interface for clients. It follows the
    Facade design pattern to hide the complexity of the individual components
    and provide a unified API for DMA instrumentation tasks.
    
    Architecture Overview:
    - Facade Pattern: Simplifies interaction with complex subsystem
    - Composition: Aggregates parser, analyzer, instrumenter, and processor
    - Initialization: Sets up complete toolchain with error handling
    - Delegation: Forwards operations to appropriate component
    
    Component Hierarchy:
    DMAInstrumenter (facade)
    ├── TreeSitterParser (C code parsing)
    ├── DMACallAnalyzer (AST analysis and call detection)
    ├── FileInstrumenter (source code modification)
    └── DirectoryProcessor (batch file processing)
    
    Usage Examples:
        # Initialize and process a directory
        instrumenter = DMAInstrumenter()
        instrumenter.process_directory("/kernel/drivers")
        
        # Process with dry-run mode
        instrumenter.process_directory("/kernel/drivers", dry_run=True)
    """
    
    def __init__(self):
        """
        Initialize the DMA instrumenter with all necessary components
        
        Sets up the complete toolchain for DMA instrumentation including:
        - Tree-sitter parser for C code parsing
        - DMA call analyzer for finding function calls
        - File instrumenter for code modification
        - Directory processor for batch operations
        
        Raises:
            SystemExit: If any component fails to initialize properly
        """
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

    def process_directory(self, directory_path: str, dry_run: bool = False, max_files: Optional[int] = None, instrument_functions: bool = True) -> None:
        """
        Process all C files in a directory for DMA and function instrumentation
        
        This is the main entry point for batch instrumentation operations.
        It delegates to the DirectoryProcessor to handle the actual work
        while providing a clean interface for clients.
        
        Args:
            directory_path: Path to directory containing C files to instrument
            dry_run: If True, preview changes without modifying files
            max_files: Optional limit on number of files to process (for testing)
            instrument_functions: If True, also instrument function entries
        """
        self.directory_processor.process_directory(directory_path, dry_run, max_files, instrument_functions)
