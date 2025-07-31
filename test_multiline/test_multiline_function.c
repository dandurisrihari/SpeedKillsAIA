
/* MULTI_INSTRUMENT: Auto-added headers */
#include <asm/stacktrace.h>
#include <linux/kernel.h>
#include <linux/printk.h>

gceSTATUS
gckVIDMEM_NODE_GetType(IN gckKERNEL Kernel, IN gckVIDMEM_NODE NodeObject,
                       OUT gceVIDMEM_TYPE *Type, OUT gcePOOL *Pool)
{
    if (Type)
        *Type = NodeObject->type;

    if (Pool)
        *Pool = NodeObject->pool;

    // Test DMA call inside function
    printk(KERN_INFO "DMA_INSTRUMENT: About to call dma_buf_put from function %s at %s:%d\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "DMA_STACK_START: Stack trace for dma_buf_put called from %s\n", __func__);
dump_stack();
printk(KERN_INFO "DMA_STACK_END: End of stack trace for dma_buf_put\n");
    dma_buf_put(buffer);

    return gcvSTATUS_OK;
}
