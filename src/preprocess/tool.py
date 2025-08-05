#!/usr/bin/env python3
"""
Kernel Log Parser Tool - Simplified JSON Output

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

# Web UI availability flag
try:
    from ..webviewer import start_web_ui
    WEB_UI_AVAILABLE = True
except ImportError:
    WEB_UI_AVAILABLE = False


class KernelLogParserTool:
    """
    Simple wrapper around the KernelLogParserEngine for ease of use
    """
    
    def __init__(self, source_root_path: Optional[str] = None):
        """Initialize the tool with an optional source root path"""
        self.source_root_path = source_root_path
        self.engine = None
        self.results = None
        
    def interactive_mode(self):
        """Interactive mode (reserved for future use)"""
        print("Interactive mode not yet implemented")
        return False
        
    def process_log(self, log_file_path: str, output_file_path: Optional[str] = None, 
                   source_root_path: Optional[str] = None, strace_log_path: Optional[str] = None,
                   show_ui: bool = True) -> Optional[dict]:
        """
        Process a single log file
        
        Args:
            log_file: Path to log file
            output_file: Optional output JSON file
            source_root_path: Optional root path for resolving relative file paths
            strace_log_path: Optional path to strace log file for device access analysis
            show_ui: Whether to show UI progress (for backward compatibility)
            
        Returns:
            Dictionary with parsing results
        """
        # Use provided source_root_path or fall back to the one from constructor
        effective_source_root = source_root_path if source_root_path is not None else self.source_root_path
        
        # Create parser with the effective source root
        self.parser = KernelLogParserEngine(source_root_path=effective_source_root)
        
        try:
            # Parse the log file and convert to dict if needed
            results = self.parser.parse_log_file(log_file_path, output_file_path)
            if hasattr(results, 'to_dict'):
                self.results = results.to_dict()
            else:
                self.results = results
            
            # Process strace log if provided
            if strace_log_path:
                if Path(strace_log_path).exists():
                    print(f"\nProcessing strace log: {strace_log_path}")
                    strace_results = self.parser.parse_strace_log(strace_log_path)
                    if strace_results and self.results:
                        # Add device info to results
                        self.results['device_info'] = strace_results
                        
                        # Update metadata to include strace processing
                        if 'metadata' in self.results:
                            self.results['metadata']['strace_log'] = strace_log_path
                        
                        # Save updated results if output file specified
                        if output_file_path:
                            import json
                            with open(output_file_path, 'w') as f:
                                json.dump(self.results, f, indent=2)
                else:
                    print(f"Warning: Strace log file not found: {strace_log_path}", file=sys.stderr)
            
            return self.results
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
    
    def start_web_ui(self, results_file: Optional[str] = None, port: int = 5000, 
                     host: str = "127.0.0.1", auto_open: bool = True):
        """
        Start web UI for viewing results
        
        Args:
            results_file: Path to JSON results file
            port: Port to run web server on
            host: Host to bind to
            auto_open: Whether to automatically open browser
        """
        try:
            from ..webviewer import start_web_ui
            return start_web_ui(json_file=results_file, port=port, host=host, auto_open=auto_open)
        except ImportError:
            print("Web UI not available. Install webviewer dependencies.", file=sys.stderr)
            return False


def main():
    """Main command-line entry point"""
    parser = argparse.ArgumentParser(
        description="Kernel Log Parser Tool - Simple JSON output",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Parse log to console output
  python -m src.preprocess --log kernel.log
  
  # Parse log and save JSON
  python -m src.preprocess --log kernel.log -o results.json
  
  # With strace log for device access analysis
  python -m src.preprocess --log kernel.log --strace-log strace.log -o results.json
  
  # With source root for function code extraction
  python -m src.preprocess --log kernel.log --source-root /path/to/kernel -o results.json
  
  # Complete analysis with all options
  python -m src.preprocess --log kernel.log --strace-log strace.log --source-root /path/to/kernel -o results.json
  
  # To view results in web UI (separate module):
  python -m src.webviewer results.json
        """
    )
    
    parser.add_argument(
        "--log", 
        required=True,
        help="Path to kernel log file"
    )
    parser.add_argument(
        "-o", "--output",
        help="Output JSON file path (optional)"
    )
    parser.add_argument(
        "--source-root",
        help="Root directory path for resolving relative file paths"
    )
    parser.add_argument(
        "--strace-log",
        help="Path to strace log file for device access analysis"
    )
    parser.add_argument(
        "--interactive",
        action="store_true",
        help="Start interactive mode (reserved for future use)"
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
        results = tool.process_log(log_file, args.output, source_root_path=args.source_root, 
                                 strace_log_path=args.strace_log)
        
        if results:
            print(f"\n✅ Successfully processed: {log_file}")
            
            # Print summary - handle potential type issues
            print("\n📊 Summary:")
            try:
                if isinstance(results, dict):
                    function_entries = results.get('function_entries', [])
                    dma_operations = results.get('dma_operations', [])
                    user_copy_operations = results.get('user_copy_operations', [])
                    
                    print(f"  Function Entries: {len(function_entries)}")
                    print(f"  DMA Operations: {len(dma_operations)}")
                    print(f"  User Copy Operations: {len(user_copy_operations)}")
                    
                    # Print device access info if available
                    if 'device_info' in results:
                        device_info = results['device_info']
                        if device_info:  # Check if device_info is not None
                            print(f"  Device Accesses: {device_info.get('total_accesses', 0)}")
                            print(f"  Unique Devices: {device_info.get('unique_device_count', 0)}")
                            if device_info.get('unique_devices'):
                                print(f"  Devices: {', '.join(device_info['unique_devices'])}")
                else:
                    print(f"  Results type: {type(results)}")
                    print("  Unable to display detailed summary - unexpected result type")
            except Exception as e:
                print(f"  Error displaying summary: {e}")
                print(f"  Results type: {type(results)}")
                if isinstance(results, dict):
                    print(f"  Results keys: {list(results.keys())}")
                    print(f"  Device info present: {'device_info' in results}")
                    if 'device_info' in results:
                        print(f"  Device info type: {type(results['device_info'])}")
                        print(f"  Device info value: {results['device_info']}")
            
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
