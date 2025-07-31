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
    
    Attributes:
        level: Logging level (DEBUG, INFO, WARNING, ERROR, CRITICAL)
        enable_console_logging: Enable/disable console output
        enable_file_logging: Enable/disable file logging
        log_file_path: Path to log file (if file logging enabled)
        log_format: Format string for log messages
        date_format: Format string for timestamps
        max_log_file_size_mb: Maximum log file size before rotation
        max_log_files: Maximum number of rotated log files to keep
        enable_color_logging: Enable colored console output
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
    
    def __post_init__(self):
        """Validate configuration after initialization"""
        if self.enable_file_logging and not self.log_file_path:
            raise ValueError("log_file_path must be specified when file logging is enabled")
        
        if self.max_log_file_size_mb <= 0:
            raise ValueError("max_log_file_size_mb must be positive")
        
        if self.max_log_files <= 0:
            raise ValueError("max_log_files must be positive")


@dataclass(frozen=True)
class ValidationConfig:
    """
    Immutable validation configuration settings.
    
    This class manages validation rules and constraints for input processing.
    
    Attributes:
        strict_mode: Enable strict validation (fail on any validation error)
        max_file_size_mb: Maximum file size to process (0 = no limit)
        allowed_file_extensions: Set of allowed file extensions
        forbidden_paths: List of path patterns to skip
        validate_syntax: Enable C syntax validation before processing
        max_functions_per_file: Maximum functions per file (0 = no limit)
        skip_binary_files: Skip files that appear to be binary
        encoding_detection: Enable automatic encoding detection
        required_encoding: Required file encoding (None = auto-detect)
    """
    strict_mode: bool = False
    max_file_size_mb: int = 50
    allowed_file_extensions: Set[str] = field(default_factory=lambda: {'.c', '.h', '.cpp', '.cc', '.cxx'})
    forbidden_paths: List[str] = field(default_factory=lambda: ['test/', 'tests/', '__pycache__/', '.git/'])
    validate_syntax: bool = True
    max_functions_per_file: int = 0  # 0 = no limit
    skip_binary_files: bool = True
    encoding_detection: bool = True
    required_encoding: Optional[str] = None
    
    def __post_init__(self):
        """Validate configuration after initialization"""
        if self.max_file_size_mb < 0:
            raise ValueError("max_file_size_mb cannot be negative")
        
        if self.max_functions_per_file < 0:
            raise ValueError("max_functions_per_file cannot be negative")
        
        if not self.allowed_file_extensions:
            raise ValueError("allowed_file_extensions cannot be empty")


@dataclass(frozen=True)
class PerformanceConfig:
    """
    Immutable performance tuning configuration.
    
    This class manages performance-related settings for the instrumenter.
    
    Attributes:
        max_workers: Maximum number of worker threads (0 = auto-detect)
        chunk_size: Number of files to process per batch
        memory_limit_mb: Memory usage limit in MB (0 = no limit)
        cache_parsed_trees: Cache tree-sitter parse trees
        cache_size_mb: Maximum cache size in MB
        parallel_analysis: Enable parallel analysis of multiple files
        progress_reporting: Enable progress reporting for long operations
        timeout_seconds: Timeout for individual file processing (0 = no timeout)
    """
    max_workers: int = 0  # 0 = auto-detect based on CPU count
    chunk_size: int = 100
    memory_limit_mb: int = 0  # 0 = no limit
    cache_parsed_trees: bool = True
    cache_size_mb: int = 256
    parallel_analysis: bool = True
    progress_reporting: bool = True
    timeout_seconds: int = 0  # 0 = no timeout
    
    def __post_init__(self):
        """Validate configuration after initialization"""
        if self.max_workers < 0:
            raise ValueError("max_workers cannot be negative")
        
        if self.chunk_size <= 0:
            raise ValueError("chunk_size must be positive")
        
        if self.memory_limit_mb < 0:
            raise ValueError("memory_limit_mb cannot be negative")
        
        if self.cache_size_mb <= 0:
            raise ValueError("cache_size_mb must be positive")
        
        if self.timeout_seconds < 0:
            raise ValueError("timeout_seconds cannot be negative")


