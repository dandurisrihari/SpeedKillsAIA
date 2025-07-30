#!/usr/bin/env python3
"""
DMA Instrumentation Tool - Main Entry Point

This is the main entry point for the modular DMA instrumentation tool.
It imports and runs the command-line interface from the modular package.

Usage:
    python dma_instrument.py /path/to/kernel/source --dry-run
    python dma_instrument.py /path/to/kernel/source --test-limit 5
"""

from cli import main

if __name__ == "__main__":
    main()
