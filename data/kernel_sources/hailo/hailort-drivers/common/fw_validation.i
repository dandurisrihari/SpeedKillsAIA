# 0 "/home/sri/hailort-drivers/linux/pcie/../../common/fw_validation.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler-version.h" 1
# 0 "<command-line>" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kconfig.h" 1




# 1 "./include/generated/autoconf.h" 1
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kconfig.h" 2
# 0 "<command-line>" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler_types.h" 1
# 89 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler_types.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler_attributes.h" 1
# 90 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler_types.h" 2
# 174 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler_types.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler-gcc.h" 1
# 175 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler_types.h" 2
# 188 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler_types.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/compiler.h" 1
# 189 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler_types.h" 2


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
# 0 "<command-line>" 2
# 1 "/home/sri/hailort-drivers/linux/pcie/../../common/fw_validation.c"





# 1 "/home/sri/hailort-drivers/linux/pcie/../../common/fw_validation.h" 1
# 9 "/home/sri/hailort-drivers/linux/pcie/../../common/fw_validation.h"
# 1 "/home/sri/hailort-drivers/linux/pcie/../../common/hailo_ioctl_common.h" 1
# 131 "/home/sri/hailort-drivers/linux/pcie/../../common/hailo_ioctl_common.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/types.h" 1





# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/types.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/types.h" 1






# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/int-ll64.h" 1
# 11 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/int-ll64.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/int-ll64.h" 1
# 12 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/int-ll64.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/uapi/asm/bitsperlong.h" 1
# 22 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/uapi/asm/bitsperlong.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitsperlong.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/bitsperlong.h" 1
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitsperlong.h" 2
# 23 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/uapi/asm/bitsperlong.h" 2
# 13 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/int-ll64.h" 2







typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
# 12 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/int-ll64.h" 2




typedef __s8 s8;
typedef __u8 u8;
typedef __s16 s16;
typedef __u16 u16;
typedef __s32 s32;
typedef __u32 u32;
typedef __s64 s64;
typedef __u64 u64;
# 8 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/types.h" 2
# 2 "./arch/arm64/include/generated/uapi/asm/types.h" 2
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/types.h" 2
# 14 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/types.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/posix_types.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/stddef.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/stddef.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler_types.h" 1
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/stddef.h" 2
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/stddef.h" 2




