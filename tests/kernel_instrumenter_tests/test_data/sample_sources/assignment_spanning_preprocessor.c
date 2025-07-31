// Test case for assignment spanning preprocessor blocks
// This file should trigger the 'before_assignment' strategy

void test_assignment_spanning(void) {
    struct driver_data *mdlPriv;
    
    // This assignment spans across preprocessor conditionals
    mdlPriv->kvaddr =
#if defined(CONFIG_X86_64)
        dma_alloc_coherent(dev, NumPages * PAGE_SIZE, &mdlPriv->dmaHandle, gfp);
#elif defined(CONFIG_ARM64)
        dma_alloc_wc(dev, NumPages * PAGE_SIZE, &mdlPriv->dmaHandle, gfp);
#else
        NULL;
#endif
    
    // Another spanning case with user copy
    int result =
#ifdef CONFIG_HARDENED_USERCOPY
        copy_from_user(kernel_buffer, user_buffer, buffer_size);
#else
        __copy_from_user(kernel_buffer, user_buffer, buffer_size);
#endif
}
