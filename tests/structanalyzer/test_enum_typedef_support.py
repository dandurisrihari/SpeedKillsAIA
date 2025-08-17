"""
Test enum and typedef support in structanalyzer
"""

import pytest
from pathlib import Path
from src.structanalyzer.analyzer import CStructureAnalyzer
from src.structanalyzer.types import AnalysisResult, EnumInfo, TypedefInfo


class TestEnumSupport:
    """Test cases for enum definition extraction and inclusion"""
    
    @pytest.fixture
    def test_file_path(self):
        """Get path to a test C file with known enums"""
        # Use the existing preprocessed file
        file_path = Path(__file__).parent.parent.parent / "data" / "structanalyzerpreprocessedfiles" / "gc_hal_kernel_driver.i"
        if not file_path.exists():
            pytest.skip(f"Test file not found: {file_path}")
        return str(file_path)
    
    @pytest.fixture
    def analyzer(self, test_file_path):
        """Create analyzer instance for testing"""
        return CStructureAnalyzer(test_file_path)
    
    def test_enum_detection(self, analyzer):
        """Test that enums are detected and collected"""
        result = analyzer.analyze_structure("_gcsHAL_INTERFACE", max_depth=2, verbose=False)
        
        assert isinstance(result.enums, dict)
        assert len(result.enums) > 0
        
        # Should find gceHAL_COMMAND_CODES enum
        assert "gceHAL_COMMAND_CODES" in result.enums
        hal_command_enum = result.enums["gceHAL_COMMAND_CODES"]
        assert hal_command_enum.found
        assert len(hal_command_enum.values) > 0
        assert "gcvHAL_CHIP_INFO" in hal_command_enum.values
        
    def test_enum_info_structure(self, analyzer):
        """Test EnumInfo data structure completeness"""
        result = analyzer.analyze_structure("_gcsHAL_INTERFACE", max_depth=2, verbose=False)
        
        for enum_name, enum_info in result.enums.items():
            assert isinstance(enum_info, EnumInfo)
            assert enum_info.name == enum_name
            assert isinstance(enum_info.values, list)
            assert isinstance(enum_info.found, bool)
            
            if enum_info.found:
                assert len(enum_info.values) > 0
                assert enum_info.start_line > 0
                assert enum_info.end_line >= enum_info.start_line
                assert enum_info.definition is not None
            else:
                assert enum_info.error is not None
    
    def test_multiple_enums_found(self, analyzer):
        """Test that multiple different enums are found"""
        result = analyzer.analyze_structure("_gcsHAL_INTERFACE", max_depth=3, verbose=False)
        
        # Should find several enums
        expected_enums = [
            "gceHAL_COMMAND_CODES",
            "gceSTATUS", 
            "gceENGINE",
            "gceSECURE_MODE"
        ]
        
        found_enums = [name for name, info in result.enums.items() if info.found]
        
        for expected in expected_enums:
            assert expected in found_enums, f"Expected to find enum {expected}"
    
    def test_enum_values_extraction(self, analyzer):
        """Test that enum values are correctly extracted"""
        result = analyzer.analyze_structure("_gcsHAL_INTERFACE", max_depth=2, verbose=False)
        
        # Check gceHAL_COMMAND_CODES specifically
        if "gceHAL_COMMAND_CODES" in result.enums:
            enum_info = result.enums["gceHAL_COMMAND_CODES"]
            assert enum_info.found
            
            # Should contain expected values
            expected_values = ["gcvHAL_CHIP_INFO", "gcvHAL_VERSION"]
            for value in expected_values:
                assert value in enum_info.values, f"Expected enum value {value} not found"


class TestTypedefSupport:
    """Test cases for typedef definition extraction and inclusion"""
    
    @pytest.fixture
    def test_file_path(self):
        """Get path to a test C file with known typedefs"""
        file_path = Path(__file__).parent.parent.parent / "data" / "structanalyzerpreprocessedfiles" / "gc_hal_kernel_driver.i"
        if not file_path.exists():
            pytest.skip(f"Test file not found: {file_path}")
        return str(file_path)
    
    @pytest.fixture
    def analyzer(self, test_file_path):
        """Create analyzer instance for testing"""
        return CStructureAnalyzer(test_file_path)
    
    def test_typedef_detection(self, analyzer):
        """Test that typedefs are detected and collected"""
        result = analyzer.analyze_structure("_gcsHAL_INTERFACE", max_depth=2, verbose=False)
        
        assert isinstance(result.typedefs, dict)
        assert len(result.typedefs) > 0
        
        # Should find basic GPU types
        expected_typedefs = [
            "gctUINT32",
            "gctUINT",
            "gctBOOL",
            "gctUINT64"
        ]
        
        for typedef_name in expected_typedefs:
            assert typedef_name in result.typedefs, f"Expected typedef {typedef_name} not found"
    
    def test_typedef_info_structure(self, analyzer):
        """Test TypedefInfo data structure completeness"""
        result = analyzer.analyze_structure("_gcsHAL_INTERFACE", max_depth=2, verbose=False)
        
        for typedef_name, typedef_info in result.typedefs.items():
            assert isinstance(typedef_info, TypedefInfo)
            assert typedef_info.name == typedef_name
            assert typedef_info.underlying_type is not None
            assert isinstance(typedef_info.found, bool)
            assert isinstance(typedef_info.is_primitive, bool)
            
            if typedef_info.found:
                assert typedef_info.definition is not None
                assert f"typedef {typedef_info.underlying_type} {typedef_name};" in typedef_info.definition
    
    def test_specific_typedef_mappings(self, analyzer):
        """Test specific typedef mappings are correct"""
        result = analyzer.analyze_structure("_gcsHAL_INTERFACE", max_depth=2, verbose=False)
        
        # Test specific mappings we know should exist
        expected_mappings = {
            "gctUINT32": "unsigned int",
            "gctUINT": "unsigned int", 
            "gctBOOL": "int",
            "gctUINT8": "unsigned char",
            "gctUINT16": "unsigned short",
            "gctINT32": "signed int"
        }
        
        for typedef_name, expected_underlying in expected_mappings.items():
            if typedef_name in result.typedefs:
                typedef_info = result.typedefs[typedef_name]
                assert typedef_info.underlying_type == expected_underlying, \
                    f"Expected {typedef_name} -> {expected_underlying}, got {typedef_info.underlying_type}"
    
    def test_primitive_classification(self, analyzer):
        """Test that primitive types are correctly classified"""
        result = analyzer.analyze_structure("_gcsHAL_INTERFACE", max_depth=2, verbose=False)
        
        # These should be classified as primitive
        primitive_typedefs = ["gctUINT32", "gctBOOL", "gctUINT8", "gctINT"]
        
        for typedef_name in primitive_typedefs:
            if typedef_name in result.typedefs:
                typedef_info = result.typedefs[typedef_name]
                assert typedef_info.is_primitive, f"{typedef_name} should be classified as primitive"


