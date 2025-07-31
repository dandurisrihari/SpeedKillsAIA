#!/usr/bin/env python3
"""
Production-Ready Configuration Management System

This module provides a comprehensive configuration management system for the kernel
instrumenter, supporting various configuration sources, validation, and runtime
parameter management.

Design Principles:
    - Type safety with comprehensive type hints
    - Immutable configuration objects for thread safety
    - Validation at construction and modification time
    - Support for multiple configuration sources (files, environment, code)
    - Hierarchical configuration with inheritance
    - Production-ready error handling and logging

Configuration Hierarchy:
    Configuration (Base)
    ├── LoggingConfig (Logging settings)
    ├── ValidationConfig (Input validation rules)
    ├── PerformanceConfig (Performance tuning)
    ├── InstrumentationConfig (Instrumentation behavior)
    └── ParsingConfig (Tree-sitter parsing settings)

Usage Examples:
    # Basic configuration
    config = Configuration()
    
    # Custom configuration
    config = Configuration(
        logging=LoggingConfig(level="DEBUG", enable_file_logging=True),
        performance=PerformanceConfig(max_file_size_mb=100),
        validation=ValidationConfig(strict_mode=True)
    )
    
    # Load from file
    config = load_config("instrumenter_config.yaml")
"""

import logging
import os
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Dict, List, Set, Optional, Any, Union
import json

# Optional YAML support
try:
    import yaml
    YAML_AVAILABLE = True
except ImportError:
    yaml = None
    YAML_AVAILABLE = False


# Logging level enumeration for type safety
class LogLevel(Enum):
    """Enumeration of logging levels for type safety"""
    DEBUG = "DEBUG"
    INFO = "INFO" 
    WARNING = "WARNING"
    ERROR = "ERROR"
    CRITICAL = "CRITICAL"


# Instrumentation mode enumeration
class InstrumentationMode(Enum):
    """Enumeration of instrumentation modes"""
    DRY_RUN = "dry_run"
    BACKUP_AND_MODIFY = "backup_and_modify"
    IN_PLACE = "in_place"
    OUTPUT_TO_DIRECTORY = "output_to_directory"


@dataclass(frozen=True)
class LoggingConfig:
    """
    Immutable logging configuration settings.
    
    This class manages all logging-related configuration including levels,
    formats, output destinations, and rotation settings.
    """
    level: LogLevel = LogLevel.INFO
    enable_console_logging: bool = True
    enable_file_logging: bool = False
    log_file_path: Optional[Path] = None
    log_format: str = "%(asctime)s - %(name)s - %(levelname)s - %(filename)s:%(lineno)d - %(message)s"
    date_format: str = "%Y-%m-%d %H:%M:%S"
    max_log_file_size_mb: int = 10
    max_log_files: int = 5
    enable_color_logging: bool = True


@dataclass(frozen=True)
class ValidationConfig:
    """
    Immutable validation configuration settings.
    
    This class manages input validation rules and constraints.
    """
    strict_mode: bool = False
    max_file_size_mb: int = 50
    allowed_file_extensions: Set[str] = field(default_factory=lambda: {'.c', '.h'})
    require_backup_before_modification: bool = True
    validate_syntax_before_instrumentation: bool = True
    validate_syntax_after_instrumentation: bool = True


@dataclass(frozen=True)
class PerformanceConfig:
    """
    Immutable performance configuration settings.
    
    This class manages performance tuning parameters.
    """
    max_parallel_jobs: int = field(default_factory=lambda: min(8, os.cpu_count() or 1))
    chunk_size_for_parallel_processing: int = 100
    memory_limit_mb: int = 1024
    timeout_per_file_seconds: int = 60
    enable_caching: bool = True
    cache_size_limit_mb: int = 100


