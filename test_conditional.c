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
    dmabuf = dma_buf_get(fd);
    if (!dmabuf)
        return -EINVAL;
    
    dma_buf_put(dmabuf);
    return 0;
}

// Another function to test
void cleanup_dma(struct dma_buf *buf) {
    // This should also be instrumented
    dma_buf_put(buf);
}
