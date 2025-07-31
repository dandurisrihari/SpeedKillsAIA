#include <linux/kernel.h>
#include <linux/uaccess.h>

static int test_function(char *buf, const char __user *s, size_t len) {
    // This pattern might be missed
    if (copy_from_user(buf, s, len))
        return -EFAULT;
    buf[len] = '\0';
    
    // Other patterns to test
    if (copy_to_user(s, buf, len)) {
        return -EFAULT;
    }
    
    // Assignment pattern
    int ret = copy_from_user(buf, s, len);
    if (ret)
        return -EFAULT;
    
    // Multi-line pattern
    if (copy_from_user(buf, 
                       s, 
                       len))
        return -EFAULT;
        
    return 0;
}
