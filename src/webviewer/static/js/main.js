// Kernel Log Analysis Web UI - Main JavaScript Functions

// Global state
let currentData = null;
let llmStatus = {
    available: false,
    models: []
};

// Notification System
function showNotification(message, type = 'info', duration = 5000) {
    // Remove any existing notifications
    const existing = document.querySelector('.notification');
    if (existing) {
        existing.remove();
    }
    
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    
    const icons = {
        'success': '✅',
        'error': '❌', 
        'warning': '⚠️',
        'info': 'ℹ️'
    };
    
    notification.innerHTML = `
        <div class="notification-content">
            <span class="notification-icon">${icons[type] || icons['info']}</span>
            <span class="notification-message">${message}</span>
            <button class="notification-close" onclick="this.parentElement.parentElement.remove()">&times;</button>
        </div>
    `;
    
    document.body.appendChild(notification);
    
    // Auto-remove after duration
    if (duration > 0) {
        setTimeout(() => {
            if (notification.parentElement) {
                notification.remove();
            }
        }, duration);
    }
    
    return notification;
}

// Initialize the application
document.addEventListener('DOMContentLoaded', function() {
    checkLLMStatus();
    loadStoredData();
    setupEventListeners();
});

// Tab Management
function showTab(tabName, clickedElement) {
    // Hide all tab contents
    const contents = document.querySelectorAll('.tab-content');
    contents.forEach(content => content.classList.remove('active'));
    
    // Remove active class from all tabs
    const tabs = document.querySelectorAll('.tab');
    tabs.forEach(tab => tab.classList.remove('active'));
    
    // Show selected tab content
    const selectedContent = document.getElementById(tabName);
    if (selectedContent) {
        selectedContent.classList.add('active');
    }
    
    // Add active class to clicked tab
    if (clickedElement) {
        clickedElement.classList.add('active');
    } else {
        // Fallback: find the tab button with the matching onclick
        const selectedTab = document.querySelector(`[onclick*="showTab('${tabName}')"]`);
        if (selectedTab) {
            selectedTab.classList.add('active');
        }
    }
    
    // Initialize tab-specific functionality
    if (tabName === 'llmAnalysis') {
        initializeLLMTab();
    }
}

// LLM Analysis sub-tab management
function showAnalysisTab(tabName) {
    // Hide all analysis content
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
    
    // Add active class to clicked analysis tab
    const selectedTab = document.querySelector(`[onclick*="showAnalysisTab('${tabName}')"]`);
    if (selectedTab) {
        selectedTab.classList.add('active');
    }
}

// Memory tab management
function showMemoryTab(tabName) {
    // Hide all memory tab content
    const contents = document.querySelectorAll('.memory-tab-content');
    contents.forEach(content => content.classList.remove('active'));
    
    // Remove active class from all memory tabs
    const tabs = document.querySelectorAll('.memory-tab');
    tabs.forEach(tab => tab.classList.remove('active'));
    
    // Show selected memory content
    const selectedContent = document.getElementById(tabName);
    if (selectedContent) {
        selectedContent.classList.add('active');
    }
    
    // Add active class to clicked memory tab
    const selectedTab = document.querySelector(`[onclick*="showMemoryTab('${tabName}')"]`);
    if (selectedTab) {
        selectedTab.classList.add('active');
    }
}

// Initialize LLM Analysis tab
function initializeLLMTab() {
    // Check LLM status when tab is opened
    checkLLMStatus();
    
    // Load available functions for analysis
    loadFunctionOptions();
}

// Load function options for LLM analysis
function loadFunctionOptions() {
    const functionSelect = document.getElementById('functionSelect');
    if (!functionSelect) return;
    
    // Load current data from API if not already loaded
    if (!currentData) {
        fetch('/api/data')
            .then(response => response.json())
            .then(data => {
                currentData = data;
                populateFunctionSelect(data);
            })
            .catch(error => {
                console.error('Error loading data for function options:', error);
            });
    } else {
        populateFunctionSelect(currentData);
    }
}

function populateFunctionSelect(data) {
    const functionSelect = document.getElementById('functionSelect');
    if (!functionSelect) return;
    
    functionSelect.innerHTML = '<option value="">Select a function...</option>';
    
    let functions = [];
    
    // Handle both function_entries (flat) and functions_by_file (nested) structures
    if (data.function_entries && data.function_entries.length > 0) {
        functions = data.function_entries;
    } else if (data.functions_by_file) {
        // Flatten functions_by_file structure
        for (const [filePath, fileFunctions] of Object.entries(data.functions_by_file)) {
            for (const func of fileFunctions) {
                // Ensure file_path is set
                if (!func.file_path) {
                    func.file_path = filePath;
                }
                functions.push(func);
            }
        }
    }
    
    if (functions.length > 0) {
        functions.forEach((func, index) => {
            const option = document.createElement('option');
            option.value = `${func.function_name}|${func.file_path}|${func.line_number}`;
            option.textContent = `${func.function_name} (${func.file_path})`;
            functionSelect.appendChild(option);
        });
        console.log(`Loaded ${functions.length} functions for analysis`);
    } else {
        const option = document.createElement('option');
        option.textContent = 'No functions available';
        functionSelect.appendChild(option);
    }
}

// Load selected function for LLM analysis
function loadSelectedFunction() {
    const functionSelect = document.getElementById('functionSelect');
    const functionCode = document.getElementById('functionCode');
    
    if (!functionSelect || !functionSelect.value) {
        if (functionCode) functionCode.value = '';
        return;
    }
    
    const [functionName, filePath, lineNumber] = functionSelect.value.split('|');
    
    if (functionCode) {
        functionCode.value = 'Loading function code...';
    }
    
    // Build query parameters
    const params = new URLSearchParams({
        name: functionName,
        file: filePath,
        line: lineNumber
    });
    
    fetch(`/api/function-code?${params}`)
        .then(response => response.json())
        .then(data => {
            if (functionCode) {
                if (data.function_code) {
                    functionCode.value = data.function_code;
                } else {
                    functionCode.value = 'No source code available for this function.';
                }
            }
        })
        .catch(error => {
            console.error('Error loading function code:', error);
            if (functionCode) {
                functionCode.value = 'Error loading function code.';
            }
        });
}

// LLM Analysis Functions
function analyzeFunctionWithLLM() {
    if (!llmStatus.available) {
        showNotification('LLM analysis is not available. Please configure your OpenAI API key.', 'error');
        return;
    }
    
    const functionSelect = document.getElementById('functionSelect');
    const functionCode = document.getElementById('functionCode');
    const customPrompt = document.getElementById('customPrompt');
    const modelSelect = document.getElementById('modelSelect');
    const analyzeBtn = document.getElementById('analyzeFunctionBtn');
    const resultDiv = document.getElementById('functionAnalysisResult');
    
    if (!functionSelect || !functionSelect.value) {
        showNotification('Please select a function to analyze.', 'error');
        return;
    }
    
    if (!functionCode || !functionCode.value.trim()) {
        showNotification('No function code available to analyze.', 'error');
        return;
    }
    
    const [functionName, filePath, lineNumber] = functionSelect.value.split('|');
    
    // Show loading state
    if (analyzeBtn) {
        analyzeBtn.classList.add('loading');
        analyzeBtn.disabled = true;
    }
    if (resultDiv) {
        resultDiv.style.display = 'none';
    }
    
    const requestData = {
        function_name: functionName,
        source_code: functionCode.value,
        file_path: filePath,
        custom_prompt: customPrompt ? customPrompt.value : '',
        model_id: modelSelect ? modelSelect.value : 'gpt-3.5-turbo'
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
        if (analyzeBtn) {
            analyzeBtn.classList.remove('loading');
            analyzeBtn.disabled = false;
        }
        
        if (data.status === 'success') {
            showAnalysisResult(resultDiv, data.analysis, 'success', {
                'Function': data.function_name,
                'File': data.file_path,
                'Model': data.model_used || 'gpt-3.5-turbo',
                'Custom Prompt': data.custom_prompt || 'None'
            });
        } else {
            showAnalysisResult(resultDiv, data.error || 'Analysis failed', 'error');
        }
    })
    .catch(error => {
        console.error('Error analyzing function:', error);
        if (analyzeBtn) {
            analyzeBtn.classList.remove('loading');
            analyzeBtn.disabled = false;
        }
        showAnalysisResult(resultDiv, 'Network error occurred while analyzing function.', 'error');
    });
}

function showAnalysisResult(resultDiv, text, type, metadata = {}) {
    if (!resultDiv) return;
    
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

function analyzeDMAWithLLM() {
    if (!llmStatus.available) {
        showNotification('LLM analysis is not available. Please configure your OpenAI API key.', 'error');
        return;
    }
    
    const dmaSelect = document.getElementById('dmaSelect');
    const dmaCode = document.getElementById('dmaCode');
    const callGraph = document.getElementById('callGraph');
    const dmaCustomPrompt = document.getElementById('dmaCustomPrompt');
    const modelSelect = document.getElementById('modelSelect');
    const analyzeBtn = document.getElementById('analyzeDMABtn');
    const resultDiv = document.getElementById('dmaAnalysisResult');
    
    if (!dmaSelect || !dmaSelect.value) {
        showNotification('Please select a DMA operation to analyze.', 'error');
        return;
    }
    
    const dmaIndex = parseInt(dmaSelect.value);
    
    // Show loading state
    if (analyzeBtn) {
        analyzeBtn.classList.add('loading');
        analyzeBtn.disabled = true;
    }
    if (resultDiv) {
        resultDiv.style.display = 'none';
    }
    
    // Get DMA operation data
    fetch('/api/data')
        .then(response => response.json())
        .then(data => {
            const dmaOperation = data.dma_operations && data.dma_operations[dmaIndex];
            if (!dmaOperation) {
                throw new Error('DMA operation not found');
            }
            
            const requestData = {
                dma_operation: dmaOperation,
                function_code: dmaCode ? dmaCode.value : '',
                call_graph: callGraph && callGraph.value ? callGraph.value.split('\n') : [],
                custom_prompt: dmaCustomPrompt ? dmaCustomPrompt.value : '',
                model_id: modelSelect ? modelSelect.value : 'gpt-3.5-turbo'
            };
            
            return fetch('/api/llm/analyze/dma', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(requestData)
            });
        })
        .then(response => response.json())
        .then(data => {
            if (analyzeBtn) {
                analyzeBtn.classList.remove('loading');
                analyzeBtn.disabled = false;
            }
            
            if (data.status === 'success') {
                showAnalysisResult(resultDiv, data.analysis, 'success', {
                    'DMA Function': data.dma_operation ? data.dma_operation.dma_function : 'Unknown',
                    'Caller': data.dma_operation ? data.dma_operation.caller_function : 'Unknown',
                    'Model': data.model_used || 'gpt-3.5-turbo',
                    'Custom Prompt': data.custom_prompt || 'None'
                });
            } else {
                showAnalysisResult(resultDiv, data.error || 'Analysis failed', 'error');
            }
        })
        .catch(error => {
            console.error('Error analyzing DMA:', error);
            if (analyzeBtn) {
                analyzeBtn.classList.remove('loading');
                analyzeBtn.disabled = false;
            }
            showAnalysisResult(resultDiv, 'Network error occurred while analyzing DMA operation.', 'error');
        });
}

