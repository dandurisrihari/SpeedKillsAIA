#include <linux/kernel.h>
#include <linux/dma-mapping.h>
#if defined(CONFIG_DMA_SHARED_BUFFER)
#    include <linux/dma-buf.h>
#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 16, 0)
#include <linux/module.h>
MODULE_IMPORT_NS(DMA_BUF);
#endif

// Test function with actual DMA calls that should be instrumented
static int test_valid_dma_calls(void) {
    struct dma_buf *dmabuf;
    struct device *dev;
    
    // These should be instrumented (inside function)
    printk(KERN_INFO "DMA_INSTRUMENT: About to call dma_buf_get from function %s at %s:%d\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "DMA_STACK_START: Stack trace for dma_buf_get called from %s\n", __func__);
dump_stack();
printk(KERN_INFO "DMA_STACK_END: End of stack trace for dma_buf_get\n");
    dmabuf = dma_buf_get(fd);
    if (!dmabuf)
        return -EINVAL;
    
    printk(KERN_INFO "DMA_INSTRUMENT: About to call dma_buf_put from function %s at %s:%d\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "DMA_STACK_START: Stack trace for dma_buf_put called from %s\n", __func__);
dump_stack();
printk(KERN_INFO "DMA_STACK_END: End of stack trace for dma_buf_put\n");
    dma_buf_put(dmabuf);
    return 0;
}

// Another function to test
void cleanup_dma(struct dma_buf *buf) {
    // This should also be instrumented
    printk(KERN_INFO "DMA_INSTRUMENT: About to call dma_buf_put from function %s at %s:%d\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "DMA_STACK_START: Stack trace for dma_buf_put called from %s\n", __func__);
dump_stack();
printk(KERN_INFO "DMA_STACK_END: End of stack trace for dma_buf_put\n");
    dma_buf_put(buf);
}
