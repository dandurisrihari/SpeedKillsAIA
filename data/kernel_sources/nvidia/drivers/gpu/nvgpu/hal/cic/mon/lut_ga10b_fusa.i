# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/cic/mon/lut_ga10b_fusa.c"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel_out//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kconfig.h" 1






# 1 "./include/generated/autoconf.h" 1
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kconfig.h" 2
# 1 "<command-line>" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h" 1
# 65 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_attributes.h" 1
# 66 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h" 2
# 74 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler-gcc.h" 1
# 75 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h" 2
# 88 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/compiler.h" 1
# 89 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h" 2


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
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/cic/mon/lut_ga10b_fusa.c"
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/cic/mon/lut_ga10b_fusa.c"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/nvgpu_err.h" 1
# 34 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/nvgpu_err.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h" 1
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/types.h" 1





# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/types.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/types.h" 1






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/int-ll64.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/int-ll64.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/int-ll64.h" 1
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/int-ll64.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/bitsperlong.h" 1
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/bitsperlong.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitsperlong.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/bitsperlong.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitsperlong.h" 2
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/bitsperlong.h" 2
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/int-ll64.h" 2







typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/int-ll64.h" 2




typedef __s8 s8;
typedef __u8 u8;
typedef __s16 s16;
typedef __u16 u16;
typedef __s32 s32;
typedef __u32 u32;
typedef __s64 s64;
typedef __u64 u64;
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/types.h" 2
# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/types.h" 2
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/posix_types.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/stddef.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/stddef.h" 1

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler_types.h" 1
# 3 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/stddef.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/stddef.h" 2




enum {
 false = 0,
 true = 1
};
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/posix_types.h" 2
# 25 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/posix_types.h"
typedef struct {
 unsigned long fds_bits[1024 / (8 * sizeof(long))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/posix_types.h" 1




typedef unsigned short __kernel_old_uid_t;
typedef unsigned short __kernel_old_gid_t;


# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/posix_types.h" 1
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/posix_types.h"
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
# 59 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/posix_types.h"
typedef unsigned int __kernel_old_dev_t;
# 72 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/posix_types.h"
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
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/posix_types.h" 2
# 37 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/posix_types.h" 2
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/types.h" 2
# 29 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/types.h"
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;
typedef __u64 __le64;
typedef __u64 __be64;

typedef __u16 __sum16;
typedef __u32 __wsum;
# 52 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/types.h"
typedef unsigned __poll_t;
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/types.h" 2






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
# 55 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/types.h"
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
# 125 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/types.h"
typedef u64 sector_t;
typedef u64 blkcnt_t;
# 143 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/types.h"
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
# 216 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/types.h"
struct callback_head {
 struct callback_head *next;
 void (*func)(struct callback_head *head);
} __attribute__((aligned(sizeof(void *))));


typedef void (*rcu_callback_t)(struct callback_head *head);
typedef void (*call_rcu_func_t)(struct callback_head *head, rcu_callback_t func);

typedef void (*swap_func_t)(void *a, void *b, int size);

typedef int (*cmp_r_func_t)(const void *a, const void *b, const void *priv);
typedef int (*cmp_func_t)(const void *a, const void *b);
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/limits.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/limits.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/limits.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/vdso/limits.h" 1
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/limits.h" 2
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h" 2




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/cov_whitelist.h" 1
# 33 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h" 2
# 125 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h"

# 144 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/types.h"

# 35 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/nvgpu_err.h" 2

struct gk20a;
struct mmu_fault_info;
# 322 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/nvgpu_err.h"
struct nvgpu_hw_err_inject_info {

 const char *name;
 void (*inject_hw_fault)(struct gk20a *g,
   struct nvgpu_hw_err_inject_info *err, u32 err_info);
 u32 (*get_reg_addr)(void);
 u32 (*get_reg_val)(u32 val);
};





struct nvgpu_hw_err_inject_info_desc {
 struct nvgpu_hw_err_inject_info *info_ptr;
 u32 info_size;
};
# 1234 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/nvgpu_err.h"
void nvgpu_report_err_to_sdl(struct gk20a *g, u32 hw_unit_id, u32 err_id);
# 24 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/cic/mon/lut_ga10b_fusa.c" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/nvgpu_err_info.h" 1
# 35 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/nvgpu_err_info.h"
struct gk20a;
struct nvgpu_hw_err_inject_info;





struct gpu_err_header {

 struct {

  u16 major;

  u16 minor;
 } version;


 u32 sub_err_type;


 u64 sub_unit_id;


 u64 address;


 u64 timestamp_ns;
};

struct gpu_host_error_info {
 struct gpu_err_header header;
};

struct gpu_ecc_error_info {
 struct gpu_err_header header;


 u64 err_cnt;
};

struct gpu_gr_error_info {
 struct gpu_err_header header;


 u32 curr_ctx;


 u32 chid;


 u32 tsgid;


 u32 status;
};

struct gpu_sm_error_info {
 struct gpu_err_header header;


 u64 warp_esr_pc;


 u32 warp_esr_status;


 u32 curr_ctx;


 u32 chid;


 u32 tsgid;


 u32 tpc, gpc, sm;
};
# 121 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/nvgpu_err_info.h"
struct mmu_page_fault_info {
 u64 inst_ptr;
 u32 inst_aperture;
 u64 fault_addr;
 u32 fault_addr_aperture;
 u32 timestamp_lo;
 u32 timestamp_hi;
 u32 mmu_engine_id;
 u32 gpc_id;
 u32 client_type;
 u32 client_id;
 u32 fault_type;
 u32 access_type;
 u32 protected_mode;
 bool replayable_fault;
 u32 replay_fault_en;
 bool valid;
 u32 faulted_pbdma;
 u32 faulted_engine;
 u32 faulted_subid;
 u32 chid;
};

struct gpu_mmu_error_info {
 struct gpu_err_header header;

 struct mmu_page_fault_info info;


 u32 status;
};

struct gpu_ce_error_info {
 struct gpu_err_header header;
};

struct gpu_pri_error_info {
 struct gpu_err_header header;
};

struct gpu_pmu_error_info {
 struct gpu_err_header header;


 u32 status;
};

struct gpu_ctxsw_error_info {
 struct gpu_err_header header;


 u32 curr_ctx;


 u32 tsgid;


 u32 chid;


 u32 ctxsw_status0, ctxsw_status1;


 u32 mailbox_value;
};





union gpu_error_info {
 struct gpu_host_error_info host_info;
 struct gpu_ecc_error_info ecc_info;
 struct gpu_gr_error_info gr_info;
 struct gpu_sm_error_info sm_info;
 struct gpu_ce_error_info ce_info;
 struct gpu_pri_error_info pri_info;
 struct gpu_pmu_error_info pmu_err_info;
 struct gpu_ctxsw_error_info ctxsw_info;
 struct gpu_mmu_error_info mmu_info;
};





struct nvgpu_err_msg {






 u32 hw_unit_id;


 bool is_critical;


 u8 err_id;


 u8 err_size;


 union gpu_error_info err_info;


 struct nvgpu_err_desc *err_desc;
};
# 275 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/nvgpu_err_info.h"
struct nvgpu_hw_err_inject_info;





struct nvgpu_err_desc {

 const char *name;


 bool is_critical;






 int err_threshold;




 int err_count;


 void (*inject_hw_fault)(struct gk20a *g,
   struct nvgpu_hw_err_inject_info *err, u32 err_info);


 void (*inject_sw_fault)(struct gk20a *g,
   u32 hw_unit, u32 err_index, u32 inst);


 u8 error_id;





 struct err_inject_info {

  u32 type;

  u32 (*get_reg_addr)(void);

  u32 (*get_reg_val)(u32 val);
 } err_inject_info;
};





struct nvgpu_err_hw_module {

 const char *name;


 u32 hw_unit;


 u32 num_instances;


 u32 num_errs;


 struct nvgpu_err_desc *errs;
};
# 25 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/cic/mon/lut_ga10b_fusa.c" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h" 1
# 39 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/bug.h" 1
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/bug.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bug.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bug.h" 1
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bug.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/stringify.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bug.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/asm-bug.h" 1







# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/brk-imm.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/asm-bug.h" 2
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bug.h" 2
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bug.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler.h" 1
# 232 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void *offset_to_ptr(const int *off)
{
 return (void *)((unsigned long)off + *off);
}
# 248 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler.h"
# 1 "./arch/arm64/include/generated/asm/rwonce.h" 1
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/rwonce.h" 1
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/rwonce.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kasan-checks.h" 1
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kasan-checks.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __kasan_check_read(const volatile void *p, unsigned int size)
{
 return true;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __kasan_check_write(const volatile void *p, unsigned int size)
{
 return true;
}
# 34 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kasan-checks.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool kasan_check_read(const volatile void *p, unsigned int size)
{
 return true;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool kasan_check_write(const volatile void *p, unsigned int size)
{
 return true;
}
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/rwonce.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kcsan-checks.h" 1
# 142 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kcsan-checks.h"
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
# 178 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kcsan-checks.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kcsan_check_access(const volatile void *ptr, size_t size,
          int type) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __kcsan_enable_current(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __kcsan_disable_current(void) { }
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/rwonce.h" 2
# 64 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/rwonce.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__))
unsigned long __read_once_word_nocheck(const void *addr)
{
 return (*(const volatile typeof( _Generic((*(unsigned long *)addr), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*(unsigned long *)addr))) *)&(*(unsigned long *)addr));
}
# 82 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/rwonce.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__))
unsigned long read_word_at_a_time(const void *addr)
{
 kasan_check_read(addr, 1);
 return *(unsigned long *)addr;
}
# 1 "./arch/arm64/include/generated/asm/rwonce.h" 2
# 249 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/compiler.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumentation.h" 1
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h" 2
# 20 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 1





# 1 "/usr/lib/gcc/aarch64-linux-gnu/9/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/aarch64-linux-gnu/9/include/stdarg.h" 3 4

# 40 "/usr/lib/gcc/aarch64-linux-gnu/9/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 99 "/usr/lib/gcc/aarch64-linux-gnu/9/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/linkage.h" 1






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/export.h" 1
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/export.h"

# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/export.h"
extern struct module __this_module;
# 60 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/export.h"
struct kernel_symbol {
 int value_offset;
 int name_offset;
 int namespace_offset;
};
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/linkage.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/linkage.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/linkage.h" 2
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2



# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h" 1



# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 5 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bits.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/const.h" 1



# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/vdso/const.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/const.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/vdso/const.h" 2
# 5 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/const.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bits.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/vdso/bits.h" 1
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bits.h" 2
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bits.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/build_bug.h" 1
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bits.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h" 2
# 20 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h"
extern unsigned int __sw_hweight8(unsigned int w);
extern unsigned int __sw_hweight16(unsigned int w);
extern unsigned int __sw_hweight32(unsigned int w);
extern unsigned long __sw_hweight64(__u64 w);





# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 1
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-__ffs.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-__ffs.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __ffs(unsigned long word)
{
 return __builtin_ctzl(word);
}
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-ffs.h" 1
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-ffs.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int ffs(int x)
{
 return __builtin_ffs(x);
}
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-__fls.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-__fls.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __fls(unsigned long word)
{
 return (sizeof(word) * 8) - 1 - __builtin_clzl(word);
}
# 17 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-fls.h" 1
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/builtin-fls.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int fls(unsigned int x)
{
 return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
}
# 18 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/ffz.h" 1
# 20 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/fls64.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/fls64.h" 2
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/fls64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int fls64(__u64 x)
{
 if (x == 0)
  return 0;
 return __fls(x) + 1;
}
# 21 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/find.h" 1
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/find.h"
extern unsigned long find_next_bit(const unsigned long *addr, unsigned long
  size, unsigned long offset);
# 30 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/find.h"
extern unsigned long find_next_and_bit(const unsigned long *addr1,
  const unsigned long *addr2, unsigned long size,
  unsigned long offset);
# 45 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/find.h"
extern unsigned long find_next_zero_bit(const unsigned long *addr, unsigned
  long size, unsigned long offset);
# 93 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/find.h"
extern unsigned long find_next_clump8(unsigned long *clump,
          const unsigned long *addr,
          unsigned long size, unsigned long offset);
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/sched.h" 1





# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/sched.h" 2






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int sched_find_first_bit(const unsigned long *b)
{

 if (b[0])
  return __ffs(b[0]);
 return __ffs(b[1]) + 64;
# 30 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/sched.h"
}
# 24 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/hweight.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/arch_hweight.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/arch_hweight.h" 2

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
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/hweight.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/const_hweight.h" 1
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/hweight.h" 2
# 25 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/atomic.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic.h" 1






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h" 1
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/barrier.h" 1
# 57 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/barrier.h"
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
# 188 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/barrier.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/barrier.h" 1
# 17 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/barrier.h"
# 1 "./arch/arm64/include/generated/asm/rwonce.h" 1
# 18 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/barrier.h" 2
# 189 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/barrier.h" 2
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h" 1
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/lse.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h" 1
# 111 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic_add(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_add_return(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_add_return_relaxed(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_add_return_acquire(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_add_return_release(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_add(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_add_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_add_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_add_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic_sub(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_sub_return(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_sub_return_relaxed(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_sub_return_acquire(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_sub_return_release(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_sub(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_sub_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_sub_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_sub_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; }
# 122 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic_and(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "and" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "and" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_and(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_and_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_and_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_and_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic_or(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "or" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "orr" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_or(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_or_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_or_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_or_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic_xor(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "xor" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "eor" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_xor(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_xor_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_xor_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_xor_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; }





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic_andnot(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "andnot" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "bic" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_andnot(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_andnot_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_andnot_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __ll_sc_atomic_fetch_andnot_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; }
# 210 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic64_add(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_add_return(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_add_return_relaxed(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_add_return_acquire(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_add_return_release(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_add(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_add_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_add_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_add_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic64_sub(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_sub_return(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_sub_return_relaxed(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_sub_return_acquire(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_sub_return_release(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_sub(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_sub_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_sub_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_sub_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; }
# 221 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic64_and(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "and" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "and" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_and(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_and_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_and_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_and_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic64_or(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "or" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "orr" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_or(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_or_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_or_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_or_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic64_xor(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "xor" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "eor" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_xor(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_xor_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_xor_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_xor_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; }





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __ll_sc_atomic64_andnot(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "andnot" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "bic" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_andnot(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_andnot_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "_relaxed" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_andnot_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "_acquire" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc_atomic64_fetch_andnot_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "_release" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; }






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64
__ll_sc_atomic64_dec_if_positive(atomic64_t *v)
{
 s64 result;
 unsigned long tmp;

 asm volatile("// atomic64_dec_if_positive\n"
 "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	subs	%0, %0, #1\n" "	b.lt	2f\n" "	stlxr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	dmb	ish\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n"
# 252 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h"
 : "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
 :
 : "cc", "memory");

 return result;
}
# 299 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __ll_sc__cmpxchg_case_8(volatile void *ptr, unsigned long old, u8 new) { unsigned long tmp; u8 oldval; if (8 < 32) old = (u8)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u8 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : ); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __ll_sc__cmpxchg_case_16(volatile void *ptr, unsigned long old, u16 new) { unsigned long tmp; u16 oldval; if (16 < 32) old = (u16)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u16 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : ); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __ll_sc__cmpxchg_case_32(volatile void *ptr, unsigned long old, u32 new) { unsigned long tmp; u32 oldval; if (32 < 32) old = (u32)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u32 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : ); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __ll_sc__cmpxchg_case_64(volatile void *ptr, unsigned long old, u64 new) { unsigned long tmp; u64 oldval; if (64 < 32) old = (u64)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u64 *)ptr) : [old] "L" "r" (old), [new] "r" (new) : ); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __ll_sc__cmpxchg_case_acq_8(volatile void *ptr, unsigned long old, u8 new) { unsigned long tmp; u8 oldval; if (8 < 32) old = (u8)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u8 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __ll_sc__cmpxchg_case_acq_16(volatile void *ptr, unsigned long old, u16 new) { unsigned long tmp; u16 oldval; if (16 < 32) old = (u16)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u16 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __ll_sc__cmpxchg_case_acq_32(volatile void *ptr, unsigned long old, u32 new) { unsigned long tmp; u32 oldval; if (32 < 32) old = (u32)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u32 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __ll_sc__cmpxchg_case_acq_64(volatile void *ptr, unsigned long old, u64 new) { unsigned long tmp; u64 oldval; if (64 < 32) old = (u64)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u64 *)ptr) : [old] "L" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __ll_sc__cmpxchg_case_rel_8(volatile void *ptr, unsigned long old, u8 new) { unsigned long tmp; u8 oldval; if (8 < 32) old = (u8)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u8 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __ll_sc__cmpxchg_case_rel_16(volatile void *ptr, unsigned long old, u16 new) { unsigned long tmp; u16 oldval; if (16 < 32) old = (u16)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u16 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __ll_sc__cmpxchg_case_rel_32(volatile void *ptr, unsigned long old, u32 new) { unsigned long tmp; u32 oldval; if (32 < 32) old = (u32)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u32 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __ll_sc__cmpxchg_case_rel_64(volatile void *ptr, unsigned long old, u64 new) { unsigned long tmp; u64 oldval; if (64 < 32) old = (u64)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u64 *)ptr) : [old] "L" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __ll_sc__cmpxchg_case_mb_8(volatile void *ptr, unsigned long old, u8 new) { unsigned long tmp; u8 oldval; if (8 < 32) old = (u8)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u8 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __ll_sc__cmpxchg_case_mb_16(volatile void *ptr, unsigned long old, u16 new) { unsigned long tmp; u16 oldval; if (16 < 32) old = (u16)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u16 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __ll_sc__cmpxchg_case_mb_32(volatile void *ptr, unsigned long old, u32 new) { unsigned long tmp; u32 oldval; if (32 < 32) old = (u32)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u32 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __ll_sc__cmpxchg_case_mb_64(volatile void *ptr, unsigned long old, u64 new) { unsigned long tmp; u64 oldval; if (64 < 32) old = (u64)old; asm volatile( "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u64 *)ptr) : [old] "L" "r" (old), [new] "r" (new) : "memory"); return oldval; }
# 347 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc__cmpxchg_double(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { unsigned long tmp, ret; asm volatile("// __cmpxchg_double" "" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxp	%0, %1, %2\n" "	eor	%0, %0, %3\n" "	eor	%1, %1, %4\n" "	orr	%1, %0, %1\n" "	cbnz	%1, 2f\n" "	st" "" "xp	%w0, %5, %6, %2\n" "	cbnz	%w0, 1b\n" "	" "" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (tmp), "=&r" (ret), "+Q" (*(unsigned long *)ptr) : "r" (old1), "r" (old2), "r" (new1), "r" (new2) : ); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __ll_sc__cmpxchg_double_mb(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { unsigned long tmp, ret; asm volatile("// __cmpxchg_double" "_mb" "\n" "	b	3f\n" "	.subsection	1\n" "3:\n" "	prfm	pstl1strm, %2\n" "1:	ldxp	%0, %1, %2\n" "	eor	%0, %0, %3\n" "	eor	%1, %1, %4\n" "	orr	%1, %0, %1\n" "	cbnz	%1, 2f\n" "	st" "l" "xp	%w0, %5, %6, %2\n" "	cbnz	%w0, 1b\n" "	" "dmb ish" "\n" "2:" "\n" "	b	4f\n" "	.previous\n" "4:\n" : "=&r" (tmp), "=&r" (ret), "+Q" (*(unsigned long *)ptr) : "r" (old1), "r" (old2), "r" (new1), "r" (new2) : "memory"); return ret; }
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/lse.h" 2







# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h" 1
# 79 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
extern bool static_key_initialized;







struct static_key {
 atomic_t enabled;
# 102 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
 union {
  unsigned long type;
  struct jump_entry *entries;
  struct static_key_mod *next;
 };
};
# 117 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/jump_label.h" 1
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/jump_label.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/insn.h" 1
# 32 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/insn.h"
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
# 295 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/insn.h"
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
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/jump_label.h" 2



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
# 118 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h" 2




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
# 164 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
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
# 198 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
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
# 346 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
struct static_key_true {
 struct static_key key;
};

struct static_key_false {
 struct static_key key;
};
# 385 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/jump_label.h"
extern bool ____wrong_branch_error(void);
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/lse.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/alternative.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpucaps.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/alternative.h" 2






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/init.h" 1
# 116 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/init.h"
typedef int (*initcall_t)(void);
typedef void (*exitcall_t)(void);


typedef int initcall_entry_t;

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) initcall_t initcall_from_entry(initcall_entry_t *entry)
{
 return offset_to_ptr(entry);
}
# 135 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/init.h"
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
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/alternative.h" 2




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
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/lse.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h" 1
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic_andnot(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "stclr" "	%w[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic_or(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "stset" "	%w[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic_xor(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "steor" "	%w[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic_add(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "stadd" "	%w[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
# 49 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_andnot_relaxed(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldclr" "" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_andnot_acquire(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldclr" "a" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_andnot_release(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldclr" "l" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_andnot(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldclr" "al" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_or_relaxed(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldset" "" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_or_acquire(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldset" "a" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_or_release(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldset" "l" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_or(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldset" "al" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_xor_relaxed(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldeor" "" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_xor_acquire(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldeor" "a" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_xor_release(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldeor" "l" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_xor(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldeor" "al" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_add_relaxed(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldadd" "" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_add_acquire(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldadd" "a" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_add_release(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldadd" "l" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_add(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "ldadd" "al" "	%w[i], %w[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
# 73 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
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
# 104 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
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
# 138 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_sub_return_relaxed(int i, atomic_t *v) { u32 tmp; asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "" "	%w[i], %w[tmp], %[v]\n" "	add	%w[i], %w[i], %w[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : ); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_sub_return_acquire(int i, atomic_t *v) { u32 tmp; asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "a" "	%w[i], %w[tmp], %[v]\n" "	add	%w[i], %w[i], %w[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_sub_return_release(int i, atomic_t *v) { u32 tmp; asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "l" "	%w[i], %w[tmp], %[v]\n" "	add	%w[i], %w[i], %w[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_sub_return(int i, atomic_t *v) { u32 tmp; asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "al" "	%w[i], %w[tmp], %[v]\n" "	add	%w[i], %w[i], %w[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
# 159 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_sub_relaxed(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "" "	%w[i], %w[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_sub_acquire(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "a" "	%w[i], %w[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_sub_release(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "l" "	%w[i], %w[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __lse_atomic_fetch_sub(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	neg	%w[i], %w[i]\n" "	ldadd" "al" "	%w[i], %w[i], %[v]" : [i] "+&r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
# 176 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic64_andnot(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	" "stclr" "	%[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic64_or(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	" "stset" "	%[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic64_xor(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	" "steor" "	%[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __lse_atomic64_add(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	" "stadd" "	%[i], %[v]\n" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v)); }
# 202 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_andnot_relaxed(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldclr" "" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_andnot_acquire(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldclr" "a" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_andnot_release(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldclr" "l" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_andnot(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldclr" "al" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_or_relaxed(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldset" "" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_or_acquire(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldset" "a" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_or_release(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldset" "l" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_or(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldset" "al" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_xor_relaxed(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldeor" "" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_xor_acquire(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldeor" "a" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_xor_release(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldeor" "l" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_xor(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldeor" "al" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_add_relaxed(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldadd" "" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : ); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_add_acquire(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldadd" "a" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_add_release(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldadd" "l" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_fetch_add(s64 i, atomic64_t *v){ asm volatile( ".arch_extension lse\n" "	" "ldadd" "al" "	%[i], %[i], %[v]" : [i] "+r" (i), [v] "+Q" (v->counter) : "r" (v) : "memory"); return i; }
# 226 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
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
# 257 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
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
# 291 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_sub_return_relaxed(s64 i, atomic64_t *v) { unsigned long tmp; asm volatile( ".arch_extension lse\n" "	neg	%[i], %[i]\n" "	ldadd" "" "	%[i], %x[tmp], %[v]\n" "	add	%[i], %[i], %x[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : ); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_sub_return_acquire(s64 i, atomic64_t *v) { unsigned long tmp; asm volatile( ".arch_extension lse\n" "	neg	%[i], %[i]\n" "	ldadd" "a" "	%[i], %x[tmp], %[v]\n" "	add	%[i], %[i], %x[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_sub_return_release(s64 i, atomic64_t *v) { unsigned long tmp; asm volatile( ".arch_extension lse\n" "	neg	%[i], %[i]\n" "	ldadd" "l" "	%[i], %x[tmp], %[v]\n" "	add	%[i], %[i], %x[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __lse_atomic64_sub_return(s64 i, atomic64_t *v) { unsigned long tmp; asm volatile( ".arch_extension lse\n" "	neg	%[i], %[i]\n" "	ldadd" "al" "	%[i], %x[tmp], %[v]\n" "	add	%[i], %[i], %x[tmp]" : [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp) : "r" (v) : "memory"); return i; }
# 312 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
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
# 364 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
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
# 414 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long __lse__cmpxchg_double(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { unsigned long oldval1 = old1; unsigned long oldval2 = old2; register unsigned long x0 asm ("x0") = old1; register unsigned long x1 asm ("x1") = old2; register unsigned long x2 asm ("x2") = new1; register unsigned long x3 asm ("x3") = new2; register unsigned long x4 asm ("x4") = (unsigned long)ptr; asm volatile( ".arch_extension lse\n" "	casp" "" "\t%[old1], %[old2], %[new1], %[new2], %[v]\n" "	eor	%[old1], %[old1], %[oldval1]\n" "	eor	%[old2], %[old2], %[oldval2]\n" "	orr	%[old1], %[old1], %[old2]" : [old1] "+&r" (x0), [old2] "+&r" (x1), [v] "+Q" (*(unsigned long *)ptr) : [new1] "r" (x2), [new2] "r" (x3), [ptr] "r" (x4), [oldval1] "r" (oldval1), [oldval2] "r" (oldval2) : ); return x0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) long __lse__cmpxchg_double_mb(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { unsigned long oldval1 = old1; unsigned long oldval2 = old2; register unsigned long x0 asm ("x0") = old1; register unsigned long x1 asm ("x1") = old2; register unsigned long x2 asm ("x2") = new1; register unsigned long x3 asm ("x3") = new2; register unsigned long x4 asm ("x4") = (unsigned long)ptr; asm volatile( ".arch_extension lse\n" "	casp" "al" "\t%[old1], %[old2], %[new1], %[new2], %[v]\n" "	eor	%[old1], %[old1], %[oldval1]\n" "	eor	%[old2], %[old2], %[oldval2]\n" "	orr	%[old1], %[old1], %[old2]" : [old1] "+&r" (x0), [old2] "+&r" (x1), [v] "+Q" (*(unsigned long *)ptr) : [new1] "r" (x2), [new2] "r" (x3), [ptr] "r" (x4), [oldval1] "r" (oldval1), [oldval2] "r" (oldval2) : "memory"); return x0; }
# 17 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/lse.h" 2


extern struct static_key_false cpu_hwcap_keys[61];
extern struct static_key_false arm64_const_caps_ready;

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_uses_lse_atomics(void)
{
 return (({ bool branch; if (__builtin_types_compatible_p(typeof(*&arm64_const_caps_ready), struct static_key_true)) branch = !arch_static_branch(&(&arm64_const_caps_ready)->key, true); else if (__builtin_types_compatible_p(typeof(*&arm64_const_caps_ready), struct static_key_false)) branch = !arch_static_branch_jump(&(&arm64_const_caps_ready)->key, true); else branch = ____wrong_branch_error(); __builtin_expect(!!(branch), 1); })) &&
  ({ bool branch; if (__builtin_types_compatible_p(typeof(*&cpu_hwcap_keys[5]), struct static_key_true)) branch = !arch_static_branch(&(&cpu_hwcap_keys[5])->key, true); else if (__builtin_types_compatible_p(typeof(*&cpu_hwcap_keys[5]), struct static_key_false)) branch = !arch_static_branch_jump(&(&cpu_hwcap_keys[5])->key, true); else branch = ____wrong_branch_error(); __builtin_expect(!!(branch), 1); });
}
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h" 2
# 45 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
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
# 85 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __xchg(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_8(x, ptr); case 2: return __xchg_case_16(x, ptr); case 4: return __xchg_case_32(x, ptr); case 8: return __xchg_case_64(x, ptr); default: do { extern void __compiletime_assert_78(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_78(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __xchg_acq(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_acq_8(x, ptr); case 2: return __xchg_case_acq_16(x, ptr); case 4: return __xchg_case_acq_32(x, ptr); case 8: return __xchg_case_acq_64(x, ptr); default: do { extern void __compiletime_assert_79(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_79(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __xchg_rel(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_rel_8(x, ptr); case 2: return __xchg_case_rel_16(x, ptr); case 4: return __xchg_case_rel_32(x, ptr); case 8: return __xchg_case_rel_64(x, ptr); default: do { extern void __compiletime_assert_80(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_80(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __xchg_mb(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_mb_8(x, ptr); case 2: return __xchg_case_mb_16(x, ptr); case 4: return __xchg_case_mb_32(x, ptr); case 8: return __xchg_case_mb_64(x, ptr); default: do { extern void __compiletime_assert_81(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_81(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
# 115 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
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
# 145 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __cmpxchg_double(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_double(old1, old2, new1, new2, ptr) : __ll_sc__cmpxchg_double(old1, old2, new1, new2, ptr); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long __cmpxchg_double_mb(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { return ({ system_uses_lse_atomics() ? __lse__cmpxchg_double_mb(old1, old2, new1, new2, ptr) : __ll_sc__cmpxchg_double_mb(old1, old2, new1, new2, ptr); }); }
# 172 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_8(ptr, old, new); case 2: return __cmpxchg_case_16(ptr, old, new); case 4: return __cmpxchg_case_32(ptr, old, new); case 8: return __cmpxchg_case_64(ptr, old, new); default: do { extern void __compiletime_assert_82(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_82(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __cmpxchg_acq(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_acq_8(ptr, old, new); case 2: return __cmpxchg_case_acq_16(ptr, old, new); case 4: return __cmpxchg_case_acq_32(ptr, old, new); case 8: return __cmpxchg_case_acq_64(ptr, old, new); default: do { extern void __compiletime_assert_83(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_83(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __cmpxchg_rel(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_rel_8(ptr, old, new); case 2: return __cmpxchg_case_rel_16(ptr, old, new); case 4: return __cmpxchg_case_rel_32(ptr, old, new); case 8: return __cmpxchg_case_rel_64(ptr, old, new); default: do { extern void __compiletime_assert_84(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_84(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __cmpxchg_mb(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_mb_8(ptr, old, new); case 2: return __cmpxchg_case_mb_16(ptr, old, new); case 4: return __cmpxchg_case_mb_32(ptr, old, new); case 8: return __cmpxchg_case_mb_64(ptr, old, new); default: do { extern void __compiletime_assert_85(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_85(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
# 250 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __cmpwait_case_8(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "b" "\t%" "w" "[tmp], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	cbnz	%" "w" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr) : [val] "r" (val)); };
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __cmpwait_case_16(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "h" "\t%" "w" "[tmp], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	cbnz	%" "w" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr) : [val] "r" (val)); };
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __cmpwait_case_32(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "" "\t%" "w" "[tmp], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	cbnz	%" "w" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr) : [val] "r" (val)); };
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __cmpwait_case_64(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "" "\t%" "" "[tmp], %[v]\n" "	eor	%" "" "[tmp], %" "" "[tmp], %" "" "[val]\n" "	cbnz	%" "" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr) : [val] "r" (val)); };
# 278 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void __cmpwait(volatile void *ptr, unsigned long val, int size) { switch (size) { case 1: return __cmpwait_case_8(ptr, (u8)val); case 2: return __cmpwait_case_16(ptr, (u16)val); case 4: return __cmpwait_case_32(ptr, val); case 8: return __cmpwait_case_64(ptr, val); default: do { extern void __compiletime_assert_86(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_86(); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
# 17 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h" 2
# 25 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic_andnot(int i, atomic_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic_andnot(i, v) : __ll_sc_atomic_andnot(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic_or(int i, atomic_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic_or(i, v) : __ll_sc_atomic_or(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic_xor(int i, atomic_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic_xor(i, v) : __ll_sc_atomic_xor(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic_add(int i, atomic_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic_add(i, v) : __ll_sc_atomic_add(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic_and(int i, atomic_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic_and(i, v) : __ll_sc_atomic_and(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic_sub(int i, atomic_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic_sub(i, v) : __ll_sc_atomic_sub(i, v); }); }
# 46 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_andnot_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_andnot_relaxed(i, v) : __ll_sc_atomic_fetch_andnot_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_andnot_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_andnot_acquire(i, v) : __ll_sc_atomic_fetch_andnot_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_andnot_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_andnot_release(i, v) : __ll_sc_atomic_fetch_andnot_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_andnot(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_andnot(i, v) : __ll_sc_atomic_fetch_andnot(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_or_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_or_relaxed(i, v) : __ll_sc_atomic_fetch_or_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_or_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_or_acquire(i, v) : __ll_sc_atomic_fetch_or_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_or_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_or_release(i, v) : __ll_sc_atomic_fetch_or_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_or(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_or(i, v) : __ll_sc_atomic_fetch_or(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_xor_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_xor_relaxed(i, v) : __ll_sc_atomic_fetch_xor_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_xor_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_xor_acquire(i, v) : __ll_sc_atomic_fetch_xor_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_xor_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_xor_release(i, v) : __ll_sc_atomic_fetch_xor_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_xor(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_xor(i, v) : __ll_sc_atomic_fetch_xor(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_add_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_add_relaxed(i, v) : __ll_sc_atomic_fetch_add_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_add_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_add_acquire(i, v) : __ll_sc_atomic_fetch_add_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_add_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_add_release(i, v) : __ll_sc_atomic_fetch_add_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_add(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_add(i, v) : __ll_sc_atomic_fetch_add(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_and_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_and_relaxed(i, v) : __ll_sc_atomic_fetch_and_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_and_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_and_acquire(i, v) : __ll_sc_atomic_fetch_and_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_and_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_and_release(i, v) : __ll_sc_atomic_fetch_and_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_and(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_and(i, v) : __ll_sc_atomic_fetch_and(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_sub_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_sub_relaxed(i, v) : __ll_sc_atomic_fetch_sub_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_sub_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_sub_acquire(i, v) : __ll_sc_atomic_fetch_sub_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_sub_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_sub_release(i, v) : __ll_sc_atomic_fetch_sub_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_fetch_sub(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_fetch_sub(i, v) : __ll_sc_atomic_fetch_sub(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_add_return_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_add_return_relaxed(i, v) : __ll_sc_atomic_add_return_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_add_return_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_add_return_acquire(i, v) : __ll_sc_atomic_add_return_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_add_return_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_add_return_release(i, v) : __ll_sc_atomic_add_return_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_add_return(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_add_return(i, v) : __ll_sc_atomic_add_return(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_sub_return_relaxed(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_sub_return_relaxed(i, v) : __ll_sc_atomic_sub_return_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_sub_return_acquire(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_sub_return_acquire(i, v) : __ll_sc_atomic_sub_return_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_sub_return_release(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_sub_return_release(i, v) : __ll_sc_atomic_sub_return_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int arch_atomic_sub_return(int i, atomic_t *v) { return ({ system_uses_lse_atomics() ? __lse_atomic_sub_return(i, v) : __ll_sc_atomic_sub_return(i, v); }); }
# 64 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic64_andnot(long i, atomic64_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic64_andnot(i, v) : __ll_sc_atomic64_andnot(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic64_or(long i, atomic64_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic64_or(i, v) : __ll_sc_atomic64_or(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic64_xor(long i, atomic64_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic64_xor(i, v) : __ll_sc_atomic64_xor(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic64_add(long i, atomic64_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic64_add(i, v) : __ll_sc_atomic64_add(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic64_and(long i, atomic64_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic64_and(i, v) : __ll_sc_atomic64_and(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void arch_atomic64_sub(long i, atomic64_t *v) { ({ system_uses_lse_atomics() ? __lse_atomic64_sub(i, v) : __ll_sc_atomic64_sub(i, v); }); }
# 85 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/atomic.h"
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
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic.h" 2
# 81 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h" 1
# 81 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 267 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
arch_atomic_inc(atomic_t *v)
{
 arch_atomic_add(1, v);
}
# 283 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 364 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 438 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
arch_atomic_dec(atomic_t *v)
{
 arch_atomic_sub(1, v);
}
# 454 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 535 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 916 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 1015 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_sub_and_test(int i, atomic_t *v)
{
 return arch_atomic_sub_return(i, v) == 0;
}
# 1032 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_dec_and_test(atomic_t *v)
{
 return arch_atomic_dec_return(v) == 0;
}
# 1049 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_inc_and_test(atomic_t *v)
{
 return arch_atomic_inc_return(v) == 0;
}
# 1067 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_add_negative(int i, atomic_t *v)
{
 return arch_atomic_add_return(i, v) < 0;
}
# 1085 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 1110 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic_add_unless(atomic_t *v, int a, int u)
{
 return arch_atomic_fetch_add_unless(v, a, u) != u;
}
# 1126 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 1188 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 1374 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
arch_atomic64_inc(atomic64_t *v)
{
 arch_atomic64_add(1, v);
}
# 1390 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 1471 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 1545 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
arch_atomic64_dec(atomic64_t *v)
{
 arch_atomic64_sub(1, v);
}
# 1561 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 1642 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 2023 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 2122 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_sub_and_test(s64 i, atomic64_t *v)
{
 return arch_atomic64_sub_return(i, v) == 0;
}
# 2139 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_dec_and_test(atomic64_t *v)
{
 return arch_atomic64_dec_return(v) == 0;
}
# 2156 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_inc_and_test(atomic64_t *v)
{
 return arch_atomic64_inc_return(v) == 0;
}
# 2174 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_add_negative(s64 i, atomic64_t *v)
{
 return arch_atomic64_add_return(i, v) < 0;
}
# 2192 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 2217 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool
arch_atomic64_add_unless(atomic64_t *v, s64 a, s64 u)
{
 return arch_atomic64_fetch_add_unless(v, a, u) != u;
}
# 2233 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic-arch-fallback.h"
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
# 82 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-instrumented.h" 1
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-instrumented.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h" 1
# 24 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void instrument_read(const volatile void *v, size_t size)
{
 kasan_check_read(v, size);
 kcsan_check_access(v, size, 0);
}
# 39 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void instrument_write(const volatile void *v, size_t size)
{
 kasan_check_write(v, size);
 kcsan_check_access(v, size, (1 << 0));
}
# 54 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void instrument_read_write(const volatile void *v, size_t size)
{
 kasan_check_write(v, size);
 kcsan_check_access(v, size, (1 << 1) | (1 << 0));
}
# 69 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void instrument_atomic_read(const volatile void *v, size_t size)
{
 kasan_check_read(v, size);
 kcsan_check_access(v, size, (1 << 2));
}
# 84 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void instrument_atomic_write(const volatile void *v, size_t size)
{
 kasan_check_write(v, size);
 kcsan_check_access(v, size, (1 << 2) | (1 << 0));
}
# 99 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void instrument_atomic_read_write(const volatile void *v, size_t size)
{
 kasan_check_write(v, size);
 kcsan_check_access(v, size, (1 << 2) | (1 << 0) | (1 << 1));
}
# 115 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
instrument_copy_to_user(void *to, const void *from, unsigned long n)
{
 kasan_check_read(from, n);
 kcsan_check_access(from, n, 0);
}
# 132 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void
instrument_copy_from_user(const void *to, const void *from, unsigned long n)
{
 kasan_check_write(to, n);
 kcsan_check_access(to, n, (1 << 0));
}
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-instrumented.h" 2

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
# 83 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic.h" 2




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-long.h" 1
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-long.h"
# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-long.h" 2


typedef atomic64_t atomic_long_t;
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/atomic-long.h"
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
# 88 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/atomic.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/atomic.h" 2
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/atomic.h"
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
 if (({ do { extern void __compiletime_assert_91(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*p) == sizeof(char) || sizeof(*p) == sizeof(short) || sizeof(*p) == sizeof(int) || sizeof(*p) == sizeof(long)) || sizeof(*p) == sizeof(long long))) __compiletime_assert_91(); } while (0); (*(const volatile typeof( _Generic((*p), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*p))) *)&(*p)); }) & mask)
  return 1;

 old = atomic_long_fetch_or(mask, (atomic_long_t *)p);
 return !!(old & mask);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int test_and_clear_bit(unsigned int nr, volatile unsigned long *p)
{
 long old;
 unsigned long mask = ((((1UL))) << ((nr) % 64));

 p += ((nr) / 64);
 if (!(({ do { extern void __compiletime_assert_92(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*p) == sizeof(char) || sizeof(*p) == sizeof(short) || sizeof(*p) == sizeof(int) || sizeof(*p) == sizeof(long)) || sizeof(*p) == sizeof(long long))) __compiletime_assert_92(); } while (0); (*(const volatile typeof( _Generic((*p), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*p))) *)&(*p)); }) & mask))
  return 0;

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
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/lock.h" 1
# 18 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int test_and_set_bit_lock(unsigned int nr,
     volatile unsigned long *p)
{
 long old;
 unsigned long mask = ((((1UL))) << ((nr) % 64));

 p += ((nr) / 64);
 if (({ do { extern void __compiletime_assert_93(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*p) == sizeof(char) || sizeof(*p) == sizeof(short) || sizeof(*p) == sizeof(int) || sizeof(*p) == sizeof(long)) || sizeof(*p) == sizeof(long long))) __compiletime_assert_93(); } while (0); (*(const volatile typeof( _Generic((*p), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*p))) *)&(*p)); }) & mask)
  return 1;

 old = atomic_long_fetch_or_acquire(mask, (atomic_long_t *)p);
 return !!(old & mask);
}
# 40 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void clear_bit_unlock(unsigned int nr, volatile unsigned long *p)
{
 p += ((nr) / 64);
 atomic_long_fetch_andnot_release(((((1UL))) << ((nr) % 64)), (atomic_long_t *)p);
}
# 57 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __clear_bit_unlock(unsigned int nr,
          volatile unsigned long *p)
{
 unsigned long old;

 p += ((nr) / 64);
 old = ({ do { extern void __compiletime_assert_94(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*p) == sizeof(char) || sizeof(*p) == sizeof(short) || sizeof(*p) == sizeof(int) || sizeof(*p) == sizeof(long)) || sizeof(*p) == sizeof(long long))) __compiletime_assert_94(); } while (0); (*(const volatile typeof( _Generic((*p), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*p))) *)&(*p)); });
 old &= ~((((1UL))) << ((nr) % 64));
 atomic_long_set_release((atomic_long_t *)p, old);
}
# 78 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool clear_bit_unlock_is_negative_byte(unsigned int nr,
           volatile unsigned long *p)
{
 long old;
 unsigned long mask = ((((1UL))) << ((nr) % 64));

 p += ((nr) / 64);
 old = atomic_long_fetch_andnot_release(mask, (atomic_long_t *)p);
 return !!(old & ((((1UL))) << (7)));
}
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/non-atomic.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/non-atomic.h" 2
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/non-atomic.h"
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
# 41 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __change_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);

 *p ^= mask;
}
# 58 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __test_and_set_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);
 unsigned long old = *p;

 *p = old | mask;
 return (old & mask) != 0;
}
# 77 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/non-atomic.h"
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
# 29 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/le.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/le.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/byteorder.h" 1
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/byteorder.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/byteorder/little_endian.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/byteorder/little_endian.h" 1
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/byteorder/little_endian.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/swab.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/swab.h" 1







