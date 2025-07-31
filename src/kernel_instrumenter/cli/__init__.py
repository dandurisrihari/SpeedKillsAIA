#!/usr/bin/env python3
"""
Production-Ready Command Line Interface Module

This module provides a comprehensive command-line interface for the kernel
instrumentation tool, designed for production use with extensive validation,
error handling, and user-friendly features.

Features:
    ✓ Comprehensive argument validation and parsing
    ✓ Interactive and batch mode support
    ✓ Progress reporting and status updates
    ✓ Graceful error handling and recovery
    ✓ Configuration file support
    ✓ Logging configuration management
    ✓ Tab completion support (where available)
    ✓ Signal handling for clean shutdown

Classes:
    CLIHandler:     Main CLI coordination class
    ArgumentParser: Enhanced argument parsing with validation
    ProgressReporter: Progress reporting for long operations
    ConfigManager:  CLI configuration management

Functions:
    main:           Main entry point function
    parse_args:     Parse and validate command line arguments
    setup_logging:  Configure logging based on CLI options
    handle_signals: Set up signal handlers for clean shutdown

Usage:
    # Basic CLI usage
    from kernel_instrumenter.cli import main
    main()
    
    # Programmatic usage
    from kernel_instrumenter.cli import CLIHandler
    
    cli = CLIHandler()
    result = cli.run(['-d', '/path/to/source', '--dry-run'])

Error Handling:
    The CLI module provides comprehensive error handling with user-friendly
    messages, suggestions for resolution, and appropriate exit codes.
    
    Exit codes:
        0: Success
        1: General error
        2: Invalid arguments
        130: User interruption (Ctrl+C)
"""

from .cli import (
    CLIHandler,
    main,
    parse_args,
    setup_logging,
    handle_signals
)

# Legacy compatibility
try:
    from .cli import main as cli_main
except ImportError:
    cli_main = main

__all__ = [
    'CLIHandler',
    'main',
    'parse_args',
    'setup_logging',
    'handle_signals',
    'cli_main',  # Legacy compatibility
]

# Version information
__version__ = "2.0.0"
__author__ = "anonymous"
