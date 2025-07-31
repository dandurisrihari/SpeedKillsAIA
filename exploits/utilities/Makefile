
obj-m := read_mem.o victim_kernel_module.o

# Path to the kernel source directory
KDIR := 

CROSS_COMPILE := aarch64-poky-linux-

all:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=arm64 CROSS_COMPILE=$(CROSS_COMPILE) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