# 1 "./arch/arm64/include/generated/uapi/asm/swab.h" 1
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/swab.h" 1
# 1 "./arch/arm64/include/generated/uapi/asm/swab.h" 2
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/swab.h" 2
# 48 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/swab.h"
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
# 136 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/swab.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned long __swab(const unsigned long y)
{

 return (__builtin_constant_p((__u64)(y)) ? ((__u64)( (((__u64)(y) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(y) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(y) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(y) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(y) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(y) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(y) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(y) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(y));



}
# 171 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/swab.h"
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
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/swab.h" 2
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/byteorder/little_endian.h" 2
# 44 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/byteorder/little_endian.h"
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
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/byteorder/little_endian.h" 2





# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/byteorder/generic.h" 1
# 144 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/byteorder/generic.h"
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
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/byteorder/little_endian.h" 2
# 24 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/byteorder.h" 2
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/le.h" 2





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
# 53 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/le.h"
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
# 30 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bitops/ext2-atomic-setbit.h" 1
# 31 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bitops.h" 2
# 30 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h" 2
# 65 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h"
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
# 165 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h"
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
# 218 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h"
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
# 294 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitops.h"
extern unsigned long find_last_bit(const unsigned long *addr,
       unsigned long size);
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/log2.h" 1
# 21 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/log2.h"
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
# 44 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/log2.h"
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
# 197 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/log2.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__const__))
int __order_base_2(unsigned long n)
{
 return n > 1 ? ( __builtin_constant_p(n - 1) ? ( __builtin_constant_p(n - 1) ? ( (n - 1) < 2 ? 0 : (n - 1) & (1ULL << 63) ? 63 : (n - 1) & (1ULL << 62) ? 62 : (n - 1) & (1ULL << 61) ? 61 : (n - 1) & (1ULL << 60) ? 60 : (n - 1) & (1ULL << 59) ? 59 : (n - 1) & (1ULL << 58) ? 58 : (n - 1) & (1ULL << 57) ? 57 : (n - 1) & (1ULL << 56) ? 56 : (n - 1) & (1ULL << 55) ? 55 : (n - 1) & (1ULL << 54) ? 54 : (n - 1) & (1ULL << 53) ? 53 : (n - 1) & (1ULL << 52) ? 52 : (n - 1) & (1ULL << 51) ? 51 : (n - 1) & (1ULL << 50) ? 50 : (n - 1) & (1ULL << 49) ? 49 : (n - 1) & (1ULL << 48) ? 48 : (n - 1) & (1ULL << 47) ? 47 : (n - 1) & (1ULL << 46) ? 46 : (n - 1) & (1ULL << 45) ? 45 : (n - 1) & (1ULL << 44) ? 44 : (n - 1) & (1ULL << 43) ? 43 : (n - 1) & (1ULL << 42) ? 42 : (n - 1) & (1ULL << 41) ? 41 : (n - 1) & (1ULL << 40) ? 40 : (n - 1) & (1ULL << 39) ? 39 : (n - 1) & (1ULL << 38) ? 38 : (n - 1) & (1ULL << 37) ? 37 : (n - 1) & (1ULL << 36) ? 36 : (n - 1) & (1ULL << 35) ? 35 : (n - 1) & (1ULL << 34) ? 34 : (n - 1) & (1ULL << 33) ? 33 : (n - 1) & (1ULL << 32) ? 32 : (n - 1) & (1ULL << 31) ? 31 : (n - 1) & (1ULL << 30) ? 30 : (n - 1) & (1ULL << 29) ? 29 : (n - 1) & (1ULL << 28) ? 28 : (n - 1) & (1ULL << 27) ? 27 : (n - 1) & (1ULL << 26) ? 26 : (n - 1) & (1ULL << 25) ? 25 : (n - 1) & (1ULL << 24) ? 24 : (n - 1) & (1ULL << 23) ? 23 : (n - 1) & (1ULL << 22) ? 22 : (n - 1) & (1ULL << 21) ? 21 : (n - 1) & (1ULL << 20) ? 20 : (n - 1) & (1ULL << 19) ? 19 : (n - 1) & (1ULL << 18) ? 18 : (n - 1) & (1ULL << 17) ? 17 : (n - 1) & (1ULL << 16) ? 16 : (n - 1) & (1ULL << 15) ? 15 : (n - 1) & (1ULL << 14) ? 14 : (n - 1) & (1ULL << 13) ? 13 : (n - 1) & (1ULL << 12) ? 12 : (n - 1) & (1ULL << 11) ? 11 : (n - 1) & (1ULL << 10) ? 10 : (n - 1) & (1ULL << 9) ? 9 : (n - 1) & (1ULL << 8) ? 8 : (n - 1) & (1ULL << 7) ? 7 : (n - 1) & (1ULL << 6) ? 6 : (n - 1) & (1ULL << 5) ? 5 : (n - 1) & (1ULL << 4) ? 4 : (n - 1) & (1ULL << 3) ? 3 : (n - 1) & (1ULL << 2) ? 2 : 1) : -1) : (sizeof(n - 1) <= 4) ? __ilog2_u32(n - 1) : __ilog2_u64(n - 1) ) + 1 : 0;
}
# 224 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/log2.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((const))
int __bits_per(unsigned long n)
{
 if (n < 2)
  return 1;
 if (is_power_of_2(n))
  return ( __builtin_constant_p(n) ? ( ((n) == 0 || (n) == 1) ? 0 : ( __builtin_constant_p((n) - 1) ? ( __builtin_constant_p((n) - 1) ? ( ((n) - 1) < 2 ? 0 : ((n) - 1) & (1ULL << 63) ? 63 : ((n) - 1) & (1ULL << 62) ? 62 : ((n) - 1) & (1ULL << 61) ? 61 : ((n) - 1) & (1ULL << 60) ? 60 : ((n) - 1) & (1ULL << 59) ? 59 : ((n) - 1) & (1ULL << 58) ? 58 : ((n) - 1) & (1ULL << 57) ? 57 : ((n) - 1) & (1ULL << 56) ? 56 : ((n) - 1) & (1ULL << 55) ? 55 : ((n) - 1) & (1ULL << 54) ? 54 : ((n) - 1) & (1ULL << 53) ? 53 : ((n) - 1) & (1ULL << 52) ? 52 : ((n) - 1) & (1ULL << 51) ? 51 : ((n) - 1) & (1ULL << 50) ? 50 : ((n) - 1) & (1ULL << 49) ? 49 : ((n) - 1) & (1ULL << 48) ? 48 : ((n) - 1) & (1ULL << 47) ? 47 : ((n) - 1) & (1ULL << 46) ? 46 : ((n) - 1) & (1ULL << 45) ? 45 : ((n) - 1) & (1ULL << 44) ? 44 : ((n) - 1) & (1ULL << 43) ? 43 : ((n) - 1) & (1ULL << 42) ? 42 : ((n) - 1) & (1ULL << 41) ? 41 : ((n) - 1) & (1ULL << 40) ? 40 : ((n) - 1) & (1ULL << 39) ? 39 : ((n) - 1) & (1ULL << 38) ? 38 : ((n) - 1) & (1ULL << 37) ? 37 : ((n) - 1) & (1ULL << 36) ? 36 : ((n) - 1) & (1ULL << 35) ? 35 : ((n) - 1) & (1ULL << 34) ? 34 : ((n) - 1) & (1ULL << 33) ? 33 : ((n) - 1) & (1ULL << 32) ? 32 : ((n) - 1) & (1ULL << 31) ? 31 : ((n) - 1) & (1ULL << 30) ? 30 : ((n) - 1) & (1ULL << 29) ? 29 : ((n) - 1) & (1ULL << 28) ? 28 : ((n) - 1) & (1ULL << 27) ? 27 : ((n) - 1) & (1ULL << 26) ? 26 : ((n) - 1) & (1ULL << 25) ? 25 : ((n) - 1) & (1ULL << 24) ? 24 : ((n) - 1) & (1ULL << 23) ? 23 : ((n) - 1) & (1ULL << 22) ? 22 : ((n) - 1) & (1ULL << 21) ? 21 : ((n) - 1) & (1ULL << 20) ? 20 : ((n) - 1) & (1ULL << 19) ? 19 : ((n) - 1) & (1ULL << 18) ? 18 : ((n) - 1) & (1ULL << 17) ? 17 : ((n) - 1) & (1ULL << 16) ? 16 : ((n) - 1) & (1ULL << 15) ? 15 : ((n) - 1) & (1ULL << 14) ? 14 : ((n) - 1) & (1ULL << 13) ? 13 : ((n) - 1) & (1ULL << 12) ? 12 : ((n) - 1) & (1ULL << 11) ? 11 : ((n) - 1) & (1ULL << 10) ? 10 : ((n) - 1) & (1ULL << 9) ? 9 : ((n) - 1) & (1ULL << 8) ? 8 : ((n) - 1) & (1ULL << 7) ? 7 : ((n) - 1) & (1ULL << 6) ? 6 : ((n) - 1) & (1ULL << 5) ? 5 : ((n) - 1) & (1ULL << 4) ? 4 : ((n) - 1) & (1ULL << 3) ? 3 : ((n) - 1) & (1ULL << 2) ? 2 : 1) : -1) : (sizeof((n) - 1) <= 4) ? __ilog2_u32((n) - 1) : __ilog2_u64((n) - 1) ) + 1) : __order_base_2(n) ) + 1;
 return ( __builtin_constant_p(n) ? ( ((n) == 0 || (n) == 1) ? 0 : ( __builtin_constant_p((n) - 1) ? ( __builtin_constant_p((n) - 1) ? ( ((n) - 1) < 2 ? 0 : ((n) - 1) & (1ULL << 63) ? 63 : ((n) - 1) & (1ULL << 62) ? 62 : ((n) - 1) & (1ULL << 61) ? 61 : ((n) - 1) & (1ULL << 60) ? 60 : ((n) - 1) & (1ULL << 59) ? 59 : ((n) - 1) & (1ULL << 58) ? 58 : ((n) - 1) & (1ULL << 57) ? 57 : ((n) - 1) & (1ULL << 56) ? 56 : ((n) - 1) & (1ULL << 55) ? 55 : ((n) - 1) & (1ULL << 54) ? 54 : ((n) - 1) & (1ULL << 53) ? 53 : ((n) - 1) & (1ULL << 52) ? 52 : ((n) - 1) & (1ULL << 51) ? 51 : ((n) - 1) & (1ULL << 50) ? 50 : ((n) - 1) & (1ULL << 49) ? 49 : ((n) - 1) & (1ULL << 48) ? 48 : ((n) - 1) & (1ULL << 47) ? 47 : ((n) - 1) & (1ULL << 46) ? 46 : ((n) - 1) & (1ULL << 45) ? 45 : ((n) - 1) & (1ULL << 44) ? 44 : ((n) - 1) & (1ULL << 43) ? 43 : ((n) - 1) & (1ULL << 42) ? 42 : ((n) - 1) & (1ULL << 41) ? 41 : ((n) - 1) & (1ULL << 40) ? 40 : ((n) - 1) & (1ULL << 39) ? 39 : ((n) - 1) & (1ULL << 38) ? 38 : ((n) - 1) & (1ULL << 37) ? 37 : ((n) - 1) & (1ULL << 36) ? 36 : ((n) - 1) & (1ULL << 35) ? 35 : ((n) - 1) & (1ULL << 34) ? 34 : ((n) - 1) & (1ULL << 33) ? 33 : ((n) - 1) & (1ULL << 32) ? 32 : ((n) - 1) & (1ULL << 31) ? 31 : ((n) - 1) & (1ULL << 30) ? 30 : ((n) - 1) & (1ULL << 29) ? 29 : ((n) - 1) & (1ULL << 28) ? 28 : ((n) - 1) & (1ULL << 27) ? 27 : ((n) - 1) & (1ULL << 26) ? 26 : ((n) - 1) & (1ULL << 25) ? 25 : ((n) - 1) & (1ULL << 24) ? 24 : ((n) - 1) & (1ULL << 23) ? 23 : ((n) - 1) & (1ULL << 22) ? 22 : ((n) - 1) & (1ULL << 21) ? 21 : ((n) - 1) & (1ULL << 20) ? 20 : ((n) - 1) & (1ULL << 19) ? 19 : ((n) - 1) & (1ULL << 18) ? 18 : ((n) - 1) & (1ULL << 17) ? 17 : ((n) - 1) & (1ULL << 16) ? 16 : ((n) - 1) & (1ULL << 15) ? 15 : ((n) - 1) & (1ULL << 14) ? 14 : ((n) - 1) & (1ULL << 13) ? 13 : ((n) - 1) & (1ULL << 12) ? 12 : ((n) - 1) & (1ULL << 11) ? 11 : ((n) - 1) & (1ULL << 10) ? 10 : ((n) - 1) & (1ULL << 9) ? 9 : ((n) - 1) & (1ULL << 8) ? 8 : ((n) - 1) & (1ULL << 7) ? 7 : ((n) - 1) & (1ULL << 6) ? 6 : ((n) - 1) & (1ULL << 5) ? 5 : ((n) - 1) & (1ULL << 4) ? 4 : ((n) - 1) & (1ULL << 3) ? 3 : ((n) - 1) & (1ULL << 2) ? 2 : 1) : -1) : (sizeof((n) - 1) <= 4) ? __ilog2_u32((n) - 1) : __ilog2_u64((n) - 1) ) + 1) : __order_base_2(n) );
}
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/minmax.h" 1
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/typecheck.h" 1
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h" 1






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kern_levels.h" 1
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cache.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/kernel.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/sysinfo.h" 1







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
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/kernel.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cache.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cache.h" 1







# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cputype.h" 1
# 162 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cputype.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/sysreg.h" 1
# 163 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cputype.h" 2
# 175 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cputype.h"
struct midr_range {
 u32 model;
 u32 rv_min;
 u32 rv_max;
};
# 192 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cputype.h"
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
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cache.h" 2
# 62 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cache.h"
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
# 110 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cache.h"
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
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cache.h" 2
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/ratelimit_types.h" 1





# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/param.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/param.h" 1
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/param.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/param.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/param.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/param.h" 2
# 23 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/param.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/param.h" 2
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/ratelimit_types.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h" 1
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock_types.h" 1
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock_types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qspinlock_types.h" 1
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qspinlock_types.h"
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
# 43 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qspinlock_types.h"
 };
} arch_spinlock_t;
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock_types.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qrwlock_types.h" 1






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock_types.h" 1
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qrwlock_types.h" 2





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
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock_types.h" 2
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h" 2




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep_types.h" 1
# 17 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep_types.h"
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
# 197 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep_types.h"
struct lock_class_key { };




struct lockdep_map { };

struct pin_cookie { };
# 19 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h" 2

typedef struct raw_spinlock {
 arch_spinlock_t raw_lock;







} raw_spinlock_t;
# 71 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h"
typedef struct spinlock {
 union {
  struct raw_spinlock rlock;
# 82 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h"
 };
} spinlock_t;
# 99 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/rwlock_types.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/rwlock_types.h"
typedef struct {
 arch_rwlock_t raw_lock;







} rwlock_t;
# 100 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_types.h" 2
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/ratelimit_types.h" 2







struct ratelimit_state {
 raw_spinlock_t lock;

 int interval;
 int burst;
 int printed;
 int missed;
 unsigned long begin;
 unsigned long flags;
};
# 40 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/ratelimit_types.h"
extern int ___ratelimit(struct ratelimit_state *rs, const char *func);
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h" 2

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
# 65 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h"
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
# 148 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h"
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
# 285 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h"
extern int kptr_restrict;
# 565 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h"
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
# 604 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/printk.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void print_hex_dump_debug(const char *prefix_str, int prefix_type,
     int rowsize, int groupsize,
     const void *buf, size_t len, bool ascii)
{
}
# 17 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2


# 1 "./arch/arm64/include/generated/asm/div64.h" 1
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/div64.h" 1
# 1 "./arch/arm64/include/generated/asm/div64.h" 2
# 20 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h" 2
# 192 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
struct completion;
struct pt_regs;
struct user;
# 248 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
  static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void ___might_sleep(const char *file, int line,
       int preempt_offset) { }
  static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __might_sleep(const char *file, int line,
       int preempt_offset) { }
# 305 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
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
extern void oops_enter(void);
extern void oops_exit(void);
extern bool oops_may_print(void);
void do_exit(long error_code) __attribute__((__noreturn__));
void complete_and_exit(struct completion *, long) __attribute__((__noreturn__));


int __attribute__((__warn_unused_result__)) _kstrtoul(const char *s, unsigned int base, unsigned long *res);
int __attribute__((__warn_unused_result__)) _kstrtol(const char *s, unsigned int base, long *res);

int __attribute__((__warn_unused_result__)) kstrtoull(const char *s, unsigned int base, unsigned long long *res);
int __attribute__((__warn_unused_result__)) kstrtoll(const char *s, unsigned int base, long long *res);
# 351 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__warn_unused_result__)) kstrtoul(const char *s, unsigned int base, unsigned long *res)
{




 if (sizeof(unsigned long) == sizeof(unsigned long long) &&
     __alignof__(unsigned long) == __alignof__(unsigned long long))
  return kstrtoull(s, base, (unsigned long long *)res);
 else
  return _kstrtoul(s, base, res);
}
# 379 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
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
# 466 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
extern unsigned long simple_strtoul(const char *,char **,unsigned int);
extern long simple_strtol(const char *,char **,unsigned int);
extern unsigned long long simple_strtoull(const char *,char **,unsigned int);
extern long long simple_strtoll(const char *,char **,unsigned int);

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



extern unsigned int sysctl_oops_all_cpu_backtrace;




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
# 608 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
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
# 664 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
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
# 743 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
extern __attribute__((__format__(printf, 2, 3)))
int __trace_bprintk(unsigned long ip, const char *fmt, ...);

extern __attribute__((__format__(printf, 2, 3)))
int __trace_printk(unsigned long ip, const char *fmt, ...);
# 784 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
extern int __trace_bputs(unsigned long ip, const char *str);
extern int __trace_puts(unsigned long ip, const char *str, int size);

extern void trace_dump_stack(int skip);
# 806 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/kernel.h"
extern __attribute__((__format__(printf, 2, 0))) int
__ftrace_vbprintk(unsigned long ip, const char *fmt, va_list ap);

extern __attribute__((__format__(printf, 2, 0))) int
__ftrace_vprintk(unsigned long ip, const char *fmt, va_list ap);

extern void ftrace_dump(enum ftrace_dump_mode oops_dump_mode);
# 21 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h" 2




struct bug_entry {



 signed int bug_addr_disp;





 signed int file_disp;

 unsigned short line;

 unsigned short flags;
};
# 93 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h"
extern __attribute__((__format__(printf, 1, 2))) void __warn_printk(const char *fmt, ...);
# 111 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/bug.h"
struct warn_args;
struct pt_regs;

void __warn(const char *file, int line, void *caller, unsigned taint,
     struct pt_regs *regs, struct warn_args *args);
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/bug.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bug.h" 2



enum bug_trap_type {
 BUG_TRAP_TYPE_NONE = 0,
 BUG_TRAP_TYPE_WARN = 1,
 BUG_TRAP_TYPE_BUG = 2,
};

struct pt_regs;
# 34 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bug.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int is_warning_bug(const struct bug_entry *bug)
{
 return bug->flags & (1 << 0);
}

struct bug_entry *find_bug(unsigned long bugaddr);

enum bug_trap_type report_bug(unsigned long bug_addr, struct pt_regs *regs);


int is_valid_bugaddr(unsigned long addr);

void generic_bug_clear_once(void);
# 70 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bug.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__warn_unused_result__)) bool check_data_corruption(bool v) { return v; }
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/bug.h" 2




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h" 1
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
struct nvgpu_list_node {



 struct nvgpu_list_node *prev;



 struct nvgpu_list_node *next;
};
# 47 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_init_list_node(struct nvgpu_list_node *node)
{
 node->prev = node;
 node->next = node;
}
# 63 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_list_add(struct nvgpu_list_node *new_node,
     struct nvgpu_list_node *head)
{
 new_node->next = head->next;
 new_node->next->prev = new_node;
 new_node->prev = head;
 head->next = new_node;
}
# 84 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_list_add_tail(struct nvgpu_list_node *new_node,
     struct nvgpu_list_node *head)
{
 new_node->prev = head->prev;
 new_node->prev->next = new_node;
 new_node->next = head;
 head->prev = new_node;
}
# 103 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_list_del(struct nvgpu_list_node *node)
{
 node->prev->next = node->next;
 node->next->prev = node->prev;
 nvgpu_init_list_node(node);
}
# 123 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool nvgpu_list_empty(struct nvgpu_list_node *head)
{
 return head->next == head;
}
# 142 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_list_move(struct nvgpu_list_node *node,
     struct nvgpu_list_node *head)
{
 nvgpu_list_del(node);
 nvgpu_list_add(node, head);
}
# 161 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_list_replace_init(struct nvgpu_list_node *old_node,
     struct nvgpu_list_node *new_node)
{
 new_node->next = old_node->next;
 new_node->next->prev = new_node;
 new_node->prev = old_node->prev;
 new_node->prev->next = new_node;
 nvgpu_init_list_node(old_node);
}
# 32 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/bug.h" 2
# 75 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/bug.h"
struct gk20a;
# 92 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/bug.h"
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
# 40 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h" 2






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_cast_s32_to_u32(s32 si_a);
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_cast_s32_to_u64(s32 si_a);
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_cast_s64_to_u64(s64 l_a);
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 nvgpu_safe_cast_u64_to_s64(u64 ul_a);
# 64 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_add_u32(u32 ui_a, u32 ui_b)
{
 if (((~0U) - ui_a) < ui_b) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 67; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return ui_a + ui_b;
 }
}
# 91 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s32 nvgpu_safe_add_s32(s32 si_a, s32 si_b)
{
 if (((si_b > 0) && (si_a > (((int)(~0U >> 1)) - si_b))) ||
  ((si_b < 0) && (si_a < ((-((int)(~0U >> 1)) - 1) - si_b)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 95; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return si_a + si_b;
 }
}
# 115 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_add_u64(u64 ul_a, u64 ul_b)
{
 if (((~0UL) - ul_a) < ul_b) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 118; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return ul_a + ul_b;
 }
}
# 142 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 nvgpu_safe_add_s64(s64 sl_a, s64 sl_b)
{
 if (((sl_b > 0) && (sl_a > (((long)(~0UL >> 1)) - sl_b))) ||
  ((sl_b < 0) && (sl_a < ((-((long)(~0UL >> 1)) - 1) - sl_b)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 146; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return sl_a + sl_b;
 }
}
# 177 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_wrapping_add_u32(u32 ui_a, u32 ui_b)
{

 u64 ul_a = (u64)ui_a;
 u64 ul_b = (u64)ui_b;
 u64 sum = (ul_a + ul_b) & 0xffffffffULL;


 ((void) ({ int __ret_warn_on = !!(!(sum <= ((u32)~0U))); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 185; .short (1 << 0)|(((9) << 8)); .popsection; 14471: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); }));

 return (u32)sum;
}
# 201 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_wrapping_sub_u32(u32 ui_a, u32 ui_b)
{

 u64 ul_a = (u64)ui_a;
 u64 ul_b = (u64)ui_b;
 u64 diff = (ul_a + 0xffffffff00000000ULL - ul_b) & 0xffffffffULL;
# 231 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
 ((void) ({ int __ret_warn_on = !!(!(diff <= ((u32)~0U))); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 231; .short (1 << 0)|(((9) << 8)); .popsection; 14471: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); }));

 return (u32)diff;
}
# 248 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 nvgpu_safe_sub_u8(u8 uc_a, u8 uc_b)
{
 if (uc_a < uc_b) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 251; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u8)(uc_a - uc_b);
 }
}
# 270 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_sub_u32(u32 ui_a, u32 ui_b)
{
 if (ui_a < ui_b) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 273; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return ui_a - ui_b;
 }
}
# 297 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s32 nvgpu_safe_sub_s32(s32 si_a, s32 si_b)
{
 if (((si_b > 0) && (si_a < ((-((int)(~0U >> 1)) - 1) + si_b))) ||
  ((si_b < 0) && (si_a > (((int)(~0U >> 1)) + si_b)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 301; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return si_a - si_b;
 }
}
# 320 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_sub_u64(u64 ul_a, u64 ul_b)
{
 if (ul_a < ul_b) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 323; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return ul_a - ul_b;
 }
}
# 357 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 nvgpu_safe_sub_s64(s64 si_a, s64 si_b)
{
 if (((si_b > 0) && (si_a < ((-((long)(~0UL >> 1)) - 1) + si_b))) ||
  ((si_b < 0) && (si_a > (((long)(~0UL >> 1)) + si_b)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 361; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return si_a - si_b;
 }
}
# 384 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_mult_u32(u32 ui_a, u32 ui_b)
{
 if ((ui_a == 0U) || (ui_b == 0U)) {
  return 0U;
 } else if (ui_a > ((~0U) / ui_b)) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 389; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return ui_a * ui_b;
 }
}
# 412 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_mult_u64(u64 ul_a, u64 ul_b)
{
 if ((ul_a == 0UL) || (ul_b == 0UL)) {
  return 0UL;
 } else if (ul_a > ((~0UL) / ul_b)) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 417; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return ul_a * ul_b;
 }
}
# 449 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 nvgpu_safe_mult_s64(s64 sl_a, s64 sl_b)
{
 if (sl_a > 0) {
  if (sl_b > 0) {
   if (sl_a > (((long)(~0UL >> 1)) / sl_b)) {
    do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 454; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
    return 0;
   }
  } else {
   if (sl_b < ((-((long)(~0UL >> 1)) - 1) / sl_a)) {
    do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 459; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
    return 0;
   }
  }
 } else {
  if (sl_b > 0) {
   if (sl_a < ((-((long)(~0UL >> 1)) - 1) / sl_b)) {
    do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 466; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
    return 0;
   }
  } else {
   if ((sl_a != 0) && (sl_b < (((long)(~0UL >> 1)) / sl_a))) {
    do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 471; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
    return 0;
   }
  }
 }

 return sl_a * sl_b;
}
# 490 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 nvgpu_safe_cast_u64_to_u16(u64 ul_a)
{
 if (ul_a > ((unsigned short)~0U)) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 493; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u16)ul_a;
 }
}
# 510 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_cast_u64_to_u32(u64 ul_a)
{
 if (ul_a > (~0U)) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 513; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u32)ul_a;
 }
}
# 531 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 nvgpu_safe_cast_u64_to_u8(u64 ul_a)
{
 if (ul_a > nvgpu_safe_cast_s32_to_u64(((u8)~0U))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 534; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u8)ul_a;
 }
}
# 552 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_cast_s64_to_u32(s64 l_a)
{
 if ((l_a < 0) || (l_a > nvgpu_safe_cast_u64_to_s64(((u64)((~0U)))))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 555; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u32)l_a;
 }
}
# 572 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_cast_s64_to_u64(s64 l_a)
{
 if (l_a < 0) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 575; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u64)l_a;
 }
}
# 589 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_cast_bool_to_u32(bool bl_a)
{
 return (bl_a == true) ? 1U : 0U;
}
# 604 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 nvgpu_safe_cast_s8_to_u8(s8 sc_a)
{
 if (sc_a < 0) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 607; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u8)sc_a;
 }
}
# 624 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 nvgpu_safe_cast_s32_to_u32(s32 si_a)
{
 if (si_a < 0) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 627; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u32)si_a;
 }
}
# 644 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 nvgpu_safe_cast_s32_to_u64(s32 si_a)
{
 if (si_a < 0) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 647; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u64)si_a;
 }
}
# 664 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 nvgpu_safe_cast_u32_to_u16(u32 ui_a)
{
 if (ui_a > ((unsigned short)~0U)) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 667; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u16)ui_a;
 }
}
# 685 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 nvgpu_safe_cast_u32_to_u8(u32 ui_a)
{
 if (ui_a > nvgpu_safe_cast_s32_to_u32(((u8)~0U))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 688; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0U;
 } else {
  return (u8)ui_a;
 }
}
# 706 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s8 nvgpu_safe_cast_u32_to_s8(u32 ui_a)
{
 if (ui_a > nvgpu_safe_cast_s32_to_u32((((u8)~0U)/2))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 709; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return (s8)ui_a;
 }
}
# 727 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s32 nvgpu_safe_cast_u32_to_s32(u32 ui_a)
{
 if (ui_a > nvgpu_safe_cast_s32_to_u32(((int)(~0U >> 1)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 730; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return (s32)ui_a;
 }
}
# 748 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s32 nvgpu_safe_cast_u64_to_s32(u64 ul_a)
{
 if (ul_a > nvgpu_safe_cast_s32_to_u64(((int)(~0U >> 1)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 751; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return (s32)ul_a;
 }
}
# 769 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 nvgpu_safe_cast_u64_to_s64(u64 ul_a)
{
 if (ul_a > nvgpu_safe_cast_s64_to_u64(((long)(~0UL >> 1)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 772; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return (s64)ul_a;
 }
}
# 790 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s32 nvgpu_safe_cast_s64_to_s32(s64 sl_a)
{
 if ((sl_a > ((int)(~0U >> 1))) || (sl_a < (-((int)(~0U >> 1)) - 1))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 793; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
  return 0;
 } else {
  return (s32)sl_a;
 }
}
# 873 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_safety_checks(void)
{





 if ((sizeof(unsigned int) * 8U) !=
  nvgpu_safe_cast_s32_to_u64(_Generic((~0U), unsigned int : __builtin_popcount, unsigned long : __builtin_popcountl, unsigned long long : __builtin_popcountll, default : __builtin_popcount)((~0U)))) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 882; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
 }






 if ((_Generic(((u8)~0U), unsigned int : __builtin_popcount, unsigned long : __builtin_popcountl, unsigned long long : __builtin_popcountll, default : __builtin_popcount)(((u8)~0U)) != 8) ||
  (_Generic(((unsigned short)~0U), unsigned int : __builtin_popcount, unsigned long : __builtin_popcountl, unsigned long long : __builtin_popcountll, default : __builtin_popcount)(((unsigned short)~0U)) != 16) ||
  (_Generic((~0U), unsigned int : __builtin_popcount, unsigned long : __builtin_popcountl, unsigned long long : __builtin_popcountll, default : __builtin_popcount)((~0U)) != 32) ||
  (_Generic((~0UL), unsigned int : __builtin_popcount, unsigned long : __builtin_popcountl, unsigned long long : __builtin_popcountll, default : __builtin_popcount)((~0UL)) != 64) ||
  (_Generic((~0ULL), unsigned int : __builtin_popcount, unsigned long : __builtin_popcountl, unsigned long long : __builtin_popcountll, default : __builtin_popcount)((~0ULL)) != 64)) {
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h\"; .popsection; .long 14472b - 14470b; .short 895; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
 }
# 918 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/static_analysis.h"
}
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/cic/mon/lut_ga10b_fusa.c" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h" 1
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h" 1
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/linux/lock.h" 1
# 20 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/linux/lock.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h" 1
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/current.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/current.h"
struct task_struct;





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) struct task_struct *get_current(void)
{
 unsigned long sp_el0;

 asm ("mrs %0, sp_el0" : "=r" (sp_el0));

 return (struct task_struct *)sp_el0;
}
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h" 1






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/poison.h" 1
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h" 2
# 33 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void INIT_LIST_HEAD(struct list_head *list)
{
 do { do { extern void __compiletime_assert_95(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(list->next) == sizeof(char) || sizeof(list->next) == sizeof(short) || sizeof(list->next) == sizeof(int) || sizeof(list->next) == sizeof(long)) || sizeof(list->next) == sizeof(long long))) __compiletime_assert_95(); } while (0); do { *(volatile typeof(list->next) *)&(list->next) = (list); } while (0); } while (0);
 list->prev = list;
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __list_add_valid(struct list_head *new,
    struct list_head *prev,
    struct list_head *next)
{
 return true;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __list_del_entry_valid(struct list_head *entry)
{
 return true;
}
# 63 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __list_add(struct list_head *new,
         struct list_head *prev,
         struct list_head *next)
{
 if (!__list_add_valid(new, prev, next))
  return;

 next->prev = new;
 new->next = next;
 new->prev = prev;
 do { do { extern void __compiletime_assert_96(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(prev->next) == sizeof(char) || sizeof(prev->next) == sizeof(short) || sizeof(prev->next) == sizeof(int) || sizeof(prev->next) == sizeof(long)) || sizeof(prev->next) == sizeof(long long))) __compiletime_assert_96(); } while (0); do { *(volatile typeof(prev->next) *)&(prev->next) = (new); } while (0); } while (0);
}
# 84 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_add(struct list_head *new, struct list_head *head)
{
 __list_add(new, head, head->next);
}
# 98 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_add_tail(struct list_head *new, struct list_head *head)
{
 __list_add(new, head->prev, head);
}
# 110 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __list_del(struct list_head * prev, struct list_head * next)
{
 next->prev = prev;
 do { do { extern void __compiletime_assert_97(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(prev->next) == sizeof(char) || sizeof(prev->next) == sizeof(short) || sizeof(prev->next) == sizeof(int) || sizeof(prev->next) == sizeof(long)) || sizeof(prev->next) == sizeof(long long))) __compiletime_assert_97(); } while (0); do { *(volatile typeof(prev->next) *)&(prev->next) = (next); } while (0); } while (0);
}
# 124 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __list_del_clearprev(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);
 entry->prev = ((void *)0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __list_del_entry(struct list_head *entry)
{
 if (!__list_del_entry_valid(entry))
  return;

 __list_del(entry->prev, entry->next);
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_del(struct list_head *entry)
{
 __list_del_entry(entry);
 entry->next = ((void *) 0x100 + (0xdead000000000000UL));
 entry->prev = ((void *) 0x122 + (0xdead000000000000UL));
}
# 158 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_replace(struct list_head *old,
    struct list_head *new)
{
 new->next = old->next;
 new->next->prev = new;
 new->prev = old->prev;
 new->prev->next = new;
}
# 174 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_replace_init(struct list_head *old,
         struct list_head *new)
{
 list_replace(old, new);
 INIT_LIST_HEAD(old);
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_swap(struct list_head *entry1,
        struct list_head *entry2)
{
 struct list_head *pos = entry2->prev;

