/**
 * Tool Calling UI Management
 * Enhanced version with context length management and user confirmation
 */

class ToolCallingUI {
    constructor() {
        this.history = [];
        this.config = {
            model: 'gpt-4',
            max_tokens: 8192,
            api_key: '',
            enable_confirmation: true
        };
        this.confirmationModal = null;
        this.pendingConfirmation = null;
        
        this.init();
    }

    init() {
        // Initialize UI when document is ready
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', () => this.setupUI());
        } else {
            this.setupUI();
        }
    }

    setupUI() {
        this.loadConfiguration();
        this.setupEventListeners();
        this.loadHistory();
        this.updateHistoryStats();
    }

    setupEventListeners() {
        // Configuration controls
        document.getElementById('tool-model-select')?.addEventListener('change', (e) => {
            this.config.model = e.target.value;
            this.saveConfiguration();
        });

        document.getElementById('tool-max-tokens')?.addEventListener('change', (e) => {
            this.config.max_tokens = parseInt(e.target.value);
            this.saveConfiguration();
        });

        document.getElementById('tool-api-key')?.addEventListener('change', (e) => {
            this.config.api_key = e.target.value;
            this.saveConfiguration();
        });

        document.getElementById('tool-enable-confirmation')?.addEventListener('change', (e) => {
            this.config.enable_confirmation = e.target.checked;
            this.saveConfiguration();
        });

        // Test button
        document.getElementById('test-tool-btn')?.addEventListener('click', () => {
            this.testToolCalling();
        });

        // History controls
        document.getElementById('refresh-history-btn')?.addEventListener('click', () => {
            this.loadHistory();
        });

        document.getElementById('clear-history-btn')?.addEventListener('click', () => {
            this.clearHistory();
        });
    }

    loadConfiguration() {
        fetch('/api/tool-calling/config')
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    this.config = { ...this.config, ...data.config };
                    this.updateConfigUI();
                }
            })
            .catch(error => console.error('Error loading config:', error));
    }

    saveConfiguration() {
        fetch('/api/tool-calling/config', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(this.config)
        })
        .then(response => response.json())
        .then(data => {
            if (!data.success) {
                console.error('Error saving config:', data.error);
            }
        })
        .catch(error => console.error('Error saving config:', error));
    }

    updateConfigUI() {
        const modelSelect = document.getElementById('tool-model-select');
        const maxTokensInput = document.getElementById('tool-max-tokens');
        const apiKeyInput = document.getElementById('tool-api-key');
        const confirmationCheckbox = document.getElementById('tool-enable-confirmation');

        if (modelSelect) modelSelect.value = this.config.model;
        if (maxTokensInput) maxTokensInput.value = this.config.max_tokens;
        if (apiKeyInput) apiKeyInput.value = this.config.api_key;
        if (confirmationCheckbox) confirmationCheckbox.checked = this.config.enable_confirmation;
    }

    testToolCalling() {
        const testCode = document.getElementById('tool-test-code').value.trim();
        if (!testCode) {
            alert('Please enter some test code to analyze');
            return;
        }

        const testBtn = document.getElementById('test-tool-btn');
        testBtn.disabled = true;
        testBtn.textContent = 'Testing...';

        fetch('/api/tool-calling/test', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                code: testCode,
                config: this.config
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Tool calling test completed successfully!');
                this.loadHistory(); // Refresh history
            } else {
                alert('Tool calling test failed: ' + data.error);
            }
        })
        .catch(error => {
            console.error('Test error:', error);
            alert('Tool calling test failed: ' + error.message);
        })
        .finally(() => {
            testBtn.disabled = false;
            testBtn.textContent = 'Test Tool Calling';
        });
    }

    loadHistory() {
        fetch('/api/tool-calling/history')
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    this.history = data.history;
                    this.renderHistory();
                    this.updateHistoryStats();
                }
            })
            .catch(error => console.error('Error loading history:', error));
    }

    clearHistory() {
        if (confirm('Are you sure you want to clear all tool calling history?')) {
            fetch('/api/tool-calling/history', { method: 'DELETE' })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        this.history = [];
                        this.renderHistory();
                        this.updateHistoryStats();
                    }
                })
                .catch(error => console.error('Error clearing history:', error));
        }
    }

    updateHistoryStats() {
        const total = this.history.length;
        const successful = this.history.filter(h => h.status === 'success').length;
        const failed = this.history.filter(h => h.status === 'error').length;
        const totalTokens = this.history.reduce((sum, h) => sum + (h.token_count || 0), 0);

        document.getElementById('stat-total-requests').textContent = total;
        document.getElementById('stat-successful-requests').textContent = successful;
        document.getElementById('stat-failed-requests').textContent = failed;
        document.getElementById('stat-total-tokens').textContent = totalTokens.toLocaleString();
    }

    renderHistory() {
        const historyList = document.getElementById('history-list');
        if (!historyList) return;

        if (this.history.length === 0) {
            historyList.innerHTML = '<div class="no-history">No tool calling history yet</div>';
            return;
        }

        historyList.innerHTML = this.history.map(item => this.renderHistoryItem(item)).join('');
    }

    renderHistoryItem(item) {
        const timestamp = new Date(item.timestamp).toLocaleString();
        const statusClass = item.status === 'success' ? 'status-success' : 'status-error';
        
        return `
            <div class="history-item">
                <div class="request-header">
                    <div class="request-info">
                        Tool Calling Request
                        <span class="status-badge ${statusClass}">${item.status}</span>
                        ${item.token_count ? `<span class="token-count">${item.token_count} tokens</span>` : ''}
                    </div>
                    <div class="request-timestamp">${timestamp}</div>
                </div>
                
                ${item.size_warning ? `<div class="size-warning">${item.size_warning}</div>` : ''}
                ${item.truncated ? `<div class="truncated-indicator">Content was truncated due to size limits</div>` : ''}
                
                <div class="request-details">
                    <div class="request-section">
                        <h5>Request Code</h5>
                        <div class="request-code">${this.escapeHtml(item.request_code || 'No code provided')}</div>
                    </div>
                    <div class="request-section">
                        <h5>Response</h5>
                        <div class="response-code">${this.escapeHtml(item.response || 'No response')}</div>
                    </div>
                </div>
                
                ${item.error ? `<div class="error-details">Error: ${this.escapeHtml(item.error)}</div>` : ''}
            </div>
        `;
    }

    showConfirmationModal(requestData) {
        return new Promise((resolve) => {
            const modal = document.createElement('div');
            modal.className = 'confirmation-modal';
            
            modal.innerHTML = `
                <div class="confirmation-content">
                    <h4>⚠️ Large Tool Calling Request</h4>
                    <div class="confirmation-details">
                        <p>This tool calling request is quite large and may take some time to process:</p>
                        <ul>
                            <li>Estimated tokens: <strong>${requestData.estimated_tokens}</strong></li>
                            <li>Code length: <strong>${requestData.code_length} characters</strong></li>
                            <li>Model: <strong>${requestData.model}</strong></li>
                        </ul>
                        <p>Do you want to proceed with this request?</p>
                    </div>
                    <div class="confirmation-actions">
                        <button class="confirm-btn approve">Yes, Continue</button>
                        <button class="confirm-btn cancel">Cancel</button>
                    </div>
                </div>
            `;

            // Event listeners
            modal.querySelector('.approve').addEventListener('click', () => {
                document.body.removeChild(modal);
                resolve(true);
            });

            modal.querySelector('.cancel').addEventListener('click', () => {
                document.body.removeChild(modal);
                resolve(false);
            });

            // Close on background click
            modal.addEventListener('click', (e) => {
                if (e.target === modal) {
                    document.body.removeChild(modal);
                    resolve(false);
                }
            });

            document.body.appendChild(modal);
        });
    }

    // Handle confirmation requests from the backend
    handleConfirmationRequest(data) {
        return this.showConfirmationModal(data);
    }

    escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }

    // API for external use
    makeToolCallingRequest(code, options = {}) {
        return fetch('/api/tool-calling/request', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                code: code,
                config: { ...this.config, ...options }
            })
        })
        .then(response => response.json())
        .then(data => {
            // Handle confirmation if needed
            if (data.requires_confirmation) {
                return this.handleConfirmationRequest(data).then(confirmed => {
                    if (confirmed) {
                        return fetch('/api/tool-calling/confirm', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({ request_id: data.request_id })
                        }).then(response => response.json());
                    } else {
                        return { success: false, error: 'Request cancelled by user' };
                    }
                });
            }
            return data;
        })
        .then(result => {
            this.loadHistory(); // Refresh history after any request
            return result;
        });
    }
}

