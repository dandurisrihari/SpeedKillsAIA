#!/usr/bin/env python3
"""
Comprehensive tests for webviewer device access functionality
"""

import unittest
import sys
import json
import tempfile
from pathlib import Path
from unittest.mock import patch, MagicMock, mock_open

# Add the src directory to Python path
project_root = Path(__file__).parents[2]
sys.path.insert(0, str(project_root))

try:
    from src.webviewer.ui import create_app, load_data, start_web_ui
    FLASK_AVAILABLE = True
except ImportError:
    FLASK_AVAILABLE = False


class TestDeviceAccessWebviewer(unittest.TestCase):
    """Test device access functionality in webviewer"""
    
    def setUp(self):
        """Set up test fixtures"""
        # Reset global parsed_data before each test
        if FLASK_AVAILABLE:
            import src.webviewer.ui
            src.webviewer.ui.parsed_data = None
            
        self.test_device_data = {
            "metadata": {
                "parser_version": "2.0.0",
                "parsed_at": "2023-01-01T12:00:00.000000",
                "log_file": "test_strace.log",
                "total_lines": 200,
                "parsed_lines": 150,
                "unique_entries": 25
            },
            "function_entries": [],
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": [],
            "device_info": {
                "device_accesses": [
                    {
                        "device_path": "/dev/apex_0",
                        "access_type": "openat",
                        "timestamp": 1000.123,
                        "timestamp_str": "10:00:00.123",
                        "pid": 1234,
                        "flags": "O_RDWR",
                        "result": "3"
                    },
                    {
                        "device_path": "/dev/apex_0",
                        "access_type": "newfstatat",
                        "timestamp": 1001.456,
                        "timestamp_str": "10:00:01.456",
                        "pid": 1234,
                        "flags": None,
                        "result": "0"
                    },
                    {
                        "device_path": "/dev/bus/usb/001/002",
                        "access_type": "openat",
                        "timestamp": 1002.789,
                        "timestamp_str": "10:00:02.789",
                        "pid": 5678,
                        "flags": "O_RDONLY",
                        "result": "4"
                    },
                    {
                        "device_path": "/dev/mem",
                        "access_type": "generic",
                        "timestamp": 1003.012,
                        "timestamp_str": "10:00:03.012",
                        "pid": 9999,
                        "flags": "O_RDWR|O_SYNC",
                        "result": "-1 EACCES"
                    }
                ],
                "unique_devices": ["/dev/apex_0", "/dev/bus/usb/001/002", "/dev/mem"],
                "total_accesses": 4,
                "unique_device_count": 3
            },
            "functions_by_file": {},
            "function_calls": [],
            "call_graph": {},
            "stack_traces": [],
            "statistics": {
                "unique_function_entries": 0,
                "unique_dma_operations": 0,
                "unique_user_copy_operations": 0,
                "unique_ioctl_operations": 0,
                "total_files": 0,
                "files_need_analysis": 0,
                "files_instrumented_with_function_entries": 0,
                "total_duplicates_skipped": 0
            },
            "summary": {
                "total_functions": 0,
                "total_files": 0,
                "total_dma_operations": 0,
                "total_user_copy_operations": 0,
                "total_ioctl_operations": 0
            }
        }
        
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_device_access_tab_exists(self):
        """Test that device access tab exists in HTML template"""
        app = create_app()
        with app.test_client() as client:
            # Set test data in session
            with client.session_transaction() as sess:
                sess['results'] = self.test_device_data
            
            response = client.get('/results')
            self.assertEqual(response.status_code, 200)
            html_content = response.get_data(as_text=True)
            
            # Check for device access tab button
            self.assertIn('onclick="showTab(\'devices\')"', html_content)
            self.assertIn('📱 Device Access', html_content)
            
            # Check for device access tab content
            self.assertIn('id="devices"', html_content)
            self.assertIn('Device Access Information', html_content)
    
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_device_access_data_display(self):
        """Test that device access data is properly displayed"""
        app = create_app()
        with app.test_client() as client:
            # Set test data in session
            with client.session_transaction() as sess:
                sess['results'] = self.test_device_data
            
            response = client.get('/results')
            self.assertEqual(response.status_code, 200)
            html_content = response.get_data(as_text=True)
            
            # Check for device summary stats
            self.assertIn('4', html_content)  # Total Device Accesses
            self.assertIn('3', html_content)  # Unique Devices
            
            # Check for specific devices
            self.assertIn('/dev/apex_0', html_content)
            self.assertIn('/dev/bus/usb/001/002', html_content)
            self.assertIn('/dev/mem', html_content)
            
            # Check for access types
            self.assertIn('openat', html_content)
            self.assertIn('newfstatat', html_content)
            self.assertIn('generic', html_content)
            
            # Check for timestamps
            self.assertIn('10:00:00.123', html_content)
            self.assertIn('10:00:01.456', html_content)
            self.assertIn('10:00:02.789', html_content)
            self.assertIn('10:00:03.012', html_content)
            
            # Check for process IDs
            self.assertIn('1234', html_content)
            self.assertIn('5678', html_content)
            self.assertIn('9999', html_content)
            
            # Check for flags
            self.assertIn('O_RDWR', html_content)
            self.assertIn('O_RDONLY', html_content)
            self.assertIn('O_RDWR|O_SYNC', html_content)
            
            # Check for results
            self.assertIn('-1 EACCES', html_content)
    
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_device_access_timeline_visualization(self):
        """Test that timeline visualization elements are present"""
        app = create_app()
        with app.test_client() as client:
            # Set test data in session
            with client.session_transaction() as sess:
                sess['results'] = self.test_device_data
            
            response = client.get('/results')
            self.assertEqual(response.status_code, 200)
            html_content = response.get_data(as_text=True)
            
            # Check for timeline elements
            self.assertIn('device-timeline', html_content)
            self.assertIn('timeline-container', html_content)
            self.assertIn('timeline-point', html_content)
            self.assertIn('timeline-marker', html_content)
            self.assertIn('timeline-tooltip', html_content)
            
            # Check for access type specific markers
            self.assertIn('access-openat', html_content)
            self.assertIn('access-newfstatat', html_content)
            self.assertIn('access-generic', html_content)
    
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_device_access_search_functionality(self):
        """Test device access search functionality"""
        app = create_app()
        with app.test_client() as client:
            # Set test data in session
            with client.session_transaction() as sess:
                sess['results'] = self.test_device_data
            
            response = client.get('/results')
            self.assertEqual(response.status_code, 200)
            html_content = response.get_data(as_text=True)
            
            # Check for search box
            self.assertIn('id="deviceSearch"', html_content)
            self.assertIn('placeholder="🔍 Search devices..."', html_content)
            self.assertIn('onkeyup="filterDevices()"', html_content)
    
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_device_access_details_toggle(self):
        """Test device access details toggle functionality"""
        app = create_app()
        with app.test_client() as client:
            # Set test data in session
            with client.session_transaction() as sess:
                sess['results'] = self.test_device_data
            
            response = client.get('/results')
            self.assertEqual(response.status_code, 200)
            html_content = response.get_data(as_text=True)
            
            # Check for toggle button and hidden details
            self.assertIn('onclick="toggleDeviceDetails(this)"', html_content)
            self.assertIn('Show Access Details', html_content)
            self.assertIn('access-details hidden', html_content)
            
            # Check for access table structure
            self.assertIn('access-table', html_content)
            self.assertIn('<th>Timestamp</th>', html_content)
            self.assertIn('<th>Access Type</th>', html_content)
            self.assertIn('<th>PID</th>', html_content)
            self.assertIn('<th>Flags</th>', html_content)
            self.assertIn('<th>Result</th>', html_content)
    
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_device_access_api_search(self):
        """Test device access API search endpoint"""
        app = create_app()
        with app.test_client() as client:
            # Set test data in session
            with client.session_transaction() as sess:
                sess['results'] = self.test_device_data
            
            # Test search for apex device
            response = client.get('/api/search/devices?q=apex')
            self.assertEqual(response.status_code, 200)
            data = json.loads(response.get_data(as_text=True))
            
            # Should return 2 accesses for /dev/apex_0
            self.assertEqual(len(data), 2)
            self.assertEqual(data[0]['device_path'], '/dev/apex_0')
            self.assertEqual(data[1]['device_path'], '/dev/apex_0')
            
            # Test search for USB device
            response = client.get('/api/search/devices?q=usb')
            self.assertEqual(response.status_code, 200)
            data = json.loads(response.get_data(as_text=True))
            
            # Should return 1 access for USB device
            self.assertEqual(len(data), 1)
            self.assertEqual(data[0]['device_path'], '/dev/bus/usb/001/002')
            
            # Test search for access type
            response = client.get('/api/search/devices?q=newfstatat')
            self.assertEqual(response.status_code, 200)
            data = json.loads(response.get_data(as_text=True))
            
            # Should return 1 access with newfstatat type
            self.assertEqual(len(data), 1)
            self.assertEqual(data[0]['access_type'], 'newfstatat')
            
            # Test search for non-existent device
            response = client.get('/api/search/devices?q=nonexistent')
            self.assertEqual(response.status_code, 200)
            data = json.loads(response.get_data(as_text=True))
            self.assertEqual(len(data), 0)
    
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_device_access_empty_state(self):
        """Test device access display with no device data"""
        empty_data = {
            "metadata": {
                "parser_version": "2.0.0",
                "parsed_at": "2023-01-01T12:00:00.000000",
                "log_file": "empty.log",
                "total_lines": 0,
                "parsed_lines": 0,
                "unique_entries": 0
            },
            "function_entries": [],
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": [],
            "device_info": None,
            "functions_by_file": {},
            "statistics": {
                "unique_function_entries": 0,
                "unique_dma_operations": 0,
                "unique_user_copy_operations": 0,
                "unique_ioctl_operations": 0,
                "total_files": 0,
                "files_need_analysis": 0,
                "files_instrumented_with_function_entries": 0,
                "total_duplicates_skipped": 0
            },
            "summary": {}
        }
        
        app = create_app()
        with app.test_client() as client:
            # Set empty data in session
            with client.session_transaction() as sess:
                sess['results'] = empty_data
            
            response = client.get('/results')
            self.assertEqual(response.status_code, 200)
            html_content = response.get_data(as_text=True)
            
            # Check for empty state message
            self.assertIn('No device access information found', html_content)
            self.assertIn('--strace-log', html_content)
    
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_device_access_css_classes(self):
        """Test that device access CSS classes are present"""
        app = create_app()
        with app.test_client() as client:
            # Set test data in session
            with client.session_transaction() as sess:
                sess['results'] = self.test_device_data
            
            response = client.get('/results')
            self.assertEqual(response.status_code, 200)
            html_content = response.get_data(as_text=True)
            
            # Check for device-specific CSS classes
            self.assertIn('.device-item', html_content)
            self.assertIn('.device-header', html_content)
            self.assertIn('.device-timeline', html_content)
            self.assertIn('.timeline-container', html_content)
            self.assertIn('.timeline-point', html_content)
            self.assertIn('.timeline-marker', html_content)
            self.assertIn('.timeline-tooltip', html_content)
            self.assertIn('.access-details', html_content)
            self.assertIn('.access-table', html_content)
            self.assertIn('.access-count', html_content)
            
            # Check for access type specific classes
            self.assertIn('.access-openat', html_content)
            self.assertIn('.access-newfstatat', html_content)
            self.assertIn('.access-generic', html_content)
    
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_device_access_javascript_functions(self):
        """Test that device access JavaScript functions are present"""
        app = create_app()
        with app.test_client() as client:
            # Set test data in session
            with client.session_transaction() as sess:
                sess['results'] = self.test_device_data
            
            response = client.get('/results')
            self.assertEqual(response.status_code, 200)
            html_content = response.get_data(as_text=True)
            
            # Check for JavaScript functions
            self.assertIn('function filterDevices()', html_content)
            self.assertIn('function toggleDeviceDetails(', html_content)
    
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_device_access_multiple_devices_same_path(self):
        """Test handling of multiple accesses to the same device"""
        # Create test data with multiple accesses to the same device
        multi_access_data = self.test_device_data.copy()
        multi_access_data["device_info"] = {
            "device_accesses": [
                {
                    "device_path": "/dev/apex_0",
                    "access_type": "openat",
                    "timestamp": 1000.123,
                    "timestamp_str": "10:00:00.123",
                    "pid": 1234,
                    "flags": "O_RDWR",
                    "result": "3"
                },
                {
                    "device_path": "/dev/apex_0",
                    "access_type": "newfstatat", 
                    "timestamp": 1001.456,
                    "timestamp_str": "10:00:01.456",
                    "pid": 1234,
                    "flags": None,
                    "result": "0"
                },
                {
                    "device_path": "/dev/apex_0",
                    "access_type": "openat",
                    "timestamp": 1002.789,
                    "timestamp_str": "10:00:02.789",
                    "pid": 5678,
                    "flags": "O_RDONLY",
                    "result": "4"
                }
            ],
            "unique_devices": ["/dev/apex_0"],
            "total_accesses": 3,
            "unique_device_count": 1
        }
        
        app = create_app()
        with app.test_client() as client:
            # Set test data in session
            with client.session_transaction() as sess:
                sess['results'] = multi_access_data
            
            response = client.get('/results')
            self.assertEqual(response.status_code, 200)
            html_content = response.get_data(as_text=True)
            
            # Should show 3 accesses for the single device
            self.assertIn('3 accesses', html_content)
            
            # Should show all 3 access types
            self.assertIn('10:00:00.123', html_content)
            self.assertIn('10:00:01.456', html_content)
            self.assertIn('10:00:02.789', html_content)
            
            # Should show both PIDs
            self.assertIn('1234', html_content)
            self.assertIn('5678', html_content)
    
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_device_access_timestamp_display(self):
        """Test that timestamps are properly displayed for device access"""
        app = create_app()
        with app.test_client() as client:
            # Set test data in session
            with client.session_transaction() as sess:
                sess['results'] = self.test_device_data
            
            response = client.get('/results')
            self.assertEqual(response.status_code, 200)
            html_content = response.get_data(as_text=True)
            
            # Check that all timestamps are displayed in the timeline tooltips
            device_accesses = self.test_device_data["device_info"]["device_accesses"]
            for access in device_accesses:
                self.assertIn(access["timestamp_str"], html_content)
                
            # Check that timestamps appear in the details table
            self.assertIn('class="timestamp"', html_content)


