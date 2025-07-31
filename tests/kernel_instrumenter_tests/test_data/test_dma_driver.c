#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/dma-mapping.h>
#include <linux/device.h>

static struct device *test_device;

/* Function without DMA operations */
static int simple_function(int param) {
    printk(KERN_INFO "Simple function called with param: %d\n", param);
    return param * 2;
}

/* Function with DMA operations */
static int allocate_dma_buffer(size_t size) {
    void *coherent_mem;
    dma_addr_t dma_handle;
    
    coherent_mem = dma_alloc_coherent(test_device, size, &dma_handle, GFP_KERNEL);
    if (!coherent_mem) {
        printk(KERN_ERR "Failed to allocate DMA buffer\n");
        return -ENOMEM;
    }
    
    printk(KERN_INFO "Allocated DMA buffer at %p, DMA handle: %llx\n", 
           coherent_mem, (unsigned long long)dma_handle);
    
    return 0;
}

/* Another function without DMA */
static void cleanup_function(void) {
    printk(KERN_INFO "Cleanup completed\n");
}

/* Module init function */
static int __init test_dma_init(void) {
    printk(KERN_INFO "Test DMA module loaded\n");
    return simple_function(42);
}

/* Module exit function */
static void __exit test_dma_exit(void) {
    cleanup_function();
    printk(KERN_INFO "Test DMA module unloaded\n");
}

module_init(test_dma_init);
module_exit(test_dma_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Test DMA driver");
