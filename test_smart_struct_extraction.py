#!/usr/bin/env python3
"""
Test Smart Struct Extraction - Verify that we only extract relevant structs
"""

import sys
import os
from pathlib import Path

# Add the project root to the path
project_root = Path(__file__).parent
sys.path.insert(0, str(project_root))

from src.llm_analysis.struct_context import StructContextProvider

def test_smart_struct_extraction():
    """Test the smart struct extraction functionality"""
    
    print("=== TESTING SMART STRUCT EXTRACTION ===\n")
    
    # Initialize the struct provider with the new format JSON
    json_file = "data/json_files/nxp_boot.json"
    if not Path(json_file).exists():
        print(f"❌ JSON file not found: {json_file}")
        return False
    
    provider = StructContextProvider(json_file)
    print(f"✅ Initialized StructContextProvider with {json_file}")
    
    # Test with a sample function that references specific structs
    test_function_code = """
static int gpu_clock_set(struct device *dev, unsigned long rate)
{
    struct clk_hw *hw = __clk_get_hw(dev->clk);
    struct gpu_device *gpu_dev = dev_get_drvdata(dev);
    gckHARDWARE hardware;
    gceSTATUS status;
    
    if (!gpu_dev || !gpu_dev->hardware) {
        printk("Invalid device or hardware\\n");
        return -EINVAL;
    }
    
    status = gckHARDWARE_SetPowerManagementState(hardware, gcvPOWER_ON);
    if (status != gcvSTATUS_OK) {
        return -EIO;
    }
    
    return clk_set_rate(dev->clk, rate);
}
"""
    
    test_file_path = "drivers/mxc/gpu-viv/hal/kernel/gc_hal_kernel_video_memory.c"
    
    print(f"\n=== Testing with function: gpu_clock_set ===")
    print(f"Function code length: {len(test_function_code)} characters")
    
    # Test 1: Get ALL structs (old method)
    print(f"\n1. Testing get_all_structs_for_file (old method)...")
    all_struct_data = provider.get_all_structs_for_file(test_file_path)
    
    if all_struct_data:
        all_structs_content = all_struct_data.get("all_struct_definitions", "")
        print(f"   ✅ Found all structs: {len(all_structs_content):,} characters")
        all_struct_count = len([m for m in all_structs_content.split("struct ") if len(m.strip()) > 0]) - 1
        print(f"   📊 Approximate struct count: {all_struct_count}")
    else:
        print("   ❌ No struct data found")
        return False
    
    # Test 2: Get RELEVANT structs (new smart method)
    print(f"\n2. Testing get_relevant_structs_for_function (new smart method)...")
    relevant_struct_data = provider.get_relevant_structs_for_function(
        "gpu_clock_set", test_file_path, test_function_code
    )
    
    if relevant_struct_data:
        relevant_structs_content = relevant_struct_data.get("all_struct_definitions", "")
        print(f"   ✅ Found relevant structs: {len(relevant_structs_content):,} characters")
        
        # Show extraction details
        extraction_method = relevant_struct_data.get("extraction_method", "")
        original_size = relevant_struct_data.get("original_size", 0)
        filtered_size = relevant_struct_data.get("filtered_size", 0)
        
        if extraction_method == "smart_filtering":
            reduction_pct = ((original_size - filtered_size) / original_size * 100) if original_size > 0 else 0
            print(f"   📉 Size reduction: {original_size:,} → {filtered_size:,} chars ({reduction_pct:.1f}% reduction)")
            print(f"   🎯 Extraction method: {extraction_method}")
            
            relevant_struct_count = len([m for m in relevant_structs_content.split("struct ") if len(m.strip()) > 0]) - 1
            print(f"   📊 Relevant struct count: ~{relevant_struct_count}")
            
            if filtered_size < original_size:
                print(f"   🎉 SUCCESS: Smart filtering reduced context size!")
            else:
                print(f"   ⚠️  WARNING: No size reduction achieved")
        else:
            print(f"   ❌ Extraction method: {extraction_method}")
    else:
        print("   ❌ No relevant struct data found")
        return False
    
    # Test 3: Format for LLM
    print(f"\n3. Testing format_structs_for_llm...")
    formatted_structs = provider.format_structs_for_llm(relevant_struct_data)
    print(f"   ✅ Formatted for LLM: {len(formatted_structs):,} characters")
    print(f"   📄 Preview (first 300 chars):")
    print(f"   {formatted_structs[:300]}...")
    
    # Test 4: Summary
    print(f"\n4. Testing get_structs_summary...")
    summary = provider.get_structs_summary(relevant_struct_data)
    print(f"   ✅ Summary generated:")
    for key, value in summary.items():
        print(f"      {key}: {value}")
    
    print(f"\n=== SMART STRUCT EXTRACTION TEST COMPLETE ===")
    
    # Check if we achieved significant size reduction
    if (relevant_struct_data.get("extraction_method") == "smart_filtering" and 
        relevant_struct_data.get("filtered_size", 0) < relevant_struct_data.get("original_size", 0)):
        print(f"🎉 SUCCESS: Smart struct extraction is working and reducing context size!")
        return True
    else:
        print(f"⚠️  NEEDS IMPROVEMENT: Smart extraction needs better filtering logic")
        return False

def test_struct_reference_detection():
    """Test the struct reference detection logic"""
    
    print("\n=== TESTING STRUCT REFERENCE DETECTION ===\n")
    
    provider = StructContextProvider("data/json_files/nxp_boot.json")
    
    test_cases = [
        {
            "name": "Basic struct usage",
            "code": "struct device *dev; struct clk_hw *hw;",
            "expected": {"device", "clk_hw"}
        },
        {
            "name": "Typedef usage", 
            "code": "gceSTATUS status; gckHARDWARE hardware;",
            "expected": {"gceSTATUS", "gckHARDWARE"}
        },
        {
            "name": "Member access",
            "code": "dev->clk; gpu_dev->hardware;",
            "expected": {"clk", "hardware"}
        },
        {
            "name": "sizeof usage",
            "code": "malloc(sizeof(my_struct_t));",
            "expected": {"my_struct_t"}
        }
    ]
    
    for i, test_case in enumerate(test_cases, 1):
        print(f"{i}. {test_case['name']}")
        print(f"   Code: {test_case['code']}")
        
        references = provider._find_struct_references(test_case['code'])
        print(f"   Found: {references}")
        print(f"   Expected: {test_case['expected']}")
        
        if references.intersection(test_case['expected']):
            print(f"   ✅ PASS: Found some expected references")
        else:
            print(f"   ❌ FAIL: No expected references found")
        print()

if __name__ == "__main__":
    print("🔍 Testing Smart Struct Extraction System")
    print("=" * 50)
    
    # Test the smart extraction
    success = test_smart_struct_extraction()
    
    # Test the reference detection
    test_struct_reference_detection()
    
    if success:
        print("\n🎉 All tests completed successfully!")
        exit(0)
    else:
        print("\n❌ Some tests failed. Check implementation.")
        exit(1)
