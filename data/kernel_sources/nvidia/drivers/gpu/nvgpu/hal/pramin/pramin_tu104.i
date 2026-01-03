# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/pramin/pramin_tu104.c"
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
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/pramin/pramin_tu104.c"
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/pramin/pramin_tu104.c"
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

# 24 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/pramin/pramin_tu104.c" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/pramin/pramin_tu104.h" 1
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/pramin/pramin_tu104.h"
u32 tu104_pramin_data032_r(u32 i);
# 25 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/pramin/pramin_tu104.c" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/hw/tu104/hw_pram_tu104.h" 1
# 60 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/hw/tu104/hw_pram_tu104.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h" 1
# 39 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/bug.h" 1
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/bug.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bug.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bug.h" 1
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bug.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/stringify.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bug.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/asm-bug.h" 1







# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/brk-imm.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/asm-bug.h" 2
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bug.h" 2
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bug.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler.h" 1
# 232 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void *offset_to_ptr(const int *off)
{
 return (void *)((unsigned long)off + *off);
}
# 248 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler.h"
# 1 "./arch/arm64/include/generated/asm/rwonce.h" 1
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/rwonce.h" 1
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/rwonce.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kasan-checks.h" 1
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kasan-checks.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __kasan_check_read(const volatile void *p, unsigned int size)
{
 return true;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __kasan_check_write(const volatile void *p, unsigned int size)
{
 return true;
}
# 34 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kasan-checks.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool kasan_check_read(const volatile void *p, unsigned int size)
{
 return true;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool kasan_check_write(const volatile void *p, unsigned int size)
{
 return true;
}
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/rwonce.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kcsan-checks.h" 1
# 142 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kcsan-checks.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __kcsan_check_access(const volatile void *ptr, size_t size,
     int type) { }

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kcsan_disable_current(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kcsan_enable_current(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kcsan_enable_current_nowarn(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kcsan_nestable_atomic_begin(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kcsan_nestable_atomic_end(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kcsan_flat_atomic_begin(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kcsan_flat_atomic_end(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kcsan_atomic_next(int n) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kcsan_set_access_mask(unsigned long mask) { }

struct kcsan_scoped_access { };

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) struct kcsan_scoped_access *
kcsan_begin_scoped_access(const volatile void *ptr, size_t size, int type,
     struct kcsan_scoped_access *sa) { return sa; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kcsan_end_scoped_access(struct kcsan_scoped_access *sa) { }
# 178 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kcsan-checks.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kcsan_check_access(const volatile void *ptr, size_t size,
          int type) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __kcsan_enable_current(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __kcsan_disable_current(void) { }
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/rwonce.h" 2
# 64 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/rwonce.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__))
unsigned long __read_once_word_nocheck(const void *addr)
{
 return (*(const volatile typeof( _Generic((*(unsigned long *)addr), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*(unsigned long *)addr))) *)&(*(unsigned long *)addr));
}
# 82 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/rwonce.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__))
unsigned long read_word_at_a_time(const void *addr)
{
 kasan_check_read(addr, 1);
 return *(unsigned long *)addr;
}
# 1 "./arch/arm64/include/generated/asm/rwonce.h" 2
# 249 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumentation.h" 1
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h" 2
# 20 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 1





# 1 "/usr/lib/gcc/aarch64-linux-gnu/9/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/aarch64-linux-gnu/9/include/stdarg.h" 3 4

# 40 "/usr/lib/gcc/aarch64-linux-gnu/9/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 99 "/usr/lib/gcc/aarch64-linux-gnu/9/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/linkage.h" 1






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/export.h" 1
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/export.h"

# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/export.h"
extern struct module __this_module;
# 60 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/export.h"
struct kernel_symbol {
 int value_offset;
 int name_offset;
 int namespace_offset;
};
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/linkage.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/linkage.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/linkage.h" 2
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2



# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h" 1



# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 5 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bits.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/const.h" 1



# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/vdso/const.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/const.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/vdso/const.h" 2
# 5 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/const.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bits.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/vdso/bits.h" 1
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bits.h" 2
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bits.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/build_bug.h" 1
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bits.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h" 2
# 20 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h"
extern unsigned int __sw_hweight8(unsigned int w);
extern unsigned int __sw_hweight16(unsigned int w);
extern unsigned int __sw_hweight32(unsigned int w);
extern unsigned long __sw_hweight64(__u64 w);





# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 1
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-__ffs.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-__ffs.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __ffs(unsigned long word)
{
 return __builtin_ctzl(word);
}
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-ffs.h" 1
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-ffs.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int ffs(int x)
{
 return __builtin_ffs(x);
}
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-__fls.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-__fls.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __fls(unsigned long word)
{
 return (sizeof(word) * 8) - 1 - __builtin_clzl(word);
}
# 17 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-fls.h" 1
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-fls.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int fls(unsigned int x)
{
 return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
}
# 18 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/ffz.h" 1
# 20 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/fls64.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/fls64.h" 2
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/fls64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int fls64(__u64 x)
{
 if (x == 0)
  return 0;
 return __fls(x) + 1;
}
# 21 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/find.h" 1
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/find.h"
extern unsigned long find_next_bit(const unsigned long *addr, unsigned long
  size, unsigned long offset);
# 30 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/find.h"
extern unsigned long find_next_and_bit(const unsigned long *addr1,
  const unsigned long *addr2, unsigned long size,
  unsigned long offset);
# 45 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/find.h"
extern unsigned long find_next_zero_bit(const unsigned long *addr, unsigned
  long size, unsigned long offset);
# 93 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/find.h"
extern unsigned long find_next_clump8(unsigned long *clump,
          const unsigned long *addr,
          unsigned long size, unsigned long offset);
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/sched.h" 1





# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/sched.h" 2






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int sched_find_first_bit(const unsigned long *b)
{

 if (b[0])
  return __ffs(b[0]);
 return __ffs(b[1]) + 64;
# 30 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/sched.h"
}
# 24 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/hweight.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/arch_hweight.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/arch_hweight.h" 2

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int __arch_hweight32(unsigned int w)
{
 return __sw_hweight32(w);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int __arch_hweight16(unsigned int w)
{
 return __sw_hweight16(w);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int __arch_hweight8(unsigned int w)
{
 return __sw_hweight8(w);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long __arch_hweight64(__u64 w)
{
 return __sw_hweight64(w);
}
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/hweight.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/const_hweight.h" 1
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/hweight.h" 2
# 25 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/atomic.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic.h" 1






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h" 1
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/barrier.h" 1
# 57 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/barrier.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long array_index_mask_nospec(unsigned long idx,
          unsigned long sz)
{
 unsigned long mask;

 asm volatile(
 "	cmp	%1, %2\n"
 "	sbc	%0, xzr, xzr\n"
 : "=r" (mask)
 : "r" (idx), "Ir" (sz)
 : "cc");

 asm volatile("hint #20" : : : "memory");
 return mask;
}
# 188 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/barrier.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/barrier.h" 1
# 17 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/barrier.h"
# 1 "./arch/arm64/include/generated/asm/rwonce.h" 1
# 18 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/barrier.h" 2
# 189 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/barrier.h" 2
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h" 1
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/lse.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h" 1
# 95 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic_add(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_add_return(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_add_return_relaxed(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "_relaxed" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_add_return_acquire(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "_acquire" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_add_return_release(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "_release" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_add(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_add_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_add_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_add_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic_sub(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_sub_return(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_sub_return_relaxed(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "_relaxed" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_sub_return_acquire(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "_acquire" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_sub_return_release(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "_release" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_sub(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_sub_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_sub_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_sub_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; }
# 106 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic_and(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "and" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "and" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_and(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_and_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_and_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_and_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic_or(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "or" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "orr" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_or(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_or_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_or_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_or_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic_xor(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "xor" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "eor" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_xor(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_xor_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_xor_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_xor_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; }





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic_andnot(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "andnot" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "bic" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_andnot(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_andnot_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_andnot_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_andnot_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; }
# 191 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic64_add(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_add_return(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_add_return_relaxed(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "_relaxed" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_add_return_acquire(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "_acquire" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_add_return_release(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "_release" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_add(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_add_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_add_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_add_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic64_sub(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_sub_return(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_sub_return_relaxed(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "_relaxed" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_sub_return_acquire(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "_acquire" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_sub_return_release(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "_release" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_sub(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_sub_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_sub_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_sub_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; }
# 202 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic64_and(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "and" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "and" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_and(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_and_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_and_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_and_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic64_or(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "or" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "orr" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_or(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_or_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_or_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_or_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic64_xor(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "xor" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "eor" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_xor(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_xor_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_xor_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_xor_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; }





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic64_andnot(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "andnot" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "bic" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_andnot(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_andnot_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_andnot_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_andnot_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; }






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64
__ll_sc_atomic64_dec_if_positive(atomic64_t *v)
{
 s64 result;
 unsigned long tmp;

 asm volatile("// atomic64_dec_if_positive\n"
 "	prfm	pstl1strm, %2\n"
 "1:	ldxr	%0, %2\n"
 "	subs	%0, %0, #1\n"
 "	b.lt	2f\n"
 "	stlxr	%w1, %0, %2\n"
 "	cbnz	%w1, 1b\n"
 "	dmb	ish\n"
 "2:"
 : "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
 :
 : "cc", "memory");

 return result;
}
# 278 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __ll_sc__cmpxchg_case_8(volatile void *ptr, unsigned long old, u8 new) { unsigned long tmp; u8 oldval; if (8 < 32) old = (u8)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u8 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : ); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __ll_sc__cmpxchg_case_16(volatile void *ptr, unsigned long old, u16 new) { unsigned long tmp; u16 oldval; if (16 < 32) old = (u16)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u16 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : ); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __ll_sc__cmpxchg_case_32(volatile void *ptr, unsigned long old, u32 new) { unsigned long tmp; u32 oldval; if (32 < 32) old = (u32)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u32 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : ); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __ll_sc__cmpxchg_case_64(volatile void *ptr, unsigned long old, u64 new) { unsigned long tmp; u64 oldval; if (64 < 32) old = (u64)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u64 *)ptr) : [old] "L" "r" (old), [new] "r" (new) : ); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __ll_sc__cmpxchg_case_acq_8(volatile void *ptr, unsigned long old, u8 new) { unsigned long tmp; u8 oldval; if (8 < 32) old = (u8)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u8 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __ll_sc__cmpxchg_case_acq_16(volatile void *ptr, unsigned long old, u16 new) { unsigned long tmp; u16 oldval; if (16 < 32) old = (u16)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u16 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __ll_sc__cmpxchg_case_acq_32(volatile void *ptr, unsigned long old, u32 new) { unsigned long tmp; u32 oldval; if (32 < 32) old = (u32)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u32 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __ll_sc__cmpxchg_case_acq_64(volatile void *ptr, unsigned long old, u64 new) { unsigned long tmp; u64 oldval; if (64 < 32) old = (u64)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u64 *)ptr) : [old] "L" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __ll_sc__cmpxchg_case_rel_8(volatile void *ptr, unsigned long old, u8 new) { unsigned long tmp; u8 oldval; if (8 < 32) old = (u8)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u8 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __ll_sc__cmpxchg_case_rel_16(volatile void *ptr, unsigned long old, u16 new) { unsigned long tmp; u16 oldval; if (16 < 32) old = (u16)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u16 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __ll_sc__cmpxchg_case_rel_32(volatile void *ptr, unsigned long old, u32 new) { unsigned long tmp; u32 oldval; if (32 < 32) old = (u32)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u32 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __ll_sc__cmpxchg_case_rel_64(volatile void *ptr, unsigned long old, u64 new) { unsigned long tmp; u64 oldval; if (64 < 32) old = (u64)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u64 *)ptr) : [old] "L" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __ll_sc__cmpxchg_case_mb_8(volatile void *ptr, unsigned long old, u8 new) { unsigned long tmp; u8 oldval; if (8 < 32) old = (u8)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u8 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __ll_sc__cmpxchg_case_mb_16(volatile void *ptr, unsigned long old, u16 new) { unsigned long tmp; u16 oldval; if (16 < 32) old = (u16)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u16 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __ll_sc__cmpxchg_case_mb_32(volatile void *ptr, unsigned long old, u32 new) { unsigned long tmp; u32 oldval; if (32 < 32) old = (u32)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u32 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __ll_sc__cmpxchg_case_mb_64(volatile void *ptr, unsigned long old, u64 new) { unsigned long tmp; u64 oldval; if (64 < 32) old = (u64)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u64 *)ptr) : [old] "L" "r" (old), [new] "r" (new) : "memory"); return oldval; }
# 325 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc__cmpxchg_double(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { unsigned long tmp, ret; asm volatile("// __cmpxchg_double" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxp	%0, %1, %2\n" "	eor	%0, %0, %3\n" "	eor	%1, %1, %4\n" "	orr	%1, %0, %1\n" "	cbnz	%1, 2f\n" "	st" "" "xp	%w0, %5, %6, %2\n" "	cbnz	%w0, 1b\n" "	" "" "\n" "2:" : "=&r" (tmp), "=&r" (ret), "+Q" (*(__uint128_t *)ptr) : "r" (old1), "r" (old2), "r" (new1), "r" (new2) : ); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc__cmpxchg_double_mb(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { unsigned long tmp, ret; asm volatile("// __cmpxchg_double" "_mb" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxp	%0, %1, %2\n" "	eor	%0, %0, %3\n" "	eor	%1, %1, %4\n" "	orr	%1, %0, %1\n" "	cbnz	%1, 2f\n" "	st" "l" "xp	%w0, %5, %6, %2\n" "	cbnz	%w0, 1b\n" "	" "dmb ish" "\n" "2:" : "=&r" (tmp), "=&r" (ret), "+Q" (*(__uint128_t *)ptr) : "r" (old1), "r" (old2), "r" (new1), "r" (new2) : "memory"); return ret; }
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/lse.h" 2







# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h" 1
# 79 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
extern bool static_key_initialized;







struct static_key {
 atomic_t enabled;
# 102 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
 union {
  unsigned long type;
  struct jump_entry *entries;
  struct static_key_mod *next;
 };
};
# 117 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/jump_label.h" 1
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/jump_label.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/insn.h" 1
# 32 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/insn.h"
enum aarch64_insn_encoding_class {
 AARCH64_INSN_CLS_UNKNOWN,
 AARCH64_INSN_CLS_DP_IMM,
 AARCH64_INSN_CLS_DP_REG,
 AARCH64_INSN_CLS_DP_FPSIMD,
 AARCH64_INSN_CLS_LDST,
 AARCH64_INSN_CLS_BR_SYS,

};

enum aarch64_insn_hint_cr_op {
 AARCH64_INSN_HINT_NOP = 0x0 << 5,
 AARCH64_INSN_HINT_YIELD = 0x1 << 5,
 AARCH64_INSN_HINT_WFE = 0x2 << 5,
 AARCH64_INSN_HINT_WFI = 0x3 << 5,
 AARCH64_INSN_HINT_SEV = 0x4 << 5,
 AARCH64_INSN_HINT_SEVL = 0x5 << 5,

 AARCH64_INSN_HINT_XPACLRI = 0x07 << 5,
 AARCH64_INSN_HINT_PACIA_1716 = 0x08 << 5,
 AARCH64_INSN_HINT_PACIB_1716 = 0x0A << 5,
 AARCH64_INSN_HINT_AUTIA_1716 = 0x0C << 5,
 AARCH64_INSN_HINT_AUTIB_1716 = 0x0E << 5,
 AARCH64_INSN_HINT_PACIAZ = 0x18 << 5,
 AARCH64_INSN_HINT_PACIASP = 0x19 << 5,
 AARCH64_INSN_HINT_PACIBZ = 0x1A << 5,
 AARCH64_INSN_HINT_PACIBSP = 0x1B << 5,
 AARCH64_INSN_HINT_AUTIAZ = 0x1C << 5,
 AARCH64_INSN_HINT_AUTIASP = 0x1D << 5,
 AARCH64_INSN_HINT_AUTIBZ = 0x1E << 5,
 AARCH64_INSN_HINT_AUTIBSP = 0x1F << 5,

 AARCH64_INSN_HINT_ESB = 0x10 << 5,
 AARCH64_INSN_HINT_PSB = 0x11 << 5,
 AARCH64_INSN_HINT_TSB = 0x12 << 5,
 AARCH64_INSN_HINT_CSDB = 0x14 << 5,
 AARCH64_INSN_HINT_CLEARBHB = 0x16 << 5,

 AARCH64_INSN_HINT_BTI = 0x20 << 5,
 AARCH64_INSN_HINT_BTIC = 0x22 << 5,
 AARCH64_INSN_HINT_BTIJ = 0x24 << 5,
 AARCH64_INSN_HINT_BTIJC = 0x26 << 5,
};

enum aarch64_insn_imm_type {
 AARCH64_INSN_IMM_ADR,
 AARCH64_INSN_IMM_26,
 AARCH64_INSN_IMM_19,
 AARCH64_INSN_IMM_16,
 AARCH64_INSN_IMM_14,
 AARCH64_INSN_IMM_12,
 AARCH64_INSN_IMM_9,
 AARCH64_INSN_IMM_7,
 AARCH64_INSN_IMM_6,
 AARCH64_INSN_IMM_S,
 AARCH64_INSN_IMM_R,
 AARCH64_INSN_IMM_N,
 AARCH64_INSN_IMM_MAX
};

enum aarch64_insn_register_type {
 AARCH64_INSN_REGTYPE_RT,
 AARCH64_INSN_REGTYPE_RN,
 AARCH64_INSN_REGTYPE_RT2,
 AARCH64_INSN_REGTYPE_RM,
 AARCH64_INSN_REGTYPE_RD,
 AARCH64_INSN_REGTYPE_RA,
 AARCH64_INSN_REGTYPE_RS,
};

enum aarch64_insn_register {
 AARCH64_INSN_REG_0 = 0,
 AARCH64_INSN_REG_1 = 1,
 AARCH64_INSN_REG_2 = 2,
 AARCH64_INSN_REG_3 = 3,
 AARCH64_INSN_REG_4 = 4,
 AARCH64_INSN_REG_5 = 5,
 AARCH64_INSN_REG_6 = 6,
 AARCH64_INSN_REG_7 = 7,
 AARCH64_INSN_REG_8 = 8,
 AARCH64_INSN_REG_9 = 9,
 AARCH64_INSN_REG_10 = 10,
 AARCH64_INSN_REG_11 = 11,
 AARCH64_INSN_REG_12 = 12,
 AARCH64_INSN_REG_13 = 13,
 AARCH64_INSN_REG_14 = 14,
 AARCH64_INSN_REG_15 = 15,
 AARCH64_INSN_REG_16 = 16,
 AARCH64_INSN_REG_17 = 17,
 AARCH64_INSN_REG_18 = 18,
 AARCH64_INSN_REG_19 = 19,
 AARCH64_INSN_REG_20 = 20,
 AARCH64_INSN_REG_21 = 21,
 AARCH64_INSN_REG_22 = 22,
 AARCH64_INSN_REG_23 = 23,
 AARCH64_INSN_REG_24 = 24,
 AARCH64_INSN_REG_25 = 25,
 AARCH64_INSN_REG_26 = 26,
 AARCH64_INSN_REG_27 = 27,
 AARCH64_INSN_REG_28 = 28,
 AARCH64_INSN_REG_29 = 29,
 AARCH64_INSN_REG_FP = 29,
 AARCH64_INSN_REG_30 = 30,
 AARCH64_INSN_REG_LR = 30,
 AARCH64_INSN_REG_ZR = 31,
 AARCH64_INSN_REG_SP = 31
};

enum aarch64_insn_special_register {
 AARCH64_INSN_SPCLREG_SPSR_EL1 = 0xC200,
 AARCH64_INSN_SPCLREG_ELR_EL1 = 0xC201,
 AARCH64_INSN_SPCLREG_SP_EL0 = 0xC208,
 AARCH64_INSN_SPCLREG_SPSEL = 0xC210,
 AARCH64_INSN_SPCLREG_CURRENTEL = 0xC212,
 AARCH64_INSN_SPCLREG_DAIF = 0xDA11,
 AARCH64_INSN_SPCLREG_NZCV = 0xDA10,
 AARCH64_INSN_SPCLREG_FPCR = 0xDA20,
 AARCH64_INSN_SPCLREG_DSPSR_EL0 = 0xDA28,
 AARCH64_INSN_SPCLREG_DLR_EL0 = 0xDA29,
 AARCH64_INSN_SPCLREG_SPSR_EL2 = 0xE200,
 AARCH64_INSN_SPCLREG_ELR_EL2 = 0xE201,
 AARCH64_INSN_SPCLREG_SP_EL1 = 0xE208,
 AARCH64_INSN_SPCLREG_SPSR_INQ = 0xE218,
 AARCH64_INSN_SPCLREG_SPSR_ABT = 0xE219,
 AARCH64_INSN_SPCLREG_SPSR_UND = 0xE21A,
 AARCH64_INSN_SPCLREG_SPSR_FIQ = 0xE21B,
 AARCH64_INSN_SPCLREG_SPSR_EL3 = 0xF200,
 AARCH64_INSN_SPCLREG_ELR_EL3 = 0xF201,
 AARCH64_INSN_SPCLREG_SP_EL2 = 0xF210
};

enum aarch64_insn_variant {
 AARCH64_INSN_VARIANT_32BIT,
 AARCH64_INSN_VARIANT_64BIT
};

enum aarch64_insn_condition {
 AARCH64_INSN_COND_EQ = 0x0,
 AARCH64_INSN_COND_NE = 0x1,
 AARCH64_INSN_COND_CS = 0x2,
 AARCH64_INSN_COND_CC = 0x3,
 AARCH64_INSN_COND_MI = 0x4,
 AARCH64_INSN_COND_PL = 0x5,
 AARCH64_INSN_COND_VS = 0x6,
 AARCH64_INSN_COND_VC = 0x7,
 AARCH64_INSN_COND_HI = 0x8,
 AARCH64_INSN_COND_LS = 0x9,
 AARCH64_INSN_COND_GE = 0xa,
 AARCH64_INSN_COND_LT = 0xb,
 AARCH64_INSN_COND_GT = 0xc,
 AARCH64_INSN_COND_LE = 0xd,
 AARCH64_INSN_COND_AL = 0xe,
};

enum aarch64_insn_branch_type {
 AARCH64_INSN_BRANCH_NOLINK,
 AARCH64_INSN_BRANCH_LINK,
 AARCH64_INSN_BRANCH_RETURN,
 AARCH64_INSN_BRANCH_COMP_ZERO,
 AARCH64_INSN_BRANCH_COMP_NONZERO,
};

enum aarch64_insn_size_type {
 AARCH64_INSN_SIZE_8,
 AARCH64_INSN_SIZE_16,
 AARCH64_INSN_SIZE_32,
 AARCH64_INSN_SIZE_64,
};

enum aarch64_insn_ldst_type {
 AARCH64_INSN_LDST_LOAD_REG_OFFSET,
 AARCH64_INSN_LDST_STORE_REG_OFFSET,
 AARCH64_INSN_LDST_LOAD_PAIR_PRE_INDEX,
 AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX,
 AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX,
 AARCH64_INSN_LDST_STORE_PAIR_POST_INDEX,
 AARCH64_INSN_LDST_LOAD_EX,
 AARCH64_INSN_LDST_STORE_EX,
};

enum aarch64_insn_adsb_type {
 AARCH64_INSN_ADSB_ADD,
 AARCH64_INSN_ADSB_SUB,
 AARCH64_INSN_ADSB_ADD_SETFLAGS,
 AARCH64_INSN_ADSB_SUB_SETFLAGS
};

enum aarch64_insn_movewide_type {
 AARCH64_INSN_MOVEWIDE_ZERO,
 AARCH64_INSN_MOVEWIDE_KEEP,
 AARCH64_INSN_MOVEWIDE_INVERSE
};

enum aarch64_insn_bitfield_type {
 AARCH64_INSN_BITFIELD_MOVE,
 AARCH64_INSN_BITFIELD_MOVE_UNSIGNED,
 AARCH64_INSN_BITFIELD_MOVE_SIGNED
};

enum aarch64_insn_data1_type {
 AARCH64_INSN_DATA1_REVERSE_16,
 AARCH64_INSN_DATA1_REVERSE_32,
 AARCH64_INSN_DATA1_REVERSE_64,
};

enum aarch64_insn_data2_type {
 AARCH64_INSN_DATA2_UDIV,
 AARCH64_INSN_DATA2_SDIV,
 AARCH64_INSN_DATA2_LSLV,
 AARCH64_INSN_DATA2_LSRV,
 AARCH64_INSN_DATA2_ASRV,
 AARCH64_INSN_DATA2_RORV,
};

enum aarch64_insn_data3_type {
 AARCH64_INSN_DATA3_MADD,
 AARCH64_INSN_DATA3_MSUB,
};

enum aarch64_insn_logic_type {
 AARCH64_INSN_LOGIC_AND,
 AARCH64_INSN_LOGIC_BIC,
 AARCH64_INSN_LOGIC_ORR,
 AARCH64_INSN_LOGIC_ORN,
 AARCH64_INSN_LOGIC_EOR,
 AARCH64_INSN_LOGIC_EON,
 AARCH64_INSN_LOGIC_AND_SETFLAGS,
 AARCH64_INSN_LOGIC_BIC_SETFLAGS
};

enum aarch64_insn_prfm_type {
 AARCH64_INSN_PRFM_TYPE_PLD,
 AARCH64_INSN_PRFM_TYPE_PLI,
 AARCH64_INSN_PRFM_TYPE_PST,
};

enum aarch64_insn_prfm_target {
 AARCH64_INSN_PRFM_TARGET_L1,
 AARCH64_INSN_PRFM_TARGET_L2,
 AARCH64_INSN_PRFM_TARGET_L3,
};

enum aarch64_insn_prfm_policy {
 AARCH64_INSN_PRFM_POLICY_KEEP,
 AARCH64_INSN_PRFM_POLICY_STRM,
};

enum aarch64_insn_adr_type {
 AARCH64_INSN_ADR_TYPE_ADRP,
 AARCH64_INSN_ADR_TYPE_ADR,
};
# 295 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/insn.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_adr(u32 code) { do { extern void __compiletime_assert_0(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x9F000000) & (0x10000000)"))); if (!(!(~(0x9F000000) & (0x10000000)))) __compiletime_assert_0(); } while (0); return (code & (0x9F000000)) == (0x10000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_adr_value(void) { return (0x10000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_adrp(u32 code) { do { extern void __compiletime_assert_1(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x9F000000) & (0x90000000)"))); if (!(!(~(0x9F000000) & (0x90000000)))) __compiletime_assert_1(); } while (0); return (code & (0x9F000000)) == (0x90000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_adrp_value(void) { return (0x90000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_prfm(u32 code) { do { extern void __compiletime_assert_2(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x3FC00000) & (0x39800000)"))); if (!(!(~(0x3FC00000) & (0x39800000)))) __compiletime_assert_2(); } while (0); return (code & (0x3FC00000)) == (0x39800000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_prfm_value(void) { return (0x39800000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_prfm_lit(u32 code) { do { extern void __compiletime_assert_3(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFF000000) & (0xD8000000)"))); if (!(!(~(0xFF000000) & (0xD8000000)))) __compiletime_assert_3(); } while (0); return (code & (0xFF000000)) == (0xD8000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_prfm_lit_value(void) { return (0xD8000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_str_reg(u32 code) { do { extern void __compiletime_assert_4(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x3FE0EC00) & (0x38206800)"))); if (!(!(~(0x3FE0EC00) & (0x38206800)))) __compiletime_assert_4(); } while (0); return (code & (0x3FE0EC00)) == (0x38206800); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_str_reg_value(void) { return (0x38206800); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_ldadd(u32 code) { do { extern void __compiletime_assert_5(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x3F20FC00) & (0x38200000)"))); if (!(!(~(0x3F20FC00) & (0x38200000)))) __compiletime_assert_5(); } while (0); return (code & (0x3F20FC00)) == (0x38200000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_ldadd_value(void) { return (0x38200000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_ldr_reg(u32 code) { do { extern void __compiletime_assert_6(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x3FE0EC00) & (0x38606800)"))); if (!(!(~(0x3FE0EC00) & (0x38606800)))) __compiletime_assert_6(); } while (0); return (code & (0x3FE0EC00)) == (0x38606800); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_ldr_reg_value(void) { return (0x38606800); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_ldr_lit(u32 code) { do { extern void __compiletime_assert_7(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xBF000000) & (0x18000000)"))); if (!(!(~(0xBF000000) & (0x18000000)))) __compiletime_assert_7(); } while (0); return (code & (0xBF000000)) == (0x18000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_ldr_lit_value(void) { return (0x18000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_ldrsw_lit(u32 code) { do { extern void __compiletime_assert_8(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFF000000) & (0x98000000)"))); if (!(!(~(0xFF000000) & (0x98000000)))) __compiletime_assert_8(); } while (0); return (code & (0xFF000000)) == (0x98000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_ldrsw_lit_value(void) { return (0x98000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_exclusive(u32 code) { do { extern void __compiletime_assert_9(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x3F800000) & (0x08000000)"))); if (!(!(~(0x3F800000) & (0x08000000)))) __compiletime_assert_9(); } while (0); return (code & (0x3F800000)) == (0x08000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_exclusive_value(void) { return (0x08000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_load_ex(u32 code) { do { extern void __compiletime_assert_10(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x3F400000) & (0x08400000)"))); if (!(!(~(0x3F400000) & (0x08400000)))) __compiletime_assert_10(); } while (0); return (code & (0x3F400000)) == (0x08400000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_load_ex_value(void) { return (0x08400000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_store_ex(u32 code) { do { extern void __compiletime_assert_11(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x3F400000) & (0x08000000)"))); if (!(!(~(0x3F400000) & (0x08000000)))) __compiletime_assert_11(); } while (0); return (code & (0x3F400000)) == (0x08000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_store_ex_value(void) { return (0x08000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_stp_post(u32 code) { do { extern void __compiletime_assert_12(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FC00000) & (0x28800000)"))); if (!(!(~(0x7FC00000) & (0x28800000)))) __compiletime_assert_12(); } while (0); return (code & (0x7FC00000)) == (0x28800000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_stp_post_value(void) { return (0x28800000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_ldp_post(u32 code) { do { extern void __compiletime_assert_13(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FC00000) & (0x28C00000)"))); if (!(!(~(0x7FC00000) & (0x28C00000)))) __compiletime_assert_13(); } while (0); return (code & (0x7FC00000)) == (0x28C00000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_ldp_post_value(void) { return (0x28C00000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_stp_pre(u32 code) { do { extern void __compiletime_assert_14(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FC00000) & (0x29800000)"))); if (!(!(~(0x7FC00000) & (0x29800000)))) __compiletime_assert_14(); } while (0); return (code & (0x7FC00000)) == (0x29800000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_stp_pre_value(void) { return (0x29800000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_ldp_pre(u32 code) { do { extern void __compiletime_assert_15(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FC00000) & (0x29C00000)"))); if (!(!(~(0x7FC00000) & (0x29C00000)))) __compiletime_assert_15(); } while (0); return (code & (0x7FC00000)) == (0x29C00000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_ldp_pre_value(void) { return (0x29C00000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_add_imm(u32 code) { do { extern void __compiletime_assert_16(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F000000) & (0x11000000)"))); if (!(!(~(0x7F000000) & (0x11000000)))) __compiletime_assert_16(); } while (0); return (code & (0x7F000000)) == (0x11000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_add_imm_value(void) { return (0x11000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_adds_imm(u32 code) { do { extern void __compiletime_assert_17(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F000000) & (0x31000000)"))); if (!(!(~(0x7F000000) & (0x31000000)))) __compiletime_assert_17(); } while (0); return (code & (0x7F000000)) == (0x31000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_adds_imm_value(void) { return (0x31000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_sub_imm(u32 code) { do { extern void __compiletime_assert_18(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F000000) & (0x51000000)"))); if (!(!(~(0x7F000000) & (0x51000000)))) __compiletime_assert_18(); } while (0); return (code & (0x7F000000)) == (0x51000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_sub_imm_value(void) { return (0x51000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_subs_imm(u32 code) { do { extern void __compiletime_assert_19(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F000000) & (0x71000000)"))); if (!(!(~(0x7F000000) & (0x71000000)))) __compiletime_assert_19(); } while (0); return (code & (0x7F000000)) == (0x71000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_subs_imm_value(void) { return (0x71000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_movn(u32 code) { do { extern void __compiletime_assert_20(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F800000) & (0x12800000)"))); if (!(!(~(0x7F800000) & (0x12800000)))) __compiletime_assert_20(); } while (0); return (code & (0x7F800000)) == (0x12800000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_movn_value(void) { return (0x12800000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_sbfm(u32 code) { do { extern void __compiletime_assert_21(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F800000) & (0x13000000)"))); if (!(!(~(0x7F800000) & (0x13000000)))) __compiletime_assert_21(); } while (0); return (code & (0x7F800000)) == (0x13000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_sbfm_value(void) { return (0x13000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_bfm(u32 code) { do { extern void __compiletime_assert_22(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F800000) & (0x33000000)"))); if (!(!(~(0x7F800000) & (0x33000000)))) __compiletime_assert_22(); } while (0); return (code & (0x7F800000)) == (0x33000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_bfm_value(void) { return (0x33000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_movz(u32 code) { do { extern void __compiletime_assert_23(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F800000) & (0x52800000)"))); if (!(!(~(0x7F800000) & (0x52800000)))) __compiletime_assert_23(); } while (0); return (code & (0x7F800000)) == (0x52800000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_movz_value(void) { return (0x52800000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_ubfm(u32 code) { do { extern void __compiletime_assert_24(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F800000) & (0x53000000)"))); if (!(!(~(0x7F800000) & (0x53000000)))) __compiletime_assert_24(); } while (0); return (code & (0x7F800000)) == (0x53000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_ubfm_value(void) { return (0x53000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_movk(u32 code) { do { extern void __compiletime_assert_25(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F800000) & (0x72800000)"))); if (!(!(~(0x7F800000) & (0x72800000)))) __compiletime_assert_25(); } while (0); return (code & (0x7F800000)) == (0x72800000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_movk_value(void) { return (0x72800000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_add(u32 code) { do { extern void __compiletime_assert_26(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F200000) & (0x0B000000)"))); if (!(!(~(0x7F200000) & (0x0B000000)))) __compiletime_assert_26(); } while (0); return (code & (0x7F200000)) == (0x0B000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_add_value(void) { return (0x0B000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_adds(u32 code) { do { extern void __compiletime_assert_27(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F200000) & (0x2B000000)"))); if (!(!(~(0x7F200000) & (0x2B000000)))) __compiletime_assert_27(); } while (0); return (code & (0x7F200000)) == (0x2B000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_adds_value(void) { return (0x2B000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_sub(u32 code) { do { extern void __compiletime_assert_28(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F200000) & (0x4B000000)"))); if (!(!(~(0x7F200000) & (0x4B000000)))) __compiletime_assert_28(); } while (0); return (code & (0x7F200000)) == (0x4B000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_sub_value(void) { return (0x4B000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_subs(u32 code) { do { extern void __compiletime_assert_29(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F200000) & (0x6B000000)"))); if (!(!(~(0x7F200000) & (0x6B000000)))) __compiletime_assert_29(); } while (0); return (code & (0x7F200000)) == (0x6B000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_subs_value(void) { return (0x6B000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_madd(u32 code) { do { extern void __compiletime_assert_30(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FE08000) & (0x1B000000)"))); if (!(!(~(0x7FE08000) & (0x1B000000)))) __compiletime_assert_30(); } while (0); return (code & (0x7FE08000)) == (0x1B000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_madd_value(void) { return (0x1B000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_msub(u32 code) { do { extern void __compiletime_assert_31(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FE08000) & (0x1B008000)"))); if (!(!(~(0x7FE08000) & (0x1B008000)))) __compiletime_assert_31(); } while (0); return (code & (0x7FE08000)) == (0x1B008000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_msub_value(void) { return (0x1B008000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_udiv(u32 code) { do { extern void __compiletime_assert_32(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FE0FC00) & (0x1AC00800)"))); if (!(!(~(0x7FE0FC00) & (0x1AC00800)))) __compiletime_assert_32(); } while (0); return (code & (0x7FE0FC00)) == (0x1AC00800); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_udiv_value(void) { return (0x1AC00800); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_sdiv(u32 code) { do { extern void __compiletime_assert_33(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FE0FC00) & (0x1AC00C00)"))); if (!(!(~(0x7FE0FC00) & (0x1AC00C00)))) __compiletime_assert_33(); } while (0); return (code & (0x7FE0FC00)) == (0x1AC00C00); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_sdiv_value(void) { return (0x1AC00C00); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_lslv(u32 code) { do { extern void __compiletime_assert_34(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FE0FC00) & (0x1AC02000)"))); if (!(!(~(0x7FE0FC00) & (0x1AC02000)))) __compiletime_assert_34(); } while (0); return (code & (0x7FE0FC00)) == (0x1AC02000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_lslv_value(void) { return (0x1AC02000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_lsrv(u32 code) { do { extern void __compiletime_assert_35(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FE0FC00) & (0x1AC02400)"))); if (!(!(~(0x7FE0FC00) & (0x1AC02400)))) __compiletime_assert_35(); } while (0); return (code & (0x7FE0FC00)) == (0x1AC02400); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_lsrv_value(void) { return (0x1AC02400); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_asrv(u32 code) { do { extern void __compiletime_assert_36(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FE0FC00) & (0x1AC02800)"))); if (!(!(~(0x7FE0FC00) & (0x1AC02800)))) __compiletime_assert_36(); } while (0); return (code & (0x7FE0FC00)) == (0x1AC02800); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_asrv_value(void) { return (0x1AC02800); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_rorv(u32 code) { do { extern void __compiletime_assert_37(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FE0FC00) & (0x1AC02C00)"))); if (!(!(~(0x7FE0FC00) & (0x1AC02C00)))) __compiletime_assert_37(); } while (0); return (code & (0x7FE0FC00)) == (0x1AC02C00); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_rorv_value(void) { return (0x1AC02C00); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_rev16(u32 code) { do { extern void __compiletime_assert_38(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FFFFC00) & (0x5AC00400)"))); if (!(!(~(0x7FFFFC00) & (0x5AC00400)))) __compiletime_assert_38(); } while (0); return (code & (0x7FFFFC00)) == (0x5AC00400); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_rev16_value(void) { return (0x5AC00400); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_rev32(u32 code) { do { extern void __compiletime_assert_39(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FFFFC00) & (0x5AC00800)"))); if (!(!(~(0x7FFFFC00) & (0x5AC00800)))) __compiletime_assert_39(); } while (0); return (code & (0x7FFFFC00)) == (0x5AC00800); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_rev32_value(void) { return (0x5AC00800); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_rev64(u32 code) { do { extern void __compiletime_assert_40(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FFFFC00) & (0x5AC00C00)"))); if (!(!(~(0x7FFFFC00) & (0x5AC00C00)))) __compiletime_assert_40(); } while (0); return (code & (0x7FFFFC00)) == (0x5AC00C00); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_rev64_value(void) { return (0x5AC00C00); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_and(u32 code) { do { extern void __compiletime_assert_41(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F200000) & (0x0A000000)"))); if (!(!(~(0x7F200000) & (0x0A000000)))) __compiletime_assert_41(); } while (0); return (code & (0x7F200000)) == (0x0A000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_and_value(void) { return (0x0A000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_bic(u32 code) { do { extern void __compiletime_assert_42(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F200000) & (0x0A200000)"))); if (!(!(~(0x7F200000) & (0x0A200000)))) __compiletime_assert_42(); } while (0); return (code & (0x7F200000)) == (0x0A200000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_bic_value(void) { return (0x0A200000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_orr(u32 code) { do { extern void __compiletime_assert_43(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F200000) & (0x2A000000)"))); if (!(!(~(0x7F200000) & (0x2A000000)))) __compiletime_assert_43(); } while (0); return (code & (0x7F200000)) == (0x2A000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_orr_value(void) { return (0x2A000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_orn(u32 code) { do { extern void __compiletime_assert_44(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F200000) & (0x2A200000)"))); if (!(!(~(0x7F200000) & (0x2A200000)))) __compiletime_assert_44(); } while (0); return (code & (0x7F200000)) == (0x2A200000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_orn_value(void) { return (0x2A200000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_eor(u32 code) { do { extern void __compiletime_assert_45(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F200000) & (0x4A000000)"))); if (!(!(~(0x7F200000) & (0x4A000000)))) __compiletime_assert_45(); } while (0); return (code & (0x7F200000)) == (0x4A000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_eor_value(void) { return (0x4A000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_eon(u32 code) { do { extern void __compiletime_assert_46(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F200000) & (0x4A200000)"))); if (!(!(~(0x7F200000) & (0x4A200000)))) __compiletime_assert_46(); } while (0); return (code & (0x7F200000)) == (0x4A200000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_eon_value(void) { return (0x4A200000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_ands(u32 code) { do { extern void __compiletime_assert_47(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F200000) & (0x6A000000)"))); if (!(!(~(0x7F200000) & (0x6A000000)))) __compiletime_assert_47(); } while (0); return (code & (0x7F200000)) == (0x6A000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_ands_value(void) { return (0x6A000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_bics(u32 code) { do { extern void __compiletime_assert_48(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F200000) & (0x6A200000)"))); if (!(!(~(0x7F200000) & (0x6A200000)))) __compiletime_assert_48(); } while (0); return (code & (0x7F200000)) == (0x6A200000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_bics_value(void) { return (0x6A200000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_and_imm(u32 code) { do { extern void __compiletime_assert_49(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F800000) & (0x12000000)"))); if (!(!(~(0x7F800000) & (0x12000000)))) __compiletime_assert_49(); } while (0); return (code & (0x7F800000)) == (0x12000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_and_imm_value(void) { return (0x12000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_orr_imm(u32 code) { do { extern void __compiletime_assert_50(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F800000) & (0x32000000)"))); if (!(!(~(0x7F800000) & (0x32000000)))) __compiletime_assert_50(); } while (0); return (code & (0x7F800000)) == (0x32000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_orr_imm_value(void) { return (0x32000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_eor_imm(u32 code) { do { extern void __compiletime_assert_51(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F800000) & (0x52000000)"))); if (!(!(~(0x7F800000) & (0x52000000)))) __compiletime_assert_51(); } while (0); return (code & (0x7F800000)) == (0x52000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_eor_imm_value(void) { return (0x52000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_ands_imm(u32 code) { do { extern void __compiletime_assert_52(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F800000) & (0x72000000)"))); if (!(!(~(0x7F800000) & (0x72000000)))) __compiletime_assert_52(); } while (0); return (code & (0x7F800000)) == (0x72000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_ands_imm_value(void) { return (0x72000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_extr(u32 code) { do { extern void __compiletime_assert_53(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7FA00000) & (0x13800000)"))); if (!(!(~(0x7FA00000) & (0x13800000)))) __compiletime_assert_53(); } while (0); return (code & (0x7FA00000)) == (0x13800000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_extr_value(void) { return (0x13800000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_b(u32 code) { do { extern void __compiletime_assert_54(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFC000000) & (0x14000000)"))); if (!(!(~(0xFC000000) & (0x14000000)))) __compiletime_assert_54(); } while (0); return (code & (0xFC000000)) == (0x14000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_b_value(void) { return (0x14000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_bl(u32 code) { do { extern void __compiletime_assert_55(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFC000000) & (0x94000000)"))); if (!(!(~(0xFC000000) & (0x94000000)))) __compiletime_assert_55(); } while (0); return (code & (0xFC000000)) == (0x94000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_bl_value(void) { return (0x94000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_cbz(u32 code) { do { extern void __compiletime_assert_56(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F000000) & (0x34000000)"))); if (!(!(~(0x7F000000) & (0x34000000)))) __compiletime_assert_56(); } while (0); return (code & (0x7F000000)) == (0x34000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_cbz_value(void) { return (0x34000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_cbnz(u32 code) { do { extern void __compiletime_assert_57(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F000000) & (0x35000000)"))); if (!(!(~(0x7F000000) & (0x35000000)))) __compiletime_assert_57(); } while (0); return (code & (0x7F000000)) == (0x35000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_cbnz_value(void) { return (0x35000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_tbz(u32 code) { do { extern void __compiletime_assert_58(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F000000) & (0x36000000)"))); if (!(!(~(0x7F000000) & (0x36000000)))) __compiletime_assert_58(); } while (0); return (code & (0x7F000000)) == (0x36000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_tbz_value(void) { return (0x36000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_tbnz(u32 code) { do { extern void __compiletime_assert_59(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0x7F000000) & (0x37000000)"))); if (!(!(~(0x7F000000) & (0x37000000)))) __compiletime_assert_59(); } while (0); return (code & (0x7F000000)) == (0x37000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_tbnz_value(void) { return (0x37000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_bcond(u32 code) { do { extern void __compiletime_assert_60(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFF000010) & (0x54000000)"))); if (!(!(~(0xFF000010) & (0x54000000)))) __compiletime_assert_60(); } while (0); return (code & (0xFF000010)) == (0x54000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_bcond_value(void) { return (0x54000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_svc(u32 code) { do { extern void __compiletime_assert_61(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFE0001F) & (0xD4000001)"))); if (!(!(~(0xFFE0001F) & (0xD4000001)))) __compiletime_assert_61(); } while (0); return (code & (0xFFE0001F)) == (0xD4000001); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_svc_value(void) { return (0xD4000001); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_hvc(u32 code) { do { extern void __compiletime_assert_62(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFE0001F) & (0xD4000002)"))); if (!(!(~(0xFFE0001F) & (0xD4000002)))) __compiletime_assert_62(); } while (0); return (code & (0xFFE0001F)) == (0xD4000002); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_hvc_value(void) { return (0xD4000002); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_smc(u32 code) { do { extern void __compiletime_assert_63(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFE0001F) & (0xD4000003)"))); if (!(!(~(0xFFE0001F) & (0xD4000003)))) __compiletime_assert_63(); } while (0); return (code & (0xFFE0001F)) == (0xD4000003); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_smc_value(void) { return (0xD4000003); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_brk(u32 code) { do { extern void __compiletime_assert_64(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFE0001F) & (0xD4200000)"))); if (!(!(~(0xFFE0001F) & (0xD4200000)))) __compiletime_assert_64(); } while (0); return (code & (0xFFE0001F)) == (0xD4200000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_brk_value(void) { return (0xD4200000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_exception(u32 code) { do { extern void __compiletime_assert_65(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFF000000) & (0xD4000000)"))); if (!(!(~(0xFF000000) & (0xD4000000)))) __compiletime_assert_65(); } while (0); return (code & (0xFF000000)) == (0xD4000000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_exception_value(void) { return (0xD4000000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_hint(u32 code) { do { extern void __compiletime_assert_66(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFFFF01F) & (0xD503201F)"))); if (!(!(~(0xFFFFF01F) & (0xD503201F)))) __compiletime_assert_66(); } while (0); return (code & (0xFFFFF01F)) == (0xD503201F); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_hint_value(void) { return (0xD503201F); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_br(u32 code) { do { extern void __compiletime_assert_67(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFFFFC1F) & (0xD61F0000)"))); if (!(!(~(0xFFFFFC1F) & (0xD61F0000)))) __compiletime_assert_67(); } while (0); return (code & (0xFFFFFC1F)) == (0xD61F0000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_br_value(void) { return (0xD61F0000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_br_auth(u32 code) { do { extern void __compiletime_assert_68(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFEFFF800) & (0xD61F0800)"))); if (!(!(~(0xFEFFF800) & (0xD61F0800)))) __compiletime_assert_68(); } while (0); return (code & (0xFEFFF800)) == (0xD61F0800); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_br_auth_value(void) { return (0xD61F0800); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_blr(u32 code) { do { extern void __compiletime_assert_69(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFFFFC1F) & (0xD63F0000)"))); if (!(!(~(0xFFFFFC1F) & (0xD63F0000)))) __compiletime_assert_69(); } while (0); return (code & (0xFFFFFC1F)) == (0xD63F0000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_blr_value(void) { return (0xD63F0000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_blr_auth(u32 code) { do { extern void __compiletime_assert_70(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFEFFF800) & (0xD63F0800)"))); if (!(!(~(0xFEFFF800) & (0xD63F0800)))) __compiletime_assert_70(); } while (0); return (code & (0xFEFFF800)) == (0xD63F0800); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_blr_auth_value(void) { return (0xD63F0800); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_ret(u32 code) { do { extern void __compiletime_assert_71(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFFFFC1F) & (0xD65F0000)"))); if (!(!(~(0xFFFFFC1F) & (0xD65F0000)))) __compiletime_assert_71(); } while (0); return (code & (0xFFFFFC1F)) == (0xD65F0000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_ret_value(void) { return (0xD65F0000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_ret_auth(u32 code) { do { extern void __compiletime_assert_72(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFFFFBFF) & (0xD65F0BFF)"))); if (!(!(~(0xFFFFFBFF) & (0xD65F0BFF)))) __compiletime_assert_72(); } while (0); return (code & (0xFFFFFBFF)) == (0xD65F0BFF); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_ret_auth_value(void) { return (0xD65F0BFF); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_eret(u32 code) { do { extern void __compiletime_assert_73(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFFFFFFF) & (0xD69F03E0)"))); if (!(!(~(0xFFFFFFFF) & (0xD69F03E0)))) __compiletime_assert_73(); } while (0); return (code & (0xFFFFFFFF)) == (0xD69F03E0); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_eret_value(void) { return (0xD69F03E0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_eret_auth(u32 code) { do { extern void __compiletime_assert_74(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFFFFBFF) & (0xD69F0BFF)"))); if (!(!(~(0xFFFFFBFF) & (0xD69F0BFF)))) __compiletime_assert_74(); } while (0); return (code & (0xFFFFFBFF)) == (0xD69F0BFF); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_eret_auth_value(void) { return (0xD69F0BFF); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_mrs(u32 code) { do { extern void __compiletime_assert_75(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFF00000) & (0xD5300000)"))); if (!(!(~(0xFFF00000) & (0xD5300000)))) __compiletime_assert_75(); } while (0); return (code & (0xFFF00000)) == (0xD5300000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_mrs_value(void) { return (0xD5300000); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_msr_imm(u32 code) { do { extern void __compiletime_assert_76(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFF8F01F) & (0xD500401F)"))); if (!(!(~(0xFFF8F01F) & (0xD500401F)))) __compiletime_assert_76(); } while (0); return (code & (0xFFF8F01F)) == (0xD500401F); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_msr_imm_value(void) { return (0xD500401F); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool aarch64_insn_is_msr_reg(u32 code) { do { extern void __compiletime_assert_77(void) __attribute__((__error__("BUILD_BUG_ON failed: " "~(0xFFF00000) & (0xD5100000)"))); if (!(!(~(0xFFF00000) & (0xD5100000)))) __compiletime_assert_77(); } while (0); return (code & (0xFFF00000)) == (0xD5100000); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 aarch64_insn_get_msr_reg_value(void) { return (0xD5100000); }



bool aarch64_insn_is_steppable_hint(u32 insn);
bool aarch64_insn_is_branch_imm(u32 insn);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool aarch64_insn_is_adr_adrp(u32 insn)
{
 return aarch64_insn_is_adr(insn) || aarch64_insn_is_adrp(insn);
}

int aarch64_insn_read(void *addr, u32 *insnp);
int aarch64_insn_write(void *addr, u32 insn);
enum aarch64_insn_encoding_class aarch64_get_insn_class(u32 insn);
bool aarch64_insn_uses_literal(u32 insn);
bool aarch64_insn_is_branch(u32 insn);
u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn);
u32 aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
      u32 insn, u64 imm);
u32 aarch64_insn_decode_register(enum aarch64_insn_register_type type,
      u32 insn);
u32 aarch64_insn_gen_branch_imm(unsigned long pc, unsigned long addr,
    enum aarch64_insn_branch_type type);
u32 aarch64_insn_gen_comp_branch_imm(unsigned long pc, unsigned long addr,
         enum aarch64_insn_register reg,
         enum aarch64_insn_variant variant,
         enum aarch64_insn_branch_type type);
u32 aarch64_insn_gen_cond_branch_imm(unsigned long pc, unsigned long addr,
         enum aarch64_insn_condition cond);
u32 aarch64_insn_gen_hint(enum aarch64_insn_hint_cr_op op);
u32 aarch64_insn_gen_nop(void);
u32 aarch64_insn_gen_branch_reg(enum aarch64_insn_register reg,
    enum aarch64_insn_branch_type type);
u32 aarch64_insn_gen_load_store_reg(enum aarch64_insn_register reg,
        enum aarch64_insn_register base,
        enum aarch64_insn_register offset,
        enum aarch64_insn_size_type size,
        enum aarch64_insn_ldst_type type);
u32 aarch64_insn_gen_load_store_pair(enum aarch64_insn_register reg1,
         enum aarch64_insn_register reg2,
         enum aarch64_insn_register base,
         int offset,
         enum aarch64_insn_variant variant,
         enum aarch64_insn_ldst_type type);
u32 aarch64_insn_gen_load_store_ex(enum aarch64_insn_register reg,
       enum aarch64_insn_register base,
       enum aarch64_insn_register state,
       enum aarch64_insn_size_type size,
       enum aarch64_insn_ldst_type type);
u32 aarch64_insn_gen_ldadd(enum aarch64_insn_register result,
      enum aarch64_insn_register address,
      enum aarch64_insn_register value,
      enum aarch64_insn_size_type size);
u32 aarch64_insn_gen_stadd(enum aarch64_insn_register address,
      enum aarch64_insn_register value,
      enum aarch64_insn_size_type size);
u32 aarch64_insn_gen_add_sub_imm(enum aarch64_insn_register dst,
     enum aarch64_insn_register src,
     int imm, enum aarch64_insn_variant variant,
     enum aarch64_insn_adsb_type type);
u32 aarch64_insn_gen_adr(unsigned long pc, unsigned long addr,
    enum aarch64_insn_register reg,
    enum aarch64_insn_adr_type type);
u32 aarch64_insn_gen_bitfield(enum aarch64_insn_register dst,
         enum aarch64_insn_register src,
         int immr, int imms,
         enum aarch64_insn_variant variant,
         enum aarch64_insn_bitfield_type type);
u32 aarch64_insn_gen_movewide(enum aarch64_insn_register dst,
         int imm, int shift,
         enum aarch64_insn_variant variant,
         enum aarch64_insn_movewide_type type);
u32 aarch64_insn_gen_add_sub_shifted_reg(enum aarch64_insn_register dst,
      enum aarch64_insn_register src,
      enum aarch64_insn_register reg,
      int shift,
      enum aarch64_insn_variant variant,
      enum aarch64_insn_adsb_type type);
u32 aarch64_insn_gen_data1(enum aarch64_insn_register dst,
      enum aarch64_insn_register src,
      enum aarch64_insn_variant variant,
      enum aarch64_insn_data1_type type);
u32 aarch64_insn_gen_data2(enum aarch64_insn_register dst,
      enum aarch64_insn_register src,
      enum aarch64_insn_register reg,
      enum aarch64_insn_variant variant,
      enum aarch64_insn_data2_type type);
u32 aarch64_insn_gen_data3(enum aarch64_insn_register dst,
      enum aarch64_insn_register src,
      enum aarch64_insn_register reg1,
      enum aarch64_insn_register reg2,
      enum aarch64_insn_variant variant,
      enum aarch64_insn_data3_type type);
u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
      enum aarch64_insn_register src,
      enum aarch64_insn_register reg,
      int shift,
      enum aarch64_insn_variant variant,
      enum aarch64_insn_logic_type type);
u32 aarch64_insn_gen_move_reg(enum aarch64_insn_register dst,
         enum aarch64_insn_register src,
         enum aarch64_insn_variant variant);
u32 aarch64_insn_gen_logical_immediate(enum aarch64_insn_logic_type type,
           enum aarch64_insn_variant variant,
           enum aarch64_insn_register Rn,
           enum aarch64_insn_register Rd,
           u64 imm);
u32 aarch64_insn_gen_extr(enum aarch64_insn_variant variant,
     enum aarch64_insn_register Rm,
     enum aarch64_insn_register Rn,
     enum aarch64_insn_register Rd,
     u8 lsb);
u32 aarch64_insn_gen_prefetch(enum aarch64_insn_register base,
         enum aarch64_insn_prfm_type type,
         enum aarch64_insn_prfm_target target,
         enum aarch64_insn_prfm_policy policy);
s32 aarch64_get_branch_offset(u32 insn);
u32 aarch64_set_branch_offset(u32 insn, s32 offset);

int aarch64_insn_patch_text_nosync(void *addr, u32 insn);
int aarch64_insn_patch_text(void *addrs[], u32 insns[], int cnt);

s32 aarch64_insn_adrp_get_offset(u32 insn);
u32 aarch64_insn_adrp_set_offset(u32 insn, s32 offset);

bool aarch32_insn_is_wide(u32 insn);





u32 aarch64_insn_extract_system_reg(u32 insn);
u32 aarch32_insn_extract_reg_num(u32 insn, int offset);
u32 aarch32_insn_mcr_extract_opc2(u32 insn);
u32 aarch32_insn_mcr_extract_crm(u32 insn);

typedef bool (pstate_check_t)(unsigned long);
extern pstate_check_t * const aarch32_opcode_cond_checks[16];
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/jump_label.h" 2



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool arch_static_branch(struct static_key *key,
            bool branch)
{
 do { asm goto("1:	nop					\n\t" "	.pushsection	__jump_table, \"aw\"	\n\t" "	.align		3			\n\t" "	.long		1b - ., %l[l_yes] - .	\n\t" "	.quad		%c0 - .			\n\t" "	.popsection				\n\t" : : "i"(&((char *)key)[branch]) : : l_yes); asm (""); } while (0)






                                                ;

 return false;
l_yes:
 return true;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool arch_static_branch_jump(struct static_key *key,
          bool branch)
{
 do { asm goto("1:	b		%l[l_yes]		\n\t" "	.pushsection	__jump_table, \"aw\"	\n\t" "	.align		3			\n\t" "	.long		1b - ., %l[l_yes] - .	\n\t" "	.quad		%c0 - .			\n\t" "	.popsection				\n\t" : : "i"(&((char *)key)[branch]) : : l_yes); asm (""); } while (0)






                                                ;

 return false;
l_yes:
 return true;
}
# 118 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h" 2




struct jump_entry {
 s32 code;
 s32 target;
 long key;
};

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long jump_entry_code(const struct jump_entry *entry)
{
 return (unsigned long)&entry->code + entry->code;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long jump_entry_target(const struct jump_entry *entry)
{
 return (unsigned long)&entry->target + entry->target;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) struct static_key *jump_entry_key(const struct jump_entry *entry)
{
 long offset = entry->key & ~3L;

 return (struct static_key *)((unsigned long)&entry->key + offset);
}
# 164 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool jump_entry_is_branch(const struct jump_entry *entry)
{
 return (unsigned long)entry->key & 1UL;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool jump_entry_is_init(const struct jump_entry *entry)
{
 return (unsigned long)entry->key & 2UL;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void jump_entry_set_init(struct jump_entry *entry)
{
 entry->key |= 2;
}






enum jump_label_type {
 JUMP_LABEL_NOP = 0,
 JUMP_LABEL_JMP,
};

struct module;
# 198 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool static_key_false(struct static_key *key)
{
 return arch_static_branch(key, false);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool static_key_true(struct static_key *key)
{
 return !arch_static_branch(key, true);
}

extern struct jump_entry __start___jump_table[];
extern struct jump_entry __stop___jump_table[];

extern void jump_label_init(void);
extern void jump_label_lock(void);
extern void jump_label_unlock(void);
extern void arch_jump_label_transform(struct jump_entry *entry,
          enum jump_label_type type);
extern void arch_jump_label_transform_static(struct jump_entry *entry,
          enum jump_label_type type);
extern bool arch_jump_label_transform_queue(struct jump_entry *entry,
         enum jump_label_type type);
extern void arch_jump_label_transform_apply(void);
extern int jump_label_text_reserved(void *start, void *end);
extern void static_key_slow_inc(struct static_key *key);
extern void static_key_slow_dec(struct static_key *key);
extern void static_key_slow_inc_cpuslocked(struct static_key *key);
extern void static_key_slow_dec_cpuslocked(struct static_key *key);
extern void jump_label_apply_nops(struct module *mod);
extern int static_key_count(struct static_key *key);
extern void static_key_enable(struct static_key *key);
extern void static_key_disable(struct static_key *key);
extern void static_key_enable_cpuslocked(struct static_key *key);
extern void static_key_disable_cpuslocked(struct static_key *key);
# 346 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
struct static_key_true {
 struct static_key key;
};

struct static_key_false {
 struct static_key key;
};
# 385 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
extern bool ____wrong_branch_error(void);
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/lse.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/alternative.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpucaps.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/alternative.h" 2






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/init.h" 1
# 116 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/init.h"
typedef int (*initcall_t)(void);
typedef void (*exitcall_t)(void);


typedef int initcall_entry_t;

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) initcall_t initcall_from_entry(initcall_entry_t *entry)
{
 return offset_to_ptr(entry);
}
# 135 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/init.h"
extern initcall_entry_t __con_initcall_start[], __con_initcall_end[];


typedef void (*ctor_fn_t)(void);

struct file_system_type;


extern int do_one_initcall(initcall_t fn);
extern char __attribute__((__section__(".init.data"))) boot_command_line[];
extern char *saved_command_line;
extern unsigned int reset_devices;


void setup_arch(char **);
void prepare_namespace(void);
void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) init_rootfs(void);
extern struct file_system_type rootfs_fs_type;


extern bool rodata_enabled;


void mark_rodata_ro(void);


extern void (*late_time_init)(void);

extern bool initcall_debug;
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/alternative.h" 2




struct alt_instr {
 s32 orig_offset;
 s32 alt_offset;
 u16 cpufeature;
 u8 orig_len;
 u8 alt_len;
};

typedef void (*alternative_cb_t)(struct alt_instr *alt,
     __le32 *origptr, __le32 *updptr, int nr_inst);

void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) apply_boot_alternatives(void);
void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) apply_alternatives_all(void);
bool alternative_is_applied(u16 cpufeature);


void apply_alternatives_module(void *start, size_t length);
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/lse.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h" 1
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic_andnot(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "stclr" "	%w[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic_or(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "stset" "	%w[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic_xor(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "steor" "	%w[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic_add(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "stadd" "	%w[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
# 49 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_andnot_relaxed(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldclr" "" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_andnot_acquire(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldclr" "a" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_andnot_release(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldclr" "l" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_andnot(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldclr" "al" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_or_relaxed(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldset" "" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_or_acquire(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldset" "a" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_or_release(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldset" "l" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_or(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldset" "al" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_xor_relaxed(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldeor" "" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_xor_acquire(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldeor" "a" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_xor_release(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldeor" "l" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_xor(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldeor" "al" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_add_relaxed(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldadd" "" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_add_acquire(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldadd" "a" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_add_release(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldadd" "l" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_add(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldadd" "al" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
# 73 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_add_return_relaxed(int i, atomic_t *v) { u32 tmp; asm volatile( ".arch_extension lse\n" "	ldadd" "" "	%w[i], %w[tmp], %[v]\n" "	add	%w[i], %w[i], %w[tmp]" : [i] "+r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : ); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_add_return_acquire(int i, atomic_t *v) { u32 tmp; asm volatile( ".arch_extension lse\n" "	ldadd" "a" "	%w[i], %w[tmp], %[v]\n" "	add	%w[i], %w[i], %w[tmp]" : [i] "+r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_add_return_release(int i, atomic_t *v) { u32 tmp; asm volatile( ".arch_extension lse\n" "	ldadd" "l" "	%w[i], %w[tmp], %[v]\n" "	add	%w[i], %w[i], %w[tmp]" : [i] "+r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_add_return(int i, atomic_t *v) { u32 tmp; asm volatile( ".arch_extension lse\n" "	ldadd" "al" "	%w[i], %w[tmp], %[v]\n" "	add	%w[i], %w[i], %w[tmp]" : [i] "+r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic_and(int i, atomic_t *v)
{
 asm volatile(
 ".arch_extension lse\n"
 "	mvn	%w[i], %w[i]\n"
 "	stclr	%w[i], %[v]"
 : [i] "+&r" (i), [v] "+Q" (v->counter)
 : "r" (v));
}
# 104 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_and_relaxed(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	mvn	%w[i], %w[i]\n" "	ldclr" "" "	%w[i], %w[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_and_acquire(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	mvn	%w[i], %w[i]\n" "	ldclr" "a" "	%w[i], %w[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_and_release(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	mvn	%w[i], %w[i]\n" "	ldclr" "l" "	%w[i], %w[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_and(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	mvn	%w[i], %w[i]\n" "	ldclr" "al" "	%w[i], %w[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic_sub(int i, atomic_t *v)
{
 asm volatile(
 ".arch_extension lse\n"
 "	neg	%w[i], %w[i]\n"
 "	stadd	%w[i], %[v]"
 : [i] "+&r" (i), [v] "+Q" (v->counter)
 : "r" (v));
}
# 138 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_sub_return_relaxed(int i, atomic_t *v) { u32 tmp; asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "" "	%w[i], %w[tmp], %[v]\n" "	add	%w[i], %w[i], %w[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : ); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_sub_return_acquire(int i, atomic_t *v) { u32 tmp; asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "a" "	%w[i], %w[tmp], %[v]\n" "	add	%w[i], %w[i], %w[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_sub_return_release(int i, atomic_t *v) { u32 tmp; asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "l" "	%w[i], %w[tmp], %[v]\n" "	add	%w[i], %w[i], %w[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_sub_return(int i, atomic_t *v) { u32 tmp; asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "al" "	%w[i], %w[tmp], %[v]\n" "	add	%w[i], %w[i], %w[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
# 159 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_sub_relaxed(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "" "	%w[i], %w[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_sub_acquire(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "a" "	%w[i], %w[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_sub_release(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "l" "	%w[i], %w[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_sub(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "al" "	%w[i], %w[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
# 176 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic64_andnot(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	" "stclr" "	%[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic64_or(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	" "stset" "	%[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic64_xor(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	" "steor" "	%[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic64_add(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	" "stadd" "	%[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
# 202 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_andnot_relaxed(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldclr" "" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_andnot_acquire(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldclr" "a" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_andnot_release(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldclr" "l" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_andnot(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldclr" "al" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_or_relaxed(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldset" "" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_or_acquire(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldset" "a" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_or_release(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldset" "l" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_or(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldset" "al" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_xor_relaxed(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldeor" "" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_xor_acquire(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldeor" "a" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_xor_release(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldeor" "l" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_xor(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldeor" "al" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_add_relaxed(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldadd" "" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_add_acquire(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldadd" "a" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_add_release(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldadd" "l" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_add(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldadd" "al" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
# 226 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_add_return_relaxed(s64 i, atomic64_t *v){ unsigned long tmp; asm volatile( ".arch_extension lse\n" "	ldadd" "" "	%[i], %x[tmp], %[v]\n" "	add	%[i], %[i], %x[tmp]" : [i] "+r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : ); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_add_return_acquire(s64 i, atomic64_t *v){ unsigned long tmp; asm volatile( ".arch_extension lse\n" "	ldadd" "a" "	%[i], %x[tmp], %[v]\n" "	add	%[i], %[i], %x[tmp]" : [i] "+r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_add_return_release(s64 i, atomic64_t *v){ unsigned long tmp; asm volatile( ".arch_extension lse\n" "	ldadd" "l" "	%[i], %x[tmp], %[v]\n" "	add	%[i], %[i], %x[tmp]" : [i] "+r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_add_return(s64 i, atomic64_t *v){ unsigned long tmp; asm volatile( ".arch_extension lse\n" "	ldadd" "al" "	%[i], %x[tmp], %[v]\n" "	add	%[i], %[i], %x[tmp]" : [i] "+r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic64_and(s64 i, atomic64_t *v)
{
 asm volatile(
 ".arch_extension lse\n"
 "	mvn	%[i], %[i]\n"
 "	stclr	%[i], %[v]"
 : [i] "+&r" (i), [v] "+Q" (v->counter)
 : "r" (v));
}
# 257 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_and_relaxed(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	mvn	%[i], %[i]\n" "	ldclr" "" "	%[i], %[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_and_acquire(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	mvn	%[i], %[i]\n" "	ldclr" "a" "	%[i], %[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_and_release(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	mvn	%[i], %[i]\n" "	ldclr" "l" "	%[i], %[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_and(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	mvn	%[i], %[i]\n" "	ldclr" "al" "	%[i], %[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic64_sub(s64 i, atomic64_t *v)
{
 asm volatile(
 ".arch_extension lse\n"
 "	neg	%[i], %[i]\n"
 "	stadd	%[i], %[v]"
 : [i] "+&r" (i), [v] "+Q" (v->counter)
 : "r" (v));
}
# 291 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_sub_return_relaxed(s64 i, atomic64_t *v){ unsigned long tmp; asm volatile( ".arch_extension lse\n" "	neg	%[i], %[i]\n" "	ldadd" "" "	%[i], %x[tmp], %[v]\n" "	add	%[i], %[i], %x[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : ); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_sub_return_acquire(s64 i, atomic64_t *v){ unsigned long tmp; asm volatile( ".arch_extension lse\n" "	neg	%[i], %[i]\n" "	ldadd" "a" "	%[i], %x[tmp], %[v]\n" "	add	%[i], %[i], %x[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_sub_return_release(s64 i, atomic64_t *v){ unsigned long tmp; asm volatile( ".arch_extension lse\n" "	neg	%[i], %[i]\n" "	ldadd" "l" "	%[i], %x[tmp], %[v]\n" "	add	%[i], %[i], %x[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_sub_return(s64 i, atomic64_t *v){ unsigned long tmp; asm volatile( ".arch_extension lse\n" "	neg	%[i], %[i]\n" "	ldadd" "al" "	%[i], %x[tmp], %[v]\n" "	add	%[i], %[i], %x[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
# 312 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_sub_relaxed(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	neg	%[i], %[i]\n" "	ldadd" "" "	%[i], %[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_sub_acquire(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	neg	%[i], %[i]\n" "	ldadd" "a" "	%[i], %[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_sub_release(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	neg	%[i], %[i]\n" "	ldadd" "l" "	%[i], %[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_sub(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	neg	%[i], %[i]\n" "	ldadd" "al" "	%[i], %[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 __lse_atomic64_dec_if_positive(atomic64_t *v)
{
 unsigned long tmp;

 asm volatile(
 ".arch_extension lse\n"
 "1:	ldr	%x[tmp], %[v]\n"
 "	subs	%[ret], %x[tmp], #1\n"
 "	b.lt	2f\n"
 "	casal	%x[tmp], %[ret], %[v]\n"
 "	sub	%x[tmp], %x[tmp], #1\n"
 "	sub	%x[tmp], %x[tmp], %[ret]\n"
 "	cbnz	%x[tmp], 1b\n"
 "2:"
 : [ret] "+&r" (v), [v] "+Q" (v->counter), [tmp] "=&r" (tmp)
 :
 : "cc", "memory");

 return (long)v;
}
# 364 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u8 __lse__cmpxchg_case_8(volatile void *ptr, u8 old, u8 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u8 x1 asm ("x1") = old; register u8 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "w" "[tmp], %" "w" "[old]\n" "	cas" "" "b" "\t%" "w" "[tmp], %" "w" "[new], %[v]\n" "	mov	%" "w" "[ret], %" "w" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : ); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u16 __lse__cmpxchg_case_16(volatile void *ptr, u16 old, u16 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u16 x1 asm ("x1") = old; register u16 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "w" "[tmp], %" "w" "[old]\n" "	cas" "" "h" "\t%" "w" "[tmp], %" "w" "[new], %[v]\n" "	mov	%" "w" "[ret], %" "w" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : ); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 __lse__cmpxchg_case_32(volatile void *ptr, u32 old, u32 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u32 x1 asm ("x1") = old; register u32 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "w" "[tmp], %" "w" "[old]\n" "	cas" "" "" "\t%" "w" "[tmp], %" "w" "[new], %[v]\n" "	mov	%" "w" "[ret], %" "w" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : ); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u64 __lse__cmpxchg_case_64(volatile void *ptr, u64 old, u64 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u64 x1 asm ("x1") = old; register u64 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "x" "[tmp], %" "x" "[old]\n" "	cas" "" "" "\t%" "x" "[tmp], %" "x" "[new], %[v]\n" "	mov	%" "x" "[ret], %" "x" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : ); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u8 __lse__cmpxchg_case_acq_8(volatile void *ptr, u8 old, u8 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u8 x1 asm ("x1") = old; register u8 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "w" "[tmp], %" "w" "[old]\n" "	cas" "a" "b" "\t%" "w" "[tmp], %" "w" "[new], %[v]\n" "	mov	%" "w" "[ret], %" "w" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : "memory"); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u16 __lse__cmpxchg_case_acq_16(volatile void *ptr, u16 old, u16 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u16 x1 asm ("x1") = old; register u16 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "w" "[tmp], %" "w" "[old]\n" "	cas" "a" "h" "\t%" "w" "[tmp], %" "w" "[new], %[v]\n" "	mov	%" "w" "[ret], %" "w" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : "memory"); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 __lse__cmpxchg_case_acq_32(volatile void *ptr, u32 old, u32 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u32 x1 asm ("x1") = old; register u32 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "w" "[tmp], %" "w" "[old]\n" "	cas" "a" "" "\t%" "w" "[tmp], %" "w" "[new], %[v]\n" "	mov	%" "w" "[ret], %" "w" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : "memory"); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u64 __lse__cmpxchg_case_acq_64(volatile void *ptr, u64 old, u64 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u64 x1 asm ("x1") = old; register u64 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "x" "[tmp], %" "x" "[old]\n" "	cas" "a" "" "\t%" "x" "[tmp], %" "x" "[new], %[v]\n" "	mov	%" "x" "[ret], %" "x" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : "memory"); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u8 __lse__cmpxchg_case_rel_8(volatile void *ptr, u8 old, u8 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u8 x1 asm ("x1") = old; register u8 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "w" "[tmp], %" "w" "[old]\n" "	cas" "l" "b" "\t%" "w" "[tmp], %" "w" "[new], %[v]\n" "	mov	%" "w" "[ret], %" "w" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : "memory"); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u16 __lse__cmpxchg_case_rel_16(volatile void *ptr, u16 old, u16 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u16 x1 asm ("x1") = old; register u16 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "w" "[tmp], %" "w" "[old]\n" "	cas" "l" "h" "\t%" "w" "[tmp], %" "w" "[new], %[v]\n" "	mov	%" "w" "[ret], %" "w" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : "memory"); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 __lse__cmpxchg_case_rel_32(volatile void *ptr, u32 old, u32 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u32 x1 asm ("x1") = old; register u32 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "w" "[tmp], %" "w" "[old]\n" "	cas" "l" "" "\t%" "w" "[tmp], %" "w" "[new], %[v]\n" "	mov	%" "w" "[ret], %" "w" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : "memory"); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u64 __lse__cmpxchg_case_rel_64(volatile void *ptr, u64 old, u64 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u64 x1 asm ("x1") = old; register u64 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "x" "[tmp], %" "x" "[old]\n" "	cas" "l" "" "\t%" "x" "[tmp], %" "x" "[new], %[v]\n" "	mov	%" "x" "[ret], %" "x" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : "memory"); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u8 __lse__cmpxchg_case_mb_8(volatile void *ptr, u8 old, u8 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u8 x1 asm ("x1") = old; register u8 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "w" "[tmp], %" "w" "[old]\n" "	cas" "al" "b" "\t%" "w" "[tmp], %" "w" "[new], %[v]\n" "	mov	%" "w" "[ret], %" "w" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : "memory"); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u16 __lse__cmpxchg_case_mb_16(volatile void *ptr, u16 old, u16 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u16 x1 asm ("x1") = old; register u16 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "w" "[tmp], %" "w" "[old]\n" "	cas" "al" "h" "\t%" "w" "[tmp], %" "w" "[new], %[v]\n" "	mov	%" "w" "[ret], %" "w" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : "memory"); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32 __lse__cmpxchg_case_mb_32(volatile void *ptr, u32 old, u32 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u32 x1 asm ("x1") = old; register u32 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "w" "[tmp], %" "w" "[old]\n" "	cas" "al" "" "\t%" "w" "[tmp], %" "w" "[new], %[v]\n" "	mov	%" "w" "[ret], %" "w" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : "memory"); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u64 __lse__cmpxchg_case_mb_64(volatile void *ptr, u64 old, u64 new) { register unsigned long x0 asm ("x0") = (unsigned long)ptr; register u64 x1 asm ("x1") = old; register u64 x2 asm ("x2") = new; unsigned long tmp; asm volatile( ".arch_extension lse\n" "	mov	%" "x" "[tmp], %" "x" "[old]\n" "	cas" "al" "" "\t%" "x" "[tmp], %" "x" "[new], %[v]\n" "	mov	%" "x" "[ret], %" "x" "[tmp]" : [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr), [tmp] "=&r" (tmp) : [old] "r" (x1), [new] "r" (x2) : "memory"); return x0; }
# 414 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long __lse__cmpxchg_double(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { unsigned long oldval1 = old1; unsigned long oldval2 = old2; register unsigned long x0 asm ("x0") = old1; register unsigned long x1 asm ("x1") = old2; register unsigned long x2 asm ("x2") = new1; register unsigned long x3 asm ("x3") = new2; register unsigned long x4 asm ("x4") = (unsigned long)ptr; asm volatile( ".arch_extension lse\n" "	casp" "" "\t%[old1], %[old2], %[new1], %[new2], %[v]\n" "	eor	%[old1], %[old1], %[oldval1]\n" "	eor	%[old2], %[old2], %[oldval2]\n" "	orr	%[old1], %[old1], %[old2]" : [old1] "+&r" (x0), [old2] "+&r" (x1), [v] "+Q" (*(__uint128_t *)ptr) : [new1] "r" (x2), [new2] "r" (x3), [ptr] "r" (x4), [oldval1] "r" (oldval1), [oldval2] "r" (oldval2) : ); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long __lse__cmpxchg_double_mb(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { unsigned long oldval1 = old1; unsigned long oldval2 = old2; register unsigned long x0 asm ("x0") = old1; register unsigned long x1 asm ("x1") = old2; register unsigned long x2 asm ("x2") = new1; register unsigned long x3 asm ("x3") = new2; register unsigned long x4 asm ("x4") = (unsigned long)ptr; asm volatile( ".arch_extension lse\n" "	casp" "al" "\t%[old1], %[old2], %[new1], %[new2], %[v]\n" "	eor	%[old1], %[old1], %[oldval1]\n" "	eor	%[old2], %[old2], %[oldval2]\n" "	orr	%[old1], %[old1], %[old2]" : [old1] "+&r" (x0), [old2] "+&r" (x1), [v] "+Q" (*(__uint128_t *)ptr) : [new1] "r" (x2), [new2] "r" (x3), [ptr] "r" (x4), [oldval1] "r" (oldval1), [oldval2] "r" (oldval2) : "memory"); return x0; }
# 17 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/lse.h" 2


extern struct static_key_false cpu_hwcap_keys[63];
extern struct static_key_false arm64_const_caps_ready;

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_uses_lse_atomics(void)
{
 return (({ bool branch; if (__builtin_types_compatible_p(typeof(*&arm64_const_caps_ready), struct static_key_true)) branch = !arch_static_branch(&(&arm64_const_caps_ready)->key, true); else if (__builtin_types_compatible_p(typeof(*&arm64_const_caps_ready), struct static_key_false)) branch = !arch_static_branch_jump(&(&arm64_const_caps_ready)->key, true); else branch = ____wrong_branch_error(); __builtin_expect(!!(branch), 1); })) &&
  ({ bool branch; if (__builtin_types_compatible_p(typeof(*&cpu_hwcap_keys[5]), struct static_key_true)) branch = !arch_static_branch(&(&cpu_hwcap_keys[5])->key, true); else if (__builtin_types_compatible_p(typeof(*&cpu_hwcap_keys[5]), struct static_key_false)) branch = !arch_static_branch_jump(&(&cpu_hwcap_keys[5])->key, true); else branch = ____wrong_branch_error(); __builtin_expect(!!(branch), 1); });
}
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h" 2
# 45 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __xchg_case_8(u8 x, volatile void *ptr) { u8 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "b" "\t%" "w" "0, %2\n" "	st" "" "xr" "b" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "" "b" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u8 *)ptr) : "r" (x) : ); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __xchg_case_16(u16 x, volatile void *ptr) { u16 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "h" "\t%" "w" "0, %2\n" "	st" "" "xr" "h" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "" "h" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u16 *)ptr) : "r" (x) : ); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __xchg_case_32(u32 x, volatile void *ptr) { u32 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "w" "0, %2\n" "	st" "" "xr" "" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "" "" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u32 *)ptr) : "r" (x) : ); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __xchg_case_64(u64 x, volatile void *ptr) { u64 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "" "0, %2\n" "	st" "" "xr" "" "\t%w1, %" "" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "" "" "\t%" "" "3, %" "" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u64 *)ptr) : "r" (x) : ); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __xchg_case_acq_8(u8 x, volatile void *ptr) { u8 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr" "b" "\t%" "w" "0, %2\n" "	st" "" "xr" "b" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "" "b" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u8 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __xchg_case_acq_16(u16 x, volatile void *ptr) { u16 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr" "h" "\t%" "w" "0, %2\n" "	st" "" "xr" "h" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "" "h" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u16 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __xchg_case_acq_32(u32 x, volatile void *ptr) { u32 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr" "" "\t%" "w" "0, %2\n" "	st" "" "xr" "" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "" "" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u32 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __xchg_case_acq_64(u64 x, volatile void *ptr) { u64 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr" "" "\t%" "" "0, %2\n" "	st" "" "xr" "" "\t%w1, %" "" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "" "" "\t%" "" "3, %" "" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u64 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __xchg_case_rel_8(u8 x, volatile void *ptr) { u8 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "b" "\t%" "w" "0, %2\n" "	st" "l" "xr" "b" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "l" "b" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u8 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __xchg_case_rel_16(u16 x, volatile void *ptr) { u16 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "h" "\t%" "w" "0, %2\n" "	st" "l" "xr" "h" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "l" "h" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u16 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __xchg_case_rel_32(u32 x, volatile void *ptr) { u32 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "w" "0, %2\n" "	st" "l" "xr" "" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "l" "" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u32 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __xchg_case_rel_64(u64 x, volatile void *ptr) { u64 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "" "0, %2\n" "	st" "l" "xr" "" "\t%w1, %" "" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "l" "" "\t%" "" "3, %" "" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u64 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __xchg_case_mb_8(u8 x, volatile void *ptr) { u8 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "b" "\t%" "w" "0, %2\n" "	st" "l" "xr" "b" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "l" "b" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "nop" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u8 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __xchg_case_mb_16(u16 x, volatile void *ptr) { u16 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "h" "\t%" "w" "0, %2\n" "	st" "l" "xr" "h" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "l" "h" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "nop" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u16 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __xchg_case_mb_32(u32 x, volatile void *ptr) { u32 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "w" "0, %2\n" "	st" "l" "xr" "" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "l" "" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "nop" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u32 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __xchg_case_mb_64(u64 x, volatile void *ptr) { u64 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "" "0, %2\n" "	st" "l" "xr" "" "\t%w1, %" "" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "l" "" "\t%" "" "3, %" "" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "nop" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u64 *)ptr) : "r" (x) : "memory"); return ret; }
# 85 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __xchg(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_8(x, ptr); case 2: return __xchg_case_16(x, ptr); case 4: return __xchg_case_32(x, ptr); case 8: return __xchg_case_64(x, ptr); default: do { extern void __compiletime_assert_78(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_78(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __xchg_acq(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_acq_8(x, ptr); case 2: return __xchg_case_acq_16(x, ptr); case 4: return __xchg_case_acq_32(x, ptr); case 8: return __xchg_case_acq_64(x, ptr); default: do { extern void __compiletime_assert_79(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_79(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __xchg_rel(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_rel_8(x, ptr); case 2: return __xchg_case_rel_16(x, ptr); case 4: return __xchg_case_rel_32(x, ptr); case 8: return __xchg_case_rel_64(x, ptr); default: do { extern void __compiletime_assert_80(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_80(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __xchg_mb(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_mb_8(x, ptr); case 2: return __xchg_case_mb_16(x, ptr); case 4: return __xchg_case_mb_32(x, ptr); case 8: return __xchg_case_mb_64(x, ptr); default: do { extern void __compiletime_assert_81(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_81(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
# 115 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __cmpxchg_case_8(volatile void *ptr, u8 old, u8 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_8(ptr, old, new) : __ll_sc__cmpxchg_case_8(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __cmpxchg_case_16(volatile void *ptr, u16 old, u16 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_16(ptr, old, new) : __ll_sc__cmpxchg_case_16(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __cmpxchg_case_32(volatile void *ptr, u32 old, u32 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_32(ptr, old, new) : __ll_sc__cmpxchg_case_32(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __cmpxchg_case_64(volatile void *ptr, u64 old, u64 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_64(ptr, old, new) : __ll_sc__cmpxchg_case_64(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __cmpxchg_case_acq_8(volatile void *ptr, u8 old, u8 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_acq_8(ptr, old, new) : __ll_sc__cmpxchg_case_acq_8(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __cmpxchg_case_acq_16(volatile void *ptr, u16 old, u16 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_acq_16(ptr, old, new) : __ll_sc__cmpxchg_case_acq_16(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __cmpxchg_case_acq_32(volatile void *ptr, u32 old, u32 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_acq_32(ptr, old, new) : __ll_sc__cmpxchg_case_acq_32(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __cmpxchg_case_acq_64(volatile void *ptr, u64 old, u64 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_acq_64(ptr, old, new) : __ll_sc__cmpxchg_case_acq_64(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __cmpxchg_case_rel_8(volatile void *ptr, u8 old, u8 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_rel_8(ptr, old, new) : __ll_sc__cmpxchg_case_rel_8(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __cmpxchg_case_rel_16(volatile void *ptr, u16 old, u16 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_rel_16(ptr, old, new) : __ll_sc__cmpxchg_case_rel_16(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __cmpxchg_case_rel_32(volatile void *ptr, u32 old, u32 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_rel_32(ptr, old, new) : __ll_sc__cmpxchg_case_rel_32(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __cmpxchg_case_rel_64(volatile void *ptr, u64 old, u64 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_rel_64(ptr, old, new) : __ll_sc__cmpxchg_case_rel_64(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __cmpxchg_case_mb_8(volatile void *ptr, u8 old, u8 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_mb_8(ptr, old, new) : __ll_sc__cmpxchg_case_mb_8(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __cmpxchg_case_mb_16(volatile void *ptr, u16 old, u16 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_mb_16(ptr, old, new) : __ll_sc__cmpxchg_case_mb_16(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __cmpxchg_case_mb_32(volatile void *ptr, u32 old, u32 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_mb_32(ptr, old, new) : __ll_sc__cmpxchg_case_mb_32(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __cmpxchg_case_mb_64(volatile void *ptr, u64 old, u64 new) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_case_mb_64(ptr, old, new) : __ll_sc__cmpxchg_case_mb_64(ptr, old, new); }); }
# 145 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __cmpxchg_double(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_double(old1, old2, new1, new2, ptr) : __ll_sc__cmpxchg_double(old1, old2, new1, new2, ptr); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __cmpxchg_double_mb(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_double_mb(old1, old2, new1, new2, ptr) : __ll_sc__cmpxchg_double_mb(old1, old2, new1, new2, ptr); }); }
# 172 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_8(ptr, old, new); case 2: return __cmpxchg_case_16(ptr, old, new); case 4: return __cmpxchg_case_32(ptr, old, new); case 8: return __cmpxchg_case_64(ptr, old, new); default: do { extern void __compiletime_assert_82(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_82(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __cmpxchg_acq(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_acq_8(ptr, old, new); case 2: return __cmpxchg_case_acq_16(ptr, old, new); case 4: return __cmpxchg_case_acq_32(ptr, old, new); case 8: return __cmpxchg_case_acq_64(ptr, old, new); default: do { extern void __compiletime_assert_83(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_83(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __cmpxchg_rel(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_rel_8(ptr, old, new); case 2: return __cmpxchg_case_rel_16(ptr, old, new); case 4: return __cmpxchg_case_rel_32(ptr, old, new); case 8: return __cmpxchg_case_rel_64(ptr, old, new); default: do { extern void __compiletime_assert_84(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_84(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __cmpxchg_mb(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_mb_8(ptr, old, new); case 2: return __cmpxchg_case_mb_16(ptr, old, new); case 4: return __cmpxchg_case_mb_32(ptr, old, new); case 8: return __cmpxchg_case_mb_64(ptr, old, new); default: do { extern void __compiletime_assert_85(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_85(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
# 250 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __cmpwait_case_8(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "b" "\t%" "w" "[tmp], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	cbnz	%" "w" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr) : [val] "r" (val)); };
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __cmpwait_case_16(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "h" "\t%" "w" "[tmp], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	cbnz	%" "w" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr) : [val] "r" (val)); };
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __cmpwait_case_32(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "" "\t%" "w" "[tmp], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	cbnz	%" "w" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr) : [val] "r" (val)); };
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __cmpwait_case_64(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "" "\t%" "" "[tmp], %[v]\n" "	eor	%" "" "[tmp], %" "" "[tmp], %" "" "[val]\n" "	cbnz	%" "" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr) : [val] "r" (val)); };
# 278 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void __cmpwait(volatile void *ptr, unsigned long val, int size) { switch (size) { case 1: return __cmpwait_case_8(ptr, (u8)val); case 2: return __cmpwait_case_16(ptr, (u16)val); case 4: return __cmpwait_case_32(ptr, val); case 8: return __cmpwait_case_64(ptr, val); default: do { extern void __compiletime_assert_86(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_86(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
# 17 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h" 2
# 25 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic_andnot(int i, atomic_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic_andnot(i, v) : __ll_sc_atomic_andnot(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic_or(int i, atomic_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic_or(i, v) : __ll_sc_atomic_or(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic_xor(int i, atomic_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic_xor(i, v) : __ll_sc_atomic_xor(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic_add(int i, atomic_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic_add(i, v) : __ll_sc_atomic_add(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic_and(int i, atomic_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic_and(i, v) : __ll_sc_atomic_and(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic_sub(int i, atomic_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic_sub(i, v) : __ll_sc_atomic_sub(i, v); }); }
# 46 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_andnot_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_andnot_relaxed(i, v) : __ll_sc_atomic_fetch_andnot_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_andnot_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_andnot_acquire(i, v) : __ll_sc_atomic_fetch_andnot_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_andnot_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_andnot_release(i, v) : __ll_sc_atomic_fetch_andnot_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_andnot(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_andnot(i, v) : __ll_sc_atomic_fetch_andnot(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_or_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_or_relaxed(i, v) : __ll_sc_atomic_fetch_or_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_or_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_or_acquire(i, v) : __ll_sc_atomic_fetch_or_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_or_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_or_release(i, v) : __ll_sc_atomic_fetch_or_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_or(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_or(i, v) : __ll_sc_atomic_fetch_or(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_xor_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_xor_relaxed(i, v) : __ll_sc_atomic_fetch_xor_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_xor_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_xor_acquire(i, v) : __ll_sc_atomic_fetch_xor_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_xor_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_xor_release(i, v) : __ll_sc_atomic_fetch_xor_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_xor(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_xor(i, v) : __ll_sc_atomic_fetch_xor(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_add_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_add_relaxed(i, v) : __ll_sc_atomic_fetch_add_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_add_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_add_acquire(i, v) : __ll_sc_atomic_fetch_add_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_add_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_add_release(i, v) : __ll_sc_atomic_fetch_add_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_add(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_add(i, v) : __ll_sc_atomic_fetch_add(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_and_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_and_relaxed(i, v) : __ll_sc_atomic_fetch_and_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_and_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_and_acquire(i, v) : __ll_sc_atomic_fetch_and_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_and_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_and_release(i, v) : __ll_sc_atomic_fetch_and_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_and(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_and(i, v) : __ll_sc_atomic_fetch_and(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_sub_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_sub_relaxed(i, v) : __ll_sc_atomic_fetch_sub_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_sub_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_sub_acquire(i, v) : __ll_sc_atomic_fetch_sub_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_sub_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_sub_release(i, v) : __ll_sc_atomic_fetch_sub_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_sub(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_sub(i, v) : __ll_sc_atomic_fetch_sub(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_add_return_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_add_return_relaxed(i, v) : __ll_sc_atomic_add_return_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_add_return_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_add_return_acquire(i, v) : __ll_sc_atomic_add_return_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_add_return_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_add_return_release(i, v) : __ll_sc_atomic_add_return_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_add_return(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_add_return(i, v) : __ll_sc_atomic_add_return(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_sub_return_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_sub_return_relaxed(i, v) : __ll_sc_atomic_sub_return_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_sub_return_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_sub_return_acquire(i, v) : __ll_sc_atomic_sub_return_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_sub_return_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_sub_return_release(i, v) : __ll_sc_atomic_sub_return_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_sub_return(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_sub_return(i, v) : __ll_sc_atomic_sub_return(i, v); }); }
# 64 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic64_andnot(long i, atomic64_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic64_andnot(i, v) : __ll_sc_atomic64_andnot(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic64_or(long i, atomic64_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic64_or(i, v) : __ll_sc_atomic64_or(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic64_xor(long i, atomic64_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic64_xor(i, v) : __ll_sc_atomic64_xor(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic64_add(long i, atomic64_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic64_add(i, v) : __ll_sc_atomic64_add(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic64_and(long i, atomic64_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic64_and(i, v) : __ll_sc_atomic64_and(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic64_sub(long i, atomic64_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic64_sub(i, v) : __ll_sc_atomic64_sub(i, v); }); }
# 85 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_andnot_relaxed(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_andnot_relaxed(i, v) : __ll_sc_atomic64_fetch_andnot_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_andnot_acquire(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_andnot_acquire(i, v) : __ll_sc_atomic64_fetch_andnot_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_andnot_release(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_andnot_release(i, v) : __ll_sc_atomic64_fetch_andnot_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_andnot(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_andnot(i, v) : __ll_sc_atomic64_fetch_andnot(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_or_relaxed(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_or_relaxed(i, v) : __ll_sc_atomic64_fetch_or_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_or_acquire(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_or_acquire(i, v) : __ll_sc_atomic64_fetch_or_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_or_release(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_or_release(i, v) : __ll_sc_atomic64_fetch_or_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_or(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_or(i, v) : __ll_sc_atomic64_fetch_or(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_xor_relaxed(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_xor_relaxed(i, v) : __ll_sc_atomic64_fetch_xor_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_xor_acquire(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_xor_acquire(i, v) : __ll_sc_atomic64_fetch_xor_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_xor_release(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_xor_release(i, v) : __ll_sc_atomic64_fetch_xor_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_xor(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_xor(i, v) : __ll_sc_atomic64_fetch_xor(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_add_relaxed(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_add_relaxed(i, v) : __ll_sc_atomic64_fetch_add_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_add_acquire(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_add_acquire(i, v) : __ll_sc_atomic64_fetch_add_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_add_release(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_add_release(i, v) : __ll_sc_atomic64_fetch_add_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_add(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_add(i, v) : __ll_sc_atomic64_fetch_add(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_and_relaxed(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_and_relaxed(i, v) : __ll_sc_atomic64_fetch_and_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_and_acquire(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_and_acquire(i, v) : __ll_sc_atomic64_fetch_and_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_and_release(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_and_release(i, v) : __ll_sc_atomic64_fetch_and_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_and(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_and(i, v) : __ll_sc_atomic64_fetch_and(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_sub_relaxed(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_sub_relaxed(i, v) : __ll_sc_atomic64_fetch_sub_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_sub_acquire(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_sub_acquire(i, v) : __ll_sc_atomic64_fetch_sub_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_sub_release(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_sub_release(i, v) : __ll_sc_atomic64_fetch_sub_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_fetch_sub(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_fetch_sub(i, v) : __ll_sc_atomic64_fetch_sub(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_add_return_relaxed(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_add_return_relaxed(i, v) : __ll_sc_atomic64_add_return_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_add_return_acquire(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_add_return_acquire(i, v) : __ll_sc_atomic64_add_return_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_add_return_release(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_add_return_release(i, v) : __ll_sc_atomic64_add_return_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_add_return(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_add_return(i, v) : __ll_sc_atomic64_add_return(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_sub_return_relaxed(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_sub_return_relaxed(i, v) : __ll_sc_atomic64_sub_return_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_sub_return_acquire(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_sub_return_acquire(i, v) : __ll_sc_atomic64_sub_return_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_sub_return_release(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_sub_return_release(i, v) : __ll_sc_atomic64_sub_return_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_sub_return(long i, atomic64_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic64_sub_return(i, v) : __ll_sc_atomic64_sub_return(i, v); }); }




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long arch_atomic64_dec_if_positive(atomic64_t *v)
{
 return ({ system_uses_lse_atomics() ? __lse_atomic64_dec_if_positive(v) : __ll_sc_atomic64_dec_if_positive(v); });
}
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic.h" 2
# 81 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h" 1
# 81 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_read_acquire(const atomic_t *v)
{
 return ({ union { typeof( _Generic((*&(v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&(v)->counter))) __val; char __c[1]; } __u; typeof(&(v)->counter) __p = (&(v)->counter); do { extern void __compiletime_assert_87(void) __attribute__((__error__("Need native word sized stores/loads for atomicity."))); if (!((sizeof(*&(v)->counter) == sizeof(char) || sizeof(*&(v)->counter) == sizeof(short) || sizeof(*&(v)->counter) == sizeof(int) || sizeof(*&(v)->counter) == sizeof(long)))) __compiletime_assert_87(); } while (0); kasan_check_read(__p, sizeof(*&(v)->counter)); switch (sizeof(*&(v)->counter)) { case 1: asm volatile ("ldarb %w0, %1" : "=r" (*(__u8 *)__u.__c) : "Q" (*__p) : "memory"); break; case 2: asm volatile ("ldarh %w0, %1" : "=r" (*(__u16 *)__u.__c) : "Q" (*__p) : "memory"); break; case 4: asm volatile ("ldar %w0, %1" : "=r" (*(__u32 *)__u.__c) : "Q" (*__p) : "memory"); break; case 8: asm volatile ("ldar %0, %1" : "=r" (*(__u64 *)__u.__c) : "Q" (*__p) : "memory"); break; } (typeof(*&(v)->counter))__u.__val; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
arch_atomic_set_release(atomic_t *v, int i)
{
 do { typeof(&(v)->counter) __p = (&(v)->counter); union { typeof( _Generic((*&(v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&(v)->counter))) __val; char __c[1]; } __u = { .__val = ( typeof( _Generic((*&(v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&(v)->counter)))) (i) }; do { extern void __compiletime_assert_88(void) __attribute__((__error__("Need native word sized stores/loads for atomicity."))); if (!((sizeof(*&(v)->counter) == sizeof(char) || sizeof(*&(v)->counter) == sizeof(short) || sizeof(*&(v)->counter) == sizeof(int) || sizeof(*&(v)->counter) == sizeof(long)))) __compiletime_assert_88(); } while (0); kasan_check_write(__p, sizeof(*&(v)->counter)); switch (sizeof(*&(v)->counter)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*__p) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*__p) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*__p) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*__p) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0);
}
# 267 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
arch_atomic_inc(atomic_t *v)
{
 arch_atomic_add(1, v);
}
# 283 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_inc_return(atomic_t *v)
{
 return arch_atomic_add_return(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_inc_return_acquire(atomic_t *v)
{
 return arch_atomic_add_return_acquire(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_inc_return_release(atomic_t *v)
{
 return arch_atomic_add_return_release(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_inc_return_relaxed(atomic_t *v)
{
 return arch_atomic_add_return_relaxed(1, v);
}
# 364 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_fetch_inc(atomic_t *v)
{
 return arch_atomic_fetch_add(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_fetch_inc_acquire(atomic_t *v)
{
 return arch_atomic_fetch_add_acquire(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_fetch_inc_release(atomic_t *v)
{
 return arch_atomic_fetch_add_release(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_fetch_inc_relaxed(atomic_t *v)
{
 return arch_atomic_fetch_add_relaxed(1, v);
}
# 438 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
arch_atomic_dec(atomic_t *v)
{
 arch_atomic_sub(1, v);
}
# 454 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_dec_return(atomic_t *v)
{
 return arch_atomic_sub_return(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_dec_return_acquire(atomic_t *v)
{
 return arch_atomic_sub_return_acquire(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_dec_return_release(atomic_t *v)
{
 return arch_atomic_sub_return_release(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_dec_return_relaxed(atomic_t *v)
{
 return arch_atomic_sub_return_relaxed(1, v);
}
# 535 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_fetch_dec(atomic_t *v)
{
 return arch_atomic_fetch_sub(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_fetch_dec_acquire(atomic_t *v)
{
 return arch_atomic_fetch_sub_acquire(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_fetch_dec_release(atomic_t *v)
{
 return arch_atomic_fetch_sub_release(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_fetch_dec_relaxed(atomic_t *v)
{
 return arch_atomic_fetch_sub_relaxed(1, v);
}
# 916 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_try_cmpxchg(atomic_t *v, int *old, int new)
{
 int r, o = *old;
 r = ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg_mb((&((v)->counter)), (unsigned long)((o)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_try_cmpxchg_acquire(atomic_t *v, int *old, int new)
{
 int r, o = *old;
 r = ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg_acq((&((v)->counter)), (unsigned long)((o)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_try_cmpxchg_release(atomic_t *v, int *old, int new)
{
 int r, o = *old;
 r = ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg_rel((&((v)->counter)), (unsigned long)((o)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_try_cmpxchg_relaxed(atomic_t *v, int *old, int new)
{
 int r, o = *old;
 r = ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg((&((v)->counter)), (unsigned long)((o)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);
}
# 1015 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_sub_and_test(int i, atomic_t *v)
{
 return arch_atomic_sub_return(i, v) == 0;
}
# 1032 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_dec_and_test(atomic_t *v)
{
 return arch_atomic_dec_return(v) == 0;
}
# 1049 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_inc_and_test(atomic_t *v)
{
 return arch_atomic_inc_return(v) == 0;
}
# 1067 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_add_negative(int i, atomic_t *v)
{
 return arch_atomic_add_return(i, v) < 0;
}
# 1085 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_fetch_add_unless(atomic_t *v, int a, int u)
{
 int c = (*(const volatile typeof( _Generic(((v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: ((v)->counter))) *)&((v)->counter));

 do {
  if (__builtin_expect(!!(c == u), 0))
   break;
 } while (!arch_atomic_try_cmpxchg(v, &c, c + a));

 return c;
}
# 1110 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_add_unless(atomic_t *v, int a, int u)
{
 return arch_atomic_fetch_add_unless(v, a, u) != u;
}
# 1126 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_inc_not_zero(atomic_t *v)
{
 return arch_atomic_add_unless(v, 1, 0);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_inc_unless_negative(atomic_t *v)
{
 int c = (*(const volatile typeof( _Generic(((v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: ((v)->counter))) *)&((v)->counter));

 do {
  if (__builtin_expect(!!(c < 0), 0))
   return false;
 } while (!arch_atomic_try_cmpxchg(v, &c, c + 1));

 return true;
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_dec_unless_positive(atomic_t *v)
{
 int c = (*(const volatile typeof( _Generic(((v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: ((v)->counter))) *)&((v)->counter));

 do {
  if (__builtin_expect(!!(c > 0), 0))
   return false;
 } while (!arch_atomic_try_cmpxchg(v, &c, c - 1));

 return true;
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
arch_atomic_dec_if_positive(atomic_t *v)
{
 int dec, c = (*(const volatile typeof( _Generic(((v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: ((v)->counter))) *)&((v)->counter));

 do {
  dec = c - 1;
  if (__builtin_expect(!!(dec < 0), 0))
   break;
 } while (!arch_atomic_try_cmpxchg(v, &c, dec));

 return dec;
}
# 1188 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_read_acquire(const atomic64_t *v)
{
 return ({ union { typeof( _Generic((*&(v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&(v)->counter))) __val; char __c[1]; } __u; typeof(&(v)->counter) __p = (&(v)->counter); do { extern void __compiletime_assert_89(void) __attribute__((__error__("Need native word sized stores/loads for atomicity."))); if (!((sizeof(*&(v)->counter) == sizeof(char) || sizeof(*&(v)->counter) == sizeof(short) || sizeof(*&(v)->counter) == sizeof(int) || sizeof(*&(v)->counter) == sizeof(long)))) __compiletime_assert_89(); } while (0); kasan_check_read(__p, sizeof(*&(v)->counter)); switch (sizeof(*&(v)->counter)) { case 1: asm volatile ("ldarb %w0, %1" : "=r" (*(__u8 *)__u.__c) : "Q" (*__p) : "memory"); break; case 2: asm volatile ("ldarh %w0, %1" : "=r" (*(__u16 *)__u.__c) : "Q" (*__p) : "memory"); break; case 4: asm volatile ("ldar %w0, %1" : "=r" (*(__u32 *)__u.__c) : "Q" (*__p) : "memory"); break; case 8: asm volatile ("ldar %0, %1" : "=r" (*(__u64 *)__u.__c) : "Q" (*__p) : "memory"); break; } (typeof(*&(v)->counter))__u.__val; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
arch_atomic64_set_release(atomic64_t *v, s64 i)
{
 do { typeof(&(v)->counter) __p = (&(v)->counter); union { typeof( _Generic((*&(v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&(v)->counter))) __val; char __c[1]; } __u = { .__val = ( typeof( _Generic((*&(v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&(v)->counter)))) (i) }; do { extern void __compiletime_assert_90(void) __attribute__((__error__("Need native word sized stores/loads for atomicity."))); if (!((sizeof(*&(v)->counter) == sizeof(char) || sizeof(*&(v)->counter) == sizeof(short) || sizeof(*&(v)->counter) == sizeof(int) || sizeof(*&(v)->counter) == sizeof(long)))) __compiletime_assert_90(); } while (0); kasan_check_write(__p, sizeof(*&(v)->counter)); switch (sizeof(*&(v)->counter)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*__p) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*__p) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*__p) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*__p) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0);
}
# 1374 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
arch_atomic64_inc(atomic64_t *v)
{
 arch_atomic64_add(1, v);
}
# 1390 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_inc_return(atomic64_t *v)
{
 return arch_atomic64_add_return(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_inc_return_acquire(atomic64_t *v)
{
 return arch_atomic64_add_return_acquire(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_inc_return_release(atomic64_t *v)
{
 return arch_atomic64_add_return_release(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_inc_return_relaxed(atomic64_t *v)
{
 return arch_atomic64_add_return_relaxed(1, v);
}
# 1471 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_fetch_inc(atomic64_t *v)
{
 return arch_atomic64_fetch_add(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_fetch_inc_acquire(atomic64_t *v)
{
 return arch_atomic64_fetch_add_acquire(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_fetch_inc_release(atomic64_t *v)
{
 return arch_atomic64_fetch_add_release(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_fetch_inc_relaxed(atomic64_t *v)
{
 return arch_atomic64_fetch_add_relaxed(1, v);
}
# 1545 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
arch_atomic64_dec(atomic64_t *v)
{
 arch_atomic64_sub(1, v);
}
# 1561 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_dec_return(atomic64_t *v)
{
 return arch_atomic64_sub_return(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_dec_return_acquire(atomic64_t *v)
{
 return arch_atomic64_sub_return_acquire(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_dec_return_release(atomic64_t *v)
{
 return arch_atomic64_sub_return_release(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_dec_return_relaxed(atomic64_t *v)
{
 return arch_atomic64_sub_return_relaxed(1, v);
}
# 1642 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_fetch_dec(atomic64_t *v)
{
 return arch_atomic64_fetch_sub(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_fetch_dec_acquire(atomic64_t *v)
{
 return arch_atomic64_fetch_sub_acquire(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_fetch_dec_release(atomic64_t *v)
{
 return arch_atomic64_fetch_sub_release(1, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_fetch_dec_relaxed(atomic64_t *v)
{
 return arch_atomic64_fetch_sub_relaxed(1, v);
}
# 2023 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_try_cmpxchg(atomic64_t *v, s64 *old, s64 new)
{
 s64 r, o = *old;
 r = ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg_mb((&((v)->counter)), (unsigned long)((o)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_try_cmpxchg_acquire(atomic64_t *v, s64 *old, s64 new)
{
 s64 r, o = *old;
 r = ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg_acq((&((v)->counter)), (unsigned long)((o)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_try_cmpxchg_release(atomic64_t *v, s64 *old, s64 new)
{
 s64 r, o = *old;
 r = ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg_rel((&((v)->counter)), (unsigned long)((o)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_try_cmpxchg_relaxed(atomic64_t *v, s64 *old, s64 new)
{
 s64 r, o = *old;
 r = ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg((&((v)->counter)), (unsigned long)((o)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);
}
# 2122 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_sub_and_test(s64 i, atomic64_t *v)
{
 return arch_atomic64_sub_return(i, v) == 0;
}
# 2139 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_dec_and_test(atomic64_t *v)
{
 return arch_atomic64_dec_return(v) == 0;
}
# 2156 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_inc_and_test(atomic64_t *v)
{
 return arch_atomic64_inc_return(v) == 0;
}
# 2174 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_add_negative(s64 i, atomic64_t *v)
{
 return arch_atomic64_add_return(i, v) < 0;
}
# 2192 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
arch_atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
{
 s64 c = (*(const volatile typeof( _Generic(((v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: ((v)->counter))) *)&((v)->counter));

 do {
  if (__builtin_expect(!!(c == u), 0))
   break;
 } while (!arch_atomic64_try_cmpxchg(v, &c, c + a));

 return c;
}
# 2217 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_add_unless(atomic64_t *v, s64 a, s64 u)
{
 return arch_atomic64_fetch_add_unless(v, a, u) != u;
}
# 2233 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_inc_not_zero(atomic64_t *v)
{
 return arch_atomic64_add_unless(v, 1, 0);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_inc_unless_negative(atomic64_t *v)
{
 s64 c = (*(const volatile typeof( _Generic(((v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: ((v)->counter))) *)&((v)->counter));

 do {
  if (__builtin_expect(!!(c < 0), 0))
   return false;
 } while (!arch_atomic64_try_cmpxchg(v, &c, c + 1));

 return true;
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_dec_unless_positive(atomic64_t *v)
{
 s64 c = (*(const volatile typeof( _Generic(((v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: ((v)->counter))) *)&((v)->counter));

 do {
  if (__builtin_expect(!!(c > 0), 0))
   return false;
 } while (!arch_atomic64_try_cmpxchg(v, &c, c - 1));

 return true;
}
# 82 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-instrumented.h" 1
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-instrumented.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h" 1
# 24 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void instrument_read(const volatile void *v, size_t size)
{
 kasan_check_read(v, size);
 kcsan_check_access(v, size, 0);
}
# 39 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void instrument_write(const volatile void *v, size_t size)
{
 kasan_check_write(v, size);
 kcsan_check_access(v, size, (1 << 0));
}
# 54 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void instrument_read_write(const volatile void *v, size_t size)
{
 kasan_check_write(v, size);
 kcsan_check_access(v, size, (1 << 1) | (1 << 0));
}
# 69 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void instrument_atomic_read(const volatile void *v, size_t size)
{
 kasan_check_read(v, size);
 kcsan_check_access(v, size, (1 << 2));
}
# 84 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void instrument_atomic_write(const volatile void *v, size_t size)
{
 kasan_check_write(v, size);
 kcsan_check_access(v, size, (1 << 2) | (1 << 0));
}
# 99 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void instrument_atomic_read_write(const volatile void *v, size_t size)
{
 kasan_check_write(v, size);
 kcsan_check_access(v, size, (1 << 2) | (1 << 0) | (1 << 1));
}
# 115 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
instrument_copy_to_user(void *to, const void *from, unsigned long n)
{
 kasan_check_read(from, n);
 kcsan_check_access(from, n, 0);
}
# 132 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
instrument_copy_from_user(const void *to, const void *from, unsigned long n)
{
 kasan_check_write(to, n);
 kcsan_check_access(to, n, (1 << 0));
}
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-instrumented.h" 2

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_read(const atomic_t *v)
{
 instrument_atomic_read(v, sizeof(*v));
 return (*(const volatile typeof( _Generic(((v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: ((v)->counter))) *)&((v)->counter));
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_read_acquire(const atomic_t *v)
{
 instrument_atomic_read(v, sizeof(*v));
 return arch_atomic_read_acquire(v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_set(atomic_t *v, int i)
{
 instrument_atomic_write(v, sizeof(*v));
 do { *(volatile typeof(((v)->counter)) *)&(((v)->counter)) = ((i)); } while (0);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_set_release(atomic_t *v, int i)
{
 instrument_atomic_write(v, sizeof(*v));
 arch_atomic_set_release(v, i);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_add(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic_add(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_add_return(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_add_return(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_add_return_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_add_return_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_add_return_release(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_add_return_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_add_return_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_add_return_relaxed(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_add(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_add(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_add_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_add_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_add_release(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_add_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_add_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_add_relaxed(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_sub(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic_sub(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_sub_return(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_sub_return(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_sub_return_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_sub_return_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_sub_return_release(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_sub_return_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_sub_return_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_sub_return_relaxed(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_sub(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_sub(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_sub_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_sub_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_sub_release(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_sub_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_sub_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_sub_relaxed(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_inc(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic_inc(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_inc_return(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_inc_return(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_inc_return_acquire(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_inc_return_acquire(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_inc_return_release(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_inc_return_release(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_inc_return_relaxed(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_inc_return_relaxed(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_inc(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_inc(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_inc_acquire(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_inc_acquire(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_inc_release(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_inc_release(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_inc_relaxed(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_inc_relaxed(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_dec(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic_dec(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_dec_return(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_dec_return(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_dec_return_acquire(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_dec_return_acquire(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_dec_return_release(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_dec_return_release(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_dec_return_relaxed(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_dec_return_relaxed(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_dec(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_dec(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_dec_acquire(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_dec_acquire(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_dec_release(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_dec_release(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_dec_relaxed(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_dec_relaxed(v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_and(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic_and(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_and(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_and(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_and_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_and_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_and_release(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_and_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_and_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_and_relaxed(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_andnot(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic_andnot(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_andnot(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_andnot(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_andnot_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_andnot_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_andnot_release(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_andnot_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_andnot_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_andnot_relaxed(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_or(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic_or(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_or(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_or(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_or_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_or_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_or_release(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_or_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_or_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_or_relaxed(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_xor(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic_xor(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_xor(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_xor(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_xor_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_xor_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_xor_release(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_xor_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_xor_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_xor_relaxed(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_xchg(atomic_t *v, int i)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __xchg_mb((unsigned long)((i)), (&((v)->counter)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_xchg_acquire(atomic_t *v, int i)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __xchg_acq((unsigned long)((i)), (&((v)->counter)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_xchg_release(atomic_t *v, int i)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __xchg_rel((unsigned long)((i)), (&((v)->counter)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_xchg_relaxed(atomic_t *v, int i)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __xchg((unsigned long)((i)), (&((v)->counter)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_cmpxchg(atomic_t *v, int old, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg_mb((&((v)->counter)), (unsigned long)((old)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_cmpxchg_acquire(atomic_t *v, int old, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg_acq((&((v)->counter)), (unsigned long)((old)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_cmpxchg_release(atomic_t *v, int old, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg_rel((&((v)->counter)), (unsigned long)((old)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_cmpxchg_relaxed(atomic_t *v, int old, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg((&((v)->counter)), (unsigned long)((old)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_try_cmpxchg(atomic_t *v, int *old, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return arch_atomic_try_cmpxchg(v, old, new);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_try_cmpxchg_acquire(atomic_t *v, int *old, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return arch_atomic_try_cmpxchg_acquire(v, old, new);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_try_cmpxchg_release(atomic_t *v, int *old, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return arch_atomic_try_cmpxchg_release(v, old, new);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_try_cmpxchg_relaxed(atomic_t *v, int *old, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return arch_atomic_try_cmpxchg_relaxed(v, old, new);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_sub_and_test(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_sub_and_test(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_dec_and_test(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_dec_and_test(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_inc_and_test(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_inc_and_test(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_add_negative(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_add_negative(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_fetch_add_unless(atomic_t *v, int a, int u)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_fetch_add_unless(v, a, u);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_add_unless(atomic_t *v, int a, int u)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_add_unless(v, a, u);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_inc_not_zero(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_inc_not_zero(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_inc_unless_negative(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_inc_unless_negative(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_dec_unless_positive(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_dec_unless_positive(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int
atomic_dec_if_positive(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic_dec_if_positive(v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_read(const atomic64_t *v)
{
 instrument_atomic_read(v, sizeof(*v));
 return (*(const volatile typeof( _Generic(((v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: ((v)->counter))) *)&((v)->counter));
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_read_acquire(const atomic64_t *v)
{
 instrument_atomic_read(v, sizeof(*v));
 return arch_atomic64_read_acquire(v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic64_set(atomic64_t *v, s64 i)
{
 instrument_atomic_write(v, sizeof(*v));
 do { *(volatile typeof(((v)->counter)) *)&(((v)->counter)) = ((i)); } while (0);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic64_set_release(atomic64_t *v, s64 i)
{
 instrument_atomic_write(v, sizeof(*v));
 arch_atomic64_set_release(v, i);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic64_add(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic64_add(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_add_return(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_add_return(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_add_return_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_add_return_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_add_return_release(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_add_return_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_add_return_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_add_return_relaxed(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_add(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_add(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_add_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_add_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_add_release(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_add_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_add_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_add_relaxed(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic64_sub(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic64_sub(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_sub_return(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_sub_return(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_sub_return_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_sub_return_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_sub_return_release(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_sub_return_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_sub_return_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_sub_return_relaxed(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_sub(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_sub(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_sub_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_sub_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_sub_release(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_sub_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_sub_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_sub_relaxed(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic64_inc(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic64_inc(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_inc_return(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_inc_return(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_inc_return_acquire(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_inc_return_acquire(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_inc_return_release(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_inc_return_release(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_inc_return_relaxed(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_inc_return_relaxed(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_inc(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_inc(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_inc_acquire(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_inc_acquire(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_inc_release(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_inc_release(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_inc_relaxed(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_inc_relaxed(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic64_dec(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic64_dec(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_dec_return(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_dec_return(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_dec_return_acquire(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_dec_return_acquire(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_dec_return_release(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_dec_return_release(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_dec_return_relaxed(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_dec_return_relaxed(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_dec(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_dec(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_dec_acquire(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_dec_acquire(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_dec_release(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_dec_release(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_dec_relaxed(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_dec_relaxed(v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic64_and(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic64_and(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_and(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_and(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_and_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_and_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_and_release(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_and_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_and_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_and_relaxed(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic64_andnot(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic64_andnot(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_andnot(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_andnot(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_andnot_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_andnot_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_andnot_release(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_andnot_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_andnot_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_andnot_relaxed(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic64_or(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic64_or(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_or(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_or(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_or_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_or_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_or_release(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_or_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_or_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_or_relaxed(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic64_xor(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 arch_atomic64_xor(i, v);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_xor(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_xor(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_xor_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_xor_acquire(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_xor_release(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_xor_release(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_xor_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_xor_relaxed(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_xchg(atomic64_t *v, s64 i)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __xchg_mb((unsigned long)((i)), (&((v)->counter)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_xchg_acquire(atomic64_t *v, s64 i)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __xchg_acq((unsigned long)((i)), (&((v)->counter)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_xchg_release(atomic64_t *v, s64 i)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __xchg_rel((unsigned long)((i)), (&((v)->counter)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_xchg_relaxed(atomic64_t *v, s64 i)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __xchg((unsigned long)((i)), (&((v)->counter)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_cmpxchg(atomic64_t *v, s64 old, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg_mb((&((v)->counter)), (unsigned long)((old)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_cmpxchg_acquire(atomic64_t *v, s64 old, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg_acq((&((v)->counter)), (unsigned long)((old)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_cmpxchg_release(atomic64_t *v, s64 old, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg_rel((&((v)->counter)), (unsigned long)((old)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_cmpxchg_relaxed(atomic64_t *v, s64 old, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg((&((v)->counter)), (unsigned long)((old)), (unsigned long)((new)), sizeof(*(&((v)->counter)))); __ret; });
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic64_try_cmpxchg(atomic64_t *v, s64 *old, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return arch_atomic64_try_cmpxchg(v, old, new);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic64_try_cmpxchg_acquire(atomic64_t *v, s64 *old, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return arch_atomic64_try_cmpxchg_acquire(v, old, new);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic64_try_cmpxchg_release(atomic64_t *v, s64 *old, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return arch_atomic64_try_cmpxchg_release(v, old, new);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic64_try_cmpxchg_relaxed(atomic64_t *v, s64 *old, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return arch_atomic64_try_cmpxchg_relaxed(v, old, new);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic64_sub_and_test(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_sub_and_test(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic64_dec_and_test(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_dec_and_test(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic64_inc_and_test(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_inc_and_test(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic64_add_negative(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_add_negative(i, v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_fetch_add_unless(v, a, u);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic64_add_unless(atomic64_t *v, s64 a, s64 u)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_add_unless(v, a, u);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic64_inc_not_zero(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_inc_not_zero(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic64_inc_unless_negative(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_inc_unless_negative(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic64_dec_unless_positive(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_dec_unless_positive(v);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) s64
atomic64_dec_if_positive(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return arch_atomic64_dec_if_positive(v);
}
# 83 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic.h" 2




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-long.h" 1
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-long.h"
# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-long.h" 2


typedef atomic64_t atomic_long_t;
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_read(const atomic_long_t *v)
{
 return atomic64_read(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_read_acquire(const atomic_long_t *v)
{
 return atomic64_read_acquire(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_long_set(atomic_long_t *v, long i)
{
 atomic64_set(v, i);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_long_set_release(atomic_long_t *v, long i)
{
 atomic64_set_release(v, i);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_long_add(long i, atomic_long_t *v)
{
 atomic64_add(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_add_return(long i, atomic_long_t *v)
{
 return atomic64_add_return(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_add_return_acquire(long i, atomic_long_t *v)
{
 return atomic64_add_return_acquire(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_add_return_release(long i, atomic_long_t *v)
{
 return atomic64_add_return_release(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_add_return_relaxed(long i, atomic_long_t *v)
{
 return atomic64_add_return_relaxed(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_add(long i, atomic_long_t *v)
{
 return atomic64_fetch_add(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_add_acquire(long i, atomic_long_t *v)
{
 return atomic64_fetch_add_acquire(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_add_release(long i, atomic_long_t *v)
{
 return atomic64_fetch_add_release(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_add_relaxed(long i, atomic_long_t *v)
{
 return atomic64_fetch_add_relaxed(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_long_sub(long i, atomic_long_t *v)
{
 atomic64_sub(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_sub_return(long i, atomic_long_t *v)
{
 return atomic64_sub_return(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_sub_return_acquire(long i, atomic_long_t *v)
{
 return atomic64_sub_return_acquire(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_sub_return_release(long i, atomic_long_t *v)
{
 return atomic64_sub_return_release(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_sub_return_relaxed(long i, atomic_long_t *v)
{
 return atomic64_sub_return_relaxed(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_sub(long i, atomic_long_t *v)
{
 return atomic64_fetch_sub(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_sub_acquire(long i, atomic_long_t *v)
{
 return atomic64_fetch_sub_acquire(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_sub_release(long i, atomic_long_t *v)
{
 return atomic64_fetch_sub_release(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_sub_relaxed(long i, atomic_long_t *v)
{
 return atomic64_fetch_sub_relaxed(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_long_inc(atomic_long_t *v)
{
 atomic64_inc(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_inc_return(atomic_long_t *v)
{
 return atomic64_inc_return(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_inc_return_acquire(atomic_long_t *v)
{
 return atomic64_inc_return_acquire(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_inc_return_release(atomic_long_t *v)
{
 return atomic64_inc_return_release(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_inc_return_relaxed(atomic_long_t *v)
{
 return atomic64_inc_return_relaxed(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_inc(atomic_long_t *v)
{
 return atomic64_fetch_inc(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_inc_acquire(atomic_long_t *v)
{
 return atomic64_fetch_inc_acquire(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_inc_release(atomic_long_t *v)
{
 return atomic64_fetch_inc_release(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_inc_relaxed(atomic_long_t *v)
{
 return atomic64_fetch_inc_relaxed(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_long_dec(atomic_long_t *v)
{
 atomic64_dec(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_dec_return(atomic_long_t *v)
{
 return atomic64_dec_return(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_dec_return_acquire(atomic_long_t *v)
{
 return atomic64_dec_return_acquire(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_dec_return_release(atomic_long_t *v)
{
 return atomic64_dec_return_release(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_dec_return_relaxed(atomic_long_t *v)
{
 return atomic64_dec_return_relaxed(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_dec(atomic_long_t *v)
{
 return atomic64_fetch_dec(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_dec_acquire(atomic_long_t *v)
{
 return atomic64_fetch_dec_acquire(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_dec_release(atomic_long_t *v)
{
 return atomic64_fetch_dec_release(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_dec_relaxed(atomic_long_t *v)
{
 return atomic64_fetch_dec_relaxed(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_long_and(long i, atomic_long_t *v)
{
 atomic64_and(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_and(long i, atomic_long_t *v)
{
 return atomic64_fetch_and(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_and_acquire(long i, atomic_long_t *v)
{
 return atomic64_fetch_and_acquire(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_and_release(long i, atomic_long_t *v)
{
 return atomic64_fetch_and_release(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_and_relaxed(long i, atomic_long_t *v)
{
 return atomic64_fetch_and_relaxed(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_long_andnot(long i, atomic_long_t *v)
{
 atomic64_andnot(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_andnot(long i, atomic_long_t *v)
{
 return atomic64_fetch_andnot(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_andnot_acquire(long i, atomic_long_t *v)
{
 return atomic64_fetch_andnot_acquire(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_andnot_release(long i, atomic_long_t *v)
{
 return atomic64_fetch_andnot_release(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_andnot_relaxed(long i, atomic_long_t *v)
{
 return atomic64_fetch_andnot_relaxed(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_long_or(long i, atomic_long_t *v)
{
 atomic64_or(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_or(long i, atomic_long_t *v)
{
 return atomic64_fetch_or(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_or_acquire(long i, atomic_long_t *v)
{
 return atomic64_fetch_or_acquire(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_or_release(long i, atomic_long_t *v)
{
 return atomic64_fetch_or_release(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_or_relaxed(long i, atomic_long_t *v)
{
 return atomic64_fetch_or_relaxed(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
atomic_long_xor(long i, atomic_long_t *v)
{
 atomic64_xor(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_xor(long i, atomic_long_t *v)
{
 return atomic64_fetch_xor(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_xor_acquire(long i, atomic_long_t *v)
{
 return atomic64_fetch_xor_acquire(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_xor_release(long i, atomic_long_t *v)
{
 return atomic64_fetch_xor_release(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_xor_relaxed(long i, atomic_long_t *v)
{
 return atomic64_fetch_xor_relaxed(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_xchg(atomic_long_t *v, long i)
{
 return atomic64_xchg(v, i);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_xchg_acquire(atomic_long_t *v, long i)
{
 return atomic64_xchg_acquire(v, i);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_xchg_release(atomic_long_t *v, long i)
{
 return atomic64_xchg_release(v, i);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_xchg_relaxed(atomic_long_t *v, long i)
{
 return atomic64_xchg_relaxed(v, i);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_cmpxchg(atomic_long_t *v, long old, long new)
{
 return atomic64_cmpxchg(v, old, new);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_cmpxchg_acquire(atomic_long_t *v, long old, long new)
{
 return atomic64_cmpxchg_acquire(v, old, new);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_cmpxchg_release(atomic_long_t *v, long old, long new)
{
 return atomic64_cmpxchg_release(v, old, new);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_cmpxchg_relaxed(atomic_long_t *v, long old, long new)
{
 return atomic64_cmpxchg_relaxed(v, old, new);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_long_try_cmpxchg(atomic_long_t *v, long *old, long new)
{
 return atomic64_try_cmpxchg(v, (s64 *)old, new);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_long_try_cmpxchg_acquire(atomic_long_t *v, long *old, long new)
{
 return atomic64_try_cmpxchg_acquire(v, (s64 *)old, new);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_long_try_cmpxchg_release(atomic_long_t *v, long *old, long new)
{
 return atomic64_try_cmpxchg_release(v, (s64 *)old, new);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_long_try_cmpxchg_relaxed(atomic_long_t *v, long *old, long new)
{
 return atomic64_try_cmpxchg_relaxed(v, (s64 *)old, new);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_long_sub_and_test(long i, atomic_long_t *v)
{
 return atomic64_sub_and_test(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_long_dec_and_test(atomic_long_t *v)
{
 return atomic64_dec_and_test(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_long_inc_and_test(atomic_long_t *v)
{
 return atomic64_inc_and_test(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_long_add_negative(long i, atomic_long_t *v)
{
 return atomic64_add_negative(i, v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_fetch_add_unless(atomic_long_t *v, long a, long u)
{
 return atomic64_fetch_add_unless(v, a, u);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_long_add_unless(atomic_long_t *v, long a, long u)
{
 return atomic64_add_unless(v, a, u);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_long_inc_not_zero(atomic_long_t *v)
{
 return atomic64_inc_not_zero(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_long_inc_unless_negative(atomic_long_t *v)
{
 return atomic64_inc_unless_negative(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
atomic_long_dec_unless_positive(atomic_long_t *v)
{
 return atomic64_dec_unless_positive(v);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long
atomic_long_dec_if_positive(atomic_long_t *v)
{
 return atomic64_dec_if_positive(v);
}
# 88 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/atomic.h" 2
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void set_bit(unsigned int nr, volatile unsigned long *p)
{
 p += ((nr) / 64);
 atomic_long_or(((((1UL))) << ((nr) % 64)), (atomic_long_t *)p);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void clear_bit(unsigned int nr, volatile unsigned long *p)
{
 p += ((nr) / 64);
 atomic_long_andnot(((((1UL))) << ((nr) % 64)), (atomic_long_t *)p);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void change_bit(unsigned int nr, volatile unsigned long *p)
{
 p += ((nr) / 64);
 atomic_long_xor(((((1UL))) << ((nr) % 64)), (atomic_long_t *)p);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int test_and_set_bit(unsigned int nr, volatile unsigned long *p)
{
 long old;
 unsigned long mask = ((((1UL))) << ((nr) % 64));

 p += ((nr) / 64);
 old = atomic_long_fetch_or(mask, (atomic_long_t *)p);
 return !!(old & mask);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int test_and_clear_bit(unsigned int nr, volatile unsigned long *p)
{
 long old;
 unsigned long mask = ((((1UL))) << ((nr) % 64));

 p += ((nr) / 64);
 old = atomic_long_fetch_andnot(mask, (atomic_long_t *)p);
 return !!(old & mask);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int test_and_change_bit(unsigned int nr, volatile unsigned long *p)
{
 long old;
 unsigned long mask = ((((1UL))) << ((nr) % 64));

 p += ((nr) / 64);
 old = atomic_long_fetch_xor(mask, (atomic_long_t *)p);
 return !!(old & mask);
}
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/lock.h" 1
# 18 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int test_and_set_bit_lock(unsigned int nr,
     volatile unsigned long *p)
{
 long old;
 unsigned long mask = ((((1UL))) << ((nr) % 64));

 p += ((nr) / 64);
 if (({ do { extern void __compiletime_assert_91(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*p) == sizeof(char) || sizeof(*p) == sizeof(short) || sizeof(*p) == sizeof(int) || sizeof(*p) == sizeof(long)) || sizeof(*p) == sizeof(long long))) __compiletime_assert_91(); } while (0); (*(const volatile typeof( _Generic((*p), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*p))) *)&(*p)); }) & mask)
  return 1;

 old = atomic_long_fetch_or_acquire(mask, (atomic_long_t *)p);
 return !!(old & mask);
}
# 40 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void clear_bit_unlock(unsigned int nr, volatile unsigned long *p)
{
 p += ((nr) / 64);
 atomic_long_fetch_andnot_release(((((1UL))) << ((nr) % 64)), (atomic_long_t *)p);
}
# 57 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __clear_bit_unlock(unsigned int nr,
          volatile unsigned long *p)
{
 unsigned long old;

 p += ((nr) / 64);
 old = ({ do { extern void __compiletime_assert_92(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*p) == sizeof(char) || sizeof(*p) == sizeof(short) || sizeof(*p) == sizeof(int) || sizeof(*p) == sizeof(long)) || sizeof(*p) == sizeof(long long))) __compiletime_assert_92(); } while (0); (*(const volatile typeof( _Generic((*p), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*p))) *)&(*p)); });
 old &= ~((((1UL))) << ((nr) % 64));
 atomic_long_set_release((atomic_long_t *)p, old);
}
# 78 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool clear_bit_unlock_is_negative_byte(unsigned int nr,
           volatile unsigned long *p)
{
 long old;
 unsigned long mask = ((((1UL))) << ((nr) % 64));

 p += ((nr) / 64);
 old = atomic_long_fetch_andnot_release(mask, (atomic_long_t *)p);
 return !!(old & ((((1UL))) << (7)));
}
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/non-atomic.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/non-atomic.h" 2
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __set_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);

 *p |= mask;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __clear_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);

 *p &= ~mask;
}
# 41 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __change_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);

 *p ^= mask;
}
# 58 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __test_and_set_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);
 unsigned long old = *p;

 *p = old | mask;
 return (old & mask) != 0;
}
# 77 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __test_and_clear_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);
 unsigned long old = *p;

 *p = old & ~mask;
 return (old & mask) != 0;
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __test_and_change_bit(int nr,
         volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);
 unsigned long old = *p;

 *p = old ^ mask;
 return (old & mask) != 0;
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int test_bit(int nr, const volatile unsigned long *addr)
{
 return 1UL & (addr[((nr) / 64)] >> (nr & (64 -1)));
}
# 29 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/le.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/le.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/byteorder.h" 1
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/byteorder.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/byteorder/little_endian.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/byteorder/little_endian.h" 1
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/byteorder/little_endian.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/swab.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/swab.h" 1







# 1 "./arch/arm64/include/generated/uapi/asm/swab.h" 1
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/swab.h" 1
# 1 "./arch/arm64/include/generated/uapi/asm/swab.h" 2
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/swab.h" 2
# 48 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/swab.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__const__)) __u16 __fswab16(__u16 val)
{



 return ((__u16)( (((__u16)(val) & (__u16)0x00ffU) << 8) | (((__u16)(val) & (__u16)0xff00U) >> 8)));

}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__const__)) __u32 __fswab32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x000000ffUL) << 24) | (((__u32)(val) & (__u32)0x0000ff00UL) << 8) | (((__u32)(val) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(val) & (__u32)0xff000000UL) >> 24)));

}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__const__)) __u64 __fswab64(__u64 val)
{







 return ((__u64)( (((__u64)(val) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(val) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(val) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(val) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(val) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(val) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(val) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(val) & (__u64)0xff00000000000000ULL) >> 56)));

}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__const__)) __u32 __fswahw32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x0000ffffUL) << 16) | (((__u32)(val) & (__u32)0xffff0000UL) >> 16)));

}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__const__)) __u32 __fswahb32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(val) & (__u32)0xff00ff00UL) >> 8)));

}
# 136 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/swab.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __swab(const unsigned long y)
{

 return (__builtin_constant_p((__u64)(y)) ? ((__u64)( (((__u64)(y) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(y) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(y) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(y) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(y) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(y) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(y) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(y) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(y));



}
# 171 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/swab.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __u16 __swab16p(const __u16 *p)
{



 return (__builtin_constant_p((__u16)(*p)) ? ((__u16)( (((__u16)(*p) & (__u16)0x00ffU) << 8) | (((__u16)(*p) & (__u16)0xff00U) >> 8))) : __fswab16(*p));

}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __u32 __swab32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x000000ffUL) << 24) | (((__u32)(*p) & (__u32)0x0000ff00UL) << 8) | (((__u32)(*p) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(*p) & (__u32)0xff000000UL) >> 24))) : __fswab32(*p));

}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __u64 __swab64p(const __u64 *p)
{



 return (__builtin_constant_p((__u64)(*p)) ? ((__u64)( (((__u64)(*p) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(*p) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(*p) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(*p) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(*p) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(*p) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(*p) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(*p) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(*p));

}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __u32 __swahw32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x0000ffffUL) << 16) | (((__u32)(*p) & (__u32)0xffff0000UL) >> 16))) : __fswahw32(*p));

}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __u32 __swahb32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(*p) & (__u32)0xff00ff00UL) >> 8))) : __fswahb32(*p));

}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __swab16s(__u16 *p)
{



 *p = __swab16p(p);

}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void __swab32s(__u32 *p)
{



 *p = __swab32p(p);

}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void __swab64s(__u64 *p)
{



 *p = __swab64p(p);

}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __swahw32s(__u32 *p)
{



 *p = __swahw32p(p);

}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __swahb32s(__u32 *p)
{



 *p = __swahb32p(p);

}
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/swab.h" 2
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/byteorder/little_endian.h" 2
# 44 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/byteorder/little_endian.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __le64 __cpu_to_le64p(const __u64 *p)
{
 return ( __le64)*p;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __u64 __le64_to_cpup(const __le64 *p)
{
 return ( __u64)*p;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __le32 __cpu_to_le32p(const __u32 *p)
{
 return ( __le32)*p;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __u32 __le32_to_cpup(const __le32 *p)
{
 return ( __u32)*p;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __le16 __cpu_to_le16p(const __u16 *p)
{
 return ( __le16)*p;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __u16 __le16_to_cpup(const __le16 *p)
{
 return ( __u16)*p;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __be64 __cpu_to_be64p(const __u64 *p)
{
 return ( __be64)__swab64p(p);
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __u64 __be64_to_cpup(const __be64 *p)
{
 return __swab64p((__u64 *)p);
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __be32 __cpu_to_be32p(const __u32 *p)
{
 return ( __be32)__swab32p(p);
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __u32 __be32_to_cpup(const __be32 *p)
{
 return __swab32p((__u32 *)p);
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __be16 __cpu_to_be16p(const __u16 *p)
{
 return ( __be16)__swab16p(p);
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __u16 __be16_to_cpup(const __be16 *p)
{
 return __swab16p((__u16 *)p);
}
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/byteorder/little_endian.h" 2





# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/byteorder/generic.h" 1
# 144 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/byteorder/generic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void le16_add_cpu(__le16 *var, u16 val)
{
 *var = (( __le16)(__u16)((( __u16)(__le16)(*var)) + val));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void le32_add_cpu(__le32 *var, u32 val)
{
 *var = (( __le32)(__u32)((( __u32)(__le32)(*var)) + val));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void le64_add_cpu(__le64 *var, u64 val)
{
 *var = (( __le64)(__u64)((( __u64)(__le64)(*var)) + val));
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void le32_to_cpu_array(u32 *buf, unsigned int words)
{
 while (words--) {
  do { (void)(buf); } while (0);
  buf++;
 }
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpu_to_le32_array(u32 *buf, unsigned int words)
{
 while (words--) {
  do { (void)(buf); } while (0);
  buf++;
 }
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void be16_add_cpu(__be16 *var, u16 val)
{
 *var = (( __be16)(__builtin_constant_p((__u16)(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val))) ? ((__u16)( (((__u16)(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val)) & (__u16)0x00ffU) << 8) | (((__u16)(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val)) & (__u16)0xff00U) >> 8))) : __fswab16(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val))));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void be32_add_cpu(__be32 *var, u32 val)
{
 *var = (( __be32)(__builtin_constant_p((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val))) ? ((__u32)( (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x000000ffUL) << 24) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0xff000000UL) >> 24))) : __fswab32(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val))));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void be64_add_cpu(__be64 *var, u64 val)
{
 *var = (( __be64)(__builtin_constant_p((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val))) ? ((__u64)( (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val))));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpu_to_be32_array(__be32 *dst, const u32 *src, size_t len)
{
 int i;

 for (i = 0; i < len; i++)
  dst[i] = (( __be32)(__builtin_constant_p((__u32)((src[i]))) ? ((__u32)( (((__u32)((src[i])) & (__u32)0x000000ffUL) << 24) | (((__u32)((src[i])) & (__u32)0x0000ff00UL) << 8) | (((__u32)((src[i])) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((src[i])) & (__u32)0xff000000UL) >> 24))) : __fswab32((src[i]))));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void be32_to_cpu_array(u32 *dst, const __be32 *src, size_t len)
{
 int i;

 for (i = 0; i < len; i++)
  dst[i] = (__builtin_constant_p((__u32)(( __u32)(__be32)(src[i]))) ? ((__u32)( (((__u32)(( __u32)(__be32)(src[i])) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(src[i])) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(src[i])) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(src[i])) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(src[i])));
}
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/byteorder/little_endian.h" 2
# 24 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/byteorder.h" 2
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/le.h" 2





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long find_next_zero_bit_le(const void *addr,
  unsigned long size, unsigned long offset)
{
 return find_next_zero_bit(addr, size, offset);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long find_next_bit_le(const void *addr,
  unsigned long size, unsigned long offset)
{
 return find_next_bit(addr, size, offset);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long find_first_zero_bit_le(const void *addr,
  unsigned long size)
{
 return find_next_zero_bit((addr), (size), 0);
}
# 53 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/le.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int test_bit_le(int nr, const void *addr)
{
 return test_bit(nr ^ 0, addr);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void set_bit_le(int nr, void *addr)
{
 set_bit(nr ^ 0, addr);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void clear_bit_le(int nr, void *addr)
{
 clear_bit(nr ^ 0, addr);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __set_bit_le(int nr, void *addr)
{
 __set_bit(nr ^ 0, addr);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __clear_bit_le(int nr, void *addr)
{
 __clear_bit(nr ^ 0, addr);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int test_and_set_bit_le(int nr, void *addr)
{
 return test_and_set_bit(nr ^ 0, addr);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int test_and_clear_bit_le(int nr, void *addr)
{
 return test_and_clear_bit(nr ^ 0, addr);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __test_and_set_bit_le(int nr, void *addr)
{
 return __test_and_set_bit(nr ^ 0, addr);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __test_and_clear_bit_le(int nr, void *addr)
{
 return __test_and_clear_bit(nr ^ 0, addr);
}
# 30 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/ext2-atomic-setbit.h" 1
# 31 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 30 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h" 2
# 65 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int get_bitmask_order(unsigned int count)
{
 int order;

 order = fls(count);
 return order;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long hweight_long(unsigned long w)
{
 return sizeof(w) == 4 ? (__builtin_constant_p(w) ? ((((unsigned int) ((!!((w) & (1ULL << 0))) + (!!((w) & (1ULL << 1))) + (!!((w) & (1ULL << 2))) + (!!((w) & (1ULL << 3))) + (!!((w) & (1ULL << 4))) + (!!((w) & (1ULL << 5))) + (!!((w) & (1ULL << 6))) + (!!((w) & (1ULL << 7))))) + ((unsigned int) ((!!(((w) >> 8) & (1ULL << 0))) + (!!(((w) >> 8) & (1ULL << 1))) + (!!(((w) >> 8) & (1ULL << 2))) + (!!(((w) >> 8) & (1ULL << 3))) + (!!(((w) >> 8) & (1ULL << 4))) + (!!(((w) >> 8) & (1ULL << 5))) + (!!(((w) >> 8) & (1ULL << 6))) + (!!(((w) >> 8) & (1ULL << 7)))))) + (((unsigned int) ((!!(((w) >> 16) & (1ULL << 0))) + (!!(((w) >> 16) & (1ULL << 1))) + (!!(((w) >> 16) & (1ULL << 2))) + (!!(((w) >> 16) & (1ULL << 3))) + (!!(((w) >> 16) & (1ULL << 4))) + (!!(((w) >> 16) & (1ULL << 5))) + (!!(((w) >> 16) & (1ULL << 6))) + (!!(((w) >> 16) & (1ULL << 7))))) + ((unsigned int) ((!!((((w) >> 16) >> 8) & (1ULL << 0))) + (!!((((w) >> 16) >> 8) & (1ULL << 1))) + (!!((((w) >> 16) >> 8) & (1ULL << 2))) + (!!((((w) >> 16) >> 8) & (1ULL << 3))) + (!!((((w) >> 16) >> 8) & (1ULL << 4))) + (!!((((w) >> 16) >> 8) & (1ULL << 5))) + (!!((((w) >> 16) >> 8) & (1ULL << 6))) + (!!((((w) >> 16) >> 8) & (1ULL << 7))))))) : __arch_hweight32(w)) : (__builtin_constant_p((__u64)w) ? (((((unsigned int) ((!!(((__u64)w) & (1ULL << 0))) + (!!(((__u64)w) & (1ULL << 1))) + (!!(((__u64)w) & (1ULL << 2))) + (!!(((__u64)w) & (1ULL << 3))) + (!!(((__u64)w) & (1ULL << 4))) + (!!(((__u64)w) & (1ULL << 5))) + (!!(((__u64)w) & (1ULL << 6))) + (!!(((__u64)w) & (1ULL << 7))))) + ((unsigned int) ((!!((((__u64)w) >> 8) & (1ULL << 0))) + (!!((((__u64)w) >> 8) & (1ULL << 1))) + (!!((((__u64)w) >> 8) & (1ULL << 2))) + (!!((((__u64)w) >> 8) & (1ULL << 3))) + (!!((((__u64)w) >> 8) & (1ULL << 4))) + (!!((((__u64)w) >> 8) & (1ULL << 5))) + (!!((((__u64)w) >> 8) & (1ULL << 6))) + (!!((((__u64)w) >> 8) & (1ULL << 7)))))) + (((unsigned int) ((!!((((__u64)w) >> 16) & (1ULL << 0))) + (!!((((__u64)w) >> 16) & (1ULL << 1))) + (!!((((__u64)w) >> 16) & (1ULL << 2))) + (!!((((__u64)w) >> 16) & (1ULL << 3))) + (!!((((__u64)w) >> 16) & (1ULL << 4))) + (!!((((__u64)w) >> 16) & (1ULL << 5))) + (!!((((__u64)w) >> 16) & (1ULL << 6))) + (!!((((__u64)w) >> 16) & (1ULL << 7))))) + ((unsigned int) ((!!(((((__u64)w) >> 16) >> 8) & (1ULL << 0))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 1))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 2))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 3))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 4))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 5))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 6))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 7))))))) + ((((unsigned int) ((!!((((__u64)w) >> 32) & (1ULL << 0))) + (!!((((__u64)w) >> 32) & (1ULL << 1))) + (!!((((__u64)w) >> 32) & (1ULL << 2))) + (!!((((__u64)w) >> 32) & (1ULL << 3))) + (!!((((__u64)w) >> 32) & (1ULL << 4))) + (!!((((__u64)w) >> 32) & (1ULL << 5))) + (!!((((__u64)w) >> 32) & (1ULL << 6))) + (!!((((__u64)w) >> 32) & (1ULL << 7))))) + ((unsigned int) ((!!(((((__u64)w) >> 32) >> 8) & (1ULL << 0))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 1))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 2))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 3))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 4))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 5))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 6))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 7)))))) + (((unsigned int) ((!!(((((__u64)w) >> 32) >> 16) & (1ULL << 0))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 1))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 2))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 3))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 4))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 5))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 6))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 7))))) + ((unsigned int) ((!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 0))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 1))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 2))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 3))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 4))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 5))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 6))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 7)))))))) : __arch_hweight64((__u64)w));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __u64 rol64(__u64 word, unsigned int shift)
{
 return (word << (shift & 63)) | (word >> ((-shift) & 63));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __u64 ror64(__u64 word, unsigned int shift)
{
 return (word >> (shift & 63)) | (word << ((-shift) & 63));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __u32 rol32(__u32 word, unsigned int shift)
{
 return (word << (shift & 31)) | (word >> ((-shift) & 31));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __u32 ror32(__u32 word, unsigned int shift)
{
 return (word >> (shift & 31)) | (word << ((-shift) & 31));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __u16 rol16(__u16 word, unsigned int shift)
{
 return (word << (shift & 15)) | (word >> ((-shift) & 15));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __u16 ror16(__u16 word, unsigned int shift)
{
 return (word >> (shift & 15)) | (word << ((-shift) & 15));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __u8 rol8(__u8 word, unsigned int shift)
{
 return (word << (shift & 7)) | (word >> ((-shift) & 7));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __u8 ror8(__u8 word, unsigned int shift)
{
 return (word >> (shift & 7)) | (word << ((-shift) & 7));
}
# 165 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __s32 sign_extend32(__u32 value, int index)
{
 __u8 shift = 31 - index;
 return (__s32)(value << shift) >> shift;
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __s64 sign_extend64(__u64 value, int index)
{
 __u8 shift = 63 - index;
 return (__s64)(value << shift) >> shift;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned fls_long(unsigned long l)
{
 if (sizeof(l) == 4)
  return fls(l);
 return fls64(l);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int get_count_order(unsigned int count)
{
 if (count == 0)
  return -1;

 return fls(--count);
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int get_count_order_long(unsigned long l)
{
 if (l == 0UL)
  return -1;
 return (int)fls_long(--l);
}
# 218 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long __ffs64(u64 word)
{






 return __ffs((unsigned long)word);
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void assign_bit(long nr, volatile unsigned long *addr,
           bool value)
{
 if (value)
  set_bit(nr, addr);
 else
  clear_bit(nr, addr);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void __assign_bit(long nr, volatile unsigned long *addr,
      bool value)
{
 if (value)
  __set_bit(nr, addr);
 else
  __clear_bit(nr, addr);
}
# 294 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h"
extern unsigned long find_last_bit(const unsigned long *addr,
       unsigned long size);
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kstrtox.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kstrtox.h"
int __attribute__((__warn_unused_result__)) _kstrtoul(const char *s, unsigned int base, unsigned long *res);
int __attribute__((__warn_unused_result__)) _kstrtol(const char *s, unsigned int base, long *res);

int __attribute__((__warn_unused_result__)) kstrtoull(const char *s, unsigned int base, unsigned long long *res);
int __attribute__((__warn_unused_result__)) kstrtoll(const char *s, unsigned int base, long long *res);
# 30 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kstrtox.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__warn_unused_result__)) kstrtoul(const char *s, unsigned int base, unsigned long *res)
{




 if (sizeof(unsigned long) == sizeof(unsigned long long) &&
     __alignof__(unsigned long) == __alignof__(unsigned long long))
  return kstrtoull(s, base, (unsigned long long *)res);
 else
  return _kstrtoul(s, base, res);
}
# 58 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kstrtox.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__warn_unused_result__)) kstrtol(const char *s, unsigned int base, long *res)
{




 if (sizeof(long) == sizeof(long long) &&
     __alignof__(long) == __alignof__(long long))
  return kstrtoll(s, base, (long long *)res);
 else
  return _kstrtol(s, base, res);
}

int __attribute__((__warn_unused_result__)) kstrtouint(const char *s, unsigned int base, unsigned int *res);
int __attribute__((__warn_unused_result__)) kstrtoint(const char *s, unsigned int base, int *res);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__warn_unused_result__)) kstrtou64(const char *s, unsigned int base, u64 *res)
{
 return kstrtoull(s, base, res);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__warn_unused_result__)) kstrtos64(const char *s, unsigned int base, s64 *res)
{
 return kstrtoll(s, base, res);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__warn_unused_result__)) kstrtou32(const char *s, unsigned int base, u32 *res)
{
 return kstrtouint(s, base, res);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__warn_unused_result__)) kstrtos32(const char *s, unsigned int base, s32 *res)
{
 return kstrtoint(s, base, res);
}

int __attribute__((__warn_unused_result__)) kstrtou16(const char *s, unsigned int base, u16 *res);
int __attribute__((__warn_unused_result__)) kstrtos16(const char *s, unsigned int base, s16 *res);
int __attribute__((__warn_unused_result__)) kstrtou8(const char *s, unsigned int base, u8 *res);
int __attribute__((__warn_unused_result__)) kstrtos8(const char *s, unsigned int base, s8 *res);
int __attribute__((__warn_unused_result__)) kstrtobool(const char *s, bool *res);

int __attribute__((__warn_unused_result__)) kstrtoull_from_user(const char *s, size_t count, unsigned int base, unsigned long long *res);
int __attribute__((__warn_unused_result__)) kstrtoll_from_user(const char *s, size_t count, unsigned int base, long long *res);
int __attribute__((__warn_unused_result__)) kstrtoul_from_user(const char *s, size_t count, unsigned int base, unsigned long *res);
int __attribute__((__warn_unused_result__)) kstrtol_from_user(const char *s, size_t count, unsigned int base, long *res);
int __attribute__((__warn_unused_result__)) kstrtouint_from_user(const char *s, size_t count, unsigned int base, unsigned int *res);
int __attribute__((__warn_unused_result__)) kstrtoint_from_user(const char *s, size_t count, unsigned int base, int *res);
int __attribute__((__warn_unused_result__)) kstrtou16_from_user(const char *s, size_t count, unsigned int base, u16 *res);
int __attribute__((__warn_unused_result__)) kstrtos16_from_user(const char *s, size_t count, unsigned int base, s16 *res);
int __attribute__((__warn_unused_result__)) kstrtou8_from_user(const char *s, size_t count, unsigned int base, u8 *res);
int __attribute__((__warn_unused_result__)) kstrtos8_from_user(const char *s, size_t count, unsigned int base, s8 *res);
int __attribute__((__warn_unused_result__)) kstrtobool_from_user(const char *s, size_t count, bool *res);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__warn_unused_result__)) kstrtou64_from_user(const char *s, size_t count, unsigned int base, u64 *res)
{
 return kstrtoull_from_user(s, count, base, res);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__warn_unused_result__)) kstrtos64_from_user(const char *s, size_t count, unsigned int base, s64 *res)
{
 return kstrtoll_from_user(s, count, base, res);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__warn_unused_result__)) kstrtou32_from_user(const char *s, size_t count, unsigned int base, u32 *res)
{
 return kstrtouint_from_user(s, count, base, res);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__warn_unused_result__)) kstrtos32_from_user(const char *s, size_t count, unsigned int base, s32 *res)
{
 return kstrtoint_from_user(s, count, base, res);
}
# 145 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kstrtox.h"
extern unsigned long simple_strtoul(const char *,char **,unsigned int);
extern long simple_strtol(const char *,char **,unsigned int);
extern unsigned long long simple_strtoull(const char *,char **,unsigned int);
extern long long simple_strtoll(const char *,char **,unsigned int);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int strtobool(const char *s, bool *res)
{
 return kstrtobool(s, res);
}
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/log2.h" 1
# 21 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/log2.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((const))
int __ilog2_u32(u32 n)
{
 return fls(n) - 1;
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((const))
int __ilog2_u64(u64 n)
{
 return fls64(n) - 1;
}
# 44 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/log2.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((const))
bool is_power_of_2(unsigned long n)
{
 return (n != 0 && ((n & (n - 1)) == 0));
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((const))
unsigned long __roundup_pow_of_two(unsigned long n)
{
 return 1UL << fls_long(n - 1);
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((const))
unsigned long __rounddown_pow_of_two(unsigned long n)
{
 return 1UL << (fls_long(n) - 1);
}
# 197 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/log2.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__const__))
int __order_base_2(unsigned long n)
{
 return n > 1 ? ( __builtin_constant_p(n - 1) ? ( __builtin_constant_p(n - 1) ? ( (n - 1) < 2 ? 0 : (n - 1) & (1ULL << 63) ? 63 : (n - 1) & (1ULL << 62) ? 62 : (n - 1) & (1ULL << 61) ? 61 : (n - 1) & (1ULL << 60) ? 60 : (n - 1) & (1ULL << 59) ? 59 : (n - 1) & (1ULL << 58) ? 58 : (n - 1) & (1ULL << 57) ? 57 : (n - 1) & (1ULL << 56) ? 56 : (n - 1) & (1ULL << 55) ? 55 : (n - 1) & (1ULL << 54) ? 54 : (n - 1) & (1ULL << 53) ? 53 : (n - 1) & (1ULL << 52) ? 52 : (n - 1) & (1ULL << 51) ? 51 : (n - 1) & (1ULL << 50) ? 50 : (n - 1) & (1ULL << 49) ? 49 : (n - 1) & (1ULL << 48) ? 48 : (n - 1) & (1ULL << 47) ? 47 : (n - 1) & (1ULL << 46) ? 46 : (n - 1) & (1ULL << 45) ? 45 : (n - 1) & (1ULL << 44) ? 44 : (n - 1) & (1ULL << 43) ? 43 : (n - 1) & (1ULL << 42) ? 42 : (n - 1) & (1ULL << 41) ? 41 : (n - 1) & (1ULL << 40) ? 40 : (n - 1) & (1ULL << 39) ? 39 : (n - 1) & (1ULL << 38) ? 38 : (n - 1) & (1ULL << 37) ? 37 : (n - 1) & (1ULL << 36) ? 36 : (n - 1) & (1ULL << 35) ? 35 : (n - 1) & (1ULL << 34) ? 34 : (n - 1) & (1ULL << 33) ? 33 : (n - 1) & (1ULL << 32) ? 32 : (n - 1) & (1ULL << 31) ? 31 : (n - 1) & (1ULL << 30) ? 30 : (n - 1) & (1ULL << 29) ? 29 : (n - 1) & (1ULL << 28) ? 28 : (n - 1) & (1ULL << 27) ? 27 : (n - 1) & (1ULL << 26) ? 26 : (n - 1) & (1ULL << 25) ? 25 : (n - 1) & (1ULL << 24) ? 24 : (n - 1) & (1ULL << 23) ? 23 : (n - 1) & (1ULL << 22) ? 22 : (n - 1) & (1ULL << 21) ? 21 : (n - 1) & (1ULL << 20) ? 20 : (n - 1) & (1ULL << 19) ? 19 : (n - 1) & (1ULL << 18) ? 18 : (n - 1) & (1ULL << 17) ? 17 : (n - 1) & (1ULL << 16) ? 16 : (n - 1) & (1ULL << 15) ? 15 : (n - 1) & (1ULL << 14) ? 14 : (n - 1) & (1ULL << 13) ? 13 : (n - 1) & (1ULL << 12) ? 12 : (n - 1) & (1ULL << 11) ? 11 : (n - 1) & (1ULL << 10) ? 10 : (n - 1) & (1ULL << 9) ? 9 : (n - 1) & (1ULL << 8) ? 8 : (n - 1) & (1ULL << 7) ? 7 : (n - 1) & (1ULL << 6) ? 6 : (n - 1) & (1ULL << 5) ? 5 : (n - 1) & (1ULL << 4) ? 4 : (n - 1) & (1ULL << 3) ? 3 : (n - 1) & (1ULL << 2) ? 2 : 1) : -1) : (sizeof(n - 1) <= 4) ? __ilog2_u32(n - 1) : __ilog2_u64(n - 1) ) + 1 : 0;
}
# 224 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/log2.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((const))
int __bits_per(unsigned long n)
{
 if (n < 2)
  return 1;
 if (is_power_of_2(n))
  return ( __builtin_constant_p(n) ? ( ((n) == 0 || (n) == 1) ? 0 : ( __builtin_constant_p((n) - 1) ? ( __builtin_constant_p((n) - 1) ? ( ((n) - 1) < 2 ? 0 : ((n) - 1) & (1ULL << 63) ? 63 : ((n) - 1) & (1ULL << 62) ? 62 : ((n) - 1) & (1ULL << 61) ? 61 : ((n) - 1) & (1ULL << 60) ? 60 : ((n) - 1) & (1ULL << 59) ? 59 : ((n) - 1) & (1ULL << 58) ? 58 : ((n) - 1) & (1ULL << 57) ? 57 : ((n) - 1) & (1ULL << 56) ? 56 : ((n) - 1) & (1ULL << 55) ? 55 : ((n) - 1) & (1ULL << 54) ? 54 : ((n) - 1) & (1ULL << 53) ? 53 : ((n) - 1) & (1ULL << 52) ? 52 : ((n) - 1) & (1ULL << 51) ? 51 : ((n) - 1) & (1ULL << 50) ? 50 : ((n) - 1) & (1ULL << 49) ? 49 : ((n) - 1) & (1ULL << 48) ? 48 : ((n) - 1) & (1ULL << 47) ? 47 : ((n) - 1) & (1ULL << 46) ? 46 : ((n) - 1) & (1ULL << 45) ? 45 : ((n) - 1) & (1ULL << 44) ? 44 : ((n) - 1) & (1ULL << 43) ? 43 : ((n) - 1) & (1ULL << 42) ? 42 : ((n) - 1) & (1ULL << 41) ? 41 : ((n) - 1) & (1ULL << 40) ? 40 : ((n) - 1) & (1ULL << 39) ? 39 : ((n) - 1) & (1ULL << 38) ? 38 : ((n) - 1) & (1ULL << 37) ? 37 : ((n) - 1) & (1ULL << 36) ? 36 : ((n) - 1) & (1ULL << 35) ? 35 : ((n) - 1) & (1ULL << 34) ? 34 : ((n) - 1) & (1ULL << 33) ? 33 : ((n) - 1) & (1ULL << 32) ? 32 : ((n) - 1) & (1ULL << 31) ? 31 : ((n) - 1) & (1ULL << 30) ? 30 : ((n) - 1) & (1ULL << 29) ? 29 : ((n) - 1) & (1ULL << 28) ? 28 : ((n) - 1) & (1ULL << 27) ? 27 : ((n) - 1) & (1ULL << 26) ? 26 : ((n) - 1) & (1ULL << 25) ? 25 : ((n) - 1) & (1ULL << 24) ? 24 : ((n) - 1) & (1ULL << 23) ? 23 : ((n) - 1) & (1ULL << 22) ? 22 : ((n) - 1) & (1ULL << 21) ? 21 : ((n) - 1) & (1ULL << 20) ? 20 : ((n) - 1) & (1ULL << 19) ? 19 : ((n) - 1) & (1ULL << 18) ? 18 : ((n) - 1) & (1ULL << 17) ? 17 : ((n) - 1) & (1ULL << 16) ? 16 : ((n) - 1) & (1ULL << 15) ? 15 : ((n) - 1) & (1ULL << 14) ? 14 : ((n) - 1) & (1ULL << 13) ? 13 : ((n) - 1) & (1ULL << 12) ? 12 : ((n) - 1) & (1ULL << 11) ? 11 : ((n) - 1) & (1ULL << 10) ? 10 : ((n) - 1) & (1ULL << 9) ? 9 : ((n) - 1) & (1ULL << 8) ? 8 : ((n) - 1) & (1ULL << 7) ? 7 : ((n) - 1) & (1ULL << 6) ? 6 : ((n) - 1) & (1ULL << 5) ? 5 : ((n) - 1) & (1ULL << 4) ? 4 : ((n) - 1) & (1ULL << 3) ? 3 : ((n) - 1) & (1ULL << 2) ? 2 : 1) : -1) : (sizeof((n) - 1) <= 4) ? __ilog2_u32((n) - 1) : __ilog2_u64((n) - 1) ) + 1) : __order_base_2(n) ) + 1;
 return ( __builtin_constant_p(n) ? ( ((n) == 0 || (n) == 1) ? 0 : ( __builtin_constant_p((n) - 1) ? ( __builtin_constant_p((n) - 1) ? ( ((n) - 1) < 2 ? 0 : ((n) - 1) & (1ULL << 63) ? 63 : ((n) - 1) & (1ULL << 62) ? 62 : ((n) - 1) & (1ULL << 61) ? 61 : ((n) - 1) & (1ULL << 60) ? 60 : ((n) - 1) & (1ULL << 59) ? 59 : ((n) - 1) & (1ULL << 58) ? 58 : ((n) - 1) & (1ULL << 57) ? 57 : ((n) - 1) & (1ULL << 56) ? 56 : ((n) - 1) & (1ULL << 55) ? 55 : ((n) - 1) & (1ULL << 54) ? 54 : ((n) - 1) & (1ULL << 53) ? 53 : ((n) - 1) & (1ULL << 52) ? 52 : ((n) - 1) & (1ULL << 51) ? 51 : ((n) - 1) & (1ULL << 50) ? 50 : ((n) - 1) & (1ULL << 49) ? 49 : ((n) - 1) & (1ULL << 48) ? 48 : ((n) - 1) & (1ULL << 47) ? 47 : ((n) - 1) & (1ULL << 46) ? 46 : ((n) - 1) & (1ULL << 45) ? 45 : ((n) - 1) & (1ULL << 44) ? 44 : ((n) - 1) & (1ULL << 43) ? 43 : ((n) - 1) & (1ULL << 42) ? 42 : ((n) - 1) & (1ULL << 41) ? 41 : ((n) - 1) & (1ULL << 40) ? 40 : ((n) - 1) & (1ULL << 39) ? 39 : ((n) - 1) & (1ULL << 38) ? 38 : ((n) - 1) & (1ULL << 37) ? 37 : ((n) - 1) & (1ULL << 36) ? 36 : ((n) - 1) & (1ULL << 35) ? 35 : ((n) - 1) & (1ULL << 34) ? 34 : ((n) - 1) & (1ULL << 33) ? 33 : ((n) - 1) & (1ULL << 32) ? 32 : ((n) - 1) & (1ULL << 31) ? 31 : ((n) - 1) & (1ULL << 30) ? 30 : ((n) - 1) & (1ULL << 29) ? 29 : ((n) - 1) & (1ULL << 28) ? 28 : ((n) - 1) & (1ULL << 27) ? 27 : ((n) - 1) & (1ULL << 26) ? 26 : ((n) - 1) & (1ULL << 25) ? 25 : ((n) - 1) & (1ULL << 24) ? 24 : ((n) - 1) & (1ULL << 23) ? 23 : ((n) - 1) & (1ULL << 22) ? 22 : ((n) - 1) & (1ULL << 21) ? 21 : ((n) - 1) & (1ULL << 20) ? 20 : ((n) - 1) & (1ULL << 19) ? 19 : ((n) - 1) & (1ULL << 18) ? 18 : ((n) - 1) & (1ULL << 17) ? 17 : ((n) - 1) & (1ULL << 16) ? 16 : ((n) - 1) & (1ULL << 15) ? 15 : ((n) - 1) & (1ULL << 14) ? 14 : ((n) - 1) & (1ULL << 13) ? 13 : ((n) - 1) & (1ULL << 12) ? 12 : ((n) - 1) & (1ULL << 11) ? 11 : ((n) - 1) & (1ULL << 10) ? 10 : ((n) - 1) & (1ULL << 9) ? 9 : ((n) - 1) & (1ULL << 8) ? 8 : ((n) - 1) & (1ULL << 7) ? 7 : ((n) - 1) & (1ULL << 6) ? 6 : ((n) - 1) & (1ULL << 5) ? 5 : ((n) - 1) & (1ULL << 4) ? 4 : ((n) - 1) & (1ULL << 3) ? 3 : ((n) - 1) & (1ULL << 2) ? 2 : 1) : -1) : (sizeof((n) - 1) <= 4) ? __ilog2_u32((n) - 1) : __ilog2_u64((n) - 1) ) + 1) : __order_base_2(n) );
}
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/minmax.h" 1
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/typecheck.h" 1
# 17 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h" 1






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kern_levels.h" 1
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cache.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/kernel.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/sysinfo.h" 1







struct sysinfo {
 __kernel_long_t uptime;
 __kernel_ulong_t loads[3];
 __kernel_ulong_t totalram;
 __kernel_ulong_t freeram;
 __kernel_ulong_t sharedram;
 __kernel_ulong_t bufferram;
 __kernel_ulong_t totalswap;
 __kernel_ulong_t freeswap;
 __u16 procs;
 __u16 pad;
 __kernel_ulong_t totalhigh;
 __kernel_ulong_t freehigh;
 __u32 mem_unit;
 char _f[20-2*sizeof(__kernel_ulong_t)-sizeof(__u32)];
};
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/kernel.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cache.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cache.h" 1







# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cputype.h" 1
# 168 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cputype.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/sysreg.h" 1
# 169 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cputype.h" 2
# 181 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cputype.h"
struct midr_range {
 u32 model;
 u32 rv_min;
 u32 rv_max;
};
# 198 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cputype.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool midr_is_cpu_model_range(u32 midr, u32 model, u32 rv_min,
        u32 rv_max)
{
 u32 _model = midr & ((0xff << 24) | (0xfff << 4) | (0xf << 16));
 u32 rv = midr & (0xf | (0xf << 20));

 return _model == model && rv >= rv_min && rv <= rv_max;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool is_midr_in_range(u32 midr, struct midr_range const *range)
{
 return midr_is_cpu_model_range(midr, range->model,
           range->rv_min, range->rv_max);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool
is_midr_in_range_list(u32 midr, struct midr_range const *ranges)
{
 while (ranges->model)
  if (is_midr_in_range(midr, ranges++))
   return true;
 return false;
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __attribute__((__const__)) read_cpuid_id(void)
{
 return ({ u64 __val; asm volatile("	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	mrs_s, rt, sreg\n" ".inst " "(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	mrs_s " "%0" ", " "(((3) << 19) | ((0) << 16) | ((0) << 12) | ((0) << 8) | ((0) << 5))" "\n" "	.purgem	mrs_s\n" : "=r" (__val)); __val; });
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __attribute__((__const__)) read_cpuid_mpidr(void)
{
 return ({ u64 __val; asm volatile("	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	mrs_s, rt, sreg\n" ".inst " "(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	mrs_s " "%0" ", " "(((3) << 19) | ((0) << 16) | ((0) << 12) | ((0) << 8) | ((5) << 5))" "\n" "	.purgem	mrs_s\n" : "=r" (__val)); __val; });
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int __attribute__((__const__)) read_cpuid_implementor(void)
{
 return (((read_cpuid_id()) & (0xff << 24)) >> 24);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int __attribute__((__const__)) read_cpuid_part_number(void)
{
 return (((read_cpuid_id()) & (0xfff << 4)) >> 4);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __attribute__((__const__)) read_cpuid_cachetype(void)
{
 return ({ u64 __val; asm volatile("	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	mrs_s, rt, sreg\n" ".inst " "(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	mrs_s " "%0" ", " "(((3) << 19) | ((3) << 16) | ((0) << 12) | ((0) << 8) | ((1) << 5))" "\n" "	.purgem	mrs_s\n" : "=r" (__val)); __val; });
}
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cache.h" 2
# 62 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cache.h"
extern unsigned long __icache_flags;





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int icache_is_aliasing(void)
{
 return test_bit(0, &__icache_flags);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int icache_is_vpipt(void)
{
 return test_bit(1, &__icache_flags);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 cache_type_cwg(void)
{
 return (read_cpuid_cachetype() >> 24) & 15;
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int cache_line_size_of_cpu(void)
{
 u32 cwg = cache_type_cwg();

 return cwg ? 4 << cwg : (128);
}

int cache_line_size(void);
# 110 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cache.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __attribute__((__const__)) read_cpuid_effective_cachetype(void)
{
 u32 ctr = read_cpuid_cachetype();

 if (!(ctr & ((((1UL))) << (28)))) {
  u64 clidr = ({ u64 __val; asm volatile("mrs %0, " "clidr_el1" : "=r" (__val)); __val; });

  if ((((clidr) >> 24) & 0x7) == 0 ||
      ((((clidr) >> 21) & 0x7) == 0 && (((clidr) >> 27) & 0x7) == 0))
   ctr |= ((((1UL))) << (28));
 }

 return ctr;
}
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cache.h" 2
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/ratelimit_types.h" 1





# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/param.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/param.h" 1
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/param.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/param.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/param.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/param.h" 2
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/param.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/param.h" 2
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/ratelimit_types.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h" 1
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock_types.h" 1
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock_types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qspinlock_types.h" 1
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qspinlock_types.h"
typedef struct qspinlock {
 union {
  atomic_t val;







  struct {
   u8 locked;
   u8 pending;
  };
  struct {
   u16 locked_pending;
   u16 tail;
  };
# 43 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qspinlock_types.h"
 };
} arch_spinlock_t;
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock_types.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qrwlock_types.h" 1






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock_types.h" 1
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qrwlock_types.h" 2





typedef struct qrwlock {
 union {
  atomic_t cnts;
  struct {

   u8 wlocked;
   u8 __lstate[3];




  };
 };
 arch_spinlock_t wait_lock;
} arch_rwlock_t;
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock_types.h" 2
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h" 2




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep_types.h" 1
# 17 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep_types.h"
enum lockdep_wait_type {
 LD_WAIT_INV = 0,

 LD_WAIT_FREE,
 LD_WAIT_SPIN,




 LD_WAIT_CONFIG = LD_WAIT_SPIN,

 LD_WAIT_SLEEP,

 LD_WAIT_MAX,
};

enum lockdep_lock_type {
 LD_LOCK_NORMAL = 0,
 LD_LOCK_PERCPU,
 LD_LOCK_MAX,
};
# 197 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep_types.h"
struct lock_class_key { };




struct lockdep_map { };

struct pin_cookie { };
# 19 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h" 2

typedef struct raw_spinlock {
 arch_spinlock_t raw_lock;







} raw_spinlock_t;
# 71 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h"
typedef struct spinlock {
 union {
  struct raw_spinlock rlock;
# 82 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h"
 };
} spinlock_t;
# 99 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/rwlock_types.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/rwlock_types.h"
typedef struct {
 arch_rwlock_t raw_lock;







} rwlock_t;
# 100 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h" 2
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/ratelimit_types.h" 2







struct ratelimit_state {
 raw_spinlock_t lock;

 int interval;
 int burst;
 int printed;
 int missed;
 unsigned long begin;
 unsigned long flags;
};
# 44 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/ratelimit_types.h"
extern int ___ratelimit(struct ratelimit_state *rs, const char *func);
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h" 2

extern const char linux_banner[];
extern const char linux_proc_banner[];

extern int oops_in_progress;



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int printk_get_level(const char *buffer)
{
 if (buffer[0] == '\001' && buffer[1]) {
  switch (buffer[1]) {
  case '0' ... '7':
  case 'c':
   return buffer[1];
  }
 }
 return 0;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) const char *printk_skip_level(const char *buffer)
{
 if (printk_get_level(buffer))
  return buffer + 2;

 return buffer;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) const char *printk_skip_headers(const char *buffer)
{
 while (printk_get_level(buffer))
  buffer = printk_skip_level(buffer);

 return buffer;
}
# 65 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h"
extern int console_printk[];






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void console_silent(void)
{
 (console_printk[0]) = 0;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void console_verbose(void)
{
 if ((console_printk[0]))
  (console_printk[0]) = 15;
}



extern char devkmsg_log_str[];
struct ctl_table;

extern int suppress_printk;

struct va_format {
 const char *fmt;
 va_list *va;
};
# 148 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__format__(printf, 1, 2))) __attribute__((__cold__))
void early_printk(const char *s, ...) { }



extern void printk_nmi_enter(void);
extern void printk_nmi_exit(void);
extern void printk_nmi_direct_enter(void);
extern void printk_nmi_direct_exit(void);







struct dev_printk_info;


 __attribute__((__format__(printf, 4, 0)))
int vprintk_emit(int facility, int level,
   const struct dev_printk_info *dev_info,
   const char *fmt, va_list args);

 __attribute__((__format__(printf, 1, 0)))
int vprintk(const char *fmt, va_list args);

 __attribute__((__format__(printf, 1, 2))) __attribute__((__cold__))
int printk(const char *fmt, ...);




__attribute__((__format__(printf, 1, 2))) __attribute__((__cold__)) int printk_deferred(const char *fmt, ...);






extern int __printk_ratelimit(const char *func);

extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
       unsigned int interval_msec);

extern int printk_delay_msec;
extern int dmesg_restrict;

extern int
devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write, void *buf,
     size_t *lenp, loff_t *ppos);

extern void wake_up_klogd(void);

char *log_buf_addr_get(void);
u32 log_buf_len_get(void);
void log_buf_vmcoreinfo_setup(void);
void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) setup_log_buf(int early);
__attribute__((__format__(printf, 1, 2))) void dump_stack_set_arch_desc(const char *fmt, ...);
void dump_stack_print_info(const char *log_lvl);
void show_regs_print_info(const char *log_lvl);
extern void dump_stack(void) __attribute__((__cold__));
extern void printk_safe_flush(void);
extern void printk_safe_flush_on_panic(void);
# 285 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h"
extern int kptr_restrict;
# 565 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h"
extern const struct file_operations kmsg_fops;

enum {
 DUMP_PREFIX_NONE,
 DUMP_PREFIX_ADDRESS,
 DUMP_PREFIX_OFFSET
};
extern int hex_dump_to_buffer(const void *buf, size_t len, int rowsize,
         int groupsize, char *linebuf, size_t linebuflen,
         bool ascii);

extern void print_hex_dump(const char *level, const char *prefix_str,
      int prefix_type, int rowsize, int groupsize,
      const void *buf, size_t len, bool ascii);
# 604 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void print_hex_dump_debug(const char *prefix_str, int prefix_type,
     int rowsize, int groupsize,
     const void *buf, size_t len, bool ascii)
{
}
# 627 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h"
extern void __printk_safe_enter(void);
extern void __printk_safe_exit(void);
# 18 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2


# 1 "./arch/arm64/include/generated/asm/div64.h" 1
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/div64.h" 1
# 1 "./arch/arm64/include/generated/asm/div64.h" 2
# 21 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2
# 195 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
struct completion;
struct pt_regs;
struct user;
# 251 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
  static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void ___might_sleep(const char *file, int line,
       int preempt_offset) { }
  static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __might_sleep(const char *file, int line,
       int preempt_offset) { }
# 308 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 reciprocal_scale(u32 val, u32 ep_ro)
{
 return (u32)(((u64) val * ep_ro) >> 32);
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void might_fault(void) { }


extern struct atomic_notifier_head panic_notifier_list;
extern long (*panic_blink)(int state);
__attribute__((__format__(printf, 1, 2)))
void panic(const char *fmt, ...) __attribute__((__noreturn__)) __attribute__((__cold__));
void nmi_panic(struct pt_regs *regs, const char *msg);
void check_panic_on_warn(const char *origin);
extern void oops_enter(void);
extern void oops_exit(void);
extern bool oops_may_print(void);
void do_exit(long error_code) __attribute__((__noreturn__));
void complete_and_exit(struct completion *, long) __attribute__((__noreturn__));

extern int num_to_str(char *buf, int size,
        unsigned long long num, unsigned int width);



extern __attribute__((__format__(printf, 2, 3))) int sprintf(char *buf, const char * fmt, ...);
extern __attribute__((__format__(printf, 2, 0))) int vsprintf(char *buf, const char *, va_list);
extern __attribute__((__format__(printf, 3, 4)))
int snprintf(char *buf, size_t size, const char *fmt, ...);
extern __attribute__((__format__(printf, 3, 0)))
int vsnprintf(char *buf, size_t size, const char *fmt, va_list args);
extern __attribute__((__format__(printf, 3, 4)))
int scnprintf(char *buf, size_t size, const char *fmt, ...);
extern __attribute__((__format__(printf, 3, 0)))
int vscnprintf(char *buf, size_t size, const char *fmt, va_list args);
extern __attribute__((__format__(printf, 2, 3))) __attribute__((__malloc__))
char *kasprintf(gfp_t gfp, const char *fmt, ...);
extern __attribute__((__format__(printf, 2, 0))) __attribute__((__malloc__))
char *kvasprintf(gfp_t gfp, const char *fmt, va_list args);
extern __attribute__((__format__(printf, 2, 0)))
const char *kvasprintf_const(gfp_t gfp, const char *fmt, va_list args);

extern __attribute__((__format__(scanf, 2, 3)))
int sscanf(const char *, const char *, ...);
extern __attribute__((__format__(scanf, 2, 0)))
int vsscanf(const char *, const char *, va_list);

extern int get_option(char **str, int *pint);
extern char *get_options(const char *str, int nints, int *ints);
extern unsigned long long memparse(const char *ptr, char **retptr);
extern bool parse_option_str(const char *str, const char *option);
extern char *next_arg(char *args, char **param, char **val);

extern int core_kernel_text(unsigned long addr);
extern int init_kernel_text(unsigned long addr);
extern int core_kernel_data(unsigned long addr);
extern int __kernel_text_address(unsigned long addr);
extern int kernel_text_address(unsigned long addr);
extern int func_ptr_is_kernel_text(void *ptr);

u64 int_pow(u64 base, unsigned int exp);
unsigned long int_sqrt(unsigned long);




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 int_sqrt64(u64 x)
{
 return (u32)int_sqrt(x);
}


extern void bust_spinlocks(int yes);
extern int panic_timeout;
extern unsigned long panic_print;
extern int panic_on_oops;
extern int panic_on_unrecovered_nmi;
extern int panic_on_io_nmi;
extern int panic_on_warn;
extern unsigned long panic_on_taint;
extern bool panic_on_taint_nousertaint;
extern int sysctl_panic_on_rcu_stall;
extern int sysctl_panic_on_stackoverflow;

extern bool crash_kexec_post_notifiers;






extern atomic_t panic_cpu;






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void set_arch_panic_timeout(int timeout, int arch_default_timeout)
{
 if (panic_timeout == arch_default_timeout)
  panic_timeout = timeout;
}
extern const char *print_tainted(void);
enum lockdep_ok {
 LOCKDEP_STILL_OK,
 LOCKDEP_NOW_UNRELIABLE
};
extern void add_taint(unsigned flag, enum lockdep_ok);
extern int test_taint(unsigned flag);
extern unsigned long get_taint(void);
extern int root_mountflags;

extern bool early_boot_irqs_disabled;





extern enum system_states {
 SYSTEM_BOOTING,
 SYSTEM_SCHEDULING,
 SYSTEM_RUNNING,
 SYSTEM_HALT,
 SYSTEM_POWER_OFF,
 SYSTEM_RESTART,
 SYSTEM_SUSPEND,
} system_state;
# 464 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
struct taint_flag {
 char c_true;
 char c_false;
 bool module;
};

extern const struct taint_flag taint_flags[18];

extern const char hex_asc[];



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) char *hex_byte_pack(char *buf, u8 byte)
{
 *buf++ = hex_asc[((byte) & 0xf0) >> 4];
 *buf++ = hex_asc[((byte) & 0x0f)];
 return buf;
}

extern const char hex_asc_upper[];



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) char *hex_byte_pack_upper(char *buf, u8 byte)
{
 *buf++ = hex_asc_upper[((byte) & 0xf0) >> 4];
 *buf++ = hex_asc_upper[((byte) & 0x0f)];
 return buf;
}

extern int hex_to_bin(unsigned char ch);
extern int __attribute__((__warn_unused_result__)) hex2bin(u8 *dst, const char *src, size_t count);
extern char *bin2hex(char *dst, const void *src, size_t count);

bool mac_pton(const char *s, u8 *mac);
# 520 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
enum ftrace_dump_mode {
 DUMP_NONE,
 DUMP_ALL,
 DUMP_ORIG,
};


void tracing_on(void);
void tracing_off(void);
int tracing_is_on(void);
void tracing_snapshot(void);
void tracing_snapshot_alloc(void);

extern void tracing_start(void);
extern void tracing_stop(void);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__format__(printf, 1, 2)))
void ____trace_printk_check_format(const char *fmt, ...)
{
}
# 599 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
extern __attribute__((__format__(printf, 2, 3)))
int __trace_bprintk(unsigned long ip, const char *fmt, ...);

extern __attribute__((__format__(printf, 2, 3)))
int __trace_printk(unsigned long ip, const char *fmt, ...);
# 640 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
extern int __trace_bputs(unsigned long ip, const char *str);
extern int __trace_puts(unsigned long ip, const char *str, int size);

extern void trace_dump_stack(int skip);
# 662 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
extern __attribute__((__format__(printf, 2, 0))) int
__ftrace_vbprintk(unsigned long ip, const char *fmt, va_list ap);

extern __attribute__((__format__(printf, 2, 0))) int
__ftrace_vprintk(unsigned long ip, const char *fmt, va_list ap);

extern void ftrace_dump(enum ftrace_dump_mode oops_dump_mode);
# 21 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h" 2




struct bug_entry {



 signed int bug_addr_disp;





 signed int file_disp;

 unsigned short line;

 unsigned short flags;
};
# 93 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h"
extern __attribute__((__format__(printf, 1, 2))) void __warn_printk(const char *fmt, ...);
# 111 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h"
struct warn_args;
struct pt_regs;

void __warn(const char *file, int line, void *caller, unsigned taint,
     struct pt_regs *regs, struct warn_args *args);
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bug.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bug.h" 2



enum bug_trap_type {
 BUG_TRAP_TYPE_NONE = 0,
 BUG_TRAP_TYPE_WARN = 1,
 BUG_TRAP_TYPE_BUG = 2,
};

struct pt_regs;
# 34 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bug.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int is_warning_bug(const struct bug_entry *bug)
{
 return bug->flags & (1 << 0);
}

struct bug_entry *find_bug(unsigned long bugaddr);

enum bug_trap_type report_bug(unsigned long bug_addr, struct pt_regs *regs);


int is_valid_bugaddr(unsigned long addr);

void generic_bug_clear_once(void);
# 70 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bug.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__warn_unused_result__)) bool check_data_corruption(bool v) { return v; }
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/bug.h" 2




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h" 1
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
struct nvgpu_list_node {



 struct nvgpu_list_node *prev;



 struct nvgpu_list_node *next;
};
# 47 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_init_list_node(struct nvgpu_list_node *node)
{
 node->prev = node;
 node->next = node;
}
# 63 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_list_add(struct nvgpu_list_node *new_node,
     struct nvgpu_list_node *head)
{
 new_node->next = head->next;
 new_node->next->prev = new_node;
 new_node->prev = head;
 head->next = new_node;
}
# 84 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_list_add_tail(struct nvgpu_list_node *new_node,
     struct nvgpu_list_node *head)
{
 new_node->prev = head->prev;
 new_node->prev->next = new_node;
 new_node->next = head;
 head->prev = new_node;
}
# 103 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_list_del(struct nvgpu_list_node *node)
{
 node->prev->next = node->next;
 node->next->prev = node->prev;
 nvgpu_init_list_node(node);
}
# 123 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool nvgpu_list_empty(struct nvgpu_list_node *head)
{
 return head->next == head;
}
# 142 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_list_move(struct nvgpu_list_node *node,
     struct nvgpu_list_node *head)
{
 nvgpu_list_del(node);
 nvgpu_list_add(node, head);
}
# 161 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_list_replace_init(struct nvgpu_list_node *old_node,
     struct nvgpu_list_node *new_node)
{
 new_node->next = old_node->next;
 new_node->next->prev = new_node;
 new_node->prev = old_node->prev;
 new_node->prev->next = new_node;
 nvgpu_init_list_node(old_node);
}
# 32 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/bug.h" 2
# 75 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/bug.h"
struct gk20a;
# 92 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/bug.h"
struct nvgpu_bug_cb
{
 void (*cb)(void *arg);
 void *arg;
 struct nvgpu_list_node node;
 bool sw_quiesce_data;
};

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) struct nvgpu_bug_cb *
nvgpu_bug_cb_from_node(struct nvgpu_list_node *node)
{
 return (struct nvgpu_bug_cb *)
  ((uintptr_t)node - __builtin_offsetof(struct nvgpu_bug_cb, node));
};


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_bug_exit(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_bug_register_cb(struct nvgpu_bug_cb *cb) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_bug_unregister_cb(struct nvgpu_bug_cb *cb) { }
# 40 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h" 2






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_cast_s32_to_u32(s32 si_a);
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_cast_s32_to_u64(s32 si_a);
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_cast_s64_to_u64(s64 l_a);
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 nvgpu_safe_cast_u64_to_s64(u64 ul_a);
# 64 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_add_u32(u32 ui_a, u32 ui_b)
{
 if (((~0U) - ui_a) < ui_b) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 67; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return ui_a + ui_b;
 }
}
# 91 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s32 nvgpu_safe_add_s32(s32 si_a, s32 si_b)
{
 if (((si_b > 0) && (si_a > (((int)(~0U >> 1)) - si_b))) ||
  ((si_b < 0) && (si_a < ((-((int)(~0U >> 1)) - 1) - si_b)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 95; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return si_a + si_b;
 }
}
# 115 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_add_u64(u64 ul_a, u64 ul_b)
{
 if (((~0UL) - ul_a) < ul_b) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 118; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return ul_a + ul_b;
 }
}
# 142 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 nvgpu_safe_add_s64(s64 sl_a, s64 sl_b)
{
 if (((sl_b > 0) && (sl_a > (((long)(~0UL >> 1)) - sl_b))) ||
  ((sl_b < 0) && (sl_a < ((-((long)(~0UL >> 1)) - 1) - sl_b)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 146; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return sl_a + sl_b;
 }
}
# 177 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_wrapping_add_u32(u32 ui_a, u32 ui_b)
{

 u64 ul_a = (u64)ui_a;
 u64 ul_b = (u64)ui_b;
 u64 sum = (ul_a + ul_b) & 0xffffffffULL;


 ((void) ({ int __ret_warn_on = !!(!(sum <= ((u32)~0U))); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 185; .short (1 << 0)|(((9) << 8)); .popsection; 14471: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); }));

 return (u32)sum;
}
# 201 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_wrapping_sub_u32(u32 ui_a, u32 ui_b)
{

 u64 ul_a = (u64)ui_a;
 u64 ul_b = (u64)ui_b;
 u64 diff = (ul_a + 0xffffffff00000000ULL - ul_b) & 0xffffffffULL;
# 231 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
 ((void) ({ int __ret_warn_on = !!(!(diff <= ((u32)~0U))); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 231; .short (1 << 0)|(((9) << 8)); .popsection; 14471: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); }));

 return (u32)diff;
}
# 248 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 nvgpu_safe_sub_u8(u8 uc_a, u8 uc_b)
{
 if (uc_a < uc_b) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 251; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u8)(uc_a - uc_b);
 }
}
# 270 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_sub_u32(u32 ui_a, u32 ui_b)
{
 if (ui_a < ui_b) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 273; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return ui_a - ui_b;
 }
}
# 297 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s32 nvgpu_safe_sub_s32(s32 si_a, s32 si_b)
{
 if (((si_b > 0) && (si_a < ((-((int)(~0U >> 1)) - 1) + si_b))) ||
  ((si_b < 0) && (si_a > (((int)(~0U >> 1)) + si_b)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 301; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return si_a - si_b;
 }
}
# 320 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_sub_u64(u64 ul_a, u64 ul_b)
{
 if (ul_a < ul_b) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 323; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return ul_a - ul_b;
 }
}
# 357 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 nvgpu_safe_sub_s64(s64 si_a, s64 si_b)
{
 if (((si_b > 0) && (si_a < ((-((long)(~0UL >> 1)) - 1) + si_b))) ||
  ((si_b < 0) && (si_a > (((long)(~0UL >> 1)) + si_b)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 361; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return si_a - si_b;
 }
}
# 384 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_mult_u32(u32 ui_a, u32 ui_b)
{
 if ((ui_a == 0U) || (ui_b == 0U)) {
  return 0U;
 } else if (ui_a > ((~0U) / ui_b)) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 389; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return ui_a * ui_b;
 }
}
# 412 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_mult_u64(u64 ul_a, u64 ul_b)
{
 if ((ul_a == 0UL) || (ul_b == 0UL)) {
  return 0UL;
 } else if (ul_a > ((~0UL) / ul_b)) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 417; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return ul_a * ul_b;
 }
}
# 449 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 nvgpu_safe_mult_s64(s64 sl_a, s64 sl_b)
{
 if (sl_a > 0) {
  if (sl_b > 0) {
   if (sl_a > (((long)(~0UL >> 1)) / sl_b)) {
    do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 454; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
    return 0;
   }
  } else {
   if (sl_b < ((-((long)(~0UL >> 1)) - 1) / sl_a)) {
    do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 459; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
    return 0;
   }
  }
 } else {
  if (sl_b > 0) {
   if (sl_a < ((-((long)(~0UL >> 1)) - 1) / sl_b)) {
    do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 466; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
    return 0;
   }
  } else {
   if ((sl_a != 0) && (sl_b < (((long)(~0UL >> 1)) / sl_a))) {
    do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 471; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
    return 0;
   }
  }
 }

 return sl_a * sl_b;
}
# 490 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 nvgpu_safe_cast_u64_to_u16(u64 ul_a)
{
 if (ul_a > ((unsigned short)~0U)) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 493; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u16)ul_a;
 }
}
# 510 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_cast_u64_to_u32(u64 ul_a)
{
 if (ul_a > (~0U)) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 513; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u32)ul_a;
 }
}
# 531 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 nvgpu_safe_cast_u64_to_u8(u64 ul_a)
{
 if (ul_a > nvgpu_safe_cast_s32_to_u64(((u8)~0U))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 534; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u8)ul_a;
 }
}
# 552 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_cast_s64_to_u32(s64 l_a)
{
 if ((l_a < 0) || (l_a > nvgpu_safe_cast_u64_to_s64(((u64)((~0U)))))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 555; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u32)l_a;
 }
}
# 572 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_cast_s64_to_u64(s64 l_a)
{
 if (l_a < 0) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 575; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u64)l_a;
 }
}
# 589 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_cast_bool_to_u32(bool bl_a)
{
 return (bl_a == true) ? 1U : 0U;
}
# 604 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 nvgpu_safe_cast_s8_to_u8(s8 sc_a)
{
 if (sc_a < 0) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 607; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u8)sc_a;
 }
}
# 624 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_cast_s32_to_u32(s32 si_a)
{
 if (si_a < 0) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 627; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u32)si_a;
 }
}
# 644 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_cast_s32_to_u64(s32 si_a)
{
 if (si_a < 0) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 647; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u64)si_a;
 }
}
# 664 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 nvgpu_safe_cast_u32_to_u16(u32 ui_a)
{
 if (ui_a > ((unsigned short)~0U)) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 667; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u16)ui_a;
 }
}
# 685 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 nvgpu_safe_cast_u32_to_u8(u32 ui_a)
{
 if (ui_a > nvgpu_safe_cast_s32_to_u32(((u8)~0U))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 688; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u8)ui_a;
 }
}
# 706 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s8 nvgpu_safe_cast_u32_to_s8(u32 ui_a)
{
 if (ui_a > nvgpu_safe_cast_s32_to_u32((((u8)~0U)/2))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 709; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return (s8)ui_a;
 }
}
# 727 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s32 nvgpu_safe_cast_u32_to_s32(u32 ui_a)
{
 if (ui_a > nvgpu_safe_cast_s32_to_u32(((int)(~0U >> 1)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 730; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return (s32)ui_a;
 }
}
# 748 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s32 nvgpu_safe_cast_u64_to_s32(u64 ul_a)
{
 if (ul_a > nvgpu_safe_cast_s32_to_u64(((int)(~0U >> 1)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 751; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return (s32)ul_a;
 }
}
# 769 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 nvgpu_safe_cast_u64_to_s64(u64 ul_a)
{
 if (ul_a > nvgpu_safe_cast_s64_to_u64(((long)(~0UL >> 1)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 772; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return (s64)ul_a;
 }
}
# 790 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s32 nvgpu_safe_cast_s64_to_s32(s64 sl_a)
{
 if ((sl_a > ((int)(~0U >> 1))) || (sl_a < (-((int)(~0U >> 1)) - 1))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 793; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return (s32)sl_a;
 }
}
# 873 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_safety_checks(void)
{





 if ((sizeof(unsigned int) * 8U) !=
  nvgpu_safe_cast_s32_to_u64(_Generic((~0U), unsigned int : __builtin_popcount, unsigned long : __builtin_popcountl, unsigned long long : __builtin_popcountll, default : __builtin_popcount)((~0U)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 882; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
 }






 if ((_Generic(((u8)~0U), unsigned int : __builtin_popcount, unsigned long : __builtin_popcountl, unsigned long long : __builtin_popcountll, default : __builtin_popcount)(((u8)~0U)) != 8) ||
  (_Generic(((unsigned short)~0U), unsigned int : __builtin_popcount, unsigned long : __builtin_popcountl, unsigned long long : __builtin_popcountll, default : __builtin_popcount)(((unsigned short)~0U)) != 16) ||
  (_Generic((~0U), unsigned int : __builtin_popcount, unsigned long : __builtin_popcountl, unsigned long long : __builtin_popcountll, default : __builtin_popcount)((~0U)) != 32) ||
  (_Generic((~0UL), unsigned int : __builtin_popcount, unsigned long : __builtin_popcountl, unsigned long long : __builtin_popcountll, default : __builtin_popcount)((~0UL)) != 64) ||
  (_Generic((~0ULL), unsigned int : __builtin_popcount, unsigned long : __builtin_popcountl, unsigned long long : __builtin_popcountll, default : __builtin_popcount)((~0ULL)) != 64)) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 895; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
 }
# 918 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
}
# 61 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/hw/tu104/hw_pram_tu104.h" 2
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/pramin/pramin_tu104.c" 2

u32 tu104_pramin_data032_r(u32 i)
{
 return (nvgpu_safe_add_u32(0x00700000U, nvgpu_safe_mult_u32((i), 4U)));
}
