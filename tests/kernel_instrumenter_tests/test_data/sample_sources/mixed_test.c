#include <linux/dma-mapping.h>
#include <linux/uaccess.h>
#include <linux/device.h>

// Mixed operations test - contains all types
static struct device *mixed_device;

static int mixed_operations_handler(void __user *user_buffer, size_t size) {
    void *kernel_buffer;
    dma_addr_t dma_handle;
    int user_value;
    
    // DMA allocation
    kernel_buffer = dma_alloc_coherent(mixed_device, size, &dma_handle, GFP_KERNEL);
    if (!kernel_buffer) {
        return -ENOMEM;
    }
    
    // User copy operation
    if (copy_from_user(kernel_buffer, user_buffer, size)) {
        dma_free_coherent(mixed_device, size, kernel_buffer, dma_handle);
        return -EFAULT;
    }
    
    // Get user value
    if (get_user(user_value, (int __user *)user_buffer)) {
        dma_free_coherent(mixed_device, size, kernel_buffer, dma_handle);
        return -EFAULT;
    }
    
    // Process data (this function call should also be instrumented)
    process_data_function(kernel_buffer, size);
    
    // Copy back to user
    if (copy_to_user(user_buffer, kernel_buffer, size)) {
        dma_free_coherent(mixed_device, size, kernel_buffer, dma_handle);
        return -EFAULT;
    }
    
    // Clean up DMA
    dma_free_coherent(mixed_device, size, kernel_buffer, dma_handle);
    
    return 0;
}

static void process_data_function(void *data, size_t len) {
    // Process the data
    memset(data, 0xFF, len);
}

// Function that contains function definitions (edge case)
typedef int (*callback_func_t)(void);

static int register_callback(callback_func_t callback) {
    // This contains the word "function" but should still be instrumented
    return callback ? callback() : -EINVAL;
}
