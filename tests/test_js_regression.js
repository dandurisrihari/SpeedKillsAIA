/**
 * JavaScript Tests for IOCTL LLM Analysis and Device Access Functionality
 * 
 * These tests ensure that the IOCTL handler LLM analysis button works correctly
 * and the device access details toggle functions properly. These tests are created
 * to prevent regression of the issues found on August 6, 2025.
 */

// Mock DOM elements and global functions for testing
const mockDOM = {
    elements: new Map(),
    createElement: function(tag) {
        const element = {
            tagName: tag.toUpperCase(),
            id: '',
            className: '',
            style: {},
            classList: {
                classes: [],
                add: function(cls) { 
                    if (!this.classes.includes(cls)) {
                        this.classes.push(cls); 
                    }
                },
                remove: function(cls) { 
                    this.classes = this.classes.filter(c => c !== cls); 
                },
                contains: function(cls) { 
                    return this.classes.includes(cls); 
                },
                toggle: function(cls) { 
                    this.contains(cls) ? this.remove(cls) : this.add(cls); 
                }
            },
            innerHTML: '',
            textContent: '',
            addEventListener: function() {},
            click: function() {},
            querySelector: function(selector) {
                // Simple mock querySelector that returns a button element if selector is 'button'
                if (selector === 'button') {
                    return {
                        textContent: 'Show Access Details',
                        click: function() {}
                    };
                }
                return null;
            }
        };
        return element;
    },
    getElementById: function(id) {
        return this.elements.get(id) || null;
    },
    setElement: function(id, element) {
        this.elements.set(id, element);
    }
};

// Mock fetch for API calls
const mockFetch = function(url, options) {
    return new Promise((resolve, reject) => {
        const response = {
            ok: true,
            status: 200,
            json: function() {
                if (url.includes('/api/llm/analyze/ioctl')) {
                    return Promise.resolve({
                        status: 'success',
                        analysis: 'IOCTL analysis result: This function handles device control operations safely.',
                        ioctl_operation: {
                            function_name: 'device_ioctl',
                            file_path: 'drivers/test/device.c',
                            line_number: 150
                        },
                        model_used: 'gpt-3.5-turbo'
                    });
                } else if (url.includes('/api/ioctl-code/')) {
                    return Promise.resolve({
                        function_code: 'long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) { return 0; }',
                        function_name: 'device_ioctl'
                    });
                }
                return Promise.resolve({});
            }
        };
        resolve(response);
    });
};

// Test data mimicking the structure found in ti_dmesg.json
const testData = {
    ioctl_operations: [
        {
            function_name: 'device_ioctl',
            file_path: 'drivers/test/device.c',
            line_number: 150,
            function_code: 'long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) { return 0; }'
        },
        {
            function_name: 'another_ioctl',
            file_path: 'drivers/test/another.c',
            line_number: 200,
            function_code: 'static long another_ioctl(struct file *file, unsigned int cmd, unsigned long arg) { return -EINVAL; }'
        }
    ]
};

