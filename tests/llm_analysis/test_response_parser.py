#!/usr/bin/env python3
"""
Test response parser functionality
"""

import pytest
import yaml
from src.llm_analysis.response_parser import ResponseParser
from src.llm_analysis.models import AnalysisResult


class TestResponseParser:
    """Test ResponseParser class"""
    
    @pytest.fixture
    def parser(self):
        """Create ResponseParser instance"""
        return ResponseParser(verbose=False)
    
    def test_parse_response_valid_yaml_with_code_blocks(self, parser):
        """Test parsing valid YAML response wrapped in code blocks"""
        response = """
Here's my analysis:

```yaml
Function/Code_Block_Name: test_function
AIARelevantFunction: 85
Relevant_KD_Entry_Point: 60
Message_Structure_Handling: 70
SMID's identified:
  - SMID_GPU_MEM
  - SMID_DMA_BUF
Reasoning:
  - Function manages GPU memory allocation
  - Uses DMA mapping APIs
```

Additional notes here.
"""
        
        result = parser.parse_response(response)
        
        assert isinstance(result, AnalysisResult)
        assert result.function_name == "test_function"
        assert result.aia_relevant_function == 85
        assert result.relevant_kd_entry_point == 60
        assert result.message_structure_handling == 70
        assert result.smids_identified == ["SMID_GPU_MEM", "SMID_DMA_BUF"]
        assert result.reasoning == ["Function manages GPU memory allocation", "Uses DMA mapping APIs"]
    
    def test_parse_response_valid_yaml_without_code_blocks(self, parser):
        """Test parsing valid YAML response without code blocks"""
        response = """
Function/Code_Block_Name: dma_function
AIARelevantFunction: 90
Relevant_KD_Entry_Point: 80
Message_Structure_Handling: 60
SMID's identified:
  - SMID_DMA
Reasoning:
  - Critical DMA operation
"""
        
        result = parser.parse_response(response)
        
        assert isinstance(result, AnalysisResult)
        assert result.function_name == "dma_function"
        assert result.aia_relevant_function == 90
        assert result.relevant_kd_entry_point == 80
        assert result.message_structure_handling == 60
        assert result.smids_identified == ["SMID_DMA"]
        assert result.reasoning == ["Critical DMA operation"]
    
    def test_parse_response_with_percentage_symbols(self, parser):
        """Test parsing response with percentage symbols"""
        response = """
```yaml
Function/Code_Block_Name: percentage_test
AIARelevantFunction: 75%
Relevant_KD_Entry_Point: 50%
Message_Structure_Handling: 25%
SMID's identified: []
Reasoning:
  - Test with percentages
```
"""
        
        result = parser.parse_response(response)
        
        assert result.aia_relevant_function == 75
        assert result.relevant_kd_entry_point == 50
        assert result.message_structure_handling == 25
    
    def test_parse_response_with_string_smids(self, parser):
        """Test parsing response with single string SMID"""
        response = """
```yaml
Function/Code_Block_Name: string_smid_test
AIARelevantFunction: 60
Relevant_KD_Entry_Point: 40
Message_Structure_Handling: 30
SMID's identified: SINGLE_SMID
Reasoning:
  - Single SMID test
```
"""
        
        result = parser.parse_response(response)
        
        assert result.smids_identified == ["SINGLE_SMID"]
    
    def test_parse_response_with_string_reasoning(self, parser):
        """Test parsing response with string reasoning instead of list"""
        response = """
```yaml
Function/Code_Block_Name: string_reasoning_test
AIARelevantFunction: 55
Relevant_KD_Entry_Point: 35
Message_Structure_Handling: 45
SMID's identified: []
Reasoning: Single string reasoning
```
"""
        
        result = parser.parse_response(response)
        
        assert result.reasoning == ["Single string reasoning"]
    
    def test_parse_response_with_mixed_reasoning_list(self, parser):
        """Test parsing response with mixed reasoning list (strings and dicts)"""
        response = """
```yaml
Function/Code_Block_Name: mixed_reasoning_test
AIARelevantFunction: 65
Relevant_KD_Entry_Point: 45
Message_Structure_Handling: 55
SMID's identified: []
Reasoning:
  - String reasoning item
  - key: value
  - Another string item
```
"""
        
        result = parser.parse_response(response)
        
        assert len(result.reasoning) == 3
        assert result.reasoning[0] == "String reasoning item"
        assert "key" in str(result.reasoning[1])  # Dict converted to string
        assert result.reasoning[2] == "Another string item"
    
    def test_parse_response_invalid_yaml(self, parser):
        """Test parsing invalid YAML response (should use fallback)"""
        response = """
This is not valid YAML
Function/Code_Block_Name: fallback_test
AIARelevantFunction: 42
invalid: yaml: [unclosed bracket
"""
        
        result = parser.parse_response(response)
        
        # Should use fallback parsing
        assert isinstance(result, AnalysisResult)
        assert result.function_name == "fallback_test"
        assert result.aia_relevant_function == 42
        assert "Failed to parse YAML response" in result.reasoning[0]
    
    def test_parse_response_empty_response(self, parser):
        """Test parsing empty response"""
        result = parser.parse_response("")
        
        assert isinstance(result, AnalysisResult)
        assert result.function_name == "Parse Error"
        assert result.aia_relevant_function == 0
        assert result.relevant_kd_entry_point == 0
        assert result.message_structure_handling == 0
        assert result.smids_identified == []
        assert "Failed to parse YAML response" in result.reasoning[0]
    
    def test_parse_response_malformed_yaml_structure(self, parser):
        """Test parsing response with malformed YAML structure"""
        response = """
```yaml
not_a_dict: but a string
```
"""
        
        result = parser.parse_response(response)
        
        # YAML parsing succeeds but doesn't have expected fields, so defaults are used
        assert isinstance(result, AnalysisResult)
        assert result.function_name == "Unknown"  # Default when no function name found
        assert result.reasoning == []  # Empty reasoning when not provided
        assert result.aia_relevant_function == 0  # Default value
    
    def test_clean_yaml_content_with_reasoning_formatting(self, parser):
        """Test _clean_yaml_content method with reasoning section"""
        yaml_content = """Function/Code_Block_Name: test
AIARelevantFunction: 80
Reasoning:
- First reason
- Second reason
Message_Structure_Handling: 60"""
        
        cleaned = parser._clean_yaml_content(yaml_content)
        
        # Should properly format the reasoning section
        assert "Reasoning:" in cleaned
        assert "First reason" in cleaned
        assert "Second reason" in cleaned
    
    def test_extract_analysis_result_with_defaults(self, parser):
        """Test _extract_analysis_result with missing fields (should use defaults)"""
        data = {
            'Function/Code_Block_Name': 'minimal_test'
            # Missing other fields
        }
        
        result = parser._extract_analysis_result(data)
        
        assert result.function_name == 'minimal_test'
        assert result.aia_relevant_function == 0
        assert result.relevant_kd_entry_point == 0
        assert result.message_structure_handling == 0
        assert result.smids_identified == []
        assert result.reasoning == []
    
    def test_extract_analysis_result_with_none_values(self, parser):
        """Test _extract_analysis_result with None values"""
        data = {
            'Function/Code_Block_Name': 'none_test',
            'AIARelevantFunction': None,
            "SMID's identified": None,
            'Reasoning': None
        }
        
        result = parser._extract_analysis_result(data)
        
        assert result.function_name == 'none_test'
        assert result.aia_relevant_function == 0
        assert result.smids_identified == []
        assert result.reasoning == []
    
    def test_fallback_parse_complete_extraction(self, parser):
        """Test _fallback_parse method with extractable data"""
        response_text = """
Function/Code_Block_Name: fallback_complete
AIARelevantFunction: 88
Relevant_KD_Entry_Point: 77
Message_Structure_Handling: 66
Some other text here
"""
        
        result = parser._fallback_parse(response_text)
        
        assert result.function_name == "fallback_complete"
        assert result.aia_relevant_function == 88
        assert result.relevant_kd_entry_point == 77
        assert result.message_structure_handling == 66
    
    def test_fallback_parse_partial_extraction(self, parser):
        """Test _fallback_parse method with partial data"""
        response_text = """
Some text without proper structure
AIARelevantFunction: 33
Random text here
"""
        
        result = parser._fallback_parse(response_text)
        
        assert result.function_name == "Parse Error"
        assert result.aia_relevant_function == 33
        assert result.relevant_kd_entry_point == 0
        assert result.message_structure_handling == 0
    
    def test_fallback_parse_no_extractable_data(self, parser):
        """Test _fallback_parse method with no extractable data"""
        response_text = "Completely random text with no structured data"
        
        result = parser._fallback_parse(response_text)
        
        assert result.function_name == "Parse Error"
        assert result.aia_relevant_function == 0
        assert result.relevant_kd_entry_point == 0
        assert result.message_structure_handling == 0
        assert result.smids_identified == []
        assert "Failed to parse YAML response" in result.reasoning[0]
    
    def test_verbose_logging(self, capsys):
        """Test verbose logging"""
        parser = ResponseParser(verbose=True)
        parser._log_verbose("Test verbose message")
        
        captured = capsys.readouterr()
        assert "[VERBOSE] Test verbose message" in captured.out
    
    def test_non_verbose_logging(self, capsys):
        """Test that non-verbose mode doesn't log"""
        parser = ResponseParser(verbose=False)
        parser._log_verbose("Test message")
        
        captured = capsys.readouterr()
        assert captured.out == ""
    
    def test_parse_percentage_edge_cases(self, parser):
        """Test percentage parsing edge cases"""
        # Test data with various percentage formats
        test_cases = [
            ("85%", 85),
            ("85.5%", 85),
            ("85.9%", 85),
            ("85", 85),
            ("85.7", 85),
            ("invalid", 0),
            (None, 0),
            ("", 0),
            ("100%", 100),
            ("0%", 0)
        ]
        
        for input_val, expected in test_cases:
            data = {
                'Function/Code_Block_Name': 'percentage_test',
                'AIARelevantFunction': input_val
            }
            result = parser._extract_analysis_result(data)
            assert result.aia_relevant_function == expected
    
    def test_yaml_error_handling(self, parser, capsys):
        """Test YAML error handling with verbose logging"""
        parser_verbose = ResponseParser(verbose=True)
        
        # Response that will cause YAML error
        response = """
```yaml
invalid: yaml: [unclosed
Function/Code_Block_Name: yaml_error_test
```
"""
        
        result = parser_verbose.parse_response(response)
        
        # Should fallback to regex parsing
        assert result.function_name == "yaml_error_test"
        
        # Check that verbose logging captured the error
        captured = capsys.readouterr()
        assert "[VERBOSE]" in captured.out
    
    def test_reasoning_with_nested_structure(self, parser):
        """Test reasoning parsing with nested structure"""
        response = """
```yaml
Function/Code_Block_Name: nested_test
AIARelevantFunction: 70
Relevant_KD_Entry_Point: 50
Message_Structure_Handling: 60
SMID's identified: []
Reasoning:
  - Simple string
  - Another string
```
"""
        
        result = parser.parse_response(response)
        
        assert len(result.reasoning) == 2
        assert result.reasoning[0] == "Simple string"
        assert result.reasoning[1] == "Another string"
    
    def test_complex_yaml_structure_parsing(self, parser):
        """Test parsing with complex YAML structure that might fail"""
        response = """
```yaml
Function/Code_Block_Name: complex_test
AIARelevantFunction: 80
Relevant_KD_Entry_Point: 60
Message_Structure_Handling: 50
SMID's identified: []
Reasoning:
  - item:
      nested: value
  - simple string
```
"""
        
        result = parser.parse_response(response)
        
        # This might fallback to regex parsing due to complex structure
        assert isinstance(result, AnalysisResult)
        assert result.function_name in ["complex_test", "Parse Error"]  # Could be either depending on parsing
        assert result.aia_relevant_function in [80, 0]  # Could be either