function analyzeUserCopyWithLLM() {
    if (!llmStatus.available) {
        showNotification('LLM analysis is not available. Please configure your OpenAI API key.', 'error');
        return;
    }
    
    const userCopySelect = document.getElementById('userCopySelect');
    const userCopyCode = document.getElementById('userCopyCode');
    const userCopyCallGraph = document.getElementById('userCopyCallGraph');
    const userCopyCustomPrompt = document.getElementById('userCopyCustomPrompt');
    const modelSelect = document.getElementById('modelSelect');
    const analyzeBtn = document.getElementById('analyzeUserCopyBtn');
    const resultDiv = document.getElementById('userCopyAnalysisResult');
    
    if (!userCopySelect || !userCopySelect.value) {
        showNotification('Please select a user copy operation to analyze.', 'error');
        return;
    }
    
    const userCopyIndex = parseInt(userCopySelect.value);
    
    // Show loading state
    if (analyzeBtn) {
        analyzeBtn.classList.add('loading');
        analyzeBtn.disabled = true;
    }
    if (resultDiv) {
        resultDiv.style.display = 'none';
    }
    
    // Get user copy operation data
    fetch('/api/data')
        .then(response => response.json())
        .then(data => {
            const userCopyOperation = data.user_copy_operations && data.user_copy_operations[userCopyIndex];
            if (!userCopyOperation) {
                throw new Error('User copy operation not found');
            }
            
            const requestData = {
                user_copy_operation: userCopyOperation,
                function_code: userCopyCode ? userCopyCode.value : '',
                call_graph: userCopyCallGraph && userCopyCallGraph.value ? userCopyCallGraph.value.split('\n') : [],
                custom_prompt: userCopyCustomPrompt ? userCopyCustomPrompt.value : '',
                model_id: modelSelect ? modelSelect.value : 'gpt-3.5-turbo'
            };
            
            return fetch('/api/llm/analyze/user-copy', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(requestData)
            });
        })
        .then(response => response.json())
        .then(data => {
            if (analyzeBtn) {
                analyzeBtn.classList.remove('loading');
                analyzeBtn.disabled = false;
            }
            
            if (data.status === 'success') {
                showAnalysisResult(resultDiv, data.analysis, 'success', {
                    'Function': data.user_copy_operation ? data.user_copy_operation.function_name : 'Unknown',
                    'Operation': data.user_copy_operation ? data.user_copy_operation.operation_type : 'Unknown',
                    'Model': data.model_used || 'gpt-3.5-turbo',
                    'Custom Prompt': data.custom_prompt || 'None'
                });
            } else {
                showAnalysisResult(resultDiv, data.error || 'Analysis failed', 'error');
            }
        })
        .catch(error => {
            console.error('Error analyzing user copy:', error);
            if (analyzeBtn) {
                analyzeBtn.classList.remove('loading');
                analyzeBtn.disabled = false;
            }
            showAnalysisResult(resultDiv, 'Network error occurred while analyzing user copy operation.', 'error');
        });
}

function analyzeIOCTLWithLLM() {
    if (!llmStatus.available) {
        showNotification('LLM analysis is not available. Please configure your OpenAI API key.', 'error');
        return;
    }
    
    const ioctlSelect = document.getElementById('ioctlSelect');
    const ioctlCode = document.getElementById('ioctlCode');
    const ioctlCallGraph = document.getElementById('ioctlCallGraph');
    const ioctlCustomPrompt = document.getElementById('ioctlCustomPrompt');
    const modelSelect = document.getElementById('modelSelect');
    const analyzeBtn = document.getElementById('analyzeIOCTLBtn');
    const resultDiv = document.getElementById('ioctlAnalysisResult');
    
    if (!ioctlSelect || !ioctlSelect.value) {
        showNotification('Please select an IOCTL handler to analyze.', 'error');
        return;
    }
    
    const ioctlIndex = parseInt(ioctlSelect.value);
    
    // Show loading state
    if (analyzeBtn) {
        analyzeBtn.classList.add('loading');
        analyzeBtn.disabled = true;
    }
    if (resultDiv) {
        resultDiv.style.display = 'none';
    }
    
    // Get IOCTL handler data
    fetch('/api/data')
        .then(response => response.json())
        .then(data => {
            const ioctlOperation = data.ioctl_operations && data.ioctl_operations[ioctlIndex];
            if (!ioctlOperation) {
                throw new Error('IOCTL operation not found');
            }
            
            const requestData = {
                ioctl_operation: ioctlOperation,
                function_code: ioctlCode ? ioctlCode.value : '',
                call_graph: ioctlCallGraph && ioctlCallGraph.value ? ioctlCallGraph.value.split('\n') : [],
                custom_prompt: ioctlCustomPrompt ? ioctlCustomPrompt.value : '',
                model_id: modelSelect ? modelSelect.value : 'gpt-3.5-turbo'
            };
            
            return fetch('/api/llm/analyze/ioctl', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(requestData)
            });
        })
        .then(response => response.json())
        .then(data => {
            if (analyzeBtn) {
                analyzeBtn.classList.remove('loading');
                analyzeBtn.disabled = false;
            }
            
            if (data.status === 'success') {
                showAnalysisResult(resultDiv, data.analysis, 'success', {
                    'Function Name': data.ioctl_operation ? data.ioctl_operation.function_name : 'Unknown',
                    'File Path': data.ioctl_operation ? data.ioctl_operation.file_path : 'Unknown',
                    'Model': data.model_used || 'gpt-3.5-turbo',
                    'Custom Prompt': data.custom_prompt || 'None'
                });
            } else {
                showAnalysisResult(resultDiv, data.error || 'Analysis failed', 'error');
            }
        })
        .catch(error => {
            console.error('Error analyzing IOCTL:', error);
            if (analyzeBtn) {
                analyzeBtn.classList.remove('loading');
                analyzeBtn.disabled = false;
            }
            showAnalysisResult(resultDiv, 'Network error occurred while analyzing IOCTL handler.', 'error');
        });
}

// Quick analysis functions for inline buttons
function quickAnalyzeDMA(dmaIndex) {
    if (!llmStatus.available) {
        showNotification('LLM analysis is not available. Please configure your OpenAI API key.', 'error');
        return;
    }
    
    // Switch to LLM Analysis tab and DMA Analysis subtab
    showTab('llmAnalysis');
    showAnalysisTab('dmaAnalysis');
    
    // Select the DMA operation
    const dmaSelect = document.getElementById('dmaSelect');
    if (dmaSelect) {
        dmaSelect.value = dmaIndex;
        loadSelectedDMA();
    }
    
    // Scroll to the analysis section
    const llmAnalysisSection = document.getElementById('llmAnalysis');
    if (llmAnalysisSection) {
        llmAnalysisSection.scrollIntoView({ behavior: 'smooth' });
    }
}

function quickAnalyzeUserCopy(copyIndex) {
    if (!llmStatus.available) {
        showNotification('LLM analysis is not available. Please configure your OpenAI API key.', 'error');
        return;
    }
    
    // Switch to LLM Analysis tab and User Copy Analysis subtab
    showTab('llmAnalysis');
    showAnalysisTab('userCopyAnalysis');
    
    // Select the user copy operation
    const userCopySelect = document.getElementById('userCopySelect');
    if (userCopySelect) {
        userCopySelect.value = copyIndex;
        loadSelectedUserCopy();
    }
    
    // Scroll to the analysis section
    const llmAnalysisSection = document.getElementById('llmAnalysis');
    if (llmAnalysisSection) {
        llmAnalysisSection.scrollIntoView({ behavior: 'smooth' });
    }
}

function quickAnalyzeIOCTL(ioctlIndex) {
    if (!llmStatus.available) {
        showNotification('LLM analysis is not available. Please configure your OpenAI API key.', 'error');
        return;
    }
    
    // Switch to LLM Analysis tab and IOCTL Analysis subtab
    showTab('llmAnalysis');
    showAnalysisTab('ioctlAnalysis');
    
    // Select the IOCTL handler
    const ioctlSelect = document.getElementById('ioctlSelect');
    if (ioctlSelect) {
        ioctlSelect.value = ioctlIndex;
        loadSelectedIOCTL();
    }
    
    // Scroll to the analysis section
    const llmAnalysisSection = document.getElementById('llmAnalysis');
    if (llmAnalysisSection) {
        llmAnalysisSection.scrollIntoView({ behavior: 'smooth' });
    }
}

function quickAnalyzeFunction(functionName, filePath, lineNumber) {
    if (!llmStatus.available) {
        showNotification('LLM analysis is not available. Please configure your OpenAI API key.', 'error');
        return;
    }
    
    // Switch to LLM Analysis tab and Function Analysis subtab
    showTab('llmAnalysis');
    showAnalysisTab('functionAnalysis');
    
    // Select the function
    const functionSelect = document.getElementById('functionSelect');
    if (functionSelect) {
        functionSelect.value = `${functionName}|${filePath}|${lineNumber}`;
        loadSelectedFunction();
    }
    
    // Scroll to the analysis section
    const llmAnalysisSection = document.getElementById('llmAnalysis');
    if (llmAnalysisSection) {
        llmAnalysisSection.scrollIntoView({ behavior: 'smooth' });
    }
}

// Analysis tab switching function
function showAnalysisTab(tabName) {
    // Hide all analysis tabs
    const analysisTabs = document.querySelectorAll('.analysis-tab');
    analysisTabs.forEach(tab => {
        tab.style.display = 'none';
    });
    
    // Show selected tab
    const selectedTab = document.getElementById(tabName);
    if (selectedTab) {
        selectedTab.style.display = 'block';
    }
    
    // Update tab buttons
    const tabButtons = document.querySelectorAll('.analysis-tab-btn');
    tabButtons.forEach(btn => {
        btn.classList.remove('active');
    });
    
    const activeButton = document.querySelector(`[onclick="showAnalysisTab('${tabName}')"]`);
    if (activeButton) {
        activeButton.classList.add('active');
    }
}

// Additional helper functions for LLM analysis
function loadSelectedDMA() {
    const dmaSelect = document.getElementById('dmaSelect');
    const dmaCode = document.getElementById('dmaCode');
    
    if (!dmaSelect || !dmaSelect.value || !currentData) return;
    
    const dmaIndex = parseInt(dmaSelect.value);
    const dmaOperation = currentData.dma_operations && currentData.dma_operations[dmaIndex];
    
    if (dmaOperation && dmaCode) {
        // Load function code for the DMA operation
        const functionName = dmaOperation.dma_function;
        const filePath = dmaOperation.file_path;
        const lineNumber = dmaOperation.line_number;
        
        if (functionName && filePath) {
            fetchFunctionCode(functionName, filePath, lineNumber)
                .then(code => {
                    dmaCode.value = code;
                })
                .catch(error => {
                    console.error('Error loading DMA code:', error);
                    dmaCode.value = 'Error loading function code.';
                });
        }
    }
}

