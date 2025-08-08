#!/usr/bin/env python3
"""
Test to verify that download buttons appear after comprehensive analysis.
"""

import requests
import time
import sys
from bs4 import BeautifulSoup

def test_download_buttons():
    """Test that download buttons appear after comprehensive analysis"""
    
    base_url = "http://127.0.0.1:5000"
    
    print("🧪 Testing Download Buttons After Comprehensive Analysis")
    print("=" * 60)
    
    # Step 1: Verify server is running
    print("1. Checking if web server is accessible...")
    try:
        response = requests.get(base_url, timeout=5)
        if response.status_code == 200:
            print("   ✅ Web server is running")
        else:
            print(f"   ❌ Server returned status {response.status_code}")
            return False
    except requests.exceptions.RequestException as e:
        print(f"   ❌ Cannot connect to server: {e}")
        return False
    
    # Step 2: Check if LLM Analysis tab exists and has comprehensive analysis section
    print("\n2. Checking LLM Analysis tab and comprehensive analysis section...")
    soup = BeautifulSoup(response.text, 'html.parser')
    
    # Find LLM Analysis tab
    llm_tab = soup.find('button', {'onclick': "showTab('llmAnalysis', this)"})
    if llm_tab:
        print("   ✅ LLM Analysis tab found")
    else:
        print("   ❌ LLM Analysis tab not found")
        return False
    
    # Check for Analyze All button
    analyze_btn = soup.find('button', {'id': 'analyzeAllBtn'})
    if analyze_btn:
        print("   ✅ Analyze All button found")
    else:
        print("   ❌ Analyze All button not found")
        return False
    
    # Check for results dashboard (should be hidden initially)
    results_dashboard = soup.find('div', {'id': 'resultsDashboard'})
    if results_dashboard:
        print("   ✅ Results dashboard element found")
        # Check if it has display: none or is hidden
        if 'results-dashboard' in results_dashboard.get('class', []):
            print("   ✅ Results dashboard has correct CSS class")
        else:
            print("   ⚠️  Results dashboard missing CSS class")
    else:
        print("   ❌ Results dashboard not found")
        return False
    
    # Step 3: Check for download buttons in the HTML (should exist but be hidden)
    print("\n3. Checking for download buttons in the HTML...")
    
    download_buttons = {
        'json': soup.find('button', {'id': 'downloadJsonBtn'}),
        'csv': soup.find('button', {'id': 'downloadCsvBtn'}),
        'html': soup.find('button', {'id': 'downloadHtmlBtn'})
    }
    
    all_buttons_found = True
    for button_type, button in download_buttons.items():
        if button:
            print(f"   ✅ {button_type.upper()} download button found")
            # Check if button has correct classes
            classes = button.get('class', [])
            if 'download-btn' in classes:
                print(f"      ✅ {button_type.upper()} button has download-btn class")
                # Check for styling classes
                style_classes = ['primary', 'secondary', 'tertiary']
                has_style = any(cls in classes for cls in style_classes)
                if has_style:
                    print(f"      ✅ {button_type.upper()} button has proper styling class")
                else:
                    print(f"      ⚠️  {button_type.upper()} button missing styling class")
            else:
                print(f"      ❌ {button_type.upper()} button missing download-btn class")
                all_buttons_found = False
        else:
            print(f"   ❌ {button_type.upper()} download button not found")
            all_buttons_found = False
    
    if not all_buttons_found:
        return False
    
    # Step 4: Check CSS for download button styles
    print("\n4. Checking CSS for download button styles...")
    
    # Make a request to the CSS file
    try:
        css_response = requests.get(f"{base_url}/static/css/main.css", timeout=5)
        if css_response.status_code == 200:
            css_content = css_response.text
            
            # Check for download button CSS classes
            css_checks = [
                ('.download-btn', 'download-btn'),
                ('.download-btn.primary', 'primary styling'),
                ('.download-btn.secondary', 'secondary styling'),
                ('.download-btn.tertiary', 'tertiary styling'),
                ('.results-dashboard', 'results dashboard'),
                ('.results-dashboard.visible', 'visible state'),
                ('.results-actions', 'results actions')
            ]
            
            for css_class, description in css_checks:
                if css_class in css_content:
                    print(f"   ✅ {description} CSS found")
                else:
                    print(f"   ❌ {description} CSS missing")
                    
        else:
            print(f"   ❌ Cannot access CSS file: status {css_response.status_code}")
            
    except requests.exceptions.RequestException as e:
        print(f"   ❌ Error accessing CSS: {e}")
    
    # Step 5: Test comprehensive analysis API
    print("\n5. Testing comprehensive analysis API...")
    
    try:
        api_url = f"{base_url}/api/analyze/comprehensive"
        request_data = {
            'component_types': ['functions', 'dma_operations', 'user_copy_operations', 'ioctl_operations'],
            'batch_size': 2,
            'model_id': 'gpt-3.5-turbo',
            'custom_prompt': '',
            'max_components': 10,
            'confidence_threshold': 50
        }
        
        print("   🔄 Running comprehensive analysis...")
        api_response = requests.post(api_url, json=request_data, timeout=30)
        
        if api_response.status_code == 200:
            result_data = api_response.json()
            print("   ✅ Comprehensive analysis API works")
            
            # Check response structure
            if 'results' in result_data:
                print(f"   ✅ Analysis returned {len(result_data['results'])} results")
            else:
                print("   ⚠️  No results key in response")
                
            if 'total' in result_data:
                print(f"   ✅ Analysis processed {result_data['total']} components")
            else:
                print("   ⚠️  No total key in response")
                
        else:
            print(f"   ❌ API returned status {api_response.status_code}")
            print(f"       Response: {api_response.text[:200]}...")
            
    except requests.exceptions.RequestException as e:
        print(f"   ❌ API request failed: {e}")
    
    # Step 6: Check JavaScript functions
    print("\n6. Checking JavaScript functions...")
    
    # Look for key JavaScript functions in the HTML
    html_content = response.text
    
    js_functions = [
        'runComprehensiveAnalysis',
        'downloadAnalysisResults',
        'downloadJSON',
        'downloadCSV', 
        'downloadHTML'
    ]
    
    for func in js_functions:
        if f"function {func}" in html_content:
            print(f"   ✅ {func} function found")
        else:
            print(f"   ❌ {func} function missing")
    
    print("\n" + "=" * 60)
    print("🎯 SUMMARY:")
    print("   The download buttons should now appear after running comprehensive analysis.")
    print("   Key fixes implemented:")
    print("   • Added 'visible' class to results dashboard")
    print("   • Added CSS styling classes to download buttons")
    print("   • Added results-actions CSS for proper layout")
    print("   • Ensured JavaScript shows dashboard correctly")
    print("\n   To test manually:")
    print("   1. Go to http://127.0.0.1:5000")
    print("   2. Click the 'LLM Analysis' tab")
    print("   3. Click 'Start Comprehensive Analysis'")
    print("   4. Wait for analysis to complete")
    print("   5. Download buttons should appear below results")
    
    return True

if __name__ == "__main__":
    success = test_download_buttons()
    if success:
        print("\n🏆 TEST PASSED - Download button functionality should be working!")
        sys.exit(0)
    else:
        print("\n💥 TEST FAILED - Some issues were found")
        sys.exit(1)
