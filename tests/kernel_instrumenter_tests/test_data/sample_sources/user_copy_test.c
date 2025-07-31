#include <linux/uaccess.h>
#include <linux/fs.h>

struct user_data {
    int value;
    char buffer[256];
};

// Test copy_from_user operations
static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    struct user_data data;
    int result;
    
    // Basic copy_from_user
    if (copy_from_user(&data, (void __user *)arg, sizeof(data))) {
        return -EFAULT;
    }
    
    // Test copy_to_user
    data.value = 42;
    if (copy_to_user((void __user *)arg, &data, sizeof(data))) {
        return -EFAULT;
    }
    
    return 0;
}

// Test get_user and put_user
static int test_user_access(void __user *user_ptr) {
    int user_value;
    int local_value = 100;
    
    // Test get_user
    if (get_user(user_value, (int __user *)user_ptr)) {
        return -EFAULT;
    }
    
    // Test put_user
    if (put_user(local_value, (int __user *)user_ptr)) {
        return -EFAULT;
    }
    
    return 0;
}

// Test __copy_from_user (unsafe version)
static int test_unsafe_copy(void __user *src, void *dst, size_t len) {
    unsigned long result;
    
    result = __copy_from_user(dst, src, len);
    if (result != 0) {
        return -EFAULT;
    }
    
    return 0;
}
