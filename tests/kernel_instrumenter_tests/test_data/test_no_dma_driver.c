#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/device.h>

/* Function without any DMA operations */
static int no_dma_function(int param) {
    printk(KERN_INFO "No DMA function called with param: %d\n", param);
    return param * 3;
}

/* Another function without DMA */
static void another_no_dma_function(void) {
    printk(KERN_INFO "Another function without DMA\n");
}

/* Module init function */
static int __init no_dma_init(void) {
    printk(KERN_INFO "No DMA module loaded\n");
    return no_dma_function(10);
}

/* Module exit function */
static void __exit no_dma_exit(void) {
    another_no_dma_function();
    printk(KERN_INFO "No DMA module unloaded\n");
}

module_init(no_dma_init);
module_exit(no_dma_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Test driver without DMA");
