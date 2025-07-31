"""
Core business logic for the instrumentation system.

This module contains the main coordination and processing logic
for the instrumentation workflow.
"""

from .core import DMAInstrumenter
from .processor import DirectoryProcessor

__all__ = ['DMAInstrumenter', 'DirectoryProcessor']
