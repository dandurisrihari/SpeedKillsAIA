
/* MULTI_INSTRUMENT: Auto-added headers */
#include <asm/stacktrace.h>
#include <linux/kernel.h>
#include <linux/printk.h>

#include <linux/dma-buf.h>
MODULE_IMPORT_NS(DMA_BUF);

// Valid function call that should be instrumented
int test_function(int fd) {
    printk(KERN_INFO "DMA_INSTRUMENT: About to call dma_buf_get from function %s at %s:%d\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "DMA_STACK_START: Stack trace for dma_buf_get called from %s\n", __func__);
dump_stack();
printk(KERN_INFO "DMA_STACK_END: End of stack trace for dma_buf_get\n");
    struct dma_buf *buf = dma_buf_get(fd);
    printk(KERN_INFO "DMA_INSTRUMENT: About to call dma_buf_put from function %s at %s:%d\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "DMA_STACK_START: Stack trace for dma_buf_put called from %s\n", __func__);
dump_stack();
printk(KERN_INFO "DMA_STACK_END: End of stack trace for dma_buf_put\n");
    dma_buf_put(buf);
    return 0;
}
