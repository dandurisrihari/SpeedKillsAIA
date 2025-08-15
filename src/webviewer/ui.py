#!/usr/bin/env python3
"""
Kernel Log Parser Web UI - Interactive web interface for viewing parsed results

This creates a Flask web server that displays the parsed kernel log results
in an interactive, searchable web interface.
"""

import threading
import time
import json
import os
import argparse
import webbrowser
import logging
from datetime import datetime
from pathlib import Path

try:
    from flask import Flask, render_template_string, render_template, jsonify, request, send_from_directory, session, redirect, url_for
    FLASK_AVAILABLE = True
except ImportError:
    Flask = None
    FLASK_AVAILABLE = False

try:
    from ..llm_analysis.llm import LLMAnalyzer
    LLM_AVAILABLE = True
except ImportError:
    LLMAnalyzer = None
    LLM_AVAILABLE = False

# Configure logging
logger = logging.getLogger(__name__)

# Global variable to store parsed data (used as fallback)
parsed_data = None
global_data = None

def create_app():
    """Create and configure Flask application"""
    if not FLASK_AVAILABLE:
        raise ImportError("Flask is not available")
        
    app = Flask(__name__, 
                static_folder='static')
    app.secret_key = 'kernel-log-parser-secret-key'  # Change this in production
    
    # Enable template auto-reload for development  
    app.config['TEMPLATES_AUTO_RELOAD'] = True
    app.jinja_env.auto_reload = True
    
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
        global parsed_data, global_data
        # Check session first, then app instance data, then global state
        data = session.get('results')
        if data is None:
            data = getattr(app, 'parsed_data', None)
        if data is None:
            data = global_data  # Use new global data first
        if data is None:
            data = parsed_data  # Fallback to old global
        
        if data is None:
            # Provide minimal default structure for testing and empty states
            data = {
                'function_entries': [],
                'dma_operations': [],
                'user_copy_operations': [],
                'ioctl_operations': [],
                'device_accesses': [],
                'memory_info': {},
                'statistics': {'total_operations': 0}
            }
        
        # Use modern template file with clean separation of concerns
        return render_template('index.html', data=data)

    @app.route('/results')
    def results():
        """Results page from session data"""
        # Check multiple session keys for backwards compatibility
        if 'results' in session:
            data = session['results']
        elif 'parsed_data' in session:
            data = session['parsed_data']
        else:
            return redirect(url_for('upload'))
        
        # Use modern template file with clean separation of concerns
        return render_template('index.html', data=data)

    @app.route('/analysis')
    def analysis():
        """Analysis page - similar to results but checks app.parsed_data first"""
        # Check if app has parsed_data (for testing)
        if hasattr(app, 'parsed_data') and app.parsed_data:
            data = app.parsed_data
            # Use modern template file with clean separation of concerns
            return render_template('index.html', data=data)
        
        # Fall back to session data
        if 'results' not in session:
            return redirect(url_for('upload'))
        
        data = session['results']
        # Use modern template file with clean separation of concerns
        return render_template('index.html', data=data)

    @app.route('/upload', methods=['GET', 'POST'])
    def upload():
        """Upload page for JSON files"""
        if request.method == 'POST':
            # Handle file upload
            if 'file' not in request.files:
                return render_template('upload.html', error="No file selected")
            
            file = request.files['file']
            if file.filename == '':
                return render_template('upload.html', error="No file selected")
            
            if file and file.filename.endswith('.json'):
                try:
                    # Read and parse JSON file
                    file_content = file.read().decode('utf-8')
                    data = json.loads(file_content)
                    
                    # Store in session
                    session['results'] = data
                    
                    # Redirect to results page
                    return redirect(url_for('results'))
                except Exception as e:
                    return render_template('upload.html', error=f"Error processing file: {str(e)}")
            else:
                return render_template('upload.html', error="Please select a JSON file")
        
        # GET request - show upload form
        return render_template('upload.html')

    @app.route('/api/data')
    def api_data():
        """API endpoint to get raw data"""
        global parsed_data
        # Check session first, then app instance data, then global state
        data = session.get('results')
        if data is None:
            data = getattr(app, 'parsed_data', None)
        if data is None:
            data = parsed_data  # Use global fallback
        if data is None:
            return jsonify({"error": "No data loaded"}), 404
        
        # Ensure both data structures exist for compatibility
        enhanced_data = dict(data)  # Make a copy
        
        # If we have functions_by_file but no function_entries, create function_entries
        if 'functions_by_file' in enhanced_data and 'function_entries' not in enhanced_data:
            function_entries = []
            for file_path_key, file_functions in enhanced_data['functions_by_file'].items():
                for func in file_functions:
                    func_copy = dict(func)
                    if 'file_path' not in func_copy:
                        func_copy['file_path'] = file_path_key
                    function_entries.append(func_copy)
            enhanced_data['function_entries'] = function_entries
        
        # If we have function_entries but no functions_by_file, create functions_by_file
        elif 'function_entries' in enhanced_data and 'functions_by_file' not in enhanced_data:
            functions_by_file = {}
            for func in enhanced_data['function_entries']:
                file_path = func.get('file_path', 'unknown')
                if file_path not in functions_by_file:
                    functions_by_file[file_path] = []
                # Create a copy without file_path for functions_by_file structure
                func_copy = {k: v for k, v in func.items() if k != 'file_path'}
                functions_by_file[file_path].append(func_copy)
            enhanced_data['functions_by_file'] = functions_by_file
        
        return jsonify(enhanced_data)

    @app.route('/api/status')
    def api_status():
        """API endpoint to check if data has been updated"""
        return jsonify({"status": "ready", "updated": False, "timestamp": datetime.now().isoformat()})

    @app.route('/api/search/<category>')
    def api_search(category):
        """API endpoint for searching specific categories"""
        global parsed_data, global_data
        # Check session first, then app instance data, then global state
        data = session.get('results')
        if data is None:
            data = getattr(app, 'parsed_data', None)
        if data is None:
            data = global_data  # Use new global data first
        if data is None:
            data = parsed_data  # Use old global fallback
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
        
        elif category == 'devices':
            device_info = data.get('device_info')
            if device_info:
                results = [access for access in device_info.get('device_accesses', [])
                          if query in access.get('device_path', '').lower() or 
                          query in access.get('access_type', '').lower()]
                return jsonify(results)
            return jsonify([])
        
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
        global parsed_data, global_data
        function_name = request.args.get('name')
        file_path = request.args.get('file')
        line_number = request.args.get('line', type=int)
        
        if not function_name:
            return jsonify({"error": "Function name required"}), 400
        
        # Check session first, then app instance data, then global state  
        data = session.get('results')
        if data is None:
            data = getattr(app, 'parsed_data', None)
        if data is None:
            data = global_data  # Use new global data first
        if data is None:
            data = parsed_data  # Use old global fallback
        
        # Check if data is truly empty (not just None, but also empty dict)
        if data is None or (isinstance(data, dict) and len(data) == 0):
            return jsonify({"error": "No data loaded"}), 404
        
        # Search in function_entries for the specific function
        function_entries = data.get('function_entries', [])
        
        # If no function_entries, try to extract from functions_by_file
        if not function_entries and 'functions_by_file' in data:
            function_entries = []
            for file_path_key, file_functions in data['functions_by_file'].items():
                for func in file_functions:
                    # Ensure file_path is set if not present
                    if 'file_path' not in func:
                        func['file_path'] = file_path_key
                    function_entries.append(func)
        
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

    # LLM Analysis Routes
    @app.route('/api/llm/models')
    def api_llm_models():
        """Get available LLM models"""
        if not LLM_AVAILABLE:
            return jsonify({"error": "LLM analysis not available"}), 503
        
        analyzer = LLMAnalyzer()
        if not analyzer.is_available():
            return jsonify({"error": "OpenAI API key not configured"}), 503
        
        # Return structured model data
        models = [
            {
                "id": "gpt-3.5-turbo",
                "name": "GPT-3.5 Turbo",
                "description": "Fast & Cost-effective"
            },
            {
                "id": "gpt-4",
                "name": "GPT-4",
                "description": "Advanced Analysis"
            },
            {
                "id": "gpt-4-turbo-preview",
                "name": "GPT-4 Turbo",
                "description": "Latest & Most Capable"
            }
        ]
        
        return jsonify(models)

    @app.route('/api/llm/analyze/function', methods=['POST'])
    def api_llm_analyze_function():
        """Analyze function with LLM"""
        if not LLM_AVAILABLE:
            return jsonify({"error": "LLM analysis not available"}), 503
        
        data = request.get_json()
        if not data:
            return jsonify({"error": "Request data required"}), 400
        
        function_name = data.get('function_name')
        source_code = data.get('source_code')
        file_path = data.get('file_path', '')
        custom_prompt = data.get('custom_prompt', '')
        model_id = data.get('model_id', 'gpt-3.5-turbo')
        
        if not function_name or not source_code:
            return jsonify({"error": "Function name and source code required"}), 400
        
        analyzer = LLMAnalyzer(model_id=model_id)
        if not analyzer.is_available():
            return jsonify({"error": "OpenAI API key not configured"}), 503
        
        result = analyzer.analyze_function(function_name, source_code, file_path, custom_prompt, 
                                         model_id, for_web_ui=True)
        return jsonify(result)

    @app.route('/api/llm/analyze/dma', methods=['POST'])
    def api_llm_analyze_dma():
        """Analyze DMA operation with LLM"""
        if not LLM_AVAILABLE:
            return jsonify({"error": "LLM analysis not available"}), 503
        
        data = request.get_json()
        if not data:
            return jsonify({"error": "Request data required"}), 400
        
        dma_operation = data.get('dma_operation')
        function_code = data.get('function_code', '')
        call_graph = data.get('call_graph', [])
        custom_prompt = data.get('custom_prompt', '')
        model_id = data.get('model_id', 'gpt-3.5-turbo')
        
        if not dma_operation:
            return jsonify({"error": "DMA operation data required"}), 400
        
        analyzer = LLMAnalyzer(model_id=model_id)
        if not analyzer.is_available():
            return jsonify({"error": "OpenAI API key not configured"}), 503
        
        result = analyzer.analyze_dma_operation(dma_operation, function_code, call_graph, 
                                              custom_prompt, model_id, for_web_ui=True)
        return jsonify(result)

    @app.route('/api/llm/analyze/user-copy', methods=['POST'])
    def api_llm_analyze_user_copy():
        """Analyze user copy operation with LLM"""
        if not LLM_AVAILABLE:
            return jsonify({"error": "LLM analysis not available"}), 503
        
        data = request.get_json()
        if not data:
            return jsonify({"error": "Request data required"}), 400
        
        user_copy_operation = data.get('user_copy_operation')
        function_code = data.get('function_code', '')
        custom_prompt = data.get('custom_prompt', '')
        model_id = data.get('model_id', 'gpt-3.5-turbo')
        
        if not user_copy_operation:
            return jsonify({"error": "User copy operation data required"}), 400
        
        analyzer = LLMAnalyzer(model_id=model_id)
        if not analyzer.is_available():
            return jsonify({"error": "OpenAI API key not configured"}), 503
        
        result = analyzer.analyze_user_copy_operation(user_copy_operation, function_code, 
                                                    custom_prompt, model_id, for_web_ui=True)
        return jsonify(result)

    @app.route('/api/llm/analyze/ioctl', methods=['POST'])
    def api_llm_analyze_ioctl():
        """Analyze IOCTL handler with LLM"""
        if not LLM_AVAILABLE:
            return jsonify({"error": "LLM analysis not available"}), 503
        
        data = request.get_json()
        if not data:
            return jsonify({"error": "Request data required"}), 400
        
        ioctl_operation = data.get('ioctl_operation')
        function_code = data.get('function_code', '')
        custom_prompt = data.get('custom_prompt', '')
        model_id = data.get('model_id', 'gpt-3.5-turbo')
        
        if not ioctl_operation:
            return jsonify({"error": "IOCTL operation data required"}), 400
        
        analyzer = LLMAnalyzer(model_id=model_id)
        if not analyzer.is_available():
            return jsonify({"error": "OpenAI API key not configured"}), 503
        
        result = analyzer.analyze_ioctl_handler(ioctl_operation, function_code, 
                                              custom_prompt, model_id, for_web_ui=True)
        return jsonify(result)

    @app.route('/api/llm/analyze/logs', methods=['POST'])
    def api_llm_analyze_logs():
        """Analyze logs with LLM"""
        if not LLM_AVAILABLE:
            return jsonify({"error": "LLM analysis not available"}), 503
        
        data = request.get_json()
        if not data:
            return jsonify({"error": "Request data required"}), 400
        
        logs = data.get('logs', [])
        analysis_type = data.get('analysis_type', 'general')
        custom_prompt = data.get('custom_prompt', '')
        model_id = data.get('model_id', 'gpt-3.5-turbo')
        
        if not logs:
            return jsonify({"error": "Logs data required"}), 400
        
        analyzer = LLMAnalyzer(model_id=model_id)
        if not analyzer.is_available():
            return jsonify({"error": "OpenAI API key not configured"}), 503
        
        result = analyzer.analyze_logs(logs, analysis_type, custom_prompt)
        return jsonify(result)

    @app.route('/api/llm/security-report', methods=['POST'])
    def api_llm_security_report():
        """Generate comprehensive security report"""
        if not LLM_AVAILABLE:
            return jsonify({"error": "LLM analysis not available"}), 503
        
        data = request.get_json()
        model_id = data.get('model_id', 'gpt-3.5-turbo') if data else 'gpt-3.5-turbo'
        
        # Get all data from session
        all_data = session.get('results')
        if all_data is None:
            all_data = getattr(app, 'parsed_data', None)
        
        if all_data is None:
            return jsonify({"error": "No data loaded"}), 404
        
        analyzer = LLMAnalyzer(model_id=model_id)
        if not analyzer.is_available():
            return jsonify({"error": "OpenAI API key not configured"}), 503
        
        result = analyzer.generate_security_report(all_data)
        return jsonify(result)

    @app.route('/api/llm/status')
    def api_llm_status():
        """Check LLM analysis availability"""
        if not LLM_AVAILABLE:
            return jsonify({"available": False, "error": "LLM module not available"})
        
        analyzer = LLMAnalyzer()
        return jsonify({
            "available": analyzer.is_available(),
            "models": analyzer.get_available_models() if analyzer.is_available() else []
        })

    @app.route('/api/llm/save-analysis', methods=['POST'])
    def api_llm_save_analysis():
        """Save LLM analysis data to file"""
        data = request.get_json()
        if not data:
            return jsonify({"success": False, "error": "No data provided"}), 400
        
        filename = data.get('filename')
        analysis_data = data.get('data')
        
        if not filename or not analysis_data:
            return jsonify({"success": False, "error": "Filename and data required"}), 400
        
        try:
            # Create data directory if it doesn't exist
            data_dir = Path(__file__).parent / 'data' / 'llm_analyses'
            data_dir.mkdir(parents=True, exist_ok=True)
            
            # Save the analysis data
            file_path = data_dir / filename
            with open(file_path, 'w') as f:
                json.dump(analysis_data, f, indent=2)
            
            return jsonify({
                "success": True, 
                "filename": filename,
                "path": str(file_path)
            })
        except Exception as e:
            return jsonify({
                "success": False, 
                "error": f"Failed to save analysis: {str(e)}"
            }), 500

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
        global parsed_data, global_data
        # Check session first, then app instance data, then global state
        data = session.get('results')
        if data is None:
            data = getattr(app, 'parsed_data', None)
        if data is None:
            data = global_data  # Use new global data first
        if data is None:
            data = parsed_data  # Fallback to old global
        if data is None:
            return jsonify({"error": "No data loaded"}), 404
        
        memory_info = data.get('memory_info')
        if memory_info is None:
            return jsonify({"error": "No memory information available"}), 404
        
        return jsonify(memory_info)

    @app.route('/api/memory')
    def api_memory():
        """API endpoint to get memory information (alternative endpoint)"""
        global parsed_data, global_data
        # Check session first, then app instance data, then global state
        data = session.get('results')
        if data is None:
            data = getattr(app, 'parsed_data', None)
        if data is None:
            data = global_data  # Use new global data first
        if data is None:
            data = parsed_data  # Fallback to old global
        if data is None:
            return jsonify({"error": "No data loaded"}), 404
        
        # Return memory-related data
        memory_data = {
            'memory_info': data.get('memory_info', {}),
            'dma_operations': data.get('dma_operations', []),
            'user_copy_operations': data.get('user_copy_operations', [])
        }
        
        return jsonify(memory_data)

    @app.route('/api/devices')
    def api_devices():
        """API endpoint to get device access information"""
        global parsed_data, global_data
        # Check session first, then app instance data, then global state
        data = session.get('results')
        if data is None:
            data = getattr(app, 'parsed_data', None)
        if data is None:
            data = global_data  # Use new global data first
        if data is None:
            data = parsed_data  # Use old global fallback
        if data is None:
            return jsonify({"devices": []})
        
        device_info = data.get('device_info')
        if device_info is None:
            return jsonify({"devices": []})
        
        return jsonify({"devices": device_info.get('device_accesses', [])})

    @app.route('/api/devices/search')
    def api_devices_search():
        """API endpoint to search device access information"""
        global parsed_data, global_data
        # Check session first, then app instance data, then global state
        data = session.get('results')
        if data is None:
            data = getattr(app, 'parsed_data', None)
        if data is None:
            data = global_data  # Use new global data first
        if data is None:
            data = parsed_data  # Use old global fallback
        if data is None:
            return jsonify({"results": []})
        
        query = request.args.get('query', '').lower()
        
        device_info = data.get('device_info')
        if device_info is None:
            return jsonify({"results": []})
        
        # Search through device accesses
        results = []
        for access in device_info.get('device_accesses', []):
            device_path = access.get('device_path', '').lower()
            access_type = access.get('access_type', '').lower()
            
            if query in device_path or query in access_type:
                results.append(access)
        
        return jsonify({"results": results})

    @app.route('/api/analyze/comprehensive', methods=['POST'])
    def api_analyze_comprehensive():
        """API endpoint for comprehensive analysis"""
        global parsed_data, global_data
        
        # Get request data
        request_data = request.get_json() or {}
        component_types = request_data.get('component_types', [])
        batch_size = request_data.get('batch_size', 10)
        model_id = request_data.get('model_id', 'gpt-3.5-turbo')
        custom_prompt = request_data.get('custom_prompt', '')
        
        # Check session first, then app instance data, then global state
        data = session.get('results')
        if data is None:
            data = getattr(app, 'parsed_data', None)
        if data is None:
            data = global_data  # Use new global data first
        if data is None:
            data = parsed_data  # Fallback to old global
        
        if data is None or (isinstance(data, dict) and len(data) == 0):
            return jsonify({"status": "completed", "error": "No data loaded", "results": [], "total": 0}), 200
        
        # Initialize LLM analyzer if available
        analyzer = None
        if LLM_AVAILABLE:
            try:
                analyzer = LLMAnalyzer(model_id=model_id)
                if not analyzer.is_available():
                    analyzer = None
            except Exception as e:
                logger.warning(f"Failed to initialize LLM analyzer: {e}")
                analyzer = None
        
        # Perform comprehensive analysis
        analysis_results = []
        total_analyzed = 0
        
        for component_type in component_types:
            if component_type == 'dma_operations':
                dma_ops = data.get('dma_operations', [])[:batch_size]
                for op in dma_ops:
                    if analyzer:
                        try:
                            # Use LLM analysis for DMA operations
                            result = analyzer.analyze_dma_operation(
                                dma_operation=op,
                                function_code=op.get('function_code', ''),
                                call_graph=[],
                                custom_prompt=custom_prompt,
                                model_id=model_id,
                                for_web_ui=True
                            )
                            analysis_results.append({
                                'type': 'dma',
                                'component': {
                                    'name': f"{op.get('dma_function', 'unknown')} ({op.get('caller_function', 'unknown')})",
                                    'filePath': op.get('file_path', 'Unknown'),
                                    'lineNumber': op.get('line_number'),
                                    'code': op.get('function_code', ''),
                                    'data': op
                                },
                                'result': result,
                                'confidenceScores': result.get('confidence_scores', {'AIARelevantFunction': 0, 'Relevant_KD_Entry_Point': 0, 'Message_Structure_Handling': 0})
                            })
                        except Exception as e:
                            # Fallback to mock data if LLM analysis fails
                            analysis_results.append({
                                'type': 'dma',
                                'component': {
                                    'name': f"{op.get('dma_function', 'unknown')} ({op.get('caller_function', 'unknown')})",
                                    'filePath': op.get('file_path', 'Unknown'),
                                    'lineNumber': op.get('line_number'),
                                    'code': op.get('function_code', ''),
                                    'data': op
                                },
                                'result': {'status': 'error', 'analysis': f"Analysis failed: {str(e)}"},
                                'confidenceScores': {'AIARelevantFunction': 0, 'Relevant_KD_Entry_Point': 0, 'Message_Structure_Handling': 0}
                            })
                    else:
                        # Mock analysis when LLM is not available
                        analysis_results.append({
                            'type': 'dma',
                            'component': {
                                'name': f"{op.get('dma_function', 'unknown')} ({op.get('caller_function', 'unknown')})",
                                'filePath': op.get('file_path', 'Unknown'),
                                'lineNumber': op.get('line_number'),
                                'code': op.get('function_code', ''),
                                'data': op
                            },
                            'result': {'status': 'unavailable', 'analysis': f"DMA operation in {op.get('caller_function', 'unknown')} - LLM analysis not available"},
                            'confidenceScores': {'AIARelevantFunction': 0, 'Relevant_KD_Entry_Point': 0, 'Message_Structure_Handling': 0}
                        })
                    total_analyzed += 1
                    
            elif component_type == 'user_copy_operations':
                copy_ops = data.get('user_copy_operations', [])[:batch_size]
                for op in copy_ops:
                    if analyzer:
                        try:
                            # Use LLM analysis for user copy operations
                            result = analyzer.analyze_user_copy_operation(
                                user_copy_operation=op,
                                function_code=op.get('function_code', ''),
                                custom_prompt=custom_prompt,
                                model_id=model_id,
                                for_web_ui=True
                            )
                            analysis_results.append({
                                'type': 'user_copy',
                                'component': {
                                    'name': f"{op.get('copy_function', 'unknown')} ({op.get('caller_function', 'unknown')})",
                                    'filePath': op.get('file_path', 'Unknown'),
                                    'lineNumber': op.get('line_number'),
                                    'code': op.get('function_code', ''),
                                    'data': op
                                },
                                'result': result,
                                'confidenceScores': result.get('confidence_scores', {'AIARelevantFunction': 0, 'Relevant_KD_Entry_Point': 0, 'Message_Structure_Handling': 0})
                            })
                        except Exception as e:
                            # Fallback to mock data if LLM analysis fails
                            analysis_results.append({
                                'type': 'user_copy',
                                'component': {
                                    'name': f"{op.get('copy_function', 'unknown')} ({op.get('caller_function', 'unknown')})",
                                    'filePath': op.get('file_path', 'Unknown'),
                                    'lineNumber': op.get('line_number'),
                                    'code': op.get('function_code', ''),
                                    'data': op
                                },
                                'result': {'status': 'error', 'analysis': f"Analysis failed: {str(e)}"},
                                'confidenceScores': {'AIARelevantFunction': 0, 'Relevant_KD_Entry_Point': 0, 'Message_Structure_Handling': 0}
                            })
                    else:
                        # Mock analysis when LLM is not available
                        analysis_results.append({
                            'type': 'user_copy',
                            'component': {
                                'name': f"{op.get('copy_function', 'unknown')} ({op.get('caller_function', 'unknown')})",
                                'filePath': op.get('file_path', 'Unknown'),
                                'lineNumber': op.get('line_number'),
                                'code': op.get('function_code', ''),
                                'data': op
                            },
                            'result': {'status': 'unavailable', 'analysis': f"User copy in {op.get('caller_function', 'unknown')} - LLM analysis not available"},
                            'confidenceScores': {'AIARelevantFunction': 0, 'Relevant_KD_Entry_Point': 0, 'Message_Structure_Handling': 0}
                        })
                    total_analyzed += 1
                    
            elif component_type == 'ioctl_operations':
                ioctl_ops = data.get('ioctl_operations', [])[:batch_size]
                for op in ioctl_ops:
                    if analyzer:
                        try:
                            # Use LLM analysis for IOCTL operations
                            result = analyzer.analyze_ioctl_handler(
                                ioctl_operation=op,
                                function_code=op.get('function_code', ''),
                                custom_prompt=custom_prompt,
                                model_id=model_id,
                                for_web_ui=True
                            )
                            analysis_results.append({
                                'type': 'ioctl',
                                'component': {
                                    'name': op.get('function_name', op.get('handler_name', 'unknown')),
                                    'filePath': op.get('file_path', 'Unknown'),
                                    'lineNumber': op.get('line_number'),
                                    'code': op.get('function_code', ''),
                                    'data': op
                                },
                                'result': result,
                                'confidenceScores': result.get('confidence_scores', {'AIARelevantFunction': 0, 'Relevant_KD_Entry_Point': 0, 'Message_Structure_Handling': 0})
                            })
                        except Exception as e:
                            # Fallback to mock data if LLM analysis fails
                            analysis_results.append({
                                'type': 'ioctl',
                                'component': {
                                    'name': op.get('function_name', op.get('handler_name', 'unknown')),
                                    'filePath': op.get('file_path', 'Unknown'),
                                    'lineNumber': op.get('line_number'),
                                    'code': op.get('function_code', ''),
                                    'data': op
                                },
                                'result': {'status': 'error', 'analysis': f"Analysis failed: {str(e)}"},
                                'confidenceScores': {'AIARelevantFunction': 0, 'Relevant_KD_Entry_Point': 0, 'Message_Structure_Handling': 0}
                            })
                    else:
                        # Mock analysis when LLM is not available
                        analysis_results.append({
                            'type': 'ioctl',
                            'component': {
                                'name': op.get('function_name', op.get('handler_name', 'unknown')),
                                'filePath': op.get('file_path', 'Unknown'),
                                'lineNumber': op.get('line_number'),
                                'code': op.get('function_code', ''),
                                'data': op
                            },
                            'result': {'status': 'unavailable', 'analysis': f"IOCTL handler: {op.get('function_name', op.get('handler_name', 'unknown'))} - LLM analysis not available"},
                            'confidenceScores': {'AIARelevantFunction': 0, 'Relevant_KD_Entry_Point': 0, 'Message_Structure_Handling': 0}
                        })
                    total_analyzed += 1
                    
            elif component_type == 'functions':
                # Process functions from functions_by_file
                functions_by_file = data.get('functions_by_file', {})
                function_count = 0
                for file_path, functions in functions_by_file.items():
                    if function_count >= batch_size:
                        break
                    for func in functions:
                        if function_count >= batch_size:
                            break
                        if analyzer:
                            try:
                                # Use LLM analysis for functions
                                result = analyzer.analyze_function(
                                    function_name=func.get('function_name', 'unknown'),
                                    source_code=func.get('function_code', ''),
                                    file_path=file_path,
                                    custom_prompt=custom_prompt,
                                    model_id=model_id,
                                    for_web_ui=True
                                )
                                analysis_results.append({
                                    'type': 'function',
                                    'component': {
                                        'name': func.get('function_name', 'unknown'),
                                        'filePath': file_path,
                                        'lineNumber': func.get('line_number'),
                                        'code': func.get('function_code', ''),
                                        'data': func
                                    },
                                    'result': result,
                                    'confidenceScores': result.get('confidence_scores', {'AIARelevantFunction': 0, 'Relevant_KD_Entry_Point': 0, 'Message_Structure_Handling': 0})
                                })
                            except Exception as e:
                                # Fallback to mock data if LLM analysis fails
                                analysis_results.append({
                                    'type': 'function',
                                    'component': {
                                        'name': func.get('function_name', 'unknown'),
                                        'filePath': file_path,
                                        'lineNumber': func.get('line_number'),
                                        'code': func.get('function_code', ''),
                                        'data': func
                                    },
                                    'result': {'status': 'error', 'analysis': f"Analysis failed: {str(e)}"},
                                    'confidenceScores': {'AIARelevantFunction': 0, 'Relevant_KD_Entry_Point': 0, 'Message_Structure_Handling': 0}
                                })
                        else:
                            # Mock analysis when LLM is not available
                            analysis_results.append({
                                'type': 'function',
                                'component': {
                                    'name': func.get('function_name', 'unknown'),
                                    'filePath': file_path,
                                    'lineNumber': func.get('line_number'),
                                    'code': func.get('function_code', ''),
                                    'data': func
                                },
                                'result': {'status': 'unavailable', 'analysis': f"Function: {func.get('function_name', 'unknown')} - LLM analysis not available"},
                                'confidenceScores': {'AIARelevantFunction': 0, 'Relevant_KD_Entry_Point': 0, 'Message_Structure_Handling': 0}
                            })
                        function_count += 1
                        total_analyzed += 1
        
        return jsonify({
            "status": "success",
            "results": analysis_results,
            "total": total_analyzed,
            "batch_size": batch_size,
            "success": True,
            "statistics": {
                "total_analyzed": total_analyzed,
                "batch_size": batch_size,
                "component_types": len(component_types),
                "llm_available": analyzer is not None
            }
        })

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
        
        .dma-item, .copy-item, .ioctl-item, .device-item {
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
        
        .device-item {
            border-left-color: #9c27b0;
        }
        
        .dma-item::before, .copy-item::before, .ioctl-item::before, .device-item::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, rgba(255, 152, 0, 0.1), rgba(255, 152, 0, 0.05));
            border-radius: 0 0 0 100px;
        }
        
        .device-item::before {
            background: linear-gradient(135deg, rgba(156, 39, 176, 0.1), rgba(156, 39, 176, 0.05));
        }
        
        .dma-item:hover, .copy-item:hover, .ioctl-item:hover, .device-item:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.15);
        }
        
        .dma-header, .copy-header, .ioctl-header, .device-header {
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
        
        /* Device Access Styles */
        .device-summary {
            margin-bottom: 25px;
        }
        
        .access-count {
            background: linear-gradient(135deg, #9c27b0, #e91e63);
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 600;
            margin-left: auto;
        }
        
        .device-timeline {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 15px;
            margin: 15px 0;
            border: 1px solid #e9ecef;
        }
        
        .timeline-header {
            font-weight: 600;
            color: #495057;
            margin-bottom: 10px;
            font-size: 0.9em;
        }
        
        .timeline-container {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            align-items: center;
        }
        
        .timeline-point {
            position: relative;
            cursor: pointer;
        }
        
        .timeline-marker {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            border: 2px solid white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }
        
        .access-openat .timeline-marker {
            background: #4caf50;
        }
        
        .access-newfstatat .timeline-marker {
            background: #2196f3;
        }
        
        .access-generic .timeline-marker {
            background: #ff9800;
        }
        
        .timeline-tooltip {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(0,0,0,0.9);
            color: white;
            padding: 8px 12px;
            border-radius: 6px;
            font-size: 0.8em;
            white-space: nowrap;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.3s ease;
            z-index: 1000;
        }
        
        .timeline-point:hover .timeline-tooltip {
            opacity: 1;
        }
        
        .access-details {
            margin-top: 15px;
        }
        
        .access-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            font-size: 0.9em;
        }
        
        .access-table th {
            background: #f8f9fa;
            padding: 10px;
            text-align: left;
            border-bottom: 2px solid #dee2e6;
            font-weight: 600;
            color: #495057;
        }
        
        .access-table td {
            padding: 8px 10px;
            border-bottom: 1px solid #e9ecef;
        }
        
        .access-table tr:hover {
            background: #f8f9fa;
        }
        
        .access-type {
            font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
            background: #e9ecef;
            padding: 2px 6px;
            border-radius: 4px;
            font-size: 0.85em;
        }
        
        .pid {
            font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
            color: #6c757d;
        }
        
        .flags {
            font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
            color: #28a745;
            font-size: 0.85em;
        }
        
        .result {
            font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
            color: #dc3545;
            font-size: 0.85em;
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
        
        /* Analyze All Styles */
        .analyze-all-controls {
            background: #f8fafc;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            border: 1px solid #e2e8f0;
        }
        
        .control-group {
            margin-bottom: 20px;
        }
        
        .control-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #4a5568;
            font-size: 0.95em;
        }
        
        .control-group select,
        .control-group input {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 1em;
            transition: all 0.3s ease;
            background: white;
        }
        
        .control-group select:focus,
        .control-group input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .analyze-all-button {
            width: 100%;
            padding: 16px 32px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.1em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
            position: relative;
            overflow: hidden;
        }
        
        .analyze-all-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
        }
        
        .analyze-all-button:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }
        
        .progress-section {
            margin-top: 25px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            border: 1px solid #e2e8f0;
        }
        
        .progress-bar-container {
            width: 100%;
            height: 8px;
            background: #f1f5f9;
            border-radius: 4px;
            overflow: hidden;
            margin-bottom: 15px;
        }
        
        .progress-bar {
            height: 100%;
            background: linear-gradient(90deg, #667eea, #764ba2);
            width: 0%;
            transition: width 0.3s ease;
            border-radius: 4px;
        }
        
        .progress-text {
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 8px;
        }
        
        .progress-stats {
            font-size: 0.9em;
            color: #718096;
        }
        
        .results-dashboard {
            margin-top: 30px;
            display: none;
        }
        
        .results-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .results-header h3 {
            color: #2d3748;
            font-size: 1.8em;
            margin-bottom: 10px;
        }
        
        .results-actions {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
            flex-wrap: wrap;
        }
        
        .download-btn {
            background: linear-gradient(135deg, #4299e1 0%, #3182ce 100%);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 0.95em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(66, 153, 225, 0.3);
        }
        
        .download-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(66, 153, 225, 0.4);
        }
        
        .download-btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }
        
        .results-summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .summary-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
        }
        
        .summary-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-left: 4px solid #4299e1;
        }
        
        .summary-number {
            font-size: 2em;
            font-weight: bold;
            color: #2d3748;
            margin-bottom: 5px;
        }
        
        .summary-label {
            font-size: 0.9em;
            color: #718096;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .results-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(400px, 1fr));
            gap: 20px;
        }
        
        .results-list {
            display: grid;
            gap: 20px;
        }
        
        .result-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            border-left: 4px solid #48bb78;
        }
        
        .result-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .result-type {
            background: #48bb78;
            color: white;
            padding: 4px 8px;
            border-radius: 6px;
            font-size: 0.8em;
            font-weight: 600;
            text-transform: uppercase;
        }
        
        .result-name {
            font-weight: 600;
            color: #2d3748;
            font-family: monospace;
        }
        
        .result-details {
            margin-bottom: 15px;
            color: #718096;
            font-size: 0.9em;
        }
        
        .result-file {
            margin-bottom: 5px;
        }
        
        .result-analysis {
            background: #f7fafc;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 15px;
            line-height: 1.5;
            font-size: 0.95em;
        }
        
        .confidence-scores {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        
        .score {
            background: #e2e8f0;
            padding: 4px 8px;
            border-radius: 6px;
            font-size: 0.8em;
            font-weight: 500;
        }
        
        .no-results {
            text-align: center;
            color: #718096;
            font-style: italic;
            padding: 40px;
        }
        
        .analyze-all-info {
            background: #f8fafc;
            padding: 25px;
            border-radius: 12px;
            border-left: 4px solid #667eea;
            margin-top: 20px;
        }
        
        .analysis-categories {
            margin: 15px 0;
            padding-left: 20px;
        }
        
        .analysis-categories li {
            margin-bottom: 10px;
            color: #4a5568;
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
        
        /* LLM Analysis Styles */
        .llm-controls {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 25px;
            padding: 15px;
            background: linear-gradient(135deg, #f8fafc, #e2e8f0);
            border-radius: 10px;
            border: 1px solid #cbd5e0;
        }
        
        .llm-status {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .status-indicator {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: #fbbf24;
            animation: pulse 2s infinite;
        }
        
        .status-indicator.available {
            background: #10b981;
        }
        
        .status-indicator.unavailable {
            background: #ef4444;
        }
        
        .model-selection {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .model-selection label {
            font-weight: 600;
            color: #374151;
        }
        
        .model-selection select {
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            background: white;
            font-size: 14px;
        }
        
        .analysis-tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 25px;
            border-bottom: 2px solid #e5e7eb;
        }
        
        .analysis-tab {
            padding: 12px 24px;
            border: none;
            background: transparent;
            color: #6b7280;
            font-weight: 500;
            border-bottom: 3px solid transparent;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .analysis-tab:hover {
            color: #374151;
            background: #f9fafb;
        }
        
        .analysis-tab.active {
            color: #667eea;
            border-bottom-color: #667eea;
            background: #f8faff;
        }
        
        .analysis-content {
            display: none;
        }
        
        .analysis-content.active {
            display: block;
        }
        
        .analysis-form {
            max-width: 800px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            font-weight: 600;
            color: #374151;
            margin-bottom: 8px;
        }
        
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 14px;
            font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
            resize: vertical;
        }
        
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .analyze-btn {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            min-width: 200px;
        }
        
        .analyze-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
        }
        
        .analyze-btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }
        
        .btn-loading {
            display: none;
        }
        
        .analyze-btn.loading .btn-text {
            display: none;
        }
        
        .analyze-btn.loading .btn-loading {
            display: inline;
        }
        
        .analysis-result {
            margin-top: 20px;
            padding: 20px;
            border-radius: 10px;
            border: 1px solid #e5e7eb;
            background: #fafbfc;
            display: none;
        }
        
        .analysis-result.success {
            display: block;
            border-color: #10b981;
            background: #f0fdf4;
        }
        
        .analysis-result.error {
            display: block;
            border-color: #ef4444;
            background: #fef2f2;
            color: #dc2626;
        }
        
        .analysis-result h4 {
            color: #059669;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .analysis-result.error h4 {
            color: #dc2626;
        }
        
        .analysis-text {
            white-space: pre-wrap;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
            line-height: 1.6;
            color: #374151;
        }
        
        .analysis-metadata {
            margin-top: 15px;
            padding-top: 15px;
            border-top: 1px solid #e5e7eb;
            font-size: 0.9em;
            color: #6b7280;
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        
        .metadata-item {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        /* LLM Action Buttons */
        .llm-action-buttons {
            margin-top: 15px;
            padding-top: 15px;
            border-top: 1px solid #e2e8f0;
        }
        
        .llm-action-buttons .analyze-btn {
            font-size: 0.9em;
            padding: 8px 16px;
            min-width: auto;
            background: linear-gradient(135deg, #10b981, #059669);
        }
        
        .llm-action-buttons .analyze-btn:hover {
            background: linear-gradient(135deg, #059669, #047857);
        }
        
        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Kernel Log Analysis</h1>
            <p>{{ data.metadata.log_file }}</p>
            <p><strong>Parsed:</strong> {{ data.metadata.get('parsed_at', 'Unknown')[:19] if data.metadata.get('parsed_at') else 'Unknown' }} | <strong>Lines:</strong> {{ data.metadata.get('total_lines', 0) }}</p>
        </div>
        
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-number">{{ data.get('statistics', {}).get('unique_function_entries', 0) }}</div>
                <div class="stat-label">Function Entries</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.get('statistics', {}).get('unique_dma_operations', 0) }}</div>
                <div class="stat-label">DMA Operations</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.get('statistics', {}).get('unique_user_copy_operations', 0) }}</div>
                <div class="stat-label">User Copy Ops</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.get('statistics', {}).get('unique_ioctl_operations', 0) }}</div>
                <div class="stat-label">IOCTL Handlers</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.get('statistics', {}).get('total_files', 0) }}</div>
                <div class="stat-label">Total Files</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.get('statistics', {}).get('files_need_analysis', data.get('statistics', {}).get('total_files_analyzed', 0)) }}</div>
                <div class="stat-label">Files need analysis</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.get('statistics', {}).get('files_with_functions_entrypoint_instrumented', data.get('statistics', {}).get('files_instrumented_with_function_entries', 0)) }}</div>
                <div class="stat-label">Files with functions entry Instrumented</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">{{ data.get('statistics', {}).get('total_duplicates_skipped', 0) }}</div>
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
                    <button class="tab active" onclick="showTab('analyzeAll', this)">Analyze All</button>
                    <button class="tab" onclick="showTab('functions', this)">Functions</button>
                    <button class="tab" onclick="showTab('dma', this)">DMA Operations</button>
                    <button class="tab" onclick="showTab('userCopy', this)">User Copy</button>
                    <button class="tab" onclick="showTab('ioctl', this)">IOCTL Handlers</button>
                    <button class="tab" onclick="showTab('devices', this)">Device Access</button>
                    <button class="tab" onclick="showTab('memory', this)">Memory Info</button>
                    <button class="tab" onclick="showTab('llmAnalysis', this)">LLM Analysis</button>
                </div>
                
                <!-- Analyze All Tab -->
                <div id="analyzeAll" class="tab-content active">
                    <div class="section">
                        <div class="section-title">LLM Assisted Comprehensive Analysis</div>
                        <p>Analyze all code components at once using AI to identify AIA integration patterns</p>
                    </div>
                    
                    <div class="analyze-all-controls batch-analysis">
                        <div class="control-group">
                            <label for="analyzeAllModel">AI Model</label>
                            <select id="analyzeAllModel">
                                <option value="gpt-3.5-turbo">GPT-3.5 Turbo (Fast)</option>
                                <option value="gpt-4">GPT-4 (Comprehensive)</option>
                                <option value="gpt-4-turbo-preview">GPT-4 Turbo (Latest)</option>
                            </select>
                        </div>
                        
                        <div class="control-group">
                            <label for="analyzeAllPrompt">Custom Focus (Optional)</label>
                            <input type="text" id="analyzeAllPrompt" placeholder="e.g., Focus on DMA mappings for neural networks..." maxlength="200">
                        </div>
                        
                        <div class="control-group">
                            <label for="batchSize">Batch Size (Components per batch)</label>
                            <select id="batchSize">
                                <option value="1">1 (Slowest, Most Reliable)</option>
                                <option value="3" selected>3 (Recommended)</option>
                                <option value="5">5 (Fast)</option>
                                <option value="10">10 (Fastest, May Fail)</option>
                                <option value="999">All at Once (Risk of Timeout)</option>
                            </select>
                        </div>
                        
                        <div class="control-group">
                            <label for="maxComponents">Maximum Components to Analyze</label>
                            <select id="maxComponents">
                                <option value="10">10 (Quick Test)</option>
                                <option value="25">25 (Fast Analysis)</option>
                                <option value="50" selected>50 (Balanced)</option>
                                <option value="100">100 (Comprehensive)</option>
                                <option value="999">All Available (Full Analysis)</option>
                            </select>
                        </div>
                        
                        <div class="control-group">
                            <label for="confidenceThreshold">Minimum Confidence %</label>
                            <select id="confidenceThreshold">
                                <option value="0">All Results (0%+)</option>
                                <option value="25">Low Confidence (25%+)</option>
                                <option value="50" selected>Medium Confidence (50%+)</option>
                                <option value="75">High Confidence (75%+)</option>
                                <option value="90">Very High Confidence (90%+)</option>
                            </select>
                        </div>
                        
                        <button class="analyze-all-button" onclick="runComprehensiveAnalysis()" id="analyzeAllBtn">
                            <span id="analyzeAllBtnText">Analyze All Components</span>
                        </button>
                        
                        <div class="progress-section" id="progressSection" style="display: none;">
                            <div class="progress-bar-container">
                                <div class="progress-bar" id="progressBar"></div>
                            </div>
                            <div class="progress-text" id="progressText">Preparing analysis...</div>
                            <div class="progress-stats" id="progressStats">
                                <span id="processedCount">0</span> / <span id="totalCount">0</span> components
                            </div>
                        </div>
                    </div>
                    
                    <div class="results-dashboard" id="resultsDashboard">
                        <div class="results-header">
                            <h3>📊 Comprehensive Analysis Results</h3>
                            <p id="resultsSubtitle">Analysis completed successfully</p>
                            <div class="results-actions">
                                <button class="download-btn primary" onclick="downloadAnalysisResults('json')" id="downloadJsonBtn">
                                    📥 Download JSON
                                </button>
                                <button class="download-btn secondary" onclick="downloadAnalysisResults('csv')" id="downloadCsvBtn">
                                    📊 Download CSV
                                </button>
                                <button class="download-btn tertiary" onclick="downloadAnalysisResults('html')" id="downloadHtmlBtn">
                                    🌐 Download Report
                                </button>
                            </div>
                        </div>
                        
                        <div class="results-summary" id="resultsSummary">
                            <!-- Summary cards will be populated by JavaScript -->
                        </div>
                        
                        <div class="results-grid" id="resultsGrid">
                            <!-- Result cards will be populated by JavaScript -->
                        </div>
                    </div>
                    
                    <div class="section">
                        <div class="section-title">About Comprehensive Analysis</div>
                        <div class="analyze-all-info">
                            <p>This powerful feature analyzes all components of your kernel code simultaneously to provide a comprehensive overview of AI Accelerator (AIA) integration patterns. The analysis focuses on three key categories:</p>
                            <ul class="analysis-categories">
                                <li><strong>AIARelevantFunction:</strong> Functions involved in shared memory management with AI accelerators</li>
                                <li><strong>Relevant KD Entry Point:</strong> Kernel driver entry points from user space (ioctl handlers)</li>
                                <li><strong>Message Structure Handling:</strong> Code handling message structures between user space and kernel that contain SMIDs (Shared Memory IDs)</li>
                            </ul>
                            <p>Results are organized by confidence level and category to help you quickly identify the most relevant code for AIA integration analysis.</p>
                        </div>
                    </div>
                </div>
                
                <div id="functions" class="tab-content">
                    <div class="section">
                        <div class="section-title">Function Entries by File</div>
                        <input type="text" class="search-box" id="functionSearch" placeholder="Search functions..." onkeyup="filterFunctions()">
                        
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
                                    
                                    <!-- LLM Analysis Button -->
                                    <div class="llm-action-buttons" style="margin-top: 15px;">
                                        <button class="analyze-btn" onclick="quickAnalyzeFunction('{{ func.function_name }}', '{{ file_path }}', {{ func.line_number }})" style="font-size: 0.9em; padding: 8px 16px;">
                                            <span class="btn-text">Quick LLM Analysis</span>
                                            <span class="btn-loading" style="display:none;">🔄</span>
                                        </button>
                                    </div>
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
                        <input type="text" class="search-box" id="dmaSearch" placeholder="Search DMA operations..." onkeyup="filterDMA()">
                        
                        <div id="dmaGrid">
                            {% if data.dma_operations %}
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
                                
                                <!-- LLM Analysis Button -->
                                <div class="llm-action-buttons" style="margin-top: 15px;">
                                    <button class="analyze-btn" onclick="quickAnalyzeDMA({{ loop.index0 }})" style="font-size: 0.9em; padding: 8px 16px;">
                                        <span class="btn-text">Quick LLM Analysis</span>
                                        <span class="btn-loading" style="display:none;">🔄</span>
                                    </button>
                                </div>
                            </div>
                            {% endfor %}
                            {% else %}
                            <div class="empty-state">
                                <p>No DMA operations found in the log data.</p>
                            </div>
                            {% endif %}
                        </div>
                    </div>
                </div>
                
                <div id="userCopy" class="tab-content">
                    <div class="section">
                        <div class="section-title">User Copy Operations</div>
                        <input type="text" class="search-box" id="copySearch" placeholder="Search user copy operations..." onkeyup="filterUserCopy()">
                        
                        <div id="copyGrid">
                            {% if data.user_copy_operations %}
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
                                
                                {% if copy.stack_trace %}
                                <button class="toggle-btn" onclick="toggleStackTrace(this)">Show Stack Trace</button>
                                <div class="stack-trace hidden">
                                    <div class="stack-trace-header">Stack Trace:</div>
                                    {% for line in copy.stack_trace %}
                                    <div class="stack-line">{{ line }}</div>
                                    {% endfor %}
                                </div>
                                {% endif %}
                                
                                {% if copy.process_info %}
                                <div class="process-info">
                                    <strong>Process:</strong> {{ copy.process_info.comm }} (PID: {{ copy.process_info.pid }})
                                </div>
                                {% endif %}
                                
                                <!-- LLM Analysis Button -->
                                <div class="llm-action-buttons" style="margin-top: 15px;">
                                    <button class="analyze-btn" onclick="quickAnalyzeUserCopy({{ loop.index0 }})" style="font-size: 0.9em; padding: 8px 16px;">
                                        <span class="btn-text">Quick LLM Analysis</span>
                                        <span class="btn-loading" style="display:none;">🔄</span>
                                    </button>
                                </div>
                            </div>
                            {% endfor %}
                            {% else %}
                            <div class="empty-state">
                                <p>No user copy operations found in the log data.</p>
                            </div>
                            {% endif %}
                        </div>
                    </div>
                </div>
                
                <div id="ioctl" class="tab-content">
                    <div class="section">
                        <div class="section-title">IOCTL Handler Operations</div>
                        <input type="text" class="search-box" id="ioctlSearch" placeholder="Search IOCTL handlers..." onkeyup="filterIOCTL()">
                        
                        <div id="ioctlGrid">
                            {% if data.ioctl_operations %}
                            {% for ioctl in data.ioctl_operations %}
                            <div class="ioctl-item">
                                <div class="ioctl-header">
                                    {{ ioctl.function_name }}
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
                                
                                {% if ioctl.stack_trace %}
                                <button class="toggle-btn" onclick="toggleStackTrace(this)">Show Stack Trace</button>
                                <div class="stack-trace hidden">
                                    <div class="stack-trace-header">Stack Trace:</div>
                                    {% for line in ioctl.stack_trace %}
                                    <div class="stack-line">{{ line }}</div>
                                    {% endfor %}
                                </div>
                                {% endif %}
                                
                                <!-- LLM Analysis Button -->
                                <div class="llm-action-buttons" style="margin-top: 15px;">
                                    <button class="analyze-btn" onclick="quickAnalyzeIOCTL({{ loop.index0 }})" style="font-size: 0.9em; padding: 8px 16px;">
                                        <span class="btn-text">Quick LLM Analysis</span>
                                        <span class="btn-loading" style="display:none;">🔄</span>
                                    </button>
                                </div>
                            </div>
                            {% endfor %}
                            {% else %}
                            <div class="empty-state">
                                <p>No IOCTL operations found in the log data.</p>
                            </div>
                            {% endif %}
                        </div>
                    </div>
                </div>
                
                <div id="devices" class="tab-content">
                    <div class="section">
                        <div class="section-title">Device Access Information</div>
                        {% if data.device_info %}
                        
                        <!-- Device Access Summary -->
                        <div class="device-summary">
                            <h3>Device Access Summary</h3>
                            <div class="stats-grid">
                                <div class="stat-card">
                                    <div class="stat-number">{{ data.device_info.total_accesses }}</div>
                                    <div class="stat-label">Total Device Accesses</div>
                                </div>
                                <div class="stat-card">
                                    <div class="stat-number">{{ data.device_info.unique_device_count }}</div>
                                    <div class="stat-label">Unique Devices</div>
                                </div>
                            </div>
                        </div>
                        
                        <input type="text" class="search-box" id="deviceSearch" placeholder="Search devices..." onkeyup="filterDevices()">
                        
                        <!-- Device Access List -->
                        <div id="deviceGrid">
                            {% set unique_devices = data.device_info.unique_devices %}
                            {% for device_path in unique_devices %}
                            {% set device_accesses = data.device_info.device_accesses | selectattr("device_path", "equalto", device_path) | list %}
                            <div class="device-item">
                                <div class="device-header">
                                    {{ device_path }}
                                    <span class="access-count">{{ device_accesses|length }} accesses</span>
                                </div>
                                
                                <!-- Timeline visualization for this device -->
                                <div class="device-timeline">
                                    <div class="timeline-header">Access Timeline</div>
                                    <div class="timeline-container">
                                        {% for access in device_accesses %}
                                        <div class="timeline-point" title="{{ access.timestamp_str }} - {{ access.access_type }} (PID: {{ access.pid }})">
                                            <div class="timeline-marker access-{{ access.access_type.lower().replace('_', '-') }}"></div>
                                            <div class="timeline-tooltip">
                                                <strong>{{ access.timestamp_str }}</strong><br>
                                                Type: {{ access.access_type }}<br>
                                                PID: {{ access.pid }}<br>
                                                {% if access.flags %}Flags: {{ access.flags }}<br>{% endif %}
                                                {% if access.result %}Result: {{ access.result }}{% endif %}
                                            </div>
                                        </div>
                                        {% endfor %}
                                    </div>
                                </div>
                                
                                <!-- Detailed access list -->
                                <div class="device-details">
                                    <button class="toggle-btn" onclick="toggleDeviceDetails(this)">Show Access Details</button>
                                    <div class="access-details hidden">
                                        <table class="access-table">
                                            <thead>
                                                <tr>
                                                    <th>Timestamp</th>
                                                    <th>Access Type</th>
                                                    <th>PID</th>
                                                    <th>Flags</th>
                                                    <th>Result</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {% for access in device_accesses %}
                                                <tr>
                                                    <td class="timestamp">{{ access.timestamp_str }}</td>
                                                    <td class="access-type">{{ access.access_type }}</td>
                                                    <td class="pid">{{ access.pid }}</td>
                                                    <td class="flags">{{ access.flags or '-' }}</td>
                                                    <td class="result">{{ access.result or '-' }}</td>
                                                </tr>
                                                {% endfor %}
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            {% endfor %}
                        </div>
                        
                        {% else %}
                        <div class="empty-state">
                            <p>No device access information found in the log data.</p>
                            <p>Try running with <code>--strace-log &lt;strace_log_file&gt;</code> to capture device access patterns.</p>
                        </div>
                        {% endif %}
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
                                    <div class="stat-number">{{ ((data.get('memory_info', {}).get('total_reserved_memory_kb', 0) / 1024) | round(1)) }} MB</div>
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
                            <button class="memory-tab active" onclick="showMemoryTab('reserved')">All Memory Pools</button>
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
                
                <!-- LLM Analysis Tab -->
                <div id="llmAnalysis" class="tab-content">
                    <div class="section">
                        <div class="section-title">LLM Assisted Security Analysis</div>
                        
                        <!-- LLM Status and Model Selection -->
                        <div class="llm-controls">
                            <div class="llm-status" id="llmStatus">
                                <span class="status-indicator"></span>
                                <span class="status-text">Checking LLM availability...</span>
                            </div>
                            
                            <div class="model-selection">
                                <label for="modelSelect">AI Model:</label>
                                <select id="modelSelect">
                                    <option value="gpt-3.5-turbo">GPT-3.5 Turbo (Fast & Cost-effective)</option>
                                    <option value="gpt-4">GPT-4 (Advanced Analysis)</option>
                                    <option value="gpt-4-turbo-preview">GPT-4 Turbo (Latest & Most Capable)</option>
                                </select>
                            </div>
                        </div>
                        
                        <!-- Analysis Tabs -->
                        <div class="analysis-tabs">
                            <button class="analysis-tab active" onclick="showAnalysisTab('functionAnalysis')">Function Analysis</button>
                            <button class="analysis-tab" onclick="showAnalysisTab('dmaAnalysis')">DMA Analysis</button>
                            <button class="analysis-tab" onclick="showAnalysisTab('userCopyAnalysis')">User Copy Analysis</button>
                            <button class="analysis-tab" onclick="showAnalysisTab('ioctlAnalysis')">IOCTL Analysis</button>
                            <button class="analysis-tab" onclick="showAnalysisTab('logAnalysis')">Log Analysis</button>
                            <button class="analysis-tab" onclick="showAnalysisTab('securityReport')">Security Report</button>
                        </div>
                        
                        <!-- Function Analysis -->
                        <div id="functionAnalysis" class="analysis-content active">
                            <h3>Function Code Analysis</h3>
                            <div class="analysis-form">
                                <div class="form-group">
                                    <label for="functionSelect">Select Function:</label>
                                    <select id="functionSelect" onchange="loadSelectedFunction()">
                                        <option value="">-- Select a function --</option>
                                        {% for file_path, functions in data.functions_by_file.items() %}
                                            {% for func in functions %}
                                            <option value="{{ func.function_name }}|{{ file_path }}|{{ func.line_number }}">
                                                {{ func.function_name }} ({{ file_path }}:{{ func.line_number }})
                                            </option>
                                            {% endfor %}
                                        {% endfor %}
                                    </select>
                                </div>
                                
                                <div class="form-group">
                                    <label for="functionCode">Function Code:</label>
                                    <textarea id="functionCode" placeholder="Function code will be loaded here..." rows="10"></textarea>
                                </div>
                                
                                <div class="form-group">
                                    <label for="customPrompt">Custom Analysis Prompt (Optional):</label>
                                    <textarea id="customPrompt" placeholder="e.g., 'Focus on potential buffer overflow vulnerabilities', 'Analyze for race conditions', etc." rows="3"></textarea>
                                </div>
                                
                                <div class="form-group">
                                    <button class="analyze-btn" onclick="analyzeFunctionWithLLM()" id="analyzeFunctionBtn">
                                        <span class="btn-text">Analyze Function</span>
                                        <span class="btn-loading" style="display:none;">Analyzing...</span>
                                    </button>
                                </div>
                                
                                <div id="functionAnalysisResult" class="analysis-result"></div>
                            </div>
                        </div>
                        
                        <!-- DMA Analysis -->
                        <div id="dmaAnalysis" class="analysis-content">
                            <h3>DMA Operation Analysis</h3>
                            <div class="analysis-form">
                                <div class="form-group">
                                    <label for="dmaSelect">Select DMA Operation:</label>
                                    <select id="dmaSelect" onchange="loadSelectedDMA()">
                                        <option value="">-- Select a DMA operation --</option>
                                        {% for dma in data.dma_operations %}
                                        <option value="{{ loop.index0 }}">
                                            {{ dma.dma_function }} in {{ dma.caller_function }} ({{ dma.file_path }}:{{ dma.line_number }})
                                        </option>
                                        {% endfor %}
                                    </select>
                                </div>
                                
                                <div class="form-group">
                                    <label for="dmaCode">Associated Function Code:</label>
                                    <textarea id="dmaCode" placeholder="Associated function code will be loaded here..." rows="8"></textarea>
                                </div>
                                
                                <div class="form-group">
                                    <label for="callGraph">Call Graph:</label>
                                    <textarea id="callGraph" placeholder="Call graph/stack trace will be shown here..." rows="5"></textarea>
                                </div>
                                
                                <div class="form-group">
                                    <label for="dmaCustomPrompt">Custom Analysis Prompt (Optional):</label>
                                    <textarea id="dmaCustomPrompt" placeholder="e.g., 'Focus on DMA coherency issues', 'Analyze for race conditions', etc." rows="3"></textarea>
                                </div>
                                
                                <div class="form-group">
                                    <button class="analyze-btn" onclick="analyzeDMAWithLLM()" id="analyzeDMABtn">
                                        <span class="btn-text">Analyze DMA Operation</span>
                                        <span class="btn-loading" style="display:none;">Analyzing...</span>
                                    </button>
                                </div>
                                
                                <div id="dmaAnalysisResult" class="analysis-result"></div>
                            </div>
                        </div>
                        
                        <!-- User Copy Analysis -->
                        <div id="userCopyAnalysis" class="analysis-content">
                            <h3>User Copy Operation Analysis</h3>
                            <div class="analysis-form">
                                <div class="form-group">
                                    <label for="userCopySelect">Select User Copy Operation:</label>
                                    <select id="userCopySelect" onchange="loadSelectedUserCopy()">
                                        <option value="">-- Select a user copy operation --</option>
                                        {% for copy in data.user_copy_operations %}
                                        <option value="{{ loop.index0 }}">
                                            {{ copy.copy_function }} in {{ copy.caller_function }} ({{ copy.file_path }}:{{ copy.line_number }})
                                        </option>
                                        {% endfor %}
                                    </select>
                                </div>
                                
                                <div class="form-group">
                                    <label for="userCopyCode">Associated Function Code:</label>
                                    <textarea id="userCopyCode" placeholder="Associated function code will be loaded here..." rows="8"></textarea>
                                </div>
                                
                                <div class="form-group">
                                    <label for="userCopyCustomPrompt">Custom Analysis Prompt (Optional):</label>
                                    <textarea id="userCopyCustomPrompt" placeholder="e.g., 'Focus on buffer overflow vulnerabilities', 'Analyze for input validation issues', etc." rows="3"></textarea>
                                </div>
                                
                                <div class="form-group">
                                    <button class="analyze-btn" onclick="analyzeUserCopyWithLLM()" id="analyzeUserCopyBtn">
                                        <span class="btn-text">Analyze User Copy Operation</span>
                                        <span class="btn-loading" style="display:none;">Analyzing...</span>
                                    </button>
                                </div>
                                
                                <div id="userCopyAnalysisResult" class="analysis-result"></div>
                            </div>
                        </div>
                        
                        <!-- IOCTL Analysis -->
                        <div id="ioctlAnalysis" class="analysis-content">
                            <h3>IOCTL Handler Analysis</h3>
                            <div class="analysis-form">
                                <div class="form-group">
                                    <label for="ioctlSelect">Select IOCTL Handler:</label>
                                    <select id="ioctlSelect" onchange="loadSelectedIOCTL()">
                                        <option value="">-- Select an IOCTL handler --</option>
                                        {% for ioctl in data.ioctl_operations %}
                                        <option value="{{ loop.index0 }}">
                                            {{ ioctl.function_name }} ({{ ioctl.file_path }}:{{ ioctl.line_number }})
                                        </option>
                                        {% endfor %}
                                    </select>
                                </div>
                                
                                <div class="form-group">
                                    <label for="ioctlCode">Function Code:</label>
                                    <textarea id="ioctlCode" placeholder="Function code will be loaded here..." rows="8"></textarea>
                                </div>
                                
                                <div class="form-group">
                                    <label for="ioctlCustomPrompt">Custom Analysis Prompt (Optional):</label>
                                    <textarea id="ioctlCustomPrompt" placeholder="e.g., 'Focus on privilege escalation', 'Analyze for input validation', etc." rows="3"></textarea>
                                </div>
                                
                                <div class="form-group">
                                    <button class="analyze-btn" onclick="analyzeIOCTLWithLLM()" id="analyzeIOCTLBtn">
                                        <span class="btn-text">Analyze IOCTL Handler</span>
                                        <span class="btn-loading" style="display:none;">Analyzing...</span>
                                    </button>
                                </div>
                                
                                <div id="ioctlAnalysisResult" class="analysis-result"></div>
                            </div>
                        </div>
                        
                        <!-- Log Analysis -->
                        <div id="logAnalysis" class="analysis-content">
                            <h3>Comprehensive Log Analysis</h3>
                            <div class="analysis-form">
                                <div class="form-group">
                                    <label for="analysisType">Analysis Type:</label>
                                    <select id="analysisType">
                                        <option value="general">General Analysis</option>
                                        <option value="security">Security-Focused Analysis</option>
                                        <option value="performance">Performance Analysis</option>
                                    </select>
                                </div>
                                
                                <div class="form-group">
                                    <label for="logCustomPrompt">Custom Analysis Prompt (Optional):</label>
                                    <textarea id="logCustomPrompt" placeholder="e.g., 'Focus on user-space interactions', 'Look for privilege escalation patterns', etc." rows="3"></textarea>
                                </div>
                                
                                <div class="form-group">
                                    <button class="analyze-btn" onclick="analyzeLogsWithLLM()" id="analyzeLogsBtn">
                                        <span class="btn-text">Analyze All Logs</span>
                                        <span class="btn-loading" style="display:none;">Analyzing...</span>
                                    </button>
                                </div>
                                
                                <div id="logAnalysisResult" class="analysis-result"></div>
                            </div>
                        </div>
                        
                        <!-- Security Report -->
                        <div id="securityReport" class="analysis-content">
                            <h3>Comprehensive Security Report</h3>
                            <div class="analysis-form">
                                <div class="form-group">
                                    <p>Generate a comprehensive security analysis report based on all instrumentation data. This will analyze all functions, DMA operations, IOCTL handlers, and other collected data to provide a holistic security assessment.</p>
                                </div>
                                
                                <div class="form-group">
                                    <button class="analyze-btn" onclick="generateSecurityReport()" id="securityReportBtn">
                                        <span class="btn-text">📋 Generate Security Report</span>
                                        <span class="btn-loading" style="display:none;">Generating...</span>
                                    </button>
                                </div>
                                
                                <div id="securityReportResult" class="analysis-result"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
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
        
        function filterDevices() {
            const searchTerm = document.getElementById('deviceSearch').value.toLowerCase();
            const deviceItems = document.querySelectorAll('.device-item');
            
            deviceItems.forEach(item => {
                const text = item.textContent.toLowerCase();
                const shouldShow = text.includes(searchTerm);
                item.style.display = shouldShow ? 'block' : 'none';
            });
        }
        
        function toggleDeviceDetails(btn) {
            const details = btn.nextElementSibling;
            const isHidden = details.classList.contains('hidden');
            
            if (isHidden) {
                details.classList.remove('hidden');
                btn.textContent = 'Hide Access Details';
            } else {
                details.classList.add('hidden');
                btn.textContent = 'Show Access Details';
            }
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
        
        // LLM Analysis Functions
        let llmAvailable = false;
        let availableModels = [];
        
        // Check LLM status on page load
        document.addEventListener('DOMContentLoaded', function() {
            checkLLMStatus();
        });
        
        function checkLLMStatus() {
            fetch('/api/llm/status')
                .then(response => response.json())
                .then(data => {
                    llmAvailable = data.available;
                    availableModels = data.models || [];
                    
                    const statusIndicator = document.querySelector('.status-indicator');
                    const statusText = document.querySelector('.status-text');
                    const modelSelect = document.getElementById('modelSelect');
                    
                    if (llmAvailable) {
                        statusIndicator.className = 'status-indicator available';
                        statusText.textContent = 'LLM Analysis Available';
                        
                        // Populate model dropdown
                        modelSelect.innerHTML = '';
                        availableModels.forEach(model => {
                            const option = document.createElement('option');
                            option.value = model.id;
                            option.textContent = `${model.name} - ${model.description}`;
                            modelSelect.appendChild(option);
                        });
                    } else {
                        statusIndicator.className = 'status-indicator unavailable';
                        statusText.textContent = 'LLM Analysis Unavailable - Configure OpenAI API Key';
                        modelSelect.innerHTML = '<option>OpenAI API Key Required</option>';
                    }
                })
                .catch(error => {
                    console.error('Error checking LLM status:', error);
                    const statusIndicator = document.querySelector('.status-indicator');
                    const statusText = document.querySelector('.status-text');
                    statusIndicator.className = 'status-indicator unavailable';
                    statusText.textContent = 'Error checking LLM status';
                });
        }
        
        function showAnalysisTab(tabName) {
            // Hide all analysis content
            const contents = document.querySelectorAll('.analysis-content');
            contents.forEach(content => content.classList.remove('active'));
            
            // Remove active class from all analysis tabs
            const tabs = document.querySelectorAll('.analysis-tab');
            tabs.forEach(tab => tab.classList.remove('active'));
            
            // Show selected analysis content
            document.getElementById(tabName).classList.add('active');
            
            // Set active tab
            event.target.classList.add('active');
        }
        
        function loadSelectedFunction() {
            const functionSelect = document.getElementById('functionSelect');
            const functionCode = document.getElementById('functionCode');
            
            if (!functionSelect.value) {
                functionCode.value = '';
                return;
            }
            
            const [functionName, filePath, lineNumber] = functionSelect.value.split('|');
            
            // Try to load function code from API
            fetch(`/api/function-code?name=${encodeURIComponent(functionName)}&file=${encodeURIComponent(filePath)}&line=${lineNumber}`)
                .then(response => response.json())
                .then(data => {
                    if (data.function_code) {
                        functionCode.value = data.function_code;
                    } else {
                        functionCode.value = 'No source code available for this function.';
                    }
                })
                .catch(error => {
                    console.error('Error loading function code:', error);
                    functionCode.value = 'Error loading function code.';
                });
        }
        
        function analyzeFunctionWithLLM() {
            if (!llmAvailable) {
                alert('LLM analysis is not available. Please configure your OpenAI API key.');
                return;
            }
            
            const functionSelect = document.getElementById('functionSelect');
            const functionCode = document.getElementById('functionCode');
            const customPrompt = document.getElementById('customPrompt');
            const modelSelect = document.getElementById('modelSelect');
            const analyzeBtn = document.getElementById('analyzeFunctionBtn');
            const resultDiv = document.getElementById('functionAnalysisResult');
            
            if (!functionSelect.value) {
                alert('Please select a function to analyze.');
                return;
            }
            
            if (!functionCode.value.trim()) {
                alert('No function code available to analyze.');
                return;
            }
            
            const [functionName, filePath, lineNumber] = functionSelect.value.split('|');
            
            // Show loading state
            analyzeBtn.classList.add('loading');
            analyzeBtn.disabled = true;
            resultDiv.style.display = 'none';
            
            const requestData = {
                function_name: functionName,
                source_code: functionCode.value,
                file_path: filePath,
                custom_prompt: customPrompt.value,
                model_id: modelSelect.value
            };
            
            fetch('/api/llm/analyze/function', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(requestData)
            })
            .then(response => response.json())
            .then(data => {
                analyzeBtn.classList.remove('loading');
                analyzeBtn.disabled = false;
                
                if (data.status === 'success') {
                    showAnalysisResult(resultDiv, data.analysis, 'success', {
                        'Function': data.function_name,
                        'File': data.file_path,
                        'Model': data.model_used,
                        'Custom Prompt': data.custom_prompt || 'None'
                    });
                } else {
                    showAnalysisResult(resultDiv, data.error, 'error');
                }
            })
            .catch(error => {
                console.error('Error analyzing function:', error);
                analyzeBtn.classList.remove('loading');
                analyzeBtn.disabled = false;
                showAnalysisResult(resultDiv, 'Network error occurred while analyzing function.', 'error');
            });
        }
        
        function loadSelectedDMA() {
            const dmaSelect = document.getElementById('dmaSelect');
            const dmaCode = document.getElementById('dmaCode');
            const callGraph = document.getElementById('callGraph');
            
            if (!dmaSelect.value) {
                dmaCode.value = '';
                callGraph.value = '';
                return;
            }
            
            const dmaIndex = parseInt(dmaSelect.value);
            
            // Load DMA operation details from current data
            fetch('/api/data')
                .then(response => response.json())
                .then(data => {
                    const dmaOp = data.dma_operations[dmaIndex];
                    if (dmaOp) {
                        // Try to load associated function code
                        dmaCode.value = 'Loading associated function code...';
                        
                        // Show call graph if available
                        if (dmaOp.stack_trace && dmaOp.stack_trace.length > 0) {
                            callGraph.value = dmaOp.stack_trace.join('\\n');
                        } else {
                            callGraph.value = 'No call graph available for this DMA operation.';
                        }
                        
                        // Try to load function code for the caller function
                        fetch(`/api/dma-code/${dmaIndex}`)
                            .then(response => response.json())
                            .then(funcData => {
                                if (funcData.function_code) {
                                    dmaCode.value = funcData.function_code;
                                } else {
                                    dmaCode.value = 'No source code available for the caller function.';
                                }
                            })
                            .catch(error => {
                                dmaCode.value = 'Error loading function code.';
                            });
                    }
                })
                .catch(error => {
                    console.error('Error loading DMA details:', error);
                    dmaCode.value = 'Error loading DMA operation details.';
                });
        }
        
        function loadSelectedUserCopy() {
            const userCopySelect = document.getElementById('userCopySelect');
            const userCopyCode = document.getElementById('userCopyCode');
            
            if (!userCopySelect.value) {
                userCopyCode.value = '';
                return;
            }
            
            const copyIndex = parseInt(userCopySelect.value);
            
            // Load user copy operation details
            userCopyCode.value = 'Loading function code...';
            
            fetch(`/api/copy-code/${copyIndex}`)
                .then(response => response.json())
                .then(data => {
                    if (data.function_code) {
                        userCopyCode.value = data.function_code;
                    } else {
                        userCopyCode.value = 'No source code available for this user copy operation.';
                    }
                })
                .catch(error => {
                    console.error('Error loading user copy code:', error);
                    userCopyCode.value = 'Error loading function code.';
                });
        }
        
        function loadSelectedIOCTL() {
            const ioctlSelect = document.getElementById('ioctlSelect');
            const ioctlCode = document.getElementById('ioctlCode');
            
            if (!ioctlSelect.value) {
                ioctlCode.value = '';
                return;
            }
            
            const ioctlIndex = parseInt(ioctlSelect.value);
            
            // Load IOCTL handler code
            ioctlCode.value = 'Loading function code...';
            
            fetch(`/api/ioctl-code/${ioctlIndex}`)
                .then(response => response.json())
                .then(data => {
                    if (data.function_code) {
                        ioctlCode.value = data.function_code;
                    } else {
                        ioctlCode.value = 'No source code available for this IOCTL handler.';
                    }
                })
                .catch(error => {
                    console.error('Error loading IOCTL code:', error);
                    ioctlCode.value = 'Error loading function code.';
                });
        }
        
        // LLM analysis functions moved to external JavaScript file
        
        // Quick analysis functions for inline buttons
        function quickAnalyzeDMA(dmaIndex) {
            if (!llmAvailable) {
                alert('LLM analysis is not available. Please configure your OpenAI API key.');
                return;
            }
            
            // Switch to LLM Analysis tab and DMA Analysis subtab
            showTab('llmAnalysis');
            showAnalysisTab('dmaAnalysis');
            
            // Select the DMA operation
            const dmaSelect = document.getElementById('dmaSelect');
            dmaSelect.value = dmaIndex;
            loadSelectedDMA();
            
            // Scroll to the analysis section
            document.getElementById('llmAnalysis').scrollIntoView({ behavior: 'smooth' });
        }
        
        function quickAnalyzeUserCopy(copyIndex) {
            if (!llmAvailable) {
                alert('LLM analysis is not available. Please configure your OpenAI API key.');
                return;
            }
            
            // Switch to LLM Analysis tab and User Copy Analysis subtab
            showTab('llmAnalysis');
            showAnalysisTab('userCopyAnalysis');
            
            // Select the user copy operation
            const userCopySelect = document.getElementById('userCopySelect');
            userCopySelect.value = copyIndex;
            loadSelectedUserCopy();
            
            // Scroll to the analysis section
            document.getElementById('llmAnalysis').scrollIntoView({ behavior: 'smooth' });
        }
        
        function quickAnalyzeIOCTL(ioctlIndex) {
            if (!llmAvailable) {
                alert('LLM analysis is not available. Please configure your OpenAI API key.');
                return;
            }
            
            // Switch to LLM Analysis tab and IOCTL Analysis subtab
            showTab('llmAnalysis');
            showAnalysisTab('ioctlAnalysis');
            
            // Select the IOCTL handler
            const ioctlSelect = document.getElementById('ioctlSelect');
            ioctlSelect.value = ioctlIndex;
            loadSelectedIOCTL();
            
            // Scroll to the analysis section
            document.getElementById('llmAnalysis').scrollIntoView({ behavior: 'smooth' });
        }
        
        function quickAnalyzeFunction(functionName, filePath, lineNumber) {
            if (!llmAvailable) {
                alert('LLM analysis is not available. Please configure your OpenAI API key.');
                return;
            }
            
            // Switch to LLM Analysis tab and Function Analysis subtab
            showTab('llmAnalysis');
            showAnalysisTab('functionAnalysis');
            
            // Select the function
            const functionSelect = document.getElementById('functionSelect');
            functionSelect.value = `${functionName}|${filePath}|${lineNumber}`;
            loadSelectedFunction();
            
            // Scroll to the analysis section
            document.getElementById('llmAnalysis').scrollIntoView({ behavior: 'smooth' });
        }
        }
        
        function analyzeLogsWithLLM() {
            if (!llmAvailable) {
                alert('LLM analysis is not available. Please configure your OpenAI API key.');
                return;
            }
            
            const analysisType = document.getElementById('analysisType');
            const logCustomPrompt = document.getElementById('logCustomPrompt');
            const modelSelect = document.getElementById('modelSelect');
            const analyzeBtn = document.getElementById('analyzeLogsBtn');
            const resultDiv = document.getElementById('logAnalysisResult');
            
            // Show loading state
            analyzeBtn.classList.add('loading');
            analyzeBtn.disabled = true;
            resultDiv.style.display = 'none';
            
            // Get all data for log analysis
            fetch('/api/data')
                .then(response => response.json())
                .then(data => {
                    // Prepare logs from different categories
                    const logs = [];
                    
                    // Add function entries
                    if (data.function_entries) {
                        logs.push(...data.function_entries.slice(0, 5)); // Limit to first 5
                    }
                    
                    // Add DMA operations
                    if (data.dma_operations) {
                        logs.push(...data.dma_operations.slice(0, 5));
                    }
                    
                    // Add user copy operations
                    if (data.user_copy_operations) {
                        logs.push(...data.user_copy_operations.slice(0, 5));
                    }
                    
                    // Add IOCTL operations
                    if (data.ioctl_operations) {
                        logs.push(...data.ioctl_operations.slice(0, 5));
                    }
                    
                    const requestData = {
                        logs: logs,
                        analysis_type: analysisType.value,
                        custom_prompt: logCustomPrompt.value,
                        model_id: modelSelect.value
                    };
                    
                    return fetch('/api/llm/analyze/logs', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(requestData)
                    });
                })
                .then(response => response.json())
                .then(data => {
                    analyzeBtn.classList.remove('loading');
                    analyzeBtn.disabled = false;
                    
                    if (data.status === 'success') {
                        showAnalysisResult(resultDiv, data.analysis, 'success', {
                            'Analysis Type': data.analysis_type,
                            'Log Count': data.log_count,
                            'Model': data.model_used,
                            'Custom Prompt': data.custom_prompt || 'None'
                        });
                    } else {
                        showAnalysisResult(resultDiv, data.error, 'error');
                    }
                })
                .catch(error => {
                    console.error('Error analyzing logs:', error);
                    analyzeBtn.classList.remove('loading');
                    analyzeBtn.disabled = false;
                    showAnalysisResult(resultDiv, 'Network error occurred while analyzing logs.', 'error');
                });
        }
        
        function generateSecurityReport() {
            if (!llmAvailable) {
                alert('LLM analysis is not available. Please configure your OpenAI API key.');
                return;
            }
            
            const modelSelect = document.getElementById('modelSelect');
            const analyzeBtn = document.getElementById('securityReportBtn');
            const resultDiv = document.getElementById('securityReportResult');
            
            // Show loading state
            analyzeBtn.classList.add('loading');
            analyzeBtn.disabled = true;
            resultDiv.style.display = 'none';
            
            const requestData = {
                model_id: modelSelect.value
            };
            
            fetch('/api/llm/security-report', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(requestData)
            })
            .then(response => response.json())
            .then(data => {
                analyzeBtn.classList.remove('loading');
                analyzeBtn.disabled = false;
                
                if (data.status === 'success') {
                    showAnalysisResult(resultDiv, data.report, 'success', {
                        'Report Type': 'Comprehensive Security Analysis',
                        'Model': data.model_used,
                        'Generated': new Date().toLocaleString()
                    });
                } else {
                    showAnalysisResult(resultDiv, data.error, 'error');
                }
            })
            .catch(error => {
                console.error('Error generating security report:', error);
                analyzeBtn.classList.remove('loading');
                analyzeBtn.disabled = false;
                showAnalysisResult(resultDiv, 'Network error occurred while generating security report.', 'error');
            });
        }
        
        function showAnalysisResult(resultDiv, text, type, metadata = {}) {
            resultDiv.className = `analysis-result ${type}`;
            
            const title = type === 'success' ? '✅ Analysis Complete' : '❌ Analysis Failed';
            const icon = type === 'success' ? '🤖' : '⚠️';
            
            let metadataHtml = '';
            if (Object.keys(metadata).length > 0) {
                metadataHtml = '<div class="analysis-metadata">';
                for (const [key, value] of Object.entries(metadata)) {
                    if (value) {
                        metadataHtml += `<div class="metadata-item"><strong>${key}:</strong> ${value}</div>`;
                    }
                }
                metadataHtml += '</div>';
            }
            
            resultDiv.innerHTML = `
                <h4>${icon} ${title}</h4>
                <div class="analysis-text">${text}</div>
                ${metadataHtml}
            `;
            
            resultDiv.style.display = 'block';
            
            // Scroll to result
            resultDiv.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        }

        // Download functionality
        function downloadAnalysisResults(format) {
            fetch('/api/data')
                .then(response => response.json())
                .then(data => {
                    if (format === 'json') {
                        downloadJSON(data);
                    } else if (format === 'csv') {
                        downloadCSV(data);
                    } else if (format === 'html') {
                        downloadHTML(data);
                    }
                })
                .catch(error => {
                    console.error('Error downloading data:', error);
                    alert('Error downloading analysis results. Please try again.');
                });
        }

        function downloadJSON(data) {
            const jsonString = JSON.stringify(data, null, 2);
            const blob = new Blob([jsonString], { type: 'application/json' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = `kernel_analysis_results_${new Date().toISOString().slice(0, 10)}.json`;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            URL.revokeObjectURL(url);
        }

        function downloadCSV(data) {
            let csvContent = generateCSVReport(data);
            const blob = new Blob([csvContent], { type: 'text/csv' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = `kernel_analysis_results_${new Date().toISOString().slice(0, 10)}.csv`;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            URL.revokeObjectURL(url);
        }

        function downloadHTML(data) {
            let htmlContent = generateHTMLReport(data);
            const blob = new Blob([htmlContent], { type: 'text/html' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = `kernel_analysis_report_${new Date().toISOString().slice(0, 10)}.html`;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            URL.revokeObjectURL(url);
        }

        function generateCSVReport(data) {
            let csv = '';
            
            // Functions CSV
            if (data.functions_by_file) {
                csv += 'Functions Analysis\\n';
                csv += 'File Path,Function Name,Line Number,Parameters,Return Type\\n';
                for (const [filePath, functions] of Object.entries(data.functions_by_file)) {
                    for (const func of functions) {
                        csv += `"${filePath}","${func.function_name}","${func.line_number || ''}","${func.parameters || ''}","${func.return_type || ''}"\\n`;
                    }
                }
                csv += '\\n';
            }
            
            // DMA Operations CSV
            if (data.dma_operations && data.dma_operations.length > 0) {
                csv += 'DMA Operations\\n';
                csv += 'DMA Function,Caller Function,File Path,Line Number,Parameters\\n';
                for (const dma of data.dma_operations) {
                    csv += `"${dma.dma_function}","${dma.caller_function}","${dma.file_path}","${dma.line_number || ''}","${dma.parameters || ''}"\\n`;
                }
                csv += '\\n';
            }
            
            // User Copy Operations CSV
            if (data.user_copy_operations && data.user_copy_operations.length > 0) {
                csv += 'User Copy Operations\\n';
                csv += 'Copy Function,Caller Function,File Path,Line Number,Parameters\\n';
                for (const copy of data.user_copy_operations) {
                    csv += `"${copy.copy_function}","${copy.caller_function}","${copy.file_path}","${copy.line_number || ''}","${copy.parameters || ''}"\\n`;
                }
                csv += '\\n';
            }
            
            // IOCTL Operations CSV
            if (data.ioctl_operations && data.ioctl_operations.length > 0) {
                csv += 'IOCTL Operations\\n';
                csv += 'Function Name,File Path,Line Number,Handler Type\\n';
                for (const ioctl of data.ioctl_operations) {
                    csv += `"${ioctl.function_name}","${ioctl.file_path}","${ioctl.line_number || ''}","${ioctl.handler_type || ''}"\\n`;
                }
            }
            
            return csv;
        }

        function generateHTMLReport(data) {
            const timestamp = new Date().toISOString();
            const stats = data.statistics || {};
            
            return `<!DOCTYPE html>
<html>
<head>
    <title>Kernel Analysis Report - ${timestamp.slice(0, 10)}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; line-height: 1.6; }
        h1, h2 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
        .stats { background: #f8f9fa; padding: 15px; border-radius: 5px; margin: 20px 0; }
        .stat-item { display: inline-block; margin: 10px 20px 10px 0; }
        .stat-number { font-size: 24px; font-weight: bold; color: #3498db; }
        .stat-label { font-size: 12px; color: #666; }
        table { border-collapse: collapse; width: 100%; margin: 20px 0; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #3498db; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        .section { margin: 30px 0; }
        code { background: #f4f4f4; padding: 2px 5px; border-radius: 3px; font-family: monospace; }
    </style>
</head>
<body>
    <h1>Kernel Log Analysis Report</h1>
    <p><strong>Generated:</strong> ${new Date().toLocaleString()}</p>
    
    <div class="stats">
        <h2>📊 Analysis Statistics</h2>
        <div class="stat-item">
            <div class="stat-number">${stats.unique_function_entries || 0}</div>
            <div class="stat-label">Functions</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">${stats.unique_dma_operations || 0}</div>
            <div class="stat-label">DMA Operations</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">${stats.unique_user_copy_operations || 0}</div>
            <div class="stat-label">User Copy Operations</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">${stats.unique_ioctl_operations || 0}</div>
            <div class="stat-label">IOCTL Operations</div>
        </div>
    </div>
    
    ${generateFunctionsHTML(data)}
    ${generateDMAHTML(data)}
    ${generateUserCopyHTML(data)}
    ${generateIOCTLHTML(data)}
    
</body>
</html>`;
        }

        function generateFunctionsHTML(data) {
            if (!data.functions_by_file) return '';
            
            let html = '<div class="section"><h2>Functions Analysis</h2>';
            
            for (const [filePath, functions] of Object.entries(data.functions_by_file)) {
                html += `<h3>📁 ${filePath}</h3><table>`;
                html += '<tr><th>Function Name</th><th>Line</th><th>Parameters</th><th>Return Type</th></tr>';
                
                for (const func of functions) {
                    html += `<tr>
                        <td><code>${func.function_name}</code></td>
                        <td>${func.line_number || 'N/A'}</td>
                        <td>${func.parameters || 'N/A'}</td>
                        <td>${func.return_type || 'N/A'}</td>
                    </tr>`;
                }
                html += '</table>';
            }
            html += '</div>';
            return html;
        }

        function generateDMAHTML(data) {
            if (!data.dma_operations || data.dma_operations.length === 0) return '';
            
            let html = '<div class="section"><h2>DMA Operations</h2><table>';
            html += '<tr><th>DMA Function</th><th>Caller Function</th><th>File Path</th><th>Line</th></tr>';
            
            for (const dma of data.dma_operations) {
                html += `<tr>
                    <td><code>${dma.dma_function}</code></td>
                    <td><code>${dma.caller_function}</code></td>
                    <td>${dma.file_path}</td>
                    <td>${dma.line_number || 'N/A'}</td>
                </tr>`;
            }
            html += '</table></div>';
            return html;
        }

        function generateUserCopyHTML(data) {
            if (!data.user_copy_operations || data.user_copy_operations.length === 0) return '';
            
            let html = '<div class="section"><h2>👥 User Copy Operations</h2><table>';
            html += '<tr><th>Copy Function</th><th>Caller Function</th><th>File Path</th><th>Line</th></tr>';
            
            for (const copy of data.user_copy_operations) {
                html += `<tr>
                    <td><code>${copy.copy_function}</code></td>
                    <td><code>${copy.caller_function}</code></td>
                    <td>${copy.file_path}</td>
                    <td>${copy.line_number || 'N/A'}</td>
                </tr>`;
            }
            html += '</table></div>';
            return html;
        }

        function generateIOCTLHTML(data) {
            if (!data.ioctl_operations || data.ioctl_operations.length === 0) return '';
            
            let html = '<div class="section"><h2>⚙️ IOCTL Operations</h2><table>';
            html += '<tr><th>Function Name</th><th>File Path</th><th>Line</th><th>Handler Type</th></tr>';
            
            for (const ioctl of data.ioctl_operations) {
                html += `<tr>
                    <td><code>${ioctl.function_name}</code></td>
                    <td>${ioctl.file_path}</td>
                    <td>${ioctl.line_number || 'N/A'}</td>
                    <td>${ioctl.handler_type || 'N/A'}</td>
                </tr>`;
            }
            html += '</table></div>';
            return html;
        }

        // Comprehensive Analysis Function
        function runComprehensiveAnalysis() {
            console.log('Starting comprehensive analysis...');
            
            // Get form values
            const modelSelect = document.getElementById('analyzeAllModel');
            const promptInput = document.getElementById('analyzeAllPrompt');
            const batchSizeSelect = document.getElementById('batchSize');
            const maxComponentsSelect = document.getElementById('maxComponents');
            const confidenceSelect = document.getElementById('confidenceThreshold');
            const analyzeBtn = document.getElementById('analyzeAllBtn');
            const progressSection = document.getElementById('progressSection');
            const resultsDashboard = document.getElementById('resultsDashboard');
            
            // Get values
            const modelId = modelSelect ? modelSelect.value : 'gpt-3.5-turbo';
            const customPrompt = promptInput ? promptInput.value : '';
            const batchSize = batchSizeSelect ? parseInt(batchSizeSelect.value) : 3;
            const maxComponents = maxComponentsSelect ? parseInt(maxComponentsSelect.value) : 50;
            const confidenceThreshold = confidenceSelect ? parseInt(confidenceSelect.value) : 50;
            
            // Show progress and disable button
            if (analyzeBtn) {
                analyzeBtn.disabled = true;
                analyzeBtn.innerHTML = '<span>Running Analysis...</span>';
            }
            
            if (progressSection) {
                progressSection.style.display = 'block';
                updateProgress(0, 0, 'Initializing comprehensive analysis...');
            }
            
            // Prepare request data
            const requestData = {
                component_types: ['functions', 'dma_operations', 'user_copy_operations', 'ioctl_operations'],
                batch_size: batchSize,
                model_id: modelId,
                custom_prompt: customPrompt,
                max_components: maxComponents,
                confidence_threshold: confidenceThreshold
            };
            
            console.log('Analysis request:', requestData);
            
            // Make API request
            fetch('/api/analyze/comprehensive', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(requestData)
            })
            .then(response => response.json())
            .then(data => {
                console.log('Analysis complete:', data);
                
                // Update progress to 100%
                updateProgress(data.total || 0, data.total || 0, 'Analysis completed successfully!');
                
                // Show results dashboard
                if (resultsDashboard) {
                    resultsDashboard.classList.add('visible');
                    resultsDashboard.style.display = 'block';
                    
                    // Update results summary
                    updateResultsSummary(data);
                    
                    // Populate results grid
                    populateResultsGrid(data.results || []);
                    
                    // Scroll to results
                    resultsDashboard.scrollIntoView({ behavior: 'smooth' });
                }
                
                // Re-enable button
                if (analyzeBtn) {
                    analyzeBtn.disabled = false;
                    analyzeBtn.innerHTML = '<span>✅ Analysis Complete - Run Again</span>';
                }
                
                console.log('Results dashboard shown, download buttons should be visible');
            })
            .catch(error => {
                console.error('Analysis failed:', error);
                
                updateProgress(0, 0, 'Analysis failed. Please try again.');
                
                if (analyzeBtn) {
                    analyzeBtn.disabled = false;
                    analyzeBtn.innerHTML = '<span>❌ Analysis Failed - Try Again</span>';
                }
            });
        }
        
        function updateProgress(processed, total, message) {
            const progressBar = document.getElementById('progressBar');
            const progressText = document.getElementById('progressText');
            const processedCount = document.getElementById('processedCount');
            const totalCount = document.getElementById('totalCount');
            
            if (progressBar && total > 0) {
                const percentage = (processed / total) * 100;
                progressBar.style.width = percentage + '%';
            }
            
            if (progressText) {
                progressText.textContent = message;
            }
            
            if (processedCount) {
                processedCount.textContent = processed;
            }
            
            if (totalCount) {
                totalCount.textContent = total;
            }
        }
        
        function updateResultsSummary(data) {
            const summaryDiv = document.getElementById('resultsSummary');
            if (!summaryDiv) return;
            
            const stats = data.statistics || {};
            const total = data.total || 0;
            
            summaryDiv.innerHTML = `
                <div class="summary-grid">
                    <div class="summary-card">
                        <div class="summary-number">${total}</div>
                        <div class="summary-label">Components Analyzed</div>
                    </div>
                    <div class="summary-card">
                        <div class="summary-number">${data.results ? data.results.length : 0}</div>
                        <div class="summary-label">Results Generated</div>
                    </div>
                    <div class="summary-card">
                        <div class="summary-number">${stats.llm_available ? 'Yes' : 'No'}</div>
                        <div class="summary-label">AI Analysis</div>
                    </div>
                    <div class="summary-card">
                        <div class="summary-number">${data.batch_size || 'N/A'}</div>
                        <div class="summary-label">Batch Size</div>
                    </div>
                </div>
            `;
        }
        
        function populateResultsGrid(results) {
            const gridDiv = document.getElementById('resultsGrid');
            if (!gridDiv) return;
            
            if (!results || results.length === 0) {
                gridDiv.innerHTML = '<div class="no-results">No analysis results to display.</div>';
                return;
            }
            
            let html = '<div class="results-list">';
            
            results.forEach((result, index) => {
                const component = result.component || {};
                const analysis = result.result || {};
                const scores = result.confidenceScores || {};
                
                html += `
                    <div class="result-card">
                        <div class="result-header">
                            <span class="result-type">${result.type || 'Unknown'}</span>
                            <span class="result-name">${component.name || 'Unnamed'}</span>
                        </div>
                        <div class="result-details">
                            <div class="result-file">${component.filePath || 'Unknown file'}</div>
                            ${component.lineNumber ? `<div class="result-line">Line: ${component.lineNumber}</div>` : ''}
                        </div>
                        <div class="result-analysis">
                            ${analysis.analysis || 'No analysis available'}
                        </div>
                        <div class="confidence-scores">
                            <div class="score">AIA Relevant: ${scores.AIARelevantFunction || 0}%</div>
                            <div class="score">Entry Point: ${scores.Relevant_KD_Entry_Point || 0}%</div>
                            <div class="score">Message Handling: ${scores.Message_Structure_Handling || 0}%</div>
                        </div>
                    </div>
                `;
            });
            
            html += '</div>';
            gridDiv.innerHTML = html;
        }
    </script>
    
    <!-- Load external JavaScript -->
    <script src="{{ url_for('static', filename='js/llm.js') }}"></script>
    <script src="{{ url_for('static', filename='js/main.js') }}"></script>
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
        <h1>Kernel Log Parser Results</h1>
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
        
        # Create function_entries structure if it doesn't exist (flatten functions_by_file)
        if 'function_entries' not in parsed_data and 'functions_by_file' in parsed_data:
            function_entries = []
            for file_path, file_functions in parsed_data['functions_by_file'].items():
                for func in file_functions:
                    # Ensure file_path is set if not present
                    if 'file_path' not in func:
                        func['file_path'] = file_path
                    function_entries.append(func)
            parsed_data['function_entries'] = function_entries
        
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
    
    # Store parsed data in app instance
    app = create_app()
    app.parsed_data = parsed_data
    
    print(f"\nStarting Kernel Log Analysis Web UI")
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
