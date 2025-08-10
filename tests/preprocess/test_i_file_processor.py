#!/usr/bin/env python3
"""
Tests for I File Processor in Preprocess Module

Comprehensive tests for the enhanced preprocessing system that
extracts .i file content to JSON for LLM analysis.
"""

import json
import tempfile
import pytest
import shutil
from pathlib import Path
from unittest.mock import patch, MagicMock

# Add project root to path
import sys
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from src.preprocess.i_file_processor import (
    IFileProcessor,
    StructInfo,
    IFileContent,
    IFilesDatabase,
    main
)


class TestStructInfo:
    """Test StructInfo dataclass"""
    
    def test_struct_info_creation(self):
        """Test StructInfo creation and properties"""
        struct = StructInfo(
            name="test_struct",
            definition="struct test_struct { int id; };",
            line_number=10,
            file_path="/path/to/file.i",
            related_structs=["other_struct"],
            kind="struct"
        )
        
        assert struct.name == "test_struct"
        assert "int id;" in struct.definition
        assert struct.line_number == 10
        assert struct.file_path == "/path/to/file.i"
        assert "other_struct" in struct.related_structs
        assert struct.kind == "struct"
    
    def test_struct_info_defaults(self):
        """Test StructInfo with default values"""
        struct = StructInfo(
            name="simple_struct",
            definition="struct simple_struct {};",
            line_number=5,
            file_path="/test.i",
            related_structs=[]
        )
        
        assert struct.kind == "struct"  # Default value


class TestIFileContent:
    """Test IFileContent dataclass"""
    
    def test_i_file_content_creation(self):
        """Test IFileContent creation"""
        structs = [
            StructInfo("test_struct", "struct test_struct {};", 10, "/test.i", [])
        ]
        
        content = IFileContent(
            file_path="/path/to/test.i",
            c_file_path="/path/to/test.c",
            structs=structs,
            file_size=1024,
            line_count=50,
            processed_timestamp="2025-08-09T10:00:00"
        )
        
        assert content.file_path == "/path/to/test.i"
        assert content.c_file_path == "/path/to/test.c"
        assert len(content.structs) == 1
        assert content.file_size == 1024
        assert content.line_count == 50


class TestIFilesDatabase:
    """Test IFilesDatabase dataclass"""
    
    def test_database_creation(self):
        """Test database creation and structure"""
        files = [
            IFileContent("/test.i", "/test.c", [], 1024, 50, "2025-08-09T10:00:00")
        ]
        
        database = IFilesDatabase(
            metadata={"total_files": 1, "total_structs": 0},
            files=files,
            struct_index={}
        )
        
        assert database.metadata["total_files"] == 1
        assert len(database.files) == 1
        assert database.struct_index == {}