@dataclass(frozen=True)
class InstrumentationConfig:
    """
    Immutable instrumentation behavior configuration.
    
    This class manages how the instrumentation process behaves.
    
    Attributes:
        mode: Instrumentation mode (dry_run, backup_and_modify, etc.)
        output_directory: Directory for output files (if using output mode)
        backup_directory: Directory for backup files
        backup_suffix: Suffix for backup files
        preserve_formatting: Attempt to preserve original code formatting
        add_header_comments: Add instrumentation header comments
        instrumentation_prefix: Prefix for instrumentation log messages
        timestamp_format: Format for timestamps in instrumentation
        include_file_info: Include file/line info in instrumentation
    """
    mode: InstrumentationMode = InstrumentationMode.BACKUP_AND_MODIFY
    output_directory: Optional[Path] = None
    backup_directory: Optional[Path] = None
    backup_suffix: str = ".backup"
    preserve_formatting: bool = True
    add_header_comments: bool = True
    instrumentation_prefix: str = "KINSTR"
    timestamp_format: str = "%Y-%m-%d %H:%M:%S.%f"
    include_file_info: bool = True
    
    def __post_init__(self):
        """Validate configuration after initialization"""
        if self.mode == InstrumentationMode.OUTPUT_TO_DIRECTORY and not self.output_directory:
            raise ValueError("output_directory required when using OUTPUT_TO_DIRECTORY mode")
        
        if not self.backup_suffix:
            raise ValueError("backup_suffix cannot be empty")
        
        if not self.instrumentation_prefix:
            raise ValueError("instrumentation_prefix cannot be empty")


@dataclass(frozen=True)
class ParsingConfig:
    """
    Immutable parsing configuration for tree-sitter.
    
    This class manages tree-sitter parsing behavior and settings.
    
    Attributes:
        language_library_path: Path to tree-sitter C language library
        max_parse_depth: Maximum parse tree depth
        error_recovery: Enable error recovery during parsing
        include_trivia: Include comments and whitespace in parse tree
        timeout_ms: Parse timeout in milliseconds
        memory_limit_mb: Memory limit for parsing in MB
    """
    language_library_path: Optional[Path] = None
    max_parse_depth: int = 1000
    error_recovery: bool = True
    include_trivia: bool = False
    timeout_ms: int = 5000
    memory_limit_mb: int = 100
    
    def __post_init__(self):
        """Validate configuration after initialization"""
        if self.max_parse_depth <= 0:
            raise ValueError("max_parse_depth must be positive")
        
        if self.timeout_ms <= 0:
            raise ValueError("timeout_ms must be positive")
        
        if self.memory_limit_mb <= 0:
            raise ValueError("memory_limit_mb must be positive")


@dataclass(frozen=True)
class Configuration:
    """
    Main immutable configuration class that combines all configuration aspects.
    
    This is the primary configuration class that applications should use.
    It combines all specialized configuration classes into a single,
    thread-safe, immutable configuration object.
    
    Attributes:
        logging: Logging configuration
        validation: Input validation configuration
        performance: Performance tuning configuration
        instrumentation: Instrumentation behavior configuration
        parsing: Tree-sitter parsing configuration
        custom_settings: Dictionary for additional custom settings
    """
    logging: LoggingConfig = field(default_factory=LoggingConfig)
    validation: ValidationConfig = field(default_factory=ValidationConfig)
    performance: PerformanceConfig = field(default_factory=PerformanceConfig)
    instrumentation: InstrumentationConfig = field(default_factory=InstrumentationConfig)
    parsing: ParsingConfig = field(default_factory=ParsingConfig)
    custom_settings: Dict[str, Any] = field(default_factory=dict)
    
    def get_setting(self, key: str, default: Any = None) -> Any:
        """
        Get a custom setting value.
        
        Args:
            key: Setting key
            default: Default value if key not found
            
        Returns:
            Setting value or default
        """
        return self.custom_settings.get(key, default)
    
    def to_dict(self) -> Dict[str, Any]:
        """
        Convert configuration to dictionary for serialization.
        
        Returns:
            Dictionary representation of configuration
        """
        return {
            'logging': {
                'level': self.logging.level.value,
                'enable_console_logging': self.logging.enable_console_logging,
                'enable_file_logging': self.logging.enable_file_logging,
                'log_file_path': str(self.logging.log_file_path) if self.logging.log_file_path else None,
                'log_format': self.logging.log_format,
                'date_format': self.logging.date_format,
                'max_log_file_size_mb': self.logging.max_log_file_size_mb,
                'max_log_files': self.logging.max_log_files,
                'enable_color_logging': self.logging.enable_color_logging,
            },
            'validation': {
                'strict_mode': self.validation.strict_mode,
                'max_file_size_mb': self.validation.max_file_size_mb,
                'allowed_file_extensions': list(self.validation.allowed_file_extensions),
                'forbidden_paths': self.validation.forbidden_paths,
                'validate_syntax': self.validation.validate_syntax,
                'max_functions_per_file': self.validation.max_functions_per_file,
                'skip_binary_files': self.validation.skip_binary_files,
                'encoding_detection': self.validation.encoding_detection,
                'required_encoding': self.validation.required_encoding,
            },
            'performance': {
                'max_workers': self.performance.max_workers,
                'chunk_size': self.performance.chunk_size,
                'memory_limit_mb': self.performance.memory_limit_mb,
                'cache_parsed_trees': self.performance.cache_parsed_trees,
                'cache_size_mb': self.performance.cache_size_mb,
                'parallel_analysis': self.performance.parallel_analysis,
                'progress_reporting': self.performance.progress_reporting,
                'timeout_seconds': self.performance.timeout_seconds,
            },
            'instrumentation': {
                'mode': self.instrumentation.mode.value,
                'output_directory': str(self.instrumentation.output_directory) if self.instrumentation.output_directory else None,
                'backup_directory': str(self.instrumentation.backup_directory) if self.instrumentation.backup_directory else None,
                'backup_suffix': self.instrumentation.backup_suffix,
                'preserve_formatting': self.instrumentation.preserve_formatting,
                'add_header_comments': self.instrumentation.add_header_comments,
                'instrumentation_prefix': self.instrumentation.instrumentation_prefix,
                'timestamp_format': self.instrumentation.timestamp_format,
                'include_file_info': self.instrumentation.include_file_info,
            },
            'parsing': {
                'language_library_path': str(self.parsing.language_library_path) if self.parsing.language_library_path else None,
                'max_parse_depth': self.parsing.max_parse_depth,
                'error_recovery': self.parsing.error_recovery,
                'include_trivia': self.parsing.include_trivia,
                'timeout_ms': self.parsing.timeout_ms,
                'memory_limit_mb': self.parsing.memory_limit_mb,
            },
            'custom_settings': self.custom_settings,
        }


