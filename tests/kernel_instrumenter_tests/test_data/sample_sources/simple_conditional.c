#include <linux/kernel.h>
#include <linux/dma-mapping.h>

static int simple_test(struct device *dev, unsigned long pfn, size_t size) {
    dma_addr_t dmaHandle;
    
    if (pfn_valid(pfn))
        dmaHandle = dma_map_page(dev, pfn_to_page(pfn), 0, size, DMA_BIDIRECTIONAL);
    else
        return -EINVAL;
    
    return 0;
}
