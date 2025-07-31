"""
Analysis components for the instrumentation system.

This module contains analyzers that detect different types of function calls
and code patterns that need to be instrumented.
"""

from .analyzer import DMACallAnalyzer

__all__ = ['DMACallAnalyzer']
