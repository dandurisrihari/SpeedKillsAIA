#!/usr/bin/env python3
"""
Kernel Log Parser Tool -            return self.results
        except Exception as e:
            print(f"Error processing log file: {e}", file=sys.stderr)
            return None
    
    def process_batch(self, log_files: list, show_ui: bool = True) -> list:
        """
        Process multiple log files in batch
        
        Args:
            log_files: List of log file paths
            show_ui: Whether to show UI progress (for backward compatibility)
            
        Returns:
            List of dictionaries with parsing results for each file
        """
        results = []
        for log_file in log_files:
            try:
                result = self.process_log(log_file, show_ui=show_ui)
                if result:
                    results.append(result)
            except Exception as e:
                print(f"Error processing {log_file}: {e}", file=sys.stderr)
                continue
        return results
    
    def start_web_ui(self, json_file: Optional[str] = None, port: int = 5000):
        """
        Start web UI for viewing results
        
        Args:
            json_file: Path to JSON results file
            port: Port to run web server on
        """
        try:
            from ..webviewer import start_web_ui
            return start_web_ui(json_file=json_file, port=port)
        except ImportError:
            print("Web UI not available. Install webviewer dependencies.", file=sys.stderr)
            return Falseplified JSON Output

A simplified tool wrapper for kernel log processing focused solely on parsing and JSON output.
For web-based visualization, use the separate webviewer module.

Usage:
    python -m src.preprocess --log logfile.log -o results.json
    python -m src.preprocess --log logfile.log --source-root kernel_src/ -o results.json
"""

import sys
import argparse
from pathlib import Path
from typing import Optional

from .core.engine import KernelLogParserEngine
#import pdb; pdb.set_trace()


class KernelLogParserTool:
    """Simplified tool wrapper for kernel log parsing"""
    
    def __init__(self):
        self.parser = None
        self.results = None
    
    def process_log(self, log_file: str, output_file: Optional[str] = None, 
                   source_root_path: Optional[str] = None, show_ui: bool = True) -> dict:
        """
        Process a single log file
        
        Args:
            log_file: Path to log file
            output_file: Optional output JSON file
            source_root_path: Optional root path for resolving relative file paths
            show_ui: Whether to show UI progress (for backward compatibility)
            
        Returns:
            Dictionary with parsing results
        """
        self.parser = KernelLogParserEngine(source_root_path=source_root_path)
        
        try:
            # Parse the log file and convert to dict if needed
            results = self.parser.parse_log_file(log_file, output_file)
            if hasattr(results, 'to_dict'):
                self.results = results.to_dict()
            else:
                self.results = results
            return self.results
        except Exception as e:
            print(f"❌ Error processing {log_file}: {e}", file=sys.stderr)
            return None


def main():
    """Main CLI entry point"""
    parser = argparse.ArgumentParser(
        prog="python -m src.preprocess",
        description="Kernel Log Parser Tool - Process AI accelerator instrumentation logs and output JSON",
        epilog="""
Examples:
  python -m src.preprocess --log logfile.log -o results.json
  python -m src.preprocess --log logfile.log --source-root kernel_src/ -o results.json
  
  # To view results in web UI (separate module):
  python -m src.webviewer results.json
        """,
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    
    # Main arguments
    parser.add_argument(
        "--log",
        required=True,
        help="Log file to process"
    )
    parser.add_argument(
        "-o", "--output", 
        help="Output JSON file path"
    )
    parser.add_argument(
        "--source-root", 
        help="Root directory path for resolving relative file paths in kernel sources"
    )
    parser.add_argument(
        "--version", 
        action="version", 
        version="Kernel Log Parser Tool 2.0.0"
    )
    
    args = parser.parse_args()
    
    # Create tool instance
    tool = KernelLogParserTool()
    
    try:
        # Simple processing mode - single log file to JSON
        log_file = args.log
        
        if not Path(log_file).exists():
            print(f"❌ File not found: {log_file}", file=sys.stderr)
            sys.exit(1)
        
        # Process the file
        results = tool.process_log(log_file, args.output, source_root_path=args.source_root)
        
        if results:
            print(f"\n✅ Successfully processed: {log_file}")
            
            # Print summary
            print("\n📊 Summary:")
            print(f"  Function Entries: {len(results.get('function_entries', []))}")
            print(f"  DMA Operations: {len(results.get('dma_operations', []))}")
            print(f"  User Copy Operations: {len(results.get('user_copy_operations', []))}")
            
            if args.output:
                print(f"\n💾 JSON output saved to: {args.output}")
                print(f"💡 To view results in web UI: python -m src.webviewer {args.output}")
            else:
                print(f"\n💡 To save JSON and view in web UI:")
                print(f"   python -m src.preprocess --log {log_file} -o results.json")
                print(f"   python -m src.webviewer results.json")
        else:
            sys.exit(1)
    
    except KeyboardInterrupt:
        print("\n👋 Operation cancelled")
    except Exception as e:
        print(f"❌ Unexpected error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