 list_del(entry2);
 list_replace(entry1, entry2);
 if (pos == entry1)
  pos = entry2;
 list_add(entry1, pos);
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_del_init(struct list_head *entry)
{
 __list_del_entry(entry);
 INIT_LIST_HEAD(entry);
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_move(struct list_head *list, struct list_head *head)
{
 __list_del_entry(list);
 list_add(list, head);
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_move_tail(struct list_head *list,
      struct list_head *head)
{
 __list_del_entry(list);
 list_add_tail(list, head);
}
# 240 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_bulk_move_tail(struct list_head *head,
           struct list_head *first,
           struct list_head *last)
{
 first->prev->next = last->next;
 last->next->prev = first->prev;

 head->prev->next = first;
 first->prev = head->prev;

 last->next = head;
 head->prev = last;
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int list_is_first(const struct list_head *list,
     const struct list_head *head)
{
 return list->prev == head;
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int list_is_last(const struct list_head *list,
    const struct list_head *head)
{
 return list->next == head;
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int list_empty(const struct list_head *head)
{
 return ({ do { extern void __compiletime_assert_98(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(head->next) == sizeof(char) || sizeof(head->next) == sizeof(short) || sizeof(head->next) == sizeof(int) || sizeof(head->next) == sizeof(long)) || sizeof(head->next) == sizeof(long long))) __compiletime_assert_98(); } while (0); (*(const volatile typeof( _Generic((head->next), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (head->next))) *)&(head->next)); }) == head;
}
# 296 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_del_init_careful(struct list_head *entry)
{
 __list_del_entry(entry);
 entry->prev = entry;
 do { typeof(&entry->next) __p = (&entry->next); union { typeof( _Generic((*&entry->next), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&entry->next))) __val; char __c[1]; } __u = { .__val = ( typeof( _Generic((*&entry->next), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&entry->next)))) (entry) }; do { extern void __compiletime_assert_99(void) __attribute__((__error__("Need native word sized stores/loads for atomicity."))); if (!((sizeof(*&entry->next) == sizeof(char) || sizeof(*&entry->next) == sizeof(short) || sizeof(*&entry->next) == sizeof(int) || sizeof(*&entry->next) == sizeof(long)))) __compiletime_assert_99(); } while (0); kasan_check_write(__p, sizeof(*&entry->next)); switch (sizeof(*&entry->next)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*__p) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*__p) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*__p) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*__p) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0);
}
# 316 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int list_empty_careful(const struct list_head *head)
{
 struct list_head *next = ({ union { typeof( _Generic((*&head->next), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&head->next))) __val; char __c[1]; } __u; typeof(&head->next) __p = (&head->next); do { extern void __compiletime_assert_100(void) __attribute__((__error__("Need native word sized stores/loads for atomicity."))); if (!((sizeof(*&head->next) == sizeof(char) || sizeof(*&head->next) == sizeof(short) || sizeof(*&head->next) == sizeof(int) || sizeof(*&head->next) == sizeof(long)))) __compiletime_assert_100(); } while (0); kasan_check_read(__p, sizeof(*&head->next)); switch (sizeof(*&head->next)) { case 1: asm volatile ("ldarb %w0, %1" : "=r" (*(__u8 *)__u.__c) : "Q" (*__p) : "memory"); break; case 2: asm volatile ("ldarh %w0, %1" : "=r" (*(__u16 *)__u.__c) : "Q" (*__p) : "memory"); break; case 4: asm volatile ("ldar %w0, %1" : "=r" (*(__u32 *)__u.__c) : "Q" (*__p) : "memory"); break; case 8: asm volatile ("ldar %0, %1" : "=r" (*(__u64 *)__u.__c) : "Q" (*__p) : "memory"); break; } (typeof(*&head->next))__u.__val; });
 return (next == head) && (next == head->prev);
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_rotate_left(struct list_head *head)
{
 struct list_head *first;

 if (!list_empty(head)) {
  first = head->next;
  list_move_tail(first, head);
 }
}
# 343 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_rotate_to_front(struct list_head *list,
     struct list_head *head)
{





 list_move_tail(head, list);
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int list_is_singular(const struct list_head *head)
{
 return !list_empty(head) && (head->next == head->prev);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __list_cut_position(struct list_head *list,
  struct list_head *head, struct list_head *entry)
{
 struct list_head *new_first = entry->next;
 list->next = head->next;
 list->next->prev = list;
 list->prev = entry;
 entry->next = list;
 head->next = new_first;
 new_first->prev = head;
}
# 389 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_cut_position(struct list_head *list,
  struct list_head *head, struct list_head *entry)
{
 if (list_empty(head))
  return;
 if (list_is_singular(head) &&
  (head->next != entry && head != entry))
  return;
 if (entry == head)
  INIT_LIST_HEAD(list);
 else
  __list_cut_position(list, head, entry);
}
# 417 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_cut_before(struct list_head *list,
       struct list_head *head,
       struct list_head *entry)
{
 if (head->next == entry) {
  INIT_LIST_HEAD(list);
  return;
 }
 list->next = head->next;
 list->next->prev = list;
 list->prev = entry->prev;
 list->prev->next = list;
 head->next = entry;
 entry->prev = head;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __list_splice(const struct list_head *list,
     struct list_head *prev,
     struct list_head *next)
{
 struct list_head *first = list->next;
 struct list_head *last = list->prev;

 first->prev = prev;
 prev->next = first;

 last->next = next;
 next->prev = last;
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_splice(const struct list_head *list,
    struct list_head *head)
{
 if (!list_empty(list))
  __list_splice(list, head, head->next);
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_splice_tail(struct list_head *list,
    struct list_head *head)
{
 if (!list_empty(list))
  __list_splice(list, head->prev, head);
}
# 478 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_splice_init(struct list_head *list,
        struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head, head->next);
  INIT_LIST_HEAD(list);
 }
}
# 495 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void list_splice_tail_init(struct list_head *list,
      struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head->prev, head);
  INIT_LIST_HEAD(list);
 }
}
# 792 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void INIT_HLIST_NODE(struct hlist_node *h)
{
 h->next = ((void *)0);
 h->pprev = ((void *)0);
}
# 806 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int hlist_unhashed(const struct hlist_node *h)
{
 return !h->pprev;
}
# 819 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int hlist_unhashed_lockless(const struct hlist_node *h)
{
 return !({ do { extern void __compiletime_assert_101(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(h->pprev) == sizeof(char) || sizeof(h->pprev) == sizeof(short) || sizeof(h->pprev) == sizeof(int) || sizeof(h->pprev) == sizeof(long)) || sizeof(h->pprev) == sizeof(long long))) __compiletime_assert_101(); } while (0); (*(const volatile typeof( _Generic((h->pprev), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (h->pprev))) *)&(h->pprev)); });
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int hlist_empty(const struct hlist_head *h)
{
 return !({ do { extern void __compiletime_assert_102(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(h->first) == sizeof(char) || sizeof(h->first) == sizeof(short) || sizeof(h->first) == sizeof(int) || sizeof(h->first) == sizeof(long)) || sizeof(h->first) == sizeof(long long))) __compiletime_assert_102(); } while (0); (*(const volatile typeof( _Generic((h->first), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (h->first))) *)&(h->first)); });
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __hlist_del(struct hlist_node *n)
{
 struct hlist_node *next = n->next;
 struct hlist_node **pprev = n->pprev;

 do { do { extern void __compiletime_assert_103(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*pprev) == sizeof(char) || sizeof(*pprev) == sizeof(short) || sizeof(*pprev) == sizeof(int) || sizeof(*pprev) == sizeof(long)) || sizeof(*pprev) == sizeof(long long))) __compiletime_assert_103(); } while (0); do { *(volatile typeof(*pprev) *)&(*pprev) = (next); } while (0); } while (0);
 if (next)
  do { do { extern void __compiletime_assert_104(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(next->pprev) == sizeof(char) || sizeof(next->pprev) == sizeof(short) || sizeof(next->pprev) == sizeof(int) || sizeof(next->pprev) == sizeof(long)) || sizeof(next->pprev) == sizeof(long long))) __compiletime_assert_104(); } while (0); do { *(volatile typeof(next->pprev) *)&(next->pprev) = (pprev); } while (0); } while (0);
}
# 850 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void hlist_del(struct hlist_node *n)
{
 __hlist_del(n);
 n->next = ((void *) 0x100 + (0xdead000000000000UL));
 n->pprev = ((void *) 0x122 + (0xdead000000000000UL));
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void hlist_del_init(struct hlist_node *n)
{
 if (!hlist_unhashed(n)) {
  __hlist_del(n);
  INIT_HLIST_NODE(n);
 }
}
# 879 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void hlist_add_head(struct hlist_node *n, struct hlist_head *h)
{
 struct hlist_node *first = h->first;
 do { do { extern void __compiletime_assert_105(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(n->next) == sizeof(char) || sizeof(n->next) == sizeof(short) || sizeof(n->next) == sizeof(int) || sizeof(n->next) == sizeof(long)) || sizeof(n->next) == sizeof(long long))) __compiletime_assert_105(); } while (0); do { *(volatile typeof(n->next) *)&(n->next) = (first); } while (0); } while (0);
 if (first)
  do { do { extern void __compiletime_assert_106(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(first->pprev) == sizeof(char) || sizeof(first->pprev) == sizeof(short) || sizeof(first->pprev) == sizeof(int) || sizeof(first->pprev) == sizeof(long)) || sizeof(first->pprev) == sizeof(long long))) __compiletime_assert_106(); } while (0); do { *(volatile typeof(first->pprev) *)&(first->pprev) = (&n->next); } while (0); } while (0);
 do { do { extern void __compiletime_assert_107(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(h->first) == sizeof(char) || sizeof(h->first) == sizeof(short) || sizeof(h->first) == sizeof(int) || sizeof(h->first) == sizeof(long)) || sizeof(h->first) == sizeof(long long))) __compiletime_assert_107(); } while (0); do { *(volatile typeof(h->first) *)&(h->first) = (n); } while (0); } while (0);
 do { do { extern void __compiletime_assert_108(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(n->pprev) == sizeof(char) || sizeof(n->pprev) == sizeof(short) || sizeof(n->pprev) == sizeof(int) || sizeof(n->pprev) == sizeof(long)) || sizeof(n->pprev) == sizeof(long long))) __compiletime_assert_108(); } while (0); do { *(volatile typeof(n->pprev) *)&(n->pprev) = (&h->first); } while (0); } while (0);
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void hlist_add_before(struct hlist_node *n,
        struct hlist_node *next)
{
 do { do { extern void __compiletime_assert_109(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(n->pprev) == sizeof(char) || sizeof(n->pprev) == sizeof(short) || sizeof(n->pprev) == sizeof(int) || sizeof(n->pprev) == sizeof(long)) || sizeof(n->pprev) == sizeof(long long))) __compiletime_assert_109(); } while (0); do { *(volatile typeof(n->pprev) *)&(n->pprev) = (next->pprev); } while (0); } while (0);
 do { do { extern void __compiletime_assert_110(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(n->next) == sizeof(char) || sizeof(n->next) == sizeof(short) || sizeof(n->next) == sizeof(int) || sizeof(n->next) == sizeof(long)) || sizeof(n->next) == sizeof(long long))) __compiletime_assert_110(); } while (0); do { *(volatile typeof(n->next) *)&(n->next) = (next); } while (0); } while (0);
 do { do { extern void __compiletime_assert_111(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(next->pprev) == sizeof(char) || sizeof(next->pprev) == sizeof(short) || sizeof(next->pprev) == sizeof(int) || sizeof(next->pprev) == sizeof(long)) || sizeof(next->pprev) == sizeof(long long))) __compiletime_assert_111(); } while (0); do { *(volatile typeof(next->pprev) *)&(next->pprev) = (&n->next); } while (0); } while (0);
 do { do { extern void __compiletime_assert_112(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*(n->pprev)) == sizeof(char) || sizeof(*(n->pprev)) == sizeof(short) || sizeof(*(n->pprev)) == sizeof(int) || sizeof(*(n->pprev)) == sizeof(long)) || sizeof(*(n->pprev)) == sizeof(long long))) __compiletime_assert_112(); } while (0); do { *(volatile typeof(*(n->pprev)) *)&(*(n->pprev)) = (n); } while (0); } while (0);
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void hlist_add_behind(struct hlist_node *n,
        struct hlist_node *prev)
{
 do { do { extern void __compiletime_assert_113(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(n->next) == sizeof(char) || sizeof(n->next) == sizeof(short) || sizeof(n->next) == sizeof(int) || sizeof(n->next) == sizeof(long)) || sizeof(n->next) == sizeof(long long))) __compiletime_assert_113(); } while (0); do { *(volatile typeof(n->next) *)&(n->next) = (prev->next); } while (0); } while (0);
 do { do { extern void __compiletime_assert_114(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(prev->next) == sizeof(char) || sizeof(prev->next) == sizeof(short) || sizeof(prev->next) == sizeof(int) || sizeof(prev->next) == sizeof(long)) || sizeof(prev->next) == sizeof(long long))) __compiletime_assert_114(); } while (0); do { *(volatile typeof(prev->next) *)&(prev->next) = (n); } while (0); } while (0);
 do { do { extern void __compiletime_assert_115(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(n->pprev) == sizeof(char) || sizeof(n->pprev) == sizeof(short) || sizeof(n->pprev) == sizeof(int) || sizeof(n->pprev) == sizeof(long)) || sizeof(n->pprev) == sizeof(long long))) __compiletime_assert_115(); } while (0); do { *(volatile typeof(n->pprev) *)&(n->pprev) = (&prev->next); } while (0); } while (0);

 if (n->next)
  do { do { extern void __compiletime_assert_116(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(n->next->pprev) == sizeof(char) || sizeof(n->next->pprev) == sizeof(short) || sizeof(n->next->pprev) == sizeof(int) || sizeof(n->next->pprev) == sizeof(long)) || sizeof(n->next->pprev) == sizeof(long long))) __compiletime_assert_116(); } while (0); do { *(volatile typeof(n->next->pprev) *)&(n->next->pprev) = (&n->next); } while (0); } while (0);
}
# 927 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void hlist_add_fake(struct hlist_node *n)
{
 n->pprev = &n->next;
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool hlist_fake(struct hlist_node *h)
{
 return h->pprev == &h->next;
}
# 949 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool
hlist_is_singular_node(struct hlist_node *n, struct hlist_head *h)
{
 return !n->next && n->pprev == &h->first;
}
# 963 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/list.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void hlist_move_list(struct hlist_head *old,
       struct hlist_head *new)
{
 new->first = old->first;
 if (new->first)
  new->first->pprev = &new->first;
 old->first = ((void *)0);
}
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep.h" 1
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/smp.h" 1
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/smp.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/errno.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/errno.h" 1
# 1 "./arch/arm64/include/generated/uapi/asm/errno.h" 1
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/errno.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/errno-base.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/errno.h" 2
# 1 "./arch/arm64/include/generated/uapi/asm/errno.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/errno.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/errno.h" 2
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/smp.h" 2


# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/threads.h" 1
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitmap.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitmap.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/string.h" 1
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/string.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/string.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/string.h" 2

extern char *strndup_user(const char *, long);
extern void *memdup_user(const void *, size_t);
extern void *vmemdup_user(const void *, size_t);
extern void *memdup_user_nul(const void *, size_t);




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/string.h" 1
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/string.h"
extern char *strrchr(const char *, int c);


extern char *strchr(const char *, int c);


extern int strcmp(const char *, const char *);


extern int strncmp(const char *, const char *, __kernel_size_t);


extern __kernel_size_t strlen(const char *);


extern __kernel_size_t strnlen(const char *, __kernel_size_t);


extern int memcmp(const void *, const void *, size_t);


extern void *memchr(const void *, int, __kernel_size_t);



extern void *memcpy(void *, const void *, __kernel_size_t);
extern void *__memcpy(void *, const void *, __kernel_size_t);


extern void *memmove(void *, const void *, __kernel_size_t);
extern void *__memmove(void *, const void *, __kernel_size_t);


extern void *memset(void *, int, __kernel_size_t);
extern void *__memset(void *, int, __kernel_size_t);
# 21 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/string.h" 2


extern char * strcpy(char *,const char *);


extern char * strncpy(char *,const char *, __kernel_size_t);


size_t strlcpy(char *, const char *, size_t);


ssize_t strscpy(char *, const char *, size_t);



ssize_t strscpy_pad(char *dest, const char *src, size_t count);


extern char * strcat(char *, const char *);


extern char * strncat(char *, const char *, __kernel_size_t);


extern size_t strlcat(char *, const char *, __kernel_size_t);
# 54 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/string.h"
extern int strcasecmp(const char *s1, const char *s2);


extern int strncasecmp(const char *s1, const char *s2, size_t n);





extern char * strchrnul(const char *,int);

extern char * strnchrnul(const char *, size_t, int);

extern char * strnchr(const char *, size_t, int);




extern char * __attribute__((__warn_unused_result__)) skip_spaces(const char *);

extern char *strim(char *);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__warn_unused_result__)) char *strstrip(char *str)
{
 return strim(str);
}


extern char * strstr(const char *, const char *);


extern char * strnstr(const char *, const char *, size_t);
# 94 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/string.h"
extern char * strpbrk(const char *,const char *);


extern char * strsep(char **,const char *);


extern __kernel_size_t strspn(const char *,const char *);


extern __kernel_size_t strcspn(const char *,const char *);







extern void *memset16(uint16_t *, uint16_t, __kernel_size_t);



extern void *memset32(uint32_t *, uint32_t, __kernel_size_t);



extern void *memset64(uint64_t *, uint64_t, __kernel_size_t);


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void *memset_l(unsigned long *p, unsigned long v,
  __kernel_size_t n)
{
 if (64 == 32)
  return memset32((uint32_t *)p, v, n);
 else
  return memset64((uint64_t *)p, v, n);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void *memset_p(void **p, void *v, __kernel_size_t n)
{
 if (64 == 32)
  return memset32((uint32_t *)p, (uintptr_t)v, n);
 else
  return memset64((uint64_t *)p, (uintptr_t)v, n);
}

extern void **__memcat_p(void **a, void **b);
# 153 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/string.h"
extern void * memscan(void *,int,__kernel_size_t);





extern int bcmp(const void *,const void *,__kernel_size_t);





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void memcpy_flushcache(void *dst, const void *src, size_t cnt)
{
 memcpy(dst, src, cnt);
}


void *memchr_inv(const void *s, int c, size_t n);
char *strreplace(char *s, char old, char new);

extern void kfree_const(const void *x);

extern char *kstrdup(const char *s, gfp_t gfp) __attribute__((__malloc__));
extern const char *kstrdup_const(const char *s, gfp_t gfp);
extern char *kstrndup(const char *s, size_t len, gfp_t gfp);
extern void *kmemdup(const void *src, size_t len, gfp_t gfp);
extern char *kmemdup_nul(const char *s, size_t len, gfp_t gfp);

extern char **argv_split(gfp_t gfp, const char *str, int *argcp);
extern void argv_free(char **argv);

extern bool sysfs_streq(const char *s1, const char *s2);
extern int kstrtobool(const char *s, bool *res);
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int strtobool(const char *s, bool *res)
{
 return kstrtobool(s, res);
}

int match_string(const char * const *array, size_t n, const char *string);
int __sysfs_match_string(const char * const *array, size_t n, const char *s);
# 205 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/string.h"
int vbin_printf(u32 *bin_buf, size_t size, const char *fmt, va_list args);
int bstr_printf(char *buf, size_t size, const char *fmt, const u32 *bin_buf);
int bprintf(u32 *bin_buf, size_t size, const char *fmt, ...) __attribute__((__format__(printf, 3, 4)));


extern ssize_t memory_read_from_buffer(void *to, size_t count, loff_t *ppos,
           const void *from, size_t available);

int ptr_to_hashval(const void *ptr, unsigned long *hashval_out);






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool strstarts(const char *str, const char *prefix)
{
 return strncmp(str, prefix, strlen(prefix)) == 0;
}

size_t memweight(const void *ptr, size_t bytes);
# 241 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/string.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void memzero_explicit(void *s, size_t count)
{
 memset(s, 0, count);
 __asm__ __volatile__("": :"r"(s) :"memory");
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) const char *kbasename(const char *path)
{
 const char *tail = strrchr(path, '/');
 return tail ? tail + 1 : path;
}




void fortify_panic(const char *name) __attribute__((__noreturn__)) __attribute__((__cold__));
void __read_overflow(void) __attribute__((__error__("detected read beyond size of object passed as 1st parameter")));
void __read_overflow2(void) __attribute__((__error__("detected read beyond size of object passed as 2nd parameter")));
void __read_overflow3(void) __attribute__((__error__("detected read beyond size of object passed as 3rd parameter")));
void __write_overflow(void) __attribute__((__error__("detected write beyond size of object passed as 1st parameter")));
# 293 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/string.h"
extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) char *strncpy(char *p, const char *q, __kernel_size_t size)
{
 size_t p_size = __builtin_object_size(p, 0);
 if (__builtin_constant_p(size) && p_size < size)
  __write_overflow();
 if (p_size < size)
  fortify_panic(__func__);
 return __builtin_strncpy(p, q, size);
}

extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) char *strcat(char *p, const char *q)
{
 size_t p_size = __builtin_object_size(p, 0);
 if (p_size == (size_t)-1)
  return __builtin_strcat(p, q);
 if (strlcat(p, q, p_size) >= p_size)
  fortify_panic(__func__);
 return p;
}

extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) __kernel_size_t strlen(const char *p)
{
 __kernel_size_t ret;
 size_t p_size = __builtin_object_size(p, 0);


 if (p_size == (size_t)-1 ||
     (__builtin_constant_p(p[p_size - 1]) && p[p_size - 1] == '\0'))
  return __builtin_strlen(p);
 ret = strnlen(p, p_size);
 if (p_size <= ret)
  fortify_panic(__func__);
 return ret;
}

extern __kernel_size_t __real_strnlen(const char *, __kernel_size_t) __asm__("strnlen");
extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) __kernel_size_t strnlen(const char *p, __kernel_size_t maxlen)
{
 size_t p_size = __builtin_object_size(p, 0);
 __kernel_size_t ret = __real_strnlen(p, maxlen < p_size ? maxlen : p_size);
 if (p_size <= ret && maxlen != ret)
  fortify_panic(__func__);
 return ret;
}


extern size_t __real_strlcpy(char *, const char *, size_t) __asm__("strlcpy");
extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) size_t strlcpy(char *p, const char *q, size_t size)
{
 size_t ret;
 size_t p_size = __builtin_object_size(p, 0);
 size_t q_size = __builtin_object_size(q, 0);
 if (p_size == (size_t)-1 && q_size == (size_t)-1)
  return __real_strlcpy(p, q, size);
 ret = strlen(q);
 if (size) {
  size_t len = (ret >= size) ? size - 1 : ret;
  if (__builtin_constant_p(len) && len >= p_size)
   __write_overflow();
  if (len >= p_size)
   fortify_panic(__func__);
  __builtin_memcpy(p, q, len);
  p[len] = '\0';
 }
 return ret;
}


extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) char *strncat(char *p, const char *q, __kernel_size_t count)
{
 size_t p_len, copy_len;
 size_t p_size = __builtin_object_size(p, 0);
 size_t q_size = __builtin_object_size(q, 0);
 if (p_size == (size_t)-1 && q_size == (size_t)-1)
  return __builtin_strncat(p, q, count);
 p_len = strlen(p);
 copy_len = strnlen(q, count);
 if (p_size < p_len + copy_len + 1)
  fortify_panic(__func__);
 __builtin_memcpy(p + p_len, q, copy_len);
 p[p_len + copy_len] = '\0';
 return p;
}

extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) void *memset(void *p, int c, __kernel_size_t size)
{
 size_t p_size = __builtin_object_size(p, 0);
 if (__builtin_constant_p(size) && p_size < size)
  __write_overflow();
 if (p_size < size)
  fortify_panic(__func__);
 return __builtin_memset(p, c, size);
}

extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) void *memcpy(void *p, const void *q, __kernel_size_t size)
{
 size_t p_size = __builtin_object_size(p, 0);
 size_t q_size = __builtin_object_size(q, 0);
 if (__builtin_constant_p(size)) {
  if (p_size < size)
   __write_overflow();
  if (q_size < size)
   __read_overflow2();
 }
 if (p_size < size || q_size < size)
  fortify_panic(__func__);
 return __builtin_memcpy(p, q, size);
}

extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) void *memmove(void *p, const void *q, __kernel_size_t size)
{
 size_t p_size = __builtin_object_size(p, 0);
 size_t q_size = __builtin_object_size(q, 0);
 if (__builtin_constant_p(size)) {
  if (p_size < size)
   __write_overflow();
  if (q_size < size)
   __read_overflow2();
 }
 if (p_size < size || q_size < size)
  fortify_panic(__func__);
 return __builtin_memmove(p, q, size);
}

extern void *__real_memscan(void *, int, __kernel_size_t) __asm__("memscan");
extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) void *memscan(void *p, int c, __kernel_size_t size)
{
 size_t p_size = __builtin_object_size(p, 0);
 if (__builtin_constant_p(size) && p_size < size)
  __read_overflow();
 if (p_size < size)
  fortify_panic(__func__);
 return __real_memscan(p, c, size);
}

extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) int memcmp(const void *p, const void *q, __kernel_size_t size)
{
 size_t p_size = __builtin_object_size(p, 0);
 size_t q_size = __builtin_object_size(q, 0);
 if (__builtin_constant_p(size)) {
  if (p_size < size)
   __read_overflow();
  if (q_size < size)
   __read_overflow2();
 }
 if (p_size < size || q_size < size)
  fortify_panic(__func__);
 return __builtin_memcmp(p, q, size);
}

extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) void *memchr(const void *p, int c, __kernel_size_t size)
{
 size_t p_size = __builtin_object_size(p, 0);
 if (__builtin_constant_p(size) && p_size < size)
  __read_overflow();
 if (p_size < size)
  fortify_panic(__func__);
 return __builtin_memchr(p, c, size);
}

void *__real_memchr_inv(const void *s, int c, size_t n) __asm__("memchr_inv");
extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) void *memchr_inv(const void *p, int c, size_t size)
{
 size_t p_size = __builtin_object_size(p, 0);
 if (__builtin_constant_p(size) && p_size < size)
  __read_overflow();
 if (p_size < size)
  fortify_panic(__func__);
 return __real_memchr_inv(p, c, size);
}

extern void *__real_kmemdup(const void *src, size_t len, gfp_t gfp) __asm__("kmemdup");
extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) void *kmemdup(const void *p, size_t size, gfp_t gfp)
{
 size_t p_size = __builtin_object_size(p, 0);
 if (__builtin_constant_p(size) && p_size < size)
  __read_overflow();
 if (p_size < size)
  fortify_panic(__func__);
 return __real_kmemdup(p, size, gfp);
}


extern inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((gnu_inline)) char *strcpy(char *p, const char *q)
{
 size_t p_size = __builtin_object_size(p, 0);
 size_t q_size = __builtin_object_size(q, 0);
 if (p_size == (size_t)-1 && q_size == (size_t)-1)
  return __builtin_strcpy(p, q);
 memcpy(p, q, strlen(q) + 1);
 return p;
}
# 507 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/string.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void memcpy_and_pad(void *dest, size_t dest_len,
      const void *src, size_t count, int pad)
{
 if (dest_len > count) {
  memcpy(dest, src, count);
  memset(dest + count, pad, dest_len - count);
 } else
  memcpy(dest, src, dest_len);
}
# 532 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/string.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) size_t str_has_prefix(const char *str, const char *prefix)
{
 size_t len = strlen(prefix);
 return strncmp(str, prefix, len) == 0 ? len : 0;
}
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitmap.h" 2
# 121 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitmap.h"
extern unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
extern unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
extern void bitmap_free(const unsigned long *bitmap);





extern int __bitmap_empty(const unsigned long *bitmap, unsigned int nbits);
extern int __bitmap_full(const unsigned long *bitmap, unsigned int nbits);
extern int __bitmap_equal(const unsigned long *bitmap1,
     const unsigned long *bitmap2, unsigned int nbits);
extern bool __attribute__((__pure__)) __bitmap_or_equal(const unsigned long *src1,
         const unsigned long *src2,
         const unsigned long *src3,
         unsigned int nbits);
extern void __bitmap_complement(unsigned long *dst, const unsigned long *src,
   unsigned int nbits);
extern void __bitmap_shift_right(unsigned long *dst, const unsigned long *src,
    unsigned int shift, unsigned int nbits);
extern void __bitmap_shift_left(unsigned long *dst, const unsigned long *src,
    unsigned int shift, unsigned int nbits);
extern void bitmap_cut(unsigned long *dst, const unsigned long *src,
         unsigned int first, unsigned int cut,
         unsigned int nbits);
extern int __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern int __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern void __bitmap_replace(unsigned long *dst,
   const unsigned long *old, const unsigned long *new,
   const unsigned long *mask, unsigned int nbits);
extern int __bitmap_intersects(const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern int __bitmap_subset(const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern int __bitmap_weight(const unsigned long *bitmap, unsigned int nbits);
extern void __bitmap_set(unsigned long *map, unsigned int start, int len);
extern void __bitmap_clear(unsigned long *map, unsigned int start, int len);

extern unsigned long bitmap_find_next_zero_area_off(unsigned long *map,
          unsigned long size,
          unsigned long start,
          unsigned int nr,
          unsigned long align_mask,
          unsigned long align_offset);
# 184 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitmap.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long
bitmap_find_next_zero_area(unsigned long *map,
      unsigned long size,
      unsigned long start,
      unsigned int nr,
      unsigned long align_mask)
{
 return bitmap_find_next_zero_area_off(map, size, start, nr,
           align_mask, 0);
}

extern int bitmap_parse(const char *buf, unsigned int buflen,
   unsigned long *dst, int nbits);
extern int bitmap_parse_user(const char *ubuf, unsigned int ulen,
   unsigned long *dst, int nbits);
extern int bitmap_parselist(const char *buf, unsigned long *maskp,
   int nmaskbits);
extern int bitmap_parselist_user(const char *ubuf, unsigned int ulen,
   unsigned long *dst, int nbits);
extern void bitmap_remap(unsigned long *dst, const unsigned long *src,
  const unsigned long *old, const unsigned long *new, unsigned int nbits);
extern int bitmap_bitremap(int oldbit,
  const unsigned long *old, const unsigned long *new, int bits);
extern void bitmap_onto(unsigned long *dst, const unsigned long *orig,
  const unsigned long *relmap, unsigned int bits);
extern void bitmap_fold(unsigned long *dst, const unsigned long *orig,
  unsigned int sz, unsigned int nbits);
extern int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, int order);
extern void bitmap_release_region(unsigned long *bitmap, unsigned int pos, int order);
extern int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos, int order);






extern unsigned int bitmap_ord_to_pos(const unsigned long *bitmap, unsigned int ord, unsigned int nbits);
extern int bitmap_print_to_pagebuf(bool list, char *buf,
       const unsigned long *maskp, int nmaskbits);
