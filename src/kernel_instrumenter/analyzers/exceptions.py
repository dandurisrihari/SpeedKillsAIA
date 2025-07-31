#!/usr/bin/env python3
"""
Analyzer Exception Classes

This module defines comprehensive exception classes for all analyzer-related
errors, providing structured error handling and detailed error information.

Exception Hierarchy:
    AnalyzerError (Base)
    ├── ParseError (Parsing-related errors)
    ├── ValidationError (Input validation errors)
    ├── ConfigurationError (Configuration-related errors)
    ├── ResourceError (Resource-related errors)
    └── AnalysisError (Analysis logic errors)

Design Principles:
    - Structured error information with context
    - Clear error messages for debugging
    - Optional error recovery suggestions
    - Serializable error data for logging
    - Type safety with proper inheritance
"""

from typing import Optional, Dict, Any, List
from pathlib import Path


class AnalyzerError(Exception):
    """
    Base exception class for all analyzer-related errors.
    
    This is the root exception class that all other analyzer exceptions
    inherit from. It provides common functionality for error context,
    logging, and recovery suggestions.
    
    Attributes:
        message: Human-readable error message
        error_code: Machine-readable error code
        context: Additional context information
        suggestions: List of suggested recovery actions
        file_path: Path to file where error occurred (if applicable)
        line_number: Line number where error occurred (if applicable)
    """
    
    def __init__(self, 
                 message: str,
                 error_code: str = "ANALYZER_ERROR",
                 context: Optional[Dict[str, Any]] = None,
                 suggestions: Optional[List[str]] = None,
                 file_path: Optional[Path] = None,
                 line_number: Optional[int] = None):
        """
        Initialize analyzer error.
        
        Args:
            message: Human-readable error message
            error_code: Machine-readable error code
            context: Additional context information
            suggestions: List of suggested recovery actions
            file_path: Path to file where error occurred
            line_number: Line number where error occurred
        """
        super().__init__(message)
        self.message = message
        self.error_code = error_code
        self.context = context or {}
        self.suggestions = suggestions or []
        self.file_path = file_path
        self.line_number = line_number
    
    def __str__(self) -> str:
        """Get string representation of error"""
        parts = [f"[{self.error_code}] {self.message}"]
        
        if self.file_path:
            location = str(self.file_path)
            if self.line_number:
                location += f":{self.line_number}"
            parts.append(f"Location: {location}")
        
        if self.context:
            context_str = ", ".join(f"{k}={v}" for k, v in self.context.items())
            parts.append(f"Context: {context_str}")
        
        if self.suggestions:
            suggestions_str = "; ".join(self.suggestions)
            parts.append(f"Suggestions: {suggestions_str}")
        
        return " | ".join(parts)
    
    def to_dict(self) -> Dict[str, Any]:
        """
        Convert error to dictionary for serialization.
        
        Returns:
            Dictionary representation of error
        """
        return {
            'error_type': self.__class__.__name__,
            'message': self.message,
            'error_code': self.error_code,
            'context': self.context,
            'suggestions': self.suggestions,
            'file_path': str(self.file_path) if self.file_path else None,
            'line_number': self.line_number,
        }


class ParseError(AnalyzerError):
    """
    Exception raised when source code parsing fails.
    
    This exception is raised when tree-sitter parsing fails or when
    the parsed AST is invalid or incomplete.
    """
    
    def __init__(self, 
                 message: str,
                 parser_error: Optional[str] = None,
                 file_path: Optional[Path] = None,
                 line_number: Optional[int] = None,
                 column: Optional[int] = None):
        """
        Initialize parse error.
        
        Args:
            message: Human-readable error message
            parser_error: Original parser error message
            file_path: Path to file being parsed
            line_number: Line number where parsing failed
            column: Column number where parsing failed
        """
        context = {}
        if parser_error:
            context['parser_error'] = parser_error
        if column:
            context['column'] = column
        
        suggestions = [
            "Check for syntax errors in the source code",
            "Ensure file is valid C source code",
            "Check for incomplete function definitions or missing braces"
        ]
        
        super().__init__(
            message=message,
            error_code="PARSE_ERROR",
            context=context,
            suggestions=suggestions,
            file_path=file_path,
            line_number=line_number
        )


class ValidationError(AnalyzerError):
    """
    Exception raised when input validation fails.
    
    This exception is raised when input parameters, configuration,
    or source code fails validation checks.
    """
    
    def __init__(self, 
                 message: str,
                 validation_type: str = "unknown",
                 invalid_value: Optional[Any] = None,
                 expected_value: Optional[Any] = None,
                 file_path: Optional[Path] = None):
        """
        Initialize validation error.
        
        Args:
            message: Human-readable error message
            validation_type: Type of validation that failed
            invalid_value: The invalid value that caused the error
            expected_value: The expected value or format
            file_path: Path to file being validated
        """
        context = {'validation_type': validation_type}
        if invalid_value is not None:
            context['invalid_value'] = str(invalid_value)
        if expected_value is not None:
            context['expected_value'] = str(expected_value)
        
        suggestions = [
            "Check input parameters for correct format",
            "Verify configuration settings",
            "Ensure file meets requirements"
        ]
        
        super().__init__(
            message=message,
            error_code="VALIDATION_ERROR",
            context=context,
            suggestions=suggestions,
            file_path=file_path
        )


