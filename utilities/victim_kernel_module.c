#include <linux/module.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/gfp.h>
#include <linux/mm.h>
#include <linux/io.h>
#include <linux/page_ref.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Anonymous");
MODULE_DESCRIPTION("Kernel driver to allocate a page for DMA excluding high memory with specific flags and print physical address");
MODULE_VERSION("1.0");

static void *targetaddr = NULL;
static struct page *targetpage = NULL;

static int __init dma_target_init(void)
{
    phys_addr_t phys_addr;
    gfp_t gfp_flags = GFP_KERNEL;

    // Allocate a page for DMA, excluding high memory and preventing retries
    targetaddr = alloc_pages_exact(PAGE_SIZE, (gfp_flags ) | __GFP_NORETRY);
    if (targetaddr) {
        // Get the page struct for the allocated memory
        targetpage = virt_to_page(targetaddr);

        // Get the physical address
        phys_addr = virt_to_phys(targetaddr);

        // Fill the page with a specific pattern (0x17) for verification
        memset(targetaddr, 0x17, PAGE_SIZE);

        // Print information about the allocation
        printk(KERN_INFO "[Debug] targetaddr allocated with alloc_pages_exact\n");
        printk(KERN_INFO "[Debug] Physical address: 0x%llx\n", (unsigned long long)phys_addr);
    } else {
        printk(KERN_ERR "[Debug] Failed to allocate targetaddr with alloc_pages_exact\n");
        return -ENOMEM;
    }

    return 0; // Successfully initialized
}

static void __exit dma_target_exit(void)
{
    if (targetaddr) {
        free_pages_exact(targetaddr, PAGE_SIZE);  // Free the allocated memory
        printk(KERN_INFO "[Debug] Freed targetaddr\n");
    }
}

module_init(dma_target_init);
module_exit(dma_target_exit);