// Legacy compatibility for existing tool calling functionality
window.toolCallingState = {
    enabled: false,
    maxDepth: 3,
    usePreprocessed: true,
    currentRequest: null,
    history: []
};

// Legacy functions for backward compatibility
function enableToolCalling() {
    window.toolCallingState.enabled = true;
    console.log('Tool calling enabled');
}

function disableToolCalling() {
    window.toolCallingState.enabled = false;
    console.log('Tool calling disabled');
}

function setToolCallingDepth(depth) {
    window.toolCallingState.maxDepth = depth;
    console.log('Tool calling depth set to:', depth);
}

// Initialize the enhanced tool calling UI
window.toolCallingUI = new ToolCallingUI();

// Export for external use
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { ToolCallingUI, toolCallingState };
}

/**
 * Initialize tool calling functionality
 */
function initializeToolCalling() {
    console.log('🔧 Initializing tool calling functionality...');
    
    // Load configuration
    loadToolCallingConfig();
    
    // Create tool calling UI elements
    const uiCreated = createToolCallingUI();
    if (uiCreated !== false) {
        console.log('✅ Tool calling UI created successfully');
        
        // Bind event handlers
        bindToolCallingEvents();
        console.log('✅ Tool calling events bound');
    } else {
        console.error('❌ Failed to create tool calling UI');
    }
}

