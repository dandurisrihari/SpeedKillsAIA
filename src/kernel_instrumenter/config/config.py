#!/usr/bin/env python3
"""
Configuration module for DMA instrumentation tool

This module contains all configuration settings, DMA API definitions,
and instrumentation templates used by the DMA instrumentation system.
"""

from typing import Set


class DMAAPIConfig:
    """
    Configuration class for DMA API definitions and instrumentation settings
    
    This class centralizes all configuration related to:
    - DMA function APIs to be instrumented
    - File patterns to skip during processing
    - Instrumentation code templates
    
    The DMA_APIS set contains function names that will be detected and instrumented.
    Only functions containing 'dma' in their name are included to avoid false positives.
    """
    
    # Comprehensive list of DMA APIs to instrument
    # Note: Only includes functions with 'dma' in the name to avoid instrumenting
    # unrelated functions like ioremap, pci_resource_*, etc.
    DMA_APIS: Set[str] = {
        # ============================================================================
        # DMA ALLOCATION APIs - Functions that allocate DMA-coherent memory
        # ============================================================================
        'dma_alloc_coherent',      # Allocate coherent DMA memory
        'dma_alloc_attrs',         # Allocate DMA memory with attributes
        'dma_alloc_wc',           # Allocate write-combining DMA memory
        'dma_alloc_noncoherent',   # Allocate non-coherent DMA memory
        'dma_zalloc_coherent',     # Allocate and zero DMA memory
        'pci_alloc_consistent',    # Legacy PCI DMA allocation
        'pci_zalloc_consistent',   # Legacy PCI DMA allocation (zeroed)
        'dmam_alloc_coherent',     # Managed DMA allocation
        'dmam_alloc_attrs',        # Managed DMA allocation with attributes
        '__dma_alloc_coherent',    # Internal DMA allocation
        'arm_dma_alloc',          # ARM-specific DMA allocation

        # ============================================================================
        # DMA POOL APIs - Functions for managing DMA memory pools
        # ============================================================================
        'dma_pool_create',    # Create a DMA pool
        'dma_pool_destroy',   # Destroy a DMA pool
        'dma_pool_alloc',     # Allocate from DMA pool
        'dma_pool_zalloc',    # Allocate and zero from DMA pool
        'dma_pool_free',      # Free to DMA pool

        # ============================================================================
        # DMA MAPPING APIs - Functions for streaming DMA mappings
        # ============================================================================
        'dma_map_single',           # Map single buffer for DMA
        'dma_unmap_single',         # Unmap single DMA buffer
        'dma_map_page',             # Map page for DMA
        'dma_unmap_page',           # Unmap DMA page
        'dma_map_sg',               # Map scatter-gather list for DMA
        'dma_unmap_sg',             # Unmap scatter-gather DMA
        'dma_sync_single_for_cpu',  # Sync DMA buffer for CPU access
        'dma_sync_single_for_device', # Sync DMA buffer for device access
        'dma_sync_sg_for_cpu',      # Sync scatter-gather for CPU
        'dma_sync_sg_for_device',   # Sync scatter-gather for device
        'dma_mapping_error',        # Check for DMA mapping errors

        # ============================================================================
        # DMA-BUF APIs - Functions for shared DMA buffer management
        # ============================================================================
        'dma_buf_export',               # Export DMA buffer
        'dma_buf_fd',                   # Get file descriptor for DMA buffer
        'dma_buf_get',                  # Get reference to DMA buffer
        'dma_buf_put',                  # Release DMA buffer reference
        'dma_buf_attach',               # Attach to DMA buffer
        'dma_buf_detach',               # Detach from DMA buffer
        'dma_buf_map_attachment',       # Map DMA buffer attachment
        'dma_buf_unmap_attachment',     # Unmap DMA buffer attachment
        'dma_buf_begin_cpu_access',     # Begin CPU access to DMA buffer
        'dma_buf_end_cpu_access',       # End CPU access to DMA buffer
        'dma_buf_begin_cpu_access_partial', # Begin partial CPU access
        'dma_buf_end_cpu_access_partial',   # End partial CPU access
        'dma_buf_mmap',                 # Memory map DMA buffer
        'dma_buf_kmap',                 # Kernel map DMA buffer
        'dma_buf_kunmap',               # Kernel unmap DMA buffer
        'dma_buf_kmap_atomic',          # Atomic kernel map
        'dma_buf_kunmap_atomic',        # Atomic kernel unmap
        'dma_buf_vmap',                 # Virtual map DMA buffer
        'dma_buf_vunmap',               # Virtual unmap DMA buffer

        # ============================================================================
        # DMA ENGINE APIs - Functions for DMA engine management
        # ============================================================================
        'dma_request_channel',          # Request DMA channel
        'dma_release_channel',          # Release DMA channel
        'dmaengine_submit',             # Submit DMA transaction
        'dma_async_issue_pending',      # Issue pending DMA operations
        'dmaengine_prep_slave_single',  # Prepare single slave DMA
        'dmaengine_prep_slave_sg',      # Prepare slave scatter-gather DMA
        'dmaengine_prep_interleaved_dma', # Prepare interleaved DMA
        'dmaengine_prep_dma_memcpy',    # Prepare DMA memory copy
        'dmaengine_prep_dma_cyclic',    # Prepare cyclic DMA
        'dmaengine_terminate_all',      # Terminate all DMA operations
        'dmaengine_desc_get_callback',  # Get DMA descriptor callback
        'dmaengine_desc_set_callback',  # Set DMA descriptor callback
        'dmaengine_desc_set_callback_param', # Set callback parameters

        # ============================================================================
        # SCATTERLIST DMA APIs - Functions that work with DMA addresses in sg lists
        # ============================================================================
        'sg_page_iter_dma_address', # Get DMA address from page iterator
        'sg_dma_address',           # Get DMA address from sg entry
        'sg_dma_len',               # Get DMA length from sg entry
        'sg_page_iter_dma_len',     # Get DMA length from page iterator
        'for_each_sg_dma_page',     # Iterate over DMA pages in sg list

        # ============================================================================
        # ADDRESS TRANSLATION APIs - Functions for DMA address conversion
        # ============================================================================
        'dma_to_phys',              # Convert DMA address to physical
        'dma_get_sgtable_attrs',    # Get scatter-gather table with attributes
        'dma_common_get_sgtable',   # Get common scatter-gather table
        'dma_direct_map_sg',        # Direct map scatter-gather list
        'dma_direct_unmap_sg',      # Direct unmap scatter-gather list

        # ============================================================================
        # MISCELLANEOUS DMA APIs - Other DMA-related functions
        # ============================================================================
        'dma_supported',            # Check if DMA is supported
        'dma_get_cache_alignment',  # Get DMA cache alignment
        'dma_set_mask',             # Set DMA addressing mask
        'dma_set_coherent_mask',    # Set coherent DMA mask
        'dma_get_required_mask',    # Get required DMA mask
        'dma_get_sgtable',          # Get scatter-gather table
        'dma_mmap_attrs',           # Memory map with attributes
    }

    # ============================================================================
    # FILE FILTERING CONFIGURATION
    # ============================================================================
    # File and directory patterns to skip during processing
    # These patterns help avoid instrumenting build artifacts, backups, etc.
    SKIP_PATTERNS = [
        '.backup',      # Backup files created by this tool
        '.orig',        # Original files from patches
        '.tmp',         # Temporary files
        '/build/',      # Build directories
        '/.git/',       # Git repository files
        '__pycache__',  # Python cache directories
        '.o',           # Object files
        '.ko',          # Kernel object files
        '.so'           # Shared object files
    ]
    
    # ============================================================================
    # INSTRUMENTATION CODE TEMPLATES
    # ============================================================================
    
    # Template for DMA call instrumentation
    # This template provides:
    # 1. Function name and location logging
    # 2. Calling function identification
    # 3. Stack trace capture for debugging
    # 4. Clear markers for log parsing
    INSTRUMENTATION_TEMPLATE = '''printk(KERN_INFO "DMA_INSTRUMENT: About to call {function_name} from function %s at %s:%d\\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "DMA_STACK_START: Stack trace for {function_name} called from %s\\n", __func__);
dump_stack();
printk(KERN_INFO "DMA_STACK_END: End of stack trace for {function_name}\\n");'''

    # Template for function entry instrumentation
    # This template provides:
    # 1. Function entry logging with parameters
    # 2. File and line information
    # 3. Clear markers for log parsing
    FUNCTION_ENTRY_TEMPLATE = '''printk(KERN_INFO "FUNC_ENTRY: Entering function {function_name} at %s:%d\\n", __FILE__, __LINE__);'''

    # ============================================================================
    # REQUIRED HEADERS CONFIGURATION
    # ============================================================================
    # Headers required for instrumentation to compile properly
    # These will be automatically added to files that need instrumentation
    REQUIRED_HEADERS = [
        '#include <linux/kernel.h>',      # For printk and KERN_INFO
        '#include <linux/printk.h>',      # Additional printk definitions (newer kernels)
        '#include <asm/stacktrace.h>',     # For dump_stack() on some architectures
    ]
    
    # Comment marker to identify our added headers
    HEADER_MARKER = '/* DMA_INSTRUMENT: Auto-added headers */'
