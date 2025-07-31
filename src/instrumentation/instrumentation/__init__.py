"""
Instrumentation components for the instrumentation system.

This module contains instrumenters that modify source code by adding
instrumentation statements at appropriate locations.
"""

from .instrumenter import FileInstrumenter

__all__ = ['FileInstrumenter']
