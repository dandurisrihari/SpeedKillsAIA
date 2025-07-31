/*
 * Test C file without kernel headers to verify automatic header inclusion
 */


/* DMA_INSTRUMENT: Auto-added headers */
#include <linux/kernel.h>
#include <linux/printk.h>
#include <asm/stacktrace.h>

void test_function(void) {
    printk(KERN_ERR "FUNC_ENTRY: Entering function test_function at %s:%d\n", __FILE__, __LINE__);
    void *buffer;
    
    // This will trigger DMA instrumentation requiring printk headers
    printk(KERN_ERR "DMA_INSTRUMENT: About to call dma_alloc_coherent from function %s at %s:%d\n", __func__, __FILE__, __LINE__);
printk(KERN_ERR "DMA_STACK_START: Stack trace for dma_alloc_coherent called from %s\n", __func__);
dump_stack();
printk(KERN_ERR "DMA_STACK_END: End of stack trace for dma_alloc_coherent\n");
    buffer = dma_alloc_coherent(NULL, 1024, NULL, 0);
    
    if (buffer) {
        // Do something
    }
}
