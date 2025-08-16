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
        self.output = OutputSettings()
    
    def validate_all(self) -> bool:
        """Validate all configuration settings"""
        return (
            self.parser.validate() and
            self.output.validate()
        )
    
    def load_from_dict(self, config_dict: dict) -> None:
        """Load configuration from dictionary"""
        if 'parser' in config_dict:
            for key, value in config_dict['parser'].items():
                if hasattr(self.parser, key):
                    setattr(self.parser, key, value)
        
        if 'output' in config_dict:
            for key, value in config_dict['output'].items():
                if hasattr(self.output, key):
                    setattr(self.output, key, value)
    
    def to_dict(self) -> dict:
        """Export configuration to dictionary"""
        return {
            'parser': self.parser.__dict__,
            'output': self.output.__dict__
        }


# Default configuration instance
default_config = ConfigurationManager()
