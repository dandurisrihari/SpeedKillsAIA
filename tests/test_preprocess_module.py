#!/usr/bin/env python3
"""
Comprehensive tests for src.preprocess module functionality
"""

import pytest
import sys
import tempfile
import json
from pathlib import Path
from unittest.mock import Mock, patch

# Add the project root to the path
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))


class TestPreprocessModule:
    """Test preprocess module functionality"""
    
    def test_module_exports(self):
        """Test that all expected exports are available"""
        import src.preprocess as pp
        
        # Check main API exports
        expected_exports = [
            'KernelLogParserEngine',
            'KernelLogParserTool',
            'parse_kernel_log'
        ]
        
        for export in expected_exports:
            assert hasattr(pp, export), f"Missing export: {export}"
    
    def test_convenience_function(self):
        """Test convenience function"""
        from src.preprocess import parse_kernel_log
        
        assert callable(parse_kernel_log)
        
        # Test function with invalid file (should handle gracefully)
        try:
            result = parse_kernel_log("/non/existent/file.log", show_ui=False)
            # Should either return None or raise an exception
            assert result is None or isinstance(result, dict)
        except (FileNotFoundError, OSError):
            # Expected behavior
            pass
    
    def test_tool_creation(self):
        """Test KernelLogParserTool creation"""
        from src.preprocess import KernelLogParserTool
        
        tool = KernelLogParserTool()
        assert tool is not None
        assert hasattr(tool, 'process_log')
        assert hasattr(tool, 'start_web_ui')
        assert hasattr(tool, 'interactive_mode')
    
    def test_engine_creation(self):
        """Test KernelLogParserEngine creation"""
        from src.preprocess import KernelLogParserEngine
        
        engine = KernelLogParserEngine(show_ui=False)
        assert engine is not None
        assert hasattr(engine, 'parse_log_file')


class TestLogParsing:
    """Test log parsing functionality"""
    
    def create_test_log(self, content):
        """Helper to create a temporary log file"""
        fd, path = tempfile.mkstemp(suffix='.log')
        try:
            with open(path, 'w') as f:
                f.write(content)
            return path
        finally:
            import os
            os.close(fd)
    
    def test_parse_empty_log(self):
        """Test parsing empty log file"""
        from src.preprocess import KernelLogParserEngine
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write("")
            temp_path = f.name
        
        try:
            engine = KernelLogParserEngine(show_ui=False)
            result = engine.parse_log_file(temp_path)
            
            # Should return valid structure even for empty file
            assert isinstance(result, dict)
            assert 'function_entries' in result
            assert 'dma_operations' in result
            assert 'user_copy_operations' in result
            
        finally:
            import os
            os.unlink(temp_path)
    
    def test_parse_sample_log_content(self):
        """Test parsing sample log content"""
        from src.preprocess import KernelLogParserEngine
        
        # Sample log content with various entries
        sample_log = """
[12345.678901] Function: test_function in drivers/test/test.c:123
[12345.678902] copy_from_user called by test_driver
[12345.678903] dma_alloc_coherent called by test_dma_function
[12345.678904] DMA_STACK_START
[12345.678905] CPU: 0 PID: 1234 Comm: test_process
[12345.678906] Call trace:
[12345.678907] test_function+0x10/0x20
[12345.678908] DMA_STACK_END
"""
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(sample_log)
            temp_path = f.name
        
        try:
            engine = KernelLogParserEngine(show_ui=False)
            result = engine.parse_log_file(temp_path)
            
            # Validate results
            assert isinstance(result, dict)
            
            # Should have parsed some entries
            total_entries = (
                len(result.get('function_entries', [])) +
                len(result.get('dma_operations', [])) +
                len(result.get('user_copy_operations', []))
            )
            assert total_entries > 0, "No entries were parsed"
            
        finally:
            import os
            os.unlink(temp_path)
    
    def test_tool_process_log(self):
        """Test KernelLogParserTool.process_log"""
        from src.preprocess import KernelLogParserTool
        
        # Create sample log
        sample_log = """
[12345.678901] Function: test_function in drivers/test/test.c:123
[12345.678902] copy_from_user called by test_driver
"""
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(sample_log)
            temp_path = f.name
        
        try:
            tool = KernelLogParserTool()
            result = tool.process_log(temp_path, show_ui=False)
            
            assert isinstance(result, dict)
            assert 'function_entries' in result
            
        finally:
            import os
            os.unlink(temp_path)


