#!/usr/bin/env python3
"""
Test struct_definitions removal in preprocess module
"""

import json
import tempfile
import unittest
from pathlib import Path

from src.preprocess.core.engine import KernelLogParserEngine
from src.preprocess.core.models import ParseResults, ParseMetadata, ParseStatistics


class TestPreprocessStructDefinitionsRemoval(unittest.TestCase):
    """Test struct_definitions removal in preprocess module specifically"""
    
    def setUp(self):
        """Set up test fixtures"""
        self.temp_path = Path(tempfile.mkdtemp())
        
        # Create comprehensive test log
        self.test_log_content = """[    0.000000] Booting Linux on physical CPU 0x0
[    1.123456] FUNC_ENTRY: Entering function init_module at driver.c:50
[    2.234567] DMA_INSTRUMENT: About to call dma_alloc_coherent from function device_probe at device.c:150
[    3.345678] USER_COPY: About to call copy_from_user from function device_write at device.c:200
[    4.456789] IOCTL_HANDLER: Function device_ioctl called at device.c:300
[    5.567890] DMA_INSTRUMENT: About to call dma_free_coherent from function device_remove at device.c:350
"""
        
        self.test_log = self.temp_path / "comprehensive_test.log"
        self.test_log.write_text(self.test_log_content)
        
        # Create a fake source directory structure to test with source root
        self.source_dir = self.temp_path / "source"
        self.source_dir.mkdir()
        
        # Create some fake C files
        (self.source_dir / "driver.c").write_text("""
int init_module(void) {
    return 0;
}
""")
        
        (self.source_dir / "device.c").write_text("""
static int device_probe(void) {
    void *mem = dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);
    return 0;
}

static ssize_t device_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos) {
    if (copy_from_user(kernel_buf, buf, count))
        return -EFAULT;
    return count;
}

static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    return 0;
}

static int device_remove(void) {
    dma_free_coherent(NULL, 1024, mem, handle);
    return 0;
}
""")
    
    def tearDown(self):
        """Clean up test fixtures"""
        import shutil
        shutil.rmtree(self.temp_path)
    
    def test_parseresults_model_no_struct_definitions(self):
        """Test that ParseResults model doesn't include struct_definitions field"""
        metadata = ParseMetadata(
            parser_version="2.0.0",
            parsed_at="2025-08-16T12:00:00.000000",
            log_file="test.log",
            total_lines=10,
            parsed_lines=5,
            unique_entries=3
        )
        
        statistics = ParseStatistics(
            unique_function_entries=1,
            unique_dma_operations=2,
            unique_user_copy_operations=1,
            unique_ioctl_operations=1
        )
        
        # Create ParseResults object
        results = ParseResults(
            metadata=metadata,
            functions_by_file={},
            dma_operations=[],
            user_copy_operations=[],
            ioctl_operations=[],
            statistics=statistics
        )
        
        # Convert to dict and verify structure
        result_dict = results.to_dict()
        
        # struct_definitions should not be present
        self.assertNotIn('struct_definitions', result_dict.keys())
        
        # But other expected fields should be present
        expected_keys = [
            'metadata', 'functions_by_file', 'dma_operations', 
            'user_copy_operations', 'ioctl_operations', 'statistics',
            'memory_info', 'device_info'
        ]
        
        for key in expected_keys:
            self.assertIn(key, result_dict.keys())
    
    def test_engine_parsing_no_struct_definitions(self):
        """Test that engine parsing doesn't include struct_definitions"""
        engine = KernelLogParserEngine(show_ui=False)
        results = engine.parse_log_file(str(self.test_log))
        
        # Should return dict directly
        self.assertIsInstance(results, dict)
        
        # Should not have struct_definitions
        self.assertNotIn('struct_definitions', results.keys())
        
        # Should have parsed some operations
        self.assertGreater(len(results['dma_operations']), 0)
        self.assertGreater(len(results['user_copy_operations']), 0)
        self.assertGreater(len(results['ioctl_operations']), 0)
        self.assertGreater(len(results['functions_by_file']), 0)
    
    def test_engine_with_source_root_no_struct_definitions(self):
        """Test that even with source_root_path, struct_definitions is not included"""
        engine = KernelLogParserEngine(
            source_root_path=str(self.source_dir),
            show_ui=False
        )
        results = engine.parse_log_file(str(self.test_log))
        
        # Should not have struct_definitions even with source root
        self.assertNotIn('struct_definitions', results.keys())
        
        # Verify that operations and functions are still parsed
        self.assertGreater(len(results['dma_operations']), 0)
        self.assertGreater(len(results['user_copy_operations']), 0)
        self.assertGreater(len(results['ioctl_operations']), 0)
    
    def test_json_serialization_no_struct_definitions(self):
        """Test that JSON serialization doesn't include struct_definitions"""
        engine = KernelLogParserEngine(show_ui=False)
        output_file = self.temp_path / "test_output.json"
        
        results = engine.parse_log_file(str(self.test_log), str(output_file))
        
        # Read the JSON file
        with open(output_file, 'r') as f:
            json_data = json.load(f)
        
        # Verify structure
        self.assertNotIn('struct_definitions', json_data.keys())
        
        # Verify data integrity
        self.assertIn('metadata', json_data)
        self.assertIn('statistics', json_data)
        self.assertGreater(json_data['statistics']['unique_dma_operations'], 0)
        self.assertGreater(json_data['statistics']['unique_user_copy_operations'], 0)
        self.assertGreater(json_data['statistics']['unique_ioctl_operations'], 0)
    
    def test_operations_still_have_required_fields(self):
        """Test that operations still have all required fields after struct_definitions removal"""
        engine = KernelLogParserEngine(show_ui=False)
        results = engine.parse_log_file(str(self.test_log))
        
        # Check DMA operations
        for dma_op in results['dma_operations']:
            required_fields = [
                'dma_function', 'caller_function', 'file_path', 'line_number',
                'first_seen_timestamp', 'first_seen_time_str', 'stack_trace',
                'function_code', 'preprocessed_code', 'preprocessed_file_code', 'call_count'
            ]
            for field in required_fields:
                self.assertIn(field, dma_op.keys(), f"DMA operation missing field: {field}")
        
        # Check User Copy operations
        for copy_op in results['user_copy_operations']:
            required_fields = [
                'copy_function', 'caller_function', 'file_path', 'line_number',
                'first_seen_timestamp', 'first_seen_time_str', 'function_code',
                'preprocessed_code', 'preprocessed_file_code', 'call_count'
            ]
            for field in required_fields:
                self.assertIn(field, copy_op.keys(), f"User copy operation missing field: {field}")
        
        # Check IOCTL operations
        for ioctl_op in results['ioctl_operations']:
            required_fields = [
                'function_name', 'file_path', 'line_number', 'first_seen_timestamp',
                'first_seen_time_str', 'function_code', 'preprocessed_code',
                'preprocessed_file_code', 'call_count'
            ]
            for field in required_fields:
                self.assertIn(field, ioctl_op.keys(), f"IOCTL operation missing field: {field}")
    
    def test_backwards_compatibility_without_struct_definitions(self):
        """Test that removing struct_definitions doesn't break existing functionality"""
        engine = KernelLogParserEngine(show_ui=False)
        results = engine.parse_log_file(str(self.test_log))
        
        # All core functionality should still work
        self.assertIsInstance(results, dict)
        
        # Statistics should be calculated correctly
        stats = results['statistics']
        self.assertGreater(stats['unique_function_entries'], 0)
        self.assertGreater(stats['unique_dma_operations'], 0)
        self.assertGreater(stats['unique_user_copy_operations'], 0)
        self.assertGreater(stats['unique_ioctl_operations'], 0)
        
        # Metadata should be present
        metadata = results['metadata']
        self.assertEqual(metadata['parser_version'], "2.0.0")
        self.assertGreater(metadata['total_lines'], 0)
        self.assertGreater(metadata['parsed_lines'], 0)


if __name__ == '__main__':
    unittest.main()
