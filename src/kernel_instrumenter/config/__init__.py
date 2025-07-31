#!/usr/bin/env python3
"""
Configuration Management Module

This module provides comprehensive configuration management for the kernel instrumenter,
including runtime settings, API definitions, logging configuration, and validation.

Classes:
    Configuration:      Main configuration management class
    LoggingConfig:      Logging-specific configuration
    ValidationConfig:   Input validation settings
    PerformanceConfig:  Performance tuning parameters

Functions:
    load_config:        Load configuration from file
    validate_config:    Validate configuration settings
    get_default_config: Get default configuration
"""

from .config import (
    Configuration,
    LoggingConfig, 
    ValidationConfig,
    PerformanceConfig,
    load_config,
    validate_config,
    get_default_config
)

# Legacy compatibility
try:
    from .config import DMAAPIConfig
except ImportError:
    DMAAPIConfig = None

__all__ = [
    "Configuration",
    "LoggingConfig",
    "ValidationConfig", 
    "PerformanceConfig",
    "load_config",
    "validate_config", 
    "get_default_config",
    "DMAAPIConfig",  # Legacy
]
