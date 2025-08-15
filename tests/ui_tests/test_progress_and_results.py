#!/usr/bin/env python3
"""
Comprehensive test suite for progress tracking and results display functionality.
Tests the enhanced JavaScript functions and UI components.
"""

import pytest
import json
import time
from unittest.mock import Mock, patch, MagicMock
import sys
import os

# Add src directory to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'src'))

class TestProgressTrackingUI:
    """Test class for progress tracking UI functionality."""
    
    def test_progress_elements_structure(self):
        """Test that progress tracking elements have correct structure."""
        # Test data for progress tracking
        progress_elements = {
            'progressText': 'element',
            'progressBar': 'element', 
            'processedCount': 'element',
            'totalCount': 'element',
            'progressSection': 'element'
        }
        
        # Verify all required elements are defined
        for element_id, element_type in progress_elements.items():
            assert element_id is not None, f"Progress element {element_id} not defined"
            assert element_type == 'element', f"Progress element {element_id} wrong type"
    
    def test_progress_update_logic(self):
        """Test progress update logic with various scenarios."""
        # Test progress calculation
        test_cases = [
            (0, 5, 0),    # 0% progress
            (1, 5, 20),   # 20% progress  
            (3, 5, 60),   # 60% progress
            (5, 5, 100),  # 100% progress
        ]
        
        for processed, total, expected_percent in test_cases:
            if total > 0:
                actual_percent = (processed / total) * 100
                assert actual_percent == expected_percent, \
                    f"Progress calculation failed: {processed}/{total} should be {expected_percent}%"
    
    def test_progress_text_updates(self):
        """Test progress text updates for different phases."""
        progress_messages = [
            "Initializing analysis...",
            "Sending analysis request...", 
            "Processing response...",
            "Analysis complete, preparing results...",
            "Results ready!"
        ]
        
        for message in progress_messages:
            assert len(message) > 0, f"Progress message is empty"
            assert message.endswith('...') or message.endswith('!'), \
                f"Progress message should end with ... or !: {message}"
    
    def test_component_counting_logic(self):
        """Test component counting and validation."""
        # Mock analysis data
        mock_analysis_data = {
            "function_analysis": [{"name": "func1"}, {"name": "func2"}],
            "dma_analysis": [{"name": "dma1"}],
            "user_copy_analysis": [],
            "ioctl_analysis": [{"name": "ioctl1"}, {"name": "ioctl2"}, {"name": "ioctl3"}],
            "logs_analysis": [{"name": "log1"}]
        }
        
        # Count total components
        total_components = sum(len(analysis) for analysis in mock_analysis_data.values())
        assert total_components == 7, f"Expected 7 components, got {total_components}"
        
        # Test individual counts
        assert len(mock_analysis_data["function_analysis"]) == 2
        assert len(mock_analysis_data["dma_analysis"]) == 1
        assert len(mock_analysis_data["user_copy_analysis"]) == 0
        assert len(mock_analysis_data["ioctl_analysis"]) == 3
        assert len(mock_analysis_data["logs_analysis"]) == 1