# 235 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitmap.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_zero(unsigned long *dst, unsigned int nbits)
{
 unsigned int len = (((nbits) + ((sizeof(long) * 8)) - 1) / ((sizeof(long) * 8))) * sizeof(unsigned long);
 memset(dst, 0, len);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_fill(unsigned long *dst, unsigned int nbits)
{
 unsigned int len = (((nbits) + ((sizeof(long) * 8)) - 1) / ((sizeof(long) * 8))) * sizeof(unsigned long);
 memset(dst, 0xff, len);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_copy(unsigned long *dst, const unsigned long *src,
   unsigned int nbits)
{
 unsigned int len = (((nbits) + ((sizeof(long) * 8)) - 1) / ((sizeof(long) * 8))) * sizeof(unsigned long);
 memcpy(dst, src, len);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_copy_clear_tail(unsigned long *dst,
  const unsigned long *src, unsigned int nbits)
{
 bitmap_copy(dst, src, nbits);
 if (nbits % 64)
  dst[nbits / 64] &= (~0UL >> (-(nbits) & (64 - 1)));
}






extern void bitmap_from_arr32(unsigned long *bitmap, const u32 *buf,
       unsigned int nbits);
extern void bitmap_to_arr32(u32 *buf, const unsigned long *bitmap,
       unsigned int nbits);
# 283 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitmap.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int bitmap_and(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  return (*dst = *src1 & *src2 & (~0UL >> (-(nbits) & (64 - 1)))) != 0;
 return __bitmap_and(dst, src1, src2, nbits);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_or(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  *dst = *src1 | *src2;
 else
  __bitmap_or(dst, src1, src2, nbits);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_xor(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  *dst = *src1 ^ *src2;
 else
  __bitmap_xor(dst, src1, src2, nbits);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int bitmap_andnot(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  return (*dst = *src1 & ~(*src2) & (~0UL >> (-(nbits) & (64 - 1)))) != 0;
 return __bitmap_andnot(dst, src1, src2, nbits);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_complement(unsigned long *dst, const unsigned long *src,
   unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  *dst = ~(*src);
 else
  __bitmap_complement(dst, src, nbits);
}
# 333 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitmap.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int bitmap_equal(const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  return !((*src1 ^ *src2) & (~0UL >> (-(nbits) & (64 - 1))));
 if (__builtin_constant_p(nbits & (8 - 1)) &&
     (((nbits) & ((typeof(nbits))(8) - 1)) == 0))
  return !memcmp(src1, src2, nbits / 8);
 return __bitmap_equal(src1, src2, nbits);
}
# 353 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitmap.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool bitmap_or_equal(const unsigned long *src1,
       const unsigned long *src2,
       const unsigned long *src3,
       unsigned int nbits)
{
 if (!(__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  return __bitmap_or_equal(src1, src2, src3, nbits);

 return !(((*src1 | *src2) ^ *src3) & (~0UL >> (-(nbits) & (64 - 1))));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int bitmap_intersects(const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  return ((*src1 & *src2) & (~0UL >> (-(nbits) & (64 - 1)))) != 0;
 else
  return __bitmap_intersects(src1, src2, nbits);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int bitmap_subset(const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  return ! ((*src1 & ~(*src2)) & (~0UL >> (-(nbits) & (64 - 1))));
 else
  return __bitmap_subset(src1, src2, nbits);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int bitmap_empty(const unsigned long *src, unsigned nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  return ! (*src & (~0UL >> (-(nbits) & (64 - 1))));

 return find_next_bit((src), (nbits), 0) == nbits;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int bitmap_full(const unsigned long *src, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  return ! (~(*src) & (~0UL >> (-(nbits) & (64 - 1))));

 return find_next_zero_bit((src), (nbits), 0) == nbits;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int bitmap_weight(const unsigned long *src, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  return hweight_long(*src & (~0UL >> (-(nbits) & (64 - 1))));
 return __bitmap_weight(src, nbits);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void bitmap_set(unsigned long *map, unsigned int start,
  unsigned int nbits)
{
 if (__builtin_constant_p(nbits) && nbits == 1)
  __set_bit(start, map);
 else if (__builtin_constant_p(start & (8 - 1)) &&
   (((start) & ((typeof(start))(8) - 1)) == 0) &&
   __builtin_constant_p(nbits & (8 - 1)) &&
   (((nbits) & ((typeof(nbits))(8) - 1)) == 0))
  memset((char *)map + start / 8, 0xff, nbits / 8);
 else
  __bitmap_set(map, start, nbits);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void bitmap_clear(unsigned long *map, unsigned int start,
  unsigned int nbits)
{
 if (__builtin_constant_p(nbits) && nbits == 1)
  __clear_bit(start, map);
 else if (__builtin_constant_p(start & (8 - 1)) &&
   (((start) & ((typeof(start))(8) - 1)) == 0) &&
   __builtin_constant_p(nbits & (8 - 1)) &&
   (((nbits) & ((typeof(nbits))(8) - 1)) == 0))
  memset((char *)map + start / 8, 0, nbits / 8);
 else
  __bitmap_clear(map, start, nbits);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_shift_right(unsigned long *dst, const unsigned long *src,
    unsigned int shift, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  *dst = (*src & (~0UL >> (-(nbits) & (64 - 1)))) >> shift;
 else
  __bitmap_shift_right(dst, src, shift, nbits);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_shift_left(unsigned long *dst, const unsigned long *src,
    unsigned int shift, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  *dst = (*src << shift) & (~0UL >> (-(nbits) & (64 - 1)));
 else
  __bitmap_shift_left(dst, src, shift, nbits);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_replace(unsigned long *dst,
      const unsigned long *old,
      const unsigned long *new,
      const unsigned long *mask,
      unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64 && (nbits) > 0))
  *dst = (*old & ~(*mask)) | (*new & *mask);
 else
  __bitmap_replace(dst, old, new, mask, nbits);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_next_clear_region(unsigned long *bitmap,
         unsigned int *rs, unsigned int *re,
         unsigned int end)
{
 *rs = find_next_zero_bit(bitmap, end, *rs);
 *re = find_next_bit(bitmap, end, *rs + 1);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_next_set_region(unsigned long *bitmap,
       unsigned int *rs, unsigned int *re,
       unsigned int end)
{
 *rs = find_next_bit(bitmap, end, *rs);
 *re = find_next_zero_bit(bitmap, end, *rs + 1);
}
# 541 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitmap.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_from_u64(unsigned long *dst, u64 mask)
{
 dst[0] = mask & (~0UL);

 if (sizeof(mask) > sizeof(unsigned long))
  dst[1] = mask >> 32;
}
# 557 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bitmap.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long bitmap_get_value8(const unsigned long *map,
           unsigned long start)
{
 const size_t index = ((start) / 64);
 const unsigned long offset = start % 64;

 return (map[index] >> offset) & 0xFF;
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void bitmap_set_value8(unsigned long *map, unsigned long value,
         unsigned long start)
{
 const size_t index = ((start) / 64);
 const unsigned long offset = start % 64;

 map[index] &= ~(0xFFUL << offset);
 map[index] |= value << offset;
}
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h" 2




typedef struct cpumask { unsigned long bits[(((256) + ((sizeof(long) * 8)) - 1) / ((sizeof(long) * 8)))]; } cpumask_t;
# 39 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
extern unsigned int nr_cpu_ids;
# 90 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
extern struct cpumask __cpu_possible_mask;
extern struct cpumask __cpu_online_mask;
extern struct cpumask __cpu_present_mask;
extern struct cpumask __cpu_active_mask;





extern atomic_t __num_online_cpus;
# 110 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int num_online_cpus(void)
{
 return atomic_read(&__num_online_cpus);
}
# 132 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
extern cpumask_t cpus_booted_once_mask;

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpu_max_bits_warn(unsigned int cpu, unsigned int bits)
{



}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int cpumask_check(unsigned int cpu)
{
 cpu_max_bits_warn(cpu, ((unsigned int)256));
 return cpu;
}
# 217 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int cpumask_first(const struct cpumask *srcp)
{
 return find_next_bit((((srcp)->bits)), (((unsigned int)256)), 0);
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int cpumask_last(const struct cpumask *srcp)
{
 return find_last_bit(((srcp)->bits), ((unsigned int)256));
}

unsigned int cpumask_next(int n, const struct cpumask *srcp);
# 242 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int cpumask_next_zero(int n, const struct cpumask *srcp)
{

 if (n != -1)
  cpumask_check(n);
 return find_next_zero_bit(((srcp)->bits), ((unsigned int)256), n+1);
}

int cpumask_next_and(int n, const struct cpumask *, const struct cpumask *);
int cpumask_any_but(const struct cpumask *mask, unsigned int cpu);
unsigned int cpumask_local_spread(unsigned int i, int node);
int cpumask_any_and_distribute(const struct cpumask *src1p,
          const struct cpumask *src2p);
# 280 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
extern int cpumask_next_wrap(int n, const struct cpumask *mask, int start, bool wrap);
# 332 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
{
 set_bit(cpumask_check(cpu), ((dstp)->bits));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
{
 __set_bit(cpumask_check(cpu), ((dstp)->bits));
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpumask_clear_cpu(int cpu, struct cpumask *dstp)
{
 clear_bit(cpumask_check(cpu), ((dstp)->bits));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __cpumask_clear_cpu(int cpu, struct cpumask *dstp)
{
 __clear_bit(cpumask_check(cpu), ((dstp)->bits));
}
# 365 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
{
 return test_bit(cpumask_check(cpu), (((cpumask))->bits));
}
# 379 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int cpumask_test_and_set_cpu(int cpu, struct cpumask *cpumask)
{
 return test_and_set_bit(cpumask_check(cpu), ((cpumask)->bits));
}
# 393 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int cpumask_test_and_clear_cpu(int cpu, struct cpumask *cpumask)
{
 return test_and_clear_bit(cpumask_check(cpu), ((cpumask)->bits));
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpumask_setall(struct cpumask *dstp)
{
 bitmap_fill(((dstp)->bits), ((unsigned int)256));
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpumask_clear(struct cpumask *dstp)
{
 bitmap_zero(((dstp)->bits), ((unsigned int)256));
}
# 424 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int cpumask_and(struct cpumask *dstp,
          const struct cpumask *src1p,
          const struct cpumask *src2p)
{
 return bitmap_and(((dstp)->bits), ((src1p)->bits),
           ((src2p)->bits), ((unsigned int)256));
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpumask_or(struct cpumask *dstp, const struct cpumask *src1p,
         const struct cpumask *src2p)
{
 bitmap_or(((dstp)->bits), ((src1p)->bits),
          ((src2p)->bits), ((unsigned int)256));
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpumask_xor(struct cpumask *dstp,
          const struct cpumask *src1p,
          const struct cpumask *src2p)
{
 bitmap_xor(((dstp)->bits), ((src1p)->bits),
           ((src2p)->bits), ((unsigned int)256));
}
# 467 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int cpumask_andnot(struct cpumask *dstp,
      const struct cpumask *src1p,
      const struct cpumask *src2p)
{
 return bitmap_andnot(((dstp)->bits), ((src1p)->bits),
       ((src2p)->bits), ((unsigned int)256));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpumask_complement(struct cpumask *dstp,
          const struct cpumask *srcp)
{
 bitmap_complement(((dstp)->bits), ((srcp)->bits),
           ((unsigned int)256));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool cpumask_equal(const struct cpumask *src1p,
    const struct cpumask *src2p)
{
 return bitmap_equal(((src1p)->bits), ((src2p)->bits),
       ((unsigned int)256));
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool cpumask_or_equal(const struct cpumask *src1p,
        const struct cpumask *src2p,
        const struct cpumask *src3p)
{
 return bitmap_or_equal(((src1p)->bits), ((src2p)->bits),
          ((src3p)->bits), ((unsigned int)256));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool cpumask_intersects(const struct cpumask *src1p,
         const struct cpumask *src2p)
{
 return bitmap_intersects(((src1p)->bits), ((src2p)->bits),
            ((unsigned int)256));
}
# 532 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int cpumask_subset(const struct cpumask *src1p,
     const struct cpumask *src2p)
{
 return bitmap_subset(((src1p)->bits), ((src2p)->bits),
        ((unsigned int)256));
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool cpumask_empty(const struct cpumask *srcp)
{
 return bitmap_empty(((srcp)->bits), ((unsigned int)256));
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool cpumask_full(const struct cpumask *srcp)
{
 return bitmap_full(((srcp)->bits), ((unsigned int)256));
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int cpumask_weight(const struct cpumask *srcp)
{
 return bitmap_weight(((srcp)->bits), ((unsigned int)256));
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpumask_shift_right(struct cpumask *dstp,
           const struct cpumask *srcp, int n)
{
 bitmap_shift_right(((dstp)->bits), ((srcp)->bits), n,
            ((unsigned int)256));
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpumask_shift_left(struct cpumask *dstp,
          const struct cpumask *srcp, int n)
{
 bitmap_shift_left(((dstp)->bits), ((srcp)->bits), n,
           ((unsigned int)256));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpumask_copy(struct cpumask *dstp,
    const struct cpumask *srcp)
{
 bitmap_copy(((dstp)->bits), ((srcp)->bits), ((unsigned int)256));
}
# 643 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int cpumask_parse_user(const char *buf, int len,
         struct cpumask *dstp)
{
 return bitmap_parse_user(buf, len, ((dstp)->bits), ((unsigned int)256));
}
# 657 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int cpumask_parselist_user(const char *buf, int len,
         struct cpumask *dstp)
{
 return bitmap_parselist_user(buf, len, ((dstp)->bits),
         ((unsigned int)256));
}
# 671 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int cpumask_parse(const char *buf, struct cpumask *dstp)
{
 return bitmap_parse(buf, (~0U), ((dstp)->bits), ((unsigned int)256));
}
# 683 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int cpulist_parse(const char *buf, struct cpumask *dstp)
{
 return bitmap_parselist(buf, ((dstp)->bits), ((unsigned int)256));
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int cpumask_size(void)
{
 return (((((unsigned int)256)) + ((sizeof(long) * 8)) - 1) / ((sizeof(long) * 8))) * sizeof(long);
}
# 756 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
typedef struct cpumask cpumask_var_t[1];




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool alloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
{
 return true;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool alloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags,
       int node)
{
 return true;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool zalloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
{
 cpumask_clear(*mask);
 return true;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool zalloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags,
       int node)
{
 cpumask_clear(*mask);
 return true;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void alloc_bootmem_cpumask_var(cpumask_var_t *mask)
{
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void free_cpumask_var(cpumask_var_t mask)
{
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void free_bootmem_cpumask_var(cpumask_var_t mask)
{
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool cpumask_available(cpumask_var_t mask)
{
 return true;
}




extern const unsigned long cpu_all_bits[(((256) + ((sizeof(long) * 8)) - 1) / ((sizeof(long) * 8)))];
# 816 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
void init_cpu_present(const struct cpumask *src);
void init_cpu_possible(const struct cpumask *src);
void init_cpu_online(const struct cpumask *src);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void reset_cpu_possible_mask(void)
{
 bitmap_zero(((&__cpu_possible_mask)->bits), 256);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void
set_cpu_possible(unsigned int cpu, bool possible)
{
 if (possible)
  cpumask_set_cpu(cpu, &__cpu_possible_mask);
 else
  cpumask_clear_cpu(cpu, &__cpu_possible_mask);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void
set_cpu_present(unsigned int cpu, bool present)
{
 if (present)
  cpumask_set_cpu(cpu, &__cpu_present_mask);
 else
  cpumask_clear_cpu(cpu, &__cpu_present_mask);
}

void set_cpu_online(unsigned int cpu, bool online);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void
set_cpu_active(unsigned int cpu, bool active)
{
 if (active)
  cpumask_set_cpu(cpu, &__cpu_active_mask);
 else
  cpumask_clear_cpu(cpu, &__cpu_active_mask);
}
# 869 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __check_is_bitmap(const unsigned long *bitmap)
{
 return 1;
}
# 881 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
extern const unsigned long
 cpu_bit_bitmap[64 +1][(((256) + ((sizeof(long) * 8)) - 1) / ((sizeof(long) * 8)))];

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) const struct cpumask *get_cpu_mask(unsigned int cpu)
{
 const unsigned long *p = cpu_bit_bitmap[1 + cpu % 64];
 p -= cpu / 64;
 return ((struct cpumask *)(1 ? (p) : (void *)sizeof(__check_is_bitmap(p))));
}
# 918 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/cpumask.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) ssize_t
cpumap_print_to_pagebuf(bool list, char *buf, const struct cpumask *mask)
{
 return bitmap_print_to_pagebuf(list, buf, ((mask)->bits),
          nr_cpu_ids);
}
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/smp.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/smp_types.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/llist.h" 1
# 54 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/llist.h"
struct llist_head {
 struct llist_node *first;
};

struct llist_node {
 struct llist_node *next;
};
# 69 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/llist.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void init_llist_head(struct llist_head *list)
{
 list->first = ((void *)0);
}
# 187 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/llist.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool llist_empty(const struct llist_head *head)
{
 return ({ do { extern void __compiletime_assert_117(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(head->first) == sizeof(char) || sizeof(head->first) == sizeof(short) || sizeof(head->first) == sizeof(int) || sizeof(head->first) == sizeof(long)) || sizeof(head->first) == sizeof(long long))) __compiletime_assert_117(); } while (0); (*(const volatile typeof( _Generic((head->first), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (head->first))) *)&(head->first)); }) == ((void *)0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) struct llist_node *llist_next(struct llist_node *node)
{
 return node->next;
}

extern bool llist_add_batch(struct llist_node *new_first,
       struct llist_node *new_last,
       struct llist_head *head);







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool llist_add(struct llist_node *new, struct llist_head *head)
{
 return llist_add_batch(new, new, head);
}
# 220 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/llist.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) struct llist_node *llist_del_all(struct llist_head *head)
{
 return ({ typeof(&head->first) __ai_ptr = (&head->first); instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); ({ __typeof__(*(__ai_ptr)) __ret; __ret = (__typeof__(*(__ai_ptr))) __xchg_mb((unsigned long)(((void *)0)), (__ai_ptr), sizeof(*(__ai_ptr))); __ret; }); });
}

extern struct llist_node *llist_del_first(struct llist_head *head);

struct llist_node *llist_reverse_order(struct llist_node *head);
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/smp_types.h" 2

enum {
 CSD_FLAG_LOCK = 0x01,

 IRQ_WORK_PENDING = 0x01,
 IRQ_WORK_BUSY = 0x02,
 IRQ_WORK_LAZY = 0x04,
 IRQ_WORK_HARD_IRQ = 0x08,

 IRQ_WORK_CLAIMED = (IRQ_WORK_PENDING | IRQ_WORK_BUSY),

 CSD_TYPE_ASYNC = 0x00,
 CSD_TYPE_SYNC = 0x10,
 CSD_TYPE_IRQ_WORK = 0x20,
 CSD_TYPE_TTWU = 0x30,

 CSD_FLAG_TYPE_MASK = 0xF0,
};
# 58 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/smp_types.h"
struct __call_single_node {
 struct llist_node llist;
 union {
  unsigned int u_flags;
  atomic_t a_flags;
 };

 u16 src, dst;

};
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/smp.h" 2

typedef void (*smp_call_func_t)(void *info);
typedef bool (*smp_cond_func_t)(int cpu, void *info);




struct __call_single_data {
 union {
  struct __call_single_node node;
  struct {
   struct llist_node llist;
   unsigned int flags;

   u16 src, dst;

  };
 };
 smp_call_func_t func;
 void *info;
};


typedef struct __call_single_data call_single_data_t
 __attribute__((__aligned__(sizeof(struct __call_single_data))));





extern void __smp_call_single_queue(int cpu, struct llist_node *node);


extern unsigned int total_cpus;

int smp_call_function_single(int cpuid, smp_call_func_t func, void *info,
        int wait);




void on_each_cpu(smp_call_func_t func, void *info, int wait);





void on_each_cpu_mask(const struct cpumask *mask, smp_call_func_t func,
  void *info, bool wait);






void on_each_cpu_cond(smp_cond_func_t cond_func, smp_call_func_t func,
        void *info, bool wait);

void on_each_cpu_cond_mask(smp_cond_func_t cond_func, smp_call_func_t func,
      void *info, bool wait, const struct cpumask *mask);

int smp_call_function_single_async(int cpu, struct __call_single_data *csd);



# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/preempt.h" 1
# 78 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/preempt.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/preempt.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/thread_info.h" 1
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/thread_info.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/restart_block.h" 1
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/restart_block.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/time64.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/math64.h" 1





# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/vdso/math64.h" 1




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) u32
__iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
{
 u32 ret = 0;

 while (dividend >= divisor) {


  asm("" : "+rm"(dividend));

  dividend -= divisor;
  ret++;
 }

 *remainder = dividend;

 return ret;
}
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/math64.h" 2
# 1 "./arch/arm64/include/generated/asm/div64.h" 1
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/math64.h" 2
# 25 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/math64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 div_u64_rem(u64 dividend, u32 divisor, u32 *remainder)
{
 *remainder = dividend % divisor;
 return dividend / divisor;
}
# 39 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/math64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 div_s64_rem(s64 dividend, s32 divisor, s32 *remainder)
{
 *remainder = dividend % divisor;
 return dividend / divisor;
}
# 53 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/math64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
{
 *remainder = dividend % divisor;
 return dividend / divisor;
}
# 66 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/math64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 div64_u64(u64 dividend, u64 divisor)
{
 return dividend / divisor;
}
# 78 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/math64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 div64_s64(s64 dividend, s64 divisor)
{
 return dividend / divisor;
}
# 124 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/math64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 div_u64(u64 dividend, u32 divisor)
{
 u32 remainder;
 return div_u64_rem(dividend, divisor, &remainder);
}
# 137 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/math64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 div_s64(s64 dividend, s32 divisor)
{
 s32 remainder;
 return div_s64_rem(dividend, divisor, &remainder);
}


u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder);





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 mul_u32_u32(u32 a, u32 b)
{
 return (u64)a * b;
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 mul_u64_u32_shr(u64 a, u32 mul, unsigned int shift)
{
 return (u64)(((unsigned __int128)a * mul) >> shift);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 mul_u64_u64_shr(u64 a, u64 mul, unsigned int shift)
{
 return (u64)(((unsigned __int128)a * mul) >> shift);
}
# 238 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/math64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 mul_u64_u32_div(u64 a, u32 mul, u32 divisor)
{
 union {
  u64 ll;
  struct {



   u32 low, high;

  } l;
 } u, rl, rh;

 u.ll = a;
 rl.ll = mul_u32_u32(u.l.low, mul);
 rh.ll = mul_u32_u32(u.l.high, mul) + rl.l.high;


 rl.l.high = ({ uint32_t __base = (divisor); uint32_t __rem; __rem = ((uint64_t)(rh.ll)) % __base; (rh.ll) = ((uint64_t)(rh.ll)) / __base; __rem; });


 ({ uint32_t __base = (divisor); uint32_t __rem; __rem = ((uint64_t)(rl.ll)) % __base; (rl.ll) = ((uint64_t)(rl.ll)) / __base; __rem; });

 rl.l.high = rh.l.low;
 return rl.ll;
}


u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div);
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/time64.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/vdso/time64.h" 1
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/time64.h" 2

typedef __s64 time64_t;
typedef __u64 timeu64_t;

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/time.h" 1





# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/time_types.h" 1






struct __kernel_timespec {
 __kernel_time64_t tv_sec;
 long long tv_nsec;
};

struct __kernel_itimerspec {
 struct __kernel_timespec it_interval;
 struct __kernel_timespec it_value;
};
# 25 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/time_types.h"
struct __kernel_old_timeval {
 __kernel_long_t tv_sec;
 __kernel_long_t tv_usec;
};


struct __kernel_old_timespec {
 __kernel_old_time_t tv_sec;
 long tv_nsec;
};

struct __kernel_old_itimerval {
 struct __kernel_old_timeval it_interval;
 struct __kernel_old_timeval it_value;
};

struct __kernel_sock_timeval {
 __s64 tv_sec;
 __s64 tv_usec;
};
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/time.h" 2
# 33 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/time.h"
struct timezone {
 int tz_minuteswest;
 int tz_dsttime;
};
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/time64.h" 2

struct timespec64 {
 time64_t tv_sec;
 long tv_nsec;
};

struct itimerspec64 {
 struct timespec64 it_interval;
 struct timespec64 it_value;
};
# 41 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/time64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int timespec64_equal(const struct timespec64 *a,
       const struct timespec64 *b)
{
 return (a->tv_sec == b->tv_sec) && (a->tv_nsec == b->tv_nsec);
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int timespec64_compare(const struct timespec64 *lhs, const struct timespec64 *rhs)
{
 if (lhs->tv_sec < rhs->tv_sec)
  return -1;
 if (lhs->tv_sec > rhs->tv_sec)
  return 1;
 return lhs->tv_nsec - rhs->tv_nsec;
}

extern void set_normalized_timespec64(struct timespec64 *ts, time64_t sec, s64 nsec);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) struct timespec64 timespec64_add(struct timespec64 lhs,
      struct timespec64 rhs)
{
 struct timespec64 ts_delta;
 set_normalized_timespec64(&ts_delta, lhs.tv_sec + rhs.tv_sec,
    lhs.tv_nsec + rhs.tv_nsec);
 return ts_delta;
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) struct timespec64 timespec64_sub(struct timespec64 lhs,
      struct timespec64 rhs)
{
 struct timespec64 ts_delta;
 set_normalized_timespec64(&ts_delta, lhs.tv_sec - rhs.tv_sec,
    lhs.tv_nsec - rhs.tv_nsec);
 return ts_delta;
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool timespec64_valid(const struct timespec64 *ts)
{

 if (ts->tv_sec < 0)
  return false;

 if ((unsigned long)ts->tv_nsec >= 1000000000L)
  return false;
 return true;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool timespec64_valid_strict(const struct timespec64 *ts)
{
 if (!timespec64_valid(ts))
  return false;

 if ((unsigned long long)ts->tv_sec >= (((s64)~((u64)1 << 63)) / 1000000000L))
  return false;
 return true;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool timespec64_valid_settod(const struct timespec64 *ts)
{
 if (!timespec64_valid(ts))
  return false;

 if ((unsigned long long)ts->tv_sec >= ((((s64)~((u64)1 << 63)) / 1000000000L) - (30LL * 365 * 24 *3600)))
  return false;
 return true;
}
# 125 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/time64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 timespec64_to_ns(const struct timespec64 *ts)
{

 if ((unsigned long long)ts->tv_sec >= (((s64)~((u64)1 << 63)) / 1000000000L))
  return ((s64)~((u64)1 << 63));

 return ((s64) ts->tv_sec * 1000000000L) + ts->tv_nsec;
}







extern struct timespec64 ns_to_timespec64(const s64 nsec);
# 150 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/time64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void timespec64_add_ns(struct timespec64 *a, u64 ns)
{
 a->tv_sec += __iter_div_u64_rem(a->tv_nsec + ns, 1000000000L, &ns);
 a->tv_nsec = ns;
}





extern struct timespec64 timespec64_add_safe(const struct timespec64 lhs,
      const struct timespec64 rhs);
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/restart_block.h" 2

struct timespec;
struct old_timespec32;
struct pollfd;

enum timespec_type {
 TT_NONE = 0,
 TT_NATIVE = 1,
 TT_COMPAT = 2,
};




struct restart_block {
 long (*fn)(struct restart_block *);
 union {

  struct {
   u32 *uaddr;
   u32 val;
   u32 flags;
   u32 bitset;
   u64 time;
   u32 *uaddr2;
  } futex;

  struct {
   clockid_t clockid;
   enum timespec_type type;
   union {
    struct __kernel_timespec *rmtp;
    struct old_timespec32 *compat_rmtp;
   };
   u64 expires;
  } nanosleep;

  struct {
   struct pollfd *ufds;
   int nfds;
   int has_timeout;
   unsigned long tv_sec;
   unsigned long tv_nsec;
  } poll;
 };
};

extern long do_no_restart_syscall(struct restart_block *parm);
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/thread_info.h" 2
# 32 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/thread_info.h"
enum {
 BAD_STACK = -1,
 NOT_STACK = 0,
 GOOD_FRAME,
 GOOD_STACK,
};

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/thread_info.h" 1
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/thread_info.h"
struct task_struct;

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/memory.h" 1
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/memory.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/sizes.h" 1
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/memory.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/page-def.h" 1
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/memory.h" 2
# 165 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/memory.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mmdebug.h" 1







struct page;
struct vm_area_struct;
struct mm_struct;

extern void dump_page(struct page *page, const char *reason);
extern void __dump_page(struct page *page, const char *reason);
void dump_vma(const struct vm_area_struct *vma);
void dump_mm(const struct mm_struct *mm);
# 166 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/memory.h" 2



extern u64 vabits_actual;


extern s64 memstart_addr;




extern u64 kimage_vaddr;


extern u64 kimage_voffset;

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long kaslr_offset(void)
{
 return kimage_vaddr - (((((((-((((1UL))) << ((((48))) - 1))))) + (0x08000000))) + (0x08000000)));
}
# 227 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/memory.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) const void *__tag_set(const void *addr, u8 tag)
{
 u64 __addr = (u64)addr & ~0UL;
 return (const void *)(__addr | 0UL);
}
# 280 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/memory.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) phys_addr_t virt_to_phys(const volatile void *x)
{
 return ({ phys_addr_t __x = (phys_addr_t)(((unsigned long)(x))); (((u64)(__x) ^ ((-((((1UL))) << ((48)))))) < (((-((((1UL))) << ((vabits_actual) - 1)))) - ((-((((1UL))) << ((48))))))) ? (((__x) & ~((-((((1UL))) << ((48)))))) + ({ ((void)(sizeof(( long)(memstart_addr & 1)))); memstart_addr; })) : ((__x) - kimage_voffset); });
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void *phys_to_virt(phys_addr_t x)
{
 return (void *)(((unsigned long)((x) - ({ ((void)(sizeof(( long)(memstart_addr & 1)))); memstart_addr; })) | ((-((((1UL))) << ((48)))))));
}
# 335 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/memory.h"
void dump_mem_limit(void);
# 349 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/memory.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/memory_model.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/pfn.h" 1
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/pfn.h"
typedef struct {
 u64 val;
} pfn_t;
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/memory_model.h" 2
# 350 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/memory.h" 2
# 18 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/thread_info.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/stack_pointer.h" 1







register unsigned long current_stack_pointer asm ("sp");
# 19 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/thread_info.h" 2
# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 20 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/thread_info.h" 2

typedef unsigned long mm_segment_t;




struct thread_info {
 unsigned long flags;
 mm_segment_t addr_limit;

 u64 ttbr0;

 union {
  u64 preempt_count;
  struct {




   u32 count;
   u32 need_resched;

  } preempt;
 };




};
# 57 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/thread_info.h"
void arch_setup_new_exec(void);


void arch_release_task_struct(struct task_struct *tsk);
# 40 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/thread_info.h" 2







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) long set_restart_fn(struct restart_block *restart,
     long (*fn)(struct restart_block *))
{
 restart->fn = fn;
 do { } while (0);
 return -516;
}
# 66 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/thread_info.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void set_ti_thread_flag(struct thread_info *ti, int flag)
{
 set_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void clear_ti_thread_flag(struct thread_info *ti, int flag)
{
 clear_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void update_ti_thread_flag(struct thread_info *ti, int flag,
      bool value)
{
 if (value)
  set_ti_thread_flag(ti, flag);
 else
  clear_ti_thread_flag(ti, flag);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int test_and_set_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_and_set_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int test_and_clear_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_and_clear_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int test_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_bit(flag, (unsigned long *)&ti->flags);
}
# 116 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/thread_info.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int arch_within_stack_frames(const void * const stack,
        const void * const stackend,
        const void *obj, unsigned long len)
{
 return 0;
}



extern void __check_object_size(const void *ptr, unsigned long n,
     bool to_user);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void check_object_size(const void *ptr, unsigned long n,
           bool to_user)
{
 if (!__builtin_constant_p(n))
  __check_object_size(ptr, n, to_user);
}






extern void __attribute__((__error__("copy source size is too small")))
__bad_copy_from(void);
extern void __attribute__((__error__("copy destination size is too small")))
__bad_copy_to(void);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void copy_overflow(int size, unsigned long count)
{
 ({ int __ret_warn_on = !!(1); if (__builtin_expect(!!(__ret_warn_on), 0)) do { do { } while(0); __warn_printk("Buffer overflow detected (%d < %lu)!\n", size, count); asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"include/linux/thread_info.h\"; .popsection; .long 14472b - 14470b; .short 147; .short (1 << 0)|((1 << 3) | ((9) << 8)); .popsection; 14471: brk 0x800");; do { } while(0); } while (0); __builtin_expect(!!(__ret_warn_on), 0); });
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) __attribute__((__warn_unused_result__)) bool
check_copy_size(const void *addr, size_t bytes, bool is_source)
{
 int sz = __builtin_object_size(addr, 0);
 if (__builtin_expect(!!(sz >= 0 && sz < bytes), 0)) {
  if (!__builtin_constant_p(bytes))
   copy_overflow(sz, bytes);
  else if (is_source)
   __bad_copy_from();
  else
   __bad_copy_to();
  return false;
 }
 if (({ int __ret_warn_on = !!(bytes > ((int)(~0U >> 1))); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"include/linux/thread_info.h\"; .popsection; .long 14472b - 14470b; .short 163; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 14471: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); }))
  return false;
 check_object_size(addr, bytes, is_source);
 return true;
}
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/preempt.h" 2




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int preempt_count(void)
{
 return ({ do { extern void __compiletime_assert_118(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(char) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(short) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(int) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(long)) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(long long))) __compiletime_assert_118(); } while (0); (*(const volatile typeof( _Generic((((struct thread_info *)get_current())->preempt.count), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (((struct thread_info *)get_current())->preempt.count))) *)&(((struct thread_info *)get_current())->preempt.count)); });
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void preempt_count_set(u64 pc)
{

 do { do { extern void __compiletime_assert_119(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(char) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(short) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(int) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(long)) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(long long))) __compiletime_assert_119(); } while (0); do { *(volatile typeof(((struct thread_info *)get_current())->preempt.count) *)&(((struct thread_info *)get_current())->preempt.count) = (pc); } while (0); } while (0);
}
# 29 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/preempt.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void set_preempt_need_resched(void)
{
 ((struct thread_info *)get_current())->preempt.need_resched = 0;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void clear_preempt_need_resched(void)
{
 ((struct thread_info *)get_current())->preempt.need_resched = 1;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool test_preempt_need_resched(void)
{
 return !((struct thread_info *)get_current())->preempt.need_resched;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __preempt_count_add(int val)
{
 u32 pc = ({ do { extern void __compiletime_assert_120(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(char) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(short) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(int) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(long)) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(long long))) __compiletime_assert_120(); } while (0); (*(const volatile typeof( _Generic((((struct thread_info *)get_current())->preempt.count), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (((struct thread_info *)get_current())->preempt.count))) *)&(((struct thread_info *)get_current())->preempt.count)); });
 pc += val;
 do { do { extern void __compiletime_assert_121(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(char) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(short) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(int) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(long)) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(long long))) __compiletime_assert_121(); } while (0); do { *(volatile typeof(((struct thread_info *)get_current())->preempt.count) *)&(((struct thread_info *)get_current())->preempt.count) = (pc); } while (0); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __preempt_count_sub(int val)
{
 u32 pc = ({ do { extern void __compiletime_assert_122(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(char) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(short) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(int) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(long)) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(long long))) __compiletime_assert_122(); } while (0); (*(const volatile typeof( _Generic((((struct thread_info *)get_current())->preempt.count), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (((struct thread_info *)get_current())->preempt.count))) *)&(((struct thread_info *)get_current())->preempt.count)); });
 pc -= val;
 do { do { extern void __compiletime_assert_123(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(char) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(short) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(int) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(long)) || sizeof(((struct thread_info *)get_current())->preempt.count) == sizeof(long long))) __compiletime_assert_123(); } while (0); do { *(volatile typeof(((struct thread_info *)get_current())->preempt.count) *)&(((struct thread_info *)get_current())->preempt.count) = (pc); } while (0); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __preempt_count_dec_and_test(void)
{
 struct thread_info *ti = ((struct thread_info *)get_current());
 u64 pc = ({ do { extern void __compiletime_assert_124(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(ti->preempt_count) == sizeof(char) || sizeof(ti->preempt_count) == sizeof(short) || sizeof(ti->preempt_count) == sizeof(int) || sizeof(ti->preempt_count) == sizeof(long)) || sizeof(ti->preempt_count) == sizeof(long long))) __compiletime_assert_124(); } while (0); (*(const volatile typeof( _Generic((ti->preempt_count), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (ti->preempt_count))) *)&(ti->preempt_count)); });


 do { do { extern void __compiletime_assert_125(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(ti->preempt.count) == sizeof(char) || sizeof(ti->preempt.count) == sizeof(short) || sizeof(ti->preempt.count) == sizeof(int) || sizeof(ti->preempt.count) == sizeof(long)) || sizeof(ti->preempt.count) == sizeof(long long))) __compiletime_assert_125(); } while (0); do { *(volatile typeof(ti->preempt.count) *)&(ti->preempt.count) = (--pc); } while (0); } while (0);
# 73 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/preempt.h"
 return !pc || !({ do { extern void __compiletime_assert_126(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(ti->preempt_count) == sizeof(char) || sizeof(ti->preempt_count) == sizeof(short) || sizeof(ti->preempt_count) == sizeof(int) || sizeof(ti->preempt_count) == sizeof(long)) || sizeof(ti->preempt_count) == sizeof(long long))) __compiletime_assert_126(); } while (0); (*(const volatile typeof( _Generic((ti->preempt_count), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (ti->preempt_count))) *)&(ti->preempt_count)); });
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool should_resched(int preempt_offset)
{
 u64 pc = ({ do { extern void __compiletime_assert_127(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(((struct thread_info *)get_current())->preempt_count) == sizeof(char) || sizeof(((struct thread_info *)get_current())->preempt_count) == sizeof(short) || sizeof(((struct thread_info *)get_current())->preempt_count) == sizeof(int) || sizeof(((struct thread_info *)get_current())->preempt_count) == sizeof(long)) || sizeof(((struct thread_info *)get_current())->preempt_count) == sizeof(long long))) __compiletime_assert_127(); } while (0); (*(const volatile typeof( _Generic((((struct thread_info *)get_current())->preempt_count), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (((struct thread_info *)get_current())->preempt_count))) *)&(((struct thread_info *)get_current())->preempt_count)); });
 return pc == preempt_offset;
}


void preempt_schedule(void);

void preempt_schedule_notrace(void);
# 79 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/preempt.h" 2
# 277 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/preempt.h"
struct preempt_notifier;
# 293 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/preempt.h"
struct preempt_ops {
 void (*sched_in)(struct preempt_notifier *notifier, int cpu);
 void (*sched_out)(struct preempt_notifier *notifier,
     struct task_struct *next);
};
# 306 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/preempt.h"
struct preempt_notifier {
 struct hlist_node link;
 struct preempt_ops *ops;
};

void preempt_notifier_inc(void);
void preempt_notifier_dec(void);
void preempt_notifier_register(struct preempt_notifier *notifier);
void preempt_notifier_unregister(struct preempt_notifier *notifier);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void preempt_notifier_init(struct preempt_notifier *notifier,
         struct preempt_ops *ops)
{
 INIT_HLIST_NODE(&notifier->link);
 notifier->ops = ops;
}
# 335 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/preempt.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void migrate_disable(void)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
}
# 350 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/preempt.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void migrate_enable(void)
{
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}
# 82 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/smp.h" 2



# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/smp.h" 1
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/smp.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/percpu.h" 1
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/percpu.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void set_my_cpu_offset(unsigned long off)
{
 asm volatile(".if ""1"" == 1\n" "661:\n\t" "msr tpidr_el1, %0" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "11" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" "msr tpidr_el2, %0" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n"


   :: "r" (off) : "memory");
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long __hyp_my_cpu_offset(void)
{




 return ({ u64 __val; asm volatile("mrs %0, " "tpidr_el2" : "=r" (__val)); __val; });
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long __kern_my_cpu_offset(void)
{
 unsigned long off;





 asm(".if ""1"" == 1\n" "661:\n\t" "mrs %0, tpidr_el1" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "11" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" "mrs %0, tpidr_el2" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n"


  : "=r" (off) :
  "Q" (*(const unsigned long *)current_stack_pointer));

 return off;
}
# 122 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/percpu.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long __percpu_read_8(void *ptr) { return ({ do { extern void __compiletime_assert_128(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*(u8 *)ptr) == sizeof(char) || sizeof(*(u8 *)ptr) == sizeof(short) || sizeof(*(u8 *)ptr) == sizeof(int) || sizeof(*(u8 *)ptr) == sizeof(long)) || sizeof(*(u8 *)ptr) == sizeof(long long))) __compiletime_assert_128(); } while (0); (*(const volatile typeof( _Generic((*(u8 *)ptr), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*(u8 *)ptr))) *)&(*(u8 *)ptr)); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_write_8(void *ptr, unsigned long val) { do { do { extern void __compiletime_assert_129(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*(u8 *)ptr) == sizeof(char) || sizeof(*(u8 *)ptr) == sizeof(short) || sizeof(*(u8 *)ptr) == sizeof(int) || sizeof(*(u8 *)ptr) == sizeof(long)) || sizeof(*(u8 *)ptr) == sizeof(long long))) __compiletime_assert_129(); } while (0); do { *(volatile typeof(*(u8 *)ptr) *)&(*(u8 *)ptr) = ((u8)val); } while (0); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long __percpu_read_16(void *ptr) { return ({ do { extern void __compiletime_assert_130(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*(u16 *)ptr) == sizeof(char) || sizeof(*(u16 *)ptr) == sizeof(short) || sizeof(*(u16 *)ptr) == sizeof(int) || sizeof(*(u16 *)ptr) == sizeof(long)) || sizeof(*(u16 *)ptr) == sizeof(long long))) __compiletime_assert_130(); } while (0); (*(const volatile typeof( _Generic((*(u16 *)ptr), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*(u16 *)ptr))) *)&(*(u16 *)ptr)); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_write_16(void *ptr, unsigned long val) { do { do { extern void __compiletime_assert_131(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*(u16 *)ptr) == sizeof(char) || sizeof(*(u16 *)ptr) == sizeof(short) || sizeof(*(u16 *)ptr) == sizeof(int) || sizeof(*(u16 *)ptr) == sizeof(long)) || sizeof(*(u16 *)ptr) == sizeof(long long))) __compiletime_assert_131(); } while (0); do { *(volatile typeof(*(u16 *)ptr) *)&(*(u16 *)ptr) = ((u16)val); } while (0); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long __percpu_read_32(void *ptr) { return ({ do { extern void __compiletime_assert_132(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*(u32 *)ptr) == sizeof(char) || sizeof(*(u32 *)ptr) == sizeof(short) || sizeof(*(u32 *)ptr) == sizeof(int) || sizeof(*(u32 *)ptr) == sizeof(long)) || sizeof(*(u32 *)ptr) == sizeof(long long))) __compiletime_assert_132(); } while (0); (*(const volatile typeof( _Generic((*(u32 *)ptr), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*(u32 *)ptr))) *)&(*(u32 *)ptr)); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_write_32(void *ptr, unsigned long val) { do { do { extern void __compiletime_assert_133(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*(u32 *)ptr) == sizeof(char) || sizeof(*(u32 *)ptr) == sizeof(short) || sizeof(*(u32 *)ptr) == sizeof(int) || sizeof(*(u32 *)ptr) == sizeof(long)) || sizeof(*(u32 *)ptr) == sizeof(long long))) __compiletime_assert_133(); } while (0); do { *(volatile typeof(*(u32 *)ptr) *)&(*(u32 *)ptr) = ((u32)val); } while (0); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long __percpu_read_64(void *ptr) { return ({ do { extern void __compiletime_assert_134(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*(u64 *)ptr) == sizeof(char) || sizeof(*(u64 *)ptr) == sizeof(short) || sizeof(*(u64 *)ptr) == sizeof(int) || sizeof(*(u64 *)ptr) == sizeof(long)) || sizeof(*(u64 *)ptr) == sizeof(long long))) __compiletime_assert_134(); } while (0); (*(const volatile typeof( _Generic((*(u64 *)ptr), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*(u64 *)ptr))) *)&(*(u64 *)ptr)); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_write_64(void *ptr, unsigned long val) { do { do { extern void __compiletime_assert_135(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*(u64 *)ptr) == sizeof(char) || sizeof(*(u64 *)ptr) == sizeof(short) || sizeof(*(u64 *)ptr) == sizeof(int) || sizeof(*(u64 *)ptr) == sizeof(long)) || sizeof(*(u64 *)ptr) == sizeof(long long))) __compiletime_assert_135(); } while (0); do { *(volatile typeof(*(u64 *)ptr) *)&(*(u64 *)ptr) = ((u64)val); } while (0); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_add_case_8(void *ptr, unsigned long val) { unsigned int loop; u8 tmp; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "b" "\t%" "w" "[tmp], %[ptr]\n" "add" "\t%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	stxr" "b" "\t%w[loop], %" "w" "[tmp], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "stadd" "\t%" "w" "[val], %[ptr]\n" ".rept	" "3" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [tmp] "=&r" (tmp), [ptr] "+Q"(*(u8 *)ptr) : [val] "r" ((u8)(val))); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_add_case_16(void *ptr, unsigned long val) { unsigned int loop; u16 tmp; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "h" "\t%" "w" "[tmp], %[ptr]\n" "add" "\t%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	stxr" "h" "\t%w[loop], %" "w" "[tmp], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "stadd" "\t%" "w" "[val], %[ptr]\n" ".rept	" "3" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [tmp] "=&r" (tmp), [ptr] "+Q"(*(u16 *)ptr) : [val] "r" ((u16)(val))); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_add_case_32(void *ptr, unsigned long val) { unsigned int loop; u32 tmp; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "" "\t%" "w" "[tmp], %[ptr]\n" "add" "\t%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	stxr" "" "\t%w[loop], %" "w" "[tmp], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "stadd" "\t%" "w" "[val], %[ptr]\n" ".rept	" "3" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [tmp] "=&r" (tmp), [ptr] "+Q"(*(u32 *)ptr) : [val] "r" ((u32)(val))); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_add_case_64(void *ptr, unsigned long val) { unsigned int loop; u64 tmp; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "" "\t%" "" "[tmp], %[ptr]\n" "add" "\t%" "" "[tmp], %" "" "[tmp], %" "" "[val]\n" "	stxr" "" "\t%w[loop], %" "" "[tmp], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "stadd" "\t%" "" "[val], %[ptr]\n" ".rept	" "3" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [tmp] "=&r" (tmp), [ptr] "+Q"(*(u64 *)ptr) : [val] "r" ((u64)(val))); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_andnot_case_8(void *ptr, unsigned long val) { unsigned int loop; u8 tmp; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "b" "\t%" "w" "[tmp], %[ptr]\n" "bic" "\t%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	stxr" "b" "\t%w[loop], %" "w" "[tmp], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "stclr" "\t%" "w" "[val], %[ptr]\n" ".rept	" "3" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [tmp] "=&r" (tmp), [ptr] "+Q"(*(u8 *)ptr) : [val] "r" ((u8)(val))); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_andnot_case_16(void *ptr, unsigned long val) { unsigned int loop; u16 tmp; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "h" "\t%" "w" "[tmp], %[ptr]\n" "bic" "\t%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	stxr" "h" "\t%w[loop], %" "w" "[tmp], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "stclr" "\t%" "w" "[val], %[ptr]\n" ".rept	" "3" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [tmp] "=&r" (tmp), [ptr] "+Q"(*(u16 *)ptr) : [val] "r" ((u16)(val))); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_andnot_case_32(void *ptr, unsigned long val) { unsigned int loop; u32 tmp; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "" "\t%" "w" "[tmp], %[ptr]\n" "bic" "\t%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	stxr" "" "\t%w[loop], %" "w" "[tmp], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "stclr" "\t%" "w" "[val], %[ptr]\n" ".rept	" "3" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [tmp] "=&r" (tmp), [ptr] "+Q"(*(u32 *)ptr) : [val] "r" ((u32)(val))); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_andnot_case_64(void *ptr, unsigned long val) { unsigned int loop; u64 tmp; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "" "\t%" "" "[tmp], %[ptr]\n" "bic" "\t%" "" "[tmp], %" "" "[tmp], %" "" "[val]\n" "	stxr" "" "\t%w[loop], %" "" "[tmp], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "stclr" "\t%" "" "[val], %[ptr]\n" ".rept	" "3" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [tmp] "=&r" (tmp), [ptr] "+Q"(*(u64 *)ptr) : [val] "r" ((u64)(val))); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_or_case_8(void *ptr, unsigned long val) { unsigned int loop; u8 tmp; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "b" "\t%" "w" "[tmp], %[ptr]\n" "orr" "\t%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	stxr" "b" "\t%w[loop], %" "w" "[tmp], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "stset" "\t%" "w" "[val], %[ptr]\n" ".rept	" "3" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [tmp] "=&r" (tmp), [ptr] "+Q"(*(u8 *)ptr) : [val] "r" ((u8)(val))); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_or_case_16(void *ptr, unsigned long val) { unsigned int loop; u16 tmp; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "h" "\t%" "w" "[tmp], %[ptr]\n" "orr" "\t%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	stxr" "h" "\t%w[loop], %" "w" "[tmp], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "stset" "\t%" "w" "[val], %[ptr]\n" ".rept	" "3" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [tmp] "=&r" (tmp), [ptr] "+Q"(*(u16 *)ptr) : [val] "r" ((u16)(val))); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_or_case_32(void *ptr, unsigned long val) { unsigned int loop; u32 tmp; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "" "\t%" "w" "[tmp], %[ptr]\n" "orr" "\t%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	stxr" "" "\t%w[loop], %" "w" "[tmp], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "stset" "\t%" "w" "[val], %[ptr]\n" ".rept	" "3" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [tmp] "=&r" (tmp), [ptr] "+Q"(*(u32 *)ptr) : [val] "r" ((u32)(val))); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __percpu_or_case_64(void *ptr, unsigned long val) { unsigned int loop; u64 tmp; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "" "\t%" "" "[tmp], %[ptr]\n" "orr" "\t%" "" "[tmp], %" "" "[tmp], %" "" "[val]\n" "	stxr" "" "\t%w[loop], %" "" "[tmp], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "stset" "\t%" "" "[val], %[ptr]\n" ".rept	" "3" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [tmp] "=&r" (tmp), [ptr] "+Q"(*(u64 *)ptr) : [val] "r" ((u64)(val))); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u8 __percpu_add_return_case_8(void *ptr, unsigned long val) { unsigned int loop; u8 ret; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "b" "\t%" "w" "[ret], %[ptr]\n" "add" "\t%" "w" "[ret], %" "w" "[ret], %" "w" "[val]\n" "	stxr" "b" "\t%w[loop], %" "w" "[ret], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "ldadd" "\t%" "w" "[val], %" "w" "[ret], %[ptr]\n" "add" "\t%" "w" "[ret], %" "w" "[ret], %" "w" "[val]\n" ".rept	" "2" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u8 *)ptr) : [val] "r" ((u8)(val))); return ret; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u16 __percpu_add_return_case_16(void *ptr, unsigned long val) { unsigned int loop; u16 ret; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "h" "\t%" "w" "[ret], %[ptr]\n" "add" "\t%" "w" "[ret], %" "w" "[ret], %" "w" "[val]\n" "	stxr" "h" "\t%w[loop], %" "w" "[ret], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "ldadd" "\t%" "w" "[val], %" "w" "[ret], %[ptr]\n" "add" "\t%" "w" "[ret], %" "w" "[ret], %" "w" "[val]\n" ".rept	" "2" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u16 *)ptr) : [val] "r" ((u16)(val))); return ret; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __percpu_add_return_case_32(void *ptr, unsigned long val) { unsigned int loop; u32 ret; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "" "\t%" "w" "[ret], %[ptr]\n" "add" "\t%" "w" "[ret], %" "w" "[ret], %" "w" "[val]\n" "	stxr" "" "\t%w[loop], %" "w" "[ret], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "ldadd" "\t%" "w" "[val], %" "w" "[ret], %[ptr]\n" "add" "\t%" "w" "[ret], %" "w" "[ret], %" "w" "[val]\n" ".rept	" "2" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u32 *)ptr) : [val] "r" ((u32)(val))); return ret; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __percpu_add_return_case_64(void *ptr, unsigned long val) { unsigned int loop; u64 ret; asm volatile (".if ""1"" == 1\n" "661:\n\t" "1:	ldxr" "" "\t%" "" "[ret], %[ptr]\n" "add" "\t%" "" "[ret], %" "" "[ret], %" "" "[val]\n" "	stxr" "" "\t%w[loop], %" "" "[ret], %[ptr]\n" "	cbnz	%w[loop], 1b" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "ldadd" "\t%" "" "[val], %" "" "[ret], %[ptr]\n" "add" "\t%" "" "[ret], %" "" "[ret], %" "" "[val]\n" ".rept	" "2" "\nnop\n.endr\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u64 *)ptr) : [val] "r" ((u64)(val))); return ret; }
# 242 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/percpu.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/percpu.h" 1






# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/percpu-defs.h" 1
# 308 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/percpu-defs.h"
extern void __bad_size_call_parameter(void);




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __this_cpu_preempt_check(const char *op) { }
# 8 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/percpu.h" 2
# 19 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/percpu.h"
extern unsigned long __per_cpu_offset[256];
# 243 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/percpu.h" 2
# 29 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/smp.h" 2





extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(int) cpu_number;
# 48 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/smp.h"
extern u64 __cpu_logical_map[256];
extern u64 cpu_logical_map(int cpu);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void set_cpu_logical_map(int cpu, u64 hwid)
{
 __cpu_logical_map[cpu] = hwid;
}

struct seq_file;





extern void smp_init_cpus(void);




extern void set_smp_ipi_range(int ipi_base, int nr_ipi);




 void secondary_start_kernel(void);







struct secondary_data {
 void *stack;
 struct task_struct *task;
 long status;
};

extern struct secondary_data secondary_data;
extern long __early_cpu_boot_status;
extern void secondary_entry(void);

extern void arch_send_call_function_single_ipi(int cpu);
extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void arch_send_wakeup_ipi_mask(const struct cpumask *mask)
{
 do { extern void __compiletime_assert_136(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_136(); } while (0);
}


extern int __cpu_disable(void);

extern void __cpu_die(unsigned int cpu);
extern void cpu_die(void);
extern void cpu_die_early(void);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpu_park_loop(void)
{
 for (;;) {
  asm volatile("wfe" : : : "memory");
  asm volatile("wfi" : : : "memory");
 }
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void update_cpu_boot_status(int val)
{
 do { do { extern void __compiletime_assert_137(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(secondary_data.status) == sizeof(char) || sizeof(secondary_data.status) == sizeof(short) || sizeof(secondary_data.status) == sizeof(int) || sizeof(secondary_data.status) == sizeof(long)) || sizeof(secondary_data.status) == sizeof(long long))) __compiletime_assert_137(); } while (0); do { *(volatile typeof(secondary_data.status) *)&(secondary_data.status) = (val); } while (0); } while (0);

 asm volatile("dsb " "ishst" : : : "memory");
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpu_panic_kernel(void)
{
 update_cpu_boot_status((3));
 cpu_park_loop();
}
# 144 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/smp.h"
bool cpus_are_stuck_in_kernel(void);

extern void crash_smp_send_stop(void);
extern bool smp_crash_stop_failed(void);
# 86 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/smp.h" 2
# 95 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/smp.h"
extern void smp_send_stop(void);




extern void smp_send_reschedule(int cpu);





extern void smp_prepare_cpus(unsigned int max_cpus);




extern int __cpu_up(unsigned int cpunum, struct task_struct *tidle);




extern void smp_cpus_done(unsigned int max_cpus);




void smp_call_function(smp_call_func_t func, void *info, int wait);
void smp_call_function_many(const struct cpumask *mask,
       smp_call_func_t func, void *info, bool wait);

int smp_call_function_any(const struct cpumask *mask,
     smp_call_func_t func, void *info, int wait);

void kick_all_cpus_sync(void);
void wake_up_all_idle_cpus(void);




void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) call_function_init(void);
void generic_smp_call_function_single_interrupt(void);







void smp_prepare_boot_cpu(void);

extern unsigned int setup_max_cpus;
extern void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) setup_nr_cpu_ids(void);
extern void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) smp_init(void);

extern int __boot_cpu_id;

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int get_boot_cpu_id(void)
{
 return __boot_cpu_id;
}
# 246 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/smp.h"
extern void arch_disable_smp_support(void);

extern void arch_thaw_secondary_cpus_begin(void);
extern void arch_thaw_secondary_cpus_end(void);

void smp_setup_processor_id(void);

int smp_call_on_cpu(unsigned int cpu, int (*func)(void *), void *par,
      bool phys);


int smpcfd_prepare_cpu(unsigned int cpu);
int smpcfd_dead_cpu(unsigned int cpu);
int smpcfd_dying_cpu(unsigned int cpu);
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep.h" 2


struct task_struct;


extern int prove_locking;
extern int lock_stat;
# 328 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void lockdep_init_task(struct task_struct *task)
{
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void lockdep_off(void)
{
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void lockdep_on(void)
{
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void lockdep_set_selftest_task(struct task_struct *task)
{
}
# 377 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void lockdep_register_key(struct lock_class_key *key)
{
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void lockdep_unregister_key(struct lock_class_key *key)
{
}
# 404 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep.h"
enum xhlock_context_t {
 XHLOCK_HARD,
 XHLOCK_SOFT,
 XHLOCK_CTX_NR,
};
# 418 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void lockdep_invariant_state(bool force) {}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void lockdep_free_task(struct task_struct *task) {}
# 480 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void print_irqtrace_events(struct task_struct *curr)
{
}
# 637 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/lockdep.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void
lockdep_rcu_suspicious(const char *file, const int line, const char *s)
{
}
# 18 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h" 1
# 31 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/vdso/processor.h" 1
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/vdso/processor.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/vdso/processor.h" 1
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/vdso/processor.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpu_relax(void)
{
 asm volatile("yield" ::: "memory");
}
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/vdso/processor.h" 2
# 32 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h" 2


# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpufeature.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpufeature.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/hwcap.h" 1







# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/hwcap.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/hwcap.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpufeature.h" 1
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/hwcap.h" 2
# 122 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/hwcap.h"
extern unsigned int compat_elf_hwcap, compat_elf_hwcap2;


enum {
 CAP_HWCAP = 1,

 CAP_COMPAT_HWCAP,
 CAP_COMPAT_HWCAP2,

};
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpufeature.h" 2
# 37 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpufeature.h"
enum ftr_type {
 FTR_EXACT,
 FTR_LOWER_SAFE,
 FTR_HIGHER_SAFE,
 FTR_HIGHER_OR_ZERO_SAFE,
};
# 56 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpufeature.h"
struct arm64_ftr_bits {
 bool sign;
 bool visible;
 bool strict;
 enum ftr_type type;
 u8 shift;
 u8 width;
 s64 safe_val;
};






struct arm64_ftr_reg {
 const char *name;
 u64 strict_mask;
 u64 user_mask;
 u64 sys_val;
 u64 user_val;
 const struct arm64_ftr_bits *ftr_bits;
};

extern struct arm64_ftr_reg arm64_ftr_reg_ctrel0;
# 305 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpufeature.h"
struct arm64_cpu_capabilities {
 const char *desc;
 u16 capability;
 u16 type;
 bool (*matches)(const struct arm64_cpu_capabilities *caps, int scope);
# 322 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpufeature.h"
 void (*cpu_enable)(const struct arm64_cpu_capabilities *cap);
 union {
  struct {
   struct midr_range midr_range;
   const struct arm64_midr_revidr {
    u32 midr_rv;
    u32 revidr_mask;
   } * const fixed_revs;
  };

  const struct midr_range *midr_range_list;
  struct {
   u32 sys_reg;
   u8 field_pos;
   u8 min_field_value;
   u8 hwcap_type;
   bool sign;
   unsigned long hwcap;
  };
 };
# 354 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpufeature.h"
 const struct arm64_cpu_capabilities *match_list;
};

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int cpucap_default_scope(const struct arm64_cpu_capabilities *cap)
{
 return cap->type & (((u16)((((1UL))) << (1))) | ((u16)((((1UL))) << (0))) | ((u16)((((1UL))) << (2))));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool
cpucap_multi_entry_cap_matches(const struct arm64_cpu_capabilities *entry,
          int scope)
{
 const struct arm64_cpu_capabilities *caps;

 for (caps = entry->match_list; caps->matches; caps++)
  if (caps->matches(caps, scope))
   return true;

 return false;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool is_vhe_hyp_code(void)
{

 return 0;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool is_nvhe_hyp_code(void)
{

 return 0;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool is_hyp_code(void)
{
 return is_vhe_hyp_code() || is_nvhe_hyp_code();
}

extern unsigned long cpu_hwcaps[(((61) + ((sizeof(long) * 8)) - 1) / ((sizeof(long) * 8)))];
extern struct static_key_false cpu_hwcap_keys[61];
extern struct static_key_false arm64_const_caps_ready;



extern unsigned long boot_capabilities[((((61 + 1)) + ((sizeof(long) * 8)) - 1) / ((sizeof(long) * 8)))];




bool this_cpu_has_cap(unsigned int cap);
void cpu_set_feature(unsigned int num);
bool cpu_have_feature(unsigned int num);
unsigned long cpu_get_elf_hwcap(void);
unsigned long cpu_get_elf_hwcap2(void);




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool system_capabilities_finalized(void)
{
 return ({ bool branch; if (__builtin_types_compatible_p(typeof(*&arm64_const_caps_ready), struct static_key_true)) branch = !arch_static_branch(&(&arm64_const_caps_ready)->key, true); else if (__builtin_types_compatible_p(typeof(*&arm64_const_caps_ready), struct static_key_false)) branch = !arch_static_branch_jump(&(&arm64_const_caps_ready)->key, true); else branch = ____wrong_branch_error(); __builtin_expect(!!(branch), 1); });
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool cpus_have_cap(unsigned int num)
{
 if (num >= 61)
  return false;
 return test_bit(num, cpu_hwcaps);
}
# 442 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpufeature.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool __cpus_have_const_cap(int num)
{
 if (num >= 61)
  return false;
 return ({ bool branch; if (__builtin_types_compatible_p(typeof(*&cpu_hwcap_keys[num]), struct static_key_true)) branch = arch_static_branch_jump(&(&cpu_hwcap_keys[num])->key, false); else if (__builtin_types_compatible_p(typeof(*&cpu_hwcap_keys[num]), struct static_key_false)) branch = arch_static_branch(&(&cpu_hwcap_keys[num])->key, false); else branch = ____wrong_branch_error(); __builtin_expect(!!(branch), 0); });
}
# 457 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpufeature.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool cpus_have_final_cap(int num)
{
 if (system_capabilities_finalized())
  return __cpus_have_const_cap(num);
 else
  do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"arch/arm64/include/asm/cpufeature.h\"; .popsection; .long 14472b - 14470b; .short 462; .short 0; .popsection; 14471: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
}
# 476 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/cpufeature.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool cpus_have_const_cap(int num)
{
 if (is_hyp_code())
  return cpus_have_final_cap(num);
 else if (system_capabilities_finalized())
  return __cpus_have_const_cap(num);
 else
  return cpus_have_cap(num);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void cpus_set_cap(unsigned int num)
{
 if (num >= 61) {
  printk("\001" "4" "Attempt to set an illegal CPU capability (%d >= %d)\n", num, 61)
                    ;
 } else {
  __set_bit(num, cpu_hwcaps);
 }
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__const__))
cpuid_feature_extract_signed_field_width(u64 features, int field, int width)
{
 return (s64)(features << (64 - width - field)) >> (64 - width);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__const__))
cpuid_feature_extract_signed_field(u64 features, int field)
{
 return cpuid_feature_extract_signed_field_width(features, field, 4);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned int __attribute__((__const__))
cpuid_feature_extract_unsigned_field_width(u64 features, int field, int width)
{
 return (u64)(features << (64 - width - field)) >> (64 - width);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) unsigned int __attribute__((__const__))
cpuid_feature_extract_unsigned_field(u64 features, int field)
{
 return cpuid_feature_extract_unsigned_field_width(features, field, 4);
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 __attribute__((__const__))
cpuid_feature_cap_perfmon_field(u64 features, int field, u64 cap)
{
 u64 val = cpuid_feature_extract_unsigned_field(features, field);
 u64 mask = ((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((field) > (field + 3)) * 0l)) : (int *)8))), (field) > (field + 3), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (field)) + 1) & (~(((0ULL))) >> (64 - 1 - (field + 3)))));


 if (val == 0xf)
  val = 0;

 if (val > cap) {
  features &= ~mask;
  features |= (cap << field) & mask;
 }

 return features;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 arm64_ftr_mask(const struct arm64_ftr_bits *ftrp)
{
 return (u64)((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((ftrp->shift) > (ftrp->shift + ftrp->width - 1)) * 0l)) : (int *)8))), (ftrp->shift) > (ftrp->shift + ftrp->width - 1), 0))); })))) + (((~(((0UL)))) - ((((1UL))) << (ftrp->shift)) + 1) & (~(((0UL))) >> (64 - 1 - (ftrp->shift + ftrp->width - 1)))));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 arm64_ftr_reg_user_value(const struct arm64_ftr_reg *reg)
{
 return (reg->user_val | (reg->sys_val & reg->user_mask));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__const__))
cpuid_feature_extract_field_width(u64 features, int field, int width, bool sign)
{
 return (sign) ?
  cpuid_feature_extract_signed_field_width(features, field, width) :
  cpuid_feature_extract_unsigned_field_width(features, field, width);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __attribute__((__const__))
cpuid_feature_extract_field(u64 features, int field, bool sign)
{
 return cpuid_feature_extract_field_width(features, field, 4, sign);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) s64 arm64_ftr_value(const struct arm64_ftr_bits *ftrp, u64 val)
{
 return (s64)cpuid_feature_extract_field_width(val, ftrp->shift, ftrp->width, ftrp->sign);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool id_aa64mmfr0_mixed_endian_el0(u64 mmfr0)
{
 return cpuid_feature_extract_unsigned_field(mmfr0, 8) == 0x1 ||
  cpuid_feature_extract_unsigned_field(mmfr0, 16) == 0x1;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool id_aa64pfr0_32bit_el1(u64 pfr0)
{
 u32 val = cpuid_feature_extract_unsigned_field(pfr0, 4);

 return val == 0x2;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool id_aa64pfr0_32bit_el0(u64 pfr0)
{
 u32 val = cpuid_feature_extract_unsigned_field(pfr0, 0);

 return val == 0x2;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool id_aa64pfr0_sve(u64 pfr0)
{
 u32 val = cpuid_feature_extract_unsigned_field(pfr0, 32);

 return val > 0;
}

void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) setup_cpu_features(void);
void check_local_cpu_capabilities(void);

u64 read_sanitised_ftr_reg(u32 id);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool cpu_supports_mixed_endian_el0(void)
{
 return id_aa64mmfr0_mixed_endian_el0(({ u64 __val; asm volatile("	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	mrs_s, rt, sreg\n" ".inst " "(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	mrs_s " "%0" ", " "(((3) << 19) | ((0) << 16) | ((0) << 12) | ((7) << 8) | ((0) << 5))" "\n" "	.purgem	mrs_s\n" : "=r" (__val)); __val; }));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool supports_csv2p3(int scope)
{
 u64 pfr0;
 u8 csv2_val;

 if (scope == ((u16)((((1UL))) << (0))))
  pfr0 = ({ u64 __val; asm volatile("	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	mrs_s, rt, sreg\n" ".inst " "(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	mrs_s " "%0" ", " "(((3) << 19) | ((0) << 16) | ((0) << 12) | ((4) << 8) | ((0) << 5))" "\n" "	.purgem	mrs_s\n" : "=r" (__val)); __val; });
 else
  pfr0 = read_sanitised_ftr_reg((((3) << 19) | ((0) << 16) | ((0) << 12) | ((4) << 8) | ((0) << 5)));

 csv2_val = cpuid_feature_extract_unsigned_field(pfr0,
       56);
 return csv2_val == 3;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool supports_clearbhb(int scope)
{
 u64 isar2;

 if (scope == ((u16)((((1UL))) << (0))))
  isar2 = ({ u64 __val; asm volatile("	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	mrs_s, rt, sreg\n" ".inst " "(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	mrs_s " "%0" ", " "(((3) << 19) | ((0) << 16) | ((0) << 12) | ((6) << 8) | ((2) << 5))" "\n" "	.purgem	mrs_s\n" : "=r" (__val)); __val; });
 else
  isar2 = read_sanitised_ftr_reg((((3) << 19) | ((0) << 16) | ((0) << 12) | ((6) << 8) | ((2) << 5)));

 return cpuid_feature_extract_unsigned_field(isar2,
          28);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_supports_32bit_el0(void)
{
 return cpus_have_const_cap(13);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_supports_4kb_granule(void)
{
 u64 mmfr0;
 u32 val;

 mmfr0 = read_sanitised_ftr_reg((((3) << 19) | ((0) << 16) | ((0) << 12) | ((7) << 8) | ((0) << 5)));
 val = cpuid_feature_extract_unsigned_field(mmfr0,
      28);

 return val == 0x0;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_supports_64kb_granule(void)
{
 u64 mmfr0;
 u32 val;

 mmfr0 = read_sanitised_ftr_reg((((3) << 19) | ((0) << 16) | ((0) << 12) | ((7) << 8) | ((0) << 5)));
 val = cpuid_feature_extract_unsigned_field(mmfr0,
      24);

 return val == 0x0;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_supports_16kb_granule(void)
{
 u64 mmfr0;
 u32 val;

 mmfr0 = read_sanitised_ftr_reg((((3) << 19) | ((0) << 16) | ((0) << 12) | ((7) << 8) | ((0) << 5)));
 val = cpuid_feature_extract_unsigned_field(mmfr0,
      20);

 return val == 0x1;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_supports_mixed_endian_el0(void)
{
 return id_aa64mmfr0_mixed_endian_el0(read_sanitised_ftr_reg((((3) << 19) | ((0) << 16) | ((0) << 12) | ((7) << 8) | ((0) << 5))));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_supports_mixed_endian(void)
{
 u64 mmfr0;
 u32 val;

 mmfr0 = read_sanitised_ftr_reg((((3) << 19) | ((0) << 16) | ((0) << 12) | ((7) << 8) | ((0) << 5)));
 val = cpuid_feature_extract_unsigned_field(mmfr0,
      8);

 return val == 0x1;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool system_supports_fpsimd(void)
{
 return !cpus_have_const_cap(16);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_uses_ttbr0_pan(void)
{
 return 1 &&
  !cpus_have_const_cap(4);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool system_supports_sve(void)
{
 return 1 &&
  cpus_have_const_cap(22);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool system_supports_cnp(void)
{
 return 1 &&
  cpus_have_const_cap(15);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_supports_address_auth(void)
{
 return 0 &&
  cpus_have_const_cap(51);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_supports_generic_auth(void)
{
 return 0 &&
  cpus_have_const_cap(52);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool system_uses_irq_prio_masking(void)
{
 return 0 &&
        cpus_have_const_cap(42);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_supports_mte(void)
{
 return 1 &&
  cpus_have_const_cap(57);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_has_prio_mask_debugging(void)
{
 return 0 &&
        system_uses_irq_prio_masking();
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_supports_bti(void)
{
 return 1 && cpus_have_const_cap(54);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool system_supports_tlb_range(void)
{
 return 0 &&
  cpus_have_const_cap(56);
}

extern int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 id_aa64mmfr0_parange_to_phys_shift(int parange)
{
 switch (parange) {
 case 0: return 32;
 case 1: return 36;
 case 2: return 40;
 case 3: return 42;
 case 4: return 44;
 case 5: return 48;
 case 6: return 52;







 default: return 48;
 }
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool cpu_has_hw_af(void)
{
 u64 mmfr1;

 if (!0)
  return false;

 mmfr1 = ({ u64 __val; asm volatile("	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	mrs_s, rt, sreg\n" ".inst " "(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	mrs_s " "%0" ", " "(((3) << 19) | ((0) << 16) | ((0) << 12) | ((7) << 8) | ((1) << 5))" "\n" "	.purgem	mrs_s\n" : "=r" (__val)); __val; });
 return cpuid_feature_extract_unsigned_field(mmfr1,
      0);
}



extern bool cpu_has_amu_feat(int cpu);


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int get_vmid_bits(u64 mmfr1)
{
 int vmid_bits;

 vmid_bits = cpuid_feature_extract_unsigned_field(mmfr1,
      4);
 if (vmid_bits == 2)
  return 16;





 return 8;
}

u32 get_kvm_ipa_limit(void);
void dump_cpu_features(void);
# 35 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/hw_breakpoint.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/hw_breakpoint.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/virt.h" 1
# 49 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/virt.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/ptrace.h" 1
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/ptrace.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/ptrace.h" 1
# 26 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/ptrace.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/sve_context.h" 1
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/ptrace.h" 2
# 88 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/ptrace.h"
struct user_pt_regs {
 __u64 regs[31];
 __u64 sp;
 __u64 pc;
 __u64 pstate;
};

struct user_fpsimd_state {
 __uint128_t vregs[32];
 __u32 fpsr;
 __u32 fpcr;
 __u32 __reserved[2];
};

struct user_hwdebug_state {
 __u32 dbg_info;
 __u32 pad;
 struct {
  __u64 addr;
  __u32 ctrl;
  __u32 pad;
 } dbg_regs[16];
};



struct user_sve_header {
 __u32 size;
 __u32 max_size;
 __u16 vl;
 __u16 max_vl;
 __u16 flags;
 __u16 __reserved;
};
# 250 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/ptrace.h"
struct user_pac_mask {
 __u64 data_mask;
 __u64 insn_mask;
};



struct user_pac_address_keys {
 __uint128_t apiakey;
 __uint128_t apibkey;
 __uint128_t apdakey;
 __uint128_t apdbkey;
};

struct user_pac_generic_keys {
 __uint128_t apgakey;
};
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/ptrace.h" 2
# 144 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/ptrace.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long compat_psr_to_pstate(const unsigned long psr)
{
 unsigned long pstate;

 pstate = psr & ~0x00200000;

 if (psr & 0x00200000)
  pstate |= 0x01000000;

 return pstate;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long pstate_to_compat_psr(const unsigned long pstate)
{
 unsigned long psr;

 psr = pstate & ~0x01000000;

 if (pstate & 0x01000000)
  psr |= 0x00200000;

 return psr;
}






struct pt_regs {
 union {
  struct user_pt_regs user_regs;
  struct {
   u64 regs[31];
   u64 sp;
   u64 pc;
   u64 pstate;
  };
 };
 u64 orig_x0;




 s32 syscallno;
 u32 unused2;


 u64 orig_addr_limit;

 u64 pmr_save;
 u64 stackframe[2];


 u64 lockdep_hardirqs;
 u64 exit_rcu;
};

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool in_syscall(struct pt_regs const *regs)
{
 return regs->syscallno != (-1);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void forget_syscall(struct pt_regs *regs)
{
 regs->syscallno = (-1);
}
# 244 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/ptrace.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long user_stack_pointer(struct pt_regs *regs)
{
 if ((((regs)->pstate & (0x00000010 | 0x0000000f)) == (0x00000010 | 0x00000000)))
  return regs->regs[13];
 return regs->sp;
}

extern int regs_query_register_offset(const char *name);
extern unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,
            unsigned int n);
# 264 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/ptrace.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 regs_get_register(struct pt_regs *regs, unsigned int offset)
{
 u64 val = 0;

 ({ int __ret_warn_on = !!(offset & 7); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"arch/arm64/include/asm/ptrace.h\"; .popsection; .long 14472b - 14470b; .short 268; .short (1 << 0)|(((9) << 8)); .popsection; 14471: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); });

 offset >>= 3;
 switch (offset) {
 case 0 ... 30:
  val = regs->regs[offset];
  break;
 case __builtin_offsetof(struct pt_regs, sp) >> 3:
  val = regs->sp;
  break;
 case __builtin_offsetof(struct pt_regs, pc) >> 3:
  val = regs->pc;
  break;
 case __builtin_offsetof(struct pt_regs, pstate) >> 3:
  val = regs->pstate;
  break;
 default:
  val = 0;
 }

 return val;
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long pt_regs_read_reg(const struct pt_regs *regs, int r)
{
 return (r == 31) ? 0 : regs->regs[r];
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void pt_regs_write_reg(struct pt_regs *regs, int r,
         unsigned long val)
{
 if (r != 31)
  regs->regs[r] = val;
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long kernel_stack_pointer(struct pt_regs *regs)
{
 return regs->sp;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long regs_return_value(struct pt_regs *regs)
{
 unsigned long val = regs->regs[0];






 if ((((regs)->pstate & (0x00000010 | 0x0000000f)) == (0x00000010 | 0x00000000)))
  val = sign_extend64(val, 31);

 return val;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
{
 regs->regs[0] = rc;
}
# 350 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/ptrace.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long regs_get_kernel_argument(struct pt_regs *regs,
           unsigned int n)
{

 if (n < 8)
  return pt_regs_read_reg(regs, n);
 return 0;
}


struct task_struct;
int valid_user_regs(struct user_pt_regs *regs, struct task_struct *task);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long instruction_pointer(struct pt_regs *regs)
{
 return regs->pc;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void instruction_pointer_set(struct pt_regs *regs,
  unsigned long val)
{
 regs->pc = val;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long frame_pointer(struct pt_regs *regs)
{
 return regs->regs[29];
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void procedure_link_pointer_set(struct pt_regs *regs,
        unsigned long val)
{
 ((regs)->regs[30]) = val;
}

extern unsigned long profile_pc(struct pt_regs *regs);
# 50 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/virt.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/sections.h" 1







# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/sections.h" 1
# 35 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/sections.h"
extern char _text[], _stext[], _etext[];
extern char _data[], _sdata[], _edata[];
extern char __bss_start[], __bss_stop[];
extern char __init_begin[], __init_end[];
extern char _sinittext[], _einittext[];
extern char __start_ro_after_init[], __end_ro_after_init[];
extern char _end[];
extern char __per_cpu_load[], __per_cpu_start[], __per_cpu_end[];
extern char __kprobes_text_start[], __kprobes_text_end[];
extern char __entry_text_start[], __entry_text_end[];
extern char __start_rodata[], __end_rodata[];
extern char __irqentry_text_start[], __irqentry_text_end[];
extern char __softirqentry_text_start[], __softirqentry_text_end[];
extern char __start_once[], __end_once[];


extern char __ctors_start[], __ctors_end[];


extern char __start_opd[], __end_opd[];


extern char __noinstr_text_start[], __noinstr_text_end[];

extern __attribute__((__externally_visible__)) const void __nosave_begin, __nosave_end;
# 70 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/sections.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int arch_is_kernel_text(unsigned long addr)
{
 return 0;
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int arch_is_kernel_data(unsigned long addr)
{
 return 0;
}
# 91 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/sections.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int arch_is_kernel_initmem_freed(unsigned long addr)
{
 return 0;
}
# 108 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/sections.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool memory_contains(void *begin, void *end, void *virt,
       size_t size)
{
 return virt >= begin && virt + size <= end;
}
# 125 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/sections.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool memory_intersects(void *begin, void *end, void *virt,
         size_t size)
{
 void *vend = virt + size;

 return (virt >= begin && virt < end) || (vend >= begin && vend < end);
}
# 142 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/sections.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool init_section_contains(void *virt, size_t size)
{
 return memory_contains(__init_begin, __init_end, virt, size);
}
# 156 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/sections.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool init_section_intersects(void *virt, size_t size)
{
 return memory_intersects(__init_begin, __init_end, virt, size);
}
# 169 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/sections.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool is_kernel_rodata(unsigned long addr)
{
 return addr >= (unsigned long)__start_rodata &&
        addr < (unsigned long)__end_rodata;
}
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/sections.h" 2

extern char __alt_instructions[], __alt_instructions_end[];
extern char __hibernate_exit_text_start[], __hibernate_exit_text_end[];
extern char __hyp_idmap_text_start[], __hyp_idmap_text_end[];
extern char __hyp_text_start[], __hyp_text_end[];
extern char __idmap_text_start[], __idmap_text_end[];
extern char __initdata_begin[], __initdata_end[];
extern char __inittext_begin[], __inittext_end[];
extern char __exittext_begin[], __exittext_end[];
extern char __irqentry_text_start[], __irqentry_text_end[];
extern char __mmuoff_data_start[], __mmuoff_data_end[];
extern char __entry_tramp_text_start[], __entry_tramp_text_end[];

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) size_t entry_tramp_text_size(void)
{
 return __entry_tramp_text_end - __entry_tramp_text_start;
}
# 51 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/virt.h" 2
# 63 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/virt.h"
extern u32 __boot_cpu_mode[2];

void __hyp_set_vectors(phys_addr_t phys_vector_base);
void __hyp_reset_vectors(void);


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool is_hyp_mode_available(void)
{
 return (__boot_cpu_mode[0] == (0xe12) &&
  __boot_cpu_mode[1] == (0xe12));
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool is_hyp_mode_mismatched(void)
{
 return __boot_cpu_mode[0] != __boot_cpu_mode[1];
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool is_kernel_in_hyp_mode(void)
{
 return ({ u64 __val; asm volatile("mrs %0, " "CurrentEL" : "=r" (__val)); __val; }) == (2 << 2);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool has_vhe(void)
{




 if (is_vhe_hyp_code())
  return true;
 else if (is_nvhe_hyp_code())
  return false;
 else
  return cpus_have_final_cap(11);
}
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/hw_breakpoint.h" 2

struct arch_hw_breakpoint_ctrl {
 u32 __reserved : 19,
 len : 8,
 type : 2,
 privilege : 2,
 enabled : 1;
};

struct arch_hw_breakpoint {
 u64 address;
 u64 trigger;
 struct arch_hw_breakpoint_ctrl ctrl;
};







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 encode_ctrl_reg(struct arch_hw_breakpoint_ctrl ctrl)
{
 u32 val = (ctrl.len << 5) | (ctrl.type << 3) | (ctrl.privilege << 1) |
  ctrl.enabled;

 if (is_kernel_in_hyp_mode() && ctrl.privilege == 1)
  val |= (1 << 13);

 return val;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void decode_ctrl_reg(u32 reg,
       struct arch_hw_breakpoint_ctrl *ctrl)
{
 ctrl->enabled = reg & 0x1;
 reg >>= 1;
 ctrl->privilege = reg & 0x3;
 reg >>= 2;
 ctrl->type = reg & 0x3;
 reg >>= 2;
 ctrl->len = reg & 0xff;
}
# 107 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/hw_breakpoint.h"
struct task_struct;
struct notifier_block;
struct perf_event_attr;
struct perf_event;
struct pmu;

extern int arch_bp_generic_fields(struct arch_hw_breakpoint_ctrl ctrl,
      int *gen_len, int *gen_type, int *offset);
extern int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
extern int hw_breakpoint_arch_parse(struct perf_event *bp,
        const struct perf_event_attr *attr,
        struct arch_hw_breakpoint *hw);
extern int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
        unsigned long val, void *data);

extern int arch_install_hw_breakpoint(struct perf_event *bp);
extern void arch_uninstall_hw_breakpoint(struct perf_event *bp);
extern void hw_breakpoint_pmu_read(struct perf_event *bp);
extern int hw_breakpoint_slots(int type);


extern void hw_breakpoint_thread_switch(struct task_struct *next);
extern void ptrace_hw_copy_thread(struct task_struct *task);
# 140 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/hw_breakpoint.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int get_num_brps(void)
{
 u64 dfr0 = read_sanitised_ftr_reg((((3) << 19) | ((0) << 16) | ((0) << 12) | ((5) << 8) | ((0) << 5)));
 return 1 +
  cpuid_feature_extract_unsigned_field(dfr0,
      12);
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int get_num_wrps(void)
{
 u64 dfr0 = read_sanitised_ftr_reg((((3) << 19) | ((0) << 16) | ((0) << 12) | ((5) << 8) | ((0) << 5)));
 return 1 +
  cpuid_feature_extract_unsigned_field(dfr0,
      20);
}
# 36 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/kasan.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/kasan.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/pgtable-types.h" 1
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/pgtable-types.h"
# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/pgtable-types.h" 2

typedef u64 pteval_t;
typedef u64 pmdval_t;
typedef u64 pudval_t;
typedef u64 p4dval_t;
typedef u64 pgdval_t;




typedef struct { pteval_t pte; } pte_t;




typedef struct { pmdval_t pmd; } pmd_t;





typedef struct { pudval_t pud; } pud_t;




typedef struct { pgdval_t pgd; } pgd_t;



typedef struct { pteval_t pgprot; } pgprot_t;
# 52 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/pgtable-types.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/pgtable-nop4d.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/pgtable-nop4d.h"
typedef struct { pgd_t pgd; } p4d_t;
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/pgtable-nop4d.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int pgd_none(pgd_t pgd) { return 0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int pgd_bad(pgd_t pgd) { return 0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int pgd_present(pgd_t pgd) { return 1; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void pgd_clear(pgd_t *pgd) { }
# 36 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/pgtable-nop4d.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
{
 return (p4d_t *)pgd;
}
# 53 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/pgtable-types.h" 2
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/kasan.h" 2
# 41 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/kasan.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kasan_init(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void kasan_copy_shadow(pgd_t *pgdir) { }
# 37 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/pgtable-hwdef.h" 1
# 39 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/pointer_auth.h" 1





# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/random.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/random.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/once.h" 1







bool __do_once_start(bool *done, unsigned long *flags);
void __do_once_done(bool *done, struct static_key_true *once_key,
      unsigned long *flags, struct module *mod);
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/random.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/random.h" 1
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/random.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/ioctl.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/ioctl.h" 1
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/ioctl.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/asm-generic/ioctl.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/ioctl.h" 2





extern unsigned int __invalid_size_argument_for_IOC;
# 1 "./arch/arm64/include/generated/uapi/asm/ioctl.h" 2
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/ioctl.h" 2
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/random.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/irqnr.h" 1




# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/irqnr.h" 1
# 6 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/irqnr.h" 2


extern int nr_irqs;
extern struct irq_desc *irq_to_desc(unsigned int irq);
unsigned int irq_get_next_irq(unsigned int offset);
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/random.h" 2
# 41 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/uapi/linux/random.h"
struct rand_pool_info {
 int entropy_count;
 int buf_size;
 __u32 buf[0];
};
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/random.h" 2

struct notifier_block;

void add_device_randomness(const void *buf, size_t len);
void add_bootloader_randomness(const void *buf, size_t len);
void add_input_randomness(unsigned int type, unsigned int code,
     unsigned int value) ;
void add_interrupt_randomness(int irq) ;
void add_hwgenerator_randomness(const void *buf, size_t len, size_t entropy);







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void add_latent_entropy(void) { }


void get_random_bytes(void *buf, size_t len);
size_t __attribute__((__warn_unused_result__)) get_random_bytes_arch(void *buf, size_t len);
u32 get_random_u32(void);
u64 get_random_u64(void);
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int get_random_int(void)
{
 return get_random_u32();
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long get_random_long(void)
{

 return get_random_u64();



}
# 62 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/random.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long get_random_canary(void)
{
 return get_random_long() & 0xffffffffffffff00UL;
}

int __attribute__((__section__(".init.text"))) __attribute__((__cold__)) random_init(const char *command_line);
bool rng_is_initialized(void);
int wait_for_random_bytes(void);
int register_random_ready_notifier(struct notifier_block *nb);
int unregister_random_ready_notifier(struct notifier_block *nb);



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int get_random_bytes_wait(void *buf, size_t nbytes)
{
 int ret = wait_for_random_bytes();
 get_random_bytes(buf, nbytes);
 return ret;
}
# 90 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/random.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int get_random_u32_wait(u32 *out) { int ret = wait_for_random_bytes(); if (__builtin_expect(!!(ret), 0)) return ret; *out = get_random_u32(); return 0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int get_random_u64_wait(u32 *out) { int ret = wait_for_random_bytes(); if (__builtin_expect(!!(ret), 0)) return ret; *out = get_random_u64(); return 0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int get_random_int_wait(unsigned int *out) { int ret = wait_for_random_bytes(); if (__builtin_expect(!!(ret), 0)) return ret; *out = get_random_int(); return 0; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int get_random_long_wait(unsigned long *out) { int ret = wait_for_random_bytes(); if (__builtin_expect(!!(ret), 0)) return ret; *out = get_random_long(); return 0; }







# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/prandom.h" 1
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/prandom.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/percpu.h" 1
# 65 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/percpu.h"
extern void *pcpu_base_addr;
extern const unsigned long *pcpu_unit_offsets;

struct pcpu_group_info {
 int nr_units;
 unsigned long base_offset;
 unsigned int *cpu_map;

};

struct pcpu_alloc_info {
 size_t static_size;
 size_t reserved_size;
 size_t dyn_size;
 size_t unit_size;
 size_t atom_size;
 size_t alloc_size;
 size_t __ai_size;
 int nr_groups;
 struct pcpu_group_info groups[];
};

enum pcpu_fc {
 PCPU_FC_AUTO,
 PCPU_FC_EMBED,
 PCPU_FC_PAGE,

 PCPU_FC_NR,
};
extern const char * const pcpu_fc_names[PCPU_FC_NR];

extern enum pcpu_fc pcpu_chosen_fc;

typedef void * (*pcpu_fc_alloc_fn_t)(unsigned int cpu, size_t size,
         size_t align);
typedef void (*pcpu_fc_free_fn_t)(void *ptr, size_t size);
typedef void (*pcpu_fc_populate_pte_fn_t)(unsigned long addr);
typedef int (pcpu_fc_cpu_distance_fn_t)(unsigned int from, unsigned int to);

extern struct pcpu_alloc_info * __attribute__((__section__(".init.text"))) __attribute__((__cold__)) pcpu_alloc_alloc_info(int nr_groups,
            int nr_units);
extern void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) pcpu_free_alloc_info(struct pcpu_alloc_info *ai);

extern void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
      void *base_addr);
# 126 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/percpu.h"
extern void *__alloc_reserved_percpu(size_t size, size_t align);
extern bool __is_kernel_percpu_address(unsigned long addr, unsigned long *can_addr);
extern bool is_kernel_percpu_address(unsigned long addr);


extern void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) setup_per_cpu_areas(void);


extern void *__alloc_percpu_gfp(size_t size, size_t align, gfp_t gfp);
extern void *__alloc_percpu(size_t size, size_t align);
extern void free_percpu(void *__pdata);
extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
# 146 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/percpu.h"
extern unsigned long pcpu_nr_pages(void);
# 13 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/prandom.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/siphash.h" 1
# 20 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/siphash.h"
typedef struct {
 u64 key[2];
} siphash_key_t;

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool siphash_key_is_zero(const siphash_key_t *key)
{
 return !(key->key[0] | key->key[1]);
}

u64 __siphash_aligned(const void *data, size_t len, const siphash_key_t *key);
u64 __siphash_unaligned(const void *data, size_t len, const siphash_key_t *key);

u64 siphash_1u64(const u64 a, const siphash_key_t *key);
u64 siphash_2u64(const u64 a, const u64 b, const siphash_key_t *key);
u64 siphash_3u64(const u64 a, const u64 b, const u64 c,
   const siphash_key_t *key);
u64 siphash_4u64(const u64 a, const u64 b, const u64 c, const u64 d,
   const siphash_key_t *key);
u64 siphash_1u32(const u32 a, const siphash_key_t *key);
u64 siphash_3u32(const u32 a, const u32 b, const u32 c,
   const siphash_key_t *key);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 siphash_2u32(const u32 a, const u32 b,
          const siphash_key_t *key)
{
 return siphash_1u64((u64)b << 32 | a, key);
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 siphash_4u32(const u32 a, const u32 b, const u32 c,
          const u32 d, const siphash_key_t *key)
{
 return siphash_2u64((u64)b << 32 | a, (u64)d << 32 | c, key);
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 ___siphash_aligned(const __le64 *data, size_t len,
         const siphash_key_t *key)
{
 if (__builtin_constant_p(len) && len == 4)
  return siphash_1u32(__le32_to_cpup((const __le32 *)data), key);
 if (__builtin_constant_p(len) && len == 8)
  return siphash_1u64((( __u64)(__le64)(data[0])), key);
 if (__builtin_constant_p(len) && len == 16)
  return siphash_2u64((( __u64)(__le64)(data[0])), (( __u64)(__le64)(data[1])),
        key);
 if (__builtin_constant_p(len) && len == 24)
  return siphash_3u64((( __u64)(__le64)(data[0])), (( __u64)(__le64)(data[1])),
        (( __u64)(__le64)(data[2])), key);
 if (__builtin_constant_p(len) && len == 32)
  return siphash_4u64((( __u64)(__le64)(data[0])), (( __u64)(__le64)(data[1])),
        (( __u64)(__le64)(data[2])), (( __u64)(__le64)(data[3])),
        key);
 return __siphash_aligned(data, len, key);
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u64 siphash(const void *data, size_t len,
     const siphash_key_t *key)
{
 if (1 ||
     !((((unsigned long)data) & ((typeof((unsigned long)data))(__alignof__(u64)) - 1)) == 0))
  return __siphash_unaligned(data, len, key);
 return ___siphash_aligned(data, len, key);
}


typedef struct {
 unsigned long key[2];
} hsiphash_key_t;

u32 __hsiphash_aligned(const void *data, size_t len,
         const hsiphash_key_t *key);
u32 __hsiphash_unaligned(const void *data, size_t len,
    const hsiphash_key_t *key);

u32 hsiphash_1u32(const u32 a, const hsiphash_key_t *key);
u32 hsiphash_2u32(const u32 a, const u32 b, const hsiphash_key_t *key);
u32 hsiphash_3u32(const u32 a, const u32 b, const u32 c,
    const hsiphash_key_t *key);
u32 hsiphash_4u32(const u32 a, const u32 b, const u32 c, const u32 d,
    const hsiphash_key_t *key);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 ___hsiphash_aligned(const __le32 *data, size_t len,
          const hsiphash_key_t *key)
{
 if (__builtin_constant_p(len) && len == 4)
  return hsiphash_1u32((( __u32)(__le32)(data[0])), key);
 if (__builtin_constant_p(len) && len == 8)
  return hsiphash_2u32((( __u32)(__le32)(data[0])), (( __u32)(__le32)(data[1])),
         key);
 if (__builtin_constant_p(len) && len == 12)
  return hsiphash_3u32((( __u32)(__le32)(data[0])), (( __u32)(__le32)(data[1])),
         (( __u32)(__le32)(data[2])), key);
 if (__builtin_constant_p(len) && len == 16)
  return hsiphash_4u32((( __u32)(__le32)(data[0])), (( __u32)(__le32)(data[1])),
         (( __u32)(__le32)(data[2])), (( __u32)(__le32)(data[3])),
         key);
 return __hsiphash_aligned(data, len, key);
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 hsiphash(const void *data, size_t len,
      const hsiphash_key_t *key)
{
 if (1 ||
     !((((unsigned long)data) & ((typeof((unsigned long)data))(__alignof__(unsigned long)) - 1)) == 0))
  return __hsiphash_unaligned(data, len, key);
 return ___hsiphash_aligned(data, len, key);
}
# 14 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/prandom.h" 2

u32 prandom_u32(void);
void prandom_bytes(void *buf, size_t nbytes);
void prandom_seed(u32 seed);
void prandom_reseed_late(void);

extern __attribute__((section(".data..percpu" ""))) __typeof__(unsigned long) net_rand_noise;
# 50 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/prandom.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void prandom_u32_add_noise(unsigned long a, unsigned long b,
      unsigned long c, unsigned long d)
{




 a ^= ({ typeof(net_rand_noise) pscr_ret__; do { const void *__vpp_verify = (typeof((&(net_rand_noise)) + 0))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(net_rand_noise)) { case 1: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(net_rand_noise)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))); (typeof((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))) (__ptr + ((__kern_my_cpu_offset()))); }); }); }); break; case 2: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(net_rand_noise)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))); (typeof((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))) (__ptr + ((__kern_my_cpu_offset()))); }); }); }); break; case 4: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(net_rand_noise)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))); (typeof((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))) (__ptr + ((__kern_my_cpu_offset()))); }); }); }); break; case 8: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(net_rand_noise)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))); (typeof((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))) (__ptr + ((__kern_my_cpu_offset()))); }); }); }); break; default: __bad_size_call_parameter(); break; } pscr_ret__; });
 ( (a) += (b), (b) = rol64((b), 13), (b) ^= (a), (a) = rol64((a), 32), (c) += (d), (d) = rol64((d), 16), (d) ^= (c), (a) += (d), (d) = rol64((d), 21), (d) ^= (a), (c) += (b), (b) = rol64((b), 17), (b) ^= (c), (c) = rol64((c), 32));
 do { do { const void *__vpp_verify = (typeof((&(net_rand_noise)) + 0))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(net_rand_noise)) { case 1: do { *({ do { const void *__vpp_verify = (typeof((&(net_rand_noise)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))); (typeof((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))) (__ptr + ((__kern_my_cpu_offset()))); }); }) = d; } while (0);break; case 2: do { *({ do { const void *__vpp_verify = (typeof((&(net_rand_noise)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))); (typeof((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))) (__ptr + ((__kern_my_cpu_offset()))); }); }) = d; } while (0);break; case 4: do { *({ do { const void *__vpp_verify = (typeof((&(net_rand_noise)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))); (typeof((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))) (__ptr + ((__kern_my_cpu_offset()))); }); }) = d; } while (0);break; case 8: do { *({ do { const void *__vpp_verify = (typeof((&(net_rand_noise)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))); (typeof((typeof(*(&(net_rand_noise))) *)(&(net_rand_noise)))) (__ptr + ((__kern_my_cpu_offset()))); }); }) = d; } while (0);break; default: __bad_size_call_parameter();break; } } while (0);
}

struct rnd_state {
 __u32 s1, s2, s3, s4;
};

u32 prandom_u32_state(struct rnd_state *state);
void prandom_bytes_state(struct rnd_state *state, void *buf, size_t nbytes);
void prandom_seed_full_state(struct rnd_state *pcpu_state);
# 85 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/prandom.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 prandom_u32_max(u32 ep_ro)
{
 return (u32)(((u64) prandom_u32() * ep_ro) >> 32);
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 __seed(u32 x, u32 m)
{
 return (x < m) ? x + m : x;
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void prandom_seed_state(struct rnd_state *state, u64 seed)
{
 u32 i = ((seed >> 32) ^ (seed << 10) ^ seed) & 0xffffffffUL;

 state->s1 = __seed(i, 2U);
 state->s2 = __seed(i, 8U);
 state->s3 = __seed(i, 16U);
 state->s4 = __seed(i, 128U);
 prandom_u32_add_noise((unsigned long)(state), (unsigned long)(i), (unsigned long)(0), (unsigned long)(0));
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) u32 next_pseudo_random32(u32 seed)
{
 return seed * 1664525 + 1013904223;
}
# 102 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/random.h" 2


# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/archrandom.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/archrandom.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __arm64_rndr(unsigned long *v)
{
 bool ok;





 asm volatile(
  "	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	mrs_s, rt, sreg\n" ".inst " "(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	mrs_s " "%0" ", " "(((3) << 19) | ((3) << 16) | ((2) << 12) | ((4) << 8) | ((0) << 5))" "\n" "	.purgem	mrs_s\n" "\n"
 "	cset %w1, ne\n"
 : "=r" (*v), "=r" (ok)
 :
 : "cc");

 return ok;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __attribute__((__warn_unused_result__)) arch_get_random_long(unsigned long *v)
{
 return false;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __attribute__((__warn_unused_result__)) arch_get_random_int(unsigned int *v)
{
 return false;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __attribute__((__warn_unused_result__)) arch_get_random_seed_long(unsigned long *v)
{






 if (!cpus_have_const_cap(49))
  return false;

 return __arm64_rndr(v);
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __attribute__((__warn_unused_result__)) arch_get_random_seed_int(unsigned int *v)
{
 unsigned long val;
 bool ok = arch_get_random_seed_long(&val);

 *v = val;
 return ok;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __attribute__((__section__(".init.text"))) __attribute__((__cold__)) __early_cpu_has_rndr(void)
{

 unsigned long ftr = ({ u64 __val; asm volatile("	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	mrs_s, rt, sreg\n" ".inst " "(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	mrs_s " "%0" ", " "(((3) << 19) | ((0) << 16) | ((0) << 12) | ((6) << 8) | ((0) << 5))" "\n" "	.purgem	mrs_s\n" : "=r" (__val)); __val; });
 return (ftr >> 60) & 0xf;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __attribute__((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((__warn_unused_result__))
arch_get_random_seed_long_early(unsigned long *v)
{
 ({ int __ret_warn_on = !!(system_state != SYSTEM_BOOTING); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"arch/arm64/include/asm/archrandom.h\"; .popsection; .long 14472b - 14470b; .short 73; .short (1 << 0)|(((9) << 8)); .popsection; 14471: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); });

 if (!__early_cpu_has_rndr())
  return false;

 return __arm64_rndr(v);
}
# 105 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/random.h" 2
# 125 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/random.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool __attribute__((__section__(".init.text"))) __attribute__((__cold__)) arch_get_random_long_early(unsigned long *v)
{
 ({ int __ret_warn_on = !!(system_state != SYSTEM_BOOTING); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"include/linux/random.h\"; .popsection; .long 14472b - 14470b; .short 127; .short (1 << 0)|(((9) << 8)); .popsection; 14471: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); });
 return arch_get_random_long(v);
}



int random_prepare_cpu(unsigned int cpu);
int random_online_cpu(unsigned int cpu);
# 7 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/pointer_auth.h" 2
# 40 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spectre.h" 1
# 15 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spectre.h"
enum mitigation_state {
 SPECTRE_UNAFFECTED,
 SPECTRE_MITIGATED,
 SPECTRE_VULNERABLE,
};

struct task_struct;

enum mitigation_state arm64_get_spectre_v2_state(void);
bool has_spectre_v2(const struct arm64_cpu_capabilities *cap, int scope);
void spectre_v2_enable_mitigation(const struct arm64_cpu_capabilities *__unused);

enum mitigation_state arm64_get_spectre_v4_state(void);
bool has_spectre_v4(const struct arm64_cpu_capabilities *cap, int scope);
void spectre_v4_enable_mitigation(const struct arm64_cpu_capabilities *__unused);
void spectre_v4_enable_task_mitigation(struct task_struct *tsk);

enum mitigation_state arm64_get_spectre_bhb_state(void);
bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry, int scope);
u8 spectre_bhb_loop_affected(int scope);
void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *__unused);
# 42 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h" 2
# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 43 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h" 2
# 98 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h"
extern phys_addr_t arm64_dma_phys_limit;


struct debug_info {


 int suspended_step;

 int bps_disabled;
 int wps_disabled;

 struct perf_event *hbp_break[16];
 struct perf_event *hbp_watch[16];

};

struct cpu_context {
 unsigned long x19;
 unsigned long x20;
 unsigned long x21;
 unsigned long x22;
 unsigned long x23;
 unsigned long x24;
 unsigned long x25;
 unsigned long x26;
 unsigned long x27;
 unsigned long x28;
 unsigned long fp;
 unsigned long sp;
 unsigned long pc;
};

struct thread_struct {
 struct cpu_context cpu_context;






 struct {
  unsigned long tp_value;
  unsigned long tp2_value;
  struct user_fpsimd_state fpsimd_state;
 } uw;

 unsigned int fpsimd_cpu;
 void *sve_state;
 unsigned int sve_vl;
 unsigned int sve_vl_onexec;
 unsigned long fault_address;
 unsigned long fault_code;
 struct debug_info debug;





 u64 sctlr_tcf0;
 u64 gcr_user_incl;

};

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void arch_thread_struct_whitelist(unsigned long *offset,
      unsigned long *size)
{

 do { extern void __compiletime_assert_138(void) __attribute__((__error__("BUILD_BUG_ON failed: " "sizeof_field(struct thread_struct, uw) != sizeof_field(struct thread_struct, uw.tp_value) + sizeof_field(struct thread_struct, uw.tp2_value) + sizeof_field(struct thread_struct, uw.fpsimd_state)"))); if (!(!(sizeof((((struct thread_struct *)0)->uw)) != sizeof((((struct thread_struct *)0)->uw.tp_value)) + sizeof((((struct thread_struct *)0)->uw.tp2_value)) + sizeof((((struct thread_struct *)0)->uw.fpsimd_state))))) __compiletime_assert_138(); } while (0)


                                                           ;

 *offset = __builtin_offsetof(struct thread_struct, uw);
 *size = sizeof((((struct thread_struct *)0)->uw));
}
# 189 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h"
void tls_preserve_current_state(void);





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void start_thread_common(struct pt_regs *regs, unsigned long pc)
{
 memset(regs, 0, sizeof(*regs));
 forget_syscall(regs);
 regs->pc = pc;

 if (system_uses_irq_prio_masking())
  regs->pmr_save = 0xe0;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void start_thread(struct pt_regs *regs, unsigned long pc,
    unsigned long sp)
{
 start_thread_common(regs, pc);
 regs->pstate = 0x00000000;
 spectre_v4_enable_task_mitigation(get_current());
 regs->sp = sp;
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void compat_start_thread(struct pt_regs *regs, unsigned long pc,
           unsigned long sp)
{
 start_thread_common(regs, pc);
 regs->pstate = 0x00000010;
 if (pc & 1)
  regs->pstate |= 0x00000020;





 spectre_v4_enable_task_mitigation(get_current());
 regs->regs[13] = sp;
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool is_ttbr0_addr(unsigned long addr)
{

 return addr < (test_ti_thread_flag(((struct thread_info *)get_current()), 22) ? ((((0x100000000UL))) - ((1UL) << 12)) : ((((1UL))) << vabits_actual));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool is_ttbr1_addr(unsigned long addr)
{

 return (addr) >= ((-((((1UL))) << ((48)))));
}


struct task_struct;


extern void release_thread(struct task_struct *);

unsigned long get_wchan(struct task_struct *p);


extern struct task_struct *cpu_switch_to(struct task_struct *prev,
      struct task_struct *next);
# 266 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void prefetch(const void *ptr)
{
 asm volatile("prfm pldl1keep, %a0\n" : : "p" (ptr));
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void prefetchw(const void *ptr)
{
 asm volatile("prfm pstl1keep, %a0\n" : : "p" (ptr));
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void spin_lock_prefetch(const void *ptr)
{
 asm volatile(".if ""1"" == 1\n" "661:\n\t" "prfm pstl1strm, %a0" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "5" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "nop" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n"

              : : "p" (ptr));
}

extern unsigned long __attribute__((__section__(".data..ro_after_init"))) signal_minsigstksz;
extern void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) minsigstksz_setup(void);
# 297 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/fpsimd.h" 1







# 1 "./arch/arm64/include/generated/uapi/asm/errno.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/fpsimd.h" 2

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h" 1
# 11 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/fpsimd.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/sigcontext.h" 1
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/sigcontext.h"
struct sigcontext {
 __u64 fault_address;

 __u64 regs[31];
 __u64 sp;
 __u64 pc;
 __u64 pstate;

 __u8 __reserved[4096] __attribute__((__aligned__(16)));
};
# 66 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/sigcontext.h"
struct _aarch64_ctx {
 __u32 magic;
 __u32 size;
};



struct fpsimd_context {
 struct _aarch64_ctx head;
 __u32 fpsr;
 __u32 fpcr;
 __uint128_t vregs[32];
};
# 92 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/sigcontext.h"
struct esr_context {
 struct _aarch64_ctx head;
 __u64 esr;
};
# 125 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/uapi/asm/sigcontext.h"
struct extra_context {
 struct _aarch64_ctx head;
 __u64 datap;
 __u32 size;
 __u32 __reserved[3];
};



struct sve_context {
 struct _aarch64_ctx head;
 __u16 vl;
 __u16 __reserved[3];
};
# 12 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/fpsimd.h" 2
# 35 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/fpsimd.h"
struct task_struct;

extern void fpsimd_save_state(struct user_fpsimd_state *state);
extern void fpsimd_load_state(struct user_fpsimd_state *state);

extern void fpsimd_thread_switch(struct task_struct *next);
extern void fpsimd_flush_thread(void);

extern void fpsimd_signal_preserve_current_state(void);
extern void fpsimd_preserve_current_state(void);
extern void fpsimd_restore_current_state(void);
extern void fpsimd_update_current_state(struct user_fpsimd_state const *state);

extern void fpsimd_bind_task_to_cpu(void);
extern void fpsimd_bind_state_to_cpu(struct user_fpsimd_state *state,
         void *sve_state, unsigned int sve_vl);

extern void fpsimd_flush_task_state(struct task_struct *target);
extern void fpsimd_save_and_flush_cpu_state(void);





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) size_t sve_ffr_offset(int vl)
{
 return (((sizeof(struct sve_context) + (16 - 1)) / 16 * 16) + ((0 + ((0 + ((__u32)(((vl) / 16)) * 16) * (32)) - 0)) + (((0 + ((0 + ((__u32)(((vl) / 16)) * 16) * (32)) - 0)) + ((__u32)(((vl) / 16)) * (16 / 8)) * (16)) - (0 + ((0 + ((__u32)(((vl) / 16)) * 16) * (32)) - 0))))) - ((sizeof(struct sve_context) + (16 - 1)) / 16 * 16);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void *sve_pffr(struct thread_struct *thread)
{
 return (char *)thread->sve_state + sve_ffr_offset(thread->sve_vl);
}

extern void sve_save_state(void *state, u32 *pfpsr);
extern void sve_load_state(void const *state, u32 const *pfpsr,
      unsigned long vq_minus_1);
extern void sve_flush_live(void);
extern void sve_load_from_fpsimd_state(struct user_fpsimd_state const *state,
           unsigned long vq_minus_1);
extern unsigned int sve_get_vl(void);

struct arm64_cpu_capabilities;
extern void sve_kernel_enable(const struct arm64_cpu_capabilities *__unused);

extern u64 read_zcr_features(void);

extern int __attribute__((__section__(".data..ro_after_init"))) sve_max_vl;
extern int __attribute__((__section__(".data..ro_after_init"))) sve_max_virtualisable_vl;
extern __attribute__((__section__(".data..ro_after_init"))) unsigned long sve_vq_map[(((512) + ((sizeof(long) * 8)) - 1) / ((sizeof(long) * 8)))];






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int __vq_to_bit(unsigned int vq)
{
 return 512 - vq;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned int __bit_to_vq(unsigned int bit)
{
 return 512 - bit;
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool sve_vq_available(unsigned int vq)
{
 return test_bit(__vq_to_bit(vq), sve_vq_map);
}



extern size_t sve_state_size(struct task_struct const *task);

extern void sve_alloc(struct task_struct *task);
extern void fpsimd_release_task(struct task_struct *task);
extern void fpsimd_sync_to_sve(struct task_struct *task);
extern void sve_sync_to_fpsimd(struct task_struct *task);
extern void sve_sync_from_fpsimd_zeropad(struct task_struct *task);

extern int sve_set_vector_length(struct task_struct *task,
     unsigned long vl, unsigned long flags);

extern int sve_set_current_vl(unsigned long arg);
extern int sve_get_current_vl(void);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void sve_user_disable(void)
{
 do { u64 __scs_val = ({ u64 __val; asm volatile("mrs %0, " "cpacr_el1" : "=r" (__val)); __val; }); u64 __scs_new = (__scs_val & ~(u64)((((((1UL))) << (17))))) | (0); if (__scs_new != __scs_val) do { u64 __val = (u64)(__scs_new); asm volatile("msr " "cpacr_el1" ", %x0" : : "rZ" (__val)); } while (0); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void sve_user_enable(void)
{
 do { u64 __scs_val = ({ u64 __val; asm volatile("mrs %0, " "cpacr_el1" : "=r" (__val)); __val; }); u64 __scs_new = (__scs_val & ~(u64)(0)) | ((((((1UL))) << (17)))); if (__scs_new != __scs_val) do { u64 __val = (u64)(__scs_new); asm volatile("msr " "cpacr_el1" ", %x0" : : "rZ" (__val)); } while (0); } while (0);
}





extern void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) sve_init_vq_map(void);
extern void sve_update_vq_map(void);
extern int sve_verify_vq_map(void);
extern void __attribute__((__section__(".init.text"))) __attribute__((__cold__)) sve_setup(void);
# 170 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/fpsimd.h"
extern void __efi_fpsimd_begin(void);
extern void __efi_fpsimd_end(void);
# 298 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h" 2
# 308 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/processor.h"
long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
long get_tagged_addr_ctrl(struct task_struct *task);
# 20 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/osq_lock.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/osq_lock.h"
struct optimistic_spin_node {
 struct optimistic_spin_node *next, *prev;
 int locked;
 int cpu;
};

struct optimistic_spin_queue {




 atomic_t tail;
};






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void osq_lock_init(struct optimistic_spin_queue *lock)
{
 atomic_set(&lock->tail, (0));
}

extern bool osq_lock(struct optimistic_spin_queue *lock);
extern void osq_unlock(struct optimistic_spin_queue *lock);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool osq_is_locked(struct optimistic_spin_queue *lock)
{
 return atomic_read(&lock->tail) != (0);
}
# 21 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/debug_locks.h" 1
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/debug_locks.h"
struct task_struct;

extern int debug_locks __attribute__((__section__(".data..read_mostly")));
extern int debug_locks_silent __attribute__((__section__(".data..read_mostly")));


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int __debug_locks_off(void)
{
 return ({ typeof(&debug_locks) __ai_ptr = (&debug_locks); instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); ({ __typeof__(*(__ai_ptr)) __ret; __ret = (__typeof__(*(__ai_ptr))) __xchg_mb((unsigned long)(0), (__ai_ptr), sizeof(*(__ai_ptr))); __ret; }); });
}




extern int debug_locks_off(void);
# 51 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/debug_locks.h"
struct task_struct;







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void debug_show_all_locks(void)
{
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void debug_show_held_locks(struct task_struct *task)
{
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void
debug_check_no_locks_freed(const void *from, unsigned long len)
{
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void
debug_check_no_locks_held(void)
{
}
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h" 2

struct ww_acquire_ctx;
# 53 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h"
struct mutex {
 atomic_long_t owner;
 spinlock_t wait_lock;

 struct optimistic_spin_queue osq;

 struct list_head wait_list;






};

struct ww_class;
struct ww_acquire_ctx;

struct ww_mutex {
 struct mutex base;
 struct ww_acquire_ctx *ctx;



};





struct mutex_waiter {
 struct list_head list;
 struct task_struct *task;
 struct ww_acquire_ctx *ww_ctx;



};
# 103 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void mutex_destroy(struct mutex *lock) {}
# 142 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h"
extern void __mutex_init(struct mutex *lock, const char *name,
    struct lock_class_key *key);







extern bool mutex_is_locked(struct mutex *lock);
# 179 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h"
extern void mutex_lock(struct mutex *lock);
extern int __attribute__((__warn_unused_result__)) mutex_lock_interruptible(struct mutex *lock);
extern int __attribute__((__warn_unused_result__)) mutex_lock_killable(struct mutex *lock);
extern void mutex_lock_io(struct mutex *lock);
# 197 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h"
extern int mutex_trylock(struct mutex *lock);
extern void mutex_unlock(struct mutex *lock);

extern int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);





enum mutex_trylock_recursive_enum {
 MUTEX_TRYLOCK_FAILED = 0,
 MUTEX_TRYLOCK_SUCCESS = 1,
 MUTEX_TRYLOCK_RECURSIVE,
};
# 224 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/mutex.h"
extern __attribute__((__warn_unused_result__)) enum mutex_trylock_recursive_enum
mutex_trylock_recursive(struct mutex *lock);
# 21 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/linux/lock.h" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h" 1
# 54 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/irqflags.h" 1
# 16 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/irqflags.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/irqflags.h" 1
# 29 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/irqflags.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void arch_local_irq_enable(void)
{
 if (system_has_prio_mask_debugging()) {
  u32 pmr = ({ u64 __val; asm volatile("	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	mrs_s, rt, sreg\n" ".inst " "(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	mrs_s " "%0" ", " "(((3) << 19) | ((0) << 16) | ((4) << 12) | ((6) << 8) | ((0) << 5))" "\n" "	.purgem	mrs_s\n" : "=r" (__val)); __val; });

  ({ int __ret_warn_on = !!(pmr != 0xe0 && pmr != ({ extern struct static_key_false gic_nonsecure_priorities; u8 __prio = (0xe0 & ~0x80); if (({ bool branch; if (__builtin_types_compatible_p(typeof(*&gic_nonsecure_priorities), struct static_key_true)) branch = arch_static_branch_jump(&(&gic_nonsecure_priorities)->key, false); else if (__builtin_types_compatible_p(typeof(*&gic_nonsecure_priorities), struct static_key_false)) branch = arch_static_branch(&(&gic_nonsecure_priorities)->key, false); else branch = ____wrong_branch_error(); __builtin_expect(!!(branch), 0); })) __prio = 0xa0; __prio; })); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"arch/arm64/include/asm/irqflags.h\"; .popsection; .long 14472b - 14470b; .short 34; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 14471: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); });
 }

 asm volatile(".if ""1"" == 1\n" "661:\n\t" "msr	daifclr, #2		// arch_local_irq_enable" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "42" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" "	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	msr_s, sreg, rt\n" ".inst " "(0xd5000000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	msr_s " "(((3) << 19) | ((0) << 16) | ((4) << 12) | ((6) << 8) | ((0) << 5))" ", " "%0" "\n" "	.purgem	msr_s\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n"



  :
  : "r" ((unsigned long) 0xe0)
  : "memory");

 do {} while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void arch_local_irq_disable(void)
{
 if (system_has_prio_mask_debugging()) {
  u32 pmr = ({ u64 __val; asm volatile("	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	mrs_s, rt, sreg\n" ".inst " "(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	mrs_s " "%0" ", " "(((3) << 19) | ((0) << 16) | ((4) << 12) | ((6) << 8) | ((0) << 5))" "\n" "	.purgem	mrs_s\n" : "=r" (__val)); __val; });

  ({ int __ret_warn_on = !!(pmr != 0xe0 && pmr != ({ extern struct static_key_false gic_nonsecure_priorities; u8 __prio = (0xe0 & ~0x80); if (({ bool branch; if (__builtin_types_compatible_p(typeof(*&gic_nonsecure_priorities), struct static_key_true)) branch = arch_static_branch_jump(&(&gic_nonsecure_priorities)->key, false); else if (__builtin_types_compatible_p(typeof(*&gic_nonsecure_priorities), struct static_key_false)) branch = arch_static_branch(&(&gic_nonsecure_priorities)->key, false); else branch = ____wrong_branch_error(); __builtin_expect(!!(branch), 0); })) __prio = 0xa0; __prio; })); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,\"aMS\",@progbits,1; 14472: .string \"arch/arm64/include/asm/irqflags.h\"; .popsection; .long 14472b - 14470b; .short 53; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 14471: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); });
 }

 asm volatile(".if ""1"" == 1\n" "661:\n\t" "msr	daifset, #2		// arch_local_irq_disable" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "42" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" "	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	msr_s, sreg, rt\n" ".inst " "(0xd5000000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	msr_s " "(((3) << 19) | ((0) << 16) | ((4) << 12) | ((6) << 8) | ((0) << 5))" ", " "%0" "\n" "	.purgem	msr_s\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n"



  :
  : "r" ((unsigned long) ({ extern struct static_key_false gic_nonsecure_priorities; u8 __prio = (0xe0 & ~0x80); if (({ bool branch; if (__builtin_types_compatible_p(typeof(*&gic_nonsecure_priorities), struct static_key_true)) branch = arch_static_branch_jump(&(&gic_nonsecure_priorities)->key, false); else if (__builtin_types_compatible_p(typeof(*&gic_nonsecure_priorities), struct static_key_false)) branch = arch_static_branch(&(&gic_nonsecure_priorities)->key, false); else branch = ____wrong_branch_error(); __builtin_expect(!!(branch), 0); })) __prio = 0xa0; __prio; }))
  : "memory");
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long arch_local_save_flags(void)
{
 unsigned long flags;

 asm volatile(".if ""1"" == 1\n" "661:\n\t" "mrs	%0, daif" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "42" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" "	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	mrs_s, rt, sreg\n" ".inst " "(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	mrs_s " "%0" ", " "(((3) << 19) | ((0) << 16) | ((4) << 12) | ((6) << 8) | ((0) << 5))" "\n" "	.purgem	mrs_s\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n"



  : "=&r" (flags)
  :
  : "memory");

 return flags;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int arch_irqs_disabled_flags(unsigned long flags)
{
 int res;

 asm volatile(".if ""1"" == 1\n" "661:\n\t" "and	%w0, %w1, #" "0x00000080" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "42" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" "eor	%w0, %w1, #" "0xe0" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n"



  : "=&r" (res)
  : "r" ((int) flags)
  : "memory");

 return res;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int arch_irqs_disabled(void)
{
 return arch_irqs_disabled_flags(arch_local_save_flags());
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long arch_local_irq_save(void)
{
 unsigned long flags;

 flags = arch_local_save_flags();





 if (!arch_irqs_disabled_flags(flags))
  arch_local_irq_disable();

 return flags;
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void arch_local_irq_restore(unsigned long flags)
{
 if (!arch_irqs_disabled_flags(flags)) {
  asm volatile(".if ""1"" == 1\n" "661:\n\t" "msr	daifclr, #2		// arch_local_irq_enable" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "42" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" "	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" "	.equ	.L__reg_num_x\\num, \\num\n" "	.endr\n" "	.equ	.L__reg_num_xzr, 31\n" "	.macro	msr_s, sreg, rt\n" ".inst " "(0xd5000000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t" "	.endm\n" "	msr_s " "(((3) << 19) | ((0) << 16) | ((4) << 12) | ((6) << 8) | ((0) << 5))" ", " "%0" "\n" "	.purgem	msr_s\n" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n"



   :
   : "r" ((unsigned long) 0xe0)
   : "memory");

  do {} while (0);
 }
}
# 17 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/irqflags.h" 2
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/irqflags.h"
  static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void lockdep_softirqs_on(unsigned long ip) { }
  static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void lockdep_softirqs_off(unsigned long ip) { }
  static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void lockdep_hardirqs_on_prepare(unsigned long ip) { }
  static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void lockdep_hardirqs_on(unsigned long ip) { }
  static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void lockdep_hardirqs_off(unsigned long ip) { }
# 55 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h" 2



# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bottom_half.h" 1
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/bottom_half.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void __local_bh_disable_ip(unsigned long ip, unsigned int cnt)
{
 __preempt_count_add(cnt);
 __asm__ __volatile__("": : :"memory");
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void local_bh_disable(void)
{
 __local_bh_disable_ip(({ __label__ __here; __here: (unsigned long)&&__here; }), (2 * (1UL << (0 + 8))));
}

extern void _local_bh_enable(void);
extern void __local_bh_enable_ip(unsigned long ip, unsigned int cnt);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void local_bh_enable_ip(unsigned long ip)
{
 __local_bh_enable_ip(ip, (2 * (1UL << (0 + 8))));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void local_bh_enable(void)
{
 __local_bh_enable_ip(({ __label__ __here; __here: (unsigned long)&&__here; }), (2 * (1UL << (0 + 8))));
}
# 59 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h" 2


# 1 "./arch/arm64/include/generated/asm/mmiowb.h" 1
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/mmiowb.h" 1
# 1 "./arch/arm64/include/generated/asm/mmiowb.h" 2
# 62 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h" 2
# 90 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock.h" 1







# 1 "./arch/arm64/include/generated/asm/qrwlock.h" 1
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qrwlock.h" 1
# 30 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qrwlock.h"
extern void queued_read_lock_slowpath(struct qrwlock *lock);
extern void queued_write_lock_slowpath(struct qrwlock *lock);






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int queued_read_trylock(struct qrwlock *lock)
{
 u32 cnts;

 cnts = atomic_read(&lock->cnts);
 if (__builtin_expect(!!(!(cnts & 0x1ff)), 1)) {
  cnts = (u32)atomic_add_return_acquire((1U << 9), &lock->cnts);
  if (__builtin_expect(!!(!(cnts & 0x1ff)), 1))
   return 1;
  atomic_sub((1U << 9), &lock->cnts);
 }
 return 0;
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int queued_write_trylock(struct qrwlock *lock)
{
 u32 cnts;

 cnts = atomic_read(&lock->cnts);
 if (__builtin_expect(!!(cnts), 0))
  return 0;

 return __builtin_expect(!!(atomic_try_cmpxchg_acquire(&lock->cnts, &cnts, 0x0ff)), 1)
                ;
}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void queued_read_lock(struct qrwlock *lock)
{
 u32 cnts;

 cnts = atomic_add_return_acquire((1U << 9), &lock->cnts);
 if (__builtin_expect(!!(!(cnts & 0x1ff)), 1))
  return;


 queued_read_lock_slowpath(lock);
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void queued_write_lock(struct qrwlock *lock)
{
 u32 cnts = 0;

 if (__builtin_expect(!!(atomic_try_cmpxchg_acquire(&lock->cnts, &cnts, 0x0ff)), 1))
  return;

 queued_write_lock_slowpath(lock);
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void queued_read_unlock(struct qrwlock *lock)
{



 (void)atomic_sub_return_release((1U << 9), &lock->cnts);
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void queued_write_unlock(struct qrwlock *lock)
{
 do { typeof(&lock->wlocked) __p = (&lock->wlocked); union { typeof( _Generic((*&lock->wlocked), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&lock->wlocked))) __val; char __c[1]; } __u = { .__val = ( typeof( _Generic((*&lock->wlocked), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&lock->wlocked)))) (0) }; do { extern void __compiletime_assert_139(void) __attribute__((__error__("Need native word sized stores/loads for atomicity."))); if (!((sizeof(*&lock->wlocked) == sizeof(char) || sizeof(*&lock->wlocked) == sizeof(short) || sizeof(*&lock->wlocked) == sizeof(int) || sizeof(*&lock->wlocked) == sizeof(long)))) __compiletime_assert_139(); } while (0); kasan_check_write(__p, sizeof(*&lock->wlocked)); switch (sizeof(*&lock->wlocked)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*__p) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*__p) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*__p) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*__p) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0);
}
# 1 "./arch/arm64/include/generated/asm/qrwlock.h" 2
# 9 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock.h" 2
# 1 "./arch/arm64/include/generated/asm/qspinlock.h" 1
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qspinlock.h" 1
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qspinlock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int queued_spin_is_locked(struct qspinlock *lock)
{




 return atomic_read(&lock->val);
}
# 42 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/asm-generic/qspinlock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int queued_spin_value_unlocked(struct qspinlock lock)
{
 return !atomic_read(&lock.val);
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int queued_spin_is_contended(struct qspinlock *lock)
{
 return atomic_read(&lock->val) & ~(((1U << 8) - 1) << 0);
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int queued_spin_trylock(struct qspinlock *lock)
{
 u32 val = atomic_read(&lock->val);

 if (__builtin_expect(!!(val), 0))
  return 0;

 return __builtin_expect(!!(atomic_try_cmpxchg_acquire(&lock->val, &val, (1U << 0))), 1);
}

extern void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void queued_spin_lock(struct qspinlock *lock)
{
 u32 val = 0;

 if (__builtin_expect(!!(atomic_try_cmpxchg_acquire(&lock->val, &val, (1U << 0))), 1))
  return;

 queued_spin_lock_slowpath(lock, val);
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void queued_spin_unlock(struct qspinlock *lock)
{



 do { typeof(&lock->locked) __p = (&lock->locked); union { typeof( _Generic((*&lock->locked), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&lock->locked))) __val; char __c[1]; } __u = { .__val = ( typeof( _Generic((*&lock->locked), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&lock->locked)))) (0) }; do { extern void __compiletime_assert_140(void) __attribute__((__error__("Need native word sized stores/loads for atomicity."))); if (!((sizeof(*&lock->locked) == sizeof(char) || sizeof(*&lock->locked) == sizeof(short) || sizeof(*&lock->locked) == sizeof(int) || sizeof(*&lock->locked) == sizeof(long)))) __compiletime_assert_140(); } while (0); kasan_check_write(__p, sizeof(*&lock->locked)); switch (sizeof(*&lock->locked)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*__p) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*__p) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*__p) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*__p) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) bool virt_spin_lock(struct qspinlock *lock)
{
 return false;
}
# 1 "./arch/arm64/include/generated/asm/qspinlock.h" 2
# 10 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock.h" 2
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/arch/arm64/include/asm/spinlock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) bool vcpu_is_preempted(int cpu)
{
 return false;
}
# 91 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h" 2
# 180 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void do_raw_spin_lock(raw_spinlock_t *lock)
{
 (void)0;
 queued_spin_lock(&lock->raw_lock);
 do { } while (0);
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void
do_raw_spin_lock_flags(raw_spinlock_t *lock, unsigned long *flags)
{
 (void)0;
 queued_spin_lock(&lock->raw_lock);
 do { } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int do_raw_spin_trylock(raw_spinlock_t *lock)
{
 int ret = queued_spin_trylock(&(lock)->raw_lock);

 if (ret)
  do { } while (0);

 return ret;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void do_raw_spin_unlock(raw_spinlock_t *lock)
{
 do { } while (0);
 queued_spin_unlock(&lock->raw_lock);
 (void)0;
}
# 312 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h"
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/rwlock.h" 1
# 313 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h" 2





# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_api_smp.h" 1
# 18 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_api_smp.h"
int in_lock_functions(unsigned long addr);



void __attribute__((__section__(".spinlock.text"))) _raw_spin_lock(raw_spinlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_spin_lock_nested(raw_spinlock_t *lock, int subclass)
        ;
void __attribute__((__section__(".spinlock.text")))
_raw_spin_lock_nest_lock(raw_spinlock_t *lock, struct lockdep_map *map)
        ;
void __attribute__((__section__(".spinlock.text"))) _raw_spin_lock_bh(raw_spinlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_spin_lock_irq(raw_spinlock_t *lock)
        ;

unsigned long __attribute__((__section__(".spinlock.text"))) _raw_spin_lock_irqsave(raw_spinlock_t *lock)
        ;
unsigned long __attribute__((__section__(".spinlock.text")))
_raw_spin_lock_irqsave_nested(raw_spinlock_t *lock, int subclass)
        ;
int __attribute__((__section__(".spinlock.text"))) _raw_spin_trylock(raw_spinlock_t *lock);
int __attribute__((__section__(".spinlock.text"))) _raw_spin_trylock_bh(raw_spinlock_t *lock);
void __attribute__((__section__(".spinlock.text"))) _raw_spin_unlock(raw_spinlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_spin_unlock_bh(raw_spinlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_spin_unlock_irq(raw_spinlock_t *lock) ;
void __attribute__((__section__(".spinlock.text")))
_raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
        ;
# 86 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_api_smp.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __raw_spin_trylock(raw_spinlock_t *lock)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 if (do_raw_spin_trylock(lock)) {
  do { } while (0);
  return 1;
 }
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
 return 0;
}
# 104 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_api_smp.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long __raw_spin_lock_irqsave(raw_spinlock_t *lock)
{
 unsigned long flags;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = arch_local_irq_save(); } while (0); } while (0);
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
# 119 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_api_smp.h"
 do_raw_spin_lock_flags(lock, &flags);

 return flags;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_spin_lock_irq(raw_spinlock_t *lock)
{
 do { arch_local_irq_disable(); } while (0);
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
 do_raw_spin_lock(lock);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_spin_lock_bh(raw_spinlock_t *lock)
{
 __local_bh_disable_ip((unsigned long)(void *)((((unsigned long)__builtin_return_address(0) & ((((1ULL))) << (55))) ? ((unsigned long)__builtin_return_address(0) | ((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (63)) * 0l)) : (int *)8))), (vabits_actual) > (63), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (63)))))) : ((unsigned long)__builtin_return_address(0) & ~((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (54)) * 0l)) : (int *)8))), (vabits_actual) > (54), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (54)))))))), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
 do { } while (0);
 do_raw_spin_lock(lock);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_spin_lock(raw_spinlock_t *lock)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
 do_raw_spin_lock(lock);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_spin_unlock(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_spin_unlock_irqrestore(raw_spinlock_t *lock,
         unsigned long flags)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); arch_local_irq_restore(flags); } while (0); } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_spin_unlock_irq(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { arch_local_irq_enable(); } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_spin_unlock_bh(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 __local_bh_enable_ip((unsigned long)(void *)((((unsigned long)__builtin_return_address(0) & ((((1ULL))) << (55))) ? ((unsigned long)__builtin_return_address(0) | ((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (63)) * 0l)) : (int *)8))), (vabits_actual) > (63), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (63)))))) : ((unsigned long)__builtin_return_address(0) & ~((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (54)) * 0l)) : (int *)8))), (vabits_actual) > (54), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (54)))))))), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __raw_spin_trylock_bh(raw_spinlock_t *lock)
{
 __local_bh_disable_ip((unsigned long)(void *)((((unsigned long)__builtin_return_address(0) & ((((1ULL))) << (55))) ? ((unsigned long)__builtin_return_address(0) | ((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (63)) * 0l)) : (int *)8))), (vabits_actual) > (63), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (63)))))) : ((unsigned long)__builtin_return_address(0) & ~((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (54)) * 0l)) : (int *)8))), (vabits_actual) > (54), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (54)))))))), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
 if (do_raw_spin_trylock(lock)) {
  do { } while (0);
  return 1;
 }
 __local_bh_enable_ip((unsigned long)(void *)((((unsigned long)__builtin_return_address(0) & ((((1ULL))) << (55))) ? ((unsigned long)__builtin_return_address(0) | ((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (63)) * 0l)) : (int *)8))), (vabits_actual) > (63), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (63)))))) : ((unsigned long)__builtin_return_address(0) & ~((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (54)) * 0l)) : (int *)8))), (vabits_actual) > (54), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (54)))))))), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
 return 0;
}

# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/rwlock_api_smp.h" 1
# 18 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/rwlock_api_smp.h"
void __attribute__((__section__(".spinlock.text"))) _raw_read_lock(rwlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_write_lock(rwlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_read_lock_bh(rwlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_write_lock_bh(rwlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_read_lock_irq(rwlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_write_lock_irq(rwlock_t *lock) ;
unsigned long __attribute__((__section__(".spinlock.text"))) _raw_read_lock_irqsave(rwlock_t *lock)
       ;
unsigned long __attribute__((__section__(".spinlock.text"))) _raw_write_lock_irqsave(rwlock_t *lock)
       ;
int __attribute__((__section__(".spinlock.text"))) _raw_read_trylock(rwlock_t *lock);
int __attribute__((__section__(".spinlock.text"))) _raw_write_trylock(rwlock_t *lock);
void __attribute__((__section__(".spinlock.text"))) _raw_read_unlock(rwlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_write_unlock(rwlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_read_unlock_bh(rwlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_write_unlock_bh(rwlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_read_unlock_irq(rwlock_t *lock) ;
void __attribute__((__section__(".spinlock.text"))) _raw_write_unlock_irq(rwlock_t *lock) ;
void __attribute__((__section__(".spinlock.text")))
_raw_read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
       ;
void __attribute__((__section__(".spinlock.text")))
_raw_write_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
       ;
# 117 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/rwlock_api_smp.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __raw_read_trylock(rwlock_t *lock)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 if (queued_read_trylock(&(lock)->raw_lock)) {
  do { if (0) do { } while (0); else do { } while (0); } while (0);
  return 1;
 }
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
 return 0;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int __raw_write_trylock(rwlock_t *lock)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 if (queued_write_trylock(&(lock)->raw_lock)) {
  do { } while (0);
  return 1;
 }
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
 return 0;
}
# 146 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/rwlock_api_smp.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_read_lock(rwlock_t *lock)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { if (0) do { } while (0); else do { } while (0); } while (0);
 do {(void)0; queued_read_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long __raw_read_lock_irqsave(rwlock_t *lock)
{
 unsigned long flags;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = arch_local_irq_save(); } while (0); } while (0);
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { if (0) do { } while (0); else do { } while (0); } while (0);
 do {(void)0; queued_read_lock(&((lock))->raw_lock); } while (0)
                                       ;
 return flags;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_read_lock_irq(rwlock_t *lock)
{
 do { arch_local_irq_disable(); } while (0);
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { if (0) do { } while (0); else do { } while (0); } while (0);
 do {(void)0; queued_read_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_read_lock_bh(rwlock_t *lock)
{
 __local_bh_disable_ip((unsigned long)(void *)((((unsigned long)__builtin_return_address(0) & ((((1ULL))) << (55))) ? ((unsigned long)__builtin_return_address(0) | ((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (63)) * 0l)) : (int *)8))), (vabits_actual) > (63), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (63)))))) : ((unsigned long)__builtin_return_address(0) & ~((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (54)) * 0l)) : (int *)8))), (vabits_actual) > (54), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (54)))))))), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
 do { if (0) do { } while (0); else do { } while (0); } while (0);
 do {(void)0; queued_read_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) unsigned long __raw_write_lock_irqsave(rwlock_t *lock)
{
 unsigned long flags;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = arch_local_irq_save(); } while (0); } while (0);
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
 do {(void)0; queued_write_lock(&((lock))->raw_lock); } while (0)
                                        ;
 return flags;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_write_lock_irq(rwlock_t *lock)
{
 do { arch_local_irq_disable(); } while (0);
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
 do {(void)0; queued_write_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_write_lock_bh(rwlock_t *lock)
{
 __local_bh_disable_ip((unsigned long)(void *)((((unsigned long)__builtin_return_address(0) & ((((1ULL))) << (55))) ? ((unsigned long)__builtin_return_address(0) | ((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (63)) * 0l)) : (int *)8))), (vabits_actual) > (63), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (63)))))) : ((unsigned long)__builtin_return_address(0) & ~((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (54)) * 0l)) : (int *)8))), (vabits_actual) > (54), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (54)))))))), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
 do { } while (0);
 do {(void)0; queued_write_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_write_lock(rwlock_t *lock)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
 do {(void)0; queued_write_lock(&(lock)->raw_lock); } while (0);
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_write_unlock(rwlock_t *lock)
{
 do { } while (0);
 do {queued_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_read_unlock(rwlock_t *lock)
{
 do { } while (0);
 do {queued_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void
__raw_read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
{
 do { } while (0);
 do {queued_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); arch_local_irq_restore(flags); } while (0); } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_read_unlock_irq(rwlock_t *lock)
{
 do { } while (0);
 do {queued_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { arch_local_irq_enable(); } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_read_unlock_bh(rwlock_t *lock)
{
 do { } while (0);
 do {queued_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 __local_bh_enable_ip((unsigned long)(void *)((((unsigned long)__builtin_return_address(0) & ((((1ULL))) << (55))) ? ((unsigned long)__builtin_return_address(0) | ((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (63)) * 0l)) : (int *)8))), (vabits_actual) > (63), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (63)))))) : ((unsigned long)__builtin_return_address(0) & ~((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (54)) * 0l)) : (int *)8))), (vabits_actual) > (54), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (54)))))))), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_write_unlock_irqrestore(rwlock_t *lock,
          unsigned long flags)
{
 do { } while (0);
 do {queued_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); arch_local_irq_restore(flags); } while (0); } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_write_unlock_irq(rwlock_t *lock)
{
 do { } while (0);
 do {queued_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { arch_local_irq_enable(); } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void __raw_write_unlock_bh(rwlock_t *lock)
{
 do { } while (0);
 do {queued_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 __local_bh_enable_ip((unsigned long)(void *)((((unsigned long)__builtin_return_address(0) & ((((1ULL))) << (55))) ? ((unsigned long)__builtin_return_address(0) | ((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (63)) * 0l)) : (int *)8))), (vabits_actual) > (63), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (63)))))) : ((unsigned long)__builtin_return_address(0) & ~((((int)(sizeof(struct { int:(-!!(__builtin_choose_expr( (sizeof(int) == sizeof(*(8 ? ((void *)((long)((vabits_actual) > (54)) * 0l)) : (int *)8))), (vabits_actual) > (54), 0))); })))) + (((~(((0ULL)))) - ((((1ULL))) << (vabits_actual)) + 1) & (~(((0ULL))) >> (64 - 1 - (54)))))))), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
}
# 191 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock_api_smp.h" 2
# 319 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h" 2
# 327 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) raw_spinlock_t *spinlock_check(spinlock_t *lock)
{
 return &lock->rlock;
}
# 352 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void spin_lock(spinlock_t *lock)
{
 _raw_spin_lock(&lock->rlock);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void spin_lock_bh(spinlock_t *lock)
{
 _raw_spin_lock_bh(&lock->rlock);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int spin_trylock(spinlock_t *lock)
{
 return (_raw_spin_trylock(&lock->rlock));
}
# 377 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void spin_lock_irq(spinlock_t *lock)
{
 _raw_spin_lock_irq(&lock->rlock);
}
# 392 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void spin_unlock(spinlock_t *lock)
{
 _raw_spin_unlock(&lock->rlock);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void spin_unlock_bh(spinlock_t *lock)
{
 _raw_spin_unlock_bh(&lock->rlock);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void spin_unlock_irq(spinlock_t *lock)
{
 _raw_spin_unlock_irq(&lock->rlock);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
{
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); _raw_spin_unlock_irqrestore(&lock->rlock, flags); } while (0);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int spin_trylock_bh(spinlock_t *lock)
{
 return (_raw_spin_trylock_bh(&lock->rlock));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int spin_trylock_irq(spinlock_t *lock)
{
 return ({ do { arch_local_irq_disable(); } while (0); (_raw_spin_trylock(&lock->rlock)) ? 1 : ({ do { arch_local_irq_enable(); } while (0); 0; }); });
}
# 445 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int spin_is_locked(spinlock_t *lock)
{
 return queued_spin_is_locked(&(&lock->rlock)->raw_lock);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) __attribute__((__always_inline__)) int spin_is_contended(spinlock_t *lock)
{
 return queued_spin_is_contended(&(&lock->rlock)->raw_lock);
}
# 470 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h"
extern int _atomic_dec_and_lock(atomic_t *atomic, spinlock_t *lock);



extern int _atomic_dec_and_lock_irqsave(atomic_t *atomic, spinlock_t *lock,
     unsigned long *flags);



int __alloc_bucket_spinlocks(spinlock_t **locks, unsigned int *lock_mask,
        size_t max_size, unsigned int cpu_mult,
        gfp_t gfp, const char *name,
        struct lock_class_key *key);
# 494 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/kernel-5.10/include/linux/spinlock.h"
void free_bucket_spinlocks(spinlock_t *locks);
# 22 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/linux/lock.h" 2

struct nvgpu_mutex {
 struct mutex mutex;
};
struct nvgpu_spinlock {
 spinlock_t spinlock;
};
struct nvgpu_raw_spinlock {
 raw_spinlock_t spinlock;
};

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_mutex_init(struct nvgpu_mutex *mutex)
{
 do { static struct lock_class_key __key; __mutex_init((&mutex->mutex), "&mutex->mutex", &__key); } while (0);
};
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_mutex_acquire(struct nvgpu_mutex *mutex)
{
 mutex_lock(&mutex->mutex);
};
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_mutex_release(struct nvgpu_mutex *mutex)
{
 mutex_unlock(&mutex->mutex);
};
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) int nvgpu_mutex_tryacquire(struct nvgpu_mutex *mutex)
{
 return mutex_trylock(&mutex->mutex);
};
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_mutex_destroy(struct nvgpu_mutex *mutex)
{
 mutex_destroy(&mutex->mutex);
};

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_spinlock_init(struct nvgpu_spinlock *spinlock)
{
 do { spinlock_check(&spinlock->spinlock); *(&spinlock->spinlock) = (spinlock_t) { { .rlock = { .raw_lock = { { .val = { (0) } } }, } } }; } while (0);
};
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_spinlock_acquire(struct nvgpu_spinlock *spinlock)
{
 spin_lock(&spinlock->spinlock);
};
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_spinlock_release(struct nvgpu_spinlock *spinlock)
{
 spin_unlock(&spinlock->spinlock);
};







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_raw_spinlock_init(struct nvgpu_raw_spinlock *spinlock)
{
 do { *(&spinlock->spinlock) = (raw_spinlock_t) { .raw_lock = { { .val = { (0) } } }, }; } while (0);
};
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_raw_spinlock_acquire(struct nvgpu_raw_spinlock *spinlock)
{
 _raw_spin_lock(&spinlock->spinlock);
};
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((__no_instrument_function__)) void nvgpu_raw_spinlock_release(struct nvgpu_raw_spinlock *spinlock)
{
 _raw_spin_unlock(&spinlock->spinlock);
};
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h" 2
# 39 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
struct nvgpu_mutex;
# 48 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
struct nvgpu_spinlock;
# 57 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
struct nvgpu_raw_spinlock;
# 69 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
void nvgpu_mutex_init(struct nvgpu_mutex *mutex);
# 83 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
void nvgpu_mutex_acquire(struct nvgpu_mutex *mutex);
# 96 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
void nvgpu_mutex_release(struct nvgpu_mutex *mutex);
# 115 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
int nvgpu_mutex_tryacquire(struct nvgpu_mutex *mutex);
# 128 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
void nvgpu_mutex_destroy(struct nvgpu_mutex *mutex);
# 145 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
void nvgpu_spinlock_init(struct nvgpu_spinlock *spinlock);
# 159 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
void nvgpu_spinlock_acquire(struct nvgpu_spinlock *spinlock);
# 170 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
void nvgpu_spinlock_release(struct nvgpu_spinlock *spinlock);
# 184 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
void nvgpu_raw_spinlock_init(struct nvgpu_raw_spinlock *spinlock);
# 198 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
void nvgpu_raw_spinlock_acquire(struct nvgpu_raw_spinlock *spinlock);
# 210 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/include/nvgpu/lock.h"
void nvgpu_raw_spinlock_release(struct nvgpu_raw_spinlock *spinlock);
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h" 2

struct gk20a;
struct nvgpu_err_hw_module;
struct nvgpu_err_msg;
struct gpu_err_header;







struct nvgpu_cic_mon {

 struct nvgpu_err_hw_module *err_lut;


 u32 num_hw_modules;
};
# 61 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_inject_ecc_swerror(struct gk20a *g, u32 hw_unit,
  u32 err_index, u32 inst);
# 76 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_inject_host_swerror(struct gk20a *g, u32 hw_unit,
  u32 err_index, u32 sub_err_type);
# 92 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_inject_gr_swerror(struct gk20a *g, u32 hw_unit,
  u32 err_index, u32 sub_err_type);
# 107 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_inject_ce_swerror(struct gk20a *g, u32 hw_unit,
  u32 err_index, u32 sub_err_type);
