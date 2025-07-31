#include <linux/kernel.h>
#include <linux/uaccess.h>
#include <linux/dma-mapping.h>

// Test various contexts where calls might be missed

static int test_edge_cases(void) {
    char buf[256];
    void *ptr;
    struct device *dev;
    
    // 1. Nested conditionals
    if (some_condition) {
        if (copy_from_user(buf, user_ptr, 100))
            return -EFAULT;
    }
    
    // 2. Ternary operator  
    int result = copy_to_user(user_ptr, buf, 100) ? -EFAULT : 0;
    
    // 3. Function call as parameter
    some_function(copy_from_user(buf, user_ptr, 50));
    
    // 4. Inside loop
    for (int i = 0; i < 10; i++) {
        if (copy_from_user(buf + i, user_ptr + i, 1))
            break;
    }
    
    // 5. Inside macro (if expanded)
    #define COPY_CHECK(dst, src, len) \
        if (copy_from_user(dst, src, len)) return -EFAULT
    
    COPY_CHECK(buf, user_ptr, 200);
    
    // 6. DMA calls in various contexts
    ptr = dma_alloc_coherent(dev, 1024, &dma_handle, GFP_KERNEL);
    if (!ptr)
        return -ENOMEM;
    
    // 7. Complex expression
    if (!(ptr = dma_alloc_coherent(dev, 2048, &dma_handle, GFP_KERNEL)))
        return -ENOMEM;
    
    // 8. Multiple calls in one line (though bad practice)
    if (copy_from_user(buf, ptr1, 10) || copy_to_user(ptr2, buf, 10))
        return -EFAULT;
        
    return 0;
}