enum {
 false = 0,
 true = 1
};
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/posix_types.h" 2
# 25 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/posix_types.h"
typedef struct {
 unsigned long fds_bits[1024 / (8 * sizeof(long))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;

# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/uapi/asm/posix_types.h" 1




typedef unsigned short __kernel_old_uid_t;
typedef unsigned short __kernel_old_gid_t;


# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/posix_types.h" 1
# 15 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/posix_types.h"
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
# 59 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/posix_types.h"
typedef unsigned int __kernel_old_dev_t;
# 72 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/posix_types.h"
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
# 10 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/uapi/asm/posix_types.h" 2
# 37 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/posix_types.h" 2
# 15 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/types.h" 2


typedef __signed__ __int128 __s128 __attribute__((aligned(16)));
typedef unsigned __int128 __u128 __attribute__((aligned(16)));
# 36 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/types.h"
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;
typedef __u64 __le64;
typedef __u64 __be64;

typedef __u16 __sum16;
typedef __u32 __wsum;
# 60 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/types.h"
typedef unsigned __poll_t;
# 7 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/types.h" 2







typedef __s128 s128;
typedef __u128 u128;


typedef u32 __kernel_dev_t;

typedef __kernel_fd_set fd_set;
typedef __kernel_dev_t dev_t;
typedef __kernel_ulong_t ino_t;
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
typedef long intptr_t;



typedef __kernel_old_uid_t old_uid_t;
typedef __kernel_old_gid_t old_gid_t;



typedef __kernel_loff_t loff_t;
# 61 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/types.h"
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
# 125 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/types.h"
typedef s64 ktime_t;
# 135 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/types.h"
typedef u64 sector_t;
typedef u64 blkcnt_t;
# 153 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/types.h"
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


typedef struct {
 atomic_t refcnt;
} rcuref_t;



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



 unsigned long f_tinode;

 char f_fname[6];
 char f_fpack[6];
};
# 236 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/types.h"
struct callback_head {
 struct callback_head *next;
 void (*func)(struct callback_head *head);
} __attribute__((aligned(sizeof(void *))));


typedef void (*rcu_callback_t)(struct callback_head *head);
typedef void (*call_rcu_func_t)(struct callback_head *head, rcu_callback_t func);

typedef void (*swap_r_func_t)(void *a, void *b, int size, const void *priv);
typedef void (*swap_func_t)(void *a, void *b, int size);

typedef int (*cmp_r_func_t)(const void *a, const void *b, const void *priv);
typedef int (*cmp_func_t)(const void *a, const void *b);
# 132 "/home/sri/hailort-drivers/linux/pcie/../../common/hailo_ioctl_common.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/limits.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/limits.h" 1
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/limits.h" 2

# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/vdso/limits.h" 1
# 8 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/limits.h" 2
# 133 "/home/sri/hailort-drivers/linux/pcie/../../common/hailo_ioctl_common.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 1
# 14 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/stdarg.h" 1




typedef __builtin_va_list va_list;
# 15 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/align.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/const.h" 1



# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/vdso/const.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/const.h" 1
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/vdso/const.h" 2
# 5 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/const.h" 2
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/align.h" 2
# 16 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/array_size.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler.h" 1
# 15 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler.h"
void ftrace_likely_update(struct ftrace_likely_data *f, int val,
     int expect, int is_constant);
# 200 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void *offset_to_ptr(const int *off)
{
 return (void *)((unsigned long)off + *off);
}
# 301 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/rwonce.h" 1
# 71 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/rwonce.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/rwonce.h" 1
# 26 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/rwonce.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kasan-checks.h" 1
# 22 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kasan-checks.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) bool __kasan_check_read(const volatile void *p, unsigned int size)
{
 return true;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) bool __kasan_check_write(const volatile void *p, unsigned int size)
{
 return true;
}
# 40 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kasan-checks.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) bool kasan_check_read(const volatile void *p, unsigned int size)
{
 return true;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) bool kasan_check_write(const volatile void *p, unsigned int size)
{
 return true;
}
# 27 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/rwonce.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kcsan-checks.h" 1
# 189 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kcsan-checks.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __kcsan_check_access(const volatile void *ptr, size_t size,
     int type) { }

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __kcsan_mb(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __kcsan_wmb(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __kcsan_rmb(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __kcsan_release(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kcsan_disable_current(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kcsan_enable_current(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kcsan_enable_current_nowarn(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kcsan_nestable_atomic_begin(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kcsan_nestable_atomic_end(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kcsan_flat_atomic_begin(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kcsan_flat_atomic_end(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kcsan_atomic_next(int n) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kcsan_set_access_mask(unsigned long mask) { }

struct kcsan_scoped_access { };

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) struct kcsan_scoped_access *
kcsan_begin_scoped_access(const volatile void *ptr, size_t size, int type,
     struct kcsan_scoped_access *sa) { return sa; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kcsan_end_scoped_access(struct kcsan_scoped_access *sa) { }
# 229 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kcsan-checks.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kcsan_check_access(const volatile void *ptr, size_t size,
          int type) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __kcsan_enable_current(void) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __kcsan_disable_current(void) { }
# 28 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/rwonce.h" 2
# 64 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/rwonce.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__))
unsigned long __read_once_word_nocheck(const void *addr)
{
 return (*(const volatile typeof( _Generic((*(unsigned long *)addr), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*(unsigned long *)addr))) *)&(*(unsigned long *)addr));
}
# 82 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/rwonce.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__))
unsigned long read_word_at_a_time(const void *addr)
{
 kasan_check_read(addr, 1);
 return *(unsigned long *)addr;
}
# 72 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/rwonce.h" 2
# 302 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/compiler.h" 2
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/array_size.h" 2
# 17 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2

# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/linkage.h" 1





# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/stringify.h" 1
# 7 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/linkage.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/export.h" 1





# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/linkage.h" 1
# 7 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/export.h" 2
# 8 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/linkage.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/linkage.h" 1
# 9 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/linkage.h" 2
# 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2



# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/container_of.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/build_bug.h" 1
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/container_of.h" 2
# 23 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bitops.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bitops.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bits.h" 1





# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/vdso/bits.h" 1
# 7 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bits.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/bits.h" 1
# 8 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bits.h" 2
# 7 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bitops.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/typecheck.h" 1
# 8 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bitops.h" 2

# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/kernel.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/sysinfo.h" 1







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
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/kernel.h" 2
# 10 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bitops.h" 2
# 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bitops.h"
extern unsigned int __sw_hweight8(unsigned int w);
extern unsigned int __sw_hweight16(unsigned int w);
extern unsigned int __sw_hweight32(unsigned int w);
extern unsigned long __sw_hweight64(__u64 w);






# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/generic-non-atomic.h" 1






# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/barrier.h" 1
# 14 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/barrier.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 1







# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/cpucaps.h" 1





# 1 "./arch/arm64/include/generated/asm/cpucap-defs.h" 1
# 7 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/cpucaps.h" 2






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
cpucap_is_possible(const unsigned int cap)
{
 do { __attribute__((__noreturn__)) extern void __compiletime_assert_0(void) __attribute__((__error__("cap must be a constant"))); if (!(__builtin_constant_p(cap))) __compiletime_assert_0(); } while (0)
                               ;
 do { __attribute__((__noreturn__)) extern void __compiletime_assert_1(void) __attribute__((__error__("cap must be < ARM64_NCAPS"))); if (!(cap < 102)) __compiletime_assert_1(); } while (0)
                                  ;

 switch (cap) {
 case 40:
  return 1;
 case 21:
  return 1;
 case 67:
  return 1;
 case 59:
 case 61:
 case 60:
  return 0;
 case 13:
  return 1;
 case 5:
 case 26:
  return 1;
 case 31:
  return 0;
 case 57:
  return 1;
 case 2:
  return 1;
 case 49:
  return 1;
 case 68:
  return 1;
 case 70:
  return 1;
 case 77:
  return 1;
 case 83:
  return 1;
 case 84:
  return 1;
 case 89:
  return 0;
 case 96:
  return 1;
 case 98:
  return 1;
 case 100:
  return 1;
 }

 return true;
}
# 9 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/insn-def.h" 1





# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/brk-imm.h" 1
# 7 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/insn-def.h" 2
# 10 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h" 2
# 226 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative-macros.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
alternative_has_cap_likely(const unsigned long cpucap)
{
 if (!cpucap_is_possible(cpucap))
  return false;

 asm goto(



 ".if ""1"" == 1\n" "661:\n\t" "b	%l[l_no]" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word " "alt_cb_patch_nops" "- .\n" " .hword " "(1 << 15) | (%[cpucap])" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" "663:\n\t" "664:\n\t" ".endif\n"

 :
 : [cpucap] "i" (cpucap)
 :
 : l_no);

 return true;
l_no:
 return false;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
alternative_has_cap_unlikely(const unsigned long cpucap)
{
 if (!cpucap_is_possible(cpucap))
  return false;

 asm goto(
 ".if ""1"" == 1\n" "661:\n\t" "nop" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "%[cpucap]" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" "b	%l[l_yes]" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n"
 :
 : [cpucap] "i" (cpucap)
 :
 : l_yes);

 return false;
l_yes:
 return true;
}
# 15 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/barrier.h" 2
# 88 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/barrier.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) unsigned long array_index_mask_nospec(unsigned long idx,
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
# 219 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/barrier.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/barrier.h" 1
# 220 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/barrier.h" 2
# 8 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/generic-non-atomic.h" 2
# 27 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/generic-non-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
generic___set_bit(unsigned long nr, volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);

 *p |= mask;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
generic___clear_bit(unsigned long nr, volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);

 *p &= ~mask;
}
# 54 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/generic-non-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
generic___change_bit(unsigned long nr, volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);

 *p ^= mask;
}
# 72 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/generic-non-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
generic___test_and_set_bit(unsigned long nr, volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);
 unsigned long old = *p;

 *p = old | mask;
 return (old & mask) != 0;
}
# 92 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/generic-non-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
generic___test_and_clear_bit(unsigned long nr, volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);
 unsigned long old = *p;

 *p = old & ~mask;
 return (old & mask) != 0;
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
generic___test_and_change_bit(unsigned long nr, volatile unsigned long *addr)
{
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);
 unsigned long old = *p;

 *p = old ^ mask;
 return (old & mask) != 0;
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
generic_test_bit(unsigned long nr, const volatile unsigned long *addr)
{





 return 1UL & (addr[((nr) / 64)] >> (nr & (64 -1)));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
generic_test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
{
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);
 return 1UL & (({ union { typeof( _Generic((*p), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*p))) __val; char __c[1]; } __u; typeof(p) __p = (p); do { __attribute__((__noreturn__)) extern void __compiletime_assert_2(void) __attribute__((__error__("Need native word sized stores/loads for atomicity."))); if (!((sizeof(*p) == sizeof(char) || sizeof(*p) == sizeof(short) || sizeof(*p) == sizeof(int) || sizeof(*p) == sizeof(long)))) __compiletime_assert_2(); } while (0); kasan_check_read(__p, sizeof(*p)); switch (sizeof(*p)) { case 1: asm volatile ("ldarb %w0, %1" : "=r" (*(__u8 *)__u.__c) : "Q" (*__p) : "memory"); break; case 2: asm volatile ("ldarh %w0, %1" : "=r" (*(__u16 *)__u.__c) : "Q" (*__p) : "memory"); break; case 4: asm volatile ("ldar %w0, %1" : "=r" (*(__u32 *)__u.__c) : "Q" (*__p) : "memory"); break; case 8: asm volatile ("ldar %0, %1" : "=r" (*(__u64 *)__u.__c) : "Q" (*__p) : "memory"); break; } (typeof(*p))__u.__val; }) >> (nr & (64 -1)));
}
# 165 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/generic-non-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
const_test_bit(unsigned long nr, const volatile unsigned long *addr)
{
 const unsigned long *p = (const unsigned long *)addr + ((nr) / 64);
 unsigned long mask = ((((1UL))) << ((nr) % 64));
 unsigned long val = *p;

 return !!(val & mask);
}
# 30 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bitops.h" 2
# 68 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bitops.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 1
# 14 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/builtin-__ffs.h" 1
# 11 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/builtin-__ffs.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) unsigned int __ffs(unsigned long word)
{
 return __builtin_ctzl(word);
}
# 15 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/builtin-ffs.h" 1
# 16 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/builtin-__fls.h" 1
# 11 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/builtin-__fls.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) unsigned int __fls(unsigned long word)
{
 return (sizeof(word) * 8) - 1 - __builtin_clzl(word);
}
# 17 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/builtin-fls.h" 1
# 12 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/builtin-fls.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int fls(unsigned int x)
{
 return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
}
# 18 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 2

# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/ffz.h" 1
# 20 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/fls64.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/fls64.h" 2
# 27 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/fls64.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int fls64(__u64 x)
{
 if (x == 0)
  return 0;
 return __fls(x) + 1;
}
# 21 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 2

# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/sched.h" 1





# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 7 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/sched.h" 2






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int sched_find_first_bit(const unsigned long *b)
{

 if (b[0])
  return __ffs(b[0]);
 return __ffs(b[1]) + 64;
# 30 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/sched.h"
}
# 23 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/hweight.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/arch_hweight.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/arch_hweight.h" 2

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) unsigned int __arch_hweight32(unsigned int w)
{
 return __sw_hweight32(w);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) unsigned int __arch_hweight16(unsigned int w)
{
 return __sw_hweight16(w);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) unsigned int __arch_hweight8(unsigned int w)
{
 return __sw_hweight8(w);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) unsigned long __arch_hweight64(__u64 w)
{
 return __sw_hweight64(w);
}
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/hweight.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/const_hweight.h" 1
# 7 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/hweight.h" 2
# 24 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 2

# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/atomic.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic.h" 1






# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic.h" 1
# 16 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/cmpxchg.h" 1
# 14 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/cmpxchg.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/lse.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h" 1
# 95 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __ll_sc_atomic_add(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_add_return(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_add_return_relaxed(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "_relaxed" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_add_return_acquire(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "_acquire" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_add_return_release(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "_release" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_add(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_add_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_add_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_add_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __ll_sc_atomic_sub(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_sub_return(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_sub_return_relaxed(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "_relaxed" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_sub_return_acquire(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "_acquire" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_sub_return_release(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "_release" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_sub(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_sub_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_sub_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_sub_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; }
# 106 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __ll_sc_atomic_and(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "and" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "and" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_and(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_and_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_and_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_and_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __ll_sc_atomic_or(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "or" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "orr" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_or(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_or_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_or_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_or_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __ll_sc_atomic_xor(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "xor" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "eor" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_xor(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_xor_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_xor_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_xor_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "K" "r" (i) : "memory"); return result; }





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __ll_sc_atomic_andnot(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "andnot" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "bic" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_andnot(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_andnot_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_andnot_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __ll_sc_atomic_fetch_andnot_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; }
# 191 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __ll_sc_atomic64_add(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_add_return(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_add_return_relaxed(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "_relaxed" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_add_return_acquire(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "_acquire" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_add_return_release(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "_release" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_add(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_add_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_add_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_add_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "I" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __ll_sc_atomic64_sub(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_sub_return(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_sub_return_relaxed(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "_relaxed" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_sub_return_acquire(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "_acquire" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_sub_return_release(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "_release" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_sub(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_sub_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_sub_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_sub_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "J" "r" (i) : "memory"); return result; }
# 202 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __ll_sc_atomic64_and(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "and" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "and" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_and(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_and_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_and_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_and_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __ll_sc_atomic64_or(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "or" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "orr" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_or(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_or_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_or_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_or_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __ll_sc_atomic64_xor(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "xor" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "eor" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_xor(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_xor_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_xor_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_xor_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "L" "r" (i) : "memory"); return result; }





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __ll_sc_atomic64_andnot(s64 i, atomic64_t *v) { s64 result; unsigned long tmp; asm volatile("// atomic64_" "andnot" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "bic" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i)); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_andnot(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_andnot_relaxed(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : ); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_andnot_acquire(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __ll_sc_atomic64_fetch_andnot_release(s64 i, atomic64_t *v) { s64 result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "" "r" (i) : "memory"); return result; }






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
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
# 278 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u8 __ll_sc__cmpxchg_case_8(volatile void *ptr, unsigned long old, u8 new) { unsigned long tmp; u8 oldval; if (8 < 32) old = (u8)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u8 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : ); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u16 __ll_sc__cmpxchg_case_16(volatile void *ptr, unsigned long old, u16 new) { unsigned long tmp; u16 oldval; if (16 < 32) old = (u16)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u16 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : ); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u32 __ll_sc__cmpxchg_case_32(volatile void *ptr, unsigned long old, u32 new) { unsigned long tmp; u32 oldval; if (32 < 32) old = (u32)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u32 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : ); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u64 __ll_sc__cmpxchg_case_64(volatile void *ptr, unsigned long old, u64 new) { unsigned long tmp; u64 oldval; if (64 < 32) old = (u64)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u64 *)ptr) : [old] "L" "r" (old), [new] "r" (new) : ); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u8 __ll_sc__cmpxchg_case_acq_8(volatile void *ptr, unsigned long old, u8 new) { unsigned long tmp; u8 oldval; if (8 < 32) old = (u8)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u8 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u16 __ll_sc__cmpxchg_case_acq_16(volatile void *ptr, unsigned long old, u16 new) { unsigned long tmp; u16 oldval; if (16 < 32) old = (u16)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u16 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u32 __ll_sc__cmpxchg_case_acq_32(volatile void *ptr, unsigned long old, u32 new) { unsigned long tmp; u32 oldval; if (32 < 32) old = (u32)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u32 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u64 __ll_sc__cmpxchg_case_acq_64(volatile void *ptr, unsigned long old, u64 new) { unsigned long tmp; u64 oldval; if (64 < 32) old = (u64)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u64 *)ptr) : [old] "L" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u8 __ll_sc__cmpxchg_case_rel_8(volatile void *ptr, unsigned long old, u8 new) { unsigned long tmp; u8 oldval; if (8 < 32) old = (u8)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u8 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u16 __ll_sc__cmpxchg_case_rel_16(volatile void *ptr, unsigned long old, u16 new) { unsigned long tmp; u16 oldval; if (16 < 32) old = (u16)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u16 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u32 __ll_sc__cmpxchg_case_rel_32(volatile void *ptr, unsigned long old, u32 new) { unsigned long tmp; u32 oldval; if (32 < 32) old = (u32)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u32 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u64 __ll_sc__cmpxchg_case_rel_64(volatile void *ptr, unsigned long old, u64 new) { unsigned long tmp; u64 oldval; if (64 < 32) old = (u64)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u64 *)ptr) : [old] "L" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u8 __ll_sc__cmpxchg_case_mb_8(volatile void *ptr, unsigned long old, u8 new) { unsigned long tmp; u8 oldval; if (8 < 32) old = (u8)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u8 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u16 __ll_sc__cmpxchg_case_mb_16(volatile void *ptr, unsigned long old, u16 new) { unsigned long tmp; u16 oldval; if (16 < 32) old = (u16)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u16 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u32 __ll_sc__cmpxchg_case_mb_32(volatile void *ptr, unsigned long old, u32 new) { unsigned long tmp; u32 oldval; if (32 < 32) old = (u32)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u32 *)ptr) : [old] "K" "r" (old), [new] "r" (new) : "memory"); return oldval; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u64 __ll_sc__cmpxchg_case_mb_64(volatile void *ptr, unsigned long old, u64 new) { unsigned long tmp; u64 oldval; if (64 < 32) old = (u64)old; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(u64 *)ptr) : [old] "L" "r" (old), [new] "r" (new) : "memory"); return oldval; }



union __u128_halves {
 u128 full;
 struct {
  u64 low, high;
 };
};
# 332 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u128 __ll_sc__cmpxchg128(volatile u128 *ptr, u128 old, u128 new) { union __u128_halves r, o = { .full = (old) }, n = { .full = (new) }; unsigned int tmp; asm volatile("// __cmpxchg128" "" "\n" "       prfm    pstl1strm, %[v]\n" "1:     ldxp    %[rl], %[rh], %[v]\n" "       cmp     %[rl], %[ol]\n" "       ccmp    %[rh], %[oh], 0, eq\n" "       b.ne    2f\n" "       st" "" "xp    %w[tmp], %[nl], %[nh], %[v]\n" "       cbnz    %w[tmp], 1b\n" "	" "" "\n" "2:" : [v] "+Q" (*(u128 *)ptr), [rl] "=&r" (r.low), [rh] "=&r" (r.high), [tmp] "=&r" (tmp) : [ol] "r" (o.low), [oh] "r" (o.high), [nl] "r" (n.low), [nh] "r" (n.high) : "cc"); return r.full; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u128 __ll_sc__cmpxchg128_mb(volatile u128 *ptr, u128 old, u128 new) { union __u128_halves r, o = { .full = (old) }, n = { .full = (new) }; unsigned int tmp; asm volatile("// __cmpxchg128" "_mb" "\n" "       prfm    pstl1strm, %[v]\n" "1:     ldxp    %[rl], %[rh], %[v]\n" "       cmp     %[rl], %[ol]\n" "       ccmp    %[rh], %[oh], 0, eq\n" "       b.ne    2f\n" "       st" "l" "xp    %w[tmp], %[nl], %[nh], %[v]\n" "       cbnz    %w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" : [v] "+Q" (*(u128 *)ptr), [rl] "=&r" (r.low), [rh] "=&r" (r.high), [tmp] "=&r" (tmp) : [ol] "r" (o.low), [oh] "r" (o.high), [nl] "r" (n.low), [nh] "r" (n.high) : "cc", "memory"); return r.full; }
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/lse.h" 2
# 14 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/lse.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative.h" 1
# 9 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/init.h" 1
# 115 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/init.h"
typedef int (*initcall_t)(void);
typedef void (*exitcall_t)(void);


typedef int initcall_entry_t;

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) initcall_t initcall_from_entry(initcall_entry_t *entry)
{
 return offset_to_ptr(entry);
}
# 134 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/init.h"
extern initcall_entry_t __con_initcall_start[], __con_initcall_end[];


typedef void (*ctor_fn_t)(void);

struct file_system_type;


extern int do_one_initcall(initcall_t fn);
extern char __attribute__((__section__(".init.data"))) boot_command_line[];
extern char *saved_command_line;
extern unsigned int saved_command_line_len;
extern unsigned int reset_devices;


void setup_arch(char **);
void prepare_namespace(void);
void __attribute__((__section__(".init.text"))) init_rootfs(void);

void init_IRQ(void);
void time_init(void);
void poking_init(void);
void pgtable_cache_init(void);

extern initcall_entry_t __initcall_start[];
extern initcall_entry_t __initcall0_start[];
extern initcall_entry_t __initcall1_start[];
extern initcall_entry_t __initcall2_start[];
extern initcall_entry_t __initcall3_start[];
extern initcall_entry_t __initcall4_start[];
extern initcall_entry_t __initcall5_start[];
extern initcall_entry_t __initcall6_start[];
extern initcall_entry_t __initcall7_start[];
extern initcall_entry_t __initcall_end[];

extern struct file_system_type rootfs_fs_type;

extern bool rodata_enabled;
void mark_rodata_ro(void);

extern void (*late_time_init)(void);

extern bool initcall_debug;


extern struct module __this_module;
# 10 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/alternative.h" 2



struct alt_instr {
 s32 orig_offset;
 s32 alt_offset;
 u16 cpucap;
 u8 orig_len;
 u8 alt_len;
};

typedef void (*alternative_cb_t)(struct alt_instr *alt,
     __le32 *origptr, __le32 *updptr, int nr_inst);

void __attribute__((__section__(".init.text"))) apply_boot_alternatives(void);
void __attribute__((__section__(".init.text"))) apply_alternatives_all(void);
bool alternative_is_applied(u16 cpucap);


void apply_alternatives_module(void *start, size_t length);




void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,
         __le32 *updptr, int nr_inst);
# 15 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/lse.h" 2

# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h" 1
# 24 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __lse_atomic_andnot(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "stclr" "	%w[i], %[v]\n" : [v] "+Q" (v->counter) : [i] "r" (i)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __lse_atomic_or(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "stset" "	%w[i], %[v]\n" : [v] "+Q" (v->counter) : [i] "r" (i)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __lse_atomic_xor(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "steor" "	%w[i], %[v]\n" : [v] "+Q" (v->counter) : [i] "r" (i)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __lse_atomic_add(int i, atomic_t *v) { asm volatile( ".arch_extension lse\n" "	" "stadd" "	%w[i], %[v]\n" : [v] "+Q" (v->counter) : [i] "r" (i)); }

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __lse_atomic_sub(int i, atomic_t *v)
{
 __lse_atomic_add(-i, v);
}
# 59 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_andnot_relaxed(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldclr" "" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : ); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_andnot_acquire(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldclr" "a" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_andnot_release(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldclr" "l" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_andnot(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldclr" "al" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_or_relaxed(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldset" "" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : ); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_or_acquire(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldset" "a" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_or_release(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldset" "l" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_or(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldset" "al" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_xor_relaxed(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldeor" "" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : ); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_xor_acquire(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldeor" "a" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_xor_release(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldeor" "l" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_xor(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldeor" "al" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_add_relaxed(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldadd" "" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : ); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_add_acquire(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldadd" "a" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_add_release(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldadd" "l" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_add(int i, atomic_t *v) { int old; asm volatile( ".arch_extension lse\n" "	" "ldadd" "al" "	%w[i], %w[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; }
# 74 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_sub_relaxed(int i, atomic_t *v) { return __lse_atomic_fetch_add_relaxed(-i, v); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_sub_acquire(int i, atomic_t *v) { return __lse_atomic_fetch_add_acquire(-i, v); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_sub_release(int i, atomic_t *v) { return __lse_atomic_fetch_add_release(-i, v); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_sub(int i, atomic_t *v) { return __lse_atomic_fetch_add(-i, v); }
# 94 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_add_return_relaxed(int i, atomic_t *v) { return __lse_atomic_fetch_add_relaxed(i, v) + i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_sub_return_relaxed(int i, atomic_t *v) { return __lse_atomic_fetch_sub(i, v) - i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_add_return_acquire(int i, atomic_t *v) { return __lse_atomic_fetch_add_acquire(i, v) + i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_sub_return_acquire(int i, atomic_t *v) { return __lse_atomic_fetch_sub(i, v) - i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_add_return_release(int i, atomic_t *v) { return __lse_atomic_fetch_add_release(i, v) + i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_sub_return_release(int i, atomic_t *v) { return __lse_atomic_fetch_sub(i, v) - i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_add_return(int i, atomic_t *v) { return __lse_atomic_fetch_add(i, v) + i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_sub_return(int i, atomic_t *v) { return __lse_atomic_fetch_sub(i, v) - i; }



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __lse_atomic_and(int i, atomic_t *v)
{
 return __lse_atomic_andnot(~i, v);
}
# 113 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_and_relaxed(int i, atomic_t *v) { return __lse_atomic_fetch_andnot_relaxed(~i, v); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_and_acquire(int i, atomic_t *v) { return __lse_atomic_fetch_andnot_acquire(~i, v); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_and_release(int i, atomic_t *v) { return __lse_atomic_fetch_andnot_release(~i, v); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int __lse_atomic_fetch_and(int i, atomic_t *v) { return __lse_atomic_fetch_andnot(~i, v); }
# 131 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __lse_atomic64_andnot(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	" "stclr" "	%[i], %[v]\n" : [v] "+Q" (v->counter) : [i] "r" (i)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __lse_atomic64_or(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	" "stset" "	%[i], %[v]\n" : [v] "+Q" (v->counter) : [i] "r" (i)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __lse_atomic64_xor(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	" "steor" "	%[i], %[v]\n" : [v] "+Q" (v->counter) : [i] "r" (i)); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __lse_atomic64_add(s64 i, atomic64_t *v) { asm volatile( ".arch_extension lse\n" "	" "stadd" "	%[i], %[v]\n" : [v] "+Q" (v->counter) : [i] "r" (i)); }

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __lse_atomic64_sub(s64 i, atomic64_t *v)
{
 __lse_atomic64_add(-i, v);
}
# 166 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_andnot_relaxed(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldclr" "" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : ); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_andnot_acquire(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldclr" "a" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_andnot_release(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldclr" "l" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_andnot(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldclr" "al" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_or_relaxed(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldset" "" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : ); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_or_acquire(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldset" "a" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_or_release(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldset" "l" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_or(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldset" "al" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_xor_relaxed(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldeor" "" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : ); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_xor_acquire(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldeor" "a" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_xor_release(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldeor" "l" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_xor(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldeor" "al" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_add_relaxed(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldadd" "" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : ); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_add_acquire(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldadd" "a" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_add_release(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldadd" "l" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_add(s64 i, atomic64_t *v) { s64 old; asm volatile( ".arch_extension lse\n" "	" "ldadd" "al" "	%[i], %[old], %[v]" : [v] "+Q" (v->counter), [old] "=r" (old) : [i] "r" (i) : "memory"); return old; }
# 181 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_sub_relaxed(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_add_relaxed(-i, v); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_sub_acquire(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_add_acquire(-i, v); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_sub_release(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_add_release(-i, v); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_sub(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_add(-i, v); }
# 201 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_add_return_relaxed(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_add_relaxed(i, v) + i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_sub_return_relaxed(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_sub_relaxed(i, v) - i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_add_return_acquire(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_add_acquire(i, v) + i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_sub_return_acquire(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_sub_acquire(i, v) - i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_add_return_release(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_add_release(i, v) + i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_sub_return_release(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_sub_release(i, v) - i; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_add_return(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_add(i, v) + i; } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_sub_return(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_sub(i, v) - i; }



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __lse_atomic64_and(s64 i, atomic64_t *v)
{
 return __lse_atomic64_andnot(~i, v);
}
# 220 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_and_relaxed(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_andnot_relaxed(~i, v); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_and_acquire(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_andnot_acquire(~i, v); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_and_release(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_andnot_release(~i, v); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long __lse_atomic64_fetch_and(s64 i, atomic64_t *v) { return __lse_atomic64_fetch_andnot(~i, v); }



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64 __lse_atomic64_dec_if_positive(atomic64_t *v)
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
# 265 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u8 __lse__cmpxchg_case_8(volatile void *ptr, u8 old, u8 new) { asm volatile( ".arch_extension lse\n" "	cas" "" "b" "	%" "w" "[old], %" "w" "[new], %[v]\n" : [v] "+Q" (*(u8 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : ); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u16 __lse__cmpxchg_case_16(volatile void *ptr, u16 old, u16 new) { asm volatile( ".arch_extension lse\n" "	cas" "" "h" "	%" "w" "[old], %" "w" "[new], %[v]\n" : [v] "+Q" (*(u16 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : ); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u32 __lse__cmpxchg_case_32(volatile void *ptr, u32 old, u32 new) { asm volatile( ".arch_extension lse\n" "	cas" "" "" "	%" "w" "[old], %" "w" "[new], %[v]\n" : [v] "+Q" (*(u32 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : ); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u64 __lse__cmpxchg_case_64(volatile void *ptr, u64 old, u64 new) { asm volatile( ".arch_extension lse\n" "	cas" "" "" "	%" "x" "[old], %" "x" "[new], %[v]\n" : [v] "+Q" (*(u64 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : ); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u8 __lse__cmpxchg_case_acq_8(volatile void *ptr, u8 old, u8 new) { asm volatile( ".arch_extension lse\n" "	cas" "a" "b" "	%" "w" "[old], %" "w" "[new], %[v]\n" : [v] "+Q" (*(u8 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u16 __lse__cmpxchg_case_acq_16(volatile void *ptr, u16 old, u16 new) { asm volatile( ".arch_extension lse\n" "	cas" "a" "h" "	%" "w" "[old], %" "w" "[new], %[v]\n" : [v] "+Q" (*(u16 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u32 __lse__cmpxchg_case_acq_32(volatile void *ptr, u32 old, u32 new) { asm volatile( ".arch_extension lse\n" "	cas" "a" "" "	%" "w" "[old], %" "w" "[new], %[v]\n" : [v] "+Q" (*(u32 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u64 __lse__cmpxchg_case_acq_64(volatile void *ptr, u64 old, u64 new) { asm volatile( ".arch_extension lse\n" "	cas" "a" "" "	%" "x" "[old], %" "x" "[new], %[v]\n" : [v] "+Q" (*(u64 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u8 __lse__cmpxchg_case_rel_8(volatile void *ptr, u8 old, u8 new) { asm volatile( ".arch_extension lse\n" "	cas" "l" "b" "	%" "w" "[old], %" "w" "[new], %[v]\n" : [v] "+Q" (*(u8 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u16 __lse__cmpxchg_case_rel_16(volatile void *ptr, u16 old, u16 new) { asm volatile( ".arch_extension lse\n" "	cas" "l" "h" "	%" "w" "[old], %" "w" "[new], %[v]\n" : [v] "+Q" (*(u16 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u32 __lse__cmpxchg_case_rel_32(volatile void *ptr, u32 old, u32 new) { asm volatile( ".arch_extension lse\n" "	cas" "l" "" "	%" "w" "[old], %" "w" "[new], %[v]\n" : [v] "+Q" (*(u32 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u64 __lse__cmpxchg_case_rel_64(volatile void *ptr, u64 old, u64 new) { asm volatile( ".arch_extension lse\n" "	cas" "l" "" "	%" "x" "[old], %" "x" "[new], %[v]\n" : [v] "+Q" (*(u64 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u8 __lse__cmpxchg_case_mb_8(volatile void *ptr, u8 old, u8 new) { asm volatile( ".arch_extension lse\n" "	cas" "al" "b" "	%" "w" "[old], %" "w" "[new], %[v]\n" : [v] "+Q" (*(u8 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u16 __lse__cmpxchg_case_mb_16(volatile void *ptr, u16 old, u16 new) { asm volatile( ".arch_extension lse\n" "	cas" "al" "h" "	%" "w" "[old], %" "w" "[new], %[v]\n" : [v] "+Q" (*(u16 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u32 __lse__cmpxchg_case_mb_32(volatile void *ptr, u32 old, u32 new) { asm volatile( ".arch_extension lse\n" "	cas" "al" "" "	%" "w" "[old], %" "w" "[new], %[v]\n" : [v] "+Q" (*(u32 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : "memory"); return old; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u64 __lse__cmpxchg_case_mb_64(volatile void *ptr, u64 old, u64 new) { asm volatile( ".arch_extension lse\n" "	cas" "al" "" "	%" "x" "[old], %" "x" "[new], %[v]\n" : [v] "+Q" (*(u64 *)ptr), [old] "+r" (old) : [new] "rZ" (new) : "memory"); return old; }
# 310 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic_lse.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u128 __lse__cmpxchg128(volatile u128 *ptr, u128 old, u128 new) { union __u128_halves r, o = { .full = (old) }, n = { .full = (new) }; register unsigned long x0 asm ("x0") = o.low; register unsigned long x1 asm ("x1") = o.high; register unsigned long x2 asm ("x2") = n.low; register unsigned long x3 asm ("x3") = n.high; register unsigned long x4 asm ("x4") = (unsigned long)ptr; asm volatile( ".arch_extension lse\n" "	casp" "" "\t%[old1], %[old2], %[new1], %[new2], %[v]\n" : [old1] "+&r" (x0), [old2] "+&r" (x1), [v] "+Q" (*(u128 *)ptr) : [new1] "r" (x2), [new2] "r" (x3), [ptr] "r" (x4), [oldval1] "r" (o.low), [oldval2] "r" (o.high) : ); r.low = x0; r.high = x1; return r.full; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) u128 __lse__cmpxchg128_mb(volatile u128 *ptr, u128 old, u128 new) { union __u128_halves r, o = { .full = (old) }, n = { .full = (new) }; register unsigned long x0 asm ("x0") = o.low; register unsigned long x1 asm ("x1") = o.high; register unsigned long x2 asm ("x2") = n.low; register unsigned long x3 asm ("x3") = n.high; register unsigned long x4 asm ("x4") = (unsigned long)ptr; asm volatile( ".arch_extension lse\n" "	casp" "al" "\t%[old1], %[old2], %[new1], %[new2], %[v]\n" : [old1] "+&r" (x0), [old2] "+&r" (x1), [v] "+Q" (*(u128 *)ptr) : [new1] "r" (x2), [new2] "r" (x3), [ptr] "r" (x4), [oldval1] "r" (o.low), [oldval2] "r" (o.high) : "memory"); r.low = x0; r.high = x1; return r.full; }
# 17 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/lse.h" 2
# 15 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/cmpxchg.h" 2
# 45 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u8 __xchg_case_8(u8 x, volatile void *ptr) { u8 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "b" "\t%" "w" "0, %2\n" "	st" "" "xr" "b" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "" "b" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u8 *)ptr) : "r" (x) : ); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u16 __xchg_case_16(u16 x, volatile void *ptr) { u16 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "h" "\t%" "w" "0, %2\n" "	st" "" "xr" "h" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "" "h" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u16 *)ptr) : "r" (x) : ); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u32 __xchg_case_32(u32 x, volatile void *ptr) { u32 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "w" "0, %2\n" "	st" "" "xr" "" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "" "" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u32 *)ptr) : "r" (x) : ); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u64 __xchg_case_64(u64 x, volatile void *ptr) { u64 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "" "0, %2\n" "	st" "" "xr" "" "\t%w1, %" "" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "" "" "\t%" "" "3, %" "" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u64 *)ptr) : "r" (x) : ); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u8 __xchg_case_acq_8(u8 x, volatile void *ptr) { u8 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr" "b" "\t%" "w" "0, %2\n" "	st" "" "xr" "b" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "" "b" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u8 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u16 __xchg_case_acq_16(u16 x, volatile void *ptr) { u16 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr" "h" "\t%" "w" "0, %2\n" "	st" "" "xr" "h" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "" "h" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u16 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u32 __xchg_case_acq_32(u32 x, volatile void *ptr) { u32 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr" "" "\t%" "w" "0, %2\n" "	st" "" "xr" "" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "" "" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u32 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u64 __xchg_case_acq_64(u64 x, volatile void *ptr) { u64 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr" "" "\t%" "" "0, %2\n" "	st" "" "xr" "" "\t%w1, %" "" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "" "" "\t%" "" "3, %" "" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u64 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u8 __xchg_case_rel_8(u8 x, volatile void *ptr) { u8 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "b" "\t%" "w" "0, %2\n" "	st" "l" "xr" "b" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "l" "b" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u8 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u16 __xchg_case_rel_16(u16 x, volatile void *ptr) { u16 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "h" "\t%" "w" "0, %2\n" "	st" "l" "xr" "h" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "l" "h" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u16 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u32 __xchg_case_rel_32(u32 x, volatile void *ptr) { u32 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "w" "0, %2\n" "	st" "l" "xr" "" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "l" "" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u32 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u64 __xchg_case_rel_64(u64 x, volatile void *ptr) { u64 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "" "0, %2\n" "	st" "l" "xr" "" "\t%w1, %" "" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "" "l" "" "\t%" "" "3, %" "" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u64 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u8 __xchg_case_mb_8(u8 x, volatile void *ptr) { u8 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "b" "\t%" "w" "0, %2\n" "	st" "l" "xr" "b" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "l" "b" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "nop" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u8 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u16 __xchg_case_mb_16(u16 x, volatile void *ptr) { u16 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "h" "\t%" "w" "0, %2\n" "	st" "l" "xr" "h" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "l" "h" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "nop" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u16 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u32 __xchg_case_mb_32(u32 x, volatile void *ptr) { u32 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "w" "0, %2\n" "	st" "l" "xr" "" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "l" "" "\t%" "w" "3, %" "w" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "nop" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u32 *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u64 __xchg_case_mb_64(u64 x, volatile void *ptr) { u64 ret; unsigned long tmp; asm volatile(".if ""1"" == 1\n" "661:\n\t" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "" "0, %2\n" "	st" "l" "xr" "" "\t%w1, %" "" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .word 663f - .\n" " .hword " "37" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" ".subsection 1\n" "663:\n\t" ".arch_extension lse\n" "	swp" "a" "l" "" "\t%" "" "3, %" "" "0, %2\n" ".rept	" "3" "\nnop\n.endr\n" "	" "nop" "\n" "664:\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n\t" ".previous\n" ".endif\n" : "=&r" (ret), "=&r" (tmp), "+Q" (*(u64 *)ptr) : "r" (x) : "memory"); return ret; }
# 84 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) unsigned long __arch_xchg(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_8(x, ptr); case 2: return __xchg_case_16(x, ptr); case 4: return __xchg_case_32(x, ptr); case 8: return __xchg_case_64(x, ptr); default: do { __attribute__((__noreturn__)) extern void __compiletime_assert_3(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_3(); } while (0); } do { asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) unsigned long __arch_xchg_acq(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_acq_8(x, ptr); case 2: return __xchg_case_acq_16(x, ptr); case 4: return __xchg_case_acq_32(x, ptr); case 8: return __xchg_case_acq_64(x, ptr); default: do { __attribute__((__noreturn__)) extern void __compiletime_assert_4(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_4(); } while (0); } do { asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) unsigned long __arch_xchg_rel(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_rel_8(x, ptr); case 2: return __xchg_case_rel_16(x, ptr); case 4: return __xchg_case_rel_32(x, ptr); case 8: return __xchg_case_rel_64(x, ptr); default: do { __attribute__((__noreturn__)) extern void __compiletime_assert_5(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_5(); } while (0); } do { asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) unsigned long __arch_xchg_mb(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_mb_8(x, ptr); case 2: return __xchg_case_mb_16(x, ptr); case 4: return __xchg_case_mb_32(x, ptr); case 8: return __xchg_case_mb_64(x, ptr); default: do { __attribute__((__noreturn__)) extern void __compiletime_assert_6(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_6(); } while (0); } do { asm volatile(""); __builtin_unreachable(); } while (0); }
# 114 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u8 __cmpxchg_case_8(volatile void *ptr, u8 old, u8 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_8(ptr, old, new) : __ll_sc__cmpxchg_case_8(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u16 __cmpxchg_case_16(volatile void *ptr, u16 old, u16 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_16(ptr, old, new) : __ll_sc__cmpxchg_case_16(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u32 __cmpxchg_case_32(volatile void *ptr, u32 old, u32 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_32(ptr, old, new) : __ll_sc__cmpxchg_case_32(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u64 __cmpxchg_case_64(volatile void *ptr, u64 old, u64 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_64(ptr, old, new) : __ll_sc__cmpxchg_case_64(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u8 __cmpxchg_case_acq_8(volatile void *ptr, u8 old, u8 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_acq_8(ptr, old, new) : __ll_sc__cmpxchg_case_acq_8(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u16 __cmpxchg_case_acq_16(volatile void *ptr, u16 old, u16 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_acq_16(ptr, old, new) : __ll_sc__cmpxchg_case_acq_16(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u32 __cmpxchg_case_acq_32(volatile void *ptr, u32 old, u32 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_acq_32(ptr, old, new) : __ll_sc__cmpxchg_case_acq_32(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u64 __cmpxchg_case_acq_64(volatile void *ptr, u64 old, u64 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_acq_64(ptr, old, new) : __ll_sc__cmpxchg_case_acq_64(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u8 __cmpxchg_case_rel_8(volatile void *ptr, u8 old, u8 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_rel_8(ptr, old, new) : __ll_sc__cmpxchg_case_rel_8(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u16 __cmpxchg_case_rel_16(volatile void *ptr, u16 old, u16 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_rel_16(ptr, old, new) : __ll_sc__cmpxchg_case_rel_16(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u32 __cmpxchg_case_rel_32(volatile void *ptr, u32 old, u32 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_rel_32(ptr, old, new) : __ll_sc__cmpxchg_case_rel_32(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u64 __cmpxchg_case_rel_64(volatile void *ptr, u64 old, u64 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_rel_64(ptr, old, new) : __ll_sc__cmpxchg_case_rel_64(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u8 __cmpxchg_case_mb_8(volatile void *ptr, u8 old, u8 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_mb_8(ptr, old, new) : __ll_sc__cmpxchg_case_mb_8(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u16 __cmpxchg_case_mb_16(volatile void *ptr, u16 old, u16 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_mb_16(ptr, old, new) : __ll_sc__cmpxchg_case_mb_16(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u32 __cmpxchg_case_mb_32(volatile void *ptr, u32 old, u32 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_mb_32(ptr, old, new) : __ll_sc__cmpxchg_case_mb_32(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u64 __cmpxchg_case_mb_64(volatile void *ptr, u64 old, u64 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg_case_mb_64(ptr, old, new) : __ll_sc__cmpxchg_case_mb_64(ptr, old, new); }); }
# 141 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u128 __cmpxchg128(volatile u128 *ptr, u128 old, u128 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg128(ptr, old, new) : __ll_sc__cmpxchg128(ptr, old, new); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u128 __cmpxchg128_mb(volatile u128 *ptr, u128 old, u128 new) { return ({ alternative_has_cap_likely(37) ? __lse__cmpxchg128_mb(ptr, old, new) : __ll_sc__cmpxchg128_mb(ptr, old, new); }); }
# 168 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) unsigned long __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_8(ptr, old, new); case 2: return __cmpxchg_case_16(ptr, old, new); case 4: return __cmpxchg_case_32(ptr, old, new); case 8: return __cmpxchg_case_64(ptr, old, new); default: do { __attribute__((__noreturn__)) extern void __compiletime_assert_7(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_7(); } while (0); } do { asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) unsigned long __cmpxchg_acq(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_acq_8(ptr, old, new); case 2: return __cmpxchg_case_acq_16(ptr, old, new); case 4: return __cmpxchg_case_acq_32(ptr, old, new); case 8: return __cmpxchg_case_acq_64(ptr, old, new); default: do { __attribute__((__noreturn__)) extern void __compiletime_assert_8(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_8(); } while (0); } do { asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) unsigned long __cmpxchg_rel(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_rel_8(ptr, old, new); case 2: return __cmpxchg_case_rel_16(ptr, old, new); case 4: return __cmpxchg_case_rel_32(ptr, old, new); case 8: return __cmpxchg_case_rel_64(ptr, old, new); default: do { __attribute__((__noreturn__)) extern void __compiletime_assert_9(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_9(); } while (0); } do { asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) unsigned long __cmpxchg_mb(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_mb_8(ptr, old, new); case 2: return __cmpxchg_case_mb_16(ptr, old, new); case 4: return __cmpxchg_case_mb_32(ptr, old, new); case 8: return __cmpxchg_case_mb_64(ptr, old, new); default: do { __attribute__((__noreturn__)) extern void __compiletime_assert_10(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_10(); } while (0); } do { asm volatile(""); __builtin_unreachable(); } while (0); }
# 229 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __cmpwait_case_8(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "b" "\t%" "w" "[tmp], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	cbnz	%" "w" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(u8 *)ptr) : [val] "r" (val)); };
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __cmpwait_case_16(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "h" "\t%" "w" "[tmp], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	cbnz	%" "w" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(u16 *)ptr) : [val] "r" (val)); };
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __cmpwait_case_32(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "" "\t%" "w" "[tmp], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	cbnz	%" "w" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(u32 *)ptr) : [val] "r" (val)); };
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __cmpwait_case_64(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "" "\t%" "" "[tmp], %[v]\n" "	eor	%" "" "[tmp], %" "" "[tmp], %" "" "[val]\n" "	cbnz	%" "" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(u64 *)ptr) : [val] "r" (val)); };
# 257 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __cmpwait(volatile void *ptr, unsigned long val, int size) { switch (size) { case 1: return __cmpwait_case_8(ptr, (u8)val); case 2: return __cmpwait_case_16(ptr, (u16)val); case 4: return __cmpwait_case_32(ptr, val); case 8: return __cmpwait_case_64(ptr, val); default: do { __attribute__((__noreturn__)) extern void __compiletime_assert_11(void) __attribute__((__error__("BUILD_BUG failed"))); if (!(!(1))) __compiletime_assert_11(); } while (0); } do { asm volatile(""); __builtin_unreachable(); } while (0); }
# 17 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic.h" 2
# 25 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void arch_atomic_andnot(int i, atomic_t *v) { ({ alternative_has_cap_likely(37) ? __lse_atomic_andnot(i, v) : __ll_sc_atomic_andnot(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void arch_atomic_or(int i, atomic_t *v) { ({ alternative_has_cap_likely(37) ? __lse_atomic_or(i, v) : __ll_sc_atomic_or(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void arch_atomic_xor(int i, atomic_t *v) { ({ alternative_has_cap_likely(37) ? __lse_atomic_xor(i, v) : __ll_sc_atomic_xor(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void arch_atomic_add(int i, atomic_t *v) { ({ alternative_has_cap_likely(37) ? __lse_atomic_add(i, v) : __ll_sc_atomic_add(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void arch_atomic_and(int i, atomic_t *v) { ({ alternative_has_cap_likely(37) ? __lse_atomic_and(i, v) : __ll_sc_atomic_and(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void arch_atomic_sub(int i, atomic_t *v) { ({ alternative_has_cap_likely(37) ? __lse_atomic_sub(i, v) : __ll_sc_atomic_sub(i, v); }); }
# 46 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_andnot_relaxed(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_andnot_relaxed(i, v) : __ll_sc_atomic_fetch_andnot_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_andnot_acquire(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_andnot_acquire(i, v) : __ll_sc_atomic_fetch_andnot_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_andnot_release(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_andnot_release(i, v) : __ll_sc_atomic_fetch_andnot_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_andnot(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_andnot(i, v) : __ll_sc_atomic_fetch_andnot(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_or_relaxed(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_or_relaxed(i, v) : __ll_sc_atomic_fetch_or_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_or_acquire(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_or_acquire(i, v) : __ll_sc_atomic_fetch_or_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_or_release(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_or_release(i, v) : __ll_sc_atomic_fetch_or_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_or(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_or(i, v) : __ll_sc_atomic_fetch_or(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_xor_relaxed(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_xor_relaxed(i, v) : __ll_sc_atomic_fetch_xor_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_xor_acquire(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_xor_acquire(i, v) : __ll_sc_atomic_fetch_xor_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_xor_release(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_xor_release(i, v) : __ll_sc_atomic_fetch_xor_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_xor(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_xor(i, v) : __ll_sc_atomic_fetch_xor(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_add_relaxed(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_add_relaxed(i, v) : __ll_sc_atomic_fetch_add_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_add_acquire(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_add_acquire(i, v) : __ll_sc_atomic_fetch_add_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_add_release(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_add_release(i, v) : __ll_sc_atomic_fetch_add_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_add(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_add(i, v) : __ll_sc_atomic_fetch_add(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_and_relaxed(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_and_relaxed(i, v) : __ll_sc_atomic_fetch_and_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_and_acquire(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_and_acquire(i, v) : __ll_sc_atomic_fetch_and_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_and_release(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_and_release(i, v) : __ll_sc_atomic_fetch_and_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_and(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_and(i, v) : __ll_sc_atomic_fetch_and(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_sub_relaxed(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_sub_relaxed(i, v) : __ll_sc_atomic_fetch_sub_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_sub_acquire(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_sub_acquire(i, v) : __ll_sc_atomic_fetch_sub_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_sub_release(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_sub_release(i, v) : __ll_sc_atomic_fetch_sub_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_fetch_sub(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_fetch_sub(i, v) : __ll_sc_atomic_fetch_sub(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_add_return_relaxed(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_add_return_relaxed(i, v) : __ll_sc_atomic_add_return_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_add_return_acquire(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_add_return_acquire(i, v) : __ll_sc_atomic_add_return_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_add_return_release(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_add_return_release(i, v) : __ll_sc_atomic_add_return_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_add_return(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_add_return(i, v) : __ll_sc_atomic_add_return(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_sub_return_relaxed(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_sub_return_relaxed(i, v) : __ll_sc_atomic_sub_return_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_sub_return_acquire(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_sub_return_acquire(i, v) : __ll_sc_atomic_sub_return_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_sub_return_release(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_sub_return_release(i, v) : __ll_sc_atomic_sub_return_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int arch_atomic_sub_return(int i, atomic_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic_sub_return(i, v) : __ll_sc_atomic_sub_return(i, v); }); }
# 64 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void arch_atomic64_andnot(long i, atomic64_t *v) { ({ alternative_has_cap_likely(37) ? __lse_atomic64_andnot(i, v) : __ll_sc_atomic64_andnot(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void arch_atomic64_or(long i, atomic64_t *v) { ({ alternative_has_cap_likely(37) ? __lse_atomic64_or(i, v) : __ll_sc_atomic64_or(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void arch_atomic64_xor(long i, atomic64_t *v) { ({ alternative_has_cap_likely(37) ? __lse_atomic64_xor(i, v) : __ll_sc_atomic64_xor(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void arch_atomic64_add(long i, atomic64_t *v) { ({ alternative_has_cap_likely(37) ? __lse_atomic64_add(i, v) : __ll_sc_atomic64_add(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void arch_atomic64_and(long i, atomic64_t *v) { ({ alternative_has_cap_likely(37) ? __lse_atomic64_and(i, v) : __ll_sc_atomic64_and(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void arch_atomic64_sub(long i, atomic64_t *v) { ({ alternative_has_cap_likely(37) ? __lse_atomic64_sub(i, v) : __ll_sc_atomic64_sub(i, v); }); }
# 85 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_andnot_relaxed(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_andnot_relaxed(i, v) : __ll_sc_atomic64_fetch_andnot_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_andnot_acquire(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_andnot_acquire(i, v) : __ll_sc_atomic64_fetch_andnot_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_andnot_release(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_andnot_release(i, v) : __ll_sc_atomic64_fetch_andnot_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_andnot(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_andnot(i, v) : __ll_sc_atomic64_fetch_andnot(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_or_relaxed(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_or_relaxed(i, v) : __ll_sc_atomic64_fetch_or_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_or_acquire(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_or_acquire(i, v) : __ll_sc_atomic64_fetch_or_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_or_release(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_or_release(i, v) : __ll_sc_atomic64_fetch_or_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_or(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_or(i, v) : __ll_sc_atomic64_fetch_or(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_xor_relaxed(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_xor_relaxed(i, v) : __ll_sc_atomic64_fetch_xor_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_xor_acquire(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_xor_acquire(i, v) : __ll_sc_atomic64_fetch_xor_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_xor_release(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_xor_release(i, v) : __ll_sc_atomic64_fetch_xor_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_xor(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_xor(i, v) : __ll_sc_atomic64_fetch_xor(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_add_relaxed(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_add_relaxed(i, v) : __ll_sc_atomic64_fetch_add_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_add_acquire(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_add_acquire(i, v) : __ll_sc_atomic64_fetch_add_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_add_release(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_add_release(i, v) : __ll_sc_atomic64_fetch_add_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_add(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_add(i, v) : __ll_sc_atomic64_fetch_add(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_and_relaxed(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_and_relaxed(i, v) : __ll_sc_atomic64_fetch_and_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_and_acquire(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_and_acquire(i, v) : __ll_sc_atomic64_fetch_and_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_and_release(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_and_release(i, v) : __ll_sc_atomic64_fetch_and_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_and(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_and(i, v) : __ll_sc_atomic64_fetch_and(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_sub_relaxed(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_sub_relaxed(i, v) : __ll_sc_atomic64_fetch_sub_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_sub_acquire(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_sub_acquire(i, v) : __ll_sc_atomic64_fetch_sub_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_sub_release(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_sub_release(i, v) : __ll_sc_atomic64_fetch_sub_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_fetch_sub(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_fetch_sub(i, v) : __ll_sc_atomic64_fetch_sub(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_add_return_relaxed(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_add_return_relaxed(i, v) : __ll_sc_atomic64_add_return_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_add_return_acquire(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_add_return_acquire(i, v) : __ll_sc_atomic64_add_return_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_add_return_release(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_add_return_release(i, v) : __ll_sc_atomic64_add_return_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_add_return(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_add_return(i, v) : __ll_sc_atomic64_add_return(i, v); }); }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_sub_return_relaxed(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_sub_return_relaxed(i, v) : __ll_sc_atomic64_sub_return_relaxed(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_sub_return_acquire(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_sub_return_acquire(i, v) : __ll_sc_atomic64_sub_return_acquire(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_sub_return_release(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_sub_return_release(i, v) : __ll_sc_atomic64_sub_return_release(i, v); }); } static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_sub_return(long i, atomic64_t *v) { return ({ alternative_has_cap_likely(37) ? __lse_atomic64_sub_return(i, v) : __ll_sc_atomic64_sub_return(i, v); }); }




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long arch_atomic64_dec_if_positive(atomic64_t *v)
{
 return ({ alternative_has_cap_likely(37) ? __lse_atomic64_dec_if_positive(v) : __ll_sc_atomic64_dec_if_positive(v); });
}
# 8 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic.h" 2
# 80 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h" 1
# 454 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_read(const atomic_t *v)
{
 return (*(const volatile typeof( _Generic(((v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: ((v)->counter))) *)&((v)->counter));
}
# 470 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_read_acquire(const atomic_t *v)
{



 int ret;

 if ((sizeof(atomic_t) == sizeof(char) || sizeof(atomic_t) == sizeof(short) || sizeof(atomic_t) == sizeof(int) || sizeof(atomic_t) == sizeof(long))) {
  ret = ({ union { typeof( _Generic((*&(v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&(v)->counter))) __val; char __c[1]; } __u; typeof(&(v)->counter) __p = (&(v)->counter); do { __attribute__((__noreturn__)) extern void __compiletime_assert_12(void) __attribute__((__error__("Need native word sized stores/loads for atomicity."))); if (!((sizeof(*&(v)->counter) == sizeof(char) || sizeof(*&(v)->counter) == sizeof(short) || sizeof(*&(v)->counter) == sizeof(int) || sizeof(*&(v)->counter) == sizeof(long)))) __compiletime_assert_12(); } while (0); kasan_check_read(__p, sizeof(*&(v)->counter)); switch (sizeof(*&(v)->counter)) { case 1: asm volatile ("ldarb %w0, %1" : "=r" (*(__u8 *)__u.__c) : "Q" (*__p) : "memory"); break; case 2: asm volatile ("ldarh %w0, %1" : "=r" (*(__u16 *)__u.__c) : "Q" (*__p) : "memory"); break; case 4: asm volatile ("ldar %w0, %1" : "=r" (*(__u32 *)__u.__c) : "Q" (*__p) : "memory"); break; case 8: asm volatile ("ldar %0, %1" : "=r" (*(__u64 *)__u.__c) : "Q" (*__p) : "memory"); break; } (typeof(*&(v)->counter))__u.__val; });
 } else {
  ret = raw_atomic_read(v);
  do { do { } while (0); asm volatile("dmb " "ish" : : : "memory"); } while (0);
 }

 return ret;

}
# 500 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_set(atomic_t *v, int i)
{
 do { *(volatile typeof(((v)->counter)) *)&(((v)->counter)) = ((i)); } while (0);
}
# 517 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_set_release(atomic_t *v, int i)
{



 if ((sizeof(atomic_t) == sizeof(char) || sizeof(atomic_t) == sizeof(short) || sizeof(atomic_t) == sizeof(int) || sizeof(atomic_t) == sizeof(long))) {
  do { do { } while (0); do { typeof(&(v)->counter) __p = (&(v)->counter); union { typeof( _Generic((*&(v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&(v)->counter))) __val; char __c[1]; } __u = { .__val = ( typeof( _Generic((*&(v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&(v)->counter)))) (i) }; do { __attribute__((__noreturn__)) extern void __compiletime_assert_13(void) __attribute__((__error__("Need native word sized stores/loads for atomicity."))); if (!((sizeof(*&(v)->counter) == sizeof(char) || sizeof(*&(v)->counter) == sizeof(short) || sizeof(*&(v)->counter) == sizeof(int) || sizeof(*&(v)->counter) == sizeof(long)))) __compiletime_assert_13(); } while (0); kasan_check_write(__p, sizeof(*&(v)->counter)); switch (sizeof(*&(v)->counter)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*__p) : "rZ" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*__p) : "rZ" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*__p) : "rZ" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %x1, %0" : "=Q" (*__p) : "rZ" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); } while (0);
 } else {
  do { do { } while (0); asm volatile("dmb " "ish" : : : "memory"); } while (0);
  raw_atomic_set(v, i);
 }

}
# 543 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_add(int i, atomic_t *v)
{
 arch_atomic_add(i, v);
}
# 560 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_add_return(int i, atomic_t *v)
{

 return arch_atomic_add_return(i, v);
# 574 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 587 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_add_return_acquire(int i, atomic_t *v)
{

 return arch_atomic_add_return_acquire(i, v);
# 601 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 614 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_add_return_release(int i, atomic_t *v)
{

 return arch_atomic_add_return_release(i, v);
# 627 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 640 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_add_return_relaxed(int i, atomic_t *v)
{

 return arch_atomic_add_return_relaxed(i, v);





}
# 663 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_add(int i, atomic_t *v)
{

 return arch_atomic_fetch_add(i, v);
# 677 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 690 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_add_acquire(int i, atomic_t *v)
{

 return arch_atomic_fetch_add_acquire(i, v);
# 704 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 717 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_add_release(int i, atomic_t *v)
{

 return arch_atomic_fetch_add_release(i, v);
# 730 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 743 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_add_relaxed(int i, atomic_t *v)
{

 return arch_atomic_fetch_add_relaxed(i, v);





}
# 766 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_sub(int i, atomic_t *v)
{
 arch_atomic_sub(i, v);
}
# 783 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_sub_return(int i, atomic_t *v)
{

 return arch_atomic_sub_return(i, v);
# 797 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 810 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_sub_return_acquire(int i, atomic_t *v)
{

 return arch_atomic_sub_return_acquire(i, v);
# 824 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 837 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_sub_return_release(int i, atomic_t *v)
{

 return arch_atomic_sub_return_release(i, v);
# 850 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 863 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_sub_return_relaxed(int i, atomic_t *v)
{

 return arch_atomic_sub_return_relaxed(i, v);





}
# 886 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_sub(int i, atomic_t *v)
{

 return arch_atomic_fetch_sub(i, v);
# 900 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 913 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_sub_acquire(int i, atomic_t *v)
{

 return arch_atomic_fetch_sub_acquire(i, v);
# 927 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 940 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_sub_release(int i, atomic_t *v)
{

 return arch_atomic_fetch_sub_release(i, v);
# 953 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 966 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_sub_relaxed(int i, atomic_t *v)
{

 return arch_atomic_fetch_sub_relaxed(i, v);





}
# 988 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_inc(atomic_t *v)
{



 raw_atomic_add(1, v);

}
# 1008 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_inc_return(atomic_t *v)
{
# 1020 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_add_return(1, v);

}
# 1034 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_inc_return_acquire(atomic_t *v)
{
# 1046 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_add_return_acquire(1, v);

}
# 1060 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_inc_return_release(atomic_t *v)
{
# 1071 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_add_return_release(1, v);

}
# 1085 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_inc_return_relaxed(atomic_t *v)
{





 return raw_atomic_add_return_relaxed(1, v);

}
# 1107 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_inc(atomic_t *v)
{
# 1119 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_fetch_add(1, v);

}
# 1133 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_inc_acquire(atomic_t *v)
{
# 1145 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_fetch_add_acquire(1, v);

}
# 1159 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_inc_release(atomic_t *v)
{
# 1170 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_fetch_add_release(1, v);

}
# 1184 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_inc_relaxed(atomic_t *v)
{





 return raw_atomic_fetch_add_relaxed(1, v);

}
# 1206 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_dec(atomic_t *v)
{



 raw_atomic_sub(1, v);

}
# 1226 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_dec_return(atomic_t *v)
{
# 1238 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_sub_return(1, v);

}
# 1252 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_dec_return_acquire(atomic_t *v)
{
# 1264 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_sub_return_acquire(1, v);

}
# 1278 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_dec_return_release(atomic_t *v)
{
# 1289 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_sub_return_release(1, v);

}
# 1303 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_dec_return_relaxed(atomic_t *v)
{





 return raw_atomic_sub_return_relaxed(1, v);

}
# 1325 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_dec(atomic_t *v)
{
# 1337 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_fetch_sub(1, v);

}
# 1351 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_dec_acquire(atomic_t *v)
{
# 1363 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_fetch_sub_acquire(1, v);

}
# 1377 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_dec_release(atomic_t *v)
{
# 1388 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_fetch_sub_release(1, v);

}
# 1402 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_dec_relaxed(atomic_t *v)
{





 return raw_atomic_fetch_sub_relaxed(1, v);

}
# 1425 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_and(int i, atomic_t *v)
{
 arch_atomic_and(i, v);
}
# 1442 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_and(int i, atomic_t *v)
{

 return arch_atomic_fetch_and(i, v);
# 1456 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 1469 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_and_acquire(int i, atomic_t *v)
{

 return arch_atomic_fetch_and_acquire(i, v);
# 1483 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 1496 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_and_release(int i, atomic_t *v)
{

 return arch_atomic_fetch_and_release(i, v);
# 1509 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 1522 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_and_relaxed(int i, atomic_t *v)
{

 return arch_atomic_fetch_and_relaxed(i, v);





}
# 1545 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_andnot(int i, atomic_t *v)
{

 arch_atomic_andnot(i, v);



}
# 1566 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_andnot(int i, atomic_t *v)
{

 return arch_atomic_fetch_andnot(i, v);
# 1580 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 1593 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_andnot_acquire(int i, atomic_t *v)
{

 return arch_atomic_fetch_andnot_acquire(i, v);
# 1607 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 1620 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_andnot_release(int i, atomic_t *v)
{

 return arch_atomic_fetch_andnot_release(i, v);
# 1633 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 1646 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_andnot_relaxed(int i, atomic_t *v)
{

 return arch_atomic_fetch_andnot_relaxed(i, v);





}
# 1669 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_or(int i, atomic_t *v)
{
 arch_atomic_or(i, v);
}
# 1686 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_or(int i, atomic_t *v)
{

 return arch_atomic_fetch_or(i, v);
# 1700 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 1713 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_or_acquire(int i, atomic_t *v)
{

 return arch_atomic_fetch_or_acquire(i, v);
# 1727 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 1740 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_or_release(int i, atomic_t *v)
{

 return arch_atomic_fetch_or_release(i, v);
# 1753 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 1766 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_or_relaxed(int i, atomic_t *v)
{

 return arch_atomic_fetch_or_relaxed(i, v);





}
# 1789 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_xor(int i, atomic_t *v)
{
 arch_atomic_xor(i, v);
}
# 1806 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_xor(int i, atomic_t *v)
{

 return arch_atomic_fetch_xor(i, v);
# 1820 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 1833 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_xor_acquire(int i, atomic_t *v)
{

 return arch_atomic_fetch_xor_acquire(i, v);
# 1847 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 1860 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_xor_release(int i, atomic_t *v)
{

 return arch_atomic_fetch_xor_release(i, v);
# 1873 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 1886 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_xor_relaxed(int i, atomic_t *v)
{

 return arch_atomic_fetch_xor_relaxed(i, v);





}
# 1909 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_xchg(atomic_t *v, int new)
{
# 1921 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __arch_xchg_mb((unsigned long)(new), (&v->counter), sizeof(*(&v->counter))); __ret; });

}
# 1936 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_xchg_acquire(atomic_t *v, int new)
{
# 1948 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __arch_xchg_acq((unsigned long)(new), (&v->counter), sizeof(*(&v->counter))); __ret; });

}
# 1963 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_xchg_release(atomic_t *v, int new)
{
# 1974 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __arch_xchg_rel((unsigned long)(new), (&v->counter), sizeof(*(&v->counter))); __ret; });

}
# 1989 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_xchg_relaxed(atomic_t *v, int new)
{





 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __arch_xchg((unsigned long)(new), (&v->counter), sizeof(*(&v->counter))); __ret; });

}
# 2014 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_cmpxchg(atomic_t *v, int old, int new)
{
# 2026 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __cmpxchg_mb((&v->counter), (unsigned long)(old), (unsigned long)(new), sizeof(*(&v->counter))); __ret; });

}
# 2043 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_cmpxchg_acquire(atomic_t *v, int old, int new)
{
# 2055 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __cmpxchg_acq((&v->counter), (unsigned long)(old), (unsigned long)(new), sizeof(*(&v->counter))); __ret; });

}
# 2072 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_cmpxchg_release(atomic_t *v, int old, int new)
{
# 2083 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __cmpxchg_rel((&v->counter), (unsigned long)(old), (unsigned long)(new), sizeof(*(&v->counter))); __ret; });

}
# 2100 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_cmpxchg_relaxed(atomic_t *v, int old, int new)
{





 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __cmpxchg((&v->counter), (unsigned long)(old), (unsigned long)(new), sizeof(*(&v->counter))); __ret; });

}
# 2126 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_try_cmpxchg(atomic_t *v, int *old, int new)
{
# 2138 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 int r, o = *old;
 r = raw_atomic_cmpxchg(v, o, new);
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);

}
# 2160 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_try_cmpxchg_acquire(atomic_t *v, int *old, int new)
{
# 2172 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 int r, o = *old;
 r = raw_atomic_cmpxchg_acquire(v, o, new);
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);

}
# 2194 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_try_cmpxchg_release(atomic_t *v, int *old, int new)
{
# 2205 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 int r, o = *old;
 r = raw_atomic_cmpxchg_release(v, o, new);
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);

}
# 2227 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_try_cmpxchg_relaxed(atomic_t *v, int *old, int new)
{





 int r, o = *old;
 r = raw_atomic_cmpxchg_relaxed(v, o, new);
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);

}
# 2254 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_sub_and_test(int i, atomic_t *v)
{



 return raw_atomic_sub_return(i, v) == 0;

}
# 2274 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_dec_and_test(atomic_t *v)
{



 return raw_atomic_dec_return(v) == 0;

}
# 2294 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_inc_and_test(atomic_t *v)
{



 return raw_atomic_inc_return(v) == 0;

}
# 2315 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_add_negative(int i, atomic_t *v)
{
# 2327 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_add_return(i, v) < 0;

}
# 2342 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_add_negative_acquire(int i, atomic_t *v)
{
# 2354 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_add_return_acquire(i, v) < 0;

}
# 2369 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_add_negative_release(int i, atomic_t *v)
{
# 2380 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic_add_return_release(i, v) < 0;

}
# 2395 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_add_negative_relaxed(int i, atomic_t *v)
{





 return raw_atomic_add_return_relaxed(i, v) < 0;

}
# 2420 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_fetch_add_unless(atomic_t *v, int a, int u)
{



 int c = raw_atomic_read(v);

 do {
  if (__builtin_expect(!!(c == u), 0))
   break;
 } while (!raw_atomic_try_cmpxchg(v, &c, c + a));

 return c;

}
# 2450 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_add_unless(atomic_t *v, int a, int u)
{



 return raw_atomic_fetch_add_unless(v, a, u) != u;

}
# 2471 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_inc_not_zero(atomic_t *v)
{



 return raw_atomic_add_unless(v, 1, 0);

}
# 2492 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_inc_unless_negative(atomic_t *v)
{



 int c = raw_atomic_read(v);

 do {
  if (__builtin_expect(!!(c < 0), 0))
   return false;
 } while (!raw_atomic_try_cmpxchg(v, &c, c + 1));

 return true;

}
# 2520 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_dec_unless_positive(atomic_t *v)
{



 int c = raw_atomic_read(v);

 do {
  if (__builtin_expect(!!(c > 0), 0))
   return false;
 } while (!raw_atomic_try_cmpxchg(v, &c, c - 1));

 return true;

}
# 2548 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
raw_atomic_dec_if_positive(atomic_t *v)
{



 int dec, c = raw_atomic_read(v);

 do {
  dec = c - 1;
  if (__builtin_expect(!!(dec < 0), 0))
   break;
 } while (!raw_atomic_try_cmpxchg(v, &c, dec));

 return dec;

}
# 2580 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_read(const atomic64_t *v)
{
 return (*(const volatile typeof( _Generic(((v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: ((v)->counter))) *)&((v)->counter));
}
# 2596 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_read_acquire(const atomic64_t *v)
{



 s64 ret;

 if ((sizeof(atomic64_t) == sizeof(char) || sizeof(atomic64_t) == sizeof(short) || sizeof(atomic64_t) == sizeof(int) || sizeof(atomic64_t) == sizeof(long))) {
  ret = ({ union { typeof( _Generic((*&(v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&(v)->counter))) __val; char __c[1]; } __u; typeof(&(v)->counter) __p = (&(v)->counter); do { __attribute__((__noreturn__)) extern void __compiletime_assert_14(void) __attribute__((__error__("Need native word sized stores/loads for atomicity."))); if (!((sizeof(*&(v)->counter) == sizeof(char) || sizeof(*&(v)->counter) == sizeof(short) || sizeof(*&(v)->counter) == sizeof(int) || sizeof(*&(v)->counter) == sizeof(long)))) __compiletime_assert_14(); } while (0); kasan_check_read(__p, sizeof(*&(v)->counter)); switch (sizeof(*&(v)->counter)) { case 1: asm volatile ("ldarb %w0, %1" : "=r" (*(__u8 *)__u.__c) : "Q" (*__p) : "memory"); break; case 2: asm volatile ("ldarh %w0, %1" : "=r" (*(__u16 *)__u.__c) : "Q" (*__p) : "memory"); break; case 4: asm volatile ("ldar %w0, %1" : "=r" (*(__u32 *)__u.__c) : "Q" (*__p) : "memory"); break; case 8: asm volatile ("ldar %0, %1" : "=r" (*(__u64 *)__u.__c) : "Q" (*__p) : "memory"); break; } (typeof(*&(v)->counter))__u.__val; });
 } else {
  ret = raw_atomic64_read(v);
  do { do { } while (0); asm volatile("dmb " "ish" : : : "memory"); } while (0);
 }

 return ret;

}
# 2626 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic64_set(atomic64_t *v, s64 i)
{
 do { *(volatile typeof(((v)->counter)) *)&(((v)->counter)) = ((i)); } while (0);
}
# 2643 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic64_set_release(atomic64_t *v, s64 i)
{



 if ((sizeof(atomic64_t) == sizeof(char) || sizeof(atomic64_t) == sizeof(short) || sizeof(atomic64_t) == sizeof(int) || sizeof(atomic64_t) == sizeof(long))) {
  do { do { } while (0); do { typeof(&(v)->counter) __p = (&(v)->counter); union { typeof( _Generic((*&(v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&(v)->counter))) __val; char __c[1]; } __u = { .__val = ( typeof( _Generic((*&(v)->counter), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*&(v)->counter)))) (i) }; do { __attribute__((__noreturn__)) extern void __compiletime_assert_15(void) __attribute__((__error__("Need native word sized stores/loads for atomicity."))); if (!((sizeof(*&(v)->counter) == sizeof(char) || sizeof(*&(v)->counter) == sizeof(short) || sizeof(*&(v)->counter) == sizeof(int) || sizeof(*&(v)->counter) == sizeof(long)))) __compiletime_assert_15(); } while (0); kasan_check_write(__p, sizeof(*&(v)->counter)); switch (sizeof(*&(v)->counter)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*__p) : "rZ" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*__p) : "rZ" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*__p) : "rZ" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %x1, %0" : "=Q" (*__p) : "rZ" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); } while (0);
 } else {
  do { do { } while (0); asm volatile("dmb " "ish" : : : "memory"); } while (0);
  raw_atomic64_set(v, i);
 }

}
# 2669 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic64_add(s64 i, atomic64_t *v)
{
 arch_atomic64_add(i, v);
}
# 2686 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_add_return(s64 i, atomic64_t *v)
{

 return arch_atomic64_add_return(i, v);
# 2700 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 2713 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_add_return_acquire(s64 i, atomic64_t *v)
{

 return arch_atomic64_add_return_acquire(i, v);
# 2727 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 2740 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_add_return_release(s64 i, atomic64_t *v)
{

 return arch_atomic64_add_return_release(i, v);
# 2753 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 2766 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_add_return_relaxed(s64 i, atomic64_t *v)
{

 return arch_atomic64_add_return_relaxed(i, v);





}
# 2789 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_add(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_add(i, v);
# 2803 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 2816 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_add_acquire(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_add_acquire(i, v);
# 2830 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 2843 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_add_release(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_add_release(i, v);
# 2856 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 2869 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_add_relaxed(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_add_relaxed(i, v);





}
# 2892 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic64_sub(s64 i, atomic64_t *v)
{
 arch_atomic64_sub(i, v);
}
# 2909 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_sub_return(s64 i, atomic64_t *v)
{

 return arch_atomic64_sub_return(i, v);
# 2923 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 2936 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_sub_return_acquire(s64 i, atomic64_t *v)
{

 return arch_atomic64_sub_return_acquire(i, v);
# 2950 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 2963 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_sub_return_release(s64 i, atomic64_t *v)
{

 return arch_atomic64_sub_return_release(i, v);
# 2976 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 2989 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_sub_return_relaxed(s64 i, atomic64_t *v)
{

 return arch_atomic64_sub_return_relaxed(i, v);





}
# 3012 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_sub(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_sub(i, v);
# 3026 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3039 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_sub_acquire(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_sub_acquire(i, v);
# 3053 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3066 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_sub_release(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_sub_release(i, v);
# 3079 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3092 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_sub_relaxed(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_sub_relaxed(i, v);





}
# 3114 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic64_inc(atomic64_t *v)
{



 raw_atomic64_add(1, v);

}
# 3134 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_inc_return(atomic64_t *v)
{
# 3146 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_add_return(1, v);

}
# 3160 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_inc_return_acquire(atomic64_t *v)
{
# 3172 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_add_return_acquire(1, v);

}
# 3186 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_inc_return_release(atomic64_t *v)
{
# 3197 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_add_return_release(1, v);

}
# 3211 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_inc_return_relaxed(atomic64_t *v)
{





 return raw_atomic64_add_return_relaxed(1, v);

}
# 3233 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_inc(atomic64_t *v)
{
# 3245 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_fetch_add(1, v);

}
# 3259 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_inc_acquire(atomic64_t *v)
{
# 3271 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_fetch_add_acquire(1, v);

}
# 3285 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_inc_release(atomic64_t *v)
{
# 3296 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_fetch_add_release(1, v);

}
# 3310 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_inc_relaxed(atomic64_t *v)
{





 return raw_atomic64_fetch_add_relaxed(1, v);

}
# 3332 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic64_dec(atomic64_t *v)
{



 raw_atomic64_sub(1, v);

}
# 3352 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_dec_return(atomic64_t *v)
{
# 3364 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_sub_return(1, v);

}
# 3378 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_dec_return_acquire(atomic64_t *v)
{
# 3390 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_sub_return_acquire(1, v);

}
# 3404 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_dec_return_release(atomic64_t *v)
{
# 3415 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_sub_return_release(1, v);

}
# 3429 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_dec_return_relaxed(atomic64_t *v)
{





 return raw_atomic64_sub_return_relaxed(1, v);

}
# 3451 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_dec(atomic64_t *v)
{
# 3463 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_fetch_sub(1, v);

}
# 3477 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_dec_acquire(atomic64_t *v)
{
# 3489 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_fetch_sub_acquire(1, v);

}
# 3503 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_dec_release(atomic64_t *v)
{
# 3514 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_fetch_sub_release(1, v);

}
# 3528 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_dec_relaxed(atomic64_t *v)
{





 return raw_atomic64_fetch_sub_relaxed(1, v);

}
# 3551 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic64_and(s64 i, atomic64_t *v)
{
 arch_atomic64_and(i, v);
}
# 3568 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_and(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_and(i, v);
# 3582 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3595 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_and_acquire(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_and_acquire(i, v);
# 3609 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3622 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_and_release(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_and_release(i, v);
# 3635 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3648 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_and_relaxed(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_and_relaxed(i, v);





}
# 3671 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic64_andnot(s64 i, atomic64_t *v)
{

 arch_atomic64_andnot(i, v);



}
# 3692 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_andnot(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_andnot(i, v);
# 3706 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3719 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_andnot_acquire(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_andnot_acquire(i, v);
# 3733 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3746 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_andnot_release(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_andnot_release(i, v);
# 3759 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3772 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_andnot_relaxed(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_andnot_relaxed(i, v);





}
# 3795 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic64_or(s64 i, atomic64_t *v)
{
 arch_atomic64_or(i, v);
}
# 3812 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_or(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_or(i, v);
# 3826 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3839 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_or_acquire(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_or_acquire(i, v);
# 3853 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3866 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_or_release(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_or_release(i, v);
# 3879 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3892 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_or_relaxed(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_or_relaxed(i, v);





}
# 3915 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic64_xor(s64 i, atomic64_t *v)
{
 arch_atomic64_xor(i, v);
}
# 3932 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_xor(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_xor(i, v);
# 3946 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3959 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_xor_acquire(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_xor_acquire(i, v);
# 3973 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 3986 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_xor_release(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_xor_release(i, v);
# 3999 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 4012 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_xor_relaxed(s64 i, atomic64_t *v)
{

 return arch_atomic64_fetch_xor_relaxed(i, v);





}
# 4035 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_xchg(atomic64_t *v, s64 new)
{
# 4047 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __arch_xchg_mb((unsigned long)(new), (&v->counter), sizeof(*(&v->counter))); __ret; });

}
# 4062 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_xchg_acquire(atomic64_t *v, s64 new)
{
# 4074 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __arch_xchg_acq((unsigned long)(new), (&v->counter), sizeof(*(&v->counter))); __ret; });

}
# 4089 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_xchg_release(atomic64_t *v, s64 new)
{
# 4100 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __arch_xchg_rel((unsigned long)(new), (&v->counter), sizeof(*(&v->counter))); __ret; });

}
# 4115 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_xchg_relaxed(atomic64_t *v, s64 new)
{





 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __arch_xchg((unsigned long)(new), (&v->counter), sizeof(*(&v->counter))); __ret; });

}
# 4140 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_cmpxchg(atomic64_t *v, s64 old, s64 new)
{
# 4152 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __cmpxchg_mb((&v->counter), (unsigned long)(old), (unsigned long)(new), sizeof(*(&v->counter))); __ret; });

}
# 4169 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_cmpxchg_acquire(atomic64_t *v, s64 old, s64 new)
{
# 4181 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __cmpxchg_acq((&v->counter), (unsigned long)(old), (unsigned long)(new), sizeof(*(&v->counter))); __ret; });

}
# 4198 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_cmpxchg_release(atomic64_t *v, s64 old, s64 new)
{
# 4209 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __cmpxchg_rel((&v->counter), (unsigned long)(old), (unsigned long)(new), sizeof(*(&v->counter))); __ret; });

}
# 4226 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_cmpxchg_relaxed(atomic64_t *v, s64 old, s64 new)
{





 return ({ __typeof__(*(&v->counter)) __ret; __ret = (__typeof__(*(&v->counter))) __cmpxchg((&v->counter), (unsigned long)(old), (unsigned long)(new), sizeof(*(&v->counter))); __ret; });

}
# 4252 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_try_cmpxchg(atomic64_t *v, s64 *old, s64 new)
{
# 4264 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 s64 r, o = *old;
 r = raw_atomic64_cmpxchg(v, o, new);
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);

}
# 4286 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_try_cmpxchg_acquire(atomic64_t *v, s64 *old, s64 new)
{
# 4298 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 s64 r, o = *old;
 r = raw_atomic64_cmpxchg_acquire(v, o, new);
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);

}
# 4320 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_try_cmpxchg_release(atomic64_t *v, s64 *old, s64 new)
{
# 4331 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 s64 r, o = *old;
 r = raw_atomic64_cmpxchg_release(v, o, new);
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);

}
# 4353 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_try_cmpxchg_relaxed(atomic64_t *v, s64 *old, s64 new)
{





 s64 r, o = *old;
 r = raw_atomic64_cmpxchg_relaxed(v, o, new);
 if (__builtin_expect(!!(r != o), 0))
  *old = r;
 return __builtin_expect(!!(r == o), 1);

}
# 4380 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_sub_and_test(s64 i, atomic64_t *v)
{



 return raw_atomic64_sub_return(i, v) == 0;

}
# 4400 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_dec_and_test(atomic64_t *v)
{



 return raw_atomic64_dec_return(v) == 0;

}
# 4420 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_inc_and_test(atomic64_t *v)
{



 return raw_atomic64_inc_return(v) == 0;

}
# 4441 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_add_negative(s64 i, atomic64_t *v)
{
# 4453 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_add_return(i, v) < 0;

}
# 4468 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_add_negative_acquire(s64 i, atomic64_t *v)
{
# 4480 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_add_return_acquire(i, v) < 0;

}
# 4495 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_add_negative_release(s64 i, atomic64_t *v)
{
# 4506 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
 return raw_atomic64_add_return_release(i, v) < 0;

}
# 4521 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_add_negative_relaxed(s64 i, atomic64_t *v)
{





 return raw_atomic64_add_return_relaxed(i, v) < 0;

}
# 4546 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
{



 s64 c = raw_atomic64_read(v);

 do {
  if (__builtin_expect(!!(c == u), 0))
   break;
 } while (!raw_atomic64_try_cmpxchg(v, &c, c + a));

 return c;

}
# 4576 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_add_unless(atomic64_t *v, s64 a, s64 u)
{



 return raw_atomic64_fetch_add_unless(v, a, u) != u;

}
# 4597 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_inc_not_zero(atomic64_t *v)
{



 return raw_atomic64_add_unless(v, 1, 0);

}
# 4618 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_inc_unless_negative(atomic64_t *v)
{



 s64 c = raw_atomic64_read(v);

 do {
  if (__builtin_expect(!!(c < 0), 0))
   return false;
 } while (!raw_atomic64_try_cmpxchg(v, &c, c + 1));

 return true;

}
# 4646 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic64_dec_unless_positive(atomic64_t *v)
{



 s64 c = raw_atomic64_read(v);

 do {
  if (__builtin_expect(!!(c > 0), 0))
   return false;
 } while (!raw_atomic64_try_cmpxchg(v, &c, c - 1));

 return true;

}
# 4674 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
raw_atomic64_dec_if_positive(atomic64_t *v)
{

 return arch_atomic64_dec_if_positive(v);
# 4690 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-arch-fallback.h"
}
# 81 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h" 1
# 10 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 11 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h" 2


typedef atomic64_t atomic_long_t;
# 34 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_read(const atomic_long_t *v)
{

 return raw_atomic64_read(v);



}
# 54 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_read_acquire(const atomic_long_t *v)
{

 return raw_atomic64_read_acquire(v);



}
# 75 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_long_set(atomic_long_t *v, long i)
{

 raw_atomic64_set(v, i);



}
# 96 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_long_set_release(atomic_long_t *v, long i)
{

 raw_atomic64_set_release(v, i);



}
# 117 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_long_add(long i, atomic_long_t *v)
{

 raw_atomic64_add(i, v);



}
# 138 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_add_return(long i, atomic_long_t *v)
{

 return raw_atomic64_add_return(i, v);



}
# 159 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_add_return_acquire(long i, atomic_long_t *v)
{

 return raw_atomic64_add_return_acquire(i, v);



}
# 180 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_add_return_release(long i, atomic_long_t *v)
{

 return raw_atomic64_add_return_release(i, v);



}
# 201 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_add_return_relaxed(long i, atomic_long_t *v)
{

 return raw_atomic64_add_return_relaxed(i, v);



}
# 222 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_add(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_add(i, v);



}
# 243 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_add_acquire(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_add_acquire(i, v);



}
# 264 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_add_release(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_add_release(i, v);



}
# 285 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_add_relaxed(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_add_relaxed(i, v);



}
# 306 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_long_sub(long i, atomic_long_t *v)
{

 raw_atomic64_sub(i, v);



}
# 327 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_sub_return(long i, atomic_long_t *v)
{

 return raw_atomic64_sub_return(i, v);



}
# 348 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_sub_return_acquire(long i, atomic_long_t *v)
{

 return raw_atomic64_sub_return_acquire(i, v);



}
# 369 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_sub_return_release(long i, atomic_long_t *v)
{

 return raw_atomic64_sub_return_release(i, v);



}
# 390 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_sub_return_relaxed(long i, atomic_long_t *v)
{

 return raw_atomic64_sub_return_relaxed(i, v);



}
# 411 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_sub(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_sub(i, v);



}
# 432 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_sub_acquire(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_sub_acquire(i, v);



}
# 453 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_sub_release(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_sub_release(i, v);



}
# 474 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_sub_relaxed(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_sub_relaxed(i, v);



}
# 494 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_long_inc(atomic_long_t *v)
{

 raw_atomic64_inc(v);



}
# 514 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_inc_return(atomic_long_t *v)
{

 return raw_atomic64_inc_return(v);



}
# 534 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_inc_return_acquire(atomic_long_t *v)
{

 return raw_atomic64_inc_return_acquire(v);



}
# 554 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_inc_return_release(atomic_long_t *v)
{

 return raw_atomic64_inc_return_release(v);



}
# 574 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_inc_return_relaxed(atomic_long_t *v)
{

 return raw_atomic64_inc_return_relaxed(v);



}
# 594 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_inc(atomic_long_t *v)
{

 return raw_atomic64_fetch_inc(v);



}
# 614 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_inc_acquire(atomic_long_t *v)
{

 return raw_atomic64_fetch_inc_acquire(v);



}
# 634 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_inc_release(atomic_long_t *v)
{

 return raw_atomic64_fetch_inc_release(v);



}
# 654 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_inc_relaxed(atomic_long_t *v)
{

 return raw_atomic64_fetch_inc_relaxed(v);



}
# 674 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_long_dec(atomic_long_t *v)
{

 raw_atomic64_dec(v);



}
# 694 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_dec_return(atomic_long_t *v)
{

 return raw_atomic64_dec_return(v);



}
# 714 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_dec_return_acquire(atomic_long_t *v)
{

 return raw_atomic64_dec_return_acquire(v);



}
# 734 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_dec_return_release(atomic_long_t *v)
{

 return raw_atomic64_dec_return_release(v);



}
# 754 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_dec_return_relaxed(atomic_long_t *v)
{

 return raw_atomic64_dec_return_relaxed(v);



}
# 774 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_dec(atomic_long_t *v)
{

 return raw_atomic64_fetch_dec(v);



}
# 794 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_dec_acquire(atomic_long_t *v)
{

 return raw_atomic64_fetch_dec_acquire(v);



}
# 814 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_dec_release(atomic_long_t *v)
{

 return raw_atomic64_fetch_dec_release(v);



}
# 834 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_dec_relaxed(atomic_long_t *v)
{

 return raw_atomic64_fetch_dec_relaxed(v);



}
# 855 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_long_and(long i, atomic_long_t *v)
{

 raw_atomic64_and(i, v);



}
# 876 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_and(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_and(i, v);



}
# 897 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_and_acquire(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_and_acquire(i, v);



}
# 918 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_and_release(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_and_release(i, v);



}
# 939 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_and_relaxed(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_and_relaxed(i, v);



}
# 960 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_long_andnot(long i, atomic_long_t *v)
{

 raw_atomic64_andnot(i, v);



}
# 981 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_andnot(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_andnot(i, v);



}
# 1002 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_andnot_acquire(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_andnot_acquire(i, v);



}
# 1023 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_andnot_release(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_andnot_release(i, v);



}
# 1044 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_andnot_relaxed(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_andnot_relaxed(i, v);



}
# 1065 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_long_or(long i, atomic_long_t *v)
{

 raw_atomic64_or(i, v);



}
# 1086 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_or(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_or(i, v);



}
# 1107 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_or_acquire(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_or_acquire(i, v);



}
# 1128 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_or_release(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_or_release(i, v);



}
# 1149 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_or_relaxed(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_or_relaxed(i, v);



}
# 1170 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
raw_atomic_long_xor(long i, atomic_long_t *v)
{

 raw_atomic64_xor(i, v);



}
# 1191 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_xor(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_xor(i, v);



}
# 1212 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_xor_acquire(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_xor_acquire(i, v);



}
# 1233 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_xor_release(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_xor_release(i, v);



}
# 1254 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_xor_relaxed(long i, atomic_long_t *v)
{

 return raw_atomic64_fetch_xor_relaxed(i, v);



}
# 1275 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_xchg(atomic_long_t *v, long new)
{

 return raw_atomic64_xchg(v, new);



}
# 1296 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_xchg_acquire(atomic_long_t *v, long new)
{

 return raw_atomic64_xchg_acquire(v, new);



}
# 1317 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_xchg_release(atomic_long_t *v, long new)
{

 return raw_atomic64_xchg_release(v, new);



}
# 1338 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_xchg_relaxed(atomic_long_t *v, long new)
{

 return raw_atomic64_xchg_relaxed(v, new);



}
# 1361 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_cmpxchg(atomic_long_t *v, long old, long new)
{

 return raw_atomic64_cmpxchg(v, old, new);



}
# 1384 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_cmpxchg_acquire(atomic_long_t *v, long old, long new)
{

 return raw_atomic64_cmpxchg_acquire(v, old, new);



}
# 1407 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_cmpxchg_release(atomic_long_t *v, long old, long new)
{

 return raw_atomic64_cmpxchg_release(v, old, new);



}
# 1430 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_cmpxchg_relaxed(atomic_long_t *v, long old, long new)
{

 return raw_atomic64_cmpxchg_relaxed(v, old, new);



}
# 1454 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_try_cmpxchg(atomic_long_t *v, long *old, long new)
{

 return raw_atomic64_try_cmpxchg(v, (s64 *)old, new);



}
# 1478 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_try_cmpxchg_acquire(atomic_long_t *v, long *old, long new)
{

 return raw_atomic64_try_cmpxchg_acquire(v, (s64 *)old, new);



}
# 1502 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_try_cmpxchg_release(atomic_long_t *v, long *old, long new)
{

 return raw_atomic64_try_cmpxchg_release(v, (s64 *)old, new);



}
# 1526 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_try_cmpxchg_relaxed(atomic_long_t *v, long *old, long new)
{

 return raw_atomic64_try_cmpxchg_relaxed(v, (s64 *)old, new);



}
# 1547 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_sub_and_test(long i, atomic_long_t *v)
{

 return raw_atomic64_sub_and_test(i, v);



}
# 1567 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_dec_and_test(atomic_long_t *v)
{

 return raw_atomic64_dec_and_test(v);



}
# 1587 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_inc_and_test(atomic_long_t *v)
{

 return raw_atomic64_inc_and_test(v);



}
# 1608 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_add_negative(long i, atomic_long_t *v)
{

 return raw_atomic64_add_negative(i, v);



}
# 1629 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_add_negative_acquire(long i, atomic_long_t *v)
{

 return raw_atomic64_add_negative_acquire(i, v);



}
# 1650 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_add_negative_release(long i, atomic_long_t *v)
{

 return raw_atomic64_add_negative_release(i, v);



}
# 1671 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_add_negative_relaxed(long i, atomic_long_t *v)
{

 return raw_atomic64_add_negative_relaxed(i, v);



}
# 1694 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_fetch_add_unless(atomic_long_t *v, long a, long u)
{

 return raw_atomic64_fetch_add_unless(v, a, u);



}
# 1717 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_add_unless(atomic_long_t *v, long a, long u)
{

 return raw_atomic64_add_unless(v, a, u);



}
# 1738 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_inc_not_zero(atomic_long_t *v)
{

 return raw_atomic64_inc_not_zero(v);



}
# 1759 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_inc_unless_negative(atomic_long_t *v)
{

 return raw_atomic64_inc_unless_negative(v);



}
# 1780 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
raw_atomic_long_dec_unless_positive(atomic_long_t *v)
{

 return raw_atomic64_dec_unless_positive(v);



}
# 1801 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-long.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
raw_atomic_long_dec_if_positive(atomic_long_t *v)
{

 return raw_atomic64_dec_if_positive(v);



}
# 82 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h" 1
# 17 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h" 1
# 13 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kmsan-checks.h" 1
# 77 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kmsan-checks.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kmsan_poison_memory(const void *address, size_t size,
           gfp_t flags)
{
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kmsan_unpoison_memory(const void *address, size_t size)
{
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kmsan_check_memory(const void *address, size_t size)
{
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kmsan_copy_to_user(void *to, const void *from,
          size_t to_copy, size_t left)
{
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void kmsan_memmove(void *to, const void *from, size_t to_copy)
{
}
# 14 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h" 2
# 24 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void instrument_read(const volatile void *v, size_t size)
{
 kasan_check_read(v, size);
 kcsan_check_access(v, size, 0);
}
# 38 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void instrument_write(const volatile void *v, size_t size)
{
 kasan_check_write(v, size);
 kcsan_check_access(v, size, (1 << 0));
}
# 52 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void instrument_read_write(const volatile void *v, size_t size)
{
 kasan_check_write(v, size);
 kcsan_check_access(v, size, (1 << 1) | (1 << 0));
}
# 66 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void instrument_atomic_read(const volatile void *v, size_t size)
{
 kasan_check_read(v, size);
 kcsan_check_access(v, size, (1 << 2));
}
# 80 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void instrument_atomic_write(const volatile void *v, size_t size)
{
 kasan_check_write(v, size);
 kcsan_check_access(v, size, (1 << 2) | (1 << 0));
}
# 94 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void instrument_atomic_read_write(const volatile void *v, size_t size)
{
 kasan_check_write(v, size);
 kcsan_check_access(v, size, (1 << 2) | (1 << 0) | (1 << 1));
}
# 109 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
instrument_copy_to_user(void *to, const void *from, unsigned long n)
{
 kasan_check_read(from, n);
 kcsan_check_access(from, n, 0);
 kmsan_copy_to_user(to, from, n, 0);
}
# 126 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
instrument_copy_from_user_before(const void *to, const void *from, unsigned long n)
{
 kasan_check_write(to, n);
 kcsan_check_access(to, n, (1 << 0));
}
# 143 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
instrument_copy_from_user_after(const void *to, const void *from,
    unsigned long n, unsigned long left)
{
 kmsan_unpoison_memory(to, n - left);
}
# 159 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void instrument_memcpy_before(void *to, const void *from,
           unsigned long n)
{
 kasan_check_write(to, n);
 kasan_check_read(from, n);
 kcsan_check_access(to, n, (1 << 0));
 kcsan_check_access(from, n, 0);
}
# 178 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void instrument_memcpy_after(void *to, const void *from,
          unsigned long n,
          unsigned long left)
{
 kmsan_memmove(to, from, n - left);
}
# 18 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h" 2
# 29 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_read(const atomic_t *v)
{
 instrument_atomic_read(v, sizeof(*v));
 return raw_atomic_read(v);
}
# 46 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_read_acquire(const atomic_t *v)
{
 instrument_atomic_read(v, sizeof(*v));
 return raw_atomic_read_acquire(v);
}
# 64 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_set(atomic_t *v, int i)
{
 instrument_atomic_write(v, sizeof(*v));
 raw_atomic_set(v, i);
}
# 82 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_set_release(atomic_t *v, int i)
{
 do { } while (0);
 instrument_atomic_write(v, sizeof(*v));
 raw_atomic_set_release(v, i);
}
# 101 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_add(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_add(i, v);
}
# 119 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_add_return(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_add_return(i, v);
}
# 138 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_add_return_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_add_return_acquire(i, v);
}
# 156 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_add_return_release(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_add_return_release(i, v);
}
# 175 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_add_return_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_add_return_relaxed(i, v);
}
# 193 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_add(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_add(i, v);
}
# 212 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_add_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_add_acquire(i, v);
}
# 230 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_add_release(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_add_release(i, v);
}
# 249 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_add_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_add_relaxed(i, v);
}
# 267 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_sub(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_sub(i, v);
}
# 285 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_sub_return(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_sub_return(i, v);
}
# 304 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_sub_return_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_sub_return_acquire(i, v);
}
# 322 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_sub_return_release(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_sub_return_release(i, v);
}
# 341 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_sub_return_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_sub_return_relaxed(i, v);
}
# 359 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_sub(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_sub(i, v);
}
# 378 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_sub_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_sub_acquire(i, v);
}
# 396 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_sub_release(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_sub_release(i, v);
}
# 415 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_sub_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_sub_relaxed(i, v);
}
# 432 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_inc(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_inc(v);
}
# 449 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_inc_return(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_inc_return(v);
}
# 467 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_inc_return_acquire(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_inc_return_acquire(v);
}
# 484 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_inc_return_release(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_inc_return_release(v);
}
# 502 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_inc_return_relaxed(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_inc_return_relaxed(v);
}
# 519 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_inc(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_inc(v);
}
# 537 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_inc_acquire(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_inc_acquire(v);
}
# 554 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_inc_release(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_inc_release(v);
}
# 572 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_inc_relaxed(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_inc_relaxed(v);
}
# 589 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_dec(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_dec(v);
}
# 606 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_dec_return(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_dec_return(v);
}
# 624 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_dec_return_acquire(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_dec_return_acquire(v);
}
# 641 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_dec_return_release(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_dec_return_release(v);
}
# 659 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_dec_return_relaxed(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_dec_return_relaxed(v);
}
# 676 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_dec(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_dec(v);
}
# 694 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_dec_acquire(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_dec_acquire(v);
}
# 711 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_dec_release(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_dec_release(v);
}
# 729 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_dec_relaxed(atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_dec_relaxed(v);
}
# 747 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_and(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_and(i, v);
}
# 765 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_and(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_and(i, v);
}
# 784 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_and_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_and_acquire(i, v);
}
# 802 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_and_release(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_and_release(i, v);
}
# 821 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_and_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_and_relaxed(i, v);
}
# 839 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_andnot(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_andnot(i, v);
}
# 857 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_andnot(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_andnot(i, v);
}
# 876 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_andnot_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_andnot_acquire(i, v);
}
# 894 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_andnot_release(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_andnot_release(i, v);
}
# 913 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_andnot_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_andnot_relaxed(i, v);
}
# 931 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_or(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_or(i, v);
}
# 949 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_or(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_or(i, v);
}
# 968 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_or_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_or_acquire(i, v);
}
# 986 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_or_release(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_or_release(i, v);
}
# 1005 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_or_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_or_relaxed(i, v);
}
# 1023 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_xor(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_xor(i, v);
}
# 1041 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_xor(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_xor(i, v);
}
# 1060 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_xor_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_xor_acquire(i, v);
}
# 1078 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_xor_release(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_xor_release(i, v);
}
# 1097 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_xor_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_xor_relaxed(i, v);
}
# 1115 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_xchg(atomic_t *v, int new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_xchg(v, new);
}
# 1134 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_xchg_acquire(atomic_t *v, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_xchg_acquire(v, new);
}
# 1152 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_xchg_release(atomic_t *v, int new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_xchg_release(v, new);
}
# 1171 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_xchg_relaxed(atomic_t *v, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_xchg_relaxed(v, new);
}
# 1191 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_cmpxchg(atomic_t *v, int old, int new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_cmpxchg(v, old, new);
}
# 1212 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_cmpxchg_acquire(atomic_t *v, int old, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_cmpxchg_acquire(v, old, new);
}
# 1232 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_cmpxchg_release(atomic_t *v, int old, int new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_cmpxchg_release(v, old, new);
}
# 1253 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_cmpxchg_relaxed(atomic_t *v, int old, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_cmpxchg_relaxed(v, old, new);
}
# 1274 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_try_cmpxchg(atomic_t *v, int *old, int new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return raw_atomic_try_cmpxchg(v, old, new);
}
# 1297 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_try_cmpxchg_acquire(atomic_t *v, int *old, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return raw_atomic_try_cmpxchg_acquire(v, old, new);
}
# 1319 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_try_cmpxchg_release(atomic_t *v, int *old, int new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return raw_atomic_try_cmpxchg_release(v, old, new);
}
# 1342 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_try_cmpxchg_relaxed(atomic_t *v, int *old, int new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return raw_atomic_try_cmpxchg_relaxed(v, old, new);
}
# 1361 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_sub_and_test(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_sub_and_test(i, v);
}
# 1379 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_dec_and_test(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_dec_and_test(v);
}
# 1397 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_inc_and_test(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_inc_and_test(v);
}
# 1416 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_add_negative(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_add_negative(i, v);
}
# 1435 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_add_negative_acquire(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_add_negative_acquire(i, v);
}
# 1453 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_add_negative_release(int i, atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_add_negative_release(i, v);
}
# 1472 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_add_negative_relaxed(int i, atomic_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_add_negative_relaxed(i, v);
}
# 1492 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_fetch_add_unless(atomic_t *v, int a, int u)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_fetch_add_unless(v, a, u);
}
# 1513 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_add_unless(atomic_t *v, int a, int u)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_add_unless(v, a, u);
}
# 1532 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_inc_not_zero(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_inc_not_zero(v);
}
# 1551 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_inc_unless_negative(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_inc_unless_negative(v);
}
# 1570 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_dec_unless_positive(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_dec_unless_positive(v);
}
# 1589 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
atomic_dec_if_positive(atomic_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_dec_if_positive(v);
}
# 1607 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_read(const atomic64_t *v)
{
 instrument_atomic_read(v, sizeof(*v));
 return raw_atomic64_read(v);
}
# 1624 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_read_acquire(const atomic64_t *v)
{
 instrument_atomic_read(v, sizeof(*v));
 return raw_atomic64_read_acquire(v);
}
# 1642 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic64_set(atomic64_t *v, s64 i)
{
 instrument_atomic_write(v, sizeof(*v));
 raw_atomic64_set(v, i);
}
# 1660 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic64_set_release(atomic64_t *v, s64 i)
{
 do { } while (0);
 instrument_atomic_write(v, sizeof(*v));
 raw_atomic64_set_release(v, i);
}
# 1679 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic64_add(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic64_add(i, v);
}
# 1697 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_add_return(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_add_return(i, v);
}
# 1716 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_add_return_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_add_return_acquire(i, v);
}
# 1734 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_add_return_release(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_add_return_release(i, v);
}
# 1753 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_add_return_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_add_return_relaxed(i, v);
}
# 1771 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_add(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_add(i, v);
}
# 1790 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_add_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_add_acquire(i, v);
}
# 1808 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_add_release(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_add_release(i, v);
}
# 1827 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_add_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_add_relaxed(i, v);
}
# 1845 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic64_sub(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic64_sub(i, v);
}
# 1863 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_sub_return(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_sub_return(i, v);
}
# 1882 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_sub_return_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_sub_return_acquire(i, v);
}
# 1900 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_sub_return_release(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_sub_return_release(i, v);
}
# 1919 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_sub_return_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_sub_return_relaxed(i, v);
}
# 1937 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_sub(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_sub(i, v);
}
# 1956 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_sub_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_sub_acquire(i, v);
}
# 1974 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_sub_release(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_sub_release(i, v);
}
# 1993 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_sub_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_sub_relaxed(i, v);
}
# 2010 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic64_inc(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic64_inc(v);
}
# 2027 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_inc_return(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_inc_return(v);
}
# 2045 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_inc_return_acquire(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_inc_return_acquire(v);
}
# 2062 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_inc_return_release(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_inc_return_release(v);
}
# 2080 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_inc_return_relaxed(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_inc_return_relaxed(v);
}
# 2097 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_inc(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_inc(v);
}
# 2115 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_inc_acquire(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_inc_acquire(v);
}
# 2132 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_inc_release(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_inc_release(v);
}
# 2150 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_inc_relaxed(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_inc_relaxed(v);
}
# 2167 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic64_dec(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic64_dec(v);
}
# 2184 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_dec_return(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_dec_return(v);
}
# 2202 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_dec_return_acquire(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_dec_return_acquire(v);
}
# 2219 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_dec_return_release(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_dec_return_release(v);
}
# 2237 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_dec_return_relaxed(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_dec_return_relaxed(v);
}
# 2254 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_dec(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_dec(v);
}
# 2272 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_dec_acquire(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_dec_acquire(v);
}
# 2289 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_dec_release(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_dec_release(v);
}
# 2307 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_dec_relaxed(atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_dec_relaxed(v);
}
# 2325 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic64_and(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic64_and(i, v);
}
# 2343 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_and(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_and(i, v);
}
# 2362 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_and_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_and_acquire(i, v);
}
# 2380 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_and_release(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_and_release(i, v);
}
# 2399 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_and_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_and_relaxed(i, v);
}
# 2417 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic64_andnot(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic64_andnot(i, v);
}
# 2435 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_andnot(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_andnot(i, v);
}
# 2454 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_andnot_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_andnot_acquire(i, v);
}
# 2472 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_andnot_release(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_andnot_release(i, v);
}
# 2491 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_andnot_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_andnot_relaxed(i, v);
}
# 2509 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic64_or(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic64_or(i, v);
}
# 2527 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_or(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_or(i, v);
}
# 2546 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_or_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_or_acquire(i, v);
}
# 2564 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_or_release(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_or_release(i, v);
}
# 2583 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_or_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_or_relaxed(i, v);
}
# 2601 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic64_xor(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic64_xor(i, v);
}
# 2619 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_xor(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_xor(i, v);
}
# 2638 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_xor_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_xor_acquire(i, v);
}
# 2656 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_xor_release(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_xor_release(i, v);
}
# 2675 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_xor_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_xor_relaxed(i, v);
}
# 2693 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_xchg(atomic64_t *v, s64 new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_xchg(v, new);
}
# 2712 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_xchg_acquire(atomic64_t *v, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_xchg_acquire(v, new);
}
# 2730 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_xchg_release(atomic64_t *v, s64 new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_xchg_release(v, new);
}
# 2749 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_xchg_relaxed(atomic64_t *v, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_xchg_relaxed(v, new);
}
# 2769 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_cmpxchg(atomic64_t *v, s64 old, s64 new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_cmpxchg(v, old, new);
}
# 2790 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_cmpxchg_acquire(atomic64_t *v, s64 old, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_cmpxchg_acquire(v, old, new);
}
# 2810 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_cmpxchg_release(atomic64_t *v, s64 old, s64 new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_cmpxchg_release(v, old, new);
}
# 2831 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_cmpxchg_relaxed(atomic64_t *v, s64 old, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_cmpxchg_relaxed(v, old, new);
}
# 2852 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_try_cmpxchg(atomic64_t *v, s64 *old, s64 new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return raw_atomic64_try_cmpxchg(v, old, new);
}
# 2875 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_try_cmpxchg_acquire(atomic64_t *v, s64 *old, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return raw_atomic64_try_cmpxchg_acquire(v, old, new);
}
# 2897 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_try_cmpxchg_release(atomic64_t *v, s64 *old, s64 new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return raw_atomic64_try_cmpxchg_release(v, old, new);
}
# 2920 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_try_cmpxchg_relaxed(atomic64_t *v, s64 *old, s64 new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return raw_atomic64_try_cmpxchg_relaxed(v, old, new);
}
# 2939 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_sub_and_test(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_sub_and_test(i, v);
}
# 2957 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_dec_and_test(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_dec_and_test(v);
}
# 2975 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_inc_and_test(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_inc_and_test(v);
}
# 2994 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_add_negative(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_add_negative(i, v);
}
# 3013 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_add_negative_acquire(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_add_negative_acquire(i, v);
}
# 3031 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_add_negative_release(s64 i, atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_add_negative_release(i, v);
}
# 3050 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_add_negative_relaxed(s64 i, atomic64_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_add_negative_relaxed(i, v);
}
# 3070 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_fetch_add_unless(v, a, u);
}
# 3091 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_add_unless(atomic64_t *v, s64 a, s64 u)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_add_unless(v, a, u);
}
# 3110 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_inc_not_zero(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_inc_not_zero(v);
}
# 3129 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_inc_unless_negative(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_inc_unless_negative(v);
}
# 3148 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic64_dec_unless_positive(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_dec_unless_positive(v);
}
# 3167 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) s64
atomic64_dec_if_positive(atomic64_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic64_dec_if_positive(v);
}
# 3185 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_read(const atomic_long_t *v)
{
 instrument_atomic_read(v, sizeof(*v));
 return raw_atomic_long_read(v);
}
# 3202 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_read_acquire(const atomic_long_t *v)
{
 instrument_atomic_read(v, sizeof(*v));
 return raw_atomic_long_read_acquire(v);
}
# 3220 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_long_set(atomic_long_t *v, long i)
{
 instrument_atomic_write(v, sizeof(*v));
 raw_atomic_long_set(v, i);
}
# 3238 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_long_set_release(atomic_long_t *v, long i)
{
 do { } while (0);
 instrument_atomic_write(v, sizeof(*v));
 raw_atomic_long_set_release(v, i);
}
# 3257 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_long_add(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_long_add(i, v);
}
# 3275 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_add_return(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_add_return(i, v);
}
# 3294 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_add_return_acquire(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_add_return_acquire(i, v);
}
# 3312 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_add_return_release(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_add_return_release(i, v);
}
# 3331 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_add_return_relaxed(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_add_return_relaxed(i, v);
}
# 3349 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_add(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_add(i, v);
}
# 3368 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_add_acquire(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_add_acquire(i, v);
}
# 3386 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_add_release(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_add_release(i, v);
}
# 3405 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_add_relaxed(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_add_relaxed(i, v);
}
# 3423 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_long_sub(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_long_sub(i, v);
}
# 3441 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_sub_return(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_sub_return(i, v);
}
# 3460 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_sub_return_acquire(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_sub_return_acquire(i, v);
}
# 3478 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_sub_return_release(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_sub_return_release(i, v);
}
# 3497 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_sub_return_relaxed(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_sub_return_relaxed(i, v);
}
# 3515 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_sub(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_sub(i, v);
}
# 3534 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_sub_acquire(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_sub_acquire(i, v);
}
# 3552 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_sub_release(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_sub_release(i, v);
}
# 3571 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_sub_relaxed(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_sub_relaxed(i, v);
}
# 3588 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_long_inc(atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_long_inc(v);
}
# 3605 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_inc_return(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_inc_return(v);
}
# 3623 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_inc_return_acquire(atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_inc_return_acquire(v);
}
# 3640 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_inc_return_release(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_inc_return_release(v);
}
# 3658 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_inc_return_relaxed(atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_inc_return_relaxed(v);
}
# 3675 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_inc(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_inc(v);
}
# 3693 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_inc_acquire(atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_inc_acquire(v);
}
# 3710 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_inc_release(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_inc_release(v);
}
# 3728 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_inc_relaxed(atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_inc_relaxed(v);
}
# 3745 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_long_dec(atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_long_dec(v);
}
# 3762 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_dec_return(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_dec_return(v);
}
# 3780 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_dec_return_acquire(atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_dec_return_acquire(v);
}
# 3797 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_dec_return_release(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_dec_return_release(v);
}
# 3815 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_dec_return_relaxed(atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_dec_return_relaxed(v);
}
# 3832 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_dec(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_dec(v);
}
# 3850 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_dec_acquire(atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_dec_acquire(v);
}
# 3867 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_dec_release(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_dec_release(v);
}
# 3885 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_dec_relaxed(atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_dec_relaxed(v);
}
# 3903 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_long_and(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_long_and(i, v);
}
# 3921 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_and(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_and(i, v);
}
# 3940 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_and_acquire(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_and_acquire(i, v);
}
# 3958 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_and_release(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_and_release(i, v);
}
# 3977 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_and_relaxed(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_and_relaxed(i, v);
}
# 3995 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_long_andnot(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_long_andnot(i, v);
}
# 4013 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_andnot(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_andnot(i, v);
}
# 4032 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_andnot_acquire(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_andnot_acquire(i, v);
}
# 4050 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_andnot_release(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_andnot_release(i, v);
}
# 4069 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_andnot_relaxed(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_andnot_relaxed(i, v);
}
# 4087 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_long_or(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_long_or(i, v);
}
# 4105 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_or(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_or(i, v);
}
# 4124 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_or_acquire(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_or_acquire(i, v);
}
# 4142 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_or_release(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_or_release(i, v);
}
# 4161 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_or_relaxed(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_or_relaxed(i, v);
}
# 4179 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
atomic_long_xor(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 raw_atomic_long_xor(i, v);
}
# 4197 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_xor(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_xor(i, v);
}
# 4216 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_xor_acquire(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_xor_acquire(i, v);
}
# 4234 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_xor_release(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_xor_release(i, v);
}
# 4253 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_xor_relaxed(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_xor_relaxed(i, v);
}
# 4271 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_xchg(atomic_long_t *v, long new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_xchg(v, new);
}
# 4290 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_xchg_acquire(atomic_long_t *v, long new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_xchg_acquire(v, new);
}
# 4308 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_xchg_release(atomic_long_t *v, long new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_xchg_release(v, new);
}
# 4327 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_xchg_relaxed(atomic_long_t *v, long new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_xchg_relaxed(v, new);
}
# 4347 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_cmpxchg(atomic_long_t *v, long old, long new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_cmpxchg(v, old, new);
}
# 4368 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_cmpxchg_acquire(atomic_long_t *v, long old, long new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_cmpxchg_acquire(v, old, new);
}
# 4388 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_cmpxchg_release(atomic_long_t *v, long old, long new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_cmpxchg_release(v, old, new);
}
# 4409 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_cmpxchg_relaxed(atomic_long_t *v, long old, long new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_cmpxchg_relaxed(v, old, new);
}
# 4430 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_try_cmpxchg(atomic_long_t *v, long *old, long new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return raw_atomic_long_try_cmpxchg(v, old, new);
}
# 4453 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_try_cmpxchg_acquire(atomic_long_t *v, long *old, long new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return raw_atomic_long_try_cmpxchg_acquire(v, old, new);
}
# 4475 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_try_cmpxchg_release(atomic_long_t *v, long *old, long new)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return raw_atomic_long_try_cmpxchg_release(v, old, new);
}
# 4498 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_try_cmpxchg_relaxed(atomic_long_t *v, long *old, long new)
{
 instrument_atomic_read_write(v, sizeof(*v));
 instrument_atomic_read_write(old, sizeof(*old));
 return raw_atomic_long_try_cmpxchg_relaxed(v, old, new);
}
# 4517 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_sub_and_test(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_sub_and_test(i, v);
}
# 4535 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_dec_and_test(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_dec_and_test(v);
}
# 4553 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_inc_and_test(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_inc_and_test(v);
}
# 4572 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_add_negative(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_add_negative(i, v);
}
# 4591 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_add_negative_acquire(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_add_negative_acquire(i, v);
}
# 4609 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_add_negative_release(long i, atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_add_negative_release(i, v);
}
# 4628 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_add_negative_relaxed(long i, atomic_long_t *v)
{
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_add_negative_relaxed(i, v);
}
# 4648 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_fetch_add_unless(atomic_long_t *v, long a, long u)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_fetch_add_unless(v, a, u);
}
# 4669 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_add_unless(atomic_long_t *v, long a, long u)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_add_unless(v, a, u);
}
# 4688 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_inc_not_zero(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_inc_not_zero(v);
}
# 4707 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_inc_unless_negative(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_inc_unless_negative(v);
}
# 4726 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool
atomic_long_dec_unless_positive(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_dec_unless_positive(v);
}
# 4745 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic/atomic-instrumented.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) long
atomic_long_dec_if_positive(atomic_long_t *v)
{
 do { } while (0);
 instrument_atomic_read_write(v, sizeof(*v));
 return raw_atomic_long_dec_if_positive(v);
}
# 83 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/atomic.h" 2
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/atomic.h" 2
# 14 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
arch_set_bit(unsigned int nr, volatile unsigned long *p)
{
 p += ((nr) / 64);
 raw_atomic_long_or(((((1UL))) << ((nr) % 64)), (atomic_long_t *)p);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
arch_clear_bit(unsigned int nr, volatile unsigned long *p)
{
 p += ((nr) / 64);
 raw_atomic_long_andnot(((((1UL))) << ((nr) % 64)), (atomic_long_t *)p);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
arch_change_bit(unsigned int nr, volatile unsigned long *p)
{
 p += ((nr) / 64);
 raw_atomic_long_xor(((((1UL))) << ((nr) % 64)), (atomic_long_t *)p);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
arch_test_and_set_bit(unsigned int nr, volatile unsigned long *p)
{
 long old;
 unsigned long mask = ((((1UL))) << ((nr) % 64));

 p += ((nr) / 64);
 old = raw_atomic_long_fetch_or(mask, (atomic_long_t *)p);
 return !!(old & mask);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
arch_test_and_clear_bit(unsigned int nr, volatile unsigned long *p)
{
 long old;
 unsigned long mask = ((((1UL))) << ((nr) % 64));

 p += ((nr) / 64);
 old = raw_atomic_long_fetch_andnot(mask, (atomic_long_t *)p);
 return !!(old & mask);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
arch_test_and_change_bit(unsigned int nr, volatile unsigned long *p)
{
 long old;
 unsigned long mask = ((((1UL))) << ((nr) % 64));

 p += ((nr) / 64);
 old = raw_atomic_long_fetch_xor(mask, (atomic_long_t *)p);
 return !!(old & mask);
}

# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/instrumented-atomic.h" 1
# 26 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/instrumented-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void set_bit(long nr, volatile unsigned long *addr)
{
 instrument_atomic_write(addr + ((nr) / 64), sizeof(long));
 arch_set_bit(nr, addr);
}
# 39 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/instrumented-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void clear_bit(long nr, volatile unsigned long *addr)
{
 instrument_atomic_write(addr + ((nr) / 64), sizeof(long));
 arch_clear_bit(nr, addr);
}
# 55 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/instrumented-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void change_bit(long nr, volatile unsigned long *addr)
{
 instrument_atomic_write(addr + ((nr) / 64), sizeof(long));
 arch_change_bit(nr, addr);
}
# 68 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/instrumented-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool test_and_set_bit(long nr, volatile unsigned long *addr)
{
 do { } while (0);
 instrument_atomic_read_write(addr + ((nr) / 64), sizeof(long));
 return arch_test_and_set_bit(nr, addr);
}
# 82 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/instrumented-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool test_and_clear_bit(long nr, volatile unsigned long *addr)
{
 do { } while (0);
 instrument_atomic_read_write(addr + ((nr) / 64), sizeof(long));
 return arch_test_and_clear_bit(nr, addr);
}
# 96 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/instrumented-atomic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) bool test_and_change_bit(long nr, volatile unsigned long *addr)
{
 do { } while (0);
 instrument_atomic_read_write(addr + ((nr) / 64), sizeof(long));
 return arch_test_and_change_bit(nr, addr);
}
# 69 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/atomic.h" 2
# 26 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/lock.h" 1
# 18 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) int
arch_test_and_set_bit_lock(unsigned int nr, volatile unsigned long *p)
{
 long old;
 unsigned long mask = ((((1UL))) << ((nr) % 64));

 p += ((nr) / 64);
 if (({ do { __attribute__((__noreturn__)) extern void __compiletime_assert_16(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*p) == sizeof(char) || sizeof(*p) == sizeof(short) || sizeof(*p) == sizeof(int) || sizeof(*p) == sizeof(long)) || sizeof(*p) == sizeof(long long))) __compiletime_assert_16(); } while (0); (*(const volatile typeof( _Generic((*p), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*p))) *)&(*p)); }) & mask)
  return 1;

 old = raw_atomic_long_fetch_or_acquire(mask, (atomic_long_t *)p);
 return !!(old & mask);
}
# 40 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void
arch_clear_bit_unlock(unsigned int nr, volatile unsigned long *p)
{
 p += ((nr) / 64);
 raw_atomic_long_fetch_andnot_release(((((1UL))) << ((nr) % 64)), (atomic_long_t *)p);
}
# 58 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void
arch___clear_bit_unlock(unsigned int nr, volatile unsigned long *p)
{
 unsigned long old;

 p += ((nr) / 64);
 old = ({ do { __attribute__((__noreturn__)) extern void __compiletime_assert_17(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(*p) == sizeof(char) || sizeof(*p) == sizeof(short) || sizeof(*p) == sizeof(int) || sizeof(*p) == sizeof(long)) || sizeof(*p) == sizeof(long long))) __compiletime_assert_17(); } while (0); (*(const volatile typeof( _Generic((*p), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (*p))) *)&(*p)); });
 old &= ~((((1UL))) << ((nr) % 64));
 raw_atomic_long_set_release((atomic_long_t *)p, old);
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) bool arch_xor_unlock_is_negative_byte(unsigned long mask,
  volatile unsigned long *p)
{
 long old;

 old = raw_atomic_long_fetch_xor_release(mask, (atomic_long_t *)p);
 return !!(old & ((((1UL))) << (7)));
}


# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/instrumented-lock.h" 1
# 23 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/instrumented-lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void clear_bit_unlock(long nr, volatile unsigned long *addr)
{
 do { } while (0);
 instrument_atomic_write(addr + ((nr) / 64), sizeof(long));
 arch_clear_bit_unlock(nr, addr);
}
# 39 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/instrumented-lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __clear_bit_unlock(long nr, volatile unsigned long *addr)
{
 do { } while (0);
 instrument_write(addr + ((nr) / 64), sizeof(long));
 arch___clear_bit_unlock(nr, addr);
}
# 55 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/instrumented-lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) bool test_and_set_bit_lock(long nr, volatile unsigned long *addr)
{
 instrument_atomic_read_write(addr + ((nr) / 64), sizeof(long));
 return arch_test_and_set_bit_lock(nr, addr);
}
# 75 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/instrumented-lock.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) bool xor_unlock_is_negative_byte(unsigned long mask,
  volatile unsigned long *addr)
{
 do { } while (0);
 instrument_atomic_write(addr, sizeof(long));
 return arch_xor_unlock_is_negative_byte(mask, addr);
}
# 81 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/lock.h" 2
# 27 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/non-atomic.h" 1
# 18 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/non-atomic.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/non-instrumented-non-atomic.h" 1
# 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/non-atomic.h" 2
# 28 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/le.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/le.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/uapi/asm/byteorder.h" 1
# 23 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/uapi/asm/byteorder.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/byteorder/little_endian.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/byteorder/little_endian.h" 1
# 14 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/byteorder/little_endian.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/swab.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/swab.h" 1







