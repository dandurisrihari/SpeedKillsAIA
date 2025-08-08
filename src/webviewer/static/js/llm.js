// LLM Analysis JavaScript Functions

// LLM state management
let llmAnalysisHistory = [];
let currentAnalysisData = {};

// Initialize LLM functionality
function initializeLLMTab() {
    checkLLMStatus();
    loadAnalysisHistory();
    setupLLMEventListeners();
}

// Check LLM availability
async function checkLLMStatus() {
    try {
        const response = await fetch('/api/llm/status');
        const data = await response.json();
        
        llmStatus = data;
        updateLLMStatusDisplay(data);
        
        if (data.available) {
            // Load models from the models endpoint
            loadLLMModels();
        }
    } catch (error) {
        console.error('Error checking LLM status:', error);
        updateLLMStatusDisplay({ available: false, error: 'Connection error' });
    }
}

// Load available LLM models
async function loadLLMModels() {
    try {
        const response = await fetch('/api/llm/models');
        const models = await response.json();
        
        if (Array.isArray(models) && models.length > 0) {
            populateModelSelect(models);
        } else {
            // Fallback to default models if API doesn't return models
            const defaultModels = [
                { id: 'gpt-3.5-turbo', name: 'GPT-3.5 Turbo', description: 'Fast & Cost-effective' },
                { id: 'gpt-4', name: 'GPT-4', description: 'Advanced Analysis' },
                { id: 'gpt-4-turbo-preview', name: 'GPT-4 Turbo', description: 'Latest & Most Capable' }
            ];
            populateModelSelect(defaultModels);
        }
    } catch (error) {
        console.error('Error loading LLM models:', error);
        // Fallback to default models
        const defaultModels = [
            { id: 'gpt-3.5-turbo', name: 'GPT-3.5 Turbo', description: 'Fast & Cost-effective' },
            { id: 'gpt-4', name: 'GPT-4', description: 'Advanced Analysis' },
            { id: 'gpt-4-turbo-preview', name: 'GPT-4 Turbo', description: 'Latest & Most Capable' }
        ];
        populateModelSelect(defaultModels);
    }
}

// Update LLM status display
function updateLLMStatusDisplay(status) {
    const statusElement = document.getElementById('llmStatus');
    const indicator = statusElement?.querySelector('.status-indicator');
    const text = statusElement?.querySelector('.status-text');
    
    if (!indicator || !text) return;
    
    if (status.available) {
        indicator.className = 'status-indicator available';
        text.textContent = 'LLM Analysis Available';
    } else {
        indicator.className = 'status-indicator';
        text.textContent = status.error || 'LLM Analysis Unavailable';
    }
}

// Populate model selection dropdown
function populateModelSelect(models) {
    const select = document.getElementById('modelSelect');
    if (!select) return;
    
    select.innerHTML = '';
    
    if (!models || !Array.isArray(models)) {
        console.warn('Invalid models data:', models);
        return;
    }
    
    models.forEach(model => {
        const option = document.createElement('option');
        option.value = model.id || '';
        
        // Handle both formats: simple object or complex object
        if (model.name && model.description) {
            option.textContent = `${model.name} - ${model.description}`;
        } else if (model.name) {
            option.textContent = model.name;
        } else {
            option.textContent = model.id || 'Unknown Model';
        }
        
        select.appendChild(option);
    });
    
    // Set default selection to first model
    if (models.length > 0) {
        select.value = models[0].id;
    }
}

// Analysis tab management
function showAnalysisTab(tabName) {
    // Hide all analysis contents
    const contents = document.querySelectorAll('.analysis-content');
    contents.forEach(content => content.classList.remove('active'));
    
    // Remove active class from all analysis tabs
    const tabs = document.querySelectorAll('.analysis-tab');
    tabs.forEach(tab => tab.classList.remove('active'));
    
    // Show selected analysis content
    const selectedContent = document.getElementById(tabName);
    if (selectedContent) {
        selectedContent.classList.add('active');
    }
    
    // Add active class to selected tab
    const selectedTab = document.querySelector(`[onclick="showAnalysisTab('${tabName}')"]`);
    if (selectedTab) {
        selectedTab.classList.add('active');
    }
}

