#!/usr/bin/env python3
"""
Kernel Log Parser Tool Wrapper

A comprehensive tool wrapper for kernel log processing with multiple interface options:
- Command-line processing
- Interactive UI mode
- Web interface
- Python API

Usage:
    # Command-line processing
    python -m src.preprocess.tool log_file.log
    
    # With web UI
    python -m src.preprocess.tool log_file.log --web-ui
    
    # Interactive mode
    python -m src.preprocess.tool --interactive
    
    # Batch processing
    python -m src.preprocess.tool *.log --batch
"""

import sys
import argparse
import json
import webbrowser
import time
import threading
from pathlib import Path
from typing import List, Optional
import glob

from .core.engine import KernelLogParserEngine

# Optional web UI imports - handle gracefully if Flask not available
try:
    from .web.ui import create_app, load_data, start_web_ui as web_start_ui
    WEB_UI_AVAILABLE = True
except ImportError:
    WEB_UI_AVAILABLE = False
    create_app = None
    load_data = None
    web_start_ui = None


class KernelLogParserTool:
    """Comprehensive tool wrapper for kernel log parsing"""
    
    def __init__(self):
        self.parser = None
        self.results = None
    
    def process_log(self, log_file: str, output_file: Optional[str] = None, 
                   show_ui: bool = True, source_root_path: Optional[str] = None) -> dict:
        """
        Process a single log file
        
        Args:
            log_file: Path to log file
            output_file: Optional output JSON file
            show_ui: Whether to show progress UI
            source_root_path: Optional root path for resolving relative file paths
            
        Returns:
            Dictionary with parsing results
        """
        self.parser = KernelLogParserEngine(show_ui=show_ui, source_root_path=source_root_path)
        
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
    
    def process_batch(self, log_files: List[str], output_dir: Optional[str] = None, 
                     show_ui: bool = True) -> List[dict]:
        """
        Process multiple log files in batch
        
        Args:
            log_files: List of log file paths
            output_dir: Optional output directory for JSON files
            show_ui: Whether to show progress UI
            
        Returns:
            List of parsing results
        """
        results = []
        
        for i, log_file in enumerate(log_files, 1):
            print(f"\n📁 Processing file {i}/{len(log_files)}: {log_file}")
            
            # Determine output file if output_dir specified
            output_file = None
            if output_dir:
                output_dir_path = Path(output_dir)
                output_dir_path.mkdir(exist_ok=True)
                
                log_name = Path(log_file).stem
                output_file = str(output_dir_path / f"{log_name}_parsed.json")
            
            result = self.process_log(log_file, output_file, show_ui)
            if result:
                results.append({
                    'file': log_file,
                    'output': output_file,
                    'results': result
                })
            
        return results
    
    def start_web_ui(self, results_file: Optional[str] = None, port: int = 5000, 
                    host: str = '127.0.0.1', auto_open: bool = True):
        """
        Start web UI for viewing results
        
        Args:
            results_file: Optional JSON file with previous results
            port: Port for web server
            host: Host for web server
            auto_open: Whether to auto-open browser
        """
        if not WEB_UI_AVAILABLE:
            print("❌ Web UI not available. Flask is not installed.")
            print("💡 Install Flask: pip install flask")
            return
        
        if results_file:
            print(f"🌐 Starting web UI with results from: {results_file}")
            web_start_ui(results_file, port=port, host=host, auto_open=auto_open)
        else:
            app = create_app()
            
            if self.results:
                # Load current results into web app
                app.parsed_data = self.results
                print("🌐 Starting web UI with current results")
            else:
                print("🌐 Starting web UI (no results loaded)")
            
            # Auto-open browser
            if auto_open:
                def open_browser():
                    time.sleep(1)
                    webbrowser.open(f'http://{host}:{port}')
                
                threading.Thread(target=open_browser).start()
            
            print(f"🚀 Web UI running at http://{host}:{port}")
            print("Press Ctrl+C to stop")
            
            try:
                app.run(host=host, port=port, debug=False)
            except KeyboardInterrupt:
                print("\n👋 Web UI stopped")
    
    def interactive_mode(self):
        """Interactive command-line mode"""
        print("🔍 Kernel Log Parser - Interactive Mode")
        print("=" * 50)
        
        while True:
            print("\nOptions:")
            print("1. Process single log file")
            print("2. Process multiple log files (batch)")
            print("3. Start web UI")
            print("4. View current results")
            print("5. Exit")
            
            try:
                choice = input("\nSelect option (1-5): ").strip()
                
                if choice == '1':
                    self._interactive_single_file()
                elif choice == '2':
                    self._interactive_batch()
                elif choice == '3':
                    self._interactive_web_ui()
                elif choice == '4':
                    self._interactive_view_results()
                elif choice == '5':
                    print("👋 Goodbye!")
                    break
                else:
                    print("❌ Invalid option. Please select 1-5.")
                    
            except KeyboardInterrupt:
                print("\n👋 Goodbye!")
                break
            except Exception as e:
                print(f"❌ Error: {e}")
    
    def _interactive_single_file(self):
        """Interactive single file processing"""
        log_file = input("Enter log file path: ").strip()
        if not log_file:
            print("❌ No file specified")
            return
        
        if not Path(log_file).exists():
            print(f"❌ File not found: {log_file}")
            return
        
        output_choice = input("Save to JSON file? (y/n): ").strip().lower()
        output_file = None
        if output_choice == 'y':
            output_file = input("Enter output file path (or press Enter for auto): ").strip()
            if not output_file:
                output_file = str(Path(log_file).with_suffix('.json'))
        
        print(f"\n🔄 Processing: {log_file}")
        self.process_log(log_file, output_file)
        
        web_choice = input("\nOpen in web UI? (y/n): ").strip().lower()
        if web_choice == 'y':
            self.start_web_ui()
    
    def _interactive_batch(self):
        """Interactive batch processing"""
        pattern = input("Enter file pattern (e.g., *.log, /path/to/logs/*.log): ").strip()
        if not pattern:
            print("❌ No pattern specified")
            return
        
        files = glob.glob(pattern)
        if not files:
            print(f"❌ No files found matching: {pattern}")
            return
        
        print(f"📁 Found {len(files)} files:")
        for f in files[:5]:  # Show first 5
            print(f"  - {f}")
        if len(files) > 5:
            print(f"  ... and {len(files) - 5} more")
        
        confirm = input(f"\nProcess all {len(files)} files? (y/n): ").strip().lower()
        if confirm != 'y':
            return
        
        output_choice = input("Save to output directory? (y/n): ").strip().lower()
        output_dir = None
        if output_choice == 'y':
            output_dir = input("Enter output directory (or press Enter for './results'): ").strip()
            if not output_dir:
                output_dir = './results'
        
        print(f"\n🔄 Processing {len(files)} files...")
        results = self.process_batch(files, output_dir)
        
        print(f"\n✅ Processed {len(results)} files successfully")
        
        web_choice = input("Open results in web UI? (y/n): ").strip().lower()
        if web_choice == 'y' and results:
            # Use the first result for web UI
            first_output = results[0].get('output')
            if first_output:
                self.start_web_ui(first_output)
            else:
                self.start_web_ui()
    
    def _interactive_web_ui(self):
        """Interactive web UI startup"""
        if self.results:
            choice = input("Use current results or load from file? (current/file): ").strip().lower()
            if choice == 'file':
                file_path = input("Enter JSON results file path: ").strip()
                if file_path and Path(file_path).exists():
                    self.start_web_ui(file_path)
                else:
                    print("❌ Invalid file path")
            else:
                self.start_web_ui()
        else:
            file_path = input("Enter JSON results file path (or press Enter to start empty): ").strip()
            if file_path and Path(file_path).exists():
                self.start_web_ui(file_path)
            else:
                self.start_web_ui()
    
    def _interactive_view_results(self):
        """Interactive results viewing"""
        if not self.results:
            print("❌ No results available. Process a log file first.")
            return
        
        print(f"\n📊 Current Results Summary:")
        print(f"  Function Entries: {len(self.results.get('function_entries', []))}")
        print(f"  DMA Operations: {len(self.results.get('dma_operations', []))}")
        print(f"  User Copy Operations: {len(self.results.get('user_copy_operations', []))}")
        
        stats = self.results.get('statistics', {})
        print(f"  Files Analyzed: {stats.get('total_files_analyzed', 0)}")
        print(f"  Lines Processed: {stats.get('total_lines_processed', 0)}")
        
        details = input("\nShow detailed results? (y/n): ").strip().lower()
        if details == 'y':
            print(json.dumps(self.results, indent=2))