class TestOutputIntegration:
    """Test that enums and typedefs are properly included in output"""
    
    @pytest.fixture
    def test_file_path(self):
        """Get path to a test C file"""
        file_path = Path(__file__).parent.parent.parent / "data" / "structanalyzerpreprocessedfiles" / "gc_hal_kernel_driver.i"
        if not file_path.exists():
            pytest.skip(f"Test file not found: {file_path}")
        return str(file_path)
    
    @pytest.fixture
    def analyzer(self, test_file_path):
        """Create analyzer instance for testing"""
        return CStructureAnalyzer(test_file_path)
    
    def test_c_header_includes_typedefs(self, analyzer):
        """Test that C header output includes typedef definitions"""
        from src.structanalyzer.output import OutputFormatter
        
        result = analyzer.analyze_structure("_gcsHAL_INTERFACE", max_depth=2, verbose=False)
        header_content = OutputFormatter.format_c_header(result)
        
        # Should include basic type definitions section
        assert "/* Basic type definitions */" in header_content
        
        # Should include specific typedefs
        assert "typedef unsigned int gctUINT32;" in header_content
        assert "typedef int gctBOOL;" in header_content
        assert "typedef unsigned char gctUINT8;" in header_content
    
    def test_c_header_includes_enums(self, analyzer):
        """Test that C header output includes enum definitions"""
        from src.structanalyzer.output import OutputFormatter
        
        result = analyzer.analyze_structure("_gcsHAL_INTERFACE", max_depth=2, verbose=False)
        header_content = OutputFormatter.format_c_header(result)
        
        # Should include enum definitions section
        assert "/* Enum definitions */" in header_content
        
        # Should include specific enums
        assert "gceHAL_COMMAND_CODES" in header_content
        assert "gcvHAL_CHIP_INFO" in header_content
    
    def test_output_file_completeness(self, analyzer, tmp_path):
        """Test that output file contains both typedefs and enums"""
        from src.structanalyzer.output import OutputManager
        
        result = analyzer.analyze_structure("_gcsHAL_INTERFACE", max_depth=2, verbose=False)
        
        output_file = tmp_path / "test_output.h"
        manager = OutputManager()
        saved_path = manager.save_result(result, "c", str(output_file))
        
        # Read the generated file
        content = output_file.read_text()
        
        # Verify structure
        assert "#ifndef _ANALYZED_STRUCTURES_H_" in content
        assert "/* Basic type definitions */" in content
        assert "/* Enum definitions */" in content
        assert "/* Structure definitions */" in content
        
        # Verify typedefs are present
        assert "typedef unsigned int gctUINT32;" in content
        assert "typedef int gctBOOL;" in content
        
        # Verify enums are present
        assert "gceHAL_COMMAND_CODES" in content
        
        # Verify main structure is present
        assert "struct _gcsHAL_INTERFACE {" in content


class TestEdgeCases:
    """Test edge cases and error handling"""
    
    def test_missing_enum_handling(self):
        """Test handling of missing enum definitions"""
        # Create a simple test case that doesn't need the full file
        from src.structanalyzer.types import EnumInfo
        
        # Test missing enum placeholder
        missing_enum = EnumInfo(
            name="MissingEnum",
            values=[],
            found=False,
            error="Enum definition not found"
        )
        
        assert not missing_enum.found
        assert missing_enum.error is not None
        assert len(missing_enum.values) == 0
    
    def test_typedef_chain_resolution(self):
        """Test that typedef chains are handled correctly"""
        # This tests the case where typedef A -> typedef B -> primitive
        from src.structanalyzer.types import TypedefInfo
        
        # Example: gctADDRESS -> gctUINT64 -> unsigned long long
        addr_typedef = TypedefInfo(
            name="gctADDRESS",
            underlying_type="gctUINT64",
            found=True,
            definition="typedef gctUINT64 gctADDRESS;",
            is_primitive=False  # Not directly primitive
        )
        
        assert addr_typedef.found
        assert addr_typedef.underlying_type == "gctUINT64"
        assert not addr_typedef.is_primitive  # Chain to another typedef


if __name__ == "__main__":
    pytest.main([__file__])
