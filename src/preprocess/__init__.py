#!/usr/bin/env python3
"""
Kernel Log Parser - Production-Ready Modular Parser

A comprehensive kernel log parser for AI accelerator instrumentation logs.
Focuses on extracting unique function entries, DMA operations, and user copy operations.

Usage:
    # Command-line tool
    python -m src.preprocess log_file.log
    python -m src.preprocess --interactive
    
    # As a module
    from src.preprocess import parse_kernel_log
    results = parse_kernel_log("log.txt")
    
    # Advanced usage
    from src.preprocess.core import KernelLogParserEngine
    parser = KernelLogParserEngine(show_ui=True)
    results = parser.parse_log_file("log.txt")
    
    # Tool wrapper
    from src.preprocess.tool import KernelLogParserTool
    tool = KernelLogParserTool()
    results = tool.process_log("log.txt")
"""

from .core.engine import KernelLogParserEngine
from .tool import KernelLogParserTool

__version__ = "2.0.0"
__author__ = "SpeedKillsAIA Research Team"
__license__ = "MIT"
__status__ = "Production"

# Convenience function for common use case
def parse_kernel_log(log_file_path, show_ui=True):
    """
    Convenience function to parse a kernel log file
    
    Args:
        log_file_path: Path to the kernel log file
        show_ui: Whether to show progress UI
        
    Returns:
        Dictionary with parsing results
    """
    parser = KernelLogParserEngine(show_ui=show_ui)
    return parser.parse_log_file(log_file_path)

# Export main classes
__all__ = [
    'KernelLogParserEngine', 
    'KernelLogParserTool', 
    'parse_kernel_log',
    '__version__',
    '__author__',
    '__license__'
]


def get_version_info():
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
            "flask": "optional (for web UI)"
        },
        "capabilities": {
            "function_parsing": True,
            "dma_operation_parsing": True,
            "user_copy_parsing": True,
            "stack_trace_capture": True,
            "web_ui": True,
            "interactive_mode": True,
            "batch_processing": True,
            "deduplication": True
        }
    }
