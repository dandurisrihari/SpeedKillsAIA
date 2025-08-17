#!/usr/bin/env python3
"""
Tests for memory parsing functionality
"""

import pytest
import tempfile
import json
from pathlib import Path
import sys

# Add the project root to the path
project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from src.preprocess.parsers.memory_parser import MemoryParser
from src.preprocess.core.patterns import LogPatterns
from src.preprocess.core.models import ReservedMemoryEntry, MemoryZone, MemoryNode, MemoryInfo
from src.preprocess import KernelLogParserEngine


class TestMemoryParser:
    """Test memory parser functionality"""
    
    def setup_method(self):
        """Setup for each test"""
        self.patterns = LogPatterns()
        self.parser = MemoryParser(self.patterns)
    
    def test_memory_parser_creation(self):
        """Test memory parser initialization"""
        assert self.parser is not None
        assert isinstance(self.parser.memory_info, MemoryInfo)
        assert len(self.parser.memory_info.reserved_memory) == 0
        assert len(self.parser.memory_info.memory_zones) == 0
        assert len(self.parser.memory_info.memory_nodes) == 0
    
    def test_can_parse_memory_lines(self):
        """Test can_parse method with various memory-related lines"""
        # CMA memory pool
        cma_line = "[    0.000000] Reserved memory: created CMA memory pool at 0x00000000c4000000, size 960 MiB"
        assert self.parser.can_parse(cma_line)
        
        # DMA memory pool
        dma_line = "[    0.000000] Reserved memory: created DMA memory pool at 0x0000000094300000, size 1 MiB"
        assert self.parser.can_parse(dma_line)
        
        # OF reserved memory
        of_line = "[    0.000000] OF: reserved mem: 0x00000000c4000000..0x00000000ffffffff (983040 KiB) map reusable linux,cma"
        assert self.parser.can_parse(of_line)
        
        # Memory zones
        zone_line = "[    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]"
        assert self.parser.can_parse(zone_line)
        
        # Memory nodes
        node_line = "[    0.000000]   node   0: [mem 0x0000000040000000-0x0000000055ffffff]"
        assert self.parser.can_parse(node_line)
        
        # Non-memory lines
        regular_line = "[    0.000000] Linux version 5.15.0"
        assert not self.parser.can_parse(regular_line)
    
    def test_parse_cma_pool(self):
        """Test parsing CMA memory pool"""
        line = "[    0.000000] Reserved memory: created CMA memory pool at 0x00000000c4000000, size 960 MiB"
        timestamp_data = ("0.000000", 0.0)
        
        success, result = self.parser.parse(line, timestamp_data)
        
        assert success
        assert isinstance(result, ReservedMemoryEntry)
        assert result.start_address == "0x00000000c4000000"
        assert result.size_kb == 960 * 1024  # 960 MiB in KiB
        assert result.size_readable == "960 MiB"
        assert result.name == "CMA memory pool"
        assert result.memory_type == "CMA"
        assert result.compatible_id == "shared-dma-pool"
        assert result.mapping_type == "map"
        
        # Check it was added to memory_info
        memory_info = self.parser.get_memory_info()
        assert len(memory_info.reserved_memory) == 1
        assert len(memory_info.cma_pools) == 1
        assert memory_info.total_reserved_memory_kb == 960 * 1024
    
    def test_parse_dma_pool(self):
        """Test parsing DMA memory pool"""
        line = "[    0.000000] Reserved memory: created DMA memory pool at 0x0000000094300000, size 1 MiB"
        timestamp_data = ("0.000000", 0.0)
        
        success, result = self.parser.parse(line, timestamp_data)
        
        assert success
        assert isinstance(result, ReservedMemoryEntry)
        assert result.start_address == "0x0000000094300000"
        assert result.size_kb == 1024  # 1 MiB in KiB
        assert result.size_readable == "1 MiB"
        assert result.memory_type == "DMA"
        
        # Check it was added to memory_info
        memory_info = self.parser.get_memory_info()
        assert len(memory_info.reserved_memory) == 1
        assert len(memory_info.dma_pools) == 1
    
    def test_parse_of_reserved_memory(self):
        """Test parsing OF reserved memory ranges"""
        line = "[    0.000000] OF: reserved mem: 0x0000000056000000..0x0000000057dfffff (30720 KiB) nomap non-reusable optee_core@56000000"
        timestamp_data = ("0.000000", 0.0)
        
        success, result = self.parser.parse(line, timestamp_data)
        
        assert success
        assert isinstance(result, ReservedMemoryEntry)
        assert result.start_address == "0x0000000056000000"
        assert result.end_address == "0x0000000057dfffff"
        assert result.size_kb == 30720
        assert result.size_readable == "30720 KiB"
        assert result.name == "optee_core@56000000"
        assert result.memory_type == "non-reusable"
        assert result.mapping_type == "nomap"
    
    def test_parse_memory_zone(self):
        """Test parsing memory zones"""
        line = "[    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]"
        timestamp_data = ("0.000000", 0.0)
        
        success, result = self.parser.parse(line, timestamp_data)
        
        assert success
        assert isinstance(result, MemoryZone)
        assert result.zone_name == "DMA"
        assert result.start_address == "0x0000000040000000"
        assert result.end_address == "0x00000000ffffffff"
        assert result.status == "active"
        
        # Test empty zone
        empty_line = "[    0.000000]   DMA32    empty"
        success, result = self.parser.parse(empty_line, timestamp_data)
        
        assert success
        assert isinstance(result, MemoryZone)
        assert result.zone_name == "DMA32"
        assert result.start_address is None
        assert result.end_address is None
        assert result.status == "empty"
    
    def test_parse_memory_zone_unavailable(self):
        """Test parsing memory zone unavailable pages"""
        line = "[    0.000000] On node 0, zone DMA: 8192 pages in unavailable ranges"
        timestamp_data = ("0.000000", 0.0)
        
        success, result = self.parser.parse(line, timestamp_data)
        
        assert success
        assert isinstance(result, MemoryZone)
        assert result.zone_name == "DMA"
        assert result.unavailable_pages == 8192
        assert result.status == "unavailable"
    
    def test_parse_memory_node(self):
        """Test parsing memory nodes"""
        line = "[    0.000000]   node   0: [mem 0x0000000040000000-0x0000000055ffffff]"
        timestamp_data = ("0.000000", 0.0)
        
        success, result = self.parser.parse(line, timestamp_data)
        
        assert success
        assert isinstance(result, MemoryNode)
        assert result.node_id == 0
        assert result.start_address == "0x0000000040000000"
        assert result.end_address == "0x0000000055ffffff"
    
    def test_size_conversion(self):
        """Test size conversion to KiB"""
        # Test various size units
        assert self.parser._convert_to_kb(1024, "KiB") == 1024
        assert self.parser._convert_to_kb(1, "MiB") == 1024
        assert self.parser._convert_to_kb(1, "GiB") == 1024 * 1024
        assert self.parser._convert_to_kb(1024, "B") == 1
        assert self.parser._convert_to_kb(100, "unknown") == 100  # Default to KiB
    
    def test_memory_info_to_dict(self):
        """Test MemoryInfo serialization to dictionary"""
        # Add some test data
        line1 = "[    0.000000] Reserved memory: created CMA memory pool at 0x00000000c4000000, size 960 MiB"
        line2 = "[    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]"
        line3 = "[    0.000000]   node   0: [mem 0x0000000040000000-0x0000000055ffffff]"
        
        timestamp_data = ("0.000000", 0.0)
        
        self.parser.parse(line1, timestamp_data)
        self.parser.parse(line2, timestamp_data)
        self.parser.parse(line3, timestamp_data)
        
        memory_info = self.parser.get_memory_info()
        data_dict = memory_info.to_dict()
        
        assert 'reserved_memory' in data_dict
        assert 'memory_zones' in data_dict
        assert 'memory_nodes' in data_dict
        assert 'total_reserved_memory_kb' in data_dict
        assert 'cma_pools' in data_dict
        assert 'dma_pools' in data_dict
        assert 'summary' in data_dict
        
        summary = data_dict['summary']
        assert summary['total_reserved_entries'] == 1
        assert summary['total_zones'] == 1
        assert summary['total_nodes'] == 1
        assert summary['total_cma_pools'] == 1
        assert summary['total_dma_pools'] == 0
    
    def test_parser_reset(self):
        """Test parser reset functionality"""
        # Add some data
        line = "[    0.000000] Reserved memory: created CMA memory pool at 0x00000000c4000000, size 960 MiB"
        timestamp_data = ("0.000000", 0.0)
        self.parser.parse(line, timestamp_data)
        
        # Verify data exists
        memory_info = self.parser.get_memory_info()
        assert len(memory_info.reserved_memory) == 1
        
        # Reset and verify data is cleared
        self.parser.reset()
        memory_info = self.parser.get_memory_info()
        assert len(memory_info.reserved_memory) == 0
        assert len(memory_info.cma_pools) == 0
        assert memory_info.total_reserved_memory_kb == 0


