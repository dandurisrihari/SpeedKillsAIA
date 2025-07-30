#!/usr/bin/env python3
"""
DMA Instrumentation Package

A modular tool for instrumenting Linux kernel module C files with DMA allocation
logging. This package provides components for parsing, analyzing, and modifying
C source code to add debugging instrumentation before DMA API calls.

Modules:
    config: Configuration settings and DMA API definitions
    parser: Tree-sitter based C code parsing
    analyzer: AST analysis and DMA call detection
    instrumenter: File instrumentation and code modification
    processor: Directory traversal and batch processing
    core: Main coordinator facade class
    cli: Command-line interface

Main Classes:
    DMAInstrumenter: Main facade for all instrumentation operations
    
Usage:
    from dma_instrumentation import DMAInstrumenter
    
    instrumenter = DMAInstrumenter()
    instrumenter.process_directory("/path/to/kernel/source")
"""

from core import DMAInstrumenter
from config import DMAAPIConfig
from parser import TreeSitterParser
from analyzer import DMACallAnalyzer
from instrumenter import FileInstrumenter
from processor import DirectoryProcessor

__version__ = "1.0.0"
__author__ = "DMA Instrumentation Tool"

__all__ = [
    'DMAInstrumenter',
    'DMAAPIConfig',
    'TreeSitterParser', 
    'DMACallAnalyzer',
    'FileInstrumenter',
    'DirectoryProcessor'
]
