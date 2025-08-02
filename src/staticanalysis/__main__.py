#!/usr/bin/env python3
"""
Main entry point for the static analysis module

This allows running the static analysis tools as a module:
    python -m src.staticanalysis
"""

from .bitcodegen import main

if __name__ == "__main__":
    main()
