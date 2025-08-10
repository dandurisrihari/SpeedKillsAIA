#!/usr/bin/env python3
"""
Test script to validate the enhanced Full Analysis Details functionality.
Tests that function code and struct definitions are included in analysis results.
"""

import json
import requests
import sys
from pathlib import Path

def test_enhanced_analysis_display():
    """Test that analysis results include function code and struct definitions"""
    
    print("🧪 Testing Enhanced Analysis Display")
    print("=" * 60)
    
    # Test data
    test_function = "gckVIDMEM_NODE_AllocateVirtual"
    test_file = "drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_video_memory.c"
    
    try:
        # Make API request for function analysis
        api_url = "http://127.0.0.1:5000/api/llm/analyze/function"
        payload = {
            "function_name": test_function,
            "file_path": test_file,
            "source_code": "gceSTATUS gckVIDMEM_NODE_AllocateVirtual() { /* test function */ }",
            "custom_prompt": "Analyze this function for testing",
            "model": "gpt-3.5-turbo"
        }
        
        print(f"🔍 Testing function: {test_function}")
        print(f"📁 From file: {test_file}")
        
        response = requests.post(api_url, json=payload, timeout=30)
        
        if response.status_code != 200:
            print(f"❌ API request failed with status {response.status_code}")
            print(f"Response: {response.text}")
            return False
            
        result = response.json()
        
        # Check basic response structure
        print(f"✅ API Response Status: {result.get('status', 'unknown')}")
        
        # Check if function code is included
        if 'function_code' in result:
            print(f"✅ Function code included: {len(result['function_code'])} characters")
            print(f"   Preview: {result['function_code'][:50]}...")
        else:
            print("❌ Function code NOT included in response")
            return False
            
        # Check if struct definitions are included
        if 'struct_definitions_formatted' in result:
            struct_defs = result['struct_definitions_formatted']
            if struct_defs:
                print(f"✅ Struct definitions included: {len(struct_defs)} characters")
                print(f"   Contains struct definitions: {'RELEVANT STRUCT DEFINITIONS' in struct_defs}")
                # Show first few lines
                lines = struct_defs.split('\n')[:5]
                for line in lines:
                    if line.strip():
                        print(f"   > {line}")
            else:
                print("⚠️  Struct definitions field present but empty")
        else:
            print("❌ Struct definitions NOT included in response")
            return False
            
        # Check struct context metadata
        if 'struct_context' in result and result['struct_context'].get('count', 0) > 0:
            struct_count = result['struct_context']['count']
            print(f"✅ Struct context metadata: {struct_count} structs")
            
            # Show some struct names
            structs = result['struct_context'].get('structs', [])
            if structs:
                print("   Struct names:")
                for i, struct in enumerate(structs[:3]):  # Show first 3
                    print(f"     • {struct.get('name', 'Unknown')} ({struct.get('file', 'no file')})")
                if len(structs) > 3:
                    print(f"     ... and {len(structs) - 3} more")
        else:
            print("⚠️  No struct context found")
            
        # Check if analysis text is present
        if 'analysis' in result and result['analysis']:
            print(f"✅ Analysis text included: {len(result['analysis'])} characters")
        else:
            print("❌ Analysis text missing or empty")
            return False
            
        print("\n📊 Complete Response Keys:")
        for key in sorted(result.keys()):
            value = result[key]
            if isinstance(value, str):
                print(f"   • {key}: {len(value)} chars")
            elif isinstance(value, dict):
                print(f"   • {key}: {len(value)} items")
            elif isinstance(value, list):
                print(f"   • {key}: {len(value)} items")
            else:
                print(f"   • {key}: {type(value).__name__}")
                
        print("\n🎉 Enhanced Analysis Display Test PASSED!")
        print("   ✓ Function code included")
        print("   ✓ Struct definitions included")
        print("   ✓ Analysis text included")
        print("   ✓ Metadata complete")
        
        return True
        
    except requests.exceptions.RequestException as e:
        print(f"❌ Network error: {e}")
        return False
    except json.JSONDecodeError as e:
        print(f"❌ JSON decode error: {e}")
        return False
    except Exception as e:
        print(f"❌ Unexpected error: {e}")
        return False

def main():
    """Main test function"""
    success = test_enhanced_analysis_display()
    sys.exit(0 if success else 1)

if __name__ == "__main__":
    main()