/**
 * Load tool calling configuration from server
 */
async function loadToolCallingConfig() {
    try {
        const response = await fetch('/api/llm/tool-calling/config');
        if (response.ok) {
            const config = await response.json();
            window.toolCallingState.maxDepth = config.max_depth;
            window.toolCallingState.usePreprocessed = config.use_preprocessed;
            window.toolCallingState.sourceRoot = config.source_root;
        }
    } catch (error) {
        console.error('Failed to load tool calling config:', error);
    }
}

/**
 * Create tool calling UI elements
 */
function createToolCallingUI() {
    console.log('🎨 Creating tool calling UI...');
    
    // Add tool calling controls to LLM analysis tab
    const llmTab = document.querySelector('#functionAnalysis');
    if (!llmTab) {
        console.warn('❌ LLM analysis tab (#functionAnalysis) not found');
        // Try alternative selectors
        const altTab = document.querySelector('#llm-analysis-content');
        if (altTab) {
            console.log('✅ Found alternative LLM tab');
        } else {
            console.error('❌ No LLM analysis tab found at all');
            return false;
        }
    } else {
        console.log('✅ Found LLM analysis tab (#functionAnalysis)');
    }
    
    // Find function analysis form
    const functionForm = llmTab.querySelector('.analysis-form');
    if (!functionForm) {
        console.warn('❌ Analysis form not found in LLM tab');
        console.log('Available elements in tab:', llmTab.innerHTML.substring(0, 200) + '...');
        return false;
    } else {
        console.log('✅ Found analysis form');
    }
    
    // Create tool calling section
    const toolCallingSection = document.createElement('div');
    toolCallingSection.className = 'tool-calling-section';
    toolCallingSection.innerHTML = `
        <h4>🔧 Enhanced Analysis with Tool Calling</h4>
        <div class="tool-calling-controls">
            <div class="control-row">
                <label>
                    <input type="checkbox" id="enableToolCalling" ${window.toolCallingState.enabled ? 'checked' : ''}>
                    Enable automatic code context retrieval
                </label>
            </div>
            <div class="control-row">
                <label for="maxDepth">Maximum context depth:</label>
                <input type="number" id="maxDepth" value="${window.toolCallingState.maxDepth}" min="1" max="10" style="width: 60px;">
            </div>
            <div class="control-row">
                <label for="sourceRoot">Source root directory:</label>
                <input type="text" id="sourceRoot" value="${window.toolCallingState.sourceRoot || ''}" placeholder="/path/to/kernel/sources">
            </div>
            <div class="control-row">
                <label>
                    <input type="checkbox" id="usePreprocessed" ${window.toolCallingState.usePreprocessed ? 'checked' : ''}>
                    Prefer preprocessed (.i) files for struct definitions
                </label>
            </div>
        </div>
        
        <div class="tool-calling-status" id="toolCallingStatus" style="display: none;">
            <div class="status-indicator">
                <span class="status-dot"></span>
                <span class="status-text">Ready for enhanced analysis</span>
            </div>
        </div>
        
        <div class="tool-calling-history" id="toolCallingHistory" style="display: none;">
            <h5>🔍 Context Requests & Responses</h5>
            <div class="history-container" id="historyContainer">
                <!-- Tool calling history will be populated here -->
            </div>
        </div>
    `;
    
    // Find the analyze button and its parent form-group
    const analyzeButton = functionForm.querySelector('.analyze-btn');
    let insertionPoint = null;
    
    if (analyzeButton) {
        // Walk up the DOM to find the form-group that contains the analyze button
        let parent = analyzeButton.parentNode;
        while (parent && parent !== functionForm) {
            if (parent.classList && parent.classList.contains('form-group')) {
                insertionPoint = parent;
                break;
            }
            parent = parent.parentNode;
        }
    }
    
    if (insertionPoint) {
        functionForm.insertBefore(toolCallingSection, insertionPoint);
        console.log('✅ Tool calling section inserted before analyze button form-group');
    } else {
        functionForm.appendChild(toolCallingSection);
        console.log('✅ Tool calling section appended to form');
    }
    
    return true;
}

