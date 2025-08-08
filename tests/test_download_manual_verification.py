#!/usr/bin/env python3
"""
Manual Browser Test for Download Functionality

This creates a simple HTML test page to verify download functionality
and provides step-by-step instructions for manual verification.
"""

import webbrowser
import time
from pathlib import Path


def create_download_test_page():
    """Create a test HTML page to verify download functionality."""
    
    test_html = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Download Functionality Test</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .test-section {
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .success { background-color: #d4edda; border-color: #c3e6cb; }
        .warning { background-color: #fff3cd; border-color: #ffeaa7; }
        .error { background-color: #f8d7da; border-color: #f5c6cb; }
        .download-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            cursor: pointer;
            margin: 5px;
            font-weight: 600;
            transition: transform 0.2s;
        }
        .download-btn:hover {
            transform: translateY(-2px);
        }
        .test-results {
            margin-top: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 5px;
        }
        .checklist {
            list-style-type: none;
            padding: 0;
        }
        .checklist li {
            margin: 10px 0;
            padding: 5px;
        }
        .checklist li:before {
            content: "☐ ";
            margin-right: 10px;
        }
        .checklist li.checked:before {
            content: "✅ ";
        }
        #console-output {
            background: #000;
            color: #0f0;
            padding: 10px;
            border-radius: 5px;
            font-family: monospace;
            height: 150px;
            overflow-y: auto;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Download Functionality Test Page</h1>
        
        <div class="test-section success">
            <h2>Test Data Simulation</h2>
            <p>This page simulates the kernel analysis web UI download functionality.</p>
            <p><strong>Test Data Loaded:</strong></p>
            <ul>
                <li>Functions: 2</li>
                <li>DMA Operations: 1</li>
                <li>User Copy Operations: 1</li>
                <li>IOCTL Operations: 1</li>
            </ul>
        </div>
        
        <div class="test-section">
            <h2>📥 Download Buttons Test</h2>
            <p>These buttons should work exactly like in the real web UI:</p>
            
            <button class="download-btn" onclick="downloadAnalysisResults('json')" id="downloadJsonBtn">
                📥 Download JSON
            </button>
            <button class="download-btn" onclick="downloadAnalysisResults('csv')" id="downloadCsvBtn">
                📊 Download CSV
            </button>
            <button class="download-btn" onclick="downloadAnalysisResults('html')" id="downloadHtmlBtn">
                🌐 Download Report
            </button>
        </div>
        
        <div class="test-section">
            <h2>✅ Manual Test Checklist</h2>
            <ul class="checklist" id="testChecklist">
                <li onclick="toggleCheck(this)">I can see all three download buttons</li>
                <li onclick="toggleCheck(this)">Download JSON button works (creates .json file)</li>
                <li onclick="toggleCheck(this)">Download CSV button works (creates .csv file)</li>
                <li onclick="toggleCheck(this)">Download HTML button works (creates .html file)</li>
                <li onclick="toggleCheck(this)">No JavaScript errors in browser console</li>
                <li onclick="toggleCheck(this)">Downloaded files contain expected data</li>
            </ul>
        </div>
        
        <div class="test-section">
            <h2>JavaScript Console Output</h2>
            <p>Check for any errors or messages:</p>
            <div id="console-output"></div>
        </div>
        
        <div class="test-section warning">
            <h2>🚨 If Download Buttons Don't Work</h2>
            <p><strong>Troubleshooting Steps:</strong></p>
            <ol>
                <li>Open browser Developer Tools (F12)</li>
                <li>Check Console tab for JavaScript errors</li>
                <li>Click download button and watch for errors</li>
                <li>Check if files are actually downloaded to Downloads folder</li>
                <li>Verify browser allows downloads from this page</li>
            </ol>
        </div>
        
        <div class="test-section">
            <h2>🌐 Real Web UI Test</h2>
            <p>To test the actual web UI:</p>
            <pre>source setup.sh && python -m src.webviewer test_results_with_function_code.json --port 5003</pre>
            <p>Then visit: <a href="http://localhost:5003" target="_blank">http://localhost:5003</a></p>
        </div>
    </div>

    <script>
        // Simulate the exact same download functions from the web UI
        const testData = {
            "statistics": {
                "unique_function_entries": 2,
                "unique_dma_operations": 1,
                "unique_user_copy_operations": 1,
                "unique_ioctl_operations": 1
            },
            "functions_by_file": {
                "/test/file1.c": [
                    {
                        "function_name": "test_function_1",
                        "line_number": 10,
                        "parameters": "void",
                        "return_type": "int",
                        "function_code": "int test_function_1(void) {\\n    return 0;\\n}"
                    }
                ],
                "/test/file2.c": [
                    {
                        "function_name": "test_function_2", 
                        "line_number": 20,
                        "parameters": "int param",
                        "return_type": "void",
                        "function_code": "void test_function_2(int param) {\\n    // Test\\n}"
                    }
                ]
            },
            "dma_operations": [
                {
                    "dma_function": "dma_alloc_coherent",
                    "caller_function": "test_driver_init",
                    "file_path": "/test/driver.c",
                    "line_number": 150,
                    "parameters": "struct device *dev, size_t size, dma_addr_t *handle, gfp_t flag"
                }
            ],
            "user_copy_operations": [
                {
                    "copy_function": "copy_from_user",
                    "caller_function": "test_ioctl_handler", 
                    "file_path": "/test/ioctl.c",
                    "line_number": 75,
                    "parameters": "void *to, const void __user *from, unsigned long n"
                }
            ],
            "ioctl_operations": [
                {
                    "function_name": "test_ioctl_handler",
                    "file_path": "/test/ioctl.c",
                    "line_number": 70,
                    "handler_type": "unlocked_ioctl"
                }
            ]
        };

        function log(message) {
            const output = document.getElementById('console-output');
            output.innerHTML += new Date().toLocaleTimeString() + ': ' + message + '\\n';
            output.scrollTop = output.scrollHeight;
        }

        // Exact same download functions as in the web UI
        function downloadAnalysisResults(format) {
            log('Download initiated for format: ' + format);
            try {
                if (format === 'json') {
                    downloadJSON(testData);
                } else if (format === 'csv') {
                    downloadCSV(testData);
                } else if (format === 'html') {
                    downloadHTML(testData);
                }
                log('Download completed successfully');
            } catch (error) {
                log('ERROR: ' + error.message);
                console.error('Download error:', error);
            }
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
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1, h2 { color: #2c3e50; }
        table { border-collapse: collapse; width: 100%; margin: 20px 0; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #3498db; color: white; }
    </style>
</head>
<body>
    <h1>Kernel Log Analysis Report</h1>
    <p><strong>Generated:</strong> ${new Date().toLocaleString()}</p>
    <h2>📊 Statistics</h2>
    <p>Functions: ${stats.unique_function_entries || 0}</p>
    <p>DMA Operations: ${stats.unique_dma_operations || 0}</p>
    <p>User Copy Operations: ${stats.unique_user_copy_operations || 0}</p>
    <p>IOCTL Operations: ${stats.unique_ioctl_operations || 0}</p>
</body>
</html>`;
        }

        function toggleCheck(element) {
            element.classList.toggle('checked');
        }

        // Initialize
        log('Download functionality test page loaded');
        log('Click download buttons to test functionality');
    </script>
</body>
</html>
"""
    
    # Save to tests directory
    test_file = Path(__file__).parent / "download_test_page.html"
    with open(test_file, 'w') as f:
        f.write(test_html)
    
    return test_file


def main():
    """Create test page and provide instructions."""
    print("Creating download functionality test page...")
    
    test_file = create_download_test_page()
    print(f"✅ Test page created: {test_file}")
    
    print("\n" + "="*70)
    print("MANUAL DOWNLOAD FUNCTIONALITY TEST")
    print("="*70)
    print(f"\n1. Open the test page: {test_file}")
    print("\n2. Test the download buttons and check the checklist")
    print("\n3. If the test page works but real web UI doesn't:")
    print("   - Compare JavaScript console outputs")
    print("   - Check if real web UI has CSS hiding buttons")
    print("   - Verify data is loaded correctly in real web UI")
    print("\n4. To test real web UI:")
    print("   source setup.sh && python -m src.webviewer test_results_with_function_code.json --port 5003")
    print("   Then visit: http://localhost:5003")
    
    # Try to open in browser
    try:
        webbrowser.open(f"file://{test_file.absolute()}")
        print(f"\n🌐 Opening test page in browser...")
    except Exception as e:
        print(f"\n⚠️  Could not open browser automatically: {e}")
        print(f"   Please manually open: {test_file}")


if __name__ == "__main__":
    main()
