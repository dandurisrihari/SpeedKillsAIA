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
            assert copy_results[0].function_name == "copy_smid_to_user"
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
    @patch('subprocess.run')
    @patch.dict('os.environ', {'OPENAI_API_KEY': 'test-key'})
    def test_struct_analyzer_tool_integration(self, mock_subprocess, mock_openai_class):
        """Test actual integration with struct analyzer tool"""
        # Create test JSON file
        test_data = {
            "functions_by_file": {
                "/test/driver.c": [
                    {
                        "function_name": "handle_gcs_interface",
                        "function_code": """
int handle_gcs_interface(struct gcsHAL_INTERFACE *iface)
{
    if (iface->command == gcvHAL_CHIP_INFO) {
        return process_chip_info(iface);
    }
    return -EINVAL;
}
""",
                        "preprocessed_file_code": "/test/data/gc_hal_kernel_driver.i"
                    }
                ]
            }
        }
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as temp_file:
            json.dump(test_data, temp_file)
            temp_json_path = temp_file.name
        
        # Create mock preprocessed file
        with tempfile.NamedTemporaryFile(mode='w', suffix='.i', delete=False) as prep_file:
            prep_file.write("""
typedef struct _gcsHAL_INTERFACE {
    gceHAL_COMMAND_CODES command;
    int smid;
    unsigned long phys_addr;
    size_t buffer_size;
} gcsHAL_INTERFACE;

typedef enum _gceHAL_COMMAND_CODES {
    gcvHAL_CHIP_INFO = 0,
    gcvHAL_ALLOCATE_MEMORY = 1
} gceHAL_COMMAND_CODES;
""")
            prep_file_path = prep_file.name
        
        # Update test data with real preprocessed file path
        test_data["functions_by_file"]["/test/driver.c"][0]["preprocessed_file_code"] = prep_file_path
        
        with open(temp_json_path, 'w') as f:
            json.dump(test_data, f)
        
        try:
            # Mock OpenAI client and responses
            mock_client = Mock()
            mock_openai_class.return_value = mock_client
            
            # Mock tool call requesting struct analysis
            mock_tool_call = Mock()
            mock_tool_call.id = "call_123"
            mock_tool_call.function.name = "analyze_struct_definition"
            mock_tool_call.function.arguments = json.dumps({
                "file_path": prep_file_path,
                "struct_name": "gcsHAL_INTERFACE"
            })
            
            # First response with tool call
            mock_first_response = Mock(choices=[Mock(message=Mock(
                content="I need to analyze the gcsHAL_INTERFACE structure.",
                tool_calls=[mock_tool_call]
            ))])
            
            # Final response after tool execution
            mock_final_response = Mock(choices=[Mock(message=Mock(
                content="""
Function/Code_Block_Name: handle_gcs_interface
AIARelevantFunction: 95
Relevant_KD_Entry_Point: 80
Message_Structure_Handling: 90
SMIDs identified: [iface->smid]
Reasoning:
  - Function processes gcsHAL_INTERFACE which contains smid field
  - Physical address field indicates AIA memory mapping
  - Command-based dispatch suggests IOCTL entry point
""",
                tool_calls=None
            ))])
            
            mock_client.chat.completions.create.side_effect = [mock_first_response, mock_final_response]
            
            # Mock successful struct analyzer execution
            mock_subprocess_result = Mock()
            mock_subprocess_result.returncode = 0
            mock_subprocess_result.stderr = ""
            mock_subprocess.return_value = mock_subprocess_result
            
            # Mock struct analyzer output
            struct_output = """
struct gcsHAL_INTERFACE {
    gceHAL_COMMAND_CODES command;  // Enum for command types
    int smid;                      // Shared Memory Identifier
    unsigned long phys_addr;       // Physical address
    size_t buffer_size;           // Buffer size
};
"""
            
            with patch('tempfile.NamedTemporaryFile') as mock_temp, \
                 patch('builtins.open') as mock_open:
                
                # Configure mocks for temporary file handling
                mock_temp_file = Mock()
                mock_temp_file.name = "/tmp/struct_output.txt"
                mock_temp.__enter__.return_value = mock_temp_file
                
                mock_open.return_value.__enter__.return_value.read.return_value = struct_output
                
                # Create analyzer and run analysis
                analyzer = JSONAnalyzer(
                    model=GPTModel.GPT_4.value,
                    verbose=True,
                    enable_tools=True
                )
                
                results = analyzer.analyze_json_file(temp_json_path)
                
                # Verify struct analyzer was called
                assert mock_subprocess.called
                call_args = mock_subprocess.call_args[0][0]
                assert "python3" in call_args
                assert "-m" in call_args
                assert "src.structanalyzer" in call_args
                assert prep_file_path in call_args
                assert "gcsHAL_INTERFACE" in call_args
                
                # Verify enhanced analysis results
                func_results = results['functions_by_file']
                assert len(func_results) == 1
                result = func_results[0]
                assert result.aia_relevant_function == 95
                assert result.message_structure_handling == 90
                assert "iface->smid" in result.smids_identified
        
        finally:
            Path(temp_json_path).unlink(missing_ok=True)
            Path(prep_file_path).unlink(missing_ok=True)
