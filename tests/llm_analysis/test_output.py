#!/usr/bin/env python3
"""
Test output functionality
"""

import pytest
import yaml
import tempfile
import os
from src.llm_analysis.output import OutputFormatter
from src.llm_analysis.models import AnalysisResult


class TestOutputFormatter:
    """Test OutputFormatter class"""
    
    @pytest.fixture
    def output_formatter(self):
        """Create OutputFormatter instance"""
        return OutputFormatter(verbose=False)
    
    @pytest.fixture
    def sample_analysis_result(self):
        """Sample analysis result"""
        return AnalysisResult(
            function_name="test_function",
            aia_relevant_function=85,
            relevant_kd_entry_point=60,
            message_structure_handling=70,
            message_structures_identified=["gcsHAL_INTERFACE", "user_data_struct"],
            smids_identified=["SMID_GPU_MEM", "SMID_DMA_BUF"],
            reasoning=["Function manages GPU memory allocation", "Uses DMA mapping APIs"]
        )
    
    @pytest.fixture
    def sample_results_dict(self, sample_analysis_result):
        """Sample results dictionary"""
        return {
            "functions_by_file": [sample_analysis_result],
            "dma_operations": [sample_analysis_result],
            "user_copy_operations": [sample_analysis_result],
            "ioctl_operations": [sample_analysis_result]
        }
    
    def test_export_to_yaml(self, output_formatter, sample_results_dict):
        """Test exporting results to YAML file"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.yaml', delete=False) as f:
            temp_file = f.name
        
        try:
            output_formatter.export_to_yaml(sample_results_dict, temp_file)
            
            # Verify file was created
            assert os.path.exists(temp_file)
            
            # Read back the file and verify content
            with open(temp_file, 'r') as f:
                content = yaml.safe_load(f)
            
            assert 'functions_by_file' in content
            assert 'dma_operations' in content
            assert 'user_copy_operations' in content
            assert 'ioctl_operations' in content
            
            # Check first function result
            func_result = content['functions_by_file'][0]
            assert func_result['Function/Code_Block_Name'] == "test_function"
            assert func_result['AIARelevantFunction'] == 85
            assert func_result['SMIDs_identified'] == ["SMID_GPU_MEM", "SMID_DMA_BUF"]
            
        finally:
            if os.path.exists(temp_file):
                os.unlink(temp_file)
    
    def test_count_total_functions(self, output_formatter, sample_results_dict):
        """Test counting total functions"""
        total = output_formatter.count_total_functions(sample_results_dict)
        
        # Should count all functions across all categories
        assert total == 4  # 1 function in each of 4 categories
    
    def test_verbose_logging(self, capsys):
        """Test verbose logging"""
        verbose_formatter = OutputFormatter(verbose=True)
        verbose_formatter._log_verbose("Test verbose message")
        
        captured = capsys.readouterr()
        assert "[VERBOSE] Test verbose message" in captured.out