class TestIFileProcessorCore:
    """Test core IFileProcessor functionality"""
    
    @pytest.fixture
    def processor(self):
        """Create processor instance"""
        return IFileProcessor()
    
    @pytest.fixture
    def sample_c_content(self):
        """Sample C file content"""
        return """
#include <linux/kernel.h>
#include <linux/module.h>

struct simple_struct {
    int id;
    char name[32];
};

struct complex_struct {
    struct simple_struct *simple;
    union {
        int int_val;
        float float_val;
    } data;
    unsigned long flags;
};

typedef struct {
    int value;
    char *ptr;
} typedef_struct_t;

union test_union {
    int as_int;
    char as_bytes[4];
};

int test_function(struct simple_struct *s) {
    return s->id;
}
"""
    
    @pytest.fixture
    def sample_i_content(self):
        """Sample .i file content with preprocessor output"""
        return """
# 1 "test.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "test.c"
# 1 "/usr/include/linux/kernel.h" 1 3 4
# 2 "test.c" 2

struct simple_struct {
    int id;
    char name[32];
};

struct complex_struct {
    struct simple_struct *simple;
    union {
        int int_val;
        float float_val;
    } data;
    unsigned long flags;
};

typedef struct {
    int value;
    char *ptr;
} typedef_struct_t;

union test_union {
    int as_int;
    char as_bytes[4];
};

struct nested_struct {
    struct simple_struct base;
    struct complex_struct *parent;
};

int test_function(struct simple_struct *s) {
    return s->id;
}
"""
    
    def test_processor_initialization(self, processor):
        """Test processor initialization"""
        assert processor is not None
        # Tree-sitter availability depends on environment
    
    def test_tree_sitter_initialization(self, processor):
        """Test tree-sitter initialization"""
        # This may pass or fail depending on environment
        if hasattr(processor, 'parser') and processor.parser is not None:
            assert processor.language is not None
    
    def test_c_to_i_mapping_simple(self):
        """Test basic .c to .i file mapping"""
        temp_dir = Path(tempfile.mkdtemp())
        try:
            # Create test files
            (temp_dir / "test.c").touch()
            (temp_dir / "test.i").touch()
            
            processor = IFileProcessor()
            mapping = processor._map_c_to_i_files(temp_dir)
            
            assert len(mapping) == 1
            c_file = next(iter(mapping.keys()))
            i_file = mapping[c_file]
            
            assert c_file.name == "test.c"
            assert i_file.name == "test.i"
            
        finally:
            shutil.rmtree(temp_dir)
    
    def test_c_to_i_mapping_nested(self):
        """Test .c to .i mapping with nested directories"""
        temp_dir = Path(tempfile.mkdtemp())
        try:
            # Create nested structure
            (temp_dir / "drivers" / "test").mkdir(parents=True)
            (temp_dir / "drivers" / "other").mkdir(parents=True)
            
            # Create files
            (temp_dir / "drivers" / "test" / "main.c").touch()
            (temp_dir / "drivers" / "test" / "main.i").touch()
            (temp_dir / "drivers" / "other" / "helper.c").touch()
            (temp_dir / "drivers" / "other" / "helper.i").touch()
            
            processor = IFileProcessor()
            mapping = processor._map_c_to_i_files(temp_dir)
            
            assert len(mapping) == 2
            c_files = [f.name for f in mapping.keys()]
            i_files = [f.name for f in mapping.values()]
            
            assert "main.c" in c_files
            assert "helper.c" in c_files
            assert "main.i" in i_files
            assert "helper.i" in i_files
            
        finally:
            shutil.rmtree(temp_dir)
    
    def test_regex_struct_extraction(self, processor, sample_i_content):
        """Test struct extraction using regex"""
        structs = processor._extract_structs_regex(sample_i_content, "test.i")
        
        # Should find multiple structs
        assert len(structs) >= 3
        
        struct_names = [s.name for s in structs]
        assert "simple_struct" in struct_names
        assert "complex_struct" in struct_names
        assert "nested_struct" in struct_names
        
        # Check specific struct details
        simple_struct = next((s for s in structs if s.name == "simple_struct"), None)
        assert simple_struct is not None
        assert "int id;" in simple_struct.definition
        assert "char name[32];" in simple_struct.definition
        assert simple_struct.line_number > 0
        
        # Check related structs detection
        complex_struct = next((s for s in structs if s.name == "complex_struct"), None)
        assert complex_struct is not None
        assert "simple_struct" in complex_struct.related_structs
    
    def test_find_related_structs(self, processor):
        """Test finding related structs in definitions"""
        definition1 = """
        struct parent {
            struct child *child_ptr;
            struct sibling sibling_data;
            int value;
        };
        """
        
        related = processor._find_related_structs(definition1)
        assert "child" in related
        assert "sibling" in related
        assert len(related) == 2
        
        # Test with unions
        definition2 = """
        struct mixed {
            union data_union data;
            struct base_struct base;
        };
        """
        
        related = processor._find_related_structs(definition2)
        assert "data_union" in related
        assert "base_struct" in related
    
    def test_process_i_file(self, processor, sample_i_content):
        """Test processing a single .i file"""
        temp_dir = Path(tempfile.mkdtemp())
        try:
            # Create test files
            i_file = temp_dir / "test.i"
            c_file = temp_dir / "test.c"
            
            i_file.write_text(sample_i_content)
            c_file.write_text("// test c file")
            
            # Process the file
            content = processor._process_i_file(i_file, c_file)
            
            assert content is not None
            assert content.file_path == str(i_file)
            assert content.c_file_path == str(c_file)
            assert len(content.structs) > 0
            assert content.file_size > 0
            assert content.line_count > 0
            
        finally:
            shutil.rmtree(temp_dir)