# 122 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_inject_pri_swerror(struct gk20a *g, u32 hw_unit,
  u32 err_index, u32 err_code);
# 138 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_inject_pmu_swerror(struct gk20a *g, u32 hw_unit,
  u32 err_index, u32 sub_err_type);
# 154 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_inject_ctxsw_swerror(struct gk20a *g, u32 hw_unit,
  u32 err_index, u32 inst);
# 170 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_inject_mmu_swerror(struct gk20a *g, u32 hw_unit,
  u32 err_index, u32 sub_err_type);
# 182 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_init_err_msg_header(struct gpu_err_header *header);
# 194 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_init_err_msg(struct nvgpu_err_msg *msg);
# 205 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_init_host_err_msg(struct nvgpu_err_msg *msg);
# 216 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_init_ecc_err_msg(struct nvgpu_err_msg *msg);
# 227 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_init_pri_err_msg(struct nvgpu_err_msg *msg);
# 238 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_init_ce_err_msg(struct nvgpu_err_msg *msg);
# 249 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_init_pmu_err_msg(struct nvgpu_err_msg *msg);
# 260 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_init_gr_err_msg(struct nvgpu_err_msg *msg);
# 271 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_init_ctxsw_err_msg(struct nvgpu_err_msg *msg);
# 282 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/common/cic/mon/cic_mon_priv.h"
void nvgpu_init_mmu_err_msg(struct nvgpu_err_msg *msg);
# 27 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/cic/mon/lut_ga10b_fusa.c" 2
# 1 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/cic/mon/cic_ga10b.h" 1
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/cic/mon/cic_ga10b.h"
struct gk20a;
struct nvgpu_cic_mon;

