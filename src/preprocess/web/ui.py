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
from flask import Flask, render_template_string, jsonify, request, send_from_directory, session, redirect, url_for
import webbrowser
import threading
import time

def create_app():
    """Create and configure Flask application"""
    app = Flask(__name__)
    app.config['SECRET_KEY'] = 'kernel-log-parser-secret-key'
    
    # Global variable to store the parsed data
    app.parsed_data = None
    
    # Register routes on the app instance
    register_routes(app)
    
    return app

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
        data = session.get('results', parsed_data)
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
        data = session.get('results', parsed_data)
        if data is None:
            return jsonify({"error": "No data loaded"}), 404
        
        function_name = request.args.get('name')
        file_path = request.args.get('file')
        line_number = request.args.get('line', type=int)
        
        if not function_name:
            return jsonify({"error": "Function name required"}), 400
        
        # Search in function_entries for the specific function
        function_entries = data.get('function_entries', [])
        for func in function_entries:
            if (func.get('function_name') == function_name and 
                (not file_path or func.get('file_path') == file_path) and
                (not line_number or func.get('line_number') == line_number)):
                return jsonify({
                    "function_name": func.get('function_name'),
                    "function_code": func.get('function_code', 'No source code available'),
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
            return jsonify({
                "function_name": ioctl.get('function_name'),
                "function_code": ioctl.get('function_code', 'No source code available')
            })
        
        return jsonify({"error": "IOCTL function not found"}), 404

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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .header {
            background: linear-gradient(45deg, #2196F3, #21CBF3);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        .header p {
            font-size: 1.2em;
            opacity: 0.9;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            padding: 30px;
            background: #f8f9fa;
        }
        
        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
        }
        
        .stat-number {
            font-size: 2.5em;
            font-weight: bold;
            color: #2196F3;
            margin-bottom: 10px;
        }
        
        .stat-label {
            color: #666;
            font-size: 1.1em;
        }
        
        .content {
            padding: 30px;
        }
        
        .section {
            margin-bottom: 40px;
        }
        
        .section-title {
            font-size: 1.8em;
            color: #333;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 3px solid #2196F3;
            display: flex;
            align-items: center;
        }
        
        .section-title::before {
            content: "";
            width: 20px;
            height: 20px;
            margin-right: 10px;
            border-radius: 50%;
            background: #2196F3;
        }
        
        .search-box {
            width: 100%;
            padding: 15px;
            border: 2px solid #ddd;
            border-radius: 10px;
            font-size: 1.1em;
            margin-bottom: 20px;
            transition: border-color 0.3s ease;
        }
        
        .search-box:focus {
            outline: none;
            border-color: #2196F3;
        }
        
        .function-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 20px;
        }
        
        .file-section {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            border-left: 5px solid #2196F3;
        }
        
        .file-title {
            font-size: 1.3em;
            color: #333;
            margin-bottom: 15px;
            font-weight: bold;
        }
        
        .function-item {
            background: white;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        
        .function-item:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            transform: translateX(5px);
        }
        
        .function-name {
            font-weight: bold;
            color: #2196F3;
            font-size: 1.1em;
        }
        
        .function-details {
            color: #666;
            margin-top: 5px;
            font-size: 0.9em;
        }
        
        .dma-item, .copy-item, .ioctl-item {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            border-left: 5px solid #ff9800;
        }
        
        .dma-header, .copy-header {
            font-size: 1.2em;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        
        .dma-details, .copy-details {
            color: #666;
            margin-bottom: 15px;
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
                <div class="stat-number">{{ data.statistics.total_files_analyzed }}</div>
                <div class="stat-label">Total Files Analyzed</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.statistics.files_instrumented_with_function_entries }}</div>
                <div class="stat-label">Files Instrumented</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.statistics.total_duplicates_skipped }}</div>
                <div class="stat-label">Duplicates Skipped</div>
            </div>
        </div>
        
        <div class="content">
            <div class="tab-container">
                <div class="tabs">
                    <button class="tab active" onclick="showTab('functions')">📍 Functions</button>
                    <button class="tab" onclick="showTab('dma')">🔄 DMA Operations</button>
                    <button class="tab" onclick="showTab('userCopy')">👤 User Copy</button>
                    <button class="tab" onclick="showTab('ioctl')">🔧 IOCTL Handlers</button>
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
                                        Line {{ func.line_number }} • <span class="timestamp">{{ "%.6f"|format(func.first_seen_timestamp) }}s</span>
                                        <span class="call-count">Called {{ func.call_count }} times</span>
                                    </div>
                                    
                                    {% if func.function_code %}
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
                                    <strong>Timestamp:</strong> <span class="timestamp">{{ "%.6f"|format(dma.first_seen_timestamp) }}s</span>
                                </div>
                                
                                {% if dma.function_code %}
                                <div class="function-code">
                                    <details>
                                        <summary><strong>Function Source Code</strong></summary>
                                        <pre><code>{{ dma.function_code }}</code></pre>
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
                                    <strong>Timestamp:</strong> <span class="timestamp">{{ "%.6f"|format(copy.first_seen_timestamp) }}s</span>
                                </div>
                                
                                {% if copy.function_code %}
                                <div class="function-code">
                                    <details>
                                        <summary><strong>Function Source Code</strong></summary>
                                        <pre><code>{{ copy.function_code }}</code></pre>
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
                                    <strong>Timestamp:</strong> <span class="timestamp">{{ "%.6f"|format(ioctl.first_seen_timestamp) }}s</span>
                                </div>
                                
                                {% if ioctl.function_code %}
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
    
    if not json_file.exists():
        print(f"❌ Error: JSON file not found: {json_file}")
        return False
    
    try:
        with open(json_file, 'r') as f:
            parsed_data = json.load(f)
        
        # Backward compatibility: add missing fields if they don't exist
        if 'statistics' in parsed_data:
            stats = parsed_data['statistics']
            if 'total_files_analyzed' not in stats:
                stats['total_files_analyzed'] = stats.get('files_with_functions', 0)
            if 'files_instrumented_with_function_entries' not in stats:
                stats['files_instrumented_with_function_entries'] = stats.get('files_with_functions', 0)
        
        print(f"✅ Loaded data from {json_file}")
        return True
    except json.JSONDecodeError as e:
        print(f"❌ Error parsing JSON file: {e}")
        return False
    except Exception as e:
        print(f"❌ Error loading file: {e}")
        return False

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
    print(f"   • Total Files Analyzed: {parsed_data['statistics']['total_files_analyzed']}")
    print(f"   • Files Instrumented: {parsed_data['statistics']['files_instrumented_with_function_entries']}")
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
