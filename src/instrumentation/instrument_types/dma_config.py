#!/usr/bin/env python3
"""
DMA instrumentation type configuration
"""

from typing import Set
from .base import InstrumentationType


class DMAInstrumentationType(InstrumentationType):
    """DMA API instrumentation configuration"""
    
    @property
    def name(self) -> str:
        return "DMA APIs"
    
    @property
    def api_functions(self) -> Set[str]:
        return {
            # DMA allocation functions
            'dma_alloc_coherent',      # Allocate coherent DMA memory
            'dma_alloc_attrs',         # Allocate DMA memory with attributes
            'dma_alloc_wc',           # Allocate write-combining DMA memory
            'dma_alloc_noncoherent',   # Allocate non-coherent DMA memory
            'dma_zalloc_coherent',     # Allocate and zero DMA memory
            'pci_alloc_consistent',    # Legacy PCI DMA allocation
            'dmam_alloc_coherent',     # Managed DMA allocation
            'dmam_alloc_attrs',        # Managed DMA allocation with attributes
            
            # DMA mapping functions
            'dma_map_single',          # Map single buffer for DMA
            'dma_unmap_single',        # Unmap single DMA buffer
            'dma_map_page',            # Map page for DMA
            'dma_unmap_page',          # Unmap DMA page
            'dma_map_sg',              # Map scatter-gather list for DMA
            'dma_unmap_sg',            # Unmap scatter-gather DMA
            'dma_sync_single_for_cpu', # Sync DMA buffer for CPU access
            'dma_sync_single_for_device', # Sync DMA buffer for device access
            'dma_sync_sg_for_cpu',     # Sync scatter-gather for CPU
            'dma_sync_sg_for_device',  # Sync scatter-gather for device
            
            # DMA pool functions
            'dma_pool_create',         # Create a DMA pool
            'dma_pool_destroy',        # Destroy a DMA pool
            'dma_pool_alloc',          # Allocate from DMA pool
            'dma_pool_free',           # Free to DMA pool
            
            # DMA-BUF functions
            'dma_buf_export',          # Export DMA buffer
            'dma_buf_get',             # Get reference to DMA buffer
            'dma_buf_put',             # Release DMA buffer reference
            'dma_buf_attach',          # Attach to DMA buffer
            'dma_buf_detach',          # Detach from DMA buffer
            'dma_buf_map_attachment',  # Map DMA buffer attachment
            'dma_buf_unmap_attachment', # Unmap DMA buffer attachment
        }
    
    @property
    def template(self) -> str:
        return '''printk(KERN_INFO "DMA_INSTRUMENT: About to call {function_name} from function %s at %s:%d\\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "DMA_STACK_START: Stack trace for {function_name} called from %s\\n", __func__);
dump_stack();
printk(KERN_INFO "DMA_STACK_END: End of stack trace for {function_name}\\n");'''
    
    @property
    def required_headers(self) -> list[str]:
        return [
            '#include <linux/kernel.h>',      # For printk and KERN_INFO
            '#include <linux/printk.h>',      # Additional printk definitions
            '#include <asm/stacktrace.h>',     # For dump_stack()
        ]
    
    @property
    def marker_prefix(self) -> str:
        return "DMA_INSTRUMENT"
