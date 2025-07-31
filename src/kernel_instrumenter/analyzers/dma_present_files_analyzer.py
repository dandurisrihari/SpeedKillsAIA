#!/usr/bin/env python3
"""
DMA Present Files Analyzer

This analyzer detects files that contain DMA operations and returns all functions
in those files for instrumentation. This implements the "dma_present_files_functions"
mode where we instrument ALL function entries in files that contain ANY DMA operations.
"""

import re
from typing import List, Dict, Any, Set
from .base_analyzer import BaseAnalyzer
from .function_analyzer import FunctionAnalyzer
from ..instrumentation_types.dma_present_files_functions_config import DmaPresentFilesFunctionsInstrumentationType
from ..instrumentation_types.function_config import FunctionInstrumentationType


class DmaPresentFilesAnalyzer(BaseAnalyzer):
    """
    Analyzer for detecting files with DMA operations and returning all functions
    in those files for instrumentation.
    
    This analyzer:
    1. Scans the entire file for any DMA API calls
    2. If DMA operations are found, returns ALL functions in the file
    3. If no DMA operations are found, returns empty list
    """
    
    def __init__(self, parser, verbose: bool = False):
        """
        Initialize the DMA present files analyzer
        
        Args:
            parser: Tree-sitter parser instance
            verbose: Enable verbose output
        """
        # Create the instrumentation type for this analyzer
        instrumentation_type = DmaPresentFilesFunctionsInstrumentationType()
        super().__init__(parser, instrumentation_type)
        self.verbose = verbose
        
        # Create function analyzer with proper instrumentation type
        function_instrumentation_type = FunctionInstrumentationType()
        self.function_analyzer = FunctionAnalyzer(parser, function_instrumentation_type)
        
        # Comprehensive list of DMA API functions to detect
        self.dma_functions = {
            # Memory allocation/deallocation
            'dma_alloc_coherent', 'dma_free_coherent',
            'dma_alloc_noncoherent', 'dma_free_noncoherent',
            'dma_alloc_attrs', 'dma_free_attrs',
            
            # Single buffer mapping
            'dma_map_single', 'dma_unmap_single',
            'dma_map_page', 'dma_unmap_page',
            
            # Scatter-gather mapping
            'dma_map_sg', 'dma_unmap_sg',
            'dma_map_sg_attrs', 'dma_unmap_sg_attrs',
            
            # Cache synchronization
            'dma_sync_single_for_cpu', 'dma_sync_single_for_device',
            'dma_sync_sg_for_cpu', 'dma_sync_sg_for_device',
            'dma_sync_single_range_for_cpu', 'dma_sync_single_range_for_device',
            
            # Memory mapping
            'dma_mmap_coherent', 'dma_mmap_attrs',
            
            # Address translation
            'dma_to_phys', 'phys_to_dma',
            
            # DMA pool operations
            'dma_pool_create', 'dma_pool_destroy',
            'dma_pool_alloc', 'dma_pool_free',
            
            # Legacy/deprecated functions (still in use)
            'pci_alloc_consistent', 'pci_free_consistent',
            'pci_map_single', 'pci_unmap_single',
            'pci_map_sg', 'pci_unmap_sg',
        }
    
    def has_dma_operations(self, source_code: str) -> bool:
        """
        Check if the source code contains any DMA operations
        
        Args:
            source_code: C source code to analyze
            
        Returns:
            True if DMA operations are found, False otherwise
        """
        lines = source_code.split('\n')
        
        for line_num, line in enumerate(lines, 1):
            # Skip comments and preprocessor directives
            stripped_line = line.strip()
            if (stripped_line.startswith('//') or 
                stripped_line.startswith('*') or 
                stripped_line.startswith('#')):
                continue
            
            # Check for DMA function calls
            for dma_func in self.dma_functions:
                pattern = rf'\b{re.escape(dma_func)}\s*\('
                if re.search(pattern, line):
                    if self.verbose:
                        print(f"    Found DMA operation '{dma_func}' at line {line_num}")
                    return True
        
        return False
    
    def find_instrumentable_items(self, source_code: str) -> List[Dict[str, Any]]:
        """
        Find all functions in files that contain DMA operations
        
        Args:
            source_code: C source code to analyze
            
        Returns:
            List of function information dictionaries if DMA operations are present,
            empty list otherwise
        """
        # First check if the file contains any DMA operations
        if not self.has_dma_operations(source_code):
            if self.verbose:
                print("    No DMA operations found in file")
            return []
        
        if self.verbose:
            print("    DMA operations detected - analyzing all functions")
        
        # If DMA operations are found, get ALL functions in the file
        all_functions = self.function_analyzer.find_functions_in_file(source_code)
        
        if self.verbose:
            print(f"    Found {len(all_functions)} functions to instrument")
            for func in all_functions:
                print(f"      - {func.get('name', 'unknown')} at line {func.get('line', 'unknown')}")
        
        return all_functions
    
    def get_analysis_type(self) -> str:
        """
        Get the analysis type identifier
        
        Returns:
            String identifier for this analyzer type
        """
        return 'dma_present_files_functions'
    
    def get_description(self) -> str:
        """
        Get a human-readable description of this analyzer
        
        Returns:
            Description string
        """
        return "Instruments all function entries in files containing DMA operations"