# 1 "./arch/arm64/include/generated/uapi/asm/swab.h" 1
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/swab.h" 1
# 2 "./arch/arm64/include/generated/uapi/asm/swab.h" 2
# 9 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/swab.h" 2
# 48 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/swab.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__const__)) __u16 __fswab16(__u16 val)
{



 return ((__u16)( (((__u16)(val) & (__u16)0x00ffU) << 8) | (((__u16)(val) & (__u16)0xff00U) >> 8)));

}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__const__)) __u32 __fswab32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x000000ffUL) << 24) | (((__u32)(val) & (__u32)0x0000ff00UL) << 8) | (((__u32)(val) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(val) & (__u32)0xff000000UL) >> 24)));

}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__const__)) __u64 __fswab64(__u64 val)
{







 return ((__u64)( (((__u64)(val) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(val) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(val) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(val) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(val) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(val) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(val) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(val) & (__u64)0xff00000000000000ULL) >> 56)));

}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__const__)) __u32 __fswahw32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x0000ffffUL) << 16) | (((__u32)(val) & (__u32)0xffff0000UL) >> 16)));

}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__const__)) __u32 __fswahb32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(val) & (__u32)0xff00ff00UL) >> 8)));

}
# 136 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/swab.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) unsigned long __swab(const unsigned long y)
{

 return (__u64)(__builtin_constant_p(y) ? ((__u64)( (((__u64)(y) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(y) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(y) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(y) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(y) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(y) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(y) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(y) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(y));



}
# 171 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/swab.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __u16 __swab16p(const __u16 *p)
{



 return (__u16)(__builtin_constant_p(*p) ? ((__u16)( (((__u16)(*p) & (__u16)0x00ffU) << 8) | (((__u16)(*p) & (__u16)0xff00U) >> 8))) : __fswab16(*p));

}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __u32 __swab32p(const __u32 *p)
{



 return (__u32)(__builtin_constant_p(*p) ? ((__u32)( (((__u32)(*p) & (__u32)0x000000ffUL) << 24) | (((__u32)(*p) & (__u32)0x0000ff00UL) << 8) | (((__u32)(*p) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(*p) & (__u32)0xff000000UL) >> 24))) : __fswab32(*p));

}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __u64 __swab64p(const __u64 *p)
{



 return (__u64)(__builtin_constant_p(*p) ? ((__u64)( (((__u64)(*p) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(*p) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(*p) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(*p) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(*p) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(*p) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(*p) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(*p) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(*p));

}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __u32 __swahw32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x0000ffffUL) << 16) | (((__u32)(*p) & (__u32)0xffff0000UL) >> 16))) : __fswahw32(*p));

}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __u32 __swahb32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(*p) & (__u32)0xff00ff00UL) >> 8))) : __fswahb32(*p));

}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __swab16s(__u16 *p)
{



 *p = __swab16p(p);

}




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __swab32s(__u32 *p)
{



 *p = __swab32p(p);

}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) void __swab64s(__u64 *p)
{



 *p = __swab64p(p);

}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __swahw32s(__u32 *p)
{



 *p = __swahw32p(p);

}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __swahb32s(__u32 *p)
{



 *p = __swahb32p(p);

}
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/swab.h" 2
# 24 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/swab.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void swab16_array(u16 *buf, unsigned int words)
{
 while (words--) {
  __swab16s(buf);
  buf++;
 }
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void swab32_array(u32 *buf, unsigned int words)
{
 while (words--) {
  __swab32s(buf);
  buf++;
 }
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void swab64_array(u64 *buf, unsigned int words)
{
 while (words--) {
  __swab64s(buf);
  buf++;
 }
}
# 15 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/byteorder/little_endian.h" 2
# 45 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/byteorder/little_endian.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __le64 __cpu_to_le64p(const __u64 *p)
{
 return ( __le64)*p;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __u64 __le64_to_cpup(const __le64 *p)
{
 return ( __u64)*p;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __le32 __cpu_to_le32p(const __u32 *p)
{
 return ( __le32)*p;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __u32 __le32_to_cpup(const __le32 *p)
{
 return ( __u32)*p;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __le16 __cpu_to_le16p(const __u16 *p)
{
 return ( __le16)*p;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __u16 __le16_to_cpup(const __le16 *p)
{
 return ( __u16)*p;
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __be64 __cpu_to_be64p(const __u64 *p)
{
 return ( __be64)__swab64p(p);
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __u64 __be64_to_cpup(const __be64 *p)
{
 return __swab64p((__u64 *)p);
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __be32 __cpu_to_be32p(const __u32 *p)
{
 return ( __be32)__swab32p(p);
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __u32 __be32_to_cpup(const __be32 *p)
{
 return __swab32p((__u32 *)p);
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __be16 __cpu_to_be16p(const __u16 *p)
{
 return ( __be16)__swab16p(p);
}
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __u16 __be16_to_cpup(const __be16 *p)
{
 return __swab16p((__u16 *)p);
}
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/byteorder/little_endian.h" 2





# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/byteorder/generic.h" 1
# 144 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/byteorder/generic.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void le16_add_cpu(__le16 *var, u16 val)
{
 *var = (( __le16)(__u16)((( __u16)(__le16)(*var)) + val));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void le32_add_cpu(__le32 *var, u32 val)
{
 *var = (( __le32)(__u32)((( __u32)(__le32)(*var)) + val));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void le64_add_cpu(__le64 *var, u64 val)
{
 *var = (( __le64)(__u64)((( __u64)(__le64)(*var)) + val));
}


static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void le32_to_cpu_array(u32 *buf, unsigned int words)
{
 while (words--) {
  do { (void)(buf); } while (0);
  buf++;
 }
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void cpu_to_le32_array(u32 *buf, unsigned int words)
{
 while (words--) {
  do { (void)(buf); } while (0);
  buf++;
 }
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void be16_add_cpu(__be16 *var, u16 val)
{
 *var = (( __be16)(__u16)(__builtin_constant_p(((__u16)(__builtin_constant_p(( __u16)(__be16)(*var)) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val)) ? ((__u16)( (((__u16)(((__u16)(__builtin_constant_p(( __u16)(__be16)(*var)) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val)) & (__u16)0x00ffU) << 8) | (((__u16)(((__u16)(__builtin_constant_p(( __u16)(__be16)(*var)) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val)) & (__u16)0xff00U) >> 8))) : __fswab16(((__u16)(__builtin_constant_p(( __u16)(__be16)(*var)) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val))));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void be32_add_cpu(__be32 *var, u32 val)
{
 *var = (( __be32)(__u32)(__builtin_constant_p(((__u32)(__builtin_constant_p(( __u32)(__be32)(*var)) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) ? ((__u32)( (((__u32)(((__u32)(__builtin_constant_p(( __u32)(__be32)(*var)) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x000000ffUL) << 24) | (((__u32)(((__u32)(__builtin_constant_p(( __u32)(__be32)(*var)) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(((__u32)(__builtin_constant_p(( __u32)(__be32)(*var)) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(((__u32)(__builtin_constant_p(( __u32)(__be32)(*var)) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0xff000000UL) >> 24))) : __fswab32(((__u32)(__builtin_constant_p(( __u32)(__be32)(*var)) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val))));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void be64_add_cpu(__be64 *var, u64 val)
{
 *var = (( __be64)(__u64)(__builtin_constant_p(((__u64)(__builtin_constant_p(( __u64)(__be64)(*var)) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) ? ((__u64)( (((__u64)(((__u64)(__builtin_constant_p(( __u64)(__be64)(*var)) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(((__u64)(__builtin_constant_p(( __u64)(__be64)(*var)) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(((__u64)(__builtin_constant_p(( __u64)(__be64)(*var)) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(((__u64)(__builtin_constant_p(( __u64)(__be64)(*var)) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(((__u64)(__builtin_constant_p(( __u64)(__be64)(*var)) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(((__u64)(__builtin_constant_p(( __u64)(__be64)(*var)) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(((__u64)(__builtin_constant_p(( __u64)(__be64)(*var)) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(((__u64)(__builtin_constant_p(( __u64)(__be64)(*var)) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(((__u64)(__builtin_constant_p(( __u64)(__be64)(*var)) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val))));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void cpu_to_be32_array(__be32 *dst, const u32 *src, size_t len)
{
 size_t i;

 for (i = 0; i < len; i++)
  dst[i] = (( __be32)(__u32)(__builtin_constant_p((src[i])) ? ((__u32)( (((__u32)((src[i])) & (__u32)0x000000ffUL) << 24) | (((__u32)((src[i])) & (__u32)0x0000ff00UL) << 8) | (((__u32)((src[i])) & (__u32)0x00ff0000UL) >> 8) | (((__u32)((src[i])) & (__u32)0xff000000UL) >> 24))) : __fswab32((src[i]))));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void be32_to_cpu_array(u32 *dst, const __be32 *src, size_t len)
{
 size_t i;

 for (i = 0; i < len; i++)
  dst[i] = (__u32)(__builtin_constant_p(( __u32)(__be32)(src[i])) ? ((__u32)( (((__u32)(( __u32)(__be32)(src[i])) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(src[i])) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(src[i])) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(src[i])) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(src[i])));
}
# 12 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/byteorder/little_endian.h" 2
# 24 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/uapi/asm/byteorder.h" 2
# 7 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/le.h" 2
# 19 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/le.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int test_bit_le(int nr, const void *addr)
{
 return ((__builtin_constant_p(nr ^ 0) && __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)((void *)0)) && (uintptr_t)(addr) != (uintptr_t)((void *)0) && __builtin_constant_p(*(const unsigned long *)(addr))) ? const_test_bit(nr ^ 0, addr) : generic_test_bit(nr ^ 0, addr));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void set_bit_le(int nr, void *addr)
{
 set_bit(nr ^ 0, addr);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void clear_bit_le(int nr, void *addr)
{
 clear_bit(nr ^ 0, addr);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __set_bit_le(int nr, void *addr)
{
 ((__builtin_constant_p(nr ^ 0) && __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)((void *)0)) && (uintptr_t)(addr) != (uintptr_t)((void *)0) && __builtin_constant_p(*(const unsigned long *)(addr))) ? generic___set_bit(nr ^ 0, addr) : generic___set_bit(nr ^ 0, addr));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __clear_bit_le(int nr, void *addr)
{
 ((__builtin_constant_p(nr ^ 0) && __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)((void *)0)) && (uintptr_t)(addr) != (uintptr_t)((void *)0) && __builtin_constant_p(*(const unsigned long *)(addr))) ? generic___clear_bit(nr ^ 0, addr) : generic___clear_bit(nr ^ 0, addr));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int test_and_set_bit_le(int nr, void *addr)
{
 return test_and_set_bit(nr ^ 0, addr);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int test_and_clear_bit_le(int nr, void *addr)
{
 return test_and_clear_bit(nr ^ 0, addr);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int __test_and_set_bit_le(int nr, void *addr)
{
 return ((__builtin_constant_p(nr ^ 0) && __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)((void *)0)) && (uintptr_t)(addr) != (uintptr_t)((void *)0) && __builtin_constant_p(*(const unsigned long *)(addr))) ? generic___test_and_set_bit(nr ^ 0, addr) : generic___test_and_set_bit(nr ^ 0, addr));
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int __test_and_clear_bit_le(int nr, void *addr)
{
 return ((__builtin_constant_p(nr ^ 0) && __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)((void *)0)) && (uintptr_t)(addr) != (uintptr_t)((void *)0) && __builtin_constant_p(*(const unsigned long *)(addr))) ? generic___test_and_clear_bit(nr ^ 0, addr) : generic___test_and_clear_bit(nr ^ 0, addr));
}
# 29 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/bitops/ext2-atomic-setbit.h" 1
# 30 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/bitops.h" 2
# 69 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bitops.h" 2







_Static_assert(__builtin_types_compatible_p(typeof(generic___set_bit), typeof(generic___set_bit)) && __builtin_types_compatible_p(typeof(generic___set_bit), typeof(generic___set_bit)) && __builtin_types_compatible_p(typeof(generic___set_bit), typeof(generic___set_bit)), "__same_type(arch___set_bit, generic___set_bit) && __same_type(const___set_bit, generic___set_bit) && __same_type(___set_bit, generic___set_bit)");
_Static_assert(__builtin_types_compatible_p(typeof(generic___clear_bit), typeof(generic___clear_bit)) && __builtin_types_compatible_p(typeof(generic___clear_bit), typeof(generic___clear_bit)) && __builtin_types_compatible_p(typeof(generic___clear_bit), typeof(generic___clear_bit)), "__same_type(arch___clear_bit, generic___clear_bit) && __same_type(const___clear_bit, generic___clear_bit) && __same_type(___clear_bit, generic___clear_bit)");
_Static_assert(__builtin_types_compatible_p(typeof(generic___change_bit), typeof(generic___change_bit)) && __builtin_types_compatible_p(typeof(generic___change_bit), typeof(generic___change_bit)) && __builtin_types_compatible_p(typeof(generic___change_bit), typeof(generic___change_bit)), "__same_type(arch___change_bit, generic___change_bit) && __same_type(const___change_bit, generic___change_bit) && __same_type(___change_bit, generic___change_bit)");
_Static_assert(__builtin_types_compatible_p(typeof(generic___test_and_set_bit), typeof(generic___test_and_set_bit)) && __builtin_types_compatible_p(typeof(generic___test_and_set_bit), typeof(generic___test_and_set_bit)) && __builtin_types_compatible_p(typeof(generic___test_and_set_bit), typeof(generic___test_and_set_bit)), "__same_type(arch___test_and_set_bit, generic___test_and_set_bit) && __same_type(const___test_and_set_bit, generic___test_and_set_bit) && __same_type(___test_and_set_bit, generic___test_and_set_bit)");
_Static_assert(__builtin_types_compatible_p(typeof(generic___test_and_clear_bit), typeof(generic___test_and_clear_bit)) && __builtin_types_compatible_p(typeof(generic___test_and_clear_bit), typeof(generic___test_and_clear_bit)) && __builtin_types_compatible_p(typeof(generic___test_and_clear_bit), typeof(generic___test_and_clear_bit)), "__same_type(arch___test_and_clear_bit, generic___test_and_clear_bit) && __same_type(const___test_and_clear_bit, generic___test_and_clear_bit) && __same_type(___test_and_clear_bit, generic___test_and_clear_bit)");
_Static_assert(__builtin_types_compatible_p(typeof(generic___test_and_change_bit), typeof(generic___test_and_change_bit)) && __builtin_types_compatible_p(typeof(generic___test_and_change_bit), typeof(generic___test_and_change_bit)) && __builtin_types_compatible_p(typeof(generic___test_and_change_bit), typeof(generic___test_and_change_bit)), "__same_type(arch___test_and_change_bit, generic___test_and_change_bit) && __same_type(const___test_and_change_bit, generic___test_and_change_bit) && __same_type(___test_and_change_bit, generic___test_and_change_bit)");
_Static_assert(__builtin_types_compatible_p(typeof(generic_test_bit), typeof(generic_test_bit)) && __builtin_types_compatible_p(typeof(const_test_bit), typeof(generic_test_bit)) && __builtin_types_compatible_p(typeof(generic_test_bit), typeof(generic_test_bit)), "__same_type(arch_test_bit, generic_test_bit) && __same_type(const_test_bit, generic_test_bit) && __same_type(_test_bit, generic_test_bit)");
_Static_assert(__builtin_types_compatible_p(typeof(generic_test_bit_acquire), typeof(generic_test_bit_acquire)) && __builtin_types_compatible_p(typeof(generic_test_bit_acquire), typeof(generic_test_bit_acquire)) && __builtin_types_compatible_p(typeof(generic_test_bit_acquire), typeof(generic_test_bit_acquire)), "__same_type(arch_test_bit_acquire, generic_test_bit_acquire) && __same_type(const_test_bit_acquire, generic_test_bit_acquire) && __same_type(_test_bit_acquire, generic_test_bit_acquire)");



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int get_bitmask_order(unsigned int count)
{
 int order;

 order = fls(count);
 return order;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) unsigned long hweight_long(unsigned long w)
{
 return sizeof(w) == 4 ? (__builtin_constant_p(w) ? ((((unsigned int) ((!!((w) & (1ULL << 0))) + (!!((w) & (1ULL << 1))) + (!!((w) & (1ULL << 2))) + (!!((w) & (1ULL << 3))) + (!!((w) & (1ULL << 4))) + (!!((w) & (1ULL << 5))) + (!!((w) & (1ULL << 6))) + (!!((w) & (1ULL << 7))))) + ((unsigned int) ((!!(((w) >> 8) & (1ULL << 0))) + (!!(((w) >> 8) & (1ULL << 1))) + (!!(((w) >> 8) & (1ULL << 2))) + (!!(((w) >> 8) & (1ULL << 3))) + (!!(((w) >> 8) & (1ULL << 4))) + (!!(((w) >> 8) & (1ULL << 5))) + (!!(((w) >> 8) & (1ULL << 6))) + (!!(((w) >> 8) & (1ULL << 7)))))) + (((unsigned int) ((!!(((w) >> 16) & (1ULL << 0))) + (!!(((w) >> 16) & (1ULL << 1))) + (!!(((w) >> 16) & (1ULL << 2))) + (!!(((w) >> 16) & (1ULL << 3))) + (!!(((w) >> 16) & (1ULL << 4))) + (!!(((w) >> 16) & (1ULL << 5))) + (!!(((w) >> 16) & (1ULL << 6))) + (!!(((w) >> 16) & (1ULL << 7))))) + ((unsigned int) ((!!((((w) >> 16) >> 8) & (1ULL << 0))) + (!!((((w) >> 16) >> 8) & (1ULL << 1))) + (!!((((w) >> 16) >> 8) & (1ULL << 2))) + (!!((((w) >> 16) >> 8) & (1ULL << 3))) + (!!((((w) >> 16) >> 8) & (1ULL << 4))) + (!!((((w) >> 16) >> 8) & (1ULL << 5))) + (!!((((w) >> 16) >> 8) & (1ULL << 6))) + (!!((((w) >> 16) >> 8) & (1ULL << 7))))))) : __arch_hweight32(w)) : (__builtin_constant_p((__u64)w) ? (((((unsigned int) ((!!(((__u64)w) & (1ULL << 0))) + (!!(((__u64)w) & (1ULL << 1))) + (!!(((__u64)w) & (1ULL << 2))) + (!!(((__u64)w) & (1ULL << 3))) + (!!(((__u64)w) & (1ULL << 4))) + (!!(((__u64)w) & (1ULL << 5))) + (!!(((__u64)w) & (1ULL << 6))) + (!!(((__u64)w) & (1ULL << 7))))) + ((unsigned int) ((!!((((__u64)w) >> 8) & (1ULL << 0))) + (!!((((__u64)w) >> 8) & (1ULL << 1))) + (!!((((__u64)w) >> 8) & (1ULL << 2))) + (!!((((__u64)w) >> 8) & (1ULL << 3))) + (!!((((__u64)w) >> 8) & (1ULL << 4))) + (!!((((__u64)w) >> 8) & (1ULL << 5))) + (!!((((__u64)w) >> 8) & (1ULL << 6))) + (!!((((__u64)w) >> 8) & (1ULL << 7)))))) + (((unsigned int) ((!!((((__u64)w) >> 16) & (1ULL << 0))) + (!!((((__u64)w) >> 16) & (1ULL << 1))) + (!!((((__u64)w) >> 16) & (1ULL << 2))) + (!!((((__u64)w) >> 16) & (1ULL << 3))) + (!!((((__u64)w) >> 16) & (1ULL << 4))) + (!!((((__u64)w) >> 16) & (1ULL << 5))) + (!!((((__u64)w) >> 16) & (1ULL << 6))) + (!!((((__u64)w) >> 16) & (1ULL << 7))))) + ((unsigned int) ((!!(((((__u64)w) >> 16) >> 8) & (1ULL << 0))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 1))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 2))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 3))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 4))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 5))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 6))) + (!!(((((__u64)w) >> 16) >> 8) & (1ULL << 7))))))) + ((((unsigned int) ((!!((((__u64)w) >> 32) & (1ULL << 0))) + (!!((((__u64)w) >> 32) & (1ULL << 1))) + (!!((((__u64)w) >> 32) & (1ULL << 2))) + (!!((((__u64)w) >> 32) & (1ULL << 3))) + (!!((((__u64)w) >> 32) & (1ULL << 4))) + (!!((((__u64)w) >> 32) & (1ULL << 5))) + (!!((((__u64)w) >> 32) & (1ULL << 6))) + (!!((((__u64)w) >> 32) & (1ULL << 7))))) + ((unsigned int) ((!!(((((__u64)w) >> 32) >> 8) & (1ULL << 0))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 1))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 2))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 3))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 4))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 5))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 6))) + (!!(((((__u64)w) >> 32) >> 8) & (1ULL << 7)))))) + (((unsigned int) ((!!(((((__u64)w) >> 32) >> 16) & (1ULL << 0))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 1))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 2))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 3))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 4))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 5))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 6))) + (!!(((((__u64)w) >> 32) >> 16) & (1ULL << 7))))) + ((unsigned int) ((!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 0))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 1))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 2))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 3))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 4))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 5))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 6))) + (!!((((((__u64)w) >> 32) >> 16) >> 8) & (1ULL << 7)))))))) : __arch_hweight64((__u64)w));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __u64 rol64(__u64 word, unsigned int shift)
{
 return (word << (shift & 63)) | (word >> ((-shift) & 63));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __u64 ror64(__u64 word, unsigned int shift)
{
 return (word >> (shift & 63)) | (word << ((-shift) & 63));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __u32 rol32(__u32 word, unsigned int shift)
{
 return (word << (shift & 31)) | (word >> ((-shift) & 31));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __u32 ror32(__u32 word, unsigned int shift)
{
 return (word >> (shift & 31)) | (word << ((-shift) & 31));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __u16 rol16(__u16 word, unsigned int shift)
{
 return (word << (shift & 15)) | (word >> ((-shift) & 15));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __u16 ror16(__u16 word, unsigned int shift)
{
 return (word >> (shift & 15)) | (word << ((-shift) & 15));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __u8 rol8(__u8 word, unsigned int shift)
{
 return (word << (shift & 7)) | (word >> ((-shift) & 7));
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __u8 ror8(__u8 word, unsigned int shift)
{
 return (word >> (shift & 7)) | (word << ((-shift) & 7));
}
# 187 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bitops.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __s32 sign_extend32(__u32 value, int index)
{
 __u8 shift = 31 - index;
 return (__s32)(value << shift) >> shift;
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __s64 sign_extend64(__u64 value, int index)
{
 __u8 shift = 63 - index;
 return (__s64)(value << shift) >> shift;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) unsigned int fls_long(unsigned long l)
{
 if (sizeof(l) == 4)
  return fls(l);
 return fls64(l);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int get_count_order(unsigned int count)
{
 if (count == 0)
  return -1;

 return fls(--count);
}







static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int get_count_order_long(unsigned long l)
{
 if (l == 0UL)
  return -1;
 return (int)fls_long(--l);
}
# 240 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/bitops.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) unsigned int __ffs64(u64 word)
{






 return __ffs((unsigned long)word);
}






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) unsigned int fns(unsigned long word, unsigned int n)
{
 while (word && n--)
  word &= word - 1;

 return word ? __ffs(word) : 64;
}
# 24 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/hex.h" 1






extern const char hex_asc[];



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) char *hex_byte_pack(char *buf, u8 byte)
{
 *buf++ = hex_asc[((byte) & 0xf0) >> 4];
 *buf++ = hex_asc[((byte) & 0x0f)];
 return buf;
}

extern const char hex_asc_upper[];



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) char *hex_byte_pack_upper(char *buf, u8 byte)
{
 *buf++ = hex_asc_upper[((byte) & 0xf0) >> 4];
 *buf++ = hex_asc_upper[((byte) & 0x0f)];
 return buf;
}

extern int hex_to_bin(unsigned char ch);
extern int __attribute__((__warn_unused_result__)) hex2bin(u8 *dst, const char *src, size_t count);
extern char *bin2hex(char *dst, const void *src, size_t count);

bool mac_pton(const char *s, u8 *mac);
# 25 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kstrtox.h" 1
# 9 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kstrtox.h"
int __attribute__((__warn_unused_result__)) _kstrtoul(const char *s, unsigned int base, unsigned long *res);
int __attribute__((__warn_unused_result__)) _kstrtol(const char *s, unsigned int base, long *res);

int __attribute__((__warn_unused_result__)) kstrtoull(const char *s, unsigned int base, unsigned long long *res);
int __attribute__((__warn_unused_result__)) kstrtoll(const char *s, unsigned int base, long long *res);
# 30 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kstrtox.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int __attribute__((__warn_unused_result__)) kstrtoul(const char *s, unsigned int base, unsigned long *res)
{




 if (sizeof(unsigned long) == sizeof(unsigned long long) &&
     __alignof__(unsigned long) == __alignof__(unsigned long long))
  return kstrtoull(s, base, (unsigned long long *)res);
 else
  return _kstrtoul(s, base, res);
}
# 58 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kstrtox.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int __attribute__((__warn_unused_result__)) kstrtol(const char *s, unsigned int base, long *res)
{




 if (sizeof(long) == sizeof(long long) &&
     __alignof__(long) == __alignof__(long long))
  return kstrtoll(s, base, (long long *)res);
 else
  return _kstrtol(s, base, res);
}

int __attribute__((__warn_unused_result__)) kstrtouint(const char *s, unsigned int base, unsigned int *res);
int __attribute__((__warn_unused_result__)) kstrtoint(const char *s, unsigned int base, int *res);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int __attribute__((__warn_unused_result__)) kstrtou64(const char *s, unsigned int base, u64 *res)
{
 return kstrtoull(s, base, res);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int __attribute__((__warn_unused_result__)) kstrtos64(const char *s, unsigned int base, s64 *res)
{
 return kstrtoll(s, base, res);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int __attribute__((__warn_unused_result__)) kstrtou32(const char *s, unsigned int base, u32 *res)
{
 return kstrtouint(s, base, res);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int __attribute__((__warn_unused_result__)) kstrtos32(const char *s, unsigned int base, s32 *res)
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

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int __attribute__((__warn_unused_result__)) kstrtou64_from_user(const char *s, size_t count, unsigned int base, u64 *res)
{
 return kstrtoull_from_user(s, count, base, res);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int __attribute__((__warn_unused_result__)) kstrtos64_from_user(const char *s, size_t count, unsigned int base, s64 *res)
{
 return kstrtoll_from_user(s, count, base, res);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int __attribute__((__warn_unused_result__)) kstrtou32_from_user(const char *s, size_t count, unsigned int base, u32 *res)
{
 return kstrtouint_from_user(s, count, base, res);
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int __attribute__((__warn_unused_result__)) kstrtos32_from_user(const char *s, size_t count, unsigned int base, s32 *res)
{
 return kstrtoint_from_user(s, count, base, res);
}
# 145 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kstrtox.h"
extern unsigned long simple_strtoul(const char *,char **,unsigned int);
extern long simple_strtol(const char *,char **,unsigned int);
extern unsigned long long simple_strtoull(const char *,char **,unsigned int);
extern long long simple_strtoll(const char *,char **,unsigned int);
# 26 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/log2.h" 1
# 21 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/log2.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __attribute__((const))
int __ilog2_u32(u32 n)
{
 return fls(n) - 1;
}



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__always_inline__)) __attribute__((const))
int __ilog2_u64(u64 n)
{
 return fls64(n) - 1;
}
# 44 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/log2.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((const))
bool is_power_of_2(unsigned long n)
{
 return (n != 0 && ((n & (n - 1)) == 0));
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((const))
unsigned long __roundup_pow_of_two(unsigned long n)
{
 return 1UL << fls_long(n - 1);
}





static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((const))
unsigned long __rounddown_pow_of_two(unsigned long n)
{
 return 1UL << (fls_long(n) - 1);
}
# 198 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/log2.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__const__))
int __order_base_2(unsigned long n)
{
 return n > 1 ? ( __builtin_constant_p(n - 1) ? ((n - 1) < 2 ? 0 : 63 - __builtin_clzll(n - 1)) : (sizeof(n - 1) <= 4) ? __ilog2_u32(n - 1) : __ilog2_u64(n - 1) ) + 1 : 0;
}
# 225 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/log2.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((const))
int __bits_per(unsigned long n)
{
 if (n < 2)
  return 1;
 if (is_power_of_2(n))
  return ( __builtin_constant_p(n) ? ( ((n) == 0 || (n) == 1) ? 0 : ( __builtin_constant_p((n) - 1) ? (((n) - 1) < 2 ? 0 : 63 - __builtin_clzll((n) - 1)) : (sizeof((n) - 1) <= 4) ? __ilog2_u32((n) - 1) : __ilog2_u64((n) - 1) ) + 1) : __order_base_2(n) ) + 1;
 return ( __builtin_constant_p(n) ? ( ((n) == 0 || (n) == 1) ? 0 : ( __builtin_constant_p((n) - 1) ? (((n) - 1) < 2 ? 0 : 63 - __builtin_clzll((n) - 1)) : (sizeof((n) - 1) <= 4) ? __ilog2_u32((n) - 1) : __ilog2_u64((n) - 1) ) + 1) : __order_base_2(n) );
}
# 27 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/math.h" 1





# 1 "./arch/arm64/include/generated/asm/div64.h" 1
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/div64.h" 1
# 2 "./arch/arm64/include/generated/asm/div64.h" 2
# 7 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/math.h" 2
# 127 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/math.h"
struct s8_fract { __s8 numerator; __s8 denominator; };
struct u8_fract { __u8 numerator; __u8 denominator; };
struct s16_fract { __s16 numerator; __s16 denominator; };
struct u16_fract { __u16 numerator; __u16 denominator; };
struct s32_fract { __s32 numerator; __s32 denominator; };
struct u32_fract { __u32 numerator; __u32 denominator; };
# 205 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/math.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u32 reciprocal_scale(u32 val, u32 ep_ro)
{
 return (u32)(((u64) val * ep_ro) >> 32);
}

u64 int_pow(u64 base, unsigned int exp);
unsigned long int_sqrt(unsigned long);




static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) u32 int_sqrt64(u64 x)
{
 return (u32)int_sqrt(x);
}
# 28 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/minmax.h" 1
# 291 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/minmax.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) bool in_range64(u64 val, u64 start, u64 len)
{
 return (val - start) < len;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) bool in_range32(u32 val, u32 start, u32 len)
{
 return (val - start) < len;
}
# 29 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2

# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/panic.h" 1







struct pt_regs;

extern long (*panic_blink)(int state);
__attribute__((__format__(printf, 1, 2)))
void panic(const char *fmt, ...) __attribute__((__noreturn__)) ;
void nmi_panic(struct pt_regs *regs, const char *msg);
void check_panic_on_warn(const char *origin);
extern void oops_enter(void);
extern void oops_exit(void);
extern bool oops_may_print(void);

extern bool panic_triggering_all_cpu_backtrace;
extern int panic_timeout;
extern unsigned long panic_print;
extern int panic_on_oops;
extern int panic_on_unrecovered_nmi;
extern int panic_on_io_nmi;
extern int panic_on_warn;

extern unsigned long panic_on_taint;
extern bool panic_on_taint_nousertaint;

extern int sysctl_panic_on_rcu_stall;
extern int sysctl_max_rcu_stall_to_panic;
extern int sysctl_panic_on_stackoverflow;

extern bool crash_kexec_post_notifiers;

extern void __stack_chk_fail(void);
void abort(void);






extern atomic_t panic_cpu;






static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void set_arch_panic_timeout(int timeout, int arch_default_timeout)
{
 if (panic_timeout == arch_default_timeout)
  panic_timeout = timeout;
}
# 80 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/panic.h"
struct taint_flag {
 char c_true;
 char c_false;
 bool module;
 const char *desc;
};

extern const struct taint_flag taint_flags[19];

enum lockdep_ok {
 LOCKDEP_STILL_OK,
 LOCKDEP_NOW_UNRELIABLE,
};

extern const char *print_tainted(void);
extern const char *print_tainted_verbose(void);
extern void add_taint(unsigned flag, enum lockdep_ok);
extern int test_taint(unsigned flag);
extern unsigned long get_taint(void);
# 31 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/printk.h" 1






# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kern_levels.h" 1
# 8 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/printk.h" 2

# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/ratelimit_types.h" 1





# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/param.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/uapi/asm/param.h" 1
# 22 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/uapi/asm/param.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/param.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/param.h" 1
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/param.h" 2
# 23 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/uapi/asm/param.h" 2
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/param.h" 2
# 7 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/ratelimit_types.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/spinlock_types_raw.h" 1






# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/spinlock_types.h" 1
# 12 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/spinlock_types.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/qspinlock_types.h" 1
# 14 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/qspinlock_types.h"
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
# 43 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/qspinlock_types.h"
 };
} arch_spinlock_t;
# 13 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/spinlock_types.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/qrwlock_types.h" 1






# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/spinlock_types.h" 1
# 8 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/qrwlock_types.h" 2





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
# 14 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/arch/arm64/include/asm/spinlock_types.h" 2
# 8 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/spinlock_types_raw.h" 2




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/lockdep_types.h" 1
# 17 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/lockdep_types.h"
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
 LD_LOCK_WAIT_OVERRIDE,
 LD_LOCK_MAX,
};
# 264 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/lockdep_types.h"
struct lock_class_key { };




struct lockdep_map { };

struct pin_cookie { };
# 13 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/spinlock_types_raw.h" 2

typedef struct raw_spinlock {
 arch_spinlock_t raw_lock;







} raw_spinlock_t;
# 8 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/ratelimit_types.h" 2







struct ratelimit_state {
 raw_spinlock_t lock;

 int interval;
 int burst;
 int printed;
 int missed;
 unsigned int flags;
 unsigned long begin;
};
# 44 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/ratelimit_types.h"
extern int ___ratelimit(struct ratelimit_state *rs, const char *func);
# 10 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/printk.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/once_lite.h" 1
# 11 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/printk.h" 2

struct console;

extern const char linux_banner[];
extern const char linux_proc_banner[];

extern int oops_in_progress;



static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) int printk_get_level(const char *buffer)
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

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) const char *printk_skip_level(const char *buffer)
{
 if (printk_get_level(buffer))
  return buffer + 2;

 return buffer;
}

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) const char *printk_skip_headers(const char *buffer)
{
 while (printk_get_level(buffer))
  buffer = printk_skip_level(buffer);

 return buffer;
}
# 65 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/printk.h"
int match_devname_and_update_preferred_console(const char *match,
            const char *name,
            const short idx);

extern int console_printk[];






extern void console_verbose(void);



extern char devkmsg_log_str[10];
struct ctl_table;

extern int suppress_printk;

struct va_format {
 const char *fmt;
 va_list *va;
};
# 143 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/printk.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__format__(printf, 1, 2)))
void early_printk(const char *s, ...) { }


struct dev_printk_info;


 __attribute__((__format__(printf, 4, 0)))
int vprintk_emit(int facility, int level,
   const struct dev_printk_info *dev_info,
   const char *fmt, va_list args);

 __attribute__((__format__(printf, 1, 0)))
int vprintk(const char *fmt, va_list args);

 __attribute__((__format__(printf, 1, 2)))
int _printk(const char *fmt, ...);




__attribute__((__format__(printf, 1, 2))) int _printk_deferred(const char *fmt, ...);

extern void __printk_deferred_enter(void);
extern void __printk_deferred_exit(void);
# 182 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/printk.h"
extern int __printk_ratelimit(const char *func);

extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
       unsigned int interval_msec);

extern int printk_delay_msec;
extern int dmesg_restrict;

extern void wake_up_klogd(void);

char *log_buf_addr_get(void);
u32 log_buf_len_get(void);
void log_buf_vmcoreinfo_setup(void);
void __attribute__((__section__(".init.text"))) setup_log_buf(int early);
__attribute__((__format__(printf, 1, 2))) void dump_stack_set_arch_desc(const char *fmt, ...);
void dump_stack_print_info(const char *log_lvl);
void show_regs_print_info(const char *log_lvl);
extern void dump_stack_lvl(const char *log_lvl) ;
extern void dump_stack(void) ;
void printk_trigger_flush(void);
void console_try_replay_all(void);
void printk_legacy_allow_panic_sync(void);
extern bool nbcon_device_try_acquire(struct console *con);
extern void nbcon_device_release(struct console *con);
void nbcon_atomic_flush_unsafe(void);
bool pr_flush(int timeout_ms, bool reset_on_progress);
# 315 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/printk.h"
bool this_cpu_in_panic(void);


extern int __printk_cpu_sync_try_get(void);
extern void __printk_cpu_sync_wait(void);
extern void __printk_cpu_sync_put(void);
# 370 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/printk.h"
extern int kptr_restrict;
# 389 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/printk.h"
struct module;
# 743 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/printk.h"
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
# 782 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/printk.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void print_hex_dump_debug(const char *prefix_str, int prefix_type,
     int rowsize, int groupsize,
     const void *buf, size_t len, bool ascii)
{
}
# 32 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2

# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/sprintf.h" 1
# 9 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/sprintf.h"
int num_to_str(char *buf, int size, unsigned long long num, unsigned int width);

__attribute__((__format__(printf, 2, 3))) int sprintf(char *buf, const char * fmt, ...);
__attribute__((__format__(printf, 2, 0))) int vsprintf(char *buf, const char *, va_list);
__attribute__((__format__(printf, 3, 4))) int snprintf(char *buf, size_t size, const char *fmt, ...);
__attribute__((__format__(printf, 3, 0))) int vsnprintf(char *buf, size_t size, const char *fmt, va_list args);
__attribute__((__format__(printf, 3, 4))) int scnprintf(char *buf, size_t size, const char *fmt, ...);
__attribute__((__format__(printf, 3, 0))) int vscnprintf(char *buf, size_t size, const char *fmt, va_list args);
__attribute__((__format__(printf, 2, 3))) __attribute__((__malloc__)) char *kasprintf(gfp_t gfp, const char *fmt, ...);
__attribute__((__format__(printf, 2, 0))) __attribute__((__malloc__)) char *kvasprintf(gfp_t gfp, const char *fmt, va_list args);
__attribute__((__format__(printf, 2, 0))) const char *kvasprintf_const(gfp_t gfp, const char *fmt, va_list args);

__attribute__((__format__(scanf, 2, 3))) int sscanf(const char *, const char *, ...);
__attribute__((__format__(scanf, 2, 0))) int vsscanf(const char *, const char *, va_list);


extern bool no_hash_pointers;
int no_hash_pointers_enable(char *str);
# 34 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/static_call_types.h" 1
# 32 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/static_call_types.h"
struct static_call_site {
 s32 addr;
 s32 key;
};
# 94 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/static_call_types.h"
struct static_call_key {
 void *func;
};
# 35 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/instruction_pointer.h" 1
# 36 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/wordpart.h" 1
# 37 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h" 2
# 57 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h"
struct completion;
struct user;
# 145 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h"
  static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __might_resched(const char *file, int line,
         unsigned int offsets) { }
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void __might_sleep(const char *file, int line) { }
# 163 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h"
static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) void might_fault(void) { }


void do_exit(long error_code) __attribute__((__noreturn__));

extern int core_kernel_text(unsigned long addr);
extern int __kernel_text_address(unsigned long addr);
extern int kernel_text_address(unsigned long addr);
extern int func_ptr_is_kernel_text(void *ptr);

extern void bust_spinlocks(int yes);

extern int root_mountflags;

extern bool early_boot_irqs_disabled;





extern enum system_states {
 SYSTEM_BOOTING,
 SYSTEM_SCHEDULING,
 SYSTEM_FREEING_INITMEM,
 SYSTEM_RUNNING,
 SYSTEM_HALT,
 SYSTEM_POWER_OFF,
 SYSTEM_RESTART,
 SYSTEM_SUSPEND,
} system_state;
# 214 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h"
enum ftrace_dump_mode {
 DUMP_NONE,
 DUMP_ALL,
 DUMP_ORIG,
 DUMP_PARAM,
};


void tracing_on(void);
void tracing_off(void);
int tracing_is_on(void);
void tracing_snapshot(void);
void tracing_snapshot_alloc(void);

extern void tracing_start(void);
extern void tracing_stop(void);

static inline __attribute__((__gnu_inline__)) __attribute__((__unused__)) __attribute__((patchable_function_entry(0, 0))) __attribute__((__format__(printf, 1, 2)))
void ____trace_printk_check_format(const char *fmt, ...)
{
}
# 294 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h"
extern __attribute__((__format__(printf, 2, 3)))
int __trace_bprintk(unsigned long ip, const char *fmt, ...);

extern __attribute__((__format__(printf, 2, 3)))
int __trace_printk(unsigned long ip, const char *fmt, ...);
# 335 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h"
extern int __trace_bputs(unsigned long ip, const char *str);
extern int __trace_puts(unsigned long ip, const char *str, int size);

extern void trace_dump_stack(int skip);
# 357 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kernel.h"
extern __attribute__((__format__(printf, 2, 0))) int
__ftrace_vbprintk(unsigned long ip, const char *fmt, va_list ap);

extern __attribute__((__format__(printf, 2, 0))) int
__ftrace_vprintk(unsigned long ip, const char *fmt, va_list ap);

extern void ftrace_dump(enum ftrace_dump_mode oops_dump_mode);
# 134 "/home/sri/hailort-drivers/linux/pcie/../../common/hailo_ioctl_common.h" 2


# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/ioctl.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/ioctl.h" 1
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/ioctl.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/ioctl.h" 1
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/asm-generic/ioctl.h" 2





extern unsigned int __invalid_size_argument_for_IOC;
# 2 "./arch/arm64/include/generated/uapi/asm/ioctl.h" 2
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/ioctl.h" 2
# 137 "/home/sri/hailort-drivers/linux/pcie/../../common/hailo_ioctl_common.h" 2
# 168 "/home/sri/hailort-drivers/linux/pcie/../../common/hailo_ioctl_common.h"
#pragma pack(push, 1)

struct hailo_channel_interrupt_timestamp {
    uint64_t timestamp_ns;
    uint16_t desc_num_processed;
};

typedef struct {
    uint16_t is_buffer_in_use;
    uint16_t buffer_len;
} hailo_d2h_buffer_details_t;


enum hailo_dma_data_direction {
    HAILO_DMA_BIDIRECTIONAL = 0,
    HAILO_DMA_TO_DEVICE = 1,
    HAILO_DMA_FROM_DEVICE = 2,
    HAILO_DMA_NONE = 3,


    HAILO_DMA_MAX_ENUM = ((int)(~0U >> 1)),
};


enum hailo_dma_buffer_type {
    HAILO_DMA_USER_PTR_BUFFER = 0,
    HAILO_DMA_DMABUF_BUFFER = 1,


    HAILO_DMA_BUFFER_MAX_ENUM = ((int)(~0U >> 1)),
};


enum hailo_allocation_mode {
    HAILO_ALLOCATION_MODE_USERSPACE = 0,
    HAILO_ALLOCATION_MODE_DRIVER = 1,


    HAILO_ALLOCATION_MODE_MAX_ENUM = ((int)(~0U >> 1)),
};

enum hailo_vdma_interrupts_domain {
    HAILO_VDMA_INTERRUPTS_DOMAIN_NONE = 0,
    HAILO_VDMA_INTERRUPTS_DOMAIN_DEVICE = (1 << 0),
    HAILO_VDMA_INTERRUPTS_DOMAIN_HOST = (1 << 1),


    HAILO_VDMA_INTERRUPTS_DOMAIN_MAX_ENUM = ((int)(~0U >> 1)),
};


struct hailo_vdma_buffer_map_params {

    uintptr_t user_address;





    size_t size;
    enum hailo_dma_data_direction data_direction;
    enum hailo_dma_buffer_type buffer_type;
    uintptr_t allocated_buffer_handle;
    size_t mapped_handle;
};


struct hailo_vdma_buffer_unmap_params {
    size_t mapped_handle;
};


struct hailo_desc_list_create_params {
    size_t desc_count;
    uint16_t desc_page_size;
    bool is_circular;
    uintptr_t desc_handle;
    uint64_t dma_address;
};


struct hailo_desc_list_release_params {
    uintptr_t desc_handle;
};

struct hailo_write_action_list_params {
    uint8_t *data;
    size_t size;
    uint64_t dma_address;
};


struct hailo_desc_list_program_params {
    size_t buffer_handle;
    size_t buffer_size;
    size_t buffer_offset;
    uintptr_t desc_handle;
    uint8_t channel_index;
    uint32_t starting_desc;
    bool should_bind;
    enum hailo_vdma_interrupts_domain last_interrupts_domain;
    bool is_debug;
};


struct hailo_vdma_enable_channels_params {
    uint32_t channels_bitmap_per_engine[(3)];
    bool enable_timestamps_measure;
};


struct hailo_vdma_disable_channels_params {
    uint32_t channels_bitmap_per_engine[(3)];
};


struct hailo_vdma_interrupts_channel_data {
    uint8_t engine_index;
    uint8_t channel_index;
    bool is_active;
    uint8_t transfers_completed;
    uint8_t host_error;
    uint8_t device_error;
    bool validation_success;
};

struct hailo_vdma_interrupts_wait_params {
    uint32_t channels_bitmap_per_engine[(3)];
    uint8_t channels_count;
    struct hailo_vdma_interrupts_channel_data
        irq_data[(32) * (3)];
};


struct hailo_vdma_interrupts_read_timestamp_params {
    uint8_t engine_index;
    uint8_t channel_index;
    uint32_t timestamps_count;
    struct hailo_channel_interrupt_timestamp timestamps[((128) * 2)];
};







enum hailo_cpu_id {
    HAILO_CPU_ID_CPU0 = 0,
    HAILO_CPU_ID_CPU1,
    HAILO_CPU_ID_NONE,


    HAILO_CPU_MAX_ENUM = ((int)(~0U >> 1)),
};

struct hailo_fw_control {

    uint8_t expected_md5[(16)];
    uint32_t buffer_len;
    uint8_t buffer[(1500)];
    uint32_t timeout_ms;
    enum hailo_cpu_id cpu_id;
};





enum hailo_transfer_direction {
    TRANSFER_READ = 0,
    TRANSFER_WRITE,


    TRANSFER_MAX_ENUM = ((int)(~0U >> 1)),
};

enum hailo_transfer_memory_type {
    HAILO_TRANSFER_DEVICE_DIRECT_MEMORY,


    HAILO_TRANSFER_MEMORY_VDMA0 = 0x100,
    HAILO_TRANSFER_MEMORY_VDMA1,
    HAILO_TRANSFER_MEMORY_VDMA2,


    HAILO_TRANSFER_MEMORY_PCIE_BAR0 = 0x200,
    HAILO_TRANSFER_MEMORY_PCIE_BAR2 = 0x202,
    HAILO_TRANSFER_MEMORY_PCIE_BAR4 = 0x204,


    HAILO_TRANSFER_MEMORY_DMA_ENGINE0 = 0x300,
    HAILO_TRANSFER_MEMORY_DMA_ENGINE1,
    HAILO_TRANSFER_MEMORY_DMA_ENGINE2,


    HAILO_TRANSFER_MEMORY_PCIE_EP_CONFIG = 0x400,
    HAILO_TRANSFER_MEMORY_PCIE_EP_BRIDGE,


    HAILO_TRANSFER_MEMORY_MAX_ENUM = ((int)(~0U >> 1)),
};

struct hailo_memory_transfer_params {
    enum hailo_transfer_direction transfer_direction;
    enum hailo_transfer_memory_type memory_type;
    uint64_t address;
    size_t count;
    uint8_t buffer[(4096)];
};


enum hailo_vdma_buffer_sync_type {
    HAILO_SYNC_FOR_CPU,
    HAILO_SYNC_FOR_DEVICE,


    HAILO_SYNC_MAX_ENUM = ((int)(~0U >> 1)),
};

struct hailo_vdma_buffer_sync_params {
    size_t handle;
    enum hailo_vdma_buffer_sync_type sync_type;
    size_t offset;
    size_t count;
};




struct hailo_d2h_notification {
    size_t buffer_len;
    uint8_t buffer[(1500)];
};

enum hailo_board_type {
    HAILO_BOARD_TYPE_HAILO8 = 0,
    HAILO_BOARD_TYPE_HAILO15,
    HAILO_BOARD_TYPE_HAILO15L,
    HAILO_BOARD_TYPE_HAILO10H,
    HAILO_BOARD_TYPE_HAILO10H_LEGACY,
    HAILO_BOARD_TYPE_COUNT,


    HAILO_BOARD_TYPE_MAX_ENUM = ((int)(~0U >> 1))
};

enum hailo_accelerator_type {
    HAILO_ACCELERATOR_TYPE_NNC,
    HAILO_ACCELERATOR_TYPE_SOC,


    HAILO_ACCELERATOR_TYPE_MAX_ENUM = ((int)(~0U >> 1))
};

enum hailo_dma_type {
    HAILO_DMA_TYPE_PCIE,
    HAILO_DMA_TYPE_DRAM,
    HAILO_DMA_TYPE_PCI_EP,


    HAILO_DMA_TYPE_MAX_ENUM = ((int)(~0U >> 1)),
};

struct hailo_device_properties {
    uint16_t desc_max_page_size;
    enum hailo_board_type board_type;
    enum hailo_allocation_mode allocation_mode;
    enum hailo_dma_type dma_type;
    size_t dma_engines_count;
    bool is_fw_loaded;



};

struct hailo_driver_info {
    uint32_t major_version;
    uint32_t minor_version;
    uint32_t revision_version;
};




struct hailo_read_log_params {
    enum hailo_cpu_id cpu_id;
    uint8_t buffer[(512)];
    size_t buffer_size;
    size_t read_bytes;
};


struct hailo_allocate_low_memory_buffer_params {
    size_t buffer_size;
    uintptr_t buffer_handle;
};


struct hailo_free_low_memory_buffer_params {
    uintptr_t buffer_handle;
};

struct hailo_mark_as_in_use_params {
    bool in_use;
};


struct hailo_allocate_continuous_buffer_params {
    size_t buffer_size;
    uintptr_t buffer_handle;
    uint64_t dma_address;
};


struct hailo_free_continuous_buffer_params {
    uintptr_t buffer_handle;
};


struct hailo_vdma_transfer_buffer {
    size_t mapped_buffer_handle;
    uint32_t offset;
    uint32_t size;
};





struct hailo_vdma_launch_transfer_params {
    uint8_t engine_index;
    uint8_t channel_index;

    uintptr_t desc_handle;
    uint32_t starting_desc;

    bool should_bind;
    uint8_t buffers_count;
    struct hailo_vdma_transfer_buffer
        buffers[(2)];

    enum hailo_vdma_interrupts_domain first_interrupts_domain;
    enum hailo_vdma_interrupts_domain last_interrupts_domain;

    bool is_debug;


    uint32_t descs_programed;
    int launch_transfer_status;
};


struct hailo_soc_connect_params {
    uint16_t port_number;
    uint8_t input_channel_index;
    uint8_t output_channel_index;
    uintptr_t input_desc_handle;
    uintptr_t output_desc_handle;
};


struct hailo_soc_close_params {
    uint8_t input_channel_index;
    uint8_t output_channel_index;
};


struct hailo_pci_ep_accept_params {
    uint16_t port_number;
    uint8_t input_channel_index;
    uint8_t output_channel_index;
    uintptr_t input_desc_handle;
    uintptr_t output_desc_handle;
};


struct hailo_pci_ep_close_params {
    uint8_t input_channel_index;
    uint8_t output_channel_index;
};
# 583 "/home/sri/hailort-drivers/linux/pcie/../../common/hailo_ioctl_common.h"
#pragma pack(pop)

enum hailo_general_ioctl_code {
    HAILO_MEMORY_TRANSFER_CODE,
    HAILO_QUERY_DEVICE_PROPERTIES_CODE,
    HAILO_QUERY_DRIVER_INFO_CODE,


    HAILO_GENERAL_IOCTL_MAX_NR,
};





enum hailo_vdma_ioctl_code {
    HAILO_VDMA_ENABLE_CHANNELS_CODE,
    HAILO_VDMA_DISABLE_CHANNELS_CODE,
    HAILO_VDMA_INTERRUPTS_WAIT_CODE,
    HAILO_VDMA_INTERRUPTS_READ_TIMESTAMPS_CODE,
    HAILO_VDMA_BUFFER_MAP_CODE,
    HAILO_VDMA_BUFFER_UNMAP_CODE,
    HAILO_VDMA_BUFFER_SYNC_CODE,
    HAILO_DESC_LIST_CREATE_CODE,
    HAILO_DESC_LIST_RELEASE_CODE,
    HAILO_DESC_LIST_PROGRAM_CODE,
    HAILO_VDMA_LOW_MEMORY_BUFFER_ALLOC_CODE,
    HAILO_VDMA_LOW_MEMORY_BUFFER_FREE_CODE,
    HAILO_MARK_AS_IN_USE_CODE,
    HAILO_VDMA_CONTINUOUS_BUFFER_ALLOC_CODE,
    HAILO_VDMA_CONTINUOUS_BUFFER_FREE_CODE,
    HAILO_VDMA_LAUNCH_TRANSFER_CODE,


    HAILO_VDMA_IOCTL_MAX_NR,
};
# 643 "/home/sri/hailort-drivers/linux/pcie/../../common/hailo_ioctl_common.h"
enum hailo_nnc_ioctl_code {
    HAILO_FW_CONTROL_CODE,
    HAILO_READ_NOTIFICATION_CODE,
    HAILO_DISABLE_NOTIFICATION_CODE,
    HAILO_READ_LOG_CODE,
    HAILO_RESET_NN_CORE_CODE,
    HAILO_WRITE_ACTION_LIST_CODE,


    HAILO_NNC_IOCTL_MAX_NR
};
# 662 "/home/sri/hailort-drivers/linux/pcie/../../common/hailo_ioctl_common.h"
enum hailo_soc_ioctl_code {
    HAILO_SOC_IOCTL_CONNECT_CODE,
    HAILO_SOC_IOCTL_CLOSE_CODE,


    HAILO_SOC_IOCTL_MAX_NR,
};





enum hailo_pci_ep_ioctl_code {
    HAILO_PCI_EP_ACCEPT_CODE,
    HAILO_PCI_EP_CLOSE_CODE,


    HAILO_PCI_EP_IOCTL_MAX_NR,
};
# 10 "/home/sri/hailort-drivers/linux/pcie/../../common/fw_validation.h" 2






typedef enum {
    FIRMWARE_HEADER_VERSION_INITIAL = 0,


    FIRMWARE_HEADER_VERSION_COUNT
} firmware_header_version_t;

typedef struct {
    u32 magic;
    u32 header_version;
    u32 firmware_major;
    u32 firmware_minor;
    u32 firmware_revision;
    u32 code_size;
} firmware_header_t;







typedef struct {
    u32 key_size;
    u32 content_size;
} secure_boot_certificate_header_t;
# 51 "/home/sri/hailort-drivers/linux/pcie/../../common/fw_validation.h"
int FW_VALIDATION__validate_fw_header(uintptr_t firmware_base_address,
    size_t firmware_size, u32 max_code_size, u32 *outer_consumed_firmware_offset,
    firmware_header_t **out_firmware_header, enum hailo_board_type board_type);

int FW_VALIDATION__validate_cert_header(uintptr_t firmware_base_address,
    size_t firmware_size, u32 *outer_consumed_firmware_offset, secure_boot_certificate_header_t **out_firmware_cert);
# 7 "/home/sri/hailort-drivers/linux/pcie/../../common/fw_validation.c" 2
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/errno.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/errno.h" 1
# 1 "./arch/arm64/include/generated/uapi/asm/errno.h" 1
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/errno.h" 1




# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/errno-base.h" 1
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/asm-generic/errno.h" 2
# 2 "./arch/arm64/include/generated/uapi/asm/errno.h" 2
# 2 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/uapi/linux/errno.h" 2
# 6 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/errno.h" 2
# 8 "/home/sri/hailort-drivers/linux/pcie/../../common/fw_validation.c" 2
# 23 "/home/sri/hailort-drivers/linux/pcie/../../common/fw_validation.c"
int FW_VALIDATION__validate_fw_header(uintptr_t firmware_base_address,
    size_t firmware_size, u32 max_code_size, u32 *outer_consumed_firmware_offset,
    firmware_header_t **out_firmware_header, enum hailo_board_type board_type)
{
    int err = -22;
    firmware_header_t *firmware_header = ((void *)0);
    u32 consumed_firmware_offset = *outer_consumed_firmware_offset;
    u32 expected_firmware_magic = 0;

    firmware_header = (firmware_header_t *) (firmware_base_address + consumed_firmware_offset);
    do { consumed_firmware_offset += (u32) (sizeof(firmware_header_t)); if ((firmware_size < (sizeof(firmware_header_t))) || (firmware_size < consumed_firmware_offset)) { err = -22; goto exit; } } while(0);

    switch (board_type) {
    case HAILO_BOARD_TYPE_HAILO8:
        expected_firmware_magic = (0x1DD89DE0);
        break;
    case HAILO_BOARD_TYPE_HAILO10H_LEGACY:
    case HAILO_BOARD_TYPE_HAILO15:
    case HAILO_BOARD_TYPE_HAILO10H:
        expected_firmware_magic = (0xE905DAAB);
        break;
    case HAILO_BOARD_TYPE_HAILO15L:
        expected_firmware_magic = (0xF94739AB);
        break;
    default:
        err = -22;
        goto exit;
    }

    if (expected_firmware_magic != firmware_header->magic) {
        err = -22;
        goto exit;
    }


    switch(firmware_header->header_version) {
        case FIRMWARE_HEADER_VERSION_INITIAL:
            break;
        default:
            err = -22;
            goto exit;
            break;
    }

    if ((20*4) > firmware_header->code_size) {
        err = -22;
        goto exit;
    }

    if (max_code_size < firmware_header->code_size) {
        err = -22;
        goto exit;
    }

    do { consumed_firmware_offset += (u32) (firmware_header->code_size); if ((firmware_size < (firmware_header->code_size)) || (firmware_size < consumed_firmware_offset)) { err = -22; goto exit; } } while(0);

    *outer_consumed_firmware_offset = consumed_firmware_offset;
    *out_firmware_header = firmware_header;
    err = 0;

exit:
    return err;
}

int FW_VALIDATION__validate_cert_header(uintptr_t firmware_base_address,
    size_t firmware_size, u32 *outer_consumed_firmware_offset, secure_boot_certificate_header_t **out_firmware_cert)
{

    secure_boot_certificate_header_t *firmware_cert = ((void *)0);
    int err = -22;
    u32 consumed_firmware_offset = *outer_consumed_firmware_offset;

    firmware_cert = (secure_boot_certificate_header_t *) (firmware_base_address + consumed_firmware_offset);
    do { consumed_firmware_offset += (u32) (sizeof(secure_boot_certificate_header_t)); if ((firmware_size < (sizeof(secure_boot_certificate_header_t))) || (firmware_size < consumed_firmware_offset)) { err = -22; goto exit; } } while(0);

    if (((0x1000) < firmware_cert->key_size) ||
        ((0x1000) < firmware_cert->content_size)) {
        err = -22;
        goto exit;
    }

    do { consumed_firmware_offset += (u32) (firmware_cert->key_size); if ((firmware_size < (firmware_cert->key_size)) || (firmware_size < consumed_firmware_offset)) { err = -22; goto exit; } } while(0);
    do { consumed_firmware_offset += (u32) (firmware_cert->content_size); if ((firmware_size < (firmware_cert->content_size)) || (firmware_size < consumed_firmware_offset)) { err = -22; goto exit; } } while(0);

    *outer_consumed_firmware_offset = consumed_firmware_offset;
    *out_firmware_cert = firmware_cert;
    err = 0;

exit:
    return err;
}