class TestStackTraceCapture:
    """Test stack trace capture functionality"""
    
    def test_dma_stack_trace_parsing(self):
        """Test DMA stack trace parsing"""
        from src.preprocess import KernelLogParserEngine
        
        # Log with DMA stack trace
        dma_log = """
[12345.678901] dma_sync_sg_for_cpu called by import_page_map
[12345.678902] DMA_STACK_START
[12345.678903] CPU: 0 PID: 3448 Comm: label_image Tainted: G         C         6.6.23-gb586a521770e-dirty #112
[12345.678904] Hardware name: NXP i.MX8MPlus EVK board (DT)
[12345.678905] Call trace:
[12345.678906] dump_backtrace+0x90/0xe8
[12345.678907] show_stack+0x18/0x24
[12345.678908] DMA_STACK_END
"""
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(dma_log)
            temp_path = f.name
        
        try:
            engine = KernelLogParserEngine(show_ui=False)
            result = engine.parse_log_file(temp_path)
            
            # Should have DMA operations with stack traces
            dma_ops = result.get('dma_operations', [])
            assert len(dma_ops) > 0, "No DMA operations found"
            
            # Check if stack trace is captured
            first_dma = dma_ops[0]
            if 'stack_trace' in first_dma:
                stack_trace = first_dma['stack_trace']
                assert len(stack_trace) > 0, "Stack trace is empty"
                assert any('CPU:' in line for line in stack_trace), "No CPU info in stack trace"
            
        finally:
            import os
            os.unlink(temp_path)


class TestWebUIFunctionality:
    """Test web UI related functionality"""
    
    def test_tool_has_web_ui_methods(self):
        """Test that tool has web UI methods"""
        from src.preprocess import KernelLogParserTool
        
        tool = KernelLogParserTool()
        assert hasattr(tool, 'start_web_ui')
        assert callable(tool.start_web_ui)
    
    @patch('src.preprocess.tool.WEB_UI_AVAILABLE', True)
    def test_web_ui_method_signature(self):
        """Test web UI method signature"""
        from src.preprocess import KernelLogParserTool
        import inspect
        
        tool = KernelLogParserTool()
        sig = inspect.signature(tool.start_web_ui)
        
        # Check expected parameters
        expected_params = ['results_file', 'port', 'host', 'auto_open']
        for param in expected_params:
            assert param in sig.parameters, f"Missing parameter: {param}"
    
    def test_interactive_mode_exists(self):
        """Test interactive mode method exists"""
        from src.preprocess import KernelLogParserTool
        
        tool = KernelLogParserTool()
        assert hasattr(tool, 'interactive_mode')
        assert callable(tool.interactive_mode)


class TestBatchProcessing:
    """Test batch processing functionality"""
    
    def test_batch_processing_method(self):
        """Test batch processing method"""
        from src.preprocess import KernelLogParserTool
        
        tool = KernelLogParserTool()
        assert hasattr(tool, 'process_batch')
        assert callable(tool.process_batch)
    
    def test_batch_with_empty_list(self):
        """Test batch processing with empty file list"""
        from src.preprocess import KernelLogParserTool
        
        tool = KernelLogParserTool()
        result = tool.process_batch([], show_ui=False)
        
        assert isinstance(result, list)
        assert len(result) == 0


class TestModuleConfiguration:
    """Test module configuration and setup"""
    
    def test_version_info_structure(self):
        """Test version info has expected structure"""
        import src.preprocess as pp
        
        version_info = pp.get_version_info()
        
        # Check required fields
        required_fields = ['version', 'author', 'capabilities']
        for field in required_fields:
            assert field in version_info, f"Missing field: {field}"
        
        # Check capabilities structure
        capabilities = version_info['capabilities']
        expected_capabilities = [
            'function_parsing',
            'dma_operation_parsing',
            'user_copy_parsing',
            'stack_trace_capture',
            'web_ui',
            'batch_processing'
        ]
        
        for capability in expected_capabilities:
            assert capability in capabilities, f"Missing capability: {capability}"
    
    def test_module_metadata(self):
        """Test module metadata"""
        import src.preprocess as pp
        
        assert pp.__version__ == "2.0.0"
        assert pp.__author__ is not None
        assert pp.__license__ == "MIT"


class TestErrorHandling:
    """Test error handling in preprocess module"""
    
    def test_invalid_log_file(self):
        """Test handling of invalid log file"""
        from src.preprocess import KernelLogParserEngine
        
        engine = KernelLogParserEngine(show_ui=False)
        
        # Test with non-existent file
        result = engine.parse_log_file("/non/existent/file.log")
        # Should handle gracefully (return None or raise expected exception)
        assert result is None or isinstance(result, dict)
    
    def test_tool_with_invalid_file(self):
        """Test tool with invalid file"""
        from src.preprocess import KernelLogParserTool
        
        tool = KernelLogParserTool()
        result = tool.process_log("/non/existent/file.log", show_ui=False)
        
        # Should handle gracefully
        assert result is None or isinstance(result, dict)


class TestJSONOutput:
    """Test JSON output functionality"""
    
    def test_json_output_structure(self):
        """Test JSON output has correct structure"""
        from src.preprocess import KernelLogParserEngine
        
        # Create simple test log
        test_log = "[12345.678901] Function: test_function in drivers/test/test.c:123\n"
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(test_log)
            temp_path = f.name
        
        try:
            engine = KernelLogParserEngine(show_ui=False)
            result = engine.parse_log_file(temp_path)
            
            # Test JSON serialization
            json_str = json.dumps(result)
            assert isinstance(json_str, str)
            
            # Test deserialization
            parsed_back = json.loads(json_str)
            assert isinstance(parsed_back, dict)
            
        finally:
            import os
            os.unlink(temp_path)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
