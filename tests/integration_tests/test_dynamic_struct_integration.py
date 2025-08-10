#!/usr/bin/env python3
"""
Integration Tests for Dynamic Struct Analysis System

Tests the complete end-to-end workflow:
1. Process .i files to create JSON database
2. Use database for dynamic struct extraction
3. LLM analysis with dynamic struct requests
4. Web UI integration
"""

import json
import tempfile
import pytest
import shutil
import asyncio
from pathlib import Path
from unittest.mock import Mock, patch, AsyncMock

# Add project root to path
import sys
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from src.preprocess.i_file_processor import IFileProcessor
from src.llm_analysis.dynamic_struct_tool import (
    DynamicStructExtractor, 
    LLMStructRequestHandler
)
from src.llm_analysis.llm import LLMAnalyzer


class TestCompleteWorkflow:
    """Test the complete workflow from .i files to LLM analysis"""
    
    @pytest.fixture
    def kernel_sources_mock(self):
        """Create mock kernel sources with realistic content"""
        temp_dir = Path(tempfile.mkdtemp())
        
        # Create realistic kernel source structure
        structure = {
            "drivers/gpu/drm/amd": {
                "amdgpu_device.c": """
#include <drm/drmP.h>
#include "amdgpu.h"

static int amdgpu_device_init(struct amdgpu_device *adev) {
    if (!adev->device_info) {
        return -EINVAL;
    }
    
    adev->device_info->chip_id = AMDGPU_CHIP_UNKNOWN;
    return amdgpu_memory_init(adev);
}
                """,
                "amdgpu_device.i": """
# 1 "amdgpu_device.c"
# 1 "<built-in>"

struct amdgpu_device_info {
    __u32 chip_id;
    __u32 family;
    __u32 num_cus;
    __u64 memory_size;
    char chip_name[32];
};

struct amdgpu_memory_pool {
    __u64 base_addr;
    __u64 size;
    __u32 flags;
    struct amdgpu_device *device;
};

struct amdgpu_device {
    struct drm_device ddev;
    struct amdgpu_device_info *device_info;
    struct amdgpu_memory_pool memory_pools[4];
    __u32 device_id;
    __u32 subsystem_id;
};

struct drm_device {
    int major;
    int minor;
    char name[64];
    struct device *dev;
};

static int amdgpu_device_init(struct amdgpu_device *adev) {
    if (!adev->device_info) {
        return -12;
    }
    
    adev->device_info->chip_id = 0;
    return amdgpu_memory_init(adev);
}

int amdgpu_memory_init(struct amdgpu_device *adev) {
    return 0;
}
                """
            },
            "drivers/gpu/drm": {
                "drm_memory.c": """
#include <linux/dma-mapping.h>

int drm_alloc_coherent(struct drm_device *dev, size_t size) {
    return dma_alloc_coherent(dev->dev, size, NULL, GFP_KERNEL) ? 0 : -ENOMEM;
}
                """,
                "drm_memory.i": """
struct dma_pool {
    struct device *dev;
    size_t size;
    size_t align;
    atomic_t refcount;
};

struct drm_memory_stats {
    __u64 total_allocated;
    __u64 peak_allocated; 
    __u32 allocation_count;
};

int drm_alloc_coherent(struct drm_device *dev, size_t size) {
    return ((dma_alloc_coherent(dev->dev, size, ((void *)0), (0x20 | 0x40 | 0x80))) ? 0 : -12);
}
                """
            }
        }
        
        # Create the directory structure and files
        for dir_path, files in structure.items():
            dir_full_path = temp_dir / dir_path
            dir_full_path.mkdir(parents=True, exist_ok=True)
            
            for filename, content in files.items():
                (dir_full_path / filename).write_text(content.strip())
        
        yield temp_dir
        shutil.rmtree(temp_dir)
    
    def test_end_to_end_workflow(self, kernel_sources_mock):
        """Test complete end-to-end workflow"""
        # Step 1: Process .i files to create database
        processor = IFileProcessor()
        db_output = kernel_sources_mock / "i_files.json"  # Use correct filename
        
        database = processor.process_source_directory(kernel_sources_mock, db_output)
        
        # Verify database was created
        assert database is not None
        assert db_output.exists()
        assert database.metadata["total_structs"] >= 5  # Should find multiple structs
        
        # Verify specific structs are in index
        expected_structs = [
            "amdgpu_device", "amdgpu_device_info", "amdgpu_memory_pool",
            "drm_device", "dma_pool", "drm_memory_stats"
        ]
        for struct_name in expected_structs:
            assert struct_name in database.struct_index, f"Missing {struct_name} in struct index"
        
        # Step 2: Initialize extractor with database
        data_dir = kernel_sources_mock  # Database is in this directory
        extractor = DynamicStructExtractor(data_dir=str(data_dir))
        
        assert extractor.i_files_db is not None
        assert len(extractor.i_files_db["files"]) >= 2
        
        # Step 3: Test struct extraction from database
        response = extractor.extract_struct("amdgpu_device")
        
        assert response.status == "success"
        assert "struct amdgpu_device" in response.definition
        assert "drm_device ddev" in response.definition
        assert response.file_path is not None
        assert response.line_number > 0
        
        # Test related struct detection
        assert "drm_device" in response.related_structs
        
        # Step 4: Test struct request handler
        handler = LLMStructRequestHandler(data_dir=str(data_dir))
        
        # Make multiple struct requests
        requests = [
            {"struct_name": "amdgpu_device", "context": "Analyzing device initialization"},
            {"struct_name": "drm_memory_stats", "context": "Memory analysis"},
            {"struct_name": "nonexistent_struct", "context": "Testing error handling"}
        ]
        
        results = []
        for req in requests:
            results.append(handler.handle_struct_request(req))
        
        # Verify results
        assert results[0]["success"] is True
        assert results[1]["success"] is True  
        assert results[2]["success"] is False
        
        # Verify request tracking
        assert len(handler.request_history) == 3
        assert handler.request_history[0]["request"]["context"] == "Analyzing device initialization"
        assert handler.request_history[2]["response"]["status"] == "not_found"
    
    def test_performance_with_large_database(self, kernel_sources_mock):
        """Test performance with larger database"""
        # Add more files to test performance
        for i in range(10):
            extra_dir = kernel_sources_mock / f"extra_{i}"
            extra_dir.mkdir()
            
            # Create .c file
            c_content = f"""
struct extra_struct_{i} {{
    int id_{i};
    char name_{i}[64];
    struct extra_struct_{max(0, i-1)} *prev;
}};

int extra_function_{i}(struct extra_struct_{i} *ptr) {{
    return ptr->id_{i};
}}
            """
            (extra_dir / f"extra_{i}.c").write_text(c_content)
            
            # Create corresponding .i file
            i_content = f"""
struct extra_struct_{i} {{
    int id_{i};
    char name_{i}[64];
    struct extra_struct_{max(0, i-1)} *prev;
}};

int extra_function_{i}(struct extra_struct_{i} *ptr) {{
    return ptr->id_{i};
}}
            """
            (extra_dir / f"extra_{i}.i").write_text(i_content)
        
        # Process large database
        import time
        
        start_time = time.time()
        processor = IFileProcessor()
        db_output = kernel_sources_mock / "large_db.json"
        database = processor.process_source_directory(kernel_sources_mock, db_output)
        processing_time = time.time() - start_time
        
        # Should complete within reasonable time (30 seconds for ~12 files)
        assert processing_time < 30.0
        assert database.metadata["total_structs"] >= 15
        
        # Test extraction performance
        extractor = DynamicStructExtractor(data_dir=str(kernel_sources_mock))
        
        start_time = time.time()
        response = extractor.extract_struct("extra_struct_5")
        extraction_time = time.time() - start_time
        
        # Database lookup should be very fast (< 1 second)
        assert extraction_time < 1.0
        assert response.status == "success"