def main():
    """Main CLI entry point"""
    parser = argparse.ArgumentParser(
        description="Kernel Log Parser Tool - Process AI accelerator instrumentation logs",
        epilog="""
Examples:
  %(prog)s logfile.log                    # Process single file
  %(prog)s logfile.log -o results.json    # Process and save to JSON
  %(prog)s *.log --batch                  # Process multiple files
  %(prog)s --interactive                  # Interactive mode
  %(prog)s results.json --web-ui          # Start web UI with results
        """,
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    
    # Main arguments
    parser.add_argument(
        "files", 
        nargs="*",
        help="Log file(s) to process or JSON results file for web UI"
    )
    
    # Processing options
    parser.add_argument(
        "-o", "--output", 
        help="Output JSON file path"
    )
    parser.add_argument(
        "--batch", 
        action="store_true",
        help="Process multiple files in batch mode"
    )
    parser.add_argument(
        "--output-dir", 
        help="Output directory for batch processing"
    )
    
    # UI options
    parser.add_argument(
        "--web-ui", 
        action="store_true",
        help="Start web UI after processing or with existing results"
    )
    parser.add_argument(
        "--interactive", 
        action="store_true",
        help="Start interactive mode"
    )
    parser.add_argument(
        "--no-ui", 
        action="store_true",
        help="Disable progress UI during processing"
    )
    
    # Web UI options
    parser.add_argument(
        "--port", 
        type=int, 
        default=5000,
        help="Port for web UI (default: 5000)"
    )
    parser.add_argument(
        "--host", 
        default="127.0.0.1",
        help="Host for web UI (default: 127.0.0.1)"
    )
    parser.add_argument(
        "--no-browser", 
        action="store_true",
        help="Don't auto-open browser for web UI"
    )
    
    # Other options
    parser.add_argument(
        "--version", 
        action="version", 
        version="Kernel Log Parser Tool 2.0.0"
    )
    
    args = parser.parse_args()
    
    # Create tool instance
    tool = KernelLogParserTool()
    
    try:
        # Interactive mode
        if args.interactive:
            tool.interactive_mode()
            return
        
        # Web UI only mode (with existing results)
        if args.web_ui and args.files and len(args.files) == 1:
            results_file = args.files[0]
            if results_file.endswith('.json') and Path(results_file).exists():
                tool.start_web_ui(
                    results_file, 
                    port=args.port, 
                    host=args.host, 
                    auto_open=not args.no_browser
                )
                return
        
        # Processing mode
        if not args.files:
            print("❌ No input files specified. Use --interactive for interactive mode.")
            parser.print_help()
            sys.exit(1)
        
        show_ui = not args.no_ui
        
        if args.batch or len(args.files) > 1:
            # Batch processing
            print(f"📁 Batch processing {len(args.files)} files...")
            results = tool.process_batch(args.files, args.output_dir, show_ui)
            
            print(f"\n✅ Successfully processed {len(results)} files")
            
            # Start web UI if requested
            if args.web_ui and results:
                first_output = results[0].get('output')
                tool.start_web_ui(
                    first_output, 
                    port=args.port, 
                    host=args.host, 
                    auto_open=not args.no_browser
                )
        
        else:
            # Single file processing
            log_file = args.files[0]
            
            if not Path(log_file).exists():
                print(f"❌ File not found: {log_file}", file=sys.stderr)
                sys.exit(1)
            
            # Process the file
            results = tool.process_log(log_file, args.output, show_ui)
            
            if results:
                print(f"\n✅ Successfully processed: {log_file}")
                
                # Print summary
                print("\n📊 Summary:")
                print(f"  Function Entries: {len(results.get('function_entries', []))}")
                print(f"  DMA Operations: {len(results.get('dma_operations', []))}")
                print(f"  User Copy Operations: {len(results.get('user_copy_operations', []))}")
                
                # Start web UI if requested
                if args.web_ui:
                    tool.start_web_ui(
                        args.output, 
                        port=args.port, 
                        host=args.host, 
                        auto_open=not args.no_browser
                    )
            else:
                sys.exit(1)
    
    except KeyboardInterrupt:
        print("\n👋 Operation cancelled")
    except Exception as e:
        print(f"❌ Unexpected error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
