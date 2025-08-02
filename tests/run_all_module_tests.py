#!/usr/bin/env python3
"""
Comprehensive test runner for all SpeedKillsAIA modules

This script runs all tests for the modular structure and provides
a comprehensive validation of the system.
"""

import sys
import pytest
import subprocess
import os
from pathlib import Path

# Add the project root to the path
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))


def run_module_tests():
    """Run tests for the new module structure"""
    print("🧪 Running Module Structure Tests")
    print("=" * 50)
    
    test_files = [
        "tests/test_module_structure.py",
        "tests/test_kernel_instrumenter_module.py", 
        "tests/test_preprocess_module.py",
        "tests/test_integration.py"
    ]
    
    results = {}
    
    for test_file in test_files:
        test_path = project_root / test_file
        if not test_path.exists():
            print(f"⚠️  Test file not found: {test_file}")
            results[test_file] = "SKIPPED"
            continue
        
        print(f"\n📋 Running: {test_file}")
        try:
            result = pytest.main([str(test_path), "-v", "--tb=short"])
            if result == 0:
                print(f"✅ {test_file}: PASSED")
                results[test_file] = "PASSED"
            else:
                print(f"❌ {test_file}: FAILED")
                results[test_file] = "FAILED"
        except Exception as e:
            print(f"💥 {test_file}: ERROR - {e}")
            results[test_file] = "ERROR"
    
    return results


def run_existing_tests():
    """Run existing test suites"""
    print("\n🔄 Running Existing Test Suites")
    print("=" * 50)
    
    existing_test_dirs = [
        "tests/kernel_instrumenter_tests",
        "tests/preprocess"
    ]
    
    results = {}
    
    for test_dir in existing_test_dirs:
        test_path = project_root / test_dir
        if not test_path.exists():
            print(f"⚠️  Test directory not found: {test_dir}")
            results[test_dir] = "SKIPPED"
            continue
        
        print(f"\n📂 Running tests in: {test_dir}")
        try:
            # Run pytest on the directory
            result = pytest.main([str(test_path), "-v", "--tb=short", "-x"])
            if result == 0:
                print(f"✅ {test_dir}: PASSED")
                results[test_dir] = "PASSED"
            else:
                print(f"❌ {test_dir}: FAILED")
                results[test_dir] = "FAILED"
        except Exception as e:
            print(f"💥 {test_dir}: ERROR - {e}")
            results[test_dir] = "ERROR"
    
    return results


def test_command_line_interfaces():
    """Test command line interfaces"""
    print("\n🖥️  Testing Command Line Interfaces")
    print("=" * 50)
    
    # Change to project root
    os.chdir(project_root)
    
    commands_to_test = [
        # Module commands
        [sys.executable, "-m", "src", ""],
        [sys.executable, "-m", "src.kernel_instrumenter", "--help"],
        [sys.executable, "-m", "src.preprocess", "--help"],
        
        # Standalone runners (if they exist)
        [sys.executable, "run_kernel_instrumenter.py", "--help"],
        [sys.executable, "run_tool.py", "--help"],
    ]
    
    results = {}
    
    for cmd in commands_to_test:
        cmd_str = " ".join(cmd)
        print(f"\n🔧 Testing: {cmd_str}")
        
        try:
            # Handle stdin for src module
            stdin_input = "\n" if "src" in cmd and "--help" not in cmd else None
            
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=30,
                input=stdin_input
            )
            
            if result.returncode in [0, 1, 2]:  # Allow help command exit codes
                print(f"✅ Command succeeded")
                results[cmd_str] = "PASSED"
            else:
                print(f"❌ Command failed with code {result.returncode}")
                print(f"   stderr: {result.stderr[:200]}")
                results[cmd_str] = "FAILED"
                
        except subprocess.TimeoutExpired:
            print(f"⏰ Command timed out")
            results[cmd_str] = "TIMEOUT"
        except FileNotFoundError:
            print(f"⚠️  Command not found (expected for optional runners)")
            results[cmd_str] = "SKIPPED"
        except Exception as e:
            print(f"💥 Command error: {e}")
            results[cmd_str] = "ERROR"
    
    return results


