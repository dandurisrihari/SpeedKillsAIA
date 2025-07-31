static int test_assignment_preprocessor(void) {
    void *ptr;
    struct device *dev;
    
    mdlPriv->kvaddr =
#if defined CONFIG_MIPS || defined CONFIG_CPU_CSKYV2 || defined CONFIG_PPC || \
    defined CONFIG_ARM64 || !gcdENABLE_BUFFERABLE_VIDEO_MEMORY
        dma_alloc_coherent(dev, NumPages * PAGE_SIZE, &mdlPriv->dmaHandle, gfp);
#else
#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 6, 0)
        dma_alloc_wc(dev, NumPages * PAGE_SIZE, &mdlPriv->dmaHandle, gfp);
#else
        dma_alloc_writecombine(dev, NumPages * PAGE_SIZE, &mdlPriv->dmaHandle, gfp);
#endif
#endif

    return 0;
}
