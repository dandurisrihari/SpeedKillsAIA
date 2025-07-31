#include <linux/kernel.h>
#include <linux/uaccess.h>

static long test_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    int ret = 0;
    char buffer[256];
    
    switch (cmd) {
    case 1:
        /* Simple case with copy_to_user */
        if (copy_to_user((void *)arg, buffer, sizeof(buffer))) {
            return -EFAULT;
        }
        break;
        
    case 2:
        /* Simple case with copy_from_user */
        if (copy_from_user(buffer, (void *)arg, sizeof(buffer))) {
            return -EFAULT;
        }
        break;
        
    case 3:
        /* Multiple copy operations in one case */
        if (copy_from_user(buffer, (void *)arg, 128)) {
            return -EFAULT;
        }
        
        /* Do some processing */
        
        if (copy_to_user((void *)arg, buffer, 128)) {
            return -EFAULT;
        }
        break;
        
    default:
        return -EINVAL;
    }
    
    return ret;
}
