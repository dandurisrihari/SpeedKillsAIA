# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/regops/allowlist_gv11b.c"
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
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/regops/allowlist_gv11b.c"
# 25 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/regops/allowlist_gv11b.c"
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

# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/regops/allowlist_gv11b.c" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/regops_allowlist.h" 1
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/regops_allowlist.h"
struct nvgpu_pm_resource_register_range {
 u32 start;
 u32 end;
};

enum nvgpu_pm_resource_hwpm_register_type {
 NVGPU_HWPM_REGISTER_TYPE_HWPM_PERFMON,
 NVGPU_HWPM_REGISTER_TYPE_HWPM_ROUTER,
 NVGPU_HWPM_REGISTER_TYPE_HWPM_PMA_TRIGGER,
 NVGPU_HWPM_REGISTER_TYPE_HWPM_PERFMUX,
 NVGPU_HWPM_REGISTER_TYPE_SMPC,
 NVGPU_HWPM_REGISTER_TYPE_CAU,
 NVGPU_HWPM_REGISTER_TYPE_HWPM_PMA_CHANNEL,
 NVGPU_HWPM_REGISTER_TYPE_PC_SAMPLER,
 NVGPU_HWPM_REGISTER_TYPE_TEST,
 NVGPU_HWPM_REGISTER_TYPE_COUNT,
};

struct nvgpu_pm_resource_register_range_map {
 u32 start;
 u32 end;
 enum nvgpu_pm_resource_hwpm_register_type type;
};
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/regops/allowlist_gv11b.c" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/regops/allowlist_gv11b.h" 1
# 30 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/regops/allowlist_gv11b.h"
struct nvgpu_pm_resource_register_range;

u32 gv11b_get_hwpm_perfmon_register_stride(void);
u32 gv11b_get_hwpm_router_register_stride(void);
u32 gv11b_get_hwpm_pma_channel_register_stride(void);
u32 gv11b_get_hwpm_pma_trigger_register_stride(void);
u32 gv11b_get_smpc_register_stride(void);

const u32 *gv11b_get_hwpm_perfmon_register_offset_allowlist(u32 *count);
const u32 *gv11b_get_hwpm_router_register_offset_allowlist(u32 *count);
const u32 *gv11b_get_hwpm_pma_channel_register_offset_allowlist(u32 *count);
const u32 *gv11b_get_hwpm_pma_trigger_register_offset_allowlist(u32 *count);
const u32 *gv11b_get_smpc_register_offset_allowlist(u32 *count);

const struct nvgpu_pm_resource_register_range
 *gv11b_get_hwpm_perfmon_register_ranges(u32 *count);
const struct nvgpu_pm_resource_register_range
 *gv11b_get_hwpm_router_register_ranges(u32 *count);
const struct nvgpu_pm_resource_register_range
 *gv11b_get_hwpm_pma_channel_register_ranges(u32 *count);
const struct nvgpu_pm_resource_register_range
 *gv11b_get_hwpm_pma_trigger_register_ranges(u32 *count);
const struct nvgpu_pm_resource_register_range
 *gv11b_get_smpc_register_ranges(u32 *count);
const struct nvgpu_pm_resource_register_range
 *gv11b_get_hwpm_perfmux_register_ranges(u32 *count);
const struct nvgpu_pm_resource_register_range
 *gv11b_get_hwpm_pc_sampler_register_ranges(u32 *count);
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/regops/allowlist_gv11b.c" 2

