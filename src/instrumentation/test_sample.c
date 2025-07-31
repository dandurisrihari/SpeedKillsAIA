/*
 * Sample C file for testing DMA instrumentation with function entry logging
 */

#include <linux/kernel.h>
#include <linux/dma-mapping.h>

void my_driver_function(struct device *dev) {
    void *buffer;
    dma_addr_t dma_handle;
    
    buffer = dma_alloc_coherent(dev, 1024, &dma_handle, GFP_KERNEL);
    if (!buffer) {
        printk(KERN_ERR "Failed to allocate DMA buffer\n");
        return;
    }
    
    // Do some work with the buffer
    
    dma_free_coherent(dev, 1024, buffer, dma_handle);
}

int driver_init(void) {
    struct device *dev = get_device();
    
    my_driver_function(dev);
    
    return 0;
}

static void cleanup_function(void) {
    printk(KERN_INFO "Cleaning up driver\n");
}