@dataclass(frozen=True)
class InstrumentationConfig:
    """
    Immutable instrumentation behavior configuration.
    
    This class manages how instrumentation is applied.
    """
    mode: InstrumentationMode = InstrumentationMode.BACKUP_AND_MODIFY
    backup_directory: Optional[Path] = None
    output_directory: Optional[Path] = None
    preserve_original_formatting: bool = True
    add_instrumentation_comments: bool = True
    instrument_headers: bool = False
    skip_system_headers: bool = True


@dataclass(frozen=True)
class ParsingConfig:
    """
    Immutable parsing configuration settings.
    
    This class manages tree-sitter parsing behavior.
    """
    language: str = "c"
    language_library_path: Optional[Path] = None
    enable_error_recovery: bool = True
    max_parse_tree_depth: int = 1000
    timeout_per_parse_seconds: int = 30


@dataclass(frozen=True)
class Configuration:
    """
    Immutable main configuration object.
    
    This is the root configuration object that contains all other configuration
    categories. It provides a single point of access for all configuration settings.
    """
    logging: LoggingConfig = field(default_factory=LoggingConfig)
    validation: ValidationConfig = field(default_factory=ValidationConfig)
    performance: PerformanceConfig = field(default_factory=PerformanceConfig)
    instrumentation: InstrumentationConfig = field(default_factory=InstrumentationConfig)
    parsing: ParsingConfig = field(default_factory=ParsingConfig)
    custom_settings: Dict[str, Any] = field(default_factory=dict)
    
    def __post_init__(self):
        """Post-initialization validation"""
        # Validate interdependent settings
        if self.performance.max_parallel_jobs < 1:
            raise ValueError("max_parallel_jobs must be at least 1")
        
        if self.validation.max_file_size_mb < 1:
            raise ValueError("max_file_size_mb must be at least 1")
        
        # Validate paths exist if specified
        if self.logging.log_file_path and not self.logging.log_file_path.parent.exists():
            self.logging.log_file_path.parent.mkdir(parents=True, exist_ok=True)


def get_default_config() -> Configuration:
    """Get the default configuration object"""
    return Configuration()


def validate_config(config: Configuration) -> bool:
    """
    Validate a configuration object.
    
    Args:
        config: Configuration object to validate
        
    Returns:
        True if configuration is valid
        
    Raises:
        ValueError: If configuration is invalid
    """
    if not isinstance(config, Configuration):
        raise ValueError("config must be a Configuration object")
    
    # Additional validation logic can be added here
    return True


def load_config(config_path: Union[str, Path]) -> Configuration:
    """
    Load configuration from a file.
    
    Args:
        config_path: Path to configuration file (JSON or YAML)
        
    Returns:
        Configuration object
        
    Raises:
        FileNotFoundError: If config file doesn't exist
        ValueError: If config file is invalid
    """
    config_path = Path(config_path)
    if not config_path.exists():
        raise FileNotFoundError(f"Configuration file not found: {config_path}")
    
    with open(config_path, 'r', encoding='utf-8') as f:
        if config_path.suffix.lower() in {'.yaml', '.yml'}:
            if not YAML_AVAILABLE:
                raise ValueError("YAML support not available. Install PyYAML.")
            config_dict = yaml.safe_load(f)
        elif config_path.suffix.lower() == '.json':
            config_dict = json.load(f)
        else:
            raise ValueError(f"Unsupported config file format: {config_path.suffix}")
    
    return _dict_to_config(config_dict)


