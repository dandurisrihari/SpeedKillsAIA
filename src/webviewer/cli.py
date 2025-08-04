#!/usr/bin/env python3
"""
Web Viewer CLI - Interactive web interface for kernel log analysis results

This module provides a web-based interface for viewing and analyzing 
kernel log parsing results. It can load JSON files produced by the 
preprocess module and display them in an interactive web UI.

Usage:
    python -m src.webviewer results.json
    python -m src.webviewer results.json --port 8080
    python -m src.webviewer --auto-detect
"""

import sys
import argparse
from pathlib import Path


def main():
    """CLI entry point for web viewer"""
    parser = argparse.ArgumentParser(
        description="Web Viewer - Interactive interface for kernel log analysis results"
    )
    parser.add_argument(
        "json_file", 
        nargs="?",
        help="Path to JSON results file (optional if using --auto-detect)"
    )
    parser.add_argument(
        "--port", 
        type=int,
        default=5000,
        help="Port for web server (default: 5000)"
    )
    parser.add_argument(
        "--host",
        default="127.0.0.1", 
        help="Host for web server (default: 127.0.0.1)"
    )
    parser.add_argument(
        "--no-browser",
        action="store_true",
        help="Don't automatically open browser"
    )
    parser.add_argument(
        "--auto-detect",
        action="store_true", 
        help="Auto-detect most recent JSON file in current directory"
    )
    parser.add_argument(
        "--version", 
        action="version", 
        version="Kernel Log Web Viewer 1.0.0"
    )
    
    args = parser.parse_args()
    
    # Import here to handle optional dependencies gracefully
    try:
        from .ui import start_web_ui
    except ImportError as e:
        print(f"❌ Error: Web UI dependencies not available: {e}", file=sys.stderr)
        print("Please install Flask: pip install flask", file=sys.stderr)
        sys.exit(1)
    
    # Determine JSON file to load
    json_file = None
    if args.json_file:
        json_file = Path(args.json_file)
        if not json_file.exists():
            print(f"❌ Error: JSON file not found: {json_file}", file=sys.stderr)
            sys.exit(1)
    elif args.auto_detect:
        # Let the UI module handle auto-detection
        json_file = None
    else:
        print("❌ Error: No JSON file specified. Use --auto-detect or provide a file path.", file=sys.stderr)
        sys.exit(1)
    
    try:
        # Start the web UI
        success = start_web_ui(
            json_file=str(json_file) if json_file else None,
            port=args.port,
            host=args.host,
            auto_open=not args.no_browser
        )
        
        if not success:
            print("❌ Failed to start web UI", file=sys.stderr)
            sys.exit(1)
            
    except KeyboardInterrupt:
        print("\n👋 Web viewer stopped by user")
    except Exception as e:
        print(f"❌ Error starting web UI: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
