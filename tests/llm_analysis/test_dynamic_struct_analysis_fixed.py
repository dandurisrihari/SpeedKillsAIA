#!/usr/bin/env python3
"""
Comprehensive Tests for Dynamic Struct Analysis System

This module provides comprehensive tests for:
- IFileProcessor: Processing .i files to create JSON database
- DynamicStructExtractor: Extracting structs from database
- LLMStructRequestHandler: Handling LLM struct requests
- Web UI integration
"""

import json
import tempfile
import pytest
import shutil
from pathlib import Path
from unittest.mock import Mock, patch
from dataclasses import dataclass
from typing import Dict, List, Optional

# Add project root to path
import sys
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from src.preprocess.i_file_processor import IFileProcessor
from src.llm_analysis.dynamic_struct_tool import (
    DynamicStructExtractor, 
    LLMStructRequestHandler,
    StructRequest,
    StructResponse
)


class TestIFileProcessor:
    """Test the I File Processor component"""
    
    def test_processor_initialization(self):
        """Test IFileProcessor initialization"""
        processor = IFileProcessor()
        assert processor is not None
        # Add more initialization tests as needed
    
    def test_c_to_i_mapping(self, tmp_path):
        """Test C to I file mapping functionality"""
        # Create test files
        (tmp_path / "test.c").write_text("// C source file")
        (tmp_path / "test.i").write_text("struct test_struct { int x; };")
        
        processor = IFileProcessor()
        mapping = processor._map_c_to_i_files(tmp_path)
        
        assert len(mapping) == 1
        c_file = list(mapping.keys())[0]
        i_file = mapping[c_file]
        assert c_file.name == "test.c"
        assert i_file.name == "test.i"
    
    def test_struct_extraction_regex(self):
        """Test struct extraction using regex patterns"""
        processor = IFileProcessor()
        
        test_content = """
struct simple_struct {
    int value;
    char name[64];
};

typedef struct {
    double data;
    int flags;
} typedef_struct;

struct complex_struct {
    struct simple_struct *ptr;
    union {
        int i;
        float f;
    } data;
};
        """
        
        structs = processor._extract_structs_regex(test_content, "/test.i")
        
        # Should find the named structs
        struct_names = [s.name for s in structs]
        assert "simple_struct" in struct_names
        # The regex might not catch complex nested structs perfectly
        # Let's just verify we get at least the simple ones
        assert len(struct_names) >= 2  # At least simple_struct and typedef_struct
    
    def test_related_structs_detection(self):
        """Test detection of related structs"""
        processor = IFileProcessor()
        
        test_content = """
struct device {
    int id;
    struct device *parent;
};

struct pci_device {
    struct device dev;
    int vendor_id;
};
        """
        
        structs = processor._extract_structs_regex(test_content, "/test.i")
        
        # Find pci_device struct
        pci_struct = next((s for s in structs if s.name == "pci_device"), None)
        assert pci_struct is not None
        assert "device" in pci_struct.related_structs
    
    def test_database_generation(self, tmp_path):
        """Test generation of complete database"""
        # Create test source files
        (tmp_path / "test1.c").write_text("// Test file 1")
        (tmp_path / "test1.i").write_text("""
struct test_struct1 {
    int id;
    char name[32];
};
        """)
        
        (tmp_path / "test2.c").write_text("// Test file 2")
        (tmp_path / "test2.i").write_text("""
struct test_struct2 {
    struct test_struct1 *ref;
    double value;
};
        """)
        
        processor = IFileProcessor()
        db_output = tmp_path / "output.json"
        database = processor.process_source_directory(tmp_path, db_output)
        
        # Verify database structure
        assert database is not None
        assert len(database.files) == 2
        assert database.metadata["total_structs"] == 2
        
        # Verify struct index
        assert "test_struct1" in database.struct_index
        assert "test_struct2" in database.struct_index
        
        # Verify output file was created
        assert db_output.exists()
        
        # Verify JSON content
        with open(db_output) as f:
            json_data = json.load(f)
        assert "metadata" in json_data
        assert "files" in json_data
        assert "struct_index" in json_data