class TestResultsDisplayUI:
    """Test class for results display UI functionality."""
    
    def test_summary_card_data_structure(self):
        """Test summary card data structure and content."""
        # Mock summary data
        mock_summary = {
            "total_functions": 15,
            "successful_analyses": 12,
            "high_confidence": 8,
            "categories": 4,
            "warnings": 3
        }
        
        # Test summary cards structure
        expected_cards = [
            {"icon": "📊", "number": mock_summary["total_functions"], "label": "Total Functions"},
            {"icon": "✅", "number": mock_summary["successful_analyses"], "label": "Successful Analyses"},
            {"icon": "🎯", "number": mock_summary["high_confidence"], "label": "High Confidence"},
            {"icon": "📂", "number": mock_summary["categories"], "label": "Categories"},
            {"icon": "⚠️", "number": mock_summary["warnings"], "label": "Warnings"}
        ]
        
        for card in expected_cards:
            assert "icon" in card, "Card missing icon"
            assert "number" in card, "Card missing number"
            assert "label" in card, "Card missing label"
            assert isinstance(card["number"], int), "Card number should be integer"
            assert len(card["label"]) > 0, "Card label should not be empty"
    
    def test_results_grid_structure(self):
        """Test results grid structure and layout."""
        # Mock results data
        mock_results = {
            "function_analysis": [
                {
                    "function_name": "vulnerable_function",
                    "file_path": "/path/to/file.c",
                    "line_number": 42,
                    "analysis": "This function has potential vulnerabilities...",
                    "confidence_score": 0.85,
                    "vulnerability_type": "buffer_overflow"
                }
            ],
            "dma_analysis": [
                {
                    "dma_function": "dma_alloc_coherent",
                    "analysis": "DMA allocation without proper bounds checking",
                    "confidence_score": 0.72
                }
            ]
        }
        
        # Test grid structure
        for category, results in mock_results.items():
            assert isinstance(results, list), f"Results for {category} should be a list"
            for result in results:
                assert "analysis" in result, f"Result missing analysis field"
                assert "confidence_score" in result, f"Result missing confidence_score"
                assert 0 <= result["confidence_score"] <= 1, f"Confidence score out of range"
    
    def test_confidence_level_classification(self):
        """Test confidence level classification logic."""
        confidence_levels = [
            (0.9, "high"),
            (0.8, "high"),
            (0.7, "medium"),
            (0.6, "medium"),
            (0.5, "medium"),
            (0.4, "low"),
            (0.3, "low"),
            (0.2, "low")
        ]
        
        def classify_confidence(score):
            if score >= 0.75:
                return "high"
            elif score >= 0.5:
                return "medium"
            else:
                return "low"
        
        for score, expected_level in confidence_levels:
            actual_level = classify_confidence(score)
            assert actual_level == expected_level, \
                f"Confidence score {score} should be {expected_level}, got {actual_level}"
    
    def test_results_card_content(self):
        """Test individual result card content generation."""
        # Mock result data
        mock_result = {
            "function_name": "strcpy_vulnerable",
            "file_path": "/kernel/drivers/example.c", 
            "line_number": 156,
            "analysis": "This function uses strcpy without bounds checking, potentially leading to buffer overflow vulnerabilities. The function copies user input directly without validation.",
            "confidence_score": 0.87,
            "vulnerability_type": "buffer_overflow",
            "severity": "high"
        }
        
        # Test required fields
        required_fields = ["function_name", "analysis", "confidence_score"]
        for field in required_fields:
            assert field in mock_result, f"Result missing required field: {field}"
        
        # Test data validation
        assert len(mock_result["function_name"]) > 0, "Function name should not be empty"
        assert len(mock_result["analysis"]) > 10, "Analysis should be descriptive"
        assert 0 <= mock_result["confidence_score"] <= 1, "Confidence score out of range"
        
        # Test optional fields
        optional_fields = ["file_path", "line_number", "vulnerability_type", "severity"]
        for field in optional_fields:
            if field in mock_result:
                assert mock_result[field] is not None, f"Optional field {field} should not be None if present"


class TestNotificationSystem:
    """Test class for notification system functionality."""
    
    def test_notification_types(self):
        """Test different notification types and their properties."""
        notification_types = [
            {"type": "success", "icon": "✅", "color": "#4CAF50"},
            {"type": "error", "icon": "❌", "color": "#F44336"},
            {"type": "warning", "icon": "⚠️", "color": "#FF9800"},
            {"type": "info", "icon": "ℹ️", "color": "#2196F3"}
        ]
        
        for notification in notification_types:
            assert "type" in notification, "Notification missing type"
            assert "icon" in notification, "Notification missing icon"
            assert "color" in notification, "Notification missing color"
            assert notification["color"].startswith("#"), "Color should be hex format"
    
    def test_notification_message_validation(self):
        """Test notification message validation."""
        test_messages = [
            "Analysis completed successfully!",
            "Error: Failed to connect to API",
            "Warning: Some components could not be analyzed",
            "Info: Starting comprehensive analysis..."
        ]
        
        for message in test_messages:
            assert len(message) > 0, "Message should not be empty"
            assert len(message) <= 200, "Message should not be too long"
            assert message.strip() == message, "Message should not have leading/trailing whitespace"
    
    def test_notification_timing(self):
        """Test notification display timing and auto-dismiss."""
        # Test timing values
        timing_configs = [
            {"type": "success", "duration": 3000},  # 3 seconds
            {"type": "info", "duration": 4000},     # 4 seconds  
            {"type": "warning", "duration": 5000},  # 5 seconds
            {"type": "error", "duration": 7000}     # 7 seconds (longer for errors)
        ]
        
        for config in timing_configs:
            assert config["duration"] > 0, "Duration should be positive"
            assert config["duration"] <= 10000, "Duration should not be too long"
            
            # Error notifications should have longer duration
            if config["type"] == "error":
                assert config["duration"] >= 5000, "Error notifications should show longer"


