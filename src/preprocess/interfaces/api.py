#!/usr/bin/env python3
"""
Programmatic API interface for the kernel log parser

This module provides a clean, simple API for integrating the parser
into other Python applications and scripts.
"""

from typing import Dict, List, Optional, Union
from pathlib import Path
import json

from ..core.engine import KernelLogParserEngine
from ..config.settings import ParserSettings, OutputSettings


class ProgrammaticAPI:
    """
    Clean programmatic interface for the kernel log parser
    
    This class provides a simplified API for using the parser in Python code,
    hiding the complexity of the internal engine while providing full control
    over configuration and behavior.
    """
    
    def __init__(self, config: Optional[ParserSettings] = None):
        """
        Initialize the API with optional configuration
        
        Args:
            config: Parser configuration settings. If None, uses defaults.
        """
        self.config = config or ParserSettings()
        self.engine = None
        self.last_results = None
    
    def parse_file(self, log_file: Union[str, Path], 
                   output_file: Optional[Union[str, Path]] = None) -> Dict:
        """
        Parse a single log file and return results
        
        Args:
            log_file: Path to the log file to parse
            output_file: Optional path to save JSON results
            
        Returns:
            Dictionary containing parsing results
            
        Raises:
            FileNotFoundError: If log file doesn't exist
            PermissionError: If unable to read log file or write output
            ValueError: If log file format is invalid
        """
        # Validate inputs
        log_path = Path(log_file)
        if not log_path.exists():
            raise FileNotFoundError(f"Log file not found: {log_path}")
        
        # Create engine with current configuration
        self.engine = KernelLogParserEngine(
            show_ui=self.config.show_ui,
            source_root_path=self.config.source_root_path
        )
        
        # Parse the file
        try:
            results = self.engine.parse_log_file(str(log_path), str(output_file) if output_file else None)
            
            # Convert to dict if needed and store
            if hasattr(results, 'to_dict'):
                self.last_results = results.to_dict()
            else:
                self.last_results = results
                
            return self.last_results
            
        except Exception as e:
            raise ValueError(f"Failed to parse log file: {e}") from e
    
    def parse_text(self, log_content: str) -> Dict:
        """
        Parse log content from a string
        
        Args:
            log_content: Log content as a string
            
        Returns:
            Dictionary containing parsing results
        """
        # Create a temporary file with the content
        import tempfile
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as temp_file:
            temp_file.write(log_content)
            temp_file.flush()
            
            try:
                return self.parse_file(temp_file.name)
            finally:
                # Clean up temporary file
                Path(temp_file.name).unlink(missing_ok=True)
    
    def get_statistics(self) -> Optional[Dict]:
        """
        Get statistics from the last parsing operation
        
        Returns:
            Statistics dictionary or None if no parsing has been done
        """
        if self.last_results:
            return self.last_results.get('statistics')
        return None
    
    def get_function_entries(self) -> List[Dict]:
        """Get function entries from last parsing operation"""
        if self.last_results:
            return self.last_results.get('function_entries', [])
        return []
    
    def get_dma_operations(self) -> List[Dict]:
        """Get DMA operations from last parsing operation"""
        if self.last_results:
            return self.last_results.get('dma_operations', [])
        return []
    
    def get_user_copy_operations(self) -> List[Dict]:
        """Get user copy operations from last parsing operation"""
        if self.last_results:
            return self.last_results.get('user_copy_operations', [])
        return []
    
    def get_ioctl_operations(self) -> List[Dict]:
        """Get IOCTL operations from last parsing operation"""
        if self.last_results:
            return self.last_results.get('ioctl_operations', [])
        return []
    
    def save_results(self, output_file: Union[str, Path], 
                    indent: bool = True) -> None:
        """
        Save the last results to a JSON file
        
        Args:
            output_file: Path to save the results
            indent: Whether to indent the JSON for readability
            
        Raises:
            ValueError: If no results available to save
            PermissionError: If unable to write to output file
        """
        if not self.last_results:
            raise ValueError("No results available to save. Parse a file first.")
        
        output_path = Path(output_file)
        
        try:
            with open(output_path, 'w', encoding='utf-8') as f:
                json.dump(self.last_results, f, indent=2 if indent else None, sort_keys=True)
        except Exception as e:
            raise PermissionError(f"Failed to write results to {output_path}: {e}") from e
    
    def configure(self, **kwargs) -> None:
        """
        Update configuration settings
        
        Args:
            **kwargs: Configuration parameters to update
            
        Example:
            api.configure(show_ui=False, source_root_path='/kernel/src')
        """
        for key, value in kwargs.items():
            if hasattr(self.config, key):
                setattr(self.config, key, value)
            else:
                raise ValueError(f"Unknown configuration parameter: {key}")
        
        # Validate updated configuration
        self.config.validate()


# Convenience functions for simple use cases
def parse_log(log_file: Union[str, Path], 
              output_file: Optional[Union[str, Path]] = None,
              show_ui: bool = True,
              source_root: Optional[str] = None) -> Dict:
    """
    Convenience function to parse a log file with minimal configuration
    
    Args:
        log_file: Path to log file
        output_file: Optional output JSON file
        show_ui: Whether to show progress UI
        source_root: Optional source root path for function extraction
        
    Returns:
        Dictionary with parsing results
    """
    config = ParserSettings(show_ui=show_ui, source_root_path=source_root)
    api = ProgrammaticAPI(config)
    return api.parse_file(log_file, output_file)


def parse_text(log_content: str, show_ui: bool = False) -> Dict:
    """
    Convenience function to parse log content from a string
    
    Args:
        log_content: Log content as string
        show_ui: Whether to show progress UI
        
    Returns:
        Dictionary with parsing results
    """
    config = ParserSettings(show_ui=show_ui)
    api = ProgrammaticAPI(config)
    return api.parse_text(log_content)