extern struct nvgpu_err_hw_module ga10b_err_lut[];
extern u32 size_of_ga10b_lut;

int ga10b_cic_mon_init(struct gk20a *g, struct nvgpu_cic_mon *cic_mon);
# 28 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/cic/mon/lut_ga10b_fusa.c" 2
# 43 "/mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/hal/cic/mon/lut_ga10b_fusa.c"
struct nvgpu_err_hw_module ga10b_err_lut[] = {
 {
  .name = "host",
  .hw_unit = (u32)(0U),
  .num_instances = 1U,
  .num_errs = 16U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("pfifo_bind_error"), .is_critical = (true), .error_id = ((0U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }


                      ,
   { .name = ("pfifo_sched_error"), .is_critical = (true), .error_id = ((1U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }


                      ,
   { .name = ("pfifo_chsw_error"), .is_critical = (true), .error_id = ((2U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }


                      ,
   { .name = ("pfifo_memop_error"), .is_critical = (true), .error_id = ((3U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pfifo_lb_error"), .is_critical = (true), .error_id = ((4U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }


                      ,
   { .name = ("pbus_squash_error"), .is_critical = (true), .error_id = ((5U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pbus_fecs_error"), .is_critical = (true), .error_id = ((6U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pbus_timeout_error"), .is_critical = (true), .error_id = ((7U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pbdma_timeout_error"), .is_critical = (true), .error_id = ((8U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pbdma_extra_error"), .is_critical = (true), .error_id = ((9U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pbdma_gpfifo_pb_error"), .is_critical = (true), .error_id = ((10U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pbdma_method_error"), .is_critical = (true), .error_id = ((11U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pbdma_signature_error"), .is_critical = (true), .error_id = ((12U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pbdma_hce_error"), .is_critical = (true), .error_id = ((13U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pfifo_ctxsw_timeout"), .is_critical = (false), .error_id = ((14U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pfifo_fb_flush_timeout"), .is_critical = (true), .error_id = ((15U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
  },
 },
 {
  .name = "sm",
  .hw_unit = (u32)(1U),
  .num_instances = 8U,
  .num_errs = 12U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("l1_tag_ecc_corrected"), .is_critical = (false), .error_id = ((0x0U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("l1_tag_ecc_uncorrected"), .is_critical = (true), .error_id = ((0x1U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("cbu_ecc_uncorrected"), .is_critical = (true), .error_id = ((0x2U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("lrf_ecc_uncorrected"), .is_critical = (true), .error_id = ((0x3U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("l1_data_ecc_uncorrected"), .is_critical = (true), .error_id = ((0x4U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("icache_l0_data_ecc_uncorrected"), .is_critical = (true), .error_id = ((0x5U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("icache_l1_data_ecc_uncorrected"), .is_critical = (true), .error_id = ((0x6U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("icache_l0_predecode_ecc_uncorrected"), .is_critical = (true), .error_id = ((0x7U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("l1_tag_miss_fifo_ecc_uncorrected"), .is_critical = (true), .error_id = ((0x8U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("l1_tag_s2r_pixprf_ecc_uncorrected"), .is_critical = (true), .error_id = ((0x9U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("machine_check_error"), .is_critical = (true), .error_id = ((0xAU)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("rams_urf_ecc_uncorrected"), .is_critical = (true), .error_id = ((0xBU)), .err_inject_info.type = ((0U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
  },
 },
 {
  .name = "fecs",
  .hw_unit = (u32)(2U),
  .num_instances = 1U,
  .num_errs = 7U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("falcon_imem_ecc_corrected"), .is_critical = (false), .error_id = ((0U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("falcon_imem_ecc_uncorrected"), .is_critical = (true), .error_id = ((1U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("falcon_dmem_ecc_uncorrected"), .is_critical = (true), .error_id = ((2U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("ctxsw_watchdog_timeout"), .is_critical = (true), .error_id = ((3U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("ctxsw_crc_mismatch"), .is_critical = (true), .error_id = ((4U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("fault_during_ctxsw"), .is_critical = (true), .error_id = ((5U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("ctxsw_init_error"), .is_critical = (true), .error_id = ((6U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
  },
 },
 {
  .name = "gpccs",
  .hw_unit = (u32)(3U),
  .num_instances = 1U,
  .num_errs = 3U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("falcon_imem_ecc_corrected"), .is_critical = (false), .error_id = ((0U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("falcon_imem_ecc_uncorrected"), .is_critical = (true), .error_id = ((1U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("falcon_dmem_ecc_uncorrected"), .is_critical = (true), .error_id = ((2U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
  },
 },
 {
  .name = "mmu",
  .hw_unit = (u32)(4U),
  .num_instances = 1U,
  .num_errs = 2U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("l1tlb_sa_data_ecc_uncorrected"), .is_critical = (true), .error_id = ((0U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("l1tlb_fa_data_ecc_uncorrected"), .is_critical = (true), .error_id = ((1U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
  },
 },
 {
  .name = "gcc",
  .hw_unit = (u32)(5U),
  .num_instances = 1U,
  .num_errs = 1U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("l15_ecc_uncorrected"), .is_critical = (true), .error_id = ((0U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
  },
 },
 {
  .name = "pmu",
  .hw_unit = (u32)(6U),
  .num_instances = 1U,
  .num_errs = 10U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("pmu_nvriscv_brom_failure"), .is_critical = (true), .error_id = ((0U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pmu_access_timeout"), .is_critical = (true), .error_id = ((1U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pmu_mpu_ecc_uncorrected"), .is_critical = (true), .error_id = ((2U)), .err_inject_info.type = ((0U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pmu_illegal_access_uncorrected"), .is_critical = (true), .error_id = ((3U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pmu_imem_ecc_uncorrected"), .is_critical = (true), .error_id = ((4U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pmu_dcls_uncorrected"), .is_critical = (true), .error_id = ((5U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pmu_dmem_ecc_uncorrected"), .is_critical = (true), .error_id = ((6U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pmu_wdt_uncorrected"), .is_critical = (true), .error_id = ((7U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pmu_reg_ecc_uncorrected"), .is_critical = (true), .error_id = ((8U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pmu_bar0_error_timeout"), .is_critical = (true), .error_id = ((9U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
  },
 },
 {
  .name = "pgraph",
  .hw_unit = (u32)(7U),
  .num_instances = 1U,
  .num_errs = 21U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("fe_exception"), .is_critical = (true), .error_id = ((0U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("memfmt_exception"), .is_critical = (true), .error_id = ((1U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pd_exception"), .is_critical = (true), .error_id = ((2U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("scc_exception"), .is_critical = (true), .error_id = ((3U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("ds_exception"), .is_critical = (true), .error_id = ((4U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("ssync_exception"), .is_critical = (true), .error_id = ((5U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("mme_exception"), .is_critical = (true), .error_id = ((6U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("sked_exception"), .is_critical = (true), .error_id = ((7U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("be_crop_exception"), .is_critical = (true), .error_id = ((8U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("be_zrop_exception"), .is_critical = (true), .error_id = ((9U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("mpc_exception"), .is_critical = (true), .error_id = ((10U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("illegal_notify_error"), .is_critical = (true), .error_id = ((11U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("illegal_method_error"), .is_critical = (true), .error_id = ((12U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("illegal_class_error"), .is_critical = (true), .error_id = ((13U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("class_error"), .is_critical = (true), .error_id = ((14U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpc_gfx_prop_exception"), .is_critical = (true), .error_id = ((15U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpc_gfx_zcull_exception"), .is_critical = (true), .error_id = ((16U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpc_gfx_setup_exception"), .is_critical = (true), .error_id = ((17U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpc_gfx_pes_exception"), .is_critical = (true), .error_id = ((18U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpc_gfx_tpc_pe_exception"), .is_critical = (true), .error_id = ((19U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("mme_fe1_exception"), .is_critical = (true), .error_id = ((20U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
  },
 },
 {
  .name = "ltc",
  .hw_unit = (u32)(8U),
  .num_instances = 1U,
  .num_errs = 4U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("cache_dstg_ecc_corrected"), .is_critical = (false), .error_id = ((0U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("cache_dstg_ecc_uncorrected"), .is_critical = (true), .error_id = ((1U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("cache_tstg_ecc_uncorrected"), .is_critical = (true), .error_id = ((2U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("cache_rstg_cbc_ecc_uncorrected"), .is_critical = (true), .error_id = ((3U)), .err_inject_info.type = ((0U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
  },
 },
 {
  .name = "hubmmu",
  .hw_unit = (u32)(9U),
  .num_instances = 1U,
  .num_errs = 9U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("hubmmu_l2tlb_sa_data_ecc_uncorrected"), .is_critical = (true), .error_id = ((0U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("hubmmu_tlb_sa_data_ecc_uncorrected"), .is_critical = (true), .error_id = ((1U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("hubmmu_pte_data_ecc_uncorrected"), .is_critical = (true), .error_id = ((2U)), .err_inject_info.type = (((1U))), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("hubmmu_pde0_data_ecc_uncorrected"), .is_critical = (true), .error_id = ((3U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("hubmmu_page_fault_other_fault_notify_error"), .is_critical = (true), .error_id = ((4U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("hubmmu_page_fault_nonreplayable_fault_overflow_error"), .is_critical = (true), .error_id = ((5U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("hubmmu_page_fault_replayable_fault_overflow_error"), .is_critical = (true), .error_id = ((6U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("hubmmu_page_fault_replayable_fault_notify_error"), .is_critical = (true), .error_id = ((7U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("hubmmu_page_fault_nonreplayable_fault_notify_error"), .is_critical = (true), .error_id = ((8U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
  },
 },
 {
  .name = "pri",
  .hw_unit = (u32)(10U),
  .num_instances = 1U,
  .num_errs = 2U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("pri_timeout_error"), .is_critical = (true), .error_id = ((0U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("pri_access_violation"), .is_critical = (true), .error_id = ((1U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
  },
 },
 {
  .name = "ce",
  .hw_unit = (u32)(11U),
  .num_instances = 1U,
  .num_errs = 5U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("ce_launch_error"), .is_critical = (true), .error_id = ((0x0)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,

   { .name = ("ce_method_buffer_fault"), .is_critical = (true), .error_id = ((0x1)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("ce_fbuf_crc_fail"), .is_critical = (true), .error_id = ((0x2)), .err_inject_info.type = ((0U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("ce_fbuf_magic_chk_fail"), .is_critical = (true), .error_id = ((0x3)), .err_inject_info.type = ((0U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("ce_invalid_config"), .is_critical = (true), .error_id = ((0x4)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,

  },
 },
 {
  .name = "gsp_acr",
  .hw_unit = (u32)(12U),
  .num_instances = 1U,
  .num_errs = 12U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("gsp_acr_nvriscv_brom_failure"), .is_critical = (true), .error_id = ((0U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_acr_emem_ecc_uncorrected"), .is_critical = (true), .error_id = ((1U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_acr_reg_access_timeout_uncorrected"), .is_critical = (true), .error_id = ((2U)), .err_inject_info.type = ((0U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_acr_illegal_access_uncorrected"), .is_critical = (true), .error_id = ((3U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_acr_imem_ecc_uncorrected"), .is_critical = (true), .error_id = ((4U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_acr_dcls_uncorrected"), .is_critical = (true), .error_id = ((5U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_acr_dmem_ecc_uncorrected"), .is_critical = (true), .error_id = ((6U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_acr_wdt_uncorrected"), .is_critical = (true), .error_id = ((7U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_acr_reg_ecc_uncorrected"), .is_critical = (true), .error_id = ((8U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_acr_fecs_pkc_lssig_failure"), .is_critical = (true), .error_id = ((9U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_acr_gpccs_pkc_lssig_failure"), .is_critical = (true), .error_id = ((10U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_acr_lspmu_pkc_lssig_failure"), .is_critical = (true), .error_id = ((11U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
  },
 },
 {
  .name = "gsp_sched",
  .hw_unit = (u32)(13U),
  .num_instances = 1U,
  .num_errs = 9U,
  .errs = (struct nvgpu_err_desc[]) {
   { .name = ("gsp_sched_nvriscv_brom_failure"), .is_critical = (true), .error_id = ((0U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_sched_emem_ecc_uncorrected"), .is_critical = (true), .error_id = ((1U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_sched_reg_access_timeout_uncorrected"), .is_critical = (true), .error_id = ((2U)), .err_inject_info.type = ((0U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_sched_illegal_access_uncorrected"), .is_critical = (true), .error_id = ((3U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_sched_imem_ecc_uncorrected"), .is_critical = (true), .error_id = ((4U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_sched_dcls_uncorrected"), .is_critical = (true), .error_id = ((5U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_sched_dmem_ecc_uncorrected"), .is_critical = (true), .error_id = ((6U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_sched_wdt_uncorrected"), .is_critical = (true), .error_id = ((7U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
   { .name = ("gpu_gsp_sched_reg_ecc_uncorrected"), .is_critical = (true), .error_id = ((8U)), .err_inject_info.type = ((2U)), .err_threshold = (0), .err_count = (0), .inject_hw_fault = (((void *)0)), .inject_sw_fault = (((void *)0)), .err_inject_info.get_reg_addr = (((void *)0)), .err_inject_info.get_reg_val = (((void *)0)) }



                      ,
  },
 },
};

u32 size_of_ga10b_lut = sizeof(ga10b_err_lut) /
     sizeof(struct nvgpu_err_hw_module);
