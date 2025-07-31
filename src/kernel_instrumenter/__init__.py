#!/usr/bin/env python3
"""
Enhanced Multi-Type Kernel Instrumentation Package

A comprehensive tool for instrumenting Linux kernel module C files with multiple
types of instrumentation including DMA calls, user copy operations, and function
entries. This package provides a modular architecture for parsing, analyzing,
and modifying C source code.

Modules:
    config: Configuration settings and API definitions
    parsing: Tree-sitter based C code parsing
    analysis: AST analysis and call detection
    instrumentation: File instrumentation and code modification
    core: Main coordination and processing logic
    cli: Command-line interface

Main Components:
    kernel_instrument: Enhanced multi-type instrumentation tool
    
Usage:
    from kernel_instrumenter import DMAInstrumenter, DMAAPIConfig
    
    instrumenter = DMAInstrumenter()
    instrumenter.process_directory("/path/to/kernel/source")
"""

from .config import DMAAPIConfig
from .core import DMAInstrumenter, DirectoryProcessor
from .parsing import TreeSitterParser
from .analysis import DMACallAnalyzer
from .instrumentation import FileInstrumenter
from .cli import main
from .kernel_instrument import KernelInstrumenter

__version__ = "1.0.0"
__author__ = "DMA Instrumentation Tool"

__all__ = [
    'DMAInstrumenter',
    'DMAAPIConfig',
    'TreeSitterParser', 
    'DMACallAnalyzer',
    'FileInstrumenter',
    'DirectoryProcessor',
    'KernelInstrumenter'
]