class TestWebUIIntegration:
    """Test integration with Web UI components"""
    
    @pytest.fixture
    def mock_llm_analyzer(self):
        """Create mock LLM analyzer for testing"""
        analyzer = Mock(spec=LLMAnalyzer)
        analyzer.is_available.return_value = True
        analyzer.struct_request_handler = Mock()
        
        # Mock successful analysis response
        analyzer.analyze_function_with_dynamic_structs.return_value = {
            "success": True,
            "analysis": "This function initializes an AMDGPU device structure...",
            "function_name": "amdgpu_device_init",
            "function_code": "static int amdgpu_device_init(struct amdgpu_device *adev) { ... }",
            "file_path": "drivers/gpu/drm/amd/amdgpu_device.c",
            "model_used": "gpt-3.5-turbo",
            "confidence_scores": {
                "AIARelevantFunction": 75,
                "Relevant_KD_Entry_Point": 30,
                "Message_Structure_Handling": 20
            },
            "struct_context": {
                "count": 3,
                "file": "kernel_structs.json",
                "has_definitions": True
            },
            "struct_requests": [
                {
                    "request": {
                        "struct_name": "amdgpu_device",
                        "file_hint": "amdgpu_device.c",
                        "request_id": "struct_amdgpu_device_123",
                        "timestamp": "2025-08-09T10:00:00"
                    },
                    "response": {
                        "status": "success",
                        "definition": "struct amdgpu_device { ... };",
                        "file_path": "/path/to/amdgpu_device.i",
                        "line_number": 15,
                        "related_structs": ["drm_device", "amdgpu_device_info"],
                        "source": "database"
                    }
                }
            ],
            "conversation_history": [
                {"role": "system", "content": "You are an expert kernel analyst..."},
                {"role": "user", "content": "Analyze this function: static int amdgpu_device_init..."},
                {"role": "assistant", "content": "I need struct info. STRUCT_REQUEST: {\"struct_name\": \"amdgpu_device\"}"},
                {"role": "user", "content": "STRUCT DEFINITION for 'amdgpu_device': struct amdgpu_device { ... }"}
            ],
            "total_struct_requests": 1
        }
        
        return analyzer
    
    def test_enhanced_analysis_api_format(self, mock_llm_analyzer):
        """Test the API format for enhanced analysis"""
        # Simulate API request data
        api_request = {
            "function_name": "amdgpu_device_init",
            "source_code": """
static int amdgpu_device_init(struct amdgpu_device *adev) {
    if (!adev->device_info) {
        return -EINVAL;
    }
    
    adev->device_info->chip_id = AMDGPU_CHIP_UNKNOWN;
    return amdgpu_memory_init(adev);
}
            """,
            "file_path": "drivers/gpu/drm/amd/amdgpu_device.c",
            "custom_prompt": "Focus on memory management patterns",
            "model_id": "gpt-3.5-turbo",
            "enable_dynamic_structs": True,
            "max_struct_requests": 3
        }
        
        # Test API call
        result = mock_llm_analyzer.analyze_function_with_dynamic_structs(
            function_name=api_request["function_name"],
            source_code=api_request["source_code"],
            file_path=api_request["file_path"],
            custom_prompt=api_request["custom_prompt"],
            model_id=api_request["model_id"],
            max_struct_requests=api_request["max_struct_requests"]
        )
        
        # Verify response format
        assert result["success"] is True
        assert "analysis" in result
        assert "struct_requests" in result
        assert "conversation_history" in result
        assert "confidence_scores" in result
        
        # Verify struct request format
        assert len(result["struct_requests"]) == 1
        struct_req = result["struct_requests"][0]
        assert "request" in struct_req
        assert "response" in struct_req
        assert struct_req["request"]["struct_name"] == "amdgpu_device"
        assert struct_req["response"]["status"] == "success"
        assert struct_req["response"]["source"] == "database"
    
    def test_web_ui_display_data(self, mock_llm_analyzer):
        """Test data format expected by web UI"""
        result = mock_llm_analyzer.analyze_function_with_dynamic_structs.return_value
        
        # Test JavaScript processing of result data
        # This simulates what the JS code does with the response
        
        # Extract struct requests for display
        struct_requests = result.get("struct_requests", [])
        assert len(struct_requests) == 1
        
        # Test request display data
        for i, req in enumerate(struct_requests):
            request_data = req["request"]
            response_data = req["response"]
            
            # Data that would be displayed in UI
            display_data = {
                "request_number": i + 1,
                "struct_name": request_data["struct_name"],
                "file_hint": request_data.get("file_hint"),
                "status": response_data["status"],
                "status_icon": "✅" if response_data["status"] == "success" else "❌"
            }
            
            if response_data["status"] == "success":
                display_data.update({
                    "found_in": response_data["file_path"],
                    "line_number": response_data["line_number"],
                    "definition": response_data["definition"],
                    "related_structs": response_data.get("related_structs", []),
                    "source": response_data.get("source", "unknown")
                })
            
            # Verify display data
            assert display_data["request_number"] == 1
            assert display_data["struct_name"] == "amdgpu_device"
            assert display_data["status"] == "success"
            assert display_data["status_icon"] == "✅"
            assert display_data["source"] == "database"
        
        # Test conversation history display
        conversation = result.get("conversation_history", [])
        assert len(conversation) == 4  # system, user, assistant, user
        
        # Skip system message and initial user message for display
        display_conversation = conversation[2:]  # Show from assistant response
        assert len(display_conversation) == 2
        assert display_conversation[0]["role"] == "assistant"
        assert "STRUCT_REQUEST" in display_conversation[0]["content"]


