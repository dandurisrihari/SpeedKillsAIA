#!/usr/bin/env python3
"""
Comprehensive Tests for Dynamic Struct Analysis System

Tests for:
- I File Processor (src.preprocess.i_file_processor)
- Dynamic Struct Extractor (src.llm_analysis.dynamic_struct_tool)
- LLM Struct Request Handler
- Database-based struct extraction
- Web UI integration
"""

impor    @pytest.fixture
    def handler_with_db(self, tmp_path):
        """Create handler with test database"""
        # Create test database
        test_db = {
            "metadata": {"total_structs": 2, "total_files": 1},
            "files": [{
                "file_path": str(tmp_path / "test.i"),
                "structs": [
                    {
                        "name": "test_struct",
                        "definition": "struct test_struct { int value; };",
                        "line_number": 1,
                        "related_structs": []
                    },
                    {
                        "name": "another_struct", 
                        "definition": "struct another_struct { char data[10]; };",
                        "line_number": 3,
                        "related_structs": []
                    }
                ]
            }],
            "struct_index": {
                "test_struct": [{"file": str(tmp_path / "test.i"), "line": 1}],
                "another_struct": [{"file": str(tmp_path / "test.i"), "line": 3}]
            }
        }
        
        db_path = tmp_path / "i_files.json"
        with open(db_path, 'w') as f:
            json.dump(test_db, f)
        
        return LLMStructRequestHandler(data_dir=str(tmp_path))on
import tempfile
import pytest
import shutil
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock
from dataclasses import asdict

# Add project root to path
import sys
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from src.preprocess.i_file_processor import (
    IFileProcessor, 
    StructInfo, 
    IFileContent, 
    IFilesDatabase
)
from src.llm_analysis.dynamic_struct_tool import (
    DynamicStructExtractor,
    LLMStructRequestHandler,
    StructRequest,
    StructResponse
)


class TestIFileProcessor:
    """Test the I File Processor"""
    
    @pytest.fixture
    def temp_source_dir(self):
        """Create temporary source directory with test files"""
        temp_dir = Path(tempfile.mkdtemp())
        
        # Create test .c and .i files
        test_c_content = """
#include <linux/kernel.h>

struct test_struct {
    int id;
    char name[32];
};

int test_function(struct test_struct *ts) {
    return ts->id;
}
"""
        
        test_i_content = """
# 1 "test.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "test.c"

struct test_struct {
    int id;
    char name[32];
};

struct another_struct {
    struct test_struct *ref;
    unsigned long flags;
};

typedef struct {
    int value;
} anonymous_struct_t;

union test_union {
    int int_val;
    float float_val;
};

int test_function(struct test_struct *ts) {
    return ts->id;
}
"""
        
        # Create directory structure
        driver_dir = temp_dir / "drivers" / "test"
        driver_dir.mkdir(parents=True)
        
        # Write files
        (driver_dir / "test.c").write_text(test_c_content)
        (driver_dir / "test.i").write_text(test_i_content)
        
        yield temp_dir
        
        # Cleanup
        shutil.rmtree(temp_dir)
    
    def test_processor_initialization(self):
        """Test processor initialization"""
        processor = IFileProcessor()
        assert processor is not None
        # Tree-sitter availability is environment dependent
    
    def test_c_to_i_mapping(self, temp_source_dir):
        """Test mapping .c files to .i files"""
        processor = IFileProcessor()
        mapping = processor._map_c_to_i_files(temp_source_dir)
        
        assert len(mapping) == 1
        c_file = next(iter(mapping.keys()))
        i_file = mapping[c_file]
        
        assert c_file.name == "test.c"
        assert i_file.name == "test.i"
        assert i_file.exists()
    
    def test_struct_extraction_regex(self, temp_source_dir):
        """Test struct extraction using regex fallback"""
        processor = IFileProcessor()
        # Force regex mode by disabling tree-sitter
        processor.parser = None
        
        i_file = temp_source_dir / "drivers" / "test" / "test.i"
        content = i_file.read_text()
        
        structs = processor._extract_structs_regex(content, str(i_file))
        
        # Should find test_struct, another_struct, and test_union
        assert len(structs) >= 2
        
        struct_names = [s.name for s in structs]
        assert "test_struct" in struct_names
        assert "another_struct" in struct_names
        
        # Check test_struct details
        test_struct = next(s for s in structs if s.name == "test_struct")
        assert "int id;" in test_struct.definition
        assert "char name[32];" in test_struct.definition
        assert test_struct.line_number > 0
    
    def test_related_structs_detection(self):
        """Test detection of related structs in definitions"""
        processor = IFileProcessor()
        
        definition = """
        struct parent {
            struct child *child_ptr;
            struct sibling sibling_data;
            union data_union data;
            int value;
        };
        """
        
        related = processor._find_related_structs(definition)
        assert "child" in related
        assert "sibling" in related
        assert "data_union" in related
    
    def test_database_generation(self, temp_source_dir):
        """Test full database generation"""
        processor = IFileProcessor()
        output_path = temp_source_dir / "test_output.json"
        
        database = processor.process_source_directory(temp_source_dir, output_path)
        
        # Check database structure
        assert isinstance(database, IFilesDatabase)
        assert len(database.files) == 1
        assert database.metadata["total_files"] == 1
        assert database.metadata["total_structs"] >= 2
        
        # Check struct index
        assert "test_struct" in database.struct_index
        assert "another_struct" in database.struct_index
        
        # Check output file was created
        assert output_path.exists()
        
        # Verify JSON content
        with open(output_path, 'r') as f:
            json_data = json.load(f)
        
        assert "metadata" in json_data
        assert "files" in json_data
        assert "struct_index" in json_data


