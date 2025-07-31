#!/usr/bin/env python3
"""
Kernel Instrumentation Tool - Enhanced Multi-Type Entry Point

This is the main entry point for the enhanced kernel instrumentation tool.
It supports multiple instrumentation types with flexible configuration options.

Usage:
    # Instrument all types (default)
    python kernel_instrument.py /path/to/kernel/source
    
    # Only DMA calls
    python kernel_instrument.py --only-dma /path/to/kernel/source
    
    # Only user copy operations  
    python kernel_instrument.py --only-user-copy /path/to/kernel/source
    
    # Only function entries
    python kernel_instrument.py --only-functions /path/to/kernel/source
    
    # Disable specific types
    python kernel_instrument.py --no-dma /path/to/kernel/source
    
    # Dry run to preview changes
    python kernel_instrument.py --dry-run /path/to/kernel/source
"""

try:
    from .enhanced_cli import main
except ImportError:
    from enhanced_cli import main

if __name__ == "__main__":
    main()