static const u32 gv11b_hwpm_perfmon_register_offset_allowlist[] = {
 0x00000040,
 0x00000044,
 0x00000048,
 0x0000004c,
 0x00000050,
 0x00000054,
 0x00000058,
 0x0000005c,
 0x00000060,
 0x00000064,
 0x00000068,
 0x0000006c,
 0x00000070,
 0x00000074,
 0x00000078,
 0x0000007c,
 0x00000080,
 0x00000084,
 0x00000088,
 0x0000008c,
 0x00000090,
 0x00000094,
 0x00000098,
 0x0000009c,
 0x000000a0,
 0x000000a4,
 0x000000a8,
 0x000000ac,
 0x000000b0,
 0x000000b4,
 0x000000b8,
 0x000000bc,
 0x000000c0,
 0x000000c4,
 0x000000c8,
 0x000000cc,
 0x000000d0,
 0x000000d4,
 0x000000d8,
 0x000000dc,
 0x000000e0,
 0x000000ec,
 0x000000f8,
 0x000000fc,
 0x00000100,
 0x00000104,
 0x00000108,
 0x0000010c,
 0x00000110,
 0x00000120,
 0x00000124,
};

static const u32 gv11b_hwpm_router_register_offset_allowlist[] = {
 0x00000000,
 0x00000008,
 0x00000010,
 0x00000014,
};

static const u32 gv11b_hwpm_pma_channel_register_offset_allowlist[] = {
 0x00000080,
 0x00000084,
};

static const u32 gv11b_hwpm_pma_trigger_register_offset_allowlist[] = {
 0x00000000,
 0x00000008,
 0x00000010,
 0x00000014,
 0x00000018,
 0x0000001c,
 0x00000020,
 0x00000024,
 0x00000028,
 0x0000002c,
 0x00000030,
 0x00000034,
 0x00000038,
 0x00000040,
 0x00000044,
 0x00000048,
 0x00000050,
 0x00000054,
 0x00000058,
 0x00000060,
 0x00000064,
 0x00000068,
 0x0000006c,
 0x00000094,
 0x00000098,
 0x0000009c,
 0x000000a4,
 0x00000100,
 0x00000104,
 0x00000108,
 0x0000010c,
 0x00000110,
 0x00000114,
 0x00000600,
 0x00000604,
 0x00000608,
};

static const u32 gv11b_smpc_register_offset_allowlist[] = {
 0x00000200,
 0x00000204,
 0x00000208,
 0x0000020c,
 0x00000210,
 0x00000214,
 0x00000218,
 0x0000021c,
 0x00000220,
 0x00000224,
 0x00000228,
 0x0000022c,
 0x00000230,
 0x00000234,
 0x00000238,
 0x0000023c,
 0x00000240,
 0x00000244,
 0x00000248,
 0x00000300,
 0x00000304,
 0x00000308,
 0x0000030c,
 0x00000310,
 0x00000314,
 0x00000318,
 0x0000031c,
 0x00000320,
 0x00000324,
 0x00000328,
 0x0000032c,
 0x00000330,
 0x00000334,
 0x00000338,
 0x0000033c,
 0x00000340,
 0x00000344,
 0x00000348,
 0x0000034c,
 0x00000350,
 0x00000354,
 0x00000358,
 0x0000035c,
 0x00000360,
 0x00000364,
 0x00000368,
 0x0000036c,
 0x00000370,
 0x00000374,
 0x00000378,
 0x0000037c,
 0x00000380,
 0x00000384,
 0x00000388,
 0x0000038c,
 0x00000390,
 0x00000394,
 0x00000398,
 0x0000039c,
 0x000003a0,
 0x000003a4,
 0x000003a8,
 0x000003ac,
 0x000003b0,
 0x000003b4,
 0x000003b8,
 0x000003bc,
 0x000003c0,
 0x000003c4,
 0x00000600,
 0x00000604,
 0x00000608,
 0x0000060c,
 0x00000610,
 0x00000614,
 0x00000618,
 0x0000061c,
 0x00000620,
 0x00000624,
 0x00000628,
 0x0000062c,
 0x00000630,
 0x00000634,
 0x00000638,
 0x0000063c,
 0x00000640,
 0x00000644,
 0x00000648,
 0x0000064c,
 0x00000650,
 0x00000654,
 0x00000658,
 0x0000065c,
 0x00000660,
 0x00000664,
 0x00000668,
 0x0000066c,
 0x00000670,
 0x00000674,
 0x00000678,
 0x0000067c,
 0x00000680,
 0x00000684,
 0x00000688,
 0x0000068c,
 0x00000690,
 0x00000694,
 0x00000698,
 0x0000069c,
 0x000006a0,
 0x000006a4,
 0x000006a8,
 0x000006ac,
 0x000006b0,
 0x000006b4,
 0x000006b8,
 0x000006bc,
 0x000006c0,
 0x000006c4,
 0x00000700,
 0x00000704,
 0x00000708,
 0x0000070c,
 0x00000710,
 0x00000714,
 0x00000718,
 0x0000071c,
 0x00000720,
 0x00000724,
 0x00000728,
 0x0000072c,
 0x00000730,
 0x00000734,
 0x00000738,
 0x0000073c,
 0x00000740,
 0x00000744,
 0x00000748,
 0x0000074c,
 0x00000750,
 0x00000754,
 0x00000758,
 0x0000075c,
 0x00000760,
 0x00000764,
 0x00000768,
 0x0000076c,
 0x00000770,
 0x00000774,
 0x00000778,
 0x0000077c,
 0x00000780,
 0x00000784,
 0x00000788,
 0x0000078c,
 0x00000790,
 0x00000794,
 0x00000798,
 0x0000079c,
 0x000007a0,
 0x000007a4,
 0x000007a8,
 0x000007ac,
 0x000007b0,
 0x000007b4,
 0x000007b8,
 0x000007bc,
 0x000007c0,
 0x000007c4,
};

