"""
Tests for enhanced list structures functionality with max_results support
"""

import pytest
import tempfile
import os
from pathlib import Path
from src.structanalyzer.analyzer import CStructureAnalyzer
from src.structanalyzer.__main__ import list_structures
from io import StringIO
import sys


class TestEnhancedListStructures:
    """Test cases for enhanced list structures functionality"""
    
    @pytest.fixture
    def test_file_with_multiple_structs(self):
        """Create a test file with multiple structures"""
        test_code = '''
        struct TestStruct1 {
            int field1;
        };
        
        struct TestStruct2 {
            float field1;
            double field2;
        };
        
        struct TestStruct3 {
            char field1;
            short field2;
            long field3;
        };
        
        union TestUnion1 {
            int i;
            float f;
        };
        
        typedef struct TestStruct4 {
            unsigned int field1;
        } TestStruct4;
        '''
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.h', delete=False) as f:
            f.write(test_code)
            temp_file = f.name
        
        yield temp_file
        
        # Cleanup
        os.unlink(temp_file)
    
    def test_get_all_structure_names(self, test_file_with_multiple_structs):
        """Test getting all structure names without limit"""
        analyzer = CStructureAnalyzer(test_file_with_multiple_structs)
        all_structures = analyzer.parser.get_all_structure_names()
        
        # Should find all 5 structures/unions
        assert len(all_structures) == 5
        assert 'TestStruct1' in all_structures
        assert 'TestStruct2' in all_structures
        assert 'TestStruct3' in all_structures
        assert 'TestStruct4' in all_structures
        assert 'TestUnion1' in all_structures
        
        # Should be sorted
        assert all_structures == sorted(all_structures)
    
    def test_list_all_structures_with_high_limit(self, test_file_with_multiple_structs):
        """Test list_all_structures with limit higher than available"""
        analyzer = CStructureAnalyzer(test_file_with_multiple_structs)
        structures = analyzer.list_all_structures(max_results=100)
        
        # Should return all 5 structures
        assert len(structures) == 5
        assert 'TestStruct1' in structures
        assert 'TestStruct4' in structures
        assert 'TestUnion1' in structures
    
    def test_list_all_structures_with_low_limit(self, test_file_with_multiple_structs):
        """Test list_all_structures with limit lower than available"""
        analyzer = CStructureAnalyzer(test_file_with_multiple_structs)
        structures = analyzer.list_all_structures(max_results=3)
        
        # Should return exactly 3 structures
        assert len(structures) == 3
        
        # Should be sorted subset
        all_structures = analyzer.parser.get_all_structure_names()
        assert structures == all_structures[:3]
    
    def test_list_structures_unlimited(self, test_file_with_multiple_structs):
        """Test list_structures with unlimited results"""
        analyzer = CStructureAnalyzer(test_file_with_multiple_structs)
        
        # Capture stdout
        captured_output = StringIO()
        sys.stdout = captured_output
        
        try:
            list_structures(analyzer, max_results=None)
            output = captured_output.getvalue()
        finally:
            sys.stdout = sys.__stdout__
        
        # Check output content
        assert "Found 5 structures/unions:" in output
        assert "TestStruct1" in output
        assert "TestStruct4" in output
        assert "TestUnion1" in output
        assert "... and" not in output  # No truncation message
        assert "Tip: Use --max-results" not in output  # No tip message
    
    def test_list_structures_with_limit(self, test_file_with_multiple_structs):
        """Test list_structures with limited results"""
        analyzer = CStructureAnalyzer(test_file_with_multiple_structs)
        
        # Capture stdout
        captured_output = StringIO()
        sys.stdout = captured_output
        
        try:
            list_structures(analyzer, max_results=3)
            output = captured_output.getvalue()
        finally:
            sys.stdout = sys.__stdout__
        
        # Check output content
        assert "Found 5 structures/unions (showing first 3):" in output
        assert "... and 2 more structures" in output
        assert "Tip: Use --max-results 0 to show all 5 structures" in output
    
    def test_list_structures_zero_means_unlimited(self, test_file_with_multiple_structs):
        """Test that max_results=0 means unlimited"""
        analyzer = CStructureAnalyzer(test_file_with_multiple_structs)
        
        # Capture stdout
        captured_output = StringIO()
        sys.stdout = captured_output
        
        try:
            list_structures(analyzer, max_results=0)
            output = captured_output.getvalue()
        finally:
            sys.stdout = sys.__stdout__
        
        # Check output content
        assert "Found 5 structures/unions:" in output
        assert "TestStruct1" in output
        assert "TestStruct4" in output
        assert "TestUnion1" in output
        assert "... and" not in output  # No truncation message
    
    def test_list_structures_shows_field_counts(self, test_file_with_multiple_structs):
        """Test that list_structures shows field counts correctly"""
        analyzer = CStructureAnalyzer(test_file_with_multiple_structs)
        
        # Capture stdout
        captured_output = StringIO()
        sys.stdout = captured_output
        
        try:
            list_structures(analyzer, max_results=None)
            output = captured_output.getvalue()
        finally:
            sys.stdout = sys.__stdout__
        
        # Check field counts are shown
        assert "(1 fields)" in output  # TestStruct1
        assert "(2 fields)" in output  # TestStruct2, TestUnion1
        assert "(3 fields)" in output  # TestStruct3
    
    def test_list_structures_shows_struct_union_types(self, test_file_with_multiple_structs):
        """Test that list_structures correctly identifies struct vs union"""
        analyzer = CStructureAnalyzer(test_file_with_multiple_structs)
        
        # Capture stdout
        captured_output = StringIO()
        sys.stdout = captured_output
        
        try:
            list_structures(analyzer, max_results=None)
            output = captured_output.getvalue()
        finally:
            sys.stdout = sys.__stdout__
        
        # Check that struct and union types are correctly identified
        lines = output.split('\n')
        
        # Find lines with TestStruct and TestUnion
        struct_lines = [line for line in lines if 'TestStruct' in line]
        union_lines = [line for line in lines if 'TestUnion' in line]
        
        # All TestStruct entries should be marked as "struct"
        for line in struct_lines:
            assert 'struct' in line
        
        # All TestUnion entries should be marked as "union"
        for line in union_lines:
            assert 'union' in line
    
    def test_empty_file_handling(self):
        """Test handling of files with no structures"""
        test_code = '''
        int global_var = 42;
        #define MACRO_VALUE 100
        '''
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.h', delete=False) as f:
            f.write(test_code)
            temp_file = f.name
        
        try:
            analyzer = CStructureAnalyzer(temp_file)
            
            # Capture stdout
            captured_output = StringIO()
            sys.stdout = captured_output
            
            try:
                list_structures(analyzer, max_results=None)
                output = captured_output.getvalue()
            finally:
                sys.stdout = sys.__stdout__
            
            # Check error message
            assert "ERROR: No structures or unions found in the file" in output
            
        finally:
            os.unlink(temp_file)


if __name__ == "__main__":
    pytest.main([__file__])
