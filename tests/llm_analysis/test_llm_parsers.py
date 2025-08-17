#!/usr/bin/env python3
"""
Test JSON parsers
"""

import pytest
import json
import tempfile
import os
from src.llm_analysis.parsers import JSONParser
from src.llm_analysis.models import FunctionEntry, DMAOperation, UserCopyOperation, IOCTLOperation


class TestJSONParser:
    """Test JSONParser class"""
    
    @pytest.fixture
    def parser(self):
        """Create JSONParser instance"""
        return JSONParser(verbose=False)
    
    @pytest.fixture
    def sample_json_data(self):
        """Sample JSON data for testing"""
        return {
            "metadata": {
                "parser_version": "2.0.0",
                "parsed_at": "2025-08-17T10:00:00.000000"
            },
            "function_entries": [
                {
                    "function_name": "test_function",
                    "file_path": "test.c",
                    "function_code": "int test_function(void) { return 0; }",
                    "line_number": 100
                }
            ],
            "functions_by_file": {
                "driver.c": [
                    {
                        "function_name": "driver_init",
                        "function_code": "int driver_init(void) { return 0; }"
                    }
                ]
            },
            "dma_operations": [
                {
                    "function_name": "dma_alloc",
                    "function_code": "void* dma_alloc(size_t size) {}",
                    "stack_trace": "dma_alloc+0x10\ndriver_main+0x20"
                }
            ],
            "user_copy_operations": [
                {
                    "function_name": "copy_func",
                    "function_code": "copy_from_user(dest, src, size)",
                    "operation": "copy_from_user"
                }
            ],
            "ioctl_operations": [
                {
                    "function_name": "ioctl_handler",
                    "function_code": "long ioctl_handler(uint cmd) {}",
                    "ioctl_cmd": "IOCTL_TEST"
                }
            ]
        }
    
    def test_parse_file_success(self, parser, sample_json_data):
        """Test successful JSON file parsing"""
        # Create temporary file
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(sample_json_data, f)
            temp_file = f.name
        
        try:
            result = parser.parse_file(temp_file)
            
            # Check structure
            assert 'metadata' in result
            assert 'functions_by_file' in result
            assert 'dma_operations' in result
            assert 'user_copy_operations' in result
            assert 'ioctl_operations' in result
            
            # Check metadata
            assert result['metadata']['parser_version'] == "2.0.0"
            
            # Check functions (should handle both legacy and new format)
            assert len(result['functions_by_file']) >= 1
            
            # Check operations
            assert len(result['dma_operations']) == 1
            assert len(result['user_copy_operations']) == 1
            assert len(result['ioctl_operations']) == 1
            
        finally:
            os.unlink(temp_file)
    
    def test_parse_file_not_found(self, parser):
        """Test parsing non-existent file"""
        with pytest.raises(ValueError, match="Error loading JSON file"):
            parser.parse_file("non_existent_file.json")
    
    def test_parse_functions_by_file_legacy_format(self, parser):
        """Test parsing legacy function_entries format"""
        data = {
            "function_entries": [
                {
                    "function_name": "legacy_func",
                    "file_path": "legacy.c",
                    "function_code": "void legacy_func(void) {}"
                }
            ]
        }
        
        functions = parser._parse_functions_by_file(data)
        
        assert len(functions) == 1
        assert isinstance(functions[0], FunctionEntry)
        assert functions[0].function_name == "legacy_func"
        assert functions[0].file_path == "legacy.c"
    
    def test_parse_functions_by_file_new_format(self, parser):
        """Test parsing new functions_by_file format"""
        data = {
            "functions_by_file": {
                "file1.c": [
                    {
                        "function_name": "func1",
                        "function_code": "void func1(void) {}"
                    }
                ],
                "file2.c": [
                    {
                        "function_name": "func2",
                        "function_code": "void func2(void) {}"
                    }
                ]
            }
        }
        
        functions = parser._parse_functions_by_file(data)
        
        assert len(functions) == 2
        assert all(isinstance(f, FunctionEntry) for f in functions)
        assert functions[0].file_path == "file1.c"
        assert functions[1].file_path == "file2.c"
    
    def test_parse_dma_operations(self, parser):
        """Test parsing DMA operations"""
        data = {
            "dma_operations": [
                {
                    "function_name": "dma_func",
                    "function_code": "void dma_func(void) {}",
                    "stack_trace": "trace here"
                }
            ]
        }
        
        dma_ops = parser._parse_dma_operations(data)
        
        assert len(dma_ops) == 1
        assert isinstance(dma_ops[0], DMAOperation)
        assert dma_ops[0].function_name == "dma_func"
        assert dma_ops[0].stack_trace == "trace here"
    
    def test_parse_user_copy_operations(self, parser):
        """Test parsing user copy operations"""
        data = {
            "user_copy_operations": [
                {
                    "function_name": "copy_func",
                    "function_code": "copy_from_user(dest, src, size)",
                    "operation": "copy_from_user",
                    "source": "src",
                    "destination": "dest"
                }
            ]
        }
        
        copy_ops = parser._parse_user_copy_operations(data)
        
        assert len(copy_ops) == 1
        assert isinstance(copy_ops[0], UserCopyOperation)
        assert copy_ops[0].function_name == "copy_func"
        assert copy_ops[0].operation == "copy_from_user"
    
    def test_parse_ioctl_operations(self, parser):
        """Test parsing IOCTL operations"""
        data = {
            "ioctl_operations": [
                {
                    "function_name": "ioctl_func",
                    "function_code": "long ioctl_func(uint cmd) {}",
                    "ioctl_cmd": "IOCTL_TEST",
                    "handler": "test_handler"
                }
            ]
        }
        
        ioctl_ops = parser._parse_ioctl_operations(data)
        
        assert len(ioctl_ops) == 1
        assert isinstance(ioctl_ops[0], IOCTLOperation)
        assert ioctl_ops[0].function_name == "ioctl_func"
        assert ioctl_ops[0].ioctl_cmd == "IOCTL_TEST"
    
    def test_empty_sections(self, parser):
        """Test handling of empty sections"""
        data = {}
        
        functions = parser._parse_functions_by_file(data)
        dma_ops = parser._parse_dma_operations(data)
        copy_ops = parser._parse_user_copy_operations(data)
        ioctl_ops = parser._parse_ioctl_operations(data)
        
        assert functions == []
        assert dma_ops == []
        assert copy_ops == []
        assert ioctl_ops == []
    
    def test_create_function_entry(self, parser):
        """Test _create_function_entry method"""
        entry = {
            "function_name": "test_func",
            "file_path": "test.c",
            "function_code": "void test_func(void) {}",
            "line_number": 42
        }
        
        func_entry = parser._create_function_entry(entry)
        
        assert isinstance(func_entry, FunctionEntry)
        assert func_entry.function_name == "test_func"
        assert func_entry.file_path == "test.c"
        assert func_entry.line_number == 42
    
    def test_create_function_entry_with_file_path_override(self, parser):
        """Test _create_function_entry with file_path override"""
        entry = {
            "function_name": "test_func",
            "file_path": "original.c",
            "function_code": "void test_func(void) {}"
        }
        
        func_entry = parser._create_function_entry(entry, "override.c")
        
        assert func_entry.file_path == "override.c"
    
    def test_verbose_logging(self, capsys):
        """Test verbose logging"""
        parser = JSONParser(verbose=True)
        parser._log_verbose("Test message")
        
        captured = capsys.readouterr()
        assert "[VERBOSE] Test message" in captured.out
