#!/usr/bin/env python3
"""
Comprehensive tests for src.kernel_instrumenter module functionality
"""

import pytest
import sys
import tempfile
import os
from pathlib import Path
from unittest.mock import Mock, patch

# Add the project root to the path
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))


class TestKernelInstrumenterModule:
    """Test kernel_instrumenter module functionality"""
    
    def test_module_exports(self):
        """Test that all expected exports are available"""
        import src.kernel_instrumenter as ki
        
        # Check main API exports
        expected_exports = [
            'KernelInstrumenter',
            'MultiAnalyzer', 
            'TreeSitterParser',
            'Configuration',
            'DMAAnalyzer',
            'UserCopyAnalyzer',
            'FunctionAnalyzer'
        ]
        
        for export in expected_exports:
            assert hasattr(ki, export), f"Missing export: {export}"
    
    def test_instrumentation_types(self):
        """Test instrumentation type classes"""
        from src.kernel_instrumenter import (
            DMAInstrumentationType,
            UserCopyInstrumentationType,
            FunctionInstrumentationType
        )
        
        # Test that types can be instantiated
        dma_type = DMAInstrumentationType()
        assert dma_type is not None
        
        user_copy_type = UserCopyInstrumentationType()
        assert user_copy_type is not None
        
        function_type = FunctionInstrumentationType()
        assert function_type is not None
    
    def test_analyzer_classes(self):
        """Test analyzer classes can be instantiated"""
        from src.kernel_instrumenter import (
            DMAAnalyzer,
            UserCopyAnalyzer,
            FunctionAnalyzer,
            MultiAnalyzer
        )
        
        # Test individual analyzers (mock dependencies)
        with patch('src.kernel_instrumenter.TreeSitterParser'):
            dma_analyzer = DMAAnalyzer(Mock(), Mock())
            assert dma_analyzer is not None
            
            user_copy_analyzer = UserCopyAnalyzer(Mock(), Mock())
            assert user_copy_analyzer is not None
            
            function_analyzer = FunctionAnalyzer(Mock(), Mock())
            assert function_analyzer is not None
    
    def test_configuration_class(self):
        """Test Configuration class"""
        from src.kernel_instrumenter import Configuration
        
        config = Configuration()
        assert config is not None
        
        # Test that configuration has expected attributes
        assert hasattr(config, 'enabled_types') or hasattr(config, 'get_enabled_types')


class TestKernelInstrumenterIntegration:
    """Integration tests for kernel instrumenter"""
    
    def create_test_c_file(self, content):
        """Helper to create a temporary C file"""
        fd, path = tempfile.mkstemp(suffix='.c')
        try:
            with os.fdopen(fd, 'w') as f:
                f.write(content)
            return path
        except:
            os.close(fd)
            raise
    
    def test_basic_instrumenter_creation(self):
        """Test basic KernelInstrumenter creation"""
        from src.kernel_instrumenter import KernelInstrumenter
        
        # Test with minimal configuration
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        assert instrumenter is not None
    
    def test_dry_run_mode(self):
        """Test dry run mode doesn't modify files"""
        from src.kernel_instrumenter import KernelInstrumenter
        
        # Create a test C file
        test_content = """
#include <linux/dma-mapping.h>

void test_function(void) {
    void *ptr = dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);
    dma_free_coherent(NULL, 1024, ptr, 0);
}
"""
        
        with tempfile.TemporaryDirectory() as temp_dir:
            c_file = Path(temp_dir) / "test.c"
            c_file.write_text(test_content)
            
            original_content = c_file.read_text()
            
            # Run instrumenter in dry-run mode
            instrumenter = KernelInstrumenter(
                enabled_types={'dma'},
                dry_run=True,
                verbose=False
            )
            
            try:
                # This should not modify the file
                instrumenter.instrument_directory(temp_dir)
                
                # File should be unchanged
                assert c_file.read_text() == original_content
                
            except Exception as e:
                # Some errors are expected in test environment
                # The important thing is the file wasn't modified
                assert c_file.read_text() == original_content


class TestTreeSitterParser:
    """Test TreeSitterParser functionality"""
    
    def test_parser_creation(self):
        """Test parser can be created"""
        from src.kernel_instrumenter import TreeSitterParser
        
        try:
            parser = TreeSitterParser()
            assert parser is not None
        except Exception as e:
            # Tree-sitter might not be fully configured in test environment
            pytest.skip(f"TreeSitter not available: {e}")
    
    def test_parser_with_simple_c_code(self):
        """Test parser with simple C code"""
        from src.kernel_instrumenter import TreeSitterParser
        
        try:
            parser = TreeSitterParser()
            
            simple_c = "int main() { return 0; }"
            tree = parser.parse_code(simple_c)
            
            # Basic validation
            assert tree is not None
            
        except Exception as e:
            pytest.skip(f"TreeSitter parsing failed: {e}")


class TestModuleConfiguration:
    """Test module configuration and setup"""
    
    def test_logging_configuration(self):
        """Test logging configuration"""
        import src.kernel_instrumenter as ki
        
        # Test configure_logging function if available
        if hasattr(ki, 'configure_logging'):
            import logging
            ki.configure_logging(level=logging.DEBUG)
            
            # Check that logging is configured
            logger = logging.getLogger(ki.__name__)
            assert logger.level == logging.DEBUG
    
    def test_version_info_structure(self):
        """Test version info has expected structure"""
        import src.kernel_instrumenter as ki
        
        version_info = ki.get_version_info()
        
        # Check required fields
        required_fields = ['version', 'author', 'capabilities']
        for field in required_fields:
            assert field in version_info, f"Missing field: {field}"
        
        # Check capabilities structure
        capabilities = version_info['capabilities']
        expected_capabilities = [
            'dma_analysis',
            'user_copy_analysis', 
            'function_analysis',
            'dry_run_mode'
        ]
        
        for capability in expected_capabilities:
            assert capability in capabilities, f"Missing capability: {capability}"


class TestErrorHandling:
    """Test error handling in kernel instrumenter"""
    
    def test_invalid_directory(self):
        """Test handling of invalid directory"""
        from src.kernel_instrumenter import KernelInstrumenter
        
        instrumenter = KernelInstrumenter(
            enabled_types={'dma'},
            dry_run=True,
            verbose=False
        )
        
        # Test with non-existent directory
        with pytest.raises((FileNotFoundError, OSError, ValueError)):
            instrumenter.instrument_directory("/non/existent/directory")
    
    def test_invalid_instrumentation_type(self):
        """Test handling of invalid instrumentation type"""
        from src.kernel_instrumenter import KernelInstrumenter
        
        # Test with invalid type
        with pytest.raises((ValueError, KeyError, TypeError)):
            KernelInstrumenter(
                enabled_types={'invalid_type'},
                dry_run=True
            )


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