class TestMemoryIntegration:
    """Test memory parsing integration with main engine"""
    
    def test_engine_with_memory_parsing(self):
        """Test that the engine includes memory parsing"""
        engine = KernelLogParserEngine(show_ui=False)
        
        # Check that memory parser is initialized
        assert hasattr(engine, 'memory_parser')
        assert engine.memory_parser is not None
    
    def test_full_memory_log_parsing(self):
        """Test parsing a complete memory log with the engine"""
        # Create a temporary log file with memory information
        memory_log = """[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
[    0.000000] Linux version 5.15.0-imx (oe-user@oe-host)
[    0.000000] Reserved memory: created CMA memory pool at 0x00000000c4000000, size 960 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible id shared-dma-pool
[    0.000000] OF: reserved mem: 0x00000000c4000000..0x00000000ffffffff (983040 KiB) map reusable linux,cma
[    0.000000] OF: reserved mem: 0x0000000056000000..0x0000000057dfffff (30720 KiB) nomap non-reusable optee_core@56000000
[    0.000000] OF: reserved mem: 0x0000000057e00000..0x0000000057ffffff (2048 KiB) nomap non-reusable optee_shm@57e00000
[    0.000000] Reserved memory: created DMA memory pool at 0x0000000094300000, size 1 MiB
[    0.000000] OF: reserved mem: initialized node vdev0buffer@94300000, compatible id shared-dma-pool
[    0.000000] OF: reserved mem: 0x0000000094300000..0x00000000943fffff (1024 KiB) nomap non-reusable vdev0buffer@94300000
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000001bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x0000000055ffffff]
[    0.000000]   node   0: [mem 0x0000000058000000-0x00000000923fffff]
[    0.000000]   node   0: [mem 0x0000000092400000-0x00000000943fffff]
[    0.000000]   node   0: [mem 0x0000000094400000-0x00000000ffffffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000010fffffff]
[    0.000000]   node   0: [mem 0x0000000110000000-0x00000001bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000001bfffffff]
[    0.000000] On node 0, zone DMA: 8192 pages in unavailable ranges
"""
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(memory_log)
            temp_path = f.name
        
        try:
            engine = KernelLogParserEngine(show_ui=False)
            result_dict = engine.parse_log_file(temp_path)
            
            # Verify memory_info is included in results
            assert result_dict is not None
            assert 'memory_info' in result_dict
            assert result_dict['memory_info'] is not None
            
            # Check that memory information was parsed
            memory_info = result_dict['memory_info']
            assert len(memory_info['reserved_memory']) > 0
            assert len(memory_info['memory_zones']) > 0
            assert len(memory_info['memory_nodes']) > 0
            assert memory_info['total_reserved_memory_kb'] > 0
            
            # Check specific entries
            assert len(memory_info['cma_pools']) >= 1
            assert len(memory_info['dma_pools']) >= 1
            
            # Check JSON serialization includes memory info
            assert 'memory_info' in result_dict
            
            memory_section = result_dict['memory_info']
            assert 'reserved_memory' in memory_section
            assert 'memory_zones' in memory_section
            assert 'memory_nodes' in memory_section
            assert 'summary' in memory_section
            
            # Verify can serialize to JSON
            json_str = json.dumps(result_dict, indent=2)
            assert isinstance(json_str, str)
            assert len(json_str) > 0
            
        finally:
            import os
            os.unlink(temp_path)
    
    def test_memory_parser_with_existing_functionality(self):
        """Test that memory parsing doesn't interfere with existing functionality"""
        # Create log with both memory info and instrumented entries
        mixed_log = """[    0.000000] Reserved memory: created CMA memory pool at 0x00000000c4000000, size 960 MiB
[    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]
[    2.196406] FUNC_ENTRY: Entering function gckIOMMU_Construct at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_iommu.c:96
[    2.205081] DMA_INSTRUMENT: About to call dma_map_page from function gckIOMMU_Construct at drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_iommu.c:114
[    0.000000]   node   0: [mem 0x0000000040000000-0x0000000055ffffff]
"""
        
        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
            f.write(mixed_log)
            temp_path = f.name
        
        try:
            engine = KernelLogParserEngine(show_ui=False)
            result_dict = engine.parse_log_file(temp_path)
            
            # Verify both memory info and instrumented entries are parsed
            assert result_dict is not None
            
            # Check memory info
            assert 'memory_info' in result_dict
            assert result_dict['memory_info'] is not None
            memory_info = result_dict['memory_info']
            assert len(memory_info['reserved_memory']) >= 1
            assert len(memory_info['memory_zones']) >= 1
            assert len(memory_info['memory_nodes']) >= 1
            
            # Check function entries
            assert 'functions_by_file' in result_dict
            total_functions = sum(len(funcs) for funcs in result_dict['functions_by_file'].values())
            assert total_functions >= 1
            
            # Check DMA operations
            assert 'dma_operations' in result_dict
            dma_operations = result_dict['dma_operations']
            assert len(dma_operations) >= 1
            
        finally:
            import os
            os.unlink(temp_path)


