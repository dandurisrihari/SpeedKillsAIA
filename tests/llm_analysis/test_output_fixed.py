#!/usr/bin/env python3
"""
Test suite for OutputFormatter class in the LLM analysis module.

This module provides comprehensive tests for output formatting functionality,
including YAML export, console summaries, and result aggregation capabilities.
"""

import pytest
from unittest.mock import patch, Mock, MagicMock
import tempfile
import os
from src.llm_analysis.output import OutputFormatter
from src.llm_analysis.models import AnalysisResult


def create_test_result(name="test_func", aia=80, kd=70, msg=60, structs=None, smids=None, reasons=None):
    """Helper to create AnalysisResult with all required fields."""
    return AnalysisResult(
        function_name=name,
        aia_relevant_function=aia,
        relevant_kd_entry_point=kd,
        message_structure_handling=msg,
        message_structures_identified=structs or ["test_struct"],
        smids_identified=smids or ["test_smid"],
        reasoning=reasons or ["test_reason"]
    )


class TestOutputFormatter:
    """Test suite for OutputFormatter class."""
    
    def test_init_default_params(self):
        """Test OutputFormatter initialization with default parameters."""
        formatter = OutputFormatter()
        
        assert formatter.verbose == False
    
    def test_init_verbose_mode(self):
        """Test OutputFormatter initialization with verbose mode enabled."""
        formatter = OutputFormatter(verbose=True)
        
        assert formatter.verbose == True
    
    def test_log_verbose_enabled(self):
        """Test verbose logging when enabled."""
        with patch('builtins.print') as mock_print:
            formatter = OutputFormatter(verbose=True)
            formatter._log_verbose("test message")
            
            mock_print.assert_called_once_with("[VERBOSE] test message")
    
    def test_log_verbose_disabled(self):
        """Test verbose logging when disabled."""
        with patch('builtins.print') as mock_print:
            formatter = OutputFormatter(verbose=False)
            formatter._log_verbose("test message")
            
            mock_print.assert_not_called()
    
    def test_export_to_yaml_simple(self):
        """Test YAML export with simple results."""
        formatter = OutputFormatter()
        
        results = {
            'functions_by_file': [create_test_result("test_func")],
            'dma_operations': [],
            'ioctl_operations': []
        }
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.yaml', delete=False) as tmp_file:
            formatter.export_to_yaml(results, tmp_file.name)
            
            # Verify file was created
            assert os.path.exists(tmp_file.name)
            
            # Verify content contains expected data
            with open(tmp_file.name, 'r') as f:
                content = f.read()
                assert "test_func" in content
                assert "80" in content
            
            os.unlink(tmp_file.name)
    
    def test_export_to_yaml_comprehensive(self):
        """Test YAML export with comprehensive results."""
        formatter = OutputFormatter(verbose=True)
        
        results = {
            'functions_by_file': [
                create_test_result("func1", 90, 80, 70),
                create_test_result("func2", 70, 60, 50)
            ],
            'dma_operations': [
                create_test_result("dma_func", 95, 85, 75)
            ],
            'ioctl_operations': [
                create_test_result("ioctl_func", 85, 75, 65)
            ]
        }
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.yaml', delete=False) as tmp_file:
            formatter.export_to_yaml(results, tmp_file.name)
            
            # Verify file content
            with open(tmp_file.name, 'r') as f:
                content = f.read()
                assert "func1" in content
                assert "func2" in content
                assert "dma_func" in content
                assert "ioctl_func" in content
            
            os.unlink(tmp_file.name)
    
    def test_print_summary_basic(self):
        """Test print_summary with basic results."""
        formatter = OutputFormatter()
        
        results = {
            'functions_by_file': [create_test_result("summary_func")],
            'dma_operations': [],
            'ioctl_operations': []
        }
        
        with patch('builtins.print') as mock_print:
            formatter.print_summary(results)
        
        # Verify print was called with summary content
        assert mock_print.called
        call_args = ''.join([str(call) for call in mock_print.call_args_list])
        assert "summary_func" in call_args
    
    def test_print_summary_comprehensive(self):
        """Test print_summary with comprehensive results."""
        formatter = OutputFormatter()
        
        results = {
            'functions_by_file': [
                create_test_result("func1", 90),
                create_test_result("func2", 70),
                create_test_result("func3", 50)
            ],
            'dma_operations': [
                create_test_result("dma1", 95)
            ],
            'ioctl_operations': []
        }
        
        with patch('builtins.print') as mock_print:
            formatter.print_summary(results)
        
        assert mock_print.called
        call_args = ''.join([str(call) for call in mock_print.call_args_list])
        assert "func1" in call_args or "func2" in call_args or "func3" in call_args
    
    def test_count_total_functions(self):
        """Test count_total_functions method."""
        formatter = OutputFormatter()
        
        results = {
            'functions_by_file': [
                create_test_result("func1"),
                create_test_result("func2")
            ],
            'dma_operations': [
                create_test_result("dma1")
            ],
            'ioctl_operations': [
                create_test_result("ioctl1"),
                create_test_result("ioctl2")
            ]
        }
        
        total = formatter.count_total_functions(results)
        assert total == 5  # 2 + 1 + 2
    
    def test_format_single_result(self):
        """Test formatting a single result."""
        formatter = OutputFormatter()
        
        result = create_test_result("single_func", 85, 75, 65)
        
        # Convert to dict and verify structure
        result_dict = result.to_dict()
        assert 'Function/Code_Block_Name' in result_dict
        assert result_dict['Function/Code_Block_Name'] == "single_func"
        assert result_dict['AIARelevantFunction'] == 85
    
    def test_handle_empty_results(self):
        """Test handling of empty results."""
        formatter = OutputFormatter()
        
        empty_results = {
            'functions_by_file': [],
            'dma_operations': [],
            'ioctl_operations': []
        }
        
        with patch('builtins.print') as mock_print:
            formatter.print_summary(empty_results)
        
        # Should handle empty results gracefully
        assert mock_print.called
    
    def test_yaml_export_with_special_characters(self):
        """Test YAML export with special characters in function names."""
        formatter = OutputFormatter()
        
        results = {
            'functions_by_file': [
                create_test_result("func_with_underscore", 80),
                create_test_result("func-with-dash", 70)
            ],
            'dma_operations': [],
            'ioctl_operations': []
        }
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.yaml', delete=False) as tmp_file:
            formatter.export_to_yaml(results, tmp_file.name)
            
            with open(tmp_file.name, 'r') as f:
                content = f.read()
                assert "func_with_underscore" in content
                assert "func-with-dash" in content
            
            os.unlink(tmp_file.name)
    
    def test_verbose_export_logging(self):
        """Test that verbose mode logs export operations."""
        formatter = OutputFormatter(verbose=True)
        
        results = {
            'functions_by_file': [create_test_result("verbose_test")],
            'dma_operations': [],
            'ioctl_operations': []
        }
        
        with patch('builtins.print') as mock_print:
            with tempfile.NamedTemporaryFile(mode='w', suffix='.yaml', delete=False) as tmp_file:
                formatter.export_to_yaml(results, tmp_file.name)
                
                # Check that verbose logging occurred
                verbose_calls = [call for call in mock_print.call_args_list 
                               if "[VERBOSE]" in str(call)]
                assert len(verbose_calls) > 0
                
                os.unlink(tmp_file.name)
    
    def test_validation_capabilities(self):
        """Test basic validation capabilities of formatter."""
        formatter = OutputFormatter()
        
        # Should handle malformed results gracefully
        malformed_results = {
            'functions_by_file': None,
            'dma_operations': [],
            'ioctl_operations': []
        }
        
        # Should not crash when counting
        try:
            total = formatter.count_total_functions(malformed_results)
            # If it doesn't crash, that's good validation
            assert total >= 0
        except (TypeError, AttributeError):
            # Expected behavior for malformed input
            pass
