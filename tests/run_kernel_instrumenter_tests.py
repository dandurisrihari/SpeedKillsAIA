#!/usr/bin/env python3
"""
Test Runner for Enhanced Instrumentation Tool

This script runs all tests and provides detailed output about any failures.
"""

import os
import sys
import subprocess

def main():
    """Run all tests for the enhanced instrumentation tool."""
    # Change to the tests directory
    test_dir = '/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/tests/enhanced_instrumentation'
    os.chdir(test_dir)
    
    print("Running Enhanced Instrumentation Tool Test Suite...")
    print("=" * 60)
    
    # Run the main test suite
    result = subprocess.run([
        sys.executable, 'test_enhanced_instrument.py'
    ], capture_output=True, text=True)
    
    print(result.stdout)
    if result.stderr:
        print("STDERR:")
        print(result.stderr)
    
    return result.returncode

if __name__ == '__main__':
    sys.exit(main())
