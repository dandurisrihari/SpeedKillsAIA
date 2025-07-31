#!/usr/bin/env python3
"""
Configuration for DMA Present Files Functions instrumentation
"""

from typing import Set
from .base import InstrumentationType


class DmaPresentFilesFunctionsInstrumentationType(InstrumentationType):
    """
    Configuration for instrumenting all function entries in files containing DMA operations
    
    This instrumentation type:
    - Detects files that contain any DMA API calls
    - Instruments ALL function entry points in those files
    - Skips files that don't contain DMA operations
    """
    
    @property
    def name(self) -> str:
        """Return the human-readable name of this instrumentation type"""
        return "dma_present_files_functions"
    
    @property
    def api_functions(self) -> Set[str]:
        """Return the set of DMA API function names to detect"""
        return {
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
    
    @property
    def template(self) -> str:
        """Return the instrumentation template for function entries"""
        return 'printk(KERN_INFO "{marker}: Entering function {function_name} (line {line_number})\\n");'
    
    @property
    def required_headers(self) -> list[str]:
        """Return list of headers required for this instrumentation type"""
        return ['#include <linux/kernel.h>']
    
    @property
    def marker_prefix(self) -> str:
        """Return the log marker prefix for this instrumentation type"""
        return "DMA_FILE_FUNC"
    
    def get_log_prefix(self) -> str:
        """Get the prefix to use for log messages"""
        return self.marker_prefix
    
    def get_instrumentation_comment(self) -> str:
        """Get the comment to add before instrumentation"""
        return "// DMA file function entry instrumentation"
    
    def should_instrument_item(self, item_info: dict) -> bool:
        """
        Determine if a specific item should be instrumented
        
        Args:
            item_info: Dictionary containing information about the code item
            
        Returns:
            True if the item should be instrumented
        """
        # For this type, we instrument all functions in DMA-containing files
        # The filtering is done at the file level by the analyzer
        return True
    
    def get_instrumentation_code(self, item_info: dict) -> str:
        """
        Generate instrumentation code for a specific item
        
        Args:
            item_info: Dictionary containing information about the code item
            
        Returns:
            String containing the instrumentation code
        """
        function_name = item_info.get('name', 'unknown_function')
        line_number = item_info.get('line', 0)
        
        return self.template.format(
            marker=self.marker_prefix,
            function_name=function_name,
            line_number=line_number
        )
    
    def get_required_includes(self) -> list:
        """Get list of includes required for this instrumentation"""
        return self.required_headers
    
    def validate_configuration(self) -> bool:
        """Validate the instrumentation configuration"""
        return True