function loadSelectedUserCopy() {
    const userCopySelect = document.getElementById('userCopySelect');
    const userCopyCode = document.getElementById('userCopyCode');
    
    if (!userCopySelect || !userCopySelect.value || !currentData) return;
    
    const copyIndex = parseInt(userCopySelect.value);
    const userCopyOperation = currentData.user_copy_operations && currentData.user_copy_operations[copyIndex];
    
    if (userCopyOperation && userCopyCode) {
        // Try to load from API first
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
}

function loadSelectedIOCTL() {
    const ioctlSelect = document.getElementById('ioctlSelect');
    const ioctlCode = document.getElementById('ioctlCode');
    
    if (!ioctlSelect || !ioctlSelect.value || !currentData) return;
    
    const ioctlIndex = parseInt(ioctlSelect.value);
    const ioctlOperation = currentData.ioctl_operations && currentData.ioctl_operations[ioctlIndex];
    
    if (ioctlOperation && ioctlCode) {
        // Try to load from API first
        fetch(`/api/ioctl-code/${ioctlIndex}`)
            .then(response => response.json())
            .then(data => {
                if (data.function_code) {
                    ioctlCode.value = data.function_code;
                } else {
                    ioctlCode.value = 'No source code available for this IOCTL operation.';
                }
            })
            .catch(error => {
                console.error('Error loading IOCTL code:', error);
                ioctlCode.value = 'Error loading function code.';
            });
    }
}

// LLM Status and Analysis Functions
function checkLLMStatus() {
    fetch('/api/llm/status')
        .then(response => response.json())
        .then(data => {
            llmStatus.available = data.available;
            llmStatus.models = data.models || [];
            
            // Update UI based on LLM availability
            updateLLMStatusUI();
        })
        .catch(error => {
            console.error('Error checking LLM status:', error);
            llmStatus.available = false;
            updateLLMStatusUI();
        });
}

function updateLLMStatusUI() {
    const statusElements = document.querySelectorAll('.llm-status');
    statusElements.forEach(element => {
        if (llmStatus.available) {
            element.textContent = 'LLM Analysis Available';
            element.className = 'llm-status available';
        } else {
            element.textContent = 'LLM Analysis Unavailable';
            element.className = 'llm-status unavailable';
        }
    });
    
    // Update model selects
    const modelSelects = document.querySelectorAll('select[id$="ModelSelect"]');
    modelSelects.forEach(select => {
        select.innerHTML = '';
        if (llmStatus.available && llmStatus.models.length > 0) {
            llmStatus.models.forEach(model => {
                const option = document.createElement('option');
                option.value = model.id;
                option.textContent = `${model.name} - ${model.description}`;
                select.appendChild(option);
            });
        } else {
            const option = document.createElement('option');
            option.textContent = 'No models available';
            select.appendChild(option);
        }
    });
}

// Search Functions
function filterFunctions() {
    const searchTerm = document.getElementById('functionSearch').value.toLowerCase();
    const functionItems = document.querySelectorAll('.function-item');
    const fileSections = document.querySelectorAll('.file-section');
    
    fileSections.forEach(section => {
        const functions = section.querySelectorAll('.function-item');
        let hasVisibleFunctions = false;
        
        functions.forEach(item => {
            const functionName = item.querySelector('.function-name').textContent.toLowerCase();
            if (functionName.includes(searchTerm)) {
                item.style.display = 'block';
                hasVisibleFunctions = true;
            } else {
                item.style.display = 'none';
            }
        });
        
        section.style.display = hasVisibleFunctions ? 'block' : 'none';
    });
}

function filterDMA() {
    const searchTerm = document.getElementById('dmaSearch').value.toLowerCase();
    const dmaItems = document.querySelectorAll('.dma-item');
    
    dmaItems.forEach(item => {
        const text = item.textContent.toLowerCase();
        item.style.display = text.includes(searchTerm) ? 'block' : 'none';
    });
}

function filterUserCopy() {
    const searchTerm = document.getElementById('userCopySearch').value.toLowerCase();
    const items = document.querySelectorAll('.user-copy-item');
    
    items.forEach(item => {
        const text = item.textContent.toLowerCase();
        item.style.display = text.includes(searchTerm) ? 'block' : 'none';
    });
}

function filterIOCTL() {
    const searchTerm = document.getElementById('ioctlSearch').value.toLowerCase();
    const items = document.querySelectorAll('.ioctl-item');
    
    items.forEach(item => {
        const text = item.textContent.toLowerCase();
        item.style.display = text.includes(searchTerm) ? 'block' : 'none';
    });
}

function filterDevices() {
    const searchTerm = document.getElementById('deviceSearch').value.toLowerCase();
    const items = document.querySelectorAll('.device-item');
    
    items.forEach(item => {
        const text = item.textContent.toLowerCase();
        item.style.display = text.includes(searchTerm) ? 'block' : 'none';
    });
}

function toggleDeviceDetails(element) {
    const details = element.nextElementSibling;
    if (details && details.classList.contains('access-details')) {
        const isHidden = details.classList.contains('hidden');
        if (isHidden) {
            details.classList.remove('hidden');
            element.textContent = 'Hide Access Details';
        } else {
            details.classList.add('hidden');
            element.textContent = 'Show Access Details';
        }
    }
}

// Memory tab functions
function showMemoryTab(tabName) {
    const contents = document.querySelectorAll('.memory-tab-content');
    contents.forEach(content => content.classList.remove('active'));
    
    const tabs = document.querySelectorAll('.memory-tab');
    tabs.forEach(tab => tab.classList.remove('active'));
    
    const selectedContent = document.getElementById(tabName);
    if (selectedContent) {
        selectedContent.classList.add('active');
    }
    
    const selectedTab = document.querySelector(`[onclick="showMemoryTab('${tabName}')"]`);
    if (selectedTab) {
        selectedTab.classList.add('active');
    }
}

// Function code loading
function loadFunctionCode(detailsElement, functionName, filePath, lineNumber) {
    const codeContainer = detailsElement.querySelector('.code-container pre code');
    const loadingIndicator = detailsElement.querySelector('.loading-indicator');
    
    if (loadingIndicator) {
        loadingIndicator.style.display = 'inline-block';
    }
    
    fetchFunctionCode(functionName, filePath, lineNumber)
        .then(code => {
            codeContainer.textContent = code;
        })
        .catch(error => {
            console.error('Error loading function code:', error);
            codeContainer.textContent = 'Error loading source code';
        })
        .finally(() => {
            if (loadingIndicator) {
                loadingIndicator.style.display = 'none';
            }
        });
}

// Helper: fetch function code as a Promise<string>
function fetchFunctionCode(functionName, filePath, lineNumber) {
    const params = new URLSearchParams({
        name: functionName,
        file: filePath,
        line: lineNumber
    });
    return fetch(`/api/function-code?${params}`)
        .then(response => response.json())
        .then(data => {
            if (data && data.function_code) {
                return data.function_code;
            }
            if (data && data.error) {
                return `Error: ${data.error}`;
            }
            return 'No source code available';
        });
}

// Lazy loading for large datasets
function initializeLazyLoading() {
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const element = entry.target;
                element.classList.add('loaded');
                observer.unobserve(element);
            }
        });
    });
    
    document.querySelectorAll('.lazy-load').forEach(element => {
        observer.observe(element);
    });
}

// Auto-refresh functionality
function setupAutoRefresh() {
    setInterval(() => {
        fetch('/api/status')
            .then(response => response.json())
            .then(data => {
                if (data.updated) {
                    showNotification('Data has been updated. Refreshing...', 'info');
                    setTimeout(() => {
                        window.location.reload();
                    }, 2000);
                }
            })
            .catch(error => {
                console.error('Error checking for updates:', error);
            });
    }, 30000); // Check every 30 seconds
}

// Notification system
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification ${type}`;
    notification.textContent = message;
    
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 20px;
        border-radius: 8px;
        color: white;
        font-weight: 600;
        z-index: 1000;
        animation: slideIn 0.3s ease;
    `;
    
    switch (type) {
        case 'success':
            notification.style.background = '#16a34a';
            break;
        case 'error':
            notification.style.background = '#dc2626';
            break;
        case 'warning':
            notification.style.background = '#f59e0b';
            break;
        default:
            notification.style.background = '#4f46e5';
    }
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.style.animation = 'slideOut 0.3s ease';
        setTimeout(() => {
            document.body.removeChild(notification);
        }, 300);
    }, 3000);
}

// Add CSS for notifications
const notificationStyles = document.createElement('style');
notificationStyles.textContent = `
    @keyframes slideIn {
        from { transform: translateX(100%); opacity: 0; }
        to { transform: translateX(0); opacity: 1; }
    }
    
    @keyframes slideOut {
        from { transform: translateX(0); opacity: 1; }
        to { transform: translateX(100%); opacity: 0; }
    }
`;
document.head.appendChild(notificationStyles);

// Data export functionality
function exportData(format = 'json') {
    fetch('/api/data')
        .then(response => response.json())
        .then(data => {
            let content, filename, mimeType;
            
            if (format === 'json') {
                content = JSON.stringify(data, null, 2);
                filename = `kernel_analysis_${new Date().toISOString().split('T')[0]}.json`;
                mimeType = 'application/json';
            } else if (format === 'csv') {
                // Convert to CSV (simplified)
                const functions = data.function_entries || [];
                const csvRows = ['Function Name,File Path,Line Number,Call Count'];
                functions.forEach(func => {
                    csvRows.push(`"${func.function_name}","${func.file_path}",${func.line_number},${func.call_count}`);
                });
                content = csvRows.join('\n');
                filename = `kernel_analysis_${new Date().toISOString().split('T')[0]}.csv`;
                mimeType = 'text/csv';
            }
            
            const blob = new Blob([content], { type: mimeType });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = filename;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            URL.revokeObjectURL(url);
            
            showNotification(`Data exported as ${filename}`, 'success');
        })
        .catch(error => {
            console.error('Error exporting data:', error);
            showNotification('Error exporting data', 'error');
        });
}

// Event listeners setup
function setupEventListeners() {
    // Keyboard shortcuts
    document.addEventListener('keydown', function(e) {
        // Ctrl+F for search
        if (e.ctrlKey && e.key === 'f') {
            e.preventDefault();
            const activeTab = document.querySelector('.tab-content.active');
            const searchBox = activeTab?.querySelector('.search-box');
            if (searchBox) {
                searchBox.focus();
            }
        }
        
        // Ctrl+E for export
        if (e.ctrlKey && e.key === 'e') {
            e.preventDefault();
            exportData('json');
        }
    });
    
    // Copy to clipboard functionality
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('copy-btn')) {
            const text = e.target.getAttribute('data-copy');
            navigator.clipboard.writeText(text).then(() => {
                showNotification('Copied to clipboard', 'success');
            }).catch(() => {
                showNotification('Failed to copy', 'error');
            });
        }
    });
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', function() {
    initializeLazyLoading();
    setupAutoRefresh();
    
    // Show loading state initially
    showNotification('Loading analysis data...', 'info');
    
    // Hide loading after a delay
    setTimeout(() => {
        showNotification('Analysis data loaded successfully', 'success');
    }, 1000);
});

