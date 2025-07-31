#include <linux/kernel.h>
#include <linux/uaccess.h>
#include <linux/version.h>

static inline int
strtoint_from_user(const char __user *s, size_t count, int *res)
{
printk(KERN_INFO "USER_COPY: About to call copy_from_user from function %s at %s:%d\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "USER_COPY_CONTEXT: Process PID=%d, COMM=%s\n", current->pid, current->comm);
#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 0, 0)
    int ret = kstrtoint_from_user(s, count, 10, res);
    return ret < 0 ? ret : count;
#else
    /* sign, base 2 representation, newline, terminator */
    char buf[1 + sizeof(long) * 8 + 1 + 1];
    size_t len = min(count, sizeof(buf) - 1);

    if (copy_from_user(buf, s, len))
        return -EFAULT;
    buf[len] = '\0';

    if (kstrtol(buf, 0, res))
        return -1;

    return count;
#endif
}

// Additional test cases
static int test_more_preprocessor(void) {
    char buffer[256];
    
printk(KERN_INFO "USER_COPY: About to call copy_to_user from function %s at %s:%d\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "USER_COPY_CONTEXT: Process PID=%d, COMM=%s\n", current->pid, current->comm);
#ifdef CONFIG_SOME_FEATURE
    if (copy_to_user(user_ptr, buffer, 100))
        return -EFAULT;
#endif

printk(KERN_INFO "USER_COPY: About to call copy_from_user from function %s at %s:%d\n", __func__, __FILE__, __LINE__);
printk(KERN_INFO "USER_COPY_CONTEXT: Process PID=%d, COMM=%s\n", current->pid, current->comm);
#ifndef CONFIG_OLD_API
    if (copy_from_user(buffer, user_ptr, 200))
        return -EFAULT;
#else
    // Old API handling
    some_old_function();
#endif

    return 0;
}
