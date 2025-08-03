#!/usr/bin/env python3
"""
Comprehensive Test Runner for Kernel Instrumenter Tests

This script runs all tests in the kernel_instrumenter_tests directory,
providing detailed reporting on test status and results.
"""

import sys
import subprocess
import os
from pathlib import Path

def main():
    """Run all kernel instrumenter tests"""
    test_dir = Path(__file__).parent
    project_root = test_dir.parent.parent
    
    # Activate virtual environment
    venv_python = project_root / "venv" / "bin" / "python"
    if not venv_python.exists():
        print("❌ Virtual environment not found. Please run setup.sh first.")
        return 1
    
    # Test categories
    test_categories = {
        'import_tests': ['test_import.py'],
        'cli_tests': ['test_cli_integration.py', 'test_ioctl_cli_integration.py'],
        'api_tests': ['test_kernel_instrumenter_api.py'],
        'analyzer_tests': ['test_ioctl_analyzer.py'],
        'comprehensive_tests': ['test_ioctl_comprehensive.py'],
        'integration_tests': [
            'test_assignment_spanning_integration.py',
            'test_dma_present_files_functions.py',
            'test_modern_comprehensive.py',
            'test_regression_fixes.py'
        ]
    }
    
    results = {}
    total_passed = 0
    total_failed = 0
    total_errors = 0
    
    print("🚀 Running Kernel Instrumenter Comprehensive Test Suite")
    print("=" * 80)
    
    for category, test_files in test_categories.items():
        print(f"\n📋 Testing {category.replace('_', ' ').title()}")
        print("-" * 50)
        
        category_results = []
        
        for test_file in test_files:
            test_path = test_dir / test_file
            if not test_path.exists():
                print(f"⚠️  {test_file}: SKIPPED (file not found)")
                continue
                
            print(f"🧪 Running {test_file}...")
            
            try:
                result = subprocess.run([
                    str(venv_python), '-m', 'pytest', str(test_path), '-v', '--tb=short'
                ], capture_output=True, text=True, cwd=project_root, timeout=120)
                
                if result.returncode == 0:
                    print(f"✅ {test_file}: PASSED")
                    # Count actual test results
                    if "passed" in result.stdout:
                        passed_count = result.stdout.count(" PASSED")
                        total_passed += passed_count
                    category_results.append(('PASSED', test_file, None))
                else:
                    print(f"❌ {test_file}: FAILED")
                    # Count failed tests
                    if "failed" in result.stdout:
                        failed_count = result.stdout.count(" FAILED")
                        total_failed += failed_count
                    category_results.append(('FAILED', test_file, result.stderr))
                    
            except subprocess.TimeoutExpired:
                print(f"⏰ {test_file}: TIMEOUT")
                total_errors += 1
                category_results.append(('TIMEOUT', test_file, "Test timed out"))
            except Exception as e:
                print(f"💥 {test_file}: ERROR - {e}")
                total_errors += 1
                category_results.append(('ERROR', test_file, str(e)))
        
        results[category] = category_results
    
    # Print summary
    print("\n" + "=" * 80)
    print("📊 TEST SUMMARY")
    print("=" * 80)
    
    for category, category_results in results.items():
        print(f"\n{category.replace('_', ' ').title()}:")
        for status, test_file, error in category_results:
            status_icon = {
                'PASSED': '✅',
                'FAILED': '❌', 
                'TIMEOUT': '⏰',
                'ERROR': '💥',
                'SKIPPED': '⚠️'
            }.get(status, '❓')
            print(f"  {status_icon} {test_file}: {status}")
    
    print(f"\n📈 OVERALL RESULTS:")
    print(f"   ✅ Passed: {total_passed}")
    print(f"   ❌ Failed: {total_failed}")
    print(f"   💥 Errors: {total_errors}")
    print(f"   📊 Total: {total_passed + total_failed + total_errors}")
    
    if total_failed == 0 and total_errors == 0:
        print(f"\n🎉 All tests passed!")
        return 0
    else:
        print(f"\n⚠️  Some tests failed or had errors.")
        return 1

if __name__ == '__main__':
    sys.exit(main())
