#!/usr/bin/env python3
"""
Test confidence score parsing directly
"""

import sys
import os

# Add the src directory to the path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from src.llm_analysis.llm import LLMAnalyzer

def test_parsing():
    """Test confidence score parsing"""
    
    # Sample analysis text that matches what the LLM returned
    analysis_text = """```yaml
Function/Code_Block_Name: drm_ioctl_handler
AIARelevantFunction: 15%
Relevant_KD_Entry_Point: 85%
Message_Structure_Handling: 45%
Reasoning:
  - The given function drm_ioctl_handler in drm_ioctl.c appears to be an ioctl handler
  - This represents a clear entry point from user space to kernel (high entry point score)
  - Limited AI accelerator relevance (low AIA score)
  - Some message structure handling via ioctl commands (medium message score)
```"""
    
    analyzer = LLMAnalyzer()
    scores = analyzer._parse_confidence_scores(analysis_text)
    
    print("Analysis text:")
    print(analysis_text)
    print("\nParsed scores:")
    for key, value in scores.items():
        print(f"  {key}: {value}%")
    
    # Test with the exact format we saw in the test output
    real_analysis = """```yaml
Function/Code_Block_Name: drm_ioctl_handler
AIARelevantFunction: 0%
Relevant_KD_Entry_Point: 0%
Message_Structure_Handling: 0%
Reasoning:
  - The given function drm_ioctl_handler in drm_ioctl.c appears to be an ioctl handler"""
    
    real_scores = analyzer._parse_confidence_scores(real_analysis)
    print(f"\nReal analysis scores:")
    for key, value in real_scores.items():
        print(f"  {key}: {value}%")

if __name__ == "__main__":
    test_parsing()