// Function analysis
function loadSelectedFunction() {
    const select = document.getElementById('functionSelect');
    const codeTextarea = document.getElementById('functionCode');
    
    if (!select.value) {
        codeTextarea.value = '';
        return;
    }
    
    const [functionName, filePath, lineNumber] = select.value.split('|');
    
    // Show loading state
    codeTextarea.value = 'Loading function code...';
    
    const params = new URLSearchParams({
        name: functionName,
        file: filePath,
        line: parseInt(lineNumber)
    });
    
    fetch(`/api/function-code?${params}`)
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                codeTextarea.value = `Error: ${data.error}`;
            } else {
                codeTextarea.value = data.function_code || 'No source code available';
            }
        })
        .catch(error => {
            console.error('Error loading function code:', error);
            codeTextarea.value = 'Error loading source code';
        });
}

// Analyze function with LLM
async function analyzeFunctionWithLLM() {
    const functionSelect = document.getElementById('functionSelect');
    const codeTextarea = document.getElementById('functionCode');
    const customPrompt = document.getElementById('customPrompt');
    const modelSelect = document.getElementById('modelSelect');
    const button = document.getElementById('analyzeFunctionBtn');
    const resultDiv = document.getElementById('functionAnalysisResult');
    
    if (!functionSelect.value) {
        showNotification('Please select a function first', 'warning');
        return;
    }
    
    if (!codeTextarea.value || codeTextarea.value.includes('Error:') || codeTextarea.value.includes('Loading')) {
        showNotification('Please wait for function code to load', 'warning');
        return;
    }
    
    const [functionName, filePath] = functionSelect.value.split('|');
    
    // Show loading state
    setButtonLoading(button, true);
    hideResult(resultDiv);
    
    const requestData = {
        function_name: functionName,
        source_code: codeTextarea.value,
        file_path: filePath,
        custom_prompt: customPrompt.value,
        model_id: modelSelect.value
    };
    
    try {
        const response = await fetch('/api/llm/analyze/function', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        });
        
        const result = await response.json();
        
        if (result.status === 'success') {
            showAnalysisResult(resultDiv, result, 'Function Analysis');
            saveAnalysisToHistory('function', requestData, result);
            saveAnalysisToFile('function', requestData, result);
        } else {
            showErrorResult(resultDiv, result.error);
        }
    } catch (error) {
        console.error('Error analyzing function:', error);
        showErrorResult(resultDiv, 'Network error occurred');
    } finally {
        setButtonLoading(button, false);
    }
}

// DMA analysis
function loadSelectedDMA() {
    const select = document.getElementById('dmaSelect');
    const codeTextarea = document.getElementById('dmaCode');
    const callGraphTextarea = document.getElementById('callGraph');
    
    if (!select.value) {
        codeTextarea.value = '';
        callGraphTextarea.value = '';
        return;
    }
    
    // Get DMA data from the page data
    fetch('/api/data')
        .then(response => response.json())
        .then(data => {
            const dmaIndex = parseInt(select.value);
            const dmaOp = data.dma_operations[dmaIndex];
            
            if (dmaOp) {
                // Try to load associated function code
                if (dmaOp.caller_function && dmaOp.file_path) {
                    const params = new URLSearchParams({
                        name: dmaOp.caller_function,
                        file: dmaOp.file_path
                    });
                    
                    fetch(`/api/function-code?${params}`)
                        .then(response => response.json())
                        .then(funcData => {
                            codeTextarea.value = funcData.function_code || 'No function code available';
                        })
                        .catch(() => {
                            codeTextarea.value = 'Error loading function code';
                        });
                }
                
                // Show call graph if available (support both call_graph and stack_trace)
                if (Array.isArray(dmaOp.call_graph) && dmaOp.call_graph.length > 0) {
                    callGraphTextarea.value = dmaOp.call_graph.join('\n');
                } else if (Array.isArray(dmaOp.stack_trace) && dmaOp.stack_trace.length > 0) {
                    callGraphTextarea.value = dmaOp.stack_trace.join('\n');
                } else {
                    callGraphTextarea.value = 'No call graph available';
                }
            }
        })
        .catch(error => {
            console.error('Error loading DMA data:', error);
            codeTextarea.value = 'Error loading DMA data';
        });
}

