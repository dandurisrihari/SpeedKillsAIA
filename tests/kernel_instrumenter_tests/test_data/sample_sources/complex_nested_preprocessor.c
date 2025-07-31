// Test case for complex nested preprocessor scenarios
// This should test the robustness of our assignment detection

void complex_nested_test(void) {
    struct complex_data *data;
    
    // Deeply nested preprocessor with assignment
    data->buffer_ptr =
#ifdef CONFIG_ARCH_X86
  #ifdef CONFIG_64BIT
    #ifdef CONFIG_DMA_COHERENT
        dma_alloc_coherent(dev, BUFFER_SIZE, &data->dma_handle, GFP_KERNEL);
    #else
        dma_alloc_wc(dev, BUFFER_SIZE, &data->dma_handle, GFP_KERNEL);
    #endif
  #else
        dma_alloc_coherent(dev, BUFFER_SIZE/2, &data->dma_handle, GFP_KERNEL);
  #endif
#elif defined(CONFIG_ARCH_ARM)
        dma_alloc_wc(dev, BUFFER_SIZE, &data->dma_handle, GFP_KERNEL);
#else
        kmalloc(BUFFER_SIZE, GFP_KERNEL);
#endif

    // Multi-line assignment with function calls spanning multiple preprocessor blocks
    int complex_result =
#if defined(CONFIG_SECURITY_HARDENED)
        copy_from_user_hardened(data->user_buffer, 
                               user_space_ptr, 
                               BUFFER_SIZE) +
#endif
#if defined(CONFIG_COMPAT)
        compat_copy_from_user(data->compat_buffer,
                             compat_ptr,
                             COMPAT_SIZE);
#else
        copy_from_user(data->regular_buffer,
                      regular_ptr, 
                      REGULAR_SIZE);
#endif
}
