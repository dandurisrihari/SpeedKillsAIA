#!/usr/bin/env python3
"""
Test script to verify all LLM analysis endpoints are correctly mapped
"""

import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), 'src')))

def test_endpoint_mapping():
    """Test that JavaScript endpoints match backend endpoints"""
    
    # Expected backend endpoints from ui.py
    backend_endpoints = [
        '/api/llm/analyze/function',
        '/api/llm/analyze/dma', 
        '/api/llm/analyze/user-copy',  # Note: hyphen, not underscore
        '/api/llm/analyze/ioctl',
        '/api/llm/analyze/logs'
    ]
    
    # Check main.js for endpoint usage
    main_js_path = "src/webviewer/static/js/main.js"
    
    with open(main_js_path, 'r') as f:
        content = f.read()
    
    print("=== Testing LLM Analysis Endpoint Mapping ===\n")
    
    for endpoint in backend_endpoints:
        if endpoint in content:
            print(f"✅ {endpoint} - Found in JavaScript")
        else:
            print(f"❌ {endpoint} - NOT found in JavaScript")
    
    # Check for incorrect endpoints
    incorrect_endpoints = [
        '/api/llm/analyze/user_copy',  # Wrong: should be user-copy
    ]
    
    print("\n=== Checking for Incorrect Endpoints ===\n")
    
    for endpoint in incorrect_endpoints:
        if endpoint in content:
            print(f"❌ {endpoint} - INCORRECT endpoint found in JavaScript")
        else:
            print(f"✅ {endpoint} - Incorrect endpoint NOT found (good)")
    
    print("\n=== Backend Route Check ===\n")
    
    # Check backend routes
    ui_py_path = "src/webviewer/ui.py"
    with open(ui_py_path, 'r') as f:
        ui_content = f.read()
    
    for endpoint in backend_endpoints:
        route_declaration = f"@app.route('{endpoint}'"
        if route_declaration in ui_content:
            print(f"✅ {endpoint} - Route defined in backend")
        else:
            print(f"❌ {endpoint} - Route NOT defined in backend")
    
    print("\n=== Endpoint Mapping Test Complete ===")

if __name__ == "__main__":
    test_endpoint_mapping()
