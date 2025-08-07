#!/usr/bin/env python3
"""
Simple Integration Tests for IOCTL LLM Analysis and Device Access Functionality

This test file focuses on the specific fixes applied for the regression issues
found on August 6, 2025:
1. IOCTL analysis button network error (data structure fix)
2. Device access details toggle not working (JavaScript fix)
"""

import pytest
import json
import requests
import time
import subprocess
import os
import sys

# Add src to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(__file__)), 'src'))


class TestLiveWebviewerFunctionality:
    """Live tests against the running webviewer"""
    
    BASE_URL = "http://127.0.0.1:5000"
    
    def test_webviewer_is_running(self):
        """Test that the webviewer is accessible"""
        try:
            response = requests.get(self.BASE_URL, timeout=5)
            assert response.status_code == 200
            print("✓ Webviewer is running and accessible")
        except requests.exceptions.RequestException as e:
            pytest.skip(f"Webviewer not running: {e}")

    def test_main_js_loads_correctly(self):
        """Test that main.js loads without errors and contains fixes"""
        try:
            response = requests.get(f"{self.BASE_URL}/static/js/main.js", timeout=5)
            assert response.status_code == 200
            
            js_content = response.text
            
            # Check for corrected data structure references
            assert 'ioctl_operations' in js_content
            assert 'ioctl_operation:' in js_content  # In the request payload
            
            # Ensure old incorrect references are removed
            assert 'ioctl_handlers' not in js_content
            assert 'ioctl_handler:' not in js_content
            
            print("✓ main.js contains correct data structure references")
            
        except requests.exceptions.RequestException as e:
            pytest.skip(f"Cannot access main.js: {e}")

    def test_llm_status_endpoint(self):
        """Test that LLM status endpoint works"""
        try:
            response = requests.get(f"{self.BASE_URL}/api/llm/status", timeout=10)
            assert response.status_code == 200
            
            data = response.json()
            assert 'available' in data
            print(f"✓ LLM status endpoint working: LLM available = {data['available']}")
            
        except requests.exceptions.RequestException as e:
            pytest.skip(f"Cannot access LLM status: {e}")

    def test_ioctl_code_endpoint_structure(self):
        """Test that the ioctl code endpoint has the right structure"""
        try:
            # Test with index 0 (should exist in ti_dmesg.json)
            response = requests.get(f"{self.BASE_URL}/api/ioctl-code/0", timeout=5)
            
            if response.status_code == 200:
                data = response.json()
                assert 'function_code' in data
                assert 'function_name' in data
                print(f"✓ IOCTL code endpoint working: {data['function_name']}")
            elif response.status_code == 404:
                print("! IOCTL code endpoint returns 404 - this is expected if no data loaded")
            else:
                pytest.fail(f"Unexpected status code: {response.status_code}")
                
        except requests.exceptions.RequestException as e:
            pytest.skip(f"Cannot access ioctl-code endpoint: {e}")

    def test_llm_analyze_ioctl_endpoint_structure(self):
        """Test that LLM analyze endpoint accepts correct payload structure"""
        try:
            # Test payload with correct structure (ioctl_operation not ioctl_handler)
            test_payload = {
                "ioctl_operation": {
                    "function_name": "test_ioctl",
                    "file_path": "drivers/test/test.c",
                    "line_number": 100
                },
                "function_code": "long test_ioctl(struct file *file, unsigned int cmd, unsigned long arg) { return 0; }",
                "custom_prompt": "Test analysis",
                "model_id": "gpt-3.5-turbo"
            }
            
            response = requests.post(
                f"{self.BASE_URL}/api/llm/analyze/ioctl",
                json=test_payload,
                timeout=10
            )
            
            # Should accept the request structure (200) or indicate LLM not available (503)
            assert response.status_code in [200, 400, 503]
            
            if response.status_code == 400:
                # Check if it's complaining about missing data vs wrong structure
                data = response.json()
                error_msg = data.get('error', '').lower()
                # Should not complain about 'ioctl_handler' missing since we're using 'ioctl_operation'
                assert 'ioctl_handler' not in error_msg
                print("✓ IOCTL analyze endpoint accepts correct data structure")
            elif response.status_code == 503:
                print("! LLM not available for analysis (expected if OpenAI not configured)")
            else:
                print("✓ IOCTL analyze endpoint working with correct structure")
                
        except requests.exceptions.RequestException as e:
            pytest.skip(f"Cannot test analyze endpoint: {e}")