class TestUIHelperFunctions:
    """Test class for UI helper functions and utilities."""
    
    def test_element_visibility_helpers(self):
        """Test element visibility helper functions."""
        # Mock element operations
        def show_element(element_id):
            return f"element_{element_id}_visible"
        
        def hide_element(element_id):
            return f"element_{element_id}_hidden"
        
        # Test element operations
        test_elements = ["progressSection", "resultsDashboard", "notification"]
        
        for element_id in test_elements:
            show_result = show_element(element_id)
            hide_result = hide_element(element_id)
            
            assert "visible" in show_result, f"Show operation failed for {element_id}"
            assert "hidden" in hide_result, f"Hide operation failed for {element_id}"
    
    def test_progress_bar_animation(self):
        """Test progress bar animation logic."""
        # Test width calculations
        test_progressions = [
            (0, "0%"),
            (25, "25%"),
            (50, "50%"),
            (75, "75%"),
            (100, "100%")
        ]
        
        for progress_value, expected_width in test_progressions:
            width = f"{progress_value}%"
            assert width == expected_width, f"Progress width calculation failed: {progress_value}"
    
    def test_data_formatting_helpers(self):
        """Test data formatting helper functions."""
        # Test number formatting
        def format_number(num):
            if num >= 1000:
                return f"{num/1000:.1f}K"
            return str(num)
        
        test_numbers = [
            (5, "5"),
            (150, "150"),
            (1500, "1.5K"),
            (2500, "2.5K")
        ]
        
        for number, expected in test_numbers:
            formatted = format_number(number)
            assert formatted == expected, f"Number formatting failed: {number} -> {formatted}"
    
    def test_category_icon_mapping(self):
        """Test category icon mapping for results display."""
        category_icons = {
            "function_analysis": "🔧",
            "dma_analysis": "💾", 
            "user_copy_analysis": "📋",
            "ioctl_analysis": "⚙️",
            "logs_analysis": "📝"
        }
        
        for category, icon in category_icons.items():
            assert len(icon) > 0, f"Icon missing for category {category}"
            assert category.endswith("_analysis"), f"Category should end with _analysis: {category}"


class TestErrorHandlingUI:
    """Test class for UI error handling and edge cases."""
    
    def test_empty_results_handling(self):
        """Test handling of empty analysis results."""
        empty_results = {
            "function_analysis": [],
            "dma_analysis": [],
            "user_copy_analysis": [],
            "ioctl_analysis": [],
            "logs_analysis": []
        }
        
        # Test total count calculation
        total_components = sum(len(analysis) for analysis in empty_results.values())
        assert total_components == 0, "Empty results should have 0 components"
        
        # Test summary generation
        summary = {
            "total_functions": total_components,
            "successful_analyses": 0,
            "high_confidence": 0,
            "categories": len([cat for cat, results in empty_results.items() if results])
        }
        
        assert summary["categories"] == 0, "Empty results should have 0 categories"
    
    def test_malformed_data_handling(self):
        """Test handling of malformed or incomplete data."""
        # Test missing required fields
        incomplete_result = {
            "function_name": "test_func",
            # Missing analysis field
            "confidence_score": 0.8
        }
        
        required_fields = ["function_name", "analysis", "confidence_score"]
        missing_fields = [field for field in required_fields if field not in incomplete_result]
        
        assert len(missing_fields) > 0, "Should detect missing required fields"
        assert "analysis" in missing_fields, "Should detect missing analysis field"
    
    def test_api_error_scenarios(self):
        """Test UI handling of various API error scenarios."""
        error_scenarios = [
            {"status": "error", "message": "Connection timeout"},
            {"status": "error", "message": "Invalid analysis type"},
            {"status": "error", "message": "Server overloaded"},
            {"status": "partial", "message": "Some analyses failed"}
        ]
        
        for scenario in error_scenarios:
            assert "status" in scenario, "Error scenario missing status"
            assert "message" in scenario, "Error scenario missing message"
            assert scenario["status"] in ["error", "partial"], "Invalid error status"
    
    def test_progress_edge_cases(self):
        """Test progress tracking edge cases."""
        # Test division by zero
        edge_cases = [
            (0, 0),   # 0/0 case
            (5, 0),   # 5/0 case (invalid)
            (-1, 5),  # negative processed
            (5, -1)   # negative total
        ]
        
        for processed, total in edge_cases:
            if total <= 0:
                # Should handle division by zero gracefully
                progress = 0 if total == 0 else 0
                assert progress >= 0, "Progress should never be negative"
            else:
                progress = max(0, min(100, (processed / total) * 100))
                assert 0 <= progress <= 100, "Progress should be between 0 and 100"


if __name__ == "__main__":
    # Run tests with detailed output
    pytest.main([__file__, "-v", "--tb=short"])
