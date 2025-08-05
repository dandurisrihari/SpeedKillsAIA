#!/usr/bin/env python3
"""
Memory information parser for kernel boot logs

Parses reserved memory, memory zones, and memory nodes from kernel boot logs.
"""

from typing import Tuple, Optional, List
import re
from .base import BaseParser
from ..core.models import ReservedMemoryEntry, MemoryZone, MemoryNode, MemoryInfo
from ..core.patterns import LogPatterns


class MemoryParser(BaseParser):
    """Parser for memory-related information in kernel boot logs"""
    
    def __init__(self, patterns: LogPatterns):
        super().__init__(patterns)
        self.memory_info = MemoryInfo()
        self.last_of_node_name = None  # Track the last initialized node name for range parsing
        self.current_main_pool = None  # Track the current main pool (CMA/DMA) to associate OF components
    
    def can_parse(self, line: str) -> bool:
        """Check if line contains memory-related content"""
        memory_keywords = [
            'Reserved memory:', 'OF: reserved mem:', 'Zone ranges:',
            'DMA      [mem', 'DMA32    ', 'Normal   [mem', 'Movable zone',
            'Early memory node ranges', 'node   ', 'On node ', 'zone '
        ]
        return any(keyword in line for keyword in memory_keywords)
    
    def parse(self, line: str, timestamp_data=None, context=None) -> Tuple[bool, Optional[object]]:
        """
        Parse memory-related lines
        
        Args:
            timestamp_data: Tuple of (readable_time_str, numeric_timestamp) or single float for backward compatibility
        
        Returns:
            Tuple of (success, result) where result can be various memory objects
        """
        # Handle both old (float) and new (tuple) timestamp formats
        if isinstance(timestamp_data, tuple):
            time_str, numeric_timestamp = timestamp_data
        else:
            numeric_timestamp = timestamp_data or 0.0
            time_str = str(numeric_timestamp)
        
        # Try parsing different memory patterns
        result = None
        
        # Parse CMA memory pools
        match = self.patterns.search_reserved_memory_cma(line)
        if match:
            result = self._parse_cma_pool(match, time_str, numeric_timestamp)
        
        # Parse DMA memory pools
        if not result:
            match = self.patterns.search_reserved_memory_dma(line)
            if match:
                result = self._parse_dma_pool(match, time_str, numeric_timestamp)
        
        # Parse OF reserved memory initialization
        if not result:
            match = self.patterns.search_of_reserved_mem_init(line)
            if match:
                result = self._parse_of_reserved_init(match, time_str, numeric_timestamp)
        
        # Parse OF reserved memory ranges
        if not result:
            match = self.patterns.search_of_reserved_mem_range(line)
            if match:
                result = self._parse_of_reserved_range(match, time_str, numeric_timestamp)
        
        # Parse memory zones
        if not result:
            match = self.patterns.search_memory_zone(line)
            if match:
                result = self._parse_memory_zone(match, time_str, numeric_timestamp)
        
        # Parse memory zone unavailable pages
        if not result:
            match = self.patterns.search_memory_zone_unavailable(line)
            if match:
                result = self._parse_zone_unavailable(match, time_str, numeric_timestamp)
        
        # Parse memory nodes
        if not result:
            match = self.patterns.search_memory_node(line)
            if match:
                result = self._parse_memory_node(match, time_str, numeric_timestamp)
        
        return result is not None, result
    
    def _is_duplicate_pool(self, address: str, size_kb: int, memory_type: str) -> bool:
        """Check if a memory pool with the same address, size, and type already exists"""
        for existing_entry in self.memory_info.reserved_memory:
            if (existing_entry.is_main_pool and 
                existing_entry.start_address == address and 
                existing_entry.size_kb == size_kb and 
                existing_entry.memory_type == memory_type):
                return True
        return False
    
    def _is_duplicate_zone(self, zone_name: str, start_address: str, end_address: str, status: str) -> bool:
        """Check if a memory zone with the same attributes already exists"""
        for existing_zone in self.memory_info.memory_zones:
            if (existing_zone.zone_name == zone_name and 
                existing_zone.start_address == start_address and 
                existing_zone.end_address == end_address and 
                existing_zone.status == status):
                return True
        return False
    
    def _is_duplicate_node(self, node_id: int, start_address: str, end_address: str) -> bool:
        """Check if a memory node with the same attributes already exists"""
        for existing_node in self.memory_info.memory_nodes:
            if (existing_node.node_id == node_id and 
                existing_node.start_address == start_address and 
                existing_node.end_address == end_address):
                return True
        return False
    
    def _parse_cma_pool(self, match, time_str: str, timestamp: float) -> ReservedMemoryEntry:
        """Parse CMA memory pool entry"""
        address = match.group(1)
        size_value = int(match.group(2))
        size_unit = match.group(3)
        
        # Convert to KiB
        size_kb = self._convert_to_kb(size_value, size_unit)
        size_readable = f"{size_value} {size_unit}"
        
        # Check for duplicate pool
        if self._is_duplicate_pool(address, size_kb, "CMA"):
            # Find existing pool and set as current main pool for components
            for existing_entry in self.memory_info.reserved_memory:
                if (existing_entry.is_main_pool and 
                    existing_entry.start_address == address and 
                    existing_entry.size_kb == size_kb and 
                    existing_entry.memory_type == "CMA"):
                    self.current_main_pool = existing_entry
                    return existing_entry
        
        entry = ReservedMemoryEntry(
            start_address=address,
            end_address="",  # Will be calculated if needed
            size_kb=size_kb,
            size_readable=size_readable,
            name="CMA memory pool",  # User-friendly display name
            memory_type="CMA",
            compatible_id="shared-dma-pool",
            mapping_type="map",
            timestamp=timestamp,
            timestamp_str=time_str,
            is_main_pool=True  # Mark as main pool
        )
        
        self.memory_info.reserved_memory.append(entry)
        self.memory_info.cma_pools.append(entry)
        self.memory_info.total_reserved_memory_kb += size_kb
        
        # Set as current main pool for subsequent OF components
        self.current_main_pool = entry
        
        return entry
    
    def _parse_dma_pool(self, match, time_str: str, timestamp: float) -> ReservedMemoryEntry:
        """Parse DMA memory pool entry"""
        address = match.group(1)
        size_value = int(match.group(2))
        size_unit = match.group(3)
        
        # Convert to KiB
        size_kb = self._convert_to_kb(size_value, size_unit)
        size_readable = f"{size_value} {size_unit}"
        
        # Check for duplicate pool
        if self._is_duplicate_pool(address, size_kb, "DMA"):
            # Find existing pool and set as current main pool for components
            for existing_entry in self.memory_info.reserved_memory:
                if (existing_entry.is_main_pool and 
                    existing_entry.start_address == address and 
                    existing_entry.size_kb == size_kb and 
                    existing_entry.memory_type == "DMA"):
                    self.current_main_pool = existing_entry
                    return existing_entry
        
        entry = ReservedMemoryEntry(
            start_address=address,
            end_address="",
            size_kb=size_kb,
            size_readable=size_readable,
            name="DMA memory pool",  # User-friendly display name
            memory_type="DMA",
            compatible_id="shared-dma-pool",
            mapping_type="nomap",
            timestamp=timestamp,
            timestamp_str=time_str,
            is_main_pool=True  # Mark as main pool
        )
        
        self.memory_info.reserved_memory.append(entry)
        self.memory_info.dma_pools.append(entry)
        self.memory_info.total_reserved_memory_kb += size_kb
        
        # Set as current main pool for subsequent OF components
        self.current_main_pool = entry
        
        return entry
    
    def _parse_of_reserved_init(self, match, time_str: str, timestamp: float) -> str:
        """Parse OF reserved memory initialization"""
        node_name = match.group(1)
        compatible_id = match.group(2)
        
        # Store the node name for subsequent range parsing
        self.last_of_node_name = node_name
        
        return f"initialized_node_{node_name}"
    
    def _parse_of_reserved_range(self, match, time_str: str, timestamp: float) -> ReservedMemoryEntry:
        """Parse OF reserved memory range"""
        start_addr = match.group(1)
        end_addr = match.group(2)
        size_kb = int(match.group(3))
        mapping_type = match.group(4)  # map or nomap
        reusability = match.group(5)   # reusable or non-reusable
        name = match.group(6)
        
        # Determine memory type based on reusability - test expects exact values
        memory_type = reusability  # Keep the exact value from the pattern match
        if "cma" in name.lower():
            memory_type = "CMA"
        elif "dma" in name.lower():
            memory_type = "DMA"
        
        entry = ReservedMemoryEntry(
            start_address=start_addr,
            end_address=end_addr,
            size_kb=size_kb,
            size_readable=f"{size_kb} KiB",
            name=name,
            memory_type=memory_type,
            compatible_id=None,
            mapping_type=mapping_type,
            timestamp=timestamp,
            timestamp_str=time_str,
            is_main_pool=False  # Mark as component
        )
        
        # If this OF entry belongs to the current main pool, add it as a component
        if self.current_main_pool and self._is_component_of_current_pool(entry, name):
            self.current_main_pool.components.append(entry)
        else:
            # Standalone OF entry - add to main reserved memory list
            self.memory_info.reserved_memory.append(entry)
            self.memory_info.total_reserved_memory_kb += size_kb
            
            # Add to appropriate pool list
            if memory_type == "CMA":
                self.memory_info.cma_pools.append(entry)
            elif memory_type == "DMA":
                self.memory_info.dma_pools.append(entry)
            
            # Don't reset current main pool here - let it continue for subsequent OF entries
            # The main pool will be reset when a new main pool is created
        
        return entry
    
    def _is_component_of_current_pool(self, entry: ReservedMemoryEntry, name: str) -> bool:
        """Check if an OF entry is a component of the current main pool"""
        if not self.current_main_pool:
            return False
        
        # For CMA pools, ALL OF entries following the pool creation are components
        # until we encounter another main pool creation
        if self.current_main_pool.memory_type == "CMA":
            return True
            
        # For DMA pools, ALL OF entries following the pool creation are components
        # until we encounter another main pool creation (similar to CMA)
        if self.current_main_pool.memory_type == "DMA":
            return True
                
        return False
    
    def _parse_memory_zone(self, match, time_str: str, timestamp: float) -> MemoryZone:
        """Parse memory zone information"""
        zone_name = match.group(1)
        start_addr = match.group(2) if match.group(2) else None
        end_addr = match.group(3) if match.group(3) else None
        
        # Determine status
        status = "empty" if start_addr is None else "active"
        
        # Check for duplicate zone
        if self._is_duplicate_zone(zone_name, start_addr, end_addr, status):
            # Find and return existing zone
            for existing_zone in self.memory_info.memory_zones:
                if (existing_zone.zone_name == zone_name and 
                    existing_zone.start_address == start_addr and 
                    existing_zone.end_address == end_addr and 
                    existing_zone.status == status):
                    return existing_zone
        
        zone = MemoryZone(
            zone_name=zone_name,
            start_address=start_addr,
            end_address=end_addr,
            status=status,
            timestamp=timestamp,
            timestamp_str=time_str
        )
        
        self.memory_info.memory_zones.append(zone)
        return zone
    
    def _parse_zone_unavailable(self, match, time_str: str, timestamp: float) -> MemoryZone:
        """Parse memory zone unavailable pages information"""
        zone_name = match.group(1)
        unavailable_pages = int(match.group(2))
        
        # Find existing zone or create new one
        existing_zone = None
        for zone in self.memory_info.memory_zones:
            if zone.zone_name == zone_name:
                existing_zone = zone
                break
        
        if existing_zone:
            existing_zone.unavailable_pages = unavailable_pages
            existing_zone.status = "unavailable" if unavailable_pages > 0 else "available"
            return existing_zone
        else:
            # Create new zone entry
            zone = MemoryZone(
                zone_name=zone_name,
                unavailable_pages=unavailable_pages,
                status="unavailable" if unavailable_pages > 0 else "available",
                timestamp=timestamp,
                timestamp_str=time_str
            )
            self.memory_info.memory_zones.append(zone)
            return zone
    
    def _parse_memory_node(self, match, time_str: str, timestamp: float) -> MemoryNode:
        """Parse memory node range"""
        node_id = int(match.group(1))
        start_addr = match.group(2)
        end_addr = match.group(3)
        
        # Check for duplicate node
        if self._is_duplicate_node(node_id, start_addr, end_addr):
            # Find and return existing node
            for existing_node in self.memory_info.memory_nodes:
                if (existing_node.node_id == node_id and 
                    existing_node.start_address == start_addr and 
                    existing_node.end_address == end_addr):
                    return existing_node
        
        node = MemoryNode(
            node_id=node_id,
            start_address=start_addr,
            end_address=end_addr,
            timestamp=timestamp,
            timestamp_str=time_str
        )
        
        self.memory_info.memory_nodes.append(node)
        return node
    
    def _convert_to_kb(self, value: int, unit: str) -> int:
        """Convert size value to KiB"""
        unit_lower = unit.lower()
        
        if unit_lower in ['kb', 'kib']:
            return value
        elif unit_lower in ['mb', 'mib']:
            return value * 1024
        elif unit_lower in ['gb', 'gib']:
            return value * 1024 * 1024
        elif unit_lower in ['b', 'bytes']:
            return value // 1024
        else:
            # Default to treating as KiB
            return value
    
    def get_memory_info(self) -> MemoryInfo:
        """Get the collected memory information"""
        return self.memory_info
    
    def reset(self):
        """Reset the parser state"""
        self.memory_info = MemoryInfo()
        self.last_of_node_name = None