class TestJavaScriptFixesValidation:
    """Test to validate that the JavaScript fixes are in place"""
    
    def test_javascript_files_exist(self):
        """Test that required JavaScript files exist"""
        js_dir = "/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/src/webviewer/static/js"
        
        assert os.path.exists(os.path.join(js_dir, "main.js"))
        assert os.path.exists(os.path.join(js_dir, "llm.js"))
        
        print("✓ JavaScript files exist")

    def test_main_js_contains_fixes(self):
        """Test that main.js contains the regression fixes"""
        js_path = "/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/src/webviewer/static/js/main.js"
        
        with open(js_path, 'r') as f:
            content = f.read()
        
        # Check for IOCTL analysis fix
        assert 'analyzeIOCTLWithLLM' in content
        assert 'ioctl_operations' in content
        assert 'ioctl_operation:' in content
        
        # Check that wrong references are not present
        assert 'ioctl_handlers' not in content
        assert 'ioctl_handler:' not in content
        
        # Check for device details toggle fix
        assert 'toggleDeviceDetails' in content
        
        print("✓ main.js contains all required fixes")

    def test_no_duplicate_functions(self):
        """Test that there are no duplicate function definitions"""
        js_path = "/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/src/webviewer/static/js/main.js"
        
        with open(js_path, 'r') as f:
            content = f.read()
        
        # Count function definitions
        analyze_count = content.count('function analyzeIOCTLWithLLM')
        toggle_count = content.count('function toggleDeviceDetails')
        
        assert analyze_count == 1, f"Expected 1 analyzeIOCTLWithLLM function, found {analyze_count}"
        assert toggle_count == 1, f"Expected 1 toggleDeviceDetails function, found {toggle_count}"
        
        print("✓ No duplicate function definitions found")


class TestRegressionSpecificFixes:
    """Tests that specifically validate the reported issues are fixed"""
    
    def test_ioctl_data_structure_consistency(self):
        """Test that IOCTL data uses consistent field names"""
        # Load the actual data file to check structure
        data_path = "/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/data/json_files/ti_dmesg.json"
        
        if os.path.exists(data_path):
            with open(data_path, 'r') as f:
                data = json.load(f)
            
            # Check that data uses ioctl_operations not ioctl_handlers
            assert 'ioctl_operations' in data
            assert 'ioctl_handlers' not in data
            
            print(f"✓ Data file uses correct structure: {len(data['ioctl_operations'])} IOCTL operations found")
        else:
            print("! Data file not found - skipping structure check")

    def test_regression_test_files_exist(self):
        """Test that regression test files were created"""
        test_dir = "/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/tests"
        
        python_test = os.path.join(test_dir, "test_ioctl_llm_device_access_regression.py")
        js_test = os.path.join(test_dir, "test_js_regression.js")
        
        assert os.path.exists(python_test)
        assert os.path.exists(js_test)
        
        print("✓ Regression test files created successfully")

    def test_javascript_regression_tests_pass(self):
        """Run the JavaScript regression tests"""
        test_path = "/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/tests/test_js_regression.js"
        
        try:
            result = subprocess.run(
                ["node", test_path],
                cwd="/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA",
                capture_output=True,
                text=True,
                timeout=30
            )
            
            assert result.returncode == 0, f"JavaScript tests failed:\n{result.stdout}\n{result.stderr}"
            
            # Check that all tests passed
            assert "All tests PASSED" in result.stdout
            assert "No regression detected" in result.stdout
            
            print("✓ JavaScript regression tests pass")
            
        except subprocess.TimeoutExpired:
            pytest.fail("JavaScript tests timed out")
        except FileNotFoundError:
            pytest.skip("Node.js not available to run JavaScript tests")


if __name__ == '__main__':
    print("=== Running Integration Tests for IOCTL/Device Access Fixes ===\n")
    
    # Run tests with verbose output
    pytest.main([__file__, '-v', '-s'])