static const struct nvgpu_pm_resource_register_range gv11b_hwpm_perfmon_register_ranges[] = {
 {0x00180000, 0x00183ffc},
 {0x00250040, 0x00250124},
 {0x00250240, 0x00250324},
 {0x00278040, 0x0027bf24},
 {0x00200000, 0x00203ffc},
 {0x00250840, 0x00250924},
 {0x00250a40, 0x00250b24},
 {0x0027c040, 0x0027ff24},
 {0x00240000, 0x00243ffc},
};

static const struct nvgpu_pm_resource_register_range gv11b_hwpm_router_register_ranges[] = {
 {0x00244000, 0x002441fc},
 {0x00246000, 0x002461fc},
 {0x00248000, 0x002481fc},
 {0x00251800, 0x00251814},
 {0x00251a00, 0x00251a14},
};

static const struct nvgpu_pm_resource_register_range gv11b_hwpm_pma_channel_register_ranges[] = {
 {0x0024a070, 0x0024a08c},
};

static const struct nvgpu_pm_resource_register_range gv11b_hwpm_pma_trigger_register_ranges[] = {
 {0x0024a000, 0x0024a06c},
 {0x0024a090, 0x0024bffb},
};

static const struct nvgpu_pm_resource_register_range gv11b_smpc_register_ranges[] = {
 {0x00580000, 0x00587ffc},
 {0x00480000, 0x00487ffc},
};

