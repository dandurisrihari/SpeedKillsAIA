#!/usr/bin/env python3
"""
Configuration management for the preprocess module

This package handles configuration settings, defaults, and validation
for the kernel log parser.
"""

from .settings import ParserSettings, OutputSettings

__all__ = [
    'ParserSettings',
    'OutputSettings'
]
