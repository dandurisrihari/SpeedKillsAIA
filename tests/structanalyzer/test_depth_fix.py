"""
Test the depth analysis fix for the struct analyzer
"""

import pytest
import sys
from pathlib import Path

from src.structanalyzer.analyzer import CStructureAnalyzer


class TestDepthAnalysisFix:
    """Test cases specifically for the depth analysis fix"""
    
    @pytest.fixture
    def test_file(self):
        """Get the test file path"""
        file_path = Path(__file__).parent.parent.parent / "data" / "structanalyzerpreprocessedfiles" / "gc_hal_kernel_driver.i"
        if not file_path.exists():
            pytest.skip(f"Test file not found: {file_path}")
        return str(file_path)
    
    @pytest.fixture
    def analyzer(self, test_file):
        """Create analyzer instance"""
        return CStructureAnalyzer(test_file)
    
    def test_depth_progression_fixed(self, analyzer):
        """Test that increasing depth finds more structures (the main fix)"""
        # Test with various depths
        depths_and_expected_min_structures = [
            (1, 3),    # Shallow: should find at least 3 structures
            (3, 30),   # Medium: should find at least 30 structures  
            (5, 50),   # Deep: should find at least 50 structures
        ]
        
        previous_count = 0
        
        for depth, min_expected in depths_and_expected_min_structures:
            result = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=depth, verbose=False)
            
            # Verify basic result properties
            assert result.structure_name == "gcsHAL_INTERFACE"
            assert result.max_depth == depth
            assert result.analysis_complete is True
            
            # Main test: should find minimum expected structures
            assert result.total_structures >= min_expected, f"At depth {depth}, expected at least {min_expected} structures, got {result.total_structures}"
            
            # Should find same or more as depth increases
            assert result.total_structures >= previous_count, f"At depth {depth}, found {result.total_structures} structures, less than previous depth's {previous_count}"
            
            previous_count = result.total_structures
    
    def test_cache_clearing_mechanism(self, analyzer):
        """Test that cache clearing works when depth increases"""
        # Analyze with shallow depth
        result1 = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=1, verbose=False)
        shallow_count = result1.total_structures
        
        # Verify cache was populated
        assert analyzer.get_cache_size() > 0
        assert analyzer.cache_max_depth == 1
        
        # Analyze with deeper depth - should clear cache and find more
        result2 = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=5, verbose=False)
        deep_count = result2.total_structures
        
        # Verify cache was updated
        assert analyzer.cache_max_depth == 5
        
        # Should find more structures (even if not dramatically more)
        assert deep_count > shallow_count, f"Deep analysis ({deep_count}) should find more than shallow ({shallow_count})"
    
    def test_primitive_type_classification_fix(self, analyzer):
        """Test that gcsHAL_* types are correctly classified as non-primitive"""
        # Get the _u union which contains many gcsHAL_* types
        union_info = analyzer.find_structure("_u", verbose=False)
        
        assert union_info.found, "Should find the _u union"
        assert union_info.is_union, "Should be identified as a union"
        
        # Count gcsHAL_* types that should be non-primitive
        hal_types = [field for field in union_info.fields if field.type_name.startswith("gcsHAL_")]
        non_primitive_hal_types = [field for field in hal_types if not field.is_primitive]
        
        # After the fix, ALL gcsHAL_* types should be non-primitive
        assert len(hal_types) > 20, f"Should find many gcsHAL_ types, found {len(hal_types)}"
        assert len(non_primitive_hal_types) == len(hal_types), f"All {len(hal_types)} gcsHAL_ types should be non-primitive, but {len(non_primitive_hal_types)} are"
    
    def test_actual_depth_reached(self, analyzer):
        """Test that deep analysis actually reaches the specified depths"""
        result = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=10, verbose=False)
        
        # Find actual depth distribution
        depth_counts = {}
        max_depth_reached = 0
        
        for struct_info in result.structures.values():
            if struct_info.found and struct_info.depth is not None:
                depth = struct_info.depth
                depth_counts[depth] = depth_counts.get(depth, 0) + 1
                max_depth_reached = max(max_depth_reached, depth)
        
        # Should reach at least depth 3
        assert max_depth_reached >= 3, f"Should reach at least depth 3, only reached {max_depth_reached}"
        
        # Should have structures at multiple depth levels
        assert len(depth_counts) >= 3, f"Should have structures at multiple depths, got {list(depth_counts.keys())}"
        
        # Should have structures at depths 0, 1, 2, and deeper
        assert 0 in depth_counts, "Should have root structure at depth 0"
        assert 1 in depth_counts, "Should have structures at depth 1" 
        assert 2 in depth_counts, "Should have structures at depth 2"
    
    def test_recursive_analysis_effectiveness(self, analyzer):
        """Test that recursive analysis actually finds nested structures"""
        # Analyze with sufficient depth
        result = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=5, verbose=False)
        
        # Should find the main structure
        assert "gcsHAL_INTERFACE" in result.structures
        main_struct = result.structures["gcsHAL_INTERFACE"]
        assert main_struct.found
        assert main_struct.depth == 0
        
        # Should find the _u union at depth 1
        assert "_u" in result.structures
        union_struct = result.structures["_u"]
        assert union_struct.found
        assert union_struct.is_union
        assert union_struct.depth == 1
        
        # Should find nested HAL structures at depth 2
        hal_structures_depth_2 = [
            name for name, struct in result.structures.items()
            if struct.found and struct.depth == 2 and name.startswith("gcsHAL_")
        ]
        assert len(hal_structures_depth_2) > 10, f"Should find many HAL structures at depth 2, found {len(hal_structures_depth_2)}"
        
        # Should find some structures at depth 3+
        deep_structures = [
            name for name, struct in result.structures.items()
            if struct.found and struct.depth >= 3
        ]
        assert len(deep_structures) > 0, "Should find some structures at depth 3 or deeper"
    
    def test_no_infinite_recursion(self, analyzer):
        """Test that analysis doesn't get stuck in infinite loops"""
        import time
        
        start_time = time.time()
        
        # Run analysis with high depth - should complete in reasonable time
        result = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=20, verbose=False)
        
        elapsed_time = time.time() - start_time
        
        # Should complete within 30 seconds (reasonable for large structure)
        assert elapsed_time < 30, f"Analysis took too long: {elapsed_time:.2f} seconds"
        
        # Should still find structures
        assert result.total_structures > 0
        assert result.analysis_complete


def test_main_depth_issue_reproduction():
    """Reproduction test for the original depth issue reported by user"""
    # This test reproduces the exact issue: depth 100 only analyzing to depth 1
    
    file_path = Path(__file__).parent.parent.parent / "data" / "structanalyzerpreprocessedfiles" / "gc_hal_kernel_driver.i"
    if not file_path.exists():
        pytest.skip(f"Test file not found: {file_path}")
    
    analyzer = CStructureAnalyzer(str(file_path))
    
    # The original issue: --depth 100 only analyzed to depth 1
    result = analyzer.analyze_structure("gcsHAL_INTERFACE", max_depth=100, verbose=False)
    
    # Find actual max depth reached
    max_depth_reached = max(
        struct.depth for struct in result.structures.values() 
        if struct.found and struct.depth is not None
    )
    
    # BEFORE the fix: this would be 1
    # AFTER the fix: this should be much higher
    assert max_depth_reached > 1, f"Max depth reached should be > 1, got {max_depth_reached}"
    assert result.total_structures > 10, f"Should find many structures, got {result.total_structures}"
    
    # Verify the fix: should find 50+ structures with depth 100
    assert result.total_structures >= 50, f"With depth 100, should find at least 50 structures, got {result.total_structures}"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
