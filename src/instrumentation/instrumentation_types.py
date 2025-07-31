#!/usr/bin/env python3
"""
Instrumentation types and API definitions

This module defines different types of instrumentation that can be applied
to kernel code, including DMA operations, user space copy operations,
and function entry/exit tracking.
"""

from typing import Set, Dict, Any
from dataclasses import dataclass
from enum import Enum


class InstrumentationType(Enum):
    """Enumeration of available instrumentation types"""
    DMA_CALLS = "dma_calls"
    FUNCTION_ENTRIES = "function_entries"
    USER_COPY_OPS = "user_copy_ops"
    MEMORY_ALLOCS = "memory_allocs"
    LOCK_OPERATIONS = "lock_operations"


@dataclass
class InstrumentationConfig:
    """Configuration for what types of instrumentation to apply"""
    dma_calls: bool = True
    function_entries: bool = True
    user_copy_ops: bool = False
    memory_allocs: bool = False
    lock_operations: bool = False
    
    def get_enabled_types(self) -> Set[InstrumentationType]:
        """Get set of enabled instrumentation types"""
        enabled = set()
        if self.dma_calls:
            enabled.add(InstrumentationType.DMA_CALLS)
        if self.function_entries:
            enabled.add(InstrumentationType.FUNCTION_ENTRIES)
        if self.user_copy_ops:
            enabled.add(InstrumentationType.USER_COPY_OPS)
        if self.memory_allocs:
            enabled.add(InstrumentationType.MEMORY_ALLOCS)
        if self.lock_operations:
            enabled.add(InstrumentationType.LOCK_OPERATIONS)
        return enabled


class DMAAPIConfig:
    """DMA API definitions for instrumentation"""
    
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


class UserCopyAPIConfig:
    """User space copy operation API definitions"""
    
    USER_COPY_APIS: Set[str] = {
        # ============================================================================
        # USER SPACE COPY OPERATIONS - Functions that copy data to/from user space
        # ============================================================================
        'copy_from_user',           # Copy data from user space to kernel space
        'copy_to_user',             # Copy data from kernel space to user space
        '__copy_from_user',         # Low-level copy from user (no access checks)
        '__copy_to_user',           # Low-level copy to user (no access checks)
        'copy_from_user_inatomic',  # Atomic copy from user space
        'copy_to_user_inatomic',    # Atomic copy to user space
        'get_user',                 # Get single value from user space
        'put_user',                 # Put single value to user space
        '__get_user',               # Low-level get from user space
        '__put_user',               # Low-level put to user space
        'strncpy_from_user',        # Copy string from user space
        'strnlen_user',             # Get string length from user space
        'clear_user',               # Clear memory in user space
        '__clear_user',             # Low-level clear user memory
        
        # ============================================================================
        # BULK USER SPACE OPERATIONS
        # ============================================================================
        'copy_in_user',             # Copy within user space
        '__copy_in_user',           # Low-level copy within user space
        
        # ============================================================================
        # SPECIAL USER COPY VARIANTS
        # ============================================================================
        'copy_from_kernel',         # Copy from kernel to kernel (some architectures)
        'copy_to_kernel',           # Copy to kernel from kernel (some architectures)
    }


class MemoryAllocAPIConfig:
    """Memory allocation API definitions"""
    
    MEMORY_ALLOC_APIS: Set[str] = {
        # ============================================================================
        # KERNEL MEMORY ALLOCATION
        # ============================================================================
        'kmalloc',              # General kernel memory allocation
        'kzalloc',              # Zero-initialized kernel memory allocation
        'kcalloc',              # Array allocation with zero initialization
        'krealloc',             # Reallocate kernel memory
        'kfree',                # Free kernel memory
        'kvmalloc',             # Large memory allocation (vmalloc fallback)
        'kvzalloc',             # Large zero-initialized allocation
        'kvfree',               # Free large allocation
        'kmem_cache_alloc',     # Allocate from slab cache
        'kmem_cache_free',      # Free to slab cache
        'kmem_cache_zalloc',    # Zero-initialized slab allocation
        
        # ============================================================================
        # PAGE ALLOCATION
        # ============================================================================
        'alloc_pages',          # Allocate pages
        'alloc_page',           # Allocate single page
        '__get_free_pages',     # Get free pages
        '__get_free_page',      # Get single free page
        'get_zeroed_page',      # Get zero-initialized page
        '__free_pages',         # Free pages
        'free_pages',           # Free pages by address
        '__free_page',          # Free single page
        'free_page',            # Free single page by address
        
        # ============================================================================
        # VMALLOC ALLOCATION
        # ============================================================================
        'vmalloc',              # Virtual memory allocation
        'vzalloc',              # Zero-initialized virtual allocation
        'vmalloc_user',         # User-accessible virtual allocation
        'vmalloc_32',           # 32-bit addressable virtual allocation
        'vfree',                # Free virtual memory
        'vmap',                 # Map pages to virtual address
        'vunmap',               # Unmap virtual address
    }


