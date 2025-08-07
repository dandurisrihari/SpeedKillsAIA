#!/usr/bin/env python3
"""
Regression test for AIA-specific UI prompts
"""

import pytest
import os

def test_ui_prompts_are_aia_specific():
    """Test that all UI default prompts are AIA-specific"""
    
    main_js_path = "src/webviewer/static/js/main.js"
    
    # Check that the main.js file exists
    assert os.path.exists(main_js_path), f"{main_js_path} not found"
    
    with open(main_js_path, 'r') as f:
        content = f.read()
    
    # Test that old generic security prompts are NOT present
    old_prompts = [
        "security vulnerabilities and potential attack vectors",
        "security issues, coherency problems, and potential race conditions",
        "buffer overflow vulnerabilities and input validation issues",
        "privilege escalation vulnerabilities and input validation issues"
    ]
    
    for old_prompt in old_prompts:
        assert old_prompt not in content, f"Found old generic prompt: '{old_prompt}'"
    
    # Test that new AIA-specific prompts ARE present
    aia_prompts = [
        "AI Accelerator (AIA) integration patterns: memory sharing with AI accelerators",
        "AI Accelerator (AIA) integration: memory management, DMA buffer sharing",
        "AI Accelerator (AIA) integration: message structures with SMIDs",
        "AI Accelerator (AIA) integration: message structure handling, SMID management"
    ]
    
    for aia_prompt in aia_prompts:
        assert aia_prompt in content, f"Missing AIA-specific prompt: '{aia_prompt}'"
    
    print("✅ All UI prompts successfully updated to AIA-specific prompts")

if __name__ == "__main__":
    test_ui_prompts_are_aia_specific()
    print("UI prompt regression test passed!")