class TestIFileProcessorIntegration:
    """Integration tests for the complete processor"""
    
    @pytest.fixture
    def complex_source_tree(self):
        """Create complex source tree for testing"""
        temp_dir = Path(tempfile.mkdtemp())
        
        # Create directory structure
        dirs = [
            "drivers/gpu/drm",
            "drivers/gpu/drm/amd", 
            "drivers/net/ethernet",
            "fs/ext4",
            "kernel/sched"
        ]
        
        for dir_path in dirs:
            (temp_dir / dir_path).mkdir(parents=True)
        
        # Create files with different struct patterns
        files_content = {
            "drivers/gpu/drm/drm_main.c": """
#include <drm/drmP.h>

struct drm_device {
    int dev_id;
    char name[64];
};
            """,
            "drivers/gpu/drm/drm_main.i": """
struct drm_device {
    int dev_id;
    char name[64];
    struct drm_driver *driver;
};

struct drm_driver {
    int major;
    int minor;
    char *name;
};
            """,
            "drivers/net/ethernet/ethernet.c": """
#include <linux/netdevice.h>

struct net_device {
    char name[16];
    int flags;
};
            """,
            "drivers/net/ethernet/ethernet.i": """
struct net_device {
    char name[16];
    int flags;
    struct net_device_ops *netdev_ops;
};

struct net_device_ops {
    int (*ndo_open)(struct net_device *dev);
    int (*ndo_stop)(struct net_device *dev);
};

typedef struct {
    __u32 addr;
    __u16 port;
} socket_addr_t;
            """
        }
        
        # Write all files
        for file_path, content in files_content.items():
            full_path = temp_dir / file_path
            full_path.write_text(content)
        
        yield temp_dir
        shutil.rmtree(temp_dir)
    
    def test_full_processing_pipeline(self, complex_source_tree):
        """Test the complete processing pipeline"""
        processor = IFileProcessor()
        output_path = complex_source_tree / "output.json"
        
        # Process the entire source tree
        database = processor.process_source_directory(complex_source_tree, output_path)
        
        # Verify database structure
        assert isinstance(database, IFilesDatabase)
        assert len(database.files) >= 2  # Should have processed 2 .i files
        assert database.metadata["total_structs"] >= 4  # Should have found multiple structs
        
        # Check struct index
        expected_structs = ["drm_device", "drm_driver", "net_device", "net_device_ops"]
        for struct_name in expected_structs:
            assert struct_name in database.struct_index
        
        # Verify output file
        assert output_path.exists()
        
        with open(output_path, 'r') as f:
            json_data = json.load(f)
        
        assert "metadata" in json_data
        assert "files" in json_data
        assert "struct_index" in json_data
        assert json_data["metadata"]["total_files"] >= 2
        assert json_data["metadata"]["total_structs"] >= 4
    
    def test_database_save_and_load(self, complex_source_tree):
        """Test saving and loading the database"""
        processor = IFileProcessor()
        output_path = complex_source_tree / "database.json"
        
        # Generate and save database
        original_db = processor.process_source_directory(complex_source_tree, output_path)
        
        # Load database from file
        with open(output_path, 'r') as f:
            loaded_data = json.load(f)
        
        # Verify loaded data matches original
        assert loaded_data["metadata"]["total_files"] == len(original_db.files)
        assert loaded_data["metadata"]["total_structs"] == original_db.metadata["total_structs"]
        assert len(loaded_data["files"]) == len(original_db.files)
        assert len(loaded_data["struct_index"]) == len(original_db.struct_index)
    
    def test_struct_index_accuracy(self, complex_source_tree):
        """Test accuracy of struct index"""
        processor = IFileProcessor()
        output_path = complex_source_tree / "index_test.json"
        
        database = processor.process_source_directory(complex_source_tree, output_path)
        
        # Verify each struct in index actually exists in files
        for struct_name, file_paths in database.struct_index.items():
            found = False
            for file_data in database.files:
                if file_data.file_path in file_paths:
                    struct_names = [s.name for s in file_data.structs]
                    if struct_name in struct_names:
                        found = True
                        break
            assert found, f"Struct {struct_name} not found in indexed files"


