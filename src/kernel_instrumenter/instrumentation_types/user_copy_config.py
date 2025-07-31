#!/usr/bin/env python3
"""
User copy instrumentation type configuration
"""

from typing import Set
from .base import InstrumentationType


class UserCopyInstrumentationType(InstrumentationType):
    """User space copy operations instrumentation configuration"""
    
    @property
    def name(self) -> str:
        return "User Copy APIs"
    
    @property
    def api_functions(self) -> Set[str]:
        return {
            # Basic copy operations
            'copy_from_user',          # Copy data from user space to kernel
            'copy_to_user',            # Copy data from kernel to user space
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
            
            # Advanced copy operations
            'copy_from_user_nmi',      # Copy from user in NMI context
            'copy_to_user_nmi',        # Copy to user in NMI context
        }
    
    @property
    def template(self) -> str:
        return '''printk(KERN_INFO "USER_COPY: About to call {function_name} from function %s at %s:%d\\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "USER_COPY_CONTEXT: Process PID=%d, COMM=%s\\n", current->pid, current->comm);'''
    
    @property
    def required_headers(self) -> list[str]:
        return [
            '#include <linux/kernel.h>',      # For printk and KERN_INFO
            '#include <linux/printk.h>',      # Additional printk definitions
            '#include <linux/sched.h>',       # For current task info
            '#include <linux/uaccess.h>',     # For user access functions
        ]
    
    @property
    def marker_prefix(self) -> str:
        return "USER_COPY"