class TestDeviceAccessIntegration(unittest.TestCase):
    """Integration tests for device access functionality"""
    
    @unittest.skipUnless(FLASK_AVAILABLE, "Flask not available")
    def test_device_access_with_real_strace_data(self):
        """Test device access display with realistic strace data structure"""
        real_data = {
            "metadata": {
                "parser_version": "2.0.0",
                "parsed_at": "2023-12-01T10:30:00.000000",
                "log_file": "coral_tpu_strace.log",
                "total_lines": 500,
                "parsed_lines": 450,
                "unique_entries": 75
            },
            "device_info": {
                "device_accesses": [
                    {
                        "device_path": "/dev/apex_0",
                        "access_type": "openat",
                        "timestamp": 1701420600.123,
                        "timestamp_str": "10:30:00.123",
                        "pid": 2468,
                        "flags": "O_RDWR",
                        "result": "3"
                    },
                    {
                        "device_path": "/dev/apex_0",
                        "access_type": "newfstatat",
                        "timestamp": 1701420600.456,
                        "timestamp_str": "10:30:00.456",
                        "pid": 2468,
                        "flags": None,
                        "result": "0"
                    },
                    {
                        "device_path": "/sys/class/apex/apex_0/device",
                        "access_type": "openat",
                        "timestamp": 1701420601.789,
                        "timestamp_str": "10:30:01.789",
                        "pid": 2468,
                        "flags": "O_RDONLY",
                        "result": "4"
                    },
                    {
                        "device_path": "/proc/asound/cards",
                        "access_type": "openat",
                        "timestamp": 1701420602.012,
                        "timestamp_str": "10:30:02.012",
                        "pid": 3579,
                        "flags": "O_RDONLY",
                        "result": "5"
                    }
                ],
                "unique_devices": [
                    "/dev/apex_0",
                    "/sys/class/apex/apex_0/device",
                    "/proc/asound/cards"
                ],
                "total_accesses": 4,
                "unique_device_count": 3
            },
            "function_entries": [],
            "dma_operations": [],
            "user_copy_operations": [],
            "ioctl_operations": [],
            "functions_by_file": {},
            "statistics": {
                "unique_function_entries": 0,
                "unique_dma_operations": 0,
                "unique_user_copy_operations": 0,
                "unique_ioctl_operations": 0,
                "total_files": 0,
                "files_need_analysis": 0,
                "files_instrumented_with_function_entries": 0,
                "total_duplicates_skipped": 0
            },
            "summary": {
                "total_functions": 0,
                "total_files": 0
            }
        }
        
        app = create_app()
        with app.test_client() as client:
            # Set realistic data in session
            with client.session_transaction() as sess:
                sess['results'] = real_data
            
            response = client.get('/results')
            self.assertEqual(response.status_code, 200)
            html_content = response.get_data(as_text=True)
            
            # Check for Coral TPU specific devices
            self.assertIn('/dev/apex_0', html_content)
            self.assertIn('/sys/class/apex/apex_0/device', html_content)
            self.assertIn('/proc/asound/cards', html_content)
            
            # Check for realistic timestamps
            self.assertIn('10:30:00.123', html_content)
            self.assertIn('10:30:01.789', html_content)
            self.assertIn('10:30:02.012', html_content)
            
            # Check for different PIDs
            self.assertIn('2468', html_content)
            self.assertIn('3579', html_content)


if __name__ == '__main__':
    unittest.main()