class ConfigurationError(AnalyzerError):
    """
    Exception raised when configuration is invalid or incomplete.
    
    This exception is raised when analyzer configuration is missing,
    invalid, or incompatible with the requested operation.
    """
    
    def __init__(self, 
                 message: str,
                 config_key: Optional[str] = None,
                 config_value: Optional[Any] = None,
                 analyzer_type: Optional[str] = None):
        """
        Initialize configuration error.
        
        Args:
            message: Human-readable error message
            config_key: Configuration key that caused the error
            config_value: Invalid configuration value
            analyzer_type: Type of analyzer with configuration issue
        """
        context = {}
        if config_key:
            context['config_key'] = config_key
        if config_value is not None:
            context['config_value'] = str(config_value)
        if analyzer_type:
            context['analyzer_type'] = analyzer_type
        
        suggestions = [
            "Check configuration file syntax",
            "Verify all required configuration keys are present",
            "Ensure configuration values are within valid ranges"
        ]
        
        super().__init__(
            message=message,
            error_code="CONFIGURATION_ERROR",
            context=context,
            suggestions=suggestions
        )


class ResourceError(AnalyzerError):
    """
    Exception raised when resource-related operations fail.
    
    This exception is raised when file I/O operations fail, memory
    limits are exceeded, or other resource constraints are hit.
    """
    
    def __init__(self, 
                 message: str,
                 resource_type: str = "unknown",
                 resource_limit: Optional[str] = None,
                 current_usage: Optional[str] = None,
                 file_path: Optional[Path] = None):
        """
        Initialize resource error.
        
        Args:
            message: Human-readable error message
            resource_type: Type of resource (memory, file, etc.)
            resource_limit: Resource limit that was exceeded
            current_usage: Current resource usage
            file_path: Path to file involved in resource error
        """
        context = {'resource_type': resource_type}
        if resource_limit:
            context['resource_limit'] = resource_limit
        if current_usage:
            context['current_usage'] = current_usage
        
        suggestions = [
            "Check available system resources",
            "Consider processing smaller files",
            "Increase resource limits if possible"
        ]
        
        super().__init__(
            message=message,
            error_code="RESOURCE_ERROR",
            context=context,
            suggestions=suggestions,
            file_path=file_path
        )


class AnalysisError(AnalyzerError):
    """
    Exception raised when analysis logic encounters an error.
    
    This exception is raised when the analyzer logic itself fails,
    encounters unexpected conditions, or produces invalid results.
    """
    
    def __init__(self, 
                 message: str,
                 analysis_phase: str = "unknown",
                 analyzer_type: Optional[str] = None,
                 file_path: Optional[Path] = None,
                 line_number: Optional[int] = None):
        """
        Initialize analysis error.
        
        Args:
            message: Human-readable error message
            analysis_phase: Phase of analysis where error occurred
            analyzer_type: Type of analyzer that failed
            file_path: Path to file being analyzed
            line_number: Line number where analysis failed
        """
        context = {'analysis_phase': analysis_phase}
        if analyzer_type:
            context['analyzer_type'] = analyzer_type
        
        suggestions = [
            "Check if source code pattern is supported",
            "Report issue if error persists",
            "Try with simpler code structure"
        ]
        
        super().__init__(
            message=message,
            error_code="ANALYSIS_ERROR",
            context=context,
            suggestions=suggestions,
            file_path=file_path,
            line_number=line_number
        )


def handle_analyzer_error(error: AnalyzerError, logger=None) -> Dict[str, Any]:
    """
    Handle an analyzer error by logging it and returning error information.
    
    Args:
        error: AnalyzerError instance
        logger: Optional logger instance
        
    Returns:
        Dictionary containing error information
    """
    error_info = error.to_dict()
    
    if logger:
        logger.error(f"Analyzer error: {error}")
        if error.context:
            logger.debug(f"Error context: {error.context}")
        if error.suggestions:
            logger.info(f"Suggestions: {'; '.join(error.suggestions)}")
    
    return error_info


def create_parse_error(message: str, **kwargs) -> ParseError:
    """Factory function to create ParseError with common patterns"""
    return ParseError(message, **kwargs)


def create_validation_error(message: str, **kwargs) -> ValidationError:
    """Factory function to create ValidationError with common patterns"""
    return ValidationError(message, **kwargs)


def create_configuration_error(message: str, **kwargs) -> ConfigurationError:
    """Factory function to create ConfigurationError with common patterns"""
    return ConfigurationError(message, **kwargs)


def create_resource_error(message: str, **kwargs) -> ResourceError:
    """Factory function to create ResourceError with common patterns"""
    return ResourceError(message, **kwargs)


def create_analysis_error(message: str, **kwargs) -> AnalysisError:
    """Factory function to create AnalysisError with common patterns"""
    return AnalysisError(message, **kwargs)