def _dict_to_config(config_dict: Dict[str, Any]) -> Configuration:
    """Convert a dictionary to a Configuration object"""
    # Extract nested configuration sections
    logging_data = config_dict.get('logging', {})
    validation_data = config_dict.get('validation', {})
    performance_data = config_dict.get('performance', {})
    instrumentation_data = config_dict.get('instrumentation', {})
    parsing_data = config_dict.get('parsing', {})
    custom_settings = config_dict.get('custom_settings', {})
    
    # Convert string enums back to enum objects
    if 'level' in logging_data:
        logging_data['level'] = LogLevel(logging_data['level'])
    
    if 'mode' in instrumentation_data:
        instrumentation_data['mode'] = InstrumentationMode(instrumentation_data['mode'])
    
    # Convert path strings back to Path objects
    for path_field in ['log_file_path']:
        if path_field in logging_data and logging_data[path_field]:
            logging_data[path_field] = Path(logging_data[path_field])
    
    for path_field in ['output_directory', 'backup_directory']:
        if path_field in instrumentation_data and instrumentation_data[path_field]:
            instrumentation_data[path_field] = Path(instrumentation_data[path_field])
    
    if 'language_library_path' in parsing_data and parsing_data['language_library_path']:
        parsing_data['language_library_path'] = Path(parsing_data['language_library_path'])
    
    # Convert allowed_file_extensions list back to set
    if 'allowed_file_extensions' in validation_data:
        validation_data['allowed_file_extensions'] = set(validation_data['allowed_file_extensions'])
    
    return Configuration(
        logging=LoggingConfig(**logging_data),
        validation=ValidationConfig(**validation_data),
        performance=PerformanceConfig(**performance_data),
        instrumentation=InstrumentationConfig(**instrumentation_data),
        parsing=ParsingConfig(**parsing_data),
        custom_settings=custom_settings
    )


# Legacy compatibility - keep the old DMAAPIConfig for backward compatibility
class DMAAPIConfig:
    """
    Legacy DMA API configuration class for backward compatibility.
    
    This class is maintained for compatibility with existing code.
    New code should use the new Configuration system.
    """
    
    # Comprehensive list of DMA APIs to instrument
    DMA_APIS: Set[str] = {
        # DMA allocation APIs
        'dma_alloc_coherent', 'dma_alloc_attrs', 'dma_alloc_wc',
        'dma_alloc_noncoherent', 'dma_zalloc_coherent',
        'pci_alloc_consistent', 'pci_zalloc_consistent',
        'dmam_alloc_coherent', 'dmam_alloc_attrs',
        
        # DMA pool APIs
        'dma_pool_create', 'dma_pool_destroy', 'dma_pool_alloc', 'dma_pool_zalloc',
        'dma_pool_free', 'pci_pool_create', 'pci_pool_destroy',
        
        # DMA mapping APIs
        'dma_map_single', 'dma_map_page', 'dma_map_sg', 'dma_map_sg_attrs',
        'dma_map_resource', 'pci_map_single', 'pci_map_page', 'pci_map_sg',
        
        # DMA unmapping APIs
        'dma_unmap_single', 'dma_unmap_page', 'dma_unmap_sg', 'dma_unmap_sg_attrs',
        'dma_unmap_resource', 'pci_unmap_single', 'pci_unmap_page', 'pci_unmap_sg',
        
        # DMA synchronization APIs
        'dma_sync_single_for_cpu', 'dma_sync_single_for_device',
        'dma_sync_sg_for_cpu', 'dma_sync_sg_for_device',
        'dma_sync_single_range_for_cpu', 'dma_sync_single_range_for_device',
        
        # DMA deallocation APIs
        'dma_free_coherent', 'dma_free_attrs', 'dma_free_wc',
        'dma_free_noncoherent', 'pci_free_consistent',
        'dmam_free_coherent', '__dma_free_coherent',
    }
    
    # File patterns to skip
    SKIP_PATTERNS: Set[str] = {
        'test', 'tests', '__pycache__', '.git', 'build', 'CMakeFiles'
    }
    
    @classmethod
    def get_dma_apis(cls) -> Set[str]:
        """Get the set of DMA APIs to instrument"""
        return cls.DMA_APIS.copy()
    
    @classmethod
    def add_custom_api(cls, api_name: str) -> None:
        """Add a custom DMA API to the list"""
        cls.DMA_APIS.add(api_name)
    
    @classmethod
    def remove_api(cls, api_name: str) -> None:
        """Remove a DMA API from the list"""
        cls.DMA_APIS.discard(api_name)


# Re-export everything for public API
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
    'DMAAPIConfig',  # Legacy compatibility
]