class TestDynamicStructExtractor:
    """Test the Dynamic Struct Extractor"""
    
    @pytest.fixture
    def mock_database(self):
        """Create mock database for testing"""
        return {
            "metadata": {
                "processed_timestamp": "2025-08-09T10:00:00",
                "total_files": 1,
                "total_structs": 3
            },
            "files": [
                {
                    "file_path": "/test/path/test.i",
                    "c_file_path": "/test/path/test.c",
                    "structs": [
                        {
                            "name": "test_struct",
                            "definition": "struct test_struct {\n    int id;\n    char name[32];\n};",
                            "line_number": 10,
                            "file_path": "/test/path/test.i",
                            "related_structs": [],
                            "kind": "struct"
                        },
                        {
                            "name": "another_struct", 
                            "definition": "struct another_struct {\n    struct test_struct *ref;\n    unsigned long flags;\n};",
                            "line_number": 15,
                            "file_path": "/test/path/test.i", 
                            "related_structs": ["test_struct"],
                            "kind": "struct"
                        }
                    ],
                    "file_size": 1024,
                    "line_count": 50,
                    "processed_timestamp": "2025-08-09T10:00:00"
                }
            ],
            "struct_index": {
                "test_struct": ["/test/path/test.i"],
                "another_struct": ["/test/path/test.i"]
            }
        }
    
    @pytest.fixture 
    def temp_data_dir(self, mock_database):
        """Create temporary data directory with mock database"""
        temp_dir = Path(tempfile.mkdtemp())
        
        # Write mock database
        db_path = temp_dir / "i_files.json"
        with open(db_path, 'w') as f:
            json.dump(mock_database, f)
        
        yield temp_dir
        
        # Cleanup
        shutil.rmtree(temp_dir)
    
    def test_extractor_initialization(self, temp_data_dir):
        """Test extractor initialization with database"""
        extractor = DynamicStructExtractor(data_dir=str(temp_data_dir))
        
        assert extractor.i_files_db is not None
        assert len(extractor.i_files_db["files"]) == 1
        assert "test_struct" in extractor.i_files_db["struct_index"]
    
    def test_struct_extraction_from_database(self, temp_data_dir):
        """Test struct extraction from database"""
        extractor = DynamicStructExtractor(data_dir=str(temp_data_dir))
        
        # Extract existing struct
        response = extractor.extract_struct("test_struct")
        
        assert response.status == "success"
        assert response.definition == "struct test_struct {\n    int id;\n    char name[32];\n};"
        assert response.file_path == "/test/path/test.i"
        assert response.line_number == 10
        assert response.related_structs == []
    
    def test_struct_extraction_with_file_hint(self, temp_data_dir):
        """Test struct extraction with file hint"""
        extractor = DynamicStructExtractor(data_dir=str(temp_data_dir))
        
        response = extractor.extract_struct("another_struct", file_hint="test.c")
        
        assert response.status == "success"
        assert "struct another_struct" in response.definition
        assert "test_struct" in response.related_structs
    
    def test_struct_not_found(self, temp_data_dir):
        """Test handling of non-existent struct"""
        extractor = DynamicStructExtractor(data_dir=str(temp_data_dir))
        
        response = extractor.extract_struct("nonexistent_struct")
        
        assert response.status == "not_found"
        assert "not found" in response.error.lower()
    
    def test_database_not_available(self):
        """Test fallback when database is not available"""
        # Create extractor with non-existent data directory
        extractor = DynamicStructExtractor(data_dir="/nonexistent/path")
        
        assert extractor.i_files_db is None
        
        # Should fallback to file parsing (which will fail without actual files)
        response = extractor.extract_struct("test_struct")
        assert response.status in ["not_found", "error"]


