# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/fifo/engine_status.c"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel_out//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kconfig.h" 1






# 1 "./include/generated/autoconf.h" 1
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kconfig.h" 2
# 1 "<command-line>" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h" 1
# 65 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_attributes.h" 1
# 66 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h" 2
# 74 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler-gcc.h" 1
# 75 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h" 2
# 88 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/compiler.h" 1
# 89 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h" 2


struct ftrace_branch_data {
 const char *func;
 const char *file;
 unsigned line;
 union {
  struct {
   unsigned long correct;
   unsigned long incorrect;
  };
  struct {
   unsigned long miss;
   unsigned long hit;
  };
  unsigned long miss_hit[2];
 };
};

struct ftrace_likely_data {
 struct ftrace_branch_data data;
 unsigned long constant;
};
# 1 "<command-line>" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/fifo/engine_status.c"
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/fifo/engine_status.c"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h" 1
# 25 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h" 1
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/types.h" 1





# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/types.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/types.h" 1






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/int-ll64.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/int-ll64.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/int-ll64.h" 1
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/int-ll64.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/bitsperlong.h" 1
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/bitsperlong.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitsperlong.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/bitsperlong.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitsperlong.h" 2
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/bitsperlong.h" 2
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/int-ll64.h" 2







typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/int-ll64.h" 2




typedef __s8 s8;
typedef __u8 u8;
typedef __s16 s16;
typedef __u16 u16;
typedef __s32 s32;
typedef __u32 u32;
typedef __s64 s64;
typedef __u64 u64;
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/types.h" 2
# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/types.h" 2
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/posix_types.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/stddef.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/stddef.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/stddef.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/stddef.h" 2




