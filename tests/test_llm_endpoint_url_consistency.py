#!/usr/bin/env python3
"""
Regression test for LLM analysis endpoint URL consistency
"""

import pytest
import os

def test_llm_endpoint_url_consistency():
    """Test that JavaScript frontend uses correct LLM analysis endpoint URLs"""
    
    main_js_path = "src/webviewer/static/js/main.js"
    ui_py_path = "src/webviewer/ui.py"
    
    # Check that files exist
    assert os.path.exists(main_js_path), f"{main_js_path} not found"
    assert os.path.exists(ui_py_path), f"{ui_py_path} not found"
    
    # Read main.js content
    with open(main_js_path, 'r') as f:
        js_content = f.read()
    
    # Read ui.py content
    with open(ui_py_path, 'r') as f:
        py_content = f.read()
    
    # Expected correct endpoints
    correct_endpoints = [
        '/api/llm/analyze/function',
        '/api/llm/analyze/dma',
        '/api/llm/analyze/user-copy',  # Hyphen, not underscore
        '/api/llm/analyze/ioctl'
    ]
    
    # Check that all correct endpoints are used in JavaScript
    for endpoint in correct_endpoints:
        assert endpoint in js_content, f"Correct endpoint '{endpoint}' not found in main.js"
    
    # Check that all correct endpoints are defined in backend
    for endpoint in correct_endpoints:
        route_declaration = f"@app.route('{endpoint}'"
        assert route_declaration in py_content, f"Route '{endpoint}' not defined in ui.py"
    
    # Check that incorrect endpoints are NOT used
    incorrect_endpoints = [
        '/api/llm/analyze/user_copy',  # Underscore instead of hyphen
        '/api/llm/analyze/function_',  # Extra underscore
        '/api/llm/analyze/dma_operation',  # Different naming
        '/api/llm/analyze/ioctl_handler'  # Different naming
    ]
    
    for incorrect_endpoint in incorrect_endpoints:
        assert incorrect_endpoint not in js_content, f"Incorrect endpoint '{incorrect_endpoint}' found in main.js"
    
    print("✅ All LLM analysis endpoints are correctly mapped between frontend and backend")

if __name__ == "__main__":
    test_llm_endpoint_url_consistency()
    print("LLM endpoint URL consistency test passed!")
