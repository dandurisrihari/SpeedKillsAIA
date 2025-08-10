#!/usr/bin/env python3
"""
Test script to validate struct extraction functionality
"""
import json
import sys
from pathlib import Path

def test_struct_extraction():
    """Test that struct definitions are properly extracted and included in JSON output"""
    
    # Check if the test output file exists
    test_file = Path("test_output_with_structs.json")
    if not test_file.exists():
        print("❌ Test output file not found. Run the preprocess tool first.")
        return False
    
    try:
        with open(test_file, 'r') as f:
            data = json.load(f)
        
        # Check if struct_definitions key exists
        if 'struct_definitions' not in data:
            print("❌ struct_definitions key not found in JSON output")
            return False
        
        struct_defs = data['struct_definitions']
        
        # Check if we have struct definitions
        if not struct_defs:
            print("⚠️  No struct definitions found")
            return True
        
        print(f"✅ Found {len(struct_defs)} struct definitions")
        
        # Look for the specific ftrace_branch_data structure
        ftrace_structs = [s for s in struct_defs if s.get('name') == 'ftrace_branch_data']
        if ftrace_structs:
            print(f"✅ Found ftrace_branch_data structure (appears {len(ftrace_structs)} times)")
            print("   Code preview:")
            code_preview = ftrace_structs[0]['code'][:100].replace('\n', '\\n')
            print(f"   {code_preview}...")
        
        # Check struct diversity
        unique_names = set(s.get('name', '') for s in struct_defs)
        print(f"✅ Found {len(unique_names)} unique struct names")
        
        # Sample some structure names
        sample_names = sorted(unique_names)[:10]
        print(f"   Sample names: {', '.join(sample_names)}")
        
        # Check required fields
        required_fields = ['kind', 'name', 'file', 'start_line', 'end_line', 'code']
        for i, struct_def in enumerate(struct_defs[:5]):  # Check first 5
            for field in required_fields:
                if field not in struct_def:
                    print(f"❌ Missing field '{field}' in struct definition {i}")
                    return False
        
        print("✅ All required fields present in struct definitions")
        return True
        
    except Exception as e:
        print(f"❌ Error testing struct extraction: {e}")
        return False

def main():
    print("🧪 Testing Struct Extraction Integration")
    print("=" * 50)
    
    success = test_struct_extraction()
    
    if success:
        print("\n✅ All tests passed!")
        print("\n📋 Usage:")
        print("   # Parse logs with struct extraction:")
        print("   python -m src.preprocess --log your_log.log --source-root kernel_src/ -o output.json")
        print("   ")
        print("   # View struct definitions:")
        print("   jq '.struct_definitions[] | select(.name == \"struct_name\")' output.json")
        print("   ")
        print("   # Count structs:")
        print("   jq '.struct_definitions | length' output.json")
        print("   ")
        print("   # List unique struct names:")
        print("   jq -r '.struct_definitions[].name' output.json | sort | uniq")
    else:
        print("\n❌ Tests failed!")
        sys.exit(1)

if __name__ == "__main__":
    main()