class TestMemoryPatterns:
    """Test memory-related regex patterns"""
    
    def setup_method(self):
        """Setup for each test"""
        self.patterns = LogPatterns()
    
    def test_reserved_memory_cma_pattern(self):
        """Test CMA memory pool pattern"""
        line = "Reserved memory: created CMA memory pool at 0x00000000c4000000, size 960 MiB"
        match = self.patterns.search_reserved_memory_cma(line)
        
        assert match is not None
        assert match.group(1) == "0x00000000c4000000"
        assert match.group(2) == "960"
        assert match.group(3) == "MiB"
    
    def test_reserved_memory_dma_pattern(self):
        """Test DMA memory pool pattern"""
        line = "Reserved memory: created DMA memory pool at 0x0000000094300000, size 1 MiB"
        match = self.patterns.search_reserved_memory_dma(line)
        
        assert match is not None
        assert match.group(1) == "0x0000000094300000"
        assert match.group(2) == "1"
        assert match.group(3) == "MiB"
    
    def test_of_reserved_mem_range_pattern(self):
        """Test OF reserved memory range pattern"""
        line = "OF: reserved mem: 0x0000000056000000..0x0000000057dfffff (30720 KiB) nomap non-reusable optee_core@56000000"
        match = self.patterns.search_of_reserved_mem_range(line)
        
        assert match is not None
        assert match.group(1) == "0x0000000056000000"
        assert match.group(2) == "0x0000000057dfffff"
        assert match.group(3) == "30720"
        assert match.group(4) == "nomap"
        assert match.group(5) == "non-reusable"
        assert match.group(6) == "optee_core@56000000"
    
    def test_memory_zone_pattern(self):
        """Test memory zone pattern"""
        # Active zone
        line1 = "  DMA      [mem 0x0000000040000000-0x00000000ffffffff]"
        match1 = self.patterns.search_memory_zone(line1)
        assert match1 is not None
        assert match1.group(1) == "DMA"
        assert match1.group(2) == "0x0000000040000000"
        assert match1.group(3) == "0x00000000ffffffff"
        
        # Empty zone
        line2 = "  DMA32    empty"
        match2 = self.patterns.search_memory_zone(line2)
        assert match2 is not None
        assert match2.group(1) == "DMA32"
        assert match2.group(2) is None
        assert match2.group(3) is None
    
    def test_memory_node_pattern(self):
        """Test memory node pattern"""
        line = "  node   0: [mem 0x0000000040000000-0x0000000055ffffff]"
        match = self.patterns.search_memory_node(line)
        
        assert match is not None
        assert match.group(1) == "0"
        assert match.group(2) == "0x0000000040000000"
        assert match.group(3) == "0x0000000055ffffff"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
