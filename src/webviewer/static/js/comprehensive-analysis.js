// Comprehensive Analysis JavaScript Module
// This module handles the comprehensive analysis functionality and download features

class ComprehensiveAnalysis {
    constructor() {
        this.analysisData = null;
        this.isAnalyzing = false;
        this.progressBar = null;
        this.resultsDashboard = null;
        this.initialize();
    }

    initialize() {
        console.log('Initializing Comprehensive Analysis Module');
        this.setupUI();
        this.bindEvents();
    }

    setupUI() {
        // Create comprehensive analysis section if it doesn't exist
        this.createAnalysisSection();
        this.setupProgressBar();
        this.setupResultsDashboard();
    }

    createAnalysisSection() {
        // Check if analysis section already exists
        let analysisSection = document.getElementById('comprehensiveAnalysisSection');
        
        if (!analysisSection) {
            // Find the LLM Analysis tab content
            const llmTabContent = document.getElementById('llmAnalysis');
            
            if (llmTabContent) {
                // Create the comprehensive analysis section
                const sectionHTML = `
                    <div id="comprehensiveAnalysisSection" class="analysis-section">
                        <div class="section-header">
                            <h3>🚀 Comprehensive Analysis</h3>
                            <p>Run AI-powered analysis across all components with downloadable results</p>
                        </div>
                        
                        <div class="analysis-controls">
                            <div class="control-row">
                                <div class="control-group">
                                    <label for="compAnalysisModel">AI Model:</label>
                                    <select id="compAnalysisModel">
                                        <option value="gpt-3.5-turbo">GPT-3.5 Turbo (Fast & Cost-effective)</option>
                                        <option value="gpt-4">GPT-4 (Advanced Analysis)</option>
                                        <option value="gpt-4-turbo-preview">GPT-4 Turbo (Latest)</option>
                                    </select>
                                </div>
                                
                                <div class="control-group">
                                    <label for="compBatchSize">Batch Size:</label>
                                    <select id="compBatchSize">
                                        <option value="2">2 (Fast)</option>
                                        <option value="3" selected>3 (Balanced)</option>
                                        <option value="5">5 (Thorough)</option>
                                    </select>
                                </div>
                                
                                <div class="control-group">
                                    <label for="compMaxComponents">Max Components:</label>
                                    <select id="compMaxComponents">
                                        <option value="10">10 (Quick)</option>
                                        <option value="25">25 (Standard)</option>
                                        <option value="50" selected>50 (Comprehensive)</option>
                                        <option value="100">100 (Full)</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="control-row">
                                <div class="control-group full-width">
                                    <label for="compCustomPrompt">Custom Analysis Prompt (Optional):</label>
                                    <textarea id="compCustomPrompt" 
                                              placeholder="e.g., 'Focus on memory safety vulnerabilities', 'Analyze for race conditions', etc."
                                              rows="3"></textarea>
                                </div>
                            </div>
                            
                            <div class="control-row">
                                <button id="startCompAnalysis" class="primary-btn large-btn">
                                    <span class="btn-icon">🚀</span>
                                    <span class="btn-text">Start Comprehensive Analysis</span>
                                </button>
                            </div>
                        </div>
                        
                        <div id="analysisProgress" class="progress-section" style="display: none;">
                            <div class="progress-header">
                                <h4>Analysis Progress</h4>
                                <p id="progressStatus">Initializing analysis...</p>
                            </div>
                            <div class="progress-bar-container">
                                <div id="progressBar" class="progress-bar"></div>
                            </div>
                            <div class="progress-stats">
                                <span id="processedCount">0</span> / <span id="totalCount">0</span> components analyzed
                            </div>
                        </div>
                        
                        <div id="analysisResults" class="results-section" style="display: none;">
                            <div class="results-header">
                                <h3>📊 Analysis Results</h3>
                                <p id="resultsSubtitle">Analysis completed successfully</p>
                            </div>
                            
                            <div class="results-summary" id="resultsSummary">
                                <!-- Summary cards will be populated here -->
                            </div>
                            
                            <div class="download-section">
                                <h4>📥 Download Results</h4>
                                <p>Export your analysis results in multiple formats</p>
                                <div class="download-buttons">
                                    <button id="downloadJSON" class="download-btn primary">
                                        📄 Download JSON
                                    </button>
                                    <button id="downloadCSV" class="download-btn secondary">
                                        📊 Download CSV
                                    </button>
                                    <button id="downloadHTML" class="download-btn tertiary">
                                        🌐 Download Report
                                    </button>
                                </div>
                            </div>
                            
                            <div class="results-grid" id="resultsGrid">
                                <!-- Result cards will be populated here -->
                            </div>
                        </div>
                    </div>
                `;
                
                // Insert the section before existing content
                llmTabContent.insertAdjacentHTML('afterbegin', sectionHTML);
                console.log('Comprehensive analysis section created');
            }
        }
    }

