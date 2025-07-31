#ifdef CONFIG_DEBUG_FS
static int
debugfs_copy_from_user(char *k_buf, const char __user *buf, size_t count)
{
    int ret;

    ret = copy_from_user(k_buf, buf, count);
    if (ret != 0) {
        pr_err("Error: lost data: %d\n", (int)ret);
        return -1;
    }

    k_buf[count] = 0;

    return count;
}

void another_function() {
    char buffer[256];
    int result = copy_to_user(user_buf, buffer, sizeof(buffer));
    
    // Test with __copy_from_user
    __copy_from_user(dest, src, size);
    
    put_user(value, ptr);
}
#endif
