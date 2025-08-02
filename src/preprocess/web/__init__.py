#!/usr/bin/env python3
"""
Web interface for kernel log parsing results
"""

from .ui import create_app, load_data, main

__all__ = ['create_app', 'load_data', 'main']
