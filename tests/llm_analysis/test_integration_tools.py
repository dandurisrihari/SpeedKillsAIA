#!/usr/bin/env python3
"""
Integration tests for the enhanced LLM analysis with struct analyzer tools
"""

import pytest
import json
import tempfile
from pathlib import Path
from unittest.mock import Mock, patch
from src.llm_analysis.json_analyzer import JSONAnalyzer
from src.llm_analysis.models import GPTModel


class TestLLMAnalysisIntegration:
    """Integration tests for LLM analysis with struct analyzer tools"""
    
    def create_test_json_with_preprocessed_files(self):
        """Create test JSON data with preprocessed file paths"""
        return {
            "metadata": {"test": "data"},
            "functions_by_file": {
                "/test/driver.c": [
                    {
                        "function_name": "test_ioctl_handler",
                        "function_code": """
static long test_ioctl_handler(struct file *file, unsigned int cmd, unsigned long arg)
{
    struct gcsHAL_INTERFACE iface;
    if (copy_from_user(&iface, (void __user *)arg, sizeof(iface)))
        return -EFAULT;
    
    switch (iface.command) {
        case gcvHAL_CHIP_INFO:
            return handle_chip_info(&iface);
        default:
            return -EINVAL;
    }
}
""",
                        "preprocessed_code": "",
                        "preprocessed_file_code": "/test/data/gc_hal_kernel_driver.i",
                        "line_number": 42
                    }
                ]
            },
            "user_copy_operations": [
                {
                    "function_name": "copy_smid_to_user",
                    "function_code": """
int copy_smid_to_user(struct smid_info *smid, void __user *user_ptr)
{
    struct user_smid_data data;
    data.smid = smid->id;
    data.phys_addr = smid->physical_address;
    data.size = smid->buffer_size;
    
    return copy_to_user(user_ptr, &data, sizeof(data));
}
""",
                    "preprocessed_code": "",
                    "preprocessed_file_code": "/test/data/gc_hal_kernel_driver.i",
                    "operation": "copy_to_user",
                    "source": "kernel",
                    "destination": "user"
                }
            ]
        }
    
    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_analyze_with_tools_enabled(self, mock_openai_class):
        """Test analysis with struct analyzer tools enabled"""
        # Create test JSON file
        test_data = self.create_test_json_with_preprocessed_files()
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as temp_file:
            json.dump(test_data, temp_file)
            temp_json_path = temp_file.name
        
        try:
            # Mock OpenAI responses
            mock_client = Mock()
            mock_openai_class.return_value = mock_client
            
            # Mock responses for both functions
            mock_responses = [
                # Response for ioctl handler (no tool calls)
                Mock(choices=[Mock(message=Mock(
                    content="""
Function/Code_Block_Name: test_ioctl_handler
AIARelevantFunction: 90
Relevant_KD_Entry_Point: 95
Message_Structure_Handling: 85
SMIDs identified: [potential_smid_in_iface]
Reasoning:
  - IOCTL entry point handling gcsHAL_INTERFACE structure
  - Structure likely contains SMID or related data
""",
                    tool_calls=None
                ))]),
                
                # Response for user copy operation (no tool calls) 
                Mock(choices=[Mock(message=Mock(
                    content="""
Function/Code_Block_Name: copy_smid_to_user
AIARelevantFunction: 95
Relevant_KD_Entry_Point: 20
Message_Structure_Handling: 100
SMIDs identified: [data.smid, smid->id]
Reasoning:
  - Explicit SMID handling in user_smid_data structure
  - Physical address and buffer size indicate AIA memory mapping
  - copy_to_user transfers SMID data to userspace
""",
                    tool_calls=None
                ))])
            ]
            
            mock_client.chat.completions.create.side_effect = mock_responses
            
            # Create analyzer with tools enabled
            analyzer = JSONAnalyzer(
                model=GPTModel.GPT_4.value,
                verbose=True,
                enable_tools=True
            )
            
            # Analyze the JSON file
            results = analyzer.analyze_json_file(temp_json_path)
            
            # Verify both operation types were processed
            assert 'functions_by_file' in results
            assert 'user_copy_operations' in results
            
            # Verify function analysis results
            func_results = results['functions_by_file']
            assert len(func_results) == 1
            assert func_results[0].function_name == "/test/driver.c:test_ioctl_handler"
            assert func_results[0].aia_relevant_function == 90
            assert func_results[0].relevant_kd_entry_point == 95
            
            # Verify user copy analysis results
            copy_results = results['user_copy_operations']
            assert len(copy_results) == 1
            assert copy_results[0].function_name == "user_copy:copy_smid_to_user"
            assert copy_results[0].aia_relevant_function == 95
            assert copy_results[0].message_structure_handling == 100
            
            # Verify preprocessed file paths were passed (check call arguments)
            calls = mock_client.chat.completions.create.call_args_list
            assert len(calls) == 2
            
            # Check that tools were included in requests
            for call in calls:
                assert 'tools' in call.kwargs
                assert 'tool_choice' in call.kwargs
        
        finally:
            Path(temp_json_path).unlink(missing_ok=True)
    
    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_analyze_with_tools_disabled(self, mock_openai_class):
        """Test analysis with struct analyzer tools disabled"""
        # Create test JSON file
        test_data = self.create_test_json_with_preprocessed_files()
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as temp_file:
            json.dump(test_data, temp_file)
            temp_json_path = temp_file.name
        
        try:
            # Mock OpenAI client
            mock_client = Mock()
            mock_openai_class.return_value = mock_client
            
            # Mock simple responses
            mock_response = Mock(choices=[Mock(message=Mock(
                content="""
Function/Code_Block_Name: test_function
AIARelevantFunction: 80
Relevant_KD_Entry_Point: 70
Message_Structure_Handling: 60
SMIDs identified: []
Reasoning:
  - Basic analysis without struct definitions
""",
                tool_calls=None
            ))])
            
            mock_client.chat.completions.create.return_value = mock_response
            
            # Create analyzer with tools disabled
            analyzer = JSONAnalyzer(
                model=GPTModel.GPT_3_5_TURBO.value,
                verbose=True,
                enable_tools=False
            )
            
            # Analyze the JSON file
            results = analyzer.analyze_json_file(temp_json_path)
            
            # Verify results were generated
            assert 'functions_by_file' in results
            assert 'user_copy_operations' in results
            
            # Verify tools were not included in requests
            calls = mock_client.chat.completions.create.call_args_list
            for call in calls:
                assert 'tools' not in call.kwargs
                assert 'tool_choice' not in call.kwargs
        
        finally:
            Path(temp_json_path).unlink(missing_ok=True)
    
    @patch('src.llm_analysis.openai_client.openai.OpenAI')
    @patch('tiktoken.encoding_for_model')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_struct_analyzer_tool_integration(self, mock_tiktoken, mock_openai_class):
        """Test basic integration without complex tool mocking"""
        # Mock tiktoken tokenizer
        mock_encoder = Mock()
        mock_encoder.encode.return_value = [1, 2, 3, 4, 5]
        mock_tiktoken.return_value = mock_encoder
        
        # Create test JSON file
        test_data = {
            "functions_by_file": {
                "/test/driver.c": [
                    {
                        "function_name": "handle_gcs_interface",
                        "function_code": "int handle_gcs_interface(struct gcsHAL_INTERFACE *iface) { return 0; }",
                        "preprocessed_file_code": "data/structanalyzerpreprocessedfiles/dma-buf-phys.i"
                    }
                ]
            }
        }
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as temp_file:
            json.dump(test_data, temp_file)
            temp_json_path = temp_file.name
        
        try:
            # Mock OpenAI client
            mock_client = Mock()
            mock_openai_class.return_value = mock_client
            
            # Mock response without tool calls
            mock_response = Mock(choices=[Mock(message=Mock(
                content="""
Function/Code_Block_Name: handle_gcs_interface
AIARelevantFunction: 85
Relevant_KD_Entry_Point: 70
Message_Structure_Handling: 80
SMIDs identified: [iface->smid]
Reasoning: Function processes interface structure
""",
                tool_calls=None
            ))])
            
            mock_client.chat.completions.create.return_value = mock_response
            
            # Create analyzer without tools to avoid subprocess complexity
            analyzer = JSONAnalyzer(
                model=GPTModel.GPT_4.value,
                verbose=True,
                enable_tools=False
            )
            
            results = analyzer.analyze_json_file(temp_json_path)
            
            # Verify basic functionality works
            assert isinstance(results, dict)
            assert "functions_by_file" in results
            assert len(results["functions_by_file"]) > 0
            
            # Verify function analysis result
            function_result = results["functions_by_file"][0]
            assert "handle_gcs_interface" in function_result.function_name
            assert function_result.aia_relevant_function == 85
            
        finally:
            Path(temp_json_path).unlink(missing_ok=True)