def get_default_config() -> Configuration:
    """
    Get the default configuration with sensible defaults for production use.
    
    Returns:
        Default Configuration instance
    """
    return Configuration(
        logging=LoggingConfig(
            level=LogLevel.INFO,
            enable_console_logging=True,
            enable_file_logging=False,
        ),
        validation=ValidationConfig(
            strict_mode=False,
            max_file_size_mb=50,
            skip_binary_files=True,
        ),
        performance=PerformanceConfig(
            max_workers=0,  # Auto-detect
            parallel_analysis=True,
            progress_reporting=True,
        ),
        instrumentation=InstrumentationConfig(
            mode=InstrumentationMode.BACKUP_AND_MODIFY,
            preserve_formatting=True,
            add_header_comments=True,
        ),
        parsing=ParsingConfig(
            error_recovery=True,
            timeout_ms=5000,
        )
    )


def validate_config(config: Configuration) -> List[str]:
    """
    Validate a configuration object and return any validation errors.
    
    Args:
        config: Configuration object to validate
        
    Returns:
        List of validation error messages (empty if valid)
    """
    errors = []
    
    try:
        # Validate logging config
        if config.logging.enable_file_logging and not config.logging.log_file_path:
            errors.append("Logging: log_file_path required when file logging is enabled")
        
        # Validate performance config
        if config.performance.max_workers < 0:
            errors.append("Performance: max_workers cannot be negative")
        
        # Validate instrumentation config
        if (config.instrumentation.mode == InstrumentationMode.OUTPUT_TO_DIRECTORY and 
            not config.instrumentation.output_directory):
            errors.append("Instrumentation: output_directory required for OUTPUT_TO_DIRECTORY mode")
        
        # Validate parsing config
        if config.parsing.max_parse_depth <= 0:
            errors.append("Parsing: max_parse_depth must be positive")
            
    except Exception as e:
        errors.append(f"Configuration validation error: {str(e)}")
    
    return errors


def load_config(config_path: Union[str, Path]) -> Configuration:
    """
    Load configuration from a file (JSON or YAML format).
    
    Args:
        config_path: Path to configuration file
        
    Returns:
        Loaded Configuration instance
        
    Raises:
        FileNotFoundError: If config file doesn't exist
        ValueError: If config file is invalid
    """
    config_path = Path(config_path)
    
    if not config_path.exists():
        raise FileNotFoundError(f"Configuration file not found: {config_path}")
    
    try:
        with open(config_path, 'r', encoding='utf-8') as f:
            if config_path.suffix.lower() in ['.yaml', '.yml']:
                if not YAML_AVAILABLE:
                    raise ValueError("PyYAML is required for YAML config files. Install with: pip install PyYAML")
                config_data = yaml.safe_load(f)
            elif config_path.suffix.lower() == '.json':
                config_data = json.load(f)
            else:
                raise ValueError(f"Unsupported config file format: {config_path.suffix}")
        
        # Convert loaded data to Configuration object
        return _dict_to_config(config_data)
        
    except Exception as e:
        raise ValueError(f"Error loading configuration from {config_path}: {str(e)}")


def _dict_to_config(config_dict: Dict[str, Any]) -> Configuration:
    """
    Convert a dictionary to a Configuration object.
    
    Args:
        config_dict: Dictionary containing configuration data
        
    Returns:
        Configuration instance
    """
    # Extract each configuration section
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
