#!/usr/bin/env python3
"""
Kernel Log Parser Web UI - Interactive web interface for viewing parsed results

This creates a Flask web server that displays the parsed kernel log results
in an interactive, searchable web interface.

Usage:
    python web_ui.py [json_file] [--port PORT] [--host HOST]
"""

import os
import json
import argparse
from datetime import datetime
from pathlib import Path
import webbrowser
import threading
import time

try:
    from flask import Flask, render_template_string, jsonify, request, send_from_directory, session, redirect, url_for
    FLASK_AVAILABLE = True
except ImportError:
    FLASK_AVAILABLE = False
    Flask = None

def create_app():
    """Create and configure Flask application"""
    if not FLASK_AVAILABLE:
        raise ImportError("Flask is not available")
        
    app = Flask(__name__)
    app.config['SECRET_KEY'] = 'kernel-log-parser-secret-key'
    
    # Global variable to store the parsed data
    app.parsed_data = None
    
    # Register routes on the app instance
    register_routes(app)
    
    return app

def get_app():
    """Get or create the Flask application instance"""
    if not FLASK_AVAILABLE:
        raise ImportError("Flask is not available")
    return create_app()

def register_routes(app):
    """Register all routes on the Flask app"""
    
    @app.route('/')
    def index():
        """Main page showing the analysis results"""
        if parsed_data is None and 'results' not in session:
            return redirect(url_for('upload'))
        
        data = session.get('results', parsed_data)
        if data is None:
            return redirect(url_for('upload'))
        
        return render_template_string(HTML_TEMPLATE, data=data)

    @app.route('/upload', methods=['GET', 'POST'])
    def upload():
        """Upload page for JSON results"""
        if request.method == 'POST':
            if 'file' not in request.files:
                return render_template_string(UPLOAD_TEMPLATE, error="No file selected")
            
            file = request.files['file']
            if file.filename == '':
                return render_template_string(UPLOAD_TEMPLATE, error="No file selected")
            
            if file and file.filename.endswith('.json'):
                try:
                    content = file.read().decode('utf-8')
                    data = json.loads(content)
                    session['results'] = data
                    return redirect(url_for('results'))
                except json.JSONDecodeError:
                    return render_template_string(UPLOAD_TEMPLATE, error="Invalid JSON file")
                except Exception as e:
                    return render_template_string(UPLOAD_TEMPLATE, error=f"Error processing file: {e}")
            else:
                return render_template_string(UPLOAD_TEMPLATE, error="Please select a JSON file")
        
        # GET request - show upload form
        return render_template_string(UPLOAD_TEMPLATE)

    @app.route('/results')
    def results():
        """Results page from session data"""
        if 'results' not in session:
            return redirect(url_for('upload'))
        
        data = session['results']
        return render_template_string(HTML_TEMPLATE, data=data)

    @app.route('/api/data')
    def api_data():
        """API endpoint to get raw data"""
        # Check session first, then app instance data, avoid global state
        data = session.get('results')
        if data is None:
            data = getattr(app, 'parsed_data', None)
        if data is None:
            return jsonify({"error": "No data loaded"}), 404
        return jsonify(data)

    @app.route('/api/status')
    def api_status():
        """API endpoint to check if data has been updated"""
        return jsonify({"updated": False, "timestamp": datetime.now().isoformat()})

    @app.route('/api/search/<category>')
    def api_search(category):
        """API endpoint for searching specific categories"""
        data = session.get('results', parsed_data)
        if data is None:
            return jsonify({"error": "No data loaded"}), 404
        
        query = request.args.get('q', '').lower()
        
        if category == 'functions':
            results = []
            for file_path, functions in data['functions_by_file'].items():
                for func in functions:
                    if query in func['function_name'].lower():
                        results.append({**func, 'file_path': file_path})
            return jsonify(results)
        
        elif category == 'dma':
            results = [dma for dma in data['dma_operations'] 
                      if query in dma['dma_function'].lower() or query in dma['caller_function'].lower()]
            return jsonify(results)
        
        elif category == 'user_copy':
            results = [copy for copy in data['user_copy_operations'] 
                      if query in copy['copy_function'].lower() or query in copy['caller_function'].lower()]
            return jsonify(results)
        
        elif category == 'ioctl':
            results = [ioctl for ioctl in data.get('ioctl_operations', [])
                      if query in ioctl['function_name'].lower() or query in ioctl['file_path'].lower()]
            return jsonify(results)
        
        return jsonify({"error": "Invalid category"}), 400

    @app.route('/test')
    def test_page():
        """Test page for lazy loading functionality"""
        try:
            with open('test_lazy_loading.html', 'r') as f:
                return f.read()
        except FileNotFoundError:
            return "<h1>Test page not found</h1><p><a href='/'>Back to main page</a></p>", 404

    @app.route('/api/function-code')
    def api_function_code():
        """API endpoint to get function code for a specific function by name and file"""
        function_name = request.args.get('name')
        file_path = request.args.get('file')
        line_number = request.args.get('line', type=int)
        
        if not function_name:
            return jsonify({"error": "Function name required"}), 400
        
        data = session.get('results', parsed_data)
        if data is None:
            return jsonify({"error": "No data loaded"}), 404
        
        # Search in function_entries for the specific function
        function_entries = data.get('function_entries', [])
        for func in function_entries:
            if (func.get('function_name') == function_name and 
                (not file_path or func.get('file_path') == file_path) and
                (not line_number or func.get('line_number') == line_number)):
                function_code = func.get('function_code')
                if function_code is None:
                    function_code = 'No source code available'
                return jsonify({
                    "function_name": func.get('function_name'),
                    "function_code": function_code,
                    "file_path": func.get('file_path'),
                    "line_number": func.get('line_number')
                })
        
        return jsonify({"error": "Function not found"}), 404

    @app.route('/api/ioctl-code/<int:ioctl_index>')
    def api_ioctl_code(ioctl_index):
        """API endpoint to get function code for a specific IOCTL by index"""
        data = session.get('results', parsed_data)
        if data is None:
            return jsonify({"error": "No data loaded"}), 404
        
        ioctl_operations = data.get('ioctl_operations', [])
        if 0 <= ioctl_index < len(ioctl_operations):
            ioctl = ioctl_operations[ioctl_index]
            function_code = ioctl.get('function_code')
            if function_code is None:
                function_code = 'No source code available'
            return jsonify({
                "function_name": ioctl.get('function_name'),
                "function_code": function_code
            })
        
        return jsonify({"error": "IOCTL function not found"}), 404

    @app.route('/api/dma-code/<int:dma_index>')
    def api_dma_code(dma_index):
        """API endpoint to get function code for a specific DMA operation by index"""
        data = session.get('results', parsed_data)
        if data is None:
            return jsonify({"error": "No data loaded"}), 404
        
        dma_operations = data.get('dma_operations', [])
        if 0 <= dma_index < len(dma_operations):
            dma = dma_operations[dma_index]
            function_code = dma.get('function_code')
            if function_code is None:
                function_code = 'No source code available'
            return jsonify({
                "function_name": dma.get('dma_function'),
                "function_code": function_code
            })
        
        return jsonify({"error": "DMA function not found"}), 404

    @app.route('/api/copy-code/<int:copy_index>')
    def api_copy_code(copy_index):
        """API endpoint to get function code for a specific User Copy operation by index"""
        data = session.get('results', parsed_data)
        if data is None:
            return jsonify({"error": "No data loaded"}), 404
        
        copy_operations = data.get('user_copy_operations', [])
        if 0 <= copy_index < len(copy_operations):
            copy = copy_operations[copy_index]
            function_code = copy.get('function_code')
            if function_code is None:
                function_code = 'No source code available'
            return jsonify({
                "function_name": copy.get('copy_function'),
                "function_code": function_code
            })
        
        return jsonify({"error": "User Copy function not found"}), 404

    @app.route('/api/memory-info')
    def api_memory_info():
        """API endpoint to get memory information"""
        data = session.get('results', parsed_data)
        if data is None:
            return jsonify({"error": "No data loaded"}), 404
        
        memory_info = data.get('memory_info')
        if memory_info is None:
            return jsonify({"error": "No memory information available"}), 404
        
        return jsonify(memory_info)