// Utility functions
function formatTimestamp(timestamp) {
    const date = new Date(timestamp);
    return date.toLocaleString();
}

function formatFileSize(bytes) {
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    if (bytes === 0) return '0 Bytes';
    const i = Math.floor(Math.log(bytes) / Math.log(1024));
    return Math.round(bytes / Math.pow(1024, i) * 100) / 100 + ' ' + sizes[i];
}

function formatDuration(ms) {
    const seconds = Math.floor(ms / 1000);
    const minutes = Math.floor(seconds / 60);
    const hours = Math.floor(minutes / 60);
    
    if (hours > 0) {
        return `${hours}h ${minutes % 60}m ${seconds % 60}s`;
    } else if (minutes > 0) {
        return `${minutes}m ${seconds % 60}s`;
    } else {
        return `${seconds}s`;
    }
}

// Data storage utilities
function loadStoredData() {
    try {
        const stored = localStorage.getItem('kernelAnalysisData');
        if (stored) {
            currentData = JSON.parse(stored);
        }
    } catch (error) {
        console.error('Error loading stored data:', error);
    }
}

function saveDataToStorage(data) {
    try {
        localStorage.setItem('kernelAnalysisData', JSON.stringify(data));
        showDataStorageIndicator('Data saved locally', 'success');
    } catch (error) {
        console.error('Error saving data:', error);
        showDataStorageIndicator('Error saving data', 'error');
    }
}

function showDataStorageIndicator(message, type = 'success') {
    const indicator = document.createElement('div');
    indicator.className = `data-storage-indicator ${type}`;
    indicator.textContent = message;
    
    document.body.appendChild(indicator);
    
    // Trigger show animation
    setTimeout(() => {
        indicator.classList.add('show');
    }, 100);
    
    // Hide after 3 seconds
    setTimeout(() => {
        indicator.classList.remove('show');
        setTimeout(() => {
            if (document.body.contains(indicator)) {
                document.body.removeChild(indicator);
            }
        }, 300);
    }, 3000);
}

// Function Code Loading Functions
// (Removed duplicate loadFunctionCode definition to avoid conflicts)

function loadDmaCode(element, index, dmaFunction) {
    // This function is called when DMA operation details are expanded
    console.log(`Loading DMA code for: ${dmaFunction} (index: ${index})`);
    
    // The code should already be loaded in the template, but we can enhance it here
    const codeElement = element.querySelector('code');
    if (codeElement && !codeElement.textContent.trim()) {
        codeElement.textContent = `// Code for ${dmaFunction} will be loaded dynamically`;
    }
}

function loadCopyCode(element, index, copyFunction) {
    // This function is called when user copy operation details are expanded
    console.log(`Loading copy code for: ${copyFunction} (index: ${index})`);
    
    // The code should already be loaded in the template, but we can enhance it here
    const codeElement = element.querySelector('code');
    if (codeElement && !codeElement.textContent.trim()) {
        codeElement.textContent = `// Code for ${copyFunction} will be loaded dynamically`;
    }
}

function loadIoctlCode(element, index, ioctlFunction) {
    // This function is called when IOCTL operation details are expanded
    console.log(`Loading IOCTL code for: ${ioctlFunction} (index: ${index})`);
    
    // The code should already be loaded in the template, but we can enhance it here
    const codeElement = element.querySelector('code');
    if (codeElement && !codeElement.textContent.trim()) {
        codeElement.textContent = `// Code for ${ioctlFunction} will be loaded dynamically`;
    }
}

// Stack Trace and Detail Toggle Functions
function toggleStackTrace(button) {
    const stackTraceElement = button.parentElement.querySelector('.stack-trace');
    if (stackTraceElement) {
        if (stackTraceElement.classList.contains('hidden')) {
            stackTraceElement.classList.remove('hidden');
            button.textContent = 'Hide Call Graph';
        } else {
            stackTraceElement.classList.add('hidden');
            button.textContent = 'Show Call Graph';
        }
    }
}

// Quick Analysis Functions
function quickAnalyzeFunction(functionName, filePath, lineNumber) {
    console.log(`Quick analyzing function: ${functionName} in ${filePath}:${lineNumber}`);
    
    // Get function code
    fetchFunctionCode(functionName, filePath, lineNumber)
        .then(code => {
            // Switch to LLM Analysis tab
            showTab('llmAnalysis');
            showAnalysisTab('functionAnalysis');
            
            // Populate function data
            const functionSelect = document.getElementById('functionSelect');
            if (functionSelect) {
                functionSelect.value = `${functionName}|${filePath}|${lineNumber}`;
            }
            
            const functionCode = document.getElementById('functionCode');
            if (functionCode) {
                functionCode.value = code;
            }
            
            // Set default prompt
            const customPrompt = document.getElementById('customPrompt');
            if (customPrompt) {
                customPrompt.value = 'Analyze this function for AI Accelerator (AIA) integration patterns: memory sharing with AI accelerators, DMA operations, and entry points for AIA communication.';
            }
        })
        .catch(error => {
            console.error('Error loading function for quick analysis:', error);
        });
}

function quickAnalyzeDMA(index) {
    console.log(`Quick analyzing DMA operation at index: ${index}`);
    
    // Switch to LLM Analysis tab
    showTab('llmAnalysis');
    showAnalysisTab('dmaAnalysis');
    
    // Populate DMA data
    const dmaSelect = document.getElementById('dmaSelect');
    if (dmaSelect) {
        dmaSelect.value = index.toString();
        loadSelectedDMA(); // Load the selected DMA operation
    }
    
    // Set default prompt
    const dmaCustomPrompt = document.getElementById('dmaCustomPrompt');
    if (dmaCustomPrompt) {
        dmaCustomPrompt.value = 'Analyze this DMA operation for AI Accelerator (AIA) integration: memory management, DMA buffer sharing, and AIA accessibility patterns.';
    }
}

// Load selected DMA operation for analysis
function loadSelectedDMA() {
    const dmaSelect = document.getElementById('dmaSelect');
    const dmaCode = document.getElementById('dmaCode');
    const callGraph = document.getElementById('callGraph');
    
    if (!dmaSelect || !dmaSelect.value) {
        if (dmaCode) dmaCode.value = '';
        if (callGraph) callGraph.value = '';
        return;
    }
    
    const dmaIndex = parseInt(dmaSelect.value);
    
    // Load DMA operation details from current data
    fetch('/api/data')
        .then(response => response.json())
        .then(data => {
            const dmaOp = data.dma_operations && data.dma_operations[dmaIndex];
            if (dmaOp) {
                // Load associated function code
                if (dmaCode) {
                    dmaCode.value = 'Loading associated function code...';
                }
                
                // Show call graph if available
                if (callGraph) {
                    if (dmaOp.call_graph && dmaOp.call_graph.length > 0) {
                        callGraph.value = dmaOp.call_graph.join('\n');
                    } else if (dmaOp.stack_trace && dmaOp.stack_trace.length > 0) {
                        callGraph.value = dmaOp.stack_trace.join('\n');
                    } else {
                        callGraph.value = 'No call graph available for this DMA operation.';
                    }
                }
                
                // Try to load function code for the caller function
                fetch(`/api/dma-code/${dmaIndex}`)
                    .then(response => response.json())
                    .then(funcData => {
                        if (dmaCode) {
                            if (funcData.function_code) {
                                dmaCode.value = funcData.function_code;
                            } else {
                                dmaCode.value = 'No source code available for the caller function.';
                            }
                        }
                    })
                    .catch(error => {
                        if (dmaCode) {
                            dmaCode.value = 'Error loading function code.';
                        }
                    });
            }
        })
        .catch(error => {
            console.error('Error loading DMA details:', error);
            if (dmaCode) {
                dmaCode.value = 'Error loading DMA operation details.';
            }
        });
}

function quickAnalyzeUserCopy(index) {
    console.log(`Quick analyzing user copy operation at index: ${index}`);
    
    // Switch to LLM Analysis tab
    showTab('llmAnalysis');
    showAnalysisTab('userCopyAnalysis');
    
    // Set default prompt for user copy analysis
    const customPrompt = document.getElementById('userCopyCustomPrompt');
    if (customPrompt) {
        customPrompt.value = 'Analyze this user copy operation for AI Accelerator (AIA) integration: message structures with SMIDs, memory metadata exchange, and AIA communication patterns.';
    }
}

function quickAnalyzeIOCTL(index) {
    console.log(`Quick analyzing IOCTL operation at index: ${index}`);
    
    // Switch to LLM Analysis tab
    showTab('llmAnalysis');
    showAnalysisTab('ioctlAnalysis');
    
    // Set default prompt for IOCTL analysis
    const customPrompt = document.getElementById('ioctlCustomPrompt');
    if (customPrompt) {
        customPrompt.value = 'Analyze this IOCTL handler for AI Accelerator (AIA) integration: message structure handling, SMID management, and user-kernel communication for AIA memory access.';
    }
}

// Memory Tab Functions
function showMemoryTab(tabName) {
    // Hide all memory tab contents
    const contents = document.querySelectorAll('.memory-tab-content');
    contents.forEach(content => content.classList.remove('active'));
    
    // Remove active class from all memory tabs
    const tabs = document.querySelectorAll('.memory-tab');
    tabs.forEach(tab => tab.classList.remove('active'));
    
    // Show selected memory tab content
    const selectedContent = document.getElementById(tabName);
    if (selectedContent) {
        selectedContent.classList.add('active');
    }
    
    // Add active class to selected memory tab
    const selectedTab = document.querySelector(`[onclick="showMemoryTab('${tabName}')"]`);
    if (selectedTab) {
        selectedTab.classList.add('active');
    }
}

