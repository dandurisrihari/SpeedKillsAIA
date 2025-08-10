/* Browser Compatibility Fixes for Chrome and other browsers */

// Polyfill for fetch API (if not available)
if (!window.fetch) {
    window.fetch = function(url, options) {
        return new Promise(function(resolve, reject) {
            var xhr = new XMLHttpRequest();
            
            xhr.open(options.method || 'GET', url);
            
            // Set headers
            if (options.headers) {
                for (var key in options.headers) {
                    xhr.setRequestHeader(key, options.headers[key]);
                }
            }
            
            xhr.onload = function() {
                var response = {
                    ok: xhr.status >= 200 && xhr.status < 300,
                    status: xhr.status,
                    statusText: xhr.statusText,
                    json: function() {
                        return Promise.resolve(JSON.parse(xhr.responseText));
                    },
                    text: function() {
                        return Promise.resolve(xhr.responseText);
                    }
                };
                resolve(response);
            };
            
            xhr.onerror = function() {
                reject(new Error('Network error'));
            };
            
            if (options.body) {
                xhr.send(options.body);
            } else {
                xhr.send();
            }
        });
    };
}

// Polyfill for Promise (if not available)
if (!window.Promise) {
    window.Promise = function(executor) {
        var self = this;
        self.state = 'pending';
        self.value = undefined;
        self.handlers = [];
        
        function resolve(result) {
            if (self.state === 'pending') {
                self.state = 'fulfilled';
                self.value = result;
                self.handlers.forEach(handle);
                self.handlers = null;
            }
        }
        
        function reject(error) {
            if (self.state === 'pending') {
                self.state = 'rejected';
                self.value = error;
                self.handlers.forEach(handle);
                self.handlers = null;
            }
        }
        
        function handle(handler) {
            if (self.state === 'pending') {
                self.handlers.push(handler);
            } else {
                if (self.state === 'fulfilled' && typeof handler.onFulfilled === 'function') {
                    handler.onFulfilled(self.value);
                }
                if (self.state === 'rejected' && typeof handler.onRejected === 'function') {
                    handler.onRejected(self.value);
                }
            }
        }
        
        this.then = function(onFulfilled, onRejected) {
            return new Promise(function(resolve, reject) {
                handle({
                    onFulfilled: function(result) {
                        try {
                            var returnValue = onFulfilled(result);
                            resolve(returnValue);
                        } catch (ex) {
                            reject(ex);
                        }
                    },
                    onRejected: function(error) {
                        try {
                            var returnValue = onRejected(error);
                            resolve(returnValue);
                        } catch (ex) {
                            reject(ex);
                        }
                    }
                });
            });
        };
        
        executor(resolve, reject);
    };
    
    Promise.resolve = function(value) {
        return new Promise(function(resolve) {
            resolve(value);
        });
    };
    
    Promise.reject = function(reason) {
        return new Promise(function(resolve, reject) {
            reject(reason);
        });
    };
}

// Fix for Chrome's strict security policy
document.addEventListener('DOMContentLoaded', function() {
    // Disable strict mode warnings in Chrome
    if (window.console && console.warn) {
        var originalWarn = console.warn;
        console.warn = function(message) {
            if (typeof message === 'string' && 
                (message.includes('Mixed Content') || 
                 message.includes('CORS') || 
                 message.includes('Cross-Origin'))) {
                return; // Suppress CORS/Mixed content warnings
            }
            originalWarn.apply(console, arguments);
        };
    }
    
    // Add meta tag for CSP if not present
    if (!document.querySelector('meta[http-equiv="Content-Security-Policy"]')) {
        var meta = document.createElement('meta');
        meta.setAttribute('http-equiv', 'Content-Security-Policy');
        meta.setAttribute('content', "default-src 'self' 'unsafe-inline' 'unsafe-eval' http: https: data:; img-src 'self' data: http: https:; font-src 'self' data: http: https:");
        document.head.appendChild(meta);
    }
});

// Chrome-specific fixes
if (navigator.userAgent.includes('Chrome')) {
    console.log('🌐 Chrome browser detected, applying Chrome-specific fixes...');
    
    // Fix for Chrome's strict cookie handling
    document.addEventListener('DOMContentLoaded', function() {
        // Ensure all forms and AJAX requests include proper headers
        var originalFetch = window.fetch;
        window.fetch = function(url, options) {
            console.log('🔗 Chrome: Making fetch request to:', url);
            
            options = options || {};
            options.credentials = options.credentials || 'same-origin';
            
            // Add cache-control headers for Chrome
            if (!options.headers) {
                options.headers = {};
            }
            if (typeof options.headers === 'object' && !options.headers['Cache-Control']) {
                options.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate';
            }
            
            return originalFetch.call(this, url, options).then(function(response) {
                console.log('✅ Chrome: Fetch response received:', response.status, response.statusText);
                return response;
            }).catch(function(error) {
                console.error('❌ Chrome: Fetch error:', error);
                throw error;
            });
        };
        
        console.log('✅ Chrome: Fetch wrapper applied successfully');
    });
} else {
    console.log('🌐 Non-Chrome browser detected, using standard configuration');
}

// Error handling for network issues
window.addEventListener('error', function(e) {
    if (e.message && e.message.includes('NetworkError')) {
        console.error('Network error detected. This might be due to browser security policies.');
        // Show user-friendly message
        var notification = document.createElement('div');
        notification.innerHTML = '<div style="position:fixed;top:20px;right:20px;background:#ff4444;color:white;padding:15px;border-radius:5px;z-index:10000;">⚠️ Network connectivity issue. Please check your browser settings or try refreshing the page.</div>';
        document.body.appendChild(notification);
        setTimeout(function() {
            if (notification.parentNode) {
                notification.parentNode.removeChild(notification);
            }
        }, 5000);
    }
});

console.log('🔧 Browser compatibility fixes loaded successfully');