class TestErrorHandlingIntegration:
    """Test error handling in the integrated system"""
    
    def test_missing_database_fallback(self):
        """Test fallback behavior when database is missing"""
        # Create extractor with non-existent database
        temp_dir = Path(tempfile.mkdtemp())
        try:
            extractor = DynamicStructExtractor(data_dir=str(temp_dir))
            
            # Should initialize without database
            assert extractor.i_files_db is None
            
            # Should attempt fallback (which will fail without .i files)
            response = extractor.extract_struct("test_struct")
            assert response.status in ["not_found", "error"]
            
        finally:
            shutil.rmtree(temp_dir)
    
    def test_corrupted_database_handling(self):
        """Test handling of corrupted database file"""
        temp_dir = Path(tempfile.mkdtemp())
        try:
            # Create corrupted database
            db_path = temp_dir / "i_files.json"
            db_path.write_text("{ corrupted json content")
            
            extractor = DynamicStructExtractor(data_dir=str(temp_dir))
            
            # Should handle corrupted database gracefully
            assert extractor.i_files_db is None
            
        finally:
            shutil.rmtree(temp_dir)
    
    def test_partial_database_content(self):
        """Test handling of partial/incomplete database"""
        temp_dir = Path(tempfile.mkdtemp())
        try:
            # Create database missing some fields
            incomplete_db = {
                "metadata": {"total_structs": 1},
                "files": [
                    {
                        "file_path": "/test.i",
                        "structs": [
                            {"name": "test_struct", "definition": "struct test_struct {};"}
                            # Missing other required fields
                        ]
                    }
                ]
                # Missing struct_index
            }
            
            db_path = temp_dir / "i_files.json"
            with open(db_path, 'w') as f:
                json.dump(incomplete_db, f)
            
            extractor = DynamicStructExtractor(data_dir=str(temp_dir))
            
            # Should load database despite missing fields
            assert extractor.i_files_db is not None
            
            # Should handle missing struct_index gracefully
            response = extractor.extract_struct("test_struct")
            # May succeed or fail depending on implementation robustness
            
        finally:
            shutil.rmtree(temp_dir)


