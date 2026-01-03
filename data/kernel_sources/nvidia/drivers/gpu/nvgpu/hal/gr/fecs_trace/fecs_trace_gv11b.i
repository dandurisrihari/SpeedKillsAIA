# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/gr/fecs_trace/fecs_trace_gv11b.c"
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
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/gr/fecs_trace/fecs_trace_gv11b.c"
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/gr/fecs_trace/fecs_trace_gv11b.c"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/gr/fecs_trace/fecs_trace_gv11b.h" 1
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/gr/fecs_trace/fecs_trace_gv11b.h"
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

# 29 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/gr/fecs_trace/fecs_trace_gv11b.h" 2

u32 gv11b_fecs_trace_get_buffer_full_mailbox_val(void);
# 24 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/gr/fecs_trace/fecs_trace_gv11b.c" 2

u32 gv11b_fecs_trace_get_buffer_full_mailbox_val(void)
{
 return 0x32;
}