app = create_app()

# Global variable to store the parsed data (for backward compatibility)
parsed_data = None

# HTML template for the web UI
HTML_TEMPLATE = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kernel Log Analysis - {{ data.metadata.log_file }}</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
            line-height: 1.6;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.15);
            overflow: hidden;
            backdrop-filter: blur(10px);
        }
        
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="75" cy="75" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="50" cy="50" r="1" fill="rgba(255,255,255,0.05)"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            pointer-events: none;
        }
        
        .header h1 {
            font-size: 3em;
            margin-bottom: 15px;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.3);
            font-weight: 300;
            letter-spacing: -1px;
            position: relative;
            z-index: 1;
        }
        
        .header p {
            font-size: 1.3em;
            opacity: 0.95;
            font-weight: 300;
            position: relative;
            z-index: 1;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 25px;
            padding: 40px;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }
        
        .stat-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            border: 1px solid rgba(255,255,255,0.2);
            position: relative;
            overflow: hidden;
        }
        
        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #667eea, #764ba2);
        }
        
        .stat-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }
        
        .stat-number {
            font-size: 3em;
            font-weight: 700;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 10px;
            font-family: 'SF Pro Display', -apple-system, BlinkMacSystemFont, sans-serif;
        }
        
        .stat-label {
            color: #4a5568;
            font-size: 1.1em;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .content {
            padding: 40px;
            background: #fafbfc;
        }
        
        .section {
            margin-bottom: 50px;
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }
        
        .section-title {
            font-size: 2em;
            color: #2d3748;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 3px solid;
            border-image: linear-gradient(90deg, #667eea, #764ba2) 1;
            display: flex;
            align-items: center;
            font-weight: 600;
        }
        
        .section-title::before {
            content: "";
            width: 24px;
            height: 24px;
            margin-right: 15px;
            border-radius: 8px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            box-shadow: 0 4px 10px rgba(102, 126, 234, 0.3);
        }
        
        .search-box {
            width: 100%;
            padding: 18px 24px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 1.1em;
            margin-bottom: 25px;
            transition: all 0.3s ease;
            background: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }
        
        .search-box:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 4px 20px rgba(102, 126, 234, 0.2);
            transform: translateY(-1px);
        }
        
        .function-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(450px, 1fr));
            gap: 25px;
        }
        
        .file-section {
            background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
            border-radius: 15px;
            padding: 25px;
            border-left: 6px solid #667eea;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }
        
        .file-title {
            font-size: 1.4em;
            color: #2d3748;
            margin-bottom: 20px;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .function-item {
            background: white;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            border: 1px solid #f1f5f9;
        }
        
        .function-item:hover {
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            transform: translateY(-3px);
            border-color: #667eea;
        }
        
        .function-name {
            font-weight: 600;
            color: #667eea;
            font-size: 1.2em;
            margin-bottom: 8px;
        }
        
        .function-details {
            color: #718096;
            margin-top: 8px;
            font-size: 0.95em;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .dma-item, .copy-item, .ioctl-item {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            border-left: 6px solid #ff9800;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .dma-item::before, .copy-item::before, .ioctl-item::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, rgba(255, 152, 0, 0.1), rgba(255, 152, 0, 0.05));
            border-radius: 0 0 0 100px;
        }
        
        .dma-item:hover, .copy-item:hover, .ioctl-item:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.15);
        }
        
        .dma-header, .copy-header, .ioctl-header {
            font-size: 1.3em;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .dma-details, .copy-details, .ioctl-details {
            color: #718096;
            margin-bottom: 18px;
            line-height: 1.6;
        }
        
        .stack-trace {
            background: #2c3e50;
            color: #ecf0f1;
            padding: 15px;
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            font-size: 0.9em;
            line-height: 1.4;
            overflow-x: auto;
            margin-top: 10px;
        }
        
        .stack-trace-header {
            color: #3498db;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        .stack-line {
            margin: 2px 0;
            padding: 2px 0;
        }
        
        .stack-line:hover {
            background: rgba(52, 152, 219, 0.2);
        }
        
        .process-info {
            background: #e8f5e8;
            padding: 10px;
            border-radius: 5px;
            margin-top: 10px;
            border-left: 3px solid #4caf50;
        }
        
        .function-code {
            background: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 5px;
            margin-top: 10px;
        }
        
        .function-code details {
            margin: 0;
        }
        
        .function-code summary {
            padding: 10px;
            cursor: pointer;
            background: #e9ecef;
            border-radius: 5px 5px 0 0;
            font-weight: bold;
            user-select: none;
        }
        
        .function-code summary:hover {
            background: #dee2e6;
        }
        
        .loading-indicator {
            color: #6c757d;
            font-weight: normal;
            font-style: italic;
        }
        
        .code-container {
            background: #f8f9fa;
            border-radius: 0 0 5px 5px;
        }
        
        .function-code pre {
            margin: 0;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 0 0 5px 5px;
            overflow-x: auto;
            font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
            font-size: 0.9em;
            line-height: 1.4;
            max-height: 400px;
            overflow-y: auto;
        }
        
        .badge {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 600;
            margin-left: 10px;
            box-shadow: 0 2px 6px rgba(102, 126, 234, 0.3);
        }
        
        .timestamp {
            background: #f7fafc;
            color: #4a5568;
            padding: 4px 10px;
            border-radius: 8px;
            font-family: 'Consolas', 'Monaco', monospace;
            font-size: 0.9em;
            border: 1px solid #e2e8f0;
        }
        
        .call-count {
            background: #e6fffa;
            color: #234e52;
            padding: 4px 10px;
            border-radius: 8px;
            font-size: 0.85em;
            font-weight: 500;
            border: 1px solid #81e6d9;
        }
        
        .process-info {
            background: #fef5e7;
            color: #744210;
            padding: 8px 12px;
            border-radius: 8px;
            font-size: 0.9em;
            margin-top: 10px;
            border-left: 4px solid #f6ad55;
        }
        
        .function-code code {
            color: #333;
            white-space: pre-wrap;
        }
        
        .timestamp {
            color: #888;
            font-family: monospace;
            font-size: 0.9em;
        }
        
        .badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 12px;
            background: #2196F3;
            color: white;
            font-size: 0.8em;
            margin-left: 10px;
        }
        
        .call-count {
            display: inline-block;
            padding: 2px 6px;
            border-radius: 8px;
            background: #ff9800;
            color: white;
            font-size: 0.75em;
            margin-left: 8px;
            font-weight: bold;
        }
        
        .toggle-btn {
            background: #2196F3;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.3s ease;
        }
        
        .toggle-btn:hover {
            background: #1976D2;
        }
        
        .hidden {
            display: none;
        }
        
        .tab-container {
            margin-bottom: 30px;
        }
        
        .tabs {
            display: flex;
            background: #f1f1f1;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 20px;
        }
        
        .tab {
            flex: 1;
            padding: 15px 20px;
            background: transparent;
            border: none;
            cursor: pointer;
            font-size: 1.1em;
            transition: all 0.3s ease;
        }
        
        .tab.active {
            background: #2196F3;
            color: white;
        }
        
        .tab-content {
            display: none;
        }
        
        .tab-content.active {
            display: block;
        }
        
        /* Memory Information Styles */
        .memory-summary {
            margin-bottom: 30px;
        }
        
        .memory-summary h3 {
            color: #2d3748;
            margin-bottom: 20px;
            font-size: 1.5em;
            text-align: center;
        }
        
        .memory-tabs {
            display: flex;
            background: #f1f1f1;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 20px;
        }
        
        .memory-tab {
            flex: 1;
            padding: 12px 16px;
            background: transparent;
            border: none;
            cursor: pointer;
            font-size: 1em;
            transition: all 0.3s ease;
            color: #4a5568;
        }
        
        .memory-tab.active {
            background: #667eea;
            color: white;
        }
        
        .memory-tab:hover:not(.active) {
            background: #e2e8f0;
        }
        
        .memory-tab-content {
            display: none;
        }
        
        .memory-tab-content.active {
            display: block;
        }
        
        .memory-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        
        .memory-item {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .memory-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.12);
        }
        
        .memory-header {
            font-size: 1.2em;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .memory-details {
            color: #718096;
            line-height: 1.6;
        }
        
        .memory-type-badge, .zone-badge, .node-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 6px;
            font-size: 0.8em;
            font-weight: bold;
            text-transform: uppercase;
        }
        
        .memory-type-badge.cma {
            background: #bee3f8;
            color: #2b6cb0;
        }
        
        .memory-type-badge.dma {
            background: #fbb6ce;
            color: #b83280;
        }
        
        .memory-type-badge.reusable {
            background: #c6f6d5;
            color: #276749;
        }
        
        .memory-type-badge.non-reusable {
            background: #fed7d7;
            color: #c53030;
        }
        
        .zone-badge.dma {
            background: #fbb6ce;
            color: #b83280;
        }
        
        .zone-badge.dma32 {
            background: #d6f5d6;
            color: #38a169;
        }
        
        .zone-badge.normal {
            background: #bee3f8;
            color: #2b6cb0;
        }
        
        .zone-badge.movable {
            background: #faf089;
            color: #975a16;
        }
        
        .node-badge {
            background: #e9d8fd;
            color: #553c9a;
        }
        
        /* Hierarchical Memory Styles */
        .memory-item.main-pool {
            border-left: 4px solid #667eea;
            background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
        }
        
        .pool-badge {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 2px 8px;
            border-radius: 12px;
            font-size: 0.7em;
            font-weight: bold;
            margin-left: auto;
        }
        
        .components-section {
            margin-top: 20px;
            padding-top: 15px;
            border-top: 2px solid #e2e8f0;
        }
        
        .components-section h5 {
            color: #4a5568;
            margin-bottom: 12px;
            font-size: 1em;
            font-weight: 600;
        }
        
        .components-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 12px;
        }
        
        .component-item {
            background: #f7fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 12px;
            border-left: 3px solid #a0aec0;
        }
        
        .component-header {
            font-size: 1em;
            font-weight: 500;
            color: #2d3748;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .component-details {
            color: #718096;
            font-size: 0.9em;
            line-height: 1.5;
        }
        
        .empty-state {
            text-align: center;
            padding: 40px;
            color: #718096;
            background: #f7fafc;
            border-radius: 12px;
            border: 2px dashed #e2e8f0;
        }
        
        @media (max-width: 768px) {
            .function-grid {
                grid-template-columns: 1fr;
            }
            
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .header h1 {
                font-size: 2em;
            }
            
            .memory-grid {
                grid-template-columns: 1fr;
            }
            
            .memory-tabs {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🔍 Kernel Log Analysis</h1>
            <p>{{ data.metadata.log_file }}</p>
            <p><strong>Parsed:</strong> {{ data.metadata.parsed_at[:19] }} | <strong>Lines:</strong> {{ data.metadata.total_lines }}</p>
        </div>
        
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-number">{{ data.statistics.unique_function_entries }}</div>
                <div class="stat-label">Function Entries</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.statistics.unique_dma_operations }}</div>
                <div class="stat-label">DMA Operations</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.statistics.unique_user_copy_operations }}</div>
                <div class="stat-label">User Copy Ops</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.statistics.unique_ioctl_operations }}</div>
                <div class="stat-label">IOCTL Handlers</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.statistics.total_files or 0 }}</div>
                <div class="stat-label">Total Files</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.statistics.files_need_analysis or data.statistics.total_files_analyzed or 0 }}</div>
                <div class="stat-label">Files need analysis</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.statistics.files_with_functions_entrypoint_instrumented or data.statistics.files_instrumented_with_function_entries }}</div>
                <div class="stat-label">Files with functions entry Instrumented</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.statistics.total_duplicates_skipped }}</div>
                <div class="stat-label">Duplicates Skipped</div>
            </div>
            {% if data.memory_info %}
            <div class="stat-card">
                <div class="stat-number">{{ data.memory_info.summary.total_reserved_entries or 0 }}</div>
                <div class="stat-label">Reserved Memory</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.memory_info.summary.total_cma_pools or 0 }}</div>
                <div class="stat-label">CMA Pools</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.memory_info.summary.total_zones or 0 }}</div>
                <div class="stat-label">Memory Zones</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.memory_info.summary.total_nodes or 0 }}</div>
                <div class="stat-label">Memory Nodes</div>
            </div>
            {% endif %}
        </div>
        
        <div class="content">
            <div class="tab-container">
                <div class="tabs">
                    <button class="tab active" onclick="showTab('functions')">📍 Functions</button>
                    <button class="tab" onclick="showTab('dma')">🔄 DMA Operations</button>
                    <button class="tab" onclick="showTab('userCopy')">👤 User Copy</button>
                    <button class="tab" onclick="showTab('ioctl')">🔧 IOCTL Handlers</button>
                    <button class="tab" onclick="showTab('memory')">🧠 Memory Info</button>
                </div>
                
                <div id="functions" class="tab-content active">
                    <div class="section">
                        <div class="section-title">Function Entries by File</div>
                        <input type="text" class="search-box" id="functionSearch" placeholder="🔍 Search functions..." onkeyup="filterFunctions()">
                        
                        <div class="function-grid" id="functionGrid">
                            {% set function_index = namespace(value=0) %}
                            {% for file_path, functions in data.functions_by_file.items() %}
                            <div class="file-section">
                                <div class="file-title">{{ file_path }}<span class="badge">{{ functions|length }}</span></div>
                                {% for func in functions %}
                                <div class="function-item">
                                    <div class="function-name">{{ func.function_name }}</div>
                                    <div class="function-details">
                                        Line {{ func.line_number }} • <span class="timestamp">{{ func.first_seen_time_str }}</span>
                                        <span class="call-count">Called {{ func.call_count }} times</span>
                                    </div>
                                    
                                    {% if func.function_code %}
                                    <div class="function-code">
                                        <details>
                                            <summary><strong>Function Source Code</strong></summary>
                                            <pre><code>{{ func.function_code }}</code></pre>
                                        </details>
                                    </div>
                                    {% else %}
                                    <div class="function-code">
                                        <details onclick="loadFunctionCode(this, '{{ func.function_name }}', '{{ file_path }}', {{ func.line_number }})">
                                            <summary><strong>Function Source Code</strong> <span class="loading-indicator" style="display:none;">Loading...</span></summary>
                                            <div class="code-container">
                                                <pre><code>Click to load source code...</code></pre>
                                            </div>
                                        </details>
                                    </div>
                                    {% endif %}
                                </div>
                                {% set function_index.value = function_index.value + 1 %}
                                {% endfor %}
                            </div>
                            {% endfor %}
                        </div>
                    </div>
                </div>
                
                <div id="dma" class="tab-content">
                    <div class="section">
                        <div class="section-title">DMA Operations with Call Graphs</div>
                        <input type="text" class="search-box" id="dmaSearch" placeholder="🔍 Search DMA operations..." onkeyup="filterDMA()">
                        
                        <div id="dmaGrid">
                            {% for dma in data.dma_operations %}
                            <div class="dma-item">
                                <div class="dma-header">
                                    {{ dma.dma_function }} → {{ dma.caller_function }}
                                    <span class="call-count">Called {{ dma.call_count }} times</span>
                                </div>
                                <div class="dma-details">
                                    <strong>File:</strong> {{ dma.file_path }}:{{ dma.line_number }}<br>
                                    <strong>Timestamp:</strong> <span class="timestamp">{{ dma.first_seen_time_str }}</span>
                                </div>
                                
                                {% if dma.function_code %}
                                <div class="function-code">
                                    <details>
                                        <summary><strong>Function Source Code</strong></summary>
                                        <pre><code>{{ dma.function_code }}</code></pre>
                                    </details>
                                </div>
                                {% else %}
                                <div class="function-code">
                                    <details onclick="loadDmaCode(this, {{ loop.index0 }}, '{{ dma.dma_function }}')">
                                        <summary><strong>Function Source Code</strong> <span class="loading-indicator" style="display:none;">Loading...</span></summary>
                                        <div class="code-container">
                                            <pre><code>Click to load source code...</code></pre>
                                        </div>
                                    </details>
                                </div>
                                {% endif %}
                                
                                {% if dma.stack_trace %}
                                <button class="toggle-btn" onclick="toggleStackTrace(this)">Show Call Graph</button>
                                <div class="stack-trace hidden">
                                    <div class="stack-trace-header">Call Graph:</div>
                                    {% for line in dma.stack_trace %}
                                    <div class="stack-line">{{ line }}</div>
                                    {% endfor %}
                                </div>
                                {% endif %}
                            </div>
                            {% endfor %}
                        </div>
                    </div>
                </div>
                
                <div id="userCopy" class="tab-content">
                    <div class="section">
                        <div class="section-title">User Copy Operations</div>
                        <input type="text" class="search-box" id="copySearch" placeholder="🔍 Search user copy operations..." onkeyup="filterUserCopy()">
                        
                        <div id="copyGrid">
                            {% for copy in data.user_copy_operations %}
                            <div class="copy-item">
                                <div class="copy-header">
                                    {{ copy.copy_function }} → {{ copy.caller_function }}
                                    <span class="call-count">Called {{ copy.call_count }} times</span>
                                </div>
                                <div class="copy-details">
                                    <strong>File:</strong> {{ copy.file_path }}:{{ copy.line_number }}<br>
                                    <strong>Timestamp:</strong> <span class="timestamp">{{ copy.first_seen_time_str }}</span>
                                </div>
                                
                                {% if copy.function_code %}
                                <div class="function-code">
                                    <details>
                                        <summary><strong>Function Source Code</strong></summary>
                                        <pre><code>{{ copy.function_code }}</code></pre>
                                    </details>
                                </div>
                                {% else %}
                                <div class="function-code">
                                    <details onclick="loadCopyCode(this, {{ loop.index0 }}, '{{ copy.copy_function }}')">
                                        <summary><strong>Function Source Code</strong> <span class="loading-indicator" style="display:none;">Loading...</span></summary>
                                        <div class="code-container">
                                            <pre><code>Click to load source code...</code></pre>
                                        </div>
                                    </details>
                                </div>
                                {% endif %}
                                
                                {% if copy.process_info %}
                                <div class="process-info">
                                    <strong>Process:</strong> {{ copy.process_info.comm }} (PID: {{ copy.process_info.pid }})
                                </div>
                                {% endif %}
                            </div>
                            {% endfor %}
                        </div>
                    </div>
                </div>
                
                <div id="ioctl" class="tab-content">
                    <div class="section">
                        <div class="section-title">IOCTL Handler Operations</div>
                        <input type="text" class="search-box" id="ioctlSearch" placeholder="🔍 Search IOCTL handlers..." onkeyup="filterIOCTL()">
                        
                        <div id="ioctlGrid">
                            {% for ioctl in data.ioctl_operations %}
                            <div class="ioctl-item">
                                <div class="ioctl-header">
                                    🔧 {{ ioctl.function_name }}
                                    <span class="call-count">Called {{ ioctl.call_count }} times</span>
                                </div>
                                <div class="ioctl-details">
                                    <strong>File:</strong> {{ ioctl.file_path }}:{{ ioctl.line_number }}<br>
                                    <strong>Timestamp:</strong> <span class="timestamp">{{ ioctl.first_seen_time_str }}</span>
                                </div>
                                
                                {% if ioctl.function_code %}
                                <div class="function-code">
                                    <details>
                                        <summary><strong>Function Source Code</strong></summary>
                                        <pre><code>{{ ioctl.function_code }}</code></pre>
                                    </details>
                                </div>
                                {% else %}
                                <div class="function-code">
                                    <details onclick="loadIoctlCode(this, {{ loop.index0 }}, '{{ ioctl.function_name }}')">
                                        <summary><strong>Function Source Code</strong> <span class="loading-indicator" style="display:none;">Loading...</span></summary>
                                        <div class="code-container">
                                            <pre><code>Click to load source code...</code></pre>
                                        </div>
                                    </details>
                                </div>
                                {% endif %}
                            </div>
                            {% else %}
                            <div class="empty-state">
                                <p>No IOCTL operations found in the log data.</p>
                            </div>
                            {% endfor %}
                        </div>
                    </div>
                </div>
                
                <div id="memory" class="tab-content">
                    <div class="section">
                        <div class="section-title">Memory Information</div>
                        {% if data.memory_info %}
                        
                        <!-- Memory Summary -->
                        <div class="memory-summary">
                            <h3>Memory Summary</h3>
                            <div class="stats-grid">
                                <div class="stat-card">
                                    <div class="stat-number">{{ (data.memory_info.total_reserved_memory_kb / 1024) | round(1) }} MB</div>
                                    <div class="stat-label">Total Reserved Memory</div>
                                </div>
                                <div class="stat-card">
                                    <div class="stat-number">{{ data.memory_info.summary.total_reserved_entries }}</div>
                                    <div class="stat-label">Reserved Entries</div>
                                </div>
                                <div class="stat-card">
                                    <div class="stat-number">{{ data.memory_info.summary.total_cma_pools }}</div>
                                    <div class="stat-label">CMA Pools</div>
                                </div>
                                <div class="stat-card">
                                    <div class="stat-number">{{ data.memory_info.summary.total_dma_pools }}</div>
                                    <div class="stat-label">DMA Pools</div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Memory Tabs -->
                        <div class="memory-tabs">
                            <button class="memory-tab active" onclick="showMemoryTab('reserved')">Reserved Memory</button>
                            <button class="memory-tab" onclick="showMemoryTab('zones')">Memory Zones</button>
                            <button class="memory-tab" onclick="showMemoryTab('nodes')">Memory Nodes</button>
                        </div>
                        
                        <!-- Reserved Memory Tab -->
                        <div id="reserved" class="memory-tab-content active">
                            <h4>Reserved Memory Entries</h4>
                            {% if data.memory_info.reserved_memory %}
                            <div class="memory-grid">
                                {% for entry in data.memory_info.reserved_memory %}
                                <div class="memory-item {% if entry.is_main_pool %}main-pool{% endif %}">
                                    <div class="memory-header">
                                        <span class="memory-type-badge {{ entry.memory_type.lower() }}">{{ entry.memory_type }}</span>
                                        {{ entry.name }}
                                        {% if entry.is_main_pool %}
                                        <span class="pool-badge">Main Pool</span>
                                        {% endif %}
                                    </div>
                                    <div class="memory-details">
                                        <strong>Size:</strong> {{ entry.size_readable }}<br>
                                        {% if entry.start_address and entry.end_address %}
                                        <strong>Address Range:</strong> {{ entry.start_address }} - {{ entry.end_address }}<br>
                                        {% elif entry.start_address %}
                                        <strong>Start Address:</strong> {{ entry.start_address }}<br>
                                        {% endif %}
                                        <strong>Mapping:</strong> {{ entry.mapping_type }}<br>
                                        {% if entry.compatible_id %}
                                        <strong>Compatible:</strong> {{ entry.compatible_id }}<br>
                                        {% endif %}
                                        <strong>Timestamp:</strong> <span class="timestamp">{{ entry.timestamp_str }}</span>
                                        
                                        {% if entry.is_main_pool and entry.components %}
                                        <div class="components-section">
                                            <h5>Components ({{ entry.components|length }})</h5>
                                            <div class="components-grid">
                                                {% for component in entry.components %}
                                                <div class="component-item">
                                                    <div class="component-header">
                                                        <span class="memory-type-badge {{ component.memory_type.lower() }}">{{ component.memory_type }}</span>
                                                        {{ component.name }}
                                                    </div>
                                                    <div class="component-details">
                                                        <strong>Size:</strong> {{ component.size_readable }}<br>
                                                        <strong>Address Range:</strong> {{ component.start_address }} - {{ component.end_address }}<br>
                                                        <strong>Mapping:</strong> {{ component.mapping_type }}
                                                    </div>
                                                </div>
                                                {% endfor %}
                                            </div>
                                        </div>
                                        {% endif %}
                                    </div>
                                </div>
                                {% endfor %}
                            </div>
                            {% else %}
                            <div class="empty-state">
                                <p>No reserved memory entries found in the log data.</p>
                            </div>
                            {% endif %}
                        </div>
                        
                        <!-- Memory Zones Tab -->
                        <div id="zones" class="memory-tab-content">
                            <h4>Memory Zones</h4>
                            {% if data.memory_info.memory_zones %}
                            <div class="memory-grid">
                                {% for zone in data.memory_info.memory_zones %}
                                <div class="memory-item">
                                    <div class="memory-header">
                                        <span class="zone-badge {{ zone.zone_name.lower() }}">{{ zone.zone_name }}</span>
                                        Zone {{ zone.zone_name }}
                                    </div>
                                    <div class="memory-details">
                                        {% if zone.start_address and zone.end_address %}
                                        <strong>Address Range:</strong> {{ zone.start_address }} - {{ zone.end_address }}<br>
                                        {% endif %}
                                        <strong>Status:</strong> {{ zone.status }}<br>
                                        {% if zone.unavailable_pages %}
                                        <strong>Unavailable Pages:</strong> {{ zone.unavailable_pages }}<br>
                                        {% endif %}
                                        <strong>Timestamp:</strong> <span class="timestamp">{{ zone.timestamp_str }}</span>
                                    </div>
                                </div>
                                {% endfor %}
                            </div>
                            {% else %}
                            <div class="empty-state">
                                <p>No memory zones found in the log data.</p>
                            </div>
                            {% endif %}
                        </div>
                        
                        <!-- Memory Nodes Tab -->
                        <div id="nodes" class="memory-tab-content">
                            <h4>Memory Nodes</h4>
                            {% if data.memory_info.memory_nodes %}
                            <div class="memory-grid">
                                {% for node in data.memory_info.memory_nodes %}
                                <div class="memory-item">
                                    <div class="memory-header">
                                        <span class="node-badge">Node {{ node.node_id }}</span>
                                        Memory Node {{ node.node_id }}
                                    </div>
                                    <div class="memory-details">
                                        <strong>Address Range:</strong> {{ node.start_address }} - {{ node.end_address }}<br>
                                        <strong>Timestamp:</strong> <span class="timestamp">{{ node.timestamp_str }}</span>
                                    </div>
                                </div>
                                {% endfor %}
                            </div>
                            {% else %}
                            <div class="empty-state">
                                <p>No memory nodes found in the log data.</p>
                            </div>
                            {% endif %}
                        </div>
                        
                        {% else %}
                        <div class="empty-state">
                            <p>No memory information available in the parsed data.</p>
                        </div>
                        {% endif %}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showTab(tabName) {
            // Hide all tab contents
            const contents = document.querySelectorAll('.tab-content');
            contents.forEach(content => content.classList.remove('active'));
            
            // Remove active class from all tabs
            const tabs = document.querySelectorAll('.tab');
            tabs.forEach(tab => tab.classList.remove('active'));
            
            // Show selected tab content
            document.getElementById(tabName).classList.add('active');
            
            // Add active class to clicked tab
            event.target.classList.add('active');
        }
        
        function toggleStackTrace(btn) {
            const stackTrace = btn.nextElementSibling;
            const isHidden = stackTrace.classList.contains('hidden');
            
            if (isHidden) {
                stackTrace.classList.remove('hidden');
                btn.textContent = 'Hide Call Graph';
            } else {
                stackTrace.classList.add('hidden');
                btn.textContent = 'Show Call Graph';
            }
        }
        
        function filterFunctions() {
            const searchTerm = document.getElementById('functionSearch').value.toLowerCase();
            const functionItems = document.querySelectorAll('.function-item');
            
            functionItems.forEach(item => {
                const functionName = item.querySelector('.function-name').textContent.toLowerCase();
                const shouldShow = functionName.includes(searchTerm);
                item.style.display = shouldShow ? 'block' : 'none';
            });
        }
        
        function filterDMA() {
            const searchTerm = document.getElementById('dmaSearch').value.toLowerCase();
            const dmaItems = document.querySelectorAll('.dma-item');
            
            dmaItems.forEach(item => {
                const text = item.textContent.toLowerCase();
                const shouldShow = text.includes(searchTerm);
                item.style.display = shouldShow ? 'block' : 'none';
            });
        }
        
        function filterUserCopy() {
            const searchTerm = document.getElementById('copySearch').value.toLowerCase();
            const copyItems = document.querySelectorAll('.copy-item');
            
            copyItems.forEach(item => {
                const text = item.textContent.toLowerCase();
                const shouldShow = text.includes(searchTerm);
                item.style.display = shouldShow ? 'block' : 'none';
            });
        }
        
        function filterIOCTL() {
            const searchTerm = document.getElementById('ioctlSearch').value.toLowerCase();
            const ioctlItems = document.querySelectorAll('.ioctl-item');
            
            ioctlItems.forEach(item => {
                const text = item.textContent.toLowerCase();
                const shouldShow = text.includes(searchTerm);
                item.style.display = shouldShow ? 'block' : 'none';
            });
        }
        
        // Lazy loading functions for function code
        async function loadFunctionCode(detailsElement, functionName, filePath, lineNumber) {
            const codeContainer = detailsElement.querySelector('.code-container');
            const loadingIndicator = detailsElement.querySelector('.loading-indicator');
            const preElement = codeContainer.querySelector('pre code');
            
            // Check if already loaded
            if (preElement.textContent !== 'Click to load source code...') {
                return;
            }
            
            // Show loading indicator
            loadingIndicator.style.display = 'inline';
            preElement.textContent = 'Loading...';
            
            try {
                const params = new URLSearchParams({
                    name: functionName,
                    file: filePath,
                    line: lineNumber
                });
                
                const response = await fetch(`/api/function-code?${params}`);
                const data = await response.json();
                
                if (response.ok) {
                    preElement.textContent = data.function_code || 'No source code available';
                } else {
                    preElement.textContent = `Error: ${data.error}`;
                }
            } catch (error) {
                preElement.textContent = `Error loading code: ${error.message}`;
            } finally {
                loadingIndicator.style.display = 'none';
            }
        }
        
        async function loadIoctlCode(detailsElement, ioctlIndex, functionName) {
            const codeContainer = detailsElement.querySelector('.code-container');
            const loadingIndicator = detailsElement.querySelector('.loading-indicator');
            const preElement = codeContainer.querySelector('pre code');
            
            // Check if already loaded
            if (preElement.textContent !== 'Click to load source code...') {
                return;
            }
            
            // Show loading indicator
            loadingIndicator.style.display = 'inline';
            preElement.textContent = 'Loading...';
            
            try {
                const response = await fetch(`/api/ioctl-code/${ioctlIndex}`);
                const data = await response.json();
                
                if (response.ok) {
                    preElement.textContent = data.function_code || 'No source code available';
                } else {
                    preElement.textContent = `Error: ${data.error}`;
                }
            } catch (error) {
                preElement.textContent = `Error loading code: ${error.message}`;
            } finally {
                loadingIndicator.style.display = 'none';
            }
        }

        async function loadDmaCode(detailsElement, dmaIndex, functionName) {
            const codeContainer = detailsElement.querySelector('.code-container');
            const loadingIndicator = detailsElement.querySelector('.loading-indicator');
            const preElement = codeContainer.querySelector('pre code');
            
            // Check if already loaded
            if (preElement.textContent !== 'Click to load source code...') {
                return;
            }
            
            // Show loading indicator
            loadingIndicator.style.display = 'inline';
            preElement.textContent = 'Loading...';
            
            try {
                const response = await fetch(`/api/dma-code/${dmaIndex}`);
                const data = await response.json();
                
                if (response.ok) {
                    preElement.textContent = data.function_code || 'No source code available';
                } else {
                    preElement.textContent = `Error: ${data.error}`;
                }
            } catch (error) {
                preElement.textContent = `Error loading code: ${error.message}`;
            } finally {
                loadingIndicator.style.display = 'none';
            }
        }

        async function loadCopyCode(detailsElement, copyIndex, functionName) {
            const codeContainer = detailsElement.querySelector('.code-container');
            const loadingIndicator = detailsElement.querySelector('.loading-indicator');
            const preElement = codeContainer.querySelector('pre code');
            
            // Check if already loaded
            if (preElement.textContent !== 'Click to load source code...') {
                return;
            }
            
            // Show loading indicator
            loadingIndicator.style.display = 'inline';
            preElement.textContent = 'Loading...';
            
            try {
                const response = await fetch(`/api/copy-code/${copyIndex}`);
                const data = await response.json();
                
                if (response.ok) {
                    preElement.textContent = data.function_code || 'No source code available';
                } else {
                    preElement.textContent = `Error: ${data.error}`;
                }
            } catch (error) {
                preElement.textContent = `Error loading code: ${error.message}`;
            } finally {
                loadingIndicator.style.display = 'none';
            }
        }
        
        // Memory tab navigation
        function showMemoryTab(tabName) {
            // Hide all memory tab contents
            const contents = document.querySelectorAll('.memory-tab-content');
            contents.forEach(content => content.classList.remove('active'));
            
            // Remove active class from all memory tabs
            const tabs = document.querySelectorAll('.memory-tab');
            tabs.forEach(tab => tab.classList.remove('active'));
            
            // Show selected memory tab content
            document.getElementById(tabName).classList.add('active');
            
            // Add active class to clicked tab
            event.target.classList.add('active');
        }
        
        // Auto-refresh functionality
        function checkForUpdates() {
            fetch('/api/status')
                .then(response => response.json())
                .then(data => {
                    if (data.updated) {
                        location.reload();
                    }
                })
                .catch(error => console.log('Update check failed:', error));
        }
        
        // Check for updates every 30 seconds
        setInterval(checkForUpdates, 30000);
    </script>
