#!/usr/bin/env python3
"""
Test script to verify webviewer functionality
"""
import sys
import os

# Add src to path
script_dir = os.path.dirname(os.path.abspath(__file__))
src_dir = os.path.join(script_dir, 'src')
sys.path.insert(0, src_dir)

def test_webviewer():
    try:
        print("Testing webviewer import...")
        from webviewer.ui import create_app
        print("✅ Import successful")
        
        app = create_app()
        print("✅ App creation successful")
        
        print("Available routes:")
        for rule in app.url_map.iter_rules():
            print(f"  {rule.rule} -> {rule.endpoint}")
        
        return True
    except Exception as e:
        print(f"❌ Error: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_llm_module():
    try:
        print("\nTesting LLM module import...")
        from llm_analysis.llm import LLMAnalyzer
        print("✅ LLM module import successful")
        
        analyzer = LLMAnalyzer()
        print("✅ LLM analyzer creation successful")
        
        return True
    except Exception as e:
        print(f"❌ LLM Error: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == "__main__":
    print("SpeedKillsAIA Webviewer Test")
    print("=" * 30)
    
    webviewer_ok = test_webviewer()
    llm_ok = test_llm_module()
    
    print("\n" + "=" * 30)
    if webviewer_ok and llm_ok:
        print("✅ All tests passed!")
    else:
        print("❌ Some tests failed")
