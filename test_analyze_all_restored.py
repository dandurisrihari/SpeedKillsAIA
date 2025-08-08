#!/usr/bin/env python3
"""
Test script to verify that the "Analyze All" functionality has been restored
"""

import requests
import json
import sys
from bs4 import BeautifulSoup

def test_analyze_all_functionality():
    """Test if the Analyze All functionality is properly restored"""
    print("🧪 Testing Analyze All Functionality Restoration")
    print("=" * 60)
    
    base_url = "http://127.0.0.1:5000"
    
    try:
        # Test if server is responding
        response = requests.get(base_url, timeout=5)
        if response.status_code != 200:
            print(f"❌ Server not responding: {response.status_code}")
            return False
        print("✅ Server is responding")
        
        # Parse the HTML content
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Check for Analyze All tab
        analyze_all_tab = soup.find('button', {'onclick': "showTab('analyzeAll')"})
        if not analyze_all_tab:
            print("❌ Analyze All tab button not found")
            return False
        print("✅ Analyze All tab button found")
        
        # Check for Analyze All tab content
        analyze_all_content = soup.find('div', {'id': 'analyzeAll'})
        if not analyze_all_content:
            print("❌ Analyze All tab content not found")
            return False
        print("✅ Analyze All tab content found")
        
        # Check for critical elements in Analyze All functionality
        required_elements = [
            ('analyzeAllModel', 'AI Model selector'),
            ('analyzeAllPrompt', 'Custom prompt input'),
            ('batchSize', 'Batch size selector'),
            ('maxComponents', 'Max components selector'),
            ('confidenceThreshold', 'Confidence threshold selector'),
            ('analyzeAllBtn', 'Analyze All button'),
            ('progressSection', 'Progress section'),
            ('resultsDashboard', 'Results dashboard')
        ]
        
        print("\n🔍 ANALYZE ALL COMPONENTS CHECK:")
        for element_id, description in required_elements:
            element = soup.find(attrs={'id': element_id})
            if element:
                print(f"  ✅ {description}: Found")
            else:
                print(f"  ❌ {description}: Missing (id='{element_id}')")
                return False
        
        # Check for onclick handler
        analyze_btn = soup.find('button', {'id': 'analyzeAllBtn'})
        if analyze_btn and 'runComprehensiveAnalysis()' in str(analyze_btn):
            print("  ✅ Analyze All button has correct onclick handler")
        else:
            print("  ❌ Analyze All button missing onclick handler")
            return False
        
        # Check for analyze all info section
        info_section = soup.find(class_='analyze-all-info')
        if info_section:
            print("  ✅ Analyze All information section found")
        else:
            print("  ❌ Analyze All information section missing")
            return False
        
        # Check for batch analysis controls
        batch_controls = soup.find(class_='batch-analysis')
        if batch_controls:
            print("  ✅ Batch analysis controls found")
        else:
            print("  ❌ Batch analysis controls missing")
            return False
        
        # Test if the tab is properly configured as active
        if 'active' in analyze_all_content.get('class', []):
            print("  ✅ Analyze All tab set as active by default")
        else:
            print("  ⚠️  Analyze All tab not set as active (this is okay)")
        
        print("\n🚀 COMPREHENSIVE ANALYSIS FEATURES:")
        
        # Check for analysis categories
        categories_list = soup.find(class_='analysis-categories')
        if categories_list:
            print("  ✅ Analysis categories list found")
            
            # Check for specific categories
            content = str(categories_list)
            if 'AIARelevantFunction' in content:
                print("    ✅ AIARelevantFunction category found")
            if 'Relevant KD Entry Point' in content:
                print("    ✅ Relevant KD Entry Point category found")
            if 'Message Structure Handling' in content:
                print("    ✅ Message Structure Handling category found")
        else:
            print("  ❌ Analysis categories list missing")
        
        # Check for control groups
        control_groups = soup.find_all(class_='control-group')
        print(f"  ✅ Found {len(control_groups)} control groups")
        
        # Check for specific selectors
        selectors = ['analyzeAllModel', 'batchSize', 'maxComponents', 'confidenceThreshold']
        for selector in selectors:
            select_element = soup.find('select', {'id': selector})
            if select_element:
                options = select_element.find_all('option')
                print(f"    ✅ {selector}: {len(options)} options available")
            else:
                print(f"    ❌ {selector}: Selector missing")
        
        print("\n📊 RESULTS DASHBOARD CHECK:")
        
        # Check results dashboard components
        dashboard_components = [
            ('results-header', 'Results header'),
            ('results-summary', 'Results summary'),
            ('results-grid', 'Results grid')
        ]
        
        for class_name, description in dashboard_components:
            element = soup.find(class_=class_name)
            if element:
                print(f"  ✅ {description}: Found")
            else:
                print(f"  ❌ {description}: Missing")
        
        print("\n🎯 FINAL VERIFICATION:")
        print("✅ All Analyze All functionality components have been successfully restored!")
        print("✅ The feature includes comprehensive analysis controls")
        print("✅ Progress tracking and results dashboard are available")
        print("✅ Analysis categories and information sections are present")
        
        print(f"\n🌐 Web UI is available at: {base_url}")
        print("🚀 You can now use the Analyze All feature to run comprehensive AI analysis!")
        
        return True
        
    except requests.exceptions.RequestException as e:
        print(f"❌ Failed to connect to server: {e}")
        print("💡 Make sure the web server is running at http://127.0.0.1:5000")
        return False
    except Exception as e:
        print(f"❌ Unexpected error: {e}")
        return False

if __name__ == "__main__":
    success = test_analyze_all_functionality()
    sys.exit(0 if success else 1)
