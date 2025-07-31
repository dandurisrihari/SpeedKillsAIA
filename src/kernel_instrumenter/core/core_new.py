#!/usr/bin/env python3
"""
Legacy DMA instrumenter coordinator module

This module provides backward compatibility for the old DMA instrumentation interface
while using the modern kernel instrumentation system under the hood.
"""

import sys
from typing import Optional
from pathlib import Path

# Import the modern kernel instrumenter
from ..kernel_instrument import KernelInstrumenter


class DMAInstrumenter:
    """
    Legacy DMA instrumenter class for backward compatibility.
    
    This class provides the same interface as the old DMAInstrumenter but uses
    the modern KernelInstrumenter system internally.
    """
    
    def __init__(self):
        """
        Initialize the DMA instrumenter with backward compatibility
        """
        try:
            # Initialize the modern kernel instrumenter with DMA types only
            self.instrumenter = KernelInstrumenter(
                enabled_types={'dma'},
                dry_run=False,
                verbose=True
            )
            print("✓ DMA Instrumenter initialized successfully")
        except Exception as e:
            print(f"Failed to initialize DMA Instrumenter: {e}")
            sys.exit(1)
    
    def process_directory(self, directory: str, dry_run: bool = False, 
                         max_files: Optional[int] = None, 
                         instrument_functions: bool = False) -> bool:
        """
        Process a directory for DMA instrumentation (legacy interface)
        
        Args:
            directory: Path to directory containing C files
            dry_run: If True, preview changes without modifying files
            max_files: Optional limit on number of files to process
            instrument_functions: Whether to instrument function entries
            
        Returns:
            True if successful, False otherwise
        """
        try:
            # Update enabled types based on instrument_functions
            enabled_types = {'dma'}
            if instrument_functions:
                enabled_types.add('functions')
            
            # Create new instrumenter with updated settings
            self.instrumenter = KernelInstrumenter(
                enabled_types=enabled_types,
                dry_run=dry_run,
                verbose=True
            )
            
            # Process the directory
            result = self.instrumenter.instrument_directory(
                directory=Path(directory),
                file_limit=max_files
            )
            
            return result['success']
            
        except Exception as e:
            print(f"Error processing directory: {e}")
            return False
