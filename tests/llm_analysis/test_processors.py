#!/usr/bin/env python3
"""
Test processors functionality
"""

import pytest
from unittest.mock import Mock, patch
from src.llm_analysis.processors import (
    FunctionProcessor, DMAProcessor, UserCopyProcessor, IOCTLProcessor
)
from src.llm_analysis.models import (
    FunctionEntry, DMAOperation, UserCopyOperation, IOCTLOperation, 
    AnalysisResult, GPTModel
)


class TestFunctionProcessor:
    """Test FunctionProcessor class"""
    
    @pytest.fixture
    def mock_openai_client(self):
        """Create mock OpenAI client"""
        return Mock()
    
    @pytest.fixture
    def processor(self, mock_openai_client):
        """Create FunctionProcessor instance"""
        return FunctionProcessor(mock_openai_client)
    
    @pytest.fixture
    def sample_function(self):
        """Sample function entry"""
        return FunctionEntry(
            function_name="test_function",
            function_code="int test_function(void) { return 0; }",
            file_path="test.c",
            line_number=100
        )
    
    def test_process_function(self, processor, mock_openai_client, sample_function):
        """Test processing a function"""
        # Mock response
        mock_response = """
relevance_to_ai_accelerators: "HIGH"
confidence_level: 0.85
reasoning: "Test reasoning"
"""
        mock_openai_client.analyze_function.return_value = mock_response
        
        with patch('src.llm_analysis.processors.ResponseParser') as mock_parser_class:
            mock_parser = Mock()
            mock_parser_class.return_value = mock_parser
            
            expected_result = AnalysisResult(
                relevance_to_ai_accelerators="HIGH",
                confidence_level=0.85,
                reasoning="Test reasoning"
            )
            mock_parser.parse_response.return_value = expected_result
            
            result = processor.process(sample_function)
            
            assert result == expected_result
            mock_openai_client.analyze_function.assert_called_once()
            mock_parser.parse_response.assert_called_once_with(mock_response)
    
    def test_process_function_no_response(self, processor, mock_openai_client, sample_function):
        """Test processing function when no response from OpenAI"""
        mock_openai_client.analyze_function.return_value = None
        
        with patch('src.llm_analysis.processors.ResponseParser') as mock_parser_class:
            mock_parser = Mock()
            mock_parser_class.return_value = mock_parser
            
            expected_result = AnalysisResult(
                relevance_to_ai_accelerators="UNKNOWN",
                confidence_level=0.0,
                reasoning="No response received"
            )
            mock_parser.parse_response.return_value = expected_result
            
            result = processor.process(sample_function)
            
            assert result == expected_result
            mock_parser.parse_response.assert_called_once_with(None)
    
    def test_get_context_info(self, processor, sample_function):
        """Test getting context info for function"""
        context = processor._get_context_info(sample_function)
        
        assert context['function_name'] == "test_function"
        assert context['file_path'] == "test.c"
        assert context['line_number'] == 100


class TestDMAProcessor:
    """Test DMAProcessor class"""
    
    @pytest.fixture
    def mock_openai_client(self):
        """Create mock OpenAI client"""
        return Mock()
    
    @pytest.fixture
    def processor(self, mock_openai_client):
        """Create DMAProcessor instance"""
        return DMAProcessor(mock_openai_client)
    
    @pytest.fixture
    def sample_dma_operation(self):
        """Sample DMA operation"""
        return DMAOperation(
            function_name="dma_alloc_coherent",
            function_code="void* dma_alloc_coherent(struct device *dev, size_t size) {}",
            stack_trace="dma_alloc_coherent+0x10\ndriver_probe+0x20"
        )
    
    def test_process_dma_operation(self, processor, mock_openai_client, sample_dma_operation):
        """Test processing a DMA operation"""
        mock_response = """
relevance_to_ai_accelerators: "HIGH"
confidence_level: 0.9
reasoning: "DMA operations are critical for AI accelerators"
accelerator_types:
  - GPU
  - TPU
"""
        mock_openai_client.analyze_function.return_value = mock_response
        
        with patch('src.llm_analysis.processors.ResponseParser') as mock_parser_class:
            mock_parser = Mock()
            mock_parser_class.return_value = mock_parser
            
            expected_result = AnalysisResult(
                relevance_to_ai_accelerators="HIGH",
                confidence_level=0.9,
                reasoning="DMA operations are critical for AI accelerators",
                accelerator_types=["GPU", "TPU"]
            )
            mock_parser.parse_response.return_value = expected_result
            
            result = processor.process(sample_dma_operation)
            
            assert result == expected_result
            
            # Check that context was passed correctly
            call_args = mock_openai_client.analyze_function.call_args
            context = call_args[1]['context']
            assert context['operation_type'] == 'DMA'
            assert context['stack_trace'] == sample_dma_operation.stack_trace
    
    def test_get_context_info(self, processor, sample_dma_operation):
        """Test getting context info for DMA operation"""
        context = processor._get_context_info(sample_dma_operation)
        
        assert context['operation_type'] == 'DMA'
        assert context['function_name'] == "dma_alloc_coherent"
        assert context['stack_trace'] == sample_dma_operation.stack_trace