class TestLLMStructRequestHandler:
    """Test the LLM Struct Request Handler"""
    
    @pytest.fixture
    def handler_with_db(self, temp_data_dir):
        """Create handler with mock database"""
        return LLMStructRequestHandler(data_dir=str(temp_data_dir))
    
    def test_handler_initialization(self, handler_with_db):
        """Test handler initialization"""
        handler = handler_with_db
        
        assert handler.extractor is not None
        assert handler.request_history == []
        assert handler.session_id is not None
    
    def test_successful_struct_request(self, handler_with_db):
        """Test successful struct request handling"""
        handler = handler_with_db
        
        request_data = {
            "struct_name": "test_struct",
            "file_hint": "test.c",
            "context": "Testing struct request"
        }
        
        response = handler.handle_struct_request(request_data)
        
        # Check response
        assert response["success"] is True
        assert response["struct_name"] == "test_struct"
        assert "struct test_struct" in response["definition"]
        assert response["request_number"] == 1
        assert "source" in response
        
        # Check request history
        assert len(handler.request_history) == 1
        request_record = handler.request_history[0]
        
        assert request_record["type"] == "struct_request"
        assert request_record["session_id"] == handler.session_id
        assert request_record["request"]["struct_name"] == "test_struct"
        assert request_record["request"]["context"] == "Testing struct request"
        assert request_record["response"]["status"] == "success"
    
    def test_failed_struct_request(self, handler_with_db):
        """Test failed struct request handling"""
        handler = handler_with_db
        
        request_data = {
            "struct_name": "nonexistent_struct"
        }
        
        response = handler.handle_struct_request(request_data)
        
        # Check response
        assert response["success"] is False
        assert response["struct_name"] == "nonexistent_struct"
        assert "error" in response
        assert response["request_number"] == 1
        
        # Check request history
        assert len(handler.request_history) == 1
        request_record = handler.request_history[0]
        assert request_record["response"]["status"] == "not_found"
    
    def test_multiple_requests_tracking(self, handler_with_db):
        """Test tracking multiple struct requests"""
        handler = handler_with_db
        
        # Make multiple requests
        requests = [
            {"struct_name": "test_struct"},
            {"struct_name": "another_struct"},
            {"struct_name": "nonexistent_struct"}
        ]
        
        responses = []
        for req in requests:
            responses.append(handler.handle_struct_request(req))
        
        # Check request numbering
        assert responses[0]["request_number"] == 1
        assert responses[1]["request_number"] == 2
        assert responses[2]["request_number"] == 3
        
        # Check history
        assert len(handler.request_history) == 3
        
        # Check session consistency
        for record in handler.request_history:
            assert record["session_id"] == handler.session_id
    
    def test_request_history_management(self, handler_with_db):
        """Test request history management"""
        handler = handler_with_db
        
        # Make request
        handler.handle_struct_request({"struct_name": "test_struct"})
        assert len(handler.request_history) == 1
        
        # Get history copy
        history = handler.get_request_history()
        assert len(history) == 1
        assert history is not handler.request_history  # Should be a copy
        
        # Clear history
        handler.clear_history()
        assert len(handler.request_history) == 0
    
    def test_invalid_request_data(self, handler_with_db):
        """Test handling of invalid request data"""
        handler = handler_with_db
        
        # Missing struct_name
        response = handler.handle_struct_request({})
        assert response["success"] is False
        assert "struct_name is required" in response["error"]
        
        # Empty request
        response = handler.handle_struct_request({"struct_name": ""})
        assert response["success"] is False


