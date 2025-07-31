// Test case for function context detection
// Calls outside functions should NOT be instrumented

#include <linux/module.h>
#include <linux/dma-mapping.h>

// Global variable with DMA call - should NOT be instrumented
static void *global_dma_ptr = dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);

// Module parameter with user copy - should NOT be instrumented  
static char module_buffer[256];
module_param_string(buffer, module_buffer, sizeof(module_buffer), 0644);

// Function declaration with DMA call in default parameter - should NOT be instrumented
void function_with_default(void *ptr = dma_alloc_coherent(NULL, 64, NULL, GFP_ATOMIC));

// Proper function - calls inside SHOULD be instrumented
int proper_function(struct device *dev) {
    void *local_ptr;
    char local_buffer[128];
    int result;
    
    // These calls are inside a function - SHOULD be instrumented
    local_ptr = dma_alloc_coherent(dev, 2048, &dma_handle, GFP_KERNEL);
    result = copy_from_user(local_buffer, user_ptr, sizeof(local_buffer));
    
    return result;
}

// Another function with calls that should be instrumented
static void cleanup_function(void) {
    // This call is inside a function - SHOULD be instrumented
    dma_free_coherent(device, size, ptr, handle);
}
