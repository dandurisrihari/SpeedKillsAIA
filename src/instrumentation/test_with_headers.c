/*
 * Test C file with existing kernel headers
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>

static int test_init(void) {
    void *buffer = dma_alloc_coherent(NULL, 1024, NULL, 0);
    return 0;
}
