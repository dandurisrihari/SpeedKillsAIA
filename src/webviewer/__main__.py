#!/usr/bin/env python3
"""
Web Viewer module entry point

Allows running the web viewer as a module:
    python -m src.webviewer results.json
"""

from .cli import main

if __name__ == "__main__":
    main()
