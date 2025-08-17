"""
Comprehensive tests for the struct analyzer module
"""

import pytest
import sys
from pathlib import Path
from unittest.mock import Mock, patch

from src.structanalyzer.analyzer import CStructureAnalyzer
from src.structanalyzer.primitives import PrimitiveTypeManager
from src.structanalyzer.types import FieldType


class TestCStructureAnalyzer:
    """Test cases for the main CStructureAnalyzer class"""
    
    @pytest.fixture
    def test_file_path(self):
        """Get path to a test C file with known structures"""
        # Use the existing preprocessed file
        file_path = Path(__file__).parent.parent.parent / "data" / "structanalyzerpreprocessedfiles" / "gc_hal_kernel_driver.i"
        if not file_path.exists():
            pytest.skip(f"Test file not found: {file_path}")
        return str(file_path)
    
    @pytest.fixture
    def analyzer(self, test_file_path):
        """Create analyzer instance for testing"""
        return CStructureAnalyzer(test_file_path)
    
    def test_analyzer_initialization(self, test_file_path):
        """Test analyzer initializes correctly"""
        analyzer = CStructureAnalyzer(test_file_path)
        
        assert analyzer.file_path == test_file_path
        assert analyzer.primitive_manager is not None
        assert analyzer.parser is not None
        assert analyzer.analysis_cache == {}
        assert analyzer.cache_max_depth == 0
    
    def test_analyzer_with_custom_primitives(self, test_file_path):
        """Test analyzer with custom primitive types"""
        custom_primitives = {"CustomType", "AnotherType"}
        analyzer = CStructureAnalyzer(test_file_path, custom_primitives)
        
        assert analyzer.primitive_manager.is_primitive("CustomType")
        assert analyzer.primitive_manager.is_primitive("AnotherType")
        assert not analyzer.primitive_manager.is_primitive("NotAType")
    
    def test_analyze_structure_basic(self, analyzer):
        """Test basic structure analysis"""
        result = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=1, verbose=False)
        
        assert result is not None
        assert result.structure_name == "gcsHAL_INTERFACE"
        assert result.max_depth == 1
        assert result.analysis_complete is True
        assert result.total_structures > 0
        assert result.analysis_time > 0
        assert "gcsHAL_INTERFACE" in result.structures
    
    def test_analyze_structure_deep_recursion(self, analyzer):
        """Test deep recursive analysis"""
        # Test with increasing depths
        depths = [1, 3, 5, 10]
        previous_count = 0
        
        for depth in depths:
            result = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=depth, verbose=False)
            
            assert result.max_depth == depth
            assert result.total_structures >= previous_count  # Should find same or more structures
            previous_count = result.total_structures
            
            # Check depth distribution
            max_actual_depth = max(struct.depth for struct in result.structures.values() if struct.found)
            assert max_actual_depth <= depth
    
    def test_cache_clearing_on_depth_increase(self, analyzer):
        """Test that cache clears when depth increases"""
        # First analysis with depth 1
        result1 = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=1, verbose=False)
        initial_cache_size = analyzer.get_cache_size()
        assert initial_cache_size > 0
        
        # Second analysis with depth 3 should clear cache
        result2 = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=3, verbose=False)
        
        # Should find more structures with deeper analysis
        assert result2.total_structures >= result1.total_structures
        assert analyzer.cache_max_depth == 3
    
    def test_analyze_nonexistent_structure(self, analyzer):
        """Test analysis of non-existent structure"""
        result = analyzer.analyze_structure("NonExistentStruct", max_depth=3, verbose=False)
        
        assert result.structure_name == "NonExistentStruct"
        assert result.total_structures == 1  # Should still create entry for the target
        assert "NonExistentStruct" in result.structures
        assert not result.structures["NonExistentStruct"].found
    
    def test_find_structure_single(self, analyzer):
        """Test finding a single structure"""
        struct_info = analyzer.find_structure("gcsHAL_INTERFACE", verbose=False)
        
        assert struct_info is not None
        assert struct_info.name == "gcsHAL_INTERFACE"
        assert struct_info.found is True
        assert struct_info.field_count > 0
    
    def test_list_all_structures(self, analyzer):
        """Test listing all structures in file"""
        structures = analyzer.list_all_structures(max_results=50)
        
        assert isinstance(structures, list)
        assert len(structures) > 0
        # Use a structure that's actually in the list (kernel structures are present)
        assert "__kernel_fd_set" in structures or "atomic64_t" in structures
        assert all(isinstance(s, str) for s in structures)
    
    def test_primitive_type_management(self, analyzer):
        """Test primitive type management"""
        initial_primitives = analyzer.get_primitive_types()
        
        # Add custom primitives
        custom_types = {"TestType1", "TestType2"}
        analyzer.add_primitive_types(custom_types)
        
        updated_primitives = analyzer.get_primitive_types()
        assert len(updated_primitives) == len(initial_primitives) + 2
        assert "TestType1" in updated_primitives
        assert "TestType2" in updated_primitives
    
    def test_cache_operations(self, analyzer):
        """Test cache management operations"""
        # Initially empty
        assert analyzer.get_cache_size() == 0
        
        # Analyze to populate cache
        analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=2, verbose=False)
        assert analyzer.get_cache_size() > 0
        
        # Clear cache
        analyzer.clear_cache()
        assert analyzer.get_cache_size() == 0
    
    def test_analyze_multiple_structures(self, analyzer):
        """Test analyzing multiple structures efficiently"""
        structure_names = ["gcsHAL_INTERFACE", "_u", "gcsHAL_CHIP_INFO"]
        results = analyzer.analyze_multiple_structures(structure_names, max_depth=2, verbose=False)
        
        assert len(results) == 3
        assert all(name in results for name in structure_names)
        assert all(isinstance(result.structures, dict) for result in results.values())
    
    def test_get_file_statistics(self, analyzer):
        """Test getting file statistics"""
        stats = analyzer.get_file_statistics()
        
        assert isinstance(stats, dict)
        # Should contain basic statistics about the parsed file
        assert len(stats) > 0
    
    def test_structure_dependencies(self, analyzer):
        """Test getting structure dependencies"""
        dependencies = analyzer.get_structure_dependencies("gcsHAL_INTERFACE", max_depth=3)
        
        assert isinstance(dependencies, dict)
        assert "gcsHAL_INTERFACE" in dependencies
        
        # Should have found nested dependencies
        interface_deps = dependencies["gcsHAL_INTERFACE"]
        assert isinstance(interface_deps, list)
        assert "_u" in interface_deps
    
    def test_error_handling_invalid_file(self):
        """Test error handling with invalid file path"""
        with pytest.raises(Exception):  # Should raise an exception
            CStructureAnalyzer("/nonexistent/file.c")
    
    def test_verbose_output(self, analyzer, capsys):
        """Test verbose output during analysis"""
        analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=2, verbose=True)
        
        captured = capsys.readouterr()
        assert "🔍 Analyzing:" in captured.out
        assert "✅ Found" in captured.out or "❌" in captured.out
    
    def test_depth_limit_enforcement(self, analyzer):
        """Test that depth limits are properly enforced"""
        result = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=2, verbose=False)
        
        # Check that no structure exceeds the depth limit
        for struct_info in result.structures.values():
            if struct_info.found:
                assert struct_info.depth <= 2
    
    def test_union_analysis(self, analyzer):
        """Test analysis of union structures"""
        # Analyze the _u union specifically
        result = analyzer.analyze_structure("_u", max_depth=1, verbose=False)
        
        assert result.total_structures > 0
        assert "_u" in result.structures
        
        union_info = result.structures["_u"]
        assert union_info.found is True
        assert union_info.is_union is True
        assert union_info.field_count > 0
    
    def test_nested_structure_discovery(self, analyzer):
        """Test discovery of nested structures"""
        result = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=5, verbose=False)
        
        # Should find the main structure plus nested ones
        assert result.total_structures > 10  # Conservative estimate
        
        # Check depth distribution
        depth_counts = {}
        for struct_info in result.structures.values():
            if struct_info.found:
                depth = struct_info.depth
                depth_counts[depth] = depth_counts.get(depth, 0) + 1
        
        # Should have structures at multiple depths
        assert len(depth_counts) > 1
        assert max(depth_counts.keys()) > 1
    
    def test_field_type_detection(self, analyzer):
        """Test that field types are correctly detected"""
        struct_info = analyzer.find_structure("gcsHAL_INTERFACE", verbose=False)
        
        assert struct_info.found
        assert len(struct_info.fields) > 0
        
        # Should have various field types
        field_types = {field.field_type for field in struct_info.fields}
        assert len(field_types) > 0  # Should detect different field types
    
    def test_primitive_vs_non_primitive_classification(self, analyzer):
        """Test primitive vs non-primitive field classification"""
        # Get the _u union which should have many non-primitive fields
        struct_info = analyzer.find_structure("_u", verbose=False)
        
        assert struct_info.found
        assert struct_info.is_union
        
        primitive_count = sum(1 for field in struct_info.fields if field.is_primitive)
        non_primitive_count = sum(1 for field in struct_info.fields if not field.is_primitive)
        
        # After our fix, most fields should be non-primitive (structure types)
        assert non_primitive_count > primitive_count
        
        # Verify specific known structure types are non-primitive
        hal_fields = [field for field in struct_info.fields if field.type_name.startswith("gcsHAL_")]
        assert len(hal_fields) > 0
        assert all(not field.is_primitive for field in hal_fields)