// Analyze DMA with LLM
async function analyzeDMAWithLLM() {
    const dmaSelect = document.getElementById('dmaSelect');
    const codeTextarea = document.getElementById('dmaCode');
    const callGraphTextarea = document.getElementById('callGraph');
    const customPrompt = document.getElementById('dmaCustomPrompt');
    const modelSelect = document.getElementById('modelSelect');
    const button = document.getElementById('analyzeDMABtn');
    const resultDiv = document.getElementById('dmaAnalysisResult');
    
    if (!dmaSelect.value) {
        showNotification('Please select a DMA operation first', 'warning');
        return;
    }
    
    // Show loading state
    setButtonLoading(button, true);
    hideResult(resultDiv);
    
    try {
        // Get the DMA operation data
        const dataResponse = await fetch('/api/data');
        const data = await dataResponse.json();
        const dmaIndex = parseInt(dmaSelect.value);
        const dmaOperation = data.dma_operations[dmaIndex];
        
        const requestData = {
            dma_operation: dmaOperation,
            function_code: codeTextarea.value,
            call_graph: callGraphTextarea.value.split('\n').filter(line => line.trim()),
            custom_prompt: customPrompt.value,
            model_id: modelSelect.value
        };
        
        const response = await fetch('/api/llm/analyze/dma', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        });
        
        const result = await response.json();
        
        if (result.status === 'success') {
            showAnalysisResult(resultDiv, result, 'DMA Analysis');
            saveAnalysisToHistory('dma', requestData, result);
            saveAnalysisToFile('dma', requestData, result);
        } else {
            showErrorResult(resultDiv, result.error);
        }
    } catch (error) {
        console.error('Error analyzing DMA:', error);
        showErrorResult(resultDiv, 'Network error occurred');
    } finally {
        setButtonLoading(button, false);
    }
}

// Analyze logs with LLM
async function analyzeLogsWithLLM() {
    const analysisType = document.getElementById('analysisType');
    const customPrompt = document.getElementById('logCustomPrompt');
    const modelSelect = document.getElementById('modelSelect');
    const button = document.getElementById('analyzeLogsBtn');
    const resultDiv = document.getElementById('logAnalysisResult');
    
    // Show loading state
    setButtonLoading(button, true);
    hideResult(resultDiv);
    
    try {
        // Get all log data
        const dataResponse = await fetch('/api/data');
        const data = await dataResponse.json();
        
        // Combine different types of logs
        const logs = [
            ...(data.function_entries || []),
            ...(data.dma_operations || []),
            ...(data.user_copy_operations || []),
            ...(data.ioctl_operations || [])
        ];
        
        const requestData = {
            logs: logs,
            analysis_type: analysisType.value,
            custom_prompt: customPrompt.value,
            model_id: modelSelect.value
        };
        
        const response = await fetch('/api/llm/analyze/logs', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        });
        
        const result = await response.json();
        
        if (result.status === 'success') {
            showAnalysisResult(resultDiv, result, 'Log Analysis');
            saveAnalysisToHistory('logs', requestData, result);
            saveAnalysisToFile('logs', requestData, result);
        } else {
            showErrorResult(resultDiv, result.error);
        }
    } catch (error) {
        console.error('Error analyzing logs:', error);
        showErrorResult(resultDiv, 'Network error occurred');
    } finally {
        setButtonLoading(button, false);
    }
}

// Generate security report
async function generateSecurityReport() {
    const modelSelect = document.getElementById('modelSelect');
    const button = document.getElementById('securityReportBtn');
    const resultDiv = document.getElementById('securityReportResult');
    
    // Show loading state
    setButtonLoading(button, true);
    hideResult(resultDiv);
    
    try {
        const requestData = {
            model_id: modelSelect.value
        };
        
        const response = await fetch('/api/llm/security-report', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        });
        
        const result = await response.json();
        
        if (result.status === 'success') {
            showAnalysisResult(resultDiv, { analysis: result.report, model_used: result.model_used }, 'Security Report');
            saveAnalysisToHistory('security-report', requestData, result);
            saveAnalysisToFile('security-report', requestData, result);
        } else {
            showErrorResult(resultDiv, result.error);
        }
    } catch (error) {
        console.error('Error generating security report:', error);
        showErrorResult(resultDiv, 'Network error occurred');
    } finally {
        setButtonLoading(button, false);
    }
}

// UI helper functions
function setButtonLoading(button, loading) {
    if (loading) {
        button.classList.add('loading');
        button.disabled = true;
    } else {
        button.classList.remove('loading');
        button.disabled = false;
    }
}