    setupProgressBar() {
        this.progressBar = document.getElementById('progressBar');
        this.progressSection = document.getElementById('analysisProgress');
    }

    setupResultsDashboard() {
        this.resultsDashboard = document.getElementById('analysisResults');
        this.resultsGrid = document.getElementById('resultsGrid');
        this.resultsSummary = document.getElementById('resultsSummary');
    }

    bindEvents() {
        // Bind the start analysis button
        const startBtn = document.getElementById('startCompAnalysis');
        if (startBtn) {
            startBtn.addEventListener('click', () => this.startAnalysis());
        }

        // Bind download buttons
        const downloadJSON = document.getElementById('downloadJSON');
        const downloadCSV = document.getElementById('downloadCSV');
        const downloadHTML = document.getElementById('downloadHTML');

        if (downloadJSON) {
            downloadJSON.addEventListener('click', () => this.downloadResults('json'));
        }
        if (downloadCSV) {
            downloadCSV.addEventListener('click', () => this.downloadResults('csv'));
        }
        if (downloadHTML) {
            downloadHTML.addEventListener('click', () => this.downloadResults('html'));
        }
    }

    async startAnalysis() {
        if (this.isAnalyzing) return;

        this.isAnalyzing = true;
        console.log('Starting comprehensive analysis...');

        // Get form values
        const modelId = document.getElementById('compAnalysisModel')?.value || 'gpt-3.5-turbo';
        const batchSize = parseInt(document.getElementById('compBatchSize')?.value) || 3;
        const maxComponents = parseInt(document.getElementById('compMaxComponents')?.value) || 50;
        const customPrompt = document.getElementById('compCustomPrompt')?.value || '';

        // Update UI
        this.showProgress();
        this.updateProgress(0, 0, 'Initializing comprehensive analysis...');

        // Prepare request
        const requestData = {
            component_types: ['functions', 'dma_operations', 'user_copy_operations', 'ioctl_operations'],
            batch_size: batchSize,
            model_id: modelId,
            custom_prompt: customPrompt,
            max_components: maxComponents,
            confidence_threshold: 50
        };

        try {
            const response = await fetch('/api/analyze/comprehensive', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(requestData)
            });

            if (!response.ok) {
                throw new Error(`Analysis failed: ${response.status} ${response.statusText}`);
            }

            const data = await response.json();
            console.log('Analysis completed:', data);

            this.analysisData = data;
            this.updateProgress(data.total || 0, data.total || 0, 'Analysis completed successfully!');
            this.showResults(data);

        } catch (error) {
            console.error('Analysis failed:', error);
            this.updateProgress(0, 0, `Analysis failed: ${error.message}`);
            showNotification(`Analysis failed: ${error.message}`, 'error');
        } finally {
            this.isAnalyzing = false;
        }
    }

    showProgress() {
        if (this.progressSection) {
            this.progressSection.style.display = 'block';
        }
    }

    updateProgress(processed, total, message) {
        const progressBar = document.getElementById('progressBar');
        const progressStatus = document.getElementById('progressStatus');
        const processedCount = document.getElementById('processedCount');
        const totalCount = document.getElementById('totalCount');

        if (progressBar && total > 0) {
            const percentage = (processed / total) * 100;
            progressBar.style.width = `${percentage}%`;
        }

        if (progressStatus) {
            progressStatus.textContent = message;
        }

        if (processedCount) {
            processedCount.textContent = processed;
        }

        if (totalCount) {
            totalCount.textContent = total;
        }
    }

    showResults(data) {
        if (!this.resultsDashboard) return;

        // Show results section
        this.resultsDashboard.style.display = 'block';

        // Update summary
        this.updateResultsSummary(data);

        // Populate results grid
        this.populateResultsGrid(data.results || []);

        // Scroll to results
        this.resultsDashboard.scrollIntoView({ behavior: 'smooth' });

        showNotification('Analysis completed successfully! Download options are now available.', 'success');
    }

    updateResultsSummary(data) {
        if (!this.resultsSummary) return;

        const results = data.results || [];
        const total = results.length;
        const categories = {};
        
        // Count results by category
        results.forEach(result => {
            const type = result.type || 'unknown';
            categories[type] = (categories[type] || 0) + 1;
        });

        const summaryHTML = `
            <div class="summary-card">
                <div class="summary-icon">📊</div>
                <div class="summary-content">
                    <div class="summary-number">${total}</div>
                    <div class="summary-label">Total Results</div>
                </div>
            </div>
            
            <div class="summary-card">
                <div class="summary-icon">🔧</div>
                <div class="summary-content">
                    <div class="summary-number">${categories.functions || 0}</div>
                    <div class="summary-label">Functions</div>
                </div>
            </div>
            
            <div class="summary-card">
                <div class="summary-icon">🔄</div>
                <div class="summary-content">
                    <div class="summary-number">${categories.dma_operations || 0}</div>
                    <div class="summary-label">DMA Operations</div>
                </div>
            </div>
            
            <div class="summary-card">
                <div class="summary-icon">👤</div>
                <div class="summary-content">
                    <div class="summary-number">${categories.user_copy || 0}</div>
                    <div class="summary-label">User Copy</div>
                </div>
            </div>
            
            <div class="summary-card">
                <div class="summary-icon">⚙️</div>
                <div class="summary-content">
                    <div class="summary-number">${categories.ioctl || 0}</div>
                    <div class="summary-label">IOCTL</div>
                </div>
            </div>
        `;

        this.resultsSummary.innerHTML = summaryHTML;
    }

    populateResultsGrid(results) {
        if (!this.resultsGrid) return;

        if (results.length === 0) {
            this.resultsGrid.innerHTML = '<div class="empty-state"><p>No analysis results available.</p></div>';
            return;
        }

        const resultsHTML = results.map((result, index) => {
            const component = result.component || {};
            const analysis = result.result || {};
            const confidence = result.confidenceScores || {};

            return `
                <div class="result-card">
                    <div class="result-header">
                        <h4>${component.name || 'Unknown Component'}</h4>
                        <span class="result-type">${result.type || 'unknown'}</span>
                    </div>
                    
                    <div class="result-info">
                        <p><strong>File:</strong> ${component.filePath || 'Unknown'}</p>
                        ${component.lineNumber ? `<p><strong>Line:</strong> ${component.lineNumber}</p>` : ''}
                    </div>
                    
                    <div class="confidence-scores">
                        ${Object.entries(confidence).map(([key, value]) => `
                            <div class="confidence-item">
                                <span class="confidence-label">${key.replace(/_/g, ' ')}:</span>
                                <span class="confidence-value">${value}%</span>
                            </div>
                        `).join('')}
                    </div>
                    
                    <div class="result-analysis">
                        <p>${analysis.analysis || 'No analysis available'}</p>
                    </div>
                </div>
            `;
        }).join('');

        this.resultsGrid.innerHTML = resultsHTML;
    }

    downloadResults(format) {
        if (!this.analysisData) {
            showNotification('No analysis data available for download', 'warning');
            return;
        }

        switch (format) {
            case 'json':
                this.downloadJSON(this.analysisData);
                break;
            case 'csv':
                this.downloadCSV(this.analysisData);
                break;
            case 'html':
                this.downloadHTML(this.analysisData);
                break;
            default:
                showNotification('Invalid download format', 'error');
        }
    }

    downloadJSON(data) {
        const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `comprehensive_analysis_${new Date().toISOString().slice(0, 10)}.json`;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
        
        showNotification('JSON file downloaded successfully', 'success');
    }

    downloadCSV(data) {
        const results = data.results || [];
        
        if (results.length === 0) {
            showNotification('No results to export', 'warning');
            return;
        }

        const headers = ['Type', 'Component', 'File Path', 'Line Number', 'Analysis', 'Confidence Scores'];
        const rows = results.map(result => {
            const component = result.component || {};
            const analysis = result.result || {};
            const confidence = result.confidenceScores || {};
            
            return [
                result.type || '',
                component.name || '',
                component.filePath || '',
                component.lineNumber || '',
                (analysis.analysis || '').replace(/"/g, '""'),
                JSON.stringify(confidence)
            ];
        });

        const csvContent = [headers, ...rows]
            .map(row => row.map(cell => `"${cell}"`).join(','))
            .join('\n');

        const blob = new Blob([csvContent], { type: 'text/csv' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `comprehensive_analysis_${new Date().toISOString().slice(0, 10)}.csv`;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
        
        showNotification('CSV file downloaded successfully', 'success');
    }

    downloadHTML(data) {
        const results = data.results || [];
        
        const htmlContent = `
        <!DOCTYPE html>
        <html>
        <head>
            <title>Comprehensive Analysis Report</title>
            <style>
                body { font-family: Arial, sans-serif; margin: 20px; }
                .header { background: #f4f4f4; padding: 20px; border-radius: 8px; margin-bottom: 20px; }
                .result { border: 1px solid #ddd; padding: 15px; margin: 10px 0; border-radius: 8px; }
                .result-header { font-weight: bold; color: #333; margin-bottom: 10px; }
                .confidence { background: #f9f9f9; padding: 10px; margin: 10px 0; border-radius: 4px; }
                .analysis { margin-top: 10px; line-height: 1.6; }
            </style>
        </head>
        <body>
            <div class="header">
                <h1>🔍 Comprehensive Analysis Report</h1>
                <p>Generated on: ${new Date().toLocaleString()}</p>
                <p>Total Results: ${results.length}</p>
            </div>
            
            ${results.map((result, index) => {
                const component = result.component || {};
                const analysis = result.result || {};
                const confidence = result.confidenceScores || {};
                
                return `
                    <div class="result">
                        <div class="result-header">
                            ${component.name || 'Unknown Component'} (${result.type || 'unknown'})
                        </div>
                        <p><strong>File:</strong> ${component.filePath || 'Unknown'}</p>
                        ${component.lineNumber ? `<p><strong>Line:</strong> ${component.lineNumber}</p>` : ''}
                        
                        <div class="confidence">
                            <strong>Confidence Scores:</strong><br>
                            ${Object.entries(confidence).map(([key, value]) => 
                                `${key.replace(/_/g, ' ')}: ${value}%`
                            ).join('<br>')}
                        </div>
                        
                        <div class="analysis">
                            <strong>Analysis:</strong><br>
                            ${analysis.analysis || 'No analysis available'}
                        </div>
                    </div>
                `;
            }).join('')}
        </body>
        </html>
        `;

        const blob = new Blob([htmlContent], { type: 'text/html' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `comprehensive_analysis_report_${new Date().toISOString().slice(0, 10)}.html`;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
        
        showNotification('HTML report downloaded successfully', 'success');
    }
}

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    // Wait a bit for other scripts to load
    setTimeout(() => {
        window.comprehensiveAnalysis = new ComprehensiveAnalysis();
    }, 500);
});

// Also initialize when the LLM tab is clicked
document.addEventListener('click', function(e) {
    if (e.target && e.target.onclick && e.target.onclick.toString().includes("showTab('llmAnalysis'")) {
        setTimeout(() => {
            if (!window.comprehensiveAnalysis) {
                window.comprehensiveAnalysis = new ComprehensiveAnalysis();
            }
        }, 100);
    }
});