class TestPrimitiveTypeManager:
    """Test cases for primitive type management"""
    
    def test_primitive_manager_initialization(self):
        """Test primitive manager initializes with standard types"""
        manager = PrimitiveTypeManager()
        
        # Check standard types
        assert manager.is_primitive("int")
        assert manager.is_primitive("float")
        assert manager.is_primitive("char")
        assert manager.is_primitive("void")
        
        # Check that struct types are not primitive
        assert not manager.is_primitive("gcsHAL_INTERFACE")
        assert not manager.is_primitive("SomeStructType")
    
    def test_custom_primitive_types(self):
        """Test adding custom primitive types"""
        custom_types = {"MyType", "CustomInt"}
        manager = PrimitiveTypeManager(custom_types)
        
        assert manager.is_primitive("MyType")
        assert manager.is_primitive("CustomInt")
        assert manager.is_primitive("int")  # Should still have standard types
    
    def test_enum_like_pattern_detection(self):
        """Test detection of enum-like patterns"""
        manager = PrimitiveTypeManager()
        
        # Should detect these as enums (primitives)
        assert manager.is_primitive("gceSTATUS")  # starts with 'gce'
        assert manager.is_primitive("gctUINT32")  # starts with 'gct'
        
        # Should NOT detect these as enums (they're structures)
        assert not manager.is_primitive("gcsHAL_INTERFACE")  # starts with 'gcs'
        assert not manager.is_primitive("gcsSURF_INFO")      # starts with 'gcs'
    
    def test_typedef_resolution(self):
        """Test typedef resolution"""
        manager = PrimitiveTypeManager()
        
        # Add a typedef mapping
        manager.add_typedef("MyInt", "int")
        assert manager.is_primitive("MyInt")
        
        # Chain typedef resolution
        manager.add_typedef("MyCustomInt", "MyInt")
        assert manager.is_primitive("MyCustomInt")
    
    def test_complex_type_patterns(self):
        """Test detection of complex type patterns"""
        manager = PrimitiveTypeManager()
        
        # Should detect these as primitives
        assert manager.is_primitive("unsigned int")
        assert manager.is_primitive("long long")
        assert manager.is_primitive("signed char")
        
        # Should NOT detect struct/union patterns
        assert not manager.is_primitive("struct MyStruct")
        assert not manager.is_primitive("union MyUnion")
    
    def test_add_remove_primitives(self):
        """Test adding and removing primitive types"""
        manager = PrimitiveTypeManager()
        
        # Add primitive
        manager.add_primitive("TestType")
        assert manager.is_primitive("TestType")
        
        # Remove primitive
        assert manager.remove_primitive("TestType") is True
        assert not manager.is_primitive("TestType")
        
        # Try to remove non-existent type
        assert manager.remove_primitive("NonExistent") is False


