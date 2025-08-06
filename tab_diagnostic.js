// JavaScript Diagnostic Script for Tab Navigation
// Add this to browser console to debug tab issues

console.log("🔍 Tab Navigation Diagnostic Started");

// Check if showTab function exists
if (typeof showTab === 'function') {
    console.log("✅ showTab function exists");
} else {
    console.log("❌ showTab function NOT found");
}

// Check if tab buttons exist
const tabButtons = document.querySelectorAll('.tab');
console.log(`📋 Found ${tabButtons.length} tab buttons`);

tabButtons.forEach((button, index) => {
    console.log(`Tab ${index + 1}: ${button.textContent.trim()}`);
    console.log(`  - onclick: ${button.getAttribute('onclick')}`);
    console.log(`  - cursor style: ${getComputedStyle(button).cursor}`);
    console.log(`  - pointer-events: ${getComputedStyle(button).pointerEvents}`);
});

// Check if tab contents exist
const tabContents = document.querySelectorAll('.tab-content');
console.log(`📄 Found ${tabContents.length} tab content areas`);

tabContents.forEach((content, index) => {
    console.log(`Content ${index + 1}: ${content.id}`);
    console.log(`  - display: ${getComputedStyle(content).display}`);
    console.log(`  - active class: ${content.classList.contains('active')}`);
});

// Test clicking each tab programmatically
function testTabClicking() {
    console.log("🧪 Testing tab clicking programmatically...");
    
    tabButtons.forEach((button, index) => {
        setTimeout(() => {
            try {
                console.log(`Clicking tab ${index + 1}: ${button.textContent.trim()}`);
                button.click();
                
                // Check if tab became active
                setTimeout(() => {
                    const isActive = button.classList.contains('active');
                    console.log(`Tab ${index + 1} active: ${isActive}`);
                }, 100);
            } catch (error) {
                console.error(`Error clicking tab ${index + 1}:`, error);
            }
        }, index * 1000);
    });
}

// Test the showTab function directly
function testShowTabFunction() {
    console.log("🧪 Testing showTab function directly...");
    
    const tabs = ['functions', 'dma', 'userCopy', 'ioctl', 'devices', 'memory', 'llmAnalysis'];
    
    tabs.forEach((tabName, index) => {
        setTimeout(() => {
            try {
                console.log(`Testing showTab('${tabName}')`);
                showTab(tabName, null);
                
                // Check if content is visible
                setTimeout(() => {
                    const content = document.getElementById(tabName);
                    if (content) {
                        const isVisible = content.classList.contains('active');
                        console.log(`${tabName} content visible: ${isVisible}`);
                    } else {
                        console.log(`❌ Content for ${tabName} not found`);
                    }
                }, 100);
            } catch (error) {
                console.error(`Error in showTab('${tabName}'):`, error);
            }
        }, index * 1000);
    });
}

console.log("🔧 Available test functions:");
console.log("  - testTabClicking() - Test clicking each tab");
console.log("  - testShowTabFunction() - Test showTab function directly");
console.log("📝 Run these functions to diagnose tab issues");

// Auto-run basic diagnostics
testTabClicking();
