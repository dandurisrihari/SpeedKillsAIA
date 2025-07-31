#include <linux/kernel.h>
#include <linux/module.h>

// Test function entries
static int init_function(void) {
    printk(KERN_INFO "Module initialized\n");
    return 0;
}

static void cleanup_function(void) {
    printk(KERN_INFO "Module cleaned up\n");
}

static long helper_function(int param1, char *param2) {
    if (param1 < 0) {
        return -EINVAL;
    }
    
    return strlen(param2);
}

// Static function
static inline void inline_helper(void) {
    // Do something inline
}

// External function declaration (should not be instrumented)
extern int external_function(void);

// Function with complex signature
static struct device *complex_function(const struct platform_device *pdev,
                                     struct resource *res,
                                     int count) {
    if (!pdev || !res) {
        return NULL;
    }
    
    return &pdev->dev;
}

module_init(init_function);
module_exit(cleanup_function);
