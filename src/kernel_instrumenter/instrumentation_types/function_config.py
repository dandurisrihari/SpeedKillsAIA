#!/usr/bin/env python3
"""
Function entry instrumentation type configuration
"""

from typing import Set
from .base import InstrumentationType


class FunctionInstrumentationType(InstrumentationType):
    """Function entry point instrumentation configuration"""
    
    @property
    def name(self) -> str:
        return "Function Entries"
    
    @property
    def api_functions(self) -> Set[str]:
        # Function entry doesn't have specific API functions - it instruments all functions
        return set()
    
    @property
    def template(self) -> str:
        return '''printk_once(KERN_INFO "[Dynamic Baseline] {function_name}\\n");'''
    
    @property
    def required_headers(self) -> list[str]:
        return [
            '#include <linux/kernel.h>',      # For printk and KERN_INFO
            '#include <linux/printk.h>',      # Additional printk definitions
        ]
    
    @property
    def marker_prefix(self) -> str:
        return "[Dynamic Baseline]"