static const struct nvgpu_pm_resource_register_range gv11b_hwpm_perfmux_register_ranges[] = {
 {0x000004f0, 0x000004f0},
 {0x00001a00, 0x00001a00},
 {0x000884e0, 0x000884e0},
 {0x00100c18, 0x00100c20},
 {0x00100c84, 0x00100c84},
 {0x0010a0a8, 0x0010a0a8},
 {0x0010a4f0, 0x0010a4f0},
 {0x0013c808, 0x0013c80c},
 {0x0013cc14, 0x0013cc14},
 {0x0013ec18, 0x0013ec18},
 {0x00140028, 0x00140028},
 {0x00140350, 0x00140350},
 {0x00140550, 0x00140550},
 {0x00140750, 0x00140750},
 {0x00142028, 0x00142028},
 {0x00142350, 0x00142350},
 {0x00142550, 0x00142550},
 {0x00142750, 0x00142750},
 {0x0017e028, 0x0017e028},
 {0x0017e350, 0x0017e350},
 {0x0017e550, 0x0017e550},
 {0x0017e750, 0x0017e750},
 {0x001fb000, 0x001fb000},
 {0x001fb400, 0x001fb400},
 {0x0040415c, 0x0040415c},
 {0x00405840, 0x00405844},
 {0x00405850, 0x00405850},
 {0x00405908, 0x00405908},
 {0x00405a00, 0x00405a00},
 {0x00405b50, 0x00405b50},
 {0x00406024, 0x00406024},
 {0x00407010, 0x00407010},
 {0x00407808, 0x00407808},
 {0x0040803c, 0x0040803c},
 {0x0040880c, 0x0040880c},
 {0x00408910, 0x00408910},
 {0x00408984, 0x00408984},
 {0x004090a8, 0x004090a8},
 {0x004098a0, 0x004098a0},
 {0x0041000c, 0x0041000c},
 {0x00410110, 0x00410110},
 {0x00410184, 0x00410184},
 {0x0041040c, 0x0041040c},
 {0x00410510, 0x00410510},
 {0x00410584, 0x00410584},
 {0x00418384, 0x00418384},
 {0x004184a0, 0x004184a0},
 {0x00418604, 0x00418604},
 {0x00418680, 0x00418680},
 {0x00418714, 0x00418714},
 {0x0041881c, 0x0041881c},
 {0x00418884, 0x00418884},
 {0x004188b0, 0x004188b0},
 {0x004188c8, 0x004188cc},
 {0x00418b04, 0x00418b04},
 {0x00418c04, 0x00418c04},
 {0x00418c10, 0x00418c2c},
 {0x00418c88, 0x00418c88},
 {0x00418d00, 0x00418d00},
 {0x00418e08, 0x00418e08},
 {0x00418f08, 0x00418f08},
 {0x0041900c, 0x0041900c},
 {0x00419018, 0x00419018},
 {0x00419854, 0x00419854},
 {0x00419ab0, 0x00419ab0},
 {0x00419b04, 0x00419b04},
 {0x00419bdc, 0x00419bdc},
 {0x00419c0c, 0x00419c0c},
 {0x0041a02c, 0x0041a030},
 {0x0041a0a8, 0x0041a0a8},
 {0x0041a8a0, 0x0041a8a8},
 {0x0041b014, 0x0041b014},
 {0x0041b0cc, 0x0041b0cc},
 {0x0041b1dc, 0x0041b1dc},
 {0x0041b214, 0x0041b214},
 {0x0041b2cc, 0x0041b2cc},
 {0x0041b3dc, 0x0041b3dc},
 {0x0041be14, 0x0041be14},
 {0x0041becc, 0x0041becc},
 {0x0041bfdc, 0x0041bfdc},
 {0x0041c054, 0x0041c054},
 {0x0041c2b0, 0x0041c2b0},
 {0x0041c304, 0x0041c304},
 {0x0041c3dc, 0x0041c3dc},
 {0x0041c40c, 0x0041c40c},
 {0x0041c854, 0x0041c854},
 {0x0041cab0, 0x0041cab0},
 {0x0041cb04, 0x0041cb04},
 {0x0041cbdc, 0x0041cbdc},
 {0x0041cc0c, 0x0041cc0c},
 {0x0041d054, 0x0041d054},
 {0x0041d2b0, 0x0041d2b0},
 {0x0041d304, 0x0041d304},
 {0x0041d3dc, 0x0041d3dc},
 {0x0041d40c, 0x0041d40c},
 {0x0041d854, 0x0041d854},
 {0x0041dab0, 0x0041dab0},
 {0x0041db04, 0x0041db04},
 {0x0041dbdc, 0x0041dbdc},
 {0x0041dc0c, 0x0041dc0c},
 {0x00500384, 0x00500384},
 {0x005004a0, 0x005004a0},
 {0x00500604, 0x00500604},
 {0x00500680, 0x00500680},
 {0x00500714, 0x00500714},
 {0x0050081c, 0x0050081c},
 {0x00500884, 0x00500884},
 {0x005008b0, 0x005008b0},
 {0x005008c8, 0x005008cc},
 {0x00500b04, 0x00500b04},
 {0x00500c04, 0x00500c04},
 {0x00500c10, 0x00500c2c},
 {0x00500c88, 0x00500c88},
 {0x00500d00, 0x00500d00},
 {0x00500e08, 0x00500e08},
 {0x00500f08, 0x00500f08},
 {0x0050100c, 0x0050100c},
 {0x00501018, 0x00501018},
 {0x00501854, 0x00501854},
 {0x00501ab0, 0x00501ab0},
 {0x00501b04, 0x00501b04},
 {0x00501bdc, 0x00501bdc},
 {0x00501c0c, 0x00501c0c},
 {0x0050202c, 0x00502030},
 {0x005020a8, 0x005020a8},
 {0x005028a0, 0x005028a8},
 {0x00503014, 0x00503014},
 {0x005030cc, 0x005030cc},
 {0x005031dc, 0x005031dc},
 {0x00503214, 0x00503214},
 {0x005032cc, 0x005032cc},
 {0x005033dc, 0x005033dc},
 {0x00503e14, 0x00503e14},
 {0x00503ecc, 0x00503ecc},
 {0x00503fdc, 0x00503fdc},
 {0x00504054, 0x00504054},
 {0x005042b0, 0x005042b0},
 {0x00504304, 0x00504304},
 {0x005043dc, 0x005043dc},
 {0x0050440c, 0x0050440c},
 {0x00504854, 0x00504854},
 {0x00504ab0, 0x00504ab0},
 {0x00504b04, 0x00504b04},
 {0x00504bdc, 0x00504bdc},
 {0x00504c0c, 0x00504c0c},
 {0x00505054, 0x00505054},
 {0x005052b0, 0x005052b0},
 {0x00505304, 0x00505304},
 {0x005053dc, 0x005053dc},
 {0x0050540c, 0x0050540c},
 {0x00505854, 0x00505854},
 {0x00505ab0, 0x00505ab0},
 {0x00505b04, 0x00505b04},
 {0x00505bdc, 0x00505bdc},
 {0x00505c0c, 0x00505c0c},
 {0x00900100, 0x00900100},
};

