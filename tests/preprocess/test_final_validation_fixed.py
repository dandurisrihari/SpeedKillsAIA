#!/usr/bin/env python3
"""
Fixed final validation test with correct field names
"""

import unittest
import tempfile
import json
import sys
from pathlib import Path

# Add the src directory to Python path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))

def test_modular_parser_complete():
    """Complete test of the modular kernel log parser with correct field names"""
    print("🧪 Testing Modular Kernel Log Parser")
    print("=" * 50)
    
    # Create test data
    test_log_content = """
[156.123456] FUNC_ENTRY: Entering function gasket_open at /gasket-driver/src/gasket_core.c:1229
[156.123457] FUNC_ENTRY: Entering function gasket_perform_mapping at /gasket-driver/src/gasket_page_table.c:640
[156.123458] DMA_INSTRUMENT: About to call dma_map_page from function gasket_perform_mapping at /gasket-driver/src/gasket_page_table.c:640
[156.123459] USER_COPY: About to call copy_from_user from function apex_set_performance_expectation at /apex/apex.c:500
[156.123460] USER_COPY_CONTEXT: Process PID=3999, COMM=classify_image
"""
    
    # Write to temporary file
    with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
        f.write(test_log_content)
        temp_log_file = f.name
    
    try:
        # Import and test API
        from src.preprocess.interfaces.api import parse_log
        
        print("\n1. Testing programmatic API...")
        results_dict = parse_log(temp_log_file, show_ui=False)
        
        assert 'statistics' in results_dict, "Should have statistics"
        stats = results_dict['statistics']
        assert stats['unique_function_entries'] > 0, "Should find function entries"
        assert stats['unique_dma_operations'] > 0, "Should find DMA operations"
        assert stats['unique_user_copy_operations'] > 0, "Should find user copy operations"
        
        print(f"   ✅ Function entries: {stats['unique_function_entries']}")
        print(f"   ✅ DMA operations: {stats['unique_dma_operations']}")
        print(f"   ✅ User copy operations: {stats['unique_user_copy_operations']}")
        
        # Test engine API with JSON output
        from src.preprocess.core.engine import KernelLogParserEngine
        
        print("\n2. Testing engine API with JSON output...")
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            temp_json_file = f.name
        
        try:
            engine = KernelLogParserEngine(show_ui=False)
            engine_results = engine.parse_log_file(temp_log_file, temp_json_file)
            
            # Verify JSON file was created
            assert Path(temp_json_file).exists(), "JSON output file should be created"
            
            with open(temp_json_file, 'r') as f:
                json_data = json.load(f)
            
            print("   ✅ JSON output saved successfully")
            
            # Test statistics
            print("\n3. Validating statistics...")
            stats = json_data.get('statistics', {})
            
            # Use the correct field names (files_need_analysis instead of total_files_analyzed)
            assert 'files_need_analysis' in stats, "Should have files_need_analysis field"
            assert stats['files_need_analysis'] > 0, "Should analyze some files"
            
            # Check for new total_files field
            assert 'total_files' in stats, "Should have total_files field"
            assert isinstance(stats['total_files'], int), "total_files should be integer"
            
            print(f"   ✅ Files need analysis: {stats['files_need_analysis']}")
            print(f"   ✅ Total files: {stats['total_files']}")
            print(f"   ✅ Function entries: {stats.get('unique_function_entries', 0)}")
            print(f"   ✅ DMA operations: {stats.get('unique_dma_operations', 0)}")
            print(f"   ✅ User copy operations: {stats.get('unique_user_copy_operations', 0)}")
            
        finally:
            # Clean up JSON file
            if Path(temp_json_file).exists():
                Path(temp_json_file).unlink()
        
        print("\n🎉 All tests passed!")
        
    finally:
        # Clean up log file
        if Path(temp_log_file).exists():
            Path(temp_log_file).unlink()


class TestFinalValidation(unittest.TestCase):
    """Final validation test case"""
    
    def test_complete_workflow_validation(self):
        """Test complete workflow validation"""
        test_modular_parser_complete()  # Just call the function, don't return


if __name__ == '__main__':
    if len(sys.argv) > 1 and sys.argv[1] == '--direct':
        # Run the test function directly
        test_modular_parser_complete()
    else:
        # Run as unittest
        unittest.main()