/**
 * Bind tool calling event handlers
 */
function bindToolCallingEvents() {
    // Enable/disable tool calling
    const enableCheckbox = document.getElementById('enableToolCalling');
    if (enableCheckbox) {
        enableCheckbox.addEventListener('change', function() {
            window.toolCallingState.enabled = this.checked;
            updateToolCallingStatus();
        });
    }
    
    // Max depth change
    const maxDepthInput = document.getElementById('maxDepth');
    if (maxDepthInput) {
        maxDepthInput.addEventListener('change', function() {
            window.toolCallingState.maxDepth = parseInt(this.value);
        });
    }
    
    // Source root change
    const sourceRootInput = document.getElementById('sourceRoot');
    if (sourceRootInput) {
        sourceRootInput.addEventListener('change', function() {
            window.toolCallingState.sourceRoot = this.value;
        });
    }
    
    // Use preprocessed change
    const usePreprocessedCheckbox = document.getElementById('usePreprocessed');
    if (usePreprocessedCheckbox) {
        usePreprocessedCheckbox.addEventListener('change', function() {
            window.toolCallingState.usePreprocessed = this.checked;
        });
    }
    
    // Replace the original analyze function with enhanced version
    replaceAnalyzeFunctionHandler();
}

/**
 * Update tool calling status display
 */
function updateToolCallingStatus() {
    const statusDiv = document.getElementById('toolCallingStatus');
    if (!statusDiv) return;
    
    const statusDot = statusDiv.querySelector('.status-dot');
    const statusText = statusDiv.querySelector('.status-text');
    
    if (window.toolCallingState.enabled) {
        statusDiv.style.display = 'block';
        statusDot.className = 'status-dot active';
        statusText.textContent = 'Enhanced analysis enabled';
    } else {
        statusDiv.style.display = 'none';
    }
}

/**
 * Replace the original analyze function handler with enhanced version
 */