// Comprehensive Analysis Functions
async function runComprehensiveAnalysis() {
    const button = document.getElementById('analyzeAllBtn');
    const buttonText = document.getElementById('analyzeAllBtnText');
    const dashboard = document.getElementById('resultsDashboard');
    const progressSection = document.getElementById('progressSection');
    const progressBar = document.getElementById('progressBar');
    const progressText = document.getElementById('progressText');
    const processedCountEl = document.getElementById('processedCount');
    const totalCountEl = document.getElementById('totalCount');
    
    const model = document.getElementById('analyzeAllModel').value;
    const customPrompt = document.getElementById('analyzeAllPrompt').value;
    const confidenceThreshold = parseInt(document.getElementById('confidenceThreshold').value);
    const batchSize = parseInt(document.getElementById('batchSize').value);
    const maxComponents = parseInt(document.getElementById('maxComponents').value);
    
    // Show loading state and progress
    button.disabled = true;
    buttonText.innerHTML = 'Preparing analysis...';
    dashboard.classList.remove('visible');
    progressSection.style.display = 'block';
    progressBar.style.width = '0%';
    progressText.textContent = 'Collecting components...';
    
    let components = [];
    let results = [];
    let processedCount = 0;
    
    try {
        // Get current data
        progressText.textContent = 'Fetching kernel data...';
        const response = await fetch('/api/data');
        if (!response.ok) {
            throw new Error(`Failed to fetch data: ${response.statusText}`);
        }
        const data = await response.json();
        
        // Collect all components for analysis
        progressText.textContent = 'Collecting components...';
        components = await collectAllComponents(data);
        
        if (components.length === 0) {
            throw new Error('No components found to analyze. Please ensure kernel data is loaded.');
        }
        
        // Limit components if requested
        if (maxComponents < 999 && components.length > maxComponents) {
            components = components.slice(0, maxComponents);
        }
        
        totalCountEl.textContent = components.length;
        processedCountEl.textContent = '0';
        
        progressText.textContent = `Starting analysis of ${components.length} components...`;
        buttonText.innerHTML = `Analyzing 0/${components.length} components...`;
        
        // Process components in batches
        const actualBatchSize = batchSize === 999 ? components.length : batchSize;
        
        for (let i = 0; i < components.length; i += actualBatchSize) {
            const batch = components.slice(i, i + actualBatchSize);
            const batchNumber = Math.floor(i / actualBatchSize) + 1;
            const totalBatches = Math.ceil(components.length / actualBatchSize);
            
            progressText.textContent = `Processing batch ${batchNumber}/${totalBatches} (${batch.length} components)...`;
            
            try {
                // Process batch with timeout and retries
                const batchResults = await processBatchWithRetries(batch, model, customPrompt, 3);
                results.push(...batchResults.filter(r => r !== null));
                
                // Update progress
                processedCount = Math.min(i + batch.length, components.length);
                const progressPercent = Math.round((processedCount / components.length) * 100);
                
                progressBar.style.width = `${progressPercent}%`;
                processedCountEl.textContent = processedCount;
                buttonText.innerHTML = `Analyzing ${processedCount}/${components.length} components (${progressPercent}%)`;
                
                // Small delay between batches to be respectful to the API
                if (i + actualBatchSize < components.length) {
                    progressText.textContent = `Batch ${batchNumber} complete. Waiting before next batch...`;
                    await new Promise(resolve => setTimeout(resolve, 1500));
                }
                
            } catch (error) {
                console.error(`Error in batch ${batchNumber}:`, error);
                showNotification(`Batch ${batchNumber} failed: ${error.message}`, 'warning');
                // Continue with other batches
            }
        }
        
        progressText.textContent = 'Processing results...';
        
        // Filter and organize results
        const filteredResults = filterResultsByConfidence(results, confidenceThreshold);
        
        // Calculate statistics
        const stats = calculateAnalysisStats(results, filteredResults, components.length);
        
        // Display results
        displayComprehensiveResults(filteredResults, confidenceThreshold, stats);
        
        // Show results dashboard
        dashboard.classList.add('visible');
        progressSection.style.display = 'none';
        
        // Scroll to results
        dashboard.scrollIntoView({ behavior: 'smooth', block: 'start' });
        
        // Show success notification
        showNotification(`Analysis complete! Processed ${processedCount}/${components.length} components. Found ${filteredResults.length} high-confidence matches.`, 'success');
        
    } catch (error) {
        console.error('Error during comprehensive analysis:', error);
        progressSection.style.display = 'none';
        showNotification(`Analysis failed: ${error.message}`, 'error');
    } finally {
        // Reset button
        button.disabled = false;
        buttonText.innerHTML = 'Analyze All Components';
    }
}

async function processBatchWithRetries(batch, model, customPrompt, maxRetries = 3) {
    let lastError = null;
    
    for (let attempt = 1; attempt <= maxRetries; attempt++) {
        try {
            const promises = batch.map(component => 
                analyzeComponentWithTimeout(component, model, customPrompt, 30000) // 30 second timeout
            );
            
            return await Promise.allSettled(promises).then(results => 
                results.map(result => result.status === 'fulfilled' ? result.value : null)
            );
            
        } catch (error) {
            lastError = error;
            console.warn(`Batch attempt ${attempt}/${maxRetries} failed:`, error.message);
            
            if (attempt < maxRetries) {
                const delay = Math.pow(2, attempt) * 1000; // Exponential backoff
                await new Promise(resolve => setTimeout(resolve, delay));
            }
        }
    }
    
    throw lastError || new Error('Batch processing failed after all retries');
}

async function analyzeComponentWithTimeout(component, model, customPrompt, timeout = 30000) {
    return new Promise(async (resolve, reject) => {
        const timeoutId = setTimeout(() => {
            reject(new Error(`Analysis timeout for ${component.name}`));
        }, timeout);
        
        try {
            const result = await analyzeComponent(component, model, customPrompt);
            clearTimeout(timeoutId);
            resolve(result);
        } catch (error) {
            clearTimeout(timeoutId);
            resolve(null); // Return null instead of rejecting to continue with other components
        }
    });
}

async function collectAllComponents(data) {
    const components = [];
    
    // Add functions
    if (data.functions_by_file) {
        for (const [filePath, functions] of Object.entries(data.functions_by_file)) {
            for (const func of functions) {
                components.push({
                    type: 'function',
                    name: func.function_name,
                    filePath: filePath,
                    lineNumber: func.line_number,
                    code: func.function_code || '',
                    data: func
                });
            }
        }
    }
    
    // Add DMA operations
    if (data.dma_operations) {
        data.dma_operations.forEach((dma, index) => {
            components.push({
                type: 'dma',
                name: `${dma.dma_function} (${dma.caller_function})`,
                filePath: dma.file_path,
                lineNumber: dma.line_number,
                code: dma.function_code || '',
                data: dma
            });
        });
    }
    
    // Add user copy operations
    if (data.user_copy_operations) {
        data.user_copy_operations.forEach((userCopy, index) => {
            components.push({
                type: 'user_copy',
                name: `${userCopy.copy_function} (${userCopy.caller_function})`,
                filePath: userCopy.file_path,
                lineNumber: userCopy.line_number,
                code: userCopy.function_code || '',
                data: userCopy
            });
        });
    }
    
    // Add IOCTL operations
    if (data.ioctl_operations) {
        data.ioctl_operations.forEach((ioctl, index) => {
            components.push({
                type: 'ioctl',
                name: `${ioctl.handler_name || 'IOCTL Handler'}`,
                filePath: ioctl.file_path,
                lineNumber: ioctl.line_number,
                code: ioctl.function_code || '',
                data: ioctl
            });
        });
    }
    
    return components;
}

async function analyzeAllComponents(components, model, customPrompt) {
    const results = [];
    const batchSize = 5; // Process in batches to avoid overwhelming the API
    
    for (let i = 0; i < components.length; i += batchSize) {
        const batch = components.slice(i, i + batchSize);
        const batchPromises = batch.map(component => analyzeComponent(component, model, customPrompt));
        
        try {
            const batchResults = await Promise.all(batchPromises);
            results.push(...batchResults);
            
            // Update progress
            const progress = Math.round(((i + batch.length) / components.length) * 100);
            const buttonText = document.getElementById('analyzeAllBtnText');
            buttonText.innerHTML = `Analyzing... ${progress}% (${i + batch.length}/${components.length})`;
            
            // Small delay between batches to be respectful to the API
            if (i + batchSize < components.length) {
                await new Promise(resolve => setTimeout(resolve, 1000));
            }
        } catch (error) {
            console.error('Error in batch analysis:', error);
            // Continue with other batches even if one fails
        }
    }
    
    return results;
}

async function analyzeComponent(component, model, customPrompt) {
    try {
        let endpoint = '';
        let requestData = {};
        
        // Skip components without code
        if (!component.code || component.code.trim().length === 0) {
            return {
                component: component,
                result: { status: 'skipped', analysis: 'No source code available for analysis' },
                confidenceScores: { AIARelevantFunction: 0, Relevant_KD_Entry_Point: 0, Message_Structure_Handling: 0 }
            };
        }
        
        switch (component.type) {
            case 'function':
                endpoint = '/api/llm/analyze/function';
                requestData = {
                    function_name: component.name,
                    source_code: component.code,
                    file_path: component.filePath,
                    custom_prompt: customPrompt || 'Analyze this function for AI accelerator integration patterns',
                    model_id: model,
                    for_web_ui: true
                };
                break;
                
            case 'dma':
                endpoint = '/api/llm/analyze/function'; // Fallback to function analysis
                requestData = {
                    function_name: component.name,
                    source_code: component.code,
                    file_path: component.filePath,
                    custom_prompt: customPrompt || 'Analyze this DMA-related function for AI accelerator integration',
                    model_id: model,
                    for_web_ui: true
                };
                break;
                
            case 'user_copy':
                endpoint = '/api/llm/analyze/function'; // Fallback to function analysis
                requestData = {
                    function_name: component.name,
                    source_code: component.code,
                    file_path: component.filePath,
                    custom_prompt: customPrompt || 'Analyze this user copy function for AI accelerator data transfer patterns',
                    model_id: model,
                    for_web_ui: true
                };
                break;
                
            case 'ioctl':
                endpoint = '/api/llm/analyze/function'; // Fallback to function analysis
                requestData = {
                    function_name: component.name,
                    source_code: component.code,
                    file_path: component.filePath,
                    custom_prompt: customPrompt || 'Analyze this IOCTL handler for AI accelerator interface patterns',
                    model_id: model,
                    for_web_ui: true
                };
                break;
                
            default:
                throw new Error(`Unknown component type: ${component.type}`);
        }
        
        const response = await fetch(endpoint, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        });
        
        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`HTTP ${response.status}: ${errorText}`);
        }
        
        const result = await response.json();
        
        if (result.status !== 'success') {
            throw new Error(result.error || 'Analysis returned non-success status');
        }
        
        // Parse confidence scores from the analysis
        const confidenceScores = parseConfidenceScores(result.analysis);
        
        return {
            component: component,
            result: result,
            confidenceScores: confidenceScores
        };
        
    } catch (error) {
        console.error(`Error analyzing component ${component.name}:`, error);
        return {
            component: component,
            result: { 
                status: 'error', 
                analysis: `Analysis failed: ${error.message}`,
                error: error.message 
            },
            confidenceScores: { AIARelevantFunction: 0, Relevant_KD_Entry_Point: 0, Message_Structure_Handling: 0 }
        };
    }
}

function parseConfidenceScores(analysis) {
    const scores = {
        AIARelevantFunction: 0,
        Relevant_KD_Entry_Point: 0,
        Message_Structure_Handling: 0
    };
    
    if (!analysis) return scores;
    
    // Parse YAML-like output for confidence scores
    const lines = analysis.split('\n');
    for (const line of lines) {
        if (line.includes('AIARelevantFunction:')) {
            const match = line.match(/(\d+)/);
            if (match) scores.AIARelevantFunction = parseInt(match[1]);
        } else if (line.includes('Relevant_KD_Entry_Point:')) {
            const match = line.match(/(\d+)/);
            if (match) scores.Relevant_KD_Entry_Point = parseInt(match[1]);
        } else if (line.includes('Message_Structure_Handling:')) {
            const match = line.match(/(\d+)/);
            if (match) scores.Message_Structure_Handling = parseInt(match[1]);
        }
    }
    
    return scores;
}

function filterResultsByConfidence(results, threshold) {
    return results.filter(result => {
        const scores = result.confidenceScores;
        return scores.AIARelevantFunction >= threshold ||
               scores.Relevant_KD_Entry_Point >= threshold ||
               scores.Message_Structure_Handling >= threshold;
    });
}

function calculateAnalysisStats(allResults, filteredResults, totalComponents) {
    const stats = {
        totalComponents: totalComponents,
        analyzedComponents: allResults.length,
        successfulAnalyses: allResults.filter(r => r.result.status === 'success').length,
        skippedComponents: allResults.filter(r => r.result.status === 'skipped').length,
        failedAnalyses: allResults.filter(r => r.result.status === 'error').length,
        highConfidenceResults: filteredResults.length,
        categories: {
            AIARelevantFunction: 0,
            Relevant_KD_Entry_Point: 0,
            Message_Structure_Handling: 0
        },
        averageConfidence: {
            AIARelevantFunction: 0,
            Relevant_KD_Entry_Point: 0,
            Message_Structure_Handling: 0
        }
    };
    
    // Calculate category stats
    if (allResults.length > 0) {
        let totalAIA = 0, totalKD = 0, totalMsg = 0;
        let countAIA = 0, countKD = 0, countMsg = 0;
        
        for (const result of allResults) {
            if (result.confidenceScores) {
                const scores = result.confidenceScores;
                
                if (scores.AIARelevantFunction > 0) {
                    totalAIA += scores.AIARelevantFunction;
                    countAIA++;
                    if (scores.AIARelevantFunction >= 50) stats.categories.AIARelevantFunction++;
                }
                
                if (scores.Relevant_KD_Entry_Point > 0) {
                    totalKD += scores.Relevant_KD_Entry_Point;
                    countKD++;
                    if (scores.Relevant_KD_Entry_Point >= 50) stats.categories.Relevant_KD_Entry_Point++;
                }
                
                if (scores.Message_Structure_Handling > 0) {
                    totalMsg += scores.Message_Structure_Handling;
                    countMsg++;
                    if (scores.Message_Structure_Handling >= 50) stats.categories.Message_Structure_Handling++;
                }
            }
        }
        
        stats.averageConfidence.AIARelevantFunction = countAIA > 0 ? Math.round(totalAIA / countAIA) : 0;
        stats.averageConfidence.Relevant_KD_Entry_Point = countKD > 0 ? Math.round(totalKD / countKD) : 0;
        stats.averageConfidence.Message_Structure_Handling = countMsg > 0 ? Math.round(totalMsg / countMsg) : 0;
    }
    
    return stats;
}

function displayComprehensiveResults(results, threshold, stats) {
    const summaryContainer = document.getElementById('resultsSummary');
    const resultsContainer = document.getElementById('resultsGrid');
    const subtitle = document.getElementById('resultsSubtitle');
    
    // Update subtitle with detailed stats
    const successRate = stats.totalComponents > 0 ? Math.round((stats.successfulAnalyses / stats.totalComponents) * 100) : 0;
    subtitle.innerHTML = `
        Found <strong>${results.length}</strong> high-confidence components (≥${threshold}%) from 
        <strong>${stats.analyzedComponents}/${stats.totalComponents}</strong> analyzed 
        (<strong>${successRate}% success rate</strong>)
    `;
    
    // Create summary cards with detailed statistics
    summaryContainer.innerHTML = `
        <div class="summary-card total">
            <div class="summary-icon">📊</div>
            <div class="summary-content">
                <div class="summary-number">${stats.totalComponents}</div>
                <div class="summary-label">Total Components</div>
                <div class="summary-detail">${stats.analyzedComponents} analyzed</div>
            </div>
        </div>
        
        <div class="summary-card success">
            <div class="summary-icon">✅</div>
            <div class="summary-content">
                <div class="summary-number">${stats.successfulAnalyses}</div>
                <div class="summary-label">Successful Analyses</div>
                <div class="summary-detail">${successRate}% success rate</div>
            </div>
        </div>
        
        <div class="summary-card high-confidence">
            <div class="summary-icon">🎯</div>
            <div class="summary-content">
                <div class="summary-number">${results.length}</div>
                <div class="summary-label">High Confidence</div>
                <div class="summary-detail">≥${threshold}% confidence</div>
            </div>
        </div>
        
        <div class="summary-card categories">
            <div class="summary-icon">🏷️</div>
            <div class="summary-content">
                <div class="summary-number">${stats.categories.AIARelevantFunction + stats.categories.Relevant_KD_Entry_Point + stats.categories.Message_Structure_Handling}</div>
                <div class="summary-label">Category Matches</div>
                <div class="summary-detail">Across all categories</div>
            </div>
        </div>
    `;
    
    // Add detailed breakdown
    if (stats.failedAnalyses > 0 || stats.skippedComponents > 0) {
        summaryContainer.innerHTML += `
            <div class="summary-card warning">
                <div class="summary-icon">⚠️</div>
                <div class="summary-content">
                    <div class="summary-number">${stats.failedAnalyses + stats.skippedComponents}</div>
                    <div class="summary-label">Issues</div>
                    <div class="summary-detail">${stats.failedAnalyses} failed, ${stats.skippedComponents} skipped</div>
                </div>
            </div>
        `;
    }
    
    // Create category breakdown
    const categoryBreakdown = document.createElement('div');
    categoryBreakdown.className = 'category-breakdown';
    categoryBreakdown.innerHTML = `
        <h4>📋 Category Breakdown</h4>
        <div class="category-stats">
            <div class="category-stat">
                <div class="category-name">AIA Relevant Functions</div>
                <div class="category-count">${stats.categories.AIARelevantFunction}</div>
                <div class="category-avg">Avg: ${stats.averageConfidence.AIARelevantFunction}%</div>
            </div>
            <div class="category-stat">
                <div class="category-name">🚪 Kernel Entry Points</div>
                <div class="category-count">${stats.categories.Relevant_KD_Entry_Point}</div>
                <div class="category-avg">Avg: ${stats.averageConfidence.Relevant_KD_Entry_Point}%</div>
            </div>
            <div class="category-stat">
                <div class="category-name">📨 Message Structures</div>
                <div class="category-count">${stats.categories.Message_Structure_Handling}</div>
                <div class="category-avg">Avg: ${stats.averageConfidence.Message_Structure_Handling}%</div>
            </div>
        </div>
    `;
    summaryContainer.appendChild(categoryBreakdown);
    
    // Group results by category for better organization
    const categorizedResults = {
        AIARelevantFunction: [],
        Relevant_KD_Entry_Point: [],
        Message_Structure_Handling: [],
        Other: []
    };
    
    results.forEach(result => {
        const scores = result.confidenceScores;
        let addedToCategory = false;
        
        if (scores.AIARelevantFunction >= threshold) {
            categorizedResults.AIARelevantFunction.push(result);
            addedToCategory = true;
        }
        if (scores.Relevant_KD_Entry_Point >= threshold) {
            categorizedResults.Relevant_KD_Entry_Point.push(result);
            addedToCategory = true;
        }
        if (scores.Message_Structure_Handling >= threshold) {
            categorizedResults.Message_Structure_Handling.push(result);
            addedToCategory = true;
        }
        
        if (!addedToCategory) {
            categorizedResults.Other.push(result);
        }
    });
    
    // Sort each category by confidence score (highest to lowest)
    Object.keys(categorizedResults).forEach(category => {
        categorizedResults[category].sort((a, b) => {
            const scoreA = category === 'Other' ? 
                Math.max(...Object.values(a.confidenceScores)) : 
                a.confidenceScores[category];
            const scoreB = category === 'Other' ? 
                Math.max(...Object.values(b.confidenceScores)) : 
                b.confidenceScores[category];
            return scoreB - scoreA; // Descending order
        });
    });
    
    // Add download report button
    const downloadSection = document.createElement('div');
    downloadSection.className = 'download-section';
    downloadSection.innerHTML = `
        <div class="download-header">
            <h4>📥 Export Analysis Report</h4>
            <p>Download comprehensive analysis results in various formats</p>
        </div>
        <div class="download-buttons">
            <button class="download-btn primary" onclick="downloadAnalysisReport('json', this)" title="Download detailed JSON report">
                📄 Download JSON Report
            </button>
            <button class="download-btn secondary" onclick="downloadAnalysisReport('csv', this)" title="Download CSV summary">
                📊 Download CSV Summary
            </button>
            <button class="download-btn tertiary" onclick="downloadAnalysisReport('txt', this)" title="Download readable text report">
                📝 Download Text Report
            </button>
        </div>
    `;
    summaryContainer.appendChild(downloadSection);
    
    // Display categorized results
    resultsContainer.innerHTML = '';
    
    Object.entries(categorizedResults).forEach(([category, categoryResults]) => {
        if (categoryResults.length === 0) return;
        
        const categorySection = document.createElement('div');
        categorySection.className = 'category-section';
        
        const categoryTitle = {
            'AIARelevantFunction': 'AIA Relevant Functions',
            'Relevant_KD_Entry_Point': '🚪 Kernel Entry Points', 
            'Message_Structure_Handling': '📨 Message Structure Handling',
            'Other': 'Other High-Confidence Results'
        };
        
        // Create sorted list with rankings
        const sortedResultsHtml = categoryResults.map((result, index) => {
            const rank = index + 1;
            const score = category === 'Other' ? 
                Math.max(...Object.values(result.confidenceScores)) : 
                result.confidenceScores[category];
            return createRankedResultCard(result, rank, score, category);
        }).join('');
        
        categorySection.innerHTML = `
            <div class="category-header">
                <h3 class="category-title">${categoryTitle[category]} (${categoryResults.length})</h3>
                <div class="category-subtitle">Sorted by confidence score (highest to lowest)</div>
            </div>
            <div class="category-results ranked-results">
                ${sortedResultsHtml}
            </div>
        `;
        
        resultsContainer.appendChild(categorySection);
    });
    
    // Store results globally for download functionality
    window.comprehensiveAnalysisResults = {
        results: results,
        categorizedResults: categorizedResults,
        stats: stats,
        threshold: threshold,
        timestamp: new Date().toISOString()
    };
}

function createResultsSummary(results) {
    const summary = {
        'High AIA Relevance (75%+)': { count: 0 },
        'Entry Points (75%+)': { count: 0 },
        'Message Handling (75%+)': { count: 0 },
        'Total Analyzed': { count: results.length }
    };
    
    results.forEach(result => {
        const scores = result.confidenceScores;
        if (scores.AIARelevantFunction >= 75) summary['High AIA Relevance (75%+)'].count++;
        if (scores.Relevant_KD_Entry_Point >= 75) summary['Entry Points (75%+)'].count++;
        if (scores.Message_Structure_Handling >= 75) summary['Message Handling (75%+)'].count++;
    });
    
    return summary;
}

function createResultCard(result) {
    const component = result.component;
    const scores = result.confidenceScores;
    
    const card = document.createElement('div');
    card.className = 'result-card';
    
    const maxScore = Math.max(...Object.values(scores));
    const getConfidenceClass = (score) => {
        if (score >= 75) return 'high';
        if (score >= 50) return 'medium';
        return 'low';
    };
    
    card.innerHTML = `
        <h4>
            ${component.type.toUpperCase()}: ${component.name}
            <small style="opacity: 0.7; font-weight: normal;">(${component.filePath}:${component.lineNumber})</small>
        </h4>
        
        <div class="confidence-bars">
            <div class="confidence-bar">
                <span class="confidence-label">AIA Relevant Function</span>
                <div class="confidence-meter">
                    <div class="confidence-fill ${getConfidenceClass(scores.AIARelevantFunction)}" 
                         style="width: ${scores.AIARelevantFunction}%"></div>
                </div>
                <span class="confidence-value">${scores.AIARelevantFunction}%</span>
            </div>
            
            <div class="confidence-bar">
                <span class="confidence-label">Entry Point</span>
                <div class="confidence-meter">
                    <div class="confidence-fill ${getConfidenceClass(scores.Relevant_KD_Entry_Point)}" 
                         style="width: ${scores.Relevant_KD_Entry_Point}%"></div>
                </div>
                <span class="confidence-value">${scores.Relevant_KD_Entry_Point}%</span>
            </div>
            
            <div class="confidence-bar">
                <span class="confidence-label">Message Handling</span>
                <div class="confidence-meter">
                    <div class="confidence-fill ${getConfidenceClass(scores.Message_Structure_Handling)}" 
                         style="width: ${scores.Message_Structure_Handling}%"></div>
                </div>
                <span class="confidence-value">${scores.Message_Structure_Handling}%</span>
            </div>
        </div>
        
        <div class="result-details">
            <strong>Analysis Summary:</strong><br>
            ${result.result.analysis ? result.result.analysis.substring(0, 200) + '...' : 'Analysis not available'}
        </div>
    `;
    
    return card;
}

// Enhanced ranked result card for sorted display
function createRankedResultCard(result, rank, score, category) {
    const component = result.component;
    const scores = result.confidenceScores;
    
    const rankBadge = rank <= 3 ? `<span class="rank-badge top-rank rank-${rank}">🥇</span>` :
                     rank <= 5 ? `<span class="rank-badge high-rank">#${rank}</span>` :
                     `<span class="rank-badge">#${rank}</span>`;
    
    const scoreClass = score >= 90 ? 'excellent' : 
                      score >= 75 ? 'high' : 
                      score >= 50 ? 'medium' : 'low';
    
    return `
        <div class="ranked-result-card ${scoreClass}">
            <div class="rank-header">
                ${rankBadge}
                <div class="primary-score">
                    <span class="score-value">${score}%</span>
                    <span class="score-label">${category.replace('_', ' ')}</span>
                </div>
            </div>
            
            <div class="component-info">
                <div class="component-title">
                    <strong>${component.name || 'Unknown'}</strong>
                </div>
                <div class="component-details">
                    <span class="file-path">📁 ${component.filePath || 'Unknown file'}</span>
                    ${component.lineNumber ? `<span class="line-number">Line ${component.lineNumber}</span>` : ''}
                </div>
            </div>
            
            <div class="all-scores">
                <div class="score-item">
                    <span class="score-name">AIA Relevant</span>
                    <span class="score-bar">
                        <span class="score-fill" style="width: ${scores.AIARelevantFunction}%"></span>
                    </span>
                    <span class="score-text">${scores.AIARelevantFunction}%</span>
                </div>
                <div class="score-item">
                    <span class="score-name">Entry Point</span>
                    <span class="score-bar">
                        <span class="score-fill" style="width: ${scores.Relevant_KD_Entry_Point}%"></span>
                    </span>
                    <span class="score-text">${scores.Relevant_KD_Entry_Point}%</span>
                </div>
                <div class="score-item">
                    <span class="score-name">Message Structure</span>
                    <span class="score-bar">
                        <span class="score-fill" style="width: ${scores.Message_Structure_Handling}%"></span>
                    </span>
                    <span class="score-text">${scores.Message_Structure_Handling}%</span>
                </div>
            </div>
            
            <div class="analysis-preview">
                <strong>Analysis:</strong>
                <p>${result.result.analysis ? result.result.analysis.substring(0, 150) + '...' : 'Analysis not available'}</p>
            </div>
            
            <div class="card-actions">
                <button class="btn-small" onclick="viewFullAnalysis(${JSON.stringify(result).replace(/"/g, '&quot;')})">
                    📄 View Full Analysis
                </button>
                <button class="btn-small" onclick="copyToClipboard('${(component.name || 'component').replace(/'/g, '\\\'').replace(/"/g, '&quot;')}', '${score}%')">
                    📋 Copy Summary
                </button>
            </div>
        </div>
    `;
}

// Download analysis report in various formats
async function downloadAnalysisReport(format, button) {
    if (!window.comprehensiveAnalysisResults) {
        alert('No analysis results available to download');
        return;
    }
    
    const originalText = button.innerHTML;
    button.innerHTML = '⏳ Preparing...';
    button.disabled = true;
    
    try {
        const data = window.comprehensiveAnalysisResults;
        const timestamp = new Date().toISOString().split('T')[0];
        let filename, content, mimeType;
        
        switch (format) {
            case 'json':
                filename = `aia-analysis-${timestamp}.json`;
                content = JSON.stringify({
                    metadata: {
                        generatedAt: data.timestamp,
                        totalResults: data.results.length,
                        confidenceThreshold: data.threshold,
                        categories: Object.keys(data.categorizedResults).map(cat => ({
                            name: cat,
                            count: data.categorizedResults[cat].length
                        }))
                    },
                    summary: data.stats,
                    categorizedResults: data.categorizedResults,
                    allResults: data.results
                }, null, 2);
                mimeType = 'application/json';
                break;
                
            case 'csv':
                filename = `aia-analysis-summary-${timestamp}.csv`;
                content = generateCSVReport(data);
                mimeType = 'text/csv';
                break;
                
            case 'txt':
                filename = `aia-analysis-report-${timestamp}.txt`;
                content = generateTextReport(data);
                mimeType = 'text/plain';
                break;
                
            default:
                throw new Error('Unknown format');
        }
        
        // Create and download file
        const blob = new Blob([content], { type: mimeType });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
        
        // Show success message
        button.innerHTML = '✅ Downloaded!';
        setTimeout(() => {
            button.innerHTML = originalText;
            button.disabled = false;
        }, 2000);
        
    } catch (error) {
        console.error('Download failed:', error);
        button.innerHTML = '❌ Failed';
        setTimeout(() => {
            button.innerHTML = originalText;
            button.disabled = false;
        }, 2000);
    }
}

// Generate CSV report
function generateCSVReport(data) {
    const headers = [
        'Rank', 'Category', 'Function Name', 'File Path', 'Line Number',
        'AIA Relevant %', 'Entry Point %', 'Message Structure %', 'Max Score %',
        'Analysis Summary'
    ];
    
    let csv = headers.join(',') + '\n';
    
    Object.entries(data.categorizedResults).forEach(([category, results]) => {
        results.forEach((result, index) => {
            const component = result.component;
            const scores = result.confidenceScores;
            const maxScore = Math.max(...Object.values(scores));
            
            const row = [
                index + 1,
                category.replace('_', ' '),
                `"${component.name || 'Unknown'}"`,
                `"${component.filePath || 'Unknown'}"`,
                component.lineNumber || '',
                scores.AIARelevantFunction,
                scores.Relevant_KD_Entry_Point,
                scores.Message_Structure_Handling,
                maxScore,
                `"${result.result.analysis ? result.result.analysis.replace(/"/g, '""').substring(0, 100) + '...' : 'N/A'}"`
            ];
            
            csv += row.join(',') + '\n';
        });
    });
    
    return csv;
}

// Generate text report
function generateTextReport(data) {
    const report = [];
    report.push('='.repeat(80));
    report.push('AIA KERNEL INTEGRATION ANALYSIS REPORT');
    report.push('='.repeat(80));
    report.push('');
    report.push(`Generated: ${new Date(data.timestamp).toLocaleString()}`);
    report.push(`Total Components Analyzed: ${data.stats.totalComponents}`);
    report.push(`Successful Analyses: ${data.stats.successfulAnalyses}`);
    report.push(`Confidence Threshold: ${data.threshold}%`);
    report.push('');
    
    report.push('SUMMARY STATISTICS:');
    report.push('-'.repeat(40));
    report.push(`• AIA Relevant Functions: ${data.stats.categories.AIARelevantFunction} (avg: ${data.stats.averageConfidence.AIARelevantFunction}%)`);
    report.push(`• Kernel Entry Points: ${data.stats.categories.Relevant_KD_Entry_Point} (avg: ${data.stats.averageConfidence.Relevant_KD_Entry_Point}%)`);
    report.push(`• Message Structures: ${data.stats.categories.Message_Structure_Handling} (avg: ${data.stats.averageConfidence.Message_Structure_Handling}%)`);
    report.push('');
    
    Object.entries(data.categorizedResults).forEach(([category, results]) => {
        if (results.length === 0) return;
        
        const categoryTitle = {
            'AIARelevantFunction': 'AIA RELEVANT FUNCTIONS',
            'Relevant_KD_Entry_Point': 'KERNEL ENTRY POINTS',
            'Message_Structure_Handling': 'MESSAGE STRUCTURE HANDLING',
            'Other': 'OTHER HIGH-CONFIDENCE RESULTS'
        };
        
        report.push(categoryTitle[category]);
        report.push('='.repeat(categoryTitle[category].length));
        report.push('');
        
        results.forEach((result, index) => {
            const component = result.component;
            const scores = result.confidenceScores;
            const score = category === 'Other' ? 
                Math.max(...Object.values(scores)) : 
                scores[category];
            
            report.push(`${index + 1}. ${component.name || 'Unknown'}`);
            report.push(`   File: ${component.filePath || 'Unknown'}`);
            if (component.lineNumber) report.push(`   Line: ${component.lineNumber}`);
            report.push(`   Score: ${score}%`);
            report.push(`   Confidence Breakdown:`);
            report.push(`     - AIA Relevant: ${scores.AIARelevantFunction}%`);
            report.push(`     - Entry Point: ${scores.Relevant_KD_Entry_Point}%`);
            report.push(`     - Message Structure: ${scores.Message_Structure_Handling}%`);
            if (result.result.analysis) {
                report.push(`   Analysis: ${result.result.analysis.substring(0, 200)}...`);
            }
            report.push('');
        });
    });
    
    return report.join('\n');
}

