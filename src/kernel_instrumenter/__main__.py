#!/usr/bin/env python3
"""
Main entry point for the kernel instrumenter module

This allows running the kernel instrumenter as a module:
    python -m src.kernel_instrumenter
"""

from .kernel_instrument import main

if __name__ == "__main__":
    main()