function replaceAnalyzeFunctionHandler() {
    const analyzeButton = document.querySelector('#functionAnalysis .analyze-btn');
    if (!analyzeButton) {
        console.warn('Analyze button not found in function analysis tab');
        return;
    }
    
    // Remove existing event listeners and add new one
    const newButton = analyzeButton.cloneNode(true);
    analyzeButton.parentNode.replaceChild(newButton, analyzeButton);
    
    newButton.addEventListener('click', analyzeFunctionWithToolCalling);
}

/**
 * Enhanced function analysis with tool calling
 */
async function analyzeFunctionWithToolCalling() {
    const functionSelect = document.getElementById('functionSelect');
    const customPrompt = document.getElementById('customPrompt');
    const modelSelect = document.getElementById('modelSelect');
    const resultDiv = document.getElementById('functionAnalysisResult');
    const button = document.querySelector('#functionAnalysis .analyze-btn');
    
    if (!functionSelect.value) {
        showNotification('Please select a function to analyze', 'warning');
        return;
    }
    
    const functionName = functionSelect.value;
    const codeTextarea = document.getElementById('functionCode');
    
    if (!codeTextarea || !codeTextarea.value.trim()) {
        showNotification('Function code not loaded', 'warning');
        return;
    }
    
    // Clear previous history
    clearToolCallingHistory();
    
    setButtonLoading(button, true);
    hideResult(resultDiv);
    
    try {
        const requestData = {
            function_name: functionName,
            source_code: codeTextarea.value,
            file_path: '',
            custom_prompt: customPrompt.value,
            model_id: modelSelect.value,
            enable_tool_calling: window.toolCallingState.enabled,
            max_depth: window.toolCallingState.maxDepth,
            source_root: window.toolCallingState.sourceRoot
        };
        
        // Use enhanced endpoint if tool calling is enabled
        const endpoint = window.toolCallingState.enabled ? 
            '/api/llm/analyze/function-enhanced' : 
            '/api/llm/analyze/function';
        
        const response = await fetch(endpoint, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(requestData)
        });
        
        const result = await response.json();
        
        if (result.status === 'success') {
            showAnalysisResult(resultDiv, result, `Analysis of ${functionName}`);
            
            // Display tool calling history if available
            if (result.tool_history && result.tool_history.length > 0) {
                displayToolCallingHistory(result.tool_history);
            }
            
            // Save analysis to history
            saveAnalysisToHistory('function', requestData, result);
        } else {
            showErrorResult(resultDiv, result.error || 'Analysis failed');
        }
        
    } catch (error) {
        console.error('Analysis error:', error);
        showErrorResult(resultDiv, 'Network error occurred');
    } finally {
        setButtonLoading(button, false);
    }
}

/**
 * Display tool calling history in the UI
 */
function displayToolCallingHistory(history) {
    const historyDiv = document.getElementById('toolCallingHistory');
    const historyContainer = document.getElementById('historyContainer');
    
    if (!historyDiv || !historyContainer) return;
    
    historyDiv.style.display = 'block';
    historyContainer.innerHTML = '';
    
    history.forEach((entry, index) => {
        const requestCard = createToolCallingCard(entry, index);
        historyContainer.appendChild(requestCard);
    });
}

/**
 * Create a card for displaying tool calling request/response
 */
