#include <linux/module.h>
#include <linux/printk.h>
#include <linux/kernel.h>
#include <linux/dma-mapping.h>
#include <linux/uaccess.h>

static int test_function(void)
{
    void *dma_ptr;
    char buffer[256];
    
    // DMA allocation
    dma_ptr = dma_alloc_coherent(NULL, 1024, NULL, GFP_KERNEL);
    if (!dma_ptr)
        return -ENOMEM;
    
    // User copy operation
    printk(KERN_INFO "[USER_COPY_TRACE] copy_from_user called at test_driver.c:%d\n", __LINE__ + 1);
    printk(KERN_INFO "[USER_COPY_TRACE] copy_from_user called at test_driver.c:%d\n", __LINE__ + 1);
    if (copy_from_user(buffer, user_ptr, sizeof(buffer)))
        return -EFAULT;
    
    // Another DMA operation
    dma_free_coherent(NULL, 1024, dma_ptr, 0);
    
    return 0;
}

static int __init test_init(void)
{
    printk(KERN_INFO "Test module loaded\n");
    return test_function();
}

static void __exit test_exit(void)
{
    printk(KERN_INFO "Test module unloaded\n");
}

module_init(test_init);
module_exit(test_exit);
MODULE_LICENSE("GPL");
