void test_function(void) {
    struct my_data *data;
    int result;
    
    result =
#ifdef CONFIG_HARDENED_USERCOPY
        copy_from_user(kernel_buf, user_buf, size);
#else
        __copy_from_user(kernel_buf, user_buf, size);
#endif
}