static const struct nvgpu_pm_resource_register_range gv11b_hwpm_pc_sampler_register_ranges[] = {
 {0x005043dc, 0x005043dc},
 {0x00504bdc, 0x00504bdc},
 {0x005053dc, 0x005053dc},
 {0x00505bdc, 0x00505bdc},
 {0x00419bdc, 0x00419bdc},
};

u32 gv11b_get_hwpm_perfmon_register_stride(void)
{
 return 0x00000200;
}

u32 gv11b_get_hwpm_router_register_stride(void)
{
 return 0x00000200;
}

u32 gv11b_get_hwpm_pma_channel_register_stride(void)
{
 return 0x00002000;
}

u32 gv11b_get_hwpm_pma_trigger_register_stride(void)
{
 return 0x00002000;
}

u32 gv11b_get_smpc_register_stride(void)
{
 return 0x00000800;
}

const u32 *gv11b_get_hwpm_perfmon_register_offset_allowlist(u32 *count)
{
 *count = (u32)(sizeof(gv11b_hwpm_perfmon_register_offset_allowlist) /
  sizeof(gv11b_hwpm_perfmon_register_offset_allowlist[0]));
 return gv11b_hwpm_perfmon_register_offset_allowlist;
}

const u32 *gv11b_get_hwpm_router_register_offset_allowlist(u32 *count)
{
 *count = (u32)(sizeof(gv11b_hwpm_router_register_offset_allowlist) /
  sizeof(gv11b_hwpm_router_register_offset_allowlist[0]));
 return gv11b_hwpm_router_register_offset_allowlist;
}

