#!/usr/bin/env python3
"""
Test module imports and basic functionality for src.kernel_instrumenter and src.preprocess
"""

import pytest
import sys
import subprocess
import os
from pathlib import Path

# Add the project root to the path
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))


class TestModuleImports:
    """Test that modules can be imported correctly"""
    
    def test_kernel_instrumenter_import(self):
        """Test that kernel_instrumenter module imports correctly"""
        try:
            import src.kernel_instrumenter
            assert hasattr(src.kernel_instrumenter, '__version__')
            assert hasattr(src.kernel_instrumenter, 'KernelInstrumenter')
        except ImportError as e:
            pytest.fail(f"Failed to import src.kernel_instrumenter: {e}")
    
    def test_preprocess_import(self):
        """Test that preprocess module imports correctly"""
        try:
            import src.preprocess
            assert hasattr(src.preprocess, '__version__')
            assert hasattr(src.preprocess, 'KernelLogParserEngine')
            assert hasattr(src.preprocess, 'KernelLogParserTool')
        except ImportError as e:
            pytest.fail(f"Failed to import src.preprocess: {e}")
    
    def test_src_package_import(self):
        """Test that src package imports correctly"""
        try:
            import src
            assert hasattr(src, '__version__')
            assert hasattr(src, 'main')
        except ImportError as e:
            pytest.fail(f"Failed to import src package: {e}")


class TestModuleVersions:
    """Test module version information"""
    
    def test_kernel_instrumenter_version_info(self):
        """Test kernel_instrumenter version information"""
        import src.kernel_instrumenter as ki
        assert ki.__version__ == "2.0.0"
        assert ki.__author__ is not None
        
        # Test get_version_info function
        version_info = ki.get_version_info()
        assert isinstance(version_info, dict)
        assert 'version' in version_info
        assert 'capabilities' in version_info
    
    def test_preprocess_version_info(self):
        """Test preprocess version information"""
        import src.preprocess as pp
        assert pp.__version__ == "2.0.0"
        assert pp.__author__ is not None
        
        # Test get_version_info function
        version_info = pp.get_version_info()
        assert isinstance(version_info, dict)
        assert 'version' in version_info
        assert 'capabilities' in version_info


class TestModuleAPI:
    """Test module API functionality"""
    
    def test_kernel_instrumenter_main_classes(self):
        """Test main classes are available"""
        from src.kernel_instrumenter import (
            KernelInstrumenter,
            MultiAnalyzer,
            TreeSitterParser,
            Configuration
        )
        
        # Test that classes can be instantiated (basic smoke test)
        assert KernelInstrumenter is not None
        assert MultiAnalyzer is not None
        assert TreeSitterParser is not None
        assert Configuration is not None
    
    def test_preprocess_main_classes(self):
        """Test main classes are available"""
        from src.preprocess import (
            KernelLogParserEngine,
            KernelLogParserTool,
            parse_kernel_log
        )
        
        # Test that classes can be instantiated
        tool = KernelLogParserTool()
        assert tool is not None
        
        # Test convenience function exists
        assert callable(parse_kernel_log)
    
    def test_preprocess_convenience_function(self):
        """Test preprocess convenience function"""
        from src.preprocess import parse_kernel_log
        
        # Test function signature
        import inspect
        sig = inspect.signature(parse_kernel_log)
        assert 'log_file_path' in sig.parameters
        assert 'show_ui' in sig.parameters


class TestModuleAsScript:
    """Test running modules as scripts with python -m"""
    
    def setup_method(self):
        """Set up test environment"""
        self.project_root = Path(__file__).parent.parent
        # Ensure we're in the right directory
        os.chdir(self.project_root)
    
    def test_kernel_instrumenter_help(self):
        """Test running kernel_instrumenter module with --help"""
        result = subprocess.run([
            sys.executable, "-m", "src.kernel_instrumenter", "--help"
        ], capture_output=True, text=True, cwd=self.project_root)
        
        # Should exit with 0 and show help
        assert result.returncode == 0
        assert "kernel instrumentation tool" in result.stdout.lower()
        assert "--directory" in result.stdout
    
    def test_preprocess_help(self):
        """Test running preprocess module with --help"""
        result = subprocess.run([
            sys.executable, "-m", "src.preprocess", "--help"
        ], capture_output=True, text=True, cwd=self.project_root)
        
        # Should exit with 0 and show help
        assert result.returncode == 0
        assert "kernel log parser" in result.stdout.lower()
        assert "--interactive" in result.stdout
    
    def test_src_package_main(self):
        """Test running src package main"""
        result = subprocess.run([
            sys.executable, "-m", "src"
        ], capture_output=True, text=True, cwd=self.project_root, 
        input="\n")  # Send newline to exit
        
        # Should show the menu
        assert "SpeedKillsAIA Research Tools" in result.stdout
        assert "Kernel Instrumenter" in result.stdout
        assert "Log Preprocessor" in result.stdout


class TestStandaloneRunners:
    """Test standalone runner scripts"""
    
    def setup_method(self):
        """Set up test environment"""
        self.project_root = Path(__file__).parent.parent
        os.chdir(self.project_root)
    
    def test_run_kernel_instrumenter_help(self):
        """Test standalone kernel instrumenter runner"""
        runner_path = self.project_root / "run_kernel_instrumenter.py"
        if not runner_path.exists():
            pytest.skip("run_kernel_instrumenter.py not found")
        
        result = subprocess.run([
            sys.executable, str(runner_path), "--help"
        ], capture_output=True, text=True, cwd=self.project_root)
        
        # Should show help (may have setup output first)
        assert "--directory" in result.stdout
    
    def test_run_tool_help(self):
        """Test standalone preprocess tool runner"""
        runner_path = self.project_root / "run_tool.py"
        if not runner_path.exists():
            pytest.skip("run_tool.py not found")
        
        result = subprocess.run([
            sys.executable, str(runner_path), "--help"
        ], capture_output=True, text=True, cwd=self.project_root)
        
        # Should show help (may have setup output first)
        assert "--interactive" in result.stdout


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
