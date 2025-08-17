#!/usr/bin/env python3
"""
Test prompts functionality
"""

import pytest
from src.llm_analysis.prompts import create_analysis_prompt


class TestPrompts:
    """Test prompt creation functions"""
    
    def test_create_analysis_prompt_basic(self):
        """Test creating basic analysis prompt"""
        function_code = "int test_function(void) { return 0; }"
        
        prompt = create_analysis_prompt(function_code)
        
        # Check that prompt contains expected elements
        assert "AI Accelerator" in prompt or "AIA" in prompt
        assert "kernel" in prompt.lower()
        assert "YAML" in prompt or "yaml" in prompt
        assert "AIARelevantFunction" in prompt
        assert "Relevant_KD_Entry_Point" in prompt
        assert "Message_Structure_Handling" in prompt
        assert function_code in prompt
    
    def test_create_analysis_prompt_with_stack_trace(self):
        """Test creating prompt with stack trace"""
        function_code = "void dma_alloc(size_t size) {}"
        stack_trace = "dma_alloc+0x10\ndriver_probe+0x20"
        
        prompt = create_analysis_prompt(function_code, stack_trace=stack_trace)
        
        # Should contain both function code and stack trace
        assert function_code in prompt
        assert stack_trace in prompt
        assert "Stack Trace" in prompt
    
    def test_create_analysis_prompt_with_operation_type(self):
        """Test creating prompt with operation type"""
        function_code = "long ioctl_handler(unsigned int cmd) {}"
        operation_type = "IOCTL"
        
        prompt = create_analysis_prompt(function_code, operation_type=operation_type)
        
        # Should contain operation type
        assert f"Operation Type: {operation_type}" in prompt
        assert function_code in prompt
    
    def test_prompt_structure_consistency(self):
        """Test that prompt structure is consistent"""
        function_code = "int example_func(void) {}"
        
        prompt = create_analysis_prompt(function_code)
        
        # Check for consistent structure elements
        assert "You are an expert" in prompt
        assert "1. AIARelevantFunction" in prompt
        assert "2. Relevant KD Entry Point" in prompt
        assert "3. Message Structure Handling" in prompt
        assert "OUTPUT FORMAT" in prompt
