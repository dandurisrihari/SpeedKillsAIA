#!/usr/bin/env python3
"""
Test script to verify IOCTL handler fix in comprehensive analysis
"""

import json
import sys
import os

# Add the src directory to the path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from src.webviewer.ui import create_app

def test_ioctl_fix():
    """Test that IOCTL operations show proper function names instead of 'unknown'"""
    
    # Create test data with IOCTL operations
    test_data = {
        "ioctl_operations": [
            {
                "function_name": "drm_ioctl_handler",
                "file_path": "drivers/gpu/drm/drm_ioctl.c", 
                "line_number": 123,
                "function_code": "static int drm_ioctl_handler(struct file *file, unsigned int cmd, unsigned long arg) {\n    /* handler code */\n    return 0;\n}",
                "ioctl_commands": ["DRM_COMMAND_BASE"]
            },
            {
                "function_name": "v4l2_ioctl",
                "file_path": "drivers/media/v4l2/v4l2-ioctl.c",
                "line_number": 456,
                "function_code": "static long v4l2_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {\n    /* v4l2 handler */\n    return 0;\n}",
                "ioctl_commands": ["VIDIOC_QUERYCAP", "VIDIOC_ENUM_FMT"]
            }
        ],
        "dma_operations": [],
        "user_copy_operations": [],
        "functions_by_file": {}
    }
    
    # Create Flask app
    app = create_app()
    app.config['TESTING'] = True
    
    # Set the test data
    app.parsed_data = test_data
    
    with app.test_client() as client:
        # Test comprehensive analysis endpoint
        response = client.post('/api/analyze/comprehensive', 
                             json={
                                 "component_types": ["ioctl_operations"],
                                 "batch_size": 10,
                                 "model_id": "gpt-3.5-turbo",
                                 "custom_prompt": ""
                             })
        
        assert response.status_code == 200
        result = response.get_json()
        
        print("Response status:", result.get('status'))
        print("Total analyzed:", result.get('total'))
        print("Results found:", len(result.get('results', [])))
        
        # Check that IOCTL operations have proper names
        for i, analysis_result in enumerate(result.get('results', [])):
            component = analysis_result.get('component', {})
            name = component.get('name', 'MISSING_NAME')
            file_path = component.get('filePath', 'MISSING_PATH')
            
            print(f"\nIOCTL {i+1}:")
            print(f"  Name: {name}")
            print(f"  File: {file_path}")
            print(f"  Type: {analysis_result.get('type')}")
            print(f"  Analysis Status: {analysis_result.get('result', {}).get('status', 'missing')}")
            
            # Print actual LLM response for debugging
            analysis_text = analysis_result.get('result', {}).get('analysis', '')
            if analysis_text and len(analysis_text) > 200:
                print(f"  Analysis (first 200 chars): {analysis_text[:200]}...")
            else:
                print(f"  Analysis: {analysis_text}")
            
            # Check confidence scores - verify they exist and are parsed
            confidence_scores = analysis_result.get('confidenceScores', {})
            print(f"  Confidence Scores:")
            print(f"    AIA Relevant: {confidence_scores.get('AIARelevantFunction', 'missing')}%")
            print(f"    Entry Point: {confidence_scores.get('Relevant_KD_Entry_Point', 'missing')}%") 
            print(f"    Message Structure: {confidence_scores.get('Message_Structure_Handling', 'missing')}%")
            
            # Verify confidence scores are not missing (should be 0 or higher)
            assert isinstance(confidence_scores.get('AIARelevantFunction'), int), f"AIARelevantFunction score missing or not int: {confidence_scores}"
            assert isinstance(confidence_scores.get('Relevant_KD_Entry_Point'), int), f"Relevant_KD_Entry_Point score missing or not int: {confidence_scores}"
            assert isinstance(confidence_scores.get('Message_Structure_Handling'), int), f"Message_Structure_Handling score missing or not int: {confidence_scores}"
            
            # Verify that name is not 'unknown'
            assert name != 'unknown', f"IOCTL {i+1} has 'unknown' name: {name}"
            assert name in ['drm_ioctl_handler', 'v4l2_ioctl'], f"Unexpected IOCTL name: {name}"
            
            # Verify file path is correct
            assert file_path != 'Unknown', f"IOCTL {i+1} has 'Unknown' file path"
            assert 'drivers/' in file_path, f"Unexpected file path: {file_path}"

if __name__ == "__main__":
    try:
        test_ioctl_fix()
        print("\n✅ IOCTL fix test PASSED! Function names are now displayed correctly.")
    except Exception as e:
        print(f"\n❌ IOCTL fix test FAILED: {e}")
        sys.exit(1)
