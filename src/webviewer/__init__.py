#!/usr/bin/env python3
"""
Web Viewer - Interactive web interface for kernel log analysis results

Provides a standalone web interface for viewing JSON results produced
by the kernel log preprocessing module.
"""

from .ui import create_app, load_data, start_web_ui
from .cli import main

__all__ = ['create_app', 'load_data', 'start_web_ui', 'main']
