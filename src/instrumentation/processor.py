#!/usr/bin/env python3
"""
Directory processor module

This module handles batch processing of directory trees for DMA instrumentation.
It provides directory traversal, file filtering, and coordination of the
instrumentation process across multiple files.
"""

from pathlib import Path
from typing import List, Optional

from config import DMAAPIConfig
from instrumenter import FileInstrumenter


class DirectoryProcessor:
    """
    Handles batch processing of directory trees for DMA instrumentation
    
    This class provides high-level directory traversal and batch processing 
    capabilities for instrumenting multiple C files. It integrates with the
    FileInstrumenter to process entire source trees efficiently.
    
    Key Responsibilities:
    - Recursive directory scanning for C source files
    - File filtering based on configured skip patterns
    - Batch processing coordination with progress tracking
    - Error handling and reporting for directory operations
    - Processing statistics and summary reporting
    
    Architecture:
    - Composition pattern: Contains a FileInstrumenter instance
    - Template method pattern: Provides processing workflow
    - Strategy pattern: Different processing modes (dry-run vs actual)
    
    Usage Example:
        instrumenter = FileInstrumenter(analyzer)
        processor = DirectoryProcessor(instrumenter)
        processor.process_directory("/kernel/drivers", dry_run=True)
    """
    
    def __init__(self, instrumenter: FileInstrumenter):
        """
        Initialize directory processor with a file instrumenter
        
        Args:
            instrumenter: FileInstrumenter instance to use for processing files
        """
        self.instrumenter = instrumenter

    # ============================================================================
    # FILE FILTERING AND DISCOVERY METHODS
    # ============================================================================
    
    def _should_skip_file(self, file_path: Path) -> bool:
        """
        Check if file should be skipped based on configured patterns
        
        Uses the skip patterns defined in DMAAPIConfig to determine whether
        a file should be excluded from processing. This helps avoid processing
        test files, build artifacts, or other non-relevant source files.
        
        Args:
            file_path: Path to the file to check
            
        Returns:
            bool: True if file should be skipped, False otherwise
        """
        path_str = str(file_path)
        return any(pattern in path_str for pattern in DMAAPIConfig.SKIP_PATTERNS)
    
    def _find_c_files(self, directory: Path, max_files: Optional[int] = None) -> List[Path]:
        """
        Find all C files in directory recursively, respecting skip patterns
        
        Performs recursive traversal of the directory tree to find all .c files
        that should be processed. Applies skip patterns to exclude unwanted files
        and optionally limits the number of files returned for testing purposes.
        
        Args:
            directory: Directory to search
            max_files: Optional limit on number of files to return (for testing)
            
        Returns:
            List[Path]: List of C file paths to process
        """
        c_files = []
        for file_path in directory.rglob("*.c"):
            if not self._should_skip_file(file_path):
                c_files.append(file_path)
                if max_files and len(c_files) >= max_files:
                    print(f"Limited to first {max_files} files for testing")
                    break
        return c_files

    # ============================================================================
    # MAIN PROCESSING WORKFLOW
    # ============================================================================
    
    def process_directory(self, directory_path: str, dry_run: bool = False, max_files: Optional[int] = None) -> None:
        """
        Recursively process all C files in a directory with DMA instrumentation
        
        This is the main entry point for batch processing of source directories.
        It coordinates the entire workflow from file discovery through instrumentation
        and provides comprehensive progress reporting and error handling.
        
        Processing Workflow:
        1. Validate directory path and accessibility
        2. Discover all C files using recursive search with filtering
        3. Process each file through the FileInstrumenter
        4. Track progress and handle errors gracefully
        5. Generate summary report of all operations
        
        Args:
            directory_path: Path to directory containing C files to process
            dry_run: If True, preview changes without modifying files
            max_files: Optional limit on number of files to process (for testing)
            
        Features:
        - Progress tracking with file counters
        - Comprehensive error handling per file
        - Summary reporting of modifications made
        - Support for dry-run mode to preview changes
        """
        directory = Path(directory_path)
        
        # Validate directory exists and is accessible
        if not directory.exists():
            print(f"Error: Directory {directory_path} does not exist")
            return
        
        # Print processing header and configuration
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
        
        # Initialize counters for progress tracking
        processed_files = 0
        instrumented_files = 0
        
        # Process each file with progress reporting
        for file_path in c_files:
            processed_files += 1
            print(f"\n[{processed_files}/{len(c_files)}] Processing: {file_path}")
            
            try:
                # Attempt to instrument the file
                if self.instrumenter.instrument_file(file_path, dry_run):
                    instrumented_files += 1
            except Exception as e:
                print(f"  - Error processing file: {e}")
                continue
        
        # Print summary of what was accomplished
        self._print_summary(processed_files, instrumented_files)

    # ============================================================================
    # REPORTING AND SUMMARY METHODS
    # ============================================================================
    
    def _print_summary(self, processed_files: int, instrumented_files: int) -> None:
        """
        Print a comprehensive summary of the processing results
        
        Generates a detailed report showing:
        - Total files processed vs instrumented
        - Total number of modifications made
        - Success rate and statistics
        
        Args:
            processed_files: Number of files that were processed
            instrumented_files: Number of files that had modifications made
        """
        print("\n" + "=" * 60)
        print(f"SUMMARY:")
        print(f"- Processed files: {processed_files}")
        print(f"- Instrumented files: {instrumented_files}")
        print(f"- Total modifications: {sum(mod['changes'] for mod in self.instrumenter.modifications)}")
