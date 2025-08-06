#!/usr/bin/env python3
"""
Comprehensive tests for webviewer memory information display
"""

import unittest
import sys
import json
import tempfile
from pathlib import Path
from unittest.mock import patch, MagicMock

# Add the src directory to Python path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))

try:
    from src.webviewer.ui import create_app, start_web_ui
    FLASK_AVAILABLE = True
except ImportError:
    FLASK_AVAILABLE = False


class TestMemoryDisplay(unittest.TestCase):
    """Test memory information display in webviewer"""
    
    def setUp(self):
        """Set up test fixtures with comprehensive memory data"""
        self.maxDiff = None
        self.test_memory_data = {
            "metadata": {
                "parser_version": "2.0.0",
                "parsed_at": "2023-01-01T12:00:00.000000",
                "log_file": "test_memory.log",
                "total_lines": 500,
                "parsed_lines": 250,
                "unique_entries": 50
            },
            "functions_by_file": {},
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": [],
            "statistics": {
                "unique_function_entries": 0,
                "unique_dma_operations": 0,
                "unique_user_copy_operations": 0,
                "unique_ioctl_operations": 0,
                "total_files": 10,
                "files_need_analysis": 5,
                "files_with_functions_entrypoint_instrumented": 3,
                "total_duplicates_skipped": 2,
                "total_files_analyzed": 10,
                "files_instrumented_with_function_entries": 3
            },
            "memory_info": {
                "reserved_memory": [
                    {
                        "start_address": "0x00000000c4000000",
                        "end_address": "0x00000000ffffffff",
                        "size_kb": 983040,
                        "size_readable": "960 MiB",
                        "name": "linux,cma",
                        "memory_type": "CMA",
                        "compatible_id": "linux,cma",
                        "mapping_type": "reusable",
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    },
                    {
                        "start_address": "0x0000000094300000",
                        "end_address": "0x00000000943fffff",
                        "size_kb": 1024,
                        "size_readable": "1 MiB",
                        "name": "dma_pool",
                        "memory_type": "DMA",
                        "compatible_id": None,
                        "mapping_type": "nomap",
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    },
                    {
                        "start_address": "0x0000000080000000",
                        "end_address": "0x00000000800fffff",
                        "size_kb": 1024,
                        "size_readable": "1 MiB",
                        "name": "shared_dma",
                        "memory_type": "non-reusable",
                        "compatible_id": "shared-dma-pool",
                        "mapping_type": "map",
                        "timestamp": 1.5,
                        "timestamp_str": "1.500000"
                    }
                ],
                "memory_zones": [
                    {
                        "zone_name": "DMA",
                        "start_address": "0x0000000040000000",
                        "end_address": "0x00000000ffffffff",
                        "status": "active",
                        "unavailable_pages": None,
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    },
                    {
                        "zone_name": "DMA32",
                        "start_address": "0x0000000100000000",
                        "end_address": "0x00000001ffffffff",
                        "status": "active",
                        "unavailable_pages": None,
                        "timestamp": 0.5,
                        "timestamp_str": "0.500000"
                    },
                    {
                        "zone_name": "Normal",
                        "start_address": None,
                        "end_address": None,
                        "status": "empty",
                        "unavailable_pages": 128,
                        "timestamp": 1.0,
                        "timestamp_str": "1.000000"
                    },
                    {
                        "zone_name": "Movable",
                        "start_address": "0x0000000200000000",
                        "end_address": "0x00000002ffffffff",
                        "status": "active",
                        "unavailable_pages": None,
                        "timestamp": 2.0,
                        "timestamp_str": "2.000000"
                    }
                ],
                "memory_nodes": [
                    {
                        "node_id": 0,
                        "start_address": "0x0000000040000000",
                        "end_address": "0x0000000055ffffff",
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    },
                    {
                        "node_id": 1,
                        "start_address": "0x0000000100000000",
                        "end_address": "0x000000011fffffff",
                        "timestamp": 0.5,
                        "timestamp_str": "0.500000"
                    }
                ],
                "total_reserved_memory_kb": 985088,
                "cma_pools": [
                    {
                        "start_address": "0x00000000c4000000",
                        "end_address": "0x00000000ffffffff",
                        "size_kb": 983040,
                        "size_readable": "960 MiB",
                        "name": "linux,cma",
                        "memory_type": "CMA",
                        "compatible_id": "linux,cma",
                        "mapping_type": "reusable",
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    }
                ],
                "dma_pools": [
                    {
                        "start_address": "0x0000000094300000",
                        "end_address": "0x00000000943fffff",
                        "size_kb": 1024,
                        "size_readable": "1 MiB",
                        "name": "dma_pool",
                        "memory_type": "DMA",
                        "compatible_id": None,
                        "mapping_type": "nomap",
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    }
                ],
                "summary": {
                    "total_reserved_entries": 3,
                    "total_zones": 4,
                    "total_nodes": 2,
                    "total_cma_pools": 1,
                    "total_dma_pools": 1
                }
            }
        }

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_info_comprehensive_display(self):
        """Test comprehensive memory information display"""
        app = create_app()
        
        with app.test_client() as client:
            # Set data in session
            with client.session_transaction() as sess:
                sess['results'] = self.test_memory_data
                
            response = client.get('/')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            
            # Check memory tab presence
            self.assertIn('🧠 Memory Info', content)
            self.assertIn('onclick="showTab(\'memory\', this)"', content)
            
            # Check memory statistics in stats grid
            self.assertIn('Reserved Memory', content)
            self.assertIn('CMA Pools', content)
            self.assertIn('Memory Zones', content)
            self.assertIn('Memory Nodes', content)
            
            # Check memory summary calculations
            self.assertIn('962.0 MB', content)  # (985088 / 1024) rounded
            
            # Check specific memory entries
            self.assertIn('linux,cma', content)
            self.assertIn('960 MiB', content)
            self.assertIn('dma_pool', content)
            self.assertIn('shared_dma', content)
            
            # Check memory types and badges
            self.assertIn('CMA', content)
            self.assertIn('DMA', content)
            self.assertIn('non-reusable', content)
            
            # Check memory zones
            self.assertIn('DMA32', content)
            self.assertIn('Normal', content)
            self.assertIn('Movable', content)
            
            # Check memory nodes
            self.assertIn('Node 0', content)
            self.assertIn('Node 1', content)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_tab_navigation(self):
        """Test memory tab navigation elements"""
        app = create_app()
        
        with app.test_client() as client:
            with client.session_transaction() as sess:
                sess['results'] = self.test_memory_data
                
            response = client.get('/')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            
            # Check memory sub-tabs
            self.assertIn('onclick="showMemoryTab(\'reserved\')"', content)
            self.assertIn('onclick="showMemoryTab(\'zones\')"', content)
            self.assertIn('onclick="showMemoryTab(\'nodes\')"', content)
            
            # Check tab content containers
            self.assertIn('id="reserved"', content)
            self.assertIn('id="zones"', content)
            self.assertIn('id="nodes"', content)
            
            # Check JavaScript function
            self.assertIn('function showMemoryTab', content)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_css_styling(self):
        """Test memory-specific CSS classes and styling"""
        app = create_app()
        
        with app.test_client() as client:
            with client.session_transaction() as sess:
                sess['results'] = self.test_memory_data
                
            response = client.get('/')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            
            # Check CSS classes for memory styling
            self.assertIn('.memory-summary', content)
            self.assertIn('.memory-tabs', content)
            self.assertIn('.memory-tab', content)
            self.assertIn('.memory-tab-content', content)
            self.assertIn('.memory-grid', content)
            self.assertIn('.memory-item', content)
            self.assertIn('.memory-header', content)
            self.assertIn('.memory-details', content)
            
            # Check badge CSS
            self.assertIn('.memory-type-badge', content)
            self.assertIn('.zone-badge', content)
            self.assertIn('.node-badge', content)
            
            # Check specific type styling
            self.assertIn('.memory-type-badge.cma', content)
            self.assertIn('.memory-type-badge.dma', content)
            self.assertIn('.memory-type-badge.reusable', content)
            self.assertIn('.memory-type-badge.non-reusable', content)
            
            # Check zone styling
            self.assertIn('.zone-badge.dma', content)
            self.assertIn('.zone-badge.dma32', content)
            self.assertIn('.zone-badge.normal', content)
            self.assertIn('.zone-badge.movable', content)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_api_endpoint_comprehensive(self):
        """Test memory API endpoint with comprehensive data"""
        app = create_app()
        
        with app.test_client() as client:
            with client.session_transaction() as sess:
                sess['results'] = self.test_memory_data
                
            response = client.get('/api/memory-info')
            self.assertEqual(response.status_code, 200)
            
            data = json.loads(response.data)
            
            # Verify structure
            self.assertIn('reserved_memory', data)
            self.assertIn('memory_zones', data)
            self.assertIn('memory_nodes', data)
            self.assertIn('cma_pools', data)
            self.assertIn('dma_pools', data)
            self.assertIn('summary', data)
            self.assertIn('total_reserved_memory_kb', data)
            
            # Verify counts
            self.assertEqual(len(data['reserved_memory']), 3)
            self.assertEqual(len(data['memory_zones']), 4)
            self.assertEqual(len(data['memory_nodes']), 2)
            self.assertEqual(len(data['cma_pools']), 1)
            self.assertEqual(len(data['dma_pools']), 1)
            
            # Verify summary
            summary = data['summary']
            self.assertEqual(summary['total_reserved_entries'], 3)
            self.assertEqual(summary['total_zones'], 4)
            self.assertEqual(summary['total_nodes'], 2)
            self.assertEqual(summary['total_cma_pools'], 1)
            self.assertEqual(summary['total_dma_pools'], 1)
            
            # Verify total memory
            self.assertEqual(data['total_reserved_memory_kb'], 985088)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_specific_data_display(self):
        """Test specific memory data is correctly displayed"""
        app = create_app()
        
        with app.test_client() as client:
            with client.session_transaction() as sess:
                sess['results'] = self.test_memory_data
                
            response = client.get('/')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            
            # Test specific addresses
            self.assertIn('0x00000000c4000000', content)
            self.assertIn('0x0000000094300000', content)
            self.assertIn('0x0000000080000000', content)
            
            # Test size formats
            self.assertIn('960 MiB', content)
            self.assertIn('1 MiB', content)
            
            # Test mapping types
            self.assertIn('reusable', content)
            self.assertIn('nomap', content)
            self.assertIn('map', content)
            
            # Test compatible IDs
            self.assertIn('shared-dma-pool', content)
            
            # Test zone statuses
            self.assertIn('active', content)
            self.assertIn('empty', content)
            
            # Test unavailable pages
            self.assertIn('128', content)  # unavailable pages

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_empty_sections(self):
        """Test display when memory sections are empty"""
        # Create data with empty memory sections
        empty_memory_data = self.test_memory_data.copy()
        empty_memory_data['memory_info'] = {
            "reserved_memory": [],
            "memory_zones": [],
            "memory_nodes": [],
            "total_reserved_memory_kb": 0,
            "cma_pools": [],
            "dma_pools": [],
            "summary": {
                "total_reserved_entries": 0,
                "total_zones": 0,
                "total_nodes": 0,
                "total_cma_pools": 0,
                "total_dma_pools": 0
            }
        }
        
        app = create_app()
        
        with app.test_client() as client:
            with client.session_transaction() as sess:
                sess['results'] = empty_memory_data
                
            response = client.get('/')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            
            # Should still show memory tab
            self.assertIn('🧠 Memory Info', content)
            
            # Should show empty states
            self.assertIn('No reserved memory entries found', content)
            self.assertIn('No memory zones found', content)
            self.assertIn('No memory nodes found', content)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_partial_data(self):
        """Test display with partial memory data (some fields missing)"""
        # Create data with partial memory information
        partial_memory_data = self.test_memory_data.copy()
        partial_memory_data['memory_info']['memory_zones'][0]['start_address'] = None
        partial_memory_data['memory_info']['memory_zones'][0]['end_address'] = None
        partial_memory_data['memory_info']['reserved_memory'][1]['compatible_id'] = None
        
        app = create_app()
        
        with app.test_client() as client:
            with client.session_transaction() as sess:
                sess['results'] = partial_memory_data
                
            response = client.get('/')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            
            # Should still display available information
            self.assertIn('🧠 Memory Info', content)
            self.assertIn('linux,cma', content)
            self.assertIn('DMA', content)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_with_session_data(self):
        """Test memory display with session data"""
        app = create_app()
        
        with app.test_client() as client:
            # Set data in session
            with client.session_transaction() as sess:
                sess['results'] = self.test_memory_data
                
            response = client.get('/results')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            
            # Check memory information is displayed from session
            self.assertIn('🧠 Memory Info', content)
            self.assertIn('linux,cma', content)
            self.assertIn('Memory Information', content)

    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_responsive_design(self):
        """Test memory display responsive design elements"""
        app = create_app()
        
        with app.test_client() as client:
            with client.session_transaction() as sess:
                sess['results'] = self.test_memory_data
                
            response = client.get('/')
            self.assertEqual(response.status_code, 200)
            
            content = response.data.decode('utf-8')
            
            # Check responsive CSS for memory
            self.assertIn('@media (max-width: 768px)', content)
            # Should include memory-specific responsive rules
            self.assertIn('.memory-grid {', content)
            self.assertIn('grid-template-columns: 1fr;', content)
            self.assertIn('.memory-tabs {', content)
            self.assertIn('flex-direction: column;', content)


