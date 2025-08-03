#!/usr/bin/env python3
"""
IOCTL handler instrumentation type configuration
"""

from typing import Set
from .base import InstrumentationType


class IoctlInstrumentationType(InstrumentationType):
    """IOCTL handler instrumentation configuration"""
    
    @property
    def name(self) -> str:
        return "IOCTL Handlers"
    
    @property
    def api_functions(self) -> Set[str]:
        # IOCTL handlers don't have specific API functions - we identify them by name patterns
        return set()
    
    @property
    def template(self) -> str:
        return '''printk(KERN_INFO "IOCTL_HANDLER: Function {function_name} called at %s:%d\\n", __FILE__, __LINE__);'''
    
    @property
    def required_headers(self) -> list[str]:
        return [
            '#include <linux/kernel.h>',      # For printk and KERN_INFO
            '#include <linux/printk.h>',      # Additional printk definitions
        ]
    
    @property
    def marker_prefix(self) -> str:
        return "IOCTL_HANDLER"
    
    @property
    def ioctl_patterns(self) -> Set[str]:
        """Return common patterns found in ioctl handler function names"""
        return {
            'ioctl',        # Direct ioctl name
            'unlocked_ioctl',  # Modern unlocked ioctl
            'compat_ioctl'  # Compatibility ioctl
        }