function createToolCallingCard(entry, index) {
    const card = document.createElement('div');
    card.className = 'tool-call-card';
    
    const request = entry.request;
    const response = entry.response;
    
    const statusClass = response.status === 'success' ? 'success' : 
                       response.status === 'not_found' ? 'warning' : 'error';
    
    card.innerHTML = `
        <div class="tool-call-header">
            <span class="tool-call-number">#${index + 1}</span>
            <span class="tool-call-type">${request.type}</span>
            <span class="tool-call-name">${request.name}</span>
            <span class="tool-call-status ${statusClass}">${response.status}</span>
        </div>
        
        <div class="tool-call-details">
            <div class="request-details">
                <strong>Request:</strong>
                <div class="request-info">
                    <div>Type: ${request.type}</div>
                    <div>Name: ${request.name}</div>
                    ${request.file_path ? `<div>File: ${request.file_path}</div>` : ''}
                    ${request.line_number ? `<div>Line: ${request.line_number}</div>` : ''}
                    <div>Depth: ${request.depth || 0}</div>
                </div>
            </div>
            
            <div class="response-details">
                <strong>Response:</strong>
                <div class="response-info">
                    <div class="status ${statusClass}">Status: ${response.status}</div>
                    ${response.location ? `
                        <div>Location: ${response.location.file}:${response.location.start_line}-${response.location.end_line}</div>
                    ` : ''}
                    ${response.error ? `<div class="error">Error: ${response.error}</div>` : ''}
                </div>
            </div>
        </div>
        
        ${response.content ? `
            <div class="tool-call-content">
                <details>
                    <summary><strong>Retrieved Code</strong> (${response.content.split('\\n').length} lines)</summary>
                    <pre><code>${escapeHtml(response.content)}</code></pre>
                </details>
            </div>
        ` : ''}
    `;
    
    return card;
}

/**
 * Clear tool calling history display
 */
function clearToolCallingHistory() {
    const historyDiv = document.getElementById('toolCallingHistory');
    const historyContainer = document.getElementById('historyContainer');
    
    if (historyDiv) historyDiv.style.display = 'none';
    if (historyContainer) historyContainer.innerHTML = '';
}

/**
 * Make a direct tool calling request (for testing/debugging)
 */
async function makeToolCallingRequest(type, name, filePath = null, lineNumber = null) {
    try {
        const requestData = {
            type: type,
            name: name,
            file_path: filePath,
            line_number: lineNumber,
            source_root: window.toolCallingState.sourceRoot,
            max_depth: window.toolCallingState.maxDepth,
            use_preprocessed: window.toolCallingState.usePreprocessed
        };
        
        const response = await fetch('/api/llm/tool-calling/request', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(requestData)
        });
        
        const result = await response.json();
        console.log('Tool calling result:', result);
        return result;
        
    } catch (error) {
        console.error('Tool calling request failed:', error);
        return { status: 'error', error: error.message };
    }
}

/**
 * Escape HTML for safe display
 */
function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

/**
 * Save tool calling configuration
 */
async function saveToolCallingConfig() {
    try {
        const config = {
            max_depth: window.toolCallingState.maxDepth,
            use_preprocessed: window.toolCallingState.usePreprocessed,
            source_root: window.toolCallingState.sourceRoot
        };
        
        const response = await fetch('/api/llm/tool-calling/config', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(config)
        });
        
        if (response.ok) {
            console.log('Tool calling configuration saved');
        }
    } catch (error) {
        console.error('Failed to save tool calling config:', error);
    }
}

// Auto-initialize when DOM is ready
document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM loaded, initializing tool calling...');
    
    // Wait a bit for other components to initialize
    setTimeout(() => {
        console.log('Attempting to initialize tool calling...');
        initializeToolCalling();
        
        // Add debugging info
        console.log('LLM tab found:', !!document.querySelector('#functionAnalysis'));
        console.log('Analysis form found:', !!document.querySelector('#functionAnalysis .analysis-form'));
        console.log('Analyze button found:', !!document.querySelector('#functionAnalysis .analyze-btn'));
    }, 1000);
    
    // Also try on window load as backup
    window.addEventListener('load', function() {
        if (!document.querySelector('.tool-calling-section')) {
            console.log('Tool calling section not found, retrying initialization...');
            setTimeout(initializeToolCalling, 500);
        }
    });
});

// Expose functions for debugging
window.toolCalling = {
    makeRequest: makeToolCallingRequest,
    displayHistory: displayToolCallingHistory,
    clearHistory: clearToolCallingHistory,
    saveConfig: saveToolCallingConfig,
    initialize: initializeToolCalling,
    createUI: createToolCallingUI,
    state: window.toolCallingState
};