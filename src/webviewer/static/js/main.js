// Kernel Log Analysis Web UI - Main JavaScript Functions

// Global state
let currentData = null;
let llmStatus = {
    available: false,
    models: []
};

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
            loadFunctionCode(functionName, filePath, lineNumber)
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
    
    // Build query parameters
    const params = new URLSearchParams({
        name: functionName,
        file: filePath,
        line: lineNumber
    });
    
    fetch(`/api/function-code?${params}`)
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                codeContainer.textContent = `Error: ${data.error}`;
            } else {
                codeContainer.textContent = data.function_code || 'No source code available';
            }
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
function loadFunctionCode(element, functionName, filePath, lineNumber) {
    // This function is called when function details are expanded
    console.log(`Loading function code for: ${functionName} in ${filePath}:${lineNumber}`);
    
    // Make API call to get function code if needed
    fetch(`/api/function-code?name=${encodeURIComponent(functionName)}&file=${encodeURIComponent(filePath)}&line=${lineNumber}`)
        .then(response => response.json())
        .then(data => {
            if (data.function_code) {
                const codeElement = element.querySelector('code');
                if (codeElement) {
                    codeElement.textContent = data.function_code;
                }
            }
        })
        .catch(error => {
            console.error('Error loading function code:', error);
        });
}

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
    fetch(`/api/function-code?name=${encodeURIComponent(functionName)}&file=${encodeURIComponent(filePath)}&line=${lineNumber}`)
        .then(response => response.json())
        .then(data => {
            if (data.function_code) {
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
                    functionCode.value = data.function_code;
                }
                
                // Set default prompt
                const customPrompt = document.getElementById('customPrompt');
                if (customPrompt) {
                    customPrompt.value = 'Analyze this function for AI Accelerator (AIA) integration patterns: memory sharing with AI accelerators, DMA operations, and entry points for AIA communication.';
                }
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
                    if (dmaOp.stack_trace && dmaOp.stack_trace.length > 0) {
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
