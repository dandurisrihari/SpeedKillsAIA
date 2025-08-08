#!/usr/bin/env python3
"""
Download Functionality Debug Test

This test specifically checks for the download functionality issue where
download buttons might be missing after analysis completion.
"""

import requests
import time
import threading
import subprocess
import signal
import os
import sys
from pathlib import Path


class DownloadFunctionalityTester:
    """Debug tester for download functionality issues."""
    
    def __init__(self):
        self.server_process = None
        self.base_url = None
        
    def start_test_server(self, port=5002):
        """Start the web server for testing."""
        print(f"Starting test server on port {port}...")
        
        # Change to project root directory
        project_root = Path(__file__).parent.parent
        os.chdir(project_root)
        
        # Start server in background
        cmd = [
            'bash', '-c', 
            f'source setup.sh && python -m src.webviewer test_results_with_function_code.json --host 127.0.0.1 --port {port} --no-browser'
        ]
        
        self.server_process = subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            preexec_fn=os.setsid
        )
        
        self.base_url = f"http://127.0.0.1:{port}"
        
        # Wait for server to start
        print("Waiting for server to start...")
        max_attempts = 30
        for attempt in range(max_attempts):
            try:
                response = requests.get(f"{self.base_url}/api/status", timeout=2)
                if response.status_code == 200:
                    print(f"✅ Server started successfully at {self.base_url}")
                    return True
            except requests.exceptions.RequestException:
                time.sleep(1)
                
        print("❌ Failed to start server")
        return False
    
    def stop_test_server(self):
        """Stop the test server."""
        if self.server_process:
            print("Stopping test server...")
            os.killpg(os.getpgid(self.server_process.pid), signal.SIGTERM)
            self.server_process.wait()
            print("✅ Server stopped")
    
    def test_main_page_loads(self):
        """Test that main page loads successfully."""
        print("\n🔍 Testing main page loading...")
        
        try:
            response = requests.get(self.base_url, timeout=10)
            if response.status_code == 200:
                print("✅ Main page loads successfully")
                return True, response.text
            else:
                print(f"❌ Main page failed: Status {response.status_code}")
                return False, None
        except Exception as e:
            print(f"❌ Main page request failed: {e}")
            return False, None
    
    def test_download_buttons_present(self, html_content):
        """Test that download buttons are present in HTML."""
        print("\n🔍 Testing download buttons presence...")
        
        download_tests = [
            ("📥 Download JSON", "downloadAnalysisResults('json')"),
            ("📊 Download CSV", "downloadAnalysisResults('csv')"),
            ("🌐 Download Report", "downloadAnalysisResults('html')"),
        ]
        
        all_present = True
        for button_text, onclick_text in download_tests:
            if button_text in html_content:
                print(f"✅ Found: {button_text}")
            else:
                print(f"❌ Missing: {button_text}")
                all_present = False
                
            if onclick_text in html_content:
                print(f"✅ Found onclick: {onclick_text}")
            else:
                print(f"❌ Missing onclick: {onclick_text}")
                all_present = False
        
        return all_present
    
    def test_javascript_functions_present(self, html_content):
        """Test that JavaScript download functions are present."""
        print("\n🔍 Testing JavaScript download functions...")
        
        js_functions = [
            "function downloadAnalysisResults",
            "function downloadJSON",
            "function downloadCSV", 
            "function downloadHTML",
            "function generateCSVReport",
            "function generateHTMLReport"
        ]
        
        all_present = True
        for func_name in js_functions:
            if func_name in html_content:
                print(f"✅ Found: {func_name}")
            else:
                print(f"❌ Missing: {func_name}")
                all_present = False
        
        return all_present
    
    def test_api_data_endpoint(self):
        """Test that API data endpoint works."""
        print("\n🔍 Testing API data endpoint...")
        
        try:
            response = requests.get(f"{self.base_url}/api/data", timeout=10)
            if response.status_code == 200:
                data = response.json()
                print("✅ API data endpoint works")
                print(f"   - Functions: {data.get('statistics', {}).get('unique_function_entries', 0)}")
                print(f"   - DMA Operations: {data.get('statistics', {}).get('unique_dma_operations', 0)}")
                print(f"   - User Copy Operations: {data.get('statistics', {}).get('unique_user_copy_operations', 0)}")
                print(f"   - IOCTL Operations: {data.get('statistics', {}).get('unique_ioctl_operations', 0)}")
                return True, data
            else:
                print(f"❌ API data endpoint failed: Status {response.status_code}")
                return False, None
        except Exception as e:
            print(f"❌ API data request failed: {e}")
            return False, None
    
    def test_results_dashboard_visibility(self, html_content):
        """Test that results dashboard section is visible."""
        print("\n🔍 Testing results dashboard visibility...")
        
        dashboard_tests = [
            "results-dashboard",
            "resultsDashboard", 
            "results-actions",
            "downloadJsonBtn",
            "downloadCsvBtn", 
            "downloadHtmlBtn"
        ]
        
        all_present = True
        for element in dashboard_tests:
            if element in html_content:
                print(f"✅ Found: {element}")
            else:
                print(f"❌ Missing: {element}")
                all_present = False
        
        return all_present
    
    def test_comprehensive_analysis_flow(self):
        """Test comprehensive analysis to see if download buttons appear after analysis."""
        print("\n🔍 Testing comprehensive analysis flow...")
        
        try:
            # Make comprehensive analysis request
            analysis_data = {
                'component_types': ['functions', 'dma_operations', 'user_copy_operations', 'ioctl_operations'],
                'batch_size': 10,
                'model_id': 'gpt-3.5-turbo',
                'custom_prompt': 'Test analysis for download functionality'
            }
            
            print("   Sending comprehensive analysis request...")
            response = requests.post(
                f"{self.base_url}/api/analyze/comprehensive",
                json=analysis_data,
                timeout=60
            )
            
            if response.status_code == 200:
                result = response.json()
                print("✅ Comprehensive analysis completed")
                print(f"   - Status: {result.get('status')}")
                print(f"   - Results count: {len(result.get('results', []))}")
                print(f"   - Total analyzed: {result.get('total', 0)}")
                
                # Now check if main page still has download buttons
                main_response = requests.get(self.base_url, timeout=10)
                if main_response.status_code == 200:
                    print("✅ Main page loads after analysis")
                    return True, main_response.text
                else:
                    print("❌ Main page failed to load after analysis")
                    return False, None
            else:
                print(f"❌ Comprehensive analysis failed: Status {response.status_code}")
                if response.text:
                    print(f"   Error: {response.text}")
                return False, None
                
        except Exception as e:
            print(f"❌ Comprehensive analysis request failed: {e}")
            return False, None
    
    def check_download_button_visibility_js(self):
        """Test JavaScript to check if download buttons are visible."""
        print("\n🔍 Testing download button visibility via JavaScript...")
        
        # This would require a browser automation tool like Selenium
        # For now, we'll check the HTML structure
        print("   Note: Full JavaScript testing requires browser automation")
        print("   Checking HTML structure for button visibility...")
        
        try:
            response = requests.get(self.base_url, timeout=10)
            if response.status_code == 200:
                html = response.text
                
                # Check if buttons have style="display: none" or similar
                if 'resultsDashboard' in html:
                    if 'style="display: none"' in html and 'resultsDashboard' in html:
                        print("⚠️  Results dashboard might be hidden")
                        return False
                    else:
                        print("✅ Results dashboard appears to be visible")
                        return True
                else:
                    print("❌ Results dashboard not found in HTML")
                    return False
            else:
                print(f"❌ Failed to get main page: {response.status_code}")
                return False
        except Exception as e:
            print(f"❌ Failed to check button visibility: {e}")
            return False
    
    def run_all_tests(self):
        """Run all download functionality tests."""
        print("="*70)
        print("DOWNLOAD FUNCTIONALITY DEBUG TESTS")
        print("="*70)
        
        # Start server
        if not self.start_test_server():
            print("❌ Cannot start server, aborting tests")
            return False
        
        try:
            # Test 1: Main page loads
            success, html_content = self.test_main_page_loads()
            if not success:
                return False
            
            # Test 2: Download buttons present in HTML
            buttons_present = self.test_download_buttons_present(html_content)
            
            # Test 3: JavaScript functions present
            js_functions_present = self.test_javascript_functions_present(html_content)
            
            # Test 4: API data endpoint works  
            api_success, api_data = self.test_api_data_endpoint()
            
            # Test 5: Results dashboard visibility
            dashboard_visible = self.test_results_dashboard_visibility(html_content)
            
            # Test 6: Check button visibility with JavaScript
            buttons_visible = self.check_download_button_visibility_js()
            
            # Test 7: Run comprehensive analysis and check again
            analysis_success, post_analysis_html = self.test_comprehensive_analysis_flow()
            if analysis_success and post_analysis_html:
                print("\n🔍 Re-checking download buttons after analysis...")
                post_analysis_buttons = self.test_download_buttons_present(post_analysis_html)
                post_analysis_dashboard = self.test_results_dashboard_visibility(post_analysis_html)
            else:
                post_analysis_buttons = False
                post_analysis_dashboard = False
            
            # Summary
            print("\n" + "="*70)
            print("TEST SUMMARY")
            print("="*70)
            print(f"Main page loads: {'✅' if success else '❌'}")
            print(f"Download buttons in HTML: {'✅' if buttons_present else '❌'}")
            print(f"JavaScript functions present: {'✅' if js_functions_present else '❌'}")
            print(f"API data endpoint works: {'✅' if api_success else '❌'}")
            print(f"Results dashboard visible: {'✅' if dashboard_visible else '❌'}")
            print(f"Download buttons visible: {'✅' if buttons_visible else '❌'}")
            print(f"Analysis completes: {'✅' if analysis_success else '❌'}")
            print(f"Buttons after analysis: {'✅' if post_analysis_buttons else '❌'}")
            print(f"Dashboard after analysis: {'✅' if post_analysis_dashboard else '❌'}")
            
            if not buttons_present or not js_functions_present:
                print("\n❌ ISSUE FOUND: Download functionality is missing from HTML template")
                print("   Solution: Add download functions to embedded HTML template")
            elif not buttons_visible:
                print("\n❌ ISSUE FOUND: Download buttons are hidden or not visible")
                print("   Solution: Check CSS visibility or JavaScript show/hide logic")
            elif not post_analysis_buttons:
                print("\n❌ ISSUE FOUND: Download buttons disappear after analysis")
                print("   Solution: Check JavaScript that updates UI after analysis")
            else:
                print("\n✅ Download functionality appears to be working correctly")
                print(f"\n🌐 Test server is running at: {self.base_url}")
                print("   You can manually verify download buttons by visiting this URL")
            
            return all([buttons_present, js_functions_present, api_success, buttons_visible])
            
        finally:
            self.stop_test_server()


def main():
    """Main entry point for download functionality testing."""
    tester = DownloadFunctionalityTester()
    success = tester.run_all_tests()
    
    if not success:
        print("\n" + "="*70)
        print("DEBUGGING SUGGESTIONS")
        print("="*70)
        print("1. Check if download JavaScript functions are in the embedded template")
        print("2. Verify CSS doesn't hide download buttons") 
        print("3. Check browser console for JavaScript errors")
        print("4. Ensure results dashboard is shown after data loads")
        print("5. Try manual testing with: source setup.sh && python -m src.webviewer test_results_with_function_code.json --port 5003")
        
    return 0 if success else 1


if __name__ == "__main__":
    exit(main())