enum {
 false = 0,
 true = 1
};
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/posix_types.h" 2
# 25 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/posix_types.h"
typedef struct {
 unsigned long fds_bits[1024 / (8 * sizeof(long))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/posix_types.h" 1




typedef unsigned short __kernel_old_uid_t;
typedef unsigned short __kernel_old_gid_t;


# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/posix_types.h" 1
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/posix_types.h"
typedef long __kernel_long_t;
typedef unsigned long __kernel_ulong_t;



typedef __kernel_ulong_t __kernel_ino_t;



typedef unsigned int __kernel_mode_t;



typedef int __kernel_pid_t;



typedef int __kernel_ipc_pid_t;



typedef unsigned int __kernel_uid_t;
typedef unsigned int __kernel_gid_t;



typedef __kernel_long_t __kernel_suseconds_t;



typedef int __kernel_daddr_t;



typedef unsigned int __kernel_uid32_t;
typedef unsigned int __kernel_gid32_t;
# 59 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/posix_types.h"
typedef unsigned int __kernel_old_dev_t;
# 72 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/posix_types.h"
typedef __kernel_ulong_t __kernel_size_t;
typedef __kernel_long_t __kernel_ssize_t;
typedef __kernel_long_t __kernel_ptrdiff_t;




typedef struct {
 int val[2];
} __kernel_fsid_t;





typedef __kernel_long_t __kernel_off_t;
typedef long long __kernel_loff_t;
typedef __kernel_long_t __kernel_old_time_t;



typedef long long __kernel_time64_t;
typedef __kernel_long_t __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef char * __kernel_caddr_t;
typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/posix_types.h" 2
# 37 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/posix_types.h" 2
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/types.h" 2
# 29 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/types.h"
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;
typedef __u64 __le64;
typedef __u64 __be64;

typedef __u16 __sum16;
typedef __u32 __wsum;
# 52 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/types.h"
typedef unsigned __poll_t;
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/types.h" 2






typedef u32 __kernel_dev_t;

typedef __kernel_fd_set fd_set;
typedef __kernel_dev_t dev_t;
typedef __kernel_ino_t ino_t;
typedef __kernel_mode_t mode_t;
typedef unsigned short umode_t;
typedef u32 nlink_t;
typedef __kernel_off_t off_t;
typedef __kernel_pid_t pid_t;
typedef __kernel_daddr_t daddr_t;
typedef __kernel_key_t key_t;
typedef __kernel_suseconds_t suseconds_t;
typedef __kernel_timer_t timer_t;
typedef __kernel_clockid_t clockid_t;
typedef __kernel_mqd_t mqd_t;

typedef _Bool bool;

typedef __kernel_uid32_t uid_t;
typedef __kernel_gid32_t gid_t;
typedef __kernel_uid16_t uid16_t;
typedef __kernel_gid16_t gid16_t;

typedef unsigned long uintptr_t;



typedef __kernel_old_uid_t old_uid_t;
typedef __kernel_old_gid_t old_gid_t;



typedef __kernel_loff_t loff_t;
# 55 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/types.h"
typedef __kernel_size_t size_t;




typedef __kernel_ssize_t ssize_t;




typedef __kernel_ptrdiff_t ptrdiff_t;




typedef __kernel_clock_t clock_t;




typedef __kernel_caddr_t caddr_t;



typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;


typedef unsigned char unchar;
typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;




typedef u8 u_int8_t;
typedef s8 int8_t;
typedef u16 u_int16_t;
typedef s16 int16_t;
typedef u32 u_int32_t;
typedef s32 int32_t;



typedef u8 uint8_t;
typedef u16 uint16_t;
typedef u32 uint32_t;


typedef u64 uint64_t;
typedef u64 u_int64_t;
typedef s64 int64_t;
# 125 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/types.h"
typedef u64 sector_t;
typedef u64 blkcnt_t;
# 143 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/types.h"
typedef u64 dma_addr_t;




typedef unsigned int gfp_t;
typedef unsigned int slab_flags_t;
typedef unsigned int fmode_t;


typedef u64 phys_addr_t;




typedef phys_addr_t resource_size_t;





typedef unsigned long irq_hw_number_t;

typedef struct {
 int counter;
} atomic_t;




typedef struct {
 s64 counter;
} atomic64_t;


struct list_head {
 struct list_head *next, *prev;
};

struct hlist_head {
 struct hlist_node *first;
};

struct hlist_node {
 struct hlist_node *next, **pprev;
};

struct ustat {
 __kernel_daddr_t f_tfree;
 __kernel_ino_t f_tinode;
 char f_fname[6];
 char f_fpack[6];
};
# 216 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/types.h"
struct callback_head {
 struct callback_head *next;
 void (*func)(struct callback_head *head);
} __attribute__((aligned(sizeof(void *))));


typedef void (*rcu_callback_t)(struct callback_head *head);
typedef void (*call_rcu_func_t)(struct callback_head *head, rcu_callback_t func);

typedef void (*swap_func_t)(void *a, void *b, int size);

typedef int (*cmp_r_func_t)(const void *a, const void *b, const void *priv);
typedef int (*cmp_func_t)(const void *a, const void *b);
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/limits.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/limits.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/limits.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/vdso/limits.h" 1
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/limits.h" 2
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h" 2




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/cov_whitelist.h" 1
# 33 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h" 2
# 125 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h"

# 144 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h"

# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h" 2

struct gk20a;
# 39 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
u32 nvgpu_os_readl(uintptr_t addr);
# 52 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
void nvgpu_os_writel(u32 v, uintptr_t addr);
# 65 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
void nvgpu_os_writel_relaxed(u32 v, uintptr_t addr);
# 79 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
uintptr_t nvgpu_io_map(struct gk20a *g, uintptr_t addr, size_t size);
# 92 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
void nvgpu_io_unmap(struct gk20a *g, uintptr_t ptr, size_t size);
# 109 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
struct gk20a;
# 126 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
void nvgpu_writel(struct gk20a *g, u32 r, u32 v);
# 141 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
void nvgpu_writel_relaxed(struct gk20a *g, u32 r, u32 v);
# 159 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
u32 nvgpu_readl(struct gk20a *g, u32 r);
# 175 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
u32 nvgpu_readl_impl(struct gk20a *g, u32 r);
# 191 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
void nvgpu_writel_check(struct gk20a *g, u32 r, u32 v);
# 205 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
void nvgpu_writel_loop(struct gk20a *g, u32 r, u32 v);
# 219 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
void nvgpu_bar1_writel(struct gk20a *g, u32 b, u32 v);
# 232 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
u32 nvgpu_bar1_readl(struct gk20a *g, u32 b);
# 243 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
bool nvgpu_io_exists(struct gk20a *g);
# 256 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
bool nvgpu_io_valid_reg(struct gk20a *g, u32 r);
# 270 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
void nvgpu_func_writel(struct gk20a *g, u32 r, u32 v);
# 283 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/io.h"
u32 nvgpu_func_readl(struct gk20a *g, u32 r);
# 24 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/fifo/engine_status.c" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/engine_status.h" 1
# 66 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/engine_status.h"
enum nvgpu_engine_status_ctx_status {



 NVGPU_CTX_STATUS_INVALID,





 NVGPU_CTX_STATUS_VALID,




 NVGPU_CTX_STATUS_CTXSW_LOAD,




 NVGPU_CTX_STATUS_CTXSW_SAVE,




 NVGPU_CTX_STATUS_CTXSW_SWITCH,
};


struct nvgpu_engine_status_info {

 u32 reg_data;




 u32 reg1_data;


 u32 ctx_id;

 u32 ctxsw_state;

 u32 ctx_id_type;

 u32 ctx_next_id;

 u32 ctx_next_id_type;





 bool is_faulted;






 bool is_busy;



 bool ctxsw_in_progress;
# 140 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/engine_status.h"
 bool in_reload_status;

 enum nvgpu_engine_status_ctx_status ctxsw_status;
};
# 154 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/engine_status.h"
bool nvgpu_engine_status_is_ctxsw_switch(struct nvgpu_engine_status_info
  *engine_status);
# 165 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/engine_status.h"
bool nvgpu_engine_status_is_ctxsw_load(struct nvgpu_engine_status_info
  *engine_status);
# 176 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/engine_status.h"
bool nvgpu_engine_status_is_ctxsw_save(struct nvgpu_engine_status_info
  *engine_status);
# 189 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/engine_status.h"
bool nvgpu_engine_status_is_ctxsw(struct nvgpu_engine_status_info
  *engine_status);
# 200 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/engine_status.h"
bool nvgpu_engine_status_is_ctxsw_invalid(struct nvgpu_engine_status_info
  *engine_status);
# 211 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/engine_status.h"
bool nvgpu_engine_status_is_ctxsw_valid(struct nvgpu_engine_status_info
  *engine_status);
# 222 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/engine_status.h"
bool nvgpu_engine_status_is_ctx_type_tsg(struct nvgpu_engine_status_info
  *engine_status);
# 234 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/engine_status.h"
bool nvgpu_engine_status_is_next_ctx_type_tsg(struct nvgpu_engine_status_info
  *engine_status);
# 249 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/engine_status.h"
void nvgpu_engine_status_get_ctx_id_type(struct nvgpu_engine_status_info
  *engine_status, u32 *ctx_id, u32 *ctx_type);
# 264 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/engine_status.h"
void nvgpu_engine_status_get_next_ctx_id_type(struct nvgpu_engine_status_info
  *engine_status, u32 *ctx_next_id,
  u32 *ctx_next_type);
# 25 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/fifo/engine_status.c" 2

bool nvgpu_engine_status_is_ctxsw_switch(struct nvgpu_engine_status_info
  *engine_status)
{
 return engine_status->ctxsw_status == NVGPU_CTX_STATUS_CTXSW_SWITCH;
}

bool nvgpu_engine_status_is_ctxsw_load(struct nvgpu_engine_status_info
  *engine_status)
{
 return engine_status->ctxsw_status == NVGPU_CTX_STATUS_CTXSW_LOAD;
}

bool nvgpu_engine_status_is_ctxsw_save(struct nvgpu_engine_status_info
  *engine_status)
{
 return engine_status->ctxsw_status == NVGPU_CTX_STATUS_CTXSW_SAVE;
}

bool nvgpu_engine_status_is_ctxsw(struct nvgpu_engine_status_info
  *engine_status)
{
 return (nvgpu_engine_status_is_ctxsw_switch(engine_status) ||
  nvgpu_engine_status_is_ctxsw_load(engine_status) ||
  nvgpu_engine_status_is_ctxsw_save(engine_status));
}

bool nvgpu_engine_status_is_ctxsw_invalid(struct nvgpu_engine_status_info
  *engine_status)
{
 return engine_status->ctxsw_status == NVGPU_CTX_STATUS_INVALID;
}

bool nvgpu_engine_status_is_ctxsw_valid(struct nvgpu_engine_status_info
  *engine_status)
{
 return engine_status->ctxsw_status == NVGPU_CTX_STATUS_VALID;
}
bool nvgpu_engine_status_is_ctx_type_tsg(struct nvgpu_engine_status_info
  *engine_status)
{
 return engine_status->ctx_id_type == 1U;
}
bool nvgpu_engine_status_is_next_ctx_type_tsg(struct nvgpu_engine_status_info
  *engine_status)
{
 return engine_status->ctx_next_id_type ==
  1U;
}

void nvgpu_engine_status_get_ctx_id_type(struct nvgpu_engine_status_info
  *engine_status, u32 *ctx_id, u32 *ctx_type)
{
 *ctx_id = engine_status->ctx_id;
 *ctx_type = engine_status->ctx_id_type;
}

void nvgpu_engine_status_get_next_ctx_id_type(struct nvgpu_engine_status_info
  *engine_status, u32 *ctx_next_id,
  u32 *ctx_next_type)
{
 *ctx_next_id = engine_status->ctx_next_id;
 *ctx_next_type = engine_status->ctx_next_id_type;
}