function showAnalysisResult(container, result, title) {
    container.className = 'analysis-result show';
    container.innerHTML = `
        <div class="result-header">
            <div class="result-title">${title}</div>
            <div class="result-meta">
                <span>Model: ${result.model_used}</span>
                <span>Time: ${new Date().toLocaleString()}</span>
                ${result.custom_prompt ? `<span>Custom Prompt: Yes</span>` : ''}
            </div>
        </div>
        <div class="result-content">
            ${formatAnalysisContent(result.analysis)}
        </div>
    `;
}

function showErrorResult(container, error) {
    container.className = 'analysis-result show';
    container.innerHTML = `
        <div class="error-result">
            <h4>Analysis Error</h4>
            <p>${error}</p>
        </div>
    `;
}

function hideResult(container) {
    container.classList.remove('show');
}

function formatAnalysisContent(content) {
    // Convert markdown-like formatting to HTML
    return content
        .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
        .replace(/\*(.*?)\*/g, '<em>$1</em>')
        .replace(/`(.*?)`/g, '<code>$1</code>')
        .replace(/\n\n/g, '</p><p>')
        .replace(/\n/g, '<br>')
        .replace(/^/, '<p>')
        .replace(/$/, '</p>')
        .replace(/(<p><\/p>)/g, '');
}

// Data persistence functions
function saveAnalysisToHistory(type, request, result) {
    const historyItem = {
        id: Date.now(),
        type: type,
        timestamp: new Date().toISOString(),
        request: request,
        result: result
    };
    
    llmAnalysisHistory.unshift(historyItem);
    
    // Keep only the last 50 items
    if (llmAnalysisHistory.length > 50) {
        llmAnalysisHistory = llmAnalysisHistory.slice(0, 50);
    }
    
    // Save to localStorage
    try {
        localStorage.setItem('llmAnalysisHistory', JSON.stringify(llmAnalysisHistory));
    } catch (error) {
        console.error('Error saving analysis history:', error);
    }
}

function saveAnalysisToFile(type, request, result) {
    const filename = `llm_analysis_${type}_${new Date().toISOString().replace(/[:.]/g, '-')}.json`;
    const data = {
        type: type,
        timestamp: new Date().toISOString(),
        request: request,
        result: result,
        metadata: {
            user_agent: navigator.userAgent,
            url: window.location.href
        }
    };
    
    // Send to server for file storage
    fetch('/api/llm/save-analysis', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ filename, data })
    })
    .then(response => response.json())
    .then(result => {
        if (result.success) {
            showDataStorageIndicator(`Analysis saved: ${filename}`, 'success');
        } else {
            showDataStorageIndicator('Failed to save analysis', 'error');
        }
    })
    .catch(error => {
        console.error('Error saving analysis to file:', error);
        showDataStorageIndicator('Error saving analysis', 'error');
    });
}

function loadAnalysisHistory() {
    try {
        const stored = localStorage.getItem('llmAnalysisHistory');
        if (stored) {
            llmAnalysisHistory = JSON.parse(stored);
        }
    } catch (error) {
        console.error('Error loading analysis history:', error);
        llmAnalysisHistory = [];
    }
}

function setupLLMEventListeners() {
    // Model selection change
    const modelSelect = document.getElementById('modelSelect');
    if (modelSelect) {
        modelSelect.addEventListener('change', function() {
            showDataStorageIndicator(`Model changed to: ${this.options[this.selectedIndex].text}`, 'success');
        });
    }
    
    // Auto-save prompts
    const prompts = ['customPrompt', 'dmaCustomPrompt', 'logCustomPrompt'];
    prompts.forEach(id => {
        const element = document.getElementById(id);
        if (element) {
            element.addEventListener('input', function() {
                localStorage.setItem(`${id}_draft`, this.value);
            });
            
            // Load saved draft
            const draft = localStorage.getItem(`${id}_draft`);
            if (draft) {
                element.value = draft;
            }
        }
    });
}

// Export analysis history
function exportAnalysisHistory() {
    const data = {
        export_date: new Date().toISOString(),
        history: llmAnalysisHistory
    };
    
    const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `llm_analysis_history_${new Date().toISOString().split('T')[0]}.json`;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
    
    showNotification('Analysis history exported', 'success');
}
