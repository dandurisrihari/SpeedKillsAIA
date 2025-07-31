#!/usr/bin/env python3
"""
Configuration module for kernel instrumentation tool

This module provides comprehensive configuration management including:
- Runtime settings and validation
- Performance tuning parameters
- Logging configuration
- Legacy DMA API compatibility

For new code, use the new Configuration system from config_v2.
Legacy DMAAPIConfig is maintained for backward compatibility.
"""

# Import the new comprehensive configuration system
from .config_v2 import (
    Configuration,
    LoggingConfig,
    ValidationConfig,
    PerformanceConfig,
    InstrumentationConfig,
    ParsingConfig,
    LogLevel,
    InstrumentationMode,
    load_config,
    validate_config,
    get_default_config,
    DMAAPIConfig  # Legacy compatibility
)

# Re-export everything for backward compatibility
__all__ = [
    'Configuration',
    'LoggingConfig', 
    'ValidationConfig',
    'PerformanceConfig',
    'InstrumentationConfig',
    'ParsingConfig',
    'LogLevel',
    'InstrumentationMode',
    'load_config',
    'validate_config',
    'get_default_config',
    'DMAAPIConfig',  # Legacy
]