class TestCommandLineInterface:
    """Test the command line interface"""
    
    def test_main_function_help(self):
        """Test main function with help argument"""
        with patch('sys.argv', ['i_file_processor.py', '--help']):
            with pytest.raises(SystemExit):
                main()
    
    def test_main_function_missing_args(self):
        """Test main function with missing required arguments"""
        with patch('sys.argv', ['i_file_processor.py']):
            with pytest.raises(SystemExit):
                main()
    
    def test_main_function_invalid_source_dir(self):
        """Test main function with invalid source directory"""
        with patch('sys.argv', [
            'i_file_processor.py', 
            '--source-dir', '/nonexistent/path',
            '--output', '/tmp/output.json'
        ]):
            with pytest.raises(SystemExit):
                main()


class TestErrorHandling:
    """Test error handling and edge cases"""
    
    def test_empty_source_directory(self):
        """Test processing empty source directory"""
        temp_dir = Path(tempfile.mkdtemp())
        try:
            processor = IFileProcessor()
            output_path = temp_dir / "empty.json"
            
            database = processor.process_source_directory(temp_dir, output_path)
            
            assert database.metadata["total_files"] == 0
            assert database.metadata["total_structs"] == 0
            assert len(database.files) == 0
            assert len(database.struct_index) == 0
            
        finally:
            shutil.rmtree(temp_dir)
    
    def test_corrupted_i_file(self):
        """Test handling of corrupted .i files"""
        temp_dir = Path(tempfile.mkdtemp())
        try:
            # Create corrupted .i file
            (temp_dir / "test.c").touch()
            (temp_dir / "test.i").write_bytes(b'\x00\x01\x02\x03')  # Binary content
            
            processor = IFileProcessor()
            content = processor._process_i_file(
                temp_dir / "test.i", 
                temp_dir / "test.c"
            )
            
            # Should handle gracefully - may return None or empty structs
            assert content is None or len(content.structs) == 0
            
        finally:
            shutil.rmtree(temp_dir)
    
    def test_very_large_struct(self):
        """Test handling of very large struct definitions"""
        processor = IFileProcessor()
        
        # Create extremely large struct
        large_content = "struct huge_struct {\n"
        for i in range(10000):  # 10K fields
            large_content += f"    int field_{i};\n"
        large_content += "};\n"
        
        # Should not crash or timeout
        structs = processor._extract_structs_regex(large_content, "large.i")
        assert len(structs) >= 1
        
        huge_struct = next((s for s in structs if s.name == "huge_struct"), None)
        assert huge_struct is not None
        assert len(huge_struct.definition) > 50000  # Should be very large
    
    def test_nested_struct_definitions(self):
        """Test handling of deeply nested struct definitions"""
        processor = IFileProcessor()
        
        nested_content = """
        struct level0 {
            struct level1 {
                struct level2 {
                    struct level3 {
                        int value;
                    } deep;
                    int mid;
                } deeper;
                int shallow;
            } nested;
            int top;
        };
        """
        
        # Should extract at least the top-level struct
        structs = processor._extract_structs_regex(nested_content, "nested.i")
        struct_names = [s.name for s in structs]
        
        # Depending on regex implementation, may catch various levels
        assert "level0" in struct_names


class TestPerformance:
    """Performance tests"""
    
    def test_large_file_processing(self):
        """Test processing of large files"""
        temp_dir = Path(tempfile.mkdtemp())
        try:
            # Create large .i file
            large_content = "/* Large file test */\n"
            
            # Add many struct definitions
            for i in range(100):
                large_content += f"""
struct struct_{i} {{
    int id_{i};
    char name_{i}[32];
    struct struct_{max(0, i-1)} *prev;
}};
"""
            
            i_file = temp_dir / "large.i"
            c_file = temp_dir / "large.c" 
            
            i_file.write_text(large_content)
            c_file.touch()
            
            processor = IFileProcessor()
            
            # Process file - should complete in reasonable time
            import time
            start_time = time.time()
            
            content = processor._process_i_file(i_file, c_file)
            
            end_time = time.time()
            processing_time = end_time - start_time
            
            # Should complete within 10 seconds for 100 structs
            assert processing_time < 10.0
            assert content is not None
            assert len(content.structs) >= 50  # Should find most structs
            
        finally:
            shutil.rmtree(temp_dir)


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])
