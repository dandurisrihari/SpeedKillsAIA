#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/mm.h>  // For phys_to_virt() and pfn_to_page()
#include <linux/slab.h>
#include <linux/highmem.h>

#define DEVICE_NAME "mem_rw"
#define CLASS_NAME "mem_rw_class"

#define IOCTL_SET_ADDRESS _IOW('a', 'a', unsigned long)
#define IOCTL_SET_SIZE _IOW('a', 'b', size_t)
#define IOCTL_SET_WRITE_MODE _IOW('a', 'c', int)  // 1 for 1 byte, 4 for 4 bytes, 8 for 8 bytes

static int major_number;
static struct class *mem_class = NULL;
static struct device *mem_device = NULL;
static struct cdev mem_cdev;

static unsigned long target_address = 0;
static size_t target_size = 0;
static void *mapped_address = NULL;  // Changed from __iomem to regular pointer
static int write_mode = 1;  // Default write mode is 1 byte


static int dev_open(struct inode *inodep, struct file *filep) {
    printk(KERN_ERR "mem_rw: Device has been opened\n");
    return 0;
}

static int dev_release(struct inode *inodep, struct file *filep) {
    printk(KERN_ERR "mem_rw: Device successfully closed\n");
    return 0;
}

// Function to get the mapped address using phys_to_virt() or ioremap()
static void *get_mapped_address(unsigned long phys_addr, size_t size) {
    void *virt_addr = NULL;
 
    // 0x0000000100000000..0x000000010fffffff gpu_reserved
    if(phys_addr >= 0x100000000 && phys_addr <= 0x10fffffff) {
        // use ioremap() for high memory or device memory
        virt_addr = ioremap(phys_addr, size);
        if (!virt_addr) {
            printk(KERN_ERR "mem_rw: ioremap failed for address 0x%lx\n", phys_addr);
            return NULL;
        }
    }
    else{
        // Try to map using phys_to_virt() for low memory
        virt_addr = phys_to_virt(phys_addr);
        if (virt_addr) {
            printk(KERN_ERR "mem_rw: Using phys_to_virt for address 0x%lx\n", phys_addr);
            return virt_addr;
        }
    }

    printk(KERN_ERR "mem_rw: Using ioremap for address 0x%lx\n", phys_addr);
    return virt_addr;
}

static ssize_t dev_read(struct file *filep, char *user_buffer, size_t len, loff_t *offset) {
    if (target_address == 0 || target_size == 0) {
        printk(KERN_WARNING "mem_rw: Target address or size is not set\n");
        return -EINVAL;
    }

    if (mapped_address == NULL) {
        mapped_address = get_mapped_address(target_address, target_size);
        if (!mapped_address) {
            printk(KERN_ERR "mem_rw: Failed to map physical address 0x%lx\n", target_address);
            return -EFAULT;
        }
    }

    if (len > target_size) {
        len = target_size;
    }

    if (copy_to_user(user_buffer, mapped_address, len)) {
        return -EFAULT;
    }

    printk(KERN_ERR "mem_rw: Read %zu bytes from address 0x%lx\n", len, target_address);
    return len;
}

static ssize_t dev_write(struct file *filep, const char *user_buffer, size_t len, loff_t *offset) {
    if (target_address == 0 || target_size == 0) {
        printk(KERN_WARNING "mem_rw: Target address or size is not set\n");
        return -EINVAL;
    }

    if (mapped_address == NULL) {
        mapped_address = get_mapped_address(target_address, target_size);
        if (!mapped_address) {
            printk(KERN_ERR "mem_rw: Failed to map physical address 0x%lx\n", target_address);
            return -EFAULT;
        }
    }

    if (len != write_mode) {
        printk(KERN_WARNING "mem_rw: Write size must be %d bytes\n", write_mode);
        return -EINVAL;
    }

    char temp_buffer[8];  // Buffer to hold up to 8 bytes for writing
    if (copy_from_user(temp_buffer, user_buffer, len)) {
        return -EFAULT;
    }

    memcpy(mapped_address, temp_buffer, len);  // Write data to the mapped address
    printk(KERN_ERR "mem_rw: Wrote %zu bytes to address 0x%lx\n", len, target_address);

    return len;
}