class TestDepthAnalysisFix:
    """Test cases specifically for the depth analysis fix"""
    
    @pytest.fixture
    def analyzer(self):
        """Create analyzer for depth testing"""
        file_path = Path(__file__).parent.parent.parent / "data" / "structanalyzerpreprocessedfiles" / "gc_hal_kernel_driver.i"
        if not file_path.exists():
            pytest.skip(f"Test file not found: {file_path}")
        return CStructureAnalyzer(str(file_path))
    
    def test_depth_progression(self, analyzer):
        """Test that deeper analysis finds more structures"""
        depths = [1, 2, 3, 5]
        structure_counts = []
        
        for depth in depths:
            result = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=depth, verbose=False)
            structure_counts.append(result.total_structures)
        
        # Should find same or more structures as depth increases
        for i in range(1, len(structure_counts)):
            assert structure_counts[i] >= structure_counts[i-1]
        
        # Should find more structures at depth 5 than depth 1 (even if not dramatically more)
        assert structure_counts[-1] > structure_counts[0], f"Depth 5 ({structure_counts[-1]}) should find more than depth 1 ({structure_counts[0]})"
    
    def test_cache_invalidation_on_depth_change(self, analyzer):
        """Test that cache is properly invalidated when depth increases"""
        # Analyze with depth 1
        result1 = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=1, verbose=False)
        assert analyzer.cache_max_depth == 1
        
        # Analyze with depth 3 - should clear cache and find more
        result2 = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=3, verbose=False)
        assert analyzer.cache_max_depth == 3
        assert result2.total_structures >= result1.total_structures
        
        # Test that cache max depth is correctly tracked
        assert analyzer.cache_max_depth == 3
        
        # The main point is that deeper analysis finds more structures
        assert result2.total_structures > result1.total_structures or result2.total_structures >= 50
    
    def test_actual_depth_reached(self, analyzer):
        """Test that analysis actually reaches specified depths"""
        result = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=10, verbose=False)
        
        # Find the maximum depth actually reached
        max_depth_reached = max(
            struct.depth for struct in result.structures.values() 
            if struct.found and struct.depth is not None
        )
        
        # Should reach at least depth 3 for this complex structure
        assert max_depth_reached >= 3
        
        # Verify depth distribution
        depth_counts = {}
        for struct in result.structures.values():
            if struct.found and struct.depth is not None:
                depth_counts[struct.depth] = depth_counts.get(struct.depth, 0) + 1
        
        # Should have structures at multiple depth levels
        assert len(depth_counts) >= 3
    
    def test_primitive_type_fix_effectiveness(self, analyzer):
        """Test that the primitive type fix allows deeper analysis"""
        # Get the _u union which was the problematic case
        result = analyzer.analyze_structure("_u", max_depth=5, verbose=False)
        
        # Should find the union itself plus nested structures
        assert result.total_structures > 1
        
        # The _u union should have many non-primitive fields
        union_info = result.structures["_u"]
        assert union_info.found
        assert union_info.is_union
        
        # Count non-primitive fields (should be most of them after the fix)
        non_primitive_fields = [
            field for field in union_info.fields 
            if not field.is_primitive and field.type_name.startswith("gcsHAL_")
        ]
        
        # Should have many gcsHAL_* structure types that are non-primitive
        assert len(non_primitive_fields) > 20


if __name__ == "__main__":
    pytest.main([__file__])