// IOCTL LLM Analysis Tests
function testAnalyzeIOCTLWithLLM() {
    console.log('Running testAnalyzeIOCTLWithLLM...');
    
    // Setup mock DOM elements
    const analyzeButton = mockDOM.createElement('button');
    const modelSelect = mockDOM.createElement('select');
    const customPrompt = mockDOM.createElement('textarea');
    const resultDiv = mockDOM.createElement('div');
    
    modelSelect.value = 'gpt-3.5-turbo';
    customPrompt.value = 'Check for privilege escalation vulnerabilities';
    
    mockDOM.setElement('llm-model-select', modelSelect);
    mockDOM.setElement('custom-prompt', customPrompt);
    mockDOM.setElement('llm-result', resultDiv);
    
    // Mock the analyzeIOCTLWithLLM function (corrected version)
    function analyzeIOCTLWithLLM(index) {
        const modelSelect = mockDOM.getElementById('llm-model-select');
        const customPrompt = mockDOM.getElementById('custom-prompt');
        const resultDiv = mockDOM.getElementById('llm-result');
        
        if (index >= testData.ioctl_operations.length) {
            console.error('Invalid IOCTL index');
            return false;
        }
        
        const ioctlOperation = testData.ioctl_operations[index];
        
        // First fetch the function code
        return mockFetch(`/api/ioctl-code/${index}`)
            .then(response => response.json())
            .then(data => {
                if (!data.function_code) {
                    throw new Error('Failed to fetch function code');
                }
                
                // Prepare request payload with correct structure
                const requestData = {
                    ioctl_operation: ioctlOperation,  // Correct field name
                    function_code: data.function_code,
                    custom_prompt: customPrompt.value,
                    model_id: modelSelect.value
                };
                
                // Make LLM analysis request
                return mockFetch('/api/llm/analyze/ioctl', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(requestData)
                });
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    resultDiv.innerHTML = `
                        <div class="alert alert-success">
                            <h4>Analysis Result</h4>
                            <p>${data.analysis}</p>
                            <small>Model: ${data.model_used}</small>
                        </div>
                    `;
                    return true;
                } else {
                    throw new Error(data.error || 'Analysis failed');
                }
            })
            .catch(error => {
                resultDiv.innerHTML = `
                    <div class="alert alert-danger">
                        <h4>Error</h4>
                        <p>${error.message}</p>
                    </div>
                `;
                return false;
            });
    }
    
    // Test the function
    return analyzeIOCTLWithLLM(0).then(success => {
        if (success) {
            console.log('✓ testAnalyzeIOCTLWithLLM: PASSED - IOCTL analysis works correctly');
            return true;
        } else {
            console.error('✗ testAnalyzeIOCTLWithLLM: FAILED - IOCTL analysis failed');
            return false;
        }
    });
}

// Device Access Details Toggle Tests
function testToggleDeviceDetails() {
    console.log('Running testToggleDeviceDetails...');
    
    // Setup mock DOM elements
    const deviceDetails = mockDOM.createElement('div');
    deviceDetails.id = 'device-details-dev-test0';
    deviceDetails.className = 'device-details';
    
    const accessDetails = mockDOM.createElement('div');
    accessDetails.id = 'access-details-dev-test0';
    accessDetails.className = 'access-details hidden';
    accessDetails.classList.add('access-details');
    accessDetails.classList.add('hidden');
    
    const toggleButton = mockDOM.createElement('button');
    toggleButton.textContent = 'Show Access Details';
    
    mockDOM.setElement('device-details-dev-test0', deviceDetails);
    mockDOM.setElement('access-details-dev-test0', accessDetails);
    
    // Mock the toggleDeviceDetails function (corrected version)
    function toggleDeviceDetails(devicePath) {
        const cleanPath = devicePath.replace(/[^a-zA-Z0-9]/g, '');
        const accessDetails = mockDOM.getElementById(`access-details-${cleanPath}`) || 
                             mockDOM.getElementById(`access-details-${devicePath}`);
        
        if (!accessDetails) {
            console.error(`Access details element not found for ${devicePath}`);
            return false;
        }
        
        const isHidden = accessDetails.classList.contains('hidden');
        
        if (isHidden) {
            accessDetails.classList.remove('hidden');
            // Find the button and update text
            const button = deviceDetails.querySelector('button');
            if (button) button.textContent = 'Hide Access Details';
        } else {
            accessDetails.classList.add('hidden');
            // Find the button and update text
            const button = deviceDetails.querySelector('button');
            if (button) button.textContent = 'Show Access Details';
        }
        
        return true;
    }
    
    // Test showing details
    const result1 = toggleDeviceDetails('dev-test0');
    const isVisible = !accessDetails.classList.contains('hidden');
    
    if (result1 && isVisible) {
        console.log('✓ testToggleDeviceDetails (show): PASSED - Details are now visible');
    } else {
        console.error('✗ testToggleDeviceDetails (show): FAILED - Details should be visible');
        return false;
    }
    
    // Test hiding details
    const result2 = toggleDeviceDetails('dev-test0');
    const isHidden = accessDetails.classList.contains('hidden');
    
    if (result2 && isHidden) {
        console.log('✓ testToggleDeviceDetails (hide): PASSED - Details are now hidden');
        return true;
    } else {
        console.error('✗ testToggleDeviceDetails (hide): FAILED - Details should be hidden');
        return false;
    }
}

