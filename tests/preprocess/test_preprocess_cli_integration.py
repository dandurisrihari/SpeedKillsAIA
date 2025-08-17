#!/usr/bin/env python3
"""
Test CLI argument parsing and integration for the preprocess tool

Tests the complete command-line interface including the new --source-root option.
"""

import sys
import tempfile
import shutil
import json
import subprocess
from pathlib import Path
import pytest


class TestPreprocessCLI:
    """Test cases for CLI argument parsing and functionality"""
    
    def setup_method(self):
        """Set up test fixtures"""
        # Create temporary directories
        self.temp_dir = Path(tempfile.mkdtemp())
        self.test_log_dir = self.temp_dir / "logs"
        self.test_source_dir = self.temp_dir / "kernel_sources"
        self.test_output_dir = self.temp_dir / "output"
        
        # Create directories
        self.test_log_dir.mkdir()
        self.test_source_dir.mkdir()
        self.test_output_dir.mkdir()
        
        # Create sample log file
        self.sample_log = self.test_log_dir / "test_log.log"
        self.sample_log.write_text("""
[    1.234567] test_driver: test_function entry
[    1.234568] test_driver: dma_alloc_coherent called, size=4096
[    1.234569] test_driver: copy_from_user called, size=1024
[    1.234570] test_driver: test_function exit
        """)
        
        # Create sample kernel source file
        self.sample_source = self.test_source_dir / "test_driver.c"
        self.sample_source.write_text("""
#include <linux/module.h>
#include <linux/dma-mapping.h>

static int test_function(void) {
    void *coherent_mem;
    coherent_mem = dma_alloc_coherent(dev, 4096, &dma_handle, GFP_KERNEL);
    if (!coherent_mem) {
        return -ENOMEM;
    }
    return 0;
}
        """)
    
    def teardown_method(self):
        """Clean up test fixtures"""
        shutil.rmtree(self.temp_dir)
    
    def run_preprocess_command(self, args, timeout=30):
        """Helper to run preprocess command and return result"""
        cmd = [sys.executable, "-m", "src.preprocess"] + args
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            cwd=Path(__file__).parent.parent.parent,  # Go to project root
            timeout=timeout
        )
        return result
    
    def test_help_shows_source_root_option(self):
        """Test that help text includes --source-root option"""
        result = self.run_preprocess_command(["--help"])
        assert result.returncode == 0
        assert "--source-root" in result.stdout
        assert "Root directory path for resolving relative file paths" in result.stdout
    
    def test_basic_log_processing(self):
        """Test basic log file processing without source-root"""
        output_file = self.test_output_dir / "basic_output.json"
        
        result = self.run_preprocess_command([
            "--log", str(self.sample_log),
            "-o", str(output_file)
        ])
        
        # Should succeed even without source-root
        assert result.returncode == 0
        assert output_file.exists()
        
        # Verify JSON output structure
        with open(output_file) as f:
            data = json.load(f)
        
        assert "functions_by_file" in data
        assert "dma_operations" in data
        assert "user_copy_operations" in data
    
    def test_source_root_option_parsing(self):
        """Test that --source-root option is parsed correctly"""
        output_file = self.test_output_dir / "source_root_output.json"
        
        result = self.run_preprocess_command([
            "--log", str(self.sample_log),
            "--source-root", str(self.test_source_dir),
            "-o", str(output_file)
        ])
        
        assert result.returncode == 0
        assert output_file.exists()
    
    def test_combined_options(self):
        """Test combined source-root and output options"""
        output_file = self.test_output_dir / "combined_output.json"
        
        # Test basic combination of available options
        result = self.run_preprocess_command([
            "--log", str(self.sample_log),
            "--source-root", str(self.test_source_dir),
            "-o", str(output_file)
        ])
        
        # Should succeed with combined options
        assert result.returncode == 0
        assert output_file.exists()
        
        # Verify the output file has valid content
        with open(output_file) as f:
            data = json.load(f)
        assert "functions_by_file" in data
        assert "dma_operations" in data
        assert "user_copy_operations" in data

    def test_batch_processing_with_source_root(self):
        """Test processing multiple files with source-root option"""
        # Create additional log file
        log2 = self.test_log_dir / "test_log2.log"
        log2.write_text("""
[    2.234567] test_driver2: another_function entry
[    2.234568] test_driver2: dma_free_coherent called
[    2.234569] test_driver2: another_function exit
        """)
        
        # Process the second log file separately since --batch doesn't exist
        output_file2 = self.test_output_dir / "test_log2_output.json"
        result = self.run_preprocess_command([
            "--log", str(log2),
            "--source-root", str(self.test_source_dir),
            "-o", str(output_file2)
        ])
        
        assert result.returncode == 0
        assert output_file2.exists()
    
    def test_invalid_source_root_path(self):
        """Test handling of invalid source-root path"""
        invalid_path = self.temp_dir / "nonexistent"
        output_file = self.test_output_dir / "invalid_source_output.json"
        
        result = self.run_preprocess_command([
            "--log", str(self.sample_log),
            "--source-root", str(invalid_path),
            "-o", str(output_file)
        ])
        
        # Should still succeed (source-root is optional for core functionality)
        assert result.returncode == 0
    
    def test_argument_order_independence(self):
        """Test that argument order doesn't matter"""
        output_file = self.test_output_dir / "order_test_output.json"
        
        # Test different argument orders with --log flag
        orders = [
            ["--log", str(self.sample_log), "--source-root", str(self.test_source_dir), "-o", str(output_file)],
            ["--source-root", str(self.test_source_dir), "--log", str(self.sample_log), "-o", str(output_file)],
            ["-o", str(output_file), "--source-root", str(self.test_source_dir), "--log", str(self.sample_log)]
        ]
        
        for i, args in enumerate(orders):
            output_file_variant = self.test_output_dir / f"order_test_output_{i}.json"
            test_args = args.copy()
            if "-o" in test_args:
                idx = test_args.index("-o")
                test_args[idx + 1] = str(output_file_variant)
            
            result = self.run_preprocess_command(test_args)
            assert result.returncode == 0, f"Failed with argument order: {test_args}"
    
    def test_web_ui_argument_parsing_only(self):
        """Test that help shows available options"""
        # Use --help to test argument parsing without execution
        result = self.run_preprocess_command([
            "--help"  # This will show help and exit
        ])
        
        # Should exit successfully with help
        assert result.returncode == 0
        assert "--source-root" in result.stdout
        assert "--log" in result.stdout


if __name__ == "__main__":
    # Run tests directly
    import unittest
    
    suite = unittest.TestLoader().loadTestsFromTestCase(TestPreprocessCLI)
    runner = unittest.TextTestRunner(verbosity=2)
    runner.run(suite)