</body>
</html>
"""

# Simple upload template
UPLOAD_TEMPLATE = """
<!DOCTYPE html>
<html>
<head>
    <title>Kernel Log Analysis - Upload Results</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 600px; margin: 0 auto; }
        .upload-box { border: 2px dashed #ccc; padding: 40px; text-align: center; }
        .error { color: red; margin: 10px 0; }
        button { background: #2196F3; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🔍 Kernel Log Parser Results</h1>
        <h2>Upload Results File</h2>
        <p>Upload a JSON results file to view the analysis.</p>
        
        {% if error %}
        <div class="error">{{ error }}</div>
        {% endif %}
        
        <form method="post" enctype="multipart/form-data">
            <div class="upload-box">
                <input type="file" name="file" accept=".json" required>
                <br><br>
                <button type="submit">Upload and Analyze</button>
            </div>
        </form>
    </div>
</body>
</html>
"""

# Global variable to store the parsed data (for backward compatibility)
parsed_data = None

def load_data(json_file):
    """Load parsed data from JSON file"""
    global parsed_data
    
    # Handle None input
    if json_file is None:
        print("❌ Error: No JSON file provided")
        return None
    
    # Ensure json_file is a Path object
    if isinstance(json_file, str):
        json_file = Path(json_file)
    
    if not json_file.exists():
        print(f"❌ Error: JSON file not found: {json_file}")
        return None
    
    try:
        with open(json_file, 'r') as f:
            parsed_data = json.load(f)
        
        # Backward compatibility: add missing fields if they don't exist
        if 'statistics' in parsed_data:
            stats = parsed_data['statistics']
            if 'total_files_analyzed' not in stats:
                stats['total_files_analyzed'] = stats.get('files_with_functions_entrypoint_instrumented', stats.get('files_with_functions', 0))
            if 'files_instrumented_with_function_entries' not in stats:
                stats['files_instrumented_with_function_entries'] = stats.get('files_with_functions_entrypoint_instrumented', stats.get('files_with_functions', 0))
        
        # Create functions_by_file structure if it doesn't exist
        if 'functions_by_file' not in parsed_data and 'function_entries' in parsed_data:
            functions_by_file = {}
            for func in parsed_data['function_entries']:
                file_path = func.get('file_path', 'unknown')
                if file_path not in functions_by_file:
                    functions_by_file[file_path] = []
                functions_by_file[file_path].append(func)
            parsed_data['functions_by_file'] = functions_by_file
        
        print(f"✅ Loaded data from {json_file}")
        return parsed_data
    except json.JSONDecodeError as e:
        print(f"❌ Error parsing JSON file: {e}")
        return None
    except Exception as e:
        print(f"❌ Error loading file: {e}")
        return None

def open_browser(host, port):
    """Open browser after a short delay"""
    time.sleep(1.5)
    url = f"http://{host}:{port}"
    print(f"🌐 Opening browser: {url}")
    webbrowser.open(url)

def start_web_ui(json_file=None, port=5000, host='127.0.0.1', auto_open=True):
    """Start web UI programmatically with specified parameters"""
    global parsed_data
    
    # If no JSON file provided, look for recent files
    if not json_file:
        # Look for JSON files in current directory and results
        possible_files = []
        for pattern in ['*.json', '../results/*.json', '../../results/*.json']:
            possible_files.extend(Path('.').glob(pattern))
        
        if possible_files:
            # Sort by modification time, newest first
            json_file = sorted(possible_files, key=lambda x: x.stat().st_mtime, reverse=True)[0]
            print(f"📁 Auto-detected recent JSON file: {json_file}")
        else:
            print("❌ No JSON file provided and none found automatically.")
            return False
    else:
        json_file = Path(json_file)
    
    # Load the data
    if not load_data(json_file):
        return False
    
    print(f"\n🚀 Starting Kernel Log Analysis Web UI")
    print(f"📊 Data: {json_file}")
    print(f"🌐 Server: http://{host}:{port}")
    print(f"📈 Statistics:")
    print(f"   • Functions: {parsed_data['statistics']['unique_function_entries']}")
    print(f"   • DMA Operations: {parsed_data['statistics']['unique_dma_operations']}")
    print(f"   • User Copy Operations: {parsed_data['statistics']['unique_user_copy_operations']}")
    print(f"   • IOCTL Operations: {parsed_data['statistics'].get('unique_ioctl_operations', 0)}")
    print(f"   • Total Files: {parsed_data['statistics'].get('total_files', 0)}")
    print(f"   • Files need analysis: {parsed_data['statistics'].get('files_need_analysis', parsed_data['statistics'].get('total_files_analyzed', 0))}")
    print(f"   • Files with functions entry Instrumented: {parsed_data['statistics']['files_instrumented_with_function_entries']}")
    print(f"\n💡 Use Ctrl+C to stop the server\n")
    
    # Open browser in a separate thread unless disabled
    if auto_open:
        browser_thread = threading.Thread(target=open_browser, args=(host, port))
        browser_thread.daemon = True
        browser_thread.start()
    
    # Run the Flask app
    try:
        app.run(host=host, port=port, debug=False)
        return True
    except KeyboardInterrupt:
        print("\n👋 Server stopped by user")
        return True
    except Exception as e:
        print(f"❌ Server error: {e}")
        return False


def main():
    """Main function to run the web UI from command line"""
    parser = argparse.ArgumentParser(
        description="Web UI for Kernel Log Analysis Results",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python web_ui.py coral_parsed.json
  python web_ui.py results.json --port 8080
  python web_ui.py data.json --host 0.0.0.0 --port 5000
        """
    )
    
    parser.add_argument('json_file', nargs='?', 
                       help='Path to the parsed JSON file')
    parser.add_argument('--port', type=int, default=5000,
                       help='Port to run the web server on (default: 5000)')
    parser.add_argument('--host', default='127.0.0.1',
                       help='Host to bind the server to (default: 127.0.0.1)')
    parser.add_argument('--no-browser', action='store_true',
                       help='Don\'t automatically open browser')
    
    args = parser.parse_args()
    
    # Use the new programmatic function
    start_web_ui(
        json_file=args.json_file,
        port=args.port, 
        host=args.host,
        auto_open=not args.no_browser
    )

if __name__ == "__main__":
    main()
