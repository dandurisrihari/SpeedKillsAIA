#!/usr/bin/env python3
"""
SpeedKillsAIA Source Package

This package contains multiple tools for AI accelerator security research:
- kernel_instrumenter: Instrument kernel modules with logging
- preprocess: Parse and analyze kernel logs
- staticanalysis: Static code analysis tools  
- llm_analysis: LLM-powered security analysis
"""
# import pdb; pdb.set_trace()
__version__ = "2.0.0"
__author__ = "SpeedKillsAIA Research Team"

def main():
    """
    Main entry point for the src module.
    
    This provides a menu to access different tools.
    """
    print("SpeedKillsAIA Research Tools")
    print("=" * 40)
    print("Available tools:")
    print("1. Kernel Instrumenter - Add logging to kernel modules")
    print("2. Log Preprocessor - Parse and analyze kernel logs")
    print("3. Static Analysis - Analyze code for vulnerabilities")
    print("4. LLM Analysis - LLM Assisted security analysis")
    print()
    print("To use a specific tool directly:")
    print("  python -m src.kernel_instrumenter [options]")
    print("  python -m src.preprocess [options]")
    print("  python -m src.staticanalysis [options]")
    print("  python -m src.llm_analysis [options]")
    print()
    print("Or use the standalone runners:")
    print("  python run_kernel_instrumenter.py [options]")
    print("  python run_tool.py [options]")


if __name__ == "__main__":
    main()
    