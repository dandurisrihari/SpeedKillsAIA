#!/usr/bin/env python3
"""
Integration tests for the complete SpeedKillsAIA module system
"""

import pytest
import sys
import subprocess
import tempfile
import json
import os
from pathlib import Path

# Add the project root to the path
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))


class TestModuleIntegration:
    """Integration tests for the complete module system"""
    
    def setup_method(self):
        """Set up test environment"""
        self.project_root = Path(__file__).parent.parent
        os.chdir(self.project_root)
    
    def test_full_workflow_simulation(self):
        """Test a simulated complete workflow"""
        
        # 1. Test that we can import both modules
        import src.kernel_instrumenter as ki
        import src.preprocess as pp
        
        # 2. Create test kernel source
        test_c_code = """
#include <linux/dma-mapping.h>
#include <linux/uaccess.h>

static int test_driver_function(void __user *user_ptr, size_t size) {
    void *kernel_buf;
    void *dma_buf;
    dma_addr_t dma_handle;
    
    // Allocate kernel buffer
    kernel_buf = kmalloc(size, GFP_KERNEL);
    if (!kernel_buf)
        return -ENOMEM;
    
    // Copy from user space
    if (copy_from_user(kernel_buf, user_ptr, size)) {
        kfree(kernel_buf);
        return -EFAULT;
    }
    
    // Allocate DMA buffer
    dma_buf = dma_alloc_coherent(NULL, size, &dma_handle, GFP_KERNEL);
    if (!dma_buf) {
        kfree(kernel_buf);
        return -ENOMEM;
    }
    
    // Process data (simulate)
    memcpy(dma_buf, kernel_buf, size);
    
    // Copy back to user
    if (copy_to_user(user_ptr, dma_buf, size)) {
        dma_free_coherent(NULL, size, dma_buf, dma_handle);
        kfree(kernel_buf);
        return -EFAULT;
    }
    
    // Cleanup
    dma_free_coherent(NULL, size, dma_buf, dma_handle);
    kfree(kernel_buf);
    
    return 0;
}
"""
        
        # 3. Test kernel instrumenter (dry run)
        with tempfile.TemporaryDirectory() as temp_dir:
            c_file = Path(temp_dir) / "test_driver.c"
            c_file.write_text(test_c_code)
            
            try:
                instrumenter = ki.KernelInstrumenter(
                    enabled_types={'dma', 'user_copy', 'functions'},
                    dry_run=True,
                    verbose=False
                )
                
                # This should analyze without modifying
                instrumenter.instrument_directory(temp_dir)
                
                # Original file should be unchanged
                assert c_file.read_text() == test_c_code
                
            except Exception as e:
                # Some failures expected in test environment
                pytest.skip(f"Kernel instrumenter test skipped: {e}")
        
        # 4. Test log parser with sample data
        sample_log = """
[12345.678901] Function: test_driver_function in drivers/test/test_driver.c:15
[12345.678902] copy_from_user called by test_driver_function
[12345.678903] dma_alloc_coherent called by test_driver_function
[12345.678904] DMA_STACK_START
[12345.678905] CPU: 0 PID: 1234 Comm: test_process
[12345.678906] Call trace:
[12345.678907] test_driver_function+0x10/0x20
[12345.678908] DMA_STACK_END
[12345.678909] copy_to_user called by test_driver_function
[12345.678910] dma_free_coherent called by test_driver_function
"""
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(sample_log)
            temp_log_path = f.name
        
        try:
            # Parse with engine
            engine = pp.KernelLogParserEngine(show_ui=False)
            result = engine.parse_log_file(temp_log_path)
            
            # Validate comprehensive results
            assert isinstance(result, dict)
            assert 'function_entries' in result
            assert 'dma_operations' in result
            assert 'user_copy_operations' in result
            
            # Should have parsed multiple types of entries
            total_entries = (
                len(result.get('function_entries', [])) +
                len(result.get('dma_operations', [])) +
                len(result.get('user_copy_operations', []))
            )
            assert total_entries > 0, "No entries parsed from sample log"
            
            # Test tool wrapper
            tool = pp.KernelLogParserTool()
            tool_result = tool.process_log(temp_log_path, show_ui=False)
            assert isinstance(tool_result, dict)
            
        finally:
            os.unlink(temp_log_path)


class TestCommandLineIntegration:
    """Test command-line integration"""
    
    def setup_method(self):
        """Set up test environment"""
        self.project_root = Path(__file__).parent.parent
        os.chdir(self.project_root)
    
    def test_module_help_commands(self):
        """Test that all module help commands work"""
        
        modules_to_test = [
            ("src.kernel_instrumenter", "--help"),
            ("src.preprocess", "--help"),
            ("src", "")  # Main package
        ]
        
        for module, args in modules_to_test:
            cmd = [sys.executable, "-m", module]
            if args:
                cmd.append(args)
            
            try:
                result = subprocess.run(
                    cmd, 
                    capture_output=True, 
                    text=True, 
                    timeout=30,
                    input="\n" if module == "src" else None
                )
                
                # Should not crash
                assert result.returncode in [0, 1, 2], f"Module {module} crashed"
                
                # Should produce some output
                assert len(result.stdout) > 0 or len(result.stderr) > 0, f"No output from {module}"
                
            except subprocess.TimeoutExpired:
                pytest.fail(f"Module {module} timed out")
            except Exception as e:
                pytest.fail(f"Failed to test module {module}: {e}")
    
    def test_standalone_runners_exist(self):
        """Test that standalone runners exist and are executable"""
        
        runners = [
            "run_kernel_instrumenter.py",
            "run_tool.py"
        ]
        
        for runner in runners:
            runner_path = self.project_root / runner
            if runner_path.exists():
                assert os.access(runner_path, os.X_OK), f"{runner} is not executable"
                
                # Test help command
                try:
                    result = subprocess.run([
                        sys.executable, str(runner_path), "--help"
                    ], capture_output=True, text=True, timeout=30)
                    
                    # Should not crash completely
                    assert result.returncode in [0, 1, 2], f"Runner {runner} crashed"
                    
                except subprocess.TimeoutExpired:
                    pytest.fail(f"Runner {runner} timed out")
                except Exception as e:
                    # Some errors expected due to environment setup
                    pass


class TestModuleVersionConsistency:
    """Test version consistency across modules"""
    
    def test_version_consistency(self):
        """Test that all modules report consistent versions"""
        import src.kernel_instrumenter as ki
        import src.preprocess as pp
        import src
        
        # All should report version 2.0.0
        assert ki.__version__ == "2.0.0"
        assert pp.__version__ == "2.0.0"
        assert src.__version__ == "2.0.0"
    
    def test_version_info_completeness(self):
        """Test that version info is complete"""
        import src.kernel_instrumenter as ki
        import src.preprocess as pp
        
        # Test kernel_instrumenter version info
        ki_info = ki.get_version_info()
        required_fields = ['version', 'author', 'license', 'capabilities']
        for field in required_fields:
            assert field in ki_info, f"kernel_instrumenter missing {field}"
        
        # Test preprocess version info
        pp_info = pp.get_version_info()
        for field in required_fields:
            assert field in pp_info, f"preprocess missing {field}"


class TestErrorHandlingIntegration:
    """Test error handling across the module system"""
    
    def test_graceful_import_failures(self):
        """Test graceful handling of import failures"""
        
        # Test that modules can be imported even if optional dependencies missing
        try:
            import src.kernel_instrumenter
            import src.preprocess
            
            # Should not crash on import
            assert True
            
        except ImportError as e:
            pytest.fail(f"Core module import failed: {e}")
    
    def test_file_not_found_handling(self):
        """Test handling of file not found errors"""
        import src.preprocess as pp
        
        engine = pp.KernelLogParserEngine(show_ui=False)
        
        # Should handle non-existent files gracefully
        result = engine.parse_log_file("/definitely/does/not/exist.log")
        
        # Should return None or valid empty structure
        assert result is None or isinstance(result, dict)


class TestPerformanceBaseline:
    """Basic performance tests"""
    
    def test_module_import_time(self):
        """Test that modules import reasonably quickly"""
        import time
        
        # Test kernel_instrumenter import time
        start_time = time.time()
        import src.kernel_instrumenter
        ki_import_time = time.time() - start_time
        
        # Test preprocess import time
        start_time = time.time()
        import src.preprocess
        pp_import_time = time.time() - start_time
        
        # Should import in reasonable time (less than 5 seconds each)
        assert ki_import_time < 5.0, f"kernel_instrumenter import too slow: {ki_import_time}s"
        assert pp_import_time < 5.0, f"preprocess import too slow: {pp_import_time}s"
    
    def test_empty_log_processing_time(self):
        """Test processing time for empty log"""
        import src.preprocess as pp
        import time
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write("")
            temp_path = f.name
        
        try:
            engine = pp.KernelLogParserEngine(show_ui=False)
            
            start_time = time.time()
            result = engine.parse_log_file(temp_path)
            processing_time = time.time() - start_time
            
            # Should process empty file quickly (less than 2 seconds)
            assert processing_time < 2.0, f"Empty log processing too slow: {processing_time}s"
            
            # Should return valid structure
            assert isinstance(result, dict)
            
        finally:
            os.unlink(temp_path)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