// Download analysis results function
function downloadAnalysisResults(format) {
    if (!window.comprehensiveAnalysisResults) {
        showNotification('No analysis results available to download', 'error');
        return;
    }
    
    try {
        const data = window.comprehensiveAnalysisResults;
        const timestamp = new Date().toISOString().split('T')[0];
        let filename, content, mimeType;
        
        switch (format) {
            case 'json':
                filename = `aia-analysis-comprehensive-${timestamp}.json`;
                content = JSON.stringify({
                    metadata: {
                        generatedAt: data.timestamp,
                        totalResults: data.results.length,
                        confidenceThreshold: data.threshold,
                        totalComponents: data.stats.totalComponents,
                        successfulAnalyses: data.stats.successfulAnalyses,
                        categories: Object.keys(data.categorizedResults).map(cat => ({
                            name: cat,
                            count: data.categorizedResults[cat].length
                        }))
                    },
                    summary: data.stats,
                    categorizedResults: data.categorizedResults,
                    allResults: data.results
                }, null, 2);
                mimeType = 'application/json';
                break;
                
            case 'csv':
                filename = `aia-analysis-summary-${timestamp}.csv`;
                content = generateCSVReport(data);
                mimeType = 'text/csv';
                break;
                
            case 'html':
                filename = `aia-analysis-report-${timestamp}.html`;
                content = generateHTMLReport(data);
                mimeType = 'text/html';
                break;
                
            default:
                throw new Error(`Unknown format: ${format}`);
        }
        
        // Create and download file
        const blob = new Blob([content], { type: mimeType });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
        
        showNotification(`Analysis results downloaded as ${filename}`, 'success');
        
    } catch (error) {
        console.error('Download failed:', error);
        showNotification(`Download failed: ${error.message}`, 'error');
    }
}

// Generate HTML report
function generateHTMLReport(data) {
    const timestamp = new Date(data.timestamp).toLocaleString();
    const successRate = data.stats.totalComponents > 0 ? 
        Math.round((data.stats.successfulAnalyses / data.stats.totalComponents) * 100) : 0;
    
    let html = `<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AIA Kernel Integration Analysis Report</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; margin: 20px; background: #f5f5f5; }
        .container { max-width: 1200px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h1 { color: #2c3e50; border-bottom: 3px solid #3498db; padding-bottom: 10px; }
        h2 { color: #34495e; margin-top: 30px; }
        .stats-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin: 20px 0; }
        .stat-card { background: #ecf0f1; padding: 20px; border-radius: 8px; text-align: center; }
        .stat-number { font-size: 2em; font-weight: bold; color: #2980b9; }
        .stat-label { color: #7f8c8d; margin-top: 5px; }
        .category-section { margin: 30px 0; border: 1px solid #bdc3c7; border-radius: 8px; overflow: hidden; }
        .category-header { background: #3498db; color: white; padding: 15px; }
        .result-item { padding: 15px; border-bottom: 1px solid #ecf0f1; }
        .result-item:last-child { border-bottom: none; }
        .confidence-bars { margin: 10px 0; }
        .confidence-bar { display: flex; align-items: center; margin: 5px 0; }
        .confidence-label { width: 120px; font-size: 0.9em; }
        .confidence-meter { flex: 1; height: 20px; background: #ecf0f1; border-radius: 10px; margin: 0 10px; overflow: hidden; }
        .confidence-fill { height: 100%; border-radius: 10px; }
        .confidence-fill.high { background: #27ae60; }
        .confidence-fill.medium { background: #f39c12; }
        .confidence-fill.low { background: #e74c3c; }
        .confidence-value { width: 40px; text-align: center; font-weight: bold; }
        .rank-badge { background: #f39c12; color: white; padding: 2px 8px; border-radius: 12px; font-size: 0.8em; font-weight: bold; }
        .rank-badge.top-rank { background: #e74c3c; }
        .analysis-text { background: #f8f9fa; padding: 10px; border-radius: 5px; margin-top: 10px; font-size: 0.9em; }
    </style>
</head>
<body>
    <div class="container">
        <h1>AIA Kernel Integration Analysis Report</h1>
        <p><strong>Generated:</strong> ${timestamp}</p>
        
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-number">${data.stats.totalComponents}</div>
                <div class="stat-label">Total Components</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">${data.stats.successfulAnalyses}</div>
                <div class="stat-label">Successful Analyses</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">${data.results.length}</div>
                <div class="stat-label">High Confidence Results</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">${successRate}%</div>
                <div class="stat-label">Success Rate</div>
            </div>
        </div>
        
        <h2>📊 Category Summary</h2>
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-number">${data.stats.categories.AIARelevantFunction}</div>
                <div class="stat-label">AIA Relevant Functions</div>
                <div style="font-size: 0.8em; color: #7f8c8d;">Avg: ${data.stats.averageConfidence.AIARelevantFunction}%</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">${data.stats.categories.Relevant_KD_Entry_Point}</div>
                <div class="stat-label">Kernel Entry Points</div>
                <div style="font-size: 0.8em; color: #7f8c8d;">Avg: ${data.stats.averageConfidence.Relevant_KD_Entry_Point}%</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">${data.stats.categories.Message_Structure_Handling}</div>
                <div class="stat-label">Message Structures</div>
                <div style="font-size: 0.8em; color: #7f8c8d;">Avg: ${data.stats.averageConfidence.Message_Structure_Handling}%</div>
            </div>
        </div>`;
    
    // Add categorized results
    Object.entries(data.categorizedResults).forEach(([category, results]) => {
        if (results.length === 0) return;
        
        const categoryTitles = {
            'AIARelevantFunction': 'AIA Relevant Functions',
            'Relevant_KD_Entry_Point': '🚪 Kernel Entry Points',
            'Message_Structure_Handling': '📨 Message Structure Handling',
            'Other': 'Other High-Confidence Results'
        };
        
        html += `
        <div class="category-section">
            <div class="category-header">
                <h3>${categoryTitles[category]} (${results.length} items)</h3>
            </div>`;
        
        results.forEach((result, index) => {
            const component = result.component;
            const scores = result.confidenceScores;
            const score = category === 'Other' ? 
                Math.max(...Object.values(scores)) : 
                scores[category];
            
            const getConfidenceClass = (score) => score >= 75 ? 'high' : score >= 50 ? 'medium' : 'low';
            
            html += `
            <div class="result-item">
                <div style="display: flex; justify-content: space-between; align-items: center;">
                    <h4 style="margin: 0;">${component.name || 'Unknown Component'}</h4>
                    <span class="rank-badge ${index < 3 ? 'top-rank' : ''}">#${index + 1} (${score}%)</span>
                </div>
                <p style="margin: 5px 0; color: #7f8c8d;">📁 ${component.filePath || 'Unknown file'}${component.lineNumber ? ` Line ${component.lineNumber}` : ''}</p>
                
                <div class="confidence-bars">
                    <div class="confidence-bar">
                        <span class="confidence-label">AIA Relevant:</span>
                        <div class="confidence-meter">
                            <div class="confidence-fill ${getConfidenceClass(scores.AIARelevantFunction)}" 
                                 style="width: ${scores.AIARelevantFunction}%"></div>
                        </div>
                        <span class="confidence-value">${scores.AIARelevantFunction}%</span>
                    </div>
                    <div class="confidence-bar">
                        <span class="confidence-label">Entry Point:</span>
                        <div class="confidence-meter">
                            <div class="confidence-fill ${getConfidenceClass(scores.Relevant_KD_Entry_Point)}" 
                                 style="width: ${scores.Relevant_KD_Entry_Point}%"></div>
                        </div>
                        <span class="confidence-value">${scores.Relevant_KD_Entry_Point}%</span>
                    </div>
                    <div class="confidence-bar">
                        <span class="confidence-label">Message Structure:</span>
                        <div class="confidence-meter">
                            <div class="confidence-fill ${getConfidenceClass(scores.Message_Structure_Handling)}" 
                                 style="width: ${scores.Message_Structure_Handling}%"></div>
                        </div>
                        <span class="confidence-value">${scores.Message_Structure_Handling}%</span>
                    </div>
                </div>
                
                <div class="analysis-text">
                    <strong>Analysis:</strong><br>
                    ${result.result.analysis || 'Analysis not available'}
                </div>
            </div>`;
        });
        
        html += `</div>`;
    });
    
    html += `
        <div style="margin-top: 40px; padding: 20px; background: #ecf0f1; border-radius: 8px; text-align: center;">
            <p><strong>Report Generated by AIA Kernel Integration Analysis Tool</strong></p>
            <p style="color: #7f8c8d; font-size: 0.9em;">For technical support, please refer to the tool documentation.</p>
        </div>
    </div>
</body>
</html>`;
    
    return html;
}

// Utility functions
function viewFullAnalysis(result) {
    const modal = document.createElement('div');
    modal.className = 'analysis-modal';
    modal.innerHTML = `
        <div class="modal-content">
            <div class="modal-header">
                <h3>Full Analysis Details</h3>
                <button class="close-btn" onclick="this.closest('.analysis-modal').remove()">×</button>
            </div>
            <div class="modal-body">
                <h4>${result.component.name || 'Component'}</h4>
                <p><strong>File:</strong> ${result.component.filePath || 'Unknown'}</p>
                ${result.component.lineNumber ? `<p><strong>Line:</strong> ${result.component.lineNumber}</p>` : ''}
                <div class="confidence-details">
                    <h5>Confidence Scores:</h5>
                    <ul>
                        <li>AIA Relevant Function: ${result.confidenceScores.AIARelevantFunction}%</li>
                        <li>Kernel Entry Point: ${result.confidenceScores.Relevant_KD_Entry_Point}%</li>
                        <li>Message Structure: ${result.confidenceScores.Message_Structure_Handling}%</li>
                    </ul>
                </div>
                <div class="full-analysis">
                    <h5>Complete Analysis:</h5>
                    <p>${result.result.analysis || 'Analysis not available'}</p>
                </div>
                ${result.component.code ? `
                    <div class="source-code">
                        <h5>Source Code:</h5>
                        <pre><code>${result.component.code}</code></pre>
                    </div>
                ` : ''}
            </div>
        </div>
    `;
    document.body.appendChild(modal);
}

function copyToClipboard(name, score) {
    const text = `${name} - Score: ${score}`;
    navigator.clipboard.writeText(text).then(() => {
        // Show temporary tooltip
        const tooltip = document.createElement('div');
        tooltip.textContent = 'Copied to clipboard!';
        tooltip.style.cssText = 'position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: #333; color: white; padding: 8px 12px; border-radius: 4px; z-index: 10000; pointer-events: none;';
        document.body.appendChild(tooltip);
        setTimeout(() => document.body.removeChild(tooltip), 1500);
    });
}
