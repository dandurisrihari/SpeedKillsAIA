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
    
    // Get preprocessed code from global data if available
    let preprocessedCode = '';
    if (window.globalData && window.globalData.function_entries) {
        const functionEntry = window.globalData.function_entries.find(entry => 
            entry.function_name === functionName && entry.file_path === filePath
        );
        if (functionEntry && functionEntry.preprocessed_code) {
            preprocessedCode = functionEntry.preprocessed_code;
        }
    }
    
    // Include extra context from struct/function requests
    let additionalContext = '';
    if (window.__extraLLMContext) {
        additionalContext = window.__extraLLMContext;
    }
    
    const requestData = {
        function_name: functionName,
        source_code: codeTextarea.value,
        preprocessed_code: preprocessedCode,
        file_path: filePath,
        custom_prompt: customPrompt.value,
        model_id: modelSelect.value,
        additional_context: additionalContext
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

// Context request panel for augmenting LLM with more source
function buildContextRequestUI() {
    if (document.getElementById('contextRequestPanel')) return;
    const container = document.createElement('div');
    container.id = 'contextRequestPanel';
    container.className = 'analysis-form';
    container.innerHTML = `
        <h3>Augment LLM Context</h3>
        <div class="form-group">
            <label>Max requests:</label>
            <input id="ctxMaxRequests" type="number" min="1" max="10" value="3" />
        </div>
        <div id="ctxRequests">
            <div class="form-group">
                <select class="ctxType">
                    <option value="function">Function</option>
                    <option value="struct">Struct</option>
                </select>
                <input class="ctxName" type="text" placeholder="name (function or struct)"/>
                <input class="ctxFile" type="text" placeholder="file path (optional)"/>
                <input class="ctxLine" type="number" placeholder="line (optional for functions)"/>
            </div>
        </div>
        <div class="form-group">
            <button id="addCtxRow" class="analyze-btn">+ Add Request</button>
            <button id="runCtxFetch" class="analyze-btn">Fetch Context</button>
        </div>
        <div id="ctxLog" style="white-space:pre; background:#f8fafc; border:1px solid #e2e8f0; border-radius:8px; padding:12px;"></div>
    `;

    const dmaTab = document.getElementById('dmaAnalysis');
    if (dmaTab) dmaTab.appendChild(container);

    document.getElementById('addCtxRow').onclick = (e) => {
        e.preventDefault();
        const row = document.createElement('div');
        row.className = 'form-group';
        row.innerHTML = `
            <select class="ctxType">
                <option value="function">Function</option>
                <option value="struct">Struct</option>
            </select>
            <input class="ctxName" type="text" placeholder="name"/>
            <input class="ctxFile" type="text" placeholder="file path (optional)"/>
            <input class="ctxLine" type="number" placeholder="line (optional)"/>
        `;
        document.getElementById('ctxRequests').appendChild(row);
    };

    document.getElementById('runCtxFetch').onclick = async (e) => {
        e.preventDefault();
        const maxReq = parseInt(document.getElementById('ctxMaxRequests').value) || 3;
        const rows = [...document.querySelectorAll('#ctxRequests .form-group')];
        const requests = rows.map(r => ({
            type: r.querySelector('.ctxType').value,
            name: r.querySelector('.ctxName').value.trim(),
            file_path: r.querySelector('.ctxFile').value.trim(),
            line_number: parseInt(r.querySelector('.ctxLine').value) || undefined
        })).filter(x => x.name);

        const log = document.getElementById('ctxLog');
        log.textContent = 'Requesting context...\n' + JSON.stringify({requests, max_items: maxReq}, null, 2);

        try {
            // Handle struct requests with new endpoint
            const responses = [];
            for (const request of requests.slice(0, maxReq)) {
                let response;
                if (request.type === 'struct') {
                    // Use dedicated struct definition endpoint
                    const structRes = await fetch('/api/struct-definition', {
                        method: 'POST',
                        headers: {'Content-Type': 'application/json'},
                        body: JSON.stringify({
                            struct_name: request.name,
                            file_hint: request.file_path,
                            prefer_preprocessed: true
                        })
                    });
                    response = await structRes.json();
                    responses.push({
                        request: request,
                        status: response.status === 'success' ? 'ok' : response.status,
                        content: response.content,
                        location: response.location,
                        error: response.error
                    });
                } else {
                    // Use existing function code endpoint
                    const params = new URLSearchParams({
                        name: request.name,
                        file: request.file_path || '',
                        line: request.line_number || ''
                    });
                    const funcRes = await fetch(`/api/function-code?${params}`);
                    const funcData = await funcRes.json();
                    responses.push({
                        request: request,
                        status: funcData.error ? 'error' : 'ok',
                        content: funcData.function_code,
                        location: { file_path: request.file_path },
                        error: funcData.error
                    });
                }
            }
            
            const data = { responses };
            log.textContent += '\n\nResponse:\n' + JSON.stringify(data, null, 2);

            // If on function analysis tab, append returned content into the textarea as additional context
            const fnCode = document.getElementById('functionCode');
            if (fnCode && data.responses) {
                const bundle = data.responses.filter(r => r.status === 'ok').map(r => `/*\nContext for ${r.request.type} ${r.request.name} (${(r.location && r.location.file_path) || ''})\n*/\n${r.content}\n`).join('\n');
                if (bundle) {
                    // Send as part of additional_context in analyzeFunctionWithLLM later
                    window.__extraLLMContext = bundle;
                }
            }
        } catch (err) {
            log.textContent += `\n\nError: ${err}`;
        }
    };
}

// Hook to build context UI when LLM tab is shown
document.addEventListener('DOMContentLoaded', () => {
    // Slight delay to ensure DOM is ready
    setTimeout(buildContextRequestUI, 500);
});

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
        
        // Get preprocessed code if available
        let preprocessedCode = '';
        if (dmaOperation && dmaOperation.preprocessed_code) {
            preprocessedCode = dmaOperation.preprocessed_code;
        }
        
        // Include extra context from struct/function requests
        let additionalContext = '';
        if (window.__extraLLMContext) {
            additionalContext = window.__extraLLMContext;
        }
        
        const requestData = {
            dma_operation: dmaOperation,
            function_code: codeTextarea.value,
            preprocessed_code: preprocessedCode,
            call_graph: callGraphTextarea.value.split('\n').filter(line => line.trim()),
            custom_prompt: customPrompt.value,
            model_id: modelSelect.value,
            additional_context: additionalContext
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
    
    // Build the HTML content
    let html = `
        <div class="result-header">
            <div class="result-title">${title}</div>
            <div class="result-meta">
                <span>Model: ${result.model_used}</span>
                <span>Time: ${new Date().toLocaleString()}</span>
                ${result.custom_prompt ? `<span>Custom Prompt: Yes</span>` : ''}
            </div>
        </div>
    `;
    
    // Add tool calling history if available
    if (result.tool_history && result.tool_history.length > 0) {
        html += `
            <div class="tool-calling-section" style="margin: 20px 0; padding: 15px; background: #f8fafc; border-radius: 8px; border: 1px solid #e2e8f0;">
                <h4 style="margin: 0 0 10px 0; color: #374151;">🔧 LLM Tool Calling History</h4>
                <p style="margin: 0 0 15px 0; color: #6b7280; font-size: 0.9em;">The LLM requested additional context during analysis:</p>
                <div class="tool-calling-history">
        `;
        
        result.tool_history.forEach((entry, index) => {
            const statusClass = entry.response.status === 'success' ? 'success' : 
                               entry.response.status === 'not_found' ? 'warning' : 'error';
            const statusIcon = entry.response.status === 'success' ? '✅' : 
                              entry.response.status === 'not_found' ? '⚠️' : '❌';
            
            html += `
                <div class="tool-call-card" style="margin-bottom: 10px; padding: 12px; background: white; border-radius: 6px; border: 1px solid #e5e7eb;">
                    <div class="tool-call-header" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px;">
                        <div style="display: flex; gap: 10px; align-items: center;">
                            <span class="tool-call-number" style="background: #3b82f6; color: white; padding: 2px 6px; border-radius: 3px; font-size: 0.8em;">#${index + 1}</span>
                            <span class="tool-call-type" style="background: #e5e7eb; padding: 2px 6px; border-radius: 3px; font-size: 0.8em;">${entry.request.type}</span>
                            <span class="tool-call-name" style="font-weight: 600; color: #374151;">${entry.request.name}</span>
                        </div>
                        <span class="tool-call-status ${statusClass}" style="font-size: 0.8em; font-weight: 600;">${statusIcon} ${entry.response.status}</span>
                    </div>
                    <div class="tool-call-details" style="font-size: 0.85em; color: #6b7280;">
                        <div class="request-details" style="margin-bottom: 5px;">
                            <strong>Request:</strong> ${entry.request.type} "${entry.request.name}"
                            ${entry.request.file_path ? ` from ${entry.request.file_path}` : ''}
                        </div>
                        ${entry.response.location ? `<div style="margin-bottom: 5px;"><strong>Found in:</strong> ${entry.response.location.file || entry.response.location.file_path}</div>` : ''}
                        ${entry.response.error ? `<div style="color: #dc2626; margin-bottom: 5px;"><strong>Error:</strong> ${entry.response.error}</div>` : ''}
                        ${entry.response.content ? `
                            <div class="tool-call-content" style="margin-top: 8px;">
                                <details>
                                    <summary style="cursor: pointer; color: #3b82f6; font-weight: 600;">Show Retrieved ${entry.request.type === 'struct' ? 'Struct Definition' : 'Function Code'}</summary>
                                    <pre style="background: #f9fafb; padding: 10px; border-radius: 4px; margin-top: 5px; overflow-x: auto; font-size: 0.8em;"><code>${escapeHtml(entry.response.content)}</code></pre>
                                </details>
                            </div>
                        ` : ''}
                    </div>
                </div>
            `;
        });
        
        html += `
                </div>
            </div>
        `;
    }
    
    // Add SMID detection results if available
    const analysis = result.analysis || '';
    if (analysis.includes('SMID_Fields_Detected:') || analysis.includes('Struct_Analysis:')) {
        html += `
            <div class="smid-detection-section" style="margin: 20px 0; padding: 15px; background: #f0fdf4; border-radius: 8px; border: 1px solid #bbf7d0;">
                <h4 style="margin: 0 0 10px 0; color: #166534;">🔍 SMID Detection Results</h4>
                <p style="margin: 0 0 10px 0; color: #15803d; font-size: 0.9em;">Analyzing code for Shared Memory Identifiers (SMIDs) and related structures:</p>
            </div>
        `;
    }
    
    // Add the main analysis content
    html += `
        <div class="result-content">
            ${formatAnalysisContent(result.analysis)}
        </div>
    `;
    
    container.innerHTML = html;
}

// Helper function to escape HTML
function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
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
    // Enhanced formatting for SMID and struct analysis
    let formatted = content;
    
    // Highlight SMID fields detected
    formatted = formatted.replace(
        /SMID_Fields_Detected:\s*(.+?)(?=\n|$)/gi,
        '<div style="background: #f0fdf4; padding: 8px; margin: 8px 0; border-radius: 4px; border-left: 4px solid #10b981;"><strong style="color: #166534;">🔍 SMID Fields Detected:</strong> <span style="color: #15803d; font-family: monospace;">$1</span></div>'
    );
    
    // Highlight struct analysis
    formatted = formatted.replace(
        /Struct_Analysis:\s*(.+?)(?=\n|$)/gi,
        '<div style="background: #eff6ff; padding: 8px; margin: 8px 0; border-radius: 4px; border-left: 4px solid #3b82f6;"><strong style="color: #1e40af;">🏗️ Struct Analysis:</strong> <span style="color: #1d4ed8;">$1</span></div>'
    );
    
    // Highlight confidence scores with visual bars
    formatted = formatted.replace(
        /(AIARelevantFunction|Relevant_KD_Entry_Point|Message_Structure_Handling):\s*(\d+)%/g,
        (match, category, score) => {
            const scoreNum = parseInt(score);
            const colorClass = scoreNum >= 75 ? '#10b981' : scoreNum >= 50 ? '#f59e0b' : '#ef4444';
            const width = Math.max(scoreNum, 5); // Minimum 5% width for visibility
            
            return `<div style="margin: 8px 0;">
                <strong>${category.replace(/_/g, ' ')}:</strong> ${score}%
                <div style="background: #f3f4f6; border-radius: 4px; overflow: hidden; margin-top: 2px;">
                    <div style="background: ${colorClass}; height: 8px; width: ${width}%; transition: width 0.3s ease;"></div>
                </div>
            </div>`;
        }
    );
    
    // Convert standard markdown-like formatting to HTML
    formatted = formatted
        .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
        .replace(/\*(.*?)\*/g, '<em>$1</em>')
        .replace(/`(.*?)`/g, '<code style="background: #f3f4f6; padding: 2px 4px; border-radius: 3px; font-family: monospace;">$1</code>')
        .replace(/\n\n/g, '</p><p>')
        .replace(/\n/g, '<br>')
        .replace(/^/, '<p>')
        .replace(/$/, '</p>')
        .replace(/(<p><\/p>)/g, '');
    
    return formatted;
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