class TestUserCopyProcessor:
    """Test UserCopyProcessor class"""
    
    @pytest.fixture
    def mock_openai_client(self):
        """Create mock OpenAI client"""
        return Mock()
    
    @pytest.fixture
    def processor(self, mock_openai_client):
        """Create UserCopyProcessor instance"""
        return UserCopyProcessor(mock_openai_client)
    
    @pytest.fixture
    def sample_user_copy_operation(self):
        """Sample user copy operation"""
        return UserCopyOperation(
            function_name="copy_from_user",
            function_code="unsigned long copy_from_user(void *to, const void __user *from, unsigned long n)",
            operation="copy_from_user",
            source="user_buffer",
            destination="kernel_buffer"
        )
    
    def test_process_user_copy_operation(self, processor, mock_openai_client, sample_user_copy_operation):
        """Test processing a user copy operation"""
        mock_response = """
relevance_to_ai_accelerators: "MEDIUM"
confidence_level: 0.7
reasoning: "User data copy for AI model parameters"
security_implications: "Potential buffer overflow"
"""
        mock_openai_client.analyze_function.return_value = mock_response
        
        with patch('src.llm_analysis.processors.ResponseParser') as mock_parser_class:
            mock_parser = Mock()
            mock_parser_class.return_value = mock_parser
            
            expected_result = AnalysisResult(
                relevance_to_ai_accelerators="MEDIUM",
                confidence_level=0.7,
                reasoning="User data copy for AI model parameters",
                security_implications="Potential buffer overflow"
            )
            mock_parser.parse_response.return_value = expected_result
            
            result = processor.process(sample_user_copy_operation)
            
            assert result == expected_result
            
            # Check that context was passed correctly
            call_args = mock_openai_client.analyze_function.call_args
            context = call_args[1]['context']
            assert context['operation_type'] == 'User Copy'
            assert context['copy_operation'] == "copy_from_user"
    
    def test_get_context_info(self, processor, sample_user_copy_operation):
        """Test getting context info for user copy operation"""
        context = processor._get_context_info(sample_user_copy_operation)
        
        assert context['operation_type'] == 'User Copy'
        assert context['function_name'] == "copy_from_user"
        assert context['copy_operation'] == "copy_from_user"
        assert context['source'] == "user_buffer"
        assert context['destination'] == "kernel_buffer"


class TestIOCTLProcessor:
    """Test IOCTLProcessor class"""
    
    @pytest.fixture
    def mock_openai_client(self):
        """Create mock OpenAI client"""
        return Mock()
    
    @pytest.fixture
    def processor(self, mock_openai_client):
        """Create IOCTLProcessor instance"""
        return IOCTLProcessor(mock_openai_client)
    
    @pytest.fixture
    def sample_ioctl_operation(self):
        """Sample IOCTL operation"""
        return IOCTLOperation(
            function_name="gpu_ioctl_handler",
            function_code="long gpu_ioctl_handler(struct file *file, unsigned int cmd, unsigned long arg)",
            ioctl_cmd="DRM_IOCTL_GPU_SUBMIT",
            handler="gpu_submit_handler"
        )
    
    def test_process_ioctl_operation(self, processor, mock_openai_client, sample_ioctl_operation):
        """Test processing an IOCTL operation"""
        mock_response = """
relevance_to_ai_accelerators: "VERY_HIGH"
confidence_level: 0.95
reasoning: "GPU IOCTL for AI workload submission"
accelerator_types:
  - GPU
performance_impact: "Critical"
"""
        mock_openai_client.analyze_function.return_value = mock_response
        
        with patch('src.llm_analysis.processors.ResponseParser') as mock_parser_class:
            mock_parser = Mock()
            mock_parser_class.return_value = mock_parser
            
            expected_result = AnalysisResult(
                relevance_to_ai_accelerators="VERY_HIGH",
                confidence_level=0.95,
                reasoning="GPU IOCTL for AI workload submission",
                accelerator_types=["GPU"],
                performance_impact="Critical"
            )
            mock_parser.parse_response.return_value = expected_result
            
            result = processor.process(sample_ioctl_operation)
            
            assert result == expected_result
            
            # Check that context was passed correctly
            call_args = mock_openai_client.analyze_function.call_args
            context = call_args[1]['context']
            assert context['operation_type'] == 'IOCTL'
            assert context['ioctl_cmd'] == "DRM_IOCTL_GPU_SUBMIT"
    
    def test_get_context_info(self, processor, sample_ioctl_operation):
        """Test getting context info for IOCTL operation"""
        context = processor._get_context_info(sample_ioctl_operation)
        
        assert context['operation_type'] == 'IOCTL'
        assert context['function_name'] == "gpu_ioctl_handler"
        assert context['ioctl_cmd'] == "DRM_IOCTL_GPU_SUBMIT"
        assert context['handler'] == "gpu_submit_handler"


class TestProcessorVerboseLogging:
    """Test verbose logging across all processors"""
    
    def test_function_processor_verbose(self, capsys):
        """Test verbose logging in FunctionProcessor"""
        mock_client = Mock()
        processor = FunctionProcessor(mock_client)
        processor._log_verbose("Test function message")
        
        captured = capsys.readouterr()
        assert "[VERBOSE] Test function message" in captured.out
    
    def test_dma_processor_verbose(self, capsys):
        """Test verbose logging in DMAProcessor"""
        mock_client = Mock()
        processor = DMAProcessor(mock_client)
        processor._log_verbose("Test DMA message")
        
        captured = capsys.readouterr()
        assert "[VERBOSE] Test DMA message" in captured.out
    
    def test_user_copy_processor_verbose(self, capsys):
        """Test verbose logging in UserCopyProcessor"""
        mock_client = Mock()
        processor = UserCopyProcessor(mock_client)
        processor._log_verbose("Test user copy message")
        
        captured = capsys.readouterr()
        assert "[VERBOSE] Test user copy message" in captured.out
    
    def test_ioctl_processor_verbose(self, capsys):
        """Test verbose logging in IOCTLProcessor"""
        mock_client = Mock()
        processor = IOCTLProcessor(mock_client)
        processor._log_verbose("Test IOCTL message")
        
        captured = capsys.readouterr()
        assert "[VERBOSE] Test IOCTL message" in captured.out
