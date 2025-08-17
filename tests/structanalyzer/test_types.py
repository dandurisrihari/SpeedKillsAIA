"""
Tests for src.structanalyzer.types module
"""
import pytest
from datetime import datetime
from src.structanalyzer.types import FieldType, FieldInfo, StructureInfo, AnalysisResult


class TestFieldType:
    """Test FieldType enum"""
    
    def test_field_type_values(self):
        """Test FieldType enum values"""
        assert FieldType.PRIMITIVE.value == 1
        assert FieldType.STRUCT.value == 2
        assert FieldType.UNION.value == 3
        assert FieldType.ARRAY.value == 4
        assert FieldType.POINTER.value == 5
        assert FieldType.FUNCTION_POINTER.value == 6
        assert FieldType.ENUM.value == 7
    
    def test_field_type_names(self):
        """Test FieldType enum names"""
        assert FieldType.PRIMITIVE.name == "PRIMITIVE"
        assert FieldType.STRUCT.name == "STRUCT"
        assert FieldType.UNION.name == "UNION"
        assert FieldType.ARRAY.name == "ARRAY"
        assert FieldType.POINTER.name == "POINTER"
        assert FieldType.FUNCTION_POINTER.name == "FUNCTION_POINTER"
        assert FieldType.ENUM.name == "ENUM"


class TestFieldInfo:
    """Test FieldInfo dataclass"""
    
    def test_field_info_creation(self):
        """Test creating FieldInfo"""
        field = FieldInfo(
            name="test_field",
            type_name="int",
            field_type=FieldType.PRIMITIVE
        )
        
        assert field.name == "test_field"
        assert field.type_name == "int"
        assert field.field_type == FieldType.PRIMITIVE
        assert field.line_number == 0  # Default value
        assert field.is_primitive is False  # Default value
        assert field.size_bytes is None  # Default value
        assert field.array_size is None  # Default value
        assert field.pointer_depth == 0  # Default value
    
    def test_field_info_frozen(self):
        """Test that FieldInfo is frozen"""
        field = FieldInfo(
            name="test_field",
            type_name="int",
            field_type=FieldType.PRIMITIVE
        )
        
        # Should not be able to modify frozen dataclass
        with pytest.raises(Exception):  # FrozenInstanceError
            field.name = "modified_name"
    
    def test_field_info_array(self):
        """Test FieldInfo for array types"""
        field = FieldInfo(
            name="arr",
            type_name="int[10]",
            field_type=FieldType.ARRAY,
            array_size=10
        )
        
        assert field.field_type == FieldType.ARRAY
        assert field.array_size == 10
    
    def test_field_info_pointer(self):
        """Test FieldInfo for pointer types"""
        field = FieldInfo(
            name="ptr",
            type_name="int*",
            field_type=FieldType.POINTER,
            pointer_depth=1
        )
        
        assert field.field_type == FieldType.POINTER
        assert field.pointer_depth == 1


class TestStructureInfo:
    """Test StructureInfo dataclass"""
    
    def test_structure_info_creation(self):
        """Test creating StructureInfo"""
        struct = StructureInfo(name="TestStruct", found=True)
        
        assert struct.name == "TestStruct"
        assert struct.found is True
        assert struct.is_union is False  # Default value
        assert struct.fields == []  # Should be initialized by __post_init__
        assert struct.field_count == 0  # Default value
        assert struct.nested_structures == []  # Should be initialized by __post_init__
        assert struct.errors == []  # Should be initialized by __post_init__
        assert struct.size_info == {}  # Should be initialized by __post_init__
    
    def test_structure_info_with_fields(self):
        """Test StructureInfo with fields"""
        fields = [
            FieldInfo(name="x", type_name="int", field_type=FieldType.PRIMITIVE),
            FieldInfo(name="y", type_name="float", field_type=FieldType.PRIMITIVE)
        ]
        
        struct = StructureInfo(
            name="Point",
            found=True,
            fields=fields,
            field_count=2
        )
        
        assert len(struct.fields) == 2
        assert struct.field_count == 2
        assert struct.fields[0].name == "x"
        assert struct.fields[1].name == "y"
    
    def test_structure_info_union(self):
        """Test StructureInfo for union"""
        struct = StructureInfo(
            name="TestUnion",
            found=True,
            is_union=True
        )
        
        assert struct.is_union is True
        assert "union" in str(struct)