const u32 *gv11b_get_hwpm_pma_channel_register_offset_allowlist(u32 *count)
{
 *count = (u32)(sizeof(gv11b_hwpm_pma_channel_register_offset_allowlist) /
  sizeof(gv11b_hwpm_pma_channel_register_offset_allowlist[0]));
 return gv11b_hwpm_pma_channel_register_offset_allowlist;
}

const u32 *gv11b_get_hwpm_pma_trigger_register_offset_allowlist(u32 *count)
{
 *count = (u32)(sizeof(gv11b_hwpm_pma_trigger_register_offset_allowlist) /
  sizeof(gv11b_hwpm_pma_trigger_register_offset_allowlist[0]));
 return gv11b_hwpm_pma_trigger_register_offset_allowlist;
}

const u32 *gv11b_get_smpc_register_offset_allowlist(u32 *count)
{
 *count = (u32)(sizeof(gv11b_smpc_register_offset_allowlist) /
  sizeof(gv11b_smpc_register_offset_allowlist[0]));
 return gv11b_smpc_register_offset_allowlist;
}

const struct nvgpu_pm_resource_register_range
  *gv11b_get_hwpm_perfmon_register_ranges(u32 *count)
{
 *count = (u32)(sizeof(gv11b_hwpm_perfmon_register_ranges) /
  sizeof(gv11b_hwpm_perfmon_register_ranges[0]));
 return gv11b_hwpm_perfmon_register_ranges;
}

const struct nvgpu_pm_resource_register_range
  *gv11b_get_hwpm_router_register_ranges(u32 *count)
{
 *count = (u32)(sizeof(gv11b_hwpm_router_register_ranges) /
  sizeof(gv11b_hwpm_router_register_ranges[0]));
 return gv11b_hwpm_router_register_ranges;
}

const struct nvgpu_pm_resource_register_range
  *gv11b_get_hwpm_pma_channel_register_ranges(u32 *count)
{
 *count = (u32)(sizeof(gv11b_hwpm_pma_channel_register_ranges) /
  sizeof(gv11b_hwpm_pma_channel_register_ranges[0]));
 return gv11b_hwpm_pma_channel_register_ranges;
}

const struct nvgpu_pm_resource_register_range
  *gv11b_get_hwpm_pma_trigger_register_ranges(u32 *count)
{
 *count = (u32)(sizeof(gv11b_hwpm_pma_trigger_register_ranges) /
  sizeof(gv11b_hwpm_pma_trigger_register_ranges[0]));
 return gv11b_hwpm_pma_trigger_register_ranges;
}

const struct nvgpu_pm_resource_register_range
  *gv11b_get_smpc_register_ranges(u32 *count)
{
 *count = (u32)(sizeof(gv11b_smpc_register_ranges) /
  sizeof(gv11b_smpc_register_ranges[0]));
 return gv11b_smpc_register_ranges;
}

const struct nvgpu_pm_resource_register_range
  *gv11b_get_hwpm_perfmux_register_ranges(u32 *count)
{
 *count = (u32)(sizeof(gv11b_hwpm_perfmux_register_ranges) /
  sizeof(gv11b_hwpm_perfmux_register_ranges[0]));
 return gv11b_hwpm_perfmux_register_ranges;
}

const struct nvgpu_pm_resource_register_range
  *gv11b_get_hwpm_pc_sampler_register_ranges(u32 *count)
{
 *count = (u32)(sizeof(gv11b_hwpm_pc_sampler_register_ranges) /
  sizeof(gv11b_hwpm_pc_sampler_register_ranges[0]));
 return gv11b_hwpm_pc_sampler_register_ranges;
}
