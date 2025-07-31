#!/usr/bin/env python3
"""
Production-Ready Code Analysis Module

This module provides a comprehensive suite of specialized analyzers for different
types of kernel instrumentation. Each analyzer is designed to detect specific
patterns in C source code and provide precise instrumentation points.

Architecture:
    BaseAnalyzer (Abstract Base)
    ├── DMAAnalyzer (DMA API calls)
    ├── UserCopyAnalyzer (User space copy operations)
    ├── FunctionAnalyzer (Function definitions and calls)
    ├── DmaPresentFilesAnalyzer (Files containing DMA operations)
    └── MultiAnalyzer (Orchestrates multiple analyzers)

Design Principles:
    - Single Responsibility: Each analyzer handles one type of instrumentation
    - Extensibility: Easy to add new analyzer types
    - Performance: Optimized for large codebases
    - Accuracy: Uses tree-sitter for precise AST analysis
    - Thread Safety: All analyzers are thread-safe for parallel processing

Usage Examples:
    # Basic DMA analysis
    parser = TreeSitterParser()
    dma_config = DMAInstrumentationType()
    analyzer = DMAAnalyzer(parser, dma_config)
    results = analyzer.find_calls_in_file(source_code)
    
    # Multi-type analysis
    enabled_types = {'dma', 'user_copy', 'functions'}
    multi_analyzer = MultiAnalyzer(parser, enabled_types)
    all_results = multi_analyzer.find_all_instrumentable_items(source_code)
    
    # Custom analyzer with validation
    analyzer = DMAAnalyzer(parser, dma_config, enable_validation=True)
    if analyzer.validate_source_code(source_code):
        results = analyzer.find_calls_in_file(source_code)

Error Handling:
    All analyzers provide comprehensive error handling and logging.
    Invalid source code or parsing errors are handled gracefully
    with detailed error messages and optional strict mode validation.

Thread Safety:
    All analyzer classes are designed to be thread-safe and can be
    used in parallel processing scenarios without synchronization issues.
"""

from .base_analyzer import BaseAnalyzer
from .dma_analyzer import DMAAnalyzer
from .user_copy_analyzer import UserCopyAnalyzer
from .function_analyzer import FunctionAnalyzer
from .dma_present_files_analyzer import DmaPresentFilesAnalyzer
from .multi_analyzer import MultiAnalyzer

# Import analyzer exceptions for error handling
try:
    from .exceptions import (
        AnalyzerError,
        ParseError,
        ValidationError,
        ConfigurationError
    )
except ImportError:
    # Create placeholder exceptions if not available
    class AnalyzerError(Exception):
        """Base analyzer exception"""
        pass
    
    class ParseError(AnalyzerError):
        """Parse-related error"""
        pass
    
    class ValidationError(AnalyzerError):
        """Validation-related error"""
        pass
    
    class ConfigurationError(AnalyzerError):
        """Configuration-related error"""
        pass

__all__ = [
    # Main analyzer classes
    'BaseAnalyzer',
    'DMAAnalyzer',
    'UserCopyAnalyzer',
    'FunctionAnalyzer', 
    'DmaPresentFilesAnalyzer',
    'MultiAnalyzer',
    
    # Exception classes
    'AnalyzerError',
    'ParseError',
    'ValidationError',
    'ConfigurationError',
]

# Version and metadata
__version__ = "2.0.0"
__author__ = "Kernel Instrumentation Team"

def get_available_analyzers():
    """
    Get a list of all available analyzer types.
    
    Returns:
        List of analyzer type names that can be used with MultiAnalyzer
    """
    return ['dma', 'user_copy', 'functions', 'dma_present_files_functions']

def create_analyzer(analyzer_type: str, parser, config=None):
    """
    Factory function to create analyzer instances.
    
    Args:
        analyzer_type: Type of analyzer ('dma', 'user_copy', 'functions', etc.)
        parser: TreeSitterParser instance
        config: Optional configuration object
        
    Returns:
        Analyzer instance
        
    Raises:
        ValueError: If analyzer_type is not recognized
    """
    analyzer_map = {
        'dma': DMAAnalyzer,
        'user_copy': UserCopyAnalyzer,
        'functions': FunctionAnalyzer,
        'dma_present_files_functions': DmaPresentFilesAnalyzer,
    }
    
    if analyzer_type not in analyzer_map:
        raise ValueError(f"Unknown analyzer type: {analyzer_type}")
    
    analyzer_class = analyzer_map[analyzer_type]
    
    # Handle different initialization signatures
    try:
        if analyzer_type == 'dma_present_files_functions':
            return analyzer_class(parser, verbose=False)
        else:
            return analyzer_class(parser, config)
    except TypeError:
        # Fallback for analyzers with different signatures
        return analyzer_class(parser)