class LockAPIConfig:
    """Lock operation API definitions"""
    
    LOCK_APIS: Set[str] = {
        # ============================================================================
        # SPINLOCKS
        # ============================================================================
        'spin_lock',            # Acquire spinlock
        'spin_unlock',          # Release spinlock
        'spin_lock_irq',        # Spinlock with IRQ disable
        'spin_unlock_irq',      # Spinlock release with IRQ enable
        'spin_lock_irqsave',    # Spinlock with IRQ save
        'spin_unlock_irqrestore', # Spinlock release with IRQ restore
        'spin_lock_bh',         # Spinlock with bottom half disable
        'spin_unlock_bh',       # Spinlock release with bottom half enable
        'spin_trylock',         # Try to acquire spinlock
        'spin_trylock_irq',     # Try spinlock with IRQ disable
        'spin_trylock_irqsave', # Try spinlock with IRQ save
        'spin_trylock_bh',      # Try spinlock with bottom half disable
        
        # ============================================================================
        # MUTEXES
        # ============================================================================
        'mutex_lock',           # Acquire mutex
        'mutex_unlock',         # Release mutex
        'mutex_trylock',        # Try to acquire mutex
        'mutex_lock_interruptible', # Interruptible mutex lock
        'mutex_lock_killable',  # Killable mutex lock
        
        # ============================================================================
        # SEMAPHORES
        # ============================================================================
        'down',                 # Acquire semaphore
        'up',                   # Release semaphore
        'down_interruptible',   # Interruptible semaphore acquire
        'down_killable',        # Killable semaphore acquire
        'down_trylock',         # Try to acquire semaphore
        'down_timeout',         # Timed semaphore acquire
        
        # ============================================================================
        # READ-WRITE LOCKS
        # ============================================================================
        'read_lock',            # Acquire read lock
        'read_unlock',          # Release read lock
        'write_lock',           # Acquire write lock
        'write_unlock',         # Release write lock
        'read_lock_irq',        # Read lock with IRQ disable
        'read_unlock_irq',      # Read unlock with IRQ enable
        'write_lock_irq',       # Write lock with IRQ disable
        'write_unlock_irq',     # Write unlock with IRQ enable
        'read_lock_irqsave',    # Read lock with IRQ save
        'read_unlock_irqrestore', # Read unlock with IRQ restore
        'write_lock_irqsave',   # Write lock with IRQ save
        'write_unlock_irqrestore', # Write unlock with IRQ restore
        'read_lock_bh',         # Read lock with bottom half disable
        'read_unlock_bh',       # Read unlock with bottom half enable
        'write_lock_bh',        # Write lock with bottom half disable
        'write_unlock_bh',      # Write unlock with bottom half enable
        
        # ============================================================================
        # RCU LOCKS
        # ============================================================================
        'rcu_read_lock',        # Acquire RCU read lock
        'rcu_read_unlock',      # Release RCU read lock
        'rcu_read_lock_bh',     # RCU read lock with bottom half disable
        'rcu_read_unlock_bh',   # RCU read unlock with bottom half enable
    }


# Mapping from instrumentation types to their API configurations
API_CONFIGS = {
    InstrumentationType.DMA_CALLS: DMAAPIConfig.DMA_APIS,
    InstrumentationType.USER_COPY_OPS: UserCopyAPIConfig.USER_COPY_APIS,
    InstrumentationType.MEMORY_ALLOCS: MemoryAllocAPIConfig.MEMORY_ALLOC_APIS,
    InstrumentationType.LOCK_OPERATIONS: LockAPIConfig.LOCK_APIS,
}
