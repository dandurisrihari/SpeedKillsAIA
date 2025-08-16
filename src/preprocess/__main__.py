#!/usr/bin/env python3
"""
Main entry point for the kernel log parser tool

This allows running the tool as a module:
    python -m src.preprocess
"""

from .cli import cli_main

if __name__ == "__main__":
    cli_main()