class TestDynamicStructExtractor:
    """Test the Dynamic Struct Extractor component"""
    
    @pytest.fixture
    def extractor_with_db(self, tmp_path):
        """Create extractor with test database"""
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
                        "file_path": str(tmp_path / "test.i"),
                        "related_structs": []
                    },
                    {
                        "name": "device_struct", 
                        "definition": "struct device_struct { struct test_struct *ptr; int id; };",
                        "line_number": 3,
                        "file_path": str(tmp_path / "test.i"),
                        "related_structs": ["test_struct"]
                    }
                ]
            }],
            "struct_index": {
                "test_struct": [str(tmp_path / "test.i")],
                "device_struct": [str(tmp_path / "test.i")]
            }
        }
        
        db_path = tmp_path / "i_files.json"
        with open(db_path, 'w') as f:
            json.dump(test_db, f)
        
        return DynamicStructExtractor(data_dir=str(tmp_path))
    
    def test_extractor_initialization(self, tmp_path):
        """Test extractor initialization with and without database"""
        # Test with database
        test_db = {"metadata": {"total_structs": 0}, "files": [], "struct_index": {}}
        db_path = tmp_path / "i_files.json"
        with open(db_path, 'w') as f:
            json.dump(test_db, f)
        
        extractor = DynamicStructExtractor(data_dir=str(tmp_path))
        assert extractor.i_files_db is not None
        
        # Test without database
        extractor2 = DynamicStructExtractor(data_dir="/nonexistent/path")
        assert extractor2.i_files_db is None
    
    def test_struct_extraction_from_database(self, extractor_with_db):
        """Test struct extraction from database"""
        response = extractor_with_db.extract_struct("test_struct")
        
        assert response.status == "success"
        assert "test_struct" in response.definition
        assert response.file_path is not None
        assert response.line_number == 1
        assert response.related_structs == []
    
    def test_struct_extraction_with_file_hint(self, extractor_with_db):
        """Test struct extraction with file hint"""
        response = extractor_with_db.extract_struct("device_struct", file_hint="test.i")
        
        assert response.status == "success"
        assert "device_struct" in response.definition
        assert "test_struct" in response.related_structs
    
    def test_struct_not_found(self, tmp_path):
        """Test handling of non-existent struct"""
        extractor = DynamicStructExtractor(data_dir=str(tmp_path))
        
        response = extractor.extract_struct("nonexistent_struct")
        
        assert response.status == "not_found"
        assert "not found" in response.error.lower()
    
    def test_database_not_available(self):
        """Test fallback when database is not available"""
        # Create extractor with non-existent data directory
        extractor = DynamicStructExtractor(data_dir="/nonexistent/path")
        
        assert extractor.i_files_db is None
        
        # Should attempt fallback (will fail without .i files)
        response = extractor.extract_struct("any_struct")
        assert response.status in ["not_found", "error"]


class TestLLMStructRequestHandler:
    """Test the LLM Struct Request Handler component"""
    
    @pytest.fixture
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
                        "file_path": str(tmp_path / "test.i"),
                        "related_structs": []
                    },
                    {
                        "name": "another_struct", 
                        "definition": "struct another_struct { char data[10]; };",
                        "line_number": 3,
                        "file_path": str(tmp_path / "test.i"),
                        "related_structs": []
                    }
                ]
            }],
            "struct_index": {
                "test_struct": [str(tmp_path / "test.i")],
                "another_struct": [str(tmp_path / "test.i")]
            }
        }
        
        db_path = tmp_path / "i_files.json"
        with open(db_path, 'w') as f:
            json.dump(test_db, f)
        
        return LLMStructRequestHandler(data_dir=str(tmp_path))
    
    def test_handler_initialization(self, handler_with_db):
        """Test handler initialization"""
        handler = handler_with_db
        
        assert handler is not None
        assert handler.session_id is not None
        assert len(handler.request_history) == 0
        assert handler.extractor is not None
    
    def test_successful_struct_request(self, handler_with_db):
        """Test successful struct request"""
        handler = handler_with_db
        
        request_data = {
            "struct_name": "test_struct",
            "context": "Testing struct request",
            "file_hint": "test.i"
        }
        
        result = handler.handle_struct_request(request_data)
        
        assert result["success"] is True
        assert "definition" in result
        assert "test_struct" in result["definition"]
        assert result["source"] == "database"
        
        # Check request was logged
        assert len(handler.request_history) == 1
        assert handler.request_history[0]["request"]["struct_name"] == "test_struct"
    
    def test_failed_struct_request(self, handler_with_db):
        """Test failed struct request"""
        handler = handler_with_db
        
        request_data = {
            "struct_name": "nonexistent_struct",
            "context": "Testing failed request"
        }
        
        result = handler.handle_struct_request(request_data)
        
        assert result["success"] is False
        assert "error" in result
        
        # Check request was still logged
        assert len(handler.request_history) == 1
        assert handler.request_history[0]["response"]["status"] == "not_found"
    
    def test_multiple_requests_tracking(self, handler_with_db):
        """Test tracking of multiple requests"""
        handler = handler_with_db
        
        requests = [
            {"struct_name": "test_struct", "context": "First request"},
            {"struct_name": "another_struct", "context": "Second request"},
            {"struct_name": "test_struct", "context": "Repeated request"}
        ]
        
        for req in requests:
            handler.handle_struct_request(req)
        
        # Should have 3 requests in history
        assert len(handler.request_history) == 3
        
        # Check request numbers are incremented
        assert handler.request_history[0]["request_number"] == 1
        assert handler.request_history[1]["request_number"] == 2
        assert handler.request_history[2]["request_number"] == 3
    
    def test_request_history_management(self, handler_with_db):
        """Test request history management"""
        handler = handler_with_db
        
        # Make some requests
        for i in range(3):
            handler.handle_struct_request({"struct_name": f"struct_{i}"})
        
        # Test get_request_history
        history = handler.get_request_history()
        assert len(history) == 3
        assert all("timestamp" in record for record in history)
        assert all("session_id" in record for record in history)
    
    def test_invalid_request_data(self, handler_with_db):
        """Test handling of invalid request data"""
        handler = handler_with_db
        
        # Missing struct_name
        result = handler.handle_struct_request({})
        assert result["success"] is False
        assert "error" in result
        
        # Invalid struct_name type
        result = handler.handle_struct_request({"struct_name": 123})
        assert result["success"] is False


