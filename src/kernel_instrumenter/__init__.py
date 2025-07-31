#!/usr/bin/env python3
"""
Kernel Instrumenter - Production-Ready Linux Kernel Module Instrumentation Tool

A comprehensive, modular to# Legacy compatibility exports (if available)
try:
    from .core import DMAInstrumenter, DirectoryProcessor
except ImportError:
    # These might not exist in all configurations
    logger.debug("Some legacy core modules not available")r instrumenting Linux kernel module C files with
multiple types of runtime analysis including DMA operations, user space copy functions,
and function entry point tracking.

Architecture Overview:
    ┌─────────────────────────────────────────────────────────────────┐
    │                    Kernel Instrumenter                          │
    │                                                                 │
    │  ┌─────────────┐  ┌──────────────┐  ┌─────────────────────┐    │
    │  │    CLI      │  │   Config     │  │    Parsing          │    │
    │  │   Module    │  │   System     │  │   (Tree-sitter)     │    │
    │  └─────────────┘  └──────────────┘  └─────────────────────┘    │
    │                                                                 │
    │  ┌─────────────────────────────────┐  ┌─────────────────────┐  │
    │  │         Analyzers               │  │    Instrumenters    │  │
    │  │  ┌─────┐ ┌────────┐ ┌────────┐ │  │  ┌─────┐ ┌────────┐ │  │
    │  │  │ DMA │ │ User   │ │Function│ │  │  │Multi│ │ File   │ │  │
    │  │  │     │ │ Copy   │ │        │ │  │  │     │ │ Writer │ │  │
    │  │  └─────┘ └────────┘ └────────┘ │  │  └─────┘ └────────┘ │  │
    │  └─────────────────────────────────┘  └─────────────────────┘  │
    │                                                                 │
    │  ┌─────────────────────────────────────────────────────────┐   │
    │  │                 Core Orchestration                      │   │
    │  │     KernelInstrumenter (Main Coordinator)              │   │
    │  └─────────────────────────────────────────────────────────┘   │
    └─────────────────────────────────────────────────────────────────┘

Features:
    - Tree-sitter based precise C code parsing and analysis
    - Modular analyzer system for different instrumentation types
    - Production-ready error handling and logging
    - Comprehensive backup and recovery mechanisms
    - Dry-run mode for safe preview of modifications
    - Extensive configuration and customization options
    - Type-safe instrumentation with full type hints
    - Comprehensive test coverage and validation

Modules:
    analyzers:      Specialized code analyzers for different API types
    cli:           Command-line interface and argument processing
    config:        Configuration management and settings
    core:          Core orchestration and coordination logic
    instrumenters: Code modification and instrumentation engines
    instrumentation_types: Type definitions and configurations
    parsing:       Tree-sitter based C code parsing infrastructure

Main Classes:
    KernelInstrumenter:     Main orchestrator class
    MultiAnalyzer:          Coordinates multiple analyzer types
    MultiInstrumenter:      Handles multiple instrumentation types
    TreeSitterParser:       C code parsing using tree-sitter

Usage Examples:
    Basic usage:
        from kernel_instrumenter import KernelInstrumenter
        
        instrumenter = KernelInstrumenter(
            enabled_types={'dma', 'user_copy', 'functions'},
            dry_run=False,
            verbose=True
        )
        instrumenter.instrument_directory('/path/to/kernel/source')
    
    Advanced usage with custom configuration:
        from kernel_instrumenter import (
            KernelInstrumenter, 
            DMAAnalyzer, 
            DMAInstrumentationType
        )
        
        # Custom DMA configuration
        dma_config = DMAInstrumentationType()
        dma_config.add_custom_api('my_custom_dma_func')
        
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            custom_configs={'dma': dma_config}
        )

Version: 2.0.0
Author: Kernel Instrumentation Team
License: MIT
"""

import logging
from typing import Dict, Any, Optional

# Version information
__version__ = "2.0.0"
__author__ = "Kernel Instrumentation Team"
__license__ = "MIT"
__status__ = "Production"

# Configure logging for the package
logger = logging.getLogger(__name__)

# Core exports - Main API
from .kernel_instrument import KernelInstrumenter

# Analyzer exports
from .analyzers import (
    BaseAnalyzer,
    DMAAnalyzer, 
    UserCopyAnalyzer,
    FunctionAnalyzer,
    DmaPresentFilesAnalyzer,
    MultiAnalyzer
)

# Instrumenter exports
from .instrumenters import MultiInstrumenter

# Configuration exports
from .config import Configuration, LoggingConfig
from .instrumentation_types import (
    InstrumentationType,
    DMAInstrumentationType,
    UserCopyInstrumentationType, 
    FunctionInstrumentationType,
    DmaPresentFilesFunctionsInstrumentationType
)

# Parsing exports
from .parsing import TreeSitterParser

# Core infrastructure exports
# Note: DirectoryProcessor is now handled by KernelInstrumenter

# CLI exports for programmatic use
from .cli import CLIHandler

# Legacy compatibility exports
try:
    from .core import DMAInstrumenter
except ImportError:
    # These might not exist in all configurations
    logger.debug("Some legacy modules not available")

# Public API - what gets imported with "from kernel_instrumenter import *"
__all__ = [
    # Version info
    "__version__",
    "__author__",
    "__license__",
    
    # Main API
    "KernelInstrumenter",
    
    # Analyzers
    "BaseAnalyzer",
    "DMAAnalyzer",
    "UserCopyAnalyzer", 
    "FunctionAnalyzer",
    "DmaPresentFilesAnalyzer",
    "MultiAnalyzer",
    
    # Instrumenters
    "MultiInstrumenter",
    
    # Configuration
    "Configuration",
    "LoggingConfig",
    
    # Instrumentation Types
    "InstrumentationType",
    "DMAInstrumentationType",
    "UserCopyInstrumentationType",
    "FunctionInstrumentationType", 
    "DmaPresentFilesFunctionsInstrumentationType",
    
    # Infrastructure
    "TreeSitterParser",
    "CLIHandler",
    
    # Legacy (if available)
    "DMAInstrumenter",
]


def get_version_info() -> Dict[str, Any]:
    """
    Get comprehensive version and build information.
    
    Returns:
        Dictionary containing version, build info, and capabilities
    """
    return {
        "version": __version__,
        "author": __author__,
        "license": __license__,
        "status": __status__,
        "python_version": "3.8+",
        "dependencies": {
            "tree_sitter": "required",
            "tree_sitter_c": "required"
        },
        "capabilities": {
            "dma_analysis": True,
            "user_copy_analysis": True,
            "function_analysis": True,
            "dma_present_files_analysis": True,
            "multi_type_analysis": True,
            "dry_run_mode": True,
            "backup_recovery": True,
            "type_safety": True
        }
    }


def configure_logging(level: int = logging.INFO, 
                     format_string: Optional[str] = None) -> None:
    """
    Configure package-wide logging settings.
    
    Args:
        level: Logging level (logging.DEBUG, INFO, WARNING, ERROR, CRITICAL)
        format_string: Custom format string for log messages
    """
    if format_string is None:
        format_string = (
            "%(asctime)s - %(name)s - %(levelname)s - "
            "%(filename)s:%(lineno)d - %(message)s"
        )
    
    logging.basicConfig(
        level=level,
        format=format_string,
        datefmt="%Y-%m-%d %H:%M:%S"
    )
    
    logger.info(f"Kernel Instrumenter v{__version__} - Logging configured")


# Auto-configure basic logging on import
configure_logging(level=logging.WARNING)
