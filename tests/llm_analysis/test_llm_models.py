#!/usr/bin/env python3
"""
Test models and data structures
"""

import pytest
from src.llm_analysis.models import GPTModel, AnalysisResult, FunctionEntry, DMAOperation, UserCopyOperation, IOCTLOperation


class TestGPTModel:
    """Test GPTModel enum"""
    
    def test_model_values(self):
        """Test that all model values are correct"""
        assert GPTModel.GPT_3_5_TURBO.value == "gpt-3.5-turbo"
        assert GPTModel.GPT_4.value == "gpt-4"
        assert GPTModel.GPT_4_TURBO.value == "gpt-4-turbo-preview"
        assert GPTModel.GPT_4O.value == "gpt-4o"
    
    def test_all_models(self):
        """Test all_models class method"""
        models = GPTModel.all_models()
        expected = ["gpt-3.5-turbo", "gpt-4", "gpt-4-turbo-preview", "gpt-4o"]
        assert models == expected
        assert len(models) == 4


class TestAnalysisResult:
    """Test AnalysisResult dataclass"""
    
    @pytest.fixture
    def sample_result(self):
        """Sample AnalysisResult for testing"""
        return AnalysisResult(
            function_name="test_function",
            aia_relevant_function=85,
            relevant_kd_entry_point=25,
            message_structure_handling=60,
            smids_identified=["dma_addr", "page_table_idx"],
            reasoning=["High DMA usage", "Memory mapping operations"]
        )
    
    def test_creation(self, sample_result):
        """Test AnalysisResult creation"""
        assert sample_result.function_name == "test_function"
        assert sample_result.aia_relevant_function == 85
        assert sample_result.relevant_kd_entry_point == 25
        assert sample_result.message_structure_handling == 60
        assert sample_result.smids_identified == ["dma_addr", "page_table_idx"]
        assert sample_result.reasoning == ["High DMA usage", "Memory mapping operations"]
    
    def test_to_dict(self, sample_result):
        """Test to_dict method"""
        result_dict = sample_result.to_dict()
        
        expected = {
            'Function/Code_Block_Name': 'test_function',
            'AIARelevantFunction': 85,
            'Relevant_KD_Entry_Point': 25,
            'Message_Structure_Handling': 60,
            'SMIDs_identified': ['dma_addr', 'page_table_idx'],
            'Reasoning': ['High DMA usage', 'Memory mapping operations']
        }
        
        assert result_dict == expected


class TestFunctionEntry:
    """Test FunctionEntry dataclass"""
    
    @pytest.fixture
    def sample_function(self):
        """Sample FunctionEntry for testing"""
        return FunctionEntry(
            function_name="gasket_init",
            file_path="gasket_core.c",
            function_code="int gasket_init(void) { return 0; }",
            preprocessed_code="int gasket_init(void) { return 0; }",
            line_number=100
        )
    
    def test_creation(self, sample_function):
        """Test FunctionEntry creation"""
        assert sample_function.function_name == "gasket_init"
        assert sample_function.file_path == "gasket_core.c"
        assert sample_function.function_code == "int gasket_init(void) { return 0; }"
        assert sample_function.line_number == 100
    
    def test_get_code_prefers_function_code(self):
        """Test get_code prefers function_code over preprocessed_code"""
        func = FunctionEntry(
            function_name="test",
            file_path="test.c",
            function_code="original code",
            preprocessed_code="preprocessed code"
        )
        assert func.get_code() == "original code"
    
    def test_get_code_fallback_to_preprocessed(self):
        """Test get_code falls back to preprocessed_code when function_code is empty"""
        func = FunctionEntry(
            function_name="test",
            file_path="test.c",
            function_code="",
            preprocessed_code="preprocessed code"
        )
        assert func.get_code() == "preprocessed code"


class TestDMAOperation:
    """Test DMAOperation dataclass"""
    
    def test_creation(self):
        """Test DMAOperation creation"""
        dma = DMAOperation(
            function_name="dma_alloc",
            function_code="void dma_alloc(void) {}",
            stack_trace="dma_alloc+0x10\ndriver_main+0x20"
        )
        
        assert dma.function_name == "dma_alloc"
        assert dma.function_code == "void dma_alloc(void) {}"
        assert dma.stack_trace == "dma_alloc+0x10\ndriver_main+0x20"
    
    def test_get_code(self):
        """Test get_code method"""
        dma = DMAOperation(
            function_name="test",
            function_code="original",
            preprocessed_code="preprocessed"
        )
        assert dma.get_code() == "original"


class TestUserCopyOperation:
    """Test UserCopyOperation dataclass"""
    
    def test_creation(self):
        """Test UserCopyOperation creation"""
        copy_op = UserCopyOperation(
            function_name="copy_func",
            function_code="copy_from_user(dest, src, size)",
            operation="copy_from_user",
            source="src",
            destination="dest"
        )
        
        assert copy_op.function_name == "copy_func"
        assert copy_op.operation == "copy_from_user"
        assert copy_op.source == "src"
        assert copy_op.destination == "dest"


class TestIOCTLOperation:
    """Test IOCTLOperation dataclass"""
    
    def test_creation(self):
        """Test IOCTLOperation creation"""
        ioctl_op = IOCTLOperation(
            function_name="ioctl_handler",
            function_code="long ioctl_handler(uint cmd) {}",
            ioctl_cmd="GASKET_IOCTL_MAP_BUFFER",
            handler="gasket_map_buffers"
        )
        
        assert ioctl_op.function_name == "ioctl_handler"
        assert ioctl_op.ioctl_cmd == "GASKET_IOCTL_MAP_BUFFER"
        assert ioctl_op.handler == "gasket_map_buffers"