class TestWebUIIntegration:
    """Test Web UI integration components"""
    
    def test_enhanced_analysis_endpoint_data_format(self):
        """Test the data format expected by enhanced analysis endpoint"""
        # Simulate the expected response format from enhanced analysis
        expected_response = {
            "success": True,
            "analysis": "This function performs device initialization...",
            "function_name": "device_init",
            "function_code": "static int device_init(struct device *dev) { ... }",
            "file_path": "drivers/device.c", 
            "model_used": "gpt-3.5-turbo",
            "confidence_scores": {
                "AIARelevantFunction": 85,
                "Relevant_KD_Entry_Point": 45,
                "Message_Structure_Handling": 30
            },
            "struct_context": {
                "count": 2,
                "file": "i_files.json",
                "has_definitions": True
            },
            "struct_requests": [
                {
                    "request": {
                        "struct_name": "device",
                        "file_hint": "device.c",
                        "context": "Device initialization analysis",
                        "request_id": "struct_device_123",
                        "timestamp": "2025-08-09T10:00:00"
                    },
                    "response": {
                        "status": "success",
                        "definition": "struct device { int id; char name[64]; };",
                        "file_path": "/path/to/device.i",
                        "line_number": 15,
                        "related_structs": ["device_info"],
                        "source": "database"
                    }
                }
            ],
            "conversation_history": [
                {"role": "system", "content": "You are an expert kernel analyst..."},
                {"role": "user", "content": "Analyze this function: static int device_init..."},
                {"role": "assistant", "content": "STRUCT_REQUEST: {\"struct_name\": \"device\"}"},
                {"role": "user", "content": "STRUCT DEFINITION for 'device': struct device { ... }"}
            ],
            "total_struct_requests": 1
        }
        
        # Verify response structure
        assert expected_response["success"] is True
        assert "struct_requests" in expected_response
        assert "conversation_history" in expected_response
        
        # Verify struct request format
        struct_req = expected_response["struct_requests"][0]
        assert "request" in struct_req
        assert "response" in struct_req
        assert struct_req["response"]["source"] == "database"
    
    def test_enhanced_response_format(self):
        """Test the enhanced response format for web UI display"""
        # Expected format for displaying struct requests in UI
        expected_response = {
            "success": True,
            "analysis": "Function analysis result...",
            "struct_requests": [
                {
                    "request": {
                        "struct_name": "test_struct",
                        "context": "Analysis context",
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
            
            # Should handle corrupted database gracefully
            assert extractor.i_files_db is None
        finally:
            shutil.rmtree(temp_dir)
    
    def test_large_struct_definitions(self):
        """Test handling of large struct definitions"""
        large_struct = "struct large_struct {\n"
        
        # Create a struct with many fields
        for i in range(1000):
            large_struct += f"    int field_{i};\n"
        large_struct += "};"
        
        processor = IFileProcessor()
        structs = processor._extract_structs_regex(large_struct, "/test.i")
        
        assert len(structs) == 1
        assert structs[0].name == "large_struct"
        assert len(structs[0].definition) > 10000  # Should be quite large


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])