class TestMemoryIntegration(unittest.TestCase):
    """Integration tests for memory display with file upload"""
    
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_memory_upload_integration(self):
        """Test memory display through file upload"""
        memory_data = {
            "metadata": {
                "parser_version": "2.0.0",
                "parsed_at": "2023-01-01T12:00:00.000000",
                "log_file": "integration_test.log",
                "total_lines": 100,
                "parsed_lines": 50,
                "unique_entries": 10
            },
            "functions_by_file": {},
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": [],
            "statistics": {
                "unique_function_entries": 0,
                "unique_dma_operations": 0,
                "unique_user_copy_operations": 0,
                "unique_ioctl_operations": 0,
                "total_files": 1,
                "files_need_analysis": 1,
                "files_with_functions_entrypoint_instrumented": 0,
                "total_duplicates_skipped": 0,
                "total_files_analyzed": 1,
                "files_instrumented_with_function_entries": 0
            },
            "memory_info": {
                "reserved_memory": [
                    {
                        "start_address": "0x40000000",
                        "end_address": "0x5fffffff",
                        "size_kb": 524288,
                        "size_readable": "512 MiB",
                        "name": "test_pool",
                        "memory_type": "CMA",
                        "compatible_id": "test,cma",
                        "mapping_type": "reusable",
                        "timestamp": 0.0,
                        "timestamp_str": "0.000000"
                    }
                ],
                "memory_zones": [],
                "memory_nodes": [],
                "total_reserved_memory_kb": 524288,
                "cma_pools": [],
                "dma_pools": [],
                "summary": {
                    "total_reserved_entries": 1,
                    "total_zones": 0,
                    "total_nodes": 0,
                    "total_cma_pools": 0,
                    "total_dma_pools": 0
                }
            }
        }
        
        app = create_app()
        
        with app.test_client() as client:
            # Upload JSON data
            with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
                json.dump(memory_data, f)
                f.flush()
                
                with open(f.name, 'rb') as upload_file:
                    response = client.post('/upload', data={
                        'file': (upload_file, 'test_memory.json')
                    })
                    
                    # Should redirect to results
                    self.assertEqual(response.status_code, 302)
                    
                    # Follow redirect
                    response = client.get('/results')
                    self.assertEqual(response.status_code, 200)
                    
                    content = response.data.decode('utf-8')
                    
                    # Check memory information is displayed
                    self.assertIn('🧠 Memory Info', content)
                    self.assertIn('test_pool', content)
                    self.assertIn('512 MiB', content)
                    self.assertIn('test,cma', content)
                    
                Path(f.name).unlink()


if __name__ == '__main__':
    unittest.main()
