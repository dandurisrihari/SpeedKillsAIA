#!/usr/bin/env python3
"""
Interactive interface for the kernel log parser

This module provides an interactive command-line interface
that guides users through the parsing process with menus and prompts.
"""

import os
import sys
from typing import Optional, List, Dict
from pathlib import Path
import glob

from ..core.engine import KernelLogParserEngine
from ..config.settings import ParserSettings, WebUISettings
from ..interfaces.batch import BatchProcessor
from ..web.ui import start_web_ui


class InteractiveInterface:
    """
    Interactive command-line interface for the kernel log parser
    
    Provides a user-friendly menu-driven interface for users who prefer
    interactive operation over command-line parameters.
    """
    
    def __init__(self):
        self.config = ParserSettings()
        self.web_config = WebUISettings()
        self.results = None
        self.last_output_file = None
    
    def run(self) -> None:
        """Run the interactive interface main loop"""
        self._print_banner()
        
        while True:
            try:
                choice = self._show_main_menu()
                
                if choice == '1':
                    self._parse_single_file()
                elif choice == '2':
                    self._parse_multiple_files()
                elif choice == '3':
                    self._configure_settings()
                elif choice == '4':
                    self._start_web_interface()
                elif choice == '5':
                    self._view_last_results()
                elif choice == '6':
                    self._show_help()
                elif choice == '0':
                    print("\n👋 Thank you for using the Kernel Log Parser!")
                    break
                else:
                    print("❌ Invalid choice. Please try again.")
                    
            except KeyboardInterrupt:
                print("\n\n👋 Goodbye!")
                break
            except Exception as e:
                print(f"\n❌ Error: {e}")
                input("\nPress Enter to continue...")
    
    def _print_banner(self) -> None:
        """Print application banner"""
        print("\n" + "="*60)
        print("KERNEL LOG PARSER - Interactive Mode")
        print("="*60)
        print("AI Accelerator Instrumentation Log Analysis Tool")
        print("Version 2.0.0 - Production Ready")
        print("="*60)
    
    def _show_main_menu(self) -> str:
        """Show main menu and get user choice"""
        print("\n" + "─"*40)
        print("MAIN MENU")
        print("─"*40)
        print("1. 📄 Parse Single Log File")
        print("2. 📁 Parse Multiple Log Files (Batch)")
        print("3. ⚙️  Configure Settings")
        print("4. 🌐 Start Web Interface")
        print("5. 📊 View Last Results")
        print("6. ❓ Help & Documentation")
        print("0. 🚪 Exit")
        print("─"*40)
        
        return input("Select an option: ").strip()
    
    def _parse_single_file(self) -> None:
        """Handle single file parsing"""
        print("\n" + "─"*40)
        print("PARSE SINGLE FILE")
        print("─"*40)
        
        # Get input file
        while True:
            file_path = input("Enter log file path (or 'back' to return): ").strip()
            
            if file_path.lower() == 'back':
                return
            
            if not file_path:
                print("❌ Please enter a file path.")
                continue
            
            path = Path(file_path)
            if not path.exists():
                print(f"❌ File not found: {file_path}")
                continue
            
            break
        
        # Get output file (optional)
        output_file = input("Enter output JSON file (optional, press Enter to skip): ").strip()
        if not output_file:
            output_file = None
        
        # Confirm settings
        print(f"\n📋 Parsing Configuration:")
        print(f"  Input File: {file_path}")
        print(f"  Output File: {output_file or 'None'}")
        print(f"  Source Root: {self.config.source_root_path or 'None'}")
        print(f"  Show UI: {self.config.show_ui}")
        
        if input("\nProceed with parsing? (y/N): ").strip().lower() != 'y':
            print("⏸️  Parsing cancelled.")
            return
        
        # Parse the file
        try:
            print(f"\nStarting to parse {file_path}...")
            
            engine = KernelLogParserEngine(
                show_ui=self.config.show_ui,
                source_root_path=self.config.source_root_path
            )
            
            results = engine.parse_log_file(file_path, output_file)
            
            # Store results
            if hasattr(results, 'to_dict'):
                self.results = results.to_dict()
            else:
                self.results = results
            
            self.last_output_file = output_file
            
            # Show summary
            self._print_parse_summary()
            
            # Ask about next steps
            self._ask_next_steps()
            
        except Exception as e:
            print(f"❌ Parsing failed: {e}")
            input("\nPress Enter to continue...")
    
    def _parse_multiple_files(self) -> None:
        """Handle batch file parsing"""
        print("\n" + "─"*40)
        print("PARSE MULTIPLE FILES (BATCH)")
        print("─"*40)
        
        # Get file pattern or directory
        print("Enter one of the following:")
        print("  1. Directory path (will find all .log files)")
        print("  2. File pattern (e.g., 'logs/*.log')")
        print("  3. Space-separated list of files")
        
        input_str = input("\nEnter your choice: ").strip()
        
        if not input_str or input_str.lower() == 'back':
            return
        
        # Expand to file list
        file_paths = self._expand_file_input(input_str)
        
        if not file_paths:
            print("❌ No valid log files found.")
            input("Press Enter to continue...")
            return
        
        print(f"\n📁 Found {len(file_paths)} files:")
        for i, path in enumerate(file_paths[:5], 1):  # Show first 5
            print(f"  {i}. {path}")
        if len(file_paths) > 5:
            print(f"  ... and {len(file_paths) - 5} more")
        
        # Get output directory
        output_dir = input("\nEnter output directory (optional): ").strip()
        if not output_dir:
            output_dir = None
        
        # Confirm and start processing
        if input(f"\nProcess {len(file_paths)} files? (y/N): ").strip().lower() != 'y':
            print("⏸️  Batch processing cancelled.")
            return
        
        try:
            print(f"\nStarting batch processing...")
            
            processor = BatchProcessor(self.config)
            summary = processor.process_files(file_paths, output_dir, concurrent=True)
            
            # Print summary
            processor.print_summary(summary)
            
            input("\nPress Enter to continue...")
            
        except Exception as e:
            print(f"❌ Batch processing failed: {e}")
            input("\nPress Enter to continue...")
    
    def _configure_settings(self) -> None:
        """Handle settings configuration"""
        print("\n" + "─"*40)
        print("CONFIGURE SETTINGS")
        print("─"*40)
        
        while True:
            print(f"\nCurrent Settings:")
            print(f"  1. Show Progress UI: {self.config.show_ui}")
            print(f"  2. Source Root Path: {self.config.source_root_path or 'None'}")
            print(f"  3. Extract Function Code: {self.config.extract_function_code}")
            print(f"  4. Enable Deduplication: {self.config.enable_deduplication}")
            print(f"  5. Web UI Port: {self.web_config.port}")
            print(f"  6. Web UI Host: {self.web_config.host}")
            print(f"  0. Back to Main Menu")
            
            choice = input("\nSelect setting to change: ").strip()
            
            if choice == '0':
                break
            elif choice == '1':
                self.config.show_ui = self._get_boolean("Show Progress UI")
            elif choice == '2':
                self.config.source_root_path = self._get_source_root()
            elif choice == '3':
                self.config.extract_function_code = self._get_boolean("Extract Function Code")
            elif choice == '4':
                self.config.enable_deduplication = self._get_boolean("Enable Deduplication")
            elif choice == '5':
                self.web_config.port = self._get_port()
            elif choice == '6':
                self.web_config.host = self._get_host()
            else:
                print("❌ Invalid choice.")
    
    def _start_web_interface(self) -> None:
        """Start the web interface"""
        print("\n" + "─"*40)
        print("START WEB INTERFACE")
        print("─"*40)
        
        # Check if we have results to display
        json_file = None
        if self.last_output_file and Path(self.last_output_file).exists():
            print(f"📊 Found recent results: {self.last_output_file}")
            if input("Use these results? (Y/n): ").strip().lower() != 'n':
                json_file = self.last_output_file
        
        if not json_file:
            json_file = input("Enter JSON results file (or press Enter for empty UI): ").strip()
            if not json_file:
                json_file = None
        
        print(f"\n🌐 Starting web interface...")
        print(f"  Host: {self.web_config.host}")
        print(f"  Port: {self.web_config.port}")
        print(f"  Results: {json_file or 'None'}")
        print(f"\n💡 The web interface will open automatically.")
        print(f"💡 Use Ctrl+C to stop the server.")
        
        try:
            start_web_ui(
                json_file=json_file,
                port=self.web_config.port,
                host=self.web_config.host,
                auto_open=self.web_config.auto_open_browser
            )
        except KeyboardInterrupt:
            print("\n🛑 Web interface stopped.")
        except Exception as e:
            print(f"❌ Failed to start web interface: {e}")
            
        input("\nPress Enter to continue...")
    
    def _view_last_results(self) -> None:
        """Display summary of last parsing results"""
        if not self.results:
            print("\n❌ No results available. Parse a file first.")
            input("Press Enter to continue...")
            return
        
        print("\n" + "─"*40)
        print("LAST PARSING RESULTS")
        print("─"*40)
        
        self._print_parse_summary()
        
        print("\nDetailed Results:")
        print(f"  📁 Functions by File: {len(self.results.get('functions_by_file', {}))}")
        
        for file_path, functions in self.results.get('functions_by_file', {}).items():
            print(f"    • {file_path}: {len(functions)} functions")
        
        input("\nPress Enter to continue...")
    
    def _show_help(self) -> None:
        """Show help and documentation"""
        print("\n" + "─"*40)
        print("HELP & DOCUMENTATION")
        print("─"*40)
        
        help_text = """
KERNEL LOG PARSER HELP

WHAT IT DOES:
  This tool parses AI accelerator instrumentation logs to extract:
  • Function entry points and call counts
  • DMA operations with stack traces
  • User-space copy operations
  • IOCTL handler operations
  
SUPPORTED LOG FORMATS:
  • FUNC_ENTRY: Function entry instrumentation
  • DMA_INSTRUMENT: DMA operation tracking
  • USER_COPY: User-space memory copy operations
  • IOCTL_HANDLER: IOCTL operation tracking
  
CONFIGURATION OPTIONS:
  • Source Root Path: For extracting function source code
  • Progress UI: Show/hide parsing progress
  • Function Code Extraction: Extract complete function source
  • Deduplication: Remove duplicate operations
  
OUTPUT FORMATS:
  • JSON: Structured data for programmatic use
  • Web UI: Interactive web interface for analysis
  
BATCH PROCESSING:
  • Process multiple files concurrently
  • Aggregate results across files
  • Generate processing summaries
  
WEB INTERFACE:
  • Interactive browsing of results
  • Search and filter functionality
  • Function code viewing
  • Stack trace analysis
        """
        
        print(help_text)
        input("\nPress Enter to continue...")
    
    def _expand_file_input(self, input_str: str) -> List[str]:
        """Expand user input to list of file paths"""
        file_paths = []
        
        # Check if it's a directory
        if Path(input_str).is_dir():
            pattern = str(Path(input_str) / "*.log")
            file_paths.extend(glob.glob(pattern))
        
        # Check if it's a glob pattern
        elif '*' in input_str or '?' in input_str:
            file_paths.extend(glob.glob(input_str))
        
        # Check if it's a space-separated list
        elif ' ' in input_str:
            for path in input_str.split():
                if Path(path).exists():
                    file_paths.append(path)
        
        # Single file
        else:
            if Path(input_str).exists():
                file_paths.append(input_str)
        
        return [str(Path(p).resolve()) for p in file_paths]
    
    def _print_parse_summary(self) -> None:
        """Print summary of parsing results"""
        if not self.results:
            return
        
        stats = self.results.get('statistics', {})
        
        print(f"\n📊 Parsing Summary:")
        print(f"  Function Entries: {stats.get('unique_function_entries', 0)}")
        print(f"  DMA Operations: {stats.get('unique_dma_operations', 0)}")
        print(f"  User Copy Operations: {stats.get('unique_user_copy_operations', 0)}")
        print(f"  IOCTL Operations: {stats.get('unique_ioctl_operations', 0)}")
        print(f"  Files Analyzed: {stats.get('total_files_analyzed', 0)}")
        print(f"  Total Lines: {stats.get('total_lines_processed', 0)}")
    
    def _ask_next_steps(self) -> None:
        """Ask user what to do next after parsing"""
        print(f"\n✅ Parsing completed successfully!")
        
        options = []
        
        if self.last_output_file:
            print(f"💾 Results saved to: {self.last_output_file}")
            options.append(('w', 'Start Web Interface'))
        
        options.extend([
            ('s', 'Show Detailed Summary'),
            ('m', 'Return to Main Menu')
        ])
        
        print(f"\nWhat would you like to do next?")
        for key, desc in options:
            print(f"  {key}. {desc}")
        
        choice = input("\nEnter choice: ").strip().lower()
        
        if choice == 'w' and self.last_output_file:
            self._start_web_interface()
        elif choice == 's':
            self._view_last_results()
        # Default: return to main menu
    
    def _get_boolean(self, setting_name: str) -> bool:
        """Get boolean input from user"""
        while True:
            value = input(f"Enable {setting_name}? (y/n): ").strip().lower()
            if value in ('y', 'yes', 'true', '1'):
                return True
            elif value in ('n', 'no', 'false', '0'):
                return False
            else:
                print("❌ Please enter 'y' or 'n'")
    
    def _get_source_root(self) -> Optional[str]:
        """Get source root path from user"""
        current = self.config.source_root_path or "None"
        print(f"Current source root: {current}")
        
        path = input("Enter new source root path (or press Enter to keep current): ").strip()
        
        if not path:
            return self.config.source_root_path
        
        if not Path(path).exists():
            print(f"⚠️  Warning: Path does not exist: {path}")
            if input("Use anyway? (y/N): ").strip().lower() != 'y':
                return self.config.source_root_path
        
        return path
    
    def _get_port(self) -> int:
        """Get port number from user"""
        while True:
            try:
                port = input(f"Enter port (current: {self.web_config.port}): ").strip()
                if not port:
                    return self.web_config.port
                
                port_num = int(port)
                if 1 <= port_num <= 65535:
                    return port_num
                else:
                    print("❌ Port must be between 1 and 65535")
            except ValueError:
                print("❌ Please enter a valid number")
    
    def _get_host(self) -> str:
        """Get host from user"""
        host = input(f"Enter host (current: {self.web_config.host}): ").strip()
        return host if host else self.web_config.host


def main():
    """Entry point for interactive mode"""
    interface = InteractiveInterface()
    interface.run()


if __name__ == "__main__":
    main()
