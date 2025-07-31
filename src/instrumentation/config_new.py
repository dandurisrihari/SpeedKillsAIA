#!/usr/bin/env python3
"""
Focused kernel instrumentation configuration

This module provides templates and settings for instrumenting:
1. DMA API calls
2. User space copy operations (copy_from_user/copy_to_user)
3. Function entry points
"""

from typing import Set, Dict, Any
from enum import Enum


class InstrumentationType(Enum):
    """Available instrumentation types"""
    DMA_CALLS = "dma_calls"
    USER_COPY_OPS = "user_copy_ops"
    FUNCTION_ENTRIES = "function_entries"


class InstrumentationConfig:
    """Configuration for what to instrument"""
    def __init__(self, dma_calls: bool = True, user_copy_ops: bool = True, function_entries: bool = True):
        self.dma_calls = dma_calls
        self.user_copy_ops = user_copy_ops
        self.function_entries = function_entries
    
    def get_enabled_types(self) -> Set[InstrumentationType]:
        """Get set of enabled instrumentation types"""
        enabled = set()
        if self.dma_calls:
            enabled.add(InstrumentationType.DMA_CALLS)
        if self.user_copy_ops:
            enabled.add(InstrumentationType.USER_COPY_OPS)
        if self.function_entries:
            enabled.add(InstrumentationType.FUNCTION_ENTRIES)
        return enabled


class KernelAPIs:
    """Kernel API definitions for instrumentation"""
    
    # ============================================================================
    # DMA ALLOCATION APIs
    # ============================================================================
    DMA_APIS: Set[str] = {
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
        
        # DMA pool functions
        'dma_pool_create',         # Create a DMA pool
        'dma_pool_alloc',          # Allocate from DMA pool
        'dma_pool_free',           # Free to DMA pool
    }
    
    # ============================================================================
    # USER SPACE COPY OPERATIONS
    # ============================================================================
    USER_COPY_APIS: Set[str] = {
        # Basic copy operations
        'copy_from_user',          # Copy data from user space
        'copy_to_user',            # Copy data to user space
        '__copy_from_user',        # Unchecked copy from user space
        '__copy_to_user',          # Unchecked copy to user space
        
        # String operations
        'strncpy_from_user',       # Copy string from user space
        'strnlen_user',            # Get string length from user space
        
        # Single value operations
        'get_user',                # Get single value from user space
        'put_user',                # Put single value to user space
        '__get_user',              # Unchecked get from user space
        '__put_user',              # Unchecked put to user space
        
        # Clear operations
        'clear_user',              # Clear user space memory
        '__clear_user',            # Unchecked clear user space
    }


class InstrumentationTemplates:
    """Templates for different types of instrumentation"""
    
    # ============================================================================
    # DMA OPERATION TEMPLATE
    # ============================================================================
    DMA_TEMPLATE = '''printk(KERN_INFO "DMA_INSTRUMENT: About to call {function_name} from function %s at %s:%d\\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "DMA_STACK_START: Stack trace for {function_name} called from %s\\n", __func__);
dump_stack();
printk(KERN_INFO "DMA_STACK_END: End of stack trace for {function_name}\\n");'''

    # ============================================================================
    # USER COPY OPERATION TEMPLATE
    # ============================================================================
    USER_COPY_TEMPLATE = '''printk(KERN_INFO "USER_COPY: About to call {function_name} from function %s at %s:%d\\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "USER_COPY_DIRECTION: {direction} operation in function %s\\n", __func__);'''

    # ============================================================================
    # FUNCTION ENTRY TEMPLATE
    # ============================================================================
    FUNCTION_ENTRY_TEMPLATE = '''printk(KERN_INFO "FUNC_ENTRY: Entering function {function_name} at %s:%d\\n", __FILE__, __LINE__);'''

    @classmethod
    def get_template(cls, instrumentation_type: InstrumentationType, function_name: str = "", **kwargs) -> str:
        """Get the appropriate template for an instrumentation type"""
        
        if instrumentation_type == InstrumentationType.DMA_CALLS:
            return cls.DMA_TEMPLATE.format(function_name=function_name)
            
        elif instrumentation_type == InstrumentationType.USER_COPY_OPS:
            direction = cls._determine_copy_direction(function_name)
            return cls.USER_COPY_TEMPLATE.format(function_name=function_name, direction=direction)
            
        elif instrumentation_type == InstrumentationType.FUNCTION_ENTRIES:
            return cls.FUNCTION_ENTRY_TEMPLATE.format(function_name=function_name)
            
        else:
            # Fallback to basic template
            return f'''printk(KERN_INFO "KERNEL_INSTR: {function_name} called from %s at %s:%d\\n", __func__, __FILE__, __LINE__);'''

    @staticmethod
    def _determine_copy_direction(function_name: str) -> str:
        """Determine the direction of user copy operation"""
        if any(op in function_name for op in ['copy_from_user', '__copy_from_user', 'get_user', '__get_user', 'strncpy_from_user']):
            return 'from_user'
        elif any(op in function_name for op in ['copy_to_user', '__copy_to_user', 'put_user', '__put_user']):
            return 'to_user'
        elif any(op in function_name for op in ['clear_user', '__clear_user']):
            return 'clear_user'
        else:
            return 'unknown_direction'


class KernelInstrumentationConfig:
    """Main configuration class for kernel instrumentation"""
    
    # ============================================================================
    # FILE FILTERING CONFIGURATION
    # ============================================================================
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
    # REQUIRED HEADERS CONFIGURATION
    # ============================================================================
    REQUIRED_HEADERS = [
        '#include <linux/kernel.h>',      # For printk and KERN_INFO
        '#include <linux/printk.h>',      # Additional printk definitions (newer kernels)
        '#include <asm/stacktrace.h>',     # For dump_stack() on some architectures
    ]
    
    # Comment marker to identify our added headers
    HEADER_MARKER = '/* KERNEL_INSTRUMENT: Auto-added headers */'
    
    # ============================================================================
    # INSTRUMENTATION TYPE MAPPINGS
    # ============================================================================
    TYPE_PREFIXES = {
        InstrumentationType.DMA_CALLS: "DMA_INSTRUMENT",
        InstrumentationType.USER_COPY_OPS: "USER_COPY",
        InstrumentationType.FUNCTION_ENTRIES: "FUNC_ENTRY"
    }
    
    @classmethod
    def get_prefix(cls, instrumentation_type: InstrumentationType) -> str:
        """Get log prefix for instrumentation type"""
        return cls.TYPE_PREFIXES.get(instrumentation_type, "KERNEL_INSTR")
    
    @classmethod
    def create_instrumentation_line(cls, instrumentation_type: InstrumentationType, 
                                  function_name: str, indentation: str) -> str:
        """Create instrumentation code for a specific type and function"""
        template = InstrumentationTemplates.get_template(instrumentation_type, function_name)
        return f"{indentation}{template}"


# For backward compatibility with existing code
class DMAAPIConfig:
    """Legacy DMA API config for backward compatibility"""
    
    DMA_APIS = KernelAPIs.DMA_APIS
    SKIP_PATTERNS = KernelInstrumentationConfig.SKIP_PATTERNS
    REQUIRED_HEADERS = KernelInstrumentationConfig.REQUIRED_HEADERS
    HEADER_MARKER = KernelInstrumentationConfig.HEADER_MARKER
    
    # Legacy templates for backward compatibility
    INSTRUMENTATION_TEMPLATE = InstrumentationTemplates.DMA_TEMPLATE
    FUNCTION_ENTRY_TEMPLATE = InstrumentationTemplates.FUNCTION_ENTRY_TEMPLATE