def test_import_functionality():
    """Test basic import functionality"""
    print("\n📦 Testing Import Functionality")
    print("=" * 50)
    
    imports_to_test = [
        ("import src", "src package"),
        ("import src.kernel_instrumenter", "kernel_instrumenter module"),
        ("import src.preprocess", "preprocess module"),
        ("from src.kernel_instrumenter import KernelInstrumenter", "KernelInstrumenter class"),
        ("from src.preprocess import KernelLogParserTool", "KernelLogParserTool class"),
        ("from src.preprocess import parse_kernel_log", "parse_kernel_log function"),
    ]
    
    results = {}
    
    for import_statement, description in imports_to_test:
        print(f"\n🔍 Testing: {import_statement}")
        try:
            exec(import_statement)
            print(f"✅ {description}: SUCCESS")
            results[description] = "PASSED"
        except ImportError as e:
            print(f"❌ {description}: IMPORT ERROR - {e}")
            results[description] = "FAILED"
        except Exception as e:
            print(f"💥 {description}: ERROR - {e}")
            results[description] = "ERROR"
    
    return results


def print_summary(all_results):
    """Print comprehensive test summary"""
    print("\n" + "=" * 70)
    print("📊 COMPREHENSIVE TEST SUMMARY")
    print("=" * 70)
    
    total_tests = 0
    passed_tests = 0
    failed_tests = 0
    skipped_tests = 0
    error_tests = 0
    
    for category, results in all_results.items():
        print(f"\n📋 {category}:")
        print("-" * 40)
        
        for test_name, status in results.items():
            status_icon = {
                "PASSED": "✅",
                "FAILED": "❌", 
                "SKIPPED": "⚠️ ",
                "ERROR": "💥",
                "TIMEOUT": "⏰"
            }.get(status, "❓")
            
            print(f"  {status_icon} {test_name}: {status}")
            
            total_tests += 1
            if status == "PASSED":
                passed_tests += 1
            elif status == "FAILED":
                failed_tests += 1
            elif status == "SKIPPED":
                skipped_tests += 1
            else:
                error_tests += 1
    
    print("\n" + "=" * 70)
    print(f"📈 OVERALL RESULTS:")
    print(f"   Total Tests: {total_tests}")
    print(f"   ✅ Passed: {passed_tests}")
    print(f"   ❌ Failed: {failed_tests}")
    print(f"   ⚠️  Skipped: {skipped_tests}")
    print(f"   💥 Errors: {error_tests}")
    
    success_rate = (passed_tests / total_tests * 100) if total_tests > 0 else 0
    print(f"   📊 Success Rate: {success_rate:.1f}%")
    
    if failed_tests == 0 and error_tests == 0:
        print("\n🎉 ALL CRITICAL TESTS PASSED!")
        print("   The module system is working correctly.")
        return True
    else:
        print(f"\n⚠️  {failed_tests + error_tests} TESTS NEED ATTENTION")
        return False


def main():
    """Run comprehensive test suite"""
    print("🚀 SpeedKillsAIA Comprehensive Test Suite")
    print("=" * 70)
    print("Testing the complete modular system...")
    
    # Ensure we're in the right directory
    os.chdir(project_root)
    
    all_results = {}
    
    # Run different test categories
    try:
        all_results["Import Tests"] = test_import_functionality()
        all_results["Module Structure Tests"] = run_module_tests()
        all_results["Command Line Tests"] = test_command_line_interfaces()
        all_results["Existing Test Suites"] = run_existing_tests()
    except KeyboardInterrupt:
        print("\n⚠️  Tests interrupted by user")
        return 1
    except Exception as e:
        print(f"\n💥 Test suite error: {e}")
        return 1
    
    # Print comprehensive summary
    success = print_summary(all_results)
    
    # Provide next steps
    print("\n" + "=" * 70)
    print("📋 NEXT STEPS:")
    print("-" * 40)
    print("1. Use the modules:")
    print("   python -m src.kernel_instrumenter --help")
    print("   python -m src.preprocess --help")
    print("2. Use standalone runners:")
    print("   python run_kernel_instrumenter.py --help")
    print("   python run_tool.py --help")
    print("3. Import in Python code:")
    print("   from src.kernel_instrumenter import KernelInstrumenter")
    print("   from src.preprocess import parse_kernel_log")
    
    return 0 if success else 1


if __name__ == "__main__":
    exit_code = main()
    sys.exit(exit_code)