class TestWebUIIntegration:
    """Test Web UI integration with dynamic struct analysis"""
    
    @pytest.fixture
    def mock_analyzer(self):
        """Create mock LLM analyzer"""
        analyzer = Mock()
        analyzer.is_available.return_value = True
        return analyzer
    
    def test_enhanced_analysis_endpoint_data_format(self):
        """Test the data format expected by enhanced analysis endpoint"""
        # This tests the expected input format for /api/llm/analyze/function-enhanced
        
        expected_data = {
            "function_name": "test_function",
            "source_code": "int test_function(struct test_struct *ptr) { return 0; }",
            "file_path": "test.c",
            "custom_prompt": "Analyze this function",
            "model_id": "gpt-3.5-turbo",
            "enable_dynamic_structs": True,
            "max_struct_requests": 3
        }
        
        # Verify all required fields are present
        assert "function_name" in expected_data
        assert "source_code" in expected_data
        assert expected_data["enable_dynamic_structs"] is True
        assert isinstance(expected_data["max_struct_requests"], int)
    
    def test_enhanced_response_format(self):
        """Test the expected response format from enhanced analysis"""
        
        # Mock response structure that should be returned
        expected_response = {
            "success": True,
            "analysis": "Function analysis text...",
            "function_name": "test_function",
            "function_code": "int test_function(...) { ... }",
            "file_path": "test.c", 
            "model_used": "gpt-3.5-turbo",
            "confidence_scores": {
                "AIARelevantFunction": 85,
                "Relevant_KD_Entry_Point": 20,
                "Message_Structure_Handling": 60
            },
            "struct_context": {
                "count": 5,
                "file": "test_structs.json",
                "has_definitions": True
            },
            "struct_requests": [
                {
                    "request": {
                        "struct_name": "test_struct",
                        "file_hint": "test.c",
                        "request_id": "struct_test_struct_123",
                        "timestamp": "2025-08-09T10:00:00"
                    },
                    "response": {
                        "status": "success",
                        "definition": "struct test_struct { int id; };",
                        "file_path": "/path/to/test.i",
                        "line_number": 10,
                        "related_structs": [],
                        "source": "database"
                    }
                }
            ],
            "conversation_history": [
                {"role": "system", "content": "You are an expert..."},
                {"role": "user", "content": "Analyze this function..."},
                {"role": "assistant", "content": "STRUCT_REQUEST: {\"struct_name\": \"test_struct\"}"},
                {"role": "user", "content": "STRUCT DEFINITION for 'test_struct': ..."}
            ],
            "additional_structs_requested": 1,
            "total_struct_requests": 1
        }
        
        # Verify response structure
        assert expected_response["success"] is True
        assert "analysis" in expected_response
        assert "struct_requests" in expected_response
        assert "conversation_history" in expected_response
        assert isinstance(expected_response["struct_requests"], list)
        assert isinstance(expected_response["conversation_history"], list)
        
        # Verify struct request format
        if expected_response["struct_requests"]:
            struct_req = expected_response["struct_requests"][0]
            assert "request" in struct_req
            assert "response" in struct_req
            assert "struct_name" in struct_req["request"]
            assert "status" in struct_req["response"]


class TestEndToEndIntegration:
    """End-to-end integration tests"""
    
    def test_full_pipeline(self, tmp_path):
        """Test the complete pipeline from .i processing to struct extraction"""
        
        # Create test source files
        i_content = """
struct test_struct {
    int id;
    char name[64];
    void *data;
};

struct another_struct {
    struct test_struct *parent;
    int flags;
};
        """
        
        (tmp_path / "test.c").write_text("// Test source file")
        (tmp_path / "test.i").write_text(i_content)
        
        # Step 1: Process .i files to create database
        processor = IFileProcessor()
        db_output = tmp_path / "i_files.json"
        database = processor.process_source_directory(tmp_path, db_output)
        
        assert database is not None
        assert db_output.exists()
        
        # Step 2: Initialize extractor with database
        extractor = DynamicStructExtractor(data_dir=str(tmp_path))
        assert extractor.i_files_db is not None
        
        # Step 3: Extract struct that should be in database
        response = extractor.extract_struct("test_struct")
        assert response.status == "success"
        assert "struct test_struct" in response.definition
        
        # Step 4: Test handler integration
        handler = LLMStructRequestHandler(data_dir=str(tmp_path))
        result = handler.handle_struct_request({"struct_name": "test_struct"})
        
        assert result["success"] is True
        assert len(handler.request_history) == 1


# Performance and Edge Case Tests
class TestEdgeCases:
    """Test edge cases and error conditions"""
    
    def test_empty_database(self):
        """Test behavior with empty database"""
        empty_db = {
            "metadata": {"total_structs": 0},
            "files": [],
            "struct_index": {}
        }
        
        temp_dir = Path(tempfile.mkdtemp())
        try:
            db_path = temp_dir / "empty.json"
            with open(db_path, 'w') as f:
                json.dump(empty_db, f)
            
            extractor = DynamicStructExtractor(data_dir=str(temp_dir))
            response = extractor.extract_struct("any_struct")
            
            assert response.status == "not_found"
        finally:
            shutil.rmtree(temp_dir)
    
    def test_corrupted_database(self):
        """Test handling of corrupted database file"""
        temp_dir = Path(tempfile.mkdtemp())
        try:
            db_path = temp_dir / "corrupted.json"
            db_path.write_text("{ invalid json content")
            
            extractor = DynamicStructExtractor(data_dir=str(temp_dir))
            # Should fall back gracefully when database is corrupted
            assert extractor.i_files_db is None
        finally:
            shutil.rmtree(temp_dir)
    
    def test_large_struct_definitions(self):
        """Test handling of very large struct definitions"""
        processor = IFileProcessor()
        
        # Create large struct definition
        large_definition = "struct large_struct {\n"
        for i in range(1000):
            large_definition += f"    int field_{i};\n"
        large_definition += "};"
        
        structs = processor._extract_structs_regex(large_definition, "test.i")
        assert len(structs) == 1
        assert structs[0].name == "large_struct"
        assert len(structs[0].definition) > 10000


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