class TestAnalysisResult:
    """Test AnalysisResult dataclass"""
    
    def test_analysis_result_creation(self):
        """Test creating AnalysisResult"""
        timestamp = 1234567890.0
        result = AnalysisResult(
            structure_name="TestStruct",
            file_path="/test/path.c",
            max_depth=3,
            analysis_complete=True,
            timestamp=timestamp,
            structures={}
        )
        
        assert result.structure_name == "TestStruct"
        assert result.file_path == "/test/path.c"
        assert result.max_depth == 3
        assert result.analysis_complete is True
        assert result.timestamp == timestamp
        assert result.structures == {}
        assert result.total_structures == 0  # Should be set by __post_init__
        assert result.errors == []  # Should be initialized by __post_init__
        assert result.warnings == []  # Should be initialized by __post_init__
    
    def test_analysis_result_with_structures(self):
        """Test AnalysisResult with structures"""
        struct1 = StructureInfo(name="Struct1", found=True)
        struct2 = StructureInfo(name="Struct2", found=True)
        
        structures = {
            "Struct1": struct1,
            "Struct2": struct2
        }
        
        result = AnalysisResult(
            structure_name="Struct1",
            file_path="/test/path.c",
            max_depth=2,
            analysis_complete=True,
            timestamp=1234567890.0,
            structures=structures
        )
        
        assert len(result.structures) == 2
        assert result.total_structures == 2  # Should be updated by __post_init__
    
    def test_analysis_result_get_main_structure(self):
        """Test getting main structure from AnalysisResult"""
        main_struct = StructureInfo(name="MainStruct", found=True)
        other_struct = StructureInfo(name="OtherStruct", found=True)
        
        structures = {
            "MainStruct": main_struct,
            "OtherStruct": other_struct
        }
        
        result = AnalysisResult(
            structure_name="MainStruct",
            file_path="/test/path.c",
            max_depth=2,
            analysis_complete=True,
            timestamp=1234567890.0,
            structures=structures
        )
        
        main = result.get_main_structure()
        assert main is not None
        assert main.name == "MainStruct"
    
    def test_analysis_result_success_property(self):
        """Test success property of AnalysisResult"""
        # Successful result
        result_success = AnalysisResult(
            structure_name="Test",
            file_path="/test.c",
            max_depth=1,
            analysis_complete=True,
            timestamp=1234567890.0,
            structures={}
        )
        
        assert result_success.success is True
        
        # Failed result with errors
        result_fail = AnalysisResult(
            structure_name="Test",
            file_path="/test.c", 
            max_depth=1,
            analysis_complete=True,
            timestamp=1234567890.0,
            structures={},
            errors=["Some error"]
        )
        
        assert result_fail.success is False
    
    def test_analysis_result_get_statistics(self):
        """Test getting statistics from AnalysisResult"""
        fields = [
            FieldInfo(name="x", type_name="int", field_type=FieldType.PRIMITIVE),
            FieldInfo(name="y", type_name="float", field_type=FieldType.PRIMITIVE)
        ]
        
        struct = StructureInfo(
            name="TestStruct",
            found=True,
            fields=fields,
            field_count=2,
            primitive_count=2
        )
        
        structures = {"TestStruct": struct}
        
        result = AnalysisResult(
            structure_name="TestStruct",
            file_path="/test.c",
            max_depth=1,
            analysis_complete=True,
            timestamp=1234567890.0,
            structures=structures
        )
        
        stats = result.get_statistics()
        
        assert stats["total_structures"] == 1
        assert stats["total_fields"] == 2
        assert stats["total_primitives"] == 2
        assert stats["max_depth"] == 1
        assert "success_rate" in stats