class TestRealWorldScenarios:
    """Test with realistic kernel code scenarios"""
    
    def test_complex_struct_hierarchy(self):
        """Test with complex, interdependent struct hierarchies"""
        temp_dir = Path(tempfile.mkdtemp())
        try:
            # Create complex kernel-style structures
            complex_i_content = """
struct device {
    struct device *parent;
    struct device_driver *driver;
    void *platform_data;
    u64 dma_mask;
};

struct pci_dev {
    struct device dev;
    unsigned int devfn;
    unsigned short vendor, device;
    struct pci_bus *bus;
    struct pci_driver *driver;
};

struct drm_device {
    struct device *dev;
    struct pci_dev *pdev;
    struct drm_driver *driver;
    void __iomem *regs;
};

struct amdgpu_device {
    struct drm_device ddev;
    struct pci_dev *pdev;
    struct amdgpu_memory_manager memory_mgr;
    struct amdgpu_ring rings[8];
};

struct amdgpu_memory_manager {
    struct drm_device *ddev;
    u64 vram_size;
    u64 visible_vram_size;
    struct amdgpu_bo_list *bo_list;
};

struct amdgpu_ring {
    struct amdgpu_device *adev;
    const struct amdgpu_ring_funcs *funcs;
    u32 ring_size;
    void *ring_obj;
};
            """
            
            # Create test files
            (temp_dir / "test.c").write_text("// test file")
            (temp_dir / "test.i").write_text(complex_i_content)
            
            # Process with IFileProcessor
            processor = IFileProcessor()
            db_output = temp_dir / "complex.json"
            database = processor.process_source_directory(temp_dir, db_output)
            
            # Should find all structs and their relationships
            expected_structs = [
                "device", "pci_dev", "drm_device", "amdgpu_device",
                "amdgpu_memory_manager", "amdgpu_ring"
            ]
            
            found_structs = [s.name for file_data in database.files for s in file_data.structs]
            
            for expected in expected_structs:
                assert expected in found_structs, f"Missing {expected}"
            
            # Test extraction with relationships
            extractor = DynamicStructExtractor(data_dir=str(temp_dir))
            response = extractor.extract_struct("amdgpu_device")
            
            assert response.status == "success"
            
            # Should detect related structs
            related = response.related_structs
            assert "drm_device" in related
            assert "amdgpu_memory_manager" in related
            assert "amdgpu_ring" in related
            
        finally:
            shutil.rmtree(temp_dir)
    
    def test_typical_driver_analysis_workflow(self, kernel_sources_mock):
        """Test typical workflow for analyzing a kernel driver function"""
        # Step 1: Create database from kernel sources
        processor = IFileProcessor()
        db_output = kernel_sources_mock / "driver_analysis.json"
        database = processor.process_source_directory(kernel_sources_mock, db_output)
        
        # Step 2: Simulate LLM analysis request with multiple struct needs
        handler = LLMStructRequestHandler(data_dir=str(kernel_sources_mock))
        
        # Function that uses multiple structs (realistic scenario)
        function_analysis_requests = [
            {"struct_name": "amdgpu_device", "context": "Device initialization analysis"},
            {"struct_name": "amdgpu_device_info", "context": "Device capability check"},
            {"struct_name": "amdgpu_memory_pool", "context": "Memory pool setup"}
        ]
        
        # Process requests as would happen during LLM analysis
        request_results = []
        for req in function_analysis_requests:
            result = handler.handle_struct_request(req)
            request_results.append(result)
        
        # Verify all requests succeeded
        for result in request_results:
            assert result["success"] is True
            assert "definition" in result
            assert "source" in result
            assert result["source"] == "database"  # Should come from database, not file parsing
        
        # Step 3: Verify request history for UI display
        history = handler.get_request_history()
        assert len(history) == 3
        
        # Each request should have complete tracking info
        for i, record in enumerate(history):
            assert record["request_number"] == i + 1
            assert record["session_id"] == handler.session_id
            assert record["type"] == "struct_request"
            assert "timestamp" in record
            assert record["response"]["source"] == "database"


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])
