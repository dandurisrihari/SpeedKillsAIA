# 1 "/home/mendel/gasket-driver/src/apex.mod.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "././include/linux/kconfig.h" 1




# 1 "./include/generated/autoconf.h" 1
# 6 "././include/linux/kconfig.h" 2
# 74 "././include/linux/kconfig.h"
# 1 "./include/linux/compiler_types.h" 1
# 58 "./include/linux/compiler_types.h"
# 1 "./include/linux/compiler-gcc.h" 1
# 59 "./include/linux/compiler_types.h" 2
# 99 "./include/linux/compiler_types.h"
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
# 75 "././include/linux/kconfig.h" 2
# 1 "<command-line>" 2
# 1 "/home/mendel/gasket-driver/src/apex.mod.c"
# 1 "./include/linux/module.h" 1
# 9 "./include/linux/module.h"
# 1 "./include/linux/list.h" 1




# 1 "./include/linux/types.h" 1





# 1 "./include/uapi/linux/types.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 1 "./include/uapi/asm-generic/types.h" 1






# 1 "./include/asm-generic/int-ll64.h" 1
# 11 "./include/asm-generic/int-ll64.h"
# 1 "./include/uapi/asm-generic/int-ll64.h" 1
# 12 "./include/uapi/asm-generic/int-ll64.h"
# 1 "./arch/arm64/include/uapi/asm/bitsperlong.h" 1
# 22 "./arch/arm64/include/uapi/asm/bitsperlong.h"
# 1 "./include/asm-generic/bitsperlong.h" 1




# 1 "./include/uapi/asm-generic/bitsperlong.h" 1
# 6 "./include/asm-generic/bitsperlong.h" 2
# 23 "./arch/arm64/include/uapi/asm/bitsperlong.h" 2
# 13 "./include/uapi/asm-generic/int-ll64.h" 2







typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;


__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
# 12 "./include/asm-generic/int-ll64.h" 2




typedef signed char s8;
typedef unsigned char u8;

typedef signed short s16;
typedef unsigned short u16;

typedef signed int s32;
typedef unsigned int u32;

typedef signed long long s64;
typedef unsigned long long u64;
# 8 "./include/uapi/asm-generic/types.h" 2
# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 2
# 6 "./include/uapi/linux/types.h" 2
# 14 "./include/uapi/linux/types.h"
# 1 "./include/uapi/linux/posix_types.h" 1




# 1 "./include/linux/stddef.h" 1




# 1 "./include/uapi/linux/stddef.h" 1
# 6 "./include/linux/stddef.h" 2




enum {
 false = 0,
 true = 1
};
# 6 "./include/uapi/linux/posix_types.h" 2
# 25 "./include/uapi/linux/posix_types.h"
typedef struct {
 unsigned long fds_bits[1024 / (8 * sizeof(long))];
} __kernel_fd_set;


typedef void (*__kernel_sighandler_t)(int);


typedef int __kernel_key_t;
typedef int __kernel_mqd_t;

# 1 "./arch/arm64/include/uapi/asm/posix_types.h" 1




typedef unsigned short __kernel_old_uid_t;
typedef unsigned short __kernel_old_gid_t;


# 1 "./include/uapi/asm-generic/posix_types.h" 1
# 15 "./include/uapi/asm-generic/posix_types.h"
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
# 59 "./include/uapi/asm-generic/posix_types.h"
typedef unsigned int __kernel_old_dev_t;
# 72 "./include/uapi/asm-generic/posix_types.h"
typedef __kernel_ulong_t __kernel_size_t;
typedef __kernel_long_t __kernel_ssize_t;
typedef __kernel_long_t __kernel_ptrdiff_t;




typedef struct {
 int val[2];
} __kernel_fsid_t;





typedef __kernel_long_t __kernel_off_t;
typedef long long __kernel_loff_t;
typedef __kernel_long_t __kernel_time_t;
typedef __kernel_long_t __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef char * __kernel_caddr_t;
typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;
# 10 "./arch/arm64/include/uapi/asm/posix_types.h" 2
# 37 "./include/uapi/linux/posix_types.h" 2
# 15 "./include/uapi/linux/types.h" 2
# 29 "./include/uapi/linux/types.h"
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;
typedef __u64 __le64;
typedef __u64 __be64;

typedef __u16 __sum16;
typedef __u32 __wsum;
# 7 "./include/linux/types.h" 2






typedef __u32 __kernel_dev_t;

typedef __kernel_fd_set fd_set;
typedef __kernel_dev_t dev_t;
typedef __kernel_ino_t ino_t;
typedef __kernel_mode_t mode_t;
typedef unsigned short umode_t;
typedef __u32 nlink_t;
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
# 55 "./include/linux/types.h"
typedef __kernel_size_t size_t;




typedef __kernel_ssize_t ssize_t;




typedef __kernel_ptrdiff_t ptrdiff_t;




typedef __kernel_time_t time_t;




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




typedef __u8 u_int8_t;
typedef __s8 int8_t;
typedef __u16 u_int16_t;
typedef __s16 int16_t;
typedef __u32 u_int32_t;
typedef __s32 int32_t;



typedef __u8 uint8_t;
typedef __u16 uint16_t;
typedef __u32 uint32_t;


typedef __u64 uint64_t;
typedef __u64 u_int64_t;
typedef __s64 int64_t;
# 134 "./include/linux/types.h"
typedef unsigned long sector_t;
typedef unsigned long blkcnt_t;
# 153 "./include/linux/types.h"
typedef u64 dma_addr_t;




typedef unsigned gfp_t;
typedef unsigned fmode_t;


typedef u64 phys_addr_t;




typedef phys_addr_t resource_size_t;





typedef unsigned long irq_hw_number_t;

typedef struct {
 int counter;
} atomic_t;


typedef struct {
 long counter;
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
# 223 "./include/linux/types.h"
struct callback_head {
 struct callback_head *next;
 void (*func)(struct callback_head *head);
} __attribute__((aligned(sizeof(void *))));


typedef void (*rcu_callback_t)(struct callback_head *head);
typedef void (*call_rcu_func_t)(struct callback_head *head, rcu_callback_t func);
# 6 "./include/linux/list.h" 2

# 1 "./include/linux/poison.h" 1
# 8 "./include/linux/list.h" 2
# 1 "./include/uapi/linux/const.h" 1
# 9 "./include/linux/list.h" 2
# 1 "./include/linux/kernel.h" 1





# 1 "/usr/lib/gcc/aarch64-linux-gnu/8/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/aarch64-linux-gnu/8/include/stdarg.h" 3 4

# 40 "/usr/lib/gcc/aarch64-linux-gnu/8/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 99 "/usr/lib/gcc/aarch64-linux-gnu/8/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 7 "./include/linux/kernel.h" 2
# 1 "./include/linux/linkage.h" 1





# 1 "./include/linux/stringify.h" 1
# 7 "./include/linux/linkage.h" 2
# 1 "./include/linux/export.h" 1
# 27 "./include/linux/export.h"

# 27 "./include/linux/export.h"
struct kernel_symbol
{
 unsigned long value;
 const char *name;
};


extern struct module __this_module;
# 8 "./include/linux/linkage.h" 2
# 1 "./arch/arm64/include/asm/linkage.h" 1
# 9 "./include/linux/linkage.h" 2
# 8 "./include/linux/kernel.h" 2


# 1 "./include/linux/compiler.h" 1
# 180 "./include/linux/compiler.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline))
void __read_once_size(const volatile void *p, void *res, int size)
{
 ({ switch (size) { case 1: *(__u8 *)res = *(volatile __u8 *)p; break; case 2: *(__u16 *)res = *(volatile __u16 *)p; break; case 4: *(__u32 *)res = *(volatile __u32 *)p; break; case 8: *(__u64 *)res = *(volatile __u64 *)p; break; default: __asm__ __volatile__("": : :"memory"); __builtin_memcpy((void *)res, (const void *)p, size); __asm__ __volatile__("": : :"memory"); } });
}
# 199 "./include/linux/compiler.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline))
void __read_once_size_nocheck(const volatile void *p, void *res, int size)
{
 ({ switch (size) { case 1: *(__u8 *)res = *(volatile __u8 *)p; break; case 2: *(__u16 *)res = *(volatile __u16 *)p; break; case 4: *(__u32 *)res = *(volatile __u32 *)p; break; case 8: *(__u64 *)res = *(volatile __u64 *)p; break; default: __asm__ __volatile__("": : :"memory"); __builtin_memcpy((void *)res, (const void *)p, size); __asm__ __volatile__("": : :"memory"); } });
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void __write_once_size(volatile void *p, void *res, int size)
{
 switch (size) {
 case 1: *(volatile __u8 *)p = *(__u8 *)res; break;
 case 2: *(volatile __u16 *)p = *(__u16 *)res; break;
 case 4: *(volatile __u32 *)p = *(__u32 *)res; break;
 case 8: *(volatile __u64 *)p = *(__u64 *)res; break;
 default:
  __asm__ __volatile__("": : :"memory");
  __builtin_memcpy((void *)p, (const void *)res, size);
  __asm__ __volatile__("": : :"memory");
 }
}
# 242 "./include/linux/compiler.h"
# 1 "./arch/arm64/include/asm/barrier.h" 1
# 48 "./arch/arm64/include/asm/barrier.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long array_index_mask_nospec(unsigned long idx,
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
# 143 "./arch/arm64/include/asm/barrier.h"
# 1 "./include/asm-generic/barrier.h" 1
# 20 "./include/asm-generic/barrier.h"
# 1 "./include/linux/compiler.h" 1
# 21 "./include/asm-generic/barrier.h" 2
# 144 "./arch/arm64/include/asm/barrier.h" 2
# 243 "./include/linux/compiler.h" 2
# 11 "./include/linux/kernel.h" 2
# 1 "./include/linux/bitops.h" 1



# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 5 "./include/linux/bitops.h" 2
# 29 "./include/linux/bitops.h"
extern unsigned int __sw_hweight8(unsigned int w);
extern unsigned int __sw_hweight16(unsigned int w);
extern unsigned int __sw_hweight32(unsigned int w);
extern unsigned long __sw_hweight64(__u64 w);





# 1 "./arch/arm64/include/asm/bitops.h" 1
# 29 "./arch/arm64/include/asm/bitops.h"
extern void set_bit(int nr, volatile unsigned long *p);
extern void clear_bit(int nr, volatile unsigned long *p);
extern void change_bit(int nr, volatile unsigned long *p);
extern int test_and_set_bit(int nr, volatile unsigned long *p);
extern int test_and_clear_bit(int nr, volatile unsigned long *p);
extern int test_and_change_bit(int nr, volatile unsigned long *p);

# 1 "./include/asm-generic/bitops/builtin-__ffs.h" 1
# 11 "./include/asm-generic/bitops/builtin-__ffs.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long __ffs(unsigned long word)
{
 return __builtin_ctzl(word);
}
# 37 "./arch/arm64/include/asm/bitops.h" 2
# 1 "./include/asm-generic/bitops/builtin-ffs.h" 1
# 13 "./include/asm-generic/bitops/builtin-ffs.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) int ffs(int x)
{
 return __builtin_ffs(x);
}
# 38 "./arch/arm64/include/asm/bitops.h" 2
# 1 "./include/asm-generic/bitops/builtin-__fls.h" 1
# 11 "./include/asm-generic/bitops/builtin-__fls.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long __fls(unsigned long word)
{
 return (sizeof(word) * 8) - 1 - __builtin_clzl(word);
}
# 39 "./arch/arm64/include/asm/bitops.h" 2
# 1 "./include/asm-generic/bitops/builtin-fls.h" 1
# 12 "./include/asm-generic/bitops/builtin-fls.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) int fls(int x)
{
 return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
}
# 40 "./arch/arm64/include/asm/bitops.h" 2

# 1 "./include/asm-generic/bitops/ffz.h" 1
# 42 "./arch/arm64/include/asm/bitops.h" 2
# 1 "./include/asm-generic/bitops/fls64.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "./include/asm-generic/bitops/fls64.h" 2
# 27 "./include/asm-generic/bitops/fls64.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) int fls64(__u64 x)
{
 if (x == 0)
  return 0;
 return __fls(x) + 1;
}
# 43 "./arch/arm64/include/asm/bitops.h" 2
# 1 "./include/asm-generic/bitops/find.h" 1
# 15 "./include/asm-generic/bitops/find.h"
extern unsigned long find_next_bit(const unsigned long *addr, unsigned long
  size, unsigned long offset);
# 29 "./include/asm-generic/bitops/find.h"
extern unsigned long find_next_zero_bit(const unsigned long *addr, unsigned
  long size, unsigned long offset);
# 44 "./arch/arm64/include/asm/bitops.h" 2

# 1 "./include/asm-generic/bitops/sched.h" 1





# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 7 "./include/asm-generic/bitops/sched.h" 2






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int sched_find_first_bit(const unsigned long *b)
{

 if (b[0])
  return __ffs(b[0]);
 return __ffs(b[1]) + 64;
# 30 "./include/asm-generic/bitops/sched.h"
}
# 46 "./arch/arm64/include/asm/bitops.h" 2
# 1 "./include/asm-generic/bitops/hweight.h" 1




# 1 "./include/asm-generic/bitops/arch_hweight.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "./include/asm-generic/bitops/arch_hweight.h" 2

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int __arch_hweight32(unsigned int w)
{
 return __sw_hweight32(w);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int __arch_hweight16(unsigned int w)
{
 return __sw_hweight16(w);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int __arch_hweight8(unsigned int w)
{
 return __sw_hweight8(w);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __arch_hweight64(__u64 w)
{
 return __sw_hweight64(w);
}
# 6 "./include/asm-generic/bitops/hweight.h" 2
# 1 "./include/asm-generic/bitops/const_hweight.h" 1
# 7 "./include/asm-generic/bitops/hweight.h" 2
# 47 "./arch/arm64/include/asm/bitops.h" 2
# 1 "./include/asm-generic/bitops/lock.h" 1
# 48 "./arch/arm64/include/asm/bitops.h" 2

# 1 "./include/asm-generic/bitops/non-atomic.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "./include/asm-generic/bitops/non-atomic.h" 2
# 16 "./include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __set_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);

 *p |= mask;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __clear_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);

 *p &= ~mask;
}
# 41 "./include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __change_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);

 *p ^= mask;
}
# 58 "./include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __test_and_set_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);
 unsigned long old = *p;

 *p = old | mask;
 return (old & mask) != 0;
}
# 77 "./include/asm-generic/bitops/non-atomic.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __test_and_clear_bit(int nr, volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);
 unsigned long old = *p;

 *p = old & ~mask;
 return (old & mask) != 0;
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __test_and_change_bit(int nr,
         volatile unsigned long *addr)
{
 unsigned long mask = (1UL << ((nr) % 64));
 unsigned long *p = ((unsigned long *)addr) + ((nr) / 64);
 unsigned long old = *p;

 *p = old ^ mask;
 return (old & mask) != 0;
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int test_bit(int nr, const volatile unsigned long *addr)
{
 return 1UL & (addr[((nr) / 64)] >> (nr & (64 -1)));
}
# 50 "./arch/arm64/include/asm/bitops.h" 2
# 1 "./include/asm-generic/bitops/le.h" 1




# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 6 "./include/asm-generic/bitops/le.h" 2
# 1 "./arch/arm64/include/uapi/asm/byteorder.h" 1
# 23 "./arch/arm64/include/uapi/asm/byteorder.h"
# 1 "./include/linux/byteorder/little_endian.h" 1




# 1 "./include/uapi/linux/byteorder/little_endian.h" 1
# 13 "./include/uapi/linux/byteorder/little_endian.h"
# 1 "./include/linux/swab.h" 1




# 1 "./include/uapi/linux/swab.h" 1






# 1 "./arch/arm64/include/generated/uapi/asm/swab.h" 1
# 1 "./include/uapi/asm-generic/swab.h" 1
# 1 "./arch/arm64/include/generated/uapi/asm/swab.h" 2
# 8 "./include/uapi/linux/swab.h" 2
# 47 "./include/uapi/linux/swab.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((__const__)) __u16 __fswab16(__u16 val)
{



 return ((__u16)( (((__u16)(val) & (__u16)0x00ffU) << 8) | (((__u16)(val) & (__u16)0xff00U) >> 8)));

}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((__const__)) __u32 __fswab32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x000000ffUL) << 24) | (((__u32)(val) & (__u32)0x0000ff00UL) << 8) | (((__u32)(val) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(val) & (__u32)0xff000000UL) >> 24)));

}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((__const__)) __u64 __fswab64(__u64 val)
{







 return ((__u64)( (((__u64)(val) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(val) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(val) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(val) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(val) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(val) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(val) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(val) & (__u64)0xff00000000000000ULL) >> 56)));

}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((__const__)) __u32 __fswahw32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x0000ffffUL) << 16) | (((__u32)(val) & (__u32)0xffff0000UL) >> 16)));

}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((__const__)) __u32 __fswahb32(__u32 val)
{



 return ((__u32)( (((__u32)(val) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(val) & (__u32)0xff00ff00UL) >> 8)));

}
# 161 "./include/uapi/linux/swab.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __u16 __swab16p(const __u16 *p)
{



 return (__builtin_constant_p((__u16)(*p)) ? ((__u16)( (((__u16)(*p) & (__u16)0x00ffU) << 8) | (((__u16)(*p) & (__u16)0xff00U) >> 8))) : __fswab16(*p));

}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __u32 __swab32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x000000ffUL) << 24) | (((__u32)(*p) & (__u32)0x0000ff00UL) << 8) | (((__u32)(*p) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(*p) & (__u32)0xff000000UL) >> 24))) : __fswab32(*p));

}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __u64 __swab64p(const __u64 *p)
{



 return (__builtin_constant_p((__u64)(*p)) ? ((__u64)( (((__u64)(*p) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(*p) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(*p) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(*p) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(*p) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(*p) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(*p) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(*p) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(*p));

}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __u32 __swahw32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x0000ffffUL) << 16) | (((__u32)(*p) & (__u32)0xffff0000UL) >> 16))) : __fswahw32(*p));

}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __u32 __swahb32p(const __u32 *p)
{



 return (__builtin_constant_p((__u32)(*p)) ? ((__u32)( (((__u32)(*p) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(*p) & (__u32)0xff00ff00UL) >> 8))) : __fswahb32(*p));

}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __swab16s(__u16 *p)
{



 *p = __swab16p(p);

}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void __swab32s(__u32 *p)
{



 *p = __swab32p(p);

}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void __swab64s(__u64 *p)
{



 *p = __swab64p(p);

}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __swahw32s(__u32 *p)
{



 *p = __swahw32p(p);

}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __swahb32s(__u32 *p)
{



 *p = __swahb32p(p);

}
# 6 "./include/linux/swab.h" 2
# 14 "./include/uapi/linux/byteorder/little_endian.h" 2
# 44 "./include/uapi/linux/byteorder/little_endian.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __le64 __cpu_to_le64p(const __u64 *p)
{
 return ( __le64)*p;
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __u64 __le64_to_cpup(const __le64 *p)
{
 return ( __u64)*p;
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __le32 __cpu_to_le32p(const __u32 *p)
{
 return ( __le32)*p;
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __u32 __le32_to_cpup(const __le32 *p)
{
 return ( __u32)*p;
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __le16 __cpu_to_le16p(const __u16 *p)
{
 return ( __le16)*p;
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __u16 __le16_to_cpup(const __le16 *p)
{
 return ( __u16)*p;
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __be64 __cpu_to_be64p(const __u64 *p)
{
 return ( __be64)__swab64p(p);
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __u64 __be64_to_cpup(const __be64 *p)
{
 return __swab64p((__u64 *)p);
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __be32 __cpu_to_be32p(const __u32 *p)
{
 return ( __be32)__swab32p(p);
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __u32 __be32_to_cpup(const __be32 *p)
{
 return __swab32p((__u32 *)p);
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __be16 __cpu_to_be16p(const __u16 *p)
{
 return ( __be16)__swab16p(p);
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) __u16 __be16_to_cpup(const __be16 *p)
{
 return __swab16p((__u16 *)p);
}
# 6 "./include/linux/byteorder/little_endian.h" 2





# 1 "./include/linux/byteorder/generic.h" 1
# 144 "./include/linux/byteorder/generic.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void le16_add_cpu(__le16 *var, u16 val)
{
 *var = (( __le16)(__u16)((( __u16)(__le16)(*var)) + val));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void le32_add_cpu(__le32 *var, u32 val)
{
 *var = (( __le32)(__u32)((( __u32)(__le32)(*var)) + val));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void le64_add_cpu(__le64 *var, u64 val)
{
 *var = (( __le64)(__u64)((( __u64)(__le64)(*var)) + val));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void be16_add_cpu(__be16 *var, u16 val)
{
 *var = (( __be16)(__builtin_constant_p((__u16)(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val))) ? ((__u16)( (((__u16)(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val)) & (__u16)0x00ffU) << 8) | (((__u16)(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val)) & (__u16)0xff00U) >> 8))) : __fswab16(((__builtin_constant_p((__u16)(( __u16)(__be16)(*var))) ? ((__u16)( (((__u16)(( __u16)(__be16)(*var)) & (__u16)0x00ffU) << 8) | (((__u16)(( __u16)(__be16)(*var)) & (__u16)0xff00U) >> 8))) : __fswab16(( __u16)(__be16)(*var))) + val))));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void be32_add_cpu(__be32 *var, u32 val)
{
 *var = (( __be32)(__builtin_constant_p((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val))) ? ((__u32)( (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x000000ffUL) << 24) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val)) & (__u32)0xff000000UL) >> 24))) : __fswab32(((__builtin_constant_p((__u32)(( __u32)(__be32)(*var))) ? ((__u32)( (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x000000ffUL) << 24) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x0000ff00UL) << 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(( __u32)(__be32)(*var)) & (__u32)0xff000000UL) >> 24))) : __fswab32(( __u32)(__be32)(*var))) + val))));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void be64_add_cpu(__be64 *var, u64 val)
{
 *var = (( __be64)(__builtin_constant_p((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val))) ? ((__u64)( (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(((__builtin_constant_p((__u64)(( __u64)(__be64)(*var))) ? ((__u64)( (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000000000ffULL) << 56) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000000000ff00ULL) << 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000000000ff0000ULL) << 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(( __u64)(__be64)(*var)) & (__u64)0xff00000000000000ULL) >> 56))) : __fswab64(( __u64)(__be64)(*var))) + val))));
}
# 12 "./include/linux/byteorder/little_endian.h" 2
# 24 "./arch/arm64/include/uapi/asm/byteorder.h" 2
# 7 "./include/asm-generic/bitops/le.h" 2





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long find_next_zero_bit_le(const void *addr,
  unsigned long size, unsigned long offset)
{
 return find_next_zero_bit(addr, size, offset);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long find_next_bit_le(const void *addr,
  unsigned long size, unsigned long offset)
{
 return find_next_bit(addr, size, offset);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long find_first_zero_bit_le(const void *addr,
  unsigned long size)
{
 return find_next_zero_bit((addr), (size), 0);
}
# 53 "./include/asm-generic/bitops/le.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int test_bit_le(int nr, const void *addr)
{
 return test_bit(nr ^ 0, addr);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void set_bit_le(int nr, void *addr)
{
 set_bit(nr ^ 0, addr);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void clear_bit_le(int nr, void *addr)
{
 clear_bit(nr ^ 0, addr);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __set_bit_le(int nr, void *addr)
{
 __set_bit(nr ^ 0, addr);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __clear_bit_le(int nr, void *addr)
{
 __clear_bit(nr ^ 0, addr);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int test_and_set_bit_le(int nr, void *addr)
{
 return test_and_set_bit(nr ^ 0, addr);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int test_and_clear_bit_le(int nr, void *addr)
{
 return test_and_clear_bit(nr ^ 0, addr);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __test_and_set_bit_le(int nr, void *addr)
{
 return __test_and_set_bit(nr ^ 0, addr);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __test_and_clear_bit_le(int nr, void *addr)
{
 return __test_and_clear_bit(nr ^ 0, addr);
}
# 51 "./arch/arm64/include/asm/bitops.h" 2
# 39 "./include/linux/bitops.h" 2
# 62 "./include/linux/bitops.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int get_bitmask_order(unsigned int count)
{
 int order;

 order = fls(count);
 return order;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long hweight_long(unsigned long w)
{
 return sizeof(w) == 4 ? (__builtin_constant_p(w) ? ((((unsigned int) ((!!((w) & (1ULL << 0))) + (!!((w) & (1ULL << 1))) + (!!((w) & (1ULL << 2))) + (!!((w) & (1ULL << 3))) + (!!((w) & (1ULL << 4))) + (!!((w) & (1ULL << 5))) + (!!((w) & (1ULL << 6))) + (!!((w) & (1ULL << 7))))) + ((unsigned int) ((!!(((w) >> 8) & (1ULL << 0))) + (!!(((w) >> 8) & (1ULL << 1))) + (!!(((w) >> 8) & (1ULL << 2))) + (!!(((w) >> 8) & (1ULL << 3))) + (!!(((w) >> 8) & (1ULL << 4))) + (!!(((w) >> 8) & (1ULL << 5))) + (!!(((w) >> 8) & (1ULL << 6))) + (!!(((w) >> 8) & (1ULL << 7)))))) + (((unsigned int) ((!!(((w) >> 16) & (1ULL << 0))) + (!!(((w) >> 16) & (1ULL << 1))) + (!!(((w) >> 16) & (1ULL << 2))) + (!!(((w) >> 16) & (1ULL << 3))) + (!!(((w) >> 16) & (1ULL << 4))) + (!!(((w) >> 16) & (1ULL << 5))) + (!!(((w) >> 16) & (1ULL << 6))) + (!!(((w) >> 16) & (1ULL << 7))))) + ((unsigned int) ((!!((((w) >> 16) >> 8) & (1ULL << 0))) + (!!((((w) >> 16) >> 8) & (1ULL << 1))) + (!!((((w) >> 16) >> 8) & (1ULL << 2))) + (!!((((w) >> 16) >> 8) & (1ULL << 3))) + (!!((((w) >> 16) >> 8) & (1ULL << 4))) + (!!((((w) >> 16) >> 8) & (1ULL << 5))) + (!!((((w) >> 16) >> 8) & (1ULL << 6))) + (!!((((w) >> 16) >> 8) & (1ULL << 7))))))) : __arch_hweight32(w)) : (__builtin_constant_p(w) ? (((((unsigned int) ((!!((w) & (1ULL << 0))) + (!!((w) & (1ULL << 1))) + (!!((w) & (1ULL << 2))) + (!!((w) & (1ULL << 3))) + (!!((w) & (1ULL << 4))) + (!!((w) & (1ULL << 5))) + (!!((w) & (1ULL << 6))) + (!!((w) & (1ULL << 7))))) + ((unsigned int) ((!!(((w) >> 8) & (1ULL << 0))) + (!!(((w) >> 8) & (1ULL << 1))) + (!!(((w) >> 8) & (1ULL << 2))) + (!!(((w) >> 8) & (1ULL << 3))) + (!!(((w) >> 8) & (1ULL << 4))) + (!!(((w) >> 8) & (1ULL << 5))) + (!!(((w) >> 8) & (1ULL << 6))) + (!!(((w) >> 8) & (1ULL << 7)))))) + (((unsigned int) ((!!(((w) >> 16) & (1ULL << 0))) + (!!(((w) >> 16) & (1ULL << 1))) + (!!(((w) >> 16) & (1ULL << 2))) + (!!(((w) >> 16) & (1ULL << 3))) + (!!(((w) >> 16) & (1ULL << 4))) + (!!(((w) >> 16) & (1ULL << 5))) + (!!(((w) >> 16) & (1ULL << 6))) + (!!(((w) >> 16) & (1ULL << 7))))) + ((unsigned int) ((!!((((w) >> 16) >> 8) & (1ULL << 0))) + (!!((((w) >> 16) >> 8) & (1ULL << 1))) + (!!((((w) >> 16) >> 8) & (1ULL << 2))) + (!!((((w) >> 16) >> 8) & (1ULL << 3))) + (!!((((w) >> 16) >> 8) & (1ULL << 4))) + (!!((((w) >> 16) >> 8) & (1ULL << 5))) + (!!((((w) >> 16) >> 8) & (1ULL << 6))) + (!!((((w) >> 16) >> 8) & (1ULL << 7))))))) + ((((unsigned int) ((!!(((w) >> 32) & (1ULL << 0))) + (!!(((w) >> 32) & (1ULL << 1))) + (!!(((w) >> 32) & (1ULL << 2))) + (!!(((w) >> 32) & (1ULL << 3))) + (!!(((w) >> 32) & (1ULL << 4))) + (!!(((w) >> 32) & (1ULL << 5))) + (!!(((w) >> 32) & (1ULL << 6))) + (!!(((w) >> 32) & (1ULL << 7))))) + ((unsigned int) ((!!((((w) >> 32) >> 8) & (1ULL << 0))) + (!!((((w) >> 32) >> 8) & (1ULL << 1))) + (!!((((w) >> 32) >> 8) & (1ULL << 2))) + (!!((((w) >> 32) >> 8) & (1ULL << 3))) + (!!((((w) >> 32) >> 8) & (1ULL << 4))) + (!!((((w) >> 32) >> 8) & (1ULL << 5))) + (!!((((w) >> 32) >> 8) & (1ULL << 6))) + (!!((((w) >> 32) >> 8) & (1ULL << 7)))))) + (((unsigned int) ((!!((((w) >> 32) >> 16) & (1ULL << 0))) + (!!((((w) >> 32) >> 16) & (1ULL << 1))) + (!!((((w) >> 32) >> 16) & (1ULL << 2))) + (!!((((w) >> 32) >> 16) & (1ULL << 3))) + (!!((((w) >> 32) >> 16) & (1ULL << 4))) + (!!((((w) >> 32) >> 16) & (1ULL << 5))) + (!!((((w) >> 32) >> 16) & (1ULL << 6))) + (!!((((w) >> 32) >> 16) & (1ULL << 7))))) + ((unsigned int) ((!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 0))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 1))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 2))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 3))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 4))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 5))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 6))) + (!!(((((w) >> 32) >> 16) >> 8) & (1ULL << 7)))))))) : __arch_hweight64(w));
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __u64 rol64(__u64 word, unsigned int shift)
{
 return (word << shift) | (word >> (64 - shift));
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __u64 ror64(__u64 word, unsigned int shift)
{
 return (word >> shift) | (word << (64 - shift));
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __u32 rol32(__u32 word, unsigned int shift)
{
 return (word << shift) | (word >> ((-shift) & 31));
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __u32 ror32(__u32 word, unsigned int shift)
{
 return (word >> shift) | (word << (32 - shift));
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __u16 rol16(__u16 word, unsigned int shift)
{
 return (word << shift) | (word >> (16 - shift));
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __u16 ror16(__u16 word, unsigned int shift)
{
 return (word >> shift) | (word << (16 - shift));
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __u8 rol8(__u8 word, unsigned int shift)
{
 return (word << shift) | (word >> (8 - shift));
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __u8 ror8(__u8 word, unsigned int shift)
{
 return (word >> shift) | (word << (8 - shift));
}
# 162 "./include/linux/bitops.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __s32 sign_extend32(__u32 value, int index)
{
 __u8 shift = 31 - index;
 return (__s32)(value << shift) >> shift;
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __s64 sign_extend64(__u64 value, int index)
{
 __u8 shift = 63 - index;
 return (__s64)(value << shift) >> shift;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned fls_long(unsigned long l)
{
 if (sizeof(l) == 4)
  return fls(l);
 return fls64(l);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int get_count_order(unsigned int count)
{
 int order;

 order = fls(count) - 1;
 if (count & (count - 1))
  order++;
 return order;
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int get_count_order_long(unsigned long l)
{
 if (l == 0UL)
  return -1;
 else if (l & (l - 1UL))
  return (int)fls_long(l);
 else
  return (int)fls_long(l) - 1;
}
# 220 "./include/linux/bitops.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __ffs64(u64 word)
{






 return __ffs((unsigned long)word);
}
# 272 "./include/linux/bitops.h"
extern unsigned long find_last_bit(const unsigned long *addr,
       unsigned long size);
# 12 "./include/linux/kernel.h" 2
# 1 "./include/linux/log2.h" 1
# 25 "./include/linux/log2.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((const))
int __ilog2_u32(u32 n)
{
 return fls(n) - 1;
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((const))
int __ilog2_u64(u64 n)
{
 return fls64(n) - 1;
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((const))
bool is_power_of_2(unsigned long n)
{
 return (n != 0 && ((n & (n - 1)) == 0));
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((const))
unsigned long __roundup_pow_of_two(unsigned long n)
{
 return 1UL << fls_long(n - 1);
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((const))
unsigned long __rounddown_pow_of_two(unsigned long n)
{
 return 1UL << (fls_long(n) - 1);
}
# 197 "./include/linux/log2.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((__const__))
int __order_base_2(unsigned long n)
{
 return n > 1 ? ( __builtin_constant_p(n - 1) ? ( (n - 1) < 2 ? 0 : (n - 1) & (1ULL << 63) ? 63 : (n - 1) & (1ULL << 62) ? 62 : (n - 1) & (1ULL << 61) ? 61 : (n - 1) & (1ULL << 60) ? 60 : (n - 1) & (1ULL << 59) ? 59 : (n - 1) & (1ULL << 58) ? 58 : (n - 1) & (1ULL << 57) ? 57 : (n - 1) & (1ULL << 56) ? 56 : (n - 1) & (1ULL << 55) ? 55 : (n - 1) & (1ULL << 54) ? 54 : (n - 1) & (1ULL << 53) ? 53 : (n - 1) & (1ULL << 52) ? 52 : (n - 1) & (1ULL << 51) ? 51 : (n - 1) & (1ULL << 50) ? 50 : (n - 1) & (1ULL << 49) ? 49 : (n - 1) & (1ULL << 48) ? 48 : (n - 1) & (1ULL << 47) ? 47 : (n - 1) & (1ULL << 46) ? 46 : (n - 1) & (1ULL << 45) ? 45 : (n - 1) & (1ULL << 44) ? 44 : (n - 1) & (1ULL << 43) ? 43 : (n - 1) & (1ULL << 42) ? 42 : (n - 1) & (1ULL << 41) ? 41 : (n - 1) & (1ULL << 40) ? 40 : (n - 1) & (1ULL << 39) ? 39 : (n - 1) & (1ULL << 38) ? 38 : (n - 1) & (1ULL << 37) ? 37 : (n - 1) & (1ULL << 36) ? 36 : (n - 1) & (1ULL << 35) ? 35 : (n - 1) & (1ULL << 34) ? 34 : (n - 1) & (1ULL << 33) ? 33 : (n - 1) & (1ULL << 32) ? 32 : (n - 1) & (1ULL << 31) ? 31 : (n - 1) & (1ULL << 30) ? 30 : (n - 1) & (1ULL << 29) ? 29 : (n - 1) & (1ULL << 28) ? 28 : (n - 1) & (1ULL << 27) ? 27 : (n - 1) & (1ULL << 26) ? 26 : (n - 1) & (1ULL << 25) ? 25 : (n - 1) & (1ULL << 24) ? 24 : (n - 1) & (1ULL << 23) ? 23 : (n - 1) & (1ULL << 22) ? 22 : (n - 1) & (1ULL << 21) ? 21 : (n - 1) & (1ULL << 20) ? 20 : (n - 1) & (1ULL << 19) ? 19 : (n - 1) & (1ULL << 18) ? 18 : (n - 1) & (1ULL << 17) ? 17 : (n - 1) & (1ULL << 16) ? 16 : (n - 1) & (1ULL << 15) ? 15 : (n - 1) & (1ULL << 14) ? 14 : (n - 1) & (1ULL << 13) ? 13 : (n - 1) & (1ULL << 12) ? 12 : (n - 1) & (1ULL << 11) ? 11 : (n - 1) & (1ULL << 10) ? 10 : (n - 1) & (1ULL << 9) ? 9 : (n - 1) & (1ULL << 8) ? 8 : (n - 1) & (1ULL << 7) ? 7 : (n - 1) & (1ULL << 6) ? 6 : (n - 1) & (1ULL << 5) ? 5 : (n - 1) & (1ULL << 4) ? 4 : (n - 1) & (1ULL << 3) ? 3 : (n - 1) & (1ULL << 2) ? 2 : 1 ) : (sizeof(n - 1) <= 4) ? __ilog2_u32(n - 1) : __ilog2_u64(n - 1) ) + 1 : 0;
}
# 13 "./include/linux/kernel.h" 2
# 1 "./include/linux/typecheck.h" 1
# 14 "./include/linux/kernel.h" 2
# 1 "./include/linux/printk.h" 1





# 1 "./include/linux/init.h" 1
# 118 "./include/linux/init.h"
typedef int (*initcall_t)(void);
typedef void (*exitcall_t)(void);

extern initcall_t __con_initcall_start[], __con_initcall_end[];
extern initcall_t __security_initcall_start[], __security_initcall_end[];


typedef void (*ctor_fn_t)(void);


extern int do_one_initcall(initcall_t fn);
extern char __attribute__ ((__section__(".init.data"))) boot_command_line[];
extern char *saved_command_line;
extern unsigned int reset_devices;


void setup_arch(char **);
void prepare_namespace(void);
void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) load_default_modules(void);
int __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) init_rootfs(void);


extern bool rodata_enabled;


void mark_rodata_ro(void);


extern void (*late_time_init)(void);

extern bool initcall_debug;
# 7 "./include/linux/printk.h" 2
# 1 "./include/linux/kern_levels.h" 1
# 8 "./include/linux/printk.h" 2

# 1 "./include/linux/cache.h" 1




# 1 "./include/uapi/linux/kernel.h" 1




# 1 "./include/uapi/linux/sysinfo.h" 1







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
# 6 "./include/uapi/linux/kernel.h" 2
# 6 "./include/linux/cache.h" 2
# 1 "./arch/arm64/include/asm/cache.h" 1
# 19 "./arch/arm64/include/asm/cache.h"
# 1 "./arch/arm64/include/asm/cputype.h" 1
# 124 "./arch/arm64/include/asm/cputype.h"
# 1 "./arch/arm64/include/asm/sysreg.h" 1
# 468 "./arch/arm64/include/asm/sysreg.h"
asm(
"	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n"
"	.equ	.L__reg_num_x\\num, \\num\n"
"	.endr\n"
"	.equ	.L__reg_num_xzr, 31\n"
"\n"
"	.macro	mrs_s, rt, sreg\n"
 ".inst " "(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t"
"	.endm\n"
"\n"
"	.macro	msr_s, sreg, rt\n"
 ".inst " "(0xd5000000|(\\sreg)|(.L__reg_num_\\rt))" "\n\t"
"	.endm\n"
);
# 518 "./arch/arm64/include/asm/sysreg.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void config_sctlr_el1(u32 clear, u32 set)
{
 u32 val;

 val = ({ u64 __val; asm volatile("mrs %0, " "sctlr_el1" : "=r" (__val)); __val; });
 val &= ~clear;
 val |= set;
 do { u64 __val = (u64)(val); asm volatile("msr " "sctlr_el1" ", %x0" : : "rZ" (__val)); } while (0);
}
# 125 "./arch/arm64/include/asm/cputype.h" 2
# 133 "./arch/arm64/include/asm/cputype.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 __attribute__((__const__)) read_cpuid_id(void)
{
 return ({ u64 __val; asm volatile("mrs_s %0, " "(((3) << 19) | ((0) << 16) | ((0) << 12) | ((0) << 8) | ((0) << 5))" : "=r" (__val)); __val; });
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 __attribute__((__const__)) read_cpuid_mpidr(void)
{
 return ({ u64 __val; asm volatile("mrs_s %0, " "(((3) << 19) | ((0) << 16) | ((0) << 12) | ((0) << 8) | ((5) << 5))" : "=r" (__val)); __val; });
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int __attribute__((__const__)) read_cpuid_implementor(void)
{
 return (((read_cpuid_id()) & (0xff << 24)) >> 24);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int __attribute__((__const__)) read_cpuid_part_number(void)
{
 return (((read_cpuid_id()) & (0xfff << 4)) >> 4);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 __attribute__((__const__)) read_cpuid_cachetype(void)
{
 return ({ u64 __val; asm volatile("mrs_s %0, " "(((3) << 19) | ((3) << 16) | ((0) << 12) | ((0) << 8) | ((1) << 5))" : "=r" (__val)); __val; });
}
# 20 "./arch/arm64/include/asm/cache.h" 2
# 55 "./arch/arm64/include/asm/cache.h"
extern unsigned long __icache_flags;





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int icache_is_aliasing(void)
{
 return test_bit(0, &__icache_flags);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int icache_is_vpipt(void)
{
 return test_bit(1, &__icache_flags);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 cache_type_cwg(void)
{
 return (read_cpuid_cachetype() >> 24) & 15;
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int cache_line_size(void)
{
 u32 cwg = cache_type_cwg();
 return cwg ? 4 << cwg : (1 << 7);
}
# 7 "./include/linux/cache.h" 2
# 10 "./include/linux/printk.h" 2

extern const char linux_banner[];
extern const char linux_proc_banner[];



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int printk_get_level(const char *buffer)
{
 if (buffer[0] == '\001' && buffer[1]) {
  switch (buffer[1]) {
  case '0' ... '7':
  case 'd':
  case 'c':
   return buffer[1];
  }
 }
 return 0;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) const char *printk_skip_level(const char *buffer)
{
 if (printk_get_level(buffer))
  return buffer + 2;

 return buffer;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) const char *printk_skip_headers(const char *buffer)
{
 while (printk_get_level(buffer))
  buffer = printk_skip_level(buffer);

 return buffer;
}
# 63 "./include/linux/printk.h"
extern int console_printk[];






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void console_silent(void)
{
 (console_printk[0]) = 0;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void console_verbose(void)
{
 if ((console_printk[0]))
  (console_printk[0]) = 15;
}



extern char devkmsg_log_str[];
struct ctl_table;

struct va_format {
 const char *fmt;
 va_list *va;
};
# 146 "./include/linux/printk.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((format(printf, 1, 2))) __attribute__((__cold__))
void early_printk(const char *s, ...) { }



extern void printk_nmi_enter(void);
extern void printk_nmi_exit(void);
extern void printk_nmi_direct_enter(void);
extern void printk_nmi_direct_exit(void);
# 163 "./include/linux/printk.h"
 __attribute__((format(printf, 5, 0)))
int vprintk_emit(int facility, int level,
   const char *dict, size_t dictlen,
   const char *fmt, va_list args);

 __attribute__((format(printf, 1, 0)))
int vprintk(const char *fmt, va_list args);

 __attribute__((format(printf, 5, 6))) __attribute__((__cold__))
int printk_emit(int facility, int level,
  const char *dict, size_t dictlen,
  const char *fmt, ...);

 __attribute__((format(printf, 1, 2))) __attribute__((__cold__))
int printk(const char *fmt, ...);




__attribute__((format(printf, 1, 2))) __attribute__((__cold__)) int printk_deferred(const char *fmt, ...);






extern int __printk_ratelimit(const char *func);

extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
       unsigned int interval_msec);

extern int printk_delay_msec;
extern int dmesg_restrict;
extern int kptr_restrict;

extern int
devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write, void *buf,
     size_t *lenp, loff_t *ppos);

extern void wake_up_klogd(void);

char *log_buf_addr_get(void);
u32 log_buf_len_get(void);
void log_buf_vmcoreinfo_setup(void);
void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) setup_log_buf(int early);
__attribute__((format(printf, 1, 2))) void dump_stack_set_arch_desc(const char *fmt, ...);
void dump_stack_print_info(const char *log_lvl);
void show_regs_print_info(const char *log_lvl);
extern void printk_safe_init(void);
extern void printk_safe_flush(void);
extern void printk_safe_flush_on_panic(void);
# 287 "./include/linux/printk.h"
extern void dump_stack(void) __attribute__((__cold__));
# 479 "./include/linux/printk.h"
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




extern void print_hex_dump_bytes(const char *prefix_str, int prefix_type,
     const void *buf, size_t len);
# 524 "./include/linux/printk.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void print_hex_dump_debug(const char *prefix_str, int prefix_type,
     int rowsize, int groupsize,
     const void *buf, size_t len, bool ascii)
{
}
# 15 "./include/linux/kernel.h" 2
# 1 "./include/linux/build_bug.h" 1
# 16 "./include/linux/kernel.h" 2
# 202 "./include/linux/kernel.h"
struct completion;
struct pt_regs;
struct user;
# 230 "./include/linux/kernel.h"
  static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void ___might_sleep(const char *file, int line,
       int preempt_offset) { }
  static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __might_sleep(const char *file, int line,
       int preempt_offset) { }
# 277 "./include/linux/kernel.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 reciprocal_scale(u32 val, u32 ep_ro)
{
 return (u32)(((u64) val * ep_ro) >> 32);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void might_fault(void) { }


extern struct atomic_notifier_head panic_notifier_list;
extern long (*panic_blink)(int state);
__attribute__((format(printf, 1, 2)))
void panic(const char *fmt, ...) __attribute__((noreturn)) __attribute__((__cold__));
void nmi_panic(struct pt_regs *regs, const char *msg);
extern void oops_enter(void);
extern void oops_exit(void);
void print_oops_end_marker(void);
extern int oops_may_print(void);
void do_exit(long error_code) __attribute__((noreturn));
void complete_and_exit(struct completion *, long) __attribute__((noreturn));




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void refcount_error_report(struct pt_regs *regs, const char *err)
{ }



int __attribute__((warn_unused_result)) _kstrtoul(const char *s, unsigned int base, unsigned long *res);
int __attribute__((warn_unused_result)) _kstrtol(const char *s, unsigned int base, long *res);

int __attribute__((warn_unused_result)) kstrtoull(const char *s, unsigned int base, unsigned long long *res);
int __attribute__((warn_unused_result)) kstrtoll(const char *s, unsigned int base, long long *res);
# 332 "./include/linux/kernel.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtoul(const char *s, unsigned int base, unsigned long *res)
{




 if (sizeof(unsigned long) == sizeof(unsigned long long) &&
     __alignof__(unsigned long) == __alignof__(unsigned long long))
  return kstrtoull(s, base, (unsigned long long *)res);
 else
  return _kstrtoul(s, base, res);
}
# 361 "./include/linux/kernel.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtol(const char *s, unsigned int base, long *res)
{




 if (sizeof(long) == sizeof(long long) &&
     __alignof__(long) == __alignof__(long long))
  return kstrtoll(s, base, (long long *)res);
 else
  return _kstrtol(s, base, res);
}

int __attribute__((warn_unused_result)) kstrtouint(const char *s, unsigned int base, unsigned int *res);
int __attribute__((warn_unused_result)) kstrtoint(const char *s, unsigned int base, int *res);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtou64(const char *s, unsigned int base, u64 *res)
{
 return kstrtoull(s, base, res);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtos64(const char *s, unsigned int base, s64 *res)
{
 return kstrtoll(s, base, res);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtou32(const char *s, unsigned int base, u32 *res)
{
 return kstrtouint(s, base, res);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtos32(const char *s, unsigned int base, s32 *res)
{
 return kstrtoint(s, base, res);
}

int __attribute__((warn_unused_result)) kstrtou16(const char *s, unsigned int base, u16 *res);
int __attribute__((warn_unused_result)) kstrtos16(const char *s, unsigned int base, s16 *res);
int __attribute__((warn_unused_result)) kstrtou8(const char *s, unsigned int base, u8 *res);
int __attribute__((warn_unused_result)) kstrtos8(const char *s, unsigned int base, s8 *res);
int __attribute__((warn_unused_result)) kstrtobool(const char *s, bool *res);

int __attribute__((warn_unused_result)) kstrtoull_from_user(const char *s, size_t count, unsigned int base, unsigned long long *res);
int __attribute__((warn_unused_result)) kstrtoll_from_user(const char *s, size_t count, unsigned int base, long long *res);
int __attribute__((warn_unused_result)) kstrtoul_from_user(const char *s, size_t count, unsigned int base, unsigned long *res);
int __attribute__((warn_unused_result)) kstrtol_from_user(const char *s, size_t count, unsigned int base, long *res);
int __attribute__((warn_unused_result)) kstrtouint_from_user(const char *s, size_t count, unsigned int base, unsigned int *res);
int __attribute__((warn_unused_result)) kstrtoint_from_user(const char *s, size_t count, unsigned int base, int *res);
int __attribute__((warn_unused_result)) kstrtou16_from_user(const char *s, size_t count, unsigned int base, u16 *res);
int __attribute__((warn_unused_result)) kstrtos16_from_user(const char *s, size_t count, unsigned int base, s16 *res);
int __attribute__((warn_unused_result)) kstrtou8_from_user(const char *s, size_t count, unsigned int base, u8 *res);
int __attribute__((warn_unused_result)) kstrtos8_from_user(const char *s, size_t count, unsigned int base, s8 *res);
int __attribute__((warn_unused_result)) kstrtobool_from_user(const char *s, size_t count, bool *res);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtou64_from_user(const char *s, size_t count, unsigned int base, u64 *res)
{
 return kstrtoull_from_user(s, count, base, res);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtos64_from_user(const char *s, size_t count, unsigned int base, s64 *res)
{
 return kstrtoll_from_user(s, count, base, res);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtou32_from_user(const char *s, size_t count, unsigned int base, u32 *res)
{
 return kstrtouint_from_user(s, count, base, res);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kstrtos32_from_user(const char *s, size_t count, unsigned int base, s32 *res)
{
 return kstrtoint_from_user(s, count, base, res);
}



extern unsigned long simple_strtoul(const char *,char **,unsigned int);
extern long simple_strtol(const char *,char **,unsigned int);
extern unsigned long long simple_strtoull(const char *,char **,unsigned int);
extern long long simple_strtoll(const char *,char **,unsigned int);

extern int num_to_str(char *buf, int size, unsigned long long num);



extern __attribute__((format(printf, 2, 3))) int sprintf(char *buf, const char * fmt, ...);
extern __attribute__((format(printf, 2, 0))) int vsprintf(char *buf, const char *, va_list);
extern __attribute__((format(printf, 3, 4)))
int snprintf(char *buf, size_t size, const char *fmt, ...);
extern __attribute__((format(printf, 3, 0)))
int vsnprintf(char *buf, size_t size, const char *fmt, va_list args);
extern __attribute__((format(printf, 3, 4)))
int scnprintf(char *buf, size_t size, const char *fmt, ...);
extern __attribute__((format(printf, 3, 0)))
int vscnprintf(char *buf, size_t size, const char *fmt, va_list args);
extern __attribute__((format(printf, 2, 3))) __attribute__((__malloc__))
char *kasprintf(gfp_t gfp, const char *fmt, ...);
extern __attribute__((format(printf, 2, 0))) __attribute__((__malloc__))
char *kvasprintf(gfp_t gfp, const char *fmt, va_list args);
extern __attribute__((format(printf, 2, 0)))
const char *kvasprintf_const(gfp_t gfp, const char *fmt, va_list args);

extern __attribute__((format(scanf, 2, 3)))
int sscanf(const char *, const char *, ...);
extern __attribute__((format(scanf, 2, 0)))
int vsscanf(const char *, const char *, va_list);

extern int get_option(char **str, int *pint);
extern char *get_options(const char *str, int nints, int *ints);
extern unsigned long long memparse(const char *ptr, char **retptr);
extern bool parse_option_str(const char *str, const char *option);
extern char *next_arg(char *args, char **param, char **val);

extern int core_kernel_text(unsigned long addr);
extern int core_kernel_data(unsigned long addr);
extern int __kernel_text_address(unsigned long addr);
extern int kernel_text_address(unsigned long addr);
extern int func_ptr_is_kernel_text(void *ptr);

unsigned long int_sqrt(unsigned long);

extern void bust_spinlocks(int yes);
extern int oops_in_progress;
extern int panic_timeout;
extern int panic_on_oops;
extern int panic_on_unrecovered_nmi;
extern int panic_on_io_nmi;
extern int panic_on_warn;
extern int sysctl_panic_on_rcu_stall;
extern int sysctl_panic_on_stackoverflow;

extern bool crash_kexec_post_notifiers;






extern atomic_t panic_cpu;






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void set_arch_panic_timeout(int timeout, int arch_default_timeout)
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
} system_state;
# 554 "./include/linux/kernel.h"
struct taint_flag {
 char c_true;
 char c_false;
 bool module;
};

extern const struct taint_flag taint_flags[16];

extern const char hex_asc[];



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) char *hex_byte_pack(char *buf, u8 byte)
{
 *buf++ = hex_asc[((byte) & 0xf0) >> 4];
 *buf++ = hex_asc[((byte) & 0x0f)];
 return buf;
}

extern const char hex_asc_upper[];



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) char *hex_byte_pack_upper(char *buf, u8 byte)
{
 *buf++ = hex_asc_upper[((byte) & 0xf0) >> 4];
 *buf++ = hex_asc_upper[((byte) & 0x0f)];
 return buf;
}

extern int hex_to_bin(char ch);
extern int __attribute__((warn_unused_result)) hex2bin(u8 *dst, const char *src, size_t count);
extern char *bin2hex(char *dst, const void *src, size_t count);

bool mac_pton(const char *s, u8 *mac);
# 610 "./include/linux/kernel.h"
enum ftrace_dump_mode {
 DUMP_NONE,
 DUMP_ALL,
 DUMP_ORIG,
};
# 760 "./include/linux/kernel.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void tracing_start(void) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void tracing_stop(void) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void trace_dump_stack(int skip) { }

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void tracing_on(void) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void tracing_off(void) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int tracing_is_on(void) { return 0; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void tracing_snapshot(void) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void tracing_snapshot_alloc(void) { }

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((format(printf, 1, 2)))
int trace_printk(const char *fmt, ...)
{
 return 0;
}
static __attribute__((format(printf, 1, 0))) inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int
ftrace_vprintk(const char *fmt, va_list ap)
{
 return 0;
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
# 10 "./include/linux/list.h" 2
# 26 "./include/linux/list.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void INIT_LIST_HEAD(struct list_head *list)
{
 ({ union { typeof(list->next) __val; char __c[1]; } __u = { .__val = ( typeof(list->next)) (list) }; __write_once_size(&(list->next), __u.__c, sizeof(list->next)); __u.__val; });
 list->prev = list;
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool __list_add_valid(struct list_head *new,
    struct list_head *prev,
    struct list_head *next)
{
 return true;
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool __list_del_entry_valid(struct list_head *entry)
{
 return true;
}
# 56 "./include/linux/list.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __list_add(struct list_head *new,
         struct list_head *prev,
         struct list_head *next)
{
 if (!__list_add_valid(new, prev, next))
  return;

 next->prev = new;
 new->next = next;
 new->prev = prev;
 ({ union { typeof(prev->next) __val; char __c[1]; } __u = { .__val = ( typeof(prev->next)) (new) }; __write_once_size(&(prev->next), __u.__c, sizeof(prev->next)); __u.__val; });
}
# 77 "./include/linux/list.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_add(struct list_head *new, struct list_head *head)
{
 __list_add(new, head, head->next);
}
# 91 "./include/linux/list.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_add_tail(struct list_head *new, struct list_head *head)
{
 __list_add(new, head->prev, head);
}
# 103 "./include/linux/list.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __list_del(struct list_head * prev, struct list_head * next)
{
 next->prev = prev;
 ({ union { typeof(prev->next) __val; char __c[1]; } __u = { .__val = ( typeof(prev->next)) (next) }; __write_once_size(&(prev->next), __u.__c, sizeof(prev->next)); __u.__val; });
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __list_del_entry(struct list_head *entry)
{
 if (!__list_del_entry_valid(entry))
  return;

 __list_del(entry->prev, entry->next);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_del(struct list_head *entry)
{
 __list_del_entry(entry);
 entry->next = ((void *) 0x100 + (0xdead000000000000UL));
 entry->prev = ((void *) 0x200 + (0xdead000000000000UL));
}
# 137 "./include/linux/list.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_replace(struct list_head *old,
    struct list_head *new)
{
 new->next = old->next;
 new->next->prev = new;
 new->prev = old->prev;
 new->prev->next = new;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_replace_init(struct list_head *old,
     struct list_head *new)
{
 list_replace(old, new);
 INIT_LIST_HEAD(old);
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_del_init(struct list_head *entry)
{
 __list_del_entry(entry);
 INIT_LIST_HEAD(entry);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_move(struct list_head *list, struct list_head *head)
{
 __list_del_entry(list);
 list_add(list, head);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_move_tail(struct list_head *list,
      struct list_head *head)
{
 __list_del_entry(list);
 list_add_tail(list, head);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int list_is_last(const struct list_head *list,
    const struct list_head *head)
{
 return list->next == head;
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int list_empty(const struct list_head *head)
{
 return ({ union { typeof(head->next) __val; char __c[1]; } __u; if (1) __read_once_size(&(head->next), __u.__c, sizeof(head->next)); else __read_once_size_nocheck(&(head->next), __u.__c, sizeof(head->next)); do { } while (0); __u.__val; }) == head;
}
# 219 "./include/linux/list.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int list_empty_careful(const struct list_head *head)
{
 struct list_head *next = head->next;
 return (next == head) && (next == head->prev);
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_rotate_left(struct list_head *head)
{
 struct list_head *first;

 if (!list_empty(head)) {
  first = head->next;
  list_move_tail(first, head);
 }
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int list_is_singular(const struct list_head *head)
{
 return !list_empty(head) && (head->next == head->prev);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __list_cut_position(struct list_head *list,
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
# 274 "./include/linux/list.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_cut_position(struct list_head *list,
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

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __list_splice(const struct list_head *list,
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






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_splice(const struct list_head *list,
    struct list_head *head)
{
 if (!list_empty(list))
  __list_splice(list, head, head->next);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_splice_tail(struct list_head *list,
    struct list_head *head)
{
 if (!list_empty(list))
  __list_splice(list, head->prev, head);
}
# 333 "./include/linux/list.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_splice_init(struct list_head *list,
        struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head, head->next);
  INIT_LIST_HEAD(list);
 }
}
# 350 "./include/linux/list.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_splice_tail_init(struct list_head *list,
      struct list_head *head)
{
 if (!list_empty(list)) {
  __list_splice(list, head->prev, head);
  INIT_LIST_HEAD(list);
 }
}
# 628 "./include/linux/list.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void INIT_HLIST_NODE(struct hlist_node *h)
{
 h->next = ((void *)0);
 h->pprev = ((void *)0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int hlist_unhashed(const struct hlist_node *h)
{
 return !h->pprev;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int hlist_empty(const struct hlist_head *h)
{
 return !({ union { typeof(h->first) __val; char __c[1]; } __u; if (1) __read_once_size(&(h->first), __u.__c, sizeof(h->first)); else __read_once_size_nocheck(&(h->first), __u.__c, sizeof(h->first)); do { } while (0); __u.__val; });
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __hlist_del(struct hlist_node *n)
{
 struct hlist_node *next = n->next;
 struct hlist_node **pprev = n->pprev;

 ({ union { typeof(*pprev) __val; char __c[1]; } __u = { .__val = ( typeof(*pprev)) (next) }; __write_once_size(&(*pprev), __u.__c, sizeof(*pprev)); __u.__val; });
 if (next)
  next->pprev = pprev;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_del(struct hlist_node *n)
{
 __hlist_del(n);
 n->next = ((void *) 0x100 + (0xdead000000000000UL));
 n->pprev = ((void *) 0x200 + (0xdead000000000000UL));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_del_init(struct hlist_node *n)
{
 if (!hlist_unhashed(n)) {
  __hlist_del(n);
  INIT_HLIST_NODE(n);
 }
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_add_head(struct hlist_node *n, struct hlist_head *h)
{
 struct hlist_node *first = h->first;
 n->next = first;
 if (first)
  first->pprev = &n->next;
 ({ union { typeof(h->first) __val; char __c[1]; } __u = { .__val = ( typeof(h->first)) (n) }; __write_once_size(&(h->first), __u.__c, sizeof(h->first)); __u.__val; });
 n->pprev = &h->first;
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_add_before(struct hlist_node *n,
     struct hlist_node *next)
{
 n->pprev = next->pprev;
 n->next = next;
 next->pprev = &n->next;
 ({ union { typeof(*(n->pprev)) __val; char __c[1]; } __u = { .__val = ( typeof(*(n->pprev))) (n) }; __write_once_size(&(*(n->pprev)), __u.__c, sizeof(*(n->pprev))); __u.__val; });
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_add_behind(struct hlist_node *n,
        struct hlist_node *prev)
{
 n->next = prev->next;
 ({ union { typeof(prev->next) __val; char __c[1]; } __u = { .__val = ( typeof(prev->next)) (n) }; __write_once_size(&(prev->next), __u.__c, sizeof(prev->next)); __u.__val; });
 n->pprev = &prev->next;

 if (n->next)
  n->next->pprev = &n->next;
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_add_fake(struct hlist_node *n)
{
 n->pprev = &n->next;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool hlist_fake(struct hlist_node *h)
{
 return h->pprev == &h->next;
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool
hlist_is_singular_node(struct hlist_node *n, struct hlist_head *h)
{
 return !n->next && n->pprev == &h->first;
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_move_list(struct hlist_head *old,
       struct hlist_head *new)
{
 new->first = old->first;
 if (new->first)
  new->first->pprev = &new->first;
 old->first = ((void *)0);
}
# 10 "./include/linux/module.h" 2
# 1 "./include/linux/stat.h" 1





# 1 "./arch/arm64/include/asm/stat.h" 1
# 19 "./arch/arm64/include/asm/stat.h"
# 1 "./arch/arm64/include/uapi/asm/stat.h" 1
# 17 "./arch/arm64/include/uapi/asm/stat.h"
# 1 "./include/uapi/asm-generic/stat.h" 1
# 24 "./include/uapi/asm-generic/stat.h"
struct stat {
 unsigned long st_dev;
 unsigned long st_ino;
 unsigned int st_mode;
 unsigned int st_nlink;
 unsigned int st_uid;
 unsigned int st_gid;
 unsigned long st_rdev;
 unsigned long __pad1;
 long st_size;
 int st_blksize;
 int __pad2;
 long st_blocks;
 long st_atime;
 unsigned long st_atime_nsec;
 long st_mtime;
 unsigned long st_mtime_nsec;
 long st_ctime;
 unsigned long st_ctime_nsec;
 unsigned int __unused4;
 unsigned int __unused5;
};
# 17 "./arch/arm64/include/uapi/asm/stat.h" 2
# 20 "./arch/arm64/include/asm/stat.h" 2



# 1 "./arch/arm64/include/asm/compat.h" 1
# 25 "./arch/arm64/include/asm/compat.h"
# 1 "./include/linux/sched.h" 1
# 10 "./include/linux/sched.h"
# 1 "./include/uapi/linux/sched.h" 1
# 11 "./include/linux/sched.h" 2

# 1 "./arch/arm64/include/asm/current.h" 1
# 9 "./arch/arm64/include/asm/current.h"
struct task_struct;





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) struct task_struct *get_current(void)
{
 unsigned long sp_el0;

 asm ("mrs %0, sp_el0" : "=r" (sp_el0));

 return (struct task_struct *)sp_el0;
}
# 13 "./include/linux/sched.h" 2

# 1 "./include/linux/pid.h" 1




# 1 "./include/linux/rculist.h" 1
# 11 "./include/linux/rculist.h"
# 1 "./include/linux/rcupdate.h" 1
# 38 "./include/linux/rcupdate.h"
# 1 "./include/linux/atomic.h" 1




# 1 "./arch/arm64/include/asm/atomic.h" 1
# 27 "./arch/arm64/include/asm/atomic.h"
# 1 "./arch/arm64/include/asm/lse.h" 1
# 28 "./arch/arm64/include/asm/atomic.h" 2
# 36 "./arch/arm64/include/asm/atomic.h"
# 1 "./arch/arm64/include/asm/atomic_ll_sc.h" 1
# 113 "./arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic_add(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i)); } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_add_return(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_add_return_relaxed(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "_relaxed" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_add_return_acquire(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "_acquire" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_add_return_release(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "add" "_return" "_release" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "add" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_add(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_add_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_add_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_add_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "add" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "add" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic_sub(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i)); } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_sub_return(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_sub_return_relaxed(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "_relaxed" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_sub_return_acquire(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "_acquire" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_sub_return_release(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "sub" "_return" "_release" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%w0, %2\n" "	" "sub" "	%w0, %w0, %w3\n" "	st" "l" "xr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_sub(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_sub_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_sub_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_sub_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "sub" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "sub" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ;
# 124 "./arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic_and(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "and" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "and" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i)); } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_and(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_and_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_and_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_and_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "and" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "and" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic_andnot(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "andnot" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "bic" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i)); } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_andnot(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_andnot_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_andnot_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_andnot_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "andnot" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "bic" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic_or(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "or" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "orr" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i)); } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_or(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_or_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_or_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_or_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "or" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "orr" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic_xor(int i, atomic_t *v) { unsigned long tmp; int result; asm volatile("// atomic_" "xor" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%w0, %2\n" "	" "eor" "	%w0, %w0, %w3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i)); } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_xor(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_xor_relaxed(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_xor_acquire(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_fetch_xor_release(int i, atomic_t *v) { unsigned long tmp; int val, result; asm volatile("// atomic_fetch_" "xor" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%w0, %3\n" "	" "eor" "	%w1, %w0, %w4\n" "	st" "l" "xr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ;
# 207 "./arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic64_add(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "add" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i)); } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_add_return(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_add_return_relaxed(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "_relaxed" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_add_return_acquire(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "_acquire" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_add_return_release(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "add" "_return" "_release" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "add" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_add(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_add_relaxed(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_add_acquire(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_add_release(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "add" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "add" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic64_sub(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "sub" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i)); } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_sub_return(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_sub_return_relaxed(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "_relaxed" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_sub_return_acquire(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "_acquire" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_sub_return_release(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "sub" "_return" "_release" "\n" "	prfm	pstl1strm, %2\n" "1:	ld" "" "xr	%0, %2\n" "	" "sub" "	%0, %0, %3\n" "	st" "l" "xr	%w1, %0, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_sub(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_sub_relaxed(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_sub_acquire(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_sub_release(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "sub" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "sub" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ;
# 218 "./arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic64_and(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "and" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "and" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i)); } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_and(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_and_relaxed(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_and_acquire(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_and_release(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "and" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "and" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic64_andnot(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "andnot" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "bic" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i)); } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_andnot(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_andnot_relaxed(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_andnot_acquire(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_andnot_release(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "andnot" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "bic" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic64_or(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "or" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "orr" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i)); } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_or(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_or_relaxed(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_or_acquire(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_or_release(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "or" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "orr" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic64_xor(long i, atomic64_t *v) { long result; unsigned long tmp; asm volatile("// atomic64_" "xor" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxr	%0, %2\n" "	" "eor" "	%0, %0, %3\n" "	stxr	%w1, %0, %2\n" "	cbnz	%w1, 1b" : "=&r" (result), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i)); } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_xor(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "dmb ish" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_xor_relaxed(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "_relaxed" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : ); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_xor_acquire(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "_acquire" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "a" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ; static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic64_fetch_xor_release(long i, atomic64_t *v) { long result, val; unsigned long tmp; asm volatile("// atomic64_fetch_" "xor" "_release" "\n" "	prfm	pstl1strm, %3\n" "1:	ld" "" "xr	%0, %3\n" "	" "eor" "	%1, %0, %4\n" "	st" "l" "xr	%w2, %1, %3\n" "	cbnz	%w2, 1b\n" "	" "" : "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter) : "Ir" (i) : "memory"); return result; } ;






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long
atomic64_dec_if_positive(atomic64_t *v)
{
 long result;
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
;
# 277 "./arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_1(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : ); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_2(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : ); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_4(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : ); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_8(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : ); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_acq_1(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : "memory"); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_acq_2(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : "memory"); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_acq_4(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : "memory"); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_acq_8(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "a" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : "memory"); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_rel_1(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : "memory"); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_rel_2(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : "memory"); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_rel_4(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : "memory"); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_rel_8(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : "memory"); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_mb_1(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "b" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "b" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : "memory"); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_mb_2(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "h" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "h" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : "memory"); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_mb_4(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "w" "[oldval], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[oldval], %" "w" "[old]\n" "	cbnz	%" "w" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "w" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : "memory"); return oldval; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_case_mb_8(volatile void *ptr, unsigned long old, unsigned long new) { unsigned long tmp, oldval; asm volatile( "	prfm	pstl1strm, %[v]\n" "1:	ld" "" "xr" "" "\t%" "" "[oldval], %[v]\n" "	eor	%" "" "[tmp], %" "" "[oldval], %" "" "[old]\n" "	cbnz	%" "" "[tmp], 2f\n" "	st" "l" "xr" "" "\t%w[tmp], %" "" "[new], %[v]\n" "	cbnz	%w[tmp], 1b\n" "	" "dmb ish" "\n" "2:" : [tmp] "=&r" (tmp), [oldval] "=&r" (oldval), [v] "+Q" (*(unsigned long *)ptr) : [old] "Lr" (old), [new] "r" (new) : "memory"); return oldval; } ;
# 325 "./arch/arm64/include/asm/atomic_ll_sc.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long __cmpxchg_double(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { unsigned long tmp, ret; asm volatile("// __cmpxchg_double" "" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxp	%0, %1, %2\n" "	eor	%0, %0, %3\n" "	eor	%1, %1, %4\n" "	orr	%1, %0, %1\n" "	cbnz	%1, 2f\n" "	st" "" "xp	%w0, %5, %6, %2\n" "	cbnz	%w0, 1b\n" "	" "" "\n" "2:" : "=&r" (tmp), "=&r" (ret), "+Q" (*(unsigned long *)ptr) : "r" (old1), "r" (old2), "r" (new1), "r" (new2) : ); return ret; } ;
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long __cmpxchg_double_mb(unsigned long old1, unsigned long old2, unsigned long new1, unsigned long new2, volatile void *ptr) { unsigned long tmp, ret; asm volatile("// __cmpxchg_double" "_mb" "\n" "	prfm	pstl1strm, %2\n" "1:	ldxp	%0, %1, %2\n" "	eor	%0, %0, %3\n" "	eor	%1, %1, %4\n" "	orr	%1, %0, %1\n" "	cbnz	%1, 2f\n" "	st" "l" "xp	%w0, %5, %6, %2\n" "	cbnz	%w0, 1b\n" "	" "dmb ish" "\n" "2:" : "=&r" (tmp), "=&r" (ret), "+Q" (*(unsigned long *)ptr) : "r" (old1), "r" (old2), "r" (new1), "r" (new2) : "memory"); return ret; } ;
# 37 "./arch/arm64/include/asm/atomic.h" 2




# 1 "./arch/arm64/include/asm/cmpxchg.h" 1
# 21 "./arch/arm64/include/asm/cmpxchg.h"
# 1 "./include/linux/bug.h" 1




# 1 "./arch/arm64/include/asm/bug.h" 1
# 23 "./arch/arm64/include/asm/bug.h"
# 1 "./arch/arm64/include/asm/asm-bug.h" 1
# 19 "./arch/arm64/include/asm/asm-bug.h"
# 1 "./arch/arm64/include/asm/brk-imm.h" 1
# 20 "./arch/arm64/include/asm/asm-bug.h" 2
# 24 "./arch/arm64/include/asm/bug.h" 2
# 37 "./arch/arm64/include/asm/bug.h"
# 1 "./include/asm-generic/bug.h" 1
# 21 "./include/asm-generic/bug.h"
struct bug_entry {



 signed int bug_addr_disp;





 signed int file_disp;

 unsigned short line;

 unsigned short flags;
};
# 101 "./include/asm-generic/bug.h"
struct warn_args;
struct pt_regs;

void __warn(const char *file, int line, void *caller, unsigned taint,
     struct pt_regs *regs, struct warn_args *args);
# 38 "./arch/arm64/include/asm/bug.h" 2
# 6 "./include/linux/bug.h" 2



enum bug_trap_type {
 BUG_TRAP_TYPE_NONE = 0,
 BUG_TRAP_TYPE_WARN = 1,
 BUG_TRAP_TYPE_BUG = 2,
};

struct pt_regs;
# 34 "./include/linux/bug.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int is_warning_bug(const struct bug_entry *bug)
{
 return bug->flags & (1 << 0);
}

struct bug_entry *find_bug(unsigned long bugaddr);

enum bug_trap_type report_bug(unsigned long bug_addr, struct pt_regs *regs);


int is_valid_bugaddr(unsigned long addr);
# 60 "./include/linux/bug.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) bool check_data_corruption(bool v) { return v; }
# 22 "./arch/arm64/include/asm/cmpxchg.h" 2

# 1 "./arch/arm64/include/asm/atomic.h" 1
# 24 "./arch/arm64/include/asm/cmpxchg.h" 2
# 56 "./arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_1(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "b" "\t%" "w" "0, %2\n" "	st" "" "xr" "b" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : ); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_2(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "h" "\t%" "w" "0, %2\n" "	st" "" "xr" "h" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : ); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_4(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "w" "0, %2\n" "	st" "" "xr" "" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : ); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_8(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "" "0, %2\n" "	st" "" "xr" "" "\t%w1, %" "" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : ); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_acq_1(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr" "b" "\t%" "w" "0, %2\n" "	st" "" "xr" "b" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_acq_2(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr" "h" "\t%" "w" "0, %2\n" "	st" "" "xr" "h" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_acq_4(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr" "" "\t%" "w" "0, %2\n" "	st" "" "xr" "" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_acq_8(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "a" "xr" "" "\t%" "" "0, %2\n" "	st" "" "xr" "" "\t%w1, %" "" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_rel_1(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "b" "\t%" "w" "0, %2\n" "	st" "l" "xr" "b" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_rel_2(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "h" "\t%" "w" "0, %2\n" "	st" "l" "xr" "h" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_rel_4(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "w" "0, %2\n" "	st" "l" "xr" "" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_rel_8(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "" "0, %2\n" "	st" "l" "xr" "" "\t%w1, %" "" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_mb_1(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "b" "\t%" "w" "0, %2\n" "	st" "l" "xr" "b" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_mb_2(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "h" "\t%" "w" "0, %2\n" "	st" "l" "xr" "h" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_mb_4(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "w" "0, %2\n" "	st" "l" "xr" "" "\t%w1, %" "w" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : "memory"); return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_case_mb_8(unsigned long x, volatile void *ptr) { unsigned long ret, tmp; asm volatile("	prfm	pstl1strm, %2\n" "1:	ld" "" "xr" "" "\t%" "" "0, %2\n" "	st" "l" "xr" "" "\t%w1, %" "" "3, %2\n" "	cbnz	%w1, 1b\n" "	" "dmb ish" : "=&r" (ret), "=&r" (tmp), "+Q" (*(unsigned long *)ptr) : "r" (x) : "memory"); return ret; }
# 96 "./arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_1(x, ptr); case 2: return __xchg_case_2(x, ptr); case 4: return __xchg_case_4(x, ptr); case 8: return __xchg_case_8(x, ptr); default: do { bool __cond = !(!(1)); extern void __compiletime_assert_96(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_96(); do { } while (0); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_acq(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_acq_1(x, ptr); case 2: return __xchg_case_acq_2(x, ptr); case 4: return __xchg_case_acq_4(x, ptr); case 8: return __xchg_case_acq_8(x, ptr); default: do { bool __cond = !(!(1)); extern void __compiletime_assert_97(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_97(); do { } while (0); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_rel(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_rel_1(x, ptr); case 2: return __xchg_case_rel_2(x, ptr); case 4: return __xchg_case_rel_4(x, ptr); case 8: return __xchg_case_rel_8(x, ptr); default: do { bool __cond = !(!(1)); extern void __compiletime_assert_98(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_98(); do { } while (0); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __xchg_mb(unsigned long x, volatile void *ptr, int size) { switch (size) { case 1: return __xchg_case_mb_1(x, ptr); case 2: return __xchg_case_mb_2(x, ptr); case 4: return __xchg_case_mb_4(x, ptr); case 8: return __xchg_case_mb_8(x, ptr); default: do { bool __cond = !(!(1)); extern void __compiletime_assert_99(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_99(); do { } while (0); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
# 139 "./arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_1(ptr, (u8)old, new); case 2: return __cmpxchg_case_2(ptr, (u16)old, new); case 4: return __cmpxchg_case_4(ptr, old, new); case 8: return __cmpxchg_case_8(ptr, old, new); default: do { bool __cond = !(!(1)); extern void __compiletime_assert_139(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_139(); do { } while (0); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_acq(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_acq_1(ptr, (u8)old, new); case 2: return __cmpxchg_case_acq_2(ptr, (u16)old, new); case 4: return __cmpxchg_case_acq_4(ptr, old, new); case 8: return __cmpxchg_case_acq_8(ptr, old, new); default: do { bool __cond = !(!(1)); extern void __compiletime_assert_140(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_140(); do { } while (0); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_rel(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_rel_1(ptr, (u8)old, new); case 2: return __cmpxchg_case_rel_2(ptr, (u16)old, new); case 4: return __cmpxchg_case_rel_4(ptr, old, new); case 8: return __cmpxchg_case_rel_8(ptr, old, new); default: do { bool __cond = !(!(1)); extern void __compiletime_assert_141(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_141(); do { } while (0); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __cmpxchg_mb(volatile void *ptr, unsigned long old, unsigned long new, int size) { switch (size) { case 1: return __cmpxchg_case_mb_1(ptr, (u8)old, new); case 2: return __cmpxchg_case_mb_2(ptr, (u16)old, new); case 4: return __cmpxchg_case_mb_4(ptr, old, new); case 8: return __cmpxchg_case_mb_8(ptr, old, new); default: do { bool __cond = !(!(1)); extern void __compiletime_assert_142(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_142(); do { } while (0); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
# 243 "./arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __cmpwait_case_1(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "b" "\t%" "w" "[tmp], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	cbnz	%" "w" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr) : [val] "r" (val)); };
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __cmpwait_case_2(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "h" "\t%" "w" "[tmp], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	cbnz	%" "w" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr) : [val] "r" (val)); };
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __cmpwait_case_4(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "" "\t%" "w" "[tmp], %[v]\n" "	eor	%" "w" "[tmp], %" "w" "[tmp], %" "w" "[val]\n" "	cbnz	%" "w" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr) : [val] "r" (val)); };
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __cmpwait_case_8(volatile void *ptr, unsigned long val) { unsigned long tmp; asm volatile( "	sevl\n" "	wfe\n" "	ldxr" "" "\t%" "" "[tmp], %[v]\n" "	eor	%" "" "[tmp], %" "" "[tmp], %" "" "[val]\n" "	cbnz	%" "" "[tmp], 1f\n" "	wfe\n" "1:" : [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr) : [val] "r" (val)); };
# 271 "./arch/arm64/include/asm/cmpxchg.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __cmpwait(volatile void *ptr, unsigned long val, int size) { switch (size) { case 1: return __cmpwait_case_1(ptr, (u8)val); case 2: return __cmpwait_case_2(ptr, (u16)val); case 4: return __cmpwait_case_4(ptr, val); case 8: return __cmpwait_case_8(ptr, val); default: do { bool __cond = !(!(1)); extern void __compiletime_assert_271(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_271(); do { } while (0); } while (0); } do { ; asm volatile(""); __builtin_unreachable(); } while (0); }
# 42 "./arch/arm64/include/asm/atomic.h" 2
# 6 "./include/linux/atomic.h" 2
# 531 "./include/linux/atomic.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_add_unless(atomic_t *v, int a, int u)
{
 return ({ typeof((v)->counter) c, old; c = ({ union { typeof((v)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&((v)->counter), __u.__c, sizeof((v)->counter)); else __read_once_size_nocheck(&((v)->counter), __u.__c, sizeof((v)->counter)); do { } while (0); __u.__val; }); while (c != (u) && (old = ({ __typeof__(*(&(((v))->counter))) __ret; __ret = (__typeof__(*(&(((v))->counter)))) __cmpxchg_mb((&(((v))->counter)), (unsigned long)((c)), (unsigned long)((c + (a))), sizeof(*(&(((v))->counter)))); __ret; })) != c) c = old; c; }) != u;
}
# 587 "./include/linux/atomic.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_inc_not_zero_hint(atomic_t *v, int hint)
{
 int val, c = hint;


 if (!hint)
  return atomic_add_unless((v), 1, 0);

 do {
  val = ({ __typeof__(*(&((v)->counter))) __ret; __ret = (__typeof__(*(&((v)->counter)))) __cmpxchg_mb((&((v)->counter)), (unsigned long)((c)), (unsigned long)((c + 1)), sizeof(*(&((v)->counter)))); __ret; });
  if (val == c)
   return 1;
  c = val;
 } while (c);

 return 0;
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_inc_unless_negative(atomic_t *p)
{
 int v, v1;
 for (v = 0; v >= 0; v = v1) {
  v1 = ({ __typeof__(*(&((p)->counter))) __ret; __ret = (__typeof__(*(&((p)->counter)))) __cmpxchg_mb((&((p)->counter)), (unsigned long)((v)), (unsigned long)((v + 1)), sizeof(*(&((p)->counter)))); __ret; });
  if (__builtin_expect(!!(v1 == v), 1))
   return 1;
 }
 return 0;
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_dec_unless_positive(atomic_t *p)
{
 int v, v1;
 for (v = 0; v <= 0; v = v1) {
  v1 = ({ __typeof__(*(&((p)->counter))) __ret; __ret = (__typeof__(*(&((p)->counter)))) __cmpxchg_mb((&((p)->counter)), (unsigned long)((v)), (unsigned long)((v - 1)), sizeof(*(&((p)->counter)))); __ret; });
  if (__builtin_expect(!!(v1 == v), 1))
   return 1;
 }
 return 0;
}
# 640 "./include/linux/atomic.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_dec_if_positive(atomic_t *v)
{
 int c, old, dec;
 c = ({ union { typeof((v)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&((v)->counter), __u.__c, sizeof((v)->counter)); else __read_once_size_nocheck(&((v)->counter), __u.__c, sizeof((v)->counter)); do { } while (0); __u.__val; });
 for (;;) {
  dec = c - 1;
  if (__builtin_expect(!!(dec < 0), 0))
   break;
  old = ({ __typeof__(*(&(((v))->counter))) __ret; __ret = (__typeof__(*(&(((v))->counter)))) __cmpxchg_mb((&(((v))->counter)), (unsigned long)((c)), (unsigned long)((dec)), sizeof(*(&(((v))->counter)))); __ret; });
  if (__builtin_expect(!!(old == c), 1))
   break;
  c = old;
 }
 return dec;
}
# 1076 "./include/linux/atomic.h"
# 1 "./include/asm-generic/atomic-long.h" 1
# 12 "./include/asm-generic/atomic-long.h"
# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 13 "./include/asm-generic/atomic-long.h" 2
# 24 "./include/asm-generic/atomic-long.h"
typedef atomic64_t atomic_long_t;
# 45 "./include/asm-generic/atomic-long.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_read(const atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)({ union { typeof((v)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&((v)->counter), __u.__c, sizeof((v)->counter)); else __read_once_size_nocheck(&((v)->counter), __u.__c, sizeof((v)->counter)); do { } while (0); __u.__val; }); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_read_acquire(const atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)({ union { typeof(*&(v)->counter) __val; char __c[1]; } __u; do { bool __cond = !((sizeof(*&(v)->counter) == sizeof(char) || sizeof(*&(v)->counter) == sizeof(short) || sizeof(*&(v)->counter) == sizeof(int) || sizeof(*&(v)->counter) == sizeof(long))); extern void __compiletime_assert_46(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_46(); do { } while (0); } while (0); switch (sizeof(*&(v)->counter)) { case 1: asm volatile ("ldarb %w0, %1" : "=r" (*(__u8 *)__u.__c) : "Q" (*&(v)->counter) : "memory"); break; case 2: asm volatile ("ldarh %w0, %1" : "=r" (*(__u16 *)__u.__c) : "Q" (*&(v)->counter) : "memory"); break; case 4: asm volatile ("ldar %w0, %1" : "=r" (*(__u32 *)__u.__c) : "Q" (*&(v)->counter) : "memory"); break; case 8: asm volatile ("ldar %0, %1" : "=r" (*(__u64 *)__u.__c) : "Q" (*&(v)->counter) : "memory"); break; } __u.__val; }); }
# 57 "./include/asm-generic/atomic-long.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic_long_set(atomic_long_t *l, long i) { atomic64_t *v = (atomic64_t *)l; ({ union { typeof(((v)->counter)) __val; char __c[1]; } __u = { .__val = ( typeof(((v)->counter))) ((i)) }; __write_once_size(&(((v)->counter)), __u.__c, sizeof(((v)->counter))); __u.__val; }); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void atomic_long_set_release(atomic_long_t *l, long i) { atomic64_t *v = (atomic64_t *)l; do { union { typeof(*&(v)->counter) __val; char __c[1]; } __u = { .__val = ( typeof(*&(v)->counter)) ((i)) }; do { bool __cond = !((sizeof(*&(v)->counter) == sizeof(char) || sizeof(*&(v)->counter) == sizeof(short) || sizeof(*&(v)->counter) == sizeof(int) || sizeof(*&(v)->counter) == sizeof(long))); extern void __compiletime_assert_58(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_58(); do { } while (0); } while (0); switch (sizeof(*&(v)->counter)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&(v)->counter) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&(v)->counter) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&(v)->counter) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&(v)->counter) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); }
# 70 "./include/asm-generic/atomic-long.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_add_return(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_add_return(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_add_return_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_add_return_relaxed(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_add_return_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_add_return_acquire(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_add_return_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_add_return_release(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_sub_return(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_sub_return(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_sub_return_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_sub_return_relaxed(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_sub_return_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_sub_return_acquire(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_sub_return_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_sub_return_release(i, v); }
# 102 "./include/asm-generic/atomic-long.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_inc(atomic_long_t *l)
{
 atomic64_t *v = (atomic64_t *)l;

 atomic64_add(1, (v));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_dec(atomic_long_t *l)
{
 atomic64_t *v = (atomic64_t *)l;

 atomic64_sub(1, (v));
}
# 125 "./include/asm-generic/atomic-long.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_add(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_add_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add_relaxed(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_add_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add_acquire(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_add_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add_release(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_sub(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_sub_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub_relaxed(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_sub_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub_acquire(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_sub_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub_release(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_and(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_and(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_and_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_and_relaxed(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_and_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_and_acquire(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_and_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_and_release(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_andnot(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_andnot(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_andnot_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_andnot_relaxed(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_andnot_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_andnot_acquire(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_andnot_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_andnot_release(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_or(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_or(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_or_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_or_relaxed(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_or_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_or_acquire(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_or_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_or_release(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_xor(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_xor(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_xor_relaxed(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_xor_relaxed(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_xor_acquire(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_xor_acquire(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_xor_release(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_xor_release(i, v); }
# 161 "./include/asm-generic/atomic-long.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_inc(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_inc_relaxed(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add_relaxed(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_inc_acquire(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add_acquire(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_inc_release(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_add_release(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_dec(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_dec_relaxed(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub_relaxed(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_dec_acquire(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub_acquire(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_fetch_dec_release(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_fetch_sub_release(1, (v)); }
# 181 "./include/asm-generic/atomic-long.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_add(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; atomic64_add(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_sub(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; atomic64_sub(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_and(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; atomic64_and(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_andnot(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; atomic64_andnot(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_or(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; atomic64_or(i, v); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void atomic_long_xor(long i, atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; atomic64_xor(i, v); }



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_long_sub_and_test(long i, atomic_long_t *l)
{
 atomic64_t *v = (atomic64_t *)l;

 return (atomic64_sub_return((i), (v)) == 0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_long_dec_and_test(atomic_long_t *l)
{
 atomic64_t *v = (atomic64_t *)l;

 return (atomic64_sub_return(1, (v)) == 0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_long_inc_and_test(atomic_long_t *l)
{
 atomic64_t *v = (atomic64_t *)l;

 return (atomic64_add_return(1, (v)) == 0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int atomic_long_add_negative(long i, atomic_long_t *l)
{
 atomic64_t *v = (atomic64_t *)l;

 return (atomic64_add_return((i), (v)) < 0);
}
# 226 "./include/asm-generic/atomic-long.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_inc_return(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_add_return(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_inc_return_relaxed(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_add_return_relaxed(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_inc_return_acquire(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_add_return_acquire(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_inc_return_release(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_add_return_release(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_dec_return(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_sub_return(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_dec_return_relaxed(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_sub_return_relaxed(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_dec_return_acquire(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_sub_return_acquire(1, (v)); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_dec_return_release(atomic_long_t *l) { atomic64_t *v = (atomic64_t *)l; return (long)atomic64_sub_return_release(1, (v)); }



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long atomic_long_add_unless(atomic_long_t *l, long a, long u)
{
 atomic64_t *v = (atomic64_t *)l;

 return (long)(({ typeof((v)->counter) c, old; c = ({ union { typeof((v)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&((v)->counter), __u.__c, sizeof((v)->counter)); else __read_once_size_nocheck(&((v)->counter), __u.__c, sizeof((v)->counter)); do { } while (0); __u.__val; }); while (c != (u) && (old = ({ __typeof__(*(&(((v))->counter))) __ret; __ret = (__typeof__(*(&(((v))->counter)))) __cmpxchg_mb((&(((v))->counter)), (unsigned long)((c)), (unsigned long)((c + (a))), sizeof(*(&(((v))->counter)))); __ret; })) != c) c = old; c; }) != u);
}
# 1077 "./include/linux/atomic.h" 2
# 39 "./include/linux/rcupdate.h" 2
# 1 "./include/linux/irqflags.h" 1
# 16 "./include/linux/irqflags.h"
# 1 "./arch/arm64/include/asm/irqflags.h" 1
# 21 "./arch/arm64/include/asm/irqflags.h"
# 1 "./arch/arm64/include/asm/ptrace.h" 1
# 22 "./arch/arm64/include/asm/ptrace.h"
# 1 "./arch/arm64/include/uapi/asm/ptrace.h" 1
# 25 "./arch/arm64/include/uapi/asm/ptrace.h"
# 1 "./arch/arm64/include/asm/hwcap.h" 1
# 19 "./arch/arm64/include/asm/hwcap.h"
# 1 "./arch/arm64/include/uapi/asm/hwcap.h" 1
# 20 "./arch/arm64/include/asm/hwcap.h" 2
# 52 "./arch/arm64/include/asm/hwcap.h"
extern unsigned int compat_elf_hwcap, compat_elf_hwcap2;


enum {
 CAP_HWCAP = 1,

 CAP_COMPAT_HWCAP,
 CAP_COMPAT_HWCAP2,

};

extern unsigned long elf_hwcap;
# 26 "./arch/arm64/include/uapi/asm/ptrace.h" 2
# 70 "./arch/arm64/include/uapi/asm/ptrace.h"
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
# 23 "./arch/arm64/include/asm/ptrace.h" 2
# 119 "./arch/arm64/include/asm/ptrace.h"
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
 u64 unused;
 u64 stackframe[2];
};

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool in_syscall(struct pt_regs const *regs)
{
 return regs->syscallno != (-1);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void forget_syscall(struct pt_regs *regs)
{
 regs->syscallno = (-1);
}
# 186 "./arch/arm64/include/asm/ptrace.h"
extern int regs_query_register_offset(const char *name);
extern unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,
            unsigned int n);
# 199 "./arch/arm64/include/asm/ptrace.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 regs_get_register(struct pt_regs *regs, unsigned int offset)
{
 u64 val = 0;

 ({ int __ret_warn_on = !!(offset & 7); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 0: .long 1f - 0b; .pushsection .rodata.str,\"aMS\",@progbits,1; 2: .string \"./arch/arm64/include/asm/ptrace.h\"; .popsection; .long 2b - 0b; .short 203; .short (1 << 0)|(((9) << 8)); .popsection; 1: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); });

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





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long pt_regs_read_reg(const struct pt_regs *regs, int r)
{
 return (r == 31) ? 0 : regs->regs[r];
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void pt_regs_write_reg(struct pt_regs *regs, int r,
         unsigned long val)
{
 if (r != 31)
  regs->regs[r] = val;
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long kernel_stack_pointer(struct pt_regs *regs)
{
 return regs->sp;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long regs_return_value(struct pt_regs *regs)
{
 return regs->regs[0];
}


struct task_struct;
int valid_user_regs(struct user_pt_regs *regs, struct task_struct *task);







# 1 "./include/asm-generic/ptrace.h" 1
# 22 "./include/asm-generic/ptrace.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long instruction_pointer(struct pt_regs *regs)
{
 return ((unsigned long)(regs)->pc);
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void instruction_pointer_set(struct pt_regs *regs,
                                           unsigned long val)
{
 ((regs)->pc = ((u64) (val)));
}
# 44 "./include/asm-generic/ptrace.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long user_stack_pointer(struct pt_regs *regs)
{
 return (!(((regs)->pstate & (0x00000010 | 0x0000000f)) == (0x00000010 | 0x00000000)) ? (regs)->sp : (regs)->regs[13]);
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void user_stack_pointer_set(struct pt_regs *regs,
                                          unsigned long val)
{
 (!(((regs)->pstate & (0x00000010 | 0x0000000f)) == (0x00000010 | 0x00000000)) ? ((regs)->sp = val) : ((regs)->regs[13] = val));
}
# 62 "./include/asm-generic/ptrace.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long frame_pointer(struct pt_regs *regs)
{
 return ((unsigned long)(regs)->regs[29]);
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void frame_pointer_set(struct pt_regs *regs,
                                     unsigned long val)
{
 ((regs)->regs[29] = ((u64) (val)));
}
# 268 "./arch/arm64/include/asm/ptrace.h" 2



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void procedure_link_pointer_set(struct pt_regs *regs,
        unsigned long val)
{
 ((regs)->regs[30]) = val;
}


extern unsigned long profile_pc(struct pt_regs *regs);
# 22 "./arch/arm64/include/asm/irqflags.h" 2




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long arch_local_irq_save(void)
{
 unsigned long flags;
 asm volatile(
  "mrs	%0, daif		// arch_local_irq_save\n"
  "msr	daifset, #2"
  : "=r" (flags)
  :
  : "memory");
 return flags;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void arch_local_irq_enable(void)
{
 asm volatile(
  "msr	daifclr, #2		// arch_local_irq_enable"
  :
  :
  : "memory");
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void arch_local_irq_disable(void)
{
 asm volatile(
  "msr	daifset, #2		// arch_local_irq_disable"
  :
  :
  : "memory");
}
# 65 "./arch/arm64/include/asm/irqflags.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long arch_local_save_flags(void)
{
 unsigned long flags;
 asm volatile(
  "mrs	%0, daif		// arch_local_save_flags"
  : "=r" (flags)
  :
  : "memory");
 return flags;
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void arch_local_irq_restore(unsigned long flags)
{
 asm volatile(
  "msr	daif, %0		// arch_local_irq_restore"
 :
 : "r" (flags)
 : "memory");
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int arch_irqs_disabled_flags(unsigned long flags)
{
 return flags & 0x00000080;
}
# 17 "./include/linux/irqflags.h" 2
# 40 "./include/linux/rcupdate.h" 2
# 1 "./include/linux/preempt.h" 1
# 81 "./include/linux/preempt.h"
# 1 "./arch/arm64/include/generated/asm/preempt.h" 1
# 1 "./include/asm-generic/preempt.h" 1




# 1 "./include/linux/thread_info.h" 1
# 13 "./include/linux/thread_info.h"
# 1 "./include/linux/restart_block.h" 1
# 11 "./include/linux/restart_block.h"
struct timespec;
struct compat_timespec;
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
    struct timespec *rmtp;

    struct compat_timespec *compat_rmtp;

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
# 14 "./include/linux/thread_info.h" 2
# 31 "./include/linux/thread_info.h"
enum {
 BAD_STACK = -1,
 NOT_STACK = 0,
 GOOD_FRAME,
 GOOD_STACK,
};

# 1 "./arch/arm64/include/asm/thread_info.h" 1
# 28 "./arch/arm64/include/asm/thread_info.h"
struct task_struct;

# 1 "./arch/arm64/include/asm/memory.h" 1
# 28 "./arch/arm64/include/asm/memory.h"
# 1 "./arch/arm64/include/asm/page-def.h" 1
# 29 "./arch/arm64/include/asm/memory.h" 2
# 1 "./arch/arm64/include/generated/asm/sizes.h" 1
# 1 "./include/asm-generic/sizes.h" 1

# 1 "./include/linux/sizes.h" 1
# 2 "./include/asm-generic/sizes.h" 2
# 1 "./arch/arm64/include/generated/asm/sizes.h" 2
# 30 "./arch/arm64/include/asm/memory.h" 2
# 180 "./arch/arm64/include/asm/memory.h"
# 1 "./include/linux/mmdebug.h" 1







struct page;
struct vm_area_struct;
struct mm_struct;

extern void dump_page(struct page *page, const char *reason);
extern void __dump_page(struct page *page, const char *reason);
void dump_vma(const struct vm_area_struct *vma);
void dump_mm(const struct mm_struct *mm);
# 181 "./arch/arm64/include/asm/memory.h" 2

extern s64 memstart_addr;




extern u64 kimage_vaddr;


extern u64 kimage_voffset;

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long kaslr_offset(void)
{
 return kimage_vaddr - (((((0xffffffffffffffffUL) - ((1UL) << (48)) + 1) + (0)) + (0x08000000)));
}
# 261 "./arch/arm64/include/asm/memory.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) phys_addr_t virt_to_phys(const volatile void *x)
{
 return ({ phys_addr_t __x = (phys_addr_t)((unsigned long)(x)); (!!((__x) & (1UL << ((48) - 1)))) ? (((__x) & ~((0xffffffffffffffffUL) - ((1UL) << ((48) - 1)) + 1)) + ({ ((void)(sizeof(( long)(memstart_addr & 1)))); memstart_addr; })) : ((__x) - kimage_voffset); });
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *phys_to_virt(phys_addr_t x)
{
 return (void *)(((unsigned long)((x) - ({ ((void)(sizeof(( long)(memstart_addr & 1)))); memstart_addr; })) | ((0xffffffffffffffffUL) - ((1UL) << ((48) - 1)) + 1)));
}
# 308 "./arch/arm64/include/asm/memory.h"
# 1 "./include/asm-generic/memory_model.h" 1




# 1 "./include/linux/pfn.h" 1
# 13 "./include/linux/pfn.h"
typedef struct {
 u64 val;
} pfn_t;
# 6 "./include/asm-generic/memory_model.h" 2
# 309 "./arch/arm64/include/asm/memory.h" 2
# 31 "./arch/arm64/include/asm/thread_info.h" 2
# 1 "./arch/arm64/include/asm/stack_pointer.h" 1







register unsigned long current_stack_pointer asm ("sp");
# 32 "./arch/arm64/include/asm/thread_info.h" 2
# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 33 "./arch/arm64/include/asm/thread_info.h" 2

typedef unsigned long mm_segment_t;




struct thread_info {
 unsigned long flags;
 mm_segment_t addr_limit;



 int preempt_count;
};
# 63 "./arch/arm64/include/asm/thread_info.h"
void arch_setup_new_exec(void);
# 39 "./include/linux/thread_info.h" 2
# 53 "./include/linux/thread_info.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void set_ti_thread_flag(struct thread_info *ti, int flag)
{
 set_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void clear_ti_thread_flag(struct thread_info *ti, int flag)
{
 clear_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int test_and_set_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_and_set_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int test_and_clear_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_and_clear_bit(flag, (unsigned long *)&ti->flags);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int test_ti_thread_flag(struct thread_info *ti, int flag)
{
 return test_bit(flag, (unsigned long *)&ti->flags);
}
# 92 "./include/linux/thread_info.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int arch_within_stack_frames(const void * const stack,
        const void * const stackend,
        const void *obj, unsigned long len)
{
 return 0;
}
# 111 "./include/linux/thread_info.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void check_object_size(const void *ptr, unsigned long n,
         bool to_user)
{ }


extern void __attribute__((error("copy source size is too small")))
__bad_copy_from(void);
extern void __attribute__((error("copy destination size is too small")))
__bad_copy_to(void);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void copy_overflow(int size, unsigned long count)
{
 ({ int __ret_warn_on = !!(1); if (__builtin_expect(!!(__ret_warn_on), 0)) do { printk("Buffer overflow detected (%d < %lu)!\n", size, count); asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 0: .long 1f - 0b; .pushsection .rodata.str,\"aMS\",@progbits,1; 2: .string \"./include/linux/thread_info.h\"; .popsection; .long 2b - 0b; .short 123; .short (1 << 0)|(((9) << 8)); .popsection; 1: brk 0x800");; } while (0); __builtin_expect(!!(__ret_warn_on), 0); });
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool
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
 check_object_size(addr, bytes, is_source);
 return true;
}
# 6 "./include/asm-generic/preempt.h" 2



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) int preempt_count(void)
{
 return ({ union { typeof(((struct thread_info *)get_current())->preempt_count) __val; char __c[1]; } __u; if (1) __read_once_size(&(((struct thread_info *)get_current())->preempt_count), __u.__c, sizeof(((struct thread_info *)get_current())->preempt_count)); else __read_once_size_nocheck(&(((struct thread_info *)get_current())->preempt_count), __u.__c, sizeof(((struct thread_info *)get_current())->preempt_count)); do { } while (0); __u.__val; });
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) volatile int *preempt_count_ptr(void)
{
 return &((struct thread_info *)get_current())->preempt_count;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void preempt_count_set(int pc)
{
 *preempt_count_ptr() = pc;
}
# 35 "./include/asm-generic/preempt.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void set_preempt_need_resched(void)
{
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void clear_preempt_need_resched(void)
{
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool test_preempt_need_resched(void)
{
 return false;
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void __preempt_count_add(int val)
{
 *preempt_count_ptr() += val;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void __preempt_count_sub(int val)
{
 *preempt_count_ptr() -= val;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool __preempt_count_dec_and_test(void)
{





 return !--*preempt_count_ptr() && test_ti_thread_flag(((struct thread_info *)get_current()), 1);
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool should_resched(int preempt_offset)
{
 return __builtin_expect(!!(preempt_count() == preempt_offset && test_ti_thread_flag(((struct thread_info *)get_current()), 1)), 0)
                      ;
}


extern void preempt_schedule(void);

extern void preempt_schedule_notrace(void);
# 1 "./arch/arm64/include/generated/asm/preempt.h" 2
# 82 "./include/linux/preempt.h" 2
# 280 "./include/linux/preempt.h"
struct preempt_notifier;
# 296 "./include/linux/preempt.h"
struct preempt_ops {
 void (*sched_in)(struct preempt_notifier *notifier, int cpu);
 void (*sched_out)(struct preempt_notifier *notifier,
     struct task_struct *next);
};
# 309 "./include/linux/preempt.h"
struct preempt_notifier {
 struct hlist_node link;
 struct preempt_ops *ops;
};

void preempt_notifier_inc(void);
void preempt_notifier_dec(void);
void preempt_notifier_register(struct preempt_notifier *notifier);
void preempt_notifier_unregister(struct preempt_notifier *notifier);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void preempt_notifier_init(struct preempt_notifier *notifier,
         struct preempt_ops *ops)
{
 INIT_HLIST_NODE(&notifier->link);
 notifier->ops = ops;
}
# 41 "./include/linux/rcupdate.h" 2
# 1 "./include/linux/bottom_half.h" 1
# 10 "./include/linux/bottom_half.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void __local_bh_disable_ip(unsigned long ip, unsigned int cnt)
{
 __preempt_count_add(cnt);
 __asm__ __volatile__("": : :"memory");
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void local_bh_disable(void)
{
 __local_bh_disable_ip(({ __label__ __here; __here: (unsigned long)&&__here; }), (2 * (1UL << (0 + 8))));
}

extern void _local_bh_enable(void);
extern void __local_bh_enable_ip(unsigned long ip, unsigned int cnt);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void local_bh_enable_ip(unsigned long ip)
{
 __local_bh_enable_ip(ip, (2 * (1UL << (0 + 8))));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void local_bh_enable(void)
{
 __local_bh_enable_ip(({ __label__ __here; __here: (unsigned long)&&__here; }), (2 * (1UL << (0 + 8))));
}
# 42 "./include/linux/rcupdate.h" 2
# 1 "./include/linux/lockdep.h" 1
# 13 "./include/linux/lockdep.h"
struct task_struct;
struct lockdep_map;


extern int prove_locking;
extern int lock_stat;
# 491 "./include/linux/lockdep.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void lockdep_off(void)
{
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void lockdep_on(void)
{
}
# 529 "./include/linux/lockdep.h"
struct lock_class_key { };
# 542 "./include/linux/lockdep.h"
struct pin_cookie { };
# 552 "./include/linux/lockdep.h"
enum xhlock_context_t {
 XHLOCK_HARD,
 XHLOCK_SOFT,
 XHLOCK_CTX_NR,
};
# 597 "./include/linux/lockdep.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void crossrelease_hist_start(enum xhlock_context_t c) {}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void crossrelease_hist_end(enum xhlock_context_t c) {}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void lockdep_invariant_state(bool force) {}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void lockdep_init_task(struct task_struct *task) {}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void lockdep_free_task(struct task_struct *task) {}
# 663 "./include/linux/lockdep.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void print_irqtrace_events(struct task_struct *curr)
{
}
# 731 "./include/linux/lockdep.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
lockdep_rcu_suspicious(const char *file, const int line, const char *s)
{
}
# 43 "./include/linux/rcupdate.h" 2
# 1 "./arch/arm64/include/asm/processor.h" 1
# 37 "./arch/arm64/include/asm/processor.h"
# 1 "./include/linux/string.h" 1
# 10 "./include/linux/string.h"
# 1 "./include/uapi/linux/string.h" 1
# 11 "./include/linux/string.h" 2

extern char *strndup_user(const char *, long);
extern void *memdup_user(const void *, size_t);
extern void *memdup_user_nul(const void *, size_t);




# 1 "./arch/arm64/include/asm/string.h" 1
# 20 "./arch/arm64/include/asm/string.h"
extern char *strrchr(const char *, int c);


extern char *strchr(const char *, int c);


extern int strcmp(const char *, const char *);


extern int strncmp(const char *, const char *, __kernel_size_t);


extern __kernel_size_t strlen(const char *);


extern __kernel_size_t strnlen(const char *, __kernel_size_t);


extern void *memcpy(void *, const void *, __kernel_size_t);
extern void *__memcpy(void *, const void *, __kernel_size_t);


extern void *memmove(void *, const void *, __kernel_size_t);
extern void *__memmove(void *, const void *, __kernel_size_t);


extern void *memchr(const void *, int, __kernel_size_t);


extern void *memset(void *, int, __kernel_size_t);
extern void *__memset(void *, int, __kernel_size_t);


extern int memcmp(const void *, const void *, size_t);
# 20 "./include/linux/string.h" 2


extern char * strcpy(char *,const char *);


extern char * strncpy(char *,const char *, __kernel_size_t);


size_t strlcpy(char *, const char *, size_t);


ssize_t strscpy(char *, const char *, size_t);


extern char * strcat(char *, const char *);


extern char * strncat(char *, const char *, __kernel_size_t);


extern size_t strlcat(char *, const char *, __kernel_size_t);
# 49 "./include/linux/string.h"
extern int strcasecmp(const char *s1, const char *s2);


extern int strncasecmp(const char *s1, const char *s2, size_t n);





extern char * strchrnul(const char *,int);


extern char * strnchr(const char *, size_t, int);




extern char * __attribute__((warn_unused_result)) skip_spaces(const char *);

extern char *strim(char *);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) char *strstrip(char *str)
{
 return strim(str);
}


extern char * strstr(const char *, const char *);


extern char * strnstr(const char *, const char *, size_t);
# 88 "./include/linux/string.h"
extern char * strpbrk(const char *,const char *);


extern char * strsep(char **,const char *);


extern __kernel_size_t strspn(const char *,const char *);


extern __kernel_size_t strcspn(const char *,const char *);







extern void *memset16(uint16_t *, uint16_t, __kernel_size_t);



extern void *memset32(uint32_t *, uint32_t, __kernel_size_t);



extern void *memset64(uint64_t *, uint64_t, __kernel_size_t);


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *memset_l(unsigned long *p, unsigned long v,
  __kernel_size_t n)
{
 if (64 == 32)
  return memset32((uint32_t *)p, v, n);
 else
  return memset64((uint64_t *)p, v, n);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *memset_p(void **p, void *v, __kernel_size_t n)
{
 if (64 == 32)
  return memset32((uint32_t *)p, (uintptr_t)v, n);
 else
  return memset64((uint64_t *)p, (uintptr_t)v, n);
}
# 140 "./include/linux/string.h"
extern void * memscan(void *,int,__kernel_size_t);
# 149 "./include/linux/string.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) int memcpy_mcsafe(void *dst, const void *src,
  size_t cnt)
{
 memcpy(dst, src, cnt);
 return 0;
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void memcpy_flushcache(void *dst, const void *src, size_t cnt)
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
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int strtobool(const char *s, bool *res)
{
 return kstrtobool(s, res);
}

int match_string(const char * const *array, size_t n, const char *string);
int __sysfs_match_string(const char * const *array, size_t n, const char *s);
# 201 "./include/linux/string.h"
extern ssize_t memory_read_from_buffer(void *to, size_t count, loff_t *ppos,
           const void *from, size_t available);






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool strstarts(const char *str, const char *prefix)
{
 return strncmp(str, prefix, strlen(prefix)) == 0;
}

size_t memweight(const void *ptr, size_t bytes);
void memzero_explicit(void *s, size_t count);






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) const char *kbasename(const char *path)
{
 const char *tail = strrchr(path, '/');
 return tail ? tail + 1 : path;
}




void fortify_panic(const char *name) __attribute__((noreturn)) __attribute__((__cold__));
void __read_overflow(void) __attribute__((error("detected read beyond size of object passed as 1st parameter")));
void __read_overflow2(void) __attribute__((error("detected read beyond size of object passed as 2nd parameter")));
void __read_overflow3(void) __attribute__((error("detected read beyond size of object passed as 3rd parameter")));
void __write_overflow(void) __attribute__((error("detected write beyond size of object passed as 1st parameter")));
# 441 "./include/linux/string.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void memcpy_and_pad(void *dest, size_t dest_len,
      const void *src, size_t count, int pad)
{
 if (dest_len > count) {
  memcpy(dest, src, count);
  memset(dest + count, pad, dest_len - count);
 } else
  memcpy(dest, src, dest_len);
}
# 38 "./arch/arm64/include/asm/processor.h" 2

# 1 "./arch/arm64/include/asm/alternative.h" 1




# 1 "./arch/arm64/include/asm/cpucaps.h" 1
# 6 "./arch/arm64/include/asm/alternative.h" 2
# 1 "./arch/arm64/include/asm/insn.h" 1
# 42 "./arch/arm64/include/asm/insn.h"
enum aarch64_insn_encoding_class {
 AARCH64_INSN_CLS_UNKNOWN,
 AARCH64_INSN_CLS_DP_IMM,
 AARCH64_INSN_CLS_DP_REG,
 AARCH64_INSN_CLS_DP_FPSIMD,
 AARCH64_INSN_CLS_LDST,
 AARCH64_INSN_CLS_BR_SYS,

};

enum aarch64_insn_hint_op {
 AARCH64_INSN_HINT_NOP = 0x0 << 5,
 AARCH64_INSN_HINT_YIELD = 0x1 << 5,
 AARCH64_INSN_HINT_WFE = 0x2 << 5,
 AARCH64_INSN_HINT_WFI = 0x3 << 5,
 AARCH64_INSN_HINT_SEV = 0x4 << 5,
 AARCH64_INSN_HINT_SEVL = 0x5 << 5,
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







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_adr(u32 code) { return (code & (0x9F000000)) == (0x10000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_adr_value(void) { return (0x10000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_adrp(u32 code) { return (code & (0x9F000000)) == (0x90000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_adrp_value(void) { return (0x90000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_prfm(u32 code) { return (code & (0x3FC00000)) == (0x39800000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_prfm_value(void) { return (0x39800000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_prfm_lit(u32 code) { return (code & (0xFF000000)) == (0xD8000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_prfm_lit_value(void) { return (0xD8000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_str_reg(u32 code) { return (code & (0x3FE0EC00)) == (0x38206800); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_str_reg_value(void) { return (0x38206800); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_ldr_reg(u32 code) { return (code & (0x3FE0EC00)) == (0x38606800); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_ldr_reg_value(void) { return (0x38606800); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_ldr_lit(u32 code) { return (code & (0xBF000000)) == (0x18000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_ldr_lit_value(void) { return (0x18000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_ldrsw_lit(u32 code) { return (code & (0xFF000000)) == (0x98000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_ldrsw_lit_value(void) { return (0x98000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_exclusive(u32 code) { return (code & (0x3F800000)) == (0x08000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_exclusive_value(void) { return (0x08000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_load_ex(u32 code) { return (code & (0x3F400000)) == (0x08400000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_load_ex_value(void) { return (0x08400000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_store_ex(u32 code) { return (code & (0x3F400000)) == (0x08000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_store_ex_value(void) { return (0x08000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_stp_post(u32 code) { return (code & (0x7FC00000)) == (0x28800000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_stp_post_value(void) { return (0x28800000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_ldp_post(u32 code) { return (code & (0x7FC00000)) == (0x28C00000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_ldp_post_value(void) { return (0x28C00000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_stp_pre(u32 code) { return (code & (0x7FC00000)) == (0x29800000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_stp_pre_value(void) { return (0x29800000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_ldp_pre(u32 code) { return (code & (0x7FC00000)) == (0x29C00000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_ldp_pre_value(void) { return (0x29C00000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_add_imm(u32 code) { return (code & (0x7F000000)) == (0x11000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_add_imm_value(void) { return (0x11000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_adds_imm(u32 code) { return (code & (0x7F000000)) == (0x31000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_adds_imm_value(void) { return (0x31000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_sub_imm(u32 code) { return (code & (0x7F000000)) == (0x51000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_sub_imm_value(void) { return (0x51000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_subs_imm(u32 code) { return (code & (0x7F000000)) == (0x71000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_subs_imm_value(void) { return (0x71000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_movn(u32 code) { return (code & (0x7F800000)) == (0x12800000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_movn_value(void) { return (0x12800000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_sbfm(u32 code) { return (code & (0x7F800000)) == (0x13000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_sbfm_value(void) { return (0x13000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_bfm(u32 code) { return (code & (0x7F800000)) == (0x33000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_bfm_value(void) { return (0x33000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_movz(u32 code) { return (code & (0x7F800000)) == (0x52800000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_movz_value(void) { return (0x52800000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_ubfm(u32 code) { return (code & (0x7F800000)) == (0x53000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_ubfm_value(void) { return (0x53000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_movk(u32 code) { return (code & (0x7F800000)) == (0x72800000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_movk_value(void) { return (0x72800000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_add(u32 code) { return (code & (0x7F200000)) == (0x0B000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_add_value(void) { return (0x0B000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_adds(u32 code) { return (code & (0x7F200000)) == (0x2B000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_adds_value(void) { return (0x2B000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_sub(u32 code) { return (code & (0x7F200000)) == (0x4B000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_sub_value(void) { return (0x4B000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_subs(u32 code) { return (code & (0x7F200000)) == (0x6B000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_subs_value(void) { return (0x6B000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_madd(u32 code) { return (code & (0x7FE08000)) == (0x1B000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_madd_value(void) { return (0x1B000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_msub(u32 code) { return (code & (0x7FE08000)) == (0x1B008000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_msub_value(void) { return (0x1B008000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_udiv(u32 code) { return (code & (0x7FE0FC00)) == (0x1AC00800); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_udiv_value(void) { return (0x1AC00800); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_sdiv(u32 code) { return (code & (0x7FE0FC00)) == (0x1AC00C00); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_sdiv_value(void) { return (0x1AC00C00); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_lslv(u32 code) { return (code & (0x7FE0FC00)) == (0x1AC02000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_lslv_value(void) { return (0x1AC02000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_lsrv(u32 code) { return (code & (0x7FE0FC00)) == (0x1AC02400); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_lsrv_value(void) { return (0x1AC02400); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_asrv(u32 code) { return (code & (0x7FE0FC00)) == (0x1AC02800); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_asrv_value(void) { return (0x1AC02800); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_rorv(u32 code) { return (code & (0x7FE0FC00)) == (0x1AC02C00); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_rorv_value(void) { return (0x1AC02C00); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_rev16(u32 code) { return (code & (0x7FFFFC00)) == (0x5AC00400); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_rev16_value(void) { return (0x5AC00400); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_rev32(u32 code) { return (code & (0x7FFFFC00)) == (0x5AC00800); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_rev32_value(void) { return (0x5AC00800); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_rev64(u32 code) { return (code & (0x7FFFFC00)) == (0x5AC00C00); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_rev64_value(void) { return (0x5AC00C00); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_and(u32 code) { return (code & (0x7F200000)) == (0x0A000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_and_value(void) { return (0x0A000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_bic(u32 code) { return (code & (0x7F200000)) == (0x0A200000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_bic_value(void) { return (0x0A200000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_orr(u32 code) { return (code & (0x7F200000)) == (0x2A000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_orr_value(void) { return (0x2A000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_orn(u32 code) { return (code & (0x7F200000)) == (0x2A200000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_orn_value(void) { return (0x2A200000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_eor(u32 code) { return (code & (0x7F200000)) == (0x4A000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_eor_value(void) { return (0x4A000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_eon(u32 code) { return (code & (0x7F200000)) == (0x4A200000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_eon_value(void) { return (0x4A200000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_ands(u32 code) { return (code & (0x7F200000)) == (0x6A000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_ands_value(void) { return (0x6A000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_bics(u32 code) { return (code & (0x7F200000)) == (0x6A200000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_bics_value(void) { return (0x6A200000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_b(u32 code) { return (code & (0xFC000000)) == (0x14000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_b_value(void) { return (0x14000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_bl(u32 code) { return (code & (0xFC000000)) == (0x94000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_bl_value(void) { return (0x94000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_cbz(u32 code) { return (code & (0x7F000000)) == (0x34000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_cbz_value(void) { return (0x34000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_cbnz(u32 code) { return (code & (0x7F000000)) == (0x35000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_cbnz_value(void) { return (0x35000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_tbz(u32 code) { return (code & (0x7F000000)) == (0x36000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_tbz_value(void) { return (0x36000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_tbnz(u32 code) { return (code & (0x7F000000)) == (0x37000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_tbnz_value(void) { return (0x37000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_bcond(u32 code) { return (code & (0xFF000010)) == (0x54000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_bcond_value(void) { return (0x54000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_svc(u32 code) { return (code & (0xFFE0001F)) == (0xD4000001); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_svc_value(void) { return (0xD4000001); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_hvc(u32 code) { return (code & (0xFFE0001F)) == (0xD4000002); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_hvc_value(void) { return (0xD4000002); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_smc(u32 code) { return (code & (0xFFE0001F)) == (0xD4000003); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_smc_value(void) { return (0xD4000003); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_brk(u32 code) { return (code & (0xFFE0001F)) == (0xD4200000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_brk_value(void) { return (0xD4200000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_exception(u32 code) { return (code & (0xFF000000)) == (0xD4000000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_exception_value(void) { return (0xD4000000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_hint(u32 code) { return (code & (0xFFFFF01F)) == (0xD503201F); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_hint_value(void) { return (0xD503201F); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_br(u32 code) { return (code & (0xFFFFFC1F)) == (0xD61F0000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_br_value(void) { return (0xD61F0000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_blr(u32 code) { return (code & (0xFFFFFC1F)) == (0xD63F0000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_blr_value(void) { return (0xD63F0000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_ret(u32 code) { return (code & (0xFFFFFC1F)) == (0xD65F0000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_ret_value(void) { return (0xD65F0000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_eret(u32 code) { return (code & (0xFFFFFFFF)) == (0xD69F03E0); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_eret_value(void) { return (0xD69F03E0); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_mrs(u32 code) { return (code & (0xFFF00000)) == (0xD5300000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_mrs_value(void) { return (0xD5300000); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_msr_imm(u32 code) { return (code & (0xFFF8F01F)) == (0xD500401F); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_msr_imm_value(void) { return (0xD500401F); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool aarch64_insn_is_msr_reg(u32 code) { return (code & (0xFFF00000)) == (0xD5100000); } static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32 aarch64_insn_get_msr_reg_value(void) { return (0xD5100000); }



bool aarch64_insn_is_nop(u32 insn);
bool aarch64_insn_is_branch_imm(u32 insn);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool aarch64_insn_is_adr_adrp(u32 insn)
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
u32 aarch64_insn_gen_hint(enum aarch64_insn_hint_op op);
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
u32 aarch64_insn_gen_add_sub_imm(enum aarch64_insn_register dst,
     enum aarch64_insn_register src,
     int imm, enum aarch64_insn_variant variant,
     enum aarch64_insn_adsb_type type);
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
u32 aarch64_insn_gen_prefetch(enum aarch64_insn_register base,
         enum aarch64_insn_prfm_type type,
         enum aarch64_insn_prfm_target target,
         enum aarch64_insn_prfm_policy policy);
s32 aarch64_get_branch_offset(u32 insn);
u32 aarch64_set_branch_offset(u32 insn, s32 offset);

bool aarch64_insn_hotpatch_safe(u32 old_insn, u32 new_insn);

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
# 7 "./arch/arm64/include/asm/alternative.h" 2
# 17 "./arch/arm64/include/asm/alternative.h"
extern int alternatives_applied;

struct alt_instr {
 s32 orig_offset;
 s32 alt_offset;
 u16 cpufeature;
 u8 orig_len;
 u8 alt_len;
};

typedef void (*alternative_cb_t)(struct alt_instr *alt,
     __le32 *origptr, __le32 *updptr, int nr_inst);

void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) apply_alternatives_all(void);
void apply_alternatives(void *start, size_t length);
# 40 "./arch/arm64/include/asm/processor.h" 2
# 1 "./arch/arm64/include/asm/fpsimd.h" 1
# 31 "./arch/arm64/include/asm/fpsimd.h"
struct fpsimd_state {
 union {
  struct user_fpsimd_state user_fpsimd;
  struct {
   __uint128_t vregs[32];
   u32 fpsr;
   u32 fpcr;
  };
 };

 unsigned int cpu;
};
# 56 "./arch/arm64/include/asm/fpsimd.h"
struct task_struct;

extern void fpsimd_save_state(struct fpsimd_state *state);
extern void fpsimd_load_state(struct fpsimd_state *state);

extern void fpsimd_thread_switch(struct task_struct *next);
extern void fpsimd_flush_thread(void);

extern void fpsimd_preserve_current_state(void);
extern void fpsimd_restore_current_state(void);
extern void fpsimd_update_current_state(struct fpsimd_state *state);

extern void fpsimd_flush_task_state(struct task_struct *target);


extern void __efi_fpsimd_begin(void);
extern void __efi_fpsimd_end(void);
# 41 "./arch/arm64/include/asm/processor.h" 2
# 1 "./arch/arm64/include/asm/hw_breakpoint.h" 1
# 20 "./arch/arm64/include/asm/hw_breakpoint.h"
# 1 "./arch/arm64/include/asm/cpufeature.h" 1
# 29 "./arch/arm64/include/asm/cpufeature.h"
# 1 "./include/linux/jump_label.h" 1
# 83 "./include/linux/jump_label.h"
extern bool static_key_initialized;







struct static_key {
 atomic_t enabled;
# 106 "./include/linux/jump_label.h"
 union {
  unsigned long type;
  struct jump_entry *entries;
  struct static_key_mod *next;
 };
};
# 121 "./include/linux/jump_label.h"
# 1 "./arch/arm64/include/asm/jump_label.h" 1
# 29 "./arch/arm64/include/asm/jump_label.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool arch_static_branch(struct static_key *key, bool branch)
{
 do { asm goto("1: nop\n\t" ".pushsection __jump_table,  \"aw\"\n\t" ".align 3\n\t" ".quad 1b, %l[l_yes], %c0\n\t" ".popsection\n\t" : : "i"(&((char *)key)[branch]) : : l_yes); asm (""); } while (0)




                                                ;

 return false;
l_yes:
 return true;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool arch_static_branch_jump(struct static_key *key, bool branch)
{
 do { asm goto("1: b %l[l_yes]\n\t" ".pushsection __jump_table,  \"aw\"\n\t" ".align 3\n\t" ".quad 1b, %l[l_yes], %c0\n\t" ".popsection\n\t" : : "i"(&((char *)key)[branch]) : : l_yes); asm (""); } while (0)




                                                ;

 return false;
l_yes:
 return true;
}

typedef u64 jump_label_t;

struct jump_entry {
 jump_label_t code;
 jump_label_t target;
 jump_label_t key;
};
# 122 "./include/linux/jump_label.h" 2




enum jump_label_type {
 JUMP_LABEL_NOP = 0,
 JUMP_LABEL_JMP,
};

struct module;
# 140 "./include/linux/jump_label.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool static_key_false(struct static_key *key)
{
 return arch_static_branch(key, false);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool static_key_true(struct static_key *key)
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
# 285 "./include/linux/jump_label.h"
struct static_key_true {
 struct static_key key;
};

struct static_key_false {
 struct static_key key;
};
# 318 "./include/linux/jump_label.h"
extern bool ____wrong_branch_error(void);
# 30 "./arch/arm64/include/asm/cpufeature.h" 2
# 46 "./arch/arm64/include/asm/cpufeature.h"
enum ftr_type {
 FTR_EXACT,
 FTR_LOWER_SAFE,
 FTR_HIGHER_SAFE,
};
# 61 "./arch/arm64/include/asm/cpufeature.h"
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


enum {
 SCOPE_SYSTEM,
 SCOPE_LOCAL_CPU,
};

struct arm64_cpu_capabilities {
 const char *desc;
 u16 capability;
 int def_scope;
 bool (*matches)(const struct arm64_cpu_capabilities *caps, int scope);
 int (*enable)(void *);
 union {
  struct {
   u32 midr_model;
   u32 midr_range_min, midr_range_max;
  };

  struct {
   u32 sys_reg;
   u8 field_pos;
   u8 min_field_value;
   u8 hwcap_type;
   bool sign;
   unsigned long hwcap;
  };
 };
};

extern unsigned long cpu_hwcaps[(((28) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];
extern struct static_key_false cpu_hwcap_keys[28];
extern struct static_key_false arm64_const_caps_ready;

bool this_cpu_has_cap(unsigned int cap);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool cpu_have_feature(unsigned int num)
{
 return elf_hwcap & (1UL << num);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool __cpus_have_const_cap(int num)
{
 if (num >= 28)
  return false;
 return ({ bool branch; if (__builtin_types_compatible_p(typeof(*&cpu_hwcap_keys[num]), struct static_key_true)) branch = arch_static_branch_jump(&(&cpu_hwcap_keys[num])->key, false); else if (__builtin_types_compatible_p(typeof(*&cpu_hwcap_keys[num]), struct static_key_false)) branch = arch_static_branch(&(&cpu_hwcap_keys[num])->key, false); else branch = ____wrong_branch_error(); branch; });
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool cpus_have_cap(unsigned int num)
{
 if (num >= 28)
  return false;
 return test_bit(num, cpu_hwcaps);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool cpus_have_const_cap(int num)
{
 if (({ bool branch; if (__builtin_types_compatible_p(typeof(*&arm64_const_caps_ready), struct static_key_true)) branch = !arch_static_branch(&(&arm64_const_caps_ready)->key, true); else if (__builtin_types_compatible_p(typeof(*&arm64_const_caps_ready), struct static_key_false)) branch = !arch_static_branch_jump(&(&arm64_const_caps_ready)->key, true); else branch = ____wrong_branch_error(); branch; }))
  return __cpus_have_const_cap(num);
 else
  return cpus_have_cap(num);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpus_set_cap(unsigned int num)
{
 if (num >= 28) {
  printk("\001" "4" "Attempt to set an illegal CPU capability (%d >= %d)\n", num, 28)
                    ;
 } else {
  __set_bit(num, cpu_hwcaps);
 }
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((__const__))
cpuid_feature_extract_signed_field_width(u64 features, int field, int width)
{
 return (s64)(features << (64 - width - field)) >> (64 - width);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((__const__))
cpuid_feature_extract_signed_field(u64 features, int field)
{
 return cpuid_feature_extract_signed_field_width(features, field, 4);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int __attribute__((__const__))
cpuid_feature_extract_unsigned_field_width(u64 features, int field, int width)
{
 return (u64)(features << (64 - width - field)) >> (64 - width);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int __attribute__((__const__))
cpuid_feature_extract_unsigned_field(u64 features, int field)
{
 return cpuid_feature_extract_unsigned_field_width(features, field, 4);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 arm64_ftr_mask(const struct arm64_ftr_bits *ftrp)
{
 return (u64)(((~0UL) - (1UL << (ftrp->shift)) + 1) & (~0UL >> (64 - 1 - (ftrp->shift + ftrp->width - 1))));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 arm64_ftr_reg_user_value(const struct arm64_ftr_reg *reg)
{
 return (reg->user_val | (reg->sys_val & reg->user_mask));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((__const__))
cpuid_feature_extract_field_width(u64 features, int field, int width, bool sign)
{
 return (sign) ?
  cpuid_feature_extract_signed_field_width(features, field, width) :
  cpuid_feature_extract_unsigned_field_width(features, field, width);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((__const__))
cpuid_feature_extract_field(u64 features, int field, bool sign)
{
 return cpuid_feature_extract_field_width(features, field, 4, sign);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 arm64_ftr_value(const struct arm64_ftr_bits *ftrp, u64 val)
{
 return (s64)cpuid_feature_extract_field_width(val, ftrp->shift, ftrp->width, ftrp->sign);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool id_aa64mmfr0_mixed_endian_el0(u64 mmfr0)
{
 return cpuid_feature_extract_unsigned_field(mmfr0, 8) == 0x1 ||
  cpuid_feature_extract_unsigned_field(mmfr0, 16) == 0x1;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool id_aa64pfr0_32bit_el0(u64 pfr0)
{
 u32 val = cpuid_feature_extract_unsigned_field(pfr0, 0);

 return val == 0x2;
}

void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) setup_cpu_features(void);

void update_cpu_capabilities(const struct arm64_cpu_capabilities *caps,
       const char *info);
void enable_cpu_capabilities(const struct arm64_cpu_capabilities *caps);
void check_local_cpu_capabilities(void);

void update_cpu_errata_workarounds(void);
void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) enable_errata_workarounds(void);
void verify_local_cpu_errata_workarounds(void);

u64 read_sanitised_ftr_reg(u32 id);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool cpu_supports_mixed_endian_el0(void)
{
 return id_aa64mmfr0_mixed_endian_el0(({ u64 __val; asm volatile("mrs_s %0, " "(((3) << 19) | ((0) << 16) | ((0) << 12) | ((7) << 8) | ((0) << 5))" : "=r" (__val)); __val; }));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool system_supports_32bit_el0(void)
{
 return cpus_have_const_cap(13);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool system_supports_mixed_endian_el0(void)
{
 return id_aa64mmfr0_mixed_endian_el0(read_sanitised_ftr_reg((((3) << 19) | ((0) << 16) | ((0) << 12) | ((7) << 8) | ((0) << 5))));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool system_supports_fpsimd(void)
{
 return !cpus_have_const_cap(16);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool system_uses_ttbr0_pan(void)
{
 return 0 &&
  !cpus_have_const_cap(4);
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int arm64_get_ssbd_state(void)
{

 extern int ssbd_state;
 return ssbd_state;



}


void arm64_set_ssbd_mitigation(bool state);
# 21 "./arch/arm64/include/asm/hw_breakpoint.h" 2

# 1 "./arch/arm64/include/asm/virt.h" 1
# 61 "./arch/arm64/include/asm/virt.h"
# 1 "./arch/arm64/include/asm/sections.h" 1
# 19 "./arch/arm64/include/asm/sections.h"
# 1 "./include/asm-generic/sections.h" 1
# 34 "./include/asm-generic/sections.h"
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


extern char __ctors_start[], __ctors_end[];

extern __attribute__((externally_visible)) const void __nosave_begin, __nosave_end;
# 62 "./include/asm-generic/sections.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int arch_is_kernel_text(unsigned long addr)
{
 return 0;
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int arch_is_kernel_data(unsigned long addr)
{
 return 0;
}
# 86 "./include/asm-generic/sections.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool memory_contains(void *begin, void *end, void *virt,
       size_t size)
{
 return virt >= begin && virt + size <= end;
}
# 103 "./include/asm-generic/sections.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool memory_intersects(void *begin, void *end, void *virt,
         size_t size)
{
 void *vend = virt + size;

 return (virt >= begin && virt < end) || (vend >= begin && vend < end);
}
# 120 "./include/asm-generic/sections.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool init_section_contains(void *virt, size_t size)
{
 return memory_contains(__init_begin, __init_end, virt, size);
}
# 134 "./include/asm-generic/sections.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool init_section_intersects(void *virt, size_t size)
{
 return memory_intersects(__init_begin, __init_end, virt, size);
}
# 20 "./arch/arm64/include/asm/sections.h" 2

extern char __alt_instructions[], __alt_instructions_end[];
extern char __exception_text_start[], __exception_text_end[];
extern char __hibernate_exit_text_start[], __hibernate_exit_text_end[];
extern char __hyp_idmap_text_start[], __hyp_idmap_text_end[];
extern char __hyp_text_start[], __hyp_text_end[];
extern char __idmap_text_start[], __idmap_text_end[];
extern char __initdata_begin[], __initdata_end[];
extern char __inittext_begin[], __inittext_end[];
extern char __irqentry_text_start[], __irqentry_text_end[];
extern char __mmuoff_data_start[], __mmuoff_data_end[];
# 62 "./arch/arm64/include/asm/virt.h" 2
# 74 "./arch/arm64/include/asm/virt.h"
extern u32 __boot_cpu_mode[2];

void __hyp_set_vectors(phys_addr_t phys_vector_base);
void __hyp_reset_vectors(void);


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool is_hyp_mode_available(void)
{
 return (__boot_cpu_mode[0] == (0xe12) &&
  __boot_cpu_mode[1] == (0xe12));
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool is_hyp_mode_mismatched(void)
{
 return __boot_cpu_mode[0] != __boot_cpu_mode[1];
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool is_kernel_in_hyp_mode(void)
{
 return ({ u64 __val; asm volatile("mrs %0, " "CurrentEL" : "=r" (__val)); __val; }) == (2 << 2);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool has_vhe(void)
{
 if (cpus_have_const_cap(11))
  return true;

 return false;
}


extern void verify_cpu_run_el(void);
# 23 "./arch/arm64/include/asm/hw_breakpoint.h" 2



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







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 encode_ctrl_reg(struct arch_hw_breakpoint_ctrl ctrl)
{
 u32 val = (ctrl.len << 5) | (ctrl.type << 3) | (ctrl.privilege << 1) |
  ctrl.enabled;

 if (is_kernel_in_hyp_mode() && ctrl.privilege == 1)
  val |= (1 << 13);

 return val;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void decode_ctrl_reg(u32 reg,
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
# 120 "./arch/arm64/include/asm/hw_breakpoint.h"
struct task_struct;
struct notifier_block;
struct perf_event;
struct pmu;

extern int arch_bp_generic_fields(struct arch_hw_breakpoint_ctrl ctrl,
      int *gen_len, int *gen_type, int *offset);
extern int arch_check_bp_in_kernelspace(struct perf_event *bp);
extern int arch_validate_hwbkpt_settings(struct perf_event *bp);
extern int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
        unsigned long val, void *data);

extern int arch_install_hw_breakpoint(struct perf_event *bp);
extern void arch_uninstall_hw_breakpoint(struct perf_event *bp);
extern void hw_breakpoint_pmu_read(struct perf_event *bp);
extern int hw_breakpoint_slots(int type);


extern void hw_breakpoint_thread_switch(struct task_struct *next);
extern void ptrace_hw_copy_thread(struct task_struct *task);
# 150 "./arch/arm64/include/asm/hw_breakpoint.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int get_num_brps(void)
{
 u64 dfr0 = read_sanitised_ftr_reg((((3) << 19) | ((0) << 16) | ((0) << 12) | ((5) << 8) | ((0) << 5)));
 return 1 +
  cpuid_feature_extract_unsigned_field(dfr0,
      12);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int get_num_wrps(void)
{
 u64 dfr0 = read_sanitised_ftr_reg((((3) << 19) | ((0) << 16) | ((0) << 12) | ((5) << 8) | ((0) << 5)));
 return 1 +
  cpuid_feature_extract_unsigned_field(dfr0,
      20);
}
# 42 "./arch/arm64/include/asm/processor.h" 2

# 1 "./arch/arm64/include/asm/pgtable-hwdef.h" 1
# 44 "./arch/arm64/include/asm/processor.h" 2

# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 46 "./arch/arm64/include/asm/processor.h" 2
# 72 "./arch/arm64/include/asm/processor.h"
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
 unsigned long tp_value;

 unsigned long tp2_value;

 struct fpsimd_state fpsimd_state;
 unsigned long fault_address;
 unsigned long fault_code;
 struct debug_info debug;
};
# 131 "./arch/arm64/include/asm/processor.h"
void tls_preserve_current_state(void);



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void start_thread_common(struct pt_regs *regs, unsigned long pc)
{
 memset(regs, 0, sizeof(*regs));
 forget_syscall(regs);
 regs->pc = pc;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void start_thread(struct pt_regs *regs, unsigned long pc,
    unsigned long sp)
{
 start_thread_common(regs, pc);
 regs->pstate = 0x00000000;
 regs->sp = sp;
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void compat_start_thread(struct pt_regs *regs, unsigned long pc,
           unsigned long sp)
{
 start_thread_common(regs, pc);
 regs->pstate = 0x00000010;
 if (pc & 1)
  regs->pstate |= 0x00000020;





 regs->regs[13] = sp;
}



struct task_struct;


extern void release_thread(struct task_struct *);

unsigned long get_wchan(struct task_struct *p);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpu_relax(void)
{
 asm volatile("yield" ::: "memory");
}


extern struct task_struct *cpu_switch_to(struct task_struct *prev,
      struct task_struct *next);
# 194 "./arch/arm64/include/asm/processor.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void prefetch(const void *ptr)
{
 asm volatile("prfm pldl1keep, %a0\n" : : "p" (ptr));
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void prefetchw(const void *ptr)
{
 asm volatile("prfm pstl1keep, %a0\n" : : "p" (ptr));
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void spin_lock_prefetch(const void *ptr)
{
 asm volatile("prfm pstl1strm, %a0"

              : : "p" (ptr));
}





int cpu_enable_pan(void *__unused);
int cpu_enable_cache_maint_trap(void *__unused);
# 44 "./include/linux/rcupdate.h" 2
# 1 "./include/linux/cpumask.h" 1
# 11 "./include/linux/cpumask.h"
# 1 "./include/linux/threads.h" 1
# 12 "./include/linux/cpumask.h" 2
# 1 "./include/linux/bitmap.h" 1
# 93 "./include/linux/bitmap.h"
extern int __bitmap_empty(const unsigned long *bitmap, unsigned int nbits);
extern int __bitmap_full(const unsigned long *bitmap, unsigned int nbits);
extern int __bitmap_equal(const unsigned long *bitmap1,
     const unsigned long *bitmap2, unsigned int nbits);
extern void __bitmap_complement(unsigned long *dst, const unsigned long *src,
   unsigned int nbits);
extern void __bitmap_shift_right(unsigned long *dst, const unsigned long *src,
    unsigned int shift, unsigned int nbits);
extern void __bitmap_shift_left(unsigned long *dst, const unsigned long *src,
    unsigned int shift, unsigned int nbits);
extern int __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
extern int __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
   const unsigned long *bitmap2, unsigned int nbits);
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
# 138 "./include/linux/bitmap.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long
bitmap_find_next_zero_area(unsigned long *map,
      unsigned long size,
      unsigned long start,
      unsigned int nr,
      unsigned long align_mask)
{
 return bitmap_find_next_zero_area_off(map, size, start, nr,
           align_mask, 0);
}

extern int __bitmap_parse(const char *buf, unsigned int buflen, int is_user,
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
extern unsigned int bitmap_from_u32array(unsigned long *bitmap,
      unsigned int nbits,
      const u32 *buf,
      unsigned int nwords);
extern unsigned int bitmap_to_u32array(u32 *buf,
           unsigned int nwords,
           const unsigned long *bitmap,
           unsigned int nbits);





extern unsigned int bitmap_ord_to_pos(const unsigned long *bitmap, unsigned int ord, unsigned int nbits);
extern int bitmap_print_to_pagebuf(bool list, char *buf,
       const unsigned long *maskp, int nmaskbits);







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void bitmap_zero(unsigned long *dst, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = 0UL;
 else {
  unsigned int len = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(unsigned long);
  memset(dst, 0, len);
 }
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void bitmap_fill(unsigned long *dst, unsigned int nbits)
{
 unsigned int nlongs = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)));
 if (!(__builtin_constant_p(nbits) && (nbits) <= 64)) {
  unsigned int len = (nlongs - 1) * sizeof(unsigned long);
  memset(dst, 0xff, len);
 }
 dst[nlongs - 1] = (~0UL >> (-(nbits) & (64 - 1)));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void bitmap_copy(unsigned long *dst, const unsigned long *src,
   unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = *src;
 else {
  unsigned int len = (((nbits) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(unsigned long);
  memcpy(dst, src, len);
 }
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int bitmap_and(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return (*dst = *src1 & *src2 & (~0UL >> (-(nbits) & (64 - 1)))) != 0;
 return __bitmap_and(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void bitmap_or(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = *src1 | *src2;
 else
  __bitmap_or(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void bitmap_xor(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = *src1 ^ *src2;
 else
  __bitmap_xor(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int bitmap_andnot(unsigned long *dst, const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return (*dst = *src1 & ~(*src2) & (~0UL >> (-(nbits) & (64 - 1)))) != 0;
 return __bitmap_andnot(dst, src1, src2, nbits);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void bitmap_complement(unsigned long *dst, const unsigned long *src,
   unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = ~(*src);
 else
  __bitmap_complement(dst, src, nbits);
}
# 272 "./include/linux/bitmap.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int bitmap_equal(const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return !((*src1 ^ *src2) & (~0UL >> (-(nbits) & (64 - 1))));
 if (__builtin_constant_p(nbits & (8 - 1)) &&
     (((nbits) & ((typeof(nbits))(8) - 1)) == 0))
  return !memcmp(src1, src2, nbits / 8);
 return __bitmap_equal(src1, src2, nbits);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int bitmap_intersects(const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return ((*src1 & *src2) & (~0UL >> (-(nbits) & (64 - 1)))) != 0;
 else
  return __bitmap_intersects(src1, src2, nbits);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int bitmap_subset(const unsigned long *src1,
   const unsigned long *src2, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return ! ((*src1 & ~(*src2)) & (~0UL >> (-(nbits) & (64 - 1))));
 else
  return __bitmap_subset(src1, src2, nbits);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int bitmap_empty(const unsigned long *src, unsigned nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return ! (*src & (~0UL >> (-(nbits) & (64 - 1))));

 return find_next_bit((src), (nbits), 0) == nbits;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int bitmap_full(const unsigned long *src, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return ! (~(*src) & (~0UL >> (-(nbits) & (64 - 1))));

 return find_next_zero_bit((src), (nbits), 0) == nbits;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) int bitmap_weight(const unsigned long *src, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  return hweight_long(*src & (~0UL >> (-(nbits) & (64 - 1))));
 return __bitmap_weight(src, nbits);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void bitmap_set(unsigned long *map, unsigned int start,
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

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void bitmap_clear(unsigned long *map, unsigned int start,
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

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void bitmap_shift_right(unsigned long *dst, const unsigned long *src,
    unsigned int shift, int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = (*src & (~0UL >> (-(nbits) & (64 - 1)))) >> shift;
 else
  __bitmap_shift_right(dst, src, shift, nbits);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void bitmap_shift_left(unsigned long *dst, const unsigned long *src,
    unsigned int shift, unsigned int nbits)
{
 if ((__builtin_constant_p(nbits) && (nbits) <= 64))
  *dst = (*src << shift) & (~0UL >> (-(nbits) & (64 - 1)));
 else
  __bitmap_shift_left(dst, src, shift, nbits);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int bitmap_parse(const char *buf, unsigned int buflen,
   unsigned long *maskp, int nmaskbits)
{
 return __bitmap_parse(buf, buflen, 0, maskp, nmaskbits);
}
# 418 "./include/linux/bitmap.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void bitmap_from_u64(unsigned long *dst, u64 mask)
{
 dst[0] = mask & (~0UL);

 if (sizeof(mask) > sizeof(unsigned long))
  dst[1] = mask >> 32;
}
# 13 "./include/linux/cpumask.h" 2



typedef struct cpumask { unsigned long bits[(((64) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))]; } cpumask_t;
# 38 "./include/linux/cpumask.h"
extern unsigned int nr_cpu_ids;
# 89 "./include/linux/cpumask.h"
extern struct cpumask __cpu_possible_mask;
extern struct cpumask __cpu_online_mask;
extern struct cpumask __cpu_present_mask;
extern struct cpumask __cpu_active_mask;
# 119 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int cpumask_check(unsigned int cpu)
{



 return cpu;
}
# 179 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int cpumask_first(const struct cpumask *srcp)
{
 return find_next_bit((((srcp)->bits)), (((unsigned int)64)), 0);
}

unsigned int cpumask_next(int n, const struct cpumask *srcp);
# 193 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int cpumask_next_zero(int n, const struct cpumask *srcp)
{

 if (n != -1)
  cpumask_check(n);
 return find_next_zero_bit(((srcp)->bits), ((unsigned int)64), n+1);
}

int cpumask_next_and(int n, const struct cpumask *, const struct cpumask *);
int cpumask_any_but(const struct cpumask *mask, unsigned int cpu);
unsigned int cpumask_local_spread(unsigned int i, int node);
# 229 "./include/linux/cpumask.h"
extern int cpumask_next_wrap(int n, const struct cpumask *mask, int start, bool wrap);
# 281 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
{
 set_bit(cpumask_check(cpu), ((dstp)->bits));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
{
 __set_bit(cpumask_check(cpu), ((dstp)->bits));
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpumask_clear_cpu(int cpu, struct cpumask *dstp)
{
 clear_bit(cpumask_check(cpu), ((dstp)->bits));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __cpumask_clear_cpu(int cpu, struct cpumask *dstp)
{
 __clear_bit(cpumask_check(cpu), ((dstp)->bits));
}
# 314 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
{
 return test_bit(cpumask_check(cpu), (((cpumask))->bits));
}
# 328 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int cpumask_test_and_set_cpu(int cpu, struct cpumask *cpumask)
{
 return test_and_set_bit(cpumask_check(cpu), ((cpumask)->bits));
}
# 342 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int cpumask_test_and_clear_cpu(int cpu, struct cpumask *cpumask)
{
 return test_and_clear_bit(cpumask_check(cpu), ((cpumask)->bits));
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpumask_setall(struct cpumask *dstp)
{
 bitmap_fill(((dstp)->bits), ((unsigned int)64));
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpumask_clear(struct cpumask *dstp)
{
 bitmap_zero(((dstp)->bits), ((unsigned int)64));
}
# 373 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int cpumask_and(struct cpumask *dstp,
          const struct cpumask *src1p,
          const struct cpumask *src2p)
{
 return bitmap_and(((dstp)->bits), ((src1p)->bits),
           ((src2p)->bits), ((unsigned int)64));
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpumask_or(struct cpumask *dstp, const struct cpumask *src1p,
         const struct cpumask *src2p)
{
 bitmap_or(((dstp)->bits), ((src1p)->bits),
          ((src2p)->bits), ((unsigned int)64));
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpumask_xor(struct cpumask *dstp,
          const struct cpumask *src1p,
          const struct cpumask *src2p)
{
 bitmap_xor(((dstp)->bits), ((src1p)->bits),
           ((src2p)->bits), ((unsigned int)64));
}
# 416 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int cpumask_andnot(struct cpumask *dstp,
      const struct cpumask *src1p,
      const struct cpumask *src2p)
{
 return bitmap_andnot(((dstp)->bits), ((src1p)->bits),
       ((src2p)->bits), ((unsigned int)64));
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpumask_complement(struct cpumask *dstp,
          const struct cpumask *srcp)
{
 bitmap_complement(((dstp)->bits), ((srcp)->bits),
           ((unsigned int)64));
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool cpumask_equal(const struct cpumask *src1p,
    const struct cpumask *src2p)
{
 return bitmap_equal(((src1p)->bits), ((src2p)->bits),
       ((unsigned int)64));
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool cpumask_intersects(const struct cpumask *src1p,
         const struct cpumask *src2p)
{
 return bitmap_intersects(((src1p)->bits), ((src2p)->bits),
            ((unsigned int)64));
}
# 467 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int cpumask_subset(const struct cpumask *src1p,
     const struct cpumask *src2p)
{
 return bitmap_subset(((src1p)->bits), ((src2p)->bits),
        ((unsigned int)64));
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool cpumask_empty(const struct cpumask *srcp)
{
 return bitmap_empty(((srcp)->bits), ((unsigned int)64));
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool cpumask_full(const struct cpumask *srcp)
{
 return bitmap_full(((srcp)->bits), ((unsigned int)64));
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int cpumask_weight(const struct cpumask *srcp)
{
 return bitmap_weight(((srcp)->bits), ((unsigned int)64));
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpumask_shift_right(struct cpumask *dstp,
           const struct cpumask *srcp, int n)
{
 bitmap_shift_right(((dstp)->bits), ((srcp)->bits), n,
            ((unsigned int)64));
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpumask_shift_left(struct cpumask *dstp,
          const struct cpumask *srcp, int n)
{
 bitmap_shift_left(((dstp)->bits), ((srcp)->bits), n,
           ((unsigned int)64));
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpumask_copy(struct cpumask *dstp,
    const struct cpumask *srcp)
{
 bitmap_copy(((dstp)->bits), ((srcp)->bits), ((unsigned int)64));
}
# 578 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int cpumask_parse_user(const char *buf, int len,
         struct cpumask *dstp)
{
 return bitmap_parse_user(buf, len, ((dstp)->bits), ((unsigned int)64));
}
# 592 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int cpumask_parselist_user(const char *buf, int len,
         struct cpumask *dstp)
{
 return bitmap_parselist_user(buf, len, ((dstp)->bits),
         ((unsigned int)64));
}
# 606 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int cpumask_parse(const char *buf, struct cpumask *dstp)
{
 char *nl = strchr(buf, '\n');
 unsigned int len = nl ? (unsigned int)(nl - buf) : strlen(buf);

 return bitmap_parse(buf, len, ((dstp)->bits), ((unsigned int)64));
}
# 621 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int cpulist_parse(const char *buf, struct cpumask *dstp)
{
 return bitmap_parselist(buf, ((dstp)->bits), ((unsigned int)64));
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) size_t cpumask_size(void)
{
 return (((((unsigned int)64)) + (8 * sizeof(long)) - 1) / (8 * sizeof(long))) * sizeof(long);
}
# 694 "./include/linux/cpumask.h"
typedef struct cpumask cpumask_var_t[1];




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool alloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
{
 return true;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool alloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags,
       int node)
{
 return true;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool zalloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
{
 cpumask_clear(*mask);
 return true;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool zalloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags,
       int node)
{
 cpumask_clear(*mask);
 return true;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void alloc_bootmem_cpumask_var(cpumask_var_t *mask)
{
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void free_cpumask_var(cpumask_var_t mask)
{
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void free_bootmem_cpumask_var(cpumask_var_t mask)
{
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool cpumask_available(cpumask_var_t mask)
{
 return true;
}




extern const unsigned long cpu_all_bits[(((64) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];
# 754 "./include/linux/cpumask.h"
void init_cpu_present(const struct cpumask *src);
void init_cpu_possible(const struct cpumask *src);
void init_cpu_online(const struct cpumask *src);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void reset_cpu_possible_mask(void)
{
 bitmap_zero(((&__cpu_possible_mask)->bits), 64);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
set_cpu_possible(unsigned int cpu, bool possible)
{
 if (possible)
  cpumask_set_cpu(cpu, &__cpu_possible_mask);
 else
  cpumask_clear_cpu(cpu, &__cpu_possible_mask);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
set_cpu_present(unsigned int cpu, bool present)
{
 if (present)
  cpumask_set_cpu(cpu, &__cpu_present_mask);
 else
  cpumask_clear_cpu(cpu, &__cpu_present_mask);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
set_cpu_online(unsigned int cpu, bool online)
{
 if (online)
  cpumask_set_cpu(cpu, &__cpu_online_mask);
 else
  cpumask_clear_cpu(cpu, &__cpu_online_mask);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
set_cpu_active(unsigned int cpu, bool active)
{
 if (active)
  cpumask_set_cpu(cpu, &__cpu_active_mask);
 else
  cpumask_clear_cpu(cpu, &__cpu_active_mask);
}
# 814 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __check_is_bitmap(const unsigned long *bitmap)
{
 return 1;
}
# 826 "./include/linux/cpumask.h"
extern const unsigned long
 cpu_bit_bitmap[64 +1][(((64) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))];

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) const struct cpumask *get_cpu_mask(unsigned int cpu)
{
 const unsigned long *p = cpu_bit_bitmap[1 + cpu % 64];
 p -= cpu / 64;
 return ((struct cpumask *)(1 ? (p) : (void *)sizeof(__check_is_bitmap(p))));
}
# 863 "./include/linux/cpumask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ssize_t
cpumap_print_to_pagebuf(bool list, char *buf, const struct cpumask *mask)
{
 return bitmap_print_to_pagebuf(list, buf, ((mask)->bits),
          nr_cpu_ids);
}
# 45 "./include/linux/rcupdate.h" 2
# 53 "./include/linux/rcupdate.h"
void call_rcu(struct callback_head *head, rcu_callback_t func);




void call_rcu_bh(struct callback_head *head, rcu_callback_t func);
void call_rcu_sched(struct callback_head *head, rcu_callback_t func);
void synchronize_sched(void);
void rcu_barrier_tasks(void);



void __rcu_read_lock(void);
void __rcu_read_unlock(void);
void rcu_read_unlock_special(struct task_struct *t);
void synchronize_rcu(void);
# 105 "./include/linux/rcupdate.h"
void rcu_init(void);
extern int rcu_scheduler_active __attribute__((__section__(".data..read_mostly")));
void rcu_sched_qs(void);
void rcu_bh_qs(void);
void rcu_check_callbacks(int user);
void rcu_report_dead(unsigned int cpu);
void rcu_cpu_starting(unsigned int cpu);
void rcutree_migrate_callbacks(int cpu);


void rcu_sysrq_start(void);
void rcu_sysrq_end(void);
# 126 "./include/linux/rcupdate.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rcu_user_enter(void) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rcu_user_exit(void) { }





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rcu_init_nohz(void) { }
# 177 "./include/linux/rcupdate.h"
void call_rcu_tasks(struct callback_head *head, rcu_callback_t func);
void synchronize_rcu_tasks(void);
void exit_tasks_rcu_start(void);
void exit_tasks_rcu_finish(void);
# 209 "./include/linux/rcupdate.h"
# 1 "./include/linux/rcutree.h" 1
# 33 "./include/linux/rcutree.h"
void rcu_note_context_switch(bool preempt);
int rcu_needs_cpu(u64 basem, u64 *nextevt);
void rcu_cpu_stall_reset(void);






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rcu_virt_note_context_switch(int cpu)
{
 rcu_note_context_switch(false);
}

void synchronize_rcu_bh(void);
void synchronize_sched_expedited(void);
void synchronize_rcu_expedited(void);

void kfree_call_rcu(struct callback_head *head, rcu_callback_t func);
# 69 "./include/linux/rcutree.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void synchronize_rcu_bh_expedited(void)
{
 synchronize_sched_expedited();
}

void rcu_barrier(void);
void rcu_barrier_bh(void);
void rcu_barrier_sched(void);
unsigned long get_state_synchronize_rcu(void);
void cond_synchronize_rcu(unsigned long oldstate);
unsigned long get_state_synchronize_sched(void);
void cond_synchronize_sched(unsigned long oldstate);

void rcu_idle_enter(void);
void rcu_idle_exit(void);
void rcu_irq_enter(void);
void rcu_irq_exit(void);
void rcu_irq_enter_irqson(void);
void rcu_irq_exit_irqson(void);
bool rcu_irq_enter_disabled(void);

void exit_rcu(void);

void rcu_scheduler_starting(void);
extern int rcu_scheduler_active __attribute__((__section__(".data..read_mostly")));
void rcu_end_inkernel_boot(void);
bool rcu_is_watching(void);
void rcu_all_qs(void);


int rcutree_prepare_cpu(unsigned int cpu);
int rcutree_online_cpu(unsigned int cpu);
int rcutree_offline_cpu(unsigned int cpu);
int rcutree_dead_cpu(unsigned int cpu);
int rcutree_dying_cpu(unsigned int cpu);
# 210 "./include/linux/rcupdate.h" 2
# 228 "./include/linux/rcupdate.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void init_rcu_head(struct callback_head *head) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void destroy_rcu_head(struct callback_head *head) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void init_rcu_head_on_stack(struct callback_head *head) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void destroy_rcu_head_on_stack(struct callback_head *head) { }





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool rcu_lockdep_current_cpu_online(void) { return true; }
# 266 "./include/linux/rcupdate.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rcu_read_lock_held(void)
{
 return 1;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rcu_read_lock_bh_held(void)
{
 return 1;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rcu_read_lock_sched_held(void)
{
 return !(preempt_count() == 0 && !({ unsigned long _flags; do { ({ unsigned long __dummy; typeof(_flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); _flags = arch_local_save_flags(); } while (0); ({ ({ unsigned long __dummy; typeof(_flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); arch_irqs_disabled_flags(_flags); }); }));
}
# 627 "./include/linux/rcupdate.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rcu_read_lock(void)
{
 __rcu_read_lock();
 (void)0;
 do { } while (0);
 do { } while (0)
                                                ;
}
# 681 "./include/linux/rcupdate.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rcu_read_unlock(void)
{
 do { } while (0)
                                                  ;
 (void)0;
 __rcu_read_unlock();
 do { } while (0);
}
# 707 "./include/linux/rcupdate.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rcu_read_lock_bh(void)
{
 local_bh_disable();
 (void)0;
 do { } while (0);
 do { } while (0)
                                                   ;
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rcu_read_unlock_bh(void)
{
 do { } while (0)
                                                     ;
 do { } while (0);
 (void)0;
 local_bh_enable();
}
# 743 "./include/linux/rcupdate.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rcu_read_lock_sched(void)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 (void)0;
 do { } while (0);
 do { } while (0)
                                                      ;
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((no_instrument_function)) void rcu_read_lock_sched_notrace(void)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 (void)0;
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rcu_read_unlock_sched(void)
{
 do { } while (0)
                                                        ;
 do { } while (0);
 (void)0;
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((no_instrument_function)) void rcu_read_unlock_sched_notrace(void)
{
 (void)0;
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule_notrace(); } while (0);
}
# 12 "./include/linux/rculist.h" 2
# 31 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void INIT_LIST_HEAD_RCU(struct list_head *list)
{
 ({ union { typeof(list->next) __val; char __c[1]; } __u = { .__val = ( typeof(list->next)) (list) }; __write_once_size(&(list->next), __u.__c, sizeof(list->next)); __u.__val; });
 ({ union { typeof(list->prev) __val; char __c[1]; } __u = { .__val = ( typeof(list->prev)) (list) }; __write_once_size(&(list->prev), __u.__c, sizeof(list->prev)); __u.__val; });
}
# 49 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __list_add_rcu(struct list_head *new,
  struct list_head *prev, struct list_head *next)
{
 if (!__list_add_valid(new, prev, next))
  return;

 new->next = next;
 new->prev = prev;
 ({ uintptr_t _r_a_p__v = (uintptr_t)(new); if (__builtin_constant_p(new) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof(((*((struct list_head **)(&(prev)->next))))) __val; char __c[1]; } __u = { .__val = ( typeof(((*((struct list_head **)(&(prev)->next)))))) ((typeof((*((struct list_head **)(&(prev)->next)))))(_r_a_p__v)) }; __write_once_size(&(((*((struct list_head **)(&(prev)->next))))), __u.__c, sizeof(((*((struct list_head **)(&(prev)->next)))))); __u.__val; }); else do { union { typeof(*&(*((struct list_head **)(&(prev)->next)))) __val; char __c[1]; } __u = { .__val = ( typeof(*&(*((struct list_head **)(&(prev)->next))))) ((typeof(*((typeof((*((struct list_head **)(&(prev)->next)))))_r_a_p__v)) *)((typeof((*((struct list_head **)(&(prev)->next)))))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&(*((struct list_head **)(&(prev)->next)))) == sizeof(char) || sizeof(*&(*((struct list_head **)(&(prev)->next)))) == sizeof(short) || sizeof(*&(*((struct list_head **)(&(prev)->next)))) == sizeof(int) || sizeof(*&(*((struct list_head **)(&(prev)->next)))) == sizeof(long))); extern void __compiletime_assert_57(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_57(); do { } while (0); } while (0); switch (sizeof(*&(*((struct list_head **)(&(prev)->next))))) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&(*((struct list_head **)(&(prev)->next)))) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&(*((struct list_head **)(&(prev)->next)))) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&(*((struct list_head **)(&(prev)->next)))) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&(*((struct list_head **)(&(prev)->next)))) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });
 next->prev = new;
}
# 77 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_add_rcu(struct list_head *new, struct list_head *head)
{
 __list_add_rcu(new, head, head->next);
}
# 98 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_add_tail_rcu(struct list_head *new,
     struct list_head *head)
{
 __list_add_rcu(new, head->prev, head);
}
# 128 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_del_rcu(struct list_head *entry)
{
 __list_del_entry(entry);
 entry->prev = ((void *) 0x200 + (0xdead000000000000UL));
}
# 154 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_del_init_rcu(struct hlist_node *n)
{
 if (!hlist_unhashed(n)) {
  __hlist_del(n);
  n->pprev = ((void *)0);
 }
}
# 170 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_replace_rcu(struct list_head *old,
    struct list_head *new)
{
 new->next = old->next;
 new->prev = old->prev;
 ({ uintptr_t _r_a_p__v = (uintptr_t)(new); if (__builtin_constant_p(new) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof(((*((struct list_head **)(&(new->prev)->next))))) __val; char __c[1]; } __u = { .__val = ( typeof(((*((struct list_head **)(&(new->prev)->next)))))) ((typeof((*((struct list_head **)(&(new->prev)->next)))))(_r_a_p__v)) }; __write_once_size(&(((*((struct list_head **)(&(new->prev)->next))))), __u.__c, sizeof(((*((struct list_head **)(&(new->prev)->next)))))); __u.__val; }); else do { union { typeof(*&(*((struct list_head **)(&(new->prev)->next)))) __val; char __c[1]; } __u = { .__val = ( typeof(*&(*((struct list_head **)(&(new->prev)->next))))) ((typeof(*((typeof((*((struct list_head **)(&(new->prev)->next)))))_r_a_p__v)) *)((typeof((*((struct list_head **)(&(new->prev)->next)))))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&(*((struct list_head **)(&(new->prev)->next)))) == sizeof(char) || sizeof(*&(*((struct list_head **)(&(new->prev)->next)))) == sizeof(short) || sizeof(*&(*((struct list_head **)(&(new->prev)->next)))) == sizeof(int) || sizeof(*&(*((struct list_head **)(&(new->prev)->next)))) == sizeof(long))); extern void __compiletime_assert_175(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_175(); do { } while (0); } while (0); switch (sizeof(*&(*((struct list_head **)(&(new->prev)->next))))) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&(*((struct list_head **)(&(new->prev)->next)))) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&(*((struct list_head **)(&(new->prev)->next)))) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&(*((struct list_head **)(&(new->prev)->next)))) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&(*((struct list_head **)(&(new->prev)->next)))) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });
 new->next->prev = new;
 old->prev = ((void *) 0x200 + (0xdead000000000000UL));
}
# 199 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __list_splice_init_rcu(struct list_head *list,
       struct list_head *prev,
       struct list_head *next,
       void (*sync)(void))
{
 struct list_head *first = list->next;
 struct list_head *last = list->prev;







 INIT_LIST_HEAD_RCU(list);
# 222 "./include/linux/rculist.h"
 sync();
# 232 "./include/linux/rculist.h"
 last->next = next;
 ({ uintptr_t _r_a_p__v = (uintptr_t)(first); if (__builtin_constant_p(first) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof(((*((struct list_head **)(&(prev)->next))))) __val; char __c[1]; } __u = { .__val = ( typeof(((*((struct list_head **)(&(prev)->next)))))) ((typeof((*((struct list_head **)(&(prev)->next)))))(_r_a_p__v)) }; __write_once_size(&(((*((struct list_head **)(&(prev)->next))))), __u.__c, sizeof(((*((struct list_head **)(&(prev)->next)))))); __u.__val; }); else do { union { typeof(*&(*((struct list_head **)(&(prev)->next)))) __val; char __c[1]; } __u = { .__val = ( typeof(*&(*((struct list_head **)(&(prev)->next))))) ((typeof(*((typeof((*((struct list_head **)(&(prev)->next)))))_r_a_p__v)) *)((typeof((*((struct list_head **)(&(prev)->next)))))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&(*((struct list_head **)(&(prev)->next)))) == sizeof(char) || sizeof(*&(*((struct list_head **)(&(prev)->next)))) == sizeof(short) || sizeof(*&(*((struct list_head **)(&(prev)->next)))) == sizeof(int) || sizeof(*&(*((struct list_head **)(&(prev)->next)))) == sizeof(long))); extern void __compiletime_assert_233(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_233(); do { } while (0); } while (0); switch (sizeof(*&(*((struct list_head **)(&(prev)->next))))) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&(*((struct list_head **)(&(prev)->next)))) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&(*((struct list_head **)(&(prev)->next)))) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&(*((struct list_head **)(&(prev)->next)))) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&(*((struct list_head **)(&(prev)->next)))) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });
 first->prev = prev;
 next->prev = last;
}
# 245 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_splice_init_rcu(struct list_head *list,
     struct list_head *head,
     void (*sync)(void))
{
 if (!list_empty(list))
  __list_splice_init_rcu(list, head, head->next, sync);
}
# 260 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void list_splice_tail_init_rcu(struct list_head *list,
          struct list_head *head,
          void (*sync)(void))
{
 if (!list_empty(list))
  __list_splice_init_rcu(list, head->prev, head, sync);
}
# 425 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_del_rcu(struct hlist_node *n)
{
 __hlist_del(n);
 n->pprev = ((void *) 0x200 + (0xdead000000000000UL));
}
# 438 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_replace_rcu(struct hlist_node *old,
     struct hlist_node *new)
{
 struct hlist_node *next = old->next;

 new->next = next;
 new->pprev = old->pprev;
 ({ uintptr_t _r_a_p__v = (uintptr_t)(new); if (__builtin_constant_p(new) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof((*(struct hlist_node **)new->pprev)) __val; char __c[1]; } __u = { .__val = ( typeof((*(struct hlist_node **)new->pprev))) ((typeof(*(struct hlist_node **)new->pprev))(_r_a_p__v)) }; __write_once_size(&((*(struct hlist_node **)new->pprev)), __u.__c, sizeof((*(struct hlist_node **)new->pprev))); __u.__val; }); else do { union { typeof(*&*(struct hlist_node **)new->pprev) __val; char __c[1]; } __u = { .__val = ( typeof(*&*(struct hlist_node **)new->pprev)) ((typeof(*((typeof(*(struct hlist_node **)new->pprev))_r_a_p__v)) *)((typeof(*(struct hlist_node **)new->pprev))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&*(struct hlist_node **)new->pprev) == sizeof(char) || sizeof(*&*(struct hlist_node **)new->pprev) == sizeof(short) || sizeof(*&*(struct hlist_node **)new->pprev) == sizeof(int) || sizeof(*&*(struct hlist_node **)new->pprev) == sizeof(long))); extern void __compiletime_assert_445(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_445(); do { } while (0); } while (0); switch (sizeof(*&*(struct hlist_node **)new->pprev)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&*(struct hlist_node **)new->pprev) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&*(struct hlist_node **)new->pprev) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&*(struct hlist_node **)new->pprev) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&*(struct hlist_node **)new->pprev) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });
 if (next)
  new->next->pprev = &new->next;
 old->pprev = ((void *) 0x200 + (0xdead000000000000UL));
}
# 477 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_add_head_rcu(struct hlist_node *n,
     struct hlist_head *h)
{
 struct hlist_node *first = h->first;

 n->next = first;
 n->pprev = &h->first;
 ({ uintptr_t _r_a_p__v = (uintptr_t)(n); if (__builtin_constant_p(n) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof(((*((struct hlist_node **)(&(h)->first))))) __val; char __c[1]; } __u = { .__val = ( typeof(((*((struct hlist_node **)(&(h)->first)))))) ((typeof((*((struct hlist_node **)(&(h)->first)))))(_r_a_p__v)) }; __write_once_size(&(((*((struct hlist_node **)(&(h)->first))))), __u.__c, sizeof(((*((struct hlist_node **)(&(h)->first)))))); __u.__val; }); else do { union { typeof(*&(*((struct hlist_node **)(&(h)->first)))) __val; char __c[1]; } __u = { .__val = ( typeof(*&(*((struct hlist_node **)(&(h)->first))))) ((typeof(*((typeof((*((struct hlist_node **)(&(h)->first)))))_r_a_p__v)) *)((typeof((*((struct hlist_node **)(&(h)->first)))))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&(*((struct hlist_node **)(&(h)->first)))) == sizeof(char) || sizeof(*&(*((struct hlist_node **)(&(h)->first)))) == sizeof(short) || sizeof(*&(*((struct hlist_node **)(&(h)->first)))) == sizeof(int) || sizeof(*&(*((struct hlist_node **)(&(h)->first)))) == sizeof(long))); extern void __compiletime_assert_484(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_484(); do { } while (0); } while (0); switch (sizeof(*&(*((struct hlist_node **)(&(h)->first))))) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&(*((struct hlist_node **)(&(h)->first)))) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&(*((struct hlist_node **)(&(h)->first)))) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&(*((struct hlist_node **)(&(h)->first)))) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&(*((struct hlist_node **)(&(h)->first)))) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });
 if (first)
  first->pprev = &n->next;
}
# 508 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_add_tail_rcu(struct hlist_node *n,
          struct hlist_head *h)
{
 struct hlist_node *i, *last = ((void *)0);


 for (i = h->first; i; i = i->next)
  last = i;

 if (last) {
  n->next = last->next;
  n->pprev = &last->next;
  ({ uintptr_t _r_a_p__v = (uintptr_t)(n); if (__builtin_constant_p(n) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof(((*((struct hlist_node **)(&(last)->next))))) __val; char __c[1]; } __u = { .__val = ( typeof(((*((struct hlist_node **)(&(last)->next)))))) ((typeof((*((struct hlist_node **)(&(last)->next)))))(_r_a_p__v)) }; __write_once_size(&(((*((struct hlist_node **)(&(last)->next))))), __u.__c, sizeof(((*((struct hlist_node **)(&(last)->next)))))); __u.__val; }); else do { union { typeof(*&(*((struct hlist_node **)(&(last)->next)))) __val; char __c[1]; } __u = { .__val = ( typeof(*&(*((struct hlist_node **)(&(last)->next))))) ((typeof(*((typeof((*((struct hlist_node **)(&(last)->next)))))_r_a_p__v)) *)((typeof((*((struct hlist_node **)(&(last)->next)))))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&(*((struct hlist_node **)(&(last)->next)))) == sizeof(char) || sizeof(*&(*((struct hlist_node **)(&(last)->next)))) == sizeof(short) || sizeof(*&(*((struct hlist_node **)(&(last)->next)))) == sizeof(int) || sizeof(*&(*((struct hlist_node **)(&(last)->next)))) == sizeof(long))); extern void __compiletime_assert_520(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_520(); do { } while (0); } while (0); switch (sizeof(*&(*((struct hlist_node **)(&(last)->next))))) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&(*((struct hlist_node **)(&(last)->next)))) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&(*((struct hlist_node **)(&(last)->next)))) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&(*((struct hlist_node **)(&(last)->next)))) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&(*((struct hlist_node **)(&(last)->next)))) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });
 } else {
  hlist_add_head_rcu(n, h);
 }
}
# 544 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_add_before_rcu(struct hlist_node *n,
     struct hlist_node *next)
{
 n->pprev = next->pprev;
 n->next = next;
 ({ uintptr_t _r_a_p__v = (uintptr_t)(n); if (__builtin_constant_p(n) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof(((*((struct hlist_node **)((n)->pprev))))) __val; char __c[1]; } __u = { .__val = ( typeof(((*((struct hlist_node **)((n)->pprev)))))) ((typeof((*((struct hlist_node **)((n)->pprev)))))(_r_a_p__v)) }; __write_once_size(&(((*((struct hlist_node **)((n)->pprev))))), __u.__c, sizeof(((*((struct hlist_node **)((n)->pprev)))))); __u.__val; }); else do { union { typeof(*&(*((struct hlist_node **)((n)->pprev)))) __val; char __c[1]; } __u = { .__val = ( typeof(*&(*((struct hlist_node **)((n)->pprev))))) ((typeof(*((typeof((*((struct hlist_node **)((n)->pprev)))))_r_a_p__v)) *)((typeof((*((struct hlist_node **)((n)->pprev)))))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&(*((struct hlist_node **)((n)->pprev)))) == sizeof(char) || sizeof(*&(*((struct hlist_node **)((n)->pprev)))) == sizeof(short) || sizeof(*&(*((struct hlist_node **)((n)->pprev)))) == sizeof(int) || sizeof(*&(*((struct hlist_node **)((n)->pprev)))) == sizeof(long))); extern void __compiletime_assert_549(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_549(); do { } while (0); } while (0); switch (sizeof(*&(*((struct hlist_node **)((n)->pprev))))) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&(*((struct hlist_node **)((n)->pprev)))) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&(*((struct hlist_node **)((n)->pprev)))) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&(*((struct hlist_node **)((n)->pprev)))) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&(*((struct hlist_node **)((n)->pprev)))) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });
 next->pprev = &n->next;
}
# 571 "./include/linux/rculist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_add_behind_rcu(struct hlist_node *n,
     struct hlist_node *prev)
{
 n->next = prev->next;
 n->pprev = &prev->next;
 ({ uintptr_t _r_a_p__v = (uintptr_t)(n); if (__builtin_constant_p(n) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof(((*((struct hlist_node **)(&(prev)->next))))) __val; char __c[1]; } __u = { .__val = ( typeof(((*((struct hlist_node **)(&(prev)->next)))))) ((typeof((*((struct hlist_node **)(&(prev)->next)))))(_r_a_p__v)) }; __write_once_size(&(((*((struct hlist_node **)(&(prev)->next))))), __u.__c, sizeof(((*((struct hlist_node **)(&(prev)->next)))))); __u.__val; }); else do { union { typeof(*&(*((struct hlist_node **)(&(prev)->next)))) __val; char __c[1]; } __u = { .__val = ( typeof(*&(*((struct hlist_node **)(&(prev)->next))))) ((typeof(*((typeof((*((struct hlist_node **)(&(prev)->next)))))_r_a_p__v)) *)((typeof((*((struct hlist_node **)(&(prev)->next)))))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&(*((struct hlist_node **)(&(prev)->next)))) == sizeof(char) || sizeof(*&(*((struct hlist_node **)(&(prev)->next)))) == sizeof(short) || sizeof(*&(*((struct hlist_node **)(&(prev)->next)))) == sizeof(int) || sizeof(*&(*((struct hlist_node **)(&(prev)->next)))) == sizeof(long))); extern void __compiletime_assert_576(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_576(); do { } while (0); } while (0); switch (sizeof(*&(*((struct hlist_node **)(&(prev)->next))))) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&(*((struct hlist_node **)(&(prev)->next)))) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&(*((struct hlist_node **)(&(prev)->next)))) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&(*((struct hlist_node **)(&(prev)->next)))) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&(*((struct hlist_node **)(&(prev)->next)))) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });
 if (n->next)
  n->next->pprev = &n->next;
}
# 6 "./include/linux/pid.h" 2

enum pid_type
{
 PIDTYPE_PID,
 PIDTYPE_PGID,
 PIDTYPE_SID,
 PIDTYPE_MAX,

 __PIDTYPE_TGID
};
# 53 "./include/linux/pid.h"
struct upid {

 int nr;
 struct pid_namespace *ns;
 struct hlist_node pid_chain;
};

struct pid
{
 atomic_t count;
 unsigned int level;

 struct hlist_head tasks[PIDTYPE_MAX];
 struct callback_head rcu;
 struct upid numbers[1];
};

extern struct pid init_struct_pid;

struct pid_link
{
 struct hlist_node node;
 struct pid *pid;
};

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct pid *get_pid(struct pid *pid)
{
 if (pid)
  atomic_add(1, (&pid->count));
 return pid;
}

extern void put_pid(struct pid *pid);
extern struct task_struct *pid_task(struct pid *pid, enum pid_type);
extern struct task_struct *get_pid_task(struct pid *pid, enum pid_type);

extern struct pid *get_task_pid(struct task_struct *task, enum pid_type type);




extern void attach_pid(struct task_struct *task, enum pid_type);
extern void detach_pid(struct task_struct *task, enum pid_type);
extern void change_pid(struct task_struct *task, enum pid_type,
   struct pid *pid);
extern void transfer_pid(struct task_struct *old, struct task_struct *new,
    enum pid_type);

struct pid_namespace;
extern struct pid_namespace init_pid_ns;
# 113 "./include/linux/pid.h"
extern struct pid *find_pid_ns(int nr, struct pid_namespace *ns);
extern struct pid *find_vpid(int nr);




extern struct pid *find_get_pid(int nr);
extern struct pid *find_ge_pid(int nr, struct pid_namespace *);
int next_pidmap(struct pid_namespace *pid_ns, unsigned int last);

extern struct pid *alloc_pid(struct pid_namespace *ns);
extern void free_pid(struct pid *pid);
extern void disable_pid_allocation(struct pid_namespace *ns);
# 137 "./include/linux/pid.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct pid_namespace *ns_of_pid(struct pid *pid)
{
 struct pid_namespace *ns = ((void *)0);
 if (pid)
  ns = pid->numbers[pid->level].ns;
 return ns;
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool is_child_reaper(struct pid *pid)
{
 return pid->numbers[pid->level].nr == 1;
}
# 167 "./include/linux/pid.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t pid_nr(struct pid *pid)
{
 pid_t nr = 0;
 if (pid)
  nr = pid->numbers[0].nr;
 return nr;
}

pid_t pid_nr_ns(struct pid *pid, struct pid_namespace *ns);
pid_t pid_vnr(struct pid *pid);
# 15 "./include/linux/sched.h" 2
# 1 "./include/linux/sem.h" 1







# 1 "./include/linux/time64.h" 1




# 1 "./include/uapi/linux/time.h" 1
# 10 "./include/uapi/linux/time.h"
struct timespec {
 __kernel_time_t tv_sec;
 long tv_nsec;
};


struct timeval {
 __kernel_time_t tv_sec;
 __kernel_suseconds_t tv_usec;
};

struct timezone {
 int tz_minuteswest;
 int tz_dsttime;
};
# 35 "./include/uapi/linux/time.h"
struct itimerspec {
 struct timespec it_interval;
 struct timespec it_value;
};

struct itimerval {
 struct timeval it_interval;
 struct timeval it_value;
};
# 6 "./include/linux/time64.h" 2
# 1 "./include/linux/math64.h" 1





# 1 "./arch/arm64/include/generated/asm/div64.h" 1
# 1 "./include/asm-generic/div64.h" 1
# 1 "./arch/arm64/include/generated/asm/div64.h" 2
# 7 "./include/linux/math64.h" 2
# 19 "./include/linux/math64.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 div_u64_rem(u64 dividend, u32 divisor, u32 *remainder)
{
 *remainder = dividend % divisor;
 return dividend / divisor;
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 div_s64_rem(s64 dividend, s32 divisor, s32 *remainder)
{
 *remainder = dividend % divisor;
 return dividend / divisor;
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
{
 *remainder = dividend % divisor;
 return dividend / divisor;
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 div64_u64(u64 dividend, u64 divisor)
{
 return dividend / divisor;
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 div64_s64(s64 dividend, s64 divisor)
{
 return dividend / divisor;
}
# 98 "./include/linux/math64.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 div_u64(u64 dividend, u32 divisor)
{
 u32 remainder;
 return div_u64_rem(dividend, divisor, &remainder);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 div_s64(s64 dividend, s32 divisor)
{
 s32 remainder;
 return div_s64_rem(dividend, divisor, &remainder);
}


u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) u32
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





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 mul_u32_u32(u32 a, u32 b)
{
 return (u64)a * b;
}
# 166 "./include/linux/math64.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 mul_u64_u32_shr(u64 a, u32 mul, unsigned int shift)
{
 u32 ah, al;
 u64 ret;

 al = a;
 ah = a >> 32;

 ret = mul_u32_u32(al, mul) >> shift;
 if (ah)
  ret += mul_u32_u32(ah, mul) << (32 - shift);

 return ret;
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 mul_u64_u64_shr(u64 a, u64 b, unsigned int shift)
{
 union {
  u64 ll;
  struct {



   u32 low, high;

  } l;
 } rl, rm, rn, rh, a0, b0;
 u64 c;

 a0.ll = a;
 b0.ll = b;

 rl.ll = mul_u32_u32(a0.l.low, b0.l.low);
 rm.ll = mul_u32_u32(a0.l.low, b0.l.high);
 rn.ll = mul_u32_u32(a0.l.high, b0.l.low);
 rh.ll = mul_u32_u32(a0.l.high, b0.l.high);






 rl.l.high = c = (u64)rl.l.high + rm.l.low + rn.l.low;
 rh.l.low = c = (c >> 32) + rm.l.high + rn.l.high + rh.l.low;
 rh.l.high = (c >> 32) + rh.l.high;





 if (shift == 0)
  return rl.ll;
 if (shift < 64)
  return (rl.ll >> shift) | (rh.ll << (64 - shift));
 return rh.ll >> (shift & 63);
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 mul_u64_u32_div(u64 a, u32 mul, u32 divisor)
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
# 7 "./include/linux/time64.h" 2

typedef __s64 time64_t;
typedef __u64 timeu64_t;
# 47 "./include/linux/time64.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct timespec timespec64_to_timespec(const struct timespec ts64)
{
 return ts64;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct timespec timespec_to_timespec64(const struct timespec ts)
{
 return ts;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct itimerspec itimerspec64_to_itimerspec(struct itimerspec *its64)
{
 return *its64;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct itimerspec itimerspec_to_itimerspec64(struct itimerspec *its)
{
 return *its;
}
# 223 "./include/linux/time64.h"
extern struct timespec timespec64_add_safe(const struct timespec lhs,
      const struct timespec rhs);
# 9 "./include/linux/sem.h" 2
# 1 "./include/uapi/linux/sem.h" 1




# 1 "./include/linux/ipc.h" 1




# 1 "./include/linux/spinlock.h" 1
# 82 "./include/linux/spinlock.h"
# 1 "./include/linux/spinlock_types.h" 1
# 13 "./include/linux/spinlock_types.h"
# 1 "./arch/arm64/include/asm/spinlock_types.h" 1
# 27 "./arch/arm64/include/asm/spinlock_types.h"
typedef struct {




 u16 owner;
 u16 next;

} __attribute__((aligned(4))) arch_spinlock_t;



typedef struct {
 volatile unsigned int lock;
} arch_rwlock_t;
# 14 "./include/linux/spinlock_types.h" 2






typedef struct raw_spinlock {
 arch_spinlock_t raw_lock;
# 32 "./include/linux/spinlock_types.h"
} raw_spinlock_t;
# 64 "./include/linux/spinlock_types.h"
typedef struct spinlock {
 union {
  struct raw_spinlock rlock;
# 75 "./include/linux/spinlock_types.h"
 };
} spinlock_t;
# 86 "./include/linux/spinlock_types.h"
# 1 "./include/linux/rwlock_types.h" 1
# 11 "./include/linux/rwlock_types.h"
typedef struct {
 arch_rwlock_t raw_lock;
# 23 "./include/linux/rwlock_types.h"
} rwlock_t;
# 87 "./include/linux/spinlock_types.h" 2
# 83 "./include/linux/spinlock.h" 2





# 1 "./arch/arm64/include/asm/spinlock.h" 1
# 32 "./arch/arm64/include/asm/spinlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void arch_spin_lock(arch_spinlock_t *lock)
{
 unsigned int tmp;
 arch_spinlock_t lockval, newval;

 asm volatile(

 "	prfm	pstl1strm, %3\n" "1:	ldaxr	%w0, %3\n" "	add	%w1, %w0, %w5\n" "	stxr	%w2, %w1, %3\n" "	cbnz	%w2, 1b\n"
# 53 "./arch/arm64/include/asm/spinlock.h"
"	eor	%w1, %w0, %w0, ror #16\n"
"	cbz	%w1, 3f\n"




"	sevl\n"
"2:	wfe\n"
"	ldaxrh	%w2, %4\n"
"	eor	%w1, %w2, %w0, lsr #16\n"
"	cbnz	%w1, 2b\n"

"3:"
 : "=&r" (lockval), "=&r" (newval), "=&r" (tmp), "+Q" (*lock)
 : "Q" (lock->owner), "I" (1 << 16)
 : "memory");
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int arch_spin_trylock(arch_spinlock_t *lock)
{
 unsigned int tmp;
 arch_spinlock_t lockval;

 asm volatile("	prfm	pstl1strm, %2\n" "1:	ldaxr	%w0, %2\n" "	eor	%w1, %w0, %w0, ror #16\n" "	cbnz	%w1, 2f\n" "	add	%w0, %w0, %3\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "2:"
# 95 "./arch/arm64/include/asm/spinlock.h"
 : "=&r" (lockval), "=&r" (tmp), "+Q" (*lock)
 : "I" (1 << 16)
 : "memory");

 return !tmp;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void arch_spin_unlock(arch_spinlock_t *lock)
{
 unsigned long tmp;

 asm volatile("	ldrh	%w1, %0\n" "	add	%w1, %w1, #1\n" "	stlrh	%w1, %0"
# 115 "./arch/arm64/include/asm/spinlock.h"
 : "=Q" (lock->owner), "=&r" (tmp)
 :
 : "memory");
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int arch_spin_value_unlocked(arch_spinlock_t lock)
{
 return lock.owner == lock.next;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int arch_spin_is_locked(arch_spinlock_t *lock)
{




 asm volatile("dmb " "ish" : : : "memory");
 return !arch_spin_value_unlocked(({ union { typeof(*lock) __val; char __c[1]; } __u; if (1) __read_once_size(&(*lock), __u.__c, sizeof(*lock)); else __read_once_size_nocheck(&(*lock), __u.__c, sizeof(*lock)); do { } while (0); __u.__val; }));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int arch_spin_is_contended(arch_spinlock_t *lock)
{
 arch_spinlock_t lockval = ({ union { typeof(*lock) __val; char __c[1]; } __u; if (1) __read_once_size(&(*lock), __u.__c, sizeof(*lock)); else __read_once_size_nocheck(&(*lock), __u.__c, sizeof(*lock)); do { } while (0); __u.__val; });
 return (lockval.next - lockval.owner) > 1;
}
# 152 "./arch/arm64/include/asm/spinlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void arch_write_lock(arch_rwlock_t *rw)
{
 unsigned int tmp;

 asm volatile("	sevl\n" "1:	wfe\n" "2:	ldaxr	%w0, %1\n" "	cbnz	%w0, 1b\n" "	stxr	%w0, %w2, %1\n" "	cbnz	%w0, 2b\n" ".rept	" "1" "\nnop\n.endr\n"
# 174 "./arch/arm64/include/asm/spinlock.h"
 : "=&r" (tmp), "+Q" (rw->lock)
 : "r" (0x80000000)
 : "memory");
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int arch_write_trylock(arch_rwlock_t *rw)
{
 unsigned int tmp;

 asm volatile("1:	ldaxr	%w0, %1\n" "	cbnz	%w0, 2f\n" "	stxr	%w0, %w2, %1\n" "	cbnz	%w0, 1b\n" "2:"
# 194 "./arch/arm64/include/asm/spinlock.h"
 : "=&r" (tmp), "+Q" (rw->lock)
 : "r" (0x80000000)
 : "memory");

 return !tmp;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void arch_write_unlock(arch_rwlock_t *rw)
{
 asm volatile("	stlr	wzr, %0"


 : "=Q" (rw->lock) :: "memory");
}
# 228 "./arch/arm64/include/asm/spinlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void arch_read_lock(arch_rwlock_t *rw)
{
 unsigned int tmp, tmp2;

 asm volatile(
 "	sevl\n"
 "1:	wfe\n" "2:	ldaxr	%w0, %2\n" "	add	%w0, %w0, #1\n" "	tbnz	%w0, #31, 1b\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 2b\n" ".rept	" "1" "\nnop\n.endr\n"
# 251 "./arch/arm64/include/asm/spinlock.h"
 : "=&r" (tmp), "=&r" (tmp2), "+Q" (rw->lock)
 :
 : "cc", "memory");
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void arch_read_unlock(arch_rwlock_t *rw)
{
 unsigned int tmp, tmp2;

 asm volatile("1:	ldxr	%w0, %2\n" "	sub	%w0, %w0, #1\n" "	stlxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b"
# 270 "./arch/arm64/include/asm/spinlock.h"
 : "=&r" (tmp), "=&r" (tmp2), "+Q" (rw->lock)
 :
 : "memory");
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int arch_read_trylock(arch_rwlock_t *rw)
{
 unsigned int tmp, tmp2;

 asm volatile("	mov	%w1, #1\n" "1:	ldaxr	%w0, %2\n" "	add	%w0, %w0, #1\n" "	tbnz	%w0, #31, 2f\n" "	stxr	%w1, %w0, %2\n" "	cbnz	%w1, 1b\n" "2:"
# 296 "./arch/arm64/include/asm/spinlock.h"
 : "=&r" (tmp), "=&r" (tmp2), "+Q" (rw->lock)
 :
 : "cc", "memory");

 return !tmp2;
}
# 89 "./include/linux/spinlock.h" 2
# 163 "./include/linux/spinlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void do_raw_spin_lock(raw_spinlock_t *lock)
{
 (void)0;
 arch_spin_lock(&lock->raw_lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
do_raw_spin_lock_flags(raw_spinlock_t *lock, unsigned long *flags)
{
 (void)0;
 arch_spin_lock(&lock->raw_lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int do_raw_spin_trylock(raw_spinlock_t *lock)
{
 return arch_spin_trylock(&(lock)->raw_lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void do_raw_spin_unlock(raw_spinlock_t *lock)
{
 arch_spin_unlock(&lock->raw_lock);
 (void)0;
}
# 289 "./include/linux/spinlock.h"
# 1 "./include/linux/rwlock.h" 1
# 290 "./include/linux/spinlock.h" 2





# 1 "./include/linux/spinlock_api_smp.h" 1
# 18 "./include/linux/spinlock_api_smp.h"
int in_lock_functions(unsigned long addr);



void __attribute__((section(".spinlock.text"))) _raw_spin_lock(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_lock_nested(raw_spinlock_t *lock, int subclass)
        ;
void __attribute__((section(".spinlock.text")))
_raw_spin_lock_nest_lock(raw_spinlock_t *lock, struct lockdep_map *map)
        ;
void __attribute__((section(".spinlock.text"))) _raw_spin_lock_bh(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_lock_irq(raw_spinlock_t *lock)
        ;

unsigned long __attribute__((section(".spinlock.text"))) _raw_spin_lock_irqsave(raw_spinlock_t *lock)
        ;
unsigned long __attribute__((section(".spinlock.text")))
_raw_spin_lock_irqsave_nested(raw_spinlock_t *lock, int subclass)
        ;
int __attribute__((section(".spinlock.text"))) _raw_spin_trylock(raw_spinlock_t *lock);
int __attribute__((section(".spinlock.text"))) _raw_spin_trylock_bh(raw_spinlock_t *lock);
void __attribute__((section(".spinlock.text"))) _raw_spin_unlock(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_unlock_bh(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_spin_unlock_irq(raw_spinlock_t *lock) ;
void __attribute__((section(".spinlock.text")))
_raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
        ;
# 86 "./include/linux/spinlock_api_smp.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __raw_spin_trylock(raw_spinlock_t *lock)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 if (do_raw_spin_trylock(lock)) {
  do { } while (0);
  return 1;
 }
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
 return 0;
}
# 104 "./include/linux/spinlock_api_smp.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __raw_spin_lock_irqsave(raw_spinlock_t *lock)
{
 unsigned long flags;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = arch_local_irq_save(); } while (0); } while (0);
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
# 119 "./include/linux/spinlock_api_smp.h"
 do_raw_spin_lock_flags(lock, &flags);

 return flags;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_spin_lock_irq(raw_spinlock_t *lock)
{
 do { arch_local_irq_disable(); } while (0);
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
 do_raw_spin_lock(lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_spin_lock_bh(raw_spinlock_t *lock)
{
 __local_bh_disable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
 do { } while (0);
 do_raw_spin_lock(lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_spin_lock(raw_spinlock_t *lock)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
 do_raw_spin_lock(lock);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_spin_unlock(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_spin_unlock_irqrestore(raw_spinlock_t *lock,
         unsigned long flags)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); arch_local_irq_restore(flags); } while (0); } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_spin_unlock_irq(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 do { arch_local_irq_enable(); } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_spin_unlock_bh(raw_spinlock_t *lock)
{
 do { } while (0);
 do_raw_spin_unlock(lock);
 __local_bh_enable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __raw_spin_trylock_bh(raw_spinlock_t *lock)
{
 __local_bh_disable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
 if (do_raw_spin_trylock(lock)) {
  do { } while (0);
  return 1;
 }
 __local_bh_enable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
 return 0;
}

# 1 "./include/linux/rwlock_api_smp.h" 1
# 18 "./include/linux/rwlock_api_smp.h"
void __attribute__((section(".spinlock.text"))) _raw_read_lock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_lock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_lock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_lock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_lock_irq(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_lock_irq(rwlock_t *lock) ;
unsigned long __attribute__((section(".spinlock.text"))) _raw_read_lock_irqsave(rwlock_t *lock)
       ;
unsigned long __attribute__((section(".spinlock.text"))) _raw_write_lock_irqsave(rwlock_t *lock)
       ;
int __attribute__((section(".spinlock.text"))) _raw_read_trylock(rwlock_t *lock);
int __attribute__((section(".spinlock.text"))) _raw_write_trylock(rwlock_t *lock);
void __attribute__((section(".spinlock.text"))) _raw_read_unlock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_unlock(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_unlock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_unlock_bh(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_read_unlock_irq(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text"))) _raw_write_unlock_irq(rwlock_t *lock) ;
void __attribute__((section(".spinlock.text")))
_raw_read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
       ;
void __attribute__((section(".spinlock.text")))
_raw_write_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
       ;
# 117 "./include/linux/rwlock_api_smp.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __raw_read_trylock(rwlock_t *lock)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 if (arch_read_trylock(&(lock)->raw_lock)) {
  do { } while (0);
  return 1;
 }
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
 return 0;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __raw_write_trylock(rwlock_t *lock)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 if (arch_write_trylock(&(lock)->raw_lock)) {
  do { } while (0);
  return 1;
 }
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
 return 0;
}
# 146 "./include/linux/rwlock_api_smp.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_read_lock(rwlock_t *lock)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
 do {(void)0; arch_read_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __raw_read_lock_irqsave(rwlock_t *lock)
{
 unsigned long flags;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = arch_local_irq_save(); } while (0); } while (0);
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
 do {(void)0; arch_read_lock(&((lock))->raw_lock); } while (0)
                                       ;
 return flags;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_read_lock_irq(rwlock_t *lock)
{
 do { arch_local_irq_disable(); } while (0);
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
 do {(void)0; arch_read_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_read_lock_bh(rwlock_t *lock)
{
 __local_bh_disable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
 do { } while (0);
 do {(void)0; arch_read_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __raw_write_lock_irqsave(rwlock_t *lock)
{
 unsigned long flags;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = arch_local_irq_save(); } while (0); } while (0);
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
 do {(void)0; arch_write_lock(&((lock))->raw_lock); } while (0)
                                        ;
 return flags;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_write_lock_irq(rwlock_t *lock)
{
 do { arch_local_irq_disable(); } while (0);
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
 do {(void)0; arch_write_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_write_lock_bh(rwlock_t *lock)
{
 __local_bh_disable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
 do { } while (0);
 do {(void)0; arch_write_lock(&(lock)->raw_lock); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_write_lock(rwlock_t *lock)
{
 do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0);
 do { } while (0);
 do {(void)0; arch_write_lock(&(lock)->raw_lock); } while (0);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_write_unlock(rwlock_t *lock)
{
 do { } while (0);
 do {arch_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_read_unlock(rwlock_t *lock)
{
 do { } while (0);
 do {arch_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
__raw_read_unlock_irqrestore(rwlock_t *lock, unsigned long flags)
{
 do { } while (0);
 do {arch_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); arch_local_irq_restore(flags); } while (0); } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_read_unlock_irq(rwlock_t *lock)
{
 do { } while (0);
 do {arch_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { arch_local_irq_enable(); } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_read_unlock_bh(rwlock_t *lock)
{
 do { } while (0);
 do {arch_read_unlock(&(lock)->raw_lock); (void)0; } while (0);
 __local_bh_enable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_write_unlock_irqrestore(rwlock_t *lock,
          unsigned long flags)
{
 do { } while (0);
 do {arch_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); arch_local_irq_restore(flags); } while (0); } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_write_unlock_irq(rwlock_t *lock)
{
 do { } while (0);
 do {arch_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 do { arch_local_irq_enable(); } while (0);
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __raw_write_unlock_bh(rwlock_t *lock)
{
 do { } while (0);
 do {arch_write_unlock(&(lock)->raw_lock); (void)0; } while (0);
 __local_bh_enable_ip((unsigned long)__builtin_return_address(0), ((2 * (1UL << (0 + 8))) + (1UL << 0)));
}
# 191 "./include/linux/spinlock_api_smp.h" 2
# 296 "./include/linux/spinlock.h" 2
# 304 "./include/linux/spinlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) raw_spinlock_t *spinlock_check(spinlock_t *lock)
{
 return &lock->rlock;
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_lock(spinlock_t *lock)
{
 _raw_spin_lock(&lock->rlock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_lock_bh(spinlock_t *lock)
{
 _raw_spin_lock_bh(&lock->rlock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) int spin_trylock(spinlock_t *lock)
{
 return (_raw_spin_trylock(&lock->rlock));
}
# 340 "./include/linux/spinlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_lock_irq(spinlock_t *lock)
{
 _raw_spin_lock_irq(&lock->rlock);
}
# 355 "./include/linux/spinlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_unlock(spinlock_t *lock)
{
 _raw_spin_unlock(&lock->rlock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_unlock_bh(spinlock_t *lock)
{
 _raw_spin_unlock_bh(&lock->rlock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_unlock_irq(spinlock_t *lock)
{
 _raw_spin_unlock_irq(&lock->rlock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
{
 do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); _raw_spin_unlock_irqrestore(&lock->rlock, flags); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) int spin_trylock_bh(spinlock_t *lock)
{
 return (_raw_spin_trylock_bh(&lock->rlock));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) int spin_trylock_irq(spinlock_t *lock)
{
 return ({ do { arch_local_irq_disable(); } while (0); (_raw_spin_trylock(&lock->rlock)) ? 1 : ({ do { arch_local_irq_enable(); } while (0); 0; }); });
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) int spin_is_locked(spinlock_t *lock)
{
 return arch_spin_is_locked(&(&lock->rlock)->raw_lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) int spin_is_contended(spinlock_t *lock)
{
 return arch_spin_is_contended(&(&lock->rlock)->raw_lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) int spin_can_lock(spinlock_t *lock)
{
 return (!arch_spin_is_locked(&(&lock->rlock)->raw_lock));
}
# 420 "./include/linux/spinlock.h"
extern int _atomic_dec_and_lock(atomic_t *atomic, spinlock_t *lock);
# 6 "./include/linux/ipc.h" 2
# 1 "./include/linux/uidgid.h" 1
# 16 "./include/linux/uidgid.h"
# 1 "./include/linux/highuid.h" 1
# 35 "./include/linux/highuid.h"
extern int overflowuid;
extern int overflowgid;

extern void __bad_uid(void);
extern void __bad_gid(void);
# 82 "./include/linux/highuid.h"
extern int fs_overflowuid;
extern int fs_overflowgid;
# 17 "./include/linux/uidgid.h" 2

struct user_namespace;
extern struct user_namespace init_user_ns;

typedef struct {
 uid_t val;
} kuid_t;


typedef struct {
 gid_t val;
} kgid_t;





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) uid_t __kuid_val(kuid_t uid)
{
 return uid.val;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) gid_t __kgid_val(kgid_t gid)
{
 return gid.val;
}
# 61 "./include/linux/uidgid.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool uid_eq(kuid_t left, kuid_t right)
{
 return __kuid_val(left) == __kuid_val(right);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool gid_eq(kgid_t left, kgid_t right)
{
 return __kgid_val(left) == __kgid_val(right);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool uid_gt(kuid_t left, kuid_t right)
{
 return __kuid_val(left) > __kuid_val(right);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool gid_gt(kgid_t left, kgid_t right)
{
 return __kgid_val(left) > __kgid_val(right);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool uid_gte(kuid_t left, kuid_t right)
{
 return __kuid_val(left) >= __kuid_val(right);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool gid_gte(kgid_t left, kgid_t right)
{
 return __kgid_val(left) >= __kgid_val(right);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool uid_lt(kuid_t left, kuid_t right)
{
 return __kuid_val(left) < __kuid_val(right);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool gid_lt(kgid_t left, kgid_t right)
{
 return __kgid_val(left) < __kgid_val(right);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool uid_lte(kuid_t left, kuid_t right)
{
 return __kuid_val(left) <= __kuid_val(right);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool gid_lte(kgid_t left, kgid_t right)
{
 return __kgid_val(left) <= __kgid_val(right);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool uid_valid(kuid_t uid)
{
 return __kuid_val(uid) != (uid_t) -1;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool gid_valid(kgid_t gid)
{
 return __kgid_val(gid) != (gid_t) -1;
}



extern kuid_t make_kuid(struct user_namespace *from, uid_t uid);
extern kgid_t make_kgid(struct user_namespace *from, gid_t gid);

extern uid_t from_kuid(struct user_namespace *to, kuid_t uid);
extern gid_t from_kgid(struct user_namespace *to, kgid_t gid);
extern uid_t from_kuid_munged(struct user_namespace *to, kuid_t uid);
extern gid_t from_kgid_munged(struct user_namespace *to, kgid_t gid);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool kuid_has_mapping(struct user_namespace *ns, kuid_t uid)
{
 return from_kuid(ns, uid) != (uid_t) -1;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool kgid_has_mapping(struct user_namespace *ns, kgid_t gid)
{
 return from_kgid(ns, gid) != (gid_t) -1;
}
# 7 "./include/linux/ipc.h" 2
# 1 "./include/linux/rhashtable.h" 1
# 22 "./include/linux/rhashtable.h"
# 1 "./include/linux/err.h" 1







# 1 "./arch/arm64/include/generated/uapi/asm/errno.h" 1
# 1 "./include/uapi/asm-generic/errno.h" 1




# 1 "./include/uapi/asm-generic/errno-base.h" 1
# 6 "./include/uapi/asm-generic/errno.h" 2
# 1 "./arch/arm64/include/generated/uapi/asm/errno.h" 2
# 9 "./include/linux/err.h" 2
# 24 "./include/linux/err.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void * __attribute__((warn_unused_result)) ERR_PTR(long error)
{
 return (void *) error;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long __attribute__((warn_unused_result)) PTR_ERR( const void *ptr)
{
 return (long) ptr;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool __attribute__((warn_unused_result)) IS_ERR( const void *ptr)
{
 return __builtin_expect(!!((unsigned long)(void *)((unsigned long)ptr) >= (unsigned long)-4095), 0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool __attribute__((warn_unused_result)) IS_ERR_OR_NULL( const void *ptr)
{
 return __builtin_expect(!!(!ptr), 0) || __builtin_expect(!!((unsigned long)(void *)((unsigned long)ptr) >= (unsigned long)-4095), 0);
}
# 51 "./include/linux/err.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void * __attribute__((warn_unused_result)) ERR_CAST( const void *ptr)
{

 return (void *) ptr;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) PTR_ERR_OR_ZERO( const void *ptr)
{
 if (IS_ERR(ptr))
  return PTR_ERR(ptr);
 else
  return 0;
}
# 23 "./include/linux/rhashtable.h" 2
# 1 "./include/linux/errno.h" 1




# 1 "./include/uapi/linux/errno.h" 1
# 1 "./arch/arm64/include/generated/uapi/asm/errno.h" 1
# 1 "./include/uapi/linux/errno.h" 2
# 6 "./include/linux/errno.h" 2
# 24 "./include/linux/rhashtable.h" 2
# 1 "./include/linux/jhash.h" 1
# 27 "./include/linux/jhash.h"
# 1 "./include/linux/unaligned/packed_struct.h" 1





struct __una_u16 { u16 x; } __attribute__((packed));
struct __una_u32 { u32 x; } __attribute__((packed));
struct __una_u64 { u64 x; } __attribute__((packed));

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u16 __get_unaligned_cpu16(const void *p)
{
 const struct __una_u16 *ptr = (const struct __una_u16 *)p;
 return ptr->x;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 __get_unaligned_cpu32(const void *p)
{
 const struct __una_u32 *ptr = (const struct __una_u32 *)p;
 return ptr->x;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 __get_unaligned_cpu64(const void *p)
{
 const struct __una_u64 *ptr = (const struct __una_u64 *)p;
 return ptr->x;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __put_unaligned_cpu16(u16 val, void *p)
{
 struct __una_u16 *ptr = (struct __una_u16 *)p;
 ptr->x = val;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __put_unaligned_cpu32(u32 val, void *p)
{
 struct __una_u32 *ptr = (struct __una_u32 *)p;
 ptr->x = val;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __put_unaligned_cpu64(u64 val, void *p)
{
 struct __una_u64 *ptr = (struct __una_u64 *)p;
 ptr->x = val;
}
# 28 "./include/linux/jhash.h" 2
# 70 "./include/linux/jhash.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 jhash(const void *key, u32 length, u32 initval)
{
 u32 a, b, c;
 const u8 *k = key;


 a = b = c = 0xdeadbeef + length + initval;


 while (length > 12) {
  a += __get_unaligned_cpu32(k);
  b += __get_unaligned_cpu32(k + 4);
  c += __get_unaligned_cpu32(k + 8);
  { a -= c; a ^= rol32(c, 4); c += b; b -= a; b ^= rol32(a, 6); a += c; c -= b; c ^= rol32(b, 8); b += a; a -= c; a ^= rol32(c, 16); c += b; b -= a; b ^= rol32(a, 19); a += c; c -= b; c ^= rol32(b, 4); b += a; };
  length -= 12;
  k += 12;
 }

 switch (length) {
 case 12: c += (u32)k[11]<<24;
 case 11: c += (u32)k[10]<<16;
 case 10: c += (u32)k[9]<<8;
 case 9: c += k[8];
 case 8: b += (u32)k[7]<<24;
 case 7: b += (u32)k[6]<<16;
 case 6: b += (u32)k[5]<<8;
 case 5: b += k[4];
 case 4: a += (u32)k[3]<<24;
 case 3: a += (u32)k[2]<<16;
 case 2: a += (u32)k[1]<<8;
 case 1: a += k[0];
   { c ^= b; c -= rol32(b, 14); a ^= c; a -= rol32(c, 11); b ^= a; b -= rol32(a, 25); c ^= b; c -= rol32(b, 16); a ^= c; a -= rol32(c, 4); b ^= a; b -= rol32(a, 14); c ^= b; c -= rol32(b, 24); };
 case 0:
  break;
 }

 return c;
}
# 116 "./include/linux/jhash.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 jhash2(const u32 *k, u32 length, u32 initval)
{
 u32 a, b, c;


 a = b = c = 0xdeadbeef + (length<<2) + initval;


 while (length > 3) {
  a += k[0];
  b += k[1];
  c += k[2];
  { a -= c; a ^= rol32(c, 4); c += b; b -= a; b ^= rol32(a, 6); a += c; c -= b; c ^= rol32(b, 8); b += a; a -= c; a ^= rol32(c, 16); c += b; b -= a; b ^= rol32(a, 19); a += c; c -= b; c ^= rol32(b, 4); b += a; };
  length -= 3;
  k += 3;
 }


 switch (length) {
 case 3: c += k[2];
 case 2: b += k[1];
 case 1: a += k[0];
  { c ^= b; c -= rol32(b, 14); a ^= c; a -= rol32(c, 11); b ^= a; b -= rol32(a, 25); c ^= b; c -= rol32(b, 16); a ^= c; a -= rol32(c, 4); b ^= a; b -= rol32(a, 14); c ^= b; c -= rol32(b, 24); };
 case 0:
  break;
 }

 return c;
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 __jhash_nwords(u32 a, u32 b, u32 c, u32 initval)
{
 a += initval;
 b += initval;
 c += initval;

 { c ^= b; c -= rol32(b, 14); a ^= c; a -= rol32(c, 11); b ^= a; b -= rol32(a, 25); c ^= b; c -= rol32(b, 16); a ^= c; a -= rol32(c, 4); b ^= a; b -= rol32(a, 14); c ^= b; c -= rol32(b, 24); };

 return c;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 jhash_3words(u32 a, u32 b, u32 c, u32 initval)
{
 return __jhash_nwords(a, b, c, initval + 0xdeadbeef + (3 << 2));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 jhash_2words(u32 a, u32 b, u32 initval)
{
 return __jhash_nwords(a, b, 0, initval + 0xdeadbeef + (2 << 2));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 jhash_1word(u32 a, u32 initval)
{
 return __jhash_nwords(a, 0, 0, initval + 0xdeadbeef + (1 << 2));
}
# 25 "./include/linux/rhashtable.h" 2
# 1 "./include/linux/list_nulls.h" 1
# 21 "./include/linux/list_nulls.h"
struct hlist_nulls_head {
 struct hlist_nulls_node *first;
};

struct hlist_nulls_node {
 struct hlist_nulls_node *next, **pprev;
};
# 43 "./include/linux/list_nulls.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int is_a_nulls(const struct hlist_nulls_node *ptr)
{
 return ((unsigned long)ptr & 1);
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long get_nulls_value(const struct hlist_nulls_node *ptr)
{
 return ((unsigned long)ptr) >> 1;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int hlist_nulls_unhashed(const struct hlist_nulls_node *h)
{
 return !h->pprev;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int hlist_nulls_empty(const struct hlist_nulls_head *h)
{
 return is_a_nulls(({ union { typeof(h->first) __val; char __c[1]; } __u; if (1) __read_once_size(&(h->first), __u.__c, sizeof(h->first)); else __read_once_size_nocheck(&(h->first), __u.__c, sizeof(h->first)); do { } while (0); __u.__val; }));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_nulls_add_head(struct hlist_nulls_node *n,
     struct hlist_nulls_head *h)
{
 struct hlist_nulls_node *first = h->first;

 n->next = first;
 n->pprev = &h->first;
 h->first = n;
 if (!is_a_nulls(first))
  first->pprev = &n->next;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __hlist_nulls_del(struct hlist_nulls_node *n)
{
 struct hlist_nulls_node *next = n->next;
 struct hlist_nulls_node **pprev = n->pprev;

 ({ union { typeof(*pprev) __val; char __c[1]; } __u = { .__val = ( typeof(*pprev)) (next) }; __write_once_size(&(*pprev), __u.__c, sizeof(*pprev)); __u.__val; });
 if (!is_a_nulls(next))
  next->pprev = pprev;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hlist_nulls_del(struct hlist_nulls_node *n)
{
 __hlist_nulls_del(n);
 n->pprev = ((void *) 0x200 + (0xdead000000000000UL));
}
# 26 "./include/linux/rhashtable.h" 2
# 1 "./include/linux/workqueue.h" 1
# 9 "./include/linux/workqueue.h"
# 1 "./include/linux/timer.h" 1





# 1 "./include/linux/ktime.h" 1
# 24 "./include/linux/ktime.h"
# 1 "./include/linux/time.h" 1





# 1 "./include/linux/seqlock.h" 1
# 48 "./include/linux/seqlock.h"
typedef struct seqcount {
 unsigned sequence;



} seqcount_t;

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __seqcount_init(seqcount_t *s, const char *name,
       struct lock_class_key *key)
{



 do { (void)(name); (void)(key); } while (0);
 s->sequence = 0;
}
# 108 "./include/linux/seqlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned __read_seqcount_begin(const seqcount_t *s)
{
 unsigned ret;

repeat:
 ret = ({ union { typeof(s->sequence) __val; char __c[1]; } __u; if (1) __read_once_size(&(s->sequence), __u.__c, sizeof(s->sequence)); else __read_once_size_nocheck(&(s->sequence), __u.__c, sizeof(s->sequence)); do { } while (0); __u.__val; });
 if (__builtin_expect(!!(ret & 1), 0)) {
  cpu_relax();
  goto repeat;
 }
 return ret;
}
# 130 "./include/linux/seqlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned raw_read_seqcount(const seqcount_t *s)
{
 unsigned ret = ({ union { typeof(s->sequence) __val; char __c[1]; } __u; if (1) __read_once_size(&(s->sequence), __u.__c, sizeof(s->sequence)); else __read_once_size_nocheck(&(s->sequence), __u.__c, sizeof(s->sequence)); do { } while (0); __u.__val; });
 asm volatile("dmb " "ishld" : : : "memory");
 return ret;
}
# 146 "./include/linux/seqlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned raw_read_seqcount_begin(const seqcount_t *s)
{
 unsigned ret = __read_seqcount_begin(s);
 asm volatile("dmb " "ishld" : : : "memory");
 return ret;
}
# 162 "./include/linux/seqlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned read_seqcount_begin(const seqcount_t *s)
{
 ;
 return raw_read_seqcount_begin(s);
}
# 182 "./include/linux/seqlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned raw_seqcount_begin(const seqcount_t *s)
{
 unsigned ret = ({ union { typeof(s->sequence) __val; char __c[1]; } __u; if (1) __read_once_size(&(s->sequence), __u.__c, sizeof(s->sequence)); else __read_once_size_nocheck(&(s->sequence), __u.__c, sizeof(s->sequence)); do { } while (0); __u.__val; });
 asm volatile("dmb " "ishld" : : : "memory");
 return ret & ~1;
}
# 203 "./include/linux/seqlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __read_seqcount_retry(const seqcount_t *s, unsigned start)
{
 return __builtin_expect(!!(s->sequence != start), 0);
}
# 218 "./include/linux/seqlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int read_seqcount_retry(const seqcount_t *s, unsigned start)
{
 asm volatile("dmb " "ishld" : : : "memory");
 return __read_seqcount_retry(s, start);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void raw_write_seqcount_begin(seqcount_t *s)
{
 s->sequence++;
 asm volatile("dmb " "ishst" : : : "memory");
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void raw_write_seqcount_end(seqcount_t *s)
{
 asm volatile("dmb " "ishst" : : : "memory");
 s->sequence++;
}
# 272 "./include/linux/seqlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void raw_write_seqcount_barrier(seqcount_t *s)
{
 s->sequence++;
 asm volatile("dmb " "ishst" : : : "memory");
 s->sequence++;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int raw_read_seqcount_latch(seqcount_t *s)
{
 int seq = ({ union { typeof(s->sequence) __val; char __c[1]; } __u; if (1) __read_once_size(&(s->sequence), __u.__c, sizeof(s->sequence)); else __read_once_size_nocheck(&(s->sequence), __u.__c, sizeof(s->sequence)); do { } while (0); __u.__val; });

 do { } while (0);
 return seq;
}
# 364 "./include/linux/seqlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void raw_write_seqcount_latch(seqcount_t *s)
{
       asm volatile("dmb " "ishst" : : : "memory");
       s->sequence++;
       asm volatile("dmb " "ishst" : : : "memory");
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void write_seqcount_begin_nested(seqcount_t *s, int subclass)
{
 raw_write_seqcount_begin(s);
 do { } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void write_seqcount_begin(seqcount_t *s)
{
 write_seqcount_begin_nested(s, 0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void write_seqcount_end(seqcount_t *s)
{
 do { } while (0);
 raw_write_seqcount_end(s);
}
# 399 "./include/linux/seqlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void write_seqcount_invalidate(seqcount_t *s)
{
 asm volatile("dmb " "ishst" : : : "memory");
 s->sequence+=2;
}

typedef struct {
 struct seqcount seqcount;
 spinlock_t lock;
} seqlock_t;
# 432 "./include/linux/seqlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned read_seqbegin(const seqlock_t *sl)
{
 return read_seqcount_begin(&sl->seqcount);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned read_seqretry(const seqlock_t *sl, unsigned start)
{
 return read_seqcount_retry(&sl->seqcount, start);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void write_seqlock(seqlock_t *sl)
{
 spin_lock(&sl->lock);
 write_seqcount_begin(&sl->seqcount);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void write_sequnlock(seqlock_t *sl)
{
 write_seqcount_end(&sl->seqcount);
 spin_unlock(&sl->lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void write_seqlock_bh(seqlock_t *sl)
{
 spin_lock_bh(&sl->lock);
 write_seqcount_begin(&sl->seqcount);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void write_sequnlock_bh(seqlock_t *sl)
{
 write_seqcount_end(&sl->seqcount);
 spin_unlock_bh(&sl->lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void write_seqlock_irq(seqlock_t *sl)
{
 spin_lock_irq(&sl->lock);
 write_seqcount_begin(&sl->seqcount);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void write_sequnlock_irq(seqlock_t *sl)
{
 write_seqcount_end(&sl->seqcount);
 spin_unlock_irq(&sl->lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __write_seqlock_irqsave(seqlock_t *sl)
{
 unsigned long flags;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = _raw_spin_lock_irqsave(spinlock_check(&sl->lock)); } while (0); } while (0);
 write_seqcount_begin(&sl->seqcount);
 return flags;
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
write_sequnlock_irqrestore(seqlock_t *sl, unsigned long flags)
{
 write_seqcount_end(&sl->seqcount);
 spin_unlock_irqrestore(&sl->lock, flags);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void read_seqlock_excl(seqlock_t *sl)
{
 spin_lock(&sl->lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void read_sequnlock_excl(seqlock_t *sl)
{
 spin_unlock(&sl->lock);
}
# 527 "./include/linux/seqlock.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void read_seqbegin_or_lock(seqlock_t *lock, int *seq)
{
 if (!(*seq & 1))
  *seq = read_seqbegin(lock);
 else
  read_seqlock_excl(lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int need_seqretry(seqlock_t *lock, int seq)
{
 return !(seq & 1) && read_seqretry(lock, seq);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void done_seqretry(seqlock_t *lock, int seq)
{
 if (seq & 1)
  read_sequnlock_excl(lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void read_seqlock_excl_bh(seqlock_t *sl)
{
 spin_lock_bh(&sl->lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void read_sequnlock_excl_bh(seqlock_t *sl)
{
 spin_unlock_bh(&sl->lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void read_seqlock_excl_irq(seqlock_t *sl)
{
 spin_lock_irq(&sl->lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void read_sequnlock_excl_irq(seqlock_t *sl)
{
 spin_unlock_irq(&sl->lock);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __read_seqlock_excl_irqsave(seqlock_t *sl)
{
 unsigned long flags;

 do { do { ({ unsigned long __dummy; typeof(flags) __dummy2; (void)(&__dummy == &__dummy2); 1; }); flags = _raw_spin_lock_irqsave(spinlock_check(&sl->lock)); } while (0); } while (0);
 return flags;
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
read_sequnlock_excl_irqrestore(seqlock_t *sl, unsigned long flags)
{
 spin_unlock_irqrestore(&sl->lock, flags);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long
read_seqbegin_or_lock_irqsave(seqlock_t *lock, int *seq)
{
 unsigned long flags = 0;

 if (!(*seq & 1))
  *seq = read_seqbegin(lock);
 else
  do { flags = __read_seqlock_excl_irqsave(lock); } while (0);

 return flags;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
done_seqretry_irqrestore(seqlock_t *lock, int seq, unsigned long flags)
{
 if (seq & 1)
  read_sequnlock_excl_irqrestore(lock, flags);
}
# 7 "./include/linux/time.h" 2



extern struct timezone sys_tz;

int get_timespec64(struct timespec *ts,
  const struct timespec *uts);
int put_timespec64(const struct timespec *ts,
  struct timespec *uts);
int get_itimerspec64(struct itimerspec *it,
   const struct itimerspec *uit);
int put_itimerspec64(const struct itimerspec *it,
   struct itimerspec *uit);



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int timespec_equal(const struct timespec *a,
                                 const struct timespec *b)
{
 return (a->tv_sec == b->tv_sec) && (a->tv_nsec == b->tv_nsec);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int timespec_compare(const struct timespec *lhs, const struct timespec *rhs)
{
 if (lhs->tv_sec < rhs->tv_sec)
  return -1;
 if (lhs->tv_sec > rhs->tv_sec)
  return 1;
 return lhs->tv_nsec - rhs->tv_nsec;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int timeval_compare(const struct timeval *lhs, const struct timeval *rhs)
{
 if (lhs->tv_sec < rhs->tv_sec)
  return -1;
 if (lhs->tv_sec > rhs->tv_sec)
  return 1;
 return lhs->tv_usec - rhs->tv_usec;
}

extern time64_t mktime64(const unsigned int year, const unsigned int mon,
   const unsigned int day, const unsigned int hour,
   const unsigned int min, const unsigned int sec);




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long mktime(const unsigned int year,
   const unsigned int mon, const unsigned int day,
   const unsigned int hour, const unsigned int min,
   const unsigned int sec)
{
 return mktime64(year, mon, day, hour, min, sec);
}

extern void set_normalized_timespec(struct timespec *ts, time_t sec, s64 nsec);






extern struct timespec timespec_add_safe(const struct timespec lhs,
      const struct timespec rhs);


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct timespec timespec_add(struct timespec lhs,
      struct timespec rhs)
{
 struct timespec ts_delta;
 set_normalized_timespec(&ts_delta, lhs.tv_sec + rhs.tv_sec,
    lhs.tv_nsec + rhs.tv_nsec);
 return ts_delta;
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct timespec timespec_sub(struct timespec lhs,
      struct timespec rhs)
{
 struct timespec ts_delta;
 set_normalized_timespec(&ts_delta, lhs.tv_sec - rhs.tv_sec,
    lhs.tv_nsec - rhs.tv_nsec);
 return ts_delta;
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool timespec_valid(const struct timespec *ts)
{

 if (ts->tv_sec < 0)
  return false;

 if ((unsigned long)ts->tv_nsec >= 1000000000L)
  return false;
 return true;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool timespec_valid_strict(const struct timespec *ts)
{
 if (!timespec_valid(ts))
  return false;

 if ((unsigned long long)ts->tv_sec >= (((s64)~((u64)1 << 63)) / 1000000000L))
  return false;
 return true;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool timeval_valid(const struct timeval *tv)
{

 if (tv->tv_sec < 0)
  return false;


 if (tv->tv_usec < 0 || tv->tv_usec >= 1000000L)
  return false;

 return true;
}

extern struct timespec timespec_trunc(struct timespec t, unsigned gran);







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool timeval_inject_offset_valid(const struct timeval *tv)
{



 if (tv->tv_usec < 0 || tv->tv_usec >= 1000000L)
  return false;
 return true;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool timespec_inject_offset_valid(const struct timespec *ts)
{



 if (ts->tv_nsec < 0 || ts->tv_nsec >= 1000000000L)
  return false;
 return true;
}
# 177 "./include/linux/time.h"
struct itimerval;
extern int do_setitimer(int which, struct itimerval *value,
   struct itimerval *ovalue);
extern int do_getitimer(int which, struct itimerval *value);

extern long do_utimes(int dfd, const char *filename, struct timespec *times, int flags);





struct tm {




 int tm_sec;

 int tm_min;

 int tm_hour;

 int tm_mday;

 int tm_mon;

 long tm_year;

 int tm_wday;

 int tm_yday;
};

void time64_to_tm(time64_t totalsecs, int offset, struct tm *result);
# 220 "./include/linux/time.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void time_to_tm(time_t totalsecs, int offset, struct tm *result)
{
 time64_to_tm(totalsecs, offset, result);
}
# 232 "./include/linux/time.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 timespec_to_ns(const struct timespec *ts)
{
 return ((s64) ts->tv_sec * 1000000000L) + ts->tv_nsec;
}
# 244 "./include/linux/time.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 timeval_to_ns(const struct timeval *tv)
{
 return ((s64) tv->tv_sec * 1000000000L) +
  tv->tv_usec * 1000L;
}







extern struct timespec ns_to_timespec(const s64 nsec);







extern struct timeval ns_to_timeval(const s64 nsec);
# 274 "./include/linux/time.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void timespec_add_ns(struct timespec *a, u64 ns)
{
 a->tv_sec += __iter_div_u64_rem(a->tv_nsec + ns, 1000000000L, &ns);
 a->tv_nsec = ns;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool itimerspec64_valid(const struct itimerspec *its)
{
 if (!timespec_valid(&(its->it_interval)) ||
  !timespec_valid(&(its->it_value)))
  return false;

 return true;
}
# 25 "./include/linux/ktime.h" 2
# 1 "./include/linux/jiffies.h" 1
# 10 "./include/linux/jiffies.h"
# 1 "./include/linux/timex.h" 1
# 56 "./include/linux/timex.h"
# 1 "./include/uapi/linux/timex.h" 1
# 64 "./include/uapi/linux/timex.h"
struct timex {
 unsigned int modes;
 __kernel_long_t offset;
 __kernel_long_t freq;
 __kernel_long_t maxerror;
 __kernel_long_t esterror;
 int status;
 __kernel_long_t constant;
 __kernel_long_t precision;
 __kernel_long_t tolerance;


 struct timeval time;
 __kernel_long_t tick;

 __kernel_long_t ppsfreq;
 __kernel_long_t jitter;
 int shift;
 __kernel_long_t stabil;
 __kernel_long_t jitcnt;
 __kernel_long_t calcnt;
 __kernel_long_t errcnt;
 __kernel_long_t stbcnt;

 int tai;

 int :32; int :32; int :32; int :32;
 int :32; int :32; int :32; int :32;
 int :32; int :32; int :32;
};
# 57 "./include/linux/timex.h" 2






# 1 "./include/uapi/linux/param.h" 1




# 1 "./arch/arm64/include/uapi/asm/param.h" 1
# 22 "./arch/arm64/include/uapi/asm/param.h"
# 1 "./include/asm-generic/param.h" 1




# 1 "./include/uapi/asm-generic/param.h" 1
# 6 "./include/asm-generic/param.h" 2
# 23 "./arch/arm64/include/uapi/asm/param.h" 2
# 6 "./include/uapi/linux/param.h" 2
# 64 "./include/linux/timex.h" 2

# 1 "./arch/arm64/include/asm/timex.h" 1
# 19 "./arch/arm64/include/asm/timex.h"
# 1 "./arch/arm64/include/asm/arch_timer.h" 1
# 28 "./arch/arm64/include/asm/arch_timer.h"
# 1 "./include/linux/smp.h" 1
# 15 "./include/linux/smp.h"
# 1 "./include/linux/llist.h" 1
# 66 "./include/linux/llist.h"
struct llist_head {
 struct llist_node *first;
};

struct llist_node {
 struct llist_node *next;
};
# 81 "./include/linux/llist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void init_llist_head(struct llist_head *list)
{
 list->first = ((void *)0);
}
# 199 "./include/linux/llist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool llist_empty(const struct llist_head *head)
{
 return (*({ __attribute__((unused)) typeof(head->first) __var = ( typeof(head->first)) 0; (volatile typeof(head->first) *)&(head->first); })) == ((void *)0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct llist_node *llist_next(struct llist_node *node)
{
 return node->next;
}

extern bool llist_add_batch(struct llist_node *new_first,
       struct llist_node *new_last,
       struct llist_head *head);







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool llist_add(struct llist_node *new, struct llist_head *head)
{
 return llist_add_batch(new, new, head);
}
# 232 "./include/linux/llist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct llist_node *llist_del_all(struct llist_head *head)
{
 return ({ __typeof__(*(&head->first)) __ret; __ret = (__typeof__(*(&head->first))) __xchg_mb((unsigned long)(((void *)0)), (&head->first), sizeof(*(&head->first))); __ret; });
}

extern struct llist_node *llist_del_first(struct llist_head *head);

struct llist_node *llist_reverse_order(struct llist_node *head);
# 16 "./include/linux/smp.h" 2

typedef void (*smp_call_func_t)(void *info);
struct __call_single_data {
 struct llist_node llist;
 smp_call_func_t func;
 void *info;
 unsigned int flags;
};


typedef struct __call_single_data call_single_data_t
 __attribute__((aligned(sizeof(struct __call_single_data))));


extern unsigned int total_cpus;

int smp_call_function_single(int cpuid, smp_call_func_t func, void *info,
        int wait);




int on_each_cpu(smp_call_func_t func, void *info, int wait);





void on_each_cpu_mask(const struct cpumask *mask, smp_call_func_t func,
  void *info, bool wait);






void on_each_cpu_cond(bool (*cond_func)(int cpu, void *info),
  smp_call_func_t func, void *info, bool wait,
  gfp_t gfp_flags);

int smp_call_function_single_async(int cpu, call_single_data_t *csd);







# 1 "./arch/arm64/include/asm/smp.h" 1
# 32 "./arch/arm64/include/asm/smp.h"
# 1 "./arch/arm64/include/asm/percpu.h" 1
# 22 "./arch/arm64/include/asm/percpu.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void set_my_cpu_offset(unsigned long off)
{
 asm volatile(".if ""1"" == 1\n" "661:\n\t" "msr tpidr_el1, %0" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .if " "0" " == 0\n" " .word 663f - .\n" " .else\n" " .word " "0" "- .\n" " .endif\n" " .hword " "11" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" " .if " "0" " == 0\n" ".pushsection .altinstr_replacement, \"a\"\n" "663:\n\t" "msr tpidr_el2, %0" "\n" "664:\n\t" ".popsection\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n" ".else\n\t" "663:\n\t" "664:\n\t" ".endif\n" ".endif\n"


   :: "r" (off) : "memory");
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __my_cpu_offset(void)
{
 unsigned long off;





 asm(".if ""1"" == 1\n" "661:\n\t" "mrs %0, tpidr_el1" "\n" "662:\n" ".pushsection .altinstructions,\"a\"\n" " .word 661b - .\n" " .if " "0" " == 0\n" " .word 663f - .\n" " .else\n" " .word " "0" "- .\n" " .endif\n" " .hword " "11" "\n" " .byte 662b-661b\n" " .byte 664f-663f\n" ".popsection\n" " .if " "0" " == 0\n" ".pushsection .altinstr_replacement, \"a\"\n" "663:\n\t" "mrs %0, tpidr_el2" "\n" "664:\n\t" ".popsection\n\t" ".org	. - (664b-663b) + (662b-661b)\n\t" ".org	. - (662b-661b) + (664b-663b)\n" ".else\n\t" "663:\n\t" "664:\n\t" ".endif\n" ".endif\n"


  : "=r" (off) :
  "Q" (*(const unsigned long *)current_stack_pointer));

 return off;
}
# 103 "./arch/arm64/include/asm/percpu.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __percpu_add(void *ptr, unsigned long val, int size) { unsigned long loop, ret; switch (size) { case 1: asm ("//__per_cpu_" "add" "_1\n" "1:	ldxrb	  %w[ret], %[ptr]\n" "add" " %w[ret], %w[ret], %w[val]\n" "	stxrb	  %w[loop], %w[ret], %[ptr]\n" "	cbnz	  %w[loop], 1b" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u8 *)ptr) : [val] "Ir" (val)); break; case 2: asm ("//__per_cpu_" "add" "_2\n" "1:	ldxrh	  %w[ret], %[ptr]\n" "add" " %w[ret], %w[ret], %w[val]\n" "	stxrh	  %w[loop], %w[ret], %[ptr]\n" "	cbnz	  %w[loop], 1b" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u16 *)ptr) : [val] "Ir" (val)); break; case 4: asm ("//__per_cpu_" "add" "_4\n" "1:	ldxr	  %w[ret], %[ptr]\n" "add" " %w[ret], %w[ret], %w[val]\n" "	stxr	  %w[loop], %w[ret], %[ptr]\n" "	cbnz	  %w[loop], 1b" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u32 *)ptr) : [val] "Ir" (val)); break; case 8: asm ("//__per_cpu_" "add" "_8\n" "1:	ldxr	  %[ret], %[ptr]\n" "add" " %[ret], %[ret], %[val]\n" "	stxr	  %w[loop], %[ret], %[ptr]\n" "	cbnz	  %w[loop], 1b" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u64 *)ptr) : [val] "Ir" (val)); break; default: ret = 0; do { bool __cond = !(!(1)); extern void __compiletime_assert_103(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_103(); do { } while (0); } while (0); } return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __percpu_and(void *ptr, unsigned long val, int size) { unsigned long loop, ret; switch (size) { case 1: asm ("//__per_cpu_" "and" "_1\n" "1:	ldxrb	  %w[ret], %[ptr]\n" "and" " %w[ret], %w[ret], %w[val]\n" "	stxrb	  %w[loop], %w[ret], %[ptr]\n" "	cbnz	  %w[loop], 1b" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u8 *)ptr) : [val] "Ir" (val)); break; case 2: asm ("//__per_cpu_" "and" "_2\n" "1:	ldxrh	  %w[ret], %[ptr]\n" "and" " %w[ret], %w[ret], %w[val]\n" "	stxrh	  %w[loop], %w[ret], %[ptr]\n" "	cbnz	  %w[loop], 1b" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u16 *)ptr) : [val] "Ir" (val)); break; case 4: asm ("//__per_cpu_" "and" "_4\n" "1:	ldxr	  %w[ret], %[ptr]\n" "and" " %w[ret], %w[ret], %w[val]\n" "	stxr	  %w[loop], %w[ret], %[ptr]\n" "	cbnz	  %w[loop], 1b" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u32 *)ptr) : [val] "Ir" (val)); break; case 8: asm ("//__per_cpu_" "and" "_8\n" "1:	ldxr	  %[ret], %[ptr]\n" "and" " %[ret], %[ret], %[val]\n" "	stxr	  %w[loop], %[ret], %[ptr]\n" "	cbnz	  %w[loop], 1b" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u64 *)ptr) : [val] "Ir" (val)); break; default: ret = 0; do { bool __cond = !(!(1)); extern void __compiletime_assert_104(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_104(); do { } while (0); } while (0); } return ret; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __percpu_or(void *ptr, unsigned long val, int size) { unsigned long loop, ret; switch (size) { case 1: asm ("//__per_cpu_" "or" "_1\n" "1:	ldxrb	  %w[ret], %[ptr]\n" "orr" " %w[ret], %w[ret], %w[val]\n" "	stxrb	  %w[loop], %w[ret], %[ptr]\n" "	cbnz	  %w[loop], 1b" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u8 *)ptr) : [val] "Ir" (val)); break; case 2: asm ("//__per_cpu_" "or" "_2\n" "1:	ldxrh	  %w[ret], %[ptr]\n" "orr" " %w[ret], %w[ret], %w[val]\n" "	stxrh	  %w[loop], %w[ret], %[ptr]\n" "	cbnz	  %w[loop], 1b" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u16 *)ptr) : [val] "Ir" (val)); break; case 4: asm ("//__per_cpu_" "or" "_4\n" "1:	ldxr	  %w[ret], %[ptr]\n" "orr" " %w[ret], %w[ret], %w[val]\n" "	stxr	  %w[loop], %w[ret], %[ptr]\n" "	cbnz	  %w[loop], 1b" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u32 *)ptr) : [val] "Ir" (val)); break; case 8: asm ("//__per_cpu_" "or" "_8\n" "1:	ldxr	  %[ret], %[ptr]\n" "orr" " %[ret], %[ret], %[val]\n" "	stxr	  %w[loop], %[ret], %[ptr]\n" "	cbnz	  %w[loop], 1b" : [loop] "=&r" (loop), [ret] "=&r" (ret), [ptr] "+Q"(*(u64 *)ptr) : [val] "Ir" (val)); break; default: ret = 0; do { bool __cond = !(!(1)); extern void __compiletime_assert_105(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_105(); do { } while (0); } while (0); } return ret; }


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __percpu_read(void *ptr, int size)
{
 unsigned long ret;

 switch (size) {
 case 1:
  ret = ({ union { typeof(*(u8 *)ptr) __val; char __c[1]; } __u; if (1) __read_once_size(&(*(u8 *)ptr), __u.__c, sizeof(*(u8 *)ptr)); else __read_once_size_nocheck(&(*(u8 *)ptr), __u.__c, sizeof(*(u8 *)ptr)); do { } while (0); __u.__val; });
  break;
 case 2:
  ret = ({ union { typeof(*(u16 *)ptr) __val; char __c[1]; } __u; if (1) __read_once_size(&(*(u16 *)ptr), __u.__c, sizeof(*(u16 *)ptr)); else __read_once_size_nocheck(&(*(u16 *)ptr), __u.__c, sizeof(*(u16 *)ptr)); do { } while (0); __u.__val; });
  break;
 case 4:
  ret = ({ union { typeof(*(u32 *)ptr) __val; char __c[1]; } __u; if (1) __read_once_size(&(*(u32 *)ptr), __u.__c, sizeof(*(u32 *)ptr)); else __read_once_size_nocheck(&(*(u32 *)ptr), __u.__c, sizeof(*(u32 *)ptr)); do { } while (0); __u.__val; });
  break;
 case 8:
  ret = ({ union { typeof(*(u64 *)ptr) __val; char __c[1]; } __u; if (1) __read_once_size(&(*(u64 *)ptr), __u.__c, sizeof(*(u64 *)ptr)); else __read_once_size_nocheck(&(*(u64 *)ptr), __u.__c, sizeof(*(u64 *)ptr)); do { } while (0); __u.__val; });
  break;
 default:
  ret = 0;
  do { bool __cond = !(!(1)); extern void __compiletime_assert_127(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_127(); do { } while (0); } while (0);
 }

 return ret;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __percpu_write(void *ptr, unsigned long val, int size)
{
 switch (size) {
 case 1:
  ({ union { typeof(*(u8 *)ptr) __val; char __c[1]; } __u = { .__val = ( typeof(*(u8 *)ptr)) ((u8)val) }; __write_once_size(&(*(u8 *)ptr), __u.__c, sizeof(*(u8 *)ptr)); __u.__val; });
  break;
 case 2:
  ({ union { typeof(*(u16 *)ptr) __val; char __c[1]; } __u = { .__val = ( typeof(*(u16 *)ptr)) ((u16)val) }; __write_once_size(&(*(u16 *)ptr), __u.__c, sizeof(*(u16 *)ptr)); __u.__val; });
  break;
 case 4:
  ({ union { typeof(*(u32 *)ptr) __val; char __c[1]; } __u = { .__val = ( typeof(*(u32 *)ptr)) ((u32)val) }; __write_once_size(&(*(u32 *)ptr), __u.__c, sizeof(*(u32 *)ptr)); __u.__val; });
  break;
 case 8:
  ({ union { typeof(*(u64 *)ptr) __val; char __c[1]; } __u = { .__val = ( typeof(*(u64 *)ptr)) ((u64)val) }; __write_once_size(&(*(u64 *)ptr), __u.__c, sizeof(*(u64 *)ptr)); __u.__val; });
  break;
 default:
  do { bool __cond = !(!(1)); extern void __compiletime_assert_149(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_149(); do { } while (0); } while (0);
 }
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long __percpu_xchg(void *ptr, unsigned long val,
      int size)
{
 unsigned long ret, loop;

 switch (size) {
 case 1:
  asm ("//__percpu_xchg_1\n"
  "1:	ldxrb	%w[ret], %[ptr]\n"
  "	stxrb	%w[loop], %w[val], %[ptr]\n"
  "	cbnz	%w[loop], 1b"
  : [loop] "=&r"(loop), [ret] "=&r"(ret),
    [ptr] "+Q"(*(u8 *)ptr)
  : [val] "r" (val));
  break;
 case 2:
  asm ("//__percpu_xchg_2\n"
  "1:	ldxrh	%w[ret], %[ptr]\n"
  "	stxrh	%w[loop], %w[val], %[ptr]\n"
  "	cbnz	%w[loop], 1b"
  : [loop] "=&r"(loop), [ret] "=&r"(ret),
    [ptr] "+Q"(*(u16 *)ptr)
  : [val] "r" (val));
  break;
 case 4:
  asm ("//__percpu_xchg_4\n"
  "1:	ldxr	%w[ret], %[ptr]\n"
  "	stxr	%w[loop], %w[val], %[ptr]\n"
  "	cbnz	%w[loop], 1b"
  : [loop] "=&r"(loop), [ret] "=&r"(ret),
    [ptr] "+Q"(*(u32 *)ptr)
  : [val] "r" (val));
  break;
 case 8:
  asm ("//__percpu_xchg_8\n"
  "1:	ldxr	%[ret], %[ptr]\n"
  "	stxr	%w[loop], %[val], %[ptr]\n"
  "	cbnz	%w[loop], 1b"
  : [loop] "=&r"(loop), [ret] "=&r"(ret),
    [ptr] "+Q"(*(u64 *)ptr)
  : [val] "r" (val));
  break;
 default:
  ret = 0;
  do { bool __cond = !(!(1)); extern void __compiletime_assert_197(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_197(); do { } while (0); } while (0);
 }

 return ret;
}
# 280 "./arch/arm64/include/asm/percpu.h"
# 1 "./include/asm-generic/percpu.h" 1






# 1 "./include/linux/percpu-defs.h" 1
# 295 "./include/linux/percpu-defs.h"
extern void __bad_size_call_parameter(void);




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __this_cpu_preempt_check(const char *op) { }
# 8 "./include/asm-generic/percpu.h" 2
# 19 "./include/asm-generic/percpu.h"
extern unsigned long __per_cpu_offset[64];
# 48 "./include/asm-generic/percpu.h"
extern void setup_per_cpu_areas(void);
# 281 "./arch/arm64/include/asm/percpu.h" 2
# 33 "./arch/arm64/include/asm/smp.h" 2





extern __attribute__((section(".data..percpu" "..read_mostly"))) __typeof__(int) cpu_number;
# 49 "./arch/arm64/include/asm/smp.h"
struct seq_file;




extern void show_ipi_list(struct seq_file *p, int prec);




extern void handle_IPI(int ipinr, struct pt_regs *regs);





extern void smp_init_cpus(void);




extern void set_smp_cross_call(void (*)(const struct cpumask *, unsigned int));

extern void (*__smp_cross_call)(const struct cpumask *, unsigned int);




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




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void arch_send_wakeup_ipi_mask(const struct cpumask *mask)
{
 do { bool __cond = !(!(1)); extern void __compiletime_assert_103(void) __attribute__((error("BUILD_BUG failed"))); if (__cond) __compiletime_assert_103(); do { } while (0); } while (0);
}


extern int __cpu_disable(void);

extern void __cpu_die(unsigned int cpu);
extern void cpu_die(void);
extern void cpu_die_early(void);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpu_park_loop(void)
{
 for (;;) {
  asm volatile("wfe" : : : "memory");
  asm volatile("wfi" : : : "memory");
 }
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void update_cpu_boot_status(int val)
{
 ({ union { typeof(secondary_data.status) __val; char __c[1]; } __u = { .__val = ( typeof(secondary_data.status)) (val) }; __write_once_size(&(secondary_data.status), __u.__c, sizeof(secondary_data.status)); __u.__val; });

 asm volatile("dsb " "ishst" : : : "memory");
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cpu_panic_kernel(void)
{
 update_cpu_boot_status((3));
 cpu_park_loop();
}
# 149 "./arch/arm64/include/asm/smp.h"
bool cpus_are_stuck_in_kernel(void);

extern void crash_smp_send_stop(void);
extern bool smp_crash_stop_failed(void);
# 65 "./include/linux/smp.h" 2
# 74 "./include/linux/smp.h"
extern void smp_send_stop(void);




extern void smp_send_reschedule(int cpu);





extern void smp_prepare_cpus(unsigned int max_cpus);




extern int __cpu_up(unsigned int cpunum, struct task_struct *tidle);




extern void smp_cpus_done(unsigned int max_cpus);




int smp_call_function(smp_call_func_t func, void *info, int wait);
void smp_call_function_many(const struct cpumask *mask,
       smp_call_func_t func, void *info, bool wait);

int smp_call_function_any(const struct cpumask *mask,
     smp_call_func_t func, void *info, int wait);

void kick_all_cpus_sync(void);
void wake_up_all_idle_cpus(void);




void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) call_function_init(void);
void generic_smp_call_function_single_interrupt(void);







void smp_prepare_boot_cpu(void);

extern unsigned int setup_max_cpus;
extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) setup_nr_cpu_ids(void);
extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) smp_init(void);

extern int __boot_cpu_id;

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int get_boot_cpu_id(void)
{
 return __boot_cpu_id;
}
# 209 "./include/linux/smp.h"
extern void arch_disable_smp_support(void);

extern void arch_enable_nonboot_cpus_begin(void);
extern void arch_enable_nonboot_cpus_end(void);

void smp_setup_processor_id(void);

int smp_call_on_cpu(unsigned int cpu, int (*func)(void *), void *par,
      bool phys);


int smpcfd_prepare_cpu(unsigned int cpu);
int smpcfd_dead_cpu(unsigned int cpu);
int smpcfd_dying_cpu(unsigned int cpu);
# 29 "./arch/arm64/include/asm/arch_timer.h" 2


# 1 "./include/clocksource/arm_arch_timer.h" 1
# 20 "./include/clocksource/arm_arch_timer.h"
# 1 "./include/linux/timecounter.h" 1
# 39 "./include/linux/timecounter.h"
struct cyclecounter {
 u64 (*read)(const struct cyclecounter *cc);
 u64 mask;
 u32 mult;
 u32 shift;
};
# 64 "./include/linux/timecounter.h"
struct timecounter {
 const struct cyclecounter *cc;
 u64 cycle_last;
 u64 nsec;
 u64 mask;
 u64 frac;
};
# 79 "./include/linux/timecounter.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 cyclecounter_cyc2ns(const struct cyclecounter *cc,
          u64 cycles, u64 mask, u64 *frac)
{
 u64 ns = (u64) cycles;

 ns = (ns * cc->mult) + *frac;
 *frac = ns & mask;
 return ns >> cc->shift;
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void timecounter_adjtime(struct timecounter *tc, s64 delta)
{
 tc->nsec += delta;
}
# 108 "./include/linux/timecounter.h"
extern void timecounter_init(struct timecounter *tc,
        const struct cyclecounter *cc,
        u64 start_tstamp);
# 120 "./include/linux/timecounter.h"
extern u64 timecounter_read(struct timecounter *tc);
# 136 "./include/linux/timecounter.h"
extern u64 timecounter_cyc2time(struct timecounter *tc,
    u64 cycle_tstamp);
# 21 "./include/clocksource/arm_arch_timer.h" 2
# 36 "./include/clocksource/arm_arch_timer.h"
enum arch_timer_reg {
 ARCH_TIMER_REG_CTRL,
 ARCH_TIMER_REG_TVAL,
};

enum arch_timer_ppi_nr {
 ARCH_TIMER_PHYS_SECURE_PPI,
 ARCH_TIMER_PHYS_NONSECURE_PPI,
 ARCH_TIMER_VIRT_PPI,
 ARCH_TIMER_HYP_PPI,
 ARCH_TIMER_MAX_TIMER_PPI
};

enum arch_timer_spi_nr {
 ARCH_TIMER_PHYS_SPI,
 ARCH_TIMER_VIRT_SPI,
 ARCH_TIMER_MAX_TIMER_SPI
};
# 72 "./include/clocksource/arm_arch_timer.h"
struct arch_timer_kvm_info {
 struct timecounter timecounter;
 int virtual_irq;
};

struct arch_timer_mem_frame {
 bool valid;
 phys_addr_t cntbase;
 size_t size;
 int phys_irq;
 int virt_irq;
};

struct arch_timer_mem {
 phys_addr_t cntctlbase;
 size_t size;
 struct arch_timer_mem_frame frame[8];
};



extern u32 arch_timer_get_rate(void);
extern u64 (*arch_timer_read_counter)(void);
extern struct arch_timer_kvm_info *arch_timer_get_kvm_info(void);
# 32 "./arch/arm64/include/asm/arch_timer.h" 2


extern struct static_key_false arch_timer_read_ool_enabled;






enum arch_timer_erratum_match_type {
 ate_match_dt,
 ate_match_local_cap_id,
 ate_match_acpi_oem_info,
};

struct clock_event_device;

struct arch_timer_erratum_workaround {
 enum arch_timer_erratum_match_type match_type;
 const void *id;
 const char *desc;
 u32 (*read_cntp_tval_el0)(void);
 u32 (*read_cntv_tval_el0)(void);
 u64 (*read_cntvct_el0)(void);
 int (*set_next_event_phys)(unsigned long, struct clock_event_device *);
 int (*set_next_event_virt)(unsigned long, struct clock_event_device *);
};

extern __attribute__((section(".data..percpu" ""))) __typeof__(const struct arch_timer_erratum_workaround *) timer_unstable_counter_workaround
                                    ;
# 86 "./arch/arm64/include/asm/arch_timer.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline))
void arch_timer_reg_write_cp15(int access, enum arch_timer_reg reg, u32 val)
{
 if (access == 0) {
  switch (reg) {
  case ARCH_TIMER_REG_CTRL:
   do { u64 __val = (u64)(val); asm volatile("msr " "cntp_ctl_el0" ", %x0" : : "rZ" (__val)); } while (0);
   break;
  case ARCH_TIMER_REG_TVAL:
   do { u64 __val = (u64)(val); asm volatile("msr " "cntp_tval_el0" ", %x0" : : "rZ" (__val)); } while (0);
   break;
  }
 } else if (access == 1) {
  switch (reg) {
  case ARCH_TIMER_REG_CTRL:
   do { u64 __val = (u64)(val); asm volatile("msr " "cntv_ctl_el0" ", %x0" : : "rZ" (__val)); } while (0);
   break;
  case ARCH_TIMER_REG_TVAL:
   do { u64 __val = (u64)(val); asm volatile("msr " "cntv_tval_el0" ", %x0" : : "rZ" (__val)); } while (0);
   break;
  }
 }

 asm volatile("isb" : : : "memory");
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline))
u32 arch_timer_reg_read_cp15(int access, enum arch_timer_reg reg)
{
 if (access == 0) {
  switch (reg) {
  case ARCH_TIMER_REG_CTRL:
   return ({ u64 __val; asm volatile("mrs %0, " "cntp_ctl_el0" : "=r" (__val)); __val; });
  case ARCH_TIMER_REG_TVAL:
   return ({ u64 _val; if (({ bool branch; if (__builtin_types_compatible_p(typeof(*&arch_timer_read_ool_enabled), struct static_key_true)) branch = arch_static_branch_jump(&(&arch_timer_read_ool_enabled)->key, false); else if (__builtin_types_compatible_p(typeof(*&arch_timer_read_ool_enabled), struct static_key_false)) branch = arch_static_branch(&(&arch_timer_read_ool_enabled)->key, false); else branch = ____wrong_branch_error(); branch; })) { const struct arch_timer_erratum_workaround *wa; do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0); wa = ({ __this_cpu_preempt_check("read"); ({ typeof(timer_unstable_counter_workaround) pscr_ret__; do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(timer_unstable_counter_workaround)) { case 1: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))); (typeof((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; case 2: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))); (typeof((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; case 4: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))); (typeof((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; case 8: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))); (typeof((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; default: __bad_size_call_parameter(); break; } pscr_ret__; }); }); if (wa && wa->read_cntp_tval_el0) _val = wa->read_cntp_tval_el0(); else _val = ({ u64 __val; asm volatile("mrs %0, " "cntp_tval_el0" : "=r" (__val)); __val; }); do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule_notrace(); } while (0); } else { _val = ({ u64 __val; asm volatile("mrs %0, " "cntp_tval_el0" : "=r" (__val)); __val; }); } _val; });
  }
 } else if (access == 1) {
  switch (reg) {
  case ARCH_TIMER_REG_CTRL:
   return ({ u64 __val; asm volatile("mrs %0, " "cntv_ctl_el0" : "=r" (__val)); __val; });
  case ARCH_TIMER_REG_TVAL:
   return ({ u64 _val; if (({ bool branch; if (__builtin_types_compatible_p(typeof(*&arch_timer_read_ool_enabled), struct static_key_true)) branch = arch_static_branch_jump(&(&arch_timer_read_ool_enabled)->key, false); else if (__builtin_types_compatible_p(typeof(*&arch_timer_read_ool_enabled), struct static_key_false)) branch = arch_static_branch(&(&arch_timer_read_ool_enabled)->key, false); else branch = ____wrong_branch_error(); branch; })) { const struct arch_timer_erratum_workaround *wa; do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0); wa = ({ __this_cpu_preempt_check("read"); ({ typeof(timer_unstable_counter_workaround) pscr_ret__; do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(timer_unstable_counter_workaround)) { case 1: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))); (typeof((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; case 2: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))); (typeof((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; case 4: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))); (typeof((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; case 8: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))); (typeof((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; default: __bad_size_call_parameter(); break; } pscr_ret__; }); }); if (wa && wa->read_cntv_tval_el0) _val = wa->read_cntv_tval_el0(); else _val = ({ u64 __val; asm volatile("mrs %0, " "cntv_tval_el0" : "=r" (__val)); __val; }); do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule_notrace(); } while (0); } else { _val = ({ u64 __val; asm volatile("mrs %0, " "cntv_tval_el0" : "=r" (__val)); __val; }); } _val; });
  }
 }

 do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 0: .long 1f - 0b; .pushsection .rodata.str,\"aMS\",@progbits,1; 2: .string \"./arch/arm64/include/asm/arch_timer.h\"; .popsection; .long 2b - 0b; .short 131; .short 0; .popsection; 1: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 arch_timer_get_cntfrq(void)
{
 return ({ u64 __val; asm volatile("mrs %0, " "cntfrq_el0" : "=r" (__val)); __val; });
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u32 arch_timer_get_cntkctl(void)
{
 return ({ u64 __val; asm volatile("mrs %0, " "cntkctl_el1" : "=r" (__val)); __val; });
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void arch_timer_set_cntkctl(u32 cntkctl)
{
 do { u64 __val = (u64)(cntkctl); asm volatile("msr " "cntkctl_el1" ", %x0" : : "rZ" (__val)); } while (0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 arch_counter_get_cntpct(void)
{



 do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 0: .long 1f - 0b; .pushsection .rodata.str,\"aMS\",@progbits,1; 2: .string \"./arch/arm64/include/asm/arch_timer.h\"; .popsection; .long 2b - 0b; .short 154; .short 0; .popsection; 1: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0);
 return 0;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 arch_counter_get_cntvct(void)
{
 asm volatile("isb" : : : "memory");
 return ({ u64 _val; if (({ bool branch; if (__builtin_types_compatible_p(typeof(*&arch_timer_read_ool_enabled), struct static_key_true)) branch = arch_static_branch_jump(&(&arch_timer_read_ool_enabled)->key, false); else if (__builtin_types_compatible_p(typeof(*&arch_timer_read_ool_enabled), struct static_key_false)) branch = arch_static_branch(&(&arch_timer_read_ool_enabled)->key, false); else branch = ____wrong_branch_error(); branch; })) { const struct arch_timer_erratum_workaround *wa; do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0); wa = ({ __this_cpu_preempt_check("read"); ({ typeof(timer_unstable_counter_workaround) pscr_ret__; do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(timer_unstable_counter_workaround)) { case 1: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))); (typeof((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; case 2: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))); (typeof((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; case 4: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))); (typeof((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; case 8: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(timer_unstable_counter_workaround)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))); (typeof((typeof(*(&(timer_unstable_counter_workaround))) *)(&(timer_unstable_counter_workaround)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; default: __bad_size_call_parameter(); break; } pscr_ret__; }); }); if (wa && wa->read_cntvct_el0) _val = wa->read_cntvct_el0(); else _val = ({ u64 __val; asm volatile("mrs %0, " "cntvct_el0" : "=r" (__val)); __val; }); do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule_notrace(); } while (0); } else { _val = ({ u64 __val; asm volatile("mrs %0, " "cntvct_el0" : "=r" (__val)); __val; }); } _val; });
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int arch_timer_arch_init(void)
{
 return 0;
}
# 20 "./arch/arm64/include/asm/timex.h" 2







# 1 "./include/asm-generic/timex.h" 1







typedef unsigned long cycles_t;
# 28 "./arch/arm64/include/asm/timex.h" 2
# 66 "./include/linux/timex.h" 2
# 139 "./include/linux/timex.h"
extern unsigned long tick_usec;
extern unsigned long tick_nsec;
# 154 "./include/linux/timex.h"
extern int do_adjtimex(struct timex *);
extern void hardpps(const struct timespec *, const struct timespec *);

int read_current_timer(unsigned long *timer_val);
void ntp_notify_cmos_timer(void);
# 11 "./include/linux/jiffies.h" 2

# 1 "./include/generated/timeconst.h" 1
# 13 "./include/linux/jiffies.h" 2
# 60 "./include/linux/jiffies.h"
extern int register_refined_jiffies(long clock_tick_rate);
# 77 "./include/linux/jiffies.h"
extern u64 __attribute__((__aligned__((1 << 7)), __section__(".data..cacheline_aligned"))) jiffies_64;
extern unsigned long volatile __attribute__((__aligned__((1 << 7)), __section__(".data..cacheline_aligned"))) jiffies;




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 get_jiffies_64(void)
{
 return (u64)jiffies;
}
# 187 "./include/linux/jiffies.h"
extern unsigned long preset_lpj;
# 288 "./include/linux/jiffies.h"
extern unsigned int jiffies_to_msecs(const unsigned long j);
extern unsigned int jiffies_to_usecs(const unsigned long j);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 jiffies_to_nsecs(const unsigned long j)
{
 return (u64)jiffies_to_usecs(j) * 1000L;
}

extern u64 jiffies64_to_nsecs(u64 j);

extern unsigned long __msecs_to_jiffies(const unsigned int m);






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long _msecs_to_jiffies(const unsigned int m)
{
 return (m + (1000L / 250) - 1) / (1000L / 250);
}
# 360 "./include/linux/jiffies.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long msecs_to_jiffies(const unsigned int m)
{
 if (__builtin_constant_p(m)) {
  if ((int)m < 0)
   return ((((long)(~0UL>>1)) >> 1)-1);
  return _msecs_to_jiffies(m);
 } else {
  return __msecs_to_jiffies(m);
 }
}

extern unsigned long __usecs_to_jiffies(const unsigned int u);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long _usecs_to_jiffies(const unsigned int u)
{
 return (u + (1000000L / 250) - 1) / (1000000L / 250);
}
# 407 "./include/linux/jiffies.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) unsigned long usecs_to_jiffies(const unsigned int u)
{
 if (__builtin_constant_p(u)) {
  if (u > jiffies_to_usecs(((((long)(~0UL>>1)) >> 1)-1)))
   return ((((long)(~0UL>>1)) >> 1)-1);
  return _usecs_to_jiffies(u);
 } else {
  return __usecs_to_jiffies(u);
 }
}

extern unsigned long timespec64_to_jiffies(const struct timespec *value);
extern void jiffies_to_timespec64(const unsigned long jiffies,
      struct timespec *value);
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long timespec_to_jiffies(const struct timespec *value)
{
 struct timespec ts = timespec_to_timespec64(*value);

 return timespec64_to_jiffies(&ts);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void jiffies_to_timespec(const unsigned long jiffies,
           struct timespec *value)
{
 struct timespec ts;

 jiffies_to_timespec64(jiffies, &ts);
 *value = timespec64_to_timespec(ts);
}

extern unsigned long timeval_to_jiffies(const struct timeval *value);
extern void jiffies_to_timeval(const unsigned long jiffies,
          struct timeval *value);

extern clock_t jiffies_to_clock_t(unsigned long x);
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) clock_t jiffies_delta_to_clock_t(long delta)
{
 return jiffies_to_clock_t(({ typeof(0L) __UNIQUE_ID_max1_0 = (0L); typeof(delta) __UNIQUE_ID_max2_1 = (delta); (void) (&__UNIQUE_ID_max1_0 == &__UNIQUE_ID_max2_1); __UNIQUE_ID_max1_0 > __UNIQUE_ID_max2_1 ? __UNIQUE_ID_max1_0 : __UNIQUE_ID_max2_1; }));
}

extern unsigned long clock_t_to_jiffies(unsigned long x);
extern u64 jiffies_64_to_clock_t(u64 x);
extern u64 nsec_to_clock_t(u64 x);
extern u64 nsecs_to_jiffies64(u64 n);
extern unsigned long nsecs_to_jiffies(u64 n);
# 26 "./include/linux/ktime.h" 2


typedef s64 ktime_t;
# 37 "./include/linux/ktime.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t ktime_set(const s64 secs, const unsigned long nsecs)
{
 if (__builtin_expect(!!(secs >= (((s64)~((u64)1 << 63)) / 1000000000L)), 0))
  return ((s64)~((u64)1 << 63));

 return secs * 1000000000L + (s64)nsecs;
}
# 70 "./include/linux/ktime.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t timespec_to_ktime(struct timespec ts)
{
 return ktime_set(ts.tv_sec, ts.tv_nsec);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t timespec64_to_ktime(struct timespec ts)
{
 return ktime_set(ts.tv_sec, ts.tv_nsec);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t timeval_to_ktime(struct timeval tv)
{
 return ktime_set(tv.tv_sec, tv.tv_usec * 1000L);
}
# 109 "./include/linux/ktime.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int ktime_compare(const ktime_t cmp1, const ktime_t cmp2)
{
 if (cmp1 < cmp2)
  return -1;
 if (cmp1 > cmp2)
  return 1;
 return 0;
}
# 125 "./include/linux/ktime.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool ktime_after(const ktime_t cmp1, const ktime_t cmp2)
{
 return ktime_compare(cmp1, cmp2) > 0;
}
# 137 "./include/linux/ktime.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool ktime_before(const ktime_t cmp1, const ktime_t cmp2)
{
 return ktime_compare(cmp1, cmp2) < 0;
}
# 162 "./include/linux/ktime.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 ktime_divns(const ktime_t kt, s64 div)
{




 ({ int __ret_warn_on = !!(div < 0); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 0: .long 1f - 0b; .pushsection .rodata.str,\"aMS\",@progbits,1; 2: .string \"./include/linux/ktime.h\"; .popsection; .long 2b - 0b; .short 168; .short (1 << 0)|(((9) << 8)); .popsection; 1: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); });
 return kt / div;
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 ktime_to_us(const ktime_t kt)
{
 return ktime_divns(kt, 1000L);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 ktime_to_ms(const ktime_t kt)
{
 return ktime_divns(kt, 1000000L);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 ktime_us_delta(const ktime_t later, const ktime_t earlier)
{
       return ktime_to_us(((later) - (earlier)));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 ktime_ms_delta(const ktime_t later, const ktime_t earlier)
{
 return ktime_to_ms(((later) - (earlier)));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t ktime_add_us(const ktime_t kt, const u64 usec)
{
 return ((kt) + (usec * 1000L));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t ktime_add_ms(const ktime_t kt, const u64 msec)
{
 return ((kt) + (msec * 1000000L));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t ktime_sub_us(const ktime_t kt, const u64 usec)
{
 return ((kt) - (usec * 1000L));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t ktime_sub_ms(const ktime_t kt, const u64 msec)
{
 return ((kt) - (msec * 1000000L));
}

extern ktime_t ktime_add_safe(const ktime_t lhs, const ktime_t rhs);
# 223 "./include/linux/ktime.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) bool ktime_to_timespec_cond(const ktime_t kt,
             struct timespec *ts)
{
 if (kt) {
  *ts = ns_to_timespec((kt));
  return true;
 } else {
  return false;
 }
}
# 242 "./include/linux/ktime.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) bool ktime_to_timespec64_cond(const ktime_t kt,
             struct timespec *ts)
{
 if (kt) {
  *ts = ns_to_timespec((kt));
  return true;
 } else {
  return false;
 }
}
# 262 "./include/linux/ktime.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t ns_to_ktime(u64 ns)
{
 return ns;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t ms_to_ktime(u64 ms)
{
 return ms * 1000000L;
}

# 1 "./include/linux/timekeeping.h" 1
# 9 "./include/linux/timekeeping.h"
void timekeeping_init(void);
extern int timekeeping_suspended;


extern void update_process_times(int user);
extern void xtime_update(unsigned long ticks);




extern void do_gettimeofday(struct timeval *tv);
extern int do_settimeofday64(const struct timespec *ts);
extern int do_sys_settimeofday64(const struct timespec *tv,
     const struct timezone *tz);



unsigned long get_seconds(void);
struct timespec current_kernel_time64(void);

struct timespec __current_kernel_time(void);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct timespec current_kernel_time(void)
{
 struct timespec now = current_kernel_time64();

 return timespec64_to_timespec(now);
}




struct timespec get_monotonic_coarse64(void);
extern void getrawmonotonic64(struct timespec *ts);
extern void ktime_get_ts64(struct timespec *ts);
extern time64_t ktime_get_seconds(void);
extern time64_t ktime_get_real_seconds(void);

extern int __getnstimeofday64(struct timespec *tv);
extern void getnstimeofday64(struct timespec *tv);
extern void getboottime64(struct timespec *ts);





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int do_settimeofday(const struct timespec *ts)
{
 return do_settimeofday64(ts);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __getnstimeofday(struct timespec *ts)
{
 return __getnstimeofday64(ts);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void getnstimeofday(struct timespec *ts)
{
 getnstimeofday64(ts);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void ktime_get_ts(struct timespec *ts)
{
 ktime_get_ts64(ts);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void ktime_get_real_ts(struct timespec *ts)
{
 getnstimeofday64(ts);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void getrawmonotonic(struct timespec *ts)
{
 getrawmonotonic64(ts);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct timespec get_monotonic_coarse(void)
{
 return get_monotonic_coarse64();
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void getboottime(struct timespec *ts)
{
 return getboottime64(ts);
}
# 167 "./include/linux/timekeeping.h"
enum tk_offsets {
 TK_OFFS_REAL,
 TK_OFFS_BOOT,
 TK_OFFS_TAI,
 TK_OFFS_MAX,
};

extern ktime_t ktime_get(void);
extern ktime_t ktime_get_with_offset(enum tk_offsets offs);
extern ktime_t ktime_mono_to_any(ktime_t tmono, enum tk_offsets offs);
extern ktime_t ktime_get_raw(void);
extern u32 ktime_get_resolution_ns(void);




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t ktime_get_real(void)
{
 return ktime_get_with_offset(TK_OFFS_REAL);
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t ktime_get_boottime(void)
{
 return ktime_get_with_offset(TK_OFFS_BOOT);
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t ktime_get_clocktai(void)
{
 return ktime_get_with_offset(TK_OFFS_TAI);
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t ktime_mono_to_real(ktime_t mono)
{
 return ktime_mono_to_any(mono, TK_OFFS_REAL);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 ktime_get_ns(void)
{
 return (ktime_get());
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 ktime_get_real_ns(void)
{
 return (ktime_get_real());
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 ktime_get_boot_ns(void)
{
 return (ktime_get_boottime());
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 ktime_get_tai_ns(void)
{
 return (ktime_get_clocktai());
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 ktime_get_raw_ns(void)
{
 return (ktime_get_raw());
}

extern u64 ktime_get_mono_fast_ns(void);
extern u64 ktime_get_raw_fast_ns(void);
extern u64 ktime_get_boot_fast_ns(void);




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void get_monotonic_boottime(struct timespec *ts)
{
 *ts = ns_to_timespec((ktime_get_boottime()));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void get_monotonic_boottime64(struct timespec *ts)
{
 *ts = ns_to_timespec((ktime_get_boottime()));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void timekeeping_clocktai(struct timespec *ts)
{
 *ts = ns_to_timespec((ktime_get_clocktai()));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void timekeeping_clocktai64(struct timespec *ts)
{
 *ts = ns_to_timespec((ktime_get_clocktai()));
}




extern bool timekeeping_rtc_skipsuspend(void);
extern bool timekeeping_rtc_skipresume(void);

extern void timekeeping_inject_sleeptime64(struct timespec *delta);




extern void ktime_get_raw_and_real_ts64(struct timespec *ts_raw,
            struct timespec *ts_real);
# 290 "./include/linux/timekeeping.h"
struct system_time_snapshot {
 u64 cycles;
 ktime_t real;
 ktime_t raw;
 unsigned int clock_was_set_seq;
 u8 cs_was_changed_seq;
};
# 305 "./include/linux/timekeeping.h"
struct system_device_crosststamp {
 ktime_t device;
 ktime_t sys_realtime;
 ktime_t sys_monoraw;
};
# 318 "./include/linux/timekeeping.h"
struct system_counterval_t {
 u64 cycles;
 struct clocksource *cs;
};




extern int get_device_system_crosststamp(
   int (*get_time_fn)(ktime_t *device_time,
    struct system_counterval_t *system_counterval,
    void *ctx),
   void *ctx,
   struct system_time_snapshot *history,
   struct system_device_crosststamp *xtstamp);




extern void ktime_get_snapshot(struct system_time_snapshot *systime_snapshot);




extern int persistent_clock_is_local;

extern void read_persistent_clock(struct timespec *ts);
extern void read_persistent_clock64(struct timespec *ts);
extern void read_boot_clock64(struct timespec *ts);
extern int update_persistent_clock(struct timespec now);
extern int update_persistent_clock64(struct timespec now);
# 273 "./include/linux/ktime.h" 2
# 7 "./include/linux/timer.h" 2

# 1 "./include/linux/debugobjects.h" 1







enum debug_obj_state {
 ODEBUG_STATE_NONE,
 ODEBUG_STATE_INIT,
 ODEBUG_STATE_INACTIVE,
 ODEBUG_STATE_ACTIVE,
 ODEBUG_STATE_DESTROYED,
 ODEBUG_STATE_NOTAVAILABLE,
 ODEBUG_STATE_MAX,
};

struct debug_obj_descr;
# 28 "./include/linux/debugobjects.h"
struct debug_obj {
 struct hlist_node node;
 enum debug_obj_state state;
 unsigned int astate;
 void *object;
 struct debug_obj_descr *descr;
};
# 55 "./include/linux/debugobjects.h"
struct debug_obj_descr {
 const char *name;
 void *(*debug_hint)(void *addr);
 bool (*is_static_object)(void *addr);
 bool (*fixup_init)(void *addr, enum debug_obj_state state);
 bool (*fixup_activate)(void *addr, enum debug_obj_state state);
 bool (*fixup_destroy)(void *addr, enum debug_obj_state state);
 bool (*fixup_free)(void *addr, enum debug_obj_state state);
 bool (*fixup_assert_init)(void *addr, enum debug_obj_state state);
};
# 88 "./include/linux/debugobjects.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
debug_object_init (void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
debug_object_init_on_stack(void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int
debug_object_activate (void *addr, struct debug_obj_descr *descr) { return 0; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
debug_object_deactivate(void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
debug_object_destroy (void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
debug_object_free (void *addr, struct debug_obj_descr *descr) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
debug_object_assert_init(void *addr, struct debug_obj_descr *descr) { }

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void debug_objects_early_init(void) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void debug_objects_mem_init(void) { }





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
debug_check_no_obj_freed(const void *address, unsigned long size) { }
# 9 "./include/linux/timer.h" 2


struct tvec_base;

struct timer_list {




 struct hlist_node entry;
 unsigned long expires;
 void (*function)(unsigned long);
 unsigned long data;
 u32 flags;




};
# 93 "./include/linux/timer.h"
void init_timer_key(struct timer_list *timer, unsigned int flags,
      const char *name, struct lock_class_key *key);







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void destroy_timer_on_stack(struct timer_list *timer) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void init_timer_on_stack_key(struct timer_list *timer,
        unsigned int flags, const char *name,
        struct lock_class_key *key)
{
 init_timer_key(timer, flags, name, key);
}
# 175 "./include/linux/timer.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void timer_setup(struct timer_list *timer,
          void (*callback)(struct timer_list *),
          unsigned int flags)
{
 do { init_timer_key(((timer)), ((flags)), ((void *)0), ((void *)0)); (timer)->function = ((void (*)(unsigned long))callback); (timer)->data = ((unsigned long)timer); } while (0)
                                      ;
}
# 196 "./include/linux/timer.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int timer_pending(const struct timer_list * timer)
{
 return timer->entry.pprev != ((void *)0);
}

extern void add_timer_on(struct timer_list *timer, int cpu);
extern int del_timer(struct timer_list * timer);
extern int mod_timer(struct timer_list *timer, unsigned long expires);
extern int mod_timer_pending(struct timer_list *timer, unsigned long expires);







extern void add_timer(struct timer_list *timer);

extern int try_to_del_timer_sync(struct timer_list *timer);


  extern int del_timer_sync(struct timer_list *timer);






extern void init_timers(void);
extern void run_local_timers(void);
struct hrtimer;
extern enum hrtimer_restart it_real_fn(struct hrtimer *);


struct ctl_table;

extern unsigned int sysctl_timer_migration;
int timer_migration_handler(struct ctl_table *table, int write,
       void *buffer, size_t *lenp,
       loff_t *ppos);


unsigned long __round_jiffies(unsigned long j, int cpu);
unsigned long __round_jiffies_relative(unsigned long j, int cpu);
unsigned long round_jiffies(unsigned long j);
unsigned long round_jiffies_relative(unsigned long j);

unsigned long __round_jiffies_up(unsigned long j, int cpu);
unsigned long __round_jiffies_up_relative(unsigned long j, int cpu);
unsigned long round_jiffies_up(unsigned long j);
unsigned long round_jiffies_up_relative(unsigned long j);


int timers_prepare_cpu(unsigned int cpu);
int timers_dead_cpu(unsigned int cpu);
# 10 "./include/linux/workqueue.h" 2







struct workqueue_struct;

struct work_struct;
typedef void (*work_func_t)(struct work_struct *work);
void delayed_work_timer_fn(unsigned long __data);







enum {
 WORK_STRUCT_PENDING_BIT = 0,
 WORK_STRUCT_DELAYED_BIT = 1,
 WORK_STRUCT_PWQ_BIT = 2,
 WORK_STRUCT_LINKED_BIT = 3,




 WORK_STRUCT_COLOR_SHIFT = 4,


 WORK_STRUCT_COLOR_BITS = 4,

 WORK_STRUCT_PENDING = 1 << WORK_STRUCT_PENDING_BIT,
 WORK_STRUCT_DELAYED = 1 << WORK_STRUCT_DELAYED_BIT,
 WORK_STRUCT_PWQ = 1 << WORK_STRUCT_PWQ_BIT,
 WORK_STRUCT_LINKED = 1 << WORK_STRUCT_LINKED_BIT,



 WORK_STRUCT_STATIC = 0,






 WORK_NR_COLORS = (1 << WORK_STRUCT_COLOR_BITS) - 1,
 WORK_NO_COLOR = WORK_NR_COLORS,


 WORK_CPU_UNBOUND = 64,






 WORK_STRUCT_FLAG_BITS = WORK_STRUCT_COLOR_SHIFT +
      WORK_STRUCT_COLOR_BITS,


 WORK_OFFQ_FLAG_BASE = WORK_STRUCT_COLOR_SHIFT,

 __WORK_OFFQ_CANCELING = WORK_OFFQ_FLAG_BASE,
 WORK_OFFQ_CANCELING = (1 << __WORK_OFFQ_CANCELING),






 WORK_OFFQ_FLAG_BITS = 1,
 WORK_OFFQ_POOL_SHIFT = WORK_OFFQ_FLAG_BASE + WORK_OFFQ_FLAG_BITS,
 WORK_OFFQ_LEFT = 64 - WORK_OFFQ_POOL_SHIFT,
 WORK_OFFQ_POOL_BITS = WORK_OFFQ_LEFT <= 31 ? WORK_OFFQ_LEFT : 31,
 WORK_OFFQ_POOL_NONE = (1LU << WORK_OFFQ_POOL_BITS) - 1,


 WORK_STRUCT_FLAG_MASK = (1UL << WORK_STRUCT_FLAG_BITS) - 1,
 WORK_STRUCT_WQ_DATA_MASK = ~WORK_STRUCT_FLAG_MASK,
 WORK_STRUCT_NO_POOL = (unsigned long)WORK_OFFQ_POOL_NONE << WORK_OFFQ_POOL_SHIFT,


 WORK_BUSY_PENDING = 1 << 0,
 WORK_BUSY_RUNNING = 1 << 1,


 WORKER_DESC_LEN = 24,
};

struct work_struct {
 atomic_long_t data;
 struct list_head entry;
 work_func_t func;



};





struct delayed_work {
 struct work_struct work;
 struct timer_list timer;


 struct workqueue_struct *wq;
 int cpu;
};






struct workqueue_attrs {



 int nice;




 cpumask_var_t cpumask;
# 146 "./include/linux/workqueue.h"
 bool no_numa;
};

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct delayed_work *to_delayed_work(struct work_struct *work)
{
 return ({ void *__mptr = (void *)(work); do { bool __cond = !(!(!__builtin_types_compatible_p(typeof(*(work)), typeof(((struct delayed_work *)0)->work)) && !__builtin_types_compatible_p(typeof(*(work)), typeof(void)))); extern void __compiletime_assert_151(void) __attribute__((error("pointer type mismatch in container_of()"))); if (__cond) __compiletime_assert_151(); do { } while (0); } while (0); ((struct delayed_work *)(__mptr - __builtin_offsetof(struct delayed_work, work))); });
}

struct execute_work {
 struct work_struct work;
};
# 202 "./include/linux/workqueue.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __init_work(struct work_struct *work, int onstack) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void destroy_work_on_stack(struct work_struct *work) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void destroy_delayed_work_on_stack(struct delayed_work *work) { }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int work_static(struct work_struct *work) { return 0; }
# 290 "./include/linux/workqueue.h"
enum {
 WQ_UNBOUND = 1 << 1,
 WQ_FREEZABLE = 1 << 2,
 WQ_MEM_RECLAIM = 1 << 3,
 WQ_HIGHPRI = 1 << 4,
 WQ_CPU_INTENSIVE = 1 << 5,
 WQ_SYSFS = 1 << 6,
# 323 "./include/linux/workqueue.h"
 WQ_POWER_EFFICIENT = 1 << 7,

 __WQ_DRAINING = 1 << 16,
 __WQ_ORDERED = 1 << 17,
 __WQ_LEGACY = 1 << 18,
 __WQ_ORDERED_EXPLICIT = 1 << 19,

 WQ_MAX_ACTIVE = 512,
 WQ_MAX_UNBOUND_PER_CPU = 4,
 WQ_DFL_ACTIVE = WQ_MAX_ACTIVE / 2,
};
# 367 "./include/linux/workqueue.h"
extern struct workqueue_struct *system_wq;
extern struct workqueue_struct *system_highpri_wq;
extern struct workqueue_struct *system_long_wq;
extern struct workqueue_struct *system_unbound_wq;
extern struct workqueue_struct *system_freezable_wq;
extern struct workqueue_struct *system_power_efficient_wq;
extern struct workqueue_struct *system_freezable_power_efficient_wq;

extern struct workqueue_struct *
__alloc_workqueue_key(const char *fmt, unsigned int flags, int max_active,
 struct lock_class_key *key, const char *lock_name, ...) __attribute__((format(printf, 1, 6)));
# 438 "./include/linux/workqueue.h"
extern void destroy_workqueue(struct workqueue_struct *wq);

struct workqueue_attrs *alloc_workqueue_attrs(gfp_t gfp_mask);
void free_workqueue_attrs(struct workqueue_attrs *attrs);
int apply_workqueue_attrs(struct workqueue_struct *wq,
     const struct workqueue_attrs *attrs);
int workqueue_set_unbound_cpumask(cpumask_var_t cpumask);

extern bool queue_work_on(int cpu, struct workqueue_struct *wq,
   struct work_struct *work);
extern bool queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
   struct delayed_work *work, unsigned long delay);
extern bool mod_delayed_work_on(int cpu, struct workqueue_struct *wq,
   struct delayed_work *dwork, unsigned long delay);

extern void flush_workqueue(struct workqueue_struct *wq);
extern void drain_workqueue(struct workqueue_struct *wq);

extern int schedule_on_each_cpu(work_func_t func);

int execute_in_process_context(work_func_t fn, struct execute_work *);

extern bool flush_work(struct work_struct *work);
extern bool cancel_work(struct work_struct *work);
extern bool cancel_work_sync(struct work_struct *work);

extern bool flush_delayed_work(struct delayed_work *dwork);
extern bool cancel_delayed_work(struct delayed_work *dwork);
extern bool cancel_delayed_work_sync(struct delayed_work *dwork);

extern void workqueue_set_max_active(struct workqueue_struct *wq,
         int max_active);
extern struct work_struct *current_work(void);
extern bool current_is_workqueue_rescuer(void);
extern bool workqueue_congested(int cpu, struct workqueue_struct *wq);
extern unsigned int work_busy(struct work_struct *work);
extern __attribute__((format(printf, 1, 2))) void set_worker_desc(const char *fmt, ...);
extern void print_worker_info(const char *log_lvl, struct task_struct *task);
extern void show_workqueue_state(void);
# 488 "./include/linux/workqueue.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool queue_work(struct workqueue_struct *wq,
         struct work_struct *work)
{
 return queue_work_on(WORK_CPU_UNBOUND, wq, work);
}
# 502 "./include/linux/workqueue.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool queue_delayed_work(struct workqueue_struct *wq,
          struct delayed_work *dwork,
          unsigned long delay)
{
 return queue_delayed_work_on(WORK_CPU_UNBOUND, wq, dwork, delay);
}
# 517 "./include/linux/workqueue.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool mod_delayed_work(struct workqueue_struct *wq,
        struct delayed_work *dwork,
        unsigned long delay)
{
 return mod_delayed_work_on(WORK_CPU_UNBOUND, wq, dwork, delay);
}
# 531 "./include/linux/workqueue.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool schedule_work_on(int cpu, struct work_struct *work)
{
 return queue_work_on(cpu, system_wq, work);
}
# 547 "./include/linux/workqueue.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool schedule_work(struct work_struct *work)
{
 return queue_work(system_wq, work);
}
# 576 "./include/linux/workqueue.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void flush_scheduled_work(void)
{
 flush_workqueue(system_wq);
}
# 590 "./include/linux/workqueue.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool schedule_delayed_work_on(int cpu, struct delayed_work *dwork,
         unsigned long delay)
{
 return queue_delayed_work_on(cpu, system_wq, dwork, delay);
}
# 604 "./include/linux/workqueue.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool schedule_delayed_work(struct delayed_work *dwork,
      unsigned long delay)
{
 return queue_delayed_work(system_wq, dwork, delay);
}
# 620 "./include/linux/workqueue.h"
long work_on_cpu(int cpu, long (*fn)(void *), void *arg);
long work_on_cpu_safe(int cpu, long (*fn)(void *), void *arg);



extern void freeze_workqueues_begin(void);
extern bool freeze_workqueues_busy(void);
extern void thaw_workqueues(void);



int workqueue_sysfs_register(struct workqueue_struct *wq);
# 640 "./include/linux/workqueue.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void wq_watchdog_touch(int cpu) { }



int workqueue_prepare_cpu(unsigned int cpu);
int workqueue_online_cpu(unsigned int cpu);
int workqueue_offline_cpu(unsigned int cpu);


int __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) workqueue_init_early(void);
int __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) workqueue_init(void);
# 27 "./include/linux/rhashtable.h" 2
# 1 "./include/linux/mutex.h" 1
# 21 "./include/linux/mutex.h"
# 1 "./include/linux/osq_lock.h" 1
# 9 "./include/linux/osq_lock.h"
struct optimistic_spin_node {
 struct optimistic_spin_node *next, *prev;
 int locked;
 int cpu;
};

struct optimistic_spin_queue {




 atomic_t tail;
};






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void osq_lock_init(struct optimistic_spin_queue *lock)
{
 ({ union { typeof(((&lock->tail)->counter)) __val; char __c[1]; } __u = { .__val = ( typeof(((&lock->tail)->counter))) (((0))) }; __write_once_size(&(((&lock->tail)->counter)), __u.__c, sizeof(((&lock->tail)->counter))); __u.__val; });
}

extern bool osq_lock(struct optimistic_spin_queue *lock);
extern void osq_unlock(struct optimistic_spin_queue *lock);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool osq_is_locked(struct optimistic_spin_queue *lock)
{
 return ({ union { typeof((&lock->tail)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&((&lock->tail)->counter), __u.__c, sizeof((&lock->tail)->counter)); else __read_once_size_nocheck(&((&lock->tail)->counter), __u.__c, sizeof((&lock->tail)->counter)); do { } while (0); __u.__val; }) != (0);
}
# 22 "./include/linux/mutex.h" 2
# 1 "./include/linux/debug_locks.h" 1
# 9 "./include/linux/debug_locks.h"
struct task_struct;

extern int debug_locks;
extern int debug_locks_silent;


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __debug_locks_off(void)
{
 return ({ __typeof__(*(&debug_locks)) __ret; __ret = (__typeof__(*(&debug_locks))) __xchg_mb((unsigned long)(0), (&debug_locks), sizeof(*(&debug_locks))); __ret; });
}




extern int debug_locks_off(void);
# 49 "./include/linux/debug_locks.h"
struct task_struct;







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void debug_show_all_locks(void)
{
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void debug_show_held_locks(struct task_struct *task)
{
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
debug_check_no_locks_freed(const void *from, unsigned long len)
{
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
debug_check_no_locks_held(void)
{
}
# 23 "./include/linux/mutex.h" 2

struct ww_acquire_ctx;
# 54 "./include/linux/mutex.h"
struct mutex {
 atomic_long_t owner;
 spinlock_t wait_lock;

 struct optimistic_spin_queue osq;

 struct list_head wait_list;






};

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct task_struct *__mutex_owner(struct mutex *lock)
{
 return (struct task_struct *)(atomic_long_read(&lock->owner) & ~0x07);
}





struct mutex_waiter {
 struct list_head list;
 struct task_struct *task;
 struct ww_acquire_ctx *ww_ctx;



};
# 98 "./include/linux/mutex.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void mutex_destroy(struct mutex *lock) {}
# 134 "./include/linux/mutex.h"
extern void __mutex_init(struct mutex *lock, const char *name,
    struct lock_class_key *key);







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int mutex_is_locked(struct mutex *lock)
{



 return __mutex_owner(lock) != ((void *)0);
}
# 177 "./include/linux/mutex.h"
extern void mutex_lock(struct mutex *lock);
extern int __attribute__((warn_unused_result)) mutex_lock_interruptible(struct mutex *lock);
extern int __attribute__((warn_unused_result)) mutex_lock_killable(struct mutex *lock);
extern void mutex_lock_io(struct mutex *lock);
# 195 "./include/linux/mutex.h"
extern int mutex_trylock(struct mutex *lock);
extern void mutex_unlock(struct mutex *lock);

extern int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);





enum mutex_trylock_recursive_enum {
 MUTEX_TRYLOCK_FAILED = 0,
 MUTEX_TRYLOCK_SUCCESS = 1,
 MUTEX_TRYLOCK_RECURSIVE,
};
# 222 "./include/linux/mutex.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) enum mutex_trylock_recursive_enum
mutex_trylock_recursive(struct mutex *lock)
{
 if (__builtin_expect(!!(__mutex_owner(lock) == get_current()), 0))
  return MUTEX_TRYLOCK_RECURSIVE;

 return mutex_trylock(lock);
}
# 28 "./include/linux/rhashtable.h" 2
# 67 "./include/linux/rhashtable.h"
struct rhash_head {
 struct rhash_head *next;
};

struct rhlist_head {
 struct rhash_head rhead;
 struct rhlist_head *next;
};
# 90 "./include/linux/rhashtable.h"
struct bucket_table {
 unsigned int size;
 unsigned int nest;
 unsigned int rehash;
 u32 hash_rnd;
 unsigned int locks_mask;
 spinlock_t *locks;
 struct list_head walkers;
 struct callback_head rcu;

 struct bucket_table *future_tbl;

 struct rhash_head *buckets[] __attribute__((__aligned__((1 << 7))));
};






struct rhashtable_compare_arg {
 struct rhashtable *ht;
 const void *key;
};

typedef u32 (*rht_hashfn_t)(const void *data, u32 len, u32 seed);
typedef u32 (*rht_obj_hashfn_t)(const void *data, u32 len, u32 seed);
typedef int (*rht_obj_cmpfn_t)(struct rhashtable_compare_arg *arg,
          const void *obj);

struct rhashtable;
# 137 "./include/linux/rhashtable.h"
struct rhashtable_params {
 u16 nelem_hint;
 u16 key_len;
 u16 key_offset;
 u16 head_offset;
 unsigned int max_size;
 u16 min_size;
 bool automatic_shrinking;
 u8 locks_mul;
 u32 nulls_base;
 rht_hashfn_t hashfn;
 rht_obj_hashfn_t obj_hashfn;
 rht_obj_cmpfn_t obj_cmpfn;
};
# 164 "./include/linux/rhashtable.h"
struct rhashtable {
 struct bucket_table *tbl;
 unsigned int key_len;
 unsigned int max_elems;
 struct rhashtable_params p;
 bool rhlist;
 struct work_struct run_work;
 struct mutex mutex;
 spinlock_t lock;
 atomic_t nelems;
};





struct rhltable {
 struct rhashtable ht;
};






struct rhashtable_walker {
 struct list_head list;
 struct bucket_table *tbl;
};
# 203 "./include/linux/rhashtable.h"
struct rhashtable_iter {
 struct rhashtable *ht;
 struct rhash_head *p;
 struct rhlist_head *list;
 struct rhashtable_walker walker;
 unsigned int slot;
 unsigned int skip;
};

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long rht_marker(const struct rhashtable *ht, u32 hash)
{
 return (1UL | (((long)ht->p.nulls_base + hash) << 1));
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool rht_is_a_nulls(const struct rhash_head *ptr)
{
 return ((unsigned long) ptr & 1);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long rht_get_nulls_value(const struct rhash_head *ptr)
{
 return ((unsigned long) ptr) >> 1;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *rht_obj(const struct rhashtable *ht,
       const struct rhash_head *he)
{
 return (char *)he - ht->p.head_offset;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int rht_bucket_index(const struct bucket_table *tbl,
         unsigned int hash)
{
 return (hash >> (4 + 1)) & (tbl->size - 1);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int rht_key_hashfn(
 struct rhashtable *ht, const struct bucket_table *tbl,
 const void *key, const struct rhashtable_params params)
{
 unsigned int hash;


 if (!__builtin_constant_p(params.key_len))
  hash = ht->p.hashfn(key, ht->key_len, tbl->hash_rnd);
 else if (params.key_len) {
  unsigned int key_len = params.key_len;

  if (params.hashfn)
   hash = params.hashfn(key, key_len, tbl->hash_rnd);
  else if (key_len & (sizeof(u32) - 1))
   hash = jhash(key, key_len, tbl->hash_rnd);
  else
   hash = jhash2(key, key_len / sizeof(u32),
          tbl->hash_rnd);
 } else {
  unsigned int key_len = ht->p.key_len;

  if (params.hashfn)
   hash = params.hashfn(key, key_len, tbl->hash_rnd);
  else
   hash = jhash(key, key_len, tbl->hash_rnd);
 }

 return rht_bucket_index(tbl, hash);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int rht_head_hashfn(
 struct rhashtable *ht, const struct bucket_table *tbl,
 const struct rhash_head *he, const struct rhashtable_params params)
{
 const char *ptr = rht_obj(ht, he);

 return __builtin_expect(!!(params.obj_hashfn), 1) ?
        rht_bucket_index(tbl, params.obj_hashfn(ptr, params.key_len ?:
           ht->p.key_len,
             tbl->hash_rnd)) :
        rht_key_hashfn(ht, tbl, ptr + params.key_offset, params);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool rht_grow_above_75(const struct rhashtable *ht,
         const struct bucket_table *tbl)
{

 return ({ union { typeof((&ht->nelems)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&((&ht->nelems)->counter), __u.__c, sizeof((&ht->nelems)->counter)); else __read_once_size_nocheck(&((&ht->nelems)->counter), __u.__c, sizeof((&ht->nelems)->counter)); do { } while (0); __u.__val; }) > (tbl->size / 4 * 3) &&
        (!ht->p.max_size || tbl->size < ht->p.max_size);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool rht_shrink_below_30(const struct rhashtable *ht,
           const struct bucket_table *tbl)
{

 return ({ union { typeof((&ht->nelems)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&((&ht->nelems)->counter), __u.__c, sizeof((&ht->nelems)->counter)); else __read_once_size_nocheck(&((&ht->nelems)->counter), __u.__c, sizeof((&ht->nelems)->counter)); do { } while (0); __u.__val; }) < (tbl->size * 3 / 10) &&
        tbl->size > ht->p.min_size;
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool rht_grow_above_100(const struct rhashtable *ht,
          const struct bucket_table *tbl)
{
 return ({ union { typeof((&ht->nelems)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&((&ht->nelems)->counter), __u.__c, sizeof((&ht->nelems)->counter)); else __read_once_size_nocheck(&((&ht->nelems)->counter), __u.__c, sizeof((&ht->nelems)->counter)); do { } while (0); __u.__val; }) > tbl->size &&
  (!ht->p.max_size || tbl->size < ht->p.max_size);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool rht_grow_above_max(const struct rhashtable *ht,
          const struct bucket_table *tbl)
{
 return ({ union { typeof((&ht->nelems)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&((&ht->nelems)->counter), __u.__c, sizeof((&ht->nelems)->counter)); else __read_once_size_nocheck(&((&ht->nelems)->counter), __u.__c, sizeof((&ht->nelems)->counter)); do { } while (0); __u.__val; }) >= ht->max_elems;
}
# 348 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) spinlock_t *rht_bucket_lock(const struct bucket_table *tbl,
       unsigned int hash)
{
 return &tbl->locks[hash & tbl->locks_mask];
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int lockdep_rht_mutex_is_held(struct rhashtable *ht)
{
 return 1;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int lockdep_rht_bucket_is_held(const struct bucket_table *tbl,
          u32 hash)
{
 return 1;
}


int rhashtable_init(struct rhashtable *ht,
      const struct rhashtable_params *params);
int rhltable_init(struct rhltable *hlt,
    const struct rhashtable_params *params);

void *rhashtable_insert_slow(struct rhashtable *ht, const void *key,
        struct rhash_head *obj);

void rhashtable_walk_enter(struct rhashtable *ht,
      struct rhashtable_iter *iter);
void rhashtable_walk_exit(struct rhashtable_iter *iter);
int rhashtable_walk_start(struct rhashtable_iter *iter) ;
void *rhashtable_walk_next(struct rhashtable_iter *iter);
void rhashtable_walk_stop(struct rhashtable_iter *iter) ;

void rhashtable_free_and_destroy(struct rhashtable *ht,
     void (*free_fn)(void *ptr, void *arg),
     void *arg);
void rhashtable_destroy(struct rhashtable *ht);

struct rhash_head **rht_bucket_nested(const struct bucket_table *tbl,
         unsigned int hash);
struct rhash_head **rht_bucket_nested_insert(struct rhashtable *ht,
         struct bucket_table *tbl,
         unsigned int hash);
# 411 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct rhash_head *const *rht_bucket(
 const struct bucket_table *tbl, unsigned int hash)
{
 return __builtin_expect(!!(tbl->nest), 0) ? rht_bucket_nested(tbl, hash) :
         &tbl->buckets[hash];
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct rhash_head **rht_bucket_var(
 struct bucket_table *tbl, unsigned int hash)
{
 return __builtin_expect(!!(tbl->nest), 0) ? rht_bucket_nested(tbl, hash) :
         &tbl->buckets[hash];
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct rhash_head **rht_bucket_insert(
 struct rhashtable *ht, struct bucket_table *tbl, unsigned int hash)
{
 return __builtin_expect(!!(tbl->nest), 0) ? rht_bucket_nested_insert(ht, tbl, hash) :
         &tbl->buckets[hash];
}
# 590 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rhashtable_compare(struct rhashtable_compare_arg *arg,
         const void *obj)
{
 struct rhashtable *ht = arg->ht;
 const char *ptr = obj;

 return memcmp(ptr + ht->p.key_offset, arg->key, ht->p.key_len);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct rhash_head *__rhashtable_lookup(
 struct rhashtable *ht, const void *key,
 const struct rhashtable_params params)
{
 struct rhashtable_compare_arg arg = {
  .ht = ht,
  .key = key,
 };
 struct bucket_table *tbl;
 struct rhash_head *he;
 unsigned int hash;

 tbl = ({ typeof(*(ht->tbl)) *________p1 = (typeof(*(ht->tbl)) *)({ union { typeof((ht->tbl)) __val; char __c[1]; } __u; if (1) __read_once_size(&((ht->tbl)), __u.__c, sizeof((ht->tbl))); else __read_once_size_nocheck(&((ht->tbl)), __u.__c, sizeof((ht->tbl))); do { } while (0); __u.__val; }); do { } while (0); ; ((typeof(*(ht->tbl)) *)(________p1)); });
restart:
 hash = rht_key_hashfn(ht, tbl, key, params);
 for (({__asm__ __volatile__("": : :"memory"); }), he = ({ typeof(*(*rht_bucket(tbl, hash))) *________p1 = (typeof(*(*rht_bucket(tbl, hash))) *)({ union { typeof((*rht_bucket(tbl, hash))) __val; char __c[1]; } __u; if (1) __read_once_size(&((*rht_bucket(tbl, hash))), __u.__c, sizeof((*rht_bucket(tbl, hash)))); else __read_once_size_nocheck(&((*rht_bucket(tbl, hash))), __u.__c, sizeof((*rht_bucket(tbl, hash)))); do { } while (0); __u.__val; }); do { } while (0); ; ((typeof(*(*rht_bucket(tbl, hash))) *)(________p1)); }); !rht_is_a_nulls(he); he = ({ typeof(he->next) ________p1 = ({ union { typeof(he->next) __val; char __c[1]; } __u; if (1) __read_once_size(&(he->next), __u.__c, sizeof(he->next)); else __read_once_size_nocheck(&(he->next), __u.__c, sizeof(he->next)); do { } while (0); __u.__val; }); ((typeof(*he->next) *)(________p1)); })) {
  if (params.obj_cmpfn ?
      params.obj_cmpfn(&arg, rht_obj(ht, he)) :
      rhashtable_compare(&arg, rht_obj(ht, he)))
   continue;
  return he;
 }


 asm volatile("dmb " "ishld" : : : "memory");

 tbl = ({ typeof(*(tbl->future_tbl)) *________p1 = (typeof(*(tbl->future_tbl)) *)({ union { typeof((tbl->future_tbl)) __val; char __c[1]; } __u; if (1) __read_once_size(&((tbl->future_tbl)), __u.__c, sizeof((tbl->future_tbl))); else __read_once_size_nocheck(&((tbl->future_tbl)), __u.__c, sizeof((tbl->future_tbl))); do { } while (0); __u.__val; }); do { } while (0); ; ((typeof(*(tbl->future_tbl)) *)(________p1)); });
 if (__builtin_expect(!!(tbl), 0))
  goto restart;

 return ((void *)0);
}
# 646 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *rhashtable_lookup(
 struct rhashtable *ht, const void *key,
 const struct rhashtable_params params)
{
 struct rhash_head *he = __rhashtable_lookup(ht, key, params);

 return he ? rht_obj(ht, he) : ((void *)0);
}
# 669 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *rhashtable_lookup_fast(
 struct rhashtable *ht, const void *key,
 const struct rhashtable_params params)
{
 void *obj;

 rcu_read_lock();
 obj = rhashtable_lookup(ht, key, params);
 rcu_read_unlock();

 return obj;
}
# 696 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct rhlist_head *rhltable_lookup(
 struct rhltable *hlt, const void *key,
 const struct rhashtable_params params)
{
 struct rhash_head *he = __rhashtable_lookup(&hlt->ht, key, params);

 return he ? ({ void *__mptr = (void *)(he); do { bool __cond = !(!(!__builtin_types_compatible_p(typeof(*(he)), typeof(((struct rhlist_head *)0)->rhead)) && !__builtin_types_compatible_p(typeof(*(he)), typeof(void)))); extern void __compiletime_assert_702(void) __attribute__((error("pointer type mismatch in container_of()"))); if (__cond) __compiletime_assert_702(); do { } while (0); } while (0); ((struct rhlist_head *)(__mptr - __builtin_offsetof(struct rhlist_head, rhead))); }) : ((void *)0);
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *__rhashtable_insert_fast(
 struct rhashtable *ht, const void *key, struct rhash_head *obj,
 const struct rhashtable_params params, bool rhlist)
{
 struct rhashtable_compare_arg arg = {
  .ht = ht,
  .key = key,
 };
 struct rhash_head **pprev;
 struct bucket_table *tbl;
 struct rhash_head *head;
 spinlock_t *lock;
 unsigned int hash;
 int elasticity;
 void *data;

 rcu_read_lock();

 tbl = ({ typeof(*(ht->tbl)) *________p1 = (typeof(*(ht->tbl)) *)({ union { typeof((ht->tbl)) __val; char __c[1]; } __u; if (1) __read_once_size(&((ht->tbl)), __u.__c, sizeof((ht->tbl))); else __read_once_size_nocheck(&((ht->tbl)), __u.__c, sizeof((ht->tbl))); do { } while (0); __u.__val; }); do { } while (0); ; ((typeof(*(ht->tbl)) *)(________p1)); });
 hash = rht_head_hashfn(ht, tbl, obj, params);
 lock = rht_bucket_lock(tbl, hash);
 spin_lock_bh(lock);

 if (__builtin_expect(!!(({ do { } while (0); ; ((typeof(*(tbl->future_tbl)) *)((tbl->future_tbl))); })), 0)) {
slow_path:
  spin_unlock_bh(lock);
  rcu_read_unlock();
  return rhashtable_insert_slow(ht, key, obj);
 }

 elasticity = 16u;
 pprev = rht_bucket_insert(ht, tbl, hash);
 data = ERR_PTR(-12);
 if (!pprev)
  goto out;

 for (head = ({ do { } while (0); ; ((typeof(*(*pprev)) *)((*pprev))); }); !rht_is_a_nulls(head); head = ({ do { } while (0); ; ((typeof(*((head)->next)) *)(((head)->next))); })) {
  struct rhlist_head *plist;
  struct rhlist_head *list;

  elasticity--;
  if (!key ||
      (params.obj_cmpfn ?
       params.obj_cmpfn(&arg, rht_obj(ht, head)) :
       rhashtable_compare(&arg, rht_obj(ht, head)))) {
   pprev = &head->next;
   continue;
  }

  data = rht_obj(ht, head);

  if (!rhlist)
   goto out;


  list = ({ void *__mptr = (void *)(obj); do { bool __cond = !(!(!__builtin_types_compatible_p(typeof(*(obj)), typeof(((struct rhlist_head *)0)->rhead)) && !__builtin_types_compatible_p(typeof(*(obj)), typeof(void)))); extern void __compiletime_assert_764(void) __attribute__((error("pointer type mismatch in container_of()"))); if (__cond) __compiletime_assert_764(); do { } while (0); } while (0); ((struct rhlist_head *)(__mptr - __builtin_offsetof(struct rhlist_head, rhead))); });
  plist = ({ void *__mptr = (void *)(head); do { bool __cond = !(!(!__builtin_types_compatible_p(typeof(*(head)), typeof(((struct rhlist_head *)0)->rhead)) && !__builtin_types_compatible_p(typeof(*(head)), typeof(void)))); extern void __compiletime_assert_765(void) __attribute__((error("pointer type mismatch in container_of()"))); if (__cond) __compiletime_assert_765(); do { } while (0); } while (0); ((struct rhlist_head *)(__mptr - __builtin_offsetof(struct rhlist_head, rhead))); });

  do { ; ({ union { typeof(list->next) __val; char __c[1]; } __u = { .__val = ( typeof(list->next)) ((typeof(*(plist)) *)(plist)) }; __write_once_size(&(list->next), __u.__c, sizeof(list->next)); __u.__val; }); } while (0);
  head = ({ do { } while (0); ; ((typeof(*(head->next)) *)((head->next))); });
  do { ; ({ union { typeof(list->rhead.next) __val; char __c[1]; } __u = { .__val = ( typeof(list->rhead.next)) ((typeof(*(head)) *)(head)) }; __write_once_size(&(list->rhead.next), __u.__c, sizeof(list->rhead.next)); __u.__val; }); } while (0);
  ({ uintptr_t _r_a_p__v = (uintptr_t)(obj); if (__builtin_constant_p(obj) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof((*pprev)) __val; char __c[1]; } __u = { .__val = ( typeof((*pprev))) ((typeof(*pprev))(_r_a_p__v)) }; __write_once_size(&((*pprev)), __u.__c, sizeof((*pprev))); __u.__val; }); else do { union { typeof(*&*pprev) __val; char __c[1]; } __u = { .__val = ( typeof(*&*pprev)) ((typeof(*((typeof(*pprev))_r_a_p__v)) *)((typeof(*pprev))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&*pprev) == sizeof(char) || sizeof(*&*pprev) == sizeof(short) || sizeof(*&*pprev) == sizeof(int) || sizeof(*&*pprev) == sizeof(long))); extern void __compiletime_assert_770(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_770(); do { } while (0); } while (0); switch (sizeof(*&*pprev)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&*pprev) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&*pprev) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&*pprev) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&*pprev) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });

  goto good;
 }

 if (elasticity <= 0)
  goto slow_path;

 data = ERR_PTR(-7);
 if (__builtin_expect(!!(rht_grow_above_max(ht, tbl)), 0))
  goto out;

 if (__builtin_expect(!!(rht_grow_above_100(ht, tbl)), 0))
  goto slow_path;

 head = ({ do { } while (0); ; ((typeof(*(*pprev)) *)((*pprev))); });

 do { ; ({ union { typeof(obj->next) __val; char __c[1]; } __u = { .__val = ( typeof(obj->next)) ((typeof(*(head)) *)(head)) }; __write_once_size(&(obj->next), __u.__c, sizeof(obj->next)); __u.__val; }); } while (0);
 if (rhlist) {
  struct rhlist_head *list;

  list = ({ void *__mptr = (void *)(obj); do { bool __cond = !(!(!__builtin_types_compatible_p(typeof(*(obj)), typeof(((struct rhlist_head *)0)->rhead)) && !__builtin_types_compatible_p(typeof(*(obj)), typeof(void)))); extern void __compiletime_assert_791(void) __attribute__((error("pointer type mismatch in container_of()"))); if (__cond) __compiletime_assert_791(); do { } while (0); } while (0); ((struct rhlist_head *)(__mptr - __builtin_offsetof(struct rhlist_head, rhead))); });
  do { ; ({ union { typeof(list->next) __val; char __c[1]; } __u = { .__val = ( typeof(list->next)) ((typeof(*(((void *)0))) *)(((void *)0))) }; __write_once_size(&(list->next), __u.__c, sizeof(list->next)); __u.__val; }); } while (0);
 }

 ({ uintptr_t _r_a_p__v = (uintptr_t)(obj); if (__builtin_constant_p(obj) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof((*pprev)) __val; char __c[1]; } __u = { .__val = ( typeof((*pprev))) ((typeof(*pprev))(_r_a_p__v)) }; __write_once_size(&((*pprev)), __u.__c, sizeof((*pprev))); __u.__val; }); else do { union { typeof(*&*pprev) __val; char __c[1]; } __u = { .__val = ( typeof(*&*pprev)) ((typeof(*((typeof(*pprev))_r_a_p__v)) *)((typeof(*pprev))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&*pprev) == sizeof(char) || sizeof(*&*pprev) == sizeof(short) || sizeof(*&*pprev) == sizeof(int) || sizeof(*&*pprev) == sizeof(long))); extern void __compiletime_assert_795(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_795(); do { } while (0); } while (0); switch (sizeof(*&*pprev)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&*pprev) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&*pprev) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&*pprev) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&*pprev) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });

 atomic_add(1, (&ht->nelems));
 if (rht_grow_above_75(ht, tbl))
  schedule_work(&ht->run_work);

good:
 data = ((void *)0);

out:
 spin_unlock_bh(lock);
 rcu_read_unlock();

 return data;
}
# 827 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rhashtable_insert_fast(
 struct rhashtable *ht, struct rhash_head *obj,
 const struct rhashtable_params params)
{
 void *ret;

 ret = __rhashtable_insert_fast(ht, ((void *)0), obj, params, false);
 if (IS_ERR(ret))
  return PTR_ERR(ret);

 return ret == ((void *)0) ? 0 : -17;
}
# 857 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rhltable_insert_key(
 struct rhltable *hlt, const void *key, struct rhlist_head *list,
 const struct rhashtable_params params)
{
 return PTR_ERR(__rhashtable_insert_fast(&hlt->ht, key, &list->rhead,
      params, true));
}
# 881 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rhltable_insert(
 struct rhltable *hlt, struct rhlist_head *list,
 const struct rhashtable_params params)
{
 const char *key = rht_obj(&hlt->ht, &list->rhead);

 key += params.key_offset;

 return rhltable_insert_key(hlt, key, list, params);
}
# 913 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rhashtable_lookup_insert_fast(
 struct rhashtable *ht, struct rhash_head *obj,
 const struct rhashtable_params params)
{
 const char *key = rht_obj(ht, obj);
 void *ret;

 do { if (__builtin_expect(!!(ht->p.obj_hashfn), 0)) do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 0: .long 1f - 0b; .pushsection .rodata.str,\"aMS\",@progbits,1; 2: .string \"./include/linux/rhashtable.h\"; .popsection; .long 2b - 0b; .short 920; .short 0; .popsection; 1: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0); } while (0);

 ret = __rhashtable_insert_fast(ht, key + ht->p.key_offset, obj, params,
           false);
 if (IS_ERR(ret))
  return PTR_ERR(ret);

 return ret == ((void *)0) ? 0 : -17;
}
# 940 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *rhashtable_lookup_get_insert_fast(
 struct rhashtable *ht, struct rhash_head *obj,
 const struct rhashtable_params params)
{
 const char *key = rht_obj(ht, obj);

 do { if (__builtin_expect(!!(ht->p.obj_hashfn), 0)) do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 0: .long 1f - 0b; .pushsection .rodata.str,\"aMS\",@progbits,1; 2: .string \"./include/linux/rhashtable.h\"; .popsection; .long 2b - 0b; .short 946; .short 0; .popsection; 1: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0); } while (0);

 return __rhashtable_insert_fast(ht, key + ht->p.key_offset, obj, params,
     false);
}
# 974 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rhashtable_lookup_insert_key(
 struct rhashtable *ht, const void *key, struct rhash_head *obj,
 const struct rhashtable_params params)
{
 void *ret;

 do { if (__builtin_expect(!!(!ht->p.obj_hashfn || !key), 0)) do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 0: .long 1f - 0b; .pushsection .rodata.str,\"aMS\",@progbits,1; 2: .string \"./include/linux/rhashtable.h\"; .popsection; .long 2b - 0b; .short 980; .short 0; .popsection; 1: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0); } while (0);

 ret = __rhashtable_insert_fast(ht, key, obj, params, false);
 if (IS_ERR(ret))
  return PTR_ERR(ret);

 return ret == ((void *)0) ? 0 : -17;
}
# 1000 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *rhashtable_lookup_get_insert_key(
 struct rhashtable *ht, const void *key, struct rhash_head *obj,
 const struct rhashtable_params params)
{
 do { if (__builtin_expect(!!(!ht->p.obj_hashfn || !key), 0)) do { asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 0: .long 1f - 0b; .pushsection .rodata.str,\"aMS\",@progbits,1; 2: .string \"./include/linux/rhashtable.h\"; .popsection; .long 2b - 0b; .short 1004; .short 0; .popsection; 1: brk 0x800");; do { ; asm volatile(""); __builtin_unreachable(); } while (0); } while (0); } while (0);

 return __rhashtable_insert_fast(ht, key, obj, params, false);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __rhashtable_remove_fast_one(
 struct rhashtable *ht, struct bucket_table *tbl,
 struct rhash_head *obj, const struct rhashtable_params params,
 bool rhlist)
{
 struct rhash_head **pprev;
 struct rhash_head *he;
 spinlock_t * lock;
 unsigned int hash;
 int err = -2;

 hash = rht_head_hashfn(ht, tbl, obj, params);
 lock = rht_bucket_lock(tbl, hash);

 spin_lock_bh(lock);

 pprev = rht_bucket_var(tbl, hash);
 for (he = ({ do { } while (0); ; ((typeof(*(*pprev)) *)((*pprev))); }); !rht_is_a_nulls(he); he = ({ do { } while (0); ; ((typeof(*((he)->next)) *)(((he)->next))); })) {
  struct rhlist_head *list;

  list = ({ void *__mptr = (void *)(he); do { bool __cond = !(!(!__builtin_types_compatible_p(typeof(*(he)), typeof(((struct rhlist_head *)0)->rhead)) && !__builtin_types_compatible_p(typeof(*(he)), typeof(void)))); extern void __compiletime_assert_1030(void) __attribute__((error("pointer type mismatch in container_of()"))); if (__cond) __compiletime_assert_1030(); do { } while (0); } while (0); ((struct rhlist_head *)(__mptr - __builtin_offsetof(struct rhlist_head, rhead))); });

  if (he != obj) {
   struct rhlist_head **lpprev;

   pprev = &he->next;

   if (!rhlist)
    continue;

   do {
    lpprev = &list->next;
    list = ({ do { } while (0); ; ((typeof(*(list->next)) *)((list->next))); })
                       ;
   } while (list && obj != &list->rhead);

   if (!list)
    continue;

   list = ({ do { } while (0); ; ((typeof(*(list->next)) *)((list->next))); });
   do { ; ({ union { typeof(*lpprev) __val; char __c[1]; } __u = { .__val = ( typeof(*lpprev)) ((typeof(*(list)) *)(list)) }; __write_once_size(&(*lpprev), __u.__c, sizeof(*lpprev)); __u.__val; }); } while (0);
   err = 0;
   break;
  }

  obj = ({ do { } while (0); ; ((typeof(*(obj->next)) *)((obj->next))); });
  err = 1;

  if (rhlist) {
   list = ({ do { } while (0); ; ((typeof(*(list->next)) *)((list->next))); });
   if (list) {
    do { ; ({ union { typeof(list->rhead.next) __val; char __c[1]; } __u = { .__val = ( typeof(list->rhead.next)) ((typeof(*(obj)) *)(obj)) }; __write_once_size(&(list->rhead.next), __u.__c, sizeof(list->rhead.next)); __u.__val; }); } while (0);
    obj = &list->rhead;
    err = 0;
   }
  }

  ({ uintptr_t _r_a_p__v = (uintptr_t)(obj); if (__builtin_constant_p(obj) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof((*pprev)) __val; char __c[1]; } __u = { .__val = ( typeof((*pprev))) ((typeof(*pprev))(_r_a_p__v)) }; __write_once_size(&((*pprev)), __u.__c, sizeof((*pprev))); __u.__val; }); else do { union { typeof(*&*pprev) __val; char __c[1]; } __u = { .__val = ( typeof(*&*pprev)) ((typeof(*((typeof(*pprev))_r_a_p__v)) *)((typeof(*pprev))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&*pprev) == sizeof(char) || sizeof(*&*pprev) == sizeof(short) || sizeof(*&*pprev) == sizeof(int) || sizeof(*&*pprev) == sizeof(long))); extern void __compiletime_assert_1067(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_1067(); do { } while (0); } while (0); switch (sizeof(*&*pprev)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&*pprev) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&*pprev) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&*pprev) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&*pprev) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });
  break;
 }

 spin_unlock_bh(lock);

 if (err > 0) {
  atomic_sub(1, (&ht->nelems));
  if (__builtin_expect(!!(ht->p.automatic_shrinking && rht_shrink_below_30(ht, tbl)), 0)
                                     )
   schedule_work(&ht->run_work);
  err = 0;
 }

 return err;
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __rhashtable_remove_fast(
 struct rhashtable *ht, struct rhash_head *obj,
 const struct rhashtable_params params, bool rhlist)
{
 struct bucket_table *tbl;
 int err;

 rcu_read_lock();

 tbl = ({ typeof(*(ht->tbl)) *________p1 = (typeof(*(ht->tbl)) *)({ union { typeof((ht->tbl)) __val; char __c[1]; } __u; if (1) __read_once_size(&((ht->tbl)), __u.__c, sizeof((ht->tbl))); else __read_once_size_nocheck(&((ht->tbl)), __u.__c, sizeof((ht->tbl))); do { } while (0); __u.__val; }); do { } while (0); ; ((typeof(*(ht->tbl)) *)(________p1)); });






 while ((err = __rhashtable_remove_fast_one(ht, tbl, obj, params,
         rhlist)) &&
        (tbl = ({ typeof(*(tbl->future_tbl)) *________p1 = (typeof(*(tbl->future_tbl)) *)({ union { typeof((tbl->future_tbl)) __val; char __c[1]; } __u; if (1) __read_once_size(&((tbl->future_tbl)), __u.__c, sizeof((tbl->future_tbl))); else __read_once_size_nocheck(&((tbl->future_tbl)), __u.__c, sizeof((tbl->future_tbl))); do { } while (0); __u.__val; }); do { } while (0); ; ((typeof(*(tbl->future_tbl)) *)(________p1)); })))
  ;

 rcu_read_unlock();

 return err;
}
# 1126 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rhashtable_remove_fast(
 struct rhashtable *ht, struct rhash_head *obj,
 const struct rhashtable_params params)
{
 return __rhashtable_remove_fast(ht, obj, params, false);
}
# 1148 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rhltable_remove(
 struct rhltable *hlt, struct rhlist_head *list,
 const struct rhashtable_params params)
{
 return __rhashtable_remove_fast(&hlt->ht, &list->rhead, params, true);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __rhashtable_replace_fast(
 struct rhashtable *ht, struct bucket_table *tbl,
 struct rhash_head *obj_old, struct rhash_head *obj_new,
 const struct rhashtable_params params)
{
 struct rhash_head **pprev;
 struct rhash_head *he;
 spinlock_t *lock;
 unsigned int hash;
 int err = -2;




 hash = rht_head_hashfn(ht, tbl, obj_old, params);
 if (hash != rht_head_hashfn(ht, tbl, obj_new, params))
  return -22;

 lock = rht_bucket_lock(tbl, hash);

 spin_lock_bh(lock);

 pprev = rht_bucket_var(tbl, hash);
 for (he = ({ do { } while (0); ; ((typeof(*(*pprev)) *)((*pprev))); }); !rht_is_a_nulls(he); he = ({ do { } while (0); ; ((typeof(*((he)->next)) *)(((he)->next))); })) {
  if (he != obj_old) {
   pprev = &he->next;
   continue;
  }

  ({ uintptr_t _r_a_p__v = (uintptr_t)(obj_old->next); if (__builtin_constant_p(obj_old->next) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof((obj_new->next)) __val; char __c[1]; } __u = { .__val = ( typeof((obj_new->next))) ((typeof(obj_new->next))(_r_a_p__v)) }; __write_once_size(&((obj_new->next)), __u.__c, sizeof((obj_new->next))); __u.__val; }); else do { union { typeof(*&obj_new->next) __val; char __c[1]; } __u = { .__val = ( typeof(*&obj_new->next)) ((typeof(*((typeof(obj_new->next))_r_a_p__v)) *)((typeof(obj_new->next))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&obj_new->next) == sizeof(char) || sizeof(*&obj_new->next) == sizeof(short) || sizeof(*&obj_new->next) == sizeof(int) || sizeof(*&obj_new->next) == sizeof(long))); extern void __compiletime_assert_1185(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_1185(); do { } while (0); } while (0); switch (sizeof(*&obj_new->next)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&obj_new->next) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&obj_new->next) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&obj_new->next) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&obj_new->next) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });
  ({ uintptr_t _r_a_p__v = (uintptr_t)(obj_new); if (__builtin_constant_p(obj_new) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof((*pprev)) __val; char __c[1]; } __u = { .__val = ( typeof((*pprev))) ((typeof(*pprev))(_r_a_p__v)) }; __write_once_size(&((*pprev)), __u.__c, sizeof((*pprev))); __u.__val; }); else do { union { typeof(*&*pprev) __val; char __c[1]; } __u = { .__val = ( typeof(*&*pprev)) ((typeof(*((typeof(*pprev))_r_a_p__v)) *)((typeof(*pprev))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&*pprev) == sizeof(char) || sizeof(*&*pprev) == sizeof(short) || sizeof(*&*pprev) == sizeof(int) || sizeof(*&*pprev) == sizeof(long))); extern void __compiletime_assert_1186(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_1186(); do { } while (0); } while (0); switch (sizeof(*&*pprev)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&*pprev) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&*pprev) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&*pprev) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&*pprev) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });
  err = 0;
  break;
 }

 spin_unlock_bh(lock);

 return err;
}
# 1210 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rhashtable_replace_fast(
 struct rhashtable *ht, struct rhash_head *obj_old,
 struct rhash_head *obj_new,
 const struct rhashtable_params params)
{
 struct bucket_table *tbl;
 int err;

 rcu_read_lock();

 tbl = ({ typeof(*(ht->tbl)) *________p1 = (typeof(*(ht->tbl)) *)({ union { typeof((ht->tbl)) __val; char __c[1]; } __u; if (1) __read_once_size(&((ht->tbl)), __u.__c, sizeof((ht->tbl))); else __read_once_size_nocheck(&((ht->tbl)), __u.__c, sizeof((ht->tbl))); do { } while (0); __u.__val; }); do { } while (0); ; ((typeof(*(ht->tbl)) *)(________p1)); });






 while ((err = __rhashtable_replace_fast(ht, tbl, obj_old,
      obj_new, params)) &&
        (tbl = ({ typeof(*(tbl->future_tbl)) *________p1 = (typeof(*(tbl->future_tbl)) *)({ union { typeof((tbl->future_tbl)) __val; char __c[1]; } __u; if (1) __read_once_size(&((tbl->future_tbl)), __u.__c, sizeof((tbl->future_tbl))); else __read_once_size_nocheck(&((tbl->future_tbl)), __u.__c, sizeof((tbl->future_tbl))); do { } while (0); __u.__val; }); do { } while (0); ; ((typeof(*(tbl->future_tbl)) *)(________p1)); })))
  ;

 rcu_read_unlock();

 return err;
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rhashtable_walk_init(struct rhashtable *ht,
           struct rhashtable_iter *iter, gfp_t gfp)
{
 rhashtable_walk_enter(ht, iter);
 return 0;
}
# 1265 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rhltable_walk_enter(struct rhltable *hlt,
           struct rhashtable_iter *iter)
{
 return rhashtable_walk_enter(&hlt->ht, iter);
}
# 1279 "./include/linux/rhashtable.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rhltable_free_and_destroy(struct rhltable *hlt,
          void (*free_fn)(void *ptr,
            void *arg),
          void *arg)
{
 return rhashtable_free_and_destroy(&hlt->ht, free_fn, arg);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rhltable_destroy(struct rhltable *hlt)
{
 return rhltable_free_and_destroy(hlt, ((void *)0), ((void *)0));
}
# 8 "./include/linux/ipc.h" 2
# 1 "./include/uapi/linux/ipc.h" 1
# 10 "./include/uapi/linux/ipc.h"
struct ipc_perm
{
 __kernel_key_t key;
 __kernel_uid_t uid;
 __kernel_gid_t gid;
 __kernel_uid_t cuid;
 __kernel_gid_t cgid;
 __kernel_mode_t mode;
 unsigned short seq;
};


# 1 "./arch/arm64/include/generated/uapi/asm/ipcbuf.h" 1
# 1 "./include/uapi/asm-generic/ipcbuf.h" 1
# 20 "./include/uapi/asm-generic/ipcbuf.h"
struct ipc64_perm {
 __kernel_key_t key;
 __kernel_uid32_t uid;
 __kernel_gid32_t gid;
 __kernel_uid32_t cuid;
 __kernel_gid32_t cgid;
 __kernel_mode_t mode;

 unsigned char __pad1[4 - sizeof(__kernel_mode_t)];
 unsigned short seq;
 unsigned short __pad2;
 __kernel_ulong_t __unused1;
 __kernel_ulong_t __unused2;
};
# 1 "./arch/arm64/include/generated/uapi/asm/ipcbuf.h" 2
# 23 "./include/uapi/linux/ipc.h" 2
# 58 "./include/uapi/linux/ipc.h"
struct ipc_kludge {
 struct msgbuf *msgp;
 long msgtyp;
};
# 9 "./include/linux/ipc.h" 2
# 1 "./include/linux/refcount.h" 1
# 18 "./include/linux/refcount.h"
typedef struct refcount_struct {
 atomic_t refs;
} refcount_t;
# 29 "./include/linux/refcount.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void refcount_set(refcount_t *r, unsigned int n)
{
 ({ union { typeof(((&r->refs)->counter)) __val; char __c[1]; } __u = { .__val = ( typeof(((&r->refs)->counter))) ((n)) }; __write_once_size(&(((&r->refs)->counter)), __u.__c, sizeof(((&r->refs)->counter))); __u.__val; });
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int refcount_read(const refcount_t *r)
{
 return ({ union { typeof((&r->refs)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&((&r->refs)->counter), __u.__c, sizeof((&r->refs)->counter)); else __read_once_size_nocheck(&((&r->refs)->counter), __u.__c, sizeof((&r->refs)->counter)); do { } while (0); __u.__val; });
}
# 60 "./include/linux/refcount.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) bool refcount_add_not_zero(unsigned int i, refcount_t *r)
{
 return atomic_add_unless(&r->refs, i, 0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void refcount_add(unsigned int i, refcount_t *r)
{
 atomic_add(i, &r->refs);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) bool refcount_inc_not_zero(refcount_t *r)
{
 return atomic_add_unless(&r->refs, 1, 0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void refcount_inc(refcount_t *r)
{
 atomic_add(1, (&r->refs));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) bool refcount_sub_and_test(unsigned int i, refcount_t *r)
{
 return (atomic_sub_return((i), (&r->refs)) == 0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((warn_unused_result)) bool refcount_dec_and_test(refcount_t *r)
{
 return (atomic_sub_return(1, (&r->refs)) == 0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void refcount_dec(refcount_t *r)
{
 atomic_sub(1, (&r->refs));
}



extern __attribute__((warn_unused_result)) bool refcount_dec_if_one(refcount_t *r);
extern __attribute__((warn_unused_result)) bool refcount_dec_not_one(refcount_t *r);
extern __attribute__((warn_unused_result)) bool refcount_dec_and_mutex_lock(refcount_t *r, struct mutex *lock);
extern __attribute__((warn_unused_result)) bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock);
# 10 "./include/linux/ipc.h" 2




struct kern_ipc_perm {
 spinlock_t lock;
 bool deleted;
 int id;
 key_t key;
 kuid_t uid;
 kgid_t gid;
 kuid_t cuid;
 kgid_t cgid;
 umode_t mode;
 unsigned long seq;
 void *security;

 struct rhash_head khtnode;

 struct callback_head rcu;
 refcount_t refcount;
} __attribute__((__aligned__((1 << 7)))) __attribute__((designated_init));
# 6 "./include/uapi/linux/sem.h" 2
# 24 "./include/uapi/linux/sem.h"
struct semid_ds {
 struct ipc_perm sem_perm;
 __kernel_time_t sem_otime;
 __kernel_time_t sem_ctime;
 struct sem *sem_base;
 struct sem_queue *sem_pending;
 struct sem_queue **sem_pending_last;
 struct sem_undo *undo;
 unsigned short sem_nsems;
};


# 1 "./arch/arm64/include/generated/uapi/asm/sembuf.h" 1
# 1 "./include/uapi/asm-generic/sembuf.h" 1
# 24 "./include/uapi/asm-generic/sembuf.h"
struct semid64_ds {
 struct ipc64_perm sem_perm;
 __kernel_time_t sem_otime;



 __kernel_time_t sem_ctime;



 unsigned long sem_nsems;
 unsigned long __unused3;
 unsigned long __unused4;
};
# 1 "./arch/arm64/include/generated/uapi/asm/sembuf.h" 2
# 37 "./include/uapi/linux/sem.h" 2


struct sembuf {
 unsigned short sem_num;
 short sem_op;
 short sem_flg;
};


union semun {
 int val;
 struct semid_ds *buf;
 unsigned short *array;
 struct seminfo *__buf;
 void *__pad;
};

struct seminfo {
 int semmap;
 int semmni;
 int semmns;
 int semmnu;
 int semmsl;
 int semopm;
 int semume;
 int semusz;
 int semvmx;
 int semaem;
};
# 10 "./include/linux/sem.h" 2

struct task_struct;


struct sem {
 int semval;







 int sempid;
 spinlock_t lock;
 struct list_head pending_alter;

 struct list_head pending_const;

 time_t sem_otime;
} __attribute__((__aligned__((1 << 7))));


struct sem_array {
 struct kern_ipc_perm sem_perm;
 time64_t sem_ctime;
 struct list_head pending_alter;

 struct list_head pending_const;

 struct list_head list_id;
 int sem_nsems;
 int complex_count;
 unsigned int use_global_lock;

 struct sem sems[];
} __attribute__((designated_init));



struct sysv_sem {
 struct sem_undo_list *undo_list;
};

extern int copy_semundo(unsigned long clone_flags, struct task_struct *tsk);
extern void exit_sem(struct task_struct *tsk);
# 16 "./include/linux/sched.h" 2
# 1 "./include/linux/shm.h" 1





# 1 "./arch/arm64/include/asm/page.h" 1
# 26 "./arch/arm64/include/asm/page.h"
# 1 "./include/linux/personality.h" 1




# 1 "./include/uapi/linux/personality.h" 1
# 11 "./include/uapi/linux/personality.h"
enum {
 UNAME26 = 0x0020000,
 ADDR_NO_RANDOMIZE = 0x0040000,
 FDPIC_FUNCPTRS = 0x0080000,


 MMAP_PAGE_ZERO = 0x0100000,
 ADDR_COMPAT_LAYOUT = 0x0200000,
 READ_IMPLIES_EXEC = 0x0400000,
 ADDR_LIMIT_32BIT = 0x0800000,
 SHORT_INODE = 0x1000000,
 WHOLE_SECONDS = 0x2000000,
 STICKY_TIMEOUTS = 0x4000000,
 ADDR_LIMIT_3GB = 0x8000000,
};
# 42 "./include/uapi/linux/personality.h"
enum {
 PER_LINUX = 0x0000,
 PER_LINUX_32BIT = 0x0000 | ADDR_LIMIT_32BIT,
 PER_LINUX_FDPIC = 0x0000 | FDPIC_FUNCPTRS,
 PER_SVR4 = 0x0001 | STICKY_TIMEOUTS | MMAP_PAGE_ZERO,
 PER_SVR3 = 0x0002 | STICKY_TIMEOUTS | SHORT_INODE,
 PER_SCOSVR3 = 0x0003 | STICKY_TIMEOUTS |
      WHOLE_SECONDS | SHORT_INODE,
 PER_OSR5 = 0x0003 | STICKY_TIMEOUTS | WHOLE_SECONDS,
 PER_WYSEV386 = 0x0004 | STICKY_TIMEOUTS | SHORT_INODE,
 PER_ISCR4 = 0x0005 | STICKY_TIMEOUTS,
 PER_BSD = 0x0006,
 PER_SUNOS = 0x0006 | STICKY_TIMEOUTS,
 PER_XENIX = 0x0007 | STICKY_TIMEOUTS | SHORT_INODE,
 PER_LINUX32 = 0x0008,
 PER_LINUX32_3GB = 0x0008 | ADDR_LIMIT_3GB,
 PER_IRIX32 = 0x0009 | STICKY_TIMEOUTS,
 PER_IRIXN32 = 0x000a | STICKY_TIMEOUTS,
 PER_IRIX64 = 0x000b | STICKY_TIMEOUTS,
 PER_RISCOS = 0x000c,
 PER_SOLARIS = 0x000d | STICKY_TIMEOUTS,
 PER_UW7 = 0x000e | STICKY_TIMEOUTS | MMAP_PAGE_ZERO,
 PER_OSF4 = 0x000f,
 PER_HPUX = 0x0010,
 PER_MASK = 0x00ff,
};
# 6 "./include/linux/personality.h" 2
# 27 "./arch/arm64/include/asm/page.h" 2
# 1 "./arch/arm64/include/asm/pgtable-types.h" 1
# 23 "./arch/arm64/include/asm/pgtable-types.h"
# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
# 24 "./arch/arm64/include/asm/pgtable-types.h" 2

typedef u64 pteval_t;
typedef u64 pmdval_t;
typedef u64 pudval_t;
typedef u64 pgdval_t;




typedef struct { pteval_t pte; } pte_t;




typedef struct { pmdval_t pmd; } pmd_t;





typedef struct { pudval_t pud; } pud_t;




typedef struct { pgdval_t pgd; } pgd_t;



typedef struct { pteval_t pgprot; } pgprot_t;
# 64 "./arch/arm64/include/asm/pgtable-types.h"
# 1 "./include/asm-generic/5level-fixup.h" 1
# 65 "./arch/arm64/include/asm/pgtable-types.h" 2
# 28 "./arch/arm64/include/asm/page.h" 2

extern void __cpu_clear_user_page(void *p, unsigned long user);
extern void __cpu_copy_user_page(void *to, const void *from,
     unsigned long user);
extern void copy_page(void *to, const void *from);
extern void clear_page(void *to);




typedef struct page *pgtable_t;


extern int pfn_valid(unsigned long);
# 52 "./arch/arm64/include/asm/page.h"
# 1 "./include/asm-generic/getorder.h" 1
# 13 "./include/asm-generic/getorder.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((__const__))
int __get_order(unsigned long size)
{
 int order;

 size--;
 size >>= 12;



 order = fls64(size);

 return order;
}
# 53 "./arch/arm64/include/asm/page.h" 2
# 7 "./include/linux/shm.h" 2
# 1 "./include/uapi/linux/shm.h" 1






# 1 "./include/uapi/asm-generic/hugetlb_encode.h" 1
# 8 "./include/uapi/linux/shm.h" 2
# 28 "./include/uapi/linux/shm.h"
struct shmid_ds {
 struct ipc_perm shm_perm;
 int shm_segsz;
 __kernel_time_t shm_atime;
 __kernel_time_t shm_dtime;
 __kernel_time_t shm_ctime;
 __kernel_ipc_pid_t shm_cpid;
 __kernel_ipc_pid_t shm_lpid;
 unsigned short shm_nattch;
 unsigned short shm_unused;
 void *shm_unused2;
 void *shm_unused3;
};


# 1 "./arch/arm64/include/generated/uapi/asm/shmbuf.h" 1
# 1 "./include/uapi/asm-generic/shmbuf.h" 1
# 26 "./include/uapi/asm-generic/shmbuf.h"
struct shmid64_ds {
 struct ipc64_perm shm_perm;
 size_t shm_segsz;
 __kernel_time_t shm_atime;



 __kernel_time_t shm_dtime;



 __kernel_time_t shm_ctime;



 __kernel_pid_t shm_cpid;
 __kernel_pid_t shm_lpid;
 __kernel_ulong_t shm_nattch;
 __kernel_ulong_t __unused4;
 __kernel_ulong_t __unused5;
};

struct shminfo64 {
 __kernel_ulong_t shmmax;
 __kernel_ulong_t shmmin;
 __kernel_ulong_t shmmni;
 __kernel_ulong_t shmseg;
 __kernel_ulong_t shmall;
 __kernel_ulong_t __unused1;
 __kernel_ulong_t __unused2;
 __kernel_ulong_t __unused3;
 __kernel_ulong_t __unused4;
};
# 1 "./arch/arm64/include/generated/uapi/asm/shmbuf.h" 2
# 44 "./include/uapi/linux/shm.h" 2
# 90 "./include/uapi/linux/shm.h"
struct shminfo {
 int shmmax;
 int shmmin;
 int shmmni;
 int shmseg;
 int shmall;
};

struct shm_info {
 int used_ids;
 __kernel_ulong_t shm_tot;
 __kernel_ulong_t shm_rss;
 __kernel_ulong_t shm_swp;
 __kernel_ulong_t swap_attempts;
 __kernel_ulong_t swap_successes;
};
# 8 "./include/linux/shm.h" 2
# 1 "./arch/arm64/include/asm/shmparam.h" 1
# 26 "./arch/arm64/include/asm/shmparam.h"
# 1 "./include/uapi/asm-generic/shmparam.h" 1
# 27 "./arch/arm64/include/asm/shmparam.h" 2
# 9 "./include/linux/shm.h" 2

struct shmid_kernel
{
 struct kern_ipc_perm shm_perm;
 struct file *shm_file;
 unsigned long shm_nattch;
 unsigned long shm_segsz;
 time64_t shm_atim;
 time64_t shm_dtim;
 time64_t shm_ctim;
 pid_t shm_cprid;
 pid_t shm_lprid;
 struct user_struct *mlock_user;


 struct task_struct *shm_creator;
 struct list_head shm_clist;
} __attribute__((designated_init));






struct sysv_shm {
 struct list_head shm_clist;
};

long do_shmat(int shmid, char *shmaddr, int shmflg, unsigned long *addr,
       unsigned long shmlba);
bool is_file_shm_hugepages(struct file *file);
void exit_shm(struct task_struct *task);
# 17 "./include/linux/sched.h" 2
# 1 "./include/linux/kcov.h" 1




# 1 "./include/uapi/linux/kcov.h" 1
# 6 "./include/linux/kcov.h" 2

struct task_struct;
# 26 "./include/linux/kcov.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void kcov_task_init(struct task_struct *t) {}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void kcov_task_exit(struct task_struct *t) {}
# 18 "./include/linux/sched.h" 2

# 1 "./include/linux/plist.h" 1
# 81 "./include/linux/plist.h"
struct plist_head {
 struct list_head node_list;
};

struct plist_node {
 int prio;
 struct list_head prio_list;
 struct list_head node_list;
};
# 123 "./include/linux/plist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
plist_head_init(struct plist_head *head)
{
 INIT_LIST_HEAD(&head->node_list);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void plist_node_init(struct plist_node *node, int prio)
{
 node->prio = prio;
 INIT_LIST_HEAD(&node->prio_list);
 INIT_LIST_HEAD(&node->node_list);
}

extern void plist_add(struct plist_node *node, struct plist_head *head);
extern void plist_del(struct plist_node *node, struct plist_head *head);

extern void plist_requeue(struct plist_node *node, struct plist_head *head);
# 212 "./include/linux/plist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int plist_head_empty(const struct plist_head *head)
{
 return list_empty(&head->node_list);
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int plist_node_empty(const struct plist_node *node)
{
 return list_empty(&node->node_list);
}
# 282 "./include/linux/plist.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct plist_node *plist_first(const struct plist_head *head)
{
 return ({ void *__mptr = (void *)(head->node_list.next); do { bool __cond = !(!(!__builtin_types_compatible_p(typeof(*(head->node_list.next)), typeof(((struct plist_node *)0)->node_list)) && !__builtin_types_compatible_p(typeof(*(head->node_list.next)), typeof(void)))); extern void __compiletime_assert_285(void) __attribute__((error("pointer type mismatch in container_of()"))); if (__cond) __compiletime_assert_285(); do { } while (0); } while (0); ((struct plist_node *)(__mptr - __builtin_offsetof(struct plist_node, node_list))); })
                                  ;
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct plist_node *plist_last(const struct plist_head *head)
{
 return ({ void *__mptr = (void *)(head->node_list.prev); do { bool __cond = !(!(!__builtin_types_compatible_p(typeof(*(head->node_list.prev)), typeof(((struct plist_node *)0)->node_list)) && !__builtin_types_compatible_p(typeof(*(head->node_list.prev)), typeof(void)))); extern void __compiletime_assert_297(void) __attribute__((error("pointer type mismatch in container_of()"))); if (__cond) __compiletime_assert_297(); do { } while (0); } while (0); ((struct plist_node *)(__mptr - __builtin_offsetof(struct plist_node, node_list))); })
                                  ;
}
# 20 "./include/linux/sched.h" 2
# 1 "./include/linux/hrtimer.h" 1
# 18 "./include/linux/hrtimer.h"
# 1 "./include/linux/rbtree.h" 1
# 36 "./include/linux/rbtree.h"
struct rb_node {
 unsigned long __rb_parent_color;
 struct rb_node *rb_right;
 struct rb_node *rb_left;
} __attribute__((aligned(sizeof(long))));


struct rb_root {
 struct rb_node *rb_node;
};
# 57 "./include/linux/rbtree.h"
struct rb_root_cached {
 struct rb_root rb_root;
 struct rb_node *rb_leftmost;
};
# 77 "./include/linux/rbtree.h"
extern void rb_insert_color(struct rb_node *, struct rb_root *);
extern void rb_erase(struct rb_node *, struct rb_root *);



extern struct rb_node *rb_next(const struct rb_node *);
extern struct rb_node *rb_prev(const struct rb_node *);
extern struct rb_node *rb_first(const struct rb_root *);
extern struct rb_node *rb_last(const struct rb_root *);

extern void rb_insert_color_cached(struct rb_node *,
       struct rb_root_cached *, bool);
extern void rb_erase_cached(struct rb_node *node, struct rb_root_cached *);




extern struct rb_node *rb_first_postorder(const struct rb_root *);
extern struct rb_node *rb_next_postorder(const struct rb_node *);


extern void rb_replace_node(struct rb_node *victim, struct rb_node *new,
       struct rb_root *root);
extern void rb_replace_node_rcu(struct rb_node *victim, struct rb_node *new,
    struct rb_root *root);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rb_link_node(struct rb_node *node, struct rb_node *parent,
    struct rb_node **rb_link)
{
 node->__rb_parent_color = (unsigned long)parent;
 node->rb_left = node->rb_right = ((void *)0);

 *rb_link = node;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void rb_link_node_rcu(struct rb_node *node, struct rb_node *parent,
        struct rb_node **rb_link)
{
 node->__rb_parent_color = (unsigned long)parent;
 node->rb_left = node->rb_right = ((void *)0);

 ({ uintptr_t _r_a_p__v = (uintptr_t)(node); if (__builtin_constant_p(node) && (_r_a_p__v) == (uintptr_t)((void *)0)) ({ union { typeof((*rb_link)) __val; char __c[1]; } __u = { .__val = ( typeof((*rb_link))) ((typeof(*rb_link))(_r_a_p__v)) }; __write_once_size(&((*rb_link)), __u.__c, sizeof((*rb_link))); __u.__val; }); else do { union { typeof(*&*rb_link) __val; char __c[1]; } __u = { .__val = ( typeof(*&*rb_link)) ((typeof(*((typeof(*rb_link))_r_a_p__v)) *)((typeof(*rb_link))_r_a_p__v)) }; do { bool __cond = !((sizeof(*&*rb_link) == sizeof(char) || sizeof(*&*rb_link) == sizeof(short) || sizeof(*&*rb_link) == sizeof(int) || sizeof(*&*rb_link) == sizeof(long))); extern void __compiletime_assert_118(void) __attribute__((error("Need native word sized stores/loads for atomicity."))); if (__cond) __compiletime_assert_118(); do { } while (0); } while (0); switch (sizeof(*&*rb_link)) { case 1: asm volatile ("stlrb %w1, %0" : "=Q" (*&*rb_link) : "r" (*(__u8 *)__u.__c) : "memory"); break; case 2: asm volatile ("stlrh %w1, %0" : "=Q" (*&*rb_link) : "r" (*(__u16 *)__u.__c) : "memory"); break; case 4: asm volatile ("stlr %w1, %0" : "=Q" (*&*rb_link) : "r" (*(__u32 *)__u.__c) : "memory"); break; case 8: asm volatile ("stlr %1, %0" : "=Q" (*&*rb_link) : "r" (*(__u64 *)__u.__c) : "memory"); break; } } while (0); _r_a_p__v; });
}
# 19 "./include/linux/hrtimer.h" 2



# 1 "./include/linux/percpu.h" 1
# 71 "./include/linux/percpu.h"
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

extern struct pcpu_alloc_info * __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) pcpu_alloc_alloc_info(int nr_groups,
            int nr_units);
extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) pcpu_free_alloc_info(struct pcpu_alloc_info *ai);

extern int __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
      void *base_addr);


extern int __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
    size_t atom_size,
    pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
    pcpu_fc_alloc_fn_t alloc_fn,
    pcpu_fc_free_fn_t free_fn);
# 132 "./include/linux/percpu.h"
extern void *__alloc_reserved_percpu(size_t size, size_t align);
extern bool __is_kernel_percpu_address(unsigned long addr, unsigned long *can_addr);
extern bool is_kernel_percpu_address(unsigned long addr);





extern void *__alloc_percpu_gfp(size_t size, size_t align, gfp_t gfp);
extern void *__alloc_percpu(size_t size, size_t align);
extern void free_percpu(void *__pdata);
extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
# 23 "./include/linux/hrtimer.h" 2

# 1 "./include/linux/timerqueue.h" 1
# 9 "./include/linux/timerqueue.h"
struct timerqueue_node {
 struct rb_node node;
 ktime_t expires;
};

struct timerqueue_head {
 struct rb_root head;
 struct timerqueue_node *next;
};


extern bool timerqueue_add(struct timerqueue_head *head,
      struct timerqueue_node *node);
extern bool timerqueue_del(struct timerqueue_head *head,
      struct timerqueue_node *node);
extern struct timerqueue_node *timerqueue_iterate_next(
      struct timerqueue_node *node);
# 35 "./include/linux/timerqueue.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function))
struct timerqueue_node *timerqueue_getnext(struct timerqueue_head *head)
{
 return head->next;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void timerqueue_init(struct timerqueue_node *node)
{
 ((&node->node)->__rb_parent_color = (unsigned long)(&node->node));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void timerqueue_init_head(struct timerqueue_head *head)
{
 head->head = (struct rb_root) { ((void *)0), };
 head->next = ((void *)0);
}
# 25 "./include/linux/hrtimer.h" 2

struct hrtimer_clock_base;
struct hrtimer_cpu_base;




enum hrtimer_mode {
 HRTIMER_MODE_ABS = 0x0,
 HRTIMER_MODE_REL = 0x1,
 HRTIMER_MODE_PINNED = 0x02,
 HRTIMER_MODE_ABS_PINNED = 0x02,
 HRTIMER_MODE_REL_PINNED = 0x03,
};




enum hrtimer_restart {
 HRTIMER_NORESTART,
 HRTIMER_RESTART,
};
# 93 "./include/linux/hrtimer.h"
struct hrtimer {
 struct timerqueue_node node;
 ktime_t _softexpires;
 enum hrtimer_restart (*function)(struct hrtimer *);
 struct hrtimer_clock_base *base;
 u8 state;
 u8 is_rel;
};
# 109 "./include/linux/hrtimer.h"
struct hrtimer_sleeper {
 struct hrtimer timer;
 struct task_struct *task;
};
# 130 "./include/linux/hrtimer.h"
struct hrtimer_clock_base {
 struct hrtimer_cpu_base *cpu_base;
 int index;
 clockid_t clockid;
 struct timerqueue_head active;
 ktime_t (*get_time)(void);
 ktime_t offset;
} __attribute__((__aligned__(64)));

enum hrtimer_base_type {
 HRTIMER_BASE_MONOTONIC,
 HRTIMER_BASE_REALTIME,
 HRTIMER_BASE_BOOTTIME,
 HRTIMER_BASE_TAI,
 HRTIMER_MAX_CLOCK_BASES,
};
# 174 "./include/linux/hrtimer.h"
struct hrtimer_cpu_base {
 raw_spinlock_t lock;
 seqcount_t seq;
 struct hrtimer *running;
 unsigned int cpu;
 unsigned int active_bases;
 unsigned int clock_was_set_seq;
 bool migration_enabled;
 bool nohz_active;

 unsigned int in_hrtirq : 1,
     hres_active : 1,
     hang_detected : 1;
 ktime_t expires_next;
 struct hrtimer *next_timer;
 unsigned int nr_events;
 unsigned int nr_retries;
 unsigned int nr_hangs;
 unsigned int max_hang_time;

 struct hrtimer_clock_base clock_base[HRTIMER_MAX_CLOCK_BASES];
} __attribute__((__aligned__((1 << 7))));

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hrtimer_set_expires(struct hrtimer *timer, ktime_t time)
{
 do { bool __cond = !(!(sizeof(struct hrtimer_clock_base) > 64)); extern void __compiletime_assert_199(void) __attribute__((error("BUILD_BUG_ON failed: " "sizeof(struct hrtimer_clock_base) > HRTIMER_CLOCK_BASE_ALIGN"))); if (__cond) __compiletime_assert_199(); do { } while (0); } while (0);

 timer->node.expires = time;
 timer->_softexpires = time;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hrtimer_set_expires_range(struct hrtimer *timer, ktime_t time, ktime_t delta)
{
 timer->_softexpires = time;
 timer->node.expires = ktime_add_safe(time, delta);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hrtimer_set_expires_range_ns(struct hrtimer *timer, ktime_t time, u64 delta)
{
 timer->_softexpires = time;
 timer->node.expires = ktime_add_safe(time, ns_to_ktime(delta));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hrtimer_set_expires_tv64(struct hrtimer *timer, s64 tv64)
{
 timer->node.expires = tv64;
 timer->_softexpires = tv64;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hrtimer_add_expires(struct hrtimer *timer, ktime_t time)
{
 timer->node.expires = ktime_add_safe(timer->node.expires, time);
 timer->_softexpires = ktime_add_safe(timer->_softexpires, time);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hrtimer_add_expires_ns(struct hrtimer *timer, u64 ns)
{
 timer->node.expires = ((timer->node.expires) + (ns));
 timer->_softexpires = ((timer->_softexpires) + (ns));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t hrtimer_get_expires(const struct hrtimer *timer)
{
 return timer->node.expires;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t hrtimer_get_softexpires(const struct hrtimer *timer)
{
 return timer->_softexpires;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 hrtimer_get_expires_tv64(const struct hrtimer *timer)
{
 return timer->node.expires;
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 hrtimer_get_softexpires_tv64(const struct hrtimer *timer)
{
 return timer->_softexpires;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) s64 hrtimer_get_expires_ns(const struct hrtimer *timer)
{
 return (timer->node.expires);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t hrtimer_expires_remaining(const struct hrtimer *timer)
{
 return ((timer->node.expires) - (timer->base->get_time()));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t hrtimer_cb_get_time(struct hrtimer *timer)
{
 return timer->base->get_time();
}


struct clock_event_device;

extern void hrtimer_interrupt(struct clock_event_device *dev);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int hrtimer_is_hres_active(struct hrtimer *timer)
{
 return timer->base->cpu_base->hres_active;
}
# 290 "./include/linux/hrtimer.h"
extern void clock_was_set_delayed(void);

extern unsigned int hrtimer_resolution;
# 310 "./include/linux/hrtimer.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t
__hrtimer_expires_remaining_adjusted(const struct hrtimer *timer, ktime_t now)
{
 ktime_t rem = ((timer->node.expires) - (now));





 if (0 && timer->is_rel)
  rem -= hrtimer_resolution;
 return rem;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t
hrtimer_expires_remaining_adjusted(const struct hrtimer *timer)
{
 return __hrtimer_expires_remaining_adjusted(timer,
          timer->base->get_time());
}

extern void clock_was_set(void);

extern void timerfd_clock_was_set(void);



extern void hrtimers_resume(void);

extern __attribute__((section(".data..percpu" ""))) __typeof__(struct tick_device) tick_cpu_device;





extern void hrtimer_init(struct hrtimer *timer, clockid_t which_clock,
    enum hrtimer_mode mode);







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hrtimer_init_on_stack(struct hrtimer *timer,
      clockid_t which_clock,
      enum hrtimer_mode mode)
{
 hrtimer_init(timer, which_clock, mode);
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void destroy_hrtimer_on_stack(struct hrtimer *timer) { }



extern void hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
       u64 range_ns, const enum hrtimer_mode mode);
# 374 "./include/linux/hrtimer.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hrtimer_start(struct hrtimer *timer, ktime_t tim,
     const enum hrtimer_mode mode)
{
 hrtimer_start_range_ns(timer, tim, 0, mode);
}

extern int hrtimer_cancel(struct hrtimer *timer);
extern int hrtimer_try_to_cancel(struct hrtimer *timer);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hrtimer_start_expires(struct hrtimer *timer,
      enum hrtimer_mode mode)
{
 u64 delta;
 ktime_t soft, hard;
 soft = hrtimer_get_softexpires(timer);
 hard = hrtimer_get_expires(timer);
 delta = (((hard) - (soft)));
 hrtimer_start_range_ns(timer, soft, delta, mode);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void hrtimer_restart(struct hrtimer *timer)
{
 hrtimer_start_expires(timer, HRTIMER_MODE_ABS);
}


extern ktime_t __hrtimer_get_remaining(const struct hrtimer *timer, bool adjust);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) ktime_t hrtimer_get_remaining(const struct hrtimer *timer)
{
 return __hrtimer_get_remaining(timer, false);
}

extern u64 hrtimer_get_next_event(void);

extern bool hrtimer_active(const struct hrtimer *timer);




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int hrtimer_is_queued(struct hrtimer *timer)
{
 return timer->state & 0x01;
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int hrtimer_callback_running(struct hrtimer *timer)
{
 return timer->base->cpu_base->running == timer;
}


extern u64
hrtimer_forward(struct hrtimer *timer, ktime_t now, ktime_t interval);
# 448 "./include/linux/hrtimer.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) u64 hrtimer_forward_now(struct hrtimer *timer,
          ktime_t interval)
{
 return hrtimer_forward(timer, timer->base->get_time(), interval);
}



extern int nanosleep_copyout(struct restart_block *, struct timespec *);
extern long hrtimer_nanosleep(const struct timespec *rqtp,
         const enum hrtimer_mode mode,
         const clockid_t clockid);

extern void hrtimer_init_sleeper(struct hrtimer_sleeper *sl,
     struct task_struct *tsk);

extern int schedule_hrtimeout_range(ktime_t *expires, u64 delta,
      const enum hrtimer_mode mode);
extern int schedule_hrtimeout_range_clock(ktime_t *expires,
       u64 delta,
       const enum hrtimer_mode mode,
       int clock);
extern int schedule_hrtimeout(ktime_t *expires, const enum hrtimer_mode mode);


extern void hrtimer_run_queues(void);


extern void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) hrtimers_init(void);


extern void sysrq_timer_list_show(void);

int hrtimers_prepare_cpu(unsigned int cpu);

int hrtimers_dead_cpu(unsigned int cpu);
# 21 "./include/linux/sched.h" 2
# 1 "./include/linux/seccomp.h" 1




# 1 "./include/uapi/linux/seccomp.h" 1
# 56 "./include/uapi/linux/seccomp.h"
struct seccomp_data {
 int nr;
 __u32 arch;
 __u64 instruction_pointer;
 __u64 args[6];
};
# 6 "./include/linux/seccomp.h" 2
# 14 "./include/linux/seccomp.h"
# 1 "./arch/arm64/include/asm/seccomp.h" 1
# 14 "./arch/arm64/include/asm/seccomp.h"
# 1 "./arch/arm64/include/asm/unistd.h" 1
# 52 "./arch/arm64/include/asm/unistd.h"
# 1 "./arch/arm64/include/uapi/asm/unistd.h" 1
# 20 "./arch/arm64/include/uapi/asm/unistd.h"
# 1 "./include/asm-generic/unistd.h" 1

# 1 "./include/uapi/asm-generic/unistd.h" 1
# 34 "./include/uapi/asm-generic/unistd.h"



















































































































































































































































































































































































































































































































































































































































# 669 "./include/uapi/asm-generic/unistd.h"


































































# 3 "./include/asm-generic/unistd.h" 2
# 20 "./arch/arm64/include/uapi/asm/unistd.h" 2
# 53 "./arch/arm64/include/asm/unistd.h" 2
# 15 "./arch/arm64/include/asm/seccomp.h" 2
# 23 "./arch/arm64/include/asm/seccomp.h"
# 1 "./include/asm-generic/seccomp.h" 1
# 14 "./include/asm-generic/seccomp.h"
# 1 "./include/uapi/linux/unistd.h" 1







# 1 "./arch/arm64/include/asm/unistd.h" 1
# 52 "./arch/arm64/include/asm/unistd.h"
# 1 "./arch/arm64/include/uapi/asm/unistd.h" 1
# 20 "./arch/arm64/include/uapi/asm/unistd.h"
# 1 "./include/asm-generic/unistd.h" 1

# 1 "./include/uapi/asm-generic/unistd.h" 1
# 34 "./include/uapi/asm-generic/unistd.h"



















































































































































































































































































































































































































































































































































































































































# 669 "./include/uapi/asm-generic/unistd.h"


































































# 3 "./include/asm-generic/unistd.h" 2
# 20 "./arch/arm64/include/uapi/asm/unistd.h" 2
# 53 "./arch/arm64/include/asm/unistd.h" 2
# 9 "./include/uapi/linux/unistd.h" 2
# 15 "./include/asm-generic/seccomp.h" 2
# 34 "./include/asm-generic/seccomp.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) const int *get_compat_mode1_syscalls(void)
{
 static const int mode1_syscalls_32[] = {
  3, 4,
  1, 173,
  0,
 };
 return mode1_syscalls_32;
}
# 24 "./arch/arm64/include/asm/seccomp.h" 2
# 15 "./include/linux/seccomp.h" 2

struct seccomp_filter;
# 28 "./include/linux/seccomp.h"
struct seccomp {
 int mode;
 struct seccomp_filter *filter;
};


extern int __secure_computing(const struct seccomp_data *sd);
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int secure_computing(const struct seccomp_data *sd)
{
 if (__builtin_expect(!!(test_ti_thread_flag(((struct thread_info *)get_current()), 11)), 0))
  return __secure_computing(sd);
 return 0;
}




extern long prctl_get_seccomp(void);
extern long prctl_set_seccomp(unsigned long, char *);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int seccomp_mode(struct seccomp *s)
{
 return s->mode;
}
# 83 "./include/linux/seccomp.h"
extern void put_seccomp_filter(struct task_struct *tsk);
extern void get_seccomp_filter(struct task_struct *tsk);
# 100 "./include/linux/seccomp.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long seccomp_get_filter(struct task_struct *task,
          unsigned long n, void *data)
{
 return -22;
}
# 22 "./include/linux/sched.h" 2
# 1 "./include/linux/nodemask.h" 1
# 96 "./include/linux/nodemask.h"
# 1 "./include/linux/numa.h" 1
# 97 "./include/linux/nodemask.h" 2

typedef struct { unsigned long bits[((((1 << 2)) + (8 * sizeof(long)) - 1) / (8 * sizeof(long)))]; } nodemask_t;
extern nodemask_t _unused_nodemask_arg_;
# 119 "./include/linux/nodemask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void __node_set(int node, volatile nodemask_t *dstp)
{
 set_bit(node, dstp->bits);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __node_clear(int node, volatile nodemask_t *dstp)
{
 clear_bit(node, dstp->bits);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __nodes_setall(nodemask_t *dstp, unsigned int nbits)
{
 bitmap_fill(dstp->bits, nbits);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __nodes_clear(nodemask_t *dstp, unsigned int nbits)
{
 bitmap_zero(dstp->bits, nbits);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __node_test_and_set(int node, nodemask_t *addr)
{
 return test_and_set_bit(node, addr->bits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __nodes_and(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 bitmap_and(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __nodes_or(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 bitmap_or(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __nodes_xor(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 bitmap_xor(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __nodes_andnot(nodemask_t *dstp, const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 bitmap_andnot(dstp->bits, src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __nodes_complement(nodemask_t *dstp,
     const nodemask_t *srcp, unsigned int nbits)
{
 bitmap_complement(dstp->bits, srcp->bits, nbits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __nodes_equal(const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 return bitmap_equal(src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __nodes_intersects(const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 return bitmap_intersects(src1p->bits, src2p->bits, nbits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __nodes_subset(const nodemask_t *src1p,
     const nodemask_t *src2p, unsigned int nbits)
{
 return bitmap_subset(src1p->bits, src2p->bits, nbits);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __nodes_empty(const nodemask_t *srcp, unsigned int nbits)
{
 return bitmap_empty(srcp->bits, nbits);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __nodes_full(const nodemask_t *srcp, unsigned int nbits)
{
 return bitmap_full(srcp->bits, nbits);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __nodes_weight(const nodemask_t *srcp, unsigned int nbits)
{
 return bitmap_weight(srcp->bits, nbits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __nodes_shift_right(nodemask_t *dstp,
     const nodemask_t *srcp, int n, int nbits)
{
 bitmap_shift_right(dstp->bits, srcp->bits, n, nbits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __nodes_shift_left(nodemask_t *dstp,
     const nodemask_t *srcp, int n, int nbits)
{
 bitmap_shift_left(dstp->bits, srcp->bits, n, nbits);
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __first_node(const nodemask_t *srcp)
{
 return ({ int __UNIQUE_ID_min1_2 = ((1 << 2)); int __UNIQUE_ID_min2_3 = (find_next_bit((srcp->bits), ((1 << 2)), 0)); (void) (&__UNIQUE_ID_min1_2 == &__UNIQUE_ID_min2_3); __UNIQUE_ID_min1_2 < __UNIQUE_ID_min2_3 ? __UNIQUE_ID_min1_2 : __UNIQUE_ID_min2_3; });
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __next_node(int n, const nodemask_t *srcp)
{
 return ({ int __UNIQUE_ID_min1_4 = ((1 << 2)); int __UNIQUE_ID_min2_5 = (find_next_bit(srcp->bits, (1 << 2), n+1)); (void) (&__UNIQUE_ID_min1_4 == &__UNIQUE_ID_min2_5); __UNIQUE_ID_min1_4 < __UNIQUE_ID_min2_5 ? __UNIQUE_ID_min1_4 : __UNIQUE_ID_min2_5; });
}






int __next_node_in(int node, const nodemask_t *srcp);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void init_nodemask_of_node(nodemask_t *mask, int node)
{
 __nodes_clear(&(*mask), (1 << 2));
 __node_set((node), &(*mask));
}
# 290 "./include/linux/nodemask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __first_unset_node(const nodemask_t *maskp)
{
 return ({ int __UNIQUE_ID_min1_6 = ((1 << 2)); int __UNIQUE_ID_min2_7 = (find_next_zero_bit((maskp->bits), ((1 << 2)), 0)); (void) (&__UNIQUE_ID_min1_6 == &__UNIQUE_ID_min2_7); __UNIQUE_ID_min1_6 < __UNIQUE_ID_min2_7 ? __UNIQUE_ID_min1_6 : __UNIQUE_ID_min2_7; })
                                                  ;
}
# 324 "./include/linux/nodemask.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __nodemask_parse_user(const char *buf, int len,
     nodemask_t *dstp, int nbits)
{
 return bitmap_parse_user(buf, len, dstp->bits, nbits);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __nodelist_parse(const char *buf, nodemask_t *dstp, int nbits)
{
 return bitmap_parselist(buf, dstp->bits, nbits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __node_remap(int oldbit,
  const nodemask_t *oldp, const nodemask_t *newp, int nbits)
{
 return bitmap_bitremap(oldbit, oldp->bits, newp->bits, nbits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __nodes_remap(nodemask_t *dstp, const nodemask_t *srcp,
  const nodemask_t *oldp, const nodemask_t *newp, int nbits)
{
 bitmap_remap(dstp->bits, srcp->bits, oldp->bits, newp->bits, nbits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __nodes_onto(nodemask_t *dstp, const nodemask_t *origp,
  const nodemask_t *relmapp, int nbits)
{
 bitmap_onto(dstp->bits, origp->bits, relmapp->bits, nbits);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __nodes_fold(nodemask_t *dstp, const nodemask_t *origp,
  int sz, int nbits)
{
 bitmap_fold(dstp->bits, origp->bits, sz, nbits);
}
# 382 "./include/linux/nodemask.h"
enum node_states {
 N_POSSIBLE,
 N_ONLINE,
 N_NORMAL_MEMORY,



 N_HIGH_MEMORY = N_NORMAL_MEMORY,

 N_MEMORY,
 N_CPU,
 NR_NODE_STATES
};






extern nodemask_t node_states[NR_NODE_STATES];


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int node_state(int node, enum node_states state)
{
 return test_bit((node), (node_states[state]).bits);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void node_set_state(int node, enum node_states state)
{
 __node_set(node, &node_states[state]);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void node_clear_state(int node, enum node_states state)
{
 __node_clear(node, &node_states[state]);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int num_node_state(enum node_states state)
{
 return __nodes_weight(&(node_states[state]), (1 << 2));
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int next_online_node(int nid)
{
 return __next_node((nid), &(node_states[N_ONLINE]));
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int next_memory_node(int nid)
{
 return __next_node((nid), &(node_states[N_MEMORY]));
}

extern int nr_node_ids;
extern int nr_online_nodes;

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void node_set_online(int nid)
{
 node_set_state(nid, N_ONLINE);
 nr_online_nodes = num_node_state(N_ONLINE);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void node_set_offline(int nid)
{
 node_clear_state(nid, N_ONLINE);
 nr_online_nodes = num_node_state(N_ONLINE);
}
# 488 "./include/linux/nodemask.h"
extern int node_random(const nodemask_t *maskp);
# 522 "./include/linux/nodemask.h"
struct nodemask_scratch {
 nodemask_t mask1;
 nodemask_t mask2;
};
# 23 "./include/linux/sched.h" 2

# 1 "./include/linux/resource.h" 1




# 1 "./include/uapi/linux/resource.h" 1
# 24 "./include/uapi/linux/resource.h"
struct rusage {
 struct timeval ru_utime;
 struct timeval ru_stime;
 __kernel_long_t ru_maxrss;
 __kernel_long_t ru_ixrss;
 __kernel_long_t ru_idrss;
 __kernel_long_t ru_isrss;
 __kernel_long_t ru_minflt;
 __kernel_long_t ru_majflt;
 __kernel_long_t ru_nswap;
 __kernel_long_t ru_inblock;
 __kernel_long_t ru_oublock;
 __kernel_long_t ru_msgsnd;
 __kernel_long_t ru_msgrcv;
 __kernel_long_t ru_nsignals;
 __kernel_long_t ru_nvcsw;
 __kernel_long_t ru_nivcsw;
};

struct rlimit {
 __kernel_ulong_t rlim_cur;
 __kernel_ulong_t rlim_max;
};



struct rlimit64 {
 __u64 rlim_cur;
 __u64 rlim_max;
};
# 78 "./include/uapi/linux/resource.h"
# 1 "./arch/arm64/include/generated/uapi/asm/resource.h" 1
# 1 "./include/asm-generic/resource.h" 1




# 1 "./include/uapi/asm-generic/resource.h" 1
# 6 "./include/asm-generic/resource.h" 2
# 1 "./arch/arm64/include/generated/uapi/asm/resource.h" 2
# 79 "./include/uapi/linux/resource.h" 2
# 6 "./include/linux/resource.h" 2


struct task_struct;

void getrusage(struct task_struct *p, int who, struct rusage *ru);
int do_prlimit(struct task_struct *tsk, unsigned int resource,
  struct rlimit *new_rlim, struct rlimit *old_rlim);
# 25 "./include/linux/sched.h" 2
# 1 "./include/linux/latencytop.h" 1
# 14 "./include/linux/latencytop.h"
struct task_struct;
# 46 "./include/linux/latencytop.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
account_scheduler_latency(struct task_struct *task, int usecs, int inter)
{
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void clear_all_latency_tracing(struct task_struct *p)
{
}
# 26 "./include/linux/sched.h" 2
# 1 "./include/linux/sched/prio.h" 1
# 48 "./include/linux/sched/prio.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long nice_to_rlimit(long nice)
{
 return (19 - nice + 1);
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) long rlimit_to_nice(long prio)
{
 return (19 - prio + 1);
}
# 27 "./include/linux/sched.h" 2
# 1 "./include/linux/signal_types.h" 1
# 10 "./include/linux/signal_types.h"
# 1 "./include/uapi/linux/signal.h" 1




# 1 "./arch/arm64/include/uapi/asm/signal.h" 1
# 26 "./arch/arm64/include/uapi/asm/signal.h"
# 1 "./include/asm-generic/signal.h" 1




# 1 "./include/uapi/asm-generic/signal.h" 1
# 90 "./include/uapi/asm-generic/signal.h"
typedef struct {
 unsigned long sig[(64 / 64)];
} sigset_t;


typedef unsigned long old_sigset_t;

# 1 "./include/uapi/asm-generic/signal-defs.h" 1
# 18 "./include/uapi/asm-generic/signal-defs.h"
typedef void __signalfn_t(int);
typedef __signalfn_t *__sighandler_t;

typedef void __restorefn_t(void);
typedef __restorefn_t *__sigrestore_t;
# 98 "./include/uapi/asm-generic/signal.h" 2
# 114 "./include/uapi/asm-generic/signal.h"
typedef struct sigaltstack {
 void *ss_sp;
 int ss_flags;
 size_t ss_size;
} stack_t;
# 6 "./include/asm-generic/signal.h" 2





# 1 "./arch/arm64/include/uapi/asm/sigcontext.h" 1
# 26 "./arch/arm64/include/uapi/asm/sigcontext.h"
struct sigcontext {
 __u64 fault_address;

 __u64 regs[31];
 __u64 sp;
 __u64 pc;
 __u64 pstate;

 __u8 __reserved[4096] __attribute__((__aligned__(16)));
};
# 63 "./arch/arm64/include/uapi/asm/sigcontext.h"
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




struct esr_context {
 struct _aarch64_ctx head;
 __u64 esr;
};
# 113 "./arch/arm64/include/uapi/asm/sigcontext.h"
struct extra_context {
 struct _aarch64_ctx head;
 __u64 datap;
 __u32 size;
 __u32 __reserved[3];
};
# 12 "./include/asm-generic/signal.h" 2
# 27 "./arch/arm64/include/uapi/asm/signal.h" 2
# 6 "./include/uapi/linux/signal.h" 2
# 1 "./arch/arm64/include/uapi/asm/siginfo.h" 1
# 22 "./arch/arm64/include/uapi/asm/siginfo.h"
# 1 "./include/uapi/asm-generic/siginfo.h" 1







typedef union sigval {
 int sival_int;
 void *sival_ptr;
} sigval_t;
# 49 "./include/uapi/asm-generic/siginfo.h"
typedef struct siginfo {
 int si_signo;
 int si_errno;
 int si_code;

 union {
  int _pad[((128 - (4 * sizeof(int))) / sizeof(int))];


  struct {
   __kernel_pid_t _pid;
   __kernel_uid32_t _uid;
  } _kill;


  struct {
   __kernel_timer_t _tid;
   int _overrun;
   char _pad[sizeof( __kernel_uid32_t) - sizeof(int)];
   sigval_t _sigval;
   int _sys_private;
  } _timer;


  struct {
   __kernel_pid_t _pid;
   __kernel_uid32_t _uid;
   sigval_t _sigval;
  } _rt;


  struct {
   __kernel_pid_t _pid;
   __kernel_uid32_t _uid;
   int _status;
   __kernel_clock_t _utime;
   __kernel_clock_t _stime;
  } _sigchld;


  struct {
   void *_addr;



   short _addr_lsb;
   union {

    struct {
     void *_lower;
     void *_upper;
    } _addr_bnd;

    __u32 _pkey;
   };
  } _sigfault;


  struct {
   long _band;
   int _fd;
  } _sigpoll;


  struct {
   void *_call_addr;
   int _syscall;
   unsigned int _arch;
  } _sigsys;
 } _sifields;
} siginfo_t;
# 281 "./include/uapi/asm-generic/siginfo.h"
typedef struct sigevent {
 sigval_t sigev_value;
 int sigev_signo;
 int sigev_notify;
 union {
  int _pad[((64 - (sizeof(int) * 2 + sizeof(sigval_t))) / sizeof(int))];
   int _tid;

  struct {
   void (*_function)(sigval_t);
   void *_attribute;
  } _sigev_thread;
 } _sigev_un;
} sigevent_t;
# 23 "./arch/arm64/include/uapi/asm/siginfo.h" 2
# 7 "./include/uapi/linux/signal.h" 2
# 11 "./include/linux/signal_types.h" 2





struct sigqueue {
 struct list_head list;
 int flags;
 siginfo_t info;
 struct user_struct *user;
};




struct sigpending {
 struct list_head list;
 sigset_t signal;
};

struct sigaction {

 __sighandler_t sa_handler;
 unsigned long sa_flags;





 __sigrestore_t sa_restorer;

 sigset_t sa_mask;
};

struct k_sigaction {
 struct sigaction sa;



};
# 61 "./include/linux/signal_types.h"
struct ksignal {
 struct k_sigaction ka;
 siginfo_t info;
 int sig;
};
# 28 "./include/linux/sched.h" 2
# 1 "./include/linux/mm_types_task.h" 1
# 34 "./include/linux/mm_types_task.h"
struct vmacache {
 u64 seqnum;
 struct vm_area_struct *vmas[(1U << 2)];
};

enum {
 MM_FILEPAGES,
 MM_ANONPAGES,
 MM_SWAPENTS,
 MM_SHMEMPAGES,
 NR_MM_COUNTERS
};




struct task_rss_stat {
 int events;
 int count[NR_MM_COUNTERS];
};


struct mm_rss_stat {
 atomic_long_t count[NR_MM_COUNTERS];
};

struct page_frag {
 struct page *page;

 __u32 offset;
 __u32 size;




};


struct tlbflush_unmap_batch {
# 93 "./include/linux/mm_types_task.h"
};
# 29 "./include/linux/sched.h" 2
# 1 "./include/linux/task_io_accounting.h" 1
# 12 "./include/linux/task_io_accounting.h"
struct task_io_accounting {


 u64 rchar;

 u64 wchar;

 u64 syscr;

 u64 syscw;







 u64 read_bytes;





 u64 write_bytes;
# 44 "./include/linux/task_io_accounting.h"
 u64 cancelled_write_bytes;

};
# 30 "./include/linux/sched.h" 2


struct audit_context;
struct backing_dev_info;
struct bio_list;
struct blk_plug;
struct cfs_rq;
struct fs_struct;
struct futex_pi_state;
struct io_context;
struct mempolicy;
struct nameidata;
struct nsproxy;
struct perf_event_context;
struct pid_namespace;
struct pipe_inode_info;
struct rcu_node;
struct reclaim_state;
struct robust_list_head;
struct sched_attr;
struct sched_param;
struct seq_file;
struct sighand_struct;
struct signal_struct;
struct task_delay_info;
struct task_group;
# 209 "./include/linux/sched.h"
extern cpumask_var_t cpu_isolated_map;

extern void scheduler_tick(void);



extern long schedule_timeout(long timeout);
extern long schedule_timeout_interruptible(long timeout);
extern long schedule_timeout_killable(long timeout);
extern long schedule_timeout_uninterruptible(long timeout);
extern long schedule_timeout_idle(long timeout);
 void schedule(void);
extern void schedule_preempt_disabled(void);

extern int __attribute__((warn_unused_result)) io_schedule_prepare(void);
extern void io_schedule_finish(int token);
extern long io_schedule_timeout(long timeout);
extern void io_schedule(void);
# 237 "./include/linux/sched.h"
struct prev_cputime {

 u64 utime;
 u64 stime;
 raw_spinlock_t lock;

};
# 255 "./include/linux/sched.h"
struct task_cputime {
 u64 utime;
 u64 stime;
 unsigned long long sum_exec_runtime;
};






enum vtime_state {

 VTIME_INACTIVE = 0,

 VTIME_USER,

 VTIME_SYS,
};

struct vtime {
 seqcount_t seqcount;
 unsigned long long starttime;
 enum vtime_state state;
 u64 utime;
 u64 stime;
 u64 gtime;
};

struct sched_info {




 unsigned long pcount;


 unsigned long long run_delay;




 unsigned long long last_arrival;


 unsigned long long last_queued;


};
# 315 "./include/linux/sched.h"
struct load_weight {
 unsigned long weight;
 u32 inv_weight;
};
# 372 "./include/linux/sched.h"
struct sched_avg {
 u64 last_update_time;
 u64 load_sum;
 u32 util_sum;
 u32 period_contrib;
 unsigned long load_avg;
 unsigned long util_avg;
};

struct sched_statistics {
# 415 "./include/linux/sched.h"
};

struct sched_entity {

 struct load_weight load;
 struct rb_node run_node;
 struct list_head group_node;
 unsigned int on_rq;

 u64 exec_start;
 u64 sum_exec_runtime;
 u64 vruntime;
 u64 prev_sum_exec_runtime;

 u64 nr_migrations;

 struct sched_statistics statistics;


 int depth;
 struct sched_entity *parent;

 struct cfs_rq *cfs_rq;

 struct cfs_rq *my_q;
# 449 "./include/linux/sched.h"
 struct sched_avg avg __attribute__((__aligned__((1 << 7))));

};

struct sched_rt_entity {
 struct list_head run_list;
 unsigned long timeout;
 unsigned long watchdog_stamp;
 unsigned int time_slice;
 unsigned short on_rq;
 unsigned short on_list;

 struct sched_rt_entity *back;







} __attribute__((designated_init));

struct sched_dl_entity {
 struct rb_node rb_node;






 u64 dl_runtime;
 u64 dl_deadline;
 u64 dl_period;
 u64 dl_bw;
 u64 dl_density;






 s64 runtime;
 u64 deadline;
 unsigned int flags;
# 515 "./include/linux/sched.h"
 int dl_throttled;
 int dl_boosted;
 int dl_yielded;
 int dl_non_contending;





 struct hrtimer dl_timer;
# 533 "./include/linux/sched.h"
 struct hrtimer inactive_timer;
};

union rcu_special {
 struct {
  u8 blocked;
  u8 need_qs;
  u8 exp_need_qs;


  u8 pad;
 } b;
 u32 s;
};

enum perf_event_task_context {
 perf_invalid_context = -1,
 perf_hw_context = 0,
 perf_sw_context,
 perf_nr_task_contexts,
};

struct wake_q_node {
 struct wake_q_node *next;
};

struct task_struct {





 struct thread_info thread_info;


 volatile long state;







 void *stack;
 atomic_t usage;

 unsigned int flags;
 unsigned int ptrace;


 struct llist_node wake_entry;
 int on_cpu;


 unsigned int cpu;

 unsigned int wakee_flips;
 unsigned long wakee_flip_decay_ts;
 struct task_struct *last_wakee;

 int wake_cpu;

 int on_rq;

 int prio;
 int static_prio;
 int normal_prio;
 unsigned int rt_priority;

 const struct sched_class *sched_class;
 struct sched_entity se;
 struct sched_rt_entity rt;

 struct task_group *sched_task_group;

 struct sched_dl_entity dl;



 struct hlist_head preempt_notifiers;






 unsigned int policy;
 int nr_cpus_allowed;
 cpumask_t cpus_allowed;


 int rcu_read_lock_nesting;
 union rcu_special rcu_read_unlock_special;
 struct list_head rcu_node_entry;
 struct rcu_node *rcu_blocked_node;



 unsigned long rcu_tasks_nvcsw;
 u8 rcu_tasks_holdout;
 u8 rcu_tasks_idx;
 int rcu_tasks_idle_cpu;
 struct list_head rcu_tasks_holdout_list;


 struct sched_info sched_info;

 struct list_head tasks;

 struct plist_node pushable_tasks;
 struct rb_node pushable_dl_tasks;


 struct mm_struct *mm;
 struct mm_struct *active_mm;


 struct vmacache vmacache;


 struct task_rss_stat rss_stat;

 int exit_state;
 int exit_code;
 int exit_signal;

 int pdeath_signal;

 unsigned long jobctl;


 unsigned int personality;


 unsigned sched_reset_on_fork:1;
 unsigned sched_contributes_to_load:1;
 unsigned sched_migrated:1;
 unsigned sched_remote_wakeup:1;

 unsigned :0;




 unsigned in_execve:1;
 unsigned in_iowait:1;




 unsigned memcg_may_oom:1;

 unsigned memcg_kmem_skip_account:1;







 unsigned no_cgroup_migration:1;


 unsigned long atomic_flags;

 struct restart_block restart_block;

 pid_t pid;
 pid_t tgid;
# 714 "./include/linux/sched.h"
 struct task_struct *real_parent;


 struct task_struct *parent;




 struct list_head children;
 struct list_head sibling;
 struct task_struct *group_leader;







 struct list_head ptraced;
 struct list_head ptrace_entry;


 struct pid_link pids[PIDTYPE_MAX];
 struct list_head thread_group;
 struct list_head thread_node;

 struct completion *vfork_done;


 int *set_child_tid;


 int *clear_child_tid;

 u64 utime;
 u64 stime;




 u64 gtime;
 struct prev_cputime prev_cputime;
# 764 "./include/linux/sched.h"
 unsigned long nvcsw;
 unsigned long nivcsw;


 u64 start_time;


 u64 real_start_time;


 unsigned long min_flt;
 unsigned long maj_flt;


 struct task_cputime cputime_expires;
 struct list_head cpu_timers[3];





 const struct cred *ptracer_cred;


 const struct cred *real_cred;


 const struct cred *cred;
# 800 "./include/linux/sched.h"
 char comm[16];

 struct nameidata *nameidata;


 struct sysv_sem sysvsem;
 struct sysv_shm sysvshm;





 struct fs_struct *fs;


 struct files_struct *files;


 struct nsproxy *nsproxy;


 struct signal_struct *signal;
 struct sighand_struct *sighand;
 sigset_t blocked;
 sigset_t real_blocked;

 sigset_t saved_sigmask;
 struct sigpending pending;
 unsigned long sas_ss_sp;
 size_t sas_ss_size;
 unsigned int sas_ss_flags;

 struct callback_head *task_works;

 struct audit_context *audit_context;

 kuid_t loginuid;
 unsigned int sessionid;

 struct seccomp seccomp;


 u32 parent_exec_id;
 u32 self_exec_id;


 spinlock_t alloc_lock;


 raw_spinlock_t pi_lock;

 struct wake_q_node wake_q;



 struct rb_root_cached pi_waiters;

 struct task_struct *pi_top_task;

 struct rt_mutex_waiter *pi_blocked_on;
# 907 "./include/linux/sched.h"
 void *journal_info;


 struct bio_list *bio_list;



 struct blk_plug *plug;



 struct reclaim_state *reclaim_state;

 struct backing_dev_info *backing_dev_info;

 struct io_context *io_context;


 unsigned long ptrace_message;
 siginfo_t *last_siginfo;

 struct task_io_accounting ioac;


 u64 acct_rss_mem1;

 u64 acct_vm_mem1;

 u64 acct_timexpd;



 nodemask_t mems_allowed;

 seqcount_t mems_allowed_seq;
 int cpuset_mem_spread_rotor;
 int cpuset_slab_spread_rotor;



 struct css_set *cgroups;

 struct list_head cg_list;






 struct robust_list_head *robust_list;

 struct compat_robust_list_head *compat_robust_list;

 struct list_head pi_state_list;
 struct futex_pi_state *pi_state_cache;


 struct perf_event_context *perf_event_ctxp[perf_nr_task_contexts];
 struct mutex perf_event_mutex;
 struct list_head perf_event_list;






 struct mempolicy *mempolicy;
 short il_prev;
 short pref_node_fork;


 int numa_scan_seq;
 unsigned int numa_scan_period;
 unsigned int numa_scan_period_max;
 int numa_preferred_nid;
 unsigned long numa_migrate_retry;

 u64 node_stamp;
 u64 last_task_numa_placement;
 u64 last_sum_exec_runtime;
 struct callback_head numa_work;

 struct list_head numa_entry;
 struct numa_group *numa_group;
# 1006 "./include/linux/sched.h"
 unsigned long *numa_faults;
 unsigned long total_numa_faults;







 unsigned long numa_faults_locality[3];

 unsigned long numa_pages_migrated;


 struct tlbflush_unmap_batch tlb_ubc;

 struct callback_head rcu;


 struct pipe_inode_info *splice_pipe;

 struct page_frag task_frag;


 struct task_delay_info *delays;
# 1041 "./include/linux/sched.h"
 int nr_dirtied;
 int nr_dirtied_pause;

 unsigned long dirty_paused_when;
# 1054 "./include/linux/sched.h"
 u64 timer_slack_ns;
 u64 default_timer_slack_ns;
# 1104 "./include/linux/sched.h"
 struct mem_cgroup *memcg_in_oom;
 gfp_t memcg_oom_gfp_mask;
 int memcg_oom_order;


 unsigned int memcg_nr_pages_over_high;
# 1122 "./include/linux/sched.h"
 int pagefault_disabled;

 struct task_struct *oom_reaper_list;


 struct vm_struct *stack_vm_area;



 atomic_t stack_refcount;






 void *security;









 struct thread_struct thread;







};

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct pid *task_pid(struct task_struct *task)
{
 return task->pids[PIDTYPE_PID].pid;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct pid *task_tgid(struct task_struct *task)
{
 return task->group_leader->pids[PIDTYPE_PID].pid;
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct pid *task_pgrp(struct task_struct *task)
{
 return task->group_leader->pids[PIDTYPE_PGID].pid;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct pid *task_session(struct task_struct *task)
{
 return task->group_leader->pids[PIDTYPE_SID].pid;
}
# 1194 "./include/linux/sched.h"
pid_t __task_pid_nr_ns(struct task_struct *task, enum pid_type type, struct pid_namespace *ns);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t task_pid_nr(struct task_struct *tsk)
{
 return tsk->pid;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t task_pid_nr_ns(struct task_struct *tsk, struct pid_namespace *ns)
{
 return __task_pid_nr_ns(tsk, PIDTYPE_PID, ns);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t task_pid_vnr(struct task_struct *tsk)
{
 return __task_pid_nr_ns(tsk, PIDTYPE_PID, ((void *)0));
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t task_tgid_nr(struct task_struct *tsk)
{
 return tsk->tgid;
}
# 1227 "./include/linux/sched.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int pid_alive(const struct task_struct *p)
{
 return p->pids[PIDTYPE_PID].pid != ((void *)0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t task_pgrp_nr_ns(struct task_struct *tsk, struct pid_namespace *ns)
{
 return __task_pid_nr_ns(tsk, PIDTYPE_PGID, ns);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t task_pgrp_vnr(struct task_struct *tsk)
{
 return __task_pid_nr_ns(tsk, PIDTYPE_PGID, ((void *)0));
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t task_session_nr_ns(struct task_struct *tsk, struct pid_namespace *ns)
{
 return __task_pid_nr_ns(tsk, PIDTYPE_SID, ns);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t task_session_vnr(struct task_struct *tsk)
{
 return __task_pid_nr_ns(tsk, PIDTYPE_SID, ((void *)0));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t task_tgid_nr_ns(struct task_struct *tsk, struct pid_namespace *ns)
{
 return __task_pid_nr_ns(tsk, __PIDTYPE_TGID, ns);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t task_tgid_vnr(struct task_struct *tsk)
{
 return __task_pid_nr_ns(tsk, __PIDTYPE_TGID, ((void *)0));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t task_ppid_nr_ns(const struct task_struct *tsk, struct pid_namespace *ns)
{
 pid_t pid = 0;

 rcu_read_lock();
 if (pid_alive(tsk))
  pid = task_tgid_nr_ns(({ typeof(*(tsk->real_parent)) *________p1 = (typeof(*(tsk->real_parent)) *)({ union { typeof((tsk->real_parent)) __val; char __c[1]; } __u; if (1) __read_once_size(&((tsk->real_parent)), __u.__c, sizeof((tsk->real_parent))); else __read_once_size_nocheck(&((tsk->real_parent)), __u.__c, sizeof((tsk->real_parent))); do { } while (0); __u.__val; }); do { } while (0); ; ((typeof(*(tsk->real_parent)) *)(________p1)); }), ns);
 rcu_read_unlock();

 return pid;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t task_ppid_nr(const struct task_struct *tsk)
{
 return task_ppid_nr_ns(tsk, &init_pid_ns);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) pid_t task_pgrp_nr(struct task_struct *tsk)
{
 return task_pgrp_nr_ns(tsk, &init_pid_ns);
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int __get_task_state(struct task_struct *tsk)
{
 unsigned int tsk_state = ({ union { typeof(tsk->state) __val; char __c[1]; } __u; if (1) __read_once_size(&(tsk->state), __u.__c, sizeof(tsk->state)); else __read_once_size_nocheck(&(tsk->state), __u.__c, sizeof(tsk->state)); do { } while (0); __u.__val; });
 unsigned int state = (tsk_state | tsk->exit_state) & (0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040);

 do { bool __cond = !(!(((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) == 0 || ((((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) - 1)) != 0))); extern void __compiletime_assert_1294(void) __attribute__((error("BUILD_BUG_ON failed: " "((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) == 0 || ((((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) - 1)) != 0)"))); if (__cond) __compiletime_assert_1294(); do { } while (0); } while (0);

 if (tsk_state == (0x0002 | 0x0400))
  state = ((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1);

 return fls(state);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) char __task_state_to_char(unsigned int state)
{
 static const char state_char[] = "RSDTtXZPI";

 do { bool __cond = !(!(1 + ( __builtin_constant_p((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) ? ( ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) < 2 ? 0 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 63) ? 63 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 62) ? 62 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 61) ? 61 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 60) ? 60 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 59) ? 59 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 58) ? 58 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 57) ? 57 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 56) ? 56 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 55) ? 55 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 54) ? 54 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 53) ? 53 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 52) ? 52 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 51) ? 51 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 50) ? 50 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 49) ? 49 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 48) ? 48 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 47) ? 47 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 46) ? 46 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 45) ? 45 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 44) ? 44 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 43) ? 43 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 42) ? 42 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 41) ? 41 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 40) ? 40 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 39) ? 39 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 38) ? 38 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 37) ? 37 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 36) ? 36 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 35) ? 35 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 34) ? 34 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 33) ? 33 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 32) ? 32 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 31) ? 31 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 30) ? 30 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 29) ? 29 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 28) ? 28 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 27) ? 27 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 26) ? 26 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 25) ? 25 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 24) ? 24 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 23) ? 23 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 22) ? 22 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 21) ? 21 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 20) ? 20 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 19) ? 19 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 18) ? 18 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 17) ? 17 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 16) ? 16 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 15) ? 15 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 14) ? 14 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 13) ? 13 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 12) ? 12 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 11) ? 11 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 10) ? 10 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 9) ? 9 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 8) ? 8 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 7) ? 7 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 6) ? 6 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 5) ? 5 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 4) ? 4 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 3) ? 3 : ((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) & (1ULL << 2) ? 2 : 1 ) : (sizeof((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) <= 4) ? __ilog2_u32((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) : __ilog2_u64((((0x0000 | 0x0001 | 0x0002 | 0x0004 | 0x0008 | 0x0010 | 0x0020 | 0x0040) + 1) << 1)) ) != sizeof(state_char) - 1)); extern void __compiletime_assert_1306(void) __attribute__((error("BUILD_BUG_ON failed: " "1 + ilog2(TASK_REPORT_MAX) != sizeof(state_char) - 1"))); if (__cond) __compiletime_assert_1306(); do { } while (0); } while (0);

 return state_char[state];
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) char task_state_to_char(struct task_struct *tsk)
{
 return __task_state_to_char(__get_task_state(tsk));
}
# 1325 "./include/linux/sched.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int is_global_init(struct task_struct *tsk)
{
 return task_tgid_nr(tsk) == 1;
}

extern struct pid *cad_pid;
# 1392 "./include/linux/sched.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool is_percpu_thread(void)
{

 return (get_current()->flags & 0x04000000) &&
  (get_current()->nr_cpus_allowed == 1);



}
# 1423 "./include/linux/sched.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool task_no_new_privs(struct task_struct *p) { return test_bit(0, &p->atomic_flags); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void task_set_no_new_privs(struct task_struct *p) { set_bit(0, &p->atomic_flags); }

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool task_spread_page(struct task_struct *p) { return test_bit(1, &p->atomic_flags); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void task_set_spread_page(struct task_struct *p) { set_bit(1, &p->atomic_flags); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void task_clear_spread_page(struct task_struct *p) { clear_bit(1, &p->atomic_flags); }

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool task_spread_slab(struct task_struct *p) { return test_bit(2, &p->atomic_flags); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void task_set_spread_slab(struct task_struct *p) { set_bit(2, &p->atomic_flags); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void task_clear_spread_slab(struct task_struct *p) { clear_bit(2, &p->atomic_flags); }

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool task_spec_ssb_disable(struct task_struct *p) { return test_bit(3, &p->atomic_flags); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void task_set_spec_ssb_disable(struct task_struct *p) { set_bit(3, &p->atomic_flags); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void task_clear_spec_ssb_disable(struct task_struct *p) { clear_bit(3, &p->atomic_flags); }

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool task_spec_ssb_force_disable(struct task_struct *p) { return test_bit(4, &p->atomic_flags); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void task_set_spec_ssb_force_disable(struct task_struct *p) { set_bit(4, &p->atomic_flags); }

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool task_spec_ib_disable(struct task_struct *p) { return test_bit(5, &p->atomic_flags); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void task_set_spec_ib_disable(struct task_struct *p) { set_bit(5, &p->atomic_flags); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void task_clear_spec_ib_disable(struct task_struct *p) { clear_bit(5, &p->atomic_flags); }

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool task_spec_ib_force_disable(struct task_struct *p) { return test_bit(6, &p->atomic_flags); }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void task_set_spec_ib_force_disable(struct task_struct *p) { set_bit(6, &p->atomic_flags); }

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
current_restore_flags(unsigned long orig_flags, unsigned long flags)
{
 get_current()->flags &= ~flags;
 get_current()->flags |= orig_flags & flags;
}

extern int cpuset_cpumask_can_shrink(const struct cpumask *cur, const struct cpumask *trial);
extern int task_can_attach(struct task_struct *p, const struct cpumask *cs_cpus_allowed);

extern void do_set_cpus_allowed(struct task_struct *p, const struct cpumask *new_mask);
extern int set_cpus_allowed_ptr(struct task_struct *p, const struct cpumask *new_mask);
# 1476 "./include/linux/sched.h"
extern int yield_to(struct task_struct *p, bool preempt);
extern void set_user_nice(struct task_struct *p, long nice);
extern int task_prio(const struct task_struct *p);







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int task_nice(const struct task_struct *p)
{
 return (((p)->static_prio) - (100 + (19 - -20 + 1) / 2));
}

extern int can_nice(const struct task_struct *p, const int nice);
extern int task_curr(const struct task_struct *p);
extern int idle_cpu(int cpu);
extern int sched_setscheduler(struct task_struct *, int, const struct sched_param *);
extern int sched_setscheduler_nocheck(struct task_struct *, int, const struct sched_param *);
extern int sched_setattr(struct task_struct *, const struct sched_attr *);
extern struct task_struct *idle_task(int cpu);







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool is_idle_task(const struct task_struct *p)
{
 return !!(p->flags & 0x00000002);
}

extern struct task_struct *curr_task(int cpu);
extern void ia64_set_curr_task(int cpu, struct task_struct *p);

void yield(void);

union thread_union {



 unsigned long stack[((1UL) << (14 + 0))/sizeof(long)];
};


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct thread_info *task_thread_info(struct task_struct *task)
{
 return &task->thread_info;
}
# 1542 "./include/linux/sched.h"
extern struct task_struct *find_task_by_vpid(pid_t nr);
extern struct task_struct *find_task_by_pid_ns(pid_t nr, struct pid_namespace *ns);

extern int wake_up_state(struct task_struct *tsk, unsigned int state);
extern int wake_up_process(struct task_struct *tsk);
extern void wake_up_new_task(struct task_struct *tsk);


extern void kick_process(struct task_struct *tsk);




extern void __set_task_comm(struct task_struct *tsk, const char *from, bool exec);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void set_task_comm(struct task_struct *tsk, const char *from)
{
 __set_task_comm(tsk, from, false);
}

extern char *__get_task_comm(char *to, size_t len, struct task_struct *tsk);






void scheduler_ipi(void);
extern unsigned long wait_task_inactive(struct task_struct *, long match_state);
# 1583 "./include/linux/sched.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void set_tsk_thread_flag(struct task_struct *tsk, int flag)
{
 set_ti_thread_flag(task_thread_info(tsk), flag);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void clear_tsk_thread_flag(struct task_struct *tsk, int flag)
{
 clear_ti_thread_flag(task_thread_info(tsk), flag);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int test_and_set_tsk_thread_flag(struct task_struct *tsk, int flag)
{
 return test_and_set_ti_thread_flag(task_thread_info(tsk), flag);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int test_and_clear_tsk_thread_flag(struct task_struct *tsk, int flag)
{
 return test_and_clear_ti_thread_flag(task_thread_info(tsk), flag);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int test_tsk_thread_flag(struct task_struct *tsk, int flag)
{
 return test_ti_thread_flag(task_thread_info(tsk), flag);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void set_tsk_need_resched(struct task_struct *tsk)
{
 set_tsk_thread_flag(tsk,1);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void clear_tsk_need_resched(struct task_struct *tsk)
{
 clear_tsk_thread_flag(tsk,1);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int test_tsk_need_resched(struct task_struct *tsk)
{
 return __builtin_expect(!!(test_tsk_thread_flag(tsk,1)), 0);
}
# 1633 "./include/linux/sched.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int _cond_resched(void) { return 0; }







extern int __cond_resched_lock(spinlock_t *lock);






extern int __cond_resched_softirq(void);






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void cond_resched_rcu(void)
{





}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int spin_needbreak(spinlock_t *lock)
{

 return spin_is_contended(lock);



}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) bool need_resched(void)
{
 return __builtin_expect(!!(test_ti_thread_flag(((struct thread_info *)get_current()), 1)), 0);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int task_cpu(const struct task_struct *p)
{

 return p->cpu;



}

extern void set_task_cpu(struct task_struct *p, unsigned int cpu);
# 1724 "./include/linux/sched.h"
extern long sched_setaffinity(pid_t pid, const struct cpumask *new_mask);
extern long sched_getaffinity(pid_t pid, struct cpumask *mask);
# 26 "./arch/arm64/include/asm/compat.h" 2
# 1 "./include/linux/sched/task_stack.h" 1
# 10 "./include/linux/sched/task_stack.h"
# 1 "./include/uapi/linux/magic.h" 1
# 11 "./include/linux/sched/task_stack.h" 2
# 19 "./include/linux/sched/task_stack.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *task_stack_page(const struct task_struct *task)
{
 return task->stack;
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long *end_of_stack(const struct task_struct *task)
{
 return task->stack;
}
# 62 "./include/linux/sched/task_stack.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *try_get_task_stack(struct task_struct *tsk)
{
 return atomic_add_unless((&tsk->stack_refcount), 1, 0) ?
  task_stack_page(tsk) : ((void *)0);
}

extern void put_task_stack(struct task_struct *tsk);
# 81 "./include/linux/sched/task_stack.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int object_is_on_stack(void *obj)
{
 void *stack = task_stack_page(get_current());

 return (obj >= stack) && (obj < (stack + ((1UL) << (14 + 0))));
}

extern void thread_stack_cache_init(void);
# 110 "./include/linux/sched/task_stack.h"
extern void set_task_stack_end_magic(struct task_struct *tsk);


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int kstack_end(void *addr)
{



 return !(((unsigned long)addr+sizeof(void*)-1) & (((1UL) << (14 + 0))-sizeof(void*)));
}
# 27 "./arch/arm64/include/asm/compat.h" 2
# 35 "./arch/arm64/include/asm/compat.h"
typedef u32 compat_size_t;
typedef s32 compat_ssize_t;
typedef s32 compat_time_t;
typedef s32 compat_clock_t;
typedef s32 compat_pid_t;
typedef u16 __compat_uid_t;
typedef u16 __compat_gid_t;
typedef u16 __compat_uid16_t;
typedef u16 __compat_gid16_t;
typedef u32 __compat_uid32_t;
typedef u32 __compat_gid32_t;
typedef u16 compat_mode_t;
typedef u32 compat_ino_t;
typedef u32 compat_dev_t;
typedef s32 compat_off_t;
typedef s64 compat_loff_t;
typedef s32 compat_nlink_t;
typedef u16 compat_ipc_pid_t;
typedef s32 compat_daddr_t;
typedef u32 compat_caddr_t;
typedef __kernel_fsid_t compat_fsid_t;
typedef s32 compat_key_t;
typedef s32 compat_timer_t;

typedef s16 compat_short_t;
typedef s32 compat_int_t;
typedef s32 compat_long_t;
typedef s64 compat_s64;
typedef u16 compat_ushort_t;
typedef u32 compat_uint_t;
typedef u32 compat_ulong_t;
typedef u64 compat_u64;
typedef u32 compat_uptr_t;

struct compat_timespec {
 compat_time_t tv_sec;
 s32 tv_nsec;
};

struct compat_timeval {
 compat_time_t tv_sec;
 s32 tv_usec;
};

struct compat_stat {




 compat_dev_t st_dev;

 compat_ino_t st_ino;
 compat_mode_t st_mode;
 compat_ushort_t st_nlink;
 __compat_uid16_t st_uid;
 __compat_gid16_t st_gid;




 compat_dev_t st_rdev;

 compat_off_t st_size;
 compat_off_t st_blksize;
 compat_off_t st_blocks;
 compat_time_t st_atime;
 compat_ulong_t st_atime_nsec;
 compat_time_t st_mtime;
 compat_ulong_t st_mtime_nsec;
 compat_time_t st_ctime;
 compat_ulong_t st_ctime_nsec;
 compat_ulong_t __unused4[2];
};

struct compat_flock {
 short l_type;
 short l_whence;
 compat_off_t l_start;
 compat_off_t l_len;
 compat_pid_t l_pid;
};





struct compat_flock64 {
 short l_type;
 short l_whence;
 compat_loff_t l_start;
 compat_loff_t l_len;
 compat_pid_t l_pid;
};

struct compat_statfs {
 int f_type;
 int f_bsize;
 int f_blocks;
 int f_bfree;
 int f_bavail;
 int f_files;
 int f_ffree;
 compat_fsid_t f_fsid;
 int f_namelen;
 int f_frsize;
 int f_flags;
 int f_spare[4];
};



typedef u32 compat_old_sigset_t;




typedef u32 compat_sigset_word;

typedef union compat_sigval {
 compat_int_t sival_int;
 compat_uptr_t sival_ptr;
} compat_sigval_t;

typedef struct compat_siginfo {
 int si_signo;
 int si_errno;
 int si_code;

 union {
  int _pad[128/sizeof(int) - 3];


  struct {
   compat_pid_t _pid;
   __compat_uid32_t _uid;
  } _kill;


  struct {
   compat_timer_t _tid;
   int _overrun;
   compat_sigval_t _sigval;
   int _sys_private;
  } _timer;


  struct {
   compat_pid_t _pid;
   __compat_uid32_t _uid;
   compat_sigval_t _sigval;
  } _rt;


  struct {
   compat_pid_t _pid;
   __compat_uid32_t _uid;
   int _status;
   compat_clock_t _utime;
   compat_clock_t _stime;
  } _sigchld;


  struct {
   compat_uptr_t _addr;
   short _addr_lsb;
  } _sigfault;


  struct {
   compat_long_t _band;
   int _fd;
  } _sigpoll;


  struct {
   compat_uptr_t _call_addr;
   int _syscall;
   compat_uint_t _arch;
  } _sigsys;
 } _sifields;
} compat_siginfo_t;
# 226 "./arch/arm64/include/asm/compat.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *compat_ptr(compat_uptr_t uptr)
{
 return (void *)(unsigned long)uptr;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) compat_uptr_t ptr_to_compat(void *uptr)
{
 return (u32)(unsigned long)uptr;
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *arch_compat_alloc_user_space(long len)
{
 return (void *)(user_stack_pointer(((struct pt_regs *)(((1UL) << (14 + 0)) + task_stack_page(get_current())) - 1))) - len;
}

struct compat_ipc64_perm {
 compat_key_t key;
 __compat_uid32_t uid;
 __compat_gid32_t gid;
 __compat_uid32_t cuid;
 __compat_gid32_t cgid;
 unsigned short mode;
 unsigned short __pad1;
 unsigned short seq;
 unsigned short __pad2;
 compat_ulong_t unused1;
 compat_ulong_t unused2;
};

struct compat_semid64_ds {
 struct compat_ipc64_perm sem_perm;
 compat_time_t sem_otime;
 compat_ulong_t __unused1;
 compat_time_t sem_ctime;
 compat_ulong_t __unused2;
 compat_ulong_t sem_nsems;
 compat_ulong_t __unused3;
 compat_ulong_t __unused4;
};

struct compat_msqid64_ds {
 struct compat_ipc64_perm msg_perm;
 compat_time_t msg_stime;
 compat_ulong_t __unused1;
 compat_time_t msg_rtime;
 compat_ulong_t __unused2;
 compat_time_t msg_ctime;
 compat_ulong_t __unused3;
 compat_ulong_t msg_cbytes;
 compat_ulong_t msg_qnum;
 compat_ulong_t msg_qbytes;
 compat_pid_t msg_lspid;
 compat_pid_t msg_lrpid;
 compat_ulong_t __unused4;
 compat_ulong_t __unused5;
};

struct compat_shmid64_ds {
 struct compat_ipc64_perm shm_perm;
 compat_size_t shm_segsz;
 compat_time_t shm_atime;
 compat_ulong_t __unused1;
 compat_time_t shm_dtime;
 compat_ulong_t __unused2;
 compat_time_t shm_ctime;
 compat_ulong_t __unused3;
 compat_pid_t shm_cpid;
 compat_pid_t shm_lpid;
 compat_ulong_t shm_nattch;
 compat_ulong_t __unused4;
 compat_ulong_t __unused5;
};

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int is_compat_task(void)
{
 return test_ti_thread_flag(((struct thread_info *)get_current()), 22);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int is_compat_thread(struct thread_info *thread)
{
 return test_ti_thread_flag(thread, 22);
}
# 24 "./arch/arm64/include/asm/stat.h" 2





struct stat64 {
 compat_u64 st_dev;
 unsigned char __pad0[4];


 compat_ulong_t __st_ino;
 compat_uint_t st_mode;
 compat_uint_t st_nlink;

 compat_ulong_t st_uid;
 compat_ulong_t st_gid;

 compat_u64 st_rdev;
 unsigned char __pad3[4];

 compat_s64 st_size;
 compat_ulong_t st_blksize;
 compat_u64 st_blocks;

 compat_ulong_t st_atime;
 compat_ulong_t st_atime_nsec;

 compat_ulong_t st_mtime;
 compat_ulong_t st_mtime_nsec;

 compat_ulong_t st_ctime;
 compat_ulong_t st_ctime_nsec;

 compat_u64 st_ino;
};
# 7 "./include/linux/stat.h" 2
# 1 "./include/uapi/linux/stat.h" 1
# 56 "./include/uapi/linux/stat.h"
struct statx_timestamp {
 __s64 tv_sec;
 __u32 tv_nsec;
 __s32 __reserved;
};
# 99 "./include/uapi/linux/stat.h"
struct statx {

 __u32 stx_mask;
 __u32 stx_blksize;
 __u64 stx_attributes;

 __u32 stx_nlink;
 __u32 stx_uid;
 __u32 stx_gid;
 __u16 stx_mode;
 __u16 __spare0[1];

 __u64 stx_ino;
 __u64 stx_size;
 __u64 stx_blocks;
 __u64 stx_attributes_mask;

 struct statx_timestamp stx_atime;
 struct statx_timestamp stx_btime;
 struct statx_timestamp stx_ctime;
 struct statx_timestamp stx_mtime;

 __u32 stx_rdev_major;
 __u32 stx_rdev_minor;
 __u32 stx_dev_major;
 __u32 stx_dev_minor;

 __u64 __spare2[14];

};
# 8 "./include/linux/stat.h" 2
# 24 "./include/linux/stat.h"
struct kstat {
 u32 result_mask;
 umode_t mode;
 unsigned int nlink;
 uint32_t blksize;
 u64 attributes;
 u64 attributes_mask;







 u64 ino;
 dev_t dev;
 dev_t rdev;
 kuid_t uid;
 kgid_t gid;
 loff_t size;
 struct timespec atime;
 struct timespec mtime;
 struct timespec ctime;
 struct timespec btime;
 u64 blocks;
};
# 11 "./include/linux/module.h" 2


# 1 "./include/linux/kmod.h" 1
# 22 "./include/linux/kmod.h"
# 1 "./include/linux/umh.h" 1



# 1 "./include/linux/gfp.h" 1





# 1 "./include/linux/mmzone.h" 1
# 10 "./include/linux/mmzone.h"
# 1 "./include/linux/wait.h" 1
# 12 "./include/linux/wait.h"
# 1 "./include/uapi/linux/wait.h" 1
# 13 "./include/linux/wait.h" 2

typedef struct wait_queue_entry wait_queue_entry_t;

typedef int (*wait_queue_func_t)(struct wait_queue_entry *wq_entry, unsigned mode, int flags, void *key);
int default_wake_function(struct wait_queue_entry *wq_entry, unsigned mode, int flags, void *key);
# 27 "./include/linux/wait.h"
struct wait_queue_entry {
 unsigned int flags;
 void *private;
 wait_queue_func_t func;
 struct list_head entry;
};

struct wait_queue_head {
 spinlock_t lock;
 struct list_head head;
};
typedef struct wait_queue_head wait_queue_head_t;

struct task_struct;
# 61 "./include/linux/wait.h"
extern void __init_waitqueue_head(struct wait_queue_head *wq_head, const char *name, struct lock_class_key *);
# 79 "./include/linux/wait.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void init_waitqueue_entry(struct wait_queue_entry *wq_entry, struct task_struct *p)
{
 wq_entry->flags = 0;
 wq_entry->private = p;
 wq_entry->func = default_wake_function;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
init_waitqueue_func_entry(struct wait_queue_entry *wq_entry, wait_queue_func_t func)
{
 wq_entry->flags = 0;
 wq_entry->private = ((void *)0);
 wq_entry->func = func;
}
# 124 "./include/linux/wait.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int waitqueue_active(struct wait_queue_head *wq_head)
{
 return !list_empty(&wq_head->head);
}
# 137 "./include/linux/wait.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool wq_has_sleeper(struct wait_queue_head *wq_head)
{







 asm volatile("dmb " "ish" : : : "memory");
 return waitqueue_active(wq_head);
}

extern void add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
extern void add_wait_queue_exclusive(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
extern void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
{
 list_add(&wq_entry->entry, &wq_head->head);
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
__add_wait_queue_exclusive(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
{
 wq_entry->flags |= 0x01;
 __add_wait_queue(wq_head, wq_entry);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __add_wait_queue_entry_tail(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
{
 list_add_tail(&wq_entry->entry, &wq_head->head);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
__add_wait_queue_entry_tail_exclusive(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
{
 wq_entry->flags |= 0x01;
 __add_wait_queue_entry_tail(wq_head, wq_entry);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void
__remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
{
 list_del(&wq_entry->entry);
}

void __wake_up(struct wait_queue_head *wq_head, unsigned int mode, int nr, void *key);
void __wake_up_locked_key(struct wait_queue_head *wq_head, unsigned int mode, void *key);
void __wake_up_locked_key_bookmark(struct wait_queue_head *wq_head,
  unsigned int mode, void *key, wait_queue_entry_t *bookmark);
void __wake_up_sync_key(struct wait_queue_head *wq_head, unsigned int mode, int nr, void *key);
void __wake_up_locked(struct wait_queue_head *wq_head, unsigned int mode, int nr);
void __wake_up_sync(struct wait_queue_head *wq_head, unsigned int mode, int nr);
# 230 "./include/linux/wait.h"
extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
# 600 "./include/linux/wait.h"
extern int do_wait_intr(wait_queue_head_t *, wait_queue_entry_t *);
extern int do_wait_intr_irq(wait_queue_head_t *, wait_queue_entry_t *);
# 984 "./include/linux/wait.h"
void prepare_to_wait(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry, int state);
void prepare_to_wait_exclusive(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry, int state);
long prepare_to_wait_event(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry, int state);
void finish_wait(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
long wait_woken(struct wait_queue_entry *wq_entry, unsigned mode, long timeout);
int woken_wake_function(struct wait_queue_entry *wq_entry, unsigned mode, int sync, void *key);
int autoremove_wake_function(struct wait_queue_entry *wq_entry, unsigned mode, int sync, void *key);
# 11 "./include/linux/mmzone.h" 2







# 1 "./include/linux/pageblock-flags.h" 1
# 29 "./include/linux/pageblock-flags.h"
enum pageblock_bits {
 PB_migrate,
 PB_migrate_end = PB_migrate + 3 - 1,

 PB_migrate_skip,





 NR_PAGEBLOCK_BITS
};
# 66 "./include/linux/pageblock-flags.h"
struct page;

unsigned long get_pfnblock_flags_mask(struct page *page,
    unsigned long pfn,
    unsigned long end_bitidx,
    unsigned long mask);

void set_pfnblock_flags_mask(struct page *page,
    unsigned long flags,
    unsigned long pfn,
    unsigned long end_bitidx,
    unsigned long mask);
# 19 "./include/linux/mmzone.h" 2
# 1 "./include/linux/page-flags-layout.h" 1





# 1 "./include/generated/bounds.h" 1
# 7 "./include/linux/page-flags-layout.h" 2
# 28 "./include/linux/page-flags-layout.h"
# 1 "./arch/arm64/include/asm/sparsemem.h" 1
# 29 "./include/linux/page-flags-layout.h" 2
# 20 "./include/linux/mmzone.h" 2
# 39 "./include/linux/mmzone.h"
enum migratetype {
 MIGRATE_UNMOVABLE,
 MIGRATE_MOVABLE,
 MIGRATE_RECLAIMABLE,
 MIGRATE_PCPTYPES,
 MIGRATE_HIGHATOMIC = MIGRATE_PCPTYPES,
# 59 "./include/linux/mmzone.h"
 MIGRATE_CMA,


 MIGRATE_ISOLATE,

 MIGRATE_TYPES
};


extern char * const migratetype_names[MIGRATE_TYPES];
# 78 "./include/linux/mmzone.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool is_migrate_movable(int mt)
{
 return __builtin_expect(!!((mt) == MIGRATE_CMA), 0) || mt == MIGRATE_MOVABLE;
}





extern int page_group_by_mobility_disabled;
# 96 "./include/linux/mmzone.h"
struct free_area {
 struct list_head free_list[MIGRATE_TYPES];
 unsigned long nr_free;
};

struct pglist_data;
# 110 "./include/linux/mmzone.h"
struct zone_padding {
 char x[0];
} __attribute__((__aligned__(1 << (7))));






enum numa_stat_item {
 NUMA_HIT,
 NUMA_MISS,
 NUMA_FOREIGN,
 NUMA_INTERLEAVE_HIT,
 NUMA_LOCAL,
 NUMA_OTHER,
 NR_VM_NUMA_STAT_ITEMS
};




enum zone_stat_item {

 NR_FREE_PAGES,
 NR_ZONE_LRU_BASE,
 NR_ZONE_INACTIVE_ANON = NR_ZONE_LRU_BASE,
 NR_ZONE_ACTIVE_ANON,
 NR_ZONE_INACTIVE_FILE,
 NR_ZONE_ACTIVE_FILE,
 NR_ZONE_UNEVICTABLE,
 NR_ZONE_WRITE_PENDING,
 NR_MLOCK,
 NR_PAGETABLE,
 NR_KERNEL_STACK_KB,

 NR_BOUNCE,



 NR_FREE_CMA_PAGES,
 NR_VM_ZONE_STAT_ITEMS };

enum node_stat_item {
 NR_LRU_BASE,
 NR_INACTIVE_ANON = NR_LRU_BASE,
 NR_ACTIVE_ANON,
 NR_INACTIVE_FILE,
 NR_ACTIVE_FILE,
 NR_UNEVICTABLE,
 NR_SLAB_RECLAIMABLE,
 NR_SLAB_UNRECLAIMABLE,
 NR_ISOLATED_ANON,
 NR_ISOLATED_FILE,
 WORKINGSET_REFAULT,
 WORKINGSET_ACTIVATE,
 WORKINGSET_NODERECLAIM,
 NR_ANON_MAPPED,
 NR_FILE_MAPPED,

 NR_FILE_PAGES,
 NR_FILE_DIRTY,
 NR_WRITEBACK,
 NR_WRITEBACK_TEMP,
 NR_SHMEM,
 NR_SHMEM_THPS,
 NR_SHMEM_PMDMAPPED,
 NR_ANON_THPS,
 NR_UNSTABLE_NFS,
 NR_VMSCAN_WRITE,
 NR_VMSCAN_IMMEDIATE,
 NR_DIRTIED,
 NR_WRITTEN,
 NR_INDIRECTLY_RECLAIMABLE_BYTES,
 NR_VM_NODE_STAT_ITEMS
};
# 200 "./include/linux/mmzone.h"
enum lru_list {
 LRU_INACTIVE_ANON = 0,
 LRU_ACTIVE_ANON = 0 + 1,
 LRU_INACTIVE_FILE = 0 + 2,
 LRU_ACTIVE_FILE = 0 + 2 + 1,
 LRU_UNEVICTABLE,
 NR_LRU_LISTS
};





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int is_file_lru(enum lru_list lru)
{
 return (lru == LRU_INACTIVE_FILE || lru == LRU_ACTIVE_FILE);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int is_active_lru(enum lru_list lru)
{
 return (lru == LRU_ACTIVE_ANON || lru == LRU_ACTIVE_FILE);
}

struct zone_reclaim_stat {
# 232 "./include/linux/mmzone.h"
 unsigned long recent_rotated[2];
 unsigned long recent_scanned[2];
};

struct lruvec {
 struct list_head lists[NR_LRU_LISTS];
 struct zone_reclaim_stat reclaim_stat;

 atomic_long_t inactive_age;

 unsigned long refaults;

 struct pglist_data *pgdat;

};
# 261 "./include/linux/mmzone.h"
typedef unsigned isolate_mode_t;

enum zone_watermarks {
 WMARK_MIN,
 WMARK_LOW,
 WMARK_HIGH,
 NR_WMARK
};





struct per_cpu_pages {
 int count;
 int high;
 int batch;


 struct list_head lists[MIGRATE_PCPTYPES];
};

struct per_cpu_pageset {
 struct per_cpu_pages pcp;

 s8 expire;
 u16 vm_numa_stat_diff[NR_VM_NUMA_STAT_ITEMS];


 s8 stat_threshold;
 s8 vm_stat_diff[NR_VM_ZONE_STAT_ITEMS];

};

struct per_cpu_nodestat {
 s8 stat_threshold;
 s8 vm_node_stat_diff[NR_VM_NODE_STAT_ITEMS];
};



enum zone_type {
# 322 "./include/linux/mmzone.h"
 ZONE_DMA,
# 337 "./include/linux/mmzone.h"
 ZONE_NORMAL,
# 349 "./include/linux/mmzone.h"
 ZONE_MOVABLE,



 __MAX_NR_ZONES

};



struct zone {



 unsigned long watermark[NR_WMARK];

 unsigned long nr_reserved_highatomic;
# 376 "./include/linux/mmzone.h"
 long lowmem_reserve[3];


 int node;

 struct pglist_data *zone_pgdat;
 struct per_cpu_pageset *pageset;
# 393 "./include/linux/mmzone.h"
 unsigned long zone_start_pfn;
# 436 "./include/linux/mmzone.h"
 unsigned long managed_pages;
 unsigned long spanned_pages;
 unsigned long present_pages;

 const char *name;







 unsigned long nr_isolate_pageblock;







 int initialized;


 struct zone_padding _pad1_;


 struct free_area free_area[14];


 unsigned long flags;


 spinlock_t lock;


 struct zone_padding _pad2_;






 unsigned long percpu_drift_mark;



 unsigned long compact_cached_free_pfn;

 unsigned long compact_cached_migrate_pfn[2];
# 493 "./include/linux/mmzone.h"
 unsigned int compact_considered;
 unsigned int compact_defer_shift;
 int compact_order_failed;




 bool compact_blockskip_flush;


 bool contiguous;

 struct zone_padding _pad3_;

 atomic_long_t vm_stat[NR_VM_ZONE_STAT_ITEMS];
 atomic_long_t vm_numa_stat[NR_VM_NUMA_STAT_ITEMS];
} __attribute__((__aligned__(1 << (7))));

enum pgdat_flags {
 PGDAT_CONGESTED,


 PGDAT_DIRTY,



 PGDAT_WRITEBACK,


 PGDAT_RECLAIM_LOCKED,
};

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long zone_end_pfn(const struct zone *zone)
{
 return zone->zone_start_pfn + zone->spanned_pages;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool zone_spans_pfn(const struct zone *zone, unsigned long pfn)
{
 return zone->zone_start_pfn <= pfn && pfn < zone_end_pfn(zone);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool zone_is_initialized(struct zone *zone)
{
 return zone->initialized;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool zone_is_empty(struct zone *zone)
{
 return zone->spanned_pages == 0;
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool zone_intersects(struct zone *zone,
  unsigned long start_pfn, unsigned long nr_pages)
{
 if (zone_is_empty(zone))
  return false;
 if (start_pfn >= zone_end_pfn(zone) ||
     start_pfn + nr_pages <= zone->zone_start_pfn)
  return false;

 return true;
}
# 571 "./include/linux/mmzone.h"
enum {
 ZONELIST_FALLBACK,





 ZONELIST_NOFALLBACK,

 MAX_ZONELISTS
};





struct zoneref {
 struct zone *zone;
 int zone_idx;
};
# 606 "./include/linux/mmzone.h"
struct zonelist {
 struct zoneref _zonerefs[((1 << 2) * 3) + 1];
};



extern struct page *mem_map;
# 623 "./include/linux/mmzone.h"
struct bootmem_data;
typedef struct pglist_data {
 struct zone node_zones[3];
 struct zonelist node_zonelists[MAX_ZONELISTS];
 int nr_zones;
# 650 "./include/linux/mmzone.h"
 unsigned long node_start_pfn;
 unsigned long node_present_pages;
 unsigned long node_spanned_pages;

 int node_id;
 wait_queue_head_t kswapd_wait;
 wait_queue_head_t pfmemalloc_wait;
 struct task_struct *kswapd;

 int kswapd_order;
 enum zone_type kswapd_classzone_idx;

 int kswapd_failures;


 int kcompactd_max_order;
 enum zone_type kcompactd_classzone_idx;
 wait_queue_head_t kcompactd_wait;
 struct task_struct *kcompactd;



 spinlock_t numabalancing_migrate_lock;


 unsigned long numabalancing_migrate_next_window;


 unsigned long numabalancing_migrate_nr_pages;





 unsigned long totalreserve_pages;





 unsigned long min_unmapped_pages;
 unsigned long min_slab_pages;



 struct zone_padding _pad1_;
 spinlock_t lru_lock;
# 709 "./include/linux/mmzone.h"
 spinlock_t split_queue_lock;
 struct list_head split_queue;
 unsigned long split_queue_len;



 struct lruvec lruvec;





 unsigned int inactive_ratio;

 unsigned long flags;

 struct zone_padding _pad2_;


 struct per_cpu_nodestat *per_cpu_nodestats;
 atomic_long_t vm_stat[NR_VM_NODE_STAT_ITEMS];
} pg_data_t;
# 743 "./include/linux/mmzone.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) spinlock_t *zone_lru_lock(struct zone *zone)
{
 return &zone->zone_pgdat->lru_lock;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct lruvec *node_lruvec(struct pglist_data *pgdat)
{
 return &pgdat->lruvec;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long pgdat_end_pfn(pg_data_t *pgdat)
{
 return pgdat->node_start_pfn + pgdat->node_spanned_pages;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool pgdat_is_empty(pg_data_t *pgdat)
{
 return !pgdat->node_start_pfn && !pgdat->node_spanned_pages;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int zone_id(const struct zone *zone)
{
 struct pglist_data *pgdat = zone->zone_pgdat;

 return zone - pgdat->node_zones;
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool is_dev_zone(const struct zone *zone)
{
 return false;
}


# 1 "./include/linux/memory_hotplug.h" 1




# 1 "./include/linux/mmzone.h" 1
# 6 "./include/linux/memory_hotplug.h" 2

# 1 "./include/linux/notifier.h" 1
# 15 "./include/linux/notifier.h"
# 1 "./include/linux/rwsem.h" 1
# 23 "./include/linux/rwsem.h"
struct rw_semaphore;






struct rw_semaphore {
 atomic_long_t count;
 struct list_head wait_list;
 raw_spinlock_t wait_lock;

 struct optimistic_spin_queue osq;




 struct task_struct *owner;




};







extern struct rw_semaphore *rwsem_down_read_failed(struct rw_semaphore *sem);
extern struct rw_semaphore *rwsem_down_read_failed_killable(struct rw_semaphore *sem);
extern struct rw_semaphore *rwsem_down_write_failed(struct rw_semaphore *sem);
extern struct rw_semaphore *rwsem_down_write_failed_killable(struct rw_semaphore *sem);
extern struct rw_semaphore *rwsem_wake(struct rw_semaphore *);
extern struct rw_semaphore *rwsem_downgrade_wake(struct rw_semaphore *sem);


# 1 "./arch/arm64/include/generated/asm/rwsem.h" 1
# 1 "./include/asm-generic/rwsem.h" 1
# 35 "./include/asm-generic/rwsem.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __down_read(struct rw_semaphore *sem)
{
 if (__builtin_expect(!!(atomic_long_inc_return_acquire(&sem->count) <= 0), 0))
  rwsem_down_read_failed(sem);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __down_read_trylock(struct rw_semaphore *sem)
{
 long tmp;

 while ((tmp = atomic_long_read(&sem->count)) >= 0) {
  if (tmp == (({ __typeof__(*(&(((atomic64_t *)(&sem->count))->counter))) __ret; __ret = (__typeof__(*(&(((atomic64_t *)(&sem->count))->counter)))) __cmpxchg_acq((&(((atomic64_t *)(&sem->count))->counter)), (unsigned long)(((tmp))), (unsigned long)(((tmp + 0x00000001L))), sizeof(*(&(((atomic64_t *)(&sem->count))->counter)))); __ret; }))
                                    ) {
   return 1;
  }
 }
 return 0;
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __down_write(struct rw_semaphore *sem)
{
 long tmp;

 tmp = atomic_long_add_return_acquire(((-0xffffffffL -1) + 0x00000001L),
          &sem->count);
 if (__builtin_expect(!!(tmp != ((-0xffffffffL -1) + 0x00000001L)), 0))
  rwsem_down_write_failed(sem);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __down_write_killable(struct rw_semaphore *sem)
{
 long tmp;

 tmp = atomic_long_add_return_acquire(((-0xffffffffL -1) + 0x00000001L),
          &sem->count);
 if (__builtin_expect(!!(tmp != ((-0xffffffffL -1) + 0x00000001L)), 0))
  if (IS_ERR(rwsem_down_write_failed_killable(sem)))
   return -4;
 return 0;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __down_write_trylock(struct rw_semaphore *sem)
{
 long tmp;

 tmp = (({ __typeof__(*(&(((atomic64_t *)(&sem->count))->counter))) __ret; __ret = (__typeof__(*(&(((atomic64_t *)(&sem->count))->counter)))) __cmpxchg_acq((&(((atomic64_t *)(&sem->count))->counter)), (unsigned long)(((0x00000000L))), (unsigned long)(((((-0xffffffffL -1) + 0x00000001L)))), sizeof(*(&(((atomic64_t *)(&sem->count))->counter)))); __ret; }))
                                ;
 return tmp == 0x00000000L;
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __up_read(struct rw_semaphore *sem)
{
 long tmp;

 tmp = atomic_long_dec_return_release(&sem->count);
 if (__builtin_expect(!!(tmp < -1 && (tmp & 0xffffffffL) == 0), 0))
  rwsem_wake(sem);
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __up_write(struct rw_semaphore *sem)
{
 if (__builtin_expect(!!(atomic_long_sub_return_release(((-0xffffffffL -1) + 0x00000001L), &sem->count) < 0), 0)
                           )
  rwsem_wake(sem);
}




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __downgrade_write(struct rw_semaphore *sem)
{
 long tmp;
# 124 "./include/asm-generic/rwsem.h"
 tmp = atomic_long_add_return_release(-(-0xffffffffL -1), &sem->count);
 if (tmp < 0)
  rwsem_downgrade_wake(sem);
}
# 1 "./arch/arm64/include/generated/asm/rwsem.h" 2
# 62 "./include/linux/rwsem.h" 2


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rwsem_is_locked(struct rw_semaphore *sem)
{
 return atomic_long_read(&sem->count) != 0;
}
# 96 "./include/linux/rwsem.h"
extern void __init_rwsem(struct rw_semaphore *sem, const char *name,
    struct lock_class_key *key);
# 112 "./include/linux/rwsem.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int rwsem_is_contended(struct rw_semaphore *sem)
{
 return !list_empty(&sem->wait_list);
}




extern void down_read(struct rw_semaphore *sem);




extern int down_read_trylock(struct rw_semaphore *sem);




extern void down_write(struct rw_semaphore *sem);
extern int __attribute__((warn_unused_result)) down_write_killable(struct rw_semaphore *sem);




extern int down_write_trylock(struct rw_semaphore *sem);




extern void up_read(struct rw_semaphore *sem);




extern void up_write(struct rw_semaphore *sem);




extern void downgrade_write(struct rw_semaphore *sem);
# 16 "./include/linux/notifier.h" 2
# 1 "./include/linux/srcu.h" 1
# 35 "./include/linux/srcu.h"
# 1 "./include/linux/rcu_segcblist.h" 1
# 31 "./include/linux/rcu_segcblist.h"
struct rcu_cblist {
 struct callback_head *head;
 struct callback_head **tail;
 long len;
 long len_lazy;
};
# 77 "./include/linux/rcu_segcblist.h"
struct rcu_segcblist {
 struct callback_head *head;
 struct callback_head **tails[4];
 unsigned long gp_seq[4];
 long len;
 long len_lazy;
};
# 36 "./include/linux/srcu.h" 2

struct srcu_struct;
# 54 "./include/linux/srcu.h"
int init_srcu_struct(struct srcu_struct *sp);







# 1 "./include/linux/srcutree.h" 1
# 27 "./include/linux/srcutree.h"
# 1 "./include/linux/rcu_node_tree.h" 1
# 28 "./include/linux/srcutree.h" 2
# 1 "./include/linux/completion.h" 1
# 29 "./include/linux/completion.h"
struct completion {
 unsigned int done;
 wait_queue_head_t wait;



};
# 63 "./include/linux/completion.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void complete_acquire(struct completion *x) {}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void complete_release(struct completion *x) {}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void complete_release_commit(struct completion *x) {}
# 117 "./include/linux/completion.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void __init_completion(struct completion *x)
{
 x->done = 0;
 do { static struct lock_class_key __key; __init_waitqueue_head((&x->wait), "&x->wait", &__key); } while (0);
}
# 130 "./include/linux/completion.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void reinit_completion(struct completion *x)
{
 x->done = 0;
}

extern void wait_for_completion(struct completion *);
extern void wait_for_completion_io(struct completion *);
extern int wait_for_completion_interruptible(struct completion *x);
extern int wait_for_completion_killable(struct completion *x);
extern unsigned long wait_for_completion_timeout(struct completion *x,
         unsigned long timeout);
extern unsigned long wait_for_completion_io_timeout(struct completion *x,
          unsigned long timeout);
extern long wait_for_completion_interruptible_timeout(
 struct completion *x, unsigned long timeout);
extern long wait_for_completion_killable_timeout(
 struct completion *x, unsigned long timeout);
extern bool try_wait_for_completion(struct completion *x);
extern bool completion_done(struct completion *x);

extern void complete(struct completion *);
extern void complete_all(struct completion *);
# 29 "./include/linux/srcutree.h" 2

struct srcu_node;
struct srcu_struct;





struct srcu_data {

 unsigned long srcu_lock_count[2];
 unsigned long srcu_unlock_count[2];


 raw_spinlock_t lock __attribute__((__aligned__(1 << (7))));
 struct rcu_segcblist srcu_cblist;
 unsigned long srcu_gp_seq_needed;
 unsigned long srcu_gp_seq_needed_exp;
 bool srcu_cblist_invoking;
 struct delayed_work work;
 struct callback_head srcu_barrier_head;
 struct srcu_node *mynode;
 unsigned long grpmask;

 int cpu;
 struct srcu_struct *sp;
};




struct srcu_node {
 raw_spinlock_t lock;
 unsigned long srcu_have_cbs[4];


 unsigned long srcu_data_have_cbs[4];

 unsigned long srcu_gp_seq_needed_exp;
 struct srcu_node *srcu_parent;
 int grplo;
 int grphi;
};




struct srcu_struct {
 struct srcu_node node[(1 + (((64) + ((16)) - 1) / ((16))))];
 struct srcu_node *level[2 + 1];

 struct mutex srcu_cb_mutex;
 raw_spinlock_t lock;
 struct mutex srcu_gp_mutex;
 unsigned int srcu_idx;
 unsigned long srcu_gp_seq;
 unsigned long srcu_gp_seq_needed;
 unsigned long srcu_gp_seq_needed_exp;
 unsigned long srcu_last_gp_end;
 struct srcu_data *sda;
 unsigned long srcu_barrier_seq;
 struct mutex srcu_barrier_mutex;
 struct completion srcu_barrier_completion;

 atomic_t srcu_barrier_cpu_cnt;


 struct delayed_work work;



};
# 140 "./include/linux/srcutree.h"
void synchronize_srcu_expedited(struct srcu_struct *sp);
void srcu_barrier(struct srcu_struct *sp);
void srcu_torture_stats_print(struct srcu_struct *sp, char *tt, char *tf);
# 63 "./include/linux/srcu.h" 2







void call_srcu(struct srcu_struct *sp, struct callback_head *head,
  void (*func)(struct callback_head *head));
void cleanup_srcu_struct(struct srcu_struct *sp);
int __srcu_read_lock(struct srcu_struct *sp) ;
void __srcu_read_unlock(struct srcu_struct *sp, int idx) ;
void synchronize_srcu(struct srcu_struct *sp);
# 104 "./include/linux/srcu.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int srcu_read_lock_held(struct srcu_struct *sp)
{
 return 1;
}
# 155 "./include/linux/srcu.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int srcu_read_lock(struct srcu_struct *sp)
{
 int retval;

 retval = __srcu_read_lock(sp);
 do { } while (0);
 return retval;
}
# 171 "./include/linux/srcu.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void srcu_read_unlock(struct srcu_struct *sp, int idx)

{
 do { } while (0);
 __srcu_read_unlock(sp, idx);
}
# 187 "./include/linux/srcu.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void smp_mb__after_srcu_read_unlock(void)
{

}
# 17 "./include/linux/notifier.h" 2
# 51 "./include/linux/notifier.h"
struct notifier_block;

typedef int (*notifier_fn_t)(struct notifier_block *nb,
   unsigned long action, void *data);

struct notifier_block {
 notifier_fn_t notifier_call;
 struct notifier_block *next;
 int priority;
};

struct atomic_notifier_head {
 spinlock_t lock;
 struct notifier_block *head;
};

struct blocking_notifier_head {
 struct rw_semaphore rwsem;
 struct notifier_block *head;
};

struct raw_notifier_head {
 struct notifier_block *head;
};

struct srcu_notifier_head {
 struct mutex mutex;
 struct srcu_struct srcu;
 struct notifier_block *head;
};
# 95 "./include/linux/notifier.h"
extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
# 121 "./include/linux/notifier.h"
extern int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
  struct notifier_block *nb);
extern int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
  struct notifier_block *nb);
extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
  struct notifier_block *nb);
extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
  struct notifier_block *nb);

extern int blocking_notifier_chain_cond_register(
  struct blocking_notifier_head *nh,
  struct notifier_block *nb);

extern int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
  struct notifier_block *nb);
extern int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
  struct notifier_block *nb);
extern int raw_notifier_chain_unregister(struct raw_notifier_head *nh,
  struct notifier_block *nb);
extern int srcu_notifier_chain_unregister(struct srcu_notifier_head *nh,
  struct notifier_block *nb);

extern int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
  unsigned long val, void *v);
extern int __atomic_notifier_call_chain(struct atomic_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
extern int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
  unsigned long val, void *v);
extern int __blocking_notifier_call_chain(struct blocking_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
extern int raw_notifier_call_chain(struct raw_notifier_head *nh,
  unsigned long val, void *v);
extern int __raw_notifier_call_chain(struct raw_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
extern int srcu_notifier_call_chain(struct srcu_notifier_head *nh,
  unsigned long val, void *v);
extern int __srcu_notifier_call_chain(struct srcu_notifier_head *nh,
 unsigned long val, void *v, int nr_to_call, int *nr_calls);
# 171 "./include/linux/notifier.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int notifier_from_errno(int err)
{
 if (err)
  return 0x8000 | (0x0001 - err);

 return 0x0001;
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int notifier_to_errno(int ret)
{
 ret &= ~0x8000;
 return ret > 0x0001 ? 0x0001 - ret : 0;
}
# 215 "./include/linux/notifier.h"
extern struct blocking_notifier_head reboot_notifier_list;
# 8 "./include/linux/memory_hotplug.h" 2


struct page;
struct zone;
struct pglist_data;
struct mem_section;
struct memory_block;
struct resource;
# 249 "./include/linux/memory_hotplug.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void pgdat_resize_lock(struct pglist_data *p, unsigned long *f) {}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void pgdat_resize_unlock(struct pglist_data *p, unsigned long *f) {}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void pgdat_resize_init(struct pglist_data *pgdat) {}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned zone_span_seqbegin(struct zone *zone)
{
 return 0;
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int zone_span_seqretry(struct zone *zone, unsigned iv)
{
 return 0;
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void zone_span_writelock(struct zone *zone) {}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void zone_span_writeunlock(struct zone *zone) {}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void zone_seqlock_init(struct zone *zone) {}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int mhp_notimplemented(const char *func)
{
 printk("\001" "4" "%s() called, with CONFIG_MEMORY_HOTPLUG disabled\n", func);
 dump_stack();
 return -38;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void register_page_bootmem_info_node(struct pglist_data *pgdat)
{
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int try_online_node(int nid)
{
 return 0;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void get_online_mems(void) {}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void put_online_mems(void) {}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void mem_hotplug_begin(void) {}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void mem_hotplug_done(void) {}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool movable_node_is_enabled(void)
{
 return false;
}
# 301 "./include/linux/memory_hotplug.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool is_mem_section_removable(unsigned long pfn,
     unsigned long nr_pages)
{
 return false;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void try_offline_node(int nid) {}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int offline_pages(unsigned long start_pfn, unsigned long nr_pages)
{
 return -22;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void remove_memory(int nid, u64 start, u64 size) {}


extern int walk_memory_range(unsigned long start_pfn, unsigned long end_pfn,
  void *arg, int (*func)(struct memory_block *, void *));
extern int add_memory(int nid, u64 start, u64 size);
extern int add_memory_resource(int nid, struct resource *resource, bool online);
extern int arch_add_memory(int nid, u64 start, u64 size, bool want_memblock);
extern void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
  unsigned long nr_pages);
extern int offline_pages(unsigned long start_pfn, unsigned long nr_pages);
extern bool is_memblock_offlined(struct memory_block *mem);
extern void remove_memory(int nid, u64 start, u64 size);
extern int sparse_add_one_section(struct pglist_data *pgdat, unsigned long start_pfn);
extern void sparse_remove_one_section(struct zone *zone, struct mem_section *ms,
  unsigned long map_offset);
extern struct page *sparse_decode_mem_map(unsigned long coded_mem_map,
       unsigned long pnum);
extern bool allow_online_pfn_range(int nid, unsigned long pfn, unsigned long nr_pages,
  int online_type);
extern struct zone *zone_for_pfn_range(int online_type, int nid, unsigned start_pfn,
  unsigned long nr_pages);
# 783 "./include/linux/mmzone.h" 2

void build_all_zonelists(pg_data_t *pgdat);
void wakeup_kswapd(struct zone *zone, int order, enum zone_type classzone_idx);
bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
    int classzone_idx, unsigned int alloc_flags,
    long free_pages);
bool zone_watermark_ok(struct zone *z, unsigned int order,
  unsigned long mark, int classzone_idx,
  unsigned int alloc_flags);
bool zone_watermark_ok_safe(struct zone *z, unsigned int order,
  unsigned long mark, int classzone_idx);
enum memmap_context {
 MEMMAP_EARLY,
 MEMMAP_HOTPLUG,
};
extern void init_currently_empty_zone(struct zone *zone, unsigned long start_pfn,
         unsigned long size);

extern void lruvec_init(struct lruvec *lruvec);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct pglist_data *lruvec_pgdat(struct lruvec *lruvec)
{

 return lruvec->pgdat;



}

extern unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru, int zone_idx);


void memory_present(int nid, unsigned long start, unsigned long end);







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int local_memory_node(int node_id) { return node_id; };
# 841 "./include/linux/mmzone.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool managed_zone(struct zone *zone)
{
 return zone->managed_pages;
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool populated_zone(struct zone *zone)
{
 return zone->present_pages;
}

extern int movable_zone;
# 865 "./include/linux/mmzone.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int is_highmem_idx(enum zone_type idx)
{




 return 0;

}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int is_highmem(struct zone *zone)
{



 return 0;

}


struct ctl_table;
int min_free_kbytes_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
int watermark_scale_factor_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
extern int sysctl_lowmem_reserve_ratio[3 -1];
int lowmem_reserve_ratio_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
int percpu_pagelist_fraction_sysctl_handler(struct ctl_table *, int,
     void *, size_t *, loff_t *);
int sysctl_min_unmapped_ratio_sysctl_handler(struct ctl_table *, int,
   void *, size_t *, loff_t *);
int sysctl_min_slab_ratio_sysctl_handler(struct ctl_table *, int,
   void *, size_t *, loff_t *);

extern int numa_zonelist_order_handler(struct ctl_table *, int,
   void *, size_t *, loff_t *);
extern char numa_zonelist_order[];
# 919 "./include/linux/mmzone.h"
# 1 "./arch/arm64/include/asm/mmzone.h" 1






# 1 "./arch/arm64/include/asm/numa.h" 1




# 1 "./arch/arm64/include/asm/topology.h" 1






struct cpu_topology {
 int thread_id;
 int core_id;
 int cluster_id;
 cpumask_t thread_sibling;
 cpumask_t core_sibling;
};

extern struct cpu_topology cpu_topology[64];






void init_cpu_topology(void);
void store_cpu_topology(unsigned int cpuid);
const struct cpumask *cpu_coregroup_mask(int cpu);



struct pci_bus;
int pcibus_to_node(struct pci_bus *bus);






# 1 "./include/asm-generic/topology.h" 1
# 37 "./arch/arm64/include/asm/topology.h" 2
# 6 "./arch/arm64/include/asm/numa.h" 2





int __node_distance(int from, int to);


extern nodemask_t numa_nodes_parsed __attribute__ ((__section__(".init.data")));

extern bool numa_off;


extern cpumask_var_t node_to_cpumask_map[(1 << 2)];
void numa_clear_node(unsigned int cpu);





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) const struct cpumask *cpumask_of_node(int node)
{
 return node_to_cpumask_map[node];
}


void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) arm64_numa_init(void);
int __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) numa_add_memblk(int nodeid, u64 start, u64 end);
void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) numa_set_distance(int from, int to, int distance);
void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) numa_free_distance(void);
void __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) early_map_cpu_to_node(unsigned int cpu, int nid);
void numa_store_cpu_info(unsigned int cpu);
# 8 "./arch/arm64/include/asm/mmzone.h" 2

extern struct pglist_data *node_data[];
# 920 "./include/linux/mmzone.h" 2



extern struct pglist_data *first_online_pgdat(void);
extern struct pglist_data *next_online_pgdat(struct pglist_data *pgdat);
extern struct zone *next_zone(struct zone *zone);
# 955 "./include/linux/mmzone.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct zone *zonelist_zone(struct zoneref *zoneref)
{
 return zoneref->zone;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int zonelist_zone_idx(struct zoneref *zoneref)
{
 return zoneref->zone_idx;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int zonelist_node_idx(struct zoneref *zoneref)
{


 return zoneref->zone->node;



}

struct zoneref *__next_zones_zonelist(struct zoneref *z,
     enum zone_type highest_zoneidx,
     nodemask_t *nodes);
# 991 "./include/linux/mmzone.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) struct zoneref *next_zones_zonelist(struct zoneref *z,
     enum zone_type highest_zoneidx,
     nodemask_t *nodes)
{
 if (__builtin_expect(!!(!nodes && zonelist_zone_idx(z) <= highest_zoneidx), 1))
  return z;
 return __next_zones_zonelist(z, highest_zoneidx, nodes);
}
# 1016 "./include/linux/mmzone.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct zoneref *first_zones_zonelist(struct zonelist *zonelist,
     enum zone_type highest_zoneidx,
     nodemask_t *nodes)
{
 return next_zones_zonelist(zonelist->_zonerefs,
       highest_zoneidx, nodes);
}
# 1100 "./include/linux/mmzone.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long pfn_to_section_nr(unsigned long pfn)
{
 return pfn >> (30 - 12);
}
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long section_nr_to_pfn(unsigned long sec)
{
 return sec << (30 - 12);
}




struct page;
struct page_ext;
struct mem_section {
# 1127 "./include/linux/mmzone.h"
 unsigned long section_mem_map;


 unsigned long *pageblock_flags;
# 1143 "./include/linux/mmzone.h"
};
# 1156 "./include/linux/mmzone.h"
extern struct mem_section **mem_section;




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct mem_section *__nr_to_section(unsigned long nr)
{

 if (!mem_section)
  return ((void *)0);

 if (!mem_section[((nr) / (((1UL) << 12) / sizeof (struct mem_section)))])
  return ((void *)0);
 return &mem_section[((nr) / (((1UL) << 12) / sizeof (struct mem_section)))][nr & ((((1UL) << 12) / sizeof (struct mem_section)) - 1)];
}
extern int __section_nr(struct mem_section* ms);
extern unsigned long usemap_size(void);
# 1186 "./include/linux/mmzone.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct page *__section_mem_map_addr(struct mem_section *section)
{
 unsigned long map = section->section_mem_map;
 map &= (~((1UL<<3)-1));
 return (struct page *)map;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int present_section(struct mem_section *section)
{
 return (section && (section->section_mem_map & (1UL<<0)));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int present_section_nr(unsigned long nr)
{
 return present_section(__nr_to_section(nr));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int valid_section(struct mem_section *section)
{
 return (section && (section->section_mem_map & (1UL<<1)));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int valid_section_nr(unsigned long nr)
{
 return valid_section(__nr_to_section(nr));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int online_section(struct mem_section *section)
{
 return (section && (section->section_mem_map & (1UL<<2)));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int online_section_nr(unsigned long nr)
{
 return online_section(__nr_to_section(nr));
}
# 1230 "./include/linux/mmzone.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct mem_section *__pfn_to_section(unsigned long pfn)
{
 return __nr_to_section(pfn_to_section_nr(pfn));
}

extern int __highest_present_section_nr;
# 1246 "./include/linux/mmzone.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int pfn_present(unsigned long pfn)
{
 if (pfn_to_section_nr(pfn) >= (1UL << (48 - 30)))
  return 0;
 return present_section(__nr_to_section(pfn_to_section_nr(pfn)));
}
# 1269 "./include/linux/mmzone.h"
void sparse_init(void);
# 1280 "./include/linux/mmzone.h"
struct mminit_pfnnid_cache {
 unsigned long last_start;
 unsigned long last_end;
 int last_nid;
};





void memory_present(int nid, unsigned long start, unsigned long end);
unsigned long __attribute__ ((__section__(".init.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) node_memmap_size_bytes(int, unsigned long, unsigned long);
# 1326 "./include/linux/mmzone.h"
bool memmap_valid_within(unsigned long pfn,
     struct page *page, struct zone *zone);
# 7 "./include/linux/gfp.h" 2


# 1 "./include/linux/topology.h" 1
# 45 "./include/linux/topology.h"
int arch_update_cpu_topology(void);
# 67 "./include/linux/topology.h"
extern __attribute__((section(".data..percpu" ""))) __typeof__(int) numa_node;



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int numa_node_id(void)
{
 return ({ typeof(numa_node) pscr_ret__; do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(numa_node)) { case 1: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(numa_node))) *)(&(numa_node)))); (typeof((typeof(*(&(numa_node))) *)(&(numa_node)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; case 2: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(numa_node))) *)(&(numa_node)))); (typeof((typeof(*(&(numa_node))) *)(&(numa_node)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; case 4: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(numa_node))) *)(&(numa_node)))); (typeof((typeof(*(&(numa_node))) *)(&(numa_node)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; case 8: pscr_ret__ = ({ *({ do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(numa_node))) *)(&(numa_node)))); (typeof((typeof(*(&(numa_node))) *)(&(numa_node)))) (__ptr + ((__my_cpu_offset()))); }); }); }); break; default: __bad_size_call_parameter(); break; } pscr_ret__; });
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int cpu_to_node(int cpu)
{
 return (*({ do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*((&(numa_node)))) *)((&(numa_node))))); (typeof((typeof(*((&(numa_node)))) *)((&(numa_node))))) (__ptr + (((__per_cpu_offset[(cpu)])))); }); }));
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void set_numa_node(int node)
{
 do { do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); switch(sizeof(numa_node)) { case 1: do { do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0); __percpu_write(({ do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(numa_node))) *)(&(numa_node)))); (typeof((typeof(*(&(numa_node))) *)(&(numa_node)))) (__ptr + ((__my_cpu_offset()))); }); }), (unsigned long)(node), sizeof(numa_node)); do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule_notrace(); } while (0); } while(0);break; case 2: do { do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0); __percpu_write(({ do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(numa_node))) *)(&(numa_node)))); (typeof((typeof(*(&(numa_node))) *)(&(numa_node)))) (__ptr + ((__my_cpu_offset()))); }); }), (unsigned long)(node), sizeof(numa_node)); do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule_notrace(); } while (0); } while(0);break; case 4: do { do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0); __percpu_write(({ do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(numa_node))) *)(&(numa_node)))); (typeof((typeof(*(&(numa_node))) *)(&(numa_node)))) (__ptr + ((__my_cpu_offset()))); }); }), (unsigned long)(node), sizeof(numa_node)); do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule_notrace(); } while (0); } while(0);break; case 8: do { do { __preempt_count_add(1); __asm__ __volatile__("": : :"memory"); } while (0); __percpu_write(({ do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*(&(numa_node))) *)(&(numa_node)))); (typeof((typeof(*(&(numa_node))) *)(&(numa_node)))) (__ptr + ((__my_cpu_offset()))); }); }), (unsigned long)(node), sizeof(numa_node)); do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule_notrace(); } while (0); } while(0);break; default: __bad_size_call_parameter();break; } } while (0);
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void set_cpu_numa_node(int cpu, int node)
{
 (*({ do { const void *__vpp_verify = (typeof((&(numa_node)) + 0))((void *)0); (void)__vpp_verify; } while (0); ({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"((typeof(*((&(numa_node)))) *)((&(numa_node))))); (typeof((typeof(*((&(numa_node)))) *)((&(numa_node))))) (__ptr + (((__per_cpu_offset[(cpu)])))); }); })) = node;
}
# 162 "./include/linux/topology.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int numa_mem_id(void)
{
 return numa_node_id();
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int node_to_mem_node(int node)
{
 return node;
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int cpu_to_mem(int cpu)
{
 return cpu_to_node(cpu);
}
# 204 "./include/linux/topology.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) const struct cpumask *cpu_cpu_mask(int cpu)
{
 return cpumask_of_node(cpu_to_node(cpu));
}
# 10 "./include/linux/gfp.h" 2

struct vm_area_struct;
# 296 "./include/linux/gfp.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int gfpflags_to_migratetype(const gfp_t gfp_flags)
{
 ((void)(sizeof(( long)((gfp_flags & ((( gfp_t)0x10u)|(( gfp_t)0x08u))) == ((( gfp_t)0x10u)|(( gfp_t)0x08u))))));
 do { bool __cond = !(!((1UL << 3) != 0x08u)); extern void __compiletime_assert_299(void) __attribute__((error("BUILD_BUG_ON failed: " "(1UL << GFP_MOVABLE_SHIFT) != ___GFP_MOVABLE"))); if (__cond) __compiletime_assert_299(); do { } while (0); } while (0);
 do { bool __cond = !(!((0x08u >> 3) != MIGRATE_MOVABLE)); extern void __compiletime_assert_300(void) __attribute__((error("BUILD_BUG_ON failed: " "(___GFP_MOVABLE >> GFP_MOVABLE_SHIFT) != MIGRATE_MOVABLE"))); if (__cond) __compiletime_assert_300(); do { } while (0); } while (0);

 if (__builtin_expect(!!(page_group_by_mobility_disabled), 0))
  return MIGRATE_UNMOVABLE;


 return (gfp_flags & ((( gfp_t)0x10u)|(( gfp_t)0x08u))) >> 3;
}



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool gfpflags_allow_blocking(const gfp_t gfp_flags)
{
 return !!(gfp_flags & (( gfp_t)0x400000u));
}
# 406 "./include/linux/gfp.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) enum zone_type gfp_zone(gfp_t flags)
{
 enum zone_type z;
 int bit = ( int) (flags & ((( gfp_t)0x01u)|(( gfp_t)0x02u)|(( gfp_t)0x04u)|(( gfp_t)0x08u)));

 z = (( (ZONE_NORMAL << 0 * 2) | (ZONE_DMA << 0x01u * 2) | (ZONE_NORMAL << 0x02u * 2) | (ZONE_NORMAL << 0x04u * 2) | (ZONE_NORMAL << 0x08u * 2) | (ZONE_DMA << (0x08u | 0x01u) * 2) | (ZONE_MOVABLE << (0x08u | 0x02u) * 2) | (ZONE_NORMAL << (0x08u | 0x04u) * 2)) >> (bit * 2)) &
      ((1 << 2) - 1);
 ((void)(sizeof(( long)((( 1 << (0x01u | 0x02u) | 1 << (0x01u | 0x04u) | 1 << (0x04u | 0x02u) | 1 << (0x01u | 0x04u | 0x02u) | 1 << (0x08u | 0x02u | 0x01u) | 1 << (0x08u | 0x04u | 0x01u) | 1 << (0x08u | 0x04u | 0x02u) | 1 << (0x08u | 0x04u | 0x01u | 0x02u) ) >> bit) & 1))));
 return z;
}
# 424 "./include/linux/gfp.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int gfp_zonelist(gfp_t flags)
{

 if (__builtin_expect(!!(flags & (( gfp_t)0x40000u)), 0))
  return ZONELIST_NOFALLBACK;

 return ZONELIST_FALLBACK;
}
# 442 "./include/linux/gfp.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct zonelist *node_zonelist(int nid, gfp_t flags)
{
 return (node_data[(nid)])->node_zonelists + gfp_zonelist(flags);
}


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void arch_free_page(struct page *page, int order) { }


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void arch_alloc_page(struct page *page, int order) { }


struct page *
__alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
       nodemask_t *nodemask);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct page *
__alloc_pages(gfp_t gfp_mask, unsigned int order, int preferred_nid)
{
 return __alloc_pages_nodemask(gfp_mask, order, preferred_nid, ((void *)0));
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct page *
__alloc_pages_node(int nid, gfp_t gfp_mask, unsigned int order)
{
 ((void)(sizeof(( long)(nid < 0 || nid >= (1 << 2)))));
 ((void)(sizeof(( long)(!node_state((nid), N_ONLINE)))));

 return __alloc_pages(gfp_mask, order, nid);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct page *alloc_pages_node(int nid, gfp_t gfp_mask,
      unsigned int order)
{
 if (nid == (-1))
  nid = numa_mem_id();

 return __alloc_pages_node(nid, gfp_mask, order);
}


extern struct page *alloc_pages_current(gfp_t gfp_mask, unsigned order);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct page *
alloc_pages(gfp_t gfp_mask, unsigned int order)
{
 return alloc_pages_current(gfp_mask, order);
}
extern struct page *alloc_pages_vma(gfp_t gfp_mask, int order,
   struct vm_area_struct *vma, unsigned long addr,
   int node, bool hugepage);
# 518 "./include/linux/gfp.h"
extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order);
extern unsigned long get_zeroed_page(gfp_t gfp_mask);

void *alloc_pages_exact(size_t size, gfp_t gfp_mask);
void free_pages_exact(void *virt, size_t size);
void * __attribute__ ((__section__(".meminit.text"))) __attribute__((__cold__)) __attribute__((no_instrument_function)) alloc_pages_exact_nid(int nid, size_t size, gfp_t gfp_mask);







extern void __free_pages(struct page *page, unsigned int order);
extern void free_pages(unsigned long addr, unsigned int order);
extern void free_hot_cold_page(struct page *page, bool cold);
extern void free_hot_cold_page_list(struct list_head *list, bool cold);

struct page_frag_cache;
extern void __page_frag_cache_drain(struct page *page, unsigned int count);
extern void *page_frag_alloc(struct page_frag_cache *nc,
        unsigned int fragsz, gfp_t gfp_mask);
extern void page_frag_free(void *addr);




void page_alloc_init(void);
void drain_zone_pages(struct zone *zone, struct per_cpu_pages *pcp);
void drain_all_pages(struct zone *zone);
void drain_local_pages(struct zone *zone);

void page_alloc_init_late(void);
# 559 "./include/linux/gfp.h"
extern gfp_t gfp_allowed_mask;


bool gfp_pfmemalloc_allowed(gfp_t gfp_mask);

extern void pm_restrict_gfp_mask(void);
extern void pm_restore_gfp_mask(void);


extern bool pm_suspended_storage(void);
# 578 "./include/linux/gfp.h"
extern int alloc_contig_range(unsigned long start, unsigned long end,
         unsigned migratetype, gfp_t gfp_mask);
extern void free_contig_range(unsigned long pfn, unsigned nr_pages);




extern void init_cma_reserved_pageblock(struct page *page);
# 5 "./include/linux/umh.h" 2




# 1 "./include/linux/sysctl.h" 1
# 30 "./include/linux/sysctl.h"
# 1 "./include/uapi/linux/sysctl.h" 1
# 35 "./include/uapi/linux/sysctl.h"
struct __sysctl_args {
 int *name;
 int nlen;
 void *oldval;
 size_t *oldlenp;
 void *newval;
 size_t newlen;
 unsigned long __unused[4];
};





enum
{
 CTL_KERN=1,
 CTL_VM=2,
 CTL_NET=3,
 CTL_PROC=4,
 CTL_FS=5,
 CTL_DEBUG=6,
 CTL_DEV=7,
 CTL_BUS=8,
 CTL_ABI=9,
 CTL_CPU=10,
 CTL_ARLAN=254,
 CTL_S390DBF=5677,
 CTL_SUNRPC=7249,
 CTL_PM=9899,
 CTL_FRV=9898,
};


enum
{
 CTL_BUS_ISA=1
};


enum
{
 INOTIFY_MAX_USER_INSTANCES=1,
 INOTIFY_MAX_USER_WATCHES=2,
 INOTIFY_MAX_QUEUED_EVENTS=3
};


enum
{
 KERN_OSTYPE=1,
 KERN_OSRELEASE=2,
 KERN_OSREV=3,
 KERN_VERSION=4,
 KERN_SECUREMASK=5,
 KERN_PROF=6,
 KERN_NODENAME=7,
 KERN_DOMAINNAME=8,

 KERN_PANIC=15,
 KERN_REALROOTDEV=16,

 KERN_SPARC_REBOOT=21,
 KERN_CTLALTDEL=22,
 KERN_PRINTK=23,
 KERN_NAMETRANS=24,
 KERN_PPC_HTABRECLAIM=25,
 KERN_PPC_ZEROPAGED=26,
 KERN_PPC_POWERSAVE_NAP=27,
 KERN_MODPROBE=28,
 KERN_SG_BIG_BUFF=29,
 KERN_ACCT=30,
 KERN_PPC_L2CR=31,

 KERN_RTSIGNR=32,
 KERN_RTSIGMAX=33,

 KERN_SHMMAX=34,
 KERN_MSGMAX=35,
 KERN_MSGMNB=36,
 KERN_MSGPOOL=37,
 KERN_SYSRQ=38,
 KERN_MAX_THREADS=39,
  KERN_RANDOM=40,
  KERN_SHMALL=41,
  KERN_MSGMNI=42,
  KERN_SEM=43,
  KERN_SPARC_STOP_A=44,
  KERN_SHMMNI=45,
 KERN_OVERFLOWUID=46,
 KERN_OVERFLOWGID=47,
 KERN_SHMPATH=48,
 KERN_HOTPLUG=49,
 KERN_IEEE_EMULATION_WARNINGS=50,
 KERN_S390_USER_DEBUG_LOGGING=51,
 KERN_CORE_USES_PID=52,
 KERN_TAINTED=53,
 KERN_CADPID=54,
 KERN_PIDMAX=55,
   KERN_CORE_PATTERN=56,
 KERN_PANIC_ON_OOPS=57,
 KERN_HPPA_PWRSW=58,
 KERN_HPPA_UNALIGNED=59,
 KERN_PRINTK_RATELIMIT=60,
 KERN_PRINTK_RATELIMIT_BURST=61,
 KERN_PTY=62,
 KERN_NGROUPS_MAX=63,
 KERN_SPARC_SCONS_PWROFF=64,
 KERN_HZ_TIMER=65,
 KERN_UNKNOWN_NMI_PANIC=66,
 KERN_BOOTLOADER_TYPE=67,
 KERN_RANDOMIZE=68,
 KERN_SETUID_DUMPABLE=69,
 KERN_SPIN_RETRY=70,
 KERN_ACPI_VIDEO_FLAGS=71,
 KERN_IA64_UNALIGNED=72,
 KERN_COMPAT_LOG=73,
 KERN_MAX_LOCK_DEPTH=74,
 KERN_NMI_WATCHDOG=75,
 KERN_PANIC_ON_NMI=76,
 KERN_PANIC_ON_WARN=77,
};




enum
{
 VM_UNUSED1=1,
 VM_UNUSED2=2,
 VM_UNUSED3=3,
 VM_UNUSED4=4,
 VM_OVERCOMMIT_MEMORY=5,
 VM_UNUSED5=6,
 VM_UNUSED7=7,
 VM_UNUSED8=8,
 VM_UNUSED9=9,
 VM_PAGE_CLUSTER=10,
 VM_DIRTY_BACKGROUND=11,
 VM_DIRTY_RATIO=12,
 VM_DIRTY_WB_CS=13,
 VM_DIRTY_EXPIRE_CS=14,
 VM_NR_PDFLUSH_THREADS=15,
 VM_OVERCOMMIT_RATIO=16,
 VM_PAGEBUF=17,
 VM_HUGETLB_PAGES=18,
 VM_SWAPPINESS=19,
 VM_LOWMEM_RESERVE_RATIO=20,
 VM_MIN_FREE_KBYTES=21,
 VM_MAX_MAP_COUNT=22,
 VM_LAPTOP_MODE=23,
 VM_BLOCK_DUMP=24,
 VM_HUGETLB_GROUP=25,
 VM_VFS_CACHE_PRESSURE=26,
 VM_LEGACY_VA_LAYOUT=27,
 VM_SWAP_TOKEN_TIMEOUT=28,
 VM_DROP_PAGECACHE=29,
 VM_PERCPU_PAGELIST_FRACTION=30,
 VM_ZONE_RECLAIM_MODE=31,
 VM_MIN_UNMAPPED=32,
 VM_PANIC_ON_OOM=33,
 VM_VDSO_ENABLED=34,
 VM_MIN_SLAB=35,
};



enum
{
 NET_CORE=1,
 NET_ETHER=2,
 NET_802=3,
 NET_UNIX=4,
 NET_IPV4=5,
 NET_IPX=6,
 NET_ATALK=7,
 NET_NETROM=8,
 NET_AX25=9,
 NET_BRIDGE=10,
 NET_ROSE=11,
 NET_IPV6=12,
 NET_X25=13,
 NET_TR=14,
 NET_DECNET=15,
 NET_ECONET=16,
 NET_SCTP=17,
 NET_LLC=18,
 NET_NETFILTER=19,
 NET_DCCP=20,
 NET_IRDA=412,
};


enum
{
 RANDOM_POOLSIZE=1,
 RANDOM_ENTROPY_COUNT=2,
 RANDOM_READ_THRESH=3,
 RANDOM_WRITE_THRESH=4,
 RANDOM_BOOT_ID=5,
 RANDOM_UUID=6
};


enum
{
 PTY_MAX=1,
 PTY_NR=2
};


enum
{
 BUS_ISA_MEM_BASE=1,
 BUS_ISA_PORT_BASE=2,
 BUS_ISA_PORT_SHIFT=3
};


enum
{
 NET_CORE_WMEM_MAX=1,
 NET_CORE_RMEM_MAX=2,
 NET_CORE_WMEM_DEFAULT=3,
 NET_CORE_RMEM_DEFAULT=4,

 NET_CORE_MAX_BACKLOG=6,
 NET_CORE_FASTROUTE=7,
 NET_CORE_MSG_COST=8,
 NET_CORE_MSG_BURST=9,
 NET_CORE_OPTMEM_MAX=10,
 NET_CORE_HOT_LIST_LENGTH=11,
 NET_CORE_DIVERT_VERSION=12,
 NET_CORE_NO_CONG_THRESH=13,
 NET_CORE_NO_CONG=14,
 NET_CORE_LO_CONG=15,
 NET_CORE_MOD_CONG=16,
 NET_CORE_DEV_WEIGHT=17,
 NET_CORE_SOMAXCONN=18,
 NET_CORE_BUDGET=19,
 NET_CORE_AEVENT_ETIME=20,
 NET_CORE_AEVENT_RSEQTH=21,
 NET_CORE_WARNINGS=22,
};







enum
{
 NET_UNIX_DESTROY_DELAY=1,
 NET_UNIX_DELETE_DELAY=2,
 NET_UNIX_MAX_DGRAM_QLEN=3,
};


enum
{
 NET_NF_CONNTRACK_MAX=1,
 NET_NF_CONNTRACK_TCP_TIMEOUT_SYN_SENT=2,
 NET_NF_CONNTRACK_TCP_TIMEOUT_SYN_RECV=3,
 NET_NF_CONNTRACK_TCP_TIMEOUT_ESTABLISHED=4,
 NET_NF_CONNTRACK_TCP_TIMEOUT_FIN_WAIT=5,
 NET_NF_CONNTRACK_TCP_TIMEOUT_CLOSE_WAIT=6,
 NET_NF_CONNTRACK_TCP_TIMEOUT_LAST_ACK=7,
 NET_NF_CONNTRACK_TCP_TIMEOUT_TIME_WAIT=8,
 NET_NF_CONNTRACK_TCP_TIMEOUT_CLOSE=9,
 NET_NF_CONNTRACK_UDP_TIMEOUT=10,
 NET_NF_CONNTRACK_UDP_TIMEOUT_STREAM=11,
 NET_NF_CONNTRACK_ICMP_TIMEOUT=12,
 NET_NF_CONNTRACK_GENERIC_TIMEOUT=13,
 NET_NF_CONNTRACK_BUCKETS=14,
 NET_NF_CONNTRACK_LOG_INVALID=15,
 NET_NF_CONNTRACK_TCP_TIMEOUT_MAX_RETRANS=16,
 NET_NF_CONNTRACK_TCP_LOOSE=17,
 NET_NF_CONNTRACK_TCP_BE_LIBERAL=18,
 NET_NF_CONNTRACK_TCP_MAX_RETRANS=19,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_CLOSED=20,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_WAIT=21,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_ECHOED=22,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_ESTABLISHED=23,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_SENT=24,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_RECD=25,
 NET_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_ACK_SENT=26,
 NET_NF_CONNTRACK_COUNT=27,
 NET_NF_CONNTRACK_ICMPV6_TIMEOUT=28,
 NET_NF_CONNTRACK_FRAG6_TIMEOUT=29,
 NET_NF_CONNTRACK_FRAG6_LOW_THRESH=30,
 NET_NF_CONNTRACK_FRAG6_HIGH_THRESH=31,
 NET_NF_CONNTRACK_CHECKSUM=32,
};


enum
{

 NET_IPV4_FORWARD=8,
 NET_IPV4_DYNADDR=9,

 NET_IPV4_CONF=16,
 NET_IPV4_NEIGH=17,
 NET_IPV4_ROUTE=18,
 NET_IPV4_FIB_HASH=19,
 NET_IPV4_NETFILTER=20,

 NET_IPV4_TCP_TIMESTAMPS=33,
 NET_IPV4_TCP_WINDOW_SCALING=34,
 NET_IPV4_TCP_SACK=35,
 NET_IPV4_TCP_RETRANS_COLLAPSE=36,
 NET_IPV4_DEFAULT_TTL=37,
 NET_IPV4_AUTOCONFIG=38,
 NET_IPV4_NO_PMTU_DISC=39,
 NET_IPV4_TCP_SYN_RETRIES=40,
 NET_IPV4_IPFRAG_HIGH_THRESH=41,
 NET_IPV4_IPFRAG_LOW_THRESH=42,
 NET_IPV4_IPFRAG_TIME=43,
 NET_IPV4_TCP_MAX_KA_PROBES=44,
 NET_IPV4_TCP_KEEPALIVE_TIME=45,
 NET_IPV4_TCP_KEEPALIVE_PROBES=46,
 NET_IPV4_TCP_RETRIES1=47,
 NET_IPV4_TCP_RETRIES2=48,
 NET_IPV4_TCP_FIN_TIMEOUT=49,
 NET_IPV4_IP_MASQ_DEBUG=50,
 NET_TCP_SYNCOOKIES=51,
 NET_TCP_STDURG=52,
 NET_TCP_RFC1337=53,
 NET_TCP_SYN_TAILDROP=54,
 NET_TCP_MAX_SYN_BACKLOG=55,
 NET_IPV4_LOCAL_PORT_RANGE=56,
 NET_IPV4_ICMP_ECHO_IGNORE_ALL=57,
 NET_IPV4_ICMP_ECHO_IGNORE_BROADCASTS=58,
 NET_IPV4_ICMP_SOURCEQUENCH_RATE=59,
 NET_IPV4_ICMP_DESTUNREACH_RATE=60,
 NET_IPV4_ICMP_TIMEEXCEED_RATE=61,
 NET_IPV4_ICMP_PARAMPROB_RATE=62,
 NET_IPV4_ICMP_ECHOREPLY_RATE=63,
 NET_IPV4_ICMP_IGNORE_BOGUS_ERROR_RESPONSES=64,
 NET_IPV4_IGMP_MAX_MEMBERSHIPS=65,
 NET_TCP_TW_RECYCLE=66,
 NET_IPV4_ALWAYS_DEFRAG=67,
 NET_IPV4_TCP_KEEPALIVE_INTVL=68,
 NET_IPV4_INET_PEER_THRESHOLD=69,
 NET_IPV4_INET_PEER_MINTTL=70,
 NET_IPV4_INET_PEER_MAXTTL=71,
 NET_IPV4_INET_PEER_GC_MINTIME=72,
 NET_IPV4_INET_PEER_GC_MAXTIME=73,
 NET_TCP_ORPHAN_RETRIES=74,
 NET_TCP_ABORT_ON_OVERFLOW=75,
 NET_TCP_SYNACK_RETRIES=76,
 NET_TCP_MAX_ORPHANS=77,
 NET_TCP_MAX_TW_BUCKETS=78,
 NET_TCP_FACK=79,
 NET_TCP_REORDERING=80,
 NET_TCP_ECN=81,
 NET_TCP_DSACK=82,
 NET_TCP_MEM=83,
 NET_TCP_WMEM=84,
 NET_TCP_RMEM=85,
 NET_TCP_APP_WIN=86,
 NET_TCP_ADV_WIN_SCALE=87,
 NET_IPV4_NONLOCAL_BIND=88,
 NET_IPV4_ICMP_RATELIMIT=89,
 NET_IPV4_ICMP_RATEMASK=90,
 NET_TCP_TW_REUSE=91,
 NET_TCP_FRTO=92,
 NET_TCP_LOW_LATENCY=93,
 NET_IPV4_IPFRAG_SECRET_INTERVAL=94,
 NET_IPV4_IGMP_MAX_MSF=96,
 NET_TCP_NO_METRICS_SAVE=97,
 NET_TCP_DEFAULT_WIN_SCALE=105,
 NET_TCP_MODERATE_RCVBUF=106,
 NET_TCP_TSO_WIN_DIVISOR=107,
 NET_TCP_BIC_BETA=108,
 NET_IPV4_ICMP_ERRORS_USE_INBOUND_IFADDR=109,
 NET_TCP_CONG_CONTROL=110,
 NET_TCP_ABC=111,
 NET_IPV4_IPFRAG_MAX_DIST=112,
  NET_TCP_MTU_PROBING=113,
 NET_TCP_BASE_MSS=114,
 NET_IPV4_TCP_WORKAROUND_SIGNED_WINDOWS=115,
 NET_TCP_DMA_COPYBREAK=116,
 NET_TCP_SLOW_START_AFTER_IDLE=117,
 NET_CIPSOV4_CACHE_ENABLE=118,
 NET_CIPSOV4_CACHE_BUCKET_SIZE=119,
 NET_CIPSOV4_RBM_OPTFMT=120,
 NET_CIPSOV4_RBM_STRICTVALID=121,
 NET_TCP_AVAIL_CONG_CONTROL=122,
 NET_TCP_ALLOWED_CONG_CONTROL=123,
 NET_TCP_MAX_SSTHRESH=124,
 NET_TCP_FRTO_RESPONSE=125,
};

enum {
 NET_IPV4_ROUTE_FLUSH=1,
 NET_IPV4_ROUTE_MIN_DELAY=2,
 NET_IPV4_ROUTE_MAX_DELAY=3,
 NET_IPV4_ROUTE_GC_THRESH=4,
 NET_IPV4_ROUTE_MAX_SIZE=5,
 NET_IPV4_ROUTE_GC_MIN_INTERVAL=6,
 NET_IPV4_ROUTE_GC_TIMEOUT=7,
 NET_IPV4_ROUTE_GC_INTERVAL=8,
 NET_IPV4_ROUTE_REDIRECT_LOAD=9,
 NET_IPV4_ROUTE_REDIRECT_NUMBER=10,
 NET_IPV4_ROUTE_REDIRECT_SILENCE=11,
 NET_IPV4_ROUTE_ERROR_COST=12,
 NET_IPV4_ROUTE_ERROR_BURST=13,
 NET_IPV4_ROUTE_GC_ELASTICITY=14,
 NET_IPV4_ROUTE_MTU_EXPIRES=15,
 NET_IPV4_ROUTE_MIN_PMTU=16,
 NET_IPV4_ROUTE_MIN_ADVMSS=17,
 NET_IPV4_ROUTE_SECRET_INTERVAL=18,
 NET_IPV4_ROUTE_GC_MIN_INTERVAL_MS=19,
};

enum
{
 NET_PROTO_CONF_ALL=-2,
 NET_PROTO_CONF_DEFAULT=-3


};

enum
{
 NET_IPV4_CONF_FORWARDING=1,
 NET_IPV4_CONF_MC_FORWARDING=2,
 NET_IPV4_CONF_PROXY_ARP=3,
 NET_IPV4_CONF_ACCEPT_REDIRECTS=4,
 NET_IPV4_CONF_SECURE_REDIRECTS=5,
 NET_IPV4_CONF_SEND_REDIRECTS=6,
 NET_IPV4_CONF_SHARED_MEDIA=7,
 NET_IPV4_CONF_RP_FILTER=8,
 NET_IPV4_CONF_ACCEPT_SOURCE_ROUTE=9,
 NET_IPV4_CONF_BOOTP_RELAY=10,
 NET_IPV4_CONF_LOG_MARTIANS=11,
 NET_IPV4_CONF_TAG=12,
 NET_IPV4_CONF_ARPFILTER=13,
 NET_IPV4_CONF_MEDIUM_ID=14,
 NET_IPV4_CONF_NOXFRM=15,
 NET_IPV4_CONF_NOPOLICY=16,
 NET_IPV4_CONF_FORCE_IGMP_VERSION=17,
 NET_IPV4_CONF_ARP_ANNOUNCE=18,
 NET_IPV4_CONF_ARP_IGNORE=19,
 NET_IPV4_CONF_PROMOTE_SECONDARIES=20,
 NET_IPV4_CONF_ARP_ACCEPT=21,
 NET_IPV4_CONF_ARP_NOTIFY=22,
};


enum
{
 NET_IPV4_NF_CONNTRACK_MAX=1,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_SYN_SENT=2,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_SYN_RECV=3,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_ESTABLISHED=4,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_FIN_WAIT=5,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_CLOSE_WAIT=6,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_LAST_ACK=7,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_TIME_WAIT=8,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_CLOSE=9,
 NET_IPV4_NF_CONNTRACK_UDP_TIMEOUT=10,
 NET_IPV4_NF_CONNTRACK_UDP_TIMEOUT_STREAM=11,
 NET_IPV4_NF_CONNTRACK_ICMP_TIMEOUT=12,
 NET_IPV4_NF_CONNTRACK_GENERIC_TIMEOUT=13,
 NET_IPV4_NF_CONNTRACK_BUCKETS=14,
 NET_IPV4_NF_CONNTRACK_LOG_INVALID=15,
 NET_IPV4_NF_CONNTRACK_TCP_TIMEOUT_MAX_RETRANS=16,
 NET_IPV4_NF_CONNTRACK_TCP_LOOSE=17,
 NET_IPV4_NF_CONNTRACK_TCP_BE_LIBERAL=18,
 NET_IPV4_NF_CONNTRACK_TCP_MAX_RETRANS=19,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_CLOSED=20,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_WAIT=21,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_COOKIE_ECHOED=22,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_ESTABLISHED=23,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_SENT=24,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_RECD=25,
  NET_IPV4_NF_CONNTRACK_SCTP_TIMEOUT_SHUTDOWN_ACK_SENT=26,
 NET_IPV4_NF_CONNTRACK_COUNT=27,
 NET_IPV4_NF_CONNTRACK_CHECKSUM=28,
};


enum {
 NET_IPV6_CONF=16,
 NET_IPV6_NEIGH=17,
 NET_IPV6_ROUTE=18,
 NET_IPV6_ICMP=19,
 NET_IPV6_BINDV6ONLY=20,
 NET_IPV6_IP6FRAG_HIGH_THRESH=21,
 NET_IPV6_IP6FRAG_LOW_THRESH=22,
 NET_IPV6_IP6FRAG_TIME=23,
 NET_IPV6_IP6FRAG_SECRET_INTERVAL=24,
 NET_IPV6_MLD_MAX_MSF=25,
};

enum {
 NET_IPV6_ROUTE_FLUSH=1,
 NET_IPV6_ROUTE_GC_THRESH=2,
 NET_IPV6_ROUTE_MAX_SIZE=3,
 NET_IPV6_ROUTE_GC_MIN_INTERVAL=4,
 NET_IPV6_ROUTE_GC_TIMEOUT=5,
 NET_IPV6_ROUTE_GC_INTERVAL=6,
 NET_IPV6_ROUTE_GC_ELASTICITY=7,
 NET_IPV6_ROUTE_MTU_EXPIRES=8,
 NET_IPV6_ROUTE_MIN_ADVMSS=9,
 NET_IPV6_ROUTE_GC_MIN_INTERVAL_MS=10
};

enum {
 NET_IPV6_FORWARDING=1,
 NET_IPV6_HOP_LIMIT=2,
 NET_IPV6_MTU=3,
 NET_IPV6_ACCEPT_RA=4,
 NET_IPV6_ACCEPT_REDIRECTS=5,
 NET_IPV6_AUTOCONF=6,
 NET_IPV6_DAD_TRANSMITS=7,
 NET_IPV6_RTR_SOLICITS=8,
 NET_IPV6_RTR_SOLICIT_INTERVAL=9,
 NET_IPV6_RTR_SOLICIT_DELAY=10,
 NET_IPV6_USE_TEMPADDR=11,
 NET_IPV6_TEMP_VALID_LFT=12,
 NET_IPV6_TEMP_PREFERED_LFT=13,
 NET_IPV6_REGEN_MAX_RETRY=14,
 NET_IPV6_MAX_DESYNC_FACTOR=15,
 NET_IPV6_MAX_ADDRESSES=16,
 NET_IPV6_FORCE_MLD_VERSION=17,
 NET_IPV6_ACCEPT_RA_DEFRTR=18,
 NET_IPV6_ACCEPT_RA_PINFO=19,
 NET_IPV6_ACCEPT_RA_RTR_PREF=20,
 NET_IPV6_RTR_PROBE_INTERVAL=21,
 NET_IPV6_ACCEPT_RA_RT_INFO_MAX_PLEN=22,
 NET_IPV6_PROXY_NDP=23,
 NET_IPV6_ACCEPT_SOURCE_ROUTE=25,
 NET_IPV6_ACCEPT_RA_FROM_LOCAL=26,
 NET_IPV6_ACCEPT_RA_RT_INFO_MIN_PLEN=27,
 __NET_IPV6_MAX
};


enum {
 NET_IPV6_ICMP_RATELIMIT=1
};


enum {
 NET_NEIGH_MCAST_SOLICIT=1,
 NET_NEIGH_UCAST_SOLICIT=2,
 NET_NEIGH_APP_SOLICIT=3,
 NET_NEIGH_RETRANS_TIME=4,
 NET_NEIGH_REACHABLE_TIME=5,
 NET_NEIGH_DELAY_PROBE_TIME=6,
 NET_NEIGH_GC_STALE_TIME=7,
 NET_NEIGH_UNRES_QLEN=8,
 NET_NEIGH_PROXY_QLEN=9,
 NET_NEIGH_ANYCAST_DELAY=10,
 NET_NEIGH_PROXY_DELAY=11,
 NET_NEIGH_LOCKTIME=12,
 NET_NEIGH_GC_INTERVAL=13,
 NET_NEIGH_GC_THRESH1=14,
 NET_NEIGH_GC_THRESH2=15,
 NET_NEIGH_GC_THRESH3=16,
 NET_NEIGH_RETRANS_TIME_MS=17,
 NET_NEIGH_REACHABLE_TIME_MS=18,
};


enum {
 NET_DCCP_DEFAULT=1,
};


enum {
 NET_IPX_PPROP_BROADCASTING=1,
 NET_IPX_FORWARDING=2
};


enum {
 NET_LLC2=1,
 NET_LLC_STATION=2,
};


enum {
 NET_LLC2_TIMEOUT=1,
};


enum {
 NET_LLC_STATION_ACK_TIMEOUT=1,
};


enum {
 NET_LLC2_ACK_TIMEOUT=1,
 NET_LLC2_P_TIMEOUT=2,
 NET_LLC2_REJ_TIMEOUT=3,
 NET_LLC2_BUSY_TIMEOUT=4,
};


enum {
 NET_ATALK_AARP_EXPIRY_TIME=1,
 NET_ATALK_AARP_TICK_TIME=2,
 NET_ATALK_AARP_RETRANSMIT_LIMIT=3,
 NET_ATALK_AARP_RESOLVE_TIME=4
};



enum {
 NET_NETROM_DEFAULT_PATH_QUALITY=1,
 NET_NETROM_OBSOLESCENCE_COUNT_INITIALISER=2,
 NET_NETROM_NETWORK_TTL_INITIALISER=3,
 NET_NETROM_TRANSPORT_TIMEOUT=4,
 NET_NETROM_TRANSPORT_MAXIMUM_TRIES=5,
 NET_NETROM_TRANSPORT_ACKNOWLEDGE_DELAY=6,
 NET_NETROM_TRANSPORT_BUSY_DELAY=7,
 NET_NETROM_TRANSPORT_REQUESTED_WINDOW_SIZE=8,
 NET_NETROM_TRANSPORT_NO_ACTIVITY_TIMEOUT=9,
 NET_NETROM_ROUTING_CONTROL=10,
 NET_NETROM_LINK_FAILS_COUNT=11,
 NET_NETROM_RESET=12
};


enum {
 NET_AX25_IP_DEFAULT_MODE=1,
 NET_AX25_DEFAULT_MODE=2,
 NET_AX25_BACKOFF_TYPE=3,
 NET_AX25_CONNECT_MODE=4,
 NET_AX25_STANDARD_WINDOW=5,
 NET_AX25_EXTENDED_WINDOW=6,
 NET_AX25_T1_TIMEOUT=7,
 NET_AX25_T2_TIMEOUT=8,
 NET_AX25_T3_TIMEOUT=9,
 NET_AX25_IDLE_TIMEOUT=10,
 NET_AX25_N2=11,
 NET_AX25_PACLEN=12,
 NET_AX25_PROTOCOL=13,
 NET_AX25_DAMA_SLAVE_TIMEOUT=14
};


enum {
 NET_ROSE_RESTART_REQUEST_TIMEOUT=1,
 NET_ROSE_CALL_REQUEST_TIMEOUT=2,
 NET_ROSE_RESET_REQUEST_TIMEOUT=3,
 NET_ROSE_CLEAR_REQUEST_TIMEOUT=4,
 NET_ROSE_ACK_HOLD_BACK_TIMEOUT=5,
 NET_ROSE_ROUTING_CONTROL=6,
 NET_ROSE_LINK_FAIL_TIMEOUT=7,
 NET_ROSE_MAX_VCS=8,
 NET_ROSE_WINDOW_SIZE=9,
 NET_ROSE_NO_ACTIVITY_TIMEOUT=10
};


enum {
 NET_X25_RESTART_REQUEST_TIMEOUT=1,
 NET_X25_CALL_REQUEST_TIMEOUT=2,
 NET_X25_RESET_REQUEST_TIMEOUT=3,
 NET_X25_CLEAR_REQUEST_TIMEOUT=4,
 NET_X25_ACK_HOLD_BACK_TIMEOUT=5,
 NET_X25_FORWARD=6
};


enum
{
 NET_TR_RIF_TIMEOUT=1
};


enum {
 NET_DECNET_NODE_TYPE = 1,
 NET_DECNET_NODE_ADDRESS = 2,
 NET_DECNET_NODE_NAME = 3,
 NET_DECNET_DEFAULT_DEVICE = 4,
 NET_DECNET_TIME_WAIT = 5,
 NET_DECNET_DN_COUNT = 6,
 NET_DECNET_DI_COUNT = 7,
 NET_DECNET_DR_COUNT = 8,
 NET_DECNET_DST_GC_INTERVAL = 9,
 NET_DECNET_CONF = 10,
 NET_DECNET_NO_FC_MAX_CWND = 11,
 NET_DECNET_MEM = 12,
 NET_DECNET_RMEM = 13,
 NET_DECNET_WMEM = 14,
 NET_DECNET_DEBUG_LEVEL = 255
};


enum {
 NET_DECNET_CONF_LOOPBACK = -2,
 NET_DECNET_CONF_DDCMP = -3,
 NET_DECNET_CONF_PPP = -4,
 NET_DECNET_CONF_X25 = -5,
 NET_DECNET_CONF_GRE = -6,
 NET_DECNET_CONF_ETHER = -7


};


enum {
 NET_DECNET_CONF_DEV_PRIORITY = 1,
 NET_DECNET_CONF_DEV_T1 = 2,
 NET_DECNET_CONF_DEV_T2 = 3,
 NET_DECNET_CONF_DEV_T3 = 4,
 NET_DECNET_CONF_DEV_FORWARDING = 5,
 NET_DECNET_CONF_DEV_BLKSIZE = 6,
 NET_DECNET_CONF_DEV_STATE = 7
};


enum {
 NET_SCTP_RTO_INITIAL = 1,
 NET_SCTP_RTO_MIN = 2,
 NET_SCTP_RTO_MAX = 3,
 NET_SCTP_RTO_ALPHA = 4,
 NET_SCTP_RTO_BETA = 5,
 NET_SCTP_VALID_COOKIE_LIFE = 6,
 NET_SCTP_ASSOCIATION_MAX_RETRANS = 7,
 NET_SCTP_PATH_MAX_RETRANS = 8,
 NET_SCTP_MAX_INIT_RETRANSMITS = 9,
 NET_SCTP_HB_INTERVAL = 10,
 NET_SCTP_PRESERVE_ENABLE = 11,
 NET_SCTP_MAX_BURST = 12,
 NET_SCTP_ADDIP_ENABLE = 13,
 NET_SCTP_PRSCTP_ENABLE = 14,
 NET_SCTP_SNDBUF_POLICY = 15,
 NET_SCTP_SACK_TIMEOUT = 16,
 NET_SCTP_RCVBUF_POLICY = 17,
};


enum {
 NET_BRIDGE_NF_CALL_ARPTABLES = 1,
 NET_BRIDGE_NF_CALL_IPTABLES = 2,
 NET_BRIDGE_NF_CALL_IP6TABLES = 3,
 NET_BRIDGE_NF_FILTER_VLAN_TAGGED = 4,
 NET_BRIDGE_NF_FILTER_PPPOE_TAGGED = 5,
};


enum {
 NET_IRDA_DISCOVERY=1,
 NET_IRDA_DEVNAME=2,
 NET_IRDA_DEBUG=3,
 NET_IRDA_FAST_POLL=4,
 NET_IRDA_DISCOVERY_SLOTS=5,
 NET_IRDA_DISCOVERY_TIMEOUT=6,
 NET_IRDA_SLOT_TIMEOUT=7,
 NET_IRDA_MAX_BAUD_RATE=8,
 NET_IRDA_MIN_TX_TURN_TIME=9,
 NET_IRDA_MAX_TX_DATA_SIZE=10,
 NET_IRDA_MAX_TX_WINDOW=11,
 NET_IRDA_MAX_NOREPLY_TIME=12,
 NET_IRDA_WARN_NOREPLY_TIME=13,
 NET_IRDA_LAP_KEEPALIVE_TIME=14,
};



enum
{
 FS_NRINODE=1,
 FS_STATINODE=2,
 FS_MAXINODE=3,
 FS_NRDQUOT=4,
 FS_MAXDQUOT=5,
 FS_NRFILE=6,
 FS_MAXFILE=7,
 FS_DENTRY=8,
 FS_NRSUPER=9,
 FS_MAXSUPER=10,
 FS_OVERFLOWUID=11,
 FS_OVERFLOWGID=12,
 FS_LEASES=13,
 FS_DIR_NOTIFY=14,
 FS_LEASE_TIME=15,
 FS_DQSTATS=16,
 FS_XFS=17,
 FS_AIO_NR=18,
 FS_AIO_MAX_NR=19,
 FS_INOTIFY=20,
 FS_OCFS2=988,
};


enum {
 FS_DQ_LOOKUPS = 1,
 FS_DQ_DROPS = 2,
 FS_DQ_READS = 3,
 FS_DQ_WRITES = 4,
 FS_DQ_CACHE_HITS = 5,
 FS_DQ_ALLOCATED = 6,
 FS_DQ_FREE = 7,
 FS_DQ_SYNCS = 8,
 FS_DQ_WARNINGS = 9,
};




enum {
 DEV_CDROM=1,
 DEV_HWMON=2,
 DEV_PARPORT=3,
 DEV_RAID=4,
 DEV_MAC_HID=5,
 DEV_SCSI=6,
 DEV_IPMI=7,
};


enum {
 DEV_CDROM_INFO=1,
 DEV_CDROM_AUTOCLOSE=2,
 DEV_CDROM_AUTOEJECT=3,
 DEV_CDROM_DEBUG=4,
 DEV_CDROM_LOCK=5,
 DEV_CDROM_CHECK_MEDIA=6
};


enum {
 DEV_PARPORT_DEFAULT=-3
};


enum {
 DEV_RAID_SPEED_LIMIT_MIN=1,
 DEV_RAID_SPEED_LIMIT_MAX=2
};


enum {
 DEV_PARPORT_DEFAULT_TIMESLICE=1,
 DEV_PARPORT_DEFAULT_SPINTIME=2
};


enum {
 DEV_PARPORT_SPINTIME=1,
 DEV_PARPORT_BASE_ADDR=2,
 DEV_PARPORT_IRQ=3,
 DEV_PARPORT_DMA=4,
 DEV_PARPORT_MODES=5,
 DEV_PARPORT_DEVICES=6,
 DEV_PARPORT_AUTOPROBE=16
};


enum {
 DEV_PARPORT_DEVICES_ACTIVE=-3,
};


enum {
 DEV_PARPORT_DEVICE_TIMESLICE=1,
};


enum {
 DEV_MAC_HID_KEYBOARD_SENDS_LINUX_KEYCODES=1,
 DEV_MAC_HID_KEYBOARD_LOCK_KEYCODES=2,
 DEV_MAC_HID_MOUSE_BUTTON_EMULATION=3,
 DEV_MAC_HID_MOUSE_BUTTON2_KEYCODE=4,
 DEV_MAC_HID_MOUSE_BUTTON3_KEYCODE=5,
 DEV_MAC_HID_ADB_MOUSE_SENDS_KEYCODES=6
};


enum {
 DEV_SCSI_LOGGING_LEVEL=1,
};


enum {
 DEV_IPMI_POWEROFF_POWERCYCLE=1,
};


enum
{
 ABI_DEFHANDLER_COFF=1,
 ABI_DEFHANDLER_ELF=2,
 ABI_DEFHANDLER_LCALL7=3,
 ABI_DEFHANDLER_LIBCSO=4,
 ABI_TRACE=5,
 ABI_FAKE_UTSNAME=6,
};
# 31 "./include/linux/sysctl.h" 2


struct completion;
struct ctl_table;
struct nsproxy;
struct ctl_table_root;
struct ctl_table_header;
struct ctl_dir;

typedef int proc_handler (struct ctl_table *ctl, int write,
     void *buffer, size_t *lenp, loff_t *ppos);

extern int proc_dostring(struct ctl_table *, int,
    void *, size_t *, loff_t *);
extern int proc_dointvec(struct ctl_table *, int,
    void *, size_t *, loff_t *);
extern int proc_douintvec(struct ctl_table *, int,
    void *, size_t *, loff_t *);
extern int proc_dointvec_minmax(struct ctl_table *, int,
    void *, size_t *, loff_t *);
extern int proc_douintvec_minmax(struct ctl_table *table, int write,
     void *buffer, size_t *lenp,
     loff_t *ppos);
extern int proc_dointvec_jiffies(struct ctl_table *, int,
     void *, size_t *, loff_t *);
extern int proc_dointvec_userhz_jiffies(struct ctl_table *, int,
     void *, size_t *, loff_t *);
extern int proc_dointvec_ms_jiffies(struct ctl_table *, int,
        void *, size_t *, loff_t *);
extern int proc_doulongvec_minmax(struct ctl_table *, int,
      void *, size_t *, loff_t *);
extern int proc_doulongvec_ms_jiffies_minmax(struct ctl_table *table, int,
          void *, size_t *, loff_t *);
extern int proc_do_large_bitmap(struct ctl_table *, int,
    void *, size_t *, loff_t *);
# 95 "./include/linux/sysctl.h"
struct ctl_table_poll {
 atomic_t event;
 wait_queue_head_t wait;
};

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *proc_sys_poll_event(struct ctl_table_poll *poll)
{
 return (void *)(unsigned long)({ union { typeof((&poll->event)->counter) __val; char __c[1]; } __u; if (1) __read_once_size(&((&poll->event)->counter), __u.__c, sizeof((&poll->event)->counter)); else __read_once_size_nocheck(&((&poll->event)->counter), __u.__c, sizeof((&poll->event)->counter)); do { } while (0); __u.__val; });
}
# 113 "./include/linux/sysctl.h"
struct ctl_table
{
 const char *procname;
 void *data;
 int maxlen;
 umode_t mode;
 struct ctl_table *child;
 proc_handler *proc_handler;
 struct ctl_table_poll *poll;
 void *extra1;
 void *extra2;
} __attribute__((designated_init));

struct ctl_node {
 struct rb_node node;
 struct ctl_table_header *header;
};



struct ctl_table_header
{
 union {
  struct {
   struct ctl_table *ctl_table;
   int used;
   int count;
   int nreg;
  };
  struct callback_head rcu;
 };
 struct completion *unregistering;
 struct ctl_table *ctl_table_arg;
 struct ctl_table_root *root;
 struct ctl_table_set *set;
 struct ctl_dir *parent;
 struct ctl_node *node;
 struct hlist_head inodes;
};

struct ctl_dir {

 struct ctl_table_header header;
 struct rb_root root;
};

struct ctl_table_set {
 int (*is_seen)(struct ctl_table_set *);
 struct ctl_dir dir;
};

struct ctl_table_root {
 struct ctl_table_set default_set;
 struct ctl_table_set *(*lookup)(struct ctl_table_root *root);
 void (*set_ownership)(struct ctl_table_header *head,
         struct ctl_table *table,
         kuid_t *uid, kgid_t *gid);
 int (*permissions)(struct ctl_table_header *head, struct ctl_table *table);
};


struct ctl_path {
 const char *procname;
};



void proc_sys_poll_notify(struct ctl_table_poll *poll);

extern void setup_sysctl_set(struct ctl_table_set *p,
 struct ctl_table_root *root,
 int (*is_seen)(struct ctl_table_set *));
extern void retire_sysctl_set(struct ctl_table_set *set);

struct ctl_table_header *__register_sysctl_table(
 struct ctl_table_set *set,
 const char *path, struct ctl_table *table);
struct ctl_table_header *__register_sysctl_paths(
 struct ctl_table_set *set,
 const struct ctl_path *path, struct ctl_table *table);
struct ctl_table_header *register_sysctl(const char *path, struct ctl_table *table);
struct ctl_table_header *register_sysctl_table(struct ctl_table * table);
struct ctl_table_header *register_sysctl_paths(const struct ctl_path *path,
      struct ctl_table *table);

void unregister_sysctl_table(struct ctl_table_header * table);

extern int sysctl_init(void);

extern struct ctl_table sysctl_mount_point[];
# 233 "./include/linux/sysctl.h"
int sysctl_max_threads(struct ctl_table *table, int write,
         void *buffer, size_t *lenp, loff_t *ppos);
# 10 "./include/linux/umh.h" 2

struct cred;
struct file;






struct subprocess_info {
 struct work_struct work;
 struct completion *complete;
 const char *path;
 char **argv;
 char **envp;
 int wait;
 int retval;
 int (*init)(struct subprocess_info *info, struct cred *new);
 void (*cleanup)(struct subprocess_info *info);
 void *data;
} __attribute__((designated_init));

extern int
call_usermodehelper(const char *path, char **argv, char **envp, int wait);

extern struct subprocess_info *
call_usermodehelper_setup(const char *path, char **argv, char **envp,
     gfp_t gfp_mask,
     int (*init)(struct subprocess_info *info, struct cred *new),
     void (*cleanup)(struct subprocess_info *), void *data);

extern int
call_usermodehelper_exec(struct subprocess_info *info, int wait);

extern struct ctl_table usermodehelper_table[];

enum umh_disable_depth {
 UMH_ENABLED = 0,
 UMH_FREEZING,
 UMH_DISABLED,
};

extern int __usermodehelper_disable(enum umh_disable_depth depth);
extern void __usermodehelper_set_disable_depth(enum umh_disable_depth depth);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int usermodehelper_disable(void)
{
 return __usermodehelper_disable(UMH_DISABLED);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void usermodehelper_enable(void)
{
 __usermodehelper_set_disable_depth(UMH_ENABLED);
}

extern int usermodehelper_read_trylock(void);
extern long usermodehelper_read_lock_wait(long timeout);
extern void usermodehelper_read_unlock(void);
# 23 "./include/linux/kmod.h" 2
# 33 "./include/linux/kmod.h"
extern char modprobe_path[];


extern __attribute__((format(printf, 2, 3)))
int __request_module(bool wait, const char *name, ...);
# 14 "./include/linux/module.h" 2

# 1 "./include/linux/elf.h" 1




# 1 "./arch/arm64/include/asm/elf.h" 1
# 25 "./arch/arm64/include/asm/elf.h"
# 1 "./arch/arm64/include/generated/asm/user.h" 1
# 1 "./include/asm-generic/user.h" 1
# 1 "./arch/arm64/include/generated/asm/user.h" 2
# 26 "./arch/arm64/include/asm/elf.h" 2
# 124 "./arch/arm64/include/asm/elf.h"
typedef unsigned long elf_greg_t;





typedef elf_greg_t elf_gregset_t[(sizeof(struct user_pt_regs) / sizeof(elf_greg_t))];
typedef struct user_fpsimd_state elf_fpregset_t;
# 154 "./arch/arm64/include/asm/elf.h"
struct linux_binprm;
extern int arch_setup_additional_pages(struct linux_binprm *bprm,
           int uses_interp);
# 180 "./arch/arm64/include/asm/elf.h"
typedef unsigned int compat_elf_greg_t;
typedef compat_elf_greg_t compat_elf_gregset_t[18];
# 200 "./arch/arm64/include/asm/elf.h"
extern int aarch32_setup_vectors_page(struct linux_binprm *bprm,
          int uses_interp);
# 6 "./include/linux/elf.h" 2
# 1 "./include/uapi/linux/elf.h" 1





# 1 "./include/uapi/linux/elf-em.h" 1
# 7 "./include/uapi/linux/elf.h" 2


typedef __u32 Elf32_Addr;
typedef __u16 Elf32_Half;
typedef __u32 Elf32_Off;
typedef __s32 Elf32_Sword;
typedef __u32 Elf32_Word;


typedef __u64 Elf64_Addr;
typedef __u16 Elf64_Half;
typedef __s16 Elf64_SHalf;
typedef __u64 Elf64_Off;
typedef __s32 Elf64_Sword;
typedef __u32 Elf64_Word;
typedef __u64 Elf64_Xword;
typedef __s64 Elf64_Sxword;
# 138 "./include/uapi/linux/elf.h"
typedef struct dynamic{
  Elf32_Sword d_tag;
  union{
    Elf32_Sword d_val;
    Elf32_Addr d_ptr;
  } d_un;
} Elf32_Dyn;

typedef struct {
  Elf64_Sxword d_tag;
  union {
    Elf64_Xword d_val;
    Elf64_Addr d_ptr;
  } d_un;
} Elf64_Dyn;
# 161 "./include/uapi/linux/elf.h"
typedef struct elf32_rel {
  Elf32_Addr r_offset;
  Elf32_Word r_info;
} Elf32_Rel;

typedef struct elf64_rel {
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
} Elf64_Rel;

typedef struct elf32_rela{
  Elf32_Addr r_offset;
  Elf32_Word r_info;
  Elf32_Sword r_addend;
} Elf32_Rela;

typedef struct elf64_rela {
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
  Elf64_Sxword r_addend;
} Elf64_Rela;

typedef struct elf32_sym{
  Elf32_Word st_name;
  Elf32_Addr st_value;
  Elf32_Word st_size;
  unsigned char st_info;
  unsigned char st_other;
  Elf32_Half st_shndx;
} Elf32_Sym;

typedef struct elf64_sym {
  Elf64_Word st_name;
  unsigned char st_info;
  unsigned char st_other;
  Elf64_Half st_shndx;
  Elf64_Addr st_value;
  Elf64_Xword st_size;
} Elf64_Sym;




typedef struct elf32_hdr{
  unsigned char e_ident[16];
  Elf32_Half e_type;
  Elf32_Half e_machine;
  Elf32_Word e_version;
  Elf32_Addr e_entry;
  Elf32_Off e_phoff;
  Elf32_Off e_shoff;
  Elf32_Word e_flags;
  Elf32_Half e_ehsize;
  Elf32_Half e_phentsize;
  Elf32_Half e_phnum;
  Elf32_Half e_shentsize;
  Elf32_Half e_shnum;
  Elf32_Half e_shstrndx;
} Elf32_Ehdr;

typedef struct elf64_hdr {
  unsigned char e_ident[16];
  Elf64_Half e_type;
  Elf64_Half e_machine;
  Elf64_Word e_version;
  Elf64_Addr e_entry;
  Elf64_Off e_phoff;
  Elf64_Off e_shoff;
  Elf64_Word e_flags;
  Elf64_Half e_ehsize;
  Elf64_Half e_phentsize;
  Elf64_Half e_phnum;
  Elf64_Half e_shentsize;
  Elf64_Half e_shnum;
  Elf64_Half e_shstrndx;
} Elf64_Ehdr;







typedef struct elf32_phdr{
  Elf32_Word p_type;
  Elf32_Off p_offset;
  Elf32_Addr p_vaddr;
  Elf32_Addr p_paddr;
  Elf32_Word p_filesz;
  Elf32_Word p_memsz;
  Elf32_Word p_flags;
  Elf32_Word p_align;
} Elf32_Phdr;

typedef struct elf64_phdr {
  Elf64_Word p_type;
  Elf64_Word p_flags;
  Elf64_Off p_offset;
  Elf64_Addr p_vaddr;
  Elf64_Addr p_paddr;
  Elf64_Xword p_filesz;
  Elf64_Xword p_memsz;
  Elf64_Xword p_align;
} Elf64_Phdr;
# 303 "./include/uapi/linux/elf.h"
typedef struct elf32_shdr {
  Elf32_Word sh_name;
  Elf32_Word sh_type;
  Elf32_Word sh_flags;
  Elf32_Addr sh_addr;
  Elf32_Off sh_offset;
  Elf32_Word sh_size;
  Elf32_Word sh_link;
  Elf32_Word sh_info;
  Elf32_Word sh_addralign;
  Elf32_Word sh_entsize;
} Elf32_Shdr;

typedef struct elf64_shdr {
  Elf64_Word sh_name;
  Elf64_Word sh_type;
  Elf64_Xword sh_flags;
  Elf64_Addr sh_addr;
  Elf64_Off sh_offset;
  Elf64_Xword sh_size;
  Elf64_Word sh_link;
  Elf64_Word sh_info;
  Elf64_Xword sh_addralign;
  Elf64_Xword sh_entsize;
} Elf64_Shdr;
# 426 "./include/uapi/linux/elf.h"
typedef struct elf32_note {
  Elf32_Word n_namesz;
  Elf32_Word n_descsz;
  Elf32_Word n_type;
} Elf32_Nhdr;


typedef struct elf64_note {
  Elf64_Word n_namesz;
  Elf64_Word n_descsz;
  Elf64_Word n_type;
} Elf64_Nhdr;
# 7 "./include/linux/elf.h" 2
# 37 "./include/linux/elf.h"
extern Elf64_Dyn _DYNAMIC [];
# 49 "./include/linux/elf.h"
struct file;
struct coredump_params;


static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int elf_coredump_extra_notes_size(void) { return 0; }
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int elf_coredump_extra_notes_write(struct coredump_params *cprm) { return 0; }
# 16 "./include/linux/module.h" 2

# 1 "./include/linux/kobject.h" 1
# 21 "./include/linux/kobject.h"
# 1 "./include/linux/sysfs.h" 1
# 16 "./include/linux/sysfs.h"
# 1 "./include/linux/kernfs.h" 1
# 14 "./include/linux/kernfs.h"
# 1 "./include/linux/idr.h" 1
# 15 "./include/linux/idr.h"
# 1 "./include/linux/radix-tree.h" 1
# 61 "./include/linux/radix-tree.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool radix_tree_is_internal_node(void *ptr)
{
 return ((unsigned long)ptr & 3UL) ==
    1UL;
}
# 93 "./include/linux/radix-tree.h"
struct radix_tree_node {
 unsigned char shift;
 unsigned char offset;
 unsigned char count;
 unsigned char exceptional;
 struct radix_tree_node *parent;
 struct radix_tree_root *root;
 union {
  struct list_head private_list;
  struct callback_head callback_head;
 };
 void *slots[(1UL << (0 ? 4 : 6))];
 unsigned long tags[3][(((1UL << (0 ? 4 : 6)) + 64 - 1) / 64)];
};





struct radix_tree_root {
 gfp_t gfp_mask;
 struct radix_tree_node *rnode;
};
# 131 "./include/linux/radix-tree.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool radix_tree_empty(const struct radix_tree_root *root)
{
 return root->rnode == ((void *)0);
}
# 152 "./include/linux/radix-tree.h"
struct radix_tree_iter {
 unsigned long index;
 unsigned long next_index;
 unsigned long tags;
 struct radix_tree_node *node;

 unsigned int shift;

};

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int iter_shift(const struct radix_tree_iter *iter)
{

 return iter->shift;



}
# 236 "./include/linux/radix-tree.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *radix_tree_deref_slot(void **slot)
{
 return ({ typeof(*(*slot)) *________p1 = (typeof(*(*slot)) *)({ union { typeof((*slot)) __val; char __c[1]; } __u; if (1) __read_once_size(&((*slot)), __u.__c, sizeof((*slot))); else __read_once_size_nocheck(&((*slot)), __u.__c, sizeof((*slot))); do { } while (0); __u.__val; }); do { } while (0); ; ((typeof(*(*slot)) *)(________p1)); });
}
# 250 "./include/linux/radix-tree.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *radix_tree_deref_slot_protected(void **slot,
       spinlock_t *treelock)
{
 return ({ do { } while (0); ; ((typeof(*(*slot)) *)((*slot))); });
}
# 263 "./include/linux/radix-tree.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int radix_tree_deref_retry(void *arg)
{
 return __builtin_expect(!!(radix_tree_is_internal_node(arg)), 0);
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int radix_tree_exceptional_entry(void *arg)
{

 return (unsigned long)arg & 2;
}






static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int radix_tree_exception(void *arg)
{
 return __builtin_expect(!!((unsigned long)arg & 3UL), 0);
}

int __radix_tree_create(struct radix_tree_root *, unsigned long index,
   unsigned order, struct radix_tree_node **nodep,
   void ***slotp);
int __radix_tree_insert(struct radix_tree_root *, unsigned long index,
   unsigned order, void *);
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int radix_tree_insert(struct radix_tree_root *root,
   unsigned long index, void *entry)
{
 return __radix_tree_insert(root, index, 0, entry);
}
void *__radix_tree_lookup(const struct radix_tree_root *, unsigned long index,
     struct radix_tree_node **nodep, void ***slotp);
void *radix_tree_lookup(const struct radix_tree_root *, unsigned long);
void **radix_tree_lookup_slot(const struct radix_tree_root *,
     unsigned long index);
typedef void (*radix_tree_update_node_t)(struct radix_tree_node *, void *);
void __radix_tree_replace(struct radix_tree_root *, struct radix_tree_node *,
     void **slot, void *entry,
     radix_tree_update_node_t update_node, void *private);
void radix_tree_iter_replace(struct radix_tree_root *,
  const struct radix_tree_iter *, void **slot, void *entry);
void radix_tree_replace_slot(struct radix_tree_root *,
        void **slot, void *entry);
void __radix_tree_delete_node(struct radix_tree_root *,
         struct radix_tree_node *,
         radix_tree_update_node_t update_node,
         void *private);
void radix_tree_iter_delete(struct radix_tree_root *,
   struct radix_tree_iter *iter, void **slot);
void *radix_tree_delete_item(struct radix_tree_root *, unsigned long, void *);
void *radix_tree_delete(struct radix_tree_root *, unsigned long);
void radix_tree_clear_tags(struct radix_tree_root *, struct radix_tree_node *,
      void **slot);
unsigned int radix_tree_gang_lookup(const struct radix_tree_root *,
   void **results, unsigned long first_index,
   unsigned int max_items);
unsigned int radix_tree_gang_lookup_slot(const struct radix_tree_root *,
   void ***results, unsigned long *indices,
   unsigned long first_index, unsigned int max_items);
int radix_tree_preload(gfp_t gfp_mask);
int radix_tree_maybe_preload(gfp_t gfp_mask);
int radix_tree_maybe_preload_order(gfp_t gfp_mask, int order);
void radix_tree_init(void);
void *radix_tree_tag_set(struct radix_tree_root *,
   unsigned long index, unsigned int tag);
void *radix_tree_tag_clear(struct radix_tree_root *,
   unsigned long index, unsigned int tag);
int radix_tree_tag_get(const struct radix_tree_root *,
   unsigned long index, unsigned int tag);
void radix_tree_iter_tag_set(struct radix_tree_root *,
  const struct radix_tree_iter *iter, unsigned int tag);
void radix_tree_iter_tag_clear(struct radix_tree_root *,
  const struct radix_tree_iter *iter, unsigned int tag);
unsigned int radix_tree_gang_lookup_tag(const struct radix_tree_root *,
  void **results, unsigned long first_index,
  unsigned int max_items, unsigned int tag);
unsigned int radix_tree_gang_lookup_tag_slot(const struct radix_tree_root *,
  void ***results, unsigned long first_index,
  unsigned int max_items, unsigned int tag);
int radix_tree_tagged(const struct radix_tree_root *, unsigned int tag);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void radix_tree_preload_end(void)
{
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}

int radix_tree_split_preload(unsigned old_order, unsigned new_order, gfp_t);
int radix_tree_split(struct radix_tree_root *, unsigned long index,
   unsigned new_order);
int radix_tree_join(struct radix_tree_root *, unsigned long index,
   unsigned new_order, void *);

void **idr_get_free_cmn(struct radix_tree_root *root,
         struct radix_tree_iter *iter, gfp_t gfp,
         unsigned long max);
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void **idr_get_free(struct radix_tree_root *root,
     struct radix_tree_iter *iter,
     gfp_t gfp,
     int end)
{
 return idr_get_free_cmn(root, iter, gfp, end > 0 ? end - 1 : ((int)(~0U>>1)));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void **idr_get_free_ext(struct radix_tree_root *root,
         struct radix_tree_iter *iter,
         gfp_t gfp,
         unsigned long end)
{
 return idr_get_free_cmn(root, iter, gfp, end - 1);
}

enum {
 RADIX_TREE_ITER_TAG_MASK = 0x0f,
 RADIX_TREE_ITER_TAGGED = 0x10,
 RADIX_TREE_ITER_CONTIG = 0x20,
};
# 393 "./include/linux/radix-tree.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void **
radix_tree_iter_init(struct radix_tree_iter *iter, unsigned long start)
{
# 404 "./include/linux/radix-tree.h"
 iter->index = 0;
 iter->next_index = start;
 return ((void *)0);
}
# 422 "./include/linux/radix-tree.h"
void **radix_tree_next_chunk(const struct radix_tree_root *,
        struct radix_tree_iter *iter, unsigned flags);
# 435 "./include/linux/radix-tree.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void **
radix_tree_iter_lookup(const struct radix_tree_root *root,
   struct radix_tree_iter *iter, unsigned long index)
{
 radix_tree_iter_init(iter, index);
 return radix_tree_next_chunk(root, iter, RADIX_TREE_ITER_CONTIG);
}
# 453 "./include/linux/radix-tree.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void **
radix_tree_iter_find(const struct radix_tree_root *root,
   struct radix_tree_iter *iter, unsigned long index)
{
 radix_tree_iter_init(iter, index);
 return radix_tree_next_chunk(root, iter, 0);
}
# 470 "./include/linux/radix-tree.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((warn_unused_result))
void **radix_tree_iter_retry(struct radix_tree_iter *iter)
{
 iter->next_index = iter->index;
 iter->tags = 0;
 return ((void *)0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned long
__radix_tree_iter_add(struct radix_tree_iter *iter, unsigned long slots)
{
 return iter->index + (slots << iter_shift(iter));
}
# 494 "./include/linux/radix-tree.h"
void **__attribute__((warn_unused_result)) radix_tree_iter_resume(void **slot,
     struct radix_tree_iter *iter);







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) long
radix_tree_chunk_size(struct radix_tree_iter *iter)
{
 return (iter->next_index - iter->index) >> iter_shift(iter);
}


void **__radix_tree_next_slot(void **slot,
    struct radix_tree_iter *iter, unsigned flags);
# 540 "./include/linux/radix-tree.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void **radix_tree_next_slot(void **slot,
    struct radix_tree_iter *iter, unsigned flags)
{
 if (flags & RADIX_TREE_ITER_TAGGED) {
  iter->tags >>= 1;
  if (__builtin_expect(!!(!iter->tags), 0))
   return ((void *)0);
  if (__builtin_expect(!!(iter->tags & 1ul), 1)) {
   iter->index = __radix_tree_iter_add(iter, 1);
   slot++;
   goto found;
  }
  if (!(flags & RADIX_TREE_ITER_CONTIG)) {
   unsigned offset = __ffs(iter->tags);

   iter->tags >>= offset++;
   iter->index = __radix_tree_iter_add(iter, offset);
   slot += offset;
   goto found;
  }
 } else {
  long count = radix_tree_chunk_size(iter);

  while (--count > 0) {
   slot++;
   iter->index = __radix_tree_iter_add(iter, 1);

   if (__builtin_expect(!!(*slot), 1))
    goto found;
   if (flags & RADIX_TREE_ITER_CONTIG) {

    iter->next_index = 0;
    break;
   }
  }
 }
 return ((void *)0);

 found:
 if (__builtin_expect(!!(radix_tree_is_internal_node(({ typeof(*slot) ________p1 = ({ union { typeof(*slot) __val; char __c[1]; } __u; if (1) __read_once_size(&(*slot), __u.__c, sizeof(*slot)); else __read_once_size_nocheck(&(*slot), __u.__c, sizeof(*slot)); do { } while (0); __u.__val; }); ((typeof(**slot) *)(________p1)); }))), 0))
  return __radix_tree_next_slot(slot, iter, flags);
 return slot;
}
# 16 "./include/linux/idr.h" 2



struct idr {
 struct radix_tree_root idr_rt;
 unsigned int idr_next;
};
# 47 "./include/linux/idr.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int idr_get_cursor(const struct idr *idr)
{
 return ({ union { typeof(idr->idr_next) __val; char __c[1]; } __u; if (1) __read_once_size(&(idr->idr_next), __u.__c, sizeof(idr->idr_next)); else __read_once_size_nocheck(&(idr->idr_next), __u.__c, sizeof(idr->idr_next)); do { } while (0); __u.__val; });
}
# 60 "./include/linux/idr.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void idr_set_cursor(struct idr *idr, unsigned int val)
{
 ({ union { typeof(idr->idr_next) __val; char __c[1]; } __u = { .__val = ( typeof(idr->idr_next)) (val) }; __write_once_size(&(idr->idr_next), __u.__c, sizeof(idr->idr_next)); __u.__val; });
}
# 82 "./include/linux/idr.h"
void idr_preload(gfp_t gfp_mask);

int idr_alloc_cmn(struct idr *idr, void *ptr, unsigned long *index,
    unsigned long start, unsigned long end, gfp_t gfp,
    bool ext);
# 107 "./include/linux/idr.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int idr_alloc(struct idr *idr, void *ptr,
       int start, int end, gfp_t gfp)
{
 unsigned long id;
 int ret;

 if (({ int __ret_warn_on = !!(start < 0); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 0: .long 1f - 0b; .pushsection .rodata.str,\"aMS\",@progbits,1; 2: .string \"./include/linux/idr.h\"; .popsection; .long 2b - 0b; .short 113; .short (1 << 0)|((1 << 1)|((9) << 8)); .popsection; 1: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); }))
  return -22;

 ret = idr_alloc_cmn(idr, ptr, &id, start, end, gfp, false);

 if (ret)
  return ret;

 return id;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int idr_alloc_ext(struct idr *idr, void *ptr,
    unsigned long *index,
    unsigned long start,
    unsigned long end,
    gfp_t gfp)
{
 return idr_alloc_cmn(idr, ptr, index, start, end, gfp, true);
}

int idr_alloc_cyclic(struct idr *, void *entry, int start, int end, gfp_t);
int idr_for_each(const struct idr *,
   int (*fn)(int id, void *p, void *data), void *data);
void *idr_get_next(struct idr *, int *nextid);
void *idr_get_next_ext(struct idr *idr, unsigned long *nextid);
void *idr_replace(struct idr *, void *, int id);
void *idr_replace_ext(struct idr *idr, void *ptr, unsigned long id);
void idr_destroy(struct idr *);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *idr_remove_ext(struct idr *idr, unsigned long id)
{
 return radix_tree_delete_item(&idr->idr_rt, id, ((void *)0));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *idr_remove(struct idr *idr, int id)
{
 return idr_remove_ext(idr, id);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void idr_init(struct idr *idr)
{
 do { (&idr->idr_rt)->gfp_mask = ((( gfp_t)(3 << (25 + 0)))); (&idr->idr_rt)->rnode = ((void *)0); } while (0);
 idr->idr_next = 0;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool idr_is_empty(const struct idr *idr)
{
 return radix_tree_empty(&idr->idr_rt) &&
  radix_tree_tagged(&idr->idr_rt, 0);
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void idr_preload_end(void)
{
 do { __asm__ __volatile__("": : :"memory"); if (__builtin_expect(!!(__preempt_count_dec_and_test()), 0)) preempt_schedule(); } while (0);
}
# 187 "./include/linux/idr.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *idr_find_ext(const struct idr *idr, unsigned long id)
{
 return radix_tree_lookup(&idr->idr_rt, id);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void *idr_find(const struct idr *idr, int id)
{
 return idr_find_ext(idr, id);
}
# 234 "./include/linux/idr.h"
struct ida_bitmap {
 unsigned long bitmap[(128 / sizeof(long))];
};

extern __attribute__((section(".data..percpu" ""))) __typeof__(struct ida_bitmap *) ida_bitmap;

struct ida {
 struct radix_tree_root ida_rt;
};






int ida_pre_get(struct ida *ida, gfp_t gfp_mask);
int ida_get_new_above(struct ida *ida, int starting_id, int *p_id);
void ida_remove(struct ida *ida, int id);
void ida_destroy(struct ida *ida);

int ida_simple_get(struct ida *ida, unsigned int start, unsigned int end,
     gfp_t gfp_mask);
void ida_simple_remove(struct ida *ida, unsigned int id);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void ida_init(struct ida *ida)
{
 do { (&ida->ida_rt)->gfp_mask = ((( gfp_t)(3 << (25 + 0))) | ((( gfp_t)0x1000000u))); (&ida->ida_rt)->rnode = ((void *)0); } while (0);
}
# 270 "./include/linux/idr.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int ida_get_new(struct ida *ida, int *p_id)
{
 return ida_get_new_above(ida, 0, p_id);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool ida_is_empty(const struct ida *ida)
{
 return radix_tree_empty(&ida->ida_rt);
}
# 15 "./include/linux/kernfs.h" 2





struct file;
struct dentry;
struct iattr;
struct seq_file;
struct vm_area_struct;
struct super_block;
struct file_system_type;

struct kernfs_open_node;
struct kernfs_iattrs;

enum kernfs_node_type {
 KERNFS_DIR = 0x0001,
 KERNFS_FILE = 0x0002,
 KERNFS_LINK = 0x0004,
};




enum kernfs_node_flag {
 KERNFS_ACTIVATED = 0x0010,
 KERNFS_NS = 0x0020,
 KERNFS_HAS_SEQ_SHOW = 0x0040,
 KERNFS_HAS_MMAP = 0x0080,
 KERNFS_LOCKDEP = 0x0100,
 KERNFS_SUICIDAL = 0x0400,
 KERNFS_SUICIDED = 0x0800,
 KERNFS_EMPTY_DIR = 0x1000,
 KERNFS_HAS_RELEASE = 0x2000,
};


enum kernfs_root_flag {






 KERNFS_ROOT_CREATE_DEACTIVATED = 0x0001,
# 71 "./include/linux/kernfs.h"
 KERNFS_ROOT_EXTRA_OPEN_PERM_CHECK = 0x0002,





 KERNFS_ROOT_SUPPORT_EXPORTOP = 0x0004,
};


struct kernfs_elem_dir {
 unsigned long subdirs;

 struct rb_root children;





 struct kernfs_root *root;
};

struct kernfs_elem_symlink {
 struct kernfs_node *target_kn;
};

struct kernfs_elem_attr {
 const struct kernfs_ops *ops;
 struct kernfs_open_node *open;
 loff_t size;
 struct kernfs_node *notify_next;
};


union kernfs_node_id {
 struct {






  u32 ino;
  u32 generation;
 };
 u64 id;
};
# 128 "./include/linux/kernfs.h"
struct kernfs_node {
 atomic_t count;
 atomic_t active;
# 140 "./include/linux/kernfs.h"
 struct kernfs_node *parent;
 const char *name;

 struct rb_node rb;

 const void *ns;
 unsigned int hash;
 union {
  struct kernfs_elem_dir dir;
  struct kernfs_elem_symlink symlink;
  struct kernfs_elem_attr attr;
 };

 void *priv;

 union kernfs_node_id id;
 unsigned short flags;
 umode_t mode;
 struct kernfs_iattrs *iattr;
};
# 168 "./include/linux/kernfs.h"
struct kernfs_syscall_ops {
 int (*remount_fs)(struct kernfs_root *root, int *flags, char *data);
 int (*show_options)(struct seq_file *sf, struct kernfs_root *root);

 int (*mkdir)(struct kernfs_node *parent, const char *name,
       umode_t mode);
 int (*rmdir)(struct kernfs_node *kn);
 int (*rename)(struct kernfs_node *kn, struct kernfs_node *new_parent,
        const char *new_name);
 int (*show_path)(struct seq_file *sf, struct kernfs_node *kn,
    struct kernfs_root *root);
};

struct kernfs_root {

 struct kernfs_node *kn;
 unsigned int flags;


 struct idr ino_idr;
 u32 next_generation;
 struct kernfs_syscall_ops *syscall_ops;


 struct list_head supers;

 wait_queue_head_t deactivate_waitq;
};

struct kernfs_open_file {

 struct kernfs_node *kn;
 struct file *file;
 struct seq_file *seq_file;
 void *priv;


 struct mutex mutex;
 struct mutex prealloc_mutex;
 int event;
 struct list_head list;
 char *prealloc_buf;

 size_t atomic_write_len;
 bool mmapped:1;
 bool released:1;
 const struct vm_operations_struct *vm_ops;
};

struct kernfs_ops {




 int (*open)(struct kernfs_open_file *of);
 void (*release)(struct kernfs_open_file *of);
# 236 "./include/linux/kernfs.h"
 int (*seq_show)(struct seq_file *sf, void *v);

 void *(*seq_start)(struct seq_file *sf, loff_t *ppos);
 void *(*seq_next)(struct seq_file *sf, void *v, loff_t *ppos);
 void (*seq_stop)(struct seq_file *sf, void *v);

 ssize_t (*read)(struct kernfs_open_file *of, char *buf, size_t bytes,
   loff_t off);
# 252 "./include/linux/kernfs.h"
 size_t atomic_write_len;






 bool prealloc;
 ssize_t (*write)(struct kernfs_open_file *of, char *buf, size_t bytes,
    loff_t off);

 int (*mmap)(struct kernfs_open_file *of, struct vm_area_struct *vma);




};



static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) enum kernfs_node_type kernfs_type(struct kernfs_node *kn)
{
 return kn->flags & 0x000f;
}
# 285 "./include/linux/kernfs.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void kernfs_enable_ns(struct kernfs_node *kn)
{
 ({ int __ret_warn_on = !!(kernfs_type(kn) != KERNFS_DIR); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 0: .long 1f - 0b; .pushsection .rodata.str,\"aMS\",@progbits,1; 2: .string \"./include/linux/kernfs.h\"; .popsection; .long 2b - 0b; .short 287; .short (1 << 0)|((1 << 1)|((9) << 8)); .popsection; 1: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); });
 ({ int __ret_warn_on = !!(!(({ union { typeof((&kn->dir.children)->rb_node) __val; char __c[1]; } __u; if (1) __read_once_size(&((&kn->dir.children)->rb_node), __u.__c, sizeof((&kn->dir.children)->rb_node)); else __read_once_size_nocheck(&((&kn->dir.children)->rb_node), __u.__c, sizeof((&kn->dir.children)->rb_node)); do { } while (0); __u.__val; }) == ((void *)0))); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 0: .long 1f - 0b; .pushsection .rodata.str,\"aMS\",@progbits,1; 2: .string \"./include/linux/kernfs.h\"; .popsection; .long 2b - 0b; .short 288; .short (1 << 0)|((1 << 1)|((9) << 8)); .popsection; 1: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); });
 kn->flags |= KERNFS_NS;
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool kernfs_ns_enabled(struct kernfs_node *kn)
{
 return kn->flags & KERNFS_NS;
}

int kernfs_name(struct kernfs_node *kn, char *buf, size_t buflen);
int kernfs_path_from_node(struct kernfs_node *root_kn, struct kernfs_node *kn,
     char *buf, size_t buflen);
void pr_cont_kernfs_name(struct kernfs_node *kn);
void pr_cont_kernfs_path(struct kernfs_node *kn);
struct kernfs_node *kernfs_get_parent(struct kernfs_node *kn);
struct kernfs_node *kernfs_find_and_get_ns(struct kernfs_node *parent,
        const char *name, const void *ns);
struct kernfs_node *kernfs_walk_and_get_ns(struct kernfs_node *parent,
        const char *path, const void *ns);
void kernfs_get(struct kernfs_node *kn);
void kernfs_put(struct kernfs_node *kn);

struct kernfs_node *kernfs_node_from_dentry(struct dentry *dentry);
struct kernfs_root *kernfs_root_from_sb(struct super_block *sb);
struct inode *kernfs_get_inode(struct super_block *sb, struct kernfs_node *kn);

struct dentry *kernfs_node_dentry(struct kernfs_node *kn,
      struct super_block *sb);
struct kernfs_root *kernfs_create_root(struct kernfs_syscall_ops *scops,
           unsigned int flags, void *priv);
void kernfs_destroy_root(struct kernfs_root *root);

struct kernfs_node *kernfs_create_dir_ns(struct kernfs_node *parent,
      const char *name, umode_t mode,
      void *priv, const void *ns);
struct kernfs_node *kernfs_create_empty_dir(struct kernfs_node *parent,
         const char *name);
struct kernfs_node *__kernfs_create_file(struct kernfs_node *parent,
      const char *name,
      umode_t mode, loff_t size,
      const struct kernfs_ops *ops,
      void *priv, const void *ns,
      struct lock_class_key *key);
struct kernfs_node *kernfs_create_link(struct kernfs_node *parent,
           const char *name,
           struct kernfs_node *target);
void kernfs_activate(struct kernfs_node *kn);
void kernfs_remove(struct kernfs_node *kn);
void kernfs_break_active_protection(struct kernfs_node *kn);
void kernfs_unbreak_active_protection(struct kernfs_node *kn);
bool kernfs_remove_self(struct kernfs_node *kn);
int kernfs_remove_by_name_ns(struct kernfs_node *parent, const char *name,
        const void *ns);
int kernfs_rename_ns(struct kernfs_node *kn, struct kernfs_node *new_parent,
       const char *new_name, const void *new_ns);
int kernfs_setattr(struct kernfs_node *kn, const struct iattr *iattr);
void kernfs_notify(struct kernfs_node *kn);

const void *kernfs_super_ns(struct super_block *sb);
struct dentry *kernfs_mount_ns(struct file_system_type *fs_type, int flags,
          struct kernfs_root *root, unsigned long magic,
          bool *new_sb_created, const void *ns);
void kernfs_kill_sb(struct super_block *sb);
struct super_block *kernfs_pin_sb(struct kernfs_root *root, const void *ns);

void kernfs_init(void);

struct kernfs_node *kernfs_get_node_by_id(struct kernfs_root *root,
 const union kernfs_node_id *id);
# 480 "./include/linux/kernfs.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int kernfs_path(struct kernfs_node *kn, char *buf, size_t buflen)
{
 return kernfs_path_from_node(kn, ((void *)0), buf, buflen);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct kernfs_node *
kernfs_find_and_get(struct kernfs_node *kn, const char *name)
{
 return kernfs_find_and_get_ns(kn, name, ((void *)0));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct kernfs_node *
kernfs_walk_and_get(struct kernfs_node *kn, const char *path)
{
 return kernfs_walk_and_get_ns(kn, path, ((void *)0));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct kernfs_node *
kernfs_create_dir(struct kernfs_node *parent, const char *name, umode_t mode,
    void *priv)
{
 return kernfs_create_dir_ns(parent, name, mode, priv, ((void *)0));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct kernfs_node *
kernfs_create_file_ns(struct kernfs_node *parent, const char *name,
        umode_t mode, loff_t size, const struct kernfs_ops *ops,
        void *priv, const void *ns)
{
 struct lock_class_key *key = ((void *)0);




 return __kernfs_create_file(parent, name, mode, size, ops, priv, ns,
        key);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct kernfs_node *
kernfs_create_file(struct kernfs_node *parent, const char *name, umode_t mode,
     loff_t size, const struct kernfs_ops *ops, void *priv)
{
 return kernfs_create_file_ns(parent, name, mode, size, ops, priv, ((void *)0));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int kernfs_remove_by_name(struct kernfs_node *parent,
     const char *name)
{
 return kernfs_remove_by_name_ns(parent, name, ((void *)0));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int kernfs_rename(struct kernfs_node *kn,
    struct kernfs_node *new_parent,
    const char *new_name)
{
 return kernfs_rename_ns(kn, new_parent, new_name, ((void *)0));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct dentry *
kernfs_mount(struct file_system_type *fs_type, int flags,
  struct kernfs_root *root, unsigned long magic,
  bool *new_sb_created)
{
 return kernfs_mount_ns(fs_type, flags, root,
    magic, new_sb_created, ((void *)0));
}
# 17 "./include/linux/sysfs.h" 2




# 1 "./include/linux/kobject_ns.h" 1
# 20 "./include/linux/kobject_ns.h"
struct sock;
struct kobject;





enum kobj_ns_type {
 KOBJ_NS_TYPE_NONE = 0,
 KOBJ_NS_TYPE_NET,
 KOBJ_NS_TYPES
};
# 40 "./include/linux/kobject_ns.h"
struct kobj_ns_type_operations {
 enum kobj_ns_type type;
 bool (*current_may_mount)(void);
 void *(*grab_current_ns)(void);
 const void *(*netlink_ns)(struct sock *sk);
 const void *(*initial_ns)(void);
 void (*drop_ns)(void *);
};

int kobj_ns_type_register(const struct kobj_ns_type_operations *ops);
int kobj_ns_type_registered(enum kobj_ns_type type);
const struct kobj_ns_type_operations *kobj_child_ns_ops(struct kobject *parent);
const struct kobj_ns_type_operations *kobj_ns_ops(struct kobject *kobj);

bool kobj_ns_current_may_mount(enum kobj_ns_type type);
void *kobj_ns_grab_current(enum kobj_ns_type type);
const void *kobj_ns_netlink(enum kobj_ns_type type, struct sock *sk);
const void *kobj_ns_initial(enum kobj_ns_type type);
void kobj_ns_drop(enum kobj_ns_type type, void *ns);
# 22 "./include/linux/sysfs.h" 2



struct kobject;
struct module;
struct bin_attribute;
enum kobj_ns_type;

struct attribute {
 const char *name;
 umode_t mode;





};
# 84 "./include/linux/sysfs.h"
struct attribute_group {
 const char *name;
 umode_t (*is_visible)(struct kobject *,
           struct attribute *, int);
 umode_t (*is_bin_visible)(struct kobject *,
        struct bin_attribute *, int);
 struct attribute **attrs;
 struct bin_attribute **bin_attrs;
};
# 159 "./include/linux/sysfs.h"
struct file;
struct vm_area_struct;

struct bin_attribute {
 struct attribute attr;
 size_t size;
 void *private;
 ssize_t (*read)(struct file *, struct kobject *, struct bin_attribute *,
   char *, loff_t, size_t);
 ssize_t (*write)(struct file *, struct kobject *, struct bin_attribute *,
    char *, loff_t, size_t);
 int (*mmap)(struct file *, struct kobject *, struct bin_attribute *attr,
      struct vm_area_struct *vma);
};
# 216 "./include/linux/sysfs.h"
struct sysfs_ops {
 ssize_t (*show)(struct kobject *, struct attribute *, char *);
 ssize_t (*store)(struct kobject *, struct attribute *, const char *, size_t);
};



int __attribute__((warn_unused_result)) sysfs_create_dir_ns(struct kobject *kobj, const void *ns);
void sysfs_remove_dir(struct kobject *kobj);
int __attribute__((warn_unused_result)) sysfs_rename_dir_ns(struct kobject *kobj, const char *new_name,
         const void *new_ns);
int __attribute__((warn_unused_result)) sysfs_move_dir_ns(struct kobject *kobj,
       struct kobject *new_parent_kobj,
       const void *new_ns);
int __attribute__((warn_unused_result)) sysfs_create_mount_point(struct kobject *parent_kobj,
       const char *name);
void sysfs_remove_mount_point(struct kobject *parent_kobj,
         const char *name);

int __attribute__((warn_unused_result)) sysfs_create_file_ns(struct kobject *kobj,
          const struct attribute *attr,
          const void *ns);
int __attribute__((warn_unused_result)) sysfs_create_files(struct kobject *kobj,
       const struct attribute **attr);
int __attribute__((warn_unused_result)) sysfs_chmod_file(struct kobject *kobj,
      const struct attribute *attr, umode_t mode);
struct kernfs_node *sysfs_break_active_protection(struct kobject *kobj,
        const struct attribute *attr);
void sysfs_unbreak_active_protection(struct kernfs_node *kn);
void sysfs_remove_file_ns(struct kobject *kobj, const struct attribute *attr,
     const void *ns);
bool sysfs_remove_file_self(struct kobject *kobj, const struct attribute *attr);
void sysfs_remove_files(struct kobject *kobj, const struct attribute **attr);

int __attribute__((warn_unused_result)) sysfs_create_bin_file(struct kobject *kobj,
           const struct bin_attribute *attr);
void sysfs_remove_bin_file(struct kobject *kobj,
      const struct bin_attribute *attr);

int __attribute__((warn_unused_result)) sysfs_create_link(struct kobject *kobj, struct kobject *target,
       const char *name);
int __attribute__((warn_unused_result)) sysfs_create_link_nowarn(struct kobject *kobj,
       struct kobject *target,
       const char *name);
void sysfs_remove_link(struct kobject *kobj, const char *name);

int sysfs_rename_link_ns(struct kobject *kobj, struct kobject *target,
    const char *old_name, const char *new_name,
    const void *new_ns);

void sysfs_delete_link(struct kobject *dir, struct kobject *targ,
   const char *name);

int __attribute__((warn_unused_result)) sysfs_create_group(struct kobject *kobj,
        const struct attribute_group *grp);
int __attribute__((warn_unused_result)) sysfs_create_groups(struct kobject *kobj,
         const struct attribute_group **groups);
int sysfs_update_group(struct kobject *kobj,
         const struct attribute_group *grp);
void sysfs_remove_group(struct kobject *kobj,
   const struct attribute_group *grp);
void sysfs_remove_groups(struct kobject *kobj,
    const struct attribute_group **groups);
int sysfs_add_file_to_group(struct kobject *kobj,
   const struct attribute *attr, const char *group);
void sysfs_remove_file_from_group(struct kobject *kobj,
   const struct attribute *attr, const char *group);
int sysfs_merge_group(struct kobject *kobj,
         const struct attribute_group *grp);
void sysfs_unmerge_group(struct kobject *kobj,
         const struct attribute_group *grp);
int sysfs_add_link_to_group(struct kobject *kobj, const char *group_name,
       struct kobject *target, const char *link_name);
void sysfs_remove_link_from_group(struct kobject *kobj, const char *group_name,
      const char *link_name);
int __compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
          struct kobject *target_kobj,
          const char *target_name);

void sysfs_notify(struct kobject *kobj, const char *dir, const char *attr);

int __attribute__((warn_unused_result)) sysfs_init(void);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void sysfs_enable_ns(struct kernfs_node *kn)
{
 return kernfs_enable_ns(kn);
}
# 512 "./include/linux/sysfs.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) sysfs_create_file(struct kobject *kobj,
       const struct attribute *attr)
{
 return sysfs_create_file_ns(kobj, attr, ((void *)0));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void sysfs_remove_file(struct kobject *kobj,
         const struct attribute *attr)
{
 sysfs_remove_file_ns(kobj, attr, ((void *)0));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int sysfs_rename_link(struct kobject *kobj, struct kobject *target,
        const char *old_name, const char *new_name)
{
 return sysfs_rename_link_ns(kobj, target, old_name, new_name, ((void *)0));
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void sysfs_notify_dirent(struct kernfs_node *kn)
{
 kernfs_notify(kn);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct kernfs_node *sysfs_get_dirent(struct kernfs_node *parent,
         const char *name)
{
 return kernfs_find_and_get(parent, name);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct kernfs_node *sysfs_get(struct kernfs_node *kn)
{
 kernfs_get(kn);
 return kn;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void sysfs_put(struct kernfs_node *kn)
{
 kernfs_put(kn);
}
# 22 "./include/linux/kobject.h" 2


# 1 "./include/linux/kref.h" 1
# 21 "./include/linux/kref.h"
struct kref {
 refcount_t refcount;
};







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void kref_init(struct kref *kref)
{
 refcount_set(&kref->refcount, 1);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) unsigned int kref_read(const struct kref *kref)
{
 return refcount_read(&kref->refcount);
}





static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void kref_get(struct kref *kref)
{
 refcount_inc(&kref->refcount);
}
# 67 "./include/linux/kref.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int kref_put(struct kref *kref, void (*release)(struct kref *kref))
{
 if (refcount_dec_and_test(&kref->refcount)) {
  release(kref);
  return 1;
 }
 return 0;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int kref_put_mutex(struct kref *kref,
     void (*release)(struct kref *kref),
     struct mutex *lock)
{
 if (refcount_dec_and_mutex_lock(&kref->refcount, lock)) {
  release(kref);
  return 1;
 }
 return 0;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int kref_put_lock(struct kref *kref,
    void (*release)(struct kref *kref),
    spinlock_t *lock)
{
 if (refcount_dec_and_lock(&kref->refcount, lock)) {
  release(kref);
  return 1;
 }
 return 0;
}
# 114 "./include/linux/kref.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int __attribute__((warn_unused_result)) kref_get_unless_zero(struct kref *kref)
{
 return refcount_inc_not_zero(&kref->refcount);
}
# 25 "./include/linux/kobject.h" 2
# 37 "./include/linux/kobject.h"
extern char uevent_helper[];



extern u64 uevent_seqnum;
# 53 "./include/linux/kobject.h"
enum kobject_action {
 KOBJ_ADD,
 KOBJ_REMOVE,
 KOBJ_CHANGE,
 KOBJ_MOVE,
 KOBJ_ONLINE,
 KOBJ_OFFLINE,
 KOBJ_BIND,
 KOBJ_UNBIND,
 KOBJ_MAX
};

struct kobject {
 const char *name;
 struct list_head entry;
 struct kobject *parent;
 struct kset *kset;
 struct kobj_type *ktype;
 struct kernfs_node *sd;
 struct kref kref;



 unsigned int state_initialized:1;
 unsigned int state_in_sysfs:1;
 unsigned int state_add_uevent_sent:1;
 unsigned int state_remove_uevent_sent:1;
 unsigned int uevent_suppress:1;
};

extern __attribute__((format(printf, 2, 3)))
int kobject_set_name(struct kobject *kobj, const char *name, ...);
extern __attribute__((format(printf, 2, 0)))
int kobject_set_name_vargs(struct kobject *kobj, const char *fmt,
      va_list vargs);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) const char *kobject_name(const struct kobject *kobj)
{
 return kobj->name;
}

extern void kobject_init(struct kobject *kobj, struct kobj_type *ktype);
extern __attribute__((format(printf, 3, 4))) __attribute__((warn_unused_result))
int kobject_add(struct kobject *kobj, struct kobject *parent,
  const char *fmt, ...);
extern __attribute__((format(printf, 4, 5))) __attribute__((warn_unused_result))
int kobject_init_and_add(struct kobject *kobj,
    struct kobj_type *ktype, struct kobject *parent,
    const char *fmt, ...);

extern void kobject_del(struct kobject *kobj);

extern struct kobject * __attribute__((warn_unused_result)) kobject_create(void);
extern struct kobject * __attribute__((warn_unused_result)) kobject_create_and_add(const char *name,
      struct kobject *parent);

extern int __attribute__((warn_unused_result)) kobject_rename(struct kobject *, const char *new_name);
extern int __attribute__((warn_unused_result)) kobject_move(struct kobject *, struct kobject *);

extern struct kobject *kobject_get(struct kobject *kobj);
extern struct kobject * __attribute__((warn_unused_result)) kobject_get_unless_zero(
      struct kobject *kobj);
extern void kobject_put(struct kobject *kobj);

extern const void *kobject_namespace(struct kobject *kobj);
extern char *kobject_get_path(struct kobject *kobj, gfp_t flag);
# 130 "./include/linux/kobject.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool kobject_has_children(struct kobject *kobj)
{
 ({ int __ret_warn_on = !!(kref_read(&kobj->kref) == 0); if (__builtin_expect(!!(__ret_warn_on), 0)) asm volatile (".pushsection __bug_table,\"aw\"; .align 2; 0: .long 1f - 0b; .pushsection .rodata.str,\"aMS\",@progbits,1; 2: .string \"./include/linux/kobject.h\"; .popsection; .long 2b - 0b; .short 132; .short (1 << 0)|((1 << 1)|((9) << 8)); .popsection; 1: brk 0x800");; __builtin_expect(!!(__ret_warn_on), 0); });

 return kobj->sd && kobj->sd->dir.subdirs;
}

struct kobj_type {
 void (*release)(struct kobject *kobj);
 const struct sysfs_ops *sysfs_ops;
 struct attribute **default_attrs;
 const struct kobj_ns_type_operations *(*child_ns_type)(struct kobject *kobj);
 const void *(*namespace)(struct kobject *kobj);
};

struct kobj_uevent_env {
 char *argv[3];
 char *envp[32];
 int envp_idx;
 char buf[2048];
 int buflen;
};

struct kset_uevent_ops {
 int (* const filter)(struct kset *kset, struct kobject *kobj);
 const char *(* const name)(struct kset *kset, struct kobject *kobj);
 int (* const uevent)(struct kset *kset, struct kobject *kobj,
        struct kobj_uevent_env *env);
};

struct kobj_attribute {
 struct attribute attr;
 ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
   char *buf);
 ssize_t (*store)(struct kobject *kobj, struct kobj_attribute *attr,
    const char *buf, size_t count);
};

extern const struct sysfs_ops kobj_sysfs_ops;

struct sock;
# 189 "./include/linux/kobject.h"
struct kset {
 struct list_head list;
 spinlock_t list_lock;
 struct kobject kobj;
 const struct kset_uevent_ops *uevent_ops;
} __attribute__((designated_init));

extern void kset_init(struct kset *kset);
extern int __attribute__((warn_unused_result)) kset_register(struct kset *kset);
extern void kset_unregister(struct kset *kset);
extern struct kset * __attribute__((warn_unused_result)) kset_create_and_add(const char *name,
      const struct kset_uevent_ops *u,
      struct kobject *parent_kobj);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct kset *to_kset(struct kobject *kobj)
{
 return kobj ? ({ void *__mptr = (void *)(kobj); do { bool __cond = !(!(!__builtin_types_compatible_p(typeof(*(kobj)), typeof(((struct kset *)0)->kobj)) && !__builtin_types_compatible_p(typeof(*(kobj)), typeof(void)))); extern void __compiletime_assert_205(void) __attribute__((error("pointer type mismatch in container_of()"))); if (__cond) __compiletime_assert_205(); do { } while (0); } while (0); ((struct kset *)(__mptr - __builtin_offsetof(struct kset, kobj))); }) : ((void *)0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct kset *kset_get(struct kset *k)
{
 return k ? to_kset(kobject_get(&k->kobj)) : ((void *)0);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) void kset_put(struct kset *k)
{
 kobject_put(&k->kobj);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct kobj_type *get_ktype(struct kobject *kobj)
{
 return kobj->ktype;
}

extern struct kobject *kset_find_obj(struct kset *, const char *);


extern struct kobject *kernel_kobj;

extern struct kobject *mm_kobj;

extern struct kobject *hypervisor_kobj;

extern struct kobject *power_kobj;

extern struct kobject *firmware_kobj;

int kobject_uevent(struct kobject *kobj, enum kobject_action action);
int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
   char *envp[]);
int kobject_synth_uevent(struct kobject *kobj, const char *buf, size_t count);

__attribute__((format(printf, 2, 3)))
int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...);
# 18 "./include/linux/module.h" 2
# 1 "./include/linux/moduleparam.h" 1
# 38 "./include/linux/moduleparam.h"
struct kernel_param;






enum {
 KERNEL_PARAM_OPS_FL_NOARG = (1 << 0)
};

struct kernel_param_ops {

 unsigned int flags;

 int (*set)(const char *val, const struct kernel_param *kp);

 int (*get)(char *buffer, const struct kernel_param *kp);

 void (*free)(void *arg);
};







enum {
 KERNEL_PARAM_FL_UNSAFE = (1 << 0),
 KERNEL_PARAM_FL_HWPARAM = (1 << 1),
};

struct kernel_param {
 const char *name;
 struct module *mod;
 const struct kernel_param_ops *ops;
 const u16 perm;
 s8 level;
 u8 flags;
 union {
  void *arg;
  const struct kparam_string *str;
  const struct kparam_array *arr;
 };
};

extern const struct kernel_param __start___param[], __stop___param[];


struct kparam_string {
 unsigned int maxlen;
 char *string;
};


struct kparam_array
{
 unsigned int max;
 unsigned int elemsize;
 unsigned int *num;
 const struct kernel_param_ops *ops;
 void *elem;
};
# 239 "./include/linux/moduleparam.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int
__check_old_set_param(int (*oldset)(const char *, struct kernel_param *))
{
 return 0;
}


extern void kernel_param_lock(struct module *mod);
extern void kernel_param_unlock(struct module *mod);
# 310 "./include/linux/moduleparam.h"
extern bool parameq(const char *name1, const char *name2);
# 320 "./include/linux/moduleparam.h"
extern bool parameqn(const char *name1, const char *name2, size_t n);


extern char *parse_args(const char *name,
        char *args,
        const struct kernel_param *params,
        unsigned num,
        s16 level_min,
        s16 level_max,
        void *arg,
        int (*unknown)(char *param, char *val,
         const char *doing, void *arg));



extern void destroy_params(const struct kernel_param *params, unsigned num);
# 349 "./include/linux/moduleparam.h"
extern const struct kernel_param_ops param_ops_byte;
extern int param_set_byte(const char *val, const struct kernel_param *kp);
extern int param_get_byte(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_short;
extern int param_set_short(const char *val, const struct kernel_param *kp);
extern int param_get_short(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_ushort;
extern int param_set_ushort(const char *val, const struct kernel_param *kp);
extern int param_get_ushort(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_int;
extern int param_set_int(const char *val, const struct kernel_param *kp);
extern int param_get_int(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_uint;
extern int param_set_uint(const char *val, const struct kernel_param *kp);
extern int param_get_uint(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_long;
extern int param_set_long(const char *val, const struct kernel_param *kp);
extern int param_get_long(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_ulong;
extern int param_set_ulong(const char *val, const struct kernel_param *kp);
extern int param_get_ulong(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_ullong;
extern int param_set_ullong(const char *val, const struct kernel_param *kp);
extern int param_get_ullong(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_charp;
extern int param_set_charp(const char *val, const struct kernel_param *kp);
extern int param_get_charp(char *buffer, const struct kernel_param *kp);
extern void param_free_charp(void *arg);



extern const struct kernel_param_ops param_ops_bool;
extern int param_set_bool(const char *val, const struct kernel_param *kp);
extern int param_get_bool(char *buffer, const struct kernel_param *kp);


extern const struct kernel_param_ops param_ops_bool_enable_only;
extern int param_set_bool_enable_only(const char *val,
          const struct kernel_param *kp);



extern const struct kernel_param_ops param_ops_invbool;
extern int param_set_invbool(const char *val, const struct kernel_param *kp);
extern int param_get_invbool(char *buffer, const struct kernel_param *kp);



extern const struct kernel_param_ops param_ops_bint;
extern int param_set_bint(const char *val, const struct kernel_param *kp);
# 457 "./include/linux/moduleparam.h"
enum hwparam_type {
 hwparam_ioport,
 hwparam_iomem,
 hwparam_ioport_or_iomem,
 hwparam_irq,
 hwparam_dma,
 hwparam_dma_addr,
 hwparam_other,
};
# 518 "./include/linux/moduleparam.h"
extern const struct kernel_param_ops param_array_ops;

extern const struct kernel_param_ops param_ops_string;
extern int param_set_copystring(const char *val, const struct kernel_param *);
extern int param_get_string(char *buffer, const struct kernel_param *kp);



struct module;


extern int module_param_sysfs_setup(struct module *mod,
        const struct kernel_param *kparam,
        unsigned int num_params);

extern void module_param_sysfs_remove(struct module *mod);
# 19 "./include/linux/module.h" 2


# 1 "./include/linux/rbtree_latch.h" 1
# 39 "./include/linux/rbtree_latch.h"
struct latch_tree_node {
 struct rb_node node[2];
};

struct latch_tree_root {
 seqcount_t seq;
 struct rb_root tree[2];
};
# 63 "./include/linux/rbtree_latch.h"
struct latch_tree_ops {
 bool (*less)(struct latch_tree_node *a, struct latch_tree_node *b);
 int (*comp)(void *key, struct latch_tree_node *b);
};

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) struct latch_tree_node *
__lt_from_rb(struct rb_node *node, int idx)
{
 return ({ void *__mptr = (void *)(node); do { bool __cond = !(!(!__builtin_types_compatible_p(typeof(*(node)), typeof(((struct latch_tree_node *)0)->node[idx])) && !__builtin_types_compatible_p(typeof(*(node)), typeof(void)))); extern void __compiletime_assert_71(void) __attribute__((error("pointer type mismatch in container_of()"))); if (__cond) __compiletime_assert_71(); do { } while (0); } while (0); ((struct latch_tree_node *)(__mptr - __builtin_offsetof(struct latch_tree_node, node[idx]))); });
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void
__lt_insert(struct latch_tree_node *ltn, struct latch_tree_root *ltr, int idx,
     bool (*less)(struct latch_tree_node *a, struct latch_tree_node *b))
{
 struct rb_root *root = &ltr->tree[idx];
 struct rb_node **link = &root->rb_node;
 struct rb_node *node = &ltn->node[idx];
 struct rb_node *parent = ((void *)0);
 struct latch_tree_node *ltp;

 while (*link) {
  parent = *link;
  ltp = __lt_from_rb(parent, idx);

  if (less(ltn, ltp))
   link = &parent->rb_left;
  else
   link = &parent->rb_right;
 }

 rb_link_node_rcu(node, parent, link);
 rb_insert_color(node, root);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void
__lt_erase(struct latch_tree_node *ltn, struct latch_tree_root *ltr, int idx)
{
 rb_erase(&ltn->node[idx], &ltr->tree[idx]);
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) struct latch_tree_node *
__lt_find(void *key, struct latch_tree_root *ltr, int idx,
   int (*comp)(void *key, struct latch_tree_node *node))
{
 struct rb_node *node = ({ typeof(ltr->tree[idx].rb_node) ________p1 = ({ union { typeof(ltr->tree[idx].rb_node) __val; char __c[1]; } __u; if (1) __read_once_size(&(ltr->tree[idx].rb_node), __u.__c, sizeof(ltr->tree[idx].rb_node)); else __read_once_size_nocheck(&(ltr->tree[idx].rb_node), __u.__c, sizeof(ltr->tree[idx].rb_node)); do { } while (0); __u.__val; }); ((typeof(*ltr->tree[idx].rb_node) *)(________p1)); });
 struct latch_tree_node *ltn;
 int c;

 while (node) {
  ltn = __lt_from_rb(node, idx);
  c = comp(key, ltn);

  if (c < 0)
   node = ({ typeof(node->rb_left) ________p1 = ({ union { typeof(node->rb_left) __val; char __c[1]; } __u; if (1) __read_once_size(&(node->rb_left), __u.__c, sizeof(node->rb_left)); else __read_once_size_nocheck(&(node->rb_left), __u.__c, sizeof(node->rb_left)); do { } while (0); __u.__val; }); ((typeof(*node->rb_left) *)(________p1)); });
  else if (c > 0)
   node = ({ typeof(node->rb_right) ________p1 = ({ union { typeof(node->rb_right) __val; char __c[1]; } __u; if (1) __read_once_size(&(node->rb_right), __u.__c, sizeof(node->rb_right)); else __read_once_size_nocheck(&(node->rb_right), __u.__c, sizeof(node->rb_right)); do { } while (0); __u.__val; }); ((typeof(*node->rb_right) *)(________p1)); });
  else
   return ltn;
 }

 return ((void *)0);
}
# 142 "./include/linux/rbtree_latch.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void
latch_tree_insert(struct latch_tree_node *node,
    struct latch_tree_root *root,
    const struct latch_tree_ops *ops)
{
 raw_write_seqcount_latch(&root->seq);
 __lt_insert(node, root, 0, ops->less);
 raw_write_seqcount_latch(&root->seq);
 __lt_insert(node, root, 1, ops->less);
}
# 169 "./include/linux/rbtree_latch.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) void
latch_tree_erase(struct latch_tree_node *node,
   struct latch_tree_root *root,
   const struct latch_tree_ops *ops)
{
 raw_write_seqcount_latch(&root->seq);
 __lt_erase(node, root, 0);
 raw_write_seqcount_latch(&root->seq);
 __lt_erase(node, root, 1);
}
# 198 "./include/linux/rbtree_latch.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) __attribute__((always_inline)) struct latch_tree_node *
latch_tree_find(void *key, struct latch_tree_root *root,
  const struct latch_tree_ops *ops)
{
 struct latch_tree_node *node;
 unsigned int seq;

 do {
  seq = raw_read_seqcount_latch(&root->seq);
  node = __lt_find(key, root, seq & 1, ops->comp);
 } while (read_seqcount_retry(&root->seq, seq));

 return node;
}
# 22 "./include/linux/module.h" 2


# 1 "./arch/arm64/include/asm/module.h" 1
# 19 "./arch/arm64/include/asm/module.h"
# 1 "./include/asm-generic/module.h" 1
# 10 "./include/asm-generic/module.h"
struct mod_arch_specific
{
};
# 20 "./arch/arm64/include/asm/module.h" 2
# 39 "./arch/arm64/include/asm/module.h"
u64 module_emit_plt_entry(struct module *mod, void *loc, const Elf64_Rela *rela,
     Elf64_Sym *sym);







struct plt_entry {
# 57 "./arch/arm64/include/asm/module.h"
 __le32 mov0;
 __le32 mov1;
 __le32 mov2;
 __le32 br;
};

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) struct plt_entry get_plt_entry(u64 val)
{
# 76 "./arch/arm64/include/asm/module.h"
 return (struct plt_entry){
  (( __le32)(__u32)(0x92800010 | (((~val ) & 0xffff)) << 5)),
  (( __le32)(__u32)(0xf2a00010 | ((( val >> 16) & 0xffff)) << 5)),
  (( __le32)(__u32)(0xf2c00010 | ((( val >> 32) & 0xffff)) << 5)),
  (( __le32)(__u32)(0xd61f0200))
 };
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool plt_entries_equal(const struct plt_entry *a,
         const struct plt_entry *b)
{
 return a->mov0 == b->mov0 &&
        a->mov1 == b->mov1 &&
        a->mov2 == b->mov2;
}
# 25 "./include/linux/module.h" 2
# 34 "./include/linux/module.h"
struct modversion_info {
 unsigned long crc;
 char name[(64 - sizeof(unsigned long))];
};

struct module;
struct exception_table_entry;

struct module_kobject {
 struct kobject kobj;
 struct module *mod;
 struct kobject *drivers_dir;
 struct module_param_attrs *mp;
 struct completion *kobj_completion;
} __attribute__((designated_init));

struct module_attribute {
 struct attribute attr;
 ssize_t (*show)(struct module_attribute *, struct module_kobject *,
   char *);
 ssize_t (*store)(struct module_attribute *, struct module_kobject *,
    const char *, size_t count);
 void (*setup)(struct module *, const char *);
 int (*test)(struct module *);
 void (*free)(struct module *);
};

struct module_version_attribute {
 struct module_attribute mattr;
 const char *module_name;
 const char *version;
} __attribute__ ((__aligned__(sizeof(void *))));

extern ssize_t __modver_version_show(struct module_attribute *,
         struct module_kobject *, char *);

extern struct module_attribute module_uevent;


extern int init_module(void);
extern void cleanup_module(void);
# 260 "./include/linux/module.h"
struct notifier_block;



extern int modules_disabled;

void *__symbol_get(const char *symbol);
void *__symbol_get_gpl(const char *symbol);



struct module_use {
 struct list_head source_list;
 struct list_head target_list;
 struct module *source, *target;
};

enum module_state {
 MODULE_STATE_LIVE,
 MODULE_STATE_COMING,
 MODULE_STATE_GOING,
 MODULE_STATE_UNFORMED,
};

struct mod_tree_node {
 struct module *mod;
 struct latch_tree_node node;
};

struct module_layout {

 void *base;

 unsigned int size;

 unsigned int text_size;

 unsigned int ro_size;

 unsigned int ro_after_init_size;


 struct mod_tree_node mtn;

};
# 313 "./include/linux/module.h"
struct mod_kallsyms {
 Elf64_Sym *symtab;
 unsigned int num_symtab;
 char *strtab;
};
# 328 "./include/linux/module.h"
struct module {
 enum module_state state;


 struct list_head list;


 char name[(64 - sizeof(unsigned long))];


 struct module_kobject mkobj;
 struct module_attribute *modinfo_attrs;
 const char *version;
 const char *srcversion;
 struct kobject *holders_dir;


 const struct kernel_symbol *syms;
 const s32 *crcs;
 unsigned int num_syms;



 struct mutex param_lock;

 struct kernel_param *kp;
 unsigned int num_kp;


 unsigned int num_gpl_syms;
 const struct kernel_symbol *gpl_syms;
 const s32 *gpl_crcs;
# 378 "./include/linux/module.h"
 bool async_probe_requested;


 const struct kernel_symbol *gpl_future_syms;
 const s32 *gpl_future_crcs;
 unsigned int num_gpl_future_syms;


 unsigned int num_exentries;
 struct exception_table_entry *extable;


 int (*init)(void);


 struct module_layout core_layout __attribute__((__aligned__((1 << 7))));
 struct module_layout init_layout;


 struct mod_arch_specific arch;

 unsigned long taints;



 unsigned num_bugs;
 struct list_head bug_list;
 struct bug_entry *bug_table;




 struct mod_kallsyms *kallsyms;
 struct mod_kallsyms core_kallsyms;


 struct module_sect_attrs *sect_attrs;


 struct module_notes_attrs *notes_attrs;




 char *args;



 void *percpu;
 unsigned int percpu_size;







 struct jump_entry *jump_entries;
 unsigned int num_jump_entries;
# 463 "./include/linux/module.h"
 struct list_head source_list;

 struct list_head target_list;


 void (*exit)(void);

 atomic_t refcnt;







} __attribute__((__aligned__((1 << 7)))) __attribute__((designated_init));




extern struct mutex module_mutex;




static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) int module_is_live(struct module *mod)
{
 return mod->state != MODULE_STATE_GOING;
}

struct module *__module_text_address(unsigned long addr);
struct module *__module_address(unsigned long addr);
bool is_module_address(unsigned long addr);
bool __is_module_percpu_address(unsigned long addr, unsigned long *can_addr);
bool is_module_percpu_address(unsigned long addr);
bool is_module_text_address(unsigned long addr);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool within_module_core(unsigned long addr,
          const struct module *mod)
{
 return (unsigned long)mod->core_layout.base <= addr &&
        addr < (unsigned long)mod->core_layout.base + mod->core_layout.size;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool within_module_init(unsigned long addr,
          const struct module *mod)
{
 return (unsigned long)mod->init_layout.base <= addr &&
        addr < (unsigned long)mod->init_layout.base + mod->init_layout.size;
}

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool within_module(unsigned long addr, const struct module *mod)
{
 return within_module_init(addr, mod) || within_module_core(addr, mod);
}


struct module *find_module(const char *name);

struct symsearch {
 const struct kernel_symbol *start, *stop;
 const s32 *crcs;
 enum {
  NOT_GPL_ONLY,
  GPL_ONLY,
  WILL_BE_GPL_ONLY,
 } licence;
 bool unused;
};






const struct kernel_symbol *find_symbol(const char *name,
     struct module **owner,
     const s32 **crc,
     bool gplok,
     bool warn);






bool each_symbol_section(bool (*fn)(const struct symsearch *arr,
        struct module *owner,
        void *data), void *data);



int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
   char *name, char *module_name, int *exported);


unsigned long module_kallsyms_lookup_name(const char *name);

int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
          struct module *, unsigned long),
       void *data);

extern void __attribute__((noreturn)) __module_put_and_exit(struct module *mod,
   long code);



int module_refcount(struct module *mod);
void __symbol_put(const char *symbol);

void symbol_put_addr(void *addr);



extern void __module_get(struct module *module);



extern bool try_module_get(struct module *module);

extern void module_put(struct module *module);
# 600 "./include/linux/module.h"
int ref_module(struct module *a, struct module *b);
# 612 "./include/linux/module.h"
const char *module_address_lookup(unsigned long addr,
       unsigned long *symbolsize,
       unsigned long *offset,
       char **modname,
       char *namebuf);
int lookup_module_symbol_name(unsigned long addr, char *symname);
int lookup_module_symbol_attrs(unsigned long addr, unsigned long *size, unsigned long *offset, char *modname, char *name);

int register_module_notifier(struct notifier_block *nb);
int unregister_module_notifier(struct notifier_block *nb);

extern void print_modules(void);

static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool module_requested_async_probing(struct module *module)
{
 return module && module->async_probe_requested;
}







static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool is_livepatch_module(struct module *mod)
{
 return false;
}
# 759 "./include/linux/module.h"
extern struct kset *module_kset;
extern struct kobj_type module_ktype;
extern int module_sysfs_initialized;
# 771 "./include/linux/module.h"
extern void set_all_modules_text_rw(void);
extern void set_all_modules_text_ro(void);
extern void module_enable_ro(const struct module *mod, bool after_init);
extern void module_disable_ro(const struct module *mod);
# 783 "./include/linux/module.h"
void module_bug_finalize(const Elf64_Ehdr *, const Elf64_Shdr *,
    struct module *);
void module_bug_cleanup(struct module *);
# 800 "./include/linux/module.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool retpoline_module_ok(bool has_retpoline)
{
 return true;
}
# 812 "./include/linux/module.h"
static inline __attribute__((always_inline, unused)) __attribute__((no_instrument_function)) bool module_sig_ok(struct module *module)
{
 return true;
}
# 2 "/home/mendel/gasket-driver/src/apex.mod.c" 2
# 1 "./include/linux/vermagic.h" 1

# 1 "./include/generated/utsrelease.h" 1
# 3 "./include/linux/vermagic.h" 2
# 3 "/home/mendel/gasket-driver/src/apex.mod.c" 2


static const char __UNIQUE_ID_vermagic8[] __attribute__((__used__)) __attribute__((section(".modinfo"), unused, aligned(1))) = "vermagic" "=" "4.14.98-imx" " " "SMP " "preempt " "mod_unload " "" "aarch64";
static const char __UNIQUE_ID_name9[] __attribute__((__used__)) __attribute__((section(".modinfo"), unused, aligned(1))) = "name" "=" "apex";

__attribute__((externally_visible)) struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = "apex",
 .init = init_module,

 .exit = cleanup_module,

 .arch = {},
};





static const char __module_depends[]
__attribute__((__used__))
__attribute__((section(".modinfo"))) =
"depends=gasket";

static const char __UNIQUE_ID_alias10[] __attribute__((__used__)) __attribute__((section(".modinfo"), unused, aligned(1))) = "alias" "=" "pci:v00001AC1d0000089Asv*sd*bc*sc*i*";

static const char __UNIQUE_ID_srcversion11[] __attribute__((__used__)) __attribute__((section(".modinfo"), unused, aligned(1))) = "srcversion" "=" "9C83C2F9D75F44CE5B03AE2";
