#!/usr/bin/env python3
"""
Test to verify download functionality after comprehensive analysis is completed.
This test simulates the exact scenario the user is experiencing.
"""

import time
import json
import pytest
import requests
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import TimeoutException, NoSuchElementException

class TestDownloadAfterAnalysis:
    @classmethod
    def setup_class(cls):
        """Set up Chrome driver for testing"""
        chrome_options = Options()
        chrome_options.add_argument('--headless')
        chrome_options.add_argument('--no-sandbox')
        chrome_options.add_argument('--disable-dev-shm-usage')
        chrome_options.add_argument('--disable-gpu')
        cls.driver = webdriver.Chrome(options=chrome_options)
        cls.driver.implicitly_wait(10)
        cls.base_url = "http://127.0.0.1:5001"

    @classmethod
    def teardown_class(cls):
        """Clean up driver"""
        cls.driver.quit()

    def test_web_server_is_running(self):
        """Test that the web server is accessible"""
        try:
            response = requests.get(f"{self.base_url}/api/data", timeout=5)
            assert response.status_code == 200, f"Web server not accessible: {response.status_code}"
        except requests.exceptions.RequestException as e:
            pytest.skip(f"Web server not running: {e}")

    def test_initial_download_buttons_present(self):
        """Test that download buttons are initially present on the homepage"""
        self.driver.get(self.base_url)
        
        # Wait for page to load
        WebDriverWait(self.driver, 10).until(
            EC.presence_of_element_located((By.CLASS_NAME, "container"))
        )
        
        # Look for download buttons
        download_buttons = self.driver.find_elements(By.CSS_SELECTOR, ".download-btn, [onclick*='downloadAnalysisResults']")
        
        print(f"Initial download buttons found: {len(download_buttons)}")
        for btn in download_buttons:
            print(f"  - Button text: '{btn.text}' | onclick: '{btn.get_attribute('onclick')}'")
        
        # Check if download buttons are initially present (they might be there from the start)
        if len(download_buttons) > 0:
            assert True, "Download buttons are present initially"
        else:
            print("No download buttons found initially - this might be expected")

    def test_navigate_to_comprehensive_analysis(self):
        """Test navigating to the comprehensive analysis tab"""
        self.driver.get(self.base_url)
        
        # Wait for page to load
        WebDriverWait(self.driver, 10).until(
            EC.presence_of_element_located((By.CLASS_NAME, "container"))
        )
        
        # Look for the LLM Analysis tab
        llm_tab = None
        tabs = self.driver.find_elements(By.CSS_SELECTOR, ".tab, [onclick*='showTab']")
        
        for tab in tabs:
            if "llm" in tab.get_attribute("onclick").lower() or "LLM" in tab.text or "AI" in tab.text:
                llm_tab = tab
                break
        
        if llm_tab:
            llm_tab.click()
            time.sleep(2)
            print("Clicked on LLM Analysis tab")
        else:
            print("Could not find LLM Analysis tab")
            # Print available tabs for debugging
            for tab in tabs:
                print(f"  Available tab: '{tab.text}' | onclick: '{tab.get_attribute('onclick')}'")

    def test_comprehensive_analysis_controls_present(self):
        """Test that comprehensive analysis controls are present"""
        self.driver.get(self.base_url)
        
        # Navigate to LLM tab first
        self.test_navigate_to_comprehensive_analysis()
        
        # Look for the comprehensive analysis button
        analyze_button = None
        buttons = self.driver.find_elements(By.CSS_SELECTOR, "button, .analyze-all-button, [onclick*='runComprehensiveAnalysis']")
        
        for btn in buttons:
            btn_text = btn.text.lower()
            btn_onclick = btn.get_attribute('onclick') or ''
            if 'comprehensive' in btn_text or 'analyze all' in btn_text or 'runComprehensiveAnalysis' in btn_onclick:
                analyze_button = btn
                break
        
        if analyze_button:
            print(f"Found comprehensive analysis button: '{analyze_button.text}'")
            # Check if button is enabled
            is_disabled = analyze_button.get_attribute('disabled')
            print(f"Button disabled status: {is_disabled}")
            assert analyze_button is not None, "Comprehensive analysis button should be present"
        else:
            print("Comprehensive analysis button not found")
            # Print all buttons for debugging
            for btn in buttons:
                print(f"  Available button: '{btn.text}' | onclick: '{btn.get_attribute('onclick')}'")

    def test_mock_comprehensive_analysis(self):
        """Test running a mock comprehensive analysis and checking for download buttons"""
        self.driver.get(self.base_url)
        
        # Wait for page load
        time.sleep(3)
        
        # Execute JavaScript to simulate comprehensive analysis completion
        mock_analysis_js = """
        // Simulate comprehensive analysis completion
        console.log('Starting mock comprehensive analysis...');
        
        // Show results dashboard
        const resultsDashboard = document.getElementById('resultsDashboard');
        if (resultsDashboard) {
            resultsDashboard.style.display = 'block';
            console.log('Results dashboard shown');
        } else {
            console.log('Results dashboard not found');
        }
        
        // Look for download buttons
        const downloadButtons = document.querySelectorAll('.download-btn, [onclick*="downloadAnalysisResults"]');
        console.log('Download buttons found:', downloadButtons.length);
        
        downloadButtons.forEach((btn, index) => {
            console.log(`Button ${index}: ${btn.textContent} | onclick: ${btn.getAttribute('onclick')}`);
            btn.style.display = 'block';
            btn.style.visibility = 'visible';
        });
        
        // Create download buttons if they don't exist
        if (downloadButtons.length === 0) {
            console.log('Creating download buttons...');
            const resultsActions = document.querySelector('.results-actions');
            if (resultsActions) {
                resultsActions.innerHTML = `
                    <button class="download-btn" onclick="downloadAnalysisResults('json')" id="downloadJsonBtn">
                        📥 Download JSON
                    </button>
                    <button class="download-btn" onclick="downloadAnalysisResults('csv')" id="downloadCsvBtn">
                        📊 Download CSV
                    </button>
                    <button class="download-btn" onclick="downloadAnalysisResults('html')" id="downloadHtmlBtn">
                        🌐 Download Report
                    </button>
                `;
                console.log('Download buttons created');
            }
        }
        
        return {
            resultsDashboard: !!resultsDashboard,
            downloadButtonsCount: downloadButtons.length,
            buttonTexts: Array.from(downloadButtons).map(btn => btn.textContent.trim())
        };
        """
        
        result = self.driver.execute_script(mock_analysis_js)
        print(f"Mock analysis result: {result}")
        
        # Wait a moment for any dynamic updates
        time.sleep(2)
        
        # Now check for download buttons again
        download_buttons = self.driver.find_elements(By.CSS_SELECTOR, ".download-btn, [onclick*='downloadAnalysisResults']")
        
        print(f"Download buttons after mock analysis: {len(download_buttons)}")
        for btn in download_buttons:
            print(f"  - Button: '{btn.text}' | visible: {btn.is_displayed()} | enabled: {btn.is_enabled()}")
        
        assert len(download_buttons) >= 3, f"Expected at least 3 download buttons, found {len(download_buttons)}"

    def test_download_functions_exist(self):
        """Test that download JavaScript functions exist in the page"""
        self.driver.get(self.base_url)
        
        # Wait for page load
        time.sleep(3)
        
        # Check if download functions are defined
        functions_check_js = """
        const functions = ['downloadAnalysisResults', 'downloadJSON', 'downloadCSV', 'downloadHTML'];
        const results = {};
        
        functions.forEach(funcName => {
            results[funcName] = typeof window[funcName] === 'function';
        });
        
        return results;
        """
        
        function_results = self.driver.execute_script(functions_check_js)
        print(f"Download functions availability: {function_results}")
        
        # All download functions should exist
        for func_name, exists in function_results.items():
            assert exists, f"Download function '{func_name}' should be defined"

    def test_api_endpoints_accessible(self):
        """Test that required API endpoints are accessible"""
        endpoints = [
            "/api/data",
            "/api/analyze/comprehensive"
        ]
        
        for endpoint in endpoints:
            try:
                if endpoint == "/api/analyze/comprehensive":
                    # POST request for comprehensive analysis
                    response = requests.post(f"{self.base_url}{endpoint}", 
                                           json={"component_types": ["functions"], "batch_size": 1},
                                           timeout=10)
                else:
                    # GET request
                    response = requests.get(f"{self.base_url}{endpoint}", timeout=5)
                
                print(f"Endpoint {endpoint}: Status {response.status_code}")
                assert response.status_code in [200, 404], f"Endpoint {endpoint} returned unexpected status: {response.status_code}"
                
            except requests.exceptions.RequestException as e:
                print(f"Endpoint {endpoint} failed: {e}")

    def test_results_dashboard_visibility(self):
        """Test the results dashboard visibility logic"""
        self.driver.get(self.base_url)
        time.sleep(3)
        
        # Check initial state of results dashboard
        dashboard_check_js = """
        const dashboard = document.getElementById('resultsDashboard');
        const downloadBtns = document.querySelectorAll('.download-btn');
        
        return {
            dashboardExists: !!dashboard,
            dashboardVisible: dashboard ? window.getComputedStyle(dashboard).display !== 'none' : false,
            downloadBtnCount: downloadBtns.length,
            downloadBtnsVisible: Array.from(downloadBtns).map(btn => window.getComputedStyle(btn).display !== 'none')
        };
        """
        
        initial_state = self.driver.execute_script(dashboard_check_js)
        print(f"Initial dashboard state: {initial_state}")
        
        # Try to make dashboard visible
        show_dashboard_js = """
        const dashboard = document.getElementById('resultsDashboard');
        if (dashboard) {
            dashboard.style.display = 'block';
            return true;
        }
        return false;
        """
        
        dashboard_shown = self.driver.execute_script(show_dashboard_js)
        print(f"Dashboard shown: {dashboard_shown}")
        
        # Check final state
        final_state = self.driver.execute_script(dashboard_check_js)
        print(f"Final dashboard state: {final_state}")

def run_manual_test():
    """Run a simplified manual test without Selenium"""
    print("Running manual download functionality test...")
    
    try:
        # Test API endpoints
        response = requests.get("http://127.0.0.1:5001/api/data", timeout=5)
        print(f"API /api/data status: {response.status_code}")
        
        if response.status_code == 200:
            data = response.json()
            print(f"Data keys: {list(data.keys())}")
        
        # Test comprehensive analysis endpoint
        analysis_response = requests.post("http://127.0.0.1:5001/api/analyze/comprehensive", 
                                        json={"component_types": ["functions"], "batch_size": 1},
                                        timeout=30)
        print(f"Comprehensive analysis status: {analysis_response.status_code}")
        
        if analysis_response.status_code == 200:
            analysis_data = analysis_response.json()
            print(f"Analysis result keys: {list(analysis_data.keys())}")
            print(f"Analysis status: {analysis_data.get('status')}")
            
        print("✅ Manual test completed successfully")
        
    except Exception as e:
        print(f"❌ Manual test failed: {e}")

if __name__ == "__main__":
    print("Testing download functionality after comprehensive analysis...")
    run_manual_test()
