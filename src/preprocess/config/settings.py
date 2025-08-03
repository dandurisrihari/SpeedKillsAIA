#!/usr/bin/env python3
"""
Configuration settings for the kernel log parser

This module defines configuration classes that control various aspects
of the parsing process, output generation, and web UI behavior.
"""

from dataclasses import dataclass
from typing import Optional, List
from pathlib import Path


@dataclass
class ParserSettings:
    """
    Settings for the core parsing engine
    
    Controls how the parser processes log files and extracts information.
    """
    
    # UI and progress display
    show_ui: bool = True
    verbose: bool = False
    
    # File handling
    source_root_path: Optional[str] = None
    encoding: str = 'utf-8'
    ignore_errors: bool = True
    
    # Parsing behavior
    enable_deduplication: bool = True
    extract_function_code: bool = True
    capture_stack_traces: bool = True
    
    # Performance tuning
    progress_update_interval: int = 100  # Update UI every N lines
    max_stack_trace_lines: int = 50      # Limit stack trace size
    
    def validate(self) -> bool:
        """Validate configuration settings"""
        if self.source_root_path:
            source_path = Path(self.source_root_path)
            if not source_path.exists():
                raise ValueError(f"Source root path does not exist: {self.source_root_path}")
        
        if self.progress_update_interval <= 0:
            raise ValueError("Progress update interval must be positive")
            
        if self.max_stack_trace_lines <= 0:
            raise ValueError("Max stack trace lines must be positive")
            
        return True


@dataclass 
class WebUISettings:
    """
    Settings for the web user interface
    
    Controls web server behavior, styling, and feature availability.
    """
    
    # Server configuration
    host: str = '127.0.0.1'
    port: int = 5000
    debug: bool = False
    auto_open_browser: bool = True
    
    # UI behavior
    enable_search: bool = True
    enable_filtering: bool = True
    show_function_code: bool = True
    show_stack_traces: bool = True
    
    # Display limits
    max_items_per_page: int = 1000
    max_search_results: int = 100
    max_function_code_lines: int = 500  # Limit function code display
    enable_lazy_loading: bool = True    # Enable lazy loading for function code
    
    def validate(self) -> bool:
        """Validate web UI settings"""
        if not (1 <= self.port <= 65535):
            raise ValueError(f"Port must be between 1 and 65535, got {self.port}")
            
        if self.max_items_per_page <= 0:
            raise ValueError("Max items per page must be positive")
            
        if self.max_search_results <= 0:
            raise ValueError("Max search results must be positive")
            
        if self.max_function_code_lines <= 0:
            raise ValueError("Max function code lines must be positive")
            
        return True


@dataclass
class OutputSettings:
    """
    Settings for output generation and formatting
    
    Controls how results are written to files and displayed to users.
    """
    
    # JSON output
    indent_json: bool = True
    json_indent_size: int = 2
    sort_json_keys: bool = True
    
    # Statistics and reporting
    include_statistics: bool = True
    include_metadata: bool = True
    include_file_analysis: bool = True
    
    # Output paths
    default_output_extension: str = '.json'
    backup_results: bool = False
    
    # Content filtering
    include_function_code: bool = True
    include_stack_traces: bool = True
    include_duplicate_info: bool = True
    
    def validate(self) -> bool:
        """Validate output settings"""
        if self.json_indent_size < 0:
            raise ValueError("JSON indent size cannot be negative")
            
        if not self.default_output_extension.startswith('.'):
            raise ValueError("Output extension must start with a dot")
            
        return True


class ConfigurationManager:
    """
    Central configuration manager for the preprocess module
    
    Manages all configuration settings and provides validation and defaults.
    """
    
    def __init__(self):
        self.parser = ParserSettings()
        self.web_ui = WebUISettings()
        self.output = OutputSettings()
    
    def validate_all(self) -> bool:
        """Validate all configuration settings"""
        return (
            self.parser.validate() and
            self.web_ui.validate() and
            self.output.validate()
        )
    
    def load_from_dict(self, config_dict: dict) -> None:
        """Load configuration from dictionary"""
        if 'parser' in config_dict:
            for key, value in config_dict['parser'].items():
                if hasattr(self.parser, key):
                    setattr(self.parser, key, value)
        
        if 'web_ui' in config_dict:
            for key, value in config_dict['web_ui'].items():
                if hasattr(self.web_ui, key):
                    setattr(self.web_ui, key, value)
        
        if 'output' in config_dict:
            for key, value in config_dict['output'].items():
                if hasattr(self.output, key):
                    setattr(self.output, key, value)
    
    def to_dict(self) -> dict:
        """Export configuration to dictionary"""
        return {
            'parser': self.parser.__dict__,
            'web_ui': self.web_ui.__dict__,
            'output': self.output.__dict__
        }


# Default configuration instance
default_config = ConfigurationManager()
