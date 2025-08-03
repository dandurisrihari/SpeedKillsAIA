#!/usr/bin/env python3
"""
Interface abstractions for the kernel log parser

This module provides clean, modular interfaces for different ways
of using the parser - programmatic API, CLI, web UI, etc.
"""

from .api import ProgrammaticAPI
from .batch import BatchProcessor
from .interactive import InteractiveInterface

__all__ = [
    'ProgrammaticAPI',
    'BatchProcessor', 
    'InteractiveInterface'
]