static long dev_ioctl(struct file *file, unsigned int cmd, unsigned long arg) {
    switch (cmd) {
        case IOCTL_SET_ADDRESS:
            if (copy_from_user(&target_address, (unsigned long __user *)arg, sizeof(target_address))) {
                return -EFAULT;
            }
            if (mapped_address) {
                mapped_address = NULL;  // Reset mapped address (no need to unmap phys_to_virt())
            }
            printk(KERN_ERR "mem_rw: Target address set to 0x%lx\n", target_address);
            break;
        case IOCTL_SET_SIZE:
            if (copy_from_user(&target_size, (size_t __user *)arg, sizeof(target_size))) {
                return -EFAULT;
            }
            printk(KERN_ERR "mem_rw: Target size set to %zu bytes\n", target_size);
            break;
        case IOCTL_SET_WRITE_MODE:
            if (copy_from_user(&write_mode, (int __user *)arg, sizeof(write_mode))) {
                return -EFAULT;
            }
            if (write_mode != 1 && write_mode != 4 && write_mode != 8) {
                printk(KERN_WARNING "mem_rw: Invalid write mode %d. Must be 1, 4, or 8 bytes\n", write_mode);
                return -EINVAL;
            }
            printk(KERN_ERR "mem_rw: Write mode set to %d bytes\n", write_mode);
            break;
        default:
            return -EINVAL;
    }
    return 0;
}

static struct file_operations fops = {
    .open = dev_open,
    .read = dev_read,
    .write = dev_write,
    .unlocked_ioctl = dev_ioctl,
    .release = dev_release,
};



static int __init mem_rw_init(void) {
    printk(KERN_ERR "mem_rw: Initializing the memory read/write driver\n");

    major_number = register_chrdev(0, DEVICE_NAME, &fops);
    if (major_number < 0) {
        printk(KERN_ALERT "mem_rw failed to register a major number\n");
        return major_number;
    }

    mem_class = class_create(CLASS_NAME);
    if (IS_ERR(mem_class)) {
        unregister_chrdev(major_number, DEVICE_NAME);
        printk(KERN_ALERT "Failed to register device class\n");
        return PTR_ERR(mem_class);
    }

    mem_device = device_create(mem_class, NULL, MKDEV(major_number, 0), NULL, DEVICE_NAME);
    if (IS_ERR(mem_device)) {
        class_destroy(mem_class);
        unregister_chrdev(major_number, DEVICE_NAME);
        printk(KERN_ALERT "Failed to create the device\n");
        return PTR_ERR(mem_device);
    }

    cdev_init(&mem_cdev, &fops);
    mem_cdev.owner = THIS_MODULE;
    if (cdev_add(&mem_cdev, MKDEV(major_number, 0), 1) == -1) {
        device_destroy(mem_class, MKDEV(major_number, 0));
        class_destroy(mem_class);
        unregister_chrdev(major_number, DEVICE_NAME);
        printk(KERN_ALERT "Failed to add cdev\n");
        return -1;
    }

    printk(KERN_ERR "mem_rw: Device created successfully\n");
    return 0;
}

static void __exit mem_rw_exit(void) {
    cdev_del(&mem_cdev);
    device_destroy(mem_class, MKDEV(major_number, 0));
    class_destroy(mem_class);
    unregister_chrdev(major_number, DEVICE_NAME);

    printk(KERN_ERR "mem_rw: Unloaded the memory read/write driver\n");
}

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Your Name");
MODULE_DESCRIPTION("Memory Read/Write Kernel Driver");
MODULE_VERSION("1.0");

module_init(mem_rw_init);
module_exit(mem_rw_exit);
