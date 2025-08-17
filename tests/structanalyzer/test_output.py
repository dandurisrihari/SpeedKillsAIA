"""
Simplified tests for src.structanalyzer.output module
"""
import pytest
import json
from src.structanalyzer.output import OutputFormatter, OutputManager
from src.structanalyzer.types import FieldInfo, StructureInfo, AnalysisResult, FieldType


class TestOutputFormatter:
    """Test OutputFormatter class"""
    
    @pytest.fixture
    def sample_result(self):
        """Create sample analysis result for testing"""
        struct = StructureInfo(name="TestStruct", found=True)
        
        return AnalysisResult(
            structure_name="TestStruct",
            file_path="/test.c",
            max_depth=1,
            analysis_complete=True,
            timestamp=1234567890.0,
            structures={"TestStruct": struct}
        )
    
    def test_formatter_creation(self):
        """Test creating OutputFormatter"""
        formatter = OutputFormatter()
        assert formatter is not None
    
    def test_format_text_report(self, sample_result):
        """Test formatting text report"""
        text_output = OutputFormatter.format_text_report(sample_result)
        
        assert isinstance(text_output, str)
        assert "TestStruct" in text_output
        assert "C Structure Analysis Report" in text_output
    
    def test_format_json(self, sample_result):
        """Test formatting JSON"""
        json_output = OutputFormatter.format_json(sample_result)
        
        assert isinstance(json_output, str)
        # Should be valid JSON
        parsed = json.loads(json_output)
        assert isinstance(parsed, dict)
    
    def test_format_csv(self, sample_result):
        """Test formatting CSV"""
        csv_output = OutputFormatter.format_csv(sample_result)
        
        assert isinstance(csv_output, str)
        # Should have CSV structure
        lines = csv_output.strip().split('\n')
        assert len(lines) >= 1  # At least header


class TestOutputManager:
    """Test OutputManager class"""
    
    def test_manager_creation(self):
        """Test creating OutputManager"""
        manager = OutputManager()
        assert manager is not None
    
    def test_save_result_text(self, tmp_path):
        """Test saving result as text"""
        manager = OutputManager()
        
        struct = StructureInfo(name="TestStruct", found=True)
        result = AnalysisResult(
            structure_name="TestStruct",
            file_path="/test.c",
            max_depth=1,
            analysis_complete=True,
            timestamp=1234567890.0,
            structures={"TestStruct": struct}
        )
        
        output_file = tmp_path / "output.txt"
        saved_path = manager.save_result(result, "text", str(output_file))
        
        assert output_file.exists()
        assert saved_path == str(output_file)
    
    def test_save_result_json(self, tmp_path):
        """Test saving result as JSON"""
        manager = OutputManager()
        
        struct = StructureInfo(name="TestStruct", found=True)
        result = AnalysisResult(
            structure_name="TestStruct",
            file_path="/test.c",
            max_depth=1,
            analysis_complete=True,
            timestamp=1234567890.0,
            structures={"TestStruct": struct}
        )
        
        output_file = tmp_path / "output.json"
        saved_path = manager.save_result(result, "json", str(output_file))
        
        assert output_file.exists()
        assert saved_path == str(output_file)
        
        # Verify it's valid JSON
        with open(output_file, 'r') as f:
            content = f.read()
            parsed = json.loads(content)
            assert isinstance(parsed, dict)