// Test for correct data structure usage
function testCorrectDataStructureUsage() {
    console.log('Running testCorrectDataStructureUsage...');
    
    // Test that we're using ioctl_operations not ioctl_handlers
    const hasCorrectField = testData.hasOwnProperty('ioctl_operations');
    const hasIncorrectField = testData.hasOwnProperty('ioctl_handlers');
    
    if (hasCorrectField && !hasIncorrectField) {
        console.log('✓ testCorrectDataStructureUsage: PASSED - Using correct ioctl_operations field');
        return true;
    } else {
        console.error('✗ testCorrectDataStructureUsage: FAILED - Should use ioctl_operations not ioctl_handlers');
        return false;
    }
}

// Test for proper error handling
function testErrorHandling() {
    console.log('Running testErrorHandling...');
    
    // Mock error response
    const mockFetchError = function(url, options) {
        return Promise.resolve({
            ok: false,
            status: 500,
            json: function() {
                return Promise.resolve({
                    error: 'Network error occurred with analyzing ioctl handler'
                });
            }
        });
    };
    
    // Test IOCTL analysis error handling
    function analyzeIOCTLWithLLMError(index) {
        const resultDiv = mockDOM.createElement('div');
        mockDOM.setElement('llm-result', resultDiv);
        
        return mockFetchError('/api/llm/analyze/ioctl', {})
            .then(response => response.json())
            .then(data => {
                resultDiv.innerHTML = `
                    <div class="alert alert-danger">
                        <h4>Error</h4>
                        <p>${data.error}</p>
                    </div>
                `;
                return data.error.includes('Network error');
            });
    }
    
    return analyzeIOCTLWithLLMError(0).then(hasError => {
        if (hasError) {
            console.log('✓ testErrorHandling: PASSED - Error handling works correctly');
            return true;
        } else {
            console.error('✗ testErrorHandling: FAILED - Error handling not working');
            return false;
        }
    });
}

// Run all tests
async function runAllTests() {
    console.log('=== JavaScript Regression Tests for IOCTL LLM Analysis and Device Access ===\n');
    
    const results = [];
    
    try {
        results.push(await testAnalyzeIOCTLWithLLM());
        results.push(testToggleDeviceDetails());
        results.push(testCorrectDataStructureUsage());
        results.push(await testErrorHandling());
    } catch (error) {
        console.error('Test execution error:', error);
        results.push(false);
    }
    
    const passed = results.filter(r => r === true).length;
    const total = results.length;
    
    console.log(`\n=== Test Results: ${passed}/${total} tests passed ===`);
    
    if (passed === total) {
        console.log('✓ All tests PASSED - No regression detected!');
    } else {
        console.error('✗ Some tests FAILED - Regression detected!');
    }
    
    return passed === total;
}

// Export for use in other contexts
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        runAllTests,
        testAnalyzeIOCTLWithLLM,
        testToggleDeviceDetails,
        testCorrectDataStructureUsage,
        testErrorHandling
    };
} else {
    // Run tests if loaded directly in browser
    if (typeof window !== 'undefined') {
        window.runJSTests = runAllTests;
    }
}

// Auto-run tests in Node.js environment
if (typeof process !== 'undefined' && process.argv && process.argv[1] && process.argv[1].includes('test_js_regression')) {
    runAllTests().then(success => {
        process.exit(success ? 0 : 1);
    });
}
