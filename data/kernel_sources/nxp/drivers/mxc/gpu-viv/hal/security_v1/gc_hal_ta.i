# 0 "drivers/mxc/gpu-viv/hal/security_v1/gc_hal_ta.c"
# 1 "/home/sri/Desktop/Research/Accelerators_Research/nxp_8mplusbb/linux-imx//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "././include/linux/compiler-version.h" 1
# 0 "<command-line>" 2
# 1 "././include/linux/kconfig.h" 1




# 1 "./include/generated/autoconf.h" 1
# 6 "././include/linux/kconfig.h" 2
# 0 "<command-line>" 2
# 1 "././include/linux/compiler_types.h" 1
# 80 "././include/linux/compiler_types.h"
# 1 "./include/linux/compiler_attributes.h" 1
# 81 "././include/linux/compiler_types.h" 2
# 153 "././include/linux/compiler_types.h"
# 1 "./include/linux/compiler-gcc.h" 1
# 154 "././include/linux/compiler_types.h" 2
# 167 "././include/linux/compiler_types.h"
# 1 "./arch/arm64/include/asm/compiler.h" 1
# 168 "././include/linux/compiler_types.h" 2


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
# 1 "drivers/mxc/gpu-viv/hal/security_v1/gc_hal_ta.c"
# 56 "drivers/mxc/gpu-viv/hal/security_v1/gc_hal_ta.c"
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_types.h" 1
# 55 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_types.h"
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_version.h" 1
# 56 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_types.h" 2
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_options.h" 1
# 57 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_types.h" 2
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_types_shared.h" 1
# 60 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_types_shared.h"
# 1 "./include/generated/uapi/linux/version.h" 1
# 61 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_types_shared.h" 2



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




typedef __s8 s8;
typedef __u8 u8;
typedef __s16 s16;
typedef __u16 u16;
typedef __s32 s32;
typedef __u32 u32;
typedef __s64 s64;
typedef __u64 u64;
# 8 "./include/uapi/asm-generic/types.h" 2
# 2 "./arch/arm64/include/generated/uapi/asm/types.h" 2
# 6 "./include/uapi/linux/types.h" 2
# 14 "./include/uapi/linux/types.h"
# 1 "./include/uapi/linux/posix_types.h" 1




# 1 "./include/linux/stddef.h" 1




# 1 "./include/uapi/linux/stddef.h" 1




# 1 "./include/linux/compiler_types.h" 1
# 6 "./include/uapi/linux/stddef.h" 2
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
typedef __kernel_long_t __kernel_old_time_t;



typedef long long __kernel_time64_t;
typedef __kernel_long_t __kernel_clock_t;
typedef int __kernel_timer_t;
typedef int __kernel_clockid_t;
typedef char * __kernel_caddr_t;
typedef unsigned short __kernel_uid16_t;
typedef unsigned short __kernel_gid16_t;
# 10 "./arch/arm64/include/uapi/asm/posix_types.h" 2
# 37 "./include/uapi/linux/posix_types.h" 2
# 15 "./include/uapi/linux/types.h" 2


typedef __signed__ __int128 __s128 __attribute__((aligned(16)));
typedef unsigned __int128 __u128 __attribute__((aligned(16)));
# 36 "./include/uapi/linux/types.h"
typedef __u16 __le16;
typedef __u16 __be16;
typedef __u32 __le32;
typedef __u32 __be32;
typedef __u64 __le64;
typedef __u64 __be64;

typedef __u16 __sum16;
typedef __u32 __wsum;
# 59 "./include/uapi/linux/types.h"
typedef unsigned __poll_t;
# 7 "./include/linux/types.h" 2







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
# 61 "./include/linux/types.h"
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
# 131 "./include/linux/types.h"
typedef u64 sector_t;
typedef u64 blkcnt_t;
# 149 "./include/linux/types.h"
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
# 232 "./include/linux/types.h"
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
# 65 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_types_shared.h" 2
# 213 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_types_shared.h"
typedef int gctBOOL;
typedef gctBOOL *gctBOOL_PTR;

typedef int gctINT;
typedef signed char gctINT8;
typedef signed short gctINT16;
typedef signed int gctINT32;
typedef signed long long gctINT64;

typedef gctINT *gctINT_PTR;
typedef gctINT8 *gctINT8_PTR;
typedef gctINT16 *gctINT16_PTR;
typedef gctINT32 *gctINT32_PTR;
typedef gctINT64 *gctINT64_PTR;

typedef unsigned int gctUINT;
typedef unsigned char gctUINT8;
typedef unsigned short gctUINT16;
typedef unsigned int gctUINT32;
typedef unsigned long long gctUINT64;
typedef uintptr_t gctUINTPTR_T;
typedef ptrdiff_t gctPTRDIFF_T;

typedef gctUINT *gctUINT_PTR;
typedef gctUINT8 *gctUINT8_PTR;
typedef gctUINT16 *gctUINT16_PTR;
typedef gctUINT32 *gctUINT32_PTR;
typedef gctUINT64 *gctUINT64_PTR;

typedef size_t gctSIZE_T;
typedef gctSIZE_T *gctSIZE_T_PTR;
typedef gctUINT32 gctTRACE;
# 271 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_types_shared.h"
typedef float gctFLOAT;
typedef double gctDOUBLE;
typedef signed int gctFIXED_POINT;
typedef float *gctFLOAT_PTR;
typedef double *gctDOUBLE_PTR;

typedef void *gctPHYS_ADDR;
typedef void *gctHANDLE;
typedef void *gctFILE;
typedef void *gctSIGNAL;
typedef void *gctWINDOW;
typedef void *gctIMAGE;
typedef void *gctSHBUF;

typedef void *gctSEMAPHORE;

typedef void *gctPOINTER;
typedef const void *gctCONST_POINTER;

typedef char gctCHAR;
typedef signed char gctSIGNED_CHAR;
typedef unsigned char gctUNSIGNED_CHAR;
typedef char *gctSTRING;
typedef const char *gctCONST_STRING;

typedef gctUINT64 gctPHYS_ADDR_T;
typedef gctUINT64 gctADDRESS;

typedef struct _gcsCOUNT_STRING {
    gctSIZE_T Length;
    gctCONST_STRING String;
} gcsCOUNT_STRING;

typedef union _gcuFLOAT_UINT32 {
    gctFLOAT f;
    gctUINT32 u;
} gcuFLOAT_UINT32;
# 396 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_types_shared.h"
typedef union _gcuVALUE {
    gctUINT uintValue;
    gctFIXED_POINT fixedValue;
    gctFLOAT floatValue;
    gctINT intValue;
} gcuVALUE;
# 415 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_types_shared.h"
typedef struct _gcs2D_PROFILE {




    gctUINT32 cycleCount;




    gctUINT32 pixelsRendered;
} gcs2D_PROFILE;
# 824 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_types_shared.h"
typedef struct _gcsDATABASE_COUNTERS {

    gctUINT64 bytes;


    gctUINT64 maxBytes;


    gctUINT64 totalBytes;


    gctUINT32 allocCount;


    gctUINT32 freeCount;
} gcsDATABASE_COUNTERS;

typedef struct _gcuDATABASE_INFO {

    gcsDATABASE_COUNTERS counters;


    gctUINT64 time;
} gcuDATABASE_INFO;





typedef struct _gcsHAL_FRAME_INFO {

    gctUINT64 ticks;


    gctUINT readBytes8[8];
    gctUINT writeBytes8[8];


    gctUINT cycles[8];
    gctUINT idleCycles[8];
    gctUINT mcCycles[8];
    gctUINT readRequests[8];
    gctUINT writeRequests[8];


    gctUINT vertexCount;
    gctUINT primitiveCount;
    gctUINT rejectedPrimitives;
    gctUINT culledPrimitives;
    gctUINT clippedPrimitives;
    gctUINT outPrimitives;
    gctUINT inPrimitives;
    gctUINT culledQuadCount;
    gctUINT totalQuadCount;
    gctUINT quadCount;
    gctUINT totalPixelCount;


    gctUINT colorKilled[8];
    gctUINT colorDrawn[8];
    gctUINT depthKilled[8];
    gctUINT depthDrawn[8];


    gctUINT shaderCycles;
    gctUINT vsInstructionCount;
    gctUINT vsTextureCount;
    gctUINT psInstructionCount;
    gctUINT psTextureCount;


    gctUINT bilinearRequests;
    gctUINT trilinearRequests;
    gctUINT txBytes8;
    gctUINT txHitCount;
    gctUINT txMissCount;
} gcsHAL_FRAME_INFO;

typedef struct _gckLINKDATA *gckLINKDATA;
struct _gckLINKDATA {
    gctADDRESS start;
    gctADDRESS end;
    gctUINT32 pid;
    gctUINT32 linkLow;
    gctUINT32 linkHigh;
};

typedef struct _gckADDRESSDATA *gckADDRESSDATA;
struct _gckADDRESSDATA {
    gctADDRESS start;
    gctADDRESS end;
};

typedef union _gcuQUEUEDATA {
    struct _gckLINKDATA linkData;

    struct _gckADDRESSDATA addressData;
} gcuQUEUEDATA;

typedef struct _gckQUEUE *gckQUEUE;
struct _gckQUEUE {
    gcuQUEUEDATA *datas;
    gctUINT32 rear;
    gctUINT32 front;
    gctUINT32 count;
    gctUINT32 size;
};

typedef struct _gcsLISTHEAD *gcsLISTHEAD_PTR;
typedef struct _gcsLISTHEAD {
    gcsLISTHEAD_PTR prev;
    gcsLISTHEAD_PTR next;
} gcsLISTHEAD;
# 956 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_types_shared.h"
typedef struct _gcsHAL_PATCH_LIST {

    gctUINT32 type;


    gctUINT32 count;
# 971 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_types_shared.h"
    gctUINT64 patchArray;


    gctUINT64 next;
} gcsHAL_PATCH_LIST;





typedef struct _gcsHAL_PATCH_VIDMEM_ADDRESS {

    gctUINT32 location;


    gctUINT32 node;


    gctUINT32 offset;
} gcsHAL_PATCH_VIDMEM_ADDRESS;





typedef struct _gcsHAL_PATCH_MCFE_SEMAPHORE {

    gctUINT32 location;


    gctUINT32 sendSema;


    gctUINT32 semaHandle;
} gcsHAL_PATCH_MCFE_SEMAPHORE;





typedef struct _gcsHAL_PATCH_VIDMEM_TIMESTAMP {

    gctUINT32 handle;

    gctUINT32 flag;
} gcsHAL_PATCH_VIDMEM_TIMESTAMP;


typedef struct _gcsPATCH_LIST_VARIABLE {

    gctUINT64 maxAsyncTimestamp;


    gctBOOL semaUsed;
} gcsPATCH_LIST_VARIABLE;
# 58 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_types.h" 2
# 57 "drivers/mxc/gpu-viv/hal/security_v1/gc_hal_ta.c" 2
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h" 1
# 58 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h" 1
# 59 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_enum_shared.h" 1
# 63 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_enum_shared.h"
typedef enum _gceCHIPMODEL {
    gcv200 = 0x0200,
    gcv300 = 0x0300,
    gcv320 = 0x0320,
    gcv328 = 0x0328,
    gcv350 = 0x0350,
    gcv355 = 0x0355,
    gcv400 = 0x0400,
    gcv410 = 0x0410,
    gcv420 = 0x0420,
    gcv428 = 0x0428,
    gcv450 = 0x0450,
    gcv500 = 0x0500,
    gcv520 = 0x0520,
    gcv530 = 0x0530,
    gcv600 = 0x0600,
    gcv620 = 0x0620,
    gcv700 = 0x0700,
    gcv800 = 0x0800,
    gcv820 = 0x0820,
    gcv860 = 0x0860,
    gcv880 = 0x0880,
    gcv900 = 0x0900,
    gcv1000 = 0x1000,
    gcv1500 = 0x1500,
    gcv2000 = 0x2000,
    gcv2100 = 0x2100,
    gcv2200 = 0x2200,
    gcv2500 = 0x2500,
    gcv3000 = 0x3000,
    gcv4000 = 0x4000,
    gcv5000 = 0x5000,
    gcv5200 = 0x5200,
    gcv6400 = 0x6400,
    gcv7000 = 0x7000,
    gcv7400 = 0x7400,
    gcv8000 = 0x8000,
    gcv8400 = 0x8400,
    gcv9100 = 0x9100,
    gcv9200 = 0x9200,
} gceCHIPMODEL;


typedef enum _gceFEATURE {
    gcvFEATURE_PIPE_2D = 0,
    gcvFEATURE_PIPE_3D,
    gcvFEATURE_PIPE_VG,
    gcvFEATURE_DC,
    gcvFEATURE_HIGH_DYNAMIC_RANGE,
    gcvFEATURE_MODULE_CG,
    gcvFEATURE_MIN_AREA,
    gcvFEATURE_BUFFER_INTERLEAVING,
    gcvFEATURE_BYTE_WRITE_2D,
    gcvFEATURE_ENDIANNESS_CONFIG,
    gcvFEATURE_DUAL_RETURN_BUS,
    gcvFEATURE_DEBUG_MODE,
    gcvFEATURE_YUY2_RENDER_TARGET,
    gcvFEATURE_FRAGMENT_PROCESSOR,
    gcvFEATURE_2DPE20,
    gcvFEATURE_FAST_CLEAR,
    gcvFEATURE_YUV420_TILER,
    gcvFEATURE_YUY2_AVERAGING,
    gcvFEATURE_FLIP_Y,
    gcvFEATURE_EARLY_Z,
    gcvFEATURE_COMPRESSION,
    gcvFEATURE_MSAA,
    gcvFEATURE_SPECIAL_ANTI_ALIASING,
    gcvFEATURE_SPECIAL_MSAA_LOD,
    gcvFEATURE_422_TEXTURE_COMPRESSION,
    gcvFEATURE_DXT_TEXTURE_COMPRESSION,
    gcvFEATURE_ETC1_TEXTURE_COMPRESSION,
    gcvFEATURE_TX_ETC2_COMPRESSION,
    gcvFEATURE_CORRECT_TEXTURE_CONVERTER,
    gcvFEATURE_TEXTURE_8K,
    gcvFEATURE_SCALER,
    gcvFEATURE_YUV420_SCALER,
    gcvFEATURE_SHADER_HAS_W,
    gcvFEATURE_SHADER_HAS_SIGN,
    gcvFEATURE_SHADER_HAS_FLOOR,
    gcvFEATURE_SHADER_HAS_CEIL,
    gcvFEATURE_SHADER_HAS_SQRT,
    gcvFEATURE_SHADER_HAS_TRIG,
    gcvFEATURE_SH_SUPERSCALAR_ARCH,
    gcvFEATURE_HZ,
    gcvFEATURE_CORRECT_STENCIL,
    gcvFEATURE_VG20,
    gcvFEATURE_VG_FILTER,
    gcvFEATURE_VG21,
    gcvFEATURE_VG_DOUBLE_BUFFER,
    gcvFEATURE_VG_RESOLUTION_8K,
    gcvFEATURE_MC20,
    gcvFEATURE_SUPER_TILED,
    gcvFEATURE_FAST_CLEAR_FLUSH,
    gcvFEATURE_2D_FILTERBLIT_PLUS_ALPHABLEND,
    gcvFEATURE_2D_DITHER,
    gcvFEATURE_2D_A8_TARGET,
    gcvFEATURE_2D_A8_NO_ALPHA,
    gcvFEATURE_2D_FILTERBLIT_FULLROTATION,
    gcvFEATURE_2D_BITBLIT_FULLROTATION,
    gcvFEATURE_WIDE_LINE,
    gcvFEATURE_FC_FLUSH_STALL,
    gcvFEATURE_FULL_DIRECTFB,
    gcvFEATURE_HALF_FLOAT_PIPE,
    gcvFEATURE_LINE_LOOP,
    gcvFEATURE_2D_YUV_BLIT,
    gcvFEATURE_2D_TILING,
    gcvFEATURE_NON_POWER_OF_TWO,
    gcvFEATURE_3D_TEXTURE,
    gcvFEATURE_TEXTURE_ARRAY,
    gcvFEATURE_TILE_FILLER,
    gcvFEATURE_LOGIC_OP,
    gcvFEATURE_MIXED_STREAMS,
    gcvFEATURE_2D_MULTI_SOURCE_BLT,
    gcvFEATURE_END_EVENT,
    gcvFEATURE_VERTEX_10_10_10_2,
    gcvFEATURE_TEXTURE_10_10_10_2,
    gcvFEATURE_TEXTURE_ANISOTROPIC_FILTERING,
    gcvFEATURE_TEXTURE_FLOAT_HALF_FLOAT,
    gcvFEATURE_2D_ROTATION_STALL_FIX,
    gcvFEATURE_2D_MULTI_SOURCE_BLT_EX,
    gcvFEATURE_BUG_FIXES10,
    gcvFEATURE_2D_MINOR_TILING,
    gcvFEATURE_TEX_COMPRRESSION_SUPERTILED,
    gcvFEATURE_FAST_MSAA,
    gcvFEATURE_BUG_FIXED_INDEXED_TRIANGLE_STRIP,
    gcvFEATURE_TEXTURE_TILE_STATUS_READ,
    gcvFEATURE_DEPTH_BIAS_FIX,
    gcvFEATURE_RECT_PRIMITIVE,
    gcvFEATURE_BUG_FIXES11,
    gcvFEATURE_SUPERTILED_TEXTURE,
    gcvFEATURE_2D_NO_COLORBRUSH_INDEX8,
    gcvFEATURE_RS_YUV_TARGET,
    gcvFEATURE_2D_FC_SOURCE,
    gcvFEATURE_2D_CC_NOAA_SOURCE,
    gcvFEATURE_PE_DITHER_FIX,
    gcvFEATURE_2D_YUV_SEPARATE_STRIDE,
    gcvFEATURE_FRUSTUM_CLIP_FIX,
    gcvFEATURE_TEXTURE_SWIZZLE,
    gcvFEATURE_PRIMITIVE_RESTART,
    gcvFEATURE_TEXTURE_LINEAR,
    gcvFEATURE_TEXTURE_YUV_ASSEMBLER,
    gcvFEATURE_LINEAR_RENDER_TARGET,
    gcvFEATURE_SHADER_HAS_ATOMIC,
    gcvFEATURE_SHADER_HAS_INSTRUCTION_CACHE,
    gcvFEATURE_SHADER_ENHANCEMENTS2,
    gcvFEATURE_BUG_FIXES7,
    gcvFEATURE_SHADER_HAS_RTNE,
    gcvFEATURE_SHADER_HAS_EXTRA_INSTRUCTIONS2,
    gcvFEATURE_SHADER_ENHANCEMENTS3,
    gcvFEATURE_DYNAMIC_FREQUENCY_SCALING,
    gcvFEATURE_SINGLE_BUFFER,
    gcvFEATURE_OCCLUSION_QUERY,
    gcvFEATURE_2D_GAMMA,
    gcvFEATURE_2D_COLOR_SPACE_CONVERSION,
    gcvFEATURE_2D_SUPER_TILE_VERSION,
    gcvFEATURE_HALTI0,
    gcvFEATURE_HALTI1,
    gcvFEATURE_HALTI2,
    gcvFEATURE_SUPPORT_GCREGTX,
    gcvFEATURE_2D_MIRROR_EXTENSION,
    gcvFEATURE_TEXTURE_ASTC,
    gcvFEATURE_TEXTURE_ASTC_DECODE_FIX,
    gcvFEATURE_TEXTURE_ASTC_BASE_LOD_FIX,
    gcvFEATURE_2D_SUPER_TILE_V1,
    gcvFEATURE_2D_SUPER_TILE_V2,
    gcvFEATURE_2D_SUPER_TILE_V3,
    gcvFEATURE_2D_MULTI_SOURCE_BLT_EX2,
    gcvFEATURE_NEW_RA,
    gcvFEATURE_BUG_FIXED_IMPLICIT_PRIMITIVE_RESTART,
    gcvFEATURE_PE_MULTI_RT_BLEND_ENABLE_CONTROL,
    gcvFEATURE_SMALL_MSAA,
    gcvFEATURE_VERTEX_INST_ID_AS_ATTRIBUTE,
    gcvFEATURE_DUAL_16,
    gcvFEATURE_BRANCH_ON_IMMEDIATE_REG,
    gcvFEATURE_2D_COMPRESSION,
    gcvFEATURE_TPC_COMPRESSION,
    gcvFEATURE_TPCV11_COMPRESSION,
    gcvFEATURE_DEC_COMPRESSION,
    gcvFEATURE_DEC300_COMPRESSION,
    gcvFEATURE_DEC400_COMPRESSION,

    gcvFEATURE_DEC400EX_COMPRESSION,
    gcvFEATURE_DEC_TPC_COMPRESSION,
    gcvFEATURE_DEC_COMPRESSION_TILE_NV12_8BIT,
    gcvFEATURE_DEC_COMPRESSION_TILE_NV12_10BIT,
    gcvFEATURE_2D_OPF_YUV_OUTPUT,
    gcvFEATURE_2D_FILTERBLIT_A8_ALPHA,
    gcvFEATURE_2D_MULTI_SRC_BLT_TO_UNIFIED_DST_RECT,
    gcvFEATURE_2D_MULTI_SRC_BLT_BILINEAR_FILTER,
    gcvFEATURE_2D_MULTI_SRC_BLT_1_5_ENHANCEMENT,
    gcvFEATURE_V2_COMPRESSION_Z16_FIX,
    gcvFEATURE_VERTEX_INST_ID_AS_INTEGER,
    gcvFEATURE_2D_YUV_MODE,
    gcvFEATURE_2D_CACHE_128B256BPERLINE,
    gcvFEATURE_2D_SEPARATE_CACHE,
    gcvFEATURE_2D_MAJOR_SUPER_TILE,
    gcvFEATURE_2D_V4COMPRESSION,
    gcvFEATURE_2D_VMSAA,
    gcvFEATURE_2D_10BIT_OUTPUT_LINEAR,
    gcvFEATURE_2D_YUV420_OUTPUT_LINEAR,
    gcvFEATURE_ACE,
    gcvFEATURE_NO_YUV420_SOURCE,
    gcvFEATURE_COLOR_COMPRESSION,
    gcvFEATURE_32BPP_COMPONENT_TEXTURE_CHANNEL_SWIZZLE,
    gcvFEATURE_64BPP_HW_CLEAR_SUPPORT,
    gcvFEATURE_TX_LERP_PRECISION_FIX,
    gcvFEATURE_COMPRESSION_V2,
    gcvFEATURE_MMU,
    gcvFEATURE_COMPRESSION_V3,
    gcvFEATURE_TX_DECOMPRESSOR,
    gcvFEATURE_MRT_TILE_STATUS_BUFFER,
    gcvFEATURE_COMPRESSION_V1,
    gcvFEATURE_V1_COMPRESSION_Z16_DECOMPRESS_FIX,
    gcvFEATURE_RTT,
    gcvFEATURE_GENERIC_ATTRIB,
    gcvFEATURE_2D_ONE_PASS_FILTER,
    gcvFEATURE_2D_ONE_PASS_FILTER_TAP,
    gcvFEATURE_2D_POST_FLIP,
    gcvFEATURE_2D_PIXEL_ALIGNMENT,
    gcvFEATURE_CORRECT_AUTO_DISABLE_COUNT,
    gcvFEATURE_CORRECT_AUTO_DISABLE_COUNT_WIDTH,
    gcvFEATURE_8K_RT,
    gcvFEATURE_HALTI3,
    gcvFEATURE_EEZ,
    gcvFEATURE_INTEGER_SIGNEXT_FIX,
    gcvFEATURE_PSOUTPUT_MAPPING,
    gcvFEATURE_8K_RT_FIX,
    gcvFEATURE_TX_TILE_STATUS_MAPPING,
    gcvFEATURE_SRGB_RT_SUPPORT,
    gcvFEATURE_TEXTURE_16K,
    gcvFEATURE_PA_FARZCLIPPING_FIX,
    gcvFEATURE_PE_DITHER_COLORMASK_FIX,
    gcvFEATURE_ZSCALE_FIX,
    gcvFEATURE_MULTI_PIXELPIPES,
    gcvFEATURE_PIPE_CL,
    gcvFEATURE_BUG_FIXES18,
    gcvFEATURE_UNIFIED_SAMPLERS,
    gcvFEATURE_CL_PS_WALKER,
    gcvFEATURE_NEW_HZ,
    gcvFEATURE_TX_FRAC_PRECISION_6BIT,
    gcvFEATURE_SH_INSTRUCTION_PREFETCH,
    gcvFEATURE_PROBE,
    gcvFEATURE_SINGLE_PIPE_HALTI1,
    gcvFEATURE_BUG_FIXES8,
    gcvFEATURE_2D_ALL_QUAD,
    gcvFEATURE_SEPARATE_SRC_DST,
    gcvFEATURE_TX_HOR_ALIGN_SEL,
    gcvFEATURE_HALTI4,
    gcvFEATURE_MRT_FC_FIX,
    gcvFEATURE_TESSELLATION,
    gcvFEATURE_DRAW_INDIRECT,
    gcvFEATURE_COMPUTE_INDIRECT,
    gcvFEATURE_MSAA_TEXTURE,
    gcvFEATURE_STENCIL_TEXTURE,
    gcvFEATURE_S8_ONLY_RENDERING,
    gcvFEATURE_D24S8_SAMPLE_STENCIL,
    gcvFEATURE_ADVANCED_BLEND_MODE_PART0,
    gcvFEATURE_RA_DEPTH_WRITE,
    gcvFEATURE_RS_DS_DOWNSAMPLE_NATIVE_SUPPORT,
    gcvFEATURE_S8_MSAA_COMPRESSION,
    gcvFEATURE_MSAA_FRAGMENT_OPERATION,
    gcvFEATURE_FE_START_VERTEX_SUPPORT,
    gcvFEATURE_DIVISOR_STREAM_ADDR_FIX,
    gcvFEATURE_ZERO_ATTRIB_SUPPORT,
    gcvFEATURE_DANGLING_VERTEX_FIX,
    gcvFEATURE_PE_DISABLE_COLOR_PIPE,
    gcvFEATURE_FE_12bit_stride,
    gcvFEATURE_TX_LOD_GUARDBAND,
    gcvFEATURE_HAS_PRODUCTID,
    gcvFEATURE_INTEGER32_FIX,
    gcvFEATURE_TEXTURE_GATHER,
    gcvFEATURE_IMG_INSTRUCTION,
    gcvFEATURE_HELPER_INVOCATION,
    gcvFEATURE_NO_USER_CSC,
# 348 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_enum_shared.h"
    gcvFEATURE_ANDROID_ONLY_REMOVED,
    gcvFEATURE_V2_MSAA_COHERENCY_FIX,
    gcvFEATURE_BLOCK_SIZE_16x16,
    gcvFEATURE_TX_SUPPORT_DEC,
    gcvFEATURE_RSBLT_MSAA_DECOMPRESSION,
    gcvFEATURE_TILEFILLER_32TILE_ALIGNED,
    gcvFEATURE_GEOMETRY_SHADER,
    gcvFEATURE_HALTI5,
    gcvFEATURE_PIPELINE_32_ATTRIBUTES,
    gcvFEATURE_USC,
    gcvFEATURE_CUBEMAP_ARRAY,
    gcvFEATURE_TX_DESCRIPTOR,
    gcvFEATURE_SEPARATE_RT_CTRL,
    gcvFEATURE_RENDER_ARRAY,
    gcvFEATURE_BLT_ENGINE,
    gcvFEATURE_TEXTURE_BUFFER,
    gcvFEATURE_GS_SUPPORT_EMIT,
    gcvFEATURE_SAMPLER_BASE_OFFSET,
    gcvFEATURE_IMAGE_OUT_BOUNDARY_FIX,
    gcvFEATURE_TX_BORDER_CLAMP,
    gcvFEATURE_MSAA_SHADING,
    gcvFEATURE_ADVANCED_SH_INST,
    gcvFEATURE_LOD_FIX_FOR_BASELEVEL,
    gcvFEATURE_MULTIDRAW_INDIRECT,
    gcvFEATURE_DRAW_ELEMENTS_BASE_VERTEX,
    gcvFEATURE_NEW_STEERING_AND_ICACHE_FLUSH,
    gcvFEATURE_PE_DITHER_FIX2,
    gcvFEATURE_INDEX_FETCH_FIX,
    gcvFEATURE_TEX_BASELOD,
    gcvFEATURE_TEX_SEAMLESS_CUBE,
    gcvFEATURE_TEX_ETC2,
    gcvFEATURE_TEX_CUBE_BORDER_LOD,
    gcvFEATURE_FE_ALLOW_STALL_PREFETCH_ENG,
    gcvFEATURE_TX_8BPP_TS_FIX,
    gcvFEATURE_HW_TFB,
    gcvFEATURE_HW_TFB_PERF_FIX,
    gcvFEATURE_COMPRESSION_V4,
    gcvFEATURE_FENCE_32BIT,
    gcvFEATURE_FENCE_64BIT,
    gcvFEATURE_R8_UNORM,
    gcvFEATURE_TX_DEFAULT_VALUE_FIX,
    gcvFEATURE_TX_8bit_UVFrac,
    gcvFEATURE_TX_MIPFILTER_NONE_FIX,
    gcvFEATURE_MC_STENCIL_CTRL,
    gcvFEATURE_DEPTH_MATH_FIX,
    gcvFEATURE_PE_B2B_PIXEL_FIX,
    gcvFEATURE_TEXTURE_GATHER_OFFSETS,
    gcvFEATURE_TEX_CACHE_FLUSH_FIX,
    gcvFEATURE_WIDELINE_HELPER_FIX,
    gcvFEATURE_LINE_DIAMOND_RULE_FIX,
    gcvFEATURE_MULTIGPU_SYNC_V2,
    gcvFEATURE_DRAW_ID,
    gcvFEATURE_SNAPPAGE_CMD,
    gcvFEATURE_COMMAND_PREFETCH,
    gcvFEATURE_SAMPLEPOS_SWIZZLE_FIX,
    gcvFEATURE_SELECTMAP_SRC0_SWIZZLE_FIX,
    gcvFEATURE_LOADATTR_OOB_FIX,
    gcvFEATURE_RA_DEPTH_WRITE_MSAA1X_FIX,
    gcvFEATURE_MRT_8BIT_DUAL_PIPE_FIX,
    gcvFEATURE_BUG_FIXES1,
    gcvFEATURE_MULTI_SOURCE_BLT,
    gcvFEATURE_ZCOMPRESSION,
    gcvFEATURE_DITHER_AND_FILTER_PLUS_ALPHA_2D,
    gcvFEATURE_ONE_PASS_2D_FILTER,
    gcvFEATURE_TX_FILTER,
    gcvFEATURE_CHIPENABLE_LINK,
    gcvFEATURE_TEXTURE_BIAS_LOD_FIX,
    gcvFEATURE_USE_GL_Z,
    gcvFEATURE_SUPPORT_INTEGER,







    gcvFEATURE_PARTLY_SUPPORT_INTEGER_BRANCH,
    gcvFEATURE_FULLLY_SUPPORT_INTEGER_BRANCH,
    gcvFEATURE_SUPPORT_INTEGER_ATTRIBUTE,
    gcvFEATURE_SUPPORT_MOVAI,
    gcvFEATURE_NEED_FIX_FOR_CL_X,
    gcvFEATURE_NEED_FIX_FOR_CL_XE,
    gcvFEATURE_HAS_OUTPUT_COUNT_FIX,
    gcvFEATURE_VARYING_PACKING_LIMITATION,
    gcvFEATURE_HIGHP_VARYING_SHIFT,
    gcvFEATURE_BUG_FIXES2,
    gcvFEATURE_64K_L2_CACHE,
    gcvFEATURE_128BTILE,
    gcvFEATURE_ADVANCED_BLEND_OPT,
    gcvFEATURE_SNAPPAGE_CMD_FIX,
    gcvFEATURE_L2_CACHE_FOR_2D_420,
    gcvFEATURE_TILE_STATUS_2BITS,
    gcvFEATURE_EXTRA_SHADER_INSTRUCTIONS0,
    gcvFEATURE_EXTRA_SHADER_INSTRUCTIONS1,
    gcvFEATURE_EXTRA_SHADER_INSTRUCTIONS2,
    gcvFEATURE_MEDIUM_PRECISION,
    gcvFEATURE_FE20_BIT_INDEX,
    gcvFEATURE_BUG_FIXES4,
    gcvFEATURE_BUG_FIXES12,
    gcvFEATURE_VMSAA,
    gcvFEATURE_ROBUST_ATOMIC,
    gcvFEATURE_32F_COLORMASK_FIX,
    gcvFEATURE_NEW_GPIPE,
    gcvFEATURE_RS_NEW_BASEADDR,
    gcvFEATURE_TX_DXT,
    gcvFEATURE_SH_FLAT_INTERPOLATION_DUAL16_FIX,
    gcvFEATURE_EVIS,
    gcvFEATURE_SH_SUPPORT_V4,
    gcvFEATURE_SH_SUPPORT_ALPHA_KILL,
    gcvFEATURE_PE_NO_ALPHA_TEST,
    gcvFEATURE_SH_SNAP2PAGE_MAXPAGES_FIX,
    gcvFEATURE_USC_FULLCACHE_FIX,
    gcvFEATURE_PE_64bit_FENCE_FIX,
    gcvFEATURE_BLT_8bit_256TILE_FC_FIX,
    gcvFEATURE_PE_RGBA16I_FIX,
    gcvFEATURE_BLT_64bpp_MASKED_CLEAR_FIX,
    gcvFEATURE_SH_PSO_MSAA1x_FIX,
    gcvFEATURE_USC_ATOMIC_FIX,
    gcvFEATURE_INDEX_CONST_ON_B0,
    gcvFEATURE_SH_NO_ONECONST_LIMIT,
    gcvFEATURE_EVIS_NO_ABSDIFF,
    gcvFEATURE_EVIS_NO_BITREPLACE,
    gcvFEATURE_EVIS_NO_BOXFILTER,
    gcvFEATURE_EVIS_NO_CORDIAC,
    gcvFEATURE_EVIS_NO_DP32,
    gcvFEATURE_EVIS_NO_FILTER,
    gcvFEATURE_EVIS_NO_IADD,
    gcvFEATURE_EVIS_NO_SELECTADD,
    gcvFEATURE_EVIS_LERP_7OUTPUT,
    gcvFEATURE_EVIS_ACCSQ_8OUTPUT,
    gcvFEATURE_ROBUSTNESS,
    gcvFEATURE_SECURITY,
    gcvFEATURE_TX_YUV_ASSEMBLER_10BIT,
    gcvFEATURE_USC_GOS_ADDR_FIX,
    gcvFEATURE_SUPPORT_MSAA2X,
    gcvFEATURE_TX_DESC_CACHE_CLOCKGATE_FIX,
    gcvFEATURE_TX_INTEGER_COORDINATE,
    gcvFEATURE_PSIO_SAMPLEMASK_IN_R0ZW_FIX,
    gcvFEATURE_MULTI_CORE_BLOCK_SET_CONFIG,
    gcvFEATURE_SH_IMG_LDST_ON_TEMP,
    gcvFEATURE_TX_INTEGER_COORDINATE_V2,
    gcvFEATURE_COMPUTE_ONLY,
    gcvFEATURE_SH_IMG_LDST_CLAMP,
    gcvFEATURE_SH_ICACHE_ALLOC_COUNT_FIX,
    gcvFEATURE_MSAA_OQ_FIX,
    gcvFEATURE_PE_ENHANCEMENTS2,
    gcvFEATURE_PSIO_MSAA_CL_FIX,
    gcvFEATURE_FE_NEED_DUMMYDRAW,
    gcvFEATURE_MULTI_CLUSTER,
    gcvFEATURE_PSIO_INTERLOCK,
    gcvFEATURE_BLIT_COMPRESS_DEST,
    gcvFEATURE_SH_MULTI_WG_PACK,
    gcvFEATURE_FE_ROBUST_FIX,
    gcvFEATURE_TX_ASTC_MULTISLICE_FIX,
    gcvFEATURE_PSIO_DUAL16_32bpc_FIX,
    gcvFEATURE_LS_SUPPORT_PER_COMP_DEPENDENCY,
    gcvFEATURE_COMPRESSION_DEC400,
    gcvFEATURE_SH_TEXLD_U_FIX,
    gcvFEATURE_TX_FLUSH_L1CACHE,
    gcvFEATURE_USC_DEFER_FILL_FIX,
    gcvFEATURE_MC_FCCACHE_BYTEMASK,
    gcvFEATURE_SH_MULTI_WG_PACK_FIX,
    gcvFEATURE_FE_PATCHLIST_FETCH_FIX,
    gcvFEATURE_RA_CG_FIX,
    gcvFEATURE_EVIS_VX2,
    gcvFEATURE_SH_HALF_DEPENDENCY_FIX,
    gcvFEATURE_FE_BASEINSTANCE,
    gcvFEATURE_FE_COMPUREINDIRECT_SKIP_UNIFORM,
    gcvFEATURE_SH_CLOCK_GATE_FIX,
    gcvFEATURE_GPIPE_CLOCK_GATE_FIX,
    gcvFEATURE_TP_ENGINE,
    gcvFEATURE_TX_BORDER_CLAMP_FIX,
    gcvFEATURE_SH_IMAGE_LD_LAST_PIXEL_FIX,
    gcvFEATURE_MULTI_CORE_BLOCK_SET_CONFIG2,
    gcvFEATURE_MULTIGPU_SYNC_V3,
    gcvFEATURE_PE_VMSAA_COVERAGE_CACHE_FIX,
    gcvFEATURE_SECURITY_AHB,
    gcvFEATURE_TX_LERP_LESS_BIT,
    gcvFEATURE_SMALL_BATCH,
    gcvFEATURE_SH_IDIV0_SWZL_EHS,
    gcvFEATURE_SH_CMPLX,
    gcvFEATURE_VIP_V7,
    gcvFEATURE_SH_GM_ENDIAN,
    gcvFEATURE_SH_GM_USC_UNALLOC,
    gcvFEATURE_SH_END_OF_BB,
    gcvFEATURE_ASYNC_BLIT,
    gcvFEATURE_ASYNC_FE_FENCE_FIX,
    gcvFEATURE_PSCS_THROTTLE,
    gcvFEATURE_SEPARATE_LS,
    gcvFEATURE_PA_VARYING_COMPONENT_TOGGLE_FIX,
    gcvFEATURE_TX_MULTISAMPLER_FC_FIX,
    gcvFEATURE_WIDELINE_TRIANGLE_EMU,
    gcvFEATURE_FENCE,
    gcvFEATURE_MCFE,
    gcvFEATURE_NN_INTERLEAVE8,
    gcvFEATURE_TP_REORDER,
    gcvFEATURE_TP_RTNE,
    gcvFEATURE_TP_LRN,
    gcvFEATURE_TP_ROI_POOLING,
    gcvFEATURE_TP_MAX_POOLING_STRIDE1,
    gcvFEATURE_NN_BRICK_MODE,
    gcvFEATURE_NN_BORDER_MODE,
    gcvFEATURE_NN_FP16_ALU,
    gcvFEATURE_NN_BF16_ALU,
    gcvFEATURE_NN_INT16_ALU,
    gcvFEATURE_NN_ZDP3,
    gcvFEATURE_NN_ZDP6,
    gcvFEATURE_PE_DEPTH_ONLY_OQFIX,
    gcvFEATURE_TX_SNORM_SUPPORT,
    gcvFEATURE_HWMANAGED_LS,
    gcvFEATURE_SH_SCATTER_GATHER,
    gcvFEATURE_NN_POWER_ISOLATION,
    gcvFEATURE_SWTILING_PHASE1,
    gcvFEATURE_SWTILING_PHASE2,
    gcvFEATURE_SWTILING_PHASE3,
    gcvFEATURE_TF_QUANTIZATION,
    gcvFEATURE_NN_XYDP9,
    gcvFEATURE_TP_SIMPLE_INT16,
    gcvFEATURE_TP_REAL_INT16,
    gcvFEATURE_NN_FIRST_PIXEL_POOLING,
    gcvFEATURE_NN_STRIDE_SUPPORT,
    gcvFEATURE_NN_XYDP6,
    gcvFEATURE_NN_XYDP0,
    gcvFEATURE_TP_REORDER_FIX,
    gcvFEATURE_NN_CONV1x1_PERF_FIX,
    gcvFEATURE_NN_CACHELINE_MODE_PERF_FIX,
    gcvFEATURE_NN_PER3DTILE_BUBBLE_FIX,
    gcvFEATURE_SH_IO_CG_FIX,
    gcvFEATURE_USC_STAY_LRU,
    gcvFEATURE_NN_NONZERO_MIRROR_BORDER,
    gcvFEATURE_NN_COEF_DECOMPRESS_PERF2X,
    gcvFEATURE_4BIT_INPUT,
    gcvFEATURE_COEF_COMPRESSION_ENHANCEMENT,
    gcvFEATURE_NN_ZDP3_NO_COMPRESS_FIX,
    gcvFEATURE_NN_ASYNC_COPY_PERF_FIX,
    gcvFEATURE_OCB_COUNTER,
    gcvFEATURE_NN_ZXDP3_KERNEL_READ_CONFLICT_FIX,
    gcvFEATURE_NN_FULLCACHE_KERNEL_INTERLEAVE_FIX,
    gcvFEATURE_DR_JD_DIFF_CONDITION_FOR_CACHELINE_MODE_PRE_FIX,
    gcvFEATURE_USC_BOTTLENECK_FIX,
    gcvFEATURE_OCB_REMAP_PHYSICAL_ADDRESS,
    gcvFEATURE_BIT_NN_HW_LIMITATION_NATIVE_KER_1x2_2x1,
    gcvFEATURE_NN_SLICE_PADDING_TO_64BYTE_ALIGN,
    gcvFEATURE_NN_DW_1x1_CONV_MERGE,
    gcvFEATURE_TP_REORDER_LAYER_SUSPEND_FIX,
    gcvFEATURE_KERNEL_VIP_SRAM_READ_BW_LIMITATION_FIX,
    gcvFEATURE_IMG_POP_PIPELINE_PAUSE_FIX,
    gcvFEATURE_NN_SLOW_OUTPUT,
    gcvFEATURE_NO_NARROW_POST_PROCESS_PIPE,
    gcvFEATURE_TP_NN_PROBE,
    gcvFEATURE_TP_23BITS_POST_MULTIPLIER,
    gcvFEATURE_NN_TRANSPOSE,
    gcvFEATURE_OUTIMAGE_X_BITWIDTH_LIMIT_FOR_NN_TRANSPOSE_FIX,
    gcvFEATURE_TP_BFLOAT16,
    gcvFEATURE_EVIS2_FLOP_RESET_FIX,
    gcvFEATURE_USC_ASYNC_CP_RTN_FLOP_RESET_FIX,
    gcvFEATURE_USC_EVICT_CTRL_FIFO_FLOP_RESET_FIX,
    gcvFEATURE_NEGATIVE_POST_SHIFT_FIX,
    gcvFEATURE_NN_COMMAND_KERNEL_REQUEST_CONFICT_FIX,
    gcvFEATURE_NN_LEAKY_RELU,
    gcvFEATURE_NN_PRELU,
    gcvFEATURE_NN_NATIVE_STRIDE_TWO,
    gcvFEATURE_NN_TENSOR_ADD,

    gcvFEATURE_IMAGE_LS_NO_FULLMASK_FIX,
    gcvFEATURE_BLT_YUV_OUTPUT,
    gcvFEATURE_PE_TILE_CACHE_FLUSH_FIX,
    gcvFEATURE_SH_ROBUSTNESS_FIX,
    gcvFEATURE_USC_ATOMIC_FIX2,
    gcvFEATURE_MULTIVIEW_RENDER,
    gcvFEATURE_FE_DRAW_DIRECT,
    gcvFEATURE_TX_VKBORDER_MODE,
    gcvFEATURE_TX_UNNORMALIZED_COORD,
    gcvFEATURE_VG_IMAGE_16K,
    gcvFEATURE_MULTICORE_CONFIG,
    gcvFEATURE_PA_LINECLIP_FIX,
    gcvFEATURE_NN_ENGINE,
    gcvFEATURE_NN_ASYNC_COPY_MERGE_FIX,
    gcvFEATURE_NN_CONVOUT_FIFO_DEPTH_FIX,
    gcvFEATURE_NN_SMALLBATCH_PHASE1,
    gcvFEATURE_TP_SMALLBATCH_PHASE1,
    gcvFEATURE_VIP_SCALER,
    gcvFEATURE_VIP_SCALER_4K,
    gcvFEATURE_TX_8bit_UVFrac_ROUNDING_FIX,
    gcvFEATURE_NN_REQ_SLOWARBITRATION_FIX,
    gcvFEATUER_IMAGE_PARTIAL_CACHE,
    gcvFEATURE_FULLCACHE_KERNELHEAD_FIX,
    gcvFEATURE_NN_SINGLEPORT_ACCUMBUFFER,
    gcvFEATURE_NN_SMALLBATCH,
    gcvFEATURE_TP_SMALLBATCH,
    gcvFEATURE_NN_ZDP_INIMAGE_SIZE_FIX,
    gcvFEATURE_HI_REORDER_FIX,
    gcvFEATURE_TP_COEF_COMPRESSION_ENHANCEMENT,
    gcvFEATURE_NN_DEPTHWISE_SUPPORT,
    gcvFEATURE_IMAGE_NOT_PACKED_IN_SRAM_FIX,
    gcvFEATURE_IDLE_BEFORE_FLUSH_COMPLETE_FIX,
    gcvFEATURE_NO_FLUSH_USC_FIX,
    gcvFEATURE_COEF_DELTA_CORD_OVERFLOW_ZRL_8BIT_FIX,
    gcvFEATURE_XY_OFFSET_LIMITATION_FIX,
    gcvFEATURE_USC_INVALIDATE_CACHE_LINE_FIX,
    gcvFEATURE_LOW_EFFICIENCY_OF_ID_WRITE_IMGBUF_FIX,
    gcvFEATURE_KERNEL_PER_CORE_LESS_THAN_THIRD_COEF_BUFF_DEPTH_FIX,
    gcvFEATURE_NN_PER_CHANNEL_QUANT,
    gcvFEATURE_NN_NO_Z_LOCATION_OFFSET,
    gcvFEATURE_NN_KERNEL_SIZE_WASTE_IN_PARTIAL_MODE_FIX,
    gcvFEATURE_INCORRECT_WR_REQ_TO_USC_BETWEEN_REORDER_AND_NORMAL_LAYER_FIX,
    gcvFEATURE_VIP_DEC400,
    gcvFEATURE_MAX_POINTSIZE_CLAMP,
    gcvFEATURE_2D_FAST_CLEAR,
    gcvFEATURE_NN_PER_CHANNEL_QUANT_ASYM,
    gcvFEATURE_SMALL_BATCH_FLOPS_RESET_FIX,
    gcvFEATURE_SMALL_BATCH_DISBLE_FIX,
    gcvFEATURE_FORMAT_10BIT_CROSS_4K,
    gcvFEATURE_ENDIAN_CONTROL,
    gcvFEATURE_SH_VX2_FLOATING_MAD_FIX,
    gcvFEATURE_PE_A8B8G8R8,
    gcvFEATURE_DEPTHWISE_NEIGHBOR_IMG_DATA_TRANSFER_NOT_EFFICIENT_FIX,


    gcvFEATURE_DST_TEX_I2F_F2I_INST_DEPRECATE,
    gcvFEATURE_ALU_FP16_INST_SUPPORT,
    gcvFEATURE_DUAL16_14BIT_PC_SUPPORT,
    gcvFEATURE_LDST_CONV_4ROUNDING_MODES,
    gcvFEATURE_FULL_PACK_MODE_SUPPORT,
    gcvFEATURE_FP32_TO_FP16_CONV_FIX,

    gcvFEATURE_SH_HAS_IMGLD_COMP_COUNT_FIX,
    gcvFEATURE_SH_SUPPORT_FP32_FMA,

    gcvFEATURE_SH_SUPPORT_VEC2_INT_MULMAD,
    gcvFEATURE_SH_SUPPORT_VEC4_INT_MULMAD,

    gcvFEATURE_SH_SUPPORT_HIGHPVEC_FORMAT,
    gcvFEATURE_SH_HAS_32BIT_NEG_OFFSET_FIX_FOR_40BIT_VA,
    gcvFEATURE_SH_SUPPORT_AIGM,


    gcvFEATURE_AI_GPU,
    gcvFEATURE_NN_FAST_FIRST_PIXEL_POOLING,
    gcvFEATURE_NN_FLOAT_POST_MULT,
    gcvFEATURE_NN_ASYMMETRIC_INT8,

    gcvFEATURE_FORMAT_YUV_I010,
    gcvFEATURE_FORMAT_YUV420_101010,
    gcvFEATURE_FORMAT_FLOATPOINT,

    gcvFEATURE_BIT_NN_COMPRESSION_BYPASSS,
    gcvFEATURE_BIT_BFLOAT_COEF_COMPRESSION_ZERO_COEFBIT14_INVERSE,
    gcvFEATURE_BIT_TP_KERNEL_1BYTE_ALGIN,
    gcvFEATURE_PREPROCESS_IMG_BUF_640BYTE_LIMIT,
    gcvFEATURE_BIT_TPLITE_BFLOAT16,
    gcvFEATURE_VIP_HW_FINAL_RELEASE,
    gcvFEATURE_OUTPUT_CONVERT_UINT8_INT8_TO_UINT16_INT16_FIX,
    gcvFEATURE_IMG_ADDR_NOT_WRAP_IF_OVER_OCB_ADDR_FIX,
    gcvFEATURE_BIT_V8_SINGLE_PORT_ACCUMULATION_BUFFER_RW_CONFICT_ZERO_SKIP_PERF_FIX,
    gcvFEATURE_BIT_BURST_COLLECT_DUMMY_DATA_WASTE_CYCLES_FIX,
    gcvFEATURE_BIT_TP_ACCESS_VIPSRAM_OT_IS_ONE_FIX,

    gcvFEATURE_BIT_USE_SINGLE_PORT_VIPSRAM,
    gcvFEATURE_VALUE_DDR_KERNEL_BURST_SIZE,
    gcvFEATURE_BIT_TILE_ACCESS_CAPABILITY,
    gcvFEATURE_BIT_FAST_DP3_PREPROCESSOR,

    gcvFEATURE_BIT_INIMG_NOT_64BYTE_ALIGN_CACHELINE_MODE_FIX,
    gcvFEATURE_BIT_DEPTHWISE_16BIT_FORMAT,

    gcvFEATURE_2D_TILESTATUS_ROTATION,
    gcvFEATURE_BIT_TP_FC_FLOAT_LAST_PIXEL_NEGATIVE_0_FIX,
    gcvFEATURE_TS_FC_VULKAN_SUPPORT,
    gcvFEATURE_BIT_V8_ACCUMLATION_READ_OUT_HAS_BUBBLES_PERF_FIX,
    gcvFEATURE_BIT_MAX_TILE_SIZE,
    gcvFEATURE_2D_TARGET_MAJOR_SUPER_TILE,
    gcvFEATURE_BIT_INIMAGE_2DTILE_NOT_LESS_160PIXEL_FIX,
    gcvFEATURE_BIT_NN_IN_TILE_DATA_IS_ALL_PAD_FIX,
    gcvFEATURE_BIT_US_SRAM_READ_INTF_FIFO_OVERFLOW_FIX,


    gcvFEATURE_TP_REORDER_INTILE_X_SIZE_512_FIX,
    gcvFEATURE_NN_WASTE_COEF_READ_WRITE_BANDWIDTH_128BYTE_VIPSRAM_IN_FULL_PATIAL_CACHE_MODE_FIX,
    gcvFEATURE_BIT_BFP_COEF_AUTO_PAD_INCOMPLETE_ZERO_IN_KZ_PLANE,
    gcvFEATURE_NN_FLOAT32_IO,
    gcvFEATURE_TP_FLOAT32_IO,

    gcvFEATURE_BIT_NN_23BITS_POST_MULTIPLIER_VIP_V7,
    gcvFEATURE_BIT_TP_23BITS_POST_MULTIPLIER_VIP_V7,
    gcvFEATURE_CONV_INT16X8BIT_VIP_V7,


    gcvFEATURE_Q_CHANNEL_SUPPORT,


    gcvFEATURE_MMU_PAGE_DESCRIPTOR,

    gcvFEATURE_BIT_NN_TILE_NUM_BIGGER_THAN_1024_FIX,

    gcvFEATURE_BIT_HI1_L2_CACHE,

    gcvFEATURE_BIT_NN_SUPPORT_CONV_1D,

    gcvFEATURE_BIT_NN_DEPTHWISE_AFTER_16BIT_LAYER_LIMIT_FIX,


    gcvFEATURE_BIT_BGR_PLANAR,

    gcvFEATURE_BIT_USC_INDIVIDUAL_PORT_WRT_EARLY_EVICT_DATA_CORRUPT_FIX,
    gcvFEATURE_BIT_NN_TP_INSTR_COMPLETE_IN_SAME_CYCLE_WITH_WAIT_EVENT_FIX,

    gcvFEATURE_BIT_TP_SOFTMAX,
    gcvFEATURE_TP_TENSOR_ADD_MUL,

    gcvFEATURE_NN_REMOVE_POOLING,
    gcvFEATURE_BIT_NN_DEPTHWISE_INT16XINT8,
    gcvFEATURE_BIT_NN_DEPTHWISE_8BIT_VIP_V7,
    gcvFEATURE_BIT_NN_ZDP_TRANSPOSE_CH9_ONLY,
    gcvFEATURE_BIT_NN_SUPPORT_DUMMY_TILE,
    gcvFEATURE_BIT_USE_VIPSRAM_FOR_KERNEL_STREAMING,
    gcvFEATURE_BIT_NN_SUPPORT_KERNEL_1BYTE_ALIGN,
    gcvFEATURE_BIT_NN_SMALL_BATCH_PHASE2,
    gcvFEATURE_SH_MOVAI_MOVAR_UNUSED_COMPONENTS_WRITE_DIRTY_DATA_FIX,
    gcvFEATURE_BIT_NN_ENHANCED_MAX_POOLING,
    gcvFEATURE_NN_1x1_NON_POOLING_PACKING,
    gcvFEATURE_BIT_NN_SUPPORT_BOTH_CONV_NATIVE_STRIDE2_AND_POOLING,
    gcvFEATURE_BIT_NN_SUPPORT_ALU,
    gcvFEATURE_BIT_NN_TRANSPOSE_PHASE2,
    gcvFEATURE_BIT_NN_FC_ENHANCEMENT,
    gcvFEATURE_BIT_NN_2ND_IMG_BASE_ADDR_FIX,
    gcvFEATURE_BIT_NN_TENSOR_ADD_FIELD_MOVE_TO_EXT_CMD,

    gcvFEATURE_IMGLD_WIDTH_LT16_FIX,
    gcvFEATURE_BIT_GPU_INSPECTOR_COUNTERS,

    gcvFEATURE_VIP_REMOVE_MMU,
    gcvFEATURE_BIT_TPLITE_SUPPORT_TP_DATA_TRANSPOSE,
    gcvFEATURE_BIT_NN_JD_DIRECT_MODE_FIX,
    gcvFEATURE_BIT_NN_CONV_CORE_BYPASS,
    gcvFEATURE_BIT_TP_REMOVE_FC,

    gcvFEATURE_BIT_HI_DEFAULT_ENABLE_REORDER_FIX,
    gcvFEATURE_BIT_NN_TENSOR_ADD_RELU,
    gcvFEATURE_BIT_NN_VIPSRAM_DOUBLE_BUFFER_FIX,

    gcvFEATURE_BIT_NN_POST_OUT_SUPPORT_FP16,
    gcvFEATURE_BIT_NN_POST_OUT_SUPPORT_BF16,
    gcvFEATURE_BIT_NN_POST_OUT_SUPPORT_FP32,
    gcvFEATURE_BIT_DEPTHWISE_FLOAT_FIX,





    gcvFEATURE_2D_FRAME_DONE_INTR,
    gcvFEATURE_BIT_NN_BURST_COLLECTER_LAST_FLAG_FIX,
    gcvFEATURE_BIT_NN_POST_MULT_SUPPORT_FP_CONV,





    gcvFEATURE_BIT_AXI_FE,
    gcvFEATURE_BIT_V83_1ST_CACHE_MODE_VIPSRAM_RD_UPDATE_FIX,
    gcvFEATURE_BIT_NN_KERNEL_MSS_SBP2_DIRECT_STEAM_STEAM_FIX,
    gcvFEATURE_BIT_NN_RD_IMG_NEED_EXTRA_SPACE,
    gcvFEATURE_BIT_V83_NUMOFPENDINGTILES_FOR_2NDIMAGE_FIX,
    gcvFEATURE_BIT_CORE_NUM_OF_KID_FOR_MULTI_LAYER_FIX,
    gcvFEATURE_BIT_USC_RW_SAME_CACHELINE_UPDATE_FIX,
    gcvFEATURE_BIT_V83_1ST_KERNEL_STREAM_BUFFER_UPDATE_FIX,
    gcvFEATURE_BIT_NN_CMD_SUPPORT_SLICE,
    gcvFEATURE_BIT_NN_HW_V83,
# 826 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_enum_shared.h"
    gcvFEATURE_ANDROID_ONLY_RESERVED,
    gcvFEATURE_2D_MULTISOURCE_PIPE,
    gcvFEATURE_2D_MASK_AND_COLORKEY,

    gcvFEATURE_BIT_V83_INTILESIZE_1X1_10BITS_FIX,
    gcvFEATURE_BIT_NN_CIRCULAR_BUF_WRAP_ADDRESS_OVERFLOW_FIX,
    gcvFEATURE_BIT_TP_CIRCULAR_BUF_WRAP_ADDRESS_OVERFLOW_FIX,
    gcvFEATURE_BIT_TP_CIRCULAR_BUF_WRAP_ADDRESS_LESS_FIX,
    gcvFEATURE_BIT_USC_PAUSE_TP_WR_REQ_MORE_THAN_256_CYCLES_FIX,

    gcvFEATURE_BIT_TP_SPECIAL_LIST_PARSER_FIX,

    gcvFEATURE_2D_STRETCH_MULTISOURCE_PIPE,

    gcvFEATURE_BIT_PA_ZEROAREA_LINE_FIX,
    gcvFEATURE_BIT_NN_JOB_CANCELATION,

    gcvFEATURE_BIT_V8_DIRECT_MODE_START_ADDR_BIAS_FOR_NEGATIVE_OFFSET_FIX,


    gcvFEATURE_BIT_BGR_PLANAR_SOURCE,

    gcvFEATURE_2D_FC_IN_DEC400EX,
    gcvFEATURE_BIT_DIRECT_INIMAGE_XSTIDE_LE_13BIT_FIX,
    gcvFEATURE_BIT_PE_64BPP_LINEAR_FORMAT,
    gcvFEATURE_BIT_NN_SUPPORT_MULTI_AXI_ID,
    gcvFEATURE_BIT_NN_STREAM_PROCESSOR,
    gcvFEATURE_BIT_TRSPB2_ENDADDR_EQUAL_SRAMEND_FIX,


    gcvFEATURE_2D_NORMALIZATION,
    gcvFEATURE_2D_NORMALIZATION_QUANTIZATION,

    gcvFEATURE_BIT_NN_SUPPORT_16_8_QUANTIZATION,
    gcvFEATURE_BIT_SPECIAL_8BIT_SIGN_ABS_CONV,
    gcvFEATURE_BIT_VIP_SUPPORT_TENSOR_TRANSFER,
    gcvFEATURE_BIT_NN_SUPPORT_CMD_LOOP,

    gcvFEATURE_BIT_NN_1ST_AND_2ND_INIMAGE_RAISE_VIPSRAM_RD_UPDATE_AT_SAME_TIME_FIX,
    gcvFEATURE_BIT_NN_1ST_AND_2ND_INIMAGE_RAISE_VIPSRAM_RD_UPDATE_AT_SAME_TIME_PHASE1_FIX,
    gcvFEATURE_BIT_NN_1ST_AND_2ND_INIMAGE_RAISE_VIPSRAM_RD_UPDATE_AT_SAME_TIME_PHASE2_FIX,
    gcvFEATURE_BIT_SECONDIMG_TILE_SIDEBANFIFO_FIX,

    gcvFEATURE_BIT_NN_4BIT_PHASE1,
    gcvFEATURE_BIT_NN_SUPPORT_DECONVNxN_S_LESS_THAN_16,
    gcvFEATURE_BIT_NN_PICOCORE_DEPTHWISE,
    gcvFEATURE_BIT_NN_SINGLE_POSTMULT_FIELDS_IN_BITSTREAM,
    gcvFEATURE_VALUE_NN_SMALL_ACCUM_BITS,
    gcvFEATURE_VALUE_NN_SMALL_ACCUM,
    gcvFEATURE_BIT_VIP_SUPPORT_X_FRAME_COMPRESSION,
    gcvFEATURE_NN_SUPPORT_EFUSE,
    gcvFEATURE_BIT_NN_WRITE_WITHOUT_USC,
    gcvFEATURE_BIT_NN_SUPPORT_CONFIGURABLE_FASTXDP3,
    gcvFEATURE_BIT_SH_SUPPORT_VEC2,
    gcvFEATURE_BIT_KERNEL_WR_RD_LUTLOAD_DIRECTMODE_ADDR_FIX,


    gcvFEATURE_COUNT
} gceFEATURE;


typedef enum _gceCHIPPOWERSTATE {
    gcvPOWER_INVALID = -1,


    gcvPOWER_ON = 0,
    gcvPOWER_IDLE,
    gcvPOWER_SUSPEND,
    gcvPOWER_OFF,


    gcvPOWER_ON_AUTO,


    gcvPOWER_FLAG_BROADCAST = 0x10,
    gcvPOWER_IDLE_BROADCAST = gcvPOWER_IDLE | gcvPOWER_FLAG_BROADCAST,
    gcvPOWER_SUSPEND_BROADCAST = gcvPOWER_SUSPEND | gcvPOWER_FLAG_BROADCAST,
    gcvPOWER_OFF_BROADCAST = gcvPOWER_OFF | gcvPOWER_FLAG_BROADCAST,


    gcvPOWER_FLAG_TIMEOUT = 0x20,
    gcvPOWER_IDLE_TIMEOUT = gcvPOWER_IDLE | gcvPOWER_FLAG_TIMEOUT,
    gcvPOWER_SUSPEND_TIMEOUT = gcvPOWER_SUSPEND | gcvPOWER_FLAG_TIMEOUT,
    gcvPOWER_OFF_TIMEOUT = gcvPOWER_OFF | gcvPOWER_FLAG_TIMEOUT,

} gceCHIPPOWERSTATE;


typedef enum _gceCACHEOPERATION {
    gcvCACHE_CLEAN = 0x01,
    gcvCACHE_INVALIDATE = 0x02,
    gcvCACHE_FLUSH = gcvCACHE_CLEAN | gcvCACHE_INVALIDATE,
    gcvCACHE_MEMORY_BARRIER = 0x04
} gceCACHEOPERATION;


typedef enum _gceSURF_TYPE {
    gcvSURF_TYPE_UNKNOWN = 0,
    gcvSURF_INDEX,
    gcvSURF_VERTEX,
    gcvSURF_TEXTURE,
    gcvSURF_RENDER_TARGET,
    gcvSURF_DEPTH,
    gcvSURF_BITMAP,
    gcvSURF_TILE_STATUS,
    gcvSURF_IMAGE,
    gcvSURF_MASK,
    gcvSURF_SCISSOR,
    gcvSURF_HIERARCHICAL_DEPTH,
    gcvSURF_ICACHE,
    gcvSURF_TXDESC,
    gcvSURF_FENCE,
    gcvSURF_TFBHEADER,
    gcvSURF_NUM_TYPES,

    gcvSURF_CMA_LIMIT = 0x80000000,

    gcvSURF_NO_TILE_STATUS = 0x100,
    gcvSURF_NO_VIDMEM = 0x200,


    gcvSURF_CACHEABLE = 0x400,
    gcvSURF_TILE_RLV_FENCE = 0x800,
    gcvSURF_TILE_STATUS_DIRTY = 0x1000,
    gcvSURF_LINEAR = 0x2000,
    gcvSURF_CREATE_AS_TEXTURE = 0x4000,
    gcvSURF_PROTECTED_CONTENT = 0x8000,
    gcvSURF_CREATE_AS_DISPLAYBUFFER = 0x10000,
    gcvSURF_CONTIGUOUS = 0x20000,
    gcvSURF_NO_COMPRESSION = 0x40000,
    gcvSURF_DEC = 0x80000,
    gcvSURF_NO_HZ = 0x100000,
    gcvSURF_3D = 0x200000,
    gcvSURF_DMABUF_EXPORTABLE = 0x400000,
    gcvSURF_CACHE_MODE_128 = 0x800000,
    gcvSURF_TILED = 0x1000000,
    gcvSURF_FORCE_32BIT_VA = 0x2000000,
    gcvSURF_LINEAR_NO_ALIGNMENT = 0x4000000,

    gcvSURF_TEXTURE_LINEAR = gcvSURF_TEXTURE
                                         | gcvSURF_LINEAR,

    gcvSURF_RENDER_TARGET_LINEAR = gcvSURF_RENDER_TARGET
                                         | gcvSURF_LINEAR,

    gcvSURF_RENDER_TARGET_NO_TILE_STATUS = gcvSURF_RENDER_TARGET
                                         | gcvSURF_NO_TILE_STATUS,

    gcvSURF_RENDER_TARGET_NO_COMPRESSION = gcvSURF_RENDER_TARGET
                                         | gcvSURF_NO_COMPRESSION,

    gcvSURF_RENDER_TARGET_TS_DIRTY = gcvSURF_RENDER_TARGET
                                         | gcvSURF_TILE_STATUS_DIRTY,

    gcvSURF_DEPTH_NO_TILE_STATUS = gcvSURF_DEPTH
                                         | gcvSURF_NO_TILE_STATUS,

    gcvSURF_DEPTH_TS_DIRTY = gcvSURF_DEPTH
                                         | gcvSURF_TILE_STATUS_DIRTY,


    gcvSURF_BITMAP_NO_VIDMEM = gcvSURF_BITMAP
                                         | gcvSURF_NO_VIDMEM,

    gcvSURF_TEXTURE_NO_VIDMEM = gcvSURF_TEXTURE
                                         | gcvSURF_NO_VIDMEM,


    gcvSURF_CACHEABLE_BITMAP_NO_VIDMEM = gcvSURF_BITMAP_NO_VIDMEM
                                         | gcvSURF_CACHEABLE,

    gcvSURF_CACHEABLE_BITMAP = gcvSURF_BITMAP
                                         | gcvSURF_CACHEABLE,

    gcvSURF_TEXTURE_3D = gcvSURF_TEXTURE
                                         | gcvSURF_3D
} gceSURF_TYPE;





typedef enum _gceSURF_FORMAT {

    gcvSURF_UNKNOWN = 0,


    gcvSURF_TEST = 1,


    gcvSURF_INDEX1 = 100,
    gcvSURF_INDEX4,
    gcvSURF_INDEX8,





    gcvSURF_A2R2G2B2 = 200,
    gcvSURF_R3G3B2,
    gcvSURF_A8R3G3B2,
    gcvSURF_X4R4G4B4,
    gcvSURF_A4R4G4B4,
    gcvSURF_R4G4B4A4,
    gcvSURF_X1R5G5B5,
    gcvSURF_A1R5G5B5,
    gcvSURF_R5G5B5A1,
    gcvSURF_R5G6B5,
    gcvSURF_R8G8B8,
    gcvSURF_X8R8G8B8,
    gcvSURF_A8R8G8B8,
    gcvSURF_R8G8B8A8,
    gcvSURF_G8R8G8B8,
    gcvSURF_R8G8B8G8,
    gcvSURF_X2R10G10B10,
    gcvSURF_A2R10G10B10,
    gcvSURF_R10G10B10A2,
    gcvSURF_X12R12G12B12,
    gcvSURF_A12R12G12B12,
    gcvSURF_X16R16G16B16,
    gcvSURF_A16R16G16B16,
    gcvSURF_A32R32G32B32,
    gcvSURF_R8G8B8X8,
    gcvSURF_R5G5B5X1,
    gcvSURF_R4G4B4X4,
    gcvSURF_X16R16G16B16_2_A8R8G8B8,
    gcvSURF_A16R16G16B16_2_A8R8G8B8,
    gcvSURF_A32R32G32B32_2_G32R32F,
    gcvSURF_A32R32G32B32_4_A8R8G8B8,
    gcvSURF_R8G8B8_PLANAR,
    gcvSURF_R8G8B8I,
    gcvSURF_R8G8B8I_PLANAR,
    gcvSURF_R16G16B16I,
    gcvSURF_R16G16B16I_PLANAR,


    gcvSURF_A4B4G4R4 = 300,
    gcvSURF_A1B5G5R5,
    gcvSURF_B5G6R5,
    gcvSURF_B8G8R8,
    gcvSURF_B16G16R16,
    gcvSURF_X8B8G8R8,
    gcvSURF_A8B8G8R8,
    gcvSURF_A2B10G10R10,
    gcvSURF_X16B16G16R16,
    gcvSURF_A16B16G16R16,
    gcvSURF_B32G32R32,
    gcvSURF_X32B32G32R32,
    gcvSURF_A32B32G32R32,
    gcvSURF_B4G4R4A4,
    gcvSURF_B5G5R5A1,
    gcvSURF_B8G8R8X8,
    gcvSURF_B8G8R8A8,
    gcvSURF_B10G10R10A2,
    gcvSURF_X4B4G4R4,
    gcvSURF_X1B5G5R5,
    gcvSURF_B4G4R4X4,
    gcvSURF_B5G5R5X1,
    gcvSURF_X2B10G10R10,
    gcvSURF_B8G8R8_SNORM,
    gcvSURF_X8B8G8R8_SNORM,
    gcvSURF_A8B8G8R8_SNORM,
    gcvSURF_A8B12G12R12_2_A8R8G8B8,
    gcvSURF_B8G8R8_PLANAR,


    gcvSURF_DXT1 = 400,
    gcvSURF_DXT2,
    gcvSURF_DXT3,
    gcvSURF_DXT4,
    gcvSURF_DXT5,
    gcvSURF_CXV8U8,
    gcvSURF_ETC1,
    gcvSURF_R11_EAC,
    gcvSURF_SIGNED_R11_EAC,
    gcvSURF_RG11_EAC,
    gcvSURF_SIGNED_RG11_EAC,
    gcvSURF_RGB8_ETC2,
    gcvSURF_SRGB8_ETC2,
    gcvSURF_RGB8_PUNCHTHROUGH_ALPHA1_ETC2,
    gcvSURF_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2,
    gcvSURF_RGBA8_ETC2_EAC,
    gcvSURF_SRGB8_ALPHA8_ETC2_EAC,
    gcvSURF_SDXT1,
    gcvSURF_SDXT3,
    gcvSURF_SDXT5,


    gcvSURF_YUY2 = 500,
    gcvSURF_UYVY,
    gcvSURF_YV12,
    gcvSURF_I420,
    gcvSURF_NV12,
    gcvSURF_NV21,
    gcvSURF_NV16,
    gcvSURF_NV61,
    gcvSURF_YVYU,
    gcvSURF_VYUY,
    gcvSURF_AYUV,
    gcvSURF_YUV420_10_ST,
    gcvSURF_YUV420_TILE_ST,
    gcvSURF_YUV420_TILE_10_ST,
    gcvSURF_NV12_10BIT,
    gcvSURF_NV21_10BIT,
    gcvSURF_NV16_10BIT,
    gcvSURF_NV61_10BIT,
    gcvSURF_P010,
    gcvSURF_P010_LSB,
    gcvSURF_I010,
    gcvSURF_I010_LSB,
    gcvSURF_YUV420_101010,
    gcvSURF_GRAY8,
# 1147 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_enum_shared.h"
    gcvSURF_D16 = 600,
    gcvSURF_D24S8,
    gcvSURF_D32,
    gcvSURF_D24X8,
    gcvSURF_D32F,
    gcvSURF_S8D32F,
    gcvSURF_S8D32F_1_G32R32F,
    gcvSURF_S8D32F_2_A8R8G8B8,
    gcvSURF_D24S8_1_A8R8G8B8,
    gcvSURF_S8,
    gcvSURF_X24S8,
    gcvSURF_X24S8_1_A8R8G8B8,


    gcvSURF_A4 = 700,
    gcvSURF_A8,
    gcvSURF_A12,
    gcvSURF_A16,
    gcvSURF_A32,
    gcvSURF_A1,


    gcvSURF_L4 = 800,
    gcvSURF_L8,
    gcvSURF_L12,
    gcvSURF_L16,
    gcvSURF_L32,
    gcvSURF_L1,
    gcvSURF_L8_RAW,


    gcvSURF_A4L4 = 900,
    gcvSURF_A2L6,
    gcvSURF_A8L8,
    gcvSURF_A4L12,
    gcvSURF_A12L12,
    gcvSURF_A16L16,

    gcvSURF_A8L8_1_A8R8G8B8,

    gcvSURF_A8L8_RAW,


    gcvSURF_L6V5U5 = 1000,
    gcvSURF_V8U8,
    gcvSURF_X8L8V8U8,
    gcvSURF_Q8W8V8U8,
    gcvSURF_A2W10V10U10,
    gcvSURF_V16U16,
    gcvSURF_Q16W16V16U16,


    gcvSURF_R8 = 1100,
    gcvSURF_X8R8,
    gcvSURF_G8R8,
    gcvSURF_X8G8R8,
    gcvSURF_A8R8,
    gcvSURF_R16,
    gcvSURF_X16R16,
    gcvSURF_G16R16,
    gcvSURF_X16G16R16,
    gcvSURF_A16R16,
    gcvSURF_R32,
    gcvSURF_X32R32,
    gcvSURF_G32R32,
    gcvSURF_X32G32R32,
    gcvSURF_A32R32,
    gcvSURF_RG16,
    gcvSURF_R8_SNORM,
    gcvSURF_G8R8_SNORM,

    gcvSURF_R8_1_X8R8G8B8,
    gcvSURF_G8R8_1_X8R8G8B8,


    gcvSURF_R16F = 1200,
    gcvSURF_X16R16F,
    gcvSURF_G16R16F,
    gcvSURF_X16G16R16F,
    gcvSURF_B16G16R16F,
    gcvSURF_X16B16G16R16F,
    gcvSURF_A16B16G16R16F,
    gcvSURF_R32F,
    gcvSURF_X32R32F,
    gcvSURF_G32R32F,
    gcvSURF_X32G32R32F,
    gcvSURF_B32G32R32F,
    gcvSURF_X32B32G32R32F,
    gcvSURF_A32B32G32R32F,
    gcvSURF_A16F,
    gcvSURF_L16F,
    gcvSURF_A16L16F,
    gcvSURF_A16R16F,
    gcvSURF_A32F,
    gcvSURF_L32F,
    gcvSURF_A32L32F,
    gcvSURF_A32R32F,
    gcvSURF_E5B9G9R9,
    gcvSURF_B10G11R11F,
    gcvSURF_B16G16R16F_PLANAR,
    gcvSURF_B32G32R32F_PLANAR,
    gcvSURF_R16G16B16F,
    gcvSURF_R32G32B32F,

    gcvSURF_GRAY16F,
    gcvSURF_GRAY32F,

    gcvSURF_X16B16G16R16F_2_A8R8G8B8,
    gcvSURF_A16B16G16R16F_2_A8R8G8B8,
    gcvSURF_A16B16G16R16F_2_G16R16F,
    gcvSURF_G32R32F_2_A8R8G8B8,
    gcvSURF_X32B32G32R32F_2_G32R32F,
    gcvSURF_A32B32G32R32F_2_G32R32F,
    gcvSURF_X32B32G32R32F_4_A8R8G8B8,
    gcvSURF_A32B32G32R32F_4_A8R8G8B8,

    gcvSURF_R16F_1_A4R4G4B4,
    gcvSURF_G16R16F_1_A8R8G8B8,
    gcvSURF_B16G16R16F_2_A8R8G8B8,

    gcvSURF_R32F_1_A8R8G8B8,
    gcvSURF_B32G32R32F_3_A8R8G8B8,
    gcvSURF_B10G11R11F_1_A8R8G8B8,

    gcvSURF_A32F_1_R32F,
    gcvSURF_L32F_1_R32F,
    gcvSURF_A32L32F_1_G32R32F,

    gcvSURF_R16G16B16F_PLANAR,
    gcvSURF_R32G32B32F_PLANAR,


    gcvSURF_SBGR8 = 1400,
    gcvSURF_A8_SBGR8,
    gcvSURF_X8_SBGR8,
    gcvSURF_A8_SRGB8,
    gcvSURF_X8_SRGB8,


    gcvSURF_R8I = 1500,
    gcvSURF_R8UI,
    gcvSURF_R16I,
    gcvSURF_R16UI,
    gcvSURF_R32I,
    gcvSURF_R32UI,
    gcvSURF_X8R8I,
    gcvSURF_G8R8I,
    gcvSURF_X8R8UI,
    gcvSURF_G8R8UI,
    gcvSURF_X16R16I,
    gcvSURF_G16R16I,
    gcvSURF_X16R16UI,
    gcvSURF_G16R16UI,
    gcvSURF_X32R32I,
    gcvSURF_G32R32I,
    gcvSURF_X32R32UI,
    gcvSURF_G32R32UI,
    gcvSURF_X8G8R8I,
    gcvSURF_B8G8R8I,
    gcvSURF_X8G8R8UI,
    gcvSURF_B8G8R8UI,
    gcvSURF_X16G16R16I,
    gcvSURF_B16G16R16I,
    gcvSURF_X16G16R16UI,
    gcvSURF_B16G16R16UI,
    gcvSURF_X32G32R32I,
    gcvSURF_B32G32R32I,
    gcvSURF_X32G32R32UI,
    gcvSURF_B32G32R32UI,
    gcvSURF_X8B8G8R8I,
    gcvSURF_A8B8G8R8I,
    gcvSURF_X8B8G8R8UI,
    gcvSURF_A8B8G8R8UI,
    gcvSURF_X16B16G16R16I,
    gcvSURF_A16B16G16R16I,
    gcvSURF_X16B16G16R16UI,
    gcvSURF_A16B16G16R16UI,
    gcvSURF_X32B32G32R32I,
    gcvSURF_A32B32G32R32I,
    gcvSURF_X32B32G32R32UI,
    gcvSURF_A32B32G32R32UI,
    gcvSURF_A2B10G10R10UI,
    gcvSURF_G32R32I_2_A8R8G8B8,
    gcvSURF_G32R32I_1_G32R32F,
    gcvSURF_G32R32UI_2_A8R8G8B8,
    gcvSURF_G32R32UI_1_G32R32F,
    gcvSURF_X16B16G16R16I_2_A8R8G8B8,
    gcvSURF_X16B16G16R16I_1_G32R32F,
    gcvSURF_A16B16G16R16I_2_A8R8G8B8,
    gcvSURF_A16B16G16R16I_1_G32R32F,
    gcvSURF_X16B16G16R16UI_2_A8R8G8B8,
    gcvSURF_X16B16G16R16UI_1_G32R32F,
    gcvSURF_A16B16G16R16UI_2_A8R8G8B8,
    gcvSURF_A16B16G16R16UI_1_G32R32F,
    gcvSURF_X32B32G32R32I_2_G32R32I,
    gcvSURF_A32B32G32R32I_2_G32R32I,
    gcvSURF_A32B32G32R32I_2_G32R32F,
    gcvSURF_X32B32G32R32I_3_A8R8G8B8,
    gcvSURF_A32B32G32R32I_4_A8R8G8B8,
    gcvSURF_X32B32G32R32UI_2_G32R32UI,
    gcvSURF_A32B32G32R32UI_2_G32R32UI,
    gcvSURF_A32B32G32R32UI_2_G32R32F,
    gcvSURF_X32B32G32R32UI_3_A8R8G8B8,
    gcvSURF_A32B32G32R32UI_4_A8R8G8B8,
    gcvSURF_A2B10G10R10UI_1_A8R8G8B8,
    gcvSURF_A8B8G8R8I_1_A8R8G8B8,
    gcvSURF_A8B8G8R8UI_1_A8R8G8B8,
    gcvSURF_R8I_1_A4R4G4B4,
    gcvSURF_R8UI_1_A4R4G4B4,
    gcvSURF_R16I_1_A4R4G4B4,
    gcvSURF_R16UI_1_A4R4G4B4,
    gcvSURF_R32I_1_A8R8G8B8,
    gcvSURF_R32UI_1_A8R8G8B8,
    gcvSURF_X8R8I_1_A4R4G4B4,
    gcvSURF_X8R8UI_1_A4R4G4B4,
    gcvSURF_G8R8I_1_A4R4G4B4,
    gcvSURF_G8R8UI_1_A4R4G4B4,
    gcvSURF_X16R16I_1_A4R4G4B4,
    gcvSURF_X16R16UI_1_A4R4G4B4,
    gcvSURF_G16R16I_1_A8R8G8B8,
    gcvSURF_G16R16UI_1_A8R8G8B8,
    gcvSURF_X32R32I_1_A8R8G8B8,
    gcvSURF_X32R32UI_1_A8R8G8B8,
    gcvSURF_X8G8R8I_1_A4R4G4B4,
    gcvSURF_X8G8R8UI_1_A4R4G4B4,
    gcvSURF_B8G8R8I_1_A8R8G8B8,
    gcvSURF_B8G8R8UI_1_A8R8G8B8,
    gcvSURF_B16G16R16I_2_A8R8G8B8,
    gcvSURF_B16G16R16I_1_G32R32F,
    gcvSURF_B16G16R16UI_2_A8R8G8B8,
    gcvSURF_B16G16R16UI_1_G32R32F,
    gcvSURF_B32G32R32I_3_A8R8G8B8,
    gcvSURF_B32G32R32UI_3_A8R8G8B8,
    gcvSURF_A16B16G16R16_2_A8R8G8B8,
    gcvSURF_R8G8B8_1_A8R8G8B8,
    gcvSURF_G16R16_1_A8R8G8B8,
    gcvSURF_A2B10G10R10_1_A8R8G8B8,
    gcvSURF_A2R10G10B10_1_A8R8G8B8,
    gcvSURF_A2W10V10U10_1_A8R8G8B8,


    gcvSURF_ASTC4x4 = 1600,
    gcvSURF_ASTC5x4,
    gcvSURF_ASTC5x5,
    gcvSURF_ASTC6x5,
    gcvSURF_ASTC6x6,
    gcvSURF_ASTC8x5,
    gcvSURF_ASTC8x6,
    gcvSURF_ASTC8x8,
    gcvSURF_ASTC10x5,
    gcvSURF_ASTC10x6,
    gcvSURF_ASTC10x8,
    gcvSURF_ASTC10x10,
    gcvSURF_ASTC12x10,
    gcvSURF_ASTC12x12,
    gcvSURF_ASTC4x4_SRGB,
    gcvSURF_ASTC5x4_SRGB,
    gcvSURF_ASTC5x5_SRGB,
    gcvSURF_ASTC6x5_SRGB,
    gcvSURF_ASTC6x6_SRGB,
    gcvSURF_ASTC8x5_SRGB,
    gcvSURF_ASTC8x6_SRGB,
    gcvSURF_ASTC8x8_SRGB,
    gcvSURF_ASTC10x5_SRGB,
    gcvSURF_ASTC10x6_SRGB,
    gcvSURF_ASTC10x8_SRGB,
    gcvSURF_ASTC10x10_SRGB,
    gcvSURF_ASTC12x10_SRGB,
    gcvSURF_ASTC12x12_SRGB,


    gcvSURF_L16_1_A4R4G4B4 = 1700,
    gcvSURF_V16U16_1_A8R8G8B8,
    gcvSURF_Q8W8V8U8_1_A8R8G8B8,
    gcvSURF_X8L8V8U8_1_A8R8G8B8,
    gcvSURF_R3G3B2_1_A8R8G8B8,
    gcvSURF_A8R3G3B2_1_A8R8G8B8,
    gcvSURF_W11V11U10_1_A8R8G8B8,
    gcvSURF_Q16W16V16U16_2_A8R8G8B8,
    gcvSURF_W11V11U10,
    gcvSURF_V8U8_1_A4R4G4B4,
    gcvSURF_A8B8G8R8_1_A8R8G8B8,
    gcvSURF_A32R32G32B32_1_A8R8G8B8,
    gcvSURF_X16B16G16R16F_1_A8R8G8B8,
    gcvSURF_A16B16G16R16F_1_A8R8G8B8,
    gcvSURF_G32R32F_1_A8R8G8B8,
    gcvSURF_X32B32G32R32F_1_A8R8G8B8,
    gcvSURF_A32B32G32R32F_1_A8R8G8B8,
    gcvSURF_G32R32I_1_A8R8G8B8,
    gcvSURF_G32R32UI_1_A8R8G8B8,
    gcvSURF_A32B32G32R32I_1_A8R8G8B8,
    gcvSURF_A32B32G32R32UI_1_A8R8G8B8,
    gcvSURF_Q16W16V16U16_1_A8R8G8B8,
    gcvSURF_A16B16G16R16_1_A8R8G8B8,


    gcvSURF_R10G10B10A2UI = 1800,
    gcvSURF_R5G6B5UI,
    gcvSURF_B5G6R5UI,
    gcvSURF_R3G3B2UI,
    gcvSURF_B2G3R3UI,
    gcvSURF_R4G4B4A4UI,
    gcvSURF_A4B4G4R4UI,
    gcvSURF_R5G5B5A1UI,
    gcvSURF_A1B5G5R5UI,
    gcvSURF_R8G8B8A8UI,


    gcvSURF_G8 = 1900,
    gcvSURF_B8,
    gcvSURF_G32F,
    gcvSURF_B32F,


    gcvSURF_I4 = 2000,
    gcvSURF_I8,
    gcvSURF_I12,
    gcvSURF_I16,
} gceSURF_FORMAT;


typedef enum _gcePIPE_SELECT {
    gcvPIPE_INVALID = ~0,
    gcvPIPE_3D = 0,
    gcvPIPE_2D
} gcePIPE_SELECT;


typedef enum _gceHARDWARE_TYPE {
    gcvHARDWARE_INVALID,
    gcvHARDWARE_3D2D,
    gcvHARDWARE_3D,
    gcvHARDWARE_2D,
    gcvHARDWARE_VIP,
    gcvHARDWARE_VG,
    gcvHARDWARE_NUM_TYPES,
} gceHARDWARE_TYPE;


typedef enum _gceUSER_SIGNAL_COMMAND_CODES {
    gcvUSER_SIGNAL_CREATE,
    gcvUSER_SIGNAL_DESTROY,
    gcvUSER_SIGNAL_SIGNAL,
    gcvUSER_SIGNAL_WAIT,
    gcvUSER_SIGNAL_MAP,
    gcvUSER_SIGNAL_UNMAP,
} gceUSER_SIGNAL_COMMAND_CODES;


typedef enum _gceSHBUF_COMMAND_CODES {
    gcvSHBUF_CREATE,
    gcvSHBUF_DESTROY,
    gcvSHBUF_MAP,
    gcvSHBUF_WRITE,
    gcvSHBUF_READ,
} gceSHBUF_COMMAND_CODES;


typedef enum _gceKERNEL_WHERE {
    gcvKERNEL_COMMAND,
    gcvKERNEL_VERTEX,
    gcvKERNEL_TRIANGLE,
    gcvKERNEL_TEXTURE,
    gcvKERNEL_PIXEL,
    gcvKERNEL_BLT,
} gceKERNEL_WHERE;

typedef enum _gceBLOCK {
    gcvBLOCK_COMMAND,
    gcvBLOCK_TESSELLATOR,
    gcvBLOCK_TESSELLATOR2,
    gcvBLOCK_TESSELLATOR3,
    gcvBLOCK_RASTER,
    gcvBLOCK_VG,
    gcvBLOCK_VG2,
    gcvBLOCK_VG3,
    gcvBLOCK_PIXEL,


    gcvBLOCK_COUNT
} gceBLOCK;

typedef enum _gceCORE_3D_MASK {
    gcvCORE_3D_0_MASK = (1 << 0),
    gcvCORE_3D_1_MASK = (1 << 1),

    gcvCORE_3D_ALL_MASK = (0xFFFF)
} gceCORE_3D_MASK;

typedef enum _gceCORE_3D_ID {
    gcvCORE_3D_0_ID = 0,
    gcvCORE_3D_1_ID = 1,

    gcvCORE_3D_ID_INVALID = ~0UL
} gceCORE_3D_ID;

typedef enum _gceCORE_2D_MASK {
    gcvCORE_2D_0_MASK = (1 << 0),
    gcvCORE_2D_1_MASK = (1 << 1),
    gcvCORE_2D_2_MASK = (1 << 2),
    gcvCORE_2D_3_MASK = (1 << 3),

    gcvCORE_2D_ALL_MASK = (0xFFFF)
} gceCORE_2D_MASK;

typedef enum _gceCORE_2D_ID {
    gcvCORE_2D_0_ID = 0,
    gcvCORE_2D_1_ID = 1,

    gcvCORE_2D_ID_INVALID = ~0UL
} gceCORE_2D_ID;


typedef enum _gceCHIP_FLAG {
    gcvCHIP_FLAG_MSAA_COHERENCEY_ECO_FIX = 1 << 0,
    gcvCHIP_FLAG_GC2000_R2 = 1 << 1,
    gcvCHIP_AXI_BUS128_BITS = 1 << 2,
} gceCHIP_FLAG;




typedef enum {
    gcvENGINE_RENDER = 0,
    gcvENGINE_BLT = 1,
    gcvENGINE_GPU_ENGINE_COUNT = 2,
    gcvENGINE_CPU = gcvENGINE_GPU_ENGINE_COUNT,
    gcvENGINE_ALL_COUNT = gcvENGINE_CPU + 1,
    gcvENGINE_INVALID = gcvENGINE_ALL_COUNT + 0x100
} gceENGINE;


typedef enum _gceCORE {
    gcvCORE_MAJOR,
    gcvCORE_3D1,
    gcvCORE_3D2,
    gcvCORE_3D3,
    gcvCORE_3D4,
    gcvCORE_3D5,
    gcvCORE_3D6,
    gcvCORE_3D7,
    gcvCORE_3D8,
    gcvCORE_3D9,
    gcvCORE_3D10,
    gcvCORE_3D11,
    gcvCORE_3D12,
    gcvCORE_3D13,
    gcvCORE_3D14,
    gcvCORE_3D15,
    gcvCORE_3D_MAX = gcvCORE_3D15,
    gcvCORE_2D,
    gcvCORE_2D1,
    gcvCORE_2D2,
    gcvCORE_2D3,
    gcvCORE_2D_MAX = gcvCORE_2D3,
    gcvCORE_VG,



    gcvCORE_COUNT
} gceCORE;
# 1643 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_enum_shared.h"
typedef enum _gceSECURE_MODE {

    gcvSECURE_NONE,





    gcvSECURE_IN_NORMAL,


    gcvSECURE_IN_TA
} gceSECURE_MODE;




typedef enum _gceCOMPRESSION_OPTION {
    gcvCOMPRESSION_OPTION_NONE = 0x0,
    gcvCOMPRESSION_OPTION_COLOR = 0x1,
    gcvCOMPRESSION_OPTION_DEPTH = 0x2,
    gcvCOMPRESSION_OPTION_MSAA_COLOR = 0x4,
    gcvCOMPRESSION_OPTION_MSAA_DEPTH = 0x8,


    gcvCOMPRESSION_OPTION_DEFAULT = gcvCOMPRESSION_OPTION_DEPTH |
                                       gcvCOMPRESSION_OPTION_COLOR |
                                       gcvCOMPRESSION_OPTION_MSAA_COLOR |
                                       gcvCOMPRESSION_OPTION_MSAA_DEPTH,
} gceCOMPRESSION_OPTION;

typedef enum _gceSRAM_INTERNAL {
    gcvSRAM_INTERNAL0 = 0,
    gcvSRAM_INTERNAL1,

    gcvSRAM_INTER_COUNT
} gceSRAM_INTERNAL;

typedef enum _gceFLATMAP_FLAG {
    gcvFLATMAP_DIRECT,
    gcvFLATMAP_SHIFT,
} gceFLATMAP_FLAG;


typedef enum _gceVIDMEM_TYPE {
    gcvVIDMEM_TYPE_GENERIC = gcvSURF_TYPE_UNKNOWN,
    gcvVIDMEM_TYPE_INDEX_BUFFER = gcvSURF_INDEX,
    gcvVIDMEM_TYPE_VERTEX_BUFFER = gcvSURF_VERTEX,
    gcvVIDMEM_TYPE_TEXTURE = gcvSURF_TEXTURE,
    gcvVIDMEM_TYPE_COLOR_BUFFER = gcvSURF_RENDER_TARGET,
    gcvVIDMEM_TYPE_DEPTH_BUFFER = gcvSURF_DEPTH,
    gcvVIDMEM_TYPE_BITMAP = gcvSURF_BITMAP,
    gcvVIDMEM_TYPE_TILE_STATUS = gcvSURF_TILE_STATUS,
    gcvVIDMEM_TYPE_IMAGE = gcvSURF_IMAGE,
    gcvVIDMEM_TYPE_MASK = gcvSURF_MASK,
    gcvVIDMEM_TYPE_SCISSOR = gcvSURF_SCISSOR,
    gcvVIDMEM_TYPE_HZ_BUFFER = gcvSURF_HIERARCHICAL_DEPTH,
    gcvVIDMEM_TYPE_ICACHE = gcvSURF_ICACHE,
    gcvVIDMEM_TYPE_TXDESC = gcvSURF_TXDESC,
    gcvVIDMEM_TYPE_FENCE = gcvSURF_FENCE,
    gcvVIDMEM_TYPE_TFBHEADER = gcvSURF_TFBHEADER,
    gcvVIDMEM_TYPE_COMMAND,
    gcvVIDMEM_TYPE_COUNT
} gceVIDMEM_TYPE;

typedef enum _gceTASK {
    gcvTASK_LINK,
    gcvTASK_CLUSTER,
    gcvTASK_INCREMENT,
    gcvTASK_DECREMENT,
    gcvTASK_SIGNAL,
    gcvTASK_LOCKDOWN,
    gcvTASK_UNLOCK_VIDEO_MEMORY,
    gcvTASK_FREE_VIDEO_MEMORY,
    gcvTASK_FREE_CONTIGUOUS_MEMORY,
} gceTASK;





typedef enum _gceSTATUS {
    gcvSTATUS_OK = 0,
    gcvSTATUS_FALSE = 0,
    gcvSTATUS_TRUE = 1,
    gcvSTATUS_NO_MORE_DATA = 2,
    gcvSTATUS_CACHED = 3,
    gcvSTATUS_MIPMAP_TOO_LARGE = 4,
    gcvSTATUS_NAME_NOT_FOUND = 5,
    gcvSTATUS_NOT_OUR_INTERRUPT = 6,
    gcvSTATUS_MISMATCH = 7,
    gcvSTATUS_MIPMAP_TOO_SMALL = 8,
    gcvSTATUS_LARGER = 9,
    gcvSTATUS_SMALLER = 10,
    gcvSTATUS_CHIP_NOT_READY = 11,
    gcvSTATUS_NEED_CONVERSION = 12,
    gcvSTATUS_SKIP = 13,
    gcvSTATUS_DATA_TOO_LARGE = 14,
    gcvSTATUS_INVALID_CONFIG = 15,
    gcvSTATUS_CHANGED = 16,
    gcvSTATUS_NOT_SUPPORT_DITHER = 17,
    gcvSTATUS_EXECUTED = 18,
    gcvSTATUS_TERMINATE = 19,

    gcvSTATUS_INVALID_ARGUMENT = -1,
    gcvSTATUS_INVALID_OBJECT = -2,
    gcvSTATUS_OUT_OF_MEMORY = -3,
    gcvSTATUS_MEMORY_LOCKED = -4,
    gcvSTATUS_MEMORY_UNLOCKED = -5,
    gcvSTATUS_HEAP_CORRUPTED = -6,
    gcvSTATUS_GENERIC_IO = -7,
    gcvSTATUS_INVALID_ADDRESS = -8,
    gcvSTATUS_CONTEXT_LOSSED = -9,
    gcvSTATUS_TOO_COMPLEX = -10,
    gcvSTATUS_BUFFER_TOO_SMALL = -11,
    gcvSTATUS_INTERFACE_ERROR = -12,
    gcvSTATUS_NOT_SUPPORTED = -13,
    gcvSTATUS_MORE_DATA = -14,
    gcvSTATUS_TIMEOUT = -15,
    gcvSTATUS_OUT_OF_RESOURCES = -16,
    gcvSTATUS_INVALID_DATA = -17,
    gcvSTATUS_INVALID_MIPMAP = -18,
    gcvSTATUS_NOT_FOUND = -19,
    gcvSTATUS_NOT_ALIGNED = -20,
    gcvSTATUS_INVALID_REQUEST = -21,
    gcvSTATUS_GPU_NOT_RESPONDING = -22,
    gcvSTATUS_TIMER_OVERFLOW = -23,
    gcvSTATUS_VERSION_MISMATCH = -24,
    gcvSTATUS_LOCKED = -25,
    gcvSTATUS_INTERRUPTED = -26,
    gcvSTATUS_DEVICE = -27,
    gcvSTATUS_NOT_MULTI_PIPE_ALIGNED = -28,
    gcvSTATUS_OUT_OF_SAMPLER = -29,
    gcvSTATUS_PROBE_LATER = -30,
    gcvSTATUS_RESLUT_OVERFLOW = -31,
    gcvSTATUS_RECOVERY = -32,
    gcvSTATUS_CANCEL_JOB = -33,


    gcvSTATUS_GLOBAL_TYPE_MISMATCH = -1000,
    gcvSTATUS_TOO_MANY_ATTRIBUTES = -1001,
    gcvSTATUS_TOO_MANY_UNIFORMS = -1002,
    gcvSTATUS_TOO_MANY_VARYINGS = -1003,
    gcvSTATUS_UNDECLARED_VARYING = -1004,
    gcvSTATUS_VARYING_TYPE_MISMATCH = -1005,
    gcvSTATUS_MISSING_MAIN = -1006,
    gcvSTATUS_NAME_MISMATCH = -1007,
    gcvSTATUS_INVALID_INDEX = -1008,
    gcvSTATUS_UNIFORM_MISMATCH = -1009,
    gcvSTATUS_UNSAT_LIB_SYMBOL = -1010,
    gcvSTATUS_TOO_MANY_SHADERS = -1011,
    gcvSTATUS_LINK_INVALID_SHADERS = -1012,
    gcvSTATUS_CS_NO_WORKGROUP_SIZE = -1013,
    gcvSTATUS_LINK_LIB_ERROR = -1014,

    gcvSTATUS_SHADER_VERSION_MISMATCH = -1015,
    gcvSTATUS_TOO_MANY_INSTRUCTION = -1016,
    gcvSTATUS_SSBO_MISMATCH = -1017,
    gcvSTATUS_TOO_MANY_OUTPUT = -1018,
    gcvSTATUS_TOO_MANY_INPUT = -1019,
    gcvSTATUS_NOT_SUPPORT_CL = -1020,
    gcvSTATUS_NOT_SUPPORT_INTEGER = -1021,
    gcvSTATUS_UNIFORM_TYPE_MISMATCH = -1022,

    gcvSTATUS_MISSING_PRIMITIVE_TYPE = -1023,
    gcvSTATUS_MISSING_OUTPUT_VERTEX_COUNT = -1024,
    gcvSTATUS_NON_INVOCATION_ID_AS_INDEX = -1025,
    gcvSTATUS_INPUT_ARRAY_SIZE_MISMATCH = -1026,
    gcvSTATUS_OUTPUT_ARRAY_SIZE_MISMATCH = -1027,
    gcvSTATUS_LOCATION_ALIASED = -1028,
    gcvSTATUS_LOCATION_OVERLAP = -1029,
    gcvSTATUS_LOCATION_NOTCONSISTENT = -1030,


    gcvSTATUS_COMPILER_FE_PREPROCESSOR_ERROR = -2000,
    gcvSTATUS_COMPILER_FE_PARSER_ERROR = -2001,


    gcvSTATUS_RECOMPILER_CONVERT_UNIMPLEMENTED = -3000,
} gceSTATUS;


enum _gceHAL_PATCH_TYPE {
    gcvHAL_PATCH_VIDMEM_ADDRESS = 1,
    gcvHAL_PATCH_MCFE_SEMAPHORE,
    gcvHAL_PATCH_VIDMEM_TIMESTAMP,


    gcvHAL_PATCH_TYPE_COUNT,
};





typedef enum _gceHAL_COMMAND_CODES {



    gcvHAL_CHIP_INFO,


    gcvHAL_VERSION,


    gcvHAL_QUERY_CHIP_IDENTITY,
    gcvHAL_QUERY_CHIP_OPTION,


    gcvHAL_QUERY_CHIP_FREQUENCY,


    gcvHAL_QUERY_VIDEO_MEMORY,


    gcvHAL_ALLOCATE_LINEAR_VIDEO_MEMORY,
    gcvHAL_WRAP_USER_MEMORY,
    gcvHAL_RELEASE_VIDEO_MEMORY,
    gcvHAL_LOCK_VIDEO_MEMORY,
    gcvHAL_UNLOCK_VIDEO_MEMORY,
    gcvHAL_BOTTOM_HALF_UNLOCK_VIDEO_MEMORY,
    gcvHAL_MAP_MEMORY,
    gcvHAL_UNMAP_MEMORY,


    gcvHAL_CACHE,


    gcvHAL_ATTACH,
    gcvHAL_DETACH,


    gcvHAL_EVENT_COMMIT,


    gcvHAL_COMMIT,


    gcvHAL_SET_TIMEOUT,


    gcvHAL_USER_SIGNAL,


    gcvHAL_SIGNAL,


    gcvHAL_SET_PROFILE_SETTING,
    gcvHAL_READ_PROFILER_REGISTER_SETTING,
    gcvHAL_READ_ALL_PROFILE_REGISTERS_PART1,
    gcvHAL_READ_ALL_PROFILE_REGISTERS_PART2,


    gcvHAL_DATABASE,


    gcvHAL_CONFIG_POWER_MANAGEMENT,


    gcvHAL_DEBUG_DUMP,





    gcvHAL_READ_REGISTER,
    gcvHAL_WRITE_REGISTER,
    gcvHAL_PROFILE_REGISTERS_2D,


    gcvHAL_GET_BASE_ADDRESS,


    gcvHAL_GET_FRAME_INFO,


    gcvHAL_SET_VIDEO_MEMORY_METADATA,


    gcvHAL_QUERY_COMMAND_BUFFER,


    gcvHAL_QUERY_RESET_TIME_STAMP,


    gcvHAL_CREATE_NATIVE_FENCE,


    gcvHAL_WAIT_NATIVE_FENCE,


    gcvHAL_WAIT_FENCE,


    gcvHAL_EXPORT_VIDEO_MEMORY,
    gcvHAL_NAME_VIDEO_MEMORY,
    gcvHAL_IMPORT_VIDEO_MEMORY,


    gcvHAL_DEVICE_MUTEX,




    gcvHAL_DEC200_TEST,


    gcvHAL_DEC300_READ,
    gcvHAL_DEC300_WRITE,
    gcvHAL_DEC300_FLUSH,
    gcvHAL_DEC300_FLUSH_WAIT,





    gcvHAL_SHBUF,


    gcvHAL_GET_GRAPHIC_BUFFER_FD,


    gcvHAL_UPDATE_DEBUG_CALLBACK,
    gcvHAL_CONFIG_CTX_FRAMEWORK,


    gcvHAL_ALLOCATE_NON_PAGED_MEMORY,
    gcvHAL_FREE_NON_PAGED_MEMORY,


    gcvHAL_WRITE_DATA,





    gcvHAL_APB_AXIFE_ACCESS,


    gcvHAL_RESET,


    gcvHAL_COMMIT_DONE,


    gcvHAL_GET_VIDEO_MEMORY_FD,


    gcvHAL_GET_PROFILE_SETTING,


    gcvHAL_READ_REGISTER_EX,
    gcvHAL_WRITE_REGISTER_EX,


    gcvHAL_SET_POWER_MANAGEMENT_STATE,
    gcvHAL_QUERY_POWER_MANAGEMENT_STATE,


    gcvHAL_QUERY_CPU_FREQUENCY,


    gcvHAL_DUMP_GPU_STATE,


    gcvHAL_SYNC_VIDEO_MEMORY,


    gcvHAL_CANCEL_JOB,


    gcvHAL_TIMESTAMP,


    gcvHAL_SET_FSCALE_VALUE,
    gcvHAL_GET_FSCALE_VALUE,


    gcvHAL_DESTROY_MMU,


} gceHAL_COMMAND_CODES;
# 2040 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_enum_shared.h"
typedef enum _gceOBJECT_TYPE {
    gcvOBJ_UNKNOWN = 0,
    gcvOBJ_2D = ( (char)('2') | ((char)('D') << 8) | ((char)(' ') << 16) | ((char)(' ') << 24) ),
    gcvOBJ_3D = ( (char)('3') | ((char)('D') << 8) | ((char)(' ') << 16) | ((char)(' ') << 24) ),
    gcvOBJ_ATTRIBUTE = ( (char)('A') | ((char)('T') << 8) | ((char)('T') << 16) | ((char)('R') << 24) ),
    gcvOBJ_BRUSHCACHE = ( (char)('B') | ((char)('R') << 8) | ((char)('U') << 16) | ((char)('$') << 24) ),
    gcvOBJ_BRUSHNODE = ( (char)('B') | ((char)('R') << 8) | ((char)('U') << 16) | ((char)('n') << 24) ),
    gcvOBJ_BRUSH = ( (char)('B') | ((char)('R') << 8) | ((char)('U') << 16) | ((char)('o') << 24) ),
    gcvOBJ_BUFFER = ( (char)('B') | ((char)('U') << 8) | ((char)('F') << 16) | ((char)('R') << 24) ),
    gcvOBJ_COMMAND = ( (char)('C') | ((char)('M') << 8) | ((char)('D') << 16) | ((char)(' ') << 24) ),
    gcvOBJ_COMMANDBUFFER = ( (char)('C') | ((char)('M') << 8) | ((char)('D') << 16) | ((char)('B') << 24) ),
    gcvOBJ_CONTEXT = ( (char)('C') | ((char)('T') << 8) | ((char)('X') << 16) | ((char)('T') << 24) ),
    gcvOBJ_DEVICE = ( (char)('D') | ((char)('E') << 8) | ((char)('V') << 16) | ((char)(' ') << 24) ),
    gcvOBJ_DUMP = ( (char)('D') | ((char)('U') << 8) | ((char)('M') << 16) | ((char)('P') << 24) ),
    gcvOBJ_EVENT = ( (char)('E') | ((char)('V') << 8) | ((char)('N') << 16) | ((char)('T') << 24) ),
    gcvOBJ_FUNCTION = ( (char)('F') | ((char)('U') << 8) | ((char)('N') << 16) | ((char)('C') << 24) ),
    gcvOBJ_HAL = ( (char)('H') | ((char)('A') << 8) | ((char)('L') << 16) | ((char)(' ') << 24) ),
    gcvOBJ_HARDWARE = ( (char)('H') | ((char)('A') << 8) | ((char)('R') << 16) | ((char)('D') << 24) ),
    gcvOBJ_HEAP = ( (char)('H') | ((char)('E') << 8) | ((char)('A') << 16) | ((char)('P') << 24) ),
    gcvOBJ_INDEX = ( (char)('I') | ((char)('N') << 8) | ((char)('D') << 16) | ((char)('X') << 24) ),
    gcvOBJ_INTERRUPT = ( (char)('I') | ((char)('N') << 8) | ((char)('T') << 16) | ((char)('R') << 24) ),
    gcvOBJ_KERNEL = ( (char)('K') | ((char)('E') << 8) | ((char)('R') << 16) | ((char)('N') << 24) ),
    gcvOBJ_KERNEL_FUNCTION = ( (char)('K') | ((char)('F') << 8) | ((char)('C') << 16) | ((char)('N') << 24) ),
    gcvOBJ_MEMORYBUFFER = ( (char)('M') | ((char)('E') << 8) | ((char)('M') << 16) | ((char)('B') << 24) ),
    gcvOBJ_MMU = ( (char)('M') | ((char)('M') << 8) | ((char)('U') << 16) | ((char)(' ') << 24) ),
    gcvOBJ_OS = ( (char)('O') | ((char)('S') << 8) | ((char)(' ') << 16) | ((char)(' ') << 24) ),
    gcvOBJ_OUTPUT = ( (char)('O') | ((char)('U') << 8) | ((char)('T') << 16) | ((char)('P') << 24) ),
    gcvOBJ_PAINT = ( (char)('P') | ((char)('N') << 8) | ((char)('T') << 16) | ((char)(' ') << 24) ),
    gcvOBJ_PATH = ( (char)('P') | ((char)('A') << 8) | ((char)('T') << 16) | ((char)('H') << 24) ),
    gcvOBJ_QUEUE = ( (char)('Q') | ((char)('U') << 8) | ((char)('E') << 16) | ((char)(' ') << 24) ),
    gcvOBJ_SAMPLER = ( (char)('S') | ((char)('A') << 8) | ((char)('M') << 16) | ((char)('P') << 24) ),
    gcvOBJ_SHADER = ( (char)('S') | ((char)('H') << 8) | ((char)('D') << 16) | ((char)('R') << 24) ),
    gcvOBJ_VIR_SHADER = ( (char)('V') | ((char)('S') << 8) | ((char)('D') << 16) | ((char)('R') << 24) ),
    gcvOBJ_STREAM = ( (char)('S') | ((char)('T') << 8) | ((char)('R') << 16) | ((char)('M') << 24) ),
    gcvOBJ_SURF = ( (char)('S') | ((char)('U') << 8) | ((char)('R') << 16) | ((char)('F') << 24) ),
    gcvOBJ_TEXTURE = ( (char)('T') | ((char)('X') << 8) | ((char)('T') << 16) | ((char)('R') << 24) ),
    gcvOBJ_UNIFORM = ( (char)('U') | ((char)('N') << 8) | ((char)('I') << 16) | ((char)('F') << 24) ),
    gcvOBJ_VARIABLE = ( (char)('V') | ((char)('A') << 8) | ((char)('R') << 16) | ((char)('I') << 24) ),
    gcvOBJ_VERTEX = ( (char)('V') | ((char)('R') << 8) | ((char)('T') << 16) | ((char)('X') << 24) ),
    gcvOBJ_VIDMEM = ( (char)('V') | ((char)('M') << 8) | ((char)('E') << 16) | ((char)('M') << 24) ),
    gcvOBJ_VIDMEM_BLOCK = ( (char)('V') | ((char)('M') << 8) | ((char)('B') << 16) | ((char)('K') << 24) ),
    gcvOBJ_VG = ( (char)('V') | ((char)('G') << 8) | ((char)(' ') << 16) | ((char)(' ') << 24) ),
    gcvOBJ_BUFOBJ = ( (char)('B') | ((char)('U') << 8) | ((char)('F') << 16) | ((char)('O') << 24) ),
    gcvOBJ_UNIFORM_BLOCK = ( (char)('U') | ((char)('B') << 8) | ((char)('L') << 16) | ((char)('K') << 24) ),
    gcvOBJ_CL = ( (char)('C') | ((char)('L') << 8) | ((char)(' ') << 16) | ((char)(' ') << 24) ),
    gcvOBJ_STORAGE_BLOCK = ( (char)('S') | ((char)('B') << 8) | ((char)('L') << 16) | ((char)('K') << 24) ),
    gcvOBJ_IO_BLOCK = ( (char)('I') | ((char)('O') << 8) | ((char)('B') << 16) | ((char)('K') << 24) ),
} gceOBJECT_TYPE;


typedef enum _gcePOOL {
    gcvPOOL_UNKNOWN = 0,
    gcvPOOL_DEFAULT,
    gcvPOOL_LOCAL,
    gcvPOOL_LOCAL_INTERNAL,
    gcvPOOL_LOCAL_EXTERNAL,
    gcvPOOL_UNIFIED,
    gcvPOOL_SYSTEM,
    gcvPOOL_VIRTUAL,
    gcvPOOL_USER,
    gcvPOOL_INTERNAL_SRAM,
    gcvPOOL_EXTERNAL_SRAM,
    gcvPOOL_LOCAL_EXCLUSIVE,
    gcvPOOL_SYSTEM_32BIT_VA,

    gcvPOOL_NUMBER_OF_POOLS
} gcePOOL;

typedef enum _gceDUMP_BUFFER_TYPE {
    gcvDUMP_BUFFER_USER_STRING,
    gcvDUMP_BUFFER_VERIFY,

    gcvDUMP_BUFFER_MEMORY,
    gcvDUMP_BUFFER_TEXTURE,
    gcvDUMP_BUFFER_STREAM,
    gcvDUMP_BUFFER_INDEX,
    gcvDUMP_BUFFER_BUFOBJ,
    gcvDUMP_BUFFER_IMAGE,

    gcvDUMP_BUFFER_INSTRUCTION,
    gcvDUMP_BUFFER_CONTEXT,
    gcvDUMP_BUFFER_COMMAND,
    gcvDUMP_BUFFER_ASYNC_COMMAND,
    gcvDUMP_BUFFER_USER_TYPE_LAST = gcvDUMP_BUFFER_ASYNC_COMMAND,

    gcvDUMP_BUFFER_KERNEL_CONTEXT,
    gcvDUMP_BUFFER_KERNEL_COMMAND,

    gcvDUMP_BUFFER_PHYSICAL_MEMORY,

    gcvDUMP_BUFFER_TYPE_COUNT,
} gceDUMP_BUFFER_TYPE;

typedef enum _gceLOCK_VIDEO_MEMORY_OP {
    gcvLOCK_VIDEO_MEMORY_OP_NONE = 0x00,
    gcvLOCK_VIDEO_MEMORY_OP_LOCK = 0x01,
    gcvLOCK_VIDEO_MEMORY_OP_MAP = 0x02,
    gcvLOCK_VIDEO_MEMORY_OP_UNLOCK = 0x04,
    gcvLOCK_VIDEO_MEMORY_OP_UNMAP = 0x08,
} gceLOCK_VIDEO_MEMORY_OP;

typedef enum _gceSIGNAL_STATUS {
    gcvSIGNAL_OK = 0,
    gcvSIGNAL_RECOVERY,
    gcvSIGNAL_CANCEL,
} gceSIGNAL_STATUS;
# 2161 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_enum_shared.h"
typedef enum _gceProfilerMode {
    gcvPROFILER_UNKNOWN_MODE = 0,
    gcvPROFILER_PROBE_MODE,
    gcvPROFILER_AHB_MODE,
} gceProfilerMode;

typedef enum _gceProbeMode {
    gcvPROFILER_UNKNOWN_PROBE = 0,
    gcvPROFILER_GPU_PROBE,
    gcvPROFILER_VIP_PROBE,
} gceProbeMode;

typedef enum _gceMULTI_PROCESSOR_MODE {
    gcvMP_MODE_COMBINED = 0,
    gcvMP_MODE_INDEPENDENT = 1
} gceMULTI_PROCESSOR_MODE;

typedef enum _gceSwitchMpMode {
    gcvMP_MODE_NO_SWITCH = 0,
    gcvMP_MODE_SWITCH_TO_SINGLE,
    gcvMP_MODE_SWITCH_TO_MULTI,
} gceSwitchMpMode;
# 60 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h" 2






typedef enum _gceDUMMY_DRAW_TYPE {
    gcvDUMMY_DRAW_INVALID = 0,
    gcvDUMMY_DRAW_GC400,
    gcvDUMMY_DRAW_V60,
} gceDUMMY_DRAW_TYPE;


typedef enum _gceOPTION {

    gcvOPTION_PREFER_ZCONVERT_BYPASS = 0,
    gcvOPTION_PREFER_TILED_DISPLAY_BUFFER = 1,
    gcvOPTION_PREFER_GUARDBAND = 2,
    gcvOPTION_PREFER_TPG_TRIVIALMODEL = 3,
    gcvOPTION_PREFER_RA_DEPTH_WRITE = 4,
    gcvOPTION_PREFER_USC_RECONFIG = 5,
    gcvOPTION_PREFER_DISALBE_HZ = 6,


    gcvOPTION_HW_NULL = 50,
    gcvOPTION_PRINT_OPTION = 51,
    gcvOPTION_KERNEL_FENCE = 52,
    gcvOPTION_ASYNC_PIPE = 53,
    gcvOPTION_FBO_PREFER_MEM = 54,
    gcvOPTION_GPU_TEX_UPLOAD = 55,
    gcvOPTION_GPU_BUFOBJ_UPLOAD = 56,
    gcvOPTION_NO_Y_INVERT = 60,


    gcvOPTION_OCL_ASYNC_BLT = 200,
    gcvOPTION_OCL_IN_THREAD,
    gcvOPTION_COMPRESSION_DEC400,
    gcvOPTION_OCL_VIR_SHADER,
    gcvOPTION_OCL_USE_MULTI_DEVICES,



    gcvOPTION_OVX_ENABLE_NN_ZDP3 = 500,
    gcvOPTION_OVX_ENABLE_NN_ZDP6,
    gcvOPTION_OVX_ENABLE_NN_STRIDE,
    gcvOPTION_OVX_USE_MULTI_DEVICES,
    gcvOPTION_OVX_ENABLE_NN_DDR_BURST_SIZE_1024B,
    gcvOPTION_OVX_ENABLE_NN_DDR_BURST_SIZE_512B,
    gcvOPTION_OVX_ENABLE_NN_DDR_BURST_SIZE_256B,
    gcvOPTION_OVX_ENABLE_NN_DDR_BURST_SIZE_128B,
    gcvOPTION_OVX_ENABLE_NN_DDR_BURST_SIZE_64B,

    gcvOPTION_OVX_ENABLE_VIP_AXI_ID1_DDR_BURST_SIZE_1024B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID1_DDR_BURST_SIZE_512B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID1_DDR_BURST_SIZE_256B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID1_DDR_BURST_SIZE_128B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID1_DDR_BURST_SIZE_64B,

    gcvOPTION_OVX_ENABLE_VIP_AXI_ID2_DDR_BURST_SIZE_1024B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID2_DDR_BURST_SIZE_512B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID2_DDR_BURST_SIZE_256B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID2_DDR_BURST_SIZE_128B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID2_DDR_BURST_SIZE_64B,

    gcvOPTION_OVX_ENABLE_VIP_AXI_ID3_DDR_BURST_SIZE_1024B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID3_DDR_BURST_SIZE_512B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID3_DDR_BURST_SIZE_256B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID3_DDR_BURST_SIZE_128B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID3_DDR_BURST_SIZE_64B,

    gcvOPTION_OVX_ENABLE_VIP_AXI_ID0_MIN_AXI_BURST_SIZE_1024B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID0_MIN_AXI_BURST_SIZE_512B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID0_MIN_AXI_BURST_SIZE_256B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID0_MIN_AXI_BURST_SIZE_128B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID0_MIN_AXI_BURST_SIZE_64B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID0_MIN_AXI_BURST_SIZE_32B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID0_MIN_AXI_BURST_SIZE_16B,

    gcvOPTION_OVX_ENABLE_VIP_AXI_ID1_MIN_AXI_BURST_SIZE_1024B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID1_MIN_AXI_BURST_SIZE_512B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID1_MIN_AXI_BURST_SIZE_256B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID1_MIN_AXI_BURST_SIZE_128B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID1_MIN_AXI_BURST_SIZE_64B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID1_MIN_AXI_BURST_SIZE_32B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID1_MIN_AXI_BURST_SIZE_16B,

    gcvOPTION_OVX_ENABLE_VIP_AXI_ID2_MIN_AXI_BURST_SIZE_1024B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID2_MIN_AXI_BURST_SIZE_512B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID2_MIN_AXI_BURST_SIZE_256B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID2_MIN_AXI_BURST_SIZE_128B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID2_MIN_AXI_BURST_SIZE_64B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID2_MIN_AXI_BURST_SIZE_32B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID2_MIN_AXI_BURST_SIZE_16B,

    gcvOPTION_OVX_ENABLE_VIP_AXI_ID3_MIN_AXI_BURST_SIZE_1024B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID3_MIN_AXI_BURST_SIZE_512B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID3_MIN_AXI_BURST_SIZE_256B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID3_MIN_AXI_BURST_SIZE_128B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID3_MIN_AXI_BURST_SIZE_64B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID3_MIN_AXI_BURST_SIZE_32B,
    gcvOPTION_OVX_ENABLE_VIP_AXI_ID3_MIN_AXI_BURST_SIZE_16B,



    gcvOPTION_COUNT
} gceOPTION;

typedef enum _gceFRAMEINFO {

    gcvFRAMEINFO_FRAME_NUM = 0,

    gcvFRAMEINFO_DRAW_NUM = 1,

    gcvFRAMEINFO_COMPUTE_NUM = 2,

    gcvFRAMEINFO_DUAL16_NUM = 3,

    gcvFRAMEINFO_PROGRAM_ID = 4,

    gcvFRAMEINFO_COUNT,
} gceFRAMEINFO;

typedef enum _gceFRAMEINFO_OP {
    gcvFRAMEINFO_OP_INC = 0,
    gcvFRAMEINFO_OP_DEC = 1,
    gcvFRAMEINFO_OP_ZERO = 2,
    gcvFRAMEINFO_OP_GET = 3,
    gcvFRAMEINFO_OP_SET = 4,
    gcvFRAMEINFO_OP_COUNT,
} gceFRAMEINFO_OP;

typedef enum _gceSURF_USAGE {
    gcvSURF_USAGE_UNKNOWN,
    gcvSURF_USAGE_RESOLVE_AFTER_CPU,
    gcvSURF_USAGE_RESOLVE_AFTER_3D
} gceSURF_USAGE;

typedef enum _gceSURF_COLOR_SPACE {
    gcvSURF_COLOR_SPACE_UNKNOWN,
    gcvSURF_COLOR_SPACE_LINEAR,
    gcvSURF_COLOR_SPACE_NONLINEAR,
} gceSURF_COLOR_SPACE;

typedef enum _gceSURF_COLOR_TYPE {
    gcvSURF_COLOR_UNKNOWN = 0,
    gcvSURF_COLOR_LINEAR = 0x01,
    gcvSURF_COLOR_ALPHA_PRE = 0x02,
} gceSURF_COLOR_TYPE;


typedef enum _gceSURF_ROTATION {
    gcvSURF_0_DEGREE = 0,
    gcvSURF_90_DEGREE,
    gcvSURF_180_DEGREE,
    gcvSURF_270_DEGREE,
    gcvSURF_FLIP_X,
    gcvSURF_FLIP_Y,

    gcvSURF_POST_FLIP_X = 0x40000000,
    gcvSURF_POST_FLIP_Y = 0x80000000,
} gceSURF_ROTATION;


typedef enum _gceSURF_FLAG {

    gcvSURF_FLAG_NONE = 0x0,

    gcvSURF_FLAG_CONTENT_PRESERVED = 0x1,

    gcvSURF_FLAG_CONTENT_UPDATED = 0x2,

    gcvSURF_FLAG_CONTENT_YINVERTED = 0x4,

    gcvSURF_FLAG_MULTI_NODE = 0x8,

    gcvSURF_FLAG_DITHER_DISABLED = 0x10,

    gcvSURF_FLAG_FAKE_FORMAT = 0x20,
} gceSURF_FLAG;

typedef enum _gceMIPMAP_IMAGE_FORMAT {
    gcvUNKNOWN_MIPMAP_IMAGE_FORMAT = -2
} gceMIPMAP_IMAGE_FORMAT;

typedef enum _gceIMAGE_MEM_TYPE {
    gcvIMAGE_MEM_DEFAULT,
    gcvIMAGE_MEM_HOST_PTR,
    gcvIMAGE_MEM_HOST_PTR_UNCACHED,
    gcvIMAGE_MEM_HOST_PHY_PTR,
    gcvIMAGE_MEM_HOST_PHY_PTR_UNCACHED,
} gceIMAGE_MEM_TYPE;

typedef enum _gceSURF_YUV_COLOR_SPACE {
    gcvSURF_ITU_REC601,
    gcvSURF_ITU_REC709,
    gcvSURF_ITU_REC2020,
} gceSURF_YUV_COLOR_SPACE;

typedef enum _gceSURF_YUV_SAMPLE_RANGE {
    gcvSURF_YUV_UNKNOWN_RANGE,
    gcvSURF_YUV_FULL_RANGE,
    gcvSURF_YUV_NARROW_RANGE,
} gceSURF_YUV_SAMPLE_RANGE;

typedef enum _gceSURF_YUV_CHROMA_SITING {
    gcvSURF_YUV_CHROMA_SITING_0,
    gcvSURF_YUV_CHROMA_SITING_0_5,
} gceSURF_YUV_CHROMA_SITING;

typedef enum _gceSURF_INFO_TYPE {
    gcvSURF_INFO_UNKNOWN = 0,
    gcvSURF_INFO_LAYERSIZE = 1,
    gcvSURF_INFO_SLICESIZE = 2,
} gceSURF_INFO_TYPE;


typedef enum _gceSURF_FORMAT_MODE {
    gcvSURF_FORMAT_OCL = 0x80000000,
    gcvSURF_FORMAT_PATCH_BORDER = 0x40000000,
} gceSURF_FORMAT_MODE;


typedef enum _gceSURF_SWIZZLE {
    gcvSURF_NOSWIZZLE = 0,
    gcvSURF_ARGB,
    gcvSURF_ABGR,
    gcvSURF_RGBA,
    gcvSURF_BGRA
} gceSURF_SWIZZLE;


typedef enum _gceSURF_TRANSPARENCY {

    gcvSURF_OPAQUE = 0,
    gcvSURF_SOURCE_MATCH,
    gcvSURF_SOURCE_MASK,
    gcvSURF_PATTERN_MASK,
} gceSURF_TRANSPARENCY;


typedef enum _gceSURF_ALIGNMENT {
    gcvSURF_FOUR = 0,
    gcvSURF_SIXTEEN,
    gcvSURF_SUPER_TILED,
    gcvSURF_SPLIT_TILED,
    gcvSURF_SPLIT_SUPER_TILED
} gceSURF_ALIGNMENT;


typedef enum _gceSURF_ADDRESSING {
    gcvSURF_NO_STRIDE_TILED = 0,
    gcvSURF_NO_STRIDE_LINEAR,
    gcvSURF_STRIDE_TILED,
    gcvSURF_STRIDE_LINEAR
} gceSURF_ADDRESSING;


typedef enum _gce2D_TRANSPARENCY {

    gcv2D_OPAQUE = 0,
    gcv2D_KEYED,
    gcv2D_MASKED
} gce2D_TRANSPARENCY;


typedef enum _gceSURF_MONOPACK {
    gcvSURF_PACKED8 = 0,
    gcvSURF_PACKED16,
    gcvSURF_PACKED32,
    gcvSURF_UNPACKED,
} gceSURF_MONOPACK;


typedef enum _gceSURF_BLEND_MODE {


    gcvBLEND_CLEAR = 0,
    gcvBLEND_SRC,
    gcvBLEND_DST,
    gcvBLEND_SRC_OVER_DST,
    gcvBLEND_DST_OVER_SRC,
    gcvBLEND_SRC_IN_DST,
    gcvBLEND_DST_IN_SRC,
    gcvBLEND_SRC_OUT_DST,
    gcvBLEND_DST_OUT_SRC,
    gcvBLEND_SRC_ATOP_DST,
    gcvBLEND_DST_ATOP_SRC,
    gcvBLEND_SRC_XOR_DST,


    gcvBLEND_SET,
    gcvBLEND_SUB
} gceSURF_BLEND_MODE;


typedef enum _gceSURF_PIXEL_ALPHA_MODE {
    gcvSURF_PIXEL_ALPHA_STRAIGHT = 0,
    gcvSURF_PIXEL_ALPHA_INVERSED
} gceSURF_PIXEL_ALPHA_MODE;


typedef enum _gceSURF_GLOBAL_ALPHA_MODE {
    gcvSURF_GLOBAL_ALPHA_OFF = 0,
    gcvSURF_GLOBAL_ALPHA_ON,
    gcvSURF_GLOBAL_ALPHA_SCALE
} gceSURF_GLOBAL_ALPHA_MODE;


typedef enum _gceSURF_PIXEL_COLOR_MODE {
    gcvSURF_COLOR_STRAIGHT = 0,
    gcvSURF_COLOR_MULTIPLY
} gceSURF_PIXEL_COLOR_MODE;


typedef enum _gce2D_PIXEL_COLOR_MULTIPLY_MODE {
    gcv2D_COLOR_MULTIPLY_DISABLE = 0,
    gcv2D_COLOR_MULTIPLY_ENABLE
} gce2D_PIXEL_COLOR_MULTIPLY_MODE;


typedef enum _gce2D_GLOBAL_COLOR_MULTIPLY_MODE {
    gcv2D_GLOBAL_COLOR_MULTIPLY_DISABLE = 0,
    gcv2D_GLOBAL_COLOR_MULTIPLY_ALPHA,
    gcv2D_GLOBAL_COLOR_MULTIPLY_COLOR
} gce2D_GLOBAL_COLOR_MULTIPLY_MODE;


typedef enum _gceSURF_BLEND_FACTOR_MODE {
    gcvSURF_BLEND_ZERO = 0,
    gcvSURF_BLEND_ONE,
    gcvSURF_BLEND_STRAIGHT,
    gcvSURF_BLEND_INVERSED,
    gcvSURF_BLEND_COLOR,
    gcvSURF_BLEND_COLOR_INVERSED,
    gcvSURF_BLEND_SRC_ALPHA_SATURATED,
    gcvSURF_BLEND_STRAIGHT_NO_CROSS,
    gcvSURF_BLEND_INVERSED_NO_CROSS,
    gcvSURF_BLEND_COLOR_NO_CROSS,
    gcvSURF_BLEND_COLOR_INVERSED_NO_CROSS,
    gcvSURF_BLEND_SRC_ALPHA_SATURATED_CROSS
} gceSURF_BLEND_FACTOR_MODE;


typedef enum _gce2D_PORTER_DUFF_RULE {
    gcvPD_CLEAR = 0,
    gcvPD_SRC,
    gcvPD_SRC_OVER,
    gcvPD_DST_OVER,
    gcvPD_SRC_IN,
    gcvPD_DST_IN,
    gcvPD_SRC_OUT,
    gcvPD_DST_OUT,
    gcvPD_SRC_ATOP,
    gcvPD_DST_ATOP,
    gcvPD_ADD,
    gcvPD_XOR,
    gcvPD_DST
} gce2D_PORTER_DUFF_RULE;


typedef enum _gce2D_YUV_COLOR_MODE {
    gcv2D_YUV_601 = 0,
    gcv2D_YUV_709,
    gcv2D_YUV_2020,
    gcv2D_YUV_USER_DEFINED,
    gcv2D_YUV_USER_DEFINED_CLAMP,




    gcv2D_YUV_DST = 0x80000000,
} gce2D_YUV_COLOR_MODE;


typedef enum _gce2D_NATURE_ROTATION {
    gcvNR_0_DEGREE = 0,
    gcvNR_LEFT_90_DEGREE,
    gcvNR_RIGHT_90_DEGREE,
    gcvNR_180_DEGREE,
    gcvNR_FLIP_X,
    gcvNR_FLIP_Y,
    gcvNR_TOTAL_RULE,
} gce2D_NATURE_ROTATION;

typedef enum _gce2D_COMMAND {
    gcv2D_CLEAR = 0,
    gcv2D_LINE,
    gcv2D_BLT,
    gcv2D_STRETCH,
    gcv2D_HOR_FILTER,
    gcv2D_VER_FILTER,
    gcv2D_MULTI_SOURCE_BLT,
    gcv2D_FILTER_BLT,
} gce2D_COMMAND;

typedef enum _gce2D_TILE_STATUS_CONFIG {
    gcv2D_TSC_DISABLE = 0,
    gcv2D_TSC_ENABLE = 0x00000001,
    gcv2D_TSC_COMPRESSED = 0x00000002,
    gcv2D_TSC_DOWN_SAMPLER = 0x00000004,
    gcv2D_TSC_2D_COMPRESSED = 0x00000008,

    gcv2D_TSC_DEC_COMPRESSED = 0x00000020,
    gcv2D_TSC_DEC_TPC = 0x00000040,
    gcv2D_TSC_DEC_TPC_COMPRESSED = 0x00000080,

    gcv2D_TSC_V4_COMPRESSED = 0x00000100,
    gcv2D_TSC_V4_COMPRESSED_256B = 0x00000200 | gcv2D_TSC_V4_COMPRESSED,

    gcv2D_TSC_DEC_TPC_TILED = gcv2D_TSC_DEC_COMPRESSED | gcv2D_TSC_DEC_TPC,
    gcv2D_TSC_DEC_TPC_TILED_COMPRESSED = gcv2D_TSC_DEC_TPC_TILED | gcv2D_TSC_DEC_TPC_COMPRESSED,

    gcv2D_TSC_TPC_COMPRESSED = 0x00001000,
    gcv2D_TSC_TPC_COMPRESSED_V10 = gcv2D_TSC_TPC_COMPRESSED | 0x00000400,
    gcv2D_TSC_TPC_COMPRESSED_V11 = gcv2D_TSC_TPC_COMPRESSED | 0x00000800,
} gce2D_TILE_STATUS_CONFIG;

typedef enum _gce2D_DEC400_MINOR_VERSION {
    gcv2D_DEC400_MINOR_V1 = 1,
    gcv2D_DEC400_MINOR_V2 = 2,
    gcv2D_DEC400_MINOR_V3 = 3,
    gcv2D_DEC400_MINOR_V4 = 4,
} gce2D_DEC400_MINOR_VERSION;


typedef enum _gce2D_TILING_MINOR_VERSION {
    gcv2D_TILING_MINOR_V1 = 0,
    gcv2D_TILING_MINOR_V2 = 1,
} gce2D_TILING_MINOR_VERSION;

typedef enum _gce2D_QUERY {
    gcv2D_QUERY_RGB_ADDRESS_MIN_ALIGN = 0,
    gcv2D_QUERY_RGB_STRIDE_MIN_ALIGN,
    gcv2D_QUERY_YUV_ADDRESS_MIN_ALIGN,
    gcv2D_QUERY_YUV_STRIDE_MIN_ALIGN,
    gcv2D_QUERY_DEC400_MINOR_VERSION,
    gcv2D_QUERY_TILING_MINOR_VERSION,
} gce2D_QUERY;

typedef enum _gce2D_SUPER_TILE_VERSION {
    gcv2D_SUPER_TILE_VERSION_V1 = 1,
    gcv2D_SUPER_TILE_VERSION_V2 = 2,
    gcv2D_SUPER_TILE_VERSION_V3 = 3,
} gce2D_SUPER_TILE_VERSION;

typedef enum _gce2D_STATE {
    gcv2D_STATE_SPECIAL_FILTER_MIRROR_MODE = 1,
    gcv2D_STATE_SUPER_TILE_VERSION,
    gcv2D_STATE_EN_GAMMA,
    gcv2D_STATE_DE_GAMMA,
    gcv2D_STATE_MULTI_SRC_BLIT_UNIFIED_DST_RECT,
    gcv2D_STATE_MULTI_SRC_BLIT_BILINEAR_FILTER,
    gcv2D_STATE_PROFILE_ENABLE,
    gcv2D_STATE_XRGB_ENABLE,

    gcv2D_STATE_ARRAY_EN_GAMMA = 0x10001,
    gcv2D_STATE_ARRAY_DE_GAMMA,
    gcv2D_STATE_ARRAY_CSC_YUV_TO_RGB,
    gcv2D_STATE_ARRAY_CSC_RGB_TO_YUV,

    gcv2D_STATE_DEC_TPC_NV12_10BIT = 0x20001,
    gcv2D_STATE_ARRAY_YUV_SRC_TILE_STATUS_ADDR,
    gcv2D_STATE_ARRAY_YUV_DST_TILE_STATUS_ADDR,
} gce2D_STATE;

typedef enum _gce2D_STATE_PROFILE {
    gcv2D_STATE_PROFILE_NONE = 0x0,
    gcv2D_STATE_PROFILE_COMMAND = 0x1,
    gcv2D_STATE_PROFILE_SURFACE = 0x2,
    gcv2D_STATE_PROFILE_ALL = 0xFFFF,
} gce2D_STATE_PROFILE;


typedef enum _gceTEXTURE_TYPE {
    gcvTEXTURE_UNKNOWN = 0,
    gcvTEXTURE_1D,
    gcvTEXTURE_2D,
    gcvTEXTURE_3D,
    gcvTEXTURE_CUBEMAP,
    gcvTEXTURE_1D_ARRAY,
    gcvTEXTURE_2D_ARRAY,
    gcvTEXTURE_2D_MS,
    gcvTEXTURE_2D_MS_ARRAY,
    gcvTEXTURE_CUBEMAP_ARRAY,
    gcvTEXTURE_EXTERNAL
} gceTEXTURE_TYPE;



typedef enum _gceTEXTURE_FUNCTION {
    gcvTEXTURE_DUMMY = 0,
    gcvTEXTURE_REPLACE = 0,
    gcvTEXTURE_MODULATE,
    gcvTEXTURE_ADD,
    gcvTEXTURE_ADD_SIGNED,
    gcvTEXTURE_INTERPOLATE,
    gcvTEXTURE_SUBTRACT,
    gcvTEXTURE_DOT3
} gceTEXTURE_FUNCTION;


typedef enum _gceTEXTURE_SOURCE {
    gcvCOLOR_FROM_TEXTURE = 0,
    gcvCOLOR_FROM_CONSTANT_COLOR,
    gcvCOLOR_FROM_PRIMARY_COLOR,
    gcvCOLOR_FROM_PREVIOUS_COLOR
} gceTEXTURE_SOURCE;


typedef enum _gceTEXTURE_CHANNEL {
    gcvFROM_COLOR = 0,
    gcvFROM_ONE_MINUS_COLOR,
    gcvFROM_ALPHA,
    gcvFROM_ONE_MINUS_ALPHA
} gceTEXTURE_CHANNEL;



typedef enum _gceFILTER_TYPE {
    gcvFILTER_SYNC = 0,
    gcvFILTER_BLUR,
    gcvFILTER_USER
} gceFILTER_TYPE;


typedef enum _gceFILTER_PASS_TYPE {
    gcvFILTER_HOR_PASS = 0,
    gcvFILTER_VER_PASS
} gceFILTER_PASS_TYPE;


typedef enum _gceENDIAN_HINT {
    gcvENDIAN_NO_SWAP = 0,
    gcvENDIAN_SWAP_WORD = 1,
    gcvENDIAN_SWAP_DWORD = 2,
    gcvENDIAN_SWAP_QWORD = 3,
} gceENDIAN_HINT;


typedef enum _gceTILING {
    gcvINVALIDTILED = 0x0,

    gcvLINEAR = 0x1,
    gcvTILED = 0x2,
    gcvSUPERTILED = 0x4,
    gcvMINORTILED = 0x8,


    gcvTILING_SPLIT_BUFFER = 0x10,
    gcvTILING_X_MAJOR = 0x20,
    gcvTILING_Y_MAJOR = 0x40,
    gcvTILING_SWAP = 0x80,


    gcvMULTI_TILED = gcvTILED | gcvTILING_SPLIT_BUFFER,

    gcvMULTI_SUPERTILED = gcvSUPERTILED | gcvTILING_SPLIT_BUFFER,

    gcvYMAJOR_SUPERTILED = gcvSUPERTILED | gcvTILING_Y_MAJOR,

    gcvTILED_8X4 = 0x0100,
    gcvTILED_4X8 = 0x0100 | gcvTILING_SWAP,
    gcvTILED_8X8 = 0x0200,
    gcvTILED_16X4 = 0x0400,
    gcvTILED_32X4 = 0x0800,
    gcvTILED_64X4 = 0x1000,

    gcvTILED_8X8_XMAJOR = gcvTILED_8X8 | gcvTILING_X_MAJOR,
    gcvTILED_8X8_YMAJOR = gcvTILED_8X8 | gcvTILING_Y_MAJOR,

    gcvSUPERTILED_128B = 0x10000 | gcvSUPERTILED,
    gcvSUPERTILED_256B = 0x20000 | gcvSUPERTILED,
} gceTILING;

typedef enum _gceCACHE_MODE {
    gcvCACHE_NONE,
    gcvCACHE_128,
    gcvCACHE_256,
} gceCACHE_MODE;




typedef enum _gce2D_PATTERN {
    gcv2D_PATTERN_SOLID = 0,
    gcv2D_PATTERN_MONO,
    gcv2D_PATTERN_COLOR,
    gcv2D_PATTERN_INVALID
} gce2D_PATTERN;


typedef enum _gce2D_SOURCE {
    gcv2D_SOURCE_MASKED = 0,
    gcv2D_SOURCE_MONO,
    gcv2D_SOURCE_COLOR,
    gcv2D_SOURCE_INVALID
} gce2D_SOURCE;

typedef enum _gceMMU_MODE {
    gcvMMU_MODE_1K,
    gcvMMU_MODE_4K,
} gceMMU_MODE;


typedef enum _gceDEBUG_MESSAGE_TYPE {
    gcvMESSAGE_TEXT,
    gcvMESSAGE_DUMP
} gceDEBUG_MESSAGE_TYPE;


typedef enum _gceSHADING {
    gcvSHADING_SMOOTH,
    gcvSHADING_FLAT_D3D,
    gcvSHADING_FLAT_OPENGL,
} gceSHADING;


typedef enum _gceCULL {
    gcvCULL_NONE,
    gcvCULL_CCW,
    gcvCULL_CW,
} gceCULL;


typedef enum _gceFILL {
    gcvFILL_POINT,
    gcvFILL_WIRE_FRAME,
    gcvFILL_SOLID,
} gceFILL;


typedef enum _gceCOMPARE {
    gcvCOMPARE_INVALID = 0,
    gcvCOMPARE_NEVER,
    gcvCOMPARE_NOT_EQUAL,
    gcvCOMPARE_LESS,
    gcvCOMPARE_LESS_OR_EQUAL,
    gcvCOMPARE_EQUAL,
    gcvCOMPARE_GREATER,
    gcvCOMPARE_GREATER_OR_EQUAL,
    gcvCOMPARE_ALWAYS,
} gceCOMPARE;


typedef enum _gceSTENCIL_MODE {
    gcvSTENCIL_NONE,
    gcvSTENCIL_SINGLE_SIDED,
    gcvSTENCIL_DOUBLE_SIDED,
} gceSTENCIL_MODE;


typedef enum _gceSTENCIL_OPERATION {
    gcvSTENCIL_KEEP,
    gcvSTENCIL_REPLACE,
    gcvSTENCIL_ZERO,
    gcvSTENCIL_INVERT,
    gcvSTENCIL_INCREMENT,
    gcvSTENCIL_DECREMENT,
    gcvSTENCIL_INCREMENT_SATURATE,
    gcvSTENCIL_DECREMENT_SATURATE,
    gcvSTENCIL_OPERATION_INVALID = -1
} gceSTENCIL_OPERATION;


typedef enum _gceSTENCIL_WHERE {
    gcvSTENCIL_FRONT,
    gcvSTENCIL_BACK,
} gceSTENCIL_WHERE;


typedef enum _gceTEXTURE_WHICH {
    gcvTEXTURE_S,
    gcvTEXTURE_T,
    gcvTEXTURE_R,
} gceTEXTURE_WHICH;


typedef enum _gceTEXTURE_ADDRESSING {
    gcvTEXTURE_INVALID = 0,
    gcvTEXTURE_CLAMP,
    gcvTEXTURE_WRAP,
    gcvTEXTURE_MIRROR,
    gcvTEXTURE_BORDER,
    gcvTEXTURE_MIRROR_ONCE,
} gceTEXTURE_ADDRESSING;


typedef enum _gceTEXTURE_FILTER {
    gcvTEXTURE_NONE,
    gcvTEXTURE_POINT,
    gcvTEXTURE_LINEAR,
    gcvTEXTURE_ANISOTROPIC,
} gceTEXTURE_FILTER;

typedef enum _gceTEXTURE_COMPONENT {
    gcvTEXTURE_COMPONENT_R,
    gcvTEXTURE_COMPONENT_G,
    gcvTEXTURE_COMPONENT_B,
    gcvTEXTURE_COMPONENT_A,

    gcvTEXTURE_COMPONENT_NUM,
} gceTEXTURE_COMPONENT;


typedef enum _gceTEXTURE_SWIZZLE {
    gcvTEXTURE_SWIZZLE_R = 0,
    gcvTEXTURE_SWIZZLE_G,
    gcvTEXTURE_SWIZZLE_B,
    gcvTEXTURE_SWIZZLE_A,
    gcvTEXTURE_SWIZZLE_0,
    gcvTEXTURE_SWIZZLE_1,

    gcvTEXTURE_SWIZZLE_INVALID,
} gceTEXTURE_SWIZZLE;

typedef enum _gceTEXTURE_SRGBDECODE {
    gcvTEXTURE_SRGB_INVALID = 0,
    gcvTEXTURE_DECODE,
    gcvTEXTURE_SKIP_DECODE,
} gceTEXTURE_SRGBDECODE;

typedef enum _gceTEXTURE_COMPARE_MODE {
    gcvTEXTURE_COMPARE_MODE_INVALID = 0,
    gcvTEXTURE_COMPARE_MODE_NONE,
    gcvTEXTURE_COMPARE_MODE_REF,
} gceTEXTURE_COMPARE_MODE;

typedef enum _gceTEXTURE_DS_MODE {
    gcvTEXTURE_DS_MODE_INVALID = 0,
    gcvTEXTURE_DS_MODE_DEPTH = 1,
    gcvTEXTURE_DS_MODE_STENCIL = 2,
} gceTEXTURE_DS_MODE;

typedef enum _gceTEXTURE_DS_TEX_MODE {
    gcvTEXTURE_DS_TEXTURE_MODE_LUMINANCE = 0,
    gcvTEXTURE_DS_TEXTURE_MODE_INTENSITY,
    gcvTEXTURE_DS_TEXTURE_MODE_ALPHA,
    gcvTEXTURE_DS_TEXTURE_MODE_RED,

    gcvTEXTURE_DS_TEXTURE_MODE_INVALID,
} gceTEXTURE_DS_TEX_MODE;


typedef enum _gceTEXTURE_STAGE {
    gcvTEXTURE_STAGE_INVALID = -1,
    gcvTEXTURE_STAGE_VS = 0,
    gcvTEXTURE_STAGE_TCS,
    gcvTEXTURE_STAGE_TES,
    gcvTEXTURE_STAGE_GS,
    gcvTEXTURE_STAGE_FS,
    gcvTEXTURE_STAGE_CS,

    gcvTEXTURE_STAGE_LAST
} gceTEXTURE_STAGE;


typedef enum _gcePIXEL_SWIZZLE {
    gcvPIXEL_SWIZZLE_R = gcvTEXTURE_SWIZZLE_R,
    gcvPIXEL_SWIZZLE_G = gcvTEXTURE_SWIZZLE_G,
    gcvPIXEL_SWIZZLE_B = gcvTEXTURE_SWIZZLE_B,
    gcvPIXEL_SWIZZLE_A = gcvTEXTURE_SWIZZLE_A,

    gcvPIXEL_SWIZZLE_INVALID,
} gcePIXEL_SWIZZLE;


typedef enum _gcePRIMITIVE {
    gcvPRIMITIVE_POINT_LIST,
    gcvPRIMITIVE_LINE_LIST,
    gcvPRIMITIVE_LINE_STRIP,
    gcvPRIMITIVE_LINE_LOOP,
    gcvPRIMITIVE_TRIANGLE_LIST,
    gcvPRIMITIVE_TRIANGLE_STRIP,
    gcvPRIMITIVE_TRIANGLE_FAN,
    gcvPRIMITIVE_RECTANGLE,
    gcvPRIMITIVE_LINES_ADJACENCY,
    gcvPRIMITIVE_LINE_STRIP_ADJACENCY,
    gcvPRIMITIVE_TRIANGLES_ADJACENCY,
    gcvPRIMITIVE_TRIANGLE_STRIP_ADJACENCY,
    gcvPRIMITIVE_PATCH_LIST,
} gcePRIMITIVE;


typedef enum _gceINDEX_TYPE {
    gcvINDEX_8,
    gcvINDEX_16,
    gcvINDEX_32,
} gceINDEX_TYPE;


typedef enum _gceMULTI_GPU_RENDERING_MODE {
    gcvMULTI_GPU_RENDERING_MODE_OFF,
    gcvMULTI_GPU_RENDERING_MODE_SPLIT_WIDTH,
    gcvMULTI_GPU_RENDERING_MODE_SPLIT_HEIGHT,
    gcvMULTI_GPU_RENDERING_MODE_INTERLEAVED_64x64,
    gcvMULTI_GPU_RENDERING_MODE_INTERLEAVED_128x64,
    gcvMULTI_GPU_RENDERING_MODE_INTERLEAVED_128x128,
    gcvMULTI_GPU_RENDERING_MODE_INTERLEAVED,
    gcvMULTI_GPU_RENDERING_MODE_INVALID
} gceMULTI_GPU_RENDERING_MODE;

typedef enum _gceMACHINECODE {
    gcvMACHINECODE_ANTUTU0 = 0x0,

    gcvMACHINECODE_GLB27_RELEASE_0,

    gcvMACHINECODE_GLB25_RELEASE_0,
    gcvMACHINECODE_GLB25_RELEASE_1,

    gcvMACHINECODE_COUNT,


    gcvSHADER_SRC_PARTIAL_REPLACE,
} gceMACHINECODE;

typedef enum _gceUNIFORMCVT {
    gcvUNIFORMCVT_NONE = 0,
    gcvUNIFORMCVT_TO_BOOL,
    gcvUNIFORMCVT_TO_FLOAT,
} gceUNIFORMCVT;

typedef enum _gceHAL_ARG_VERSION {
    gcvHAL_ARG_VERSION_V1 = 0x0,
    gcvHAL_ARG_VERSION_V2,
} gceHAL_ARG_VERSION;
# 898 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gceENDIAN_MODE {
    gcvENDIAN_MODE0 = 0x0,
    gcvENDIAN_MODE1 = 0x1,
    gcvENDIAN_MODE2 = 0x2,
    gcvENDIAN_MODE3 = 0x3,
    gcvENDIAN_MODE4 = 0x4,
    gcvENDIAN_MODE5 = 0x5,
    gcvENDIAN_MODE6 = 0x6,
    gcvENDIAN_MODE7 = 0x7,
} gceENDIAN_MODE;

typedef enum _gceHW_FE_TYPE {
    gcvHW_FE_WAIT_LINK,
    gcvHW_FE_ASYNC,
    gcvHW_FE_MULTI_CHANNEL,
    gcvHW_FE_END,
} gceHW_FE_TYPE;

typedef enum _gceMCFE_CHANNEL_TYPE {
    gcvMCFE_CHANNEL_NONE = 0,
    gcvMCFE_CHANNEL_SYSTEM,
    gcvMCFE_CHANNEL_SHADER,
    gcvMCFE_CHANNEL_NN,
    gcvMCFE_CHANNEL_TP,

    gcvMCFE_CHANNEL_3DBLIT = 128,
} gceMCFE_CHANNEL_TYPE;

typedef enum _gcePAGE_TYPE {
    gcvPAGE_TYPE_4K,
    gcvPAGE_TYPE_64K,
    gcvPAGE_TYPE_1M,
    gcvPAGE_TYPE_16M,
} gcePAGE_TYPE;

typedef enum _gceAREA_TYPE {
    gcvAREA_TYPE_UNKNOWN = 0,
    gcvAREA_TYPE_FLATMAP,
    gcvAREA_TYPE_1M,
    gcvAREA_TYPE_4K,
} gceAREA_TYPE;

typedef enum _gce2D_U8ToU10_CONVERSION_MODE
{
    gcvADD_LOWER_BITS,
    gcvNOT_ADD_LOWER_BITS,
    gcvNOT_ADD_HIGHER_BITS
} gce2D_U8ToU10_CONVERSION_MODE;

typedef enum _gce2D_NORMALIZATION_MODE
{
    gcvNORMALIZATION_STD_Z_SCORE,
    gcvNORMALIZATION_Z_SCORE,
    gcvNORMALIZATION_MIN_MAX,
} gce2D_NORMALIZATION_MODE;


typedef enum _gce2D_STATE_KEY
{
    gcvNORMALIZATION_MODE = 0,
    gcvNORMALIZATION_MAXMINRECIPROCAL,
    gcvNORMALIZATION_MINVALUE,
    gcvNORMALIZATION_MEANVALUE,
    gcvNORMALIZATION_STDRECIPROCAL,
    gcvQUANTIZATION_STEPRECIPROCAL,
    gcvQUANTIZATION_BYPASSSTEPQUANTIZATION,
    gcvUINT8_2_UINT10_CONVERSION_MODE,

    gcvSTATE_TAIL,
} gce2D_STATE_KEY;





typedef enum _gceBROADCAST {

    gcvBROADCAST_GPU_IDLE,


    gcvBROADCAST_GPU_COMMIT,


    gcvBROADCAST_GPU_STUCK,


    gcvBROADCAST_FIRST_PROCESS,


    gcvBROADCAST_LAST_PROCESS,


    gcvBROADCAST_AXI_BUS_ERROR,


    gcvBROADCAST_OUT_OF_MEMORY,
} gceBROADCAST;


typedef enum _gceNOTIFY {
    gcvNOTIFY_INTERRUPT,
    gcvNOTIFY_COMMAND_QUEUE,
} gceNOTIFY;


typedef enum _gceKERNEL_FLUSH {
    gcvFLUSH_COLOR = 0x01,
    gcvFLUSH_DEPTH = 0x02,
    gcvFLUSH_TEXTURE = 0x04,
    gcvFLUSH_2D = 0x08,
    gcvFLUSH_L2 = 0x10,
    gcvFLUSH_TILE_STATUS = 0x20,
    gcvFLUSH_ICACHE = 0x40,
    gcvFLUSH_TXDESC = 0x80,
    gcvFLUSH_FENCE = 0x100,
    gcvFLUSH_VERTEX = 0x200,
    gcvFLUSH_TFBHEADER = 0x400,
    gcvFLUSH_ALL = gcvFLUSH_COLOR
                                | gcvFLUSH_DEPTH
                                | gcvFLUSH_TEXTURE
                                | gcvFLUSH_2D
                                | gcvFLUSH_L2
                                | gcvFLUSH_TILE_STATUS
                                | gcvFLUSH_ICACHE
                                | gcvFLUSH_TXDESC
                                | gcvFLUSH_FENCE
                                | gcvFLUSH_VERTEX
                                | gcvFLUSH_TFBHEADER
} gceKERNEL_FLUSH;

typedef enum _gceCOUNTER {
    gcvCOUNTER_FRONT_END,
    gcvCOUNTER_VERTEX_SHADER,
    gcvCOUNTER_PRIMITIVE_ASSEMBLY,
    gcvCOUNTER_SETUP,
    gcvCOUNTER_RASTERIZER,
    gcvCOUNTER_PIXEL_SHADER,
    gcvCOUNTER_TEXTURE,
    gcvCOUNTER_PIXEL_ENGINE,
    gcvCOUNTER_MEMORY_CONTROLLER_COLOR,
    gcvCOUNTER_MEMORY_CONTROLLER_DEPTH,
    gcvCOUNTER_HOST_INTERFACE0,
    gcvCOUNTER_HOST_INTERFACE1,
    gcvCOUNTER_GPUL2_CACHE,
    gcvCOUNTER_COUNT
} gceCOUNTER;

typedef enum _gceProfilerClient {
    gcvCLIENT_OPENGLES11 = 1,
    gcvCLIENT_OPENGLES,
    gcvCLIENT_OPENGL,
    gcvCLIENT_OPENVG,
    gcvCLIENT_OPENCL,
    gcvCLIENT_OPENVX,
    gcvCLIENT_OPENVK,
} gceProfilerClient;

typedef enum _gceCOUNTER_OPTYPE {
    gcvCOUNTER_OP_DRAW = 0,
    gcvCOUNTER_OP_BLT = 1,
    gcvCOUNTER_OP_COMPUTE = 2,
    gcvCOUNTER_OP_RS = 3,
    gcvCOUNTER_OP_FINISH = 4,
    gcvCOUNTER_OP_FRAME = 5,
    gcvCOUNTER_OP_NONE = 6
} gceCOUNTER_OPTYPE;

typedef enum _gceProbeStatus {
    gcvPROBE_Disabled = 0,
    gcvPROBE_Paused = 1,
    gcvPROBE_Enabled = 2,
} gceProbeStatus;

typedef enum _gceProbeCmd {
    gcvPROBECMD_BEGIN = 0,
    gcvPROBECMD_PAUSE = 1,
    gcvPROBECMD_RESUME = 2,
    gcvPROBECMD_END = 3,
} gceProbeCmd;





typedef enum _halEventType {

    HAL_KEYBOARD,


    HAL_POINTER,


    HAL_BUTTON,


    HAL_CLOSE,


    HAL_WINDOW_UPDATE
} halEventType;


typedef enum _halKeys {
    HAL_UNKNOWN = -1,

    HAL_BACKSPACE = 0x08,
    HAL_TAB,
    HAL_ENTER = 0x0D,
    HAL_ESCAPE = 0x1B,

    HAL_SPACE = 0x20,
    HAL_SINGLEQUOTE = 0x27,
    HAL_PAD_ASTERISK = 0x2A,
    HAL_COMMA = 0x2C,
    HAL_HYPHEN,
    HAL_PERIOD,
    HAL_SLASH,
    HAL_0,
    HAL_1,
    HAL_2,
    HAL_3,
    HAL_4,
    HAL_5,
    HAL_6,
    HAL_7,
    HAL_8,
    HAL_9,
    HAL_SEMICOLON = 0x3B,
    HAL_EQUAL = 0x3D,
    HAL_A = 0x41,
    HAL_B,
    HAL_C,
    HAL_D,
    HAL_E,
    HAL_F,
    HAL_G,
    HAL_H,
    HAL_I,
    HAL_J,
    HAL_K,
    HAL_L,
    HAL_M,
    HAL_N,
    HAL_O,
    HAL_P,
    HAL_Q,
    HAL_R,
    HAL_S,
    HAL_T,
    HAL_U,
    HAL_V,
    HAL_W,
    HAL_X,
    HAL_Y,
    HAL_Z,
    HAL_LBRACKET,
    HAL_BACKSLASH,
    HAL_RBRACKET,
    HAL_BACKQUOTE = 0x60,

    HAL_F1 = 0x80,
    HAL_F2,
    HAL_F3,
    HAL_F4,
    HAL_F5,
    HAL_F6,
    HAL_F7,
    HAL_F8,
    HAL_F9,
    HAL_F10,
    HAL_F11,
    HAL_F12,

    HAL_LCTRL,
    HAL_RCTRL,
    HAL_LSHIFT,
    HAL_RSHIFT,
    HAL_LALT,
    HAL_RALT,
    HAL_CAPSLOCK,
    HAL_NUMLOCK,
    HAL_SCROLLLOCK,
    HAL_PAD_0,
    HAL_PAD_1,
    HAL_PAD_2,
    HAL_PAD_3,
    HAL_PAD_4,
    HAL_PAD_5,
    HAL_PAD_6,
    HAL_PAD_7,
    HAL_PAD_8,
    HAL_PAD_9,
    HAL_PAD_HYPHEN,
    HAL_PAD_PLUS,
    HAL_PAD_SLASH,
    HAL_PAD_PERIOD,
    HAL_PAD_ENTER,
    HAL_SYSRQ,
    HAL_PRNTSCRN,
    HAL_BREAK,
    HAL_UP,
    HAL_LEFT,
    HAL_RIGHT,
    HAL_DOWN,
    HAL_HOME,
    HAL_END,
    HAL_PGUP,
    HAL_PGDN,
    HAL_INSERT,
    HAL_DELETE,
    HAL_LWINDOW,
    HAL_RWINDOW,
    HAL_MENU,
    HAL_POWER,
    HAL_SLEEP,
    HAL_WAKE
} halKeys;







typedef enum kernel_packet_command {
    KERNEL_START_COMMAND,
    KERNEL_SUBMIT,
    KERNEL_MAP_MEMORY,
    KERNEL_UNMAP_MEMORY,
    KERNEL_ALLOCATE_SECRUE_MEMORY,
    KERNEL_FREE_SECURE_MEMORY,
    KERNEL_EXECUTE,
    KERNEL_DUMP_MMU_EXCEPTION,
    KERNEL_HANDLE_MMU_EXCEPTION,
    KERNEL_READ_MMU_EXCEPTION,
} kernel_packet_command_t;

enum {
    gcvTA_COMMAND_INIT,
    gcvTA_COMMAND_DISPATCH,

    gcvTA_CALLBACK_ALLOC_SECURE_MEM,
    gcvTA_CALLBACK_FREE_SECURE_MEM,
};

typedef enum {
    gcvFENCE_TYPE_READ = 0x1,
    gcvFENCE_TYPE_WRITE = 0x2,
    gcvFENCE_TYPE_ALL = gcvFENCE_TYPE_READ | gcvFENCE_TYPE_WRITE,
    gcvFNECE_TYPE_INVALID = 0x10000,
} gceFENCE_TYPE;

typedef enum _gceTLS_KEY {
    gcvTLS_KEY_EGL,
    gcvTLS_KEY_OPENGL_ES,
    gcvTLS_KEY_OPENVG,
    gcvTLS_KEY_OPENGL,
    gcvTLS_KEY_OPENCL,
    gcvTLS_KEY_OPENVX,

    gcvTLS_KEY_COUNT
} gceTLS_KEY;

typedef enum _gcePLS_VALUE {
    gcePLS_VALUE_EGL_DISPLAY_INFO,
    gcePLS_VALUE_EGL_CONFIG_FORMAT_INFO,
    gcePLS_VALUE_EGL_DESTRUCTOR_INFO,
    gcePLS_VALUE_OPENCL_DESTRUCTOR_INFO,
} gcePLS_VALUE;



typedef enum _gceBLEND_FUNCTION {
    gcvBLEND_ZERO,
    gcvBLEND_ONE,
    gcvBLEND_SOURCE_COLOR,
    gcvBLEND_INV_SOURCE_COLOR,
    gcvBLEND_SOURCE_ALPHA,
    gcvBLEND_INV_SOURCE_ALPHA,
    gcvBLEND_TARGET_COLOR,
    gcvBLEND_INV_TARGET_COLOR,
    gcvBLEND_TARGET_ALPHA,
    gcvBLEND_INV_TARGET_ALPHA,
    gcvBLEND_SOURCE_ALPHA_SATURATE,
    gcvBLEND_CONST_COLOR,
    gcvBLEND_INV_CONST_COLOR,
    gcvBLEND_CONST_ALPHA,
    gcvBLEND_INV_CONST_ALPHA,
} gceBLEND_FUNCTION;


typedef enum _gceBLEND_MODE {
    gcvBLEND_ADD = 0,
    gcvBLEND_SUBTRACT,
    gcvBLEND_REVERSE_SUBTRACT,
    gcvBLEND_MIN,
    gcvBLEND_MAX,
    gcvBLEND_MULTIPLY,
    gcvBLEND_SCREEN,
    gcvBLEND_OVERLAY,
    gcvBLEND_DARKEN,
    gcvBLEND_LIGHTEN,
    gcvBLEND_COLORDODGE,
    gcvBLEND_COLORBURN,
    gcvBLEND_HARDLIGHT,
    gcvBLEND_SOFTLIGHT,
    gcvBLEND_DIFFERENCE,
    gcvBLEND_EXCLUSION,
    gcvBLEND_HSL_HUE,
    gcvBLEND_HSL_SATURATION,
    gcvBLEND_HSL_COLOR,
    gcvBLEND_HSL_LUMINOSITY,

    gcvBLEND_TOTAL
} gceBLEND_MODE;


typedef enum _gceDEPTH_MODE {
    gcvDEPTH_NONE,
    gcvDEPTH_Z,
    gcvDEPTH_W,
} gceDEPTH_MODE;



typedef enum _gceAPI {
    gcvAPI_D3D = 1,
    gcvAPI_OPENGL_ES11,
    gcvAPI_OPENGL_ES20,
    gcvAPI_OPENGL_ES30,
    gcvAPI_OPENGL_ES31,
    gcvAPI_OPENGL_ES32,
    gcvAPI_OPENGL,
    gcvAPI_OPENVG,
    gcvAPI_OPENCL,
    gcvAPI_OPENVK,
    gcvAPI_EGL,
    gcvAPI_COUNT,
} gceAPI;

typedef enum _gceWHERE {
    gcvWHERE_COMMAND_PREFETCH = 0,
    gcvWHERE_COMMAND,
    gcvWHERE_RASTER,
    gcvWHERE_PIXEL,
    gcvWHERE_BLT,
} gceWHERE;

typedef enum _gceHOW {
    gcvHOW_SEMAPHORE = 0x1,
    gcvHOW_STALL = 0x2,
    gcvHOW_SEMAPHORE_STALL = 0x3,
} gceHOW;

typedef enum _gceSignalHandlerType {
    gcvHANDLE_SIGFPE_WHEN_SIGNAL_CODE_IS_0 = 0x1,
} gceSignalHandlerType;

typedef enum _gceFILE_MODE {
    gcvFILE_CREATE = 0,
    gcvFILE_APPEND,
    gcvFILE_READ,
    gcvFILE_CREATETEXT,
    gcvFILE_APPENDTEXT,
    gcvFILE_READTEXT,
} gceFILE_MODE;

typedef enum _gceFILE_WHENCE {
    gcvFILE_SEEK_SET,
    gcvFILE_SEEK_CUR,
    gcvFILE_SEEK_END
} gceFILE_WHENCE;


typedef enum _gceFORMAT_CLASS {
    gcvFORMAT_CLASS_RGBA = 4500,
    gcvFORMAT_CLASS_YUV,
    gcvFORMAT_CLASS_INDEX,
    gcvFORMAT_CLASS_LUMINANCE,
    gcvFORMAT_CLASS_BUMP,
    gcvFORMAT_CLASS_DEPTH,
    gcvFORMAT_CLASS_ASTC,
    gcvFORMAT_CLASS_COMPRESSED,
    gcvFORMAT_CLASS_OTHER,
    gcvFORMAT_CLASS_INTENSITY
} gceFORMAT_CLASS;


typedef enum _gceFORMAT_DATATYPE {
    gcvFORMAT_DATATYPE_UNSIGNED_NORMALIZED,
    gcvFORMAT_DATATYPE_SIGNED_NORMALIZED,
    gcvFORMAT_DATATYPE_UNSIGNED_INTEGER,
    gcvFORMAT_DATATYPE_SIGNED_INTEGER,
    gcvFORMAT_DATATYPE_FLOAT16,
    gcvFORMAT_DATATYPE_FLOAT32,
    gcvFORMAT_DATATYPE_FLOAT_E5B9G9R9,
    gcvFORMAT_DATATYPE_FLOAT_B10G11R11F,
    gcvFORMAT_DATATYPE_INDEX,
    gcvFORMAT_DATATYPE_SRGB,
    gcvFORMAT_DATATYPE_FLOAT32_UINT,
} gceFORMAT_DATATYPE;

typedef enum _gceORIENTATION {
    gcvORIENTATION_TOP_BOTTOM,
    gcvORIENTATION_BOTTOM_TOP,
} gceORIENTATION;


typedef enum _gceCOMPONENT_CONTROL {
    gcvCOMPONENT_NOTPRESENT = 0x00,
    gcvCOMPONENT_DONTCARE = 0x80,
    gcvCOMPONENT_WIDTHMASK = 0x7F,
    gcvCOMPONENT_ODD = 0x80
} gceCOMPONENT_CONTROL;


typedef enum _gceDEBUG_MSG {
    gcvDEBUG_MSG_NONE,
    gcvDEBUG_MSG_ERROR,
    gcvDEBUG_MSG_WARNING
} gceDEBUG_MSG;


typedef enum _VIV_COMPRESS_FMT {
    _VIV_CFMT_ARGB8 = 0,
    _VIV_CFMT_XRGB8,
    _VIV_CFMT_AYUV,
    _VIV_CFMT_UYVY,
    _VIV_CFMT_YUY2,
    _VIV_CFMT_YUV_ONLY,
    _VIV_CFMT_UV_MIX,
    _VIV_CFMT_ARGB4,
    _VIV_CFMT_XRGB4,
    _VIV_CFMT_A1R5G5B5,
    _VIV_CFMT_X1R5G5B5,
    _VIV_CFMT_R5G6B5,
    _VIV_CFMT_Z24S8,
    _VIV_CFMT_Z24,
    _VIV_CFMT_Z16,
    _VIV_CFMT_A2R10G10B10,
    _VIV_CFMT_BAYER,
    _VIV_CFMT_SIGNED_BAYER,
    _VIV_CFMT_VAA16,
    _VIV_CFMT_S8,

    _VIV_CFMT_MAX,
} _VIV_COMPRESS_FMT;

typedef enum _gcePROGRAM_STAGE {
    gcvPROGRAM_STAGE_VERTEX = 0x0,
    gcvPROGRAM_STAGE_TCS = 0x1,
    gcvPROGRAM_STAGE_TES = 0x2,
    gcvPROGRAM_STAGE_GEOMETRY = 0x3,
    gcvPROGRAM_STAGE_GPIPE_COUNT = 0x4,
    gcvPROGRAM_STAGE_FRAGMENT = 0x4,
    gcvPROGRAM_STAGE_GRAPHICS_COUNT = 0x5,
    gcvPROGRAM_STAGE_COMPUTE = 0x5,
    gcvPROGRAM_STAGE_OPENCL = 0x6,
    gcvPROGRAM_STAGE_LAST
} gcePROGRAM_STAGE;

typedef enum _gcePROGRAM_STAGE_BIT {
    gcvPROGRAM_STAGE_VERTEX_BIT = 1 << gcvPROGRAM_STAGE_VERTEX,
    gcvPROGRAM_STAGE_TCS_BIT = 1 << gcvPROGRAM_STAGE_TCS,
    gcvPROGRAM_STAGE_TES_BIT = 1 << gcvPROGRAM_STAGE_TES,
    gcvPROGRAM_STAGE_GEOMETRY_BIT = 1 << gcvPROGRAM_STAGE_GEOMETRY,
    gcvPROGRAM_STAGE_FRAGMENT_BIT = 1 << gcvPROGRAM_STAGE_FRAGMENT,
    gcvPROGRAM_STAGE_COMPUTE_BIT = 1 << gcvPROGRAM_STAGE_COMPUTE,
    gcvPROGRAM_STAGE_OPENCL_BIT = 1 << gcvPROGRAM_STAGE_OPENCL,
} gcePROGRAM_STAGE_BIT;

typedef enum _gceBLIT_FLAG {
    gcvBLIT_FLAG_SKIP_DEPTH_WRITE = 1 << 0,
    gcvBLIT_FLAG_SKIP_STENCIL_WRITE = 1 << 1,
} gceBLIT_FLAG;


typedef enum _gceCLEAR {
    gcvCLEAR_COLOR = 0x1,
    gcvCLEAR_DEPTH = 0x2,
    gcvCLEAR_STENCIL = 0x4,
    gcvCLEAR_HZ = 0x8,
    gcvCLEAR_WITH_GPU_ONLY = 0x100,
    gcvCLEAR_WITH_CPU_ONLY = 0x200,
    gcvCLEAR_MULTI_SLICES = 0x400,
} gceCLEAR;

typedef enum _gceBLIT_TYPE {
    gcvBLIT_DRAW_CLEAR = 0,
    gcvBLIT_DRAW_BLIT = 1,
    gcvBLIT_DRAW_BLIT_DEPTH = 2,
    gcvBLIT_COMPUTE_BLIT = 3,


    gcvBLIT_NUM_TYPE
} gceBLIT_TYPE;

typedef enum _gceSPLIT_DRAW_TYPE {
    gcvSPLIT_DRAW_UNKNOWN = 0x0,
    gcvSPLIT_DRAW_1,
    gcvSPLIT_DRAW_2,
    gcvSPLIT_DRAW_3,
    gcvSPLIT_DRAW_4,
    gcvSPLIT_DRAW_XFB,
    gcvSPLIT_DRAW_INDEX_FETCH,
    gcvSPLIT_DRAW_TCS,
    gcvSPLIT_DRAW_STIPPLE,
    gcvSPLIT_DRAW_WIDE_LINE,
    gcvSPLIT_DRAW_LINES_HW_ZERO_AREA_LINE_PATCH,
    gcvSPLIT_DRAW_TRIANGLES,
    gcvSPLIT_DRAW_LAST
} gceSPLIT_DRAW_TYPE;


typedef enum _gceBLEND_UNIT {
    gcvBLEND_SOURCE,
    gcvBLEND_TARGET,
} gceBLEND_UNIT;

typedef enum _gceXfbCmd {
    gcvXFBCMD_BEGIN = 0,
    gcvXFBCMD_PAUSE = 1,
    gcvXFBCMD_RESUME = 2,
    gcvXFBCMD_END = 3,
    gcvXFBCMD_PAUSE_INCOMMIT = 4,
    gcvXFBCMD_RESUME_INCOMMIT = 5,
    gcvXFBCMD_INVALID = 6,
} gceXfbCmd;

typedef enum _gceXfbStatus {
    gcvXFB_Disabled = 0,
    gcvXFB_Paused,
    gcvXFB_Enabled,
} gceXfbStatus;

typedef enum _gceQueryStatus {
    gcvQUERY_Disabled = 0,
    gcvQUERY_Paused = 1,
    gcvQUERY_Enabled = 2,
} gceQueryStatus;

typedef enum _gceQueryCmd {
    gcvQUERYCMD_BEGIN = 0,
    gcvQUERYCMD_PAUSE = 1,
    gcvQUERYCMD_RESUME = 2,
    gcvQUERYCMD_END = 3,
    gcvQUERYCMD_INVALID = 4,
} gceQueryCmd;

typedef enum _gceQueryType {
    gcvQUERY_OCCLUSION = 0,
    gcvQUERY_XFB_WRITTEN = 1,
    gcvQUERY_PRIM_GENERATED = 2,
    gcvQUERY_TIME_ELAPSED = 3,
    gcvQUERY_MAX_NUM = 4,
} gceQueryType;


typedef enum _gceTEXTURE_FACE {
    gcvFACE_NONE = 0,
    gcvFACE_POSITIVE_X,
    gcvFACE_NEGATIVE_X,
    gcvFACE_POSITIVE_Y,
    gcvFACE_NEGATIVE_Y,
    gcvFACE_POSITIVE_Z,
    gcvFACE_NEGATIVE_Z,
} gceTEXTURE_FACE;

typedef enum _gceVERTEX_FORMAT {
    gcvVERTEX_BYTE,
    gcvVERTEX_UNSIGNED_BYTE,
    gcvVERTEX_SHORT,
    gcvVERTEX_UNSIGNED_SHORT,
    gcvVERTEX_INT,
    gcvVERTEX_UNSIGNED_INT,
    gcvVERTEX_FIXED,
    gcvVERTEX_HALF,
    gcvVERTEX_FLOAT,
    gcvVERTEX_DOUBLE,
    gcvVERTEX_UNSIGNED_INT_10_10_10_2,
    gcvVERTEX_INT_10_10_10_2,
    gcvVERTEX_UNSIGNED_INT_2_10_10_10_REV,
    gcvVERTEX_INT_2_10_10_10_REV,

    gcvVERTEX_INT8,
    gcvVERTEX_INT16,
    gcvVERTEX_INT32,
} gceVERTEX_FORMAT;


typedef enum _gceATTRIB_SCHEME {
    gcvATTRIB_SCHEME_KEEP = 0,
    gcvATTRIB_SCHEME_2_10_10_10_REV_TO_FLOAT,
    gcvATTRIB_SCHEME_BYTE_TO_IVEC4,
    gcvATTRIB_SCHEME_SHORT_TO_IVEC4,
    gcvATTRIB_SCHEME_INT_TO_IVEC4,
    gcvATTRIB_SCHEME_UBYTE_TO_UVEC4,
    gcvATTRIB_SCHEME_USHORT_TO_UVEC4,
    gcvATTRIB_SCHEME_UINT_TO_UVEC4,
    gcvATTRIB_SCHEME_DOUBLE_TO_FLOAT,
    gcvATTRIB_SCHEME_UBYTE_BGRA_TO_UBYTE_RGBA,
    gcvATTRIB_SCHEME_2_10_10_10_REV_BGRA_TO_FLOAT_RGBA,
} gceATTRIB_SCHEME;

typedef enum _gceBUFOBJ_TYPE {
    gcvBUFOBJ_TYPE_ARRAY_BUFFER = 1,
    gcvBUFOBJ_TYPE_ELEMENT_ARRAY_BUFFER = 2,
    gcvBUFOBJ_TYPE_UNIFORM_BUFFER = 3,
    gcvBUFOBJ_TYPE_DRAW_INDIRECT_BUFFER = 4,
    gcvBUFOBJ_TYPE_XFB_BUFFER = 5,
    gcvBUFOBJ_TYPE_GENERIC_BUFFER = 100

} gceBUFOBJ_TYPE;

typedef enum _gceBUFOBJ_USAGE {
    gcvBUFOBJ_USAGE_NONE = 0x0,
    gcvBUFOBJ_USAGE_STREAM_DRAW = 0x1,
    gcvBUFOBJ_USAGE_STREAM_READ = 0x2,
    gcvBUFOBJ_USAGE_STREAM_COPY = 0x3,
    gcvBUFOBJ_USAGE_STATIC_DRAW = 0x4,
    gcvBUFOBJ_USAGE_STATIC_READ = 0x5,
    gcvBUFOBJ_USAGE_STATIC_COPY = 0x6,
    gcvBUFOBJ_USAGE_DYNAMIC_DRAW = 0x7,
    gcvBUFOBJ_USAGE_DYNAMIC_READ = 0x8,
    gcvBUFOBJ_USAGE_DYNAMIC_COPY = 0x9,


    gcvBUFOBJ_USAGE_MASK = 0xFF,





    gcvBUFOBJ_USAGE_FLAG_DISABLE_FENCE_DYNAMIC_STREAM = 0x100,




    gcvBUFOBJ_USAGE_FLAG_DATA_USED_BY_DRIVER = 0x200,

    gcvBUFOBJ_USAGE_FLAG_32BIT_VA = 0x400,
} gceBUFOBJ_USAGE;
# 1662 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gceTILE_MODE {
    gcvTILE_FILL,
    gcvTILE_PAD,
    gcvTILE_REPEAT,
    gcvTILE_REFLECT
} gceTILE_MODE;
# 1676 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gcePAINT_TYPE {

    gcvPAINT_MODE_SOLID,


    gcvPAINT_MODE_LINEAR,


    gcvPAINT_MODE_RADIAL,


    gcvPAINT_MODE_PATTERN,


    gcvPAINT_MODE_COUNT
} gcePAINT_TYPE;
# 1701 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gcePATHTYPE {
    gcePATHTYPE_UNKNOWN = -1,
    gcePATHTYPE_INT8,
    gcePATHTYPE_INT16,
    gcePATHTYPE_INT32,
    gcePATHTYPE_FLOAT
} gcePATHTYPE;
# 1716 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gceVGCMD {
    gcvVGCMD_END,
    gcvVGCMD_CLOSE,
    gcvVGCMD_MOVE,
    gcvVGCMD_MOVE_REL,
    gcvVGCMD_LINE,
    gcvVGCMD_LINE_REL,
    gcvVGCMD_QUAD,
    gcvVGCMD_QUAD_REL,
    gcvVGCMD_CUBIC,
    gcvVGCMD_CUBIC_REL,
    gcvVGCMD_BREAK,
    gcvVGCMD_HLINE,
    gcvVGCMD_HLINE_REL,
    gcvVGCMD_VLINE,
    gcvVGCMD_VLINE_REL,
    gcvVGCMD_SQUAD,
    gcvVGCMD_SQUAD_REL,
    gcvVGCMD_SCUBIC,
    gcvVGCMD_SCUBIC_REL,
    gcvVGCMD_SCCWARC,
    gcvVGCMD_SCCWARC_REL,
    gcvVGCMD_SCWARC,
    gcvVGCMD_SCWARC_REL,
    gcvVGCMD_LCCWARC,
    gcvVGCMD_LCCWARC_REL,
    gcvVGCMD_LCWARC,
    gcvVGCMD_LCWARC_REL,


    gcvVGCMD_WIDTH = 5,


    gcvVGCMD_MASK = (1 << gcvVGCMD_WIDTH) - 1,


    gcvVGCMD_H_MOD = 1 << gcvVGCMD_WIDTH,
    gcvVGCMD_V_MOD = 2 << gcvVGCMD_WIDTH,
    gcvVGCMD_S_MOD = 3 << gcvVGCMD_WIDTH,
    gcvVGCMD_ARC_MOD = 4 << gcvVGCMD_WIDTH,


    gcvVGCMD_HLINE_EMUL = gcvVGCMD_H_MOD | gcvVGCMD_LINE,
    gcvVGCMD_HLINE_EMUL_REL = gcvVGCMD_H_MOD | gcvVGCMD_LINE_REL,
    gcvVGCMD_VLINE_EMUL = gcvVGCMD_V_MOD | gcvVGCMD_LINE,
    gcvVGCMD_VLINE_EMUL_REL = gcvVGCMD_V_MOD | gcvVGCMD_LINE_REL,


    gcvVGCMD_SQUAD_EMUL = gcvVGCMD_S_MOD | gcvVGCMD_QUAD,
    gcvVGCMD_SQUAD_EMUL_REL = gcvVGCMD_S_MOD | gcvVGCMD_QUAD_REL,
    gcvVGCMD_SCUBIC_EMUL = gcvVGCMD_S_MOD | gcvVGCMD_CUBIC,
    gcvVGCMD_SCUBIC_EMUL_REL = gcvVGCMD_S_MOD | gcvVGCMD_CUBIC_REL,


    gcvVGCMD_ARC_LINE = gcvVGCMD_ARC_MOD | gcvVGCMD_LINE,
    gcvVGCMD_ARC_LINE_REL = gcvVGCMD_ARC_MOD | gcvVGCMD_LINE_REL,
    gcvVGCMD_ARC_QUAD = gcvVGCMD_ARC_MOD | gcvVGCMD_QUAD,
    gcvVGCMD_ARC_QUAD_REL = gcvVGCMD_ARC_MOD | gcvVGCMD_QUAD_REL
} gceVGCMD;
typedef enum _gceVGCMD *gceVGCMD_PTR;
# 1785 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gceVG_BLEND {
    gcvVG_BLEND_SRC,
    gcvVG_BLEND_SRC_OVER,
    gcvVG_BLEND_DST_OVER,
    gcvVG_BLEND_SRC_IN,
    gcvVG_BLEND_DST_IN,
    gcvVG_BLEND_MULTIPLY,
    gcvVG_BLEND_SCREEN,
    gcvVG_BLEND_DARKEN,
    gcvVG_BLEND_LIGHTEN,
    gcvVG_BLEND_ADDITIVE,
    gcvVG_BLEND_SUBTRACT,
    gcvVG_BLEND_FILTER
} gceVG_BLEND;
# 1809 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gceVG_IMAGE {
    gcvVG_IMAGE_NONE,
    gcvVG_IMAGE_NORMAL,
    gcvVG_IMAGE_MULTIPLY,
    gcvVG_IMAGE_STENCIL,
    gcvVG_IMAGE_FILTER
} gceVG_IMAGE;
# 1824 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gceIMAGE_FILTER {
    gcvFILTER_POINT,
    gcvFILTER_LINEAR,
    gcvFILTER_BI_LINEAR
} gceIMAGE_FILTER;
# 1837 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gceVG_PRIMITIVE {
    gcvVG_SCANLINE,
    gcvVG_RECTANGLE,
    gcvVG_TESSELLATED,
    gcvVG_TESSELLATED_TILED
} gceVG_PRIMITIVE;
# 1851 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gceRENDER_QUALITY {
    gcvVG_NONANTIALIASED,
    gcvVG_2X2_MSAA,
    gcvVG_2X4_MSAA,
    gcvVG_4X4_MSAA
} gceRENDER_QUALITY;
# 1865 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gceFILL_RULE { gcvVG_EVEN_ODD, gcvVG_NON_ZERO } gceFILL_RULE;
# 1874 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gceCAP_STYLE { gcvCAP_BUTT, gcvCAP_ROUND, gcvCAP_SQUARE } gceCAP_STYLE;
# 1883 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gceJOIN_STYLE {
    gcvJOIN_MITER,
    gcvJOIN_ROUND,
    gcvJOIN_BEVEL
} gceJOIN_STYLE;
# 1896 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef enum _gceCHANNEL {
    gcvCHANNEL_XXXX = ((0) | (0) | (0) | (0)),
    gcvCHANNEL_XXXA = ((0) | (0) | (0) | (1 << 3)),
    gcvCHANNEL_XXBX = ((0) | (0) | (1 << 2) | (0)),
    gcvCHANNEL_XXBA = ((0) | (0) | (1 << 2) | (1 << 3)),

    gcvCHANNEL_XGXX = ((0) | (1 << 1) | (0) | (0)),
    gcvCHANNEL_XGXA = ((0) | (1 << 1) | (0) | (1 << 3)),
    gcvCHANNEL_XGBX = ((0) | (1 << 1) | (1 << 2) | (0)),
    gcvCHANNEL_XGBA = ((0) | (1 << 1) | (1 << 2) | (1 << 3)),

    gcvCHANNEL_RXXX = ((1 << 0) | (0) | (0) | (0)),
    gcvCHANNEL_RXXA = ((1 << 0) | (0) | (0) | (1 << 3)),
    gcvCHANNEL_RXBX = ((1 << 0) | (0) | (1 << 2) | (0)),
    gcvCHANNEL_RXBA = ((1 << 0) | (0) | (1 << 2) | (1 << 3)),

    gcvCHANNEL_RGXX = ((1 << 0) | (1 << 1) | (0) | (0)),
    gcvCHANNEL_RGXA = ((1 << 0) | (1 << 1) | (0) | (1 << 3)),
    gcvCHANNEL_RGBX = ((1 << 0) | (1 << 1) | (1 << 2) | (0)),
    gcvCHANNEL_RGBA = ((1 << 0) | (1 << 1) | (1 << 2) | (1 << 3)),
} gceCHANNEL;


typedef enum _gceSTATISTICS {
    gcvFRAME_FPS = 1,
} gceSTATISTICS;


typedef enum _gceVALUE_TYPE {
    gcvVALUE_UINT = 0x0,
    gcvVALUE_FIXED,
    gcvVALUE_FLOAT,
    gcvVALUE_INT,




    gcvVALUE_FLAG_UNSIGNED_DENORM = 0x00010000,




    gcvVALUE_FLAG_SIGNED_DENORM = 0x00020000,




    gcvVALUE_FLAG_GAMMAR = 0x00040000,




    gcvVALUE_FLAG_FLOAT_TO_FLOAT16 = 0x0080000,




    gcvVALUE_FLAG_MASK = 0xFFFF0000,
} gceVALUE_TYPE;

typedef enum _gceTRACEMODE {
    gcvTRACEMODE_NONE = 0,
    gcvTRACEMODE_FULL = 1,
    gcvTRACEMODE_LOGGER = 2,
    gcvTRACEMODE_ALLZONE = 3,
    gcvTRACEMODE_PRE = 4,
    gcvTRACEMODE_POST = 5,
} gceTRACEMODE;

enum {

    gcvPLATFORM_FLAG_LIMIT_4G_ADDRESS = 1 << 0,

    gcvPLATFORM_FLAG_IMX_MM = 1 << 1,
};


typedef enum _gceCAPBUF_META_TYPE {
    gcvCAPBUF_META_TYPE_BASE = 0,
    gcvCAPBUF_META_TYPE_STATE_BUFFER = 0,
    gcvCAPBUF_META_TYPE_DRAW_ID,
    gcvCAPBUF_META_TYPE_SH_UNIFORM,
    gcvCAPBUF_META_TYPE_VIP_SRAM,
    gcvCAPBUF_META_TYPE_AXI_SRAM,
    gcvCAPBUF_META_TYPE_PPU_PARAMETERS,
    gcvCAPBUF_META_TYPE_VIP_SRAM_REMAP,
    gcvCAPBUF_META_TYPE_AXI_SRAM_REMAP,
    gcvCAPBUF_META_TYPE_IMAGE_PHYSICAL_ADDRESS,
    gcvCAPBUF_META_TYPE_IMAGE_PHYSICAL_ADDRESS_40BIT,
    gcvCAPBUF_META_TYPE_SH_INST_ADDRESS,
    gcvCAPBUF_META_TYPE_SH_UNIFORM_ARGS_LOCAL_ADDRESS_SPACE,
    gcvCAPBUF_META_TYPE_SH_UNIFORM_ARGS_CONSTANT_ADDRESS_SPACE,
    gcvCAPBUF_META_TYPE_NN_TP_INST_ADDRESS,
    gcvCAPBUF_META_TYPE_LOW32_OF_40BIT_PHY_ADDR,

    gcvCAPBUF_META_TYPE_COUNT
} gceCAPBUF_META_TYPE;

typedef enum _gceCAPBUF_SH_UNIFROM_ARGS {
    gcvCAPBUF_SH_UNIFORM_ARGS_INVALID = 0,
    gcvCAPBUF_SH_UNIFORM_ARGS_IMAGE_PHYSICAL_ADDRESS,
    gcvCAPBUF_SH_UNIFORM_ARGS_IMAGE_PHYSICAL_ADDRESS_40BIT,
    gcvCAPBUF_SH_UNIFORM_ARGS_LOCAL_ADDRESS_SPACE,
    gcvCAPBUF_SH_UNIFORM_ARGS_CONSTANT_ADDRESS_SPACE,
    gcvCAPBUF_SH_UNIFORM_ARGS_LOW32_OF_40BIT_PHY_ADDR,

    gcvCAPBUF_SH_UNIFORM_ARGS_COUNT
} gceCAPBUF_SH_UNIFORM_ARGS;

typedef enum _gceCAPBUF_SH_UNIFORM_STATE_DATA_TYPE
{
    gcvCAPBUF_SH_UNIFORM_STATE_DATA_TYPE_INVALID = 0,
    gcvCAPBUF_SH_UNIFORM_STATE_DATA_TYPE_IMAGE_PHYSICAL_ADDRESS,
    gcvCAPBUF_SH_UNIFORM_STATE_DATA_TYPE_IMAGE_PHYSICAL_ADDRESS_40BIT_LOW,
    gcvCAPBUF_SH_UNIFORM_STATE_DATA_TYPE_IMAGE_PHYSICAL_ADDRESS_40BIT_HIGH,
    gcvCAPBUF_SH_UNIFORM_STATE_DATA_TYPE_IMAGE_PHYSICAL_ADDRESS_40BIT_HIGH1,
    gcvCAPBUF_SH_UNIFORM_STATE_DATA_TYPE_LOCAL_ADDRESS_SPACE,
    gcvCAPBUF_SH_UNIFORM_STATE_DATA_TYPE_CONSTANT_ADDRESS_SPACE,
    gcvCAPBUF_SH_UNIFORM_STATE_DATA_TYPE_LOW32_OF_40BIT_PHY_ADDR,

    gcvCAPBUF_SH_UNIFORM_STATE_DATA_TYPE_COUNT
} gceCAPBUF_SH_UNIFORM_STATE_DATA_TYPE;

typedef enum _gceCAPBUF_PPU_PARAMETERS_INDEX {
    gcvCAPBUF_PPU_GLOBAL_OFFSET_X = 0,
    gcvCAPBUF_PPU_GLOBAL_OFFSET_Y,
    gcvCAPBUF_PPU_GLOBAL_OFFSET_Z,
    gcvCAPBUF_PPU_GLOBAL_SCALE_X,
    gcvCAPBUF_PPU_GLOBAL_SCALE_Y,
    gcvCAPBUF_PPU_GLOBAL_SCALE_Z,
    gcvCAPBUF_PPU_GROUP_SIZE_X,
    gcvCAPBUF_PPU_GROUP_SIZE_Y,
    gcvCAPBUF_PPU_GROUP_SIZE_Z,
    gcvCAPBUF_PPU_GROUP_COUNT_X,
    gcvCAPBUF_PPU_GROUP_COUNT_Y,
    gcvCAPBUF_PPU_GROUP_COUNT_Z,
    gcvCAPBUF_PPU_PARAMETERS_COUNT
} gceCAPBUF_PPU_GLOBALE_OFFSET_INDEX;
# 2057 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_enum.h"
typedef struct _gckCONTEXT *gckCONTEXT;
typedef struct _gcoCMDBUF *gcoCMDBUF;

typedef struct _gcsSTATE_DELTA *gcsSTATE_DELTA_PTR;
typedef struct _gcsQUEUE *gcsQUEUE_PTR;
typedef struct _gcoQUEUE *gcoQUEUE;
typedef struct _gcsHAL_INTERFACE *gcsHAL_INTERFACE_PTR;
typedef struct _gcsEVENT_INTERFACE *gcsEVENT_INTERFACE_PTR;

typedef struct _gcsHAL_PROFILER_INTERFACE *gcsHAL_PROFILER_INTERFACE_PTR;

typedef struct _gcs2D_PROFILE *gcs2D_PROFILE_PTR;
# 59 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h" 2
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_types.h" 1
# 60 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h" 2
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_debug_zones.h" 1
# 61 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h" 2
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_base_shared.h" 1
# 64 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_base_shared.h"
typedef struct _gcsBINARY_TRACE_MESSAGE *gcsBINARY_TRACE_MESSAGE_PTR;
typedef struct _gcsBINARY_TRACE_MESSAGE {
    gctUINT32 signature;
    gctUINT32 pid;
    gctUINT32 tid;
    gctUINT32 line;
    gctUINT32 numArguments;
    gctUINT8 payload;
} gcsBINARY_TRACE_MESSAGE;


typedef struct _gcsOBJECT {

    gceOBJECT_TYPE type;
} gcsOBJECT;
# 62 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h" 2
# 79 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
typedef struct _gckOS *gckOS;
typedef struct _gcoHAL *gcoHAL;
typedef struct _gcoOS *gcoOS;
typedef struct _gco2D *gco2D;
typedef struct gcsATOM *gcsATOM_PTR;

typedef struct _gco3D *gco3D;
typedef struct _gcoCL *gcoCL;
typedef struct _gcoVX *gcoVX;
typedef struct _gcsFAST_FLUSH *gcsFAST_FLUSH_PTR;

typedef struct _gcoSURF *gcoSURF;
typedef struct _gcsSURF_NODE *gcsSURF_NODE_PTR;
typedef struct _gcsSURF_FORMAT_INFO *gcsSURF_FORMAT_INFO_PTR;
typedef struct _gcsPOINT *gcsPOINT_PTR;
typedef struct _gcsSIZE *gcsSIZE_PTR;
typedef struct _gcsRECT *gcsRECT_PTR;
typedef struct _gcsBOUNDARY *gcsBOUNDARY_PTR;
typedef struct _gcoHARDWARE *gcoHARDWARE;
typedef struct _gcoDEVICE *gcoDEVICE;



typedef union _gcuVIDMEM_NODE *gcuVIDMEM_NODE_PTR;
typedef struct _gcsVIDMEM_NODE *gckVIDMEM_NODE;
typedef struct _gcsVIDMEM_BLOCK *gckVIDMEM_BLOCK;






typedef void *gcoVG;


typedef struct _gcoFENCE *gcoFENCE;
typedef struct _gcsSYNC_CONTEXT *gcsSYNC_CONTEXT_PTR;

typedef struct _gcsUSER_MEMORY_DESC *gcsUSER_MEMORY_DESC_PTR;


typedef struct _gcsNN_FIXED_FEATURE {
    gctUINT vipCoreCount;
    gctUINT vipRingCount;
    gctUINT nnMadPerCore;
    gctUINT nnInputBufferDepth;
    gctUINT nnAccumBufferDepth;
    gctUINT nnFCNonPrunAccel;
    gctUINT nnInImageOffsetBits;
    gctUINT tpCoreCount;
    gctUINT tpPwlLUTCount;
    gctUINT tpPwlLUTSize;
    gctUINT vip7Version;
    gctUINT vipBrickMode;
    gctUINT tpReorderInImageSize;
    gctUINT tpliteCoreCount;
    gctUINT nnFP16XYDPX;
    gctUINT nnFP16XYDPY;
    gctUINT nnFP16ZDP;
    gctUINT zrlBits;
    gctUINT uscCacheControllers;
    gctUINT uscBanks;
    gctUINT nnLanesPerOutCycle;
    gctUINT maxOTNumber;
    gctUINT physicalVipSramWidthInByte;
    gctUINT equivalentVipsramWidthInByte;
    gctUINT shaderCoreCount;
    gctUINT latencyHidingAtFullAxiBw;
    gctUINT axiBusWidth;
    gctUINT nnMaxKXSize;
    gctUINT nnMaxKYSize;
    gctUINT nnMaxKZSize;
    gctUINT nnClusterNumForPowerControl;
    gctUINT vipMinAxiBurstSize;
    gctUINT streamProcessorExecCount;


    gctUINT outImageXStrideBits;
    gctUINT outImageYStrideBits;
    gctUINT inImageXStrideBits;
    gctUINT inImageYStrideBits;
    gctUINT outImageXSizeBits;
    gctUINT outImageYSizeBits;
    gctUINT inImageXSizeBits;
    gctUINT inImageYSizeBits;
    gctUINT smallAccumBits;
} gcsNN_FIXED_FEATURE;


typedef struct _gcsNN_CUSTOMIZED_FEATURE {
    gctUINT nnActiveCoreCount;
    gctUINT nnCoreCount;
    gctUINT nnCoreCountInt8;
    gctUINT nnCoreCountInt16;
    gctUINT nnCoreCountFloat16;
    gctUINT nnCoreCountBFloat16;
    gctUINT vipSRAMSize;
    gctUINT axiSRAMSize;
    gctFLOAT ddrReadBWLimit;
    gctFLOAT ddrWriteBWLimit;
    gctFLOAT ddrTotalBWLimit;
    gctFLOAT axiSramReadBWLimit;
    gctFLOAT axiSramWriteBWLimit;
    gctFLOAT axiSramTotalBWLimit;
    gctFLOAT axiBusReadBWLimit;
    gctFLOAT axiBusWriteBWLimit;
    gctFLOAT axiBusTotalBWLimit;
    gctUINT vipSWTiling;
    gctFLOAT ddrLatency;
    gctUINT freqInMHZ;
    gctUINT axiClockFreqInMHZ;
    gctUINT maxSocOTNumber;
    gctUINT nnWriteWithoutUSC;
    gctUINT depthWiseSupport;
    gctUINT vipVectorPrune;
    gctUINT ddrKernelBurstSize;
} gcsNN_CUSTOMIZED_FEATURE;


typedef struct _gcsNN_UNIFIED_FEATURE {
    gctUINT nnUSCCacheSize;
    gctUINT nnCmdSizeInBytes;
    gctUINT tpCmdSizeInBytes;
    gctUINT vipCoefDecodePerf;
    gctUINT vipCachedReadFromSram;
    gctUINT vipImagePartialCache;
    gctUINT lanesPerConv;
    gctUINT maxTileSize;
    gctUINT fullCacheKernelHeadFix : 1;
    gctUINT conv1x1HalfPerformance : 1;
    gctUINT per3DTileBubbleFix : 1;
    gctUINT cacheLineModeDisabled : 1;
    gctUINT tpReOrderFix : 1;
    gctUINT zdp3NoCompressFix : 1;
    gctUINT asyncCopyPerfFix : 1;
    gctUINT accurateTileBW : 1;
    gctUINT zxdp3KernelReadConflictFix : 1;
    gctUINT axiSramSlowedDownByAddr : 1;
    gctUINT slowNNReqArbitrationFix : 1;
    gctUINT singlePortAccBuffer : 1;
    gctUINT convOutFifoDepthFix : 1;
    gctUINT smallBatchEnable : 1;
    gctUINT axiSramOnlySWTiling : 1;
    gctUINT imageNotPackedInSram : 1;
    gctUINT coefDeltaCordOverFlowZRL8BitFix : 1;
    gctUINT lowEfficiencyOfIDWriteImgBufFix : 1;
    gctUINT xyOffsetLimitationFix : 1;
    gctUINT kernelPerCoreLTOneThirdCoefFix : 1;
    gctUINT diffConditionForCachelineModePreFix : 1;
} gcsNN_UNIFIED_FEATURE;


typedef struct _gcsNN_DERIVIED_FEATURE {
    gctUINT nnDPAmount;
    gctUINT nnXYDPX;
    gctUINT nnXYDPY;
    gctUINT nnZDP;
    gctFLOAT totalLatency;
    gctFLOAT internalLatency;
    gctFLOAT ddrReadBWInBytePerCycle;
    gctFLOAT ddrWriteBWInBytePerCycle;
} gcsNN_DERIVED_FEATURE;
# 259 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
typedef struct _gcsSystemInfo {

    gctUINT32 memoryLatencySH;
} gcsSystemInfo;
# 314 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
typedef struct _gcsDRIVER_TLS *gcsDRIVER_TLS_PTR;

typedef struct _gcsDRIVER_TLS {
    void (*destructor)(gcsDRIVER_TLS_PTR Tls);
} gcsDRIVER_TLS;

typedef struct _gcsTLS *gcsTLS_PTR;

typedef struct _gcsTLS {
    gceHARDWARE_TYPE currentType;
    gceHARDWARE_TYPE targetType;




    gctUINT32 currentCoreIndex;


    gctUINT32 currentDevIndex;


    gcoHARDWARE currentHardware;


    gcoHARDWARE defaultHardware;


    gcoHARDWARE hardware2D;





    gco3D engine3D;


    gco2D engine2D;





    gcoVX engineVX;

    gctBOOL copied;


    gctHANDLE handle;

    gctHANDLE graph;


    gctBOOL release2DUpper;


    gcsDRIVER_TLS_PTR driverTLS[gcvTLS_KEY_COUNT];





} gcsTLS;

typedef struct _gcsSURF_VIEW {
    gcoSURF surf;
    gctUINT firstSlice;
    gctUINT numSlices;
} gcsSURF_VIEW;


typedef struct _gcsHAL_LIMITS {

    gceCHIPMODEL chipModel;
    gctUINT32 chipRevision;
    gctUINT32 featureCount;
    gctUINT32 *chipFeatures;


    gctUINT32 maxWidth;
    gctUINT32 maxHeight;
    gctUINT32 multiTargetCount;
    gctUINT32 maxSamples;

} gcsHAL_LIMITS;

typedef struct _gcsHAL_CHIPIDENTITY {
    gceCHIPMODEL chipModel;
    gctUINT32 chipRevision;
    gctUINT32 productID;
    gctUINT32 customerID;
    gctUINT32 ecoID;
    gceCHIP_FLAG chipFlags;
    gctUINT64 platformFlagBits;
} gcsHAL_CHIPIDENTITY;






gceSTATUS
gcoHAL_ConstructEx( gctPOINTER Context, gcoOS Os, gcoHAL *Hal);


gceSTATUS
gcoHAL_DestroyEx( gcoHAL Hal);


gceSTATUS
gcoHAL_Construct( gctPOINTER Context, gcoOS Os, gcoHAL *Hal);


gceSTATUS
gcoHAL_Destroy( gcoHAL Hal);


gceSTATUS
gcoHAL_GetOption( gcoHAL Hal, gceOPTION Option);

gceSTATUS
gcoHAL_FrameInfoOps( gcoHAL Hal,
                    gceFRAMEINFO FrameInfo,
                    gceFRAMEINFO_OP Op,
                    gctUINT *Val);


gceSTATUS
gcoHAL_SetOption( gcoHAL Hal, gceOPTION Option, gctBOOL Value);

gceSTATUS
gcoHAL_GetHardware( gcoHAL Hal, gcoHARDWARE *Hw);



gceSTATUS
gcoHAL_Get2DEngine( gcoHAL Hal, gco2D *Engine);



gceSTATUS
gcoHAL_GetSpecialHintData( gcoHAL Hal, gctINT *Hint);



gceSTATUS
gcoHAL_Get3DEngine( gcoHAL Hal, gco3D *Engine);


gceSTATUS
gcoHAL_GetProductName( gcoHAL Hal,
                      gctSTRING *ProductName,
                      gctUINT *PID );
gceSTATUS
gcoHAL_GetProductNameWithHardware( gcoHARDWARE Hardware,
                                  gctSTRING *ProductName,
                                  gctUINT *PID);

gceSTATUS
gcoHAL_SetFscaleValue( gcoHAL Hal,
                      gctUINT CoreIndex,
                      gctUINT FscaleValue,
                      gctUINT ShaderFscaleValue);

gceSTATUS
gcoHAL_CancelJob(gcoHAL Hal);

gceSTATUS
gcoHAL_GetFscaleValue( gctUINT *FscaleValue,
                      gctUINT *MinFscaleValue,
                      gctUINT *MaxFscaleValue);

gceSTATUS
gcoHAL_SetBltNP2Texture(gctBOOL enable);

gceSTATUS
gcoHAL_ExportVideoMemory( gctUINT32 Handle,
                         gctUINT32 Flags, gctINT32 *FD);

gceSTATUS
gcoHAL_NameVideoMemory( gctUINT32 Handle, gctUINT32 *Name);

gceSTATUS
gcoHAL_ImportVideoMemory( gctUINT32 Name, gctUINT32 *Handle);

gceSTATUS
gcoHAL_GetVideoMemoryFd( gctUINT32 Handle, gctINT *Fd);

gceSTATUS
gcoHAL_GetExportedVideoMemoryFd( gctUINT32 Handle, gctINT *Fd);


gceSTATUS
gcoHAL_IsFeatureAvailable( gcoHAL Hal, gceFEATURE Feature);

gceSTATUS
gcoHAL_IsFeatureAvailableWithHardware( gcoHARDWARE Hardware, gceFEATURE Feature);

gceSTATUS
gcoHAL_IsFeatureAvailable1( gcoHAL Hal, gceFEATURE Feature);


gceSTATUS
gcoHAL_QueryChipIdentity( gcoHAL Hal,
                         gceCHIPMODEL *ChipModel,
                         gctUINT32 *ChipRevision,
                         gctUINT32 *ChipFeatures,
                         gctUINT32 *ChipMinorFeatures);

gceSTATUS
gcoHAL_QueryChipIdentityWithHardware( gcoHARDWARE Hardware,
                                     gceCHIPMODEL *ChipModel,
                                     gctUINT32 *ChipRevision);

gceSTATUS
gcoHAL_QueryChipIdentityEx( gcoHAL Hal, gctUINT32 SizeOfParam,
                           gcsHAL_CHIPIDENTITY *ChipIdentity);

gceSTATUS
gcoHAL_QuerySuperTileMode( gctUINT32_PTR SuperTileMode);

gceSTATUS
gcoHAL_QueryChipAxiBusWidth( gctBOOL *AXI128Bits);

gceSTATUS
gcoHAL_QueryMultiGPUAffinityConfig( gceHARDWARE_TYPE Type,
                                   gceMULTI_PROCESSOR_MODE *Mode,
                                   gctUINT32_PTR CoreIndex);

gceSTATUS
gcoHAL_QueryHwDeviceIdByEnv( gcoHAL Hal,
                            gctUINT32 *DeviceID,
                            gctBOOL *HasEnv);

gceSTATUS
gcoHAL_QuerySRAM( gcoHAL Hal, gcePOOL Type,
                 gctUINT32 *Size, gctADDRESS *GPUVirtAddr,
                 gctPHYS_ADDR_T *GPUPhysAddr,
                 gctUINT32 *GPUPhysName,
                 gctPHYS_ADDR_T *CPUPhysAddr);


gctINT32
gcoOS_EndRecordAllocation(void);
void
gcoOS_RecordAllocation(void);
void
gcoOS_AddRecordAllocation(gctSIZE_T Size);



gceSTATUS
gcoHAL_QueryVideoMemory( gcoHAL Hal,
                        gctUINT32 *InternalPhysName,
                        gctSIZE_T *InternalSize,
                        gctUINT32 *ExternalPhysName,
                        gctSIZE_T *ExternalSize,
                        gctUINT32 *ContiguousPhysName,
                        gctSIZE_T *ContiguousSize);


gceSTATUS
gcoHAL_MapMemory( gcoHAL Hal, gctUINT32 PhysName,
                 gctSIZE_T NumberOfBytes, gctPOINTER *Logical);


gceSTATUS
gcoHAL_UnmapMemory( gcoHAL Hal, gctUINT32 PhysName,
                   gctSIZE_T NumberOfBytes, gctPOINTER Logical);


gceSTATUS
gcoHAL_ScheduleUnmapMemory( gcoHAL Hal, gctUINT32 PhysName,
                           gctSIZE_T NumberOfBytes, gctPOINTER Logical);


gceSTATUS
gcoOS_AllocateVideoMemory( gcoOS Os, gctBOOL InUserSpace,
                          gctBOOL InCacheable, gctSIZE_T *Bytes,
                          gctUINT32 *Address,
                          gctPOINTER *Logical,
                          gctPOINTER *Handle);


gceSTATUS
gcoOS_FreeVideoMemory( gcoOS Os, gctPOINTER Handle);


gceSTATUS
gcoOS_LockVideoMemory( gcoOS Os,
                      gctPOINTER Handle,
                      gctBOOL InUserSpace,
                      gctBOOL InCacheable,
                      gctUINT32 *Address,
                      gctPOINTER *Logical);


gceSTATUS
gcoHAL_Commit( gcoHAL Hal, gctBOOL Stall);



gceSTATUS
gcoHAL_SendFence( gcoHAL Hal);


gceSTATUS
gcoHAL_TimeQuery_SendFence( gcoHAL Hal, gctADDRESS physical);

gceSTATUS
gcoHAL_TimeQuery_WaitFence( gcoHAL Hal,
                           gcsSURF_NODE_PTR node,
                           gctPOINTER nodeHeaderLocked,
                           gctPOINTER logical);



gceSTATUS
gcoHAL_QueryTiled( gcoHAL Hal,
                  gctINT32 *TileWidth2D,
                  gctINT32 *TileHeight2D,
                  gctINT32 *TileWidth3D,
                  gctINT32 *TileHeight3D);

gceSTATUS
gcoHAL_Compact( gcoHAL Hal);


gceSTATUS
gcoHAL_ProfileStart( gcoHAL Hal);

gceSTATUS
gcoHAL_ProfileEnd( gcoHAL Hal, gctCONST_STRING Title);



gceSTATUS
gcoHAL_SetPowerManagementState( gcoHAL Hal,
                               gceCHIPPOWERSTATE State);

gceSTATUS
gcoHAL_QueryPowerManagementState( gcoHAL Hal,
                                 gceCHIPPOWERSTATE *State);


gceSTATUS
gcoHAL_SetFilterType( gcoHAL Hal,
                     gceFILTER_TYPE FilterType);


gceSTATUS
gcoHAL_Call( gcoHAL Hal,
            gcsHAL_INTERFACE_PTR Interface);


gceSTATUS
gcoHAL_ScheduleEvent( gcoHAL Hal,
                     gcsHAL_INTERFACE_PTR Interface);


gceSTATUS
gcoHAL_SetTimer( gcoHAL Hal, gctUINT32 Index, gctBOOL Start);


gceSTATUS
gcoHAL_GetTimerTime( gcoHAL Hal, gctUINT32 Timer,
                    gctINT32_PTR TimeDelta);


gceSTATUS
gcoHAL_SetTimeOut( gcoHAL Hal, gctUINT32 timeOut);

gceSTATUS
gcoHAL_SetHardwareType( gcoHAL Hal,
                       gceHARDWARE_TYPE HardwardType);

gceSTATUS
gcoHAL_GetHardwareType( gcoHAL Hal,
                       gceHARDWARE_TYPE *HardwardType);

gceSTATUS
gcoHAL_QueryChipCount( gcoHAL Hal, gctINT32 *Count);

gceSTATUS
gcoHAL_Query3DCoreCount( gcoHAL Hal, gctUINT32 *Count);

gceSTATUS
gcoHAL_Query2DCoreCount( gcoHAL Hal, gctUINT32 *Count);

gceSTATUS
gcoHAL_QueryCluster( gcoHAL Hal,
                    gctINT32 *ClusterMinID,
                    gctINT32 *ClusterMaxID,
                    gctUINT32 *ClusterCount,
                    gctUINT32 *ClusterIDWidth);

gceSTATUS
gcoHAL_QueryUscAttribCacheRatio( gcoHAL Hal,
                                gctUINT32 *UscAttribCacheRatio);

gceSTATUS
gcoHAL_QueryCoreCount( gcoHAL Hal,
                      gceHARDWARE_TYPE Type,
                      gctUINT *Count,
                      gctUINT_PTR ChipIDs);

gceSTATUS
gcoHAL_QuerySeparated2D( gcoHAL Hal);

gceSTATUS
gcoHAL_QueryHybrid2D( gcoHAL Hal);

gceSTATUS
gcoHAL_Is3DAvailable( gcoHAL Hal);


gceSTATUS
gcoHAL_GetVGEngine( gcoHAL Hal, gcoVG *Engine);

gceSTATUS
gcoHAL_QueryChipLimits( gcoHAL Hal, gctINT32 Chip,
                       gcsHAL_LIMITS *Limits);

gceSTATUS
gcoHAL_QueryChipFeature( gcoHAL Hal, gctINT32 Chip, gceFEATURE Feature);

gceSTATUS
gcoHAL_SetDeviceIndex( gcoHAL Hal, gctUINT32 DeviceIndex);

gceSTATUS
gcoHAL_GetCurrentDeviceIndex( gcoHAL Hal, gctUINT32 *DeviceIndex);

gceSTATUS
gcoHAL_SetCoreIndex( gcoHAL Hal, gctUINT32 Core);

gceSTATUS
gcoHAL_GetCurrentCoreIndex( gcoHAL Hal, gctUINT32 *Core);

gceSTATUS
gcoHAL_InitCoreIndexByType( gcoHAL Hal,
                           gceHARDWARE_TYPE Type,
                           gctBOOL Init,
                           gctUINT32 *CoreIndex);

gceSTATUS
gcoHAL_ConvertCoreIndexGlobal( gcoHAL Hal,
                              gceHARDWARE_TYPE Type,
                              gctUINT32 CoreCount,
                              gctUINT32 *LocalCoreIndexs,
                              gctUINT32 *GlobalCoreIndexs);

gceSTATUS
gcoHAL_ConvertCoreIndexLocal( gcoHAL Hal,
                             gceHARDWARE_TYPE Type,
                             gctUINT32 CoreCount,
                             gctUINT32 *GlobalCoreIndexs,
                             gctUINT32 *LocalCoreIndexs);

gceSTATUS
gcoHAL_SelectChannel( gcoHAL Hal, gctBOOL Priority, gctUINT32 ChannelId);

gceSTATUS
gcoHAL_MCFESemaphore( gctUINT32 SemaHandle, gctBOOL SendSema);

gceSTATUS
gcoHAL_AllocateMCFESemaphore( gctUINT32 *SemaHandle);

gceSTATUS
gcoHAL_FreeMCFESemaphore( gctUINT32 SemaHandle);





gceSTATUS
gcoHAL_CreateShBuffer( gctUINT32 Size, gctSHBUF *ShBuf);


gceSTATUS
gcoHAL_DestroyShBuffer( gctSHBUF ShBuf);


gceSTATUS
gcoHAL_MapShBuffer( gctSHBUF ShBuf);


gceSTATUS
gcoHAL_WriteShBuffer( gctSHBUF ShBuf, gctCONST_POINTER Data, gctUINT32 ByteCount);


gceSTATUS
gcoHAL_ReadShBuffer( gctSHBUF ShBuf,
                    gctPOINTER Data,
                    gctUINT32 BytesCount,
                    gctUINT32 *BytesRead);


gceSTATUS
gcoHAL_ConfigPowerManagement( gctBOOL Enable, gctBOOL *OldValue);

gceSTATUS
gcoHAL_AllocateVideoMemory( gctUINT Alignment,
                           gceVIDMEM_TYPE Type,
                           gctUINT32 Flag,
                           gcePOOL *Pool,
                           gctSIZE_T *Bytes,
                           gctUINT32_PTR Node);

gceSTATUS
gcoHAL_LockVideoMemory( gctUINT32 Node,
                       gctBOOL Cacheable,
                       gceENGINE engine,
                       gctADDRESS *Address,
                       gctPOINTER *Logical);

gceSTATUS
gcoHAL_LockVideoMemoryEx( gctUINT32 Node,
                         gctBOOL Cacheable,
                         gceENGINE engine,
                         gceLOCK_VIDEO_MEMORY_OP Op,
                         gctADDRESS *Address,
                         gctPOINTER *Logical);

gceSTATUS
gcoHAL_UnlockVideoMemory( gctUINT32 Node, gceVIDMEM_TYPE Type, gceENGINE engine);

gceSTATUS
gcoHAL_UnlockVideoMemoryEX( gctUINT32 Node,
                           gceVIDMEM_TYPE Type,
                           gceENGINE Engine,
                           gctBOOL Sync,
                           gceLOCK_VIDEO_MEMORY_OP Op);

gceSTATUS
gcoHAL_ReleaseVideoMemory( gctUINT32 Node);



gceSTATUS
gcoHAL_QueryTargetCaps( gcoHAL Hal,
                       gctUINT *MaxWidth,
                       gctUINT *MaxHeight,
                       gctUINT *MultiTargetCount,
                       gctUINT *MaxSamples);


gceSTATUS
gcoHAL_PrepareVideoMemory( gctUINT32 Node);

gceSTATUS
gcoHAL_FinishVideoMemory( gctUINT32 Node);

gceSTATUS
gcoHAL_WrapUserMemory( gcsUSER_MEMORY_DESC_PTR UserMemoryDesc,
                      gceVIDMEM_TYPE Type,
                      gctUINT32_PTR Node);

gceSTATUS
gcoHAL_QueryResetTimeStamp( gctUINT64_PTR ResetTimeStamp,
                           gctUINT64_PTR ContextID);

gceSTATUS
gcoHAL_WaitFence( gctUINT32 Handle, gctUINT32 TimeOut);

gceSTATUS
gcoHAL_ScheduleSignal( gctSIGNAL Signal,
                      gctSIGNAL AuxSignal,
                      gctINT ProcessID,
                      gceKERNEL_WHERE FromWhere);

gceSTATUS
gcoHAL_GetGraphicBufferFd( gctUINT32 Node[3],
                          gctSHBUF ShBuf,
                          gctSIGNAL Signal,
                          gctINT32 *Fd);

gceSTATUS
gcoHAL_AlignToTile( gctUINT32 *Width,
                   gctUINT32 *Height,
                   gceSURF_TYPE Type,
                   gceSURF_FORMAT Format);

gceSTATUS
gcoHAL_GetLastCommitStatus( gcoHAL Hal, gctBOOL *Pending);

gceSTATUS
gcoHAL_SetLastCommitStatus( gcoHAL Hal, gctBOOL Pending);

gceSTATUS
gcoHAL_CommitDone( gcoHAL Hal);

gceSTATUS
gcoHAL_IsFlatMapped( gctPHYS_ADDR_T PhysicalAddress,
                    gctADDRESS *Address);

gceSTATUS
gcoHAL_QueryMCFESemaphoreCapacity( gcoHAL Hal,
                                  gctUINT32 *Capacity);






gceSTATUS
gcoHAL_CommandBufferAutoCommit(gcoHAL Hal, gctBOOL AutoCommit);

gceSTATUS
gcoHAL_CommandBufferAutoSync(gcoHAL Hal, gctBOOL AutoSync);
# 948 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gceSTATUS
gcoOS_LockPLS(void);


gceSTATUS
gcoOS_UnLockPLS(void);


gctPOINTER
gcoOS_GetPLSValue( gcePLS_VALUE key);


void
gcoOS_SetPLSValue( gcePLS_VALUE key, gctPOINTER value);


gceSTATUS
gcoOS_LockGLFECompiler(void);


gceSTATUS
gcoOS_UnLockGLFECompiler(void);


gceSTATUS
gcoOS_LockCLFECompiler(void);


gceSTATUS
gcoOS_UnLockCLFECompiler(void);

gceSTATUS
gcoOS_GetTLS( gcsTLS_PTR *TLS);


gceSTATUS
gcoOS_CopyTLS( gcsTLS_PTR Source);


gceSTATUS
gcoOS_QueryTLS( gcsTLS_PTR *TLS);


gceSTATUS
gcoOS_GetDriverTLS( gceTLS_KEY Key,
                   gcsDRIVER_TLS_PTR *TLS);





gceSTATUS
gcoOS_SetDriverTLS( gceTLS_KEY Key, gcsDRIVER_TLS *TLS);


void
gcoOS_FreeThreadData(void);


gceSTATUS
gcoOS_Construct( gctPOINTER Context, gcoOS *Os);


gceSTATUS
gcoOS_Destroy( gcoOS Os);






gceSTATUS
gcoOS_GetBaseAddress( gcoOS Os, gctUINT32_PTR BaseAddress);


gceSTATUS
gcoOS_Allocate( gcoOS Os, gctSIZE_T Bytes,
               gctPOINTER *Memory);

gceSTATUS
gcoOS_Realloc( gcoOS Os,
              gctSIZE_T Bytes,
              gctSIZE_T OrgBytes,
              gctPOINTER *Memory);


gceSTATUS
gcoOS_GetMemorySize( gcoOS Os, gctPOINTER Memory,
                    gctSIZE_T_PTR MemorySize);


gceSTATUS
gcoOS_Free( gcoOS Os, gctPOINTER Memory);


gceSTATUS
gcoOS_AllocateSharedMemory( gcoOS Os, gctSIZE_T Bytes,
                           gctPOINTER *Memory);


gceSTATUS
gcoOS_FreeSharedMemory( gcoOS Os, gctPOINTER Memory);


gceSTATUS
gcoOS_AllocateMemory( gcoOS Os, gctSIZE_T Bytes,
                     gctPOINTER *Memory);


gceSTATUS
gcoOS_ReallocMemory( gcoOS Os, gctSIZE_T Bytes,
                    gctSIZE_T OrgBytes, gctPOINTER *Memory);


gceSTATUS
gcoOS_FreeMemory( gcoOS Os, gctPOINTER Memory);


gceSTATUS
gcoOS_DeviceControl( gcoOS Os,
                    gctUINT32 IoControlCode,
                    gctPOINTER InputBuffer,
                    gctSIZE_T InputBufferSize,
                    gctPOINTER OutputBuffer,
                    gctSIZE_T OutputBufferSize);
# 1092 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gceSTATUS
gcoOS_Open( gcoOS Os,
           gctCONST_STRING FileName,
           gceFILE_MODE Mode,
           gctFILE *File);


gceSTATUS
gcoOS_Close( gcoOS Os, gctFILE File);


gceSTATUS
gcoOS_Remove( gcoOS Os, gctCONST_STRING FileName);


gceSTATUS
gcoOS_Read( gcoOS Os,
           gctFILE File,
           gctSIZE_T ByteCount,
           gctPOINTER Data,
           gctSIZE_T *ByteRead);


gceSTATUS
gcoOS_Write( gcoOS Os,
            gctFILE File,
            gctSIZE_T ByteCount,
            gctCONST_POINTER Data);


gceSTATUS
gcoOS_Flush( gcoOS Os, gctFILE File);


gceSTATUS
gcoOS_CloseFD( gcoOS Os, gctINT FD);


gceSTATUS
gcoOS_FscanfI( gcoOS Os,
              gctFILE File,
              gctCONST_STRING Format,
              gctUINT *result);


gceSTATUS
gcoOS_DupFD( gcoOS Os, gctINT FD, gctINT *FD2);


gceSTATUS
gcoOS_LockFile( gcoOS Os, gctFILE File,
               gctBOOL Shared, gctBOOL Block);


gceSTATUS
gcoOS_UnlockFile( gcoOS Os, gctFILE File);


gceSTATUS
gcoOS_Socket( gcoOS Os, gctINT Domain,
             gctINT Type, gctINT Protocol,
             gctINT *SockFd);


gceSTATUS
gcoOS_CloseSocket( gcoOS Os, gctINT SockFd);


gceSTATUS
gcoOS_Connect( gcoOS Os, gctINT SockFd,
              gctCONST_POINTER HostName, gctUINT Port);


gceSTATUS
gcoOS_Shutdown( gcoOS Os, gctINT SockFd, gctINT How);


gceSTATUS
gcoOS_Send( gcoOS Os,
           gctINT SockFd,
           gctSIZE_T ByteCount,
           gctCONST_POINTER Data,
           gctINT Flags);


gceSTATUS
gcoOS_WaitForSend( gcoOS Os, gctINT SockFd,
                  gctINT Seconds, gctINT MicroSeconds);


gceSTATUS
gcoOS_GetEnv( gcoOS Os, gctCONST_STRING VarName, gctSTRING *Value);


gceSTATUS
gcoOS_SetEnv( gcoOS Os, gctCONST_STRING VarName, gctSTRING Value);


gceSTATUS
gcoOS_GetCwd( gcoOS Os, gctINT SizeInBytes, gctSTRING Buffer);


gceSTATUS
gcoOS_Stat( gcoOS Os, gctCONST_STRING FileName, gctPOINTER Buffer);


gceSTATUS
gcoOS_Seek( gcoOS Os, gctFILE File, gctUINT32 Offset, gceFILE_WHENCE Whence);


gceSTATUS
gcoOS_SetPos( gcoOS Os, gctFILE File, gctUINT32 Position);


gceSTATUS
gcoOS_GetPos( gcoOS Os, gctFILE File, gctUINT32 *Position);


gceSTATUS
gcoOS_StrStr( gctCONST_STRING String,
             gctCONST_STRING SubString,
             gctSTRING *Output);


gceSTATUS
gcoOS_StrFindReverse( gctCONST_STRING String,
                     gctINT8 Character,
                     gctSTRING *Output);

gceSTATUS
gcoOS_StrDup( gcoOS Os, gctCONST_STRING String, gctSTRING *Target);


gceSTATUS
gcoOS_StrCopySafe( gctSTRING Destination,
                  gctSIZE_T DestinationSize,
                  gctCONST_STRING Source);


gceSTATUS
gcoOS_StrCatSafe( gctSTRING Destination,
                 gctSIZE_T DestinationSize,
                 gctCONST_STRING Source);


gceSTATUS
gcoOS_StrCmp( gctCONST_STRING String1, gctCONST_STRING String2);


gceSTATUS
gcoOS_StrNCmp( gctCONST_STRING String1,
              gctCONST_STRING String2,
              gctSIZE_T Count);


gceSTATUS
gcoOS_StrToFloat( gctCONST_STRING String, gctFLOAT *Float);


gceSTATUS
gcoOS_HexStrToInt( gctCONST_STRING String, gctINT *Int);


gceSTATUS
gcoOS_HexStrToFloat( gctCONST_STRING String, gctFLOAT *Float);


gceSTATUS
gcoOS_StrToInt( gctCONST_STRING String, gctINT *Int);

gceSTATUS
gcoOS_MemCmp( gctCONST_POINTER Memory1,
             gctCONST_POINTER Memory2,
             gctSIZE_T Bytes);

gceSTATUS
gcoOS_PrintStrSafe( gctSTRING String,
                   gctSIZE_T StringSize,
                   gctUINT *Offset,
                   gctCONST_STRING Format,
                   ...)
;

gceSTATUS
gcoOS_LoadLibrary( gcoOS Os, gctCONST_STRING Library, gctHANDLE *Handle);

gceSTATUS
gcoOS_FreeLibrary( gcoOS Os, gctHANDLE Handle);

gceSTATUS
gcoOS_GetProcAddress( gcoOS Os,
                     gctHANDLE Handle,
                     gctCONST_STRING Name,
                     gctPOINTER *Function);

gceSTATUS
gcoOS_Compact( gcoOS Os);

gceSTATUS
gcoOS_AddSignalHandler( gceSignalHandlerType SignalHandlerType);


gceSTATUS
gcoOS_ProfileStart( gcoOS Os);

gceSTATUS
gcoOS_ProfileEnd( gcoOS Os, gctCONST_STRING Title);

gceSTATUS
gcoOS_SetProfileSetting( gcoOS Os,
                        gctBOOL Enable,
                        gceProfilerMode ProfileMode,
                        gctCONST_STRING FileName);



gceSTATUS
gcoOS_GetPhysicalSystemMemorySize( gctSIZE_T *PhysicalSystemMemorySize);


gceSTATUS
gcoOS_QueryVideoMemory( gcoOS Os,
                       gctUINT32 *InternalPhysName,
                       gctSIZE_T *InternalSize,
                       gctUINT32 *ExternalPhysName,
                       gctSIZE_T *ExternalSize,
                       gctUINT32 *ContiguousPhysName,
                       gctSIZE_T *ContiguousSize);

gceSTATUS
gcoOS_QueryCurrentProcessName( gctSTRING Name, gctSIZE_T Size);

gceSTATUS
gcoOS_QueryCurrentProcessArguments( gctCHAR Argv[64][1024],
                                   gctUINT32 *Argc,
                                   gctUINT32 MaxArgc,
                                   gctUINT32 MaxSizePerArg);





gceSTATUS
gcoOS_AtomConstruct( gcoOS Os, gcsATOM_PTR *Atom);


gceSTATUS
gcoOS_AtomDestroy( gcoOS Os, gcsATOM_PTR Atom);


gceSTATUS
gcoOS_AtomGet( gcoOS Os, gcsATOM_PTR Atom, gctINT32_PTR Value);


gceSTATUS
gcoOS_AtomSet( gcoOS Os, gcsATOM_PTR Atom, gctINT32 Value);


gceSTATUS
gcoOS_AtomIncrement( gcoOS Os, gcsATOM_PTR Atom, gctINT32_PTR OldValue);


gceSTATUS
gcoOS_AtomDecrement( gcoOS Os, gcsATOM_PTR Atom, gctINT32_PTR OldValue);

gctHANDLE
gcoOS_GetCurrentProcessID(void);

gctHANDLE
gcoOS_GetCurrentThreadID(void);





gctUINT32
gcoOS_GetTicks(void);


gceSTATUS
gcoOS_GetTime(gctUINT64_PTR Time);


gceSTATUS
gcoOS_GetCPUTime(gctUINT64_PTR CPUTime);


gceSTATUS
gcoOS_GetMemoryUsage(gctUINT32_PTR MaxRSS,
                     gctUINT32_PTR IxRSS,
                     gctUINT32_PTR IdRSS,
                     gctUINT32_PTR IsRSS);


gceSTATUS
gcoOS_Delay( gcoOS Os, gctUINT32 Delay);



gceSTATUS
gcoOS_DelayUs( gcoOS Os, gctUINT32 Delay);
# 1408 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
typedef void *gctTHREAD_RETURN;
typedef void *(*gcTHREAD_ROUTINE)(void *);



gceSTATUS
gcoOS_CreateThread( gcoOS Os,
                   gcTHREAD_ROUTINE Worker,
                   gctPOINTER Argument,
                   gctPOINTER *Thread);


gceSTATUS
gcoOS_CloseThread( gcoOS Os, gctPOINTER Thread);





gceSTATUS
gcoOS_CreateMutex( gcoOS Os, gctPOINTER *Mutex);


gceSTATUS
gcoOS_DeleteMutex( gcoOS Os, gctPOINTER Mutex);


gceSTATUS
gcoOS_AcquireMutex( gcoOS Os, gctPOINTER Mutex, gctUINT32 Timeout);


gceSTATUS
gcoOS_ReleaseMutex( gcoOS Os, gctPOINTER Mutex);





gceSTATUS
gcoOS_CreateSignal( gcoOS Os, gctBOOL ManualReset, gctSIGNAL *Signal);


gceSTATUS
gcoOS_DestroySignal( gcoOS Os, gctSIGNAL Signal);


gceSTATUS
gcoOS_Signal( gcoOS Os, gctSIGNAL Signal, gctBOOL State);


gceSTATUS
gcoOS_WaitSignal( gcoOS Os, gctSIGNAL Signal, gctUINT32 Wait);


gceSTATUS
gcoOS_MapSignal( gctSIGNAL RemoteSignal, gctSIGNAL *LocalSignal);


gceSTATUS
gcoOS_UnmapSignal( gctSIGNAL Signal);





gceSTATUS
gcoOS_CreateNativeFence( gcoOS Os, gctSIGNAL Signal, gctINT *FenceFD);


gceSTATUS
gcoOS_ClientWaitNativeFence( gcoOS Os, gctINT FenceFD, gctUINT32 Timeout);


gceSTATUS
gcoOS_WaitNativeFence( gcoOS Os, gctINT FenceFD, gctUINT32 Timeout);





gceSTATUS
gcoOS_WriteRegister( gcoOS Os, gctUINT32 Address, gctUINT32 Data);


gceSTATUS
gcoOS_ReadRegister( gcoOS Os, gctUINT32 Address, gctUINT32 *Data);

gceSTATUS
gcoOS_CacheClean( gcoOS Os, gctUINT32 Node,
                 gctPOINTER Logical, gctSIZE_T Bytes);

gceSTATUS
gcoOS_CacheFlush( gcoOS Os, gctUINT32 Node,
                 gctPOINTER Logical, gctSIZE_T Bytes);

gceSTATUS
gcoOS_CacheInvalidate( gcoOS Os, gctUINT32 Node,
                      gctPOINTER Logical, gctSIZE_T Bytes);

gceSTATUS
gcoOS_CacheCleanEx( gcoOS Os, gctUINT32 Node,
                   gctPOINTER Logical, gctSIZE_T Offset, gctSIZE_T Bytes);

gceSTATUS
gcoOS_CacheFlushEx( gcoOS Os, gctUINT32 Node,
                   gctPOINTER Logical, gctSIZE_T Offset, gctSIZE_T Bytes);

gceSTATUS
gcoOS_CacheInvalidateEx( gcoOS Os, gctUINT32 Node,
                        gctPOINTER Logical, gctSIZE_T Offset, gctSIZE_T Bytes);


gceSTATUS
gcoOS_MemoryBarrier( gcoOS Os, gctPOINTER Logical);

gceSTATUS
gcoOS_CPUPhysicalToGPUPhysical( gctPHYS_ADDR_T CPUPhysical,
                               gctPHYS_ADDR_T *GPUPhysical);

gceSTATUS
gcoHAL_QueryCPUFrequency( gctUINT32 CPUId, gctUINT32_PTR CPUFrequency);

gceSTATUS
gcoOS_QuerySystemInfo( gcoOS Os, gcsSystemInfo *Info);





gceSTATUS
gckOS_GetProfileTick( gctUINT64_PTR Tick);

gceSTATUS
gckOS_QueryProfileTickRate( gctUINT64_PTR TickRate);

gctUINT32
gckOS_ProfileToMS( gctUINT64 Ticks);

gceSTATUS
gcoOS_GetProfileTick( gctUINT64_PTR Tick);

gceSTATUS
gcoOS_QueryProfileTickRate( gctUINT64_PTR TickRate);
# 1596 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gctINT
gckMATH_ModuloInt( gctINT X, gctINT Y);


gctUINT32
gcoMATH_Log2in5dot5( gctINT X);

gctFLOAT
gcoMATH_UIntAsFloat( gctUINT32 X);

gctUINT32
gcoMATH_FloatAsUInt( gctFLOAT X);

gctBOOL
gcoMATH_CompareEqualF( gctFLOAT X, gctFLOAT Y);

gctUINT16
gcoMATH_UInt8AsFloat16( gctUINT8 X);

gctUINT32
gcoMATH_Float16ToFloat( gctUINT16 In);

gctUINT16
gcoMATH_FloatToFloat16( gctUINT32 In);

gctUINT32
gcoMATH_Float11ToFloat( gctUINT32 In);

gctUINT16
gcoMATH_FloatToFloat11( gctUINT32 In);

gctUINT32
gcoMATH_Float10ToFloat( gctUINT32 In);

gctUINT16
gcoMATH_FloatToFloat10( gctUINT32 In);

gctUINT32
gcoMATH_Float14ToFloat( gctUINT16 In);





typedef struct _gcsPOINT {
    gctINT32 x;
    gctINT32 y;
} gcsPOINT;

typedef struct _gcsSIZE {
    gctINT32 width;
    gctINT32 height;
} gcsSIZE;

typedef struct _gcsRECT {
    gctINT32 left;
    gctINT32 top;
    gctINT32 right;
    gctINT32 bottom;
} gcsRECT;

typedef struct _gcs2D_RGBU32
{
    gctUINT32 R;
    gctUINT32 G;
    gctUINT32 B;
} gcs2D_RGBU32;

typedef struct _gcsPIXEL {
    union {
        struct {
            gctFLOAT r, g, b, a;
        } f;
        struct {
            gctINT32 r, g, b, a;
        } i;
        struct {
            gctUINT32 r, g, b, a;
        } ui;
    } color;

    gctFLOAT d;
    gctUINT32 s;

} gcsPIXEL;
# 1690 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
typedef struct _gcsFORMAT_COMPONENT {
    gctUINT8 start;
    gctUINT8 width;
} gcsFORMAT_COMPONENT;


typedef struct _gcsFORMAT_CLASS_TYPE_RGBA {
    gcsFORMAT_COMPONENT alpha;
    gcsFORMAT_COMPONENT red;
    gcsFORMAT_COMPONENT green;
    gcsFORMAT_COMPONENT blue;
} gcsFORMAT_CLASS_TYPE_RGBA;


typedef struct _gcsFORMAT_CLASS_TYPE_YUV {
    gcsFORMAT_COMPONENT y;
    gcsFORMAT_COMPONENT u;
    gcsFORMAT_COMPONENT v;
} gcsFORMAT_CLASS_TYPE_YUV;


typedef struct _gcsFORMAT_CLASS_TYPE_INDEX {
    gcsFORMAT_COMPONENT value;
} gcsFORMAT_CLASS_TYPE_INDEX;


typedef struct _gcsFORMAT_CLASS_TYPE_LUMINANCE {
    gcsFORMAT_COMPONENT alpha;
    gcsFORMAT_COMPONENT value;
} gcsFORMAT_CLASS_TYPE_LUMINANCE;


typedef struct _gcsFORMAT_CLASS_TYPE_BUMP {
    gcsFORMAT_COMPONENT alpha;
    gcsFORMAT_COMPONENT l;
    gcsFORMAT_COMPONENT v;
    gcsFORMAT_COMPONENT u;
    gcsFORMAT_COMPONENT q;
    gcsFORMAT_COMPONENT w;
} gcsFORMAT_CLASS_TYPE_BUMP;


typedef struct _gcsFORMAT_CLASS_TYPE_DEPTH {
    gcsFORMAT_COMPONENT depth;
    gcsFORMAT_COMPONENT stencil;
} gcsFORMAT_CLASS_TYPE_DEPTH;


typedef struct _gcsFORMAT_CLASs_TYPE_INTENSITY {
    gcsFORMAT_COMPONENT value;
} gcsFORMAT_CLASs_TYPE_INTENSITY;

typedef union _gcuPIXEL_FORMAT_CLASS {
    gcsFORMAT_CLASS_TYPE_BUMP bump;
    gcsFORMAT_CLASS_TYPE_RGBA rgba;
    gcsFORMAT_CLASS_TYPE_YUV yuv;
    gcsFORMAT_CLASS_TYPE_LUMINANCE lum;
    gcsFORMAT_CLASS_TYPE_INDEX index;
    gcsFORMAT_CLASS_TYPE_DEPTH depth;
    gcsFORMAT_CLASs_TYPE_INTENSITY intensity;
} gcuPIXEL_FORMAT_CLASS;


typedef struct _gcsSURF_FORMAT_INFO {

    gctCONST_STRING formatName;


    gceSURF_FORMAT format;
    gceFORMAT_CLASS fmtClass;


    gceFORMAT_DATATYPE fmtDataType;


    gctUINT8 bitsPerPixel;


    gctUINT blockWidth;
    gctUINT blockHeight;


    gctUINT blockSize;



    gctUINT8 layers;




    gctBOOL fakedFormat;




    gctBOOL interleaved;


    gctBOOL sRGB;


    gceENDIAN_HINT endian;


    gcuPIXEL_FORMAT_CLASS u;


    gcuPIXEL_FORMAT_CLASS uOdd;


    gceSURF_FORMAT closestRenderFormat;

    gctUINT renderFormat;
    const gceTEXTURE_SWIZZLE *pixelSwizzle;


    gceSURF_FORMAT closestTXFormat;
    gctUINT txFormat;
    const gceTEXTURE_SWIZZLE *txSwizzle;
    gctBOOL txIntFilter;
} gcsSURF_FORMAT_INFO;


typedef struct _gcsSURF_FRAMEBUFFER {
    gctPOINTER logical;
    gctUINT width, height;
    gctINT stride;
    gceSURF_FORMAT format;
} gcsSURF_FRAMEBUFFER;

typedef union _gcu2D_STATE_VALUE
{
    gcs2D_RGBU32 minValue;
    gcs2D_RGBU32 maxMinReciprocal;
    gcs2D_RGBU32 stdReciprocal;
    gcs2D_RGBU32 meanValue;
    gctUINT32 stepReciprocal;
    gce2D_NORMALIZATION_MODE normalizationMode;
    gctBOOL byPassQuantization;
    gce2D_U8ToU10_CONVERSION_MODE u8Tu10_Mode;
} gcu2D_STATE_VALUE;


typedef struct _gcs2D_STATE_CONFIG
{
    gce2D_STATE_KEY state;
    gcu2D_STATE_VALUE value;
} gcs2D_STATE_CONFIG;


extern gcsFORMAT_COMPONENT gcvPIXEL_COMP_XXX8;
extern gcsFORMAT_COMPONENT gcvPIXEL_COMP_XX8X;
extern gcsFORMAT_COMPONENT gcvPIXEL_COMP_X8XX;
extern gcsFORMAT_COMPONENT gcvPIXEL_COMP_8XXX;


gceSTATUS
gcoSURF_Construct( gcoHAL Hal,
                  gctUINT Width,
                  gctUINT Height,
                  gctUINT Depth,
                  gceSURF_TYPE Type,
                  gceSURF_FORMAT Format,
                  gcePOOL Pool,
                  gcoSURF *Surface);

gceSTATUS
gcoSURF_ConstructWithUserPool( gcoHAL Hal,
                              gctUINT Width,
                              gctUINT Height,
                              gctUINT Depth,
                              gceSURF_TYPE Type,
                              gceSURF_FORMAT Format,
                              gctPOINTER TileStatusLogical,
                              gctPHYS_ADDR_T TileStatusPhysical,
                              gctPOINTER Logical,
                              gctPHYS_ADDR_T Physical,
                              gcoSURF *Surface);


gceSTATUS
gcoSURF_Destroy( gcoSURF Surface);

gceSTATUS
gcoSURF_DestroyForAllHWType( gcoSURF Surface);


gceSTATUS
gcoSURF_MapUserSurface( gcoSURF Surface,
                       gctUINT Alignment,
                       gctPOINTER Logical,
                       gctPHYS_ADDR_T Physical);


gceSTATUS
gcoSURF_WrapSurface( gcoSURF Surface,
                    gctUINT Alignment,
                    gctPOINTER Logical,
                    gctADDRESS Address);


gceSTATUS
gcoSURF_QueryVidMemNode( gcoSURF Surface,
                        gctUINT32 *Node,
                        gcePOOL *Pool,
                        gctSIZE_T_PTR Bytes,
                        gctUINT32 *TsNode,
                        gcePOOL *TsPool,
                        gctSIZE_T_PTR TsBytes);


gceSTATUS
gcoSURF_QueryVidMemMultiNode( gcoSURF Surface,
                             gctUINT32 *Node,
                             gcePOOL *Pool,
                             gctSIZE_T_PTR Bytes,
                             gctUINT32 *Node2,
                             gcePOOL *Pool2,
                             gctSIZE_T_PTR Bytes2,
                             gctUINT32 *Node3,
                             gcePOOL *Pool3,
                             gctSIZE_T_PTR Bytes3);


gceSTATUS
gcoSURF_SetColorType( gcoSURF Surface, gceSURF_COLOR_TYPE ColorType);


gceSTATUS
gcoSURF_GetColorType( gcoSURF Surface, gceSURF_COLOR_TYPE *ColorType);


gceSTATUS
gcoSURF_SetColorSpace( gcoSURF Surface, gceSURF_COLOR_SPACE ColorSpace);


gceSTATUS
gcoSURF_GetColorSpace( gcoSURF Surface, gceSURF_COLOR_SPACE *ColorSpace);


gceSTATUS
gcoSURF_SetRotation( gcoSURF Surface, gceSURF_ROTATION Rotation);

gceSTATUS
gcoSURF_IsValid( gcoSURF Surface);



gceSTATUS
gcoSURF_IsTileStatusSupported( gcoSURF Surface);


gceSTATUS
gcoSURF_IsTileStatusEnabled( gcsSURF_VIEW *SurfView);


gceSTATUS
gcoSURF_IsCompressed( gcsSURF_VIEW *SurfView);


gceSTATUS
gcoSURF_EnableTileStatus( gcsSURF_VIEW *Surface);


gceSTATUS
gcoSURF_EnableTileStatusEx( gcsSURF_VIEW *surfView, gctUINT RtIndex);


gceSTATUS
gcoSURF_DisableTileStatus( gcsSURF_VIEW *SurfView, gctBOOL Decompress);


gceSTATUS
gcoSURF_FlushTileStatus( gcsSURF_VIEW *SurfView, gctBOOL Decompress);



gceSTATUS
gcoSURF_GetSize( gcoSURF Surface,
                gctUINT *Width,
                gctUINT *Height,
                gctUINT *Depth);


gceSTATUS
gcoSURF_GetInfo( gcoSURF Surface,
                gceSURF_INFO_TYPE InfoType,
                gctINT32 *Value);


gceSTATUS
gcoSURF_GetAlignedSize( gcoSURF Surface,
                       gctUINT *Width,
                       gctUINT *Height,
                       gctINT *Stride);


gceSTATUS
gcoSURF_GetAlignment( gceSURF_TYPE Type,
                     gceSURF_FORMAT Format,
                     gctUINT *AddressAlignment,
                     gctUINT *XAlignment,
                     gctUINT *YAlignment);

gceSTATUS
gcoSURF_AlignResolveRect( gcoSURF Surf,
                         gcsPOINT_PTR RectOrigin,
                         gcsPOINT_PTR RectSize,
                         gcsPOINT_PTR AlignedOrigin,
                         gcsPOINT_PTR AlignedSize);


gceSTATUS
gcoSURF_GetFormat( gcoSURF Surface,
                  gceSURF_TYPE *Type,
                  gceSURF_FORMAT *Format);


gceSTATUS
gcoSURF_GetFormatInfo( gcoSURF Surface,
                      gcsSURF_FORMAT_INFO_PTR *formatInfo);


gceSTATUS
gcoSURF_GetPackedFormat( gcoSURF Surface,
                        gceSURF_FORMAT *Format);


gceSTATUS
gcoSURF_GetTiling( gcoSURF Surface, gceTILING *Tiling);


gceSTATUS
gcoSURF_GetBottomBufferOffset( gcoSURF Surface,
                              gctUINT_PTR BottomBufferOffset);


gceSTATUS
gcoSURF_Lock( gcoSURF Surface,
             gctADDRESS *Address,
             gctPOINTER *Memory);


gceSTATUS
gcoSURF_Unlock( gcoSURF Surface, gctPOINTER Memory);


gceSTATUS
gcoSURF_QueryFlags( gcoSURF Surface, gceSURF_FLAG Flag);

gceSTATUS
gcoSURF_QueryHints( gcoSURF Surface, gceSURF_TYPE Hints);





gceSTATUS
gcoSURF_QueryFormat( gceSURF_FORMAT Format,
                    gcsSURF_FORMAT_INFO_PTR *Info);


gceSTATUS
gcoSURF_ComputeColorMask( gcsSURF_FORMAT_INFO_PTR Format,
                         gctUINT32_PTR ColorMask);


gceSTATUS
gcoSURF_Flush( gcoSURF Surface);

gceSTATUS
gcoSURF_3DBlitClearTileStatus( gcsSURF_VIEW *SurfView,
                              gctBOOL ClearAsDirty);


gceSTATUS
gcoSURF_FillFromTile( gcsSURF_VIEW *SurView);


gceSTATUS
gcoSURF_Fill( gcoSURF Surface,
             gcsPOINT_PTR Origin,
             gcsSIZE_PTR Size,
             gctUINT32 Value,
             gctUINT32 Mask);


gceSTATUS
gcoSURF_Blend( gcoSURF SrcSurf,
              gcoSURF DstSurf,
              gcsPOINT_PTR SrcOrigin,
              gcsPOINT_PTR DstOrigin,
              gcsSIZE_PTR Size,
              gceSURF_BLEND_MODE Mode);


gceSTATUS
gcoSURF_ConstructWrapper( gcoHAL Hal, gcoSURF *Surface);


gceSTATUS
gcoSURF_SetFlags( gcoSURF Surface, gceSURF_FLAG Flag, gctBOOL Value);


gceSTATUS
gcoSURF_SetBuffer( gcoSURF Surface,
                  gceSURF_TYPE Type,
                  gceSURF_FORMAT Format,
                  gctUINT Stride,
                  gctPOINTER Logical,
                  gctUINT64 Physical);


gceSTATUS
gcoSURF_SetWindow( gcoSURF Surface,
                  gctUINT X,
                  gctUINT Y,
                  gctUINT Width,
                  gctUINT Height);


gceSTATUS
gcoSURF_SetImage( gcoSURF Surface,
                 gctUINT X,
                 gctUINT Y,
                 gctUINT Width,
                 gctUINT Height,
                 gctUINT Depth);




gceSTATUS
gcoSURF_SetAlignment( gcoSURF Surface, gctUINT Width, gctUINT Height);


gceSTATUS
gcoSURF_ReferenceSurface( gcoSURF Surface);


gceSTATUS
gcoSURF_QueryReferenceCount( gcoSURF Surface, gctINT32 *ReferenceCount);


gceSTATUS
gcoSURF_SetOrientation( gcoSURF Surface, gceORIENTATION Orientation);


gceSTATUS
gcoSURF_QueryOrientation( gcoSURF Surface, gceORIENTATION *Orientation);

gceSTATUS
gcoSURF_NODE_Cache( gcsSURF_NODE_PTR Node,
                   gctPOINTER Logical,
                   gctSIZE_T Bytes,
                   gceCACHEOPERATION Operation);

gceSTATUS
gcsSURF_NODE_SetHardwareAddress( gcsSURF_NODE_PTR Node, gctADDRESS Address);

gceSTATUS
gcsSURF_NODE_GetHardwareAddress( gcsSURF_NODE_PTR Node,
                                gctADDRESS *Physical,
                                gctADDRESS *Physical2,
                                gctADDRESS *Physical3,
                                gctADDRESS *PhysicalBottom);

gctADDRESS
gcsSURF_NODE_GetHWAddress( gcsSURF_NODE_PTR Node);


gceSTATUS
gcoSURF_LockNode( gcsSURF_NODE_PTR Node,
                 gctADDRESS *Address,
                 gctPOINTER *Memory);

gceSTATUS
gcoSURF_UnLockNode( gcsSURF_NODE_PTR Node, gceSURF_TYPE Type);


gceSTATUS
gcoSURF_NODE_CPUCacheOperation( gcsSURF_NODE_PTR Node,
                               gceSURF_TYPE Type,
                               gctSIZE_T Offset,
                               gctSIZE_T Length,
                               gceCACHEOPERATION Operation);


gceSTATUS
gcoSURF_CPUCacheOperation( gcoSURF Surface,
                          gceCACHEOPERATION Operation);

gceSTATUS
gcoSURF_Swap( gcoSURF Surface1, gcoSURF Surface2);

gceSTATUS
gcoSURF_ResetSurWH( gcoSURF Surface,
                   gctUINT oriw,
                   gctUINT orih,
                   gctUINT alignw,
                   gctUINT alignh,
                   gceSURF_FORMAT fmt);


gceSTATUS
gcoSURF_UpdateTimeStamp( gcoSURF Surface);


gceSTATUS
gcoSURF_QueryTimeStamp( gcoSURF Surface, gctUINT64 *TimeStamp);





gceSTATUS
gcoSURF_AllocShBuffer( gcoSURF Surface, gctSHBUF *ShBuf);


gceSTATUS
gcoSURF_BindShBuffer( gcoSURF Surface, gctSHBUF ShBuf);


gceSTATUS
gcoSURF_PushSharedInfo( gcoSURF Surface);


gceSTATUS
gcoSURF_PopSharedInfo( gcoSURF Surface);



gceSTATUS
gcoSURF_Copy( gcoSURF Surface, gcoSURF Source);


gceSTATUS
gcoSURF_SetSamples( gcoSURF Surface, gctUINT Samples);


gceSTATUS
gcoSURF_GetSamples( gcoSURF Surface, gctUINT_PTR Samples);


gceSTATUS
gcoSURF_AppendTileStatus( gcoSURF Surface);


gceSTATUS
gcoSURF_WrapUserMemory( gcoHAL Hal,
                       gctUINT Width,
                       gctUINT Height,
                       gctUINT Stride,
                       gctUINT Depth,
                       gceSURF_TYPE Type,
                       gceSURF_FORMAT Format,
                       gctUINT32 Handle,
                       gctUINT32 Flag,
                       gcoSURF *Surface);

gceSTATUS
gcoSURF_WrapUserMultiBuffer( gcoHAL Hal,
                            gctUINT Width,
                            gctUINT Height,
                            gceSURF_TYPE Type,
                            gceSURF_FORMAT Format,
                            gctUINT Stride[3],
                            gctUINT32 Handle[3],
                            gctUINT BufferOffset[3],
                            gctUINT32 Flag,
                            gcoSURF *Surface);

gceSTATUS
gcoSURF_UpdateMetadata( gcoSURF Surface, gctINT TsFD);


gceSTATUS
gcoSURF_MixSurfacesCPU( gcoSURF TargetSurface,
                       gctUINT TargetSliceIndex,
                       gcoSURF *SourceSurface,
                       gctUINT *SourceSliceIndices,
                       gctFLOAT *Weights,
                       gctINT Count);





typedef struct _gcsHASH_MD5CTX {
    gctBOOL bigEndian;
    gctSIZE_T bytes;
    gctUINT32 states[4];
    gctUINT8 buffer[64];
} gcsHASH_MD5CTX;

void
gcsHASH_MD5Init(gcsHASH_MD5CTX *ctx);
void
gcsHASH_MD5Update(gcsHASH_MD5CTX *ctx, const void *data, gctSIZE_T bytes);
void
gcsHASH_MD5Final(gcsHASH_MD5CTX *ctx, gctUINT8 digest[16]);






gceSTATUS
gcsRECT_Set( gcsRECT_PTR Rect,
            gctINT32 Left,
            gctINT32 Top,
            gctINT32 Right,
            gctINT32 Bottom);


gceSTATUS
gcsRECT_Width( gcsRECT_PTR Rect, gctINT32 *Width);


gceSTATUS
gcsRECT_Height( gcsRECT_PTR Rect, gctINT32 *Height);


gceSTATUS
gcsRECT_Normalize( gcsRECT_PTR Rect);


gceSTATUS
gcsRECT_IsEqual( gcsRECT_PTR Rect1, gcsRECT_PTR Rect2, gctBOOL *Equal);


gceSTATUS
gcsRECT_IsOfEqualSize( gcsRECT_PTR Rect1, gcsRECT_PTR Rect2, gctBOOL *EqualSize);

gceSTATUS
gcsRECT_RelativeRotation( gceSURF_ROTATION Orientation,
                         gceSURF_ROTATION *Relation);

gceSTATUS
gcsRECT_Rotate( gcsRECT_PTR Rect,
               gceSURF_ROTATION Rotation,
               gceSURF_ROTATION toRotation,
               gctINT32 SurfaceWidth,
               gctINT32 SurfaceHeight);





typedef struct _gcsBOUNDARY {
    gctINT x;
    gctINT y;
    gctINT width;
    gctINT height;
} gcsBOUNDARY;





typedef struct _gcoHEAP *gcoHEAP;


gceSTATUS
gcoHEAP_Construct( gcoOS Os, gctSIZE_T AllocationSize, gcoHEAP *Heap);


gceSTATUS
gcoHEAP_Destroy( gcoHEAP Heap);


gceSTATUS
gcoHEAP_Allocate( gcoHEAP Heap, gctSIZE_T Bytes, gctPOINTER *Node);

gceSTATUS
gcoHEAP_GetMemorySize( gcoHEAP Heap, gctPOINTER Memory, gctSIZE_T_PTR MemorySize);


gceSTATUS
gcoHEAP_Free( gcoHEAP Heap, gctPOINTER Node);



gceSTATUS
gcoHEAP_ProfileStart( gcoHEAP Heap);

gceSTATUS
gcoHEAP_ProfileEnd( gcoHEAP Heap, gctCONST_STRING Title);







void
gcoOS_SetDebugLevel( gctUINT32 Level);

void
gcoOS_GetDebugLevel( gctUINT32_PTR DebugLevel);

void
gcoOS_GetDebugZone( gctUINT32 Zone, gctUINT32_PTR DebugZone);

void
gcoOS_SetDebugZone( gctUINT32 Zone);

void
gcoOS_SetDebugFile( gctCONST_STRING FileName);

void
gcoOS_EnableDebugDump( gctBOOL Enable);

gctFILE
gcoOS_ReplaceDebugFile( gctFILE fp);
# 2419 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
void
gckOS_DebugFatal( gctCONST_STRING Message, ...);

void
gcoOS_DebugFatal( gctCONST_STRING Message, ...);
# 2460 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
void
gckOS_DebugTrace( gctUINT32 Level, gctCONST_STRING Message, ...)
;

void
gcoOS_DebugTrace( gctUINT32 Level, gctCONST_STRING Message, ...)
;
# 2508 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
void
gckOS_DebugTraceZone( gctUINT32 Level, gctUINT32 Zone, gctCONST_STRING Message, ...);

void
gcoOS_DebugTraceZone( gctUINT32 Level, gctUINT32 Zone, gctCONST_STRING Message, ...);
# 2579 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
void
gcoOS_StackPush( gctINT8_PTR Identity,
                gctCONST_STRING Function,
                gctINT Line,
                gctCONST_STRING Text,
                ...);

void
gcoOS_StackPop( gctINT8_PTR Identity, gctCONST_STRING Function);

void
gcoOS_StackDump(void);

void
gcoOS_StackRemove( gctHANDLE Thread);
# 2638 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
void
gcoOS_BinaryTrace( gctCONST_STRING Function,
                  gctINT Line,
                  gctCONST_STRING Text ,
                  ...);

void
gckOS_BinaryTrace( gctCONST_STRING Function,
                  gctINT Line,
                  gctCONST_STRING Text ,
                  ...);
# 2681 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
void
gcoOS_SysTraceBegin( gctUINT32 Zone, gctCONST_STRING FuncName);

void
gcoOS_SysTraceEnd( gctUINT32 Zone);
# 2966 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
void
gckOS_Print( gctCONST_STRING Message, ...) ;

void
gcoOS_Print( gctCONST_STRING Message, ...) ;
# 3019 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
void
gckOS_Dump( gckOS Os, gctCONST_STRING Format, ...);

void
gckOS_DumpBuffer( gckOS Os,
                 gceDUMP_BUFFER_TYPE Type,
                 gctPOINTER Buffer,
                 gctUINT64 Address,
                 gctSIZE_T Size);
# 3049 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gceSTATUS
gcoOS_DumpFrameRate(void);
# 3065 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gceSTATUS
gcoOS_SetDumpFlag( gctBOOL DumpState);
# 3162 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gceSTATUS
gcoOS_DumpApi( gctCONST_STRING String, ...);
# 3183 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gceSTATUS
gcoOS_DumpArray( gctCONST_POINTER Data, gctUINT32 Size);
# 3204 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gceSTATUS
gcoOS_DumpArrayToken( gctCONST_POINTER Data, gctUINT32 Termination);
# 3225 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gceSTATUS
gcoOS_DumpApiData( gctCONST_POINTER Data, gctSIZE_T Size);
# 3245 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gceSTATUS
gcoOS_Dump2DCommand( gctUINT32_PTR Command, gctUINT32 Size);
# 3269 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gceSTATUS
gcoOS_Dump2DSurface( gctBOOL Src, gctADDRESS Address);
# 3293 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gceSTATUS
gcfAddMemoryInfo( gctADDRESS GPUAddress,
                 gctPOINTER Logical,
                 gctUINT64 Physical,
                 gctUINT32 Size);
# 3315 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gceSTATUS
gcfDelMemoryInfo( gctADDRESS Address);
# 3339 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
void
gcoOS_DebugShaderTrace( gctCONST_STRING Message, ...);

void
gcoOS_SetDebugShaderFiles( gctCONST_STRING VSFileName, gctCONST_STRING FSFileName);

void
gcoOS_SetDebugShaderFileType( gctUINT32 ShaderType);

void
gcoOS_EnableDebugBuffer( gctBOOL Enable);
# 3362 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
void
gcoOS_DebugBreak(void);

void
gckOS_DebugBreak(void);
# 3472 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
void
gcoOS_Verify( gceSTATUS status);

void
gckOS_Verify( gceSTATUS status);
# 3507 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
gctCONST_STRING
gcoOS_DebugStatus2Name(gceSTATUS status);

gctCONST_STRING
gckOS_DebugStatus2Name(gceSTATUS status);
# 3963 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
typedef struct _gcsUSER_DEBUG_OPTION {
    gceDEBUG_MSG debugMsg;
} gcsUSER_DEBUG_OPTION;

gcsUSER_DEBUG_OPTION *
gcoHAL_GetUserDebugOption(void);
# 4949 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h"
typedef struct _memory_profile_info {
    struct {
        gctUINT64 currentSize;
        gctUINT64 peakSize;
        gctUINT64 total_allocate;
        gctUINT64 total_free;
        gctUINT32 total_allocateCount;
        gctUINT32 total_freeCount;
    } system_memory, gpu_memory;
} memory_profile_info;

gceSTATUS
gcoOS_GetMemoryProfileInfo(size_t size, struct _memory_profile_info *info);

gceSTATUS
gcoOS_DumpMemoryProfile(void);
gceSTATUS
gcoOS_InitMemoryProfile(void);
gceSTATUS
gcoOS_DeInitMemoryProfile(void);






void gcoOS_2D_DumpSpendTimeStart( gctUINT32 *pTimer);
void gcoOS_2D_DumpSpendTimeEnd( gctUINT32 *pTimer, char *testedObject);
# 58 "drivers/mxc/gpu-viv/hal/security_v1/gc_hal_ta.c" 2
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_security_interface.h" 1
# 57 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_security_interface.h"
struct kernel_start_command {
    kernel_packet_command_t command;
    gctUINT8 gpu;
    gctADDRESS address;
    gctUINT32 bytes;
};






struct kernel_submit {
    kernel_packet_command_t command;
    gctUINT8 gpu;
    gctUINT8 kernel_command;
    gctUINT32 command_buffer_handle;
    gctUINT32 offset;
    gctUINT32 *command_buffer;
    gctUINT32 command_buffer_length;
};






struct kernel_allocate_security_memory {
    kernel_packet_command_t command;
    gctUINT32 bytes;
    gctUINT32 memory_handle;
};






struct kernel_free_security_memory {
    kernel_packet_command_t command;
    gctUINT32 memory_handle;
};

struct kernel_execute {
    kernel_packet_command_t command;
    gctUINT8 gpu;
    gctUINT8 kernel_command;
    gctUINT32 *command_buffer;
    gctUINT32 command_buffer_length;
};

typedef struct kernel_map_scatter_gather {
    gctUINT32 bytes;
    gctUINT32 physical;
    struct kernel_map_scatter_gather *next;
} kernel_map_scatter_gather_t;

struct kernel_map_memory {
    kernel_packet_command_t command;
    kernel_map_scatter_gather_t *scatter;
    gctUINT32 *physicals;
    gctPHYS_ADDR_T physical;
    gctUINT32 pageCount;
    gctADDRESS gpuAddress;
};

struct kernel_unmap_memory {
    gctADDRESS gpuAddress;
    gctUINT32 pageCount;
};

struct kernel_read_mmu_exception {
    gctUINT32 mmuStatus;
    gctUINT32 mmuException;
};

struct kernel_handle_mmu_exception {
    gctUINT32 mmuStatus;
    gctPHYS_ADDR_T physical;
    gctADDRESS gpuAddress;
};

typedef struct _gcsTA_INTERFACE {
    kernel_packet_command_t command;
    union {
        struct kernel_submit Submit;
        struct kernel_start_command StartCommand;
        struct kernel_allocate_security_memory AllocateSecurityMemory;
        struct kernel_execute Execute;
        struct kernel_map_memory MapMemory;
        struct kernel_unmap_memory UnmapMemory;
        struct kernel_read_mmu_exception ReadMMUException;
        struct kernel_handle_mmu_exception HandleMMUException;
    } u;
    gceSTATUS result;
} gcsTA_INTERFACE;
# 59 "drivers/mxc/gpu-viv/hal/security_v1/gc_hal_ta.c" 2
# 1 "drivers/mxc/gpu-viv/hal/security_v1/gc_hal_ta.h" 1
# 58 "drivers/mxc/gpu-viv/hal/security_v1/gc_hal_ta.h"
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_types.h" 1
# 59 "drivers/mxc/gpu-viv/hal/security_v1/gc_hal_ta.h" 2







typedef struct _gctaOS *gctaOS;
typedef struct _gcTA *gcTA;

typedef struct _gcTA_HARDWARE *gcTA_HARDWARE;
typedef struct _gcTA_MMU *gcTA_MMU;





typedef struct _gcTA {

    gctaOS os;

    gceCORE core;

    gcTA_MMU mmu;

    gcTA_HARDWARE hardware;

    gctBOOL destoryMmu;
} gcsTA;

typedef struct _gcTA_MMU
{
    gctaOS os;

    gctSIZE_T mtlbBytes;
    gctPOINTER mtlbLogical;
    gctPHYS_ADDR mtlbPhysical;

    gctPOINTER stlbs;

    gctPOINTER safePageLogical;
    gctPHYS_ADDR safePagePhysical;

    gctPOINTER nonSecureSafePageLogical;
    gctPHYS_ADDR nonSecureSafePagePhysical;

    gctPOINTER mutex;
}
gcsTA_MMU;

gceSTATUS
TAEmulator(
    gceCORE Core,
    void *Interface
    );

int
gcTA_Construct(
    gctaOS Os,
    gceCORE Core,
    gcTA *TA
);

int
gcTA_Destroy(
    gcTA TA
);

int
gcTA_Dispatch(
    gcTA TA,
    gcsTA_INTERFACE *Interface
);

gceSTATUS
gcTA_MapMemory(
    gcTA TA,
    gctUINT32 *PhysicalArray,
    gctPHYS_ADDR_T Physical,
    gctUINT32 PageCount,
    gctUINT32 *GPUAddress
);

gceSTATUS
gcTA_UnmapMemory(
    gcTA TA,
    gctUINT32 GPUAddress,
    gctUINT32 PageCount
);

gceSTATUS
gcTA_StartCommand(
    gcTA TA,
    gctUINT32 Address,
    gctUINT32 Bytes
);





gceSTATUS
gctaOS_ConstructOS(
    gckOS Os,
    gctaOS *TAos
    );

gceSTATUS
gctaOS_DestroyOS(
    gctaOS Os
    );

gceSTATUS
gctaOS_Allocate(
    gctUINT32 Bytes,
    gctPOINTER *Pointer
    );

gceSTATUS
gctaOS_Free(
    gctPOINTER Pointer
    );

gceSTATUS
gctaOS_AllocateSecurityMemory(
    gctaOS Os,
    gctSIZE_T *Bytes,
    gctPOINTER *Logical,
    gctPOINTER *Physical
    );

gceSTATUS
gctaOS_FreeSecurityMemory(
    gctaOS Os,
    gctSIZE_T Bytes,
    gctPOINTER Logical,
    gctPOINTER Physical
    );

gceSTATUS
gctaOS_AllocateNonSecurityMemory(
    gctaOS Os,
    gctSIZE_T *Bytes,
    gctPOINTER *Logical,
    gctPOINTER *Physical
    );

gceSTATUS
gctaOS_FreeNonSecurityMemory(
    gctaOS Os,
    gctSIZE_T Bytes,
    gctPOINTER Logical,
    gctPOINTER Physical
    );



gceSTATUS
gctaOS_GetPhysicalAddress(
    gctaOS Os,
    gctPOINTER Logical,
    gctPHYS_ADDR_T *Physical
    );

gceSTATUS gctaOS_WriteRegister(
    gctaOS Os, gceCORE Core,
    gctUINT32 Address,
    gctUINT32 Data
    );

gceSTATUS gctaOS_ReadRegister(
    gctaOS Os, gceCORE Core,
    gctUINT32 Address,
    gctUINT32 *Data
    );

gceSTATUS
gctaOS_MemCopy(
    gctUINT8_PTR Dest,
    gctUINT8_PTR Src,
    gctUINT32 Bytes
    );

gceSTATUS
gctaOS_ZeroMemory(
    gctUINT8_PTR Dest,
    gctUINT32 Bytes
    );

void
gctaOS_CacheFlush(
    gctUINT8_PTR Dest,
    gctUINT32 Bytes
    );

void
gctaOS_CacheClean(
    gctUINT8_PTR Dest,
    gctUINT32 Bytes
    );

void
gctaOS_CacheInvalidate(
    gctUINT8_PTR Dest,
    gctUINT32 Bytes
    );

gceSTATUS
gctaOS_IsPhysicalSecure(
    gctaOS Os,
    gctUINT32 Physical,
    gctBOOL *Secure
    );

gceSTATUS
gctaOS_Delay(
    gctaOS Os,
    gctUINT32 Delay
    );

gceSTATUS
gctaOS_SetGPUPower(
    gctaOS Os,
    gctUINT32 Core,
    gctBOOL Clock,
    gctBOOL Power
    );




gceSTATUS
gctaHARDWARE_Construct(
    gcTA TA,
    gcTA_HARDWARE *Hardware
    );

gceSTATUS
gctaHARDWARE_Destroy(
    gcTA_HARDWARE Hardware
    );

gceSTATUS
gctaHARDWARE_Execute(
    gcTA TA,
    gctUINT32 Address,
    gctUINT32 Bytes
    );

gceSTATUS
gctaHARDWARE_End(
    gcTA_HARDWARE Hardware,
    gctPOINTER Logical,
    gctUINT32 *Bytes
    );

gceSTATUS
gctaHARDWARE_SetMMU(
    gcTA_HARDWARE Hardware,
    gctPOINTER Logical
    );

gceSTATUS
gctaHARDWARE_IsFeatureAvailable(
    gcTA_HARDWARE Hardware,
    gceFEATURE Feature
    );

gceSTATUS
gctaHARDWARE_PrepareFunctions(
    gcTA_HARDWARE Hardware
    );

gceSTATUS
gctaHARDWARE_DumpMMUException(
    gcTA_HARDWARE Hardware
    );

gceSTATUS
gctaHARDWARE_HandleMMUException(
    gcTA_HARDWARE Hardware,
    gctUINT32 MMUStatus,
    gctPHYS_ADDR_T Physical,
    gctUINT32 GPUAddress
    );

gceSTATUS
gctaHARDWARE_ReadMMUException(
    gcTA_HARDWARE Hardware,
    gctUINT32_PTR MMUStatus,
    gctUINT32_PTR MMUException
    );

gceSTATUS
gctaMMU_Construct(
    gcTA TA,
    gcTA_MMU *Mmu
    );

gceSTATUS
gctaMMU_Destory(
    gcTA_MMU Mmu
    );

gceSTATUS
gctaMMU_SetPage(
    gcTA_MMU Mmu,
    gctUINT32 PageAddress,
    gctUINT32 *PageEntry
    );

gceSTATUS
gctaMMU_GetPageEntry(
    gcTA_MMU Mmu,
    gctUINT32 Address,
    gctUINT32_PTR MtlbEntry,
    gctUINT32_PTR *PageTable,
    gctBOOL * Secure
    );

void
gctaMMU_DumpPagetableEntry(
    gcTA_MMU Mmu,
    gctUINT32 Address
    );

gceSTATUS
gctaMMU_FreePages(
    gcTA_MMU Mmu,
    gctUINT32 Address,
    gctUINT32 PageCount
    );

gceSTATUS
gctaMMU_Enable(
    gcTA_MMU Mmu,
    gcTA TA
    );
# 60 "drivers/mxc/gpu-viv/hal/security_v1/gc_hal_ta.c" 2
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h" 1
# 58 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_types.h" 1
# 59 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h" 2

# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_base.h" 1
# 61 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h" 2
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_profiler.h" 1
# 58 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_profiler.h"
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_profiler_shared.h" 1
# 68 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_profiler_shared.h"
typedef struct _gcsPROFILER_COUNTERS_PART1 {
    gctUINT32 gpuTotalRead64BytesPerFrame;
    gctUINT32 gpuTotalWrite64BytesPerFrame;


    gctUINT32 fe_draw_count;
    gctUINT32 fe_out_vertex_count;
    gctUINT32 fe_cache_miss_count;
    gctUINT32 fe_cache_lk_count;
    gctUINT32 fe_stall_count;
    gctUINT32 fe_starve_count;
    gctUINT32 fe_process_count;


    gctUINT32 pe0_pixel_count_killed_by_color_pipe;
    gctUINT32 pe0_pixel_count_killed_by_depth_pipe;
    gctUINT32 pe0_pixel_count_drawn_by_color_pipe;
    gctUINT32 pe0_pixel_count_drawn_by_depth_pipe;
    gctUINT32 pe1_pixel_count_killed_by_color_pipe;
    gctUINT32 pe1_pixel_count_killed_by_depth_pipe;
    gctUINT32 pe1_pixel_count_drawn_by_color_pipe;
    gctUINT32 pe1_pixel_count_drawn_by_depth_pipe;


    gctUINT32 shader_cycle_count;
    gctUINT32 vs_shader_cycle_count;
    gctUINT32 ps_shader_cycle_count;
    gctUINT32 ps_inst_counter;
    gctUINT32 ps_rendered_pixel_counter;
    gctUINT32 vs_inst_counter;
    gctUINT32 vs_rendered_vertice_counter;
    gctUINT32 vs_branch_inst_counter;
    gctUINT32 vs_texld_inst_counter;
    gctUINT32 ps_branch_inst_counter;
    gctUINT32 ps_texld_inst_counter;
    gctUINT32 vs_non_idle_starve_count;
    gctUINT32 vs_starve_count;
    gctUINT32 vs_stall_count;
    gctUINT32 vs_process_count;
    gctUINT32 ps_non_idle_starve_count;
    gctUINT32 ps_starve_count;
    gctUINT32 ps_stall_count;
    gctUINT32 ps_process_count;


    gctUINT32 pa_input_vtx_counter;
    gctUINT32 pa_input_prim_counter;
    gctUINT32 pa_output_prim_counter;
    gctUINT32 pa_depth_clipped_counter;
    gctUINT32 pa_trivial_rejected_counter;
    gctUINT32 pa_culled_prim_counter;
    gctUINT32 pa_droped_prim_counter;
    gctUINT32 pa_frustum_clipped_prim_counter;
    gctUINT32 pa_frustum_clipdroped_prim_counter;
    gctUINT32 pa_non_idle_starve_count;
    gctUINT32 pa_starve_count;
    gctUINT32 pa_stall_count;
    gctUINT32 pa_process_count;


    gctUINT32 se_culled_triangle_count;
    gctUINT32 se_culled_lines_count;
    gctUINT32 se_clipped_triangle_count;
    gctUINT32 se_clipped_line_count;
    gctUINT32 se_starve_count;
    gctUINT32 se_stall_count;
    gctUINT32 se_receive_triangle_count;
    gctUINT32 se_send_triangle_count;
    gctUINT32 se_receive_lines_count;
    gctUINT32 se_send_lines_count;
    gctUINT32 se_process_count;
    gctUINT32 se_trivial_rejected_line_count;
    gctUINT32 se_non_idle_starve_count;


    gctUINT32 ra_input_prim_count;
    gctUINT32 ra_total_quad_count;
    gctUINT32 ra_valid_quad_count_after_early_z;
    gctUINT32 ra_valid_pixel_count_to_render;
    gctUINT32 ra_output_valid_quad_count;
    gctUINT32 ra_output_valid_pixel_count;
    gctUINT32 ra_pipe_cache_miss_counter;
    gctUINT32 ra_pipe_hz_cache_miss_counter;
    gctUINT32 ra_prefetch_cache_miss_counter;
    gctUINT32 ra_prefetch_hz_cache_miss_counter;
    gctUINT32 ra_eez_culled_counter;
    gctUINT32 ra_non_idle_starve_count;
    gctUINT32 ra_starve_count;
    gctUINT32 ra_stall_count;
    gctUINT32 ra_process_count;


    gctUINT32 tx_total_bilinear_requests;
    gctUINT32 tx_total_trilinear_requests;
    gctUINT32 tx_total_discarded_texture_requests;
    gctUINT32 tx_total_texture_requests;
    gctUINT32 tx_mc0_miss_count;
    gctUINT32 tx_mc0_request_byte_count;
    gctUINT32 tx_mc1_miss_count;
    gctUINT32 tx_mc1_request_byte_count;
    gctUINT32 tx_non_idle_starve_count;
    gctUINT32 tx_starve_count;
    gctUINT32 tx_stall_count;
    gctUINT32 tx_process_count;
} gcsPROFILER_COUNTERS_PART1;

typedef struct _gcsPROFILER_COUNTERS_PART2 {

    gctUINT32 mcc_total_read_req_8B_from_colorpipe;
    gctUINT32 mcc_total_read_req_8B_sentout_from_colorpipe;
    gctUINT32 mcc_total_write_req_8B_from_colorpipe;
    gctUINT32 mcc_total_read_req_sentout_from_colorpipe;
    gctUINT32 mcc_total_write_req_from_colorpipe;
    gctUINT32 mcc_total_read_req_8B_from_depthpipe;
    gctUINT32 mcc_total_read_req_8B_sentout_from_depthpipe;
    gctUINT32 mcc_total_write_req_8B_from_depthpipe;
    gctUINT32 mcc_total_read_req_sentout_from_depthpipe;
    gctUINT32 mcc_total_write_req_from_depthpipe;
    gctUINT32 mcc_total_read_req_8B_from_others;
    gctUINT32 mcc_total_write_req_8B_from_others;
    gctUINT32 mcc_total_read_req_from_others;
    gctUINT32 mcc_total_write_req_from_others;
    gctUINT32 mcc_axi_total_latency;
    gctUINT32 mcc_axi_sample_count;
    gctUINT32 mcc_axi_max_latency;
    gctUINT32 mcc_axi_min_latency;
    gctUINT32 mc_fe_read_bandwidth;
    gctUINT32 mc_mmu_read_bandwidth;
    gctUINT32 mc_blt_read_bandwidth;
    gctUINT32 mc_sh0_read_bandwidth;
    gctUINT32 mc_sh1_read_bandwidth;
    gctUINT32 mc_pe_write_bandwidth;
    gctUINT32 mc_blt_write_bandwidth;
    gctUINT32 mc_sh0_write_bandwidth;
    gctUINT32 mc_sh1_write_bandwidth;


    gctUINT32 mcz_total_read_req_8B_from_colorpipe;
    gctUINT32 mcz_total_read_req_8B_sentout_from_colorpipe;
    gctUINT32 mcz_total_write_req_8B_from_colorpipe;
    gctUINT32 mcz_total_read_req_sentout_from_colorpipe;
    gctUINT32 mcz_total_write_req_from_colorpipe;
    gctUINT32 mcz_total_read_req_8B_from_depthpipe;
    gctUINT32 mcz_total_read_req_8B_sentout_from_depthpipe;
    gctUINT32 mcz_total_write_req_8B_from_depthpipe;
    gctUINT32 mcz_total_read_req_sentout_from_depthpipe;
    gctUINT32 mcz_total_write_req_from_depthpipe;
    gctUINT32 mcz_total_read_req_8B_from_others;
    gctUINT32 mcz_total_write_req_8B_from_others;
    gctUINT32 mcz_total_read_req_from_others;
    gctUINT32 mcz_total_write_req_from_others;
    gctUINT32 mcz_axi_total_latency;
    gctUINT32 mcz_axi_sample_count;
    gctUINT32 mcz_axi_max_latency;
    gctUINT32 mcz_axi_min_latency;


    gctUINT32 hi0_total_read_8B_count;
    gctUINT32 hi0_total_write_8B_count;
    gctUINT32 hi0_total_read_request_count;
    gctUINT32 hi0_total_write_request_count;
    gctUINT32 hi0_axi_cycles_read_request_stalled;
    gctUINT32 hi0_axi_cycles_write_request_stalled;
    gctUINT32 hi0_axi_cycles_write_data_stalled;
    gctUINT32 hi1_total_read_8B_count;
    gctUINT32 hi1_total_write_8B_count;
    gctUINT32 hi1_total_read_request_count;
    gctUINT32 hi1_total_write_request_count;
    gctUINT32 hi1_axi_cycles_read_request_stalled;
    gctUINT32 hi1_axi_cycles_write_request_stalled;
    gctUINT32 hi1_axi_cycles_write_data_stalled;
    gctUINT32 hi_total_cycle_count;
    gctUINT32 hi_total_idle_cycle_count;
    gctUINT32 hi_total_read_8B_count;
    gctUINT32 hi_total_write_8B_count;
    gctUINT32 hi_total_readOCB_16B_count;
    gctUINT32 hi_total_writeOCB_16B_count;


    gctUINT32 l2_total_axi0_read_request_count;
    gctUINT32 l2_total_axi1_read_request_count;
    gctUINT32 l2_total_axi0_write_request_count;
    gctUINT32 l2_total_axi1_write_request_count;
    gctUINT32 l2_total_read_transactions_request_by_axi0;
    gctUINT32 l2_total_read_transactions_request_by_axi1;
    gctUINT32 l2_total_write_transactions_request_by_axi0;
    gctUINT32 l2_total_write_transactions_request_by_axi1;
    gctUINT32 l2_axi0_minmax_latency;
    gctUINT32 l2_axi0_min_latency;
    gctUINT32 l2_axi0_max_latency;
    gctUINT32 l2_axi0_total_latency;
    gctUINT32 l2_axi0_total_request_count;
    gctUINT32 l2_axi1_minmax_latency;
    gctUINT32 l2_axi1_min_latency;
    gctUINT32 l2_axi1_max_latency;
    gctUINT32 l2_axi1_total_latency;
    gctUINT32 l2_axi1_total_request_count;
} gcsPROFILER_COUNTERS_PART2;

typedef struct _gcsPROFILER_COUNTERS {
    gcsPROFILER_COUNTERS_PART1 counters_part1;
    gcsPROFILER_COUNTERS_PART2 counters_part2;
} gcsPROFILER_COUNTERS;

typedef enum _gceVIP_PROBE_COUNTER {
    gcvVIP_PROBE_COUNTER_NEURAL_NET,
    gcvVIP_PROBE_COUNTER_TENSOR_PROCESSOR,
    gcvVIP_PROBE_COUNTER_COUNT
} gceVIP_PROBE_COUNTER;


typedef enum _gceTPCOUNTER_OVERFLOW {
    gcvTPCOUNTER_LAYER_ID_OVERFLOW = (1 << 0),
    gcvTPCOUNTER_TOTAL_BUSY_CYCLE_OVERFLOW = (1 << 1),
    gcvTPCOUNTER_TOTAL_READ_BW_DDR_OVERFLOW = (1 << 2),
    gcvTPCOUNTER_TOTAL_WRITE_BW_DDR_OVERFLOW = (1 << 3),
    gcvTPCOUNTER_TOTAL_READ_BW_SRAM_OVERFLOW = (1 << 4),
    gcvTPCOUNTER_TOTAL_WRITE_BW_SRAM_OVERFLOW = (1 << 5),
    gcvTPCOUNTER_TOTAL_READ_BW_OCB_OVERFLOW = (1 << 6),
    gcvTPCOUNTER_TOTAL_WRITE_BW_OCB_OVERFLOW = (1 << 7),
    gcvTPCOUNTER_FC_PIX_CNT_OVERFLOW = (1 << 8),
    gcvTPCOUNTER_FC_ZERO_SKIP_OVERFLOW = (1 << 9),
    gcvTPCOUNTER_FC_COEF_CNT_OVERFLOW = (1 << 10),
    gcvTPCOUNTER_FC_COEF_ZERO_CNT_OVERFLOW = (1 << 11),
    gcvTPCOUNTER_TOTAL_IDLE_CYCLE_CORE0_OVERFLOW = (1 << 0),
    gcvTPCOUNTER_TOTAL_IDLE_CYCLE_CORE1_OVERFLOW = (1 << 1),
    gcvTPCOUNTER_TOTAL_IDLE_CYCLE_CORE2_OVERFLOW = (1 << 2),
    gcvTPCOUNTER_TOTAL_IDLE_CYCLE_CORE3_OVERFLOW = (1 << 3),
} _gceTPCOUNTER_OVERFLOW;


typedef enum _gceNNCOUNTER_OVERFLOW {
    gcvNNCOUNTER_TOTAL_BUSY_CYCLE_OVERFLOW = (1 << 0),
    gcvNNCOUNTER_TOTAL_READ_CYCLE_DDR_OVERFLOW = (1 << 2),
    gcvNNCOUNTER_TOTAL_READ_BW_DDR_OVERFLOW = (1 << 3),
    gcvNNCOUNTER_TOTAL_WRITE_CYCLE_DDR_OVERFLOW = (1 << 4),
    gcvNNCOUNTER_TOTAL_WRITE_BW_DDR_OVERFLOW = (1 << 5),
    gcvNNCOUNTER_TOTAL_READ_SYCLE_SRAM_OVERFLOW = (1 << 6),
    gcvNNCOUNTER_TOTAL_WRITE_CYCLE_SRAM_OVERFLOW = (1 << 7),
    gcvNNCOUNTER_TOTAL_MAC_CYCLE_OVERFLOW = (1 << 8),
    gcvNNCOUNTER_TOTAL_MAC_COUNT_OVERFLOW = (1 << 9),
    gcvNNCOUNTER_ZERO_COEF_SKIP_COUNT_OVERFLOW = (1 << 10),
    gcvNNCOUNTER_NON_ZERO_COEF_COUNT_OVERFLOW = (1 << 11),
} _gceNNCOUNTER_OVERFLOW;


typedef struct _gcsPROFILER_VIP_PROBE_COUNTERS {

    gctUINT32 nn_layer_id;
    gctUINT32 nn_layer_id_overflow;
    gctUINT32 nn_instr_info;
    gctUINT32 nn_total_busy_cycle;
    gctUINT32 nn_total_busy_cycle_overflow;
    gctUINT32 nn_total_read_cycle_ddr;
    gctUINT32 nn_total_read_cycle_ddr_overflow;
    gctUINT32 nn_total_read_valid_bandwidth_ddr;
    gctUINT32 nn_total_read_valid_bandwidth_ddr_overflow;
    gctUINT32 nn_total_write_cycle_ddr;
    gctUINT32 nn_total_write_cycle_ddr_overflow;
    gctUINT32 nn_total_write_valid_bandwidth_ddr;
    gctUINT32 nn_total_write_valid_bandwidth_ddr_overflow;
    gctUINT32 nn_total_read_cycle_sram;
    gctUINT32 nn_total_read_cycle_sram_overflow;
    gctUINT32 nn_total_write_cycle_sram;
    gctUINT32 nn_total_write_cycle_sram_overflow;
    gctUINT32 nn_total_mac_cycle;
    gctUINT32 nn_total_mac_cycle_overflow;
    gctUINT32 nn_total_mac_count;
    gctUINT32 nn_total_mac_count_overflow;
    gctUINT32 nn_zero_coef_skip_count;
    gctUINT32 nn_zero_coef_skip_count_overflow;
    gctUINT32 nn_non_zero_coef_count;
    gctUINT32 nn_non_zero_coef_count_overflow;

    gctUINT32 nn_reserved_counter[4 * 0x9];
    gctUINT32 nn_total_idle_cycle_core_overflow[4];
    gctUINT32 nn_total_idle_cycle_core[32];


    gctUINT32 tp_layer_id;
    gctUINT32 tp_layer_id_overflow;
    gctUINT32 tp_total_busy_cycle;
    gctUINT32 tp_total_busy_cycle_overflow;

    gctUINT32 tp_total_read_bandwidth_cache;
    gctUINT32 tp_total_read_bandwidth_cache_overflow;
    gctUINT32 tp_total_write_bandwidth_cache;
    gctUINT32 tp_total_write_bandwidth_cache_overflow;

    gctUINT32 tp_total_read_bandwidth_sram;
    gctUINT32 tp_total_read_bandwidth_sram_overflow;
    gctUINT32 tp_total_write_bandwidth_sram;
    gctUINT32 tp_total_write_bandwidth_sram_overflow;

    gctUINT32 tp_total_read_bandwidth_ocb;
    gctUINT32 tp_total_read_bandwidth_ocb_overflow;
    gctUINT32 tp_total_write_bandwidth_ocb;
    gctUINT32 tp_total_write_bandwidth_ocb_overflow;

    gctUINT32 tp_fc_pix_count;
    gctUINT32 tp_fc_zero_skip_count;
    gctUINT32 tp_fc_pix_count_overflow;
    gctUINT32 tp_fc_zero_skip_count_overflow;

    gctUINT32 tp_fc_coef_count;
    gctUINT32 tp_fc_coef_zero_count;
    gctUINT32 tp_fc_coef_count_overflow;
    gctUINT32 tp_fc_coef_zero_count_overflow;

    gctUINT32 tp_total_idle_cycle_core[16];
    gctUINT32 tp_total_idle_cycle_core_overflows[16];
} gcsPROFILER_VIP_PROBE_COUNTERS;
# 59 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_profiler.h" 2
# 227 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_profiler.h"
enum gceVPG {
    VPHEADER,
    INFO,
    FRAME,
    VPTIME,
    ES11,
    VG11,
    HW,
    MULTI_GPU,
    PROG,
    ES11DRAW,
    MEM,
    PVS,
    PPS,
    ES11_TIME,
    ES30,
    ES30_DRAW,
    ES30_TIME,
    FINISH,
    END,
};
# 1013 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_profiler.h"
struct _gcsAppInfoCounter {
    gctUINT32 count[gcvCOUNTER_OP_NONE];
};

typedef struct _gcsAppInfoCounter gcsAppInfoCounter;

typedef struct gcsCounterBuffer *gcsCounterBuffer_PTR;

struct gcsCounterBuffer {
    gctPOINTER counters;
    gcsPROFILER_VIP_PROBE_COUNTERS *vipCounters;
    gctHANDLE couterBufobj;
    gctADDRESS probeAddress;
    gctPOINTER logicalAddress;
    gceCOUNTER_OPTYPE opType;
    gctUINT32 opID;
    gcsAppInfoCounter opCount;
    gctUINT32 currentShaderId[6];
    gctUINT32 startPos;
    gctUINT32 endPos;
    gctUINT32 dataSize;
    gctBOOL available;
    gctBOOL needDump;
    gcsCounterBuffer_PTR next;
    gcsCounterBuffer_PTR prev;
};

typedef struct _gcoPROBE gcoPROBE;
struct _gcoPROBE {
    gctUINT32 address;
    gctUINT32 offset;
};

typedef struct _gcoMODULE gcoMODULE;
struct _gcoMODULE {
    gctUINT32 name;
    gctUINT32 address;
    gctUINT32 numProbe;
    gcoPROBE probe[256];
};

typedef struct _gcoPROFILER *gcoPROFILER;

struct _gcoPROFILER {
    gctBOOL enable;
    gctBOOL enablePrint;
    gctBOOL disableProbe;

    gctBOOL vipProbe;

    gctFILE file;
    gctCHAR *fileName;
    gceProfilerMode profilerMode;
    gceProbeMode probeMode;

    gcsCounterBuffer_PTR counterBuf;
    gcsAppInfoCounter currentOpCount;
    gctUINT32 bufferCount;

    gctBOOL perDrawMode;
    gctBOOL needDump;
    gctBOOL counterEnable;

    gceProfilerClient profilerClient;


    gctUINT32 coreCount;
    gctUINT32 shaderCoreCount;
    gctBOOL bHalti4;
    gctBOOL psRenderPixelFix;
    gctBOOL axiBus128bits;
    gctBOOL bZDP3;
};

typedef struct _gcsPROBESTATES {
    gceProbeStatus status;
    gctADDRESS probeAddress;
} gcsPROBESTATES;

typedef struct _gckPROFILER {

    gctBOOL profileEnable;

    gceProfilerMode profileMode;

    gceProbeMode probeMode;

    gctBOOL profileCleanRegister;

    gcsPROFILER_COUNTERS_PART1 latestProfiler_part1;
    gcsPROFILER_COUNTERS_PART1 histroyProfiler_part1;
    gcsPROFILER_COUNTERS_PART1 preProfiler_part1;
    gcsPROFILER_COUNTERS_PART2 latestProfiler_part2;
    gcsPROFILER_COUNTERS_PART2 histroyProfiler_part2;
    gcsPROFILER_COUNTERS_PART2 preProfiler_part2;
} gckPROFILER;


gceSTATUS
gcoPROFILER_Construct( gcoPROFILER *Profiler);

gceSTATUS
gcoPROFILER_Destroy( gcoPROFILER Profiler);

gceSTATUS
gcoPROFILER_Initialize( gcoPROFILER Profiler);

gceSTATUS
gcoPROFILER_Enable( gcoPROFILER Profiler);

gceSTATUS
gcoPROFILER_Disable(void);

gceSTATUS
gcoPROFILER_EnableCounters( gcoPROFILER Profiler,
                           gceCOUNTER_OPTYPE operationType);

gceSTATUS
gcoPROFILER_Start( gcoPROFILER Profiler);

gceSTATUS
gcoPROFILER_End( gcoPROFILER Profiler,
                gceCOUNTER_OPTYPE operationType,
                gctUINT32 OpID);

gceSTATUS
gcoPROFILER_Write( gcoPROFILER Profiler,
                  gctSIZE_T ByteCount,
                  gctCONST_POINTER Data);

gceSTATUS
gcoPROFILER_Flush( gcoPROFILER Profiler);

gceSTATUS
gcoPROFILER_GetProbeNumber( gcoHARDWARE Hardware,
                           gctUINT32 *TotalProbeNumber);

gctUINT32
gcoPROFILER_getMuduleNum( gcoPROFILER Profiler);

gctUINT32
gcoPROFILER_getMuduleProbeNum( gcoPROFILER Profiler, gctUINT32 index);

gctUINT32
gcoPROFILER_getModuleAddress( gcoPROFILER Profiler, gctUINT32 ModuleIndex);

gctUINT32
gcoPROFILER_getProbeAddress( gcoPROFILER Profiler,
                            gctUINT32 ModuleIndex,
                            gctUINT32 ProbeIndex);

gctUINT32
gcoPROFILER_getCounterBufferSize( gcoPROFILER Profiler);

gceSTATUS
gcoPROFILER_WriteChipInfo( gcoPROFILER Profiler);
# 62 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h" 2
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_driver.h" 1
# 55 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_driver.h"
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h" 1
# 58 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h"
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_enum_shared.h" 1
# 59 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h" 2
# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_types_shared.h" 1
# 60 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h" 2
# 105 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h"
typedef struct _gcsHAL_CHIP_INFO {

    gctINT32 count;


    gceHARDWARE_TYPE types[gcvCORE_COUNT];


    gctUINT32 ids[gcvCORE_COUNT];

    gctUINT32 coreIndexs[gcvCORE_COUNT];


    gctUINT32 hwDevIDs[gcvCORE_COUNT];
} gcsHAL_CHIP_INFO;


typedef struct _gcsHAL_VERSION {

    gctINT32 major;
    gctINT32 minor;
    gctINT32 patch;


    gctUINT32 build;
} gcsHAL_VERSION;


typedef struct _gcsHAL_SET_TIMEOUT {
    gctUINT32 timeOut;
} gcsHAL_SET_TIMEOUT;


typedef struct _gcsHAL_QUERY_VIDEO_MEMORY {

    gctUINT32 internalPhysName;

    gctUINT64 internalSize;


    gctUINT32 externalPhysName;

    gctUINT64 externalSize;


    gctUINT32 contiguousPhysName;

    gctUINT64 contiguousSize;


    gctUINT32 exclusivePhysName;

    gctUINT64 exclusiveSize;
} gcsHAL_QUERY_VIDEO_MEMORY;


typedef struct _gcsHAL_QUERY_CHIP_IDENTITY *gcsHAL_QUERY_CHIP_IDENTITY_PTR;
typedef struct _gcsHAL_QUERY_CHIP_IDENTITY {

    gceCHIPMODEL chipModel;


    gctUINT32 chipRevision;


    gctUINT32 chipDate;


    gctUINT32 chipFeatures;


    gctUINT32 chipMinorFeatures;


    gctUINT32 chipMinorFeatures1;


    gctUINT32 chipMinorFeatures2;


    gctUINT32 chipMinorFeatures3;


    gctUINT32 chipMinorFeatures4;


    gctUINT32 chipMinorFeatures5;


    gctUINT32 chipMinorFeatures6;


    gctUINT32 streamCount;


    gctUINT32 pixelPipes;


    gctUINT32 resolvePipes;


    gctUINT32 instructionCount;


    gctUINT32 PSInstructionCount;


    gctUINT32 numConstants;


    gctUINT32 varyingsCount;


    gctUINT32 gpuCoreCount;


    gctUINT32 clusterAvailMask;


    gctUINT32 productID;


    gceCHIP_FLAG chipFlags;


    gctUINT32 ecoID;


    gctUINT32 customerID;

    gctUINT32 chipConfig;


    gctUINT64 sRAMBases[gcvSRAM_INTER_COUNT];
    gctUINT32 sRAMSizes[gcvSRAM_INTER_COUNT];

    gctUINT64 platformFlagBits;


    gctUINT64 registerAPB;


    gctUINT32 nnClusterNum;


    gctUINT32 virtualAddressBits;
} gcsHAL_QUERY_CHIP_IDENTITY;


typedef struct _gcsHAL_QUERY_CHIP_OPTIONS *gcsHAL_QUERY_CHIP_OPTIONS_PTR;
typedef struct _gcsHAL_QUERY_CHIP_OPTIONS {
    gctBOOL gpuProfiler;
    gctBOOL allowFastClear;
    gctBOOL powerManagement;




    gctBOOL enableMMU;
    gceCOMPRESSION_OPTION allowCompression;
    gctBOOL smallBatch;
    gctUINT32 uscL1CacheRatio;
    gctUINT32 uscAttribCacheRatio;
    gctUINT32 userClusterMask;
    gctUINT32 userClusterMasks[(gcvCORE_2D_MAX + 1)];


    gctADDRESS sRAMGPUVirtAddrs[gcvSRAM_INTER_COUNT];
    gctUINT32 sRAMSizes[gcvSRAM_INTER_COUNT];
    gctUINT32 sRAMCount;


    gctPHYS_ADDR_T extSRAMCPUPhysAddrs[2];
    gctPHYS_ADDR_T extSRAMGPUPhysAddrs[2];
    gctADDRESS extSRAMGPUVirtAddrs[2];
    gctUINT32 extSRAMGPUPhysNames[2];
    gctUINT32 extSRAMSizes[2];
    gctUINT32 extSRAMCount;


    gctUINT32 vidMemCount;

    gceSECURE_MODE secureMode;

    gctBOOL hasShader;


    gctUINT32 enableNNClusters;
    gctUINT32 configNNPowerControl;

    gctUINT32 activeNNCoreCount;
} gcsHAL_QUERY_CHIP_OPTIONS;


typedef struct _gcsHAL_QUERY_CHIP_FREQUENCY *gcsHAL_QUERY_CHIP_FREQUENCY_PTR;
typedef struct _gcsHAL_QUERY_CHIP_FREQUENCY {
    gctUINT32 mcClk;
    gctUINT32 shClk;
} gcsHAL_QUERY_CHIP_FREQUENCY;



typedef struct _gcsHAL_ALLOCATE_NON_PAGED_MEMORY {

    gctUINT32 flags;


    gctUINT64 bytes;


    gctUINT32 physName;


    gctUINT64 logical;
} gcsHAL_ALLOCATE_NON_PAGED_MEMORY;



typedef struct _gcsHAL_FREE_NON_PAGED_MEMORY {

    gctUINT64 bytes;


    gctUINT32 physName;


    gctUINT64 logical;
} gcsHAL_FREE_NON_PAGED_MEMORY;



typedef struct _gcsHAL_ALLOCATE_LINEAR_VIDEO_MEMORY {

    gctUINT64 bytes;


    gctUINT32 alignment;


    gctUINT32 type;


    gctUINT32 flag;


    gctUINT32 pool;


    gctINT32 sRAMIndex;


    gctINT32 extSRAMIndex;


    gctINT32 vidMemIndex;


    gctUINT32 node;
} gcsHAL_ALLOCATE_LINEAR_VIDEO_MEMORY;

typedef struct _gcsUSER_MEMORY_DESC {

    gctUINT32 flag;


    gctUINT32 handle;
    gctUINT64 dmabuf;


    gctUINT64 logical;
    gctUINT64 physical;
    gctUINT64 size;
} gcsUSER_MEMORY_DESC;


typedef struct _gcsHAL_WRAP_USER_MEMORY {

    gcsUSER_MEMORY_DESC desc;


    gctUINT32 type;


    gctUINT32 node;


    gctUINT64 bytes;
} gcsHAL_WRAP_USER_MEMORY;


typedef struct _gcsHAL_RELEASE_VIDEO_MEMORY {

    gctUINT32 node;
# 406 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h"
} gcsHAL_RELEASE_VIDEO_MEMORY;


typedef struct _gcsHAL_LOCK_VIDEO_MEMORY {

    gctUINT32 node;



    gctBOOL cacheable;


    gctADDRESS address;


    gctUINT64 memory;


    gctUINT32 gid;


    gctUINT64 physicalAddress;







    gceLOCK_VIDEO_MEMORY_OP op;
} gcsHAL_LOCK_VIDEO_MEMORY;


typedef struct _gcsHAL_UNLOCK_VIDEO_MEMORY {

    gctUINT64 node;


    gctUINT32 type;


    gctUINT32 pool;


    gctUINT64 bytes;


    gctBOOL asynchroneous;





    gceLOCK_VIDEO_MEMORY_OP op;
} gcsHAL_UNLOCK_VIDEO_MEMORY;


typedef struct _gcsHAL_BOTTOM_HALF_UNLOCK_VIDEO_MEMORY {

    gctUINT32 node;


    gctUINT32 type;
} gcsHAL_BOTTOM_HALF_UNLOCK_VIDEO_MEMORY;


typedef struct _gcsHAL_EXPORT_VIDEO_MEMORY {

    gctUINT32 node;


    gctUINT32 flags;


    gctINT32 fd;
} gcsHAL_EXPORT_VIDEO_MEMORY;


typedef struct _gcsHAL_NAME_VIDEO_MEMORY {
    gctUINT32 handle;
    gctUINT32 name;
} gcsHAL_NAME_VIDEO_MEMORY;


typedef struct _gcsHAL_IMPORT_VIDEO_MEMORY {
    gctUINT32 name;
    gctUINT32 handle;
} gcsHAL_IMPORT_VIDEO_MEMORY;


typedef struct _gcsHAL_MAP_MEMORY {

    gctUINT32 physName;


    gctUINT64 bytes;


    gctUINT64 logical;
} gcsHAL_MAP_MEMORY;


typedef struct _gcsHAL_UNMAP_MEMORY {

    gctUINT32 physName;


    gctUINT64 bytes;


    gctUINT64 logical;
} gcsHAL_UNMAP_MEMORY;


typedef struct _gcsHAL_CACHE {
    gceCACHEOPERATION operation;
    gctUINT64 process;
    gctUINT64 logical;
    gctUINT64 bytes;
    gctUINT64 offset;
    gctUINT32 node;
} gcsHAL_CACHE;


typedef struct _gcsHAL_ATTACH {

    gctUINT32 context;


    gctUINT64 maxState;


    gctUINT32 numStates;


    gctBOOL map;


    gctUINT64 logicals[2];


    gctUINT32 bytes;


    gctBOOL shared;






} gcsHAL_ATTACH;


typedef struct _gcsHAL_DETACH {

    gctUINT32 context;
} gcsHAL_DETACH;


typedef struct _gcsHAL_EVENT_COMMIT {

    gctUINT64 queue;


    gctUINT32 broCoreMask;

    gctBOOL shared;







} gcsHAL_EVENT_COMMIT;

typedef struct _gcsHAL_COMMAND_LOCATION {
    gctUINT32 priority;
    gctUINT32 channelId;

    gctUINT32 videoMemNode;

    gctADDRESS address;
    gctUINT64 logical;
    gctUINT32 startOffset;

    gctUINT32 size;

    gctUINT32 reservedHead;
    gctUINT32 reservedTail;


    gctUINT64 patchHead;






    gctUINT32 exitIndex;
    gctUINT32 entryPipe;
    gctUINT32 exitPipe;


    gctUINT64 next;



} gcsHAL_COMMAND_LOCATION;

typedef struct _gcsHAL_SUBCOMMIT {
    gctUINT32 coreId;


    gctUINT64 delta;


    gctUINT64 context;


    gctUINT64 queue;


    gcsHAL_COMMAND_LOCATION commandBuffer;


    gctUINT64 next;
# 653 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h"
    gctBOOL useLocalMem;

} gcsHAL_SUBCOMMIT, *gcsHAL_SUBCOMMIT_PTR;


typedef struct _gcsHAL_COMMIT {
    gcsHAL_SUBCOMMIT subCommit;

    gctBOOL shared;

    gctBOOL contextSwitched;


    gctUINT64 commitStamp;


    gctUINT32 broCoreMask;
# 686 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h"
} gcsHAL_COMMIT;
# 705 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h"
typedef struct _gcsHAL_COMMIT_DONE {
    gctUINT64 context;





} gcsHAL_COMMIT_DONE;


typedef struct _gcsHAL_USER_SIGNAL {

    gceUSER_SIGNAL_COMMAND_CODES command;


    gctINT32 id;


    gctBOOL manualReset;


    gctUINT32 wait;


    gctBOOL state;


    gceSIGNAL_STATUS status;
} gcsHAL_USER_SIGNAL;


typedef struct _gcsHAL_SIGNAL {

    gctUINT64 signal;


    gctUINT64 auxSignal;


    gctUINT64 process;
# 754 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h"
    gceKERNEL_WHERE fromWhere;





} gcsHAL_SIGNAL;


typedef struct _gcsHAL_WRITE_DATA {

    gctUINT32 address;


    gctUINT32 data;
} gcsHAL_WRITE_DATA;


typedef struct _gcsHAL_READ_REGISTER {

    gctUINT32 address;


    gctUINT32 data;
} gcsHAL_READ_REGISTER;


typedef struct _gcsHAL_WRITE_REGISTER {

    gctUINT32 address;


    gctUINT32 data;
} gcsHAL_WRITE_REGISTER;


typedef struct _gcsHAL_READ_REGISTER_EX {

    gctUINT32 address;

    gctUINT32 coreSelect;


    gctUINT32 data[4];
} gcsHAL_READ_REGISTER_EX;


typedef struct _gcsHAL_WRITE_REGISTER_EX {

    gctUINT32 address;

    gctUINT32 coreSelect;


    gctUINT32 data[4];
} gcsHAL_WRITE_REGISTER_EX;


typedef struct _gcsHAL_APB_AXIFE_ACCESS {

    gctUINT32 address;

    gctUINT32 coreSelect;

    gctBOOL isRead;


    gctUINT32 data;
} gcsHAL_APB_AXIFE_ACCESS;



typedef struct _gcsHAL_GET_PROFILE_SETTING {

    gctBOOL enable;

    gceProfilerMode profileMode;

    gceProbeMode probeMode;
} gcsHAL_GET_PROFILE_SETTING;


typedef struct _gcsHAL_SET_PROFILE_SETTING {

    gctBOOL enable;

    gceProfilerMode profileMode;

    gceProbeMode probeMode;
} gcsHAL_SET_PROFILE_SETTING;


typedef struct _gcsHAL_READ_PROFILER_REGISTER_SETTING {

    gctBOOL bclear;
} gcsHAL_READ_PROFILER_REGISTER_SETTING;

typedef struct _gcsHAL_READ_ALL_PROFILE_REGISTERS_PART1 {

    gctUINT32 context;


    gcsPROFILER_COUNTERS_PART1 Counters;
} gcsHAL_READ_ALL_PROFILE_REGISTERS_PART1;

typedef struct _gcsHAL_READ_ALL_PROFILE_REGISTERS_PART2 {

    gctUINT32 context;


    gcsPROFILER_COUNTERS_PART2 Counters;
} gcsHAL_READ_ALL_PROFILE_REGISTERS_PART2;


typedef struct _gcsHAL_PROFILE_REGISTERS_2D {

    gctUINT64 hwProfile2D;
} gcsHAL_PROFILE_REGISTERS_2D;



typedef struct _gcsHAL_SET_POWER_MANAGEMENT {

    gceCHIPPOWERSTATE state;
} gcsHAL_SET_POWER_MANAGEMENT;


typedef struct _gcsHAL_QUERY_POWER_MANAGEMENT {

    gceCHIPPOWERSTATE state;


    gctBOOL isIdle;
} gcsHAL_QUERY_POWER_MANAGEMENT;


typedef struct _gcsHAL_CONFIG_POWER_MANAGEMENT {
    gctBOOL enable;
    gctBOOL oldValue;
} gcsHAL_CONFIG_POWER_MANAGEMENT;

typedef struct _gcsFLAT_MAPPING_RANGE {
    gctUINT64 start;
    gctUINT64 end;
    gctUINT64 size;
    gceFLATMAP_FLAG flag;


    gctUINT64 vStart;
} gcsFLAT_MAPPING_RANGE;


typedef struct _gcsHAL_GET_BASE_ADDRESS {

    gctUINT32 baseAddress;

    gctUINT32 flatMappingRangeCount;

    gcsFLAT_MAPPING_RANGE flatMappingRanges[8];
} gcsHAL_GET_BASE_ADDRESS;

typedef struct _gcsHAL_SET_DEBUG_LEVEL_ZONE {
    gctUINT32 level;
    gctUINT32 zones;
    gctBOOL enable;
} gcsHAL_SET_DEBUG_LEVEL_ZONE;

typedef struct _gcsHAL_QUERY_CPU_FREQUENCY
{
    gctUINT32 CPUId;
    gctUINT32 CPUFrequency;
} gcsHAL_QUERY_CPU_FREQUENCY;


typedef struct _gcsHAL_DEBUG_DUMP {

    gctUINT32 type;

    gctUINT64 ptr;
    gctADDRESS address;
    gctUINT32 size;
} gcsHAL_DEBUG_DUMP;



typedef struct _gcsHAL_TIMESTAMP {

    gctUINT32 timer;


    gctUINT32 request;


    gctINT32 timeDelta;
} gcsHAL_TIMESTAMP;


typedef struct _gcsHAL_DATABASE {




    gctBOOL validProcessID;


    gctUINT32 processID;


    gcuDATABASE_INFO vidMem;
    gcuDATABASE_INFO nonPaged;
    gcuDATABASE_INFO contiguous;
    gcuDATABASE_INFO gpuIdle;


    gcuDATABASE_INFO vidMemPool[3];
} gcsHAL_DATABASE;


typedef struct _gcsHAL_GET_FRAME_INFO {

    gctUINT64 frameInfo;
} gcsHAL_GET_FRAME_INFO;
# 985 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h"
typedef struct _gcsHAL_SET_FSCALE_VALUE {
    gctUINT32 value;
    gctUINT32 shValue;
} gcsHAL_SET_FSCALE_VALUE;

typedef struct _gcsHAL_GET_FSCALE_VALUE {
    gctUINT32 value;
    gctUINT32 minValue;
    gctUINT32 maxValue;
} gcsHAL_GET_FSCALE_VALUE;


typedef struct _gcsHAL_QUERY_RESET_TIME_STAMP {
    gctUINT64 timeStamp;
    gctUINT64 contextID;
} gcsHAL_QUERY_RESET_TIME_STAMP;


typedef struct _gcsHAL_CREATE_NATIVE_FENCE {

    gctUINT64 signal;


    gctINT32 fenceFD;

} gcsHAL_CREATE_NATIVE_FENCE;


typedef struct _gcsHAL_WAIT_NATIVE_FENCE {

    gctINT32 fenceFD;


    gctUINT32 timeout;
} gcsHAL_WAIT_NATIVE_FENCE;


typedef struct _gcsHAL_SHBUF {
    gceSHBUF_COMMAND_CODES command;


    gctUINT64 id;


    gctUINT64 data;


    gctUINT32 bytes;
} gcsHAL_SHBUF;







typedef struct _gcsHAL_GET_GRAPHIC_BUFFER_FD {

    gctUINT32 node[3];


    gctUINT64 shBuf;


    gctUINT64 signal;

    gctINT32 fd;
} gcsHAL_GET_GRAPHIC_BUFFER_FD;

typedef struct _gcsHAL_VIDEO_MEMORY_METADATA {

    gctUINT32 node;

    gctUINT32 readback;

    gctINT32 ts_fd;
    gctUINT32 fc_enabled;
    gctUINT32 fc_value;
    gctUINT32 fc_value_upper;

    gctUINT32 compressed;
    gctUINT32 compress_format;
} gcsHAL_VIDEO_MEMORY_METADATA;


typedef struct _gcsHAL_GET_VIDEO_MEMORY_FD {
    gctUINT32 handle;
    gctBOOL exported;
    gctINT32 fd;
} gcsHAL_GET_VIDEO_MEMORY_FD;


typedef struct _gcsHAL_DESTROY_MMU {

    gctUINT64 mmu;
} gcsHAL_DESTROY_MMU;


typedef struct _gcsHAL_WAIT_FENCE {
    gctUINT32 handle;
    gctUINT32 timeOut;
} gcsHAL_WAIT_FENCE;


typedef struct _gcsHAL_DEVICE_MUTEX {

    gctBOOL isMutexLocked;
} gcsHAL_DEVICE_MUTEX;
# 1139 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h"
typedef struct _gcsHAL_INTERFACE {

    gceHAL_COMMAND_CODES command;


    gceHARDWARE_TYPE hardwareType;


    gctUINT32 devIndex;


    gctUINT32 coreIndex;


    gceSTATUS status;


    gceENGINE engine;


    gctBOOL ignoreTLS;


    gctBOOL commitMutex;


    gctUINT64 devCtxt;


    union _u {
        gcsHAL_CHIP_INFO ChipInfo;
        gcsHAL_VERSION Version;
        gcsHAL_SET_TIMEOUT SetTimeOut;

        gcsHAL_QUERY_VIDEO_MEMORY QueryVideoMemory;
        gcsHAL_QUERY_CHIP_IDENTITY QueryChipIdentity;
        gcsHAL_QUERY_CHIP_OPTIONS QueryChipOptions;
        gcsHAL_QUERY_CHIP_FREQUENCY QueryChipFrequency;

        gcsHAL_ALLOCATE_NON_PAGED_MEMORY AllocateNonPagedMemory;
        gcsHAL_FREE_NON_PAGED_MEMORY FreeNonPagedMemory;

        gcsHAL_ALLOCATE_LINEAR_VIDEO_MEMORY AllocateLinearVideoMemory;
        gcsHAL_WRAP_USER_MEMORY WrapUserMemory;
        gcsHAL_RELEASE_VIDEO_MEMORY ReleaseVideoMemory;

        gcsHAL_LOCK_VIDEO_MEMORY LockVideoMemory;
        gcsHAL_UNLOCK_VIDEO_MEMORY UnlockVideoMemory;
        gcsHAL_BOTTOM_HALF_UNLOCK_VIDEO_MEMORY BottomHalfUnlockVideoMemory;

        gcsHAL_EXPORT_VIDEO_MEMORY ExportVideoMemory;
        gcsHAL_NAME_VIDEO_MEMORY NameVideoMemory;
        gcsHAL_IMPORT_VIDEO_MEMORY ImportVideoMemory;

        gcsHAL_MAP_MEMORY MapMemory;
        gcsHAL_UNMAP_MEMORY UnmapMemory;

        gcsHAL_CACHE Cache;

        gcsHAL_ATTACH Attach;
        gcsHAL_DETACH Detach;

        gcsHAL_EVENT_COMMIT Event;
        gcsHAL_COMMIT Commit;



        gcsHAL_COMMIT_DONE CommitDone;

        gcsHAL_USER_SIGNAL UserSignal;
        gcsHAL_SIGNAL Signal;

        gcsHAL_WRITE_DATA WriteData;
        gcsHAL_READ_REGISTER ReadRegisterData;
        gcsHAL_WRITE_REGISTER WriteRegisterData;
        gcsHAL_APB_AXIFE_ACCESS APBAXIFEAccess;
        gcsHAL_READ_REGISTER_EX ReadRegisterDataEx;
        gcsHAL_WRITE_REGISTER_EX WriteRegisterDataEx;
        gcsHAL_SET_POWER_MANAGEMENT SetPowerManagement;
        gcsHAL_QUERY_POWER_MANAGEMENT QueryPowerManagement;
        gcsHAL_CONFIG_POWER_MANAGEMENT ConfigPowerManagement;

        gcsHAL_GET_BASE_ADDRESS GetBaseAddress;

        gcsHAL_SET_DEBUG_LEVEL_ZONE DebugLevelZone;

        gcsHAL_QUERY_CPU_FREQUENCY QueryCPUFrequency;

        gcsHAL_DEBUG_DUMP DebugDump;

        gcsHAL_TIMESTAMP TimeStamp;
        gcsHAL_DATABASE Database;

        gcsHAL_GET_FRAME_INFO GetFrameInfo;
# 1241 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h"
        gcsHAL_SET_FSCALE_VALUE SetFscaleValue;
        gcsHAL_GET_FSCALE_VALUE GetFscaleValue;

        gcsHAL_QUERY_RESET_TIME_STAMP QueryResetTimeStamp;

        gcsHAL_CREATE_NATIVE_FENCE CreateNativeFence;
        gcsHAL_WAIT_NATIVE_FENCE WaitNativeFence;
        gcsHAL_SHBUF ShBuf;
        gcsHAL_GET_GRAPHIC_BUFFER_FD GetGraphicBufferFd;
        gcsHAL_VIDEO_MEMORY_METADATA SetVidMemMetadata;
        gcsHAL_GET_VIDEO_MEMORY_FD GetVideoMemoryFd;

        gcsHAL_DESTROY_MMU DestroyMmu;

        gcsHAL_WAIT_FENCE WaitFence;


        gcsHAL_DEVICE_MUTEX DeviceMutex;
# 1270 "./drivers/mxc/gpu-viv/hal/kernel/inc/shared/gc_hal_driver_shared.h"
    } u;
} gcsHAL_INTERFACE;

typedef struct _gcsEVENT_INTERFACE {

    gceHAL_COMMAND_CODES command;


    union _evtu {
        gcsHAL_UNLOCK_VIDEO_MEMORY UnlockVideoMemory;
        gcsHAL_COMMIT_DONE CommitDone;
        gcsHAL_SIGNAL Signal;
        gcsHAL_WRITE_DATA WriteData;
        gcsHAL_TIMESTAMP TimeStamp;
        gcsHAL_DESTROY_MMU DestroyMmu;
    } u;
}gcsEVENT_INTERFACE;


typedef struct _gcsHAL_PROFILER_INTERFACE {

    gceHAL_COMMAND_CODES command;


    gceHARDWARE_TYPE hardwareType;


    gctUINT32 devIndex;


    gctUINT32 coreIndex;


    gceSTATUS status;


    gceENGINE engine;


    gctBOOL ignoreTLS;


    gctBOOL commitMutex;


    gctPOINTER devCtxt;


    union profiler_u {
        gcsHAL_GET_PROFILE_SETTING GetProfileSetting;
        gcsHAL_SET_PROFILE_SETTING SetProfileSetting;
        gcsHAL_READ_PROFILER_REGISTER_SETTING SetProfilerRegisterClear;
        gcsHAL_READ_ALL_PROFILE_REGISTERS_PART1 RegisterProfileData_part1;
        gcsHAL_READ_ALL_PROFILE_REGISTERS_PART2 RegisterProfileData_part2;
        gcsHAL_PROFILE_REGISTERS_2D RegisterProfileData2D;
    } u;
} gcsHAL_PROFILER_INTERFACE;



typedef struct _gcsSTATE_DELTA_RECORD *gcsSTATE_DELTA_RECORD_PTR;
typedef struct _gcsSTATE_DELTA_RECORD {

    gctUINT address;


    gctUINT32 mask;


    gctUINT32 data;
} gcsSTATE_DELTA_RECORD;


typedef struct _gcsSTATE_DELTA {

    gctUINT num;







    gctUINT id;


    gctUINT elementCount;


    gctUINT recordCount;


    gctUINT64 recordArray;
    gctUINT recordSize;






    gctUINT64 mapEntryID;
    gctUINT mapEntryIDSize;





    gctUINT64 mapEntryIndex;


    gctUINT64 prev;
    gctUINT64 next;
} gcsSTATE_DELTA;

typedef struct _gcsQUEUE {

    gctUINT64 next;


    gcsEVENT_INTERFACE iface;
} gcsQUEUE;


typedef struct _gcsQUEUE_CHUNK {
    struct _gcsQUEUE_CHUNK *next;

    gcsQUEUE record[16];
} gcsQUEUE_CHUNK;
# 56 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_driver.h" 2
# 63 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h" 2

# 1 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_statistics.h" 1
# 86 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal_statistics.h"
typedef struct _gcsSTATISTICS_EARLYZ {
    gctUINT switchBackCount;
    gctUINT nextCheckPoint;
    gctBOOL disabled;
} gcsSTATISTICS_EARLYZ;


typedef struct _gcsSTATISTICS {
    gctUINT64 frameTime[30];
    gctUINT64 previousFrameTime;
    gctUINT frame;
    gcsSTATISTICS_EARLYZ earlyZ;
} gcsSTATISTICS;


void
gcfSTATISTICS_AddData( gceSTATISTICS Key, gctUINT Value);


void
gcfSTATISTICS_MarkFrameEnd(void);


void
gcfSTATISTICS_DisableDynamicEarlyZ( gctBOOL Disabled);
# 65 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h" 2






typedef struct _gckVIDMEM *gckVIDMEM;
typedef struct _gckKERNEL *gckKERNEL;
typedef struct _gckCOMMAND *gckCOMMAND;
typedef struct _gckEVENT *gckEVENT;
typedef struct _gckDB *gckDB;
typedef struct _gckDVFS *gckDVFS;
typedef struct _gckMMU *gckMMU;
typedef struct _gcsDEVICE *gckDEVICE;
# 156 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
typedef struct _gckHARDWARE *gckHARDWARE;
# 253 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_Construct( gctPOINTER Context, gckOS *Os);


gceSTATUS
gckOS_Destroy( gckOS Os);


gceSTATUS
gckOS_QueryVideoMemory( gckOS Os,
                       gctPHYS_ADDR *InternalAddress,
                       gctSIZE_T *InternalSize,
                       gctPHYS_ADDR *ExternalAddress,
                       gctSIZE_T *ExternalSize,
                       gctPHYS_ADDR *ContiguousAddress,
                       gctSIZE_T *ContiguousSize);


gceSTATUS
gckOS_Allocate( gckOS Os, gctSIZE_T Bytes,
               gctPOINTER *Memory);


gceSTATUS
gckOS_Free( gckOS Os, gctPOINTER Memory);


gceSTATUS
gckOS_AllocateMemory( gckOS Os, gctSIZE_T Bytes,
                     gctPOINTER *Memory);


gceSTATUS
gckOS_FreeMemory( gckOS Os, gctPOINTER Memory);


gceSTATUS
gckOS_AllocatePagedMemory( gckOS Os,
                          gckKERNEL Kernel,
                          gctUINT32 Flag,
                          gctSIZE_T *Bytes,
                          gctUINT32 *Gid,
                          gctPHYS_ADDR *Physical);


gceSTATUS
gckOS_LockPages( gckOS Os,
                gctPHYS_ADDR Physical,
                gctSIZE_T Bytes,
                gctBOOL Cacheable,
                gctPOINTER *Logical);


gceSTATUS
gckOS_MapPagesEx( gckOS Os,
                 gckKERNEL Kernel,
                 gctPHYS_ADDR Physical,
                 gctSIZE_T PageCount,
                 gctADDRESS Address,
                 gctPOINTER PageTable,
                 gctBOOL Writable,
                 gceVIDMEM_TYPE Type);


gceSTATUS
gckOS_Map1MPages( gckOS Os,
                 gckKERNEL Kernel,
                 gctPHYS_ADDR Physical,
                 gctSIZE_T PageCount,
                 gctADDRESS Address,
                 gctPOINTER PageTable,
                 gctBOOL Writable,
                 gceVIDMEM_TYPE Type);

gceSTATUS
gckOS_UnmapPages( gckOS Os, gctSIZE_T PageCount, gctADDRESS Address);


gceSTATUS
gckOS_UnlockPages( gckOS Os, gctPHYS_ADDR Physical,
                  gctSIZE_T Bytes, gctPOINTER Logical);


gceSTATUS
gckOS_FreePagedMemory( gckOS Os, gctPHYS_ADDR Physical, gctSIZE_T Bytes);


gceSTATUS
gckOS_AllocateNonPagedMemory( gckOS Os,
                             gckKERNEL Kernel,
                             gctBOOL InUserSpace,
                             gctUINT32 Flag,
                             gctSIZE_T *Bytes,
                             gctPHYS_ADDR *Physical,
                             gctPOINTER *Logical);


gceSTATUS
gckOS_FreeNonPagedMemory( gckOS Os,
                         gctPHYS_ADDR Physical,
                         gctPOINTER Logical,
                         gctSIZE_T Bytes);


gceSTATUS
gckOS_RequestReservedMemory(gckOS Os,
                            gctPHYS_ADDR_T Start,
                            gctSIZE_T Size,
                            const char *Name,
                            gctBOOL Requested,
                            gctPOINTER *MemoryHandle);

void
gckOS_ReleaseReservedMemory(gckOS Os, gctPOINTER MemoryHandle);


gceSTATUS
gckOS_RequestReservedMemoryArea( gckOS Os,
                                gctPOINTER MemoryHandle,
                                gctSIZE_T Offset,
                                gctSIZE_T Size,
                                gctPOINTER *MemoryAreaHandle);

void
gckOS_ReleaseReservedMemoryArea(gctPOINTER MemoryAreaHandle);


gceSTATUS
gckOS_GetPageSize( gckOS Os, gctSIZE_T *PageSize);


gceSTATUS
gckOS_GetPhysicalAddress( gckOS Os, gctPOINTER Logical,
                         gctPHYS_ADDR_T *Address);


gceSTATUS
gckOS_GetPhysicalFromHandle( gckOS Os,
                            gctPHYS_ADDR Physical,
                            gctSIZE_T Offset,
                            gctPHYS_ADDR_T *PhysicalAddress);


gceSTATUS
gckOS_UserLogicalToPhysical( gckOS Os, gctPOINTER Logical,
                            gctPHYS_ADDR_T *Address);


gceSTATUS
gckOS_MapPhysical( gckOS Os,
                  gctPHYS_ADDR_T Physical,
                  gctSIZE_T Bytes,
                  gctPOINTER *Logical);


gceSTATUS
gckOS_UnmapPhysical( gckOS Os, gctPOINTER Logical, gctSIZE_T Bytes);


gceSTATUS
gckOS_ReadRegister( gckOS Os, gctUINT32 Address, gctUINT32 *Data);


gceSTATUS
gckOS_ReadRegisterEx( gckOS Os,
                     gckKERNEL Kernel,
                     gctUINT32 Address,
                     gctUINT32 *Data);


gceSTATUS
gckOS_WriteRegister( gckOS Os, gctUINT32 Address, gctUINT32 Data);


gceSTATUS
gckOS_WriteRegisterEx( gckOS Os,
                      gckKERNEL Kernel,
                      gctUINT32 Address,
                      gctUINT32 Data);


gceSTATUS
gckOS_WriteRegisterEx_NoDump( gckOS Os,
                             gckKERNEL Kernel,
                             gctUINT32 Address,
                             gctUINT32 Data);
# 451 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_WriteMemory( gckOS Os, gctPOINTER Address, gctUINT32 Data);



gceSTATUS
gckOS_MapMemory( gckOS Os, gctPHYS_ADDR Physical,
                gctSIZE_T Bytes, gctPOINTER *Logical);


gceSTATUS
gckOS_UnmapMemoryEx( gckOS Os,
                    gctPHYS_ADDR Physical,
                    gctSIZE_T Bytes,
                    gctPOINTER Logical,
                    gctUINT32 PID);


gceSTATUS
gckOS_UnmapMemory( gckOS Os, gctPHYS_ADDR Physical,
                  gctSIZE_T Bytes, gctPOINTER Logical);


gceSTATUS
gckOS_DeleteMutex( gckOS Os, gctPOINTER Mutex);


gceSTATUS
gckOS_AcquireMutex( gckOS Os, gctPOINTER Mutex, gctUINT32 Timeout);


gceSTATUS
gckOS_ReleaseMutex( gckOS Os, gctPOINTER Mutex);


gceSTATUS
gckOS_AtomicExchange( gckOS Os,
                     gctUINT32_PTR Target,
                     gctUINT32 NewValue,
                     gctUINT32_PTR OldValue);


gceSTATUS
gckOS_AtomicExchangePtr( gckOS Os,
                        gctPOINTER *Target,
                        gctPOINTER NewValue,
                        gctPOINTER *OldValue);

gceSTATUS
gckOS_AtomSetMask( gctPOINTER Atom, gctUINT32 Mask);

gceSTATUS
gckOS_AtomClearMask( gctPOINTER Atom, gctUINT32 Mask);

gceSTATUS
gckOS_DumpCallStack( gckOS Os);

gceSTATUS
gckOS_GetProcessNameByPid( gctINT Pid, gctSIZE_T Length, gctUINT8_PTR String);

gceSTATUS
gckOS_QueryCPUFrequency( gckOS Os, gctUINT32 CPUId, gctUINT32 *Frequency);

gceSTATUS
gckOS_TraceGpuMemory( gckOS Os, gctINT32 ProcessID, gctINT64 Delta);
# 533 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_AtomConstruct( gckOS Os, gctPOINTER *Atom);
# 554 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_AtomDestroy( gckOS Os, gctPOINTER Atom);
# 576 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_AtomGet( gckOS Os, gctPOINTER Atom, gctINT32_PTR Value);
# 600 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_AtomSet( gckOS Os, gctPOINTER Atom, gctINT32 Value);
# 622 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_AtomIncrement( gckOS Os, gctPOINTER Atom, gctINT32_PTR Value);
# 644 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_AtomDecrement( gckOS Os, gctPOINTER Atom, gctINT32_PTR Value);


gceSTATUS
gckOS_Delay( gckOS Os, gctUINT32 Delay);


gceSTATUS
gckOS_Udelay( gckOS Os, gctUINT32 Delay);


gceSTATUS
gckOS_GetTicks( gctUINT32_PTR Time);


gceSTATUS
gckOS_TicksAfter( gctUINT32 Time1, gctUINT32 Time2, gctBOOL_PTR IsAfter);


gceSTATUS
gckOS_GetTime( gctUINT64_PTR Time);


gceSTATUS
gckOS_MemoryBarrier( gckOS Os, gctPOINTER Address);


gceSTATUS
gckOS_MapUserPointer( gckOS Os,
                     gctPOINTER Pointer,
                     gctSIZE_T Size,
                     gctPOINTER *KernelPointer);


gceSTATUS
gckOS_UnmapUserPointer( gckOS Os,
                       gctPOINTER Pointer,
                       gctSIZE_T Size,
                       gctPOINTER KernelPointer);
# 706 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_QueryNeedCopy( gckOS Os, gctUINT32 ProcessID, gctBOOL_PTR NeedCopy);
# 733 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_CopyFromUserData( gckOS Os,
                       gctPOINTER KernelPointer,
                       gctPOINTER Pointer,
                       gctSIZE_T Size);
# 763 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_CopyToUserData( gckOS Os,
                     gctPOINTER KernelPointer,
                     gctPOINTER Pointer,
                     gctSIZE_T Size);

gceSTATUS
gckOS_SuspendInterrupt( gckOS Os);

gceSTATUS
gckOS_SuspendInterruptEx( gckOS Os, gceCORE Core);

gceSTATUS
gckOS_ResumeInterrupt( gckOS Os);

gceSTATUS
gckOS_ResumeInterruptEx( gckOS Os, gceCORE Core);


gceSTATUS
gckOS_GetBaseAddress( gckOS Os, gctUINT32_PTR BaseAddress);


gceSTATUS
gckOS_MemCopy( gctPOINTER Destination,
              gctCONST_POINTER Source,
              gctSIZE_T Bytes);


gceSTATUS
gckOS_ZeroMemory( gctPOINTER Memory, gctSIZE_T Bytes);
# 810 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_GetProcessID( gctUINT32_PTR ProcessID);

gceSTATUS
gckOS_GetCurrentProcessID( gctUINT32_PTR ProcessID);
# 831 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_GetThreadID( gctUINT32_PTR ThreadID);






gceSTATUS
gckOS_CreateSignal( gckOS Os, gctBOOL ManualReset, gctSIGNAL *Signal);


gceSTATUS
gckOS_DestroySignal( gckOS Os, gctSIGNAL Signal);


gceSTATUS
gckOS_Signal( gckOS Os, gctSIGNAL Signal, gctBOOL State);


gceSTATUS
gckOS_WaitSignal( gckOS Os, gctSIGNAL Signal,
                 gctBOOL Interruptable, gctUINT32 Wait);
# 864 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_MapSignal( gckOS Os, gctSIGNAL Signal,
                gctHANDLE Process, gctSIGNAL *MappedSignal);


gceSTATUS
gckOS_UnmapSignal( gckOS Os, gctSIGNAL Signal);


gceSTATUS
gckOS_MemoryGetSGT( gckOS Os,
                   gctPHYS_ADDR Physical,
                   gctSIZE_T Offset,
                   gctSIZE_T Bytes,
                   gctPOINTER *SGT);


gceSTATUS
gckOS_MemoryMmap( gckOS Os,
                 gctPHYS_ADDR Physical,
                 gctSIZE_T skipPages,
                 gctSIZE_T numPages,
                 gctPOINTER Vma);


gceSTATUS
gckOS_WrapMemory( gckOS Os,
                 gckKERNEL Kernel,
                 gcsUSER_MEMORY_DESC_PTR Desc,
                 gctSIZE_T *Bytes,
                 gctPHYS_ADDR *Physical,
                 gctBOOL *Contiguous,
                 gctSIZE_T *PageCountCpu);

gceSTATUS
gckOS_GetPolicyID( gckOS Os,
                  gceVIDMEM_TYPE Type,
                  gctUINT32_PTR PolicyID,
                  gctUINT32_PTR AXIConfig);
# 912 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_CreateSyncTimeline( gckOS Os, gceCORE Core, gctHANDLE *Timeline);

gceSTATUS
gckOS_DestroySyncTimeline( gckOS Os, gctHANDLE Timeline);

gceSTATUS
gckOS_CreateNativeFence( gckOS Os,
                        gctHANDLE Timeline,
                        gctSIGNAL Signal,
                        gctINT *FenceFD);

gceSTATUS
gckOS_WaitNativeFence( gckOS Os, gctHANDLE Timeline,
                      gctINT FenceFD, gctUINT32 Timeout);



gceSTATUS
gckOS_CreateUserSignal( gckOS Os, gctBOOL ManualReset, gctINT *SignalID);


gceSTATUS
gckOS_DestroyUserSignal( gckOS Os, gctINT SignalID);


gceSTATUS
gckOS_WaitUserSignal( gckOS Os,
                     gctINT SignalID,
                     gctUINT32 Wait,
                     gceSIGNAL_STATUS *SignalStatus);


gceSTATUS
gckOS_SignalUserSignal( gckOS Os, gctINT SignalID, gctBOOL State);
# 955 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_UserSignal( gckOS Os, gctSIGNAL Signal, gctHANDLE Handle);






gceSTATUS
gckOS_CacheClean(gckOS Os,
                 gctUINT32 ProcessID,
                 gctPHYS_ADDR Handle,
                 gctSIZE_T Offset,
                 gctPOINTER Logical,
                 gctSIZE_T Bytes);

gceSTATUS
gckOS_CacheFlush(gckOS Os,
                 gctUINT32 ProcessID,
                 gctPHYS_ADDR Handle,
                 gctSIZE_T Offset,
                 gctPOINTER Logical,
                 gctSIZE_T Bytes);

gceSTATUS
gckOS_CacheInvalidate(gckOS Os,
                      gctUINT32 ProcessID,
                      gctPHYS_ADDR Handle,
                      gctSIZE_T Offset,
                      gctPOINTER Logical,
                      gctSIZE_T Bytes);

gceSTATUS
gckOS_CPUPhysicalToGPUPhysical( gckOS Os,
                               gctPHYS_ADDR_T CPUPhysical,
                               gctPHYS_ADDR_T *GPUPhysical);

gceSTATUS
gckOS_GPUPhysicalToCPUPhysical( gckOS Os,
                               gctPHYS_ADDR_T GPUPhysical,
                               gctPHYS_ADDR_T *CPUPhysical);

gceSTATUS
gckOS_QueryOption( gckOS Os, gctCONST_STRING Option, gctUINT64 *Value);





void
gckOS_SetDebugLevel( gctUINT32 Level);

void
gckOS_SetDebugZone( gctUINT32 Zone);

void
gckOS_SetDebugLevelZone( gctUINT32 Level, gctUINT32 Zone);

void
gckOS_SetDebugZones( gctUINT32 Zones, gctBOOL Enable);

void
gckOS_SetDebugFile( gctCONST_STRING FileName);

gceSTATUS
gckOS_Broadcast( gckOS Os, gckHARDWARE Hardware, gceBROADCAST Reason);

gceSTATUS
gckOS_BroadcastHurry( gckOS Os, gckHARDWARE Hardware, gctUINT Urgency);

gceSTATUS
gckOS_BroadcastCalibrateSpeed( gckOS Os,
                              gckHARDWARE Hardware,
                              gctUINT Idle,
                              gctUINT Time);
# 1055 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckOS_SetGPUPower( gckOS Os,
                  gckKERNEL Kernel,
                  gctBOOL Clock,
                  gctBOOL Power);

gceSTATUS
gckOS_SetClockState( gckOS Os, gckKERNEL Kernel, gctBOOL Clock);

gceSTATUS
gckOS_GetClockState( gckOS Os, gckKERNEL Kernel, gctBOOL *Clock);

gceSTATUS
gckOS_ResetGPU( gckOS Os, gckKERNEL Kernel);

gceSTATUS
gckOS_PrepareGPUFrequency( gckOS Os, gceCORE Core);

gceSTATUS
gckOS_FinishGPUFrequency( gckOS Os, gceCORE Core);

gceSTATUS
gckOS_QueryGPUFrequency( gckOS Os,
                        gceCORE Core,
                        gctUINT32 *Frequency,
                        gctUINT8 *Scale);

gceSTATUS
gckOS_SetGPUFrequency( gckOS Os, gceCORE Core, gctUINT8 Scale);






gceSTATUS
gckOS_CreateSemaphore( gckOS Os, gctPOINTER *Semaphore);

gceSTATUS
gckOS_CreateSemaphoreEx( gckOS Os, gctPOINTER *Semaphore);







gceSTATUS
gckOS_DestroySemaphore( gckOS Os, gctPOINTER Semaphore);


gceSTATUS
gckOS_AcquireSemaphore( gckOS Os, gctPOINTER Semaphore);


gceSTATUS
gckOS_TryAcquireSemaphore( gckOS Os, gctPOINTER Semaphore);


gceSTATUS
gckOS_ReleaseSemaphore( gckOS Os, gctPOINTER Semaphore);


gceSTATUS
gckOS_ReleaseSemaphoreEx( gckOS Os, gctPOINTER Semaphore);





typedef void (*gctTIMERFUNCTION)(gctPOINTER);


gceSTATUS
gckOS_CreateTimer( gckOS Os,
                  gctTIMERFUNCTION Function,
                  gctPOINTER Data,
                  gctPOINTER *Timer);


gceSTATUS
gckOS_DestroyTimer( gckOS Os, gctPOINTER Timer);


gceSTATUS
gckOS_StartTimer( gckOS Os, gctPOINTER Timer, gctUINT32 Delay);


gceSTATUS
gckOS_StopTimer( gckOS Os, gctPOINTER Timer);





typedef struct _gckHEAP *gckHEAP;


gceSTATUS
gckHEAP_Construct( gckOS Os, gctSIZE_T AllocationSize, gckHEAP *Heap);


gceSTATUS
gckHEAP_Destroy( gckHEAP Heap);


gceSTATUS
gckHEAP_Allocate( gckHEAP Heap, gctSIZE_T Bytes, gctPOINTER *Node);


gceSTATUS
gckHEAP_Free( gckHEAP Heap, gctPOINTER Node);


gceSTATUS
gckHEAP_ProfileStart( gckHEAP Heap);

gceSTATUS
gckHEAP_ProfileEnd( gckHEAP Heap, gctCONST_STRING Title);





struct _gcsHAL_INTERFACE;


gceSTATUS
gckKERNEL_Construct( gckOS Os,
                    gceCORE Core,
                    gctUINT ChipID,
                    gctPOINTER Context,
                    gckDEVICE Device,
                    gckDB SharedDB,
                    gckKERNEL *Kernel);


gceSTATUS
gckKERNEL_Destroy( gckKERNEL Kernel);


gceSTATUS
gckKERNEL_Dispatch( gckKERNEL Kernel,
                   gckDEVICE Device,
                   struct _gcsHAL_INTERFACE *Interface);


gceSTATUS
gckKERNEL_QueryDatabase( gckKERNEL Kernel,
                        gctUINT32 ProcessID,
                        gcsHAL_INTERFACE *Interface);


gceSTATUS
gckKERNEL_QueryVideoMemory( gckKERNEL Kernel,
                           struct _gcsHAL_INTERFACE *Interface);


gceSTATUS
gckKERNEL_GetVideoMemoryPool( gckKERNEL Kernel, gcePOOL Pool,
                             gckVIDMEM *VideoMemory);


gceSTATUS
gckKERNEL_MapVideoMemory( gckKERNEL Kernel,
                         gctBOOL InUserSpace,
                         gcePOOL Pool,
                         gctPHYS_ADDR Physical,
                         gctSIZE_T Offset,
                         gctSIZE_T Bytes,
                         gctPOINTER *Logical);


gceSTATUS
gckKERNEL_UnmapVideoMemory( gckKERNEL Kernel,
                           gcePOOL Pool,
                           gctPHYS_ADDR Physical,
                           gctPOINTER Logical,
                           gctUINT32 Pid,
                           gctSIZE_T Bytes);


gceSTATUS
gckKERNEL_MapMemory( gckKERNEL Kernel,
                    gctPHYS_ADDR Physical,
                    gctSIZE_T Bytes,
                    gctPOINTER *Logical);


gceSTATUS
gckKERNEL_UnmapMemory( gckKERNEL Kernel,
                      gctPHYS_ADDR Physical,
                      gctSIZE_T Bytes,
                      gctPOINTER Logical,
                      gctUINT32 ProcessID);

gceSTATUS
gckKERNEL_DestroyProcessReservedUserMap( gckKERNEL Kernel, gctUINT32 Pid);


gceSTATUS
gckKERNEL_Notify( gckKERNEL Kernel, gceNOTIFY Notifcation);
# 1281 "./drivers/mxc/gpu-viv/hal/kernel/inc/gc_hal.h"
gceSTATUS
gckKERNEL_Recovery( gckKERNEL Kernel);


gceSTATUS
gckKERNEL_OpenUserData( gckKERNEL Kernel,
                       gctBOOL NeedCopy,
                       gctPOINTER StaticStorage,
                       gctPOINTER UserPointer,
                       gctSIZE_T Size,
                       gctPOINTER *KernelPointer);


gceSTATUS
gckKERNEL_CloseUserData( gckKERNEL Kernel,
                        gctBOOL NeedCopy,
                        gctBOOL FlushData,
                        gctPOINTER UserPointer,
                        gctSIZE_T Size,
                        gctPOINTER *KernelPointer);


gceSTATUS
gckOS_QueryKernel( gckKERNEL Kernel, gctINT index, gckKERNEL *KernelOut);

gceSTATUS
gckDVFS_Construct( gckHARDWARE Hardware, gckDVFS *Frequency);

gceSTATUS
gckDVFS_Destroy( gckDVFS Dvfs);

gceSTATUS
gckDVFS_Start( gckDVFS Dvfs);

gceSTATUS
gckDVFS_Stop( gckDVFS Dvfs);






gceSTATUS
gckHARDWARE_Construct( gckOS Os,
                      gckKERNEL Kernel,
                      gckHARDWARE *Hardware);


gceSTATUS
gckHARDWARE_PostConstruct( gckHARDWARE Hardware);


gceSTATUS
gckHARDWARE_PreDestroy( gckHARDWARE Hardware);


gceSTATUS
gckHARDWARE_Destroy( gckHARDWARE Hardware);


gceSTATUS
gckHARDWARE_GetType( gckHARDWARE Hardware, gceHARDWARE_TYPE *Type);


gceSTATUS
gckHARDWARE_QuerySystemMemory( gckHARDWARE Hardware,
                              gctSIZE_T *SystemSize,
                              gctUINT32 *SystemBaseAddress);


gceSTATUS
gckHARDWARE_BuildVirtualAddress( gckHARDWARE Hardware,
                                gctUINT32 Index,
                                gctUINT32 Offset,
                                gctUINT32 *Address);


gceSTATUS
gckHARDWARE_QueryCommandBuffer( gckHARDWARE Hardware,
                               gceENGINE Engine,
                               gctUINT32 *Alignment,
                               gctUINT32 *ReservedHead,
                               gctUINT32 *ReservedTail);


gceSTATUS
gckHARDWARE_PipeSelect( gckHARDWARE Hardware,
                       gctPOINTER Logical,
                       gcePIPE_SELECT Pipe,
                       gctUINT32 *Bytes);


gceSTATUS
gckHARDWARE_QueryMemory( gckHARDWARE Hardware,
                        gctSIZE_T *InternalSize,
                        gctADDRESS *InternalBaseAddress,
                        gctUINT32 *InternalAlignment,
                        gctSIZE_T *ExternalSize,
                        gctADDRESS *ExternalBaseAddress,
                        gctUINT32 *ExternalAlignment,
                        gctUINT32 *HorizontalTileSize,
                        gctUINT32 *VerticalTileSize);


gceSTATUS
gckHARDWARE_QueryChipIdentity( gckHARDWARE Hardware,
                              gcsHAL_QUERY_CHIP_IDENTITY_PTR Identity);

gceSTATUS
gckHARDWARE_QueryChipOptions( gckHARDWARE Hardware,
                             gcsHAL_QUERY_CHIP_OPTIONS_PTR Options);


gceSTATUS
gckHARDWARE_SplitMemory( gckHARDWARE Hardware,
                        gctUINT32 Address,
                        gcePOOL *Pool,
                        gctUINT32 *Offset);


gceSTATUS
gckHARDWARE_UpdateQueueTail( gckHARDWARE Hardware,
                            gctPOINTER Logical,
                            gctUINT32 Offset);


gceSTATUS
gckHARDWARE_Interrupt( gckHARDWARE Hardware);

gceSTATUS
gckHARDWARE_Notify( gckHARDWARE Hardware);


gceSTATUS
gckHARDWARE_SetMMU( gckHARDWARE Hardware, gckMMU Mmu);


gceSTATUS
gckHARDWARE_FlushMMU( gckHARDWARE Hardware,
                     gctPOINTER Logical,
                     gctADDRESS Address,
                     gctUINT32 SubsequentBytes,
                     gctUINT32 *Bytes);

gceSTATUS
gckHARDWARE_FlushAsyncMMU( gckHARDWARE Hardware,
                          gctPOINTER Logical,
                          gctUINT32 *Bytes);

gceSTATUS
gckHARDWARE_FlushMcfeMMU( gckHARDWARE Hardware,
                         gctPOINTER Logical,
                         gctUINT32 *Bytes);


gceSTATUS
gckHARDWARE_GetIdle( gckHARDWARE Hardware, gctBOOL Wait, gctUINT32 *Data);


gceSTATUS
gckHARDWARE_Flush( gckHARDWARE Hardware,
                  gceKERNEL_FLUSH Flush,
                  gctPOINTER Logical,
                  gctUINT32 *Bytes);


gceSTATUS
gckHARDWARE_SetFastClear( gckHARDWARE Hardware,
                         gctINT Enable,
                         gctINT Compression);

gceSTATUS
gckHARDWARE_ReadInterrupt( gckHARDWARE Hardware, gctUINT32_PTR IDs);




gceSTATUS
gckHARDWARE_StartTimerReset( gckHARDWARE Hardware);


gceSTATUS
gckHARDWARE_SetPowerState( gckHARDWARE Hardware, gceCHIPPOWERSTATE State);

gceSTATUS
gckHARDWARE_QueryPowerStateUnlocked( gckHARDWARE Hardware, gceCHIPPOWERSTATE *State);

gceSTATUS
gckHARDWARE_QueryPowerState( gckHARDWARE Hardware, gceCHIPPOWERSTATE *State);

gceSTATUS
gckHARDWARE_EnablePowerManagement( gckHARDWARE Hardware, gctBOOL Enable);

gceSTATUS
gckHARDWARE_QueryPowerManagement( gckHARDWARE Hardware, gctBOOL *Enable);

gceSTATUS
gckHARDWARE_SetGpuProfiler( gckHARDWARE Hardware, gctBOOL GpuProfiler);


gceSTATUS
gckHARDWARE_SetFscaleValue( gckHARDWARE Hardware,
                           gctUINT32 FscaleValue,
                           gctUINT32 ShaderFscaleValue);

gceSTATUS
gckHARDWARE_GetFscaleValue( gckHARDWARE Hardware,
                           gctUINT *FscaleValue,
                           gctUINT *MinFscaleValue,
                           gctUINT *MaxFscaleValue);

gceSTATUS
gckHARDWARE_SetMinFscaleValue( gckHARDWARE Hardware, gctUINT MinFscaleValue);


gceSTATUS
gckHARDWARE_InitializeHardware( gckHARDWARE Hardware);

gceSTATUS
gckHARDWARE_Reset( gckHARDWARE Hardware);


gceSTATUS
gckHARDWARE_IsFeatureAvailable( gckHARDWARE Hardware, gceFEATURE Feature);

gceSTATUS
gckHARDWARE_DumpMMUException( gckHARDWARE Hardware);

gceSTATUS
gckHARDWARE_DumpGPUState( gckHARDWARE Hardware);

gceSTATUS
gckHARDWARE_InitDVFS( gckHARDWARE Hardware);

gceSTATUS
gckHARDWARE_QueryLoad( gckHARDWARE Hardware, gctUINT32 *Load);

gceSTATUS
gckHARDWARE_SetDVFSPeroid( gckHARDWARE Hardware, gctUINT32 Frequency);

gceSTATUS
gckHARDWARE_QueryStateTimer( gckHARDWARE Hardware,
                            gctUINT64_PTR On,
                            gctUINT64_PTR Off,
                            gctUINT64_PTR Idle,
                            gctUINT64_PTR Suspend);

gceSTATUS
gckHARDWARE_Fence( gckHARDWARE Hardware,
                  gceENGINE Engine,
                  gctPOINTER Logical,
                  gctADDRESS FenceAddress,
                  gctUINT64 FenceData,
                  gctUINT32 *Bytes);






typedef struct _gckINTERRUPT *gckINTERRUPT;

typedef gceSTATUS (*gctINTERRUPT_HANDLER)( gckKERNEL Kernel);

gceSTATUS
gckINTERRUPT_Construct( gckKERNEL Kernel, gckINTERRUPT *Interrupt);

gceSTATUS
gckINTERRUPT_Destroy( gckINTERRUPT Interrupt);

gceSTATUS
gckINTERRUPT_SetHandler( gckINTERRUPT Interrupt,
                        gctINT32_PTR Id,
                        gctINTERRUPT_HANDLER Handler);

gceSTATUS
gckINTERRUPT_Notify( gckINTERRUPT Interrupt, gctBOOL Valid);







gceSTATUS
gckMMU_Construct( gckKERNEL Kernel, gctSIZE_T MmuSize, gckMMU *Mmu);


gceSTATUS
gckMMU_Destroy( gckMMU Mmu);


gceSTATUS
gckMMU_AllocatePages( gckMMU Mmu,
                     gctSIZE_T PageCount,
                     gcePAGE_TYPE PageType,
                     gctPOINTER *PageTable,
                     gctADDRESS *Address);

gceSTATUS
gckMMU_AllocatePagesEx( gckMMU Mmu,
                       gctSIZE_T PageCount,
                       gceVIDMEM_TYPE Type,
                       gcePAGE_TYPE PageType,
                       gctBOOL LowVA,
                       gctBOOL Secure,
                       gctPOINTER *PageTable,
                       gctADDRESS *Address);


gceSTATUS
gckMMU_FreePages( gckMMU Mmu,
                 gctBOOL Secure,
                 gcePAGE_TYPE PageType,
                 gctBOOL LowVA,
                 gctADDRESS Address,
                 gctPOINTER PageTable,
                 gctSIZE_T PageCount);


gceSTATUS
gckMMU_SetPage( gckMMU Mmu,
               gctPHYS_ADDR_T PageAddress,
               gcePAGE_TYPE PageType,
               gctBOOL LowVA,
               gctBOOL Writable,
               gctUINT32 *PageEntry);

gceSTATUS
gckMMU_Flush( gckMMU Mmu, gceVIDMEM_TYPE Type);

gceSTATUS
gckMMU_DumpPageTableEntry( gckMMU Mmu, gceAREA_TYPE AreaType, gctADDRESS Address);

gceSTATUS
gckMMU_FillFlatMapping( gckMMU Mmu,
                       gctUINT64 PhysBase,
                       gctSIZE_T Size,
                       gctBOOL Reserved,
                       gctBOOL AbleToShift,
                       gctADDRESS *GpuBaseAddress);

gceSTATUS
gckMMU_IsFlatMapped( gckMMU Mmu,
                    gctUINT64 Physical,
                    gctSIZE_T Bytes,
                    gctBOOL *In,
                    gctADDRESS *Address);

gceSTATUS
gckMMU_GetAreaType( gckMMU Mmu, gctADDRESS GpuAddress, gceAREA_TYPE *AreaType);

gceSTATUS
gckHARDWARE_QueryContextProfile( gckHARDWARE Hardware,
                                gctBOOL Reset,
                                gcsPROFILER_COUNTERS_PART1 *Counters_part1,
                                gcsPROFILER_COUNTERS_PART2 *Counters_part2);

gceSTATUS
gckHARDWARE_UpdateContextProfile( gckHARDWARE Hardware);

gceSTATUS
gckHARDWARE_InitProfiler( gckHARDWARE Hardware);

gceSTATUS
gckOS_DetectProcessByName( gctCONST_POINTER Name);

void
gckOS_DumpParam(void);
# 61 "drivers/mxc/gpu-viv/hal/security_v1/gc_hal_ta.c" 2
# 78 "drivers/mxc/gpu-viv/hal/security_v1/gc_hal_ta.c"
gcTA_MMU SharedMmu = ((void *)0);







int
gcTA_Construct(
    gctaOS Os,
    gceCORE Core,
    gcTA *TA
    )
{
    gceSTATUS status;
    gctPOINTER pointer;
    gcTA ta = ((void *)0);

    do { ; ; } while (0);
    do { if (!(TA != ((void *)0))) { ; ; do { ; ; } while (0); return gcvSTATUS_INVALID_ARGUMENT; } } while (0);


    do { status = gctaOS_Allocate(sizeof(struct _gcTA), &pointer); if (((status) < 0)) { do { } while (0); ; goto OnError; } } while (0);

    gctaOS_ZeroMemory(pointer, sizeof(struct _gcTA));

    ta = (gcTA)pointer;

    ta->os = Os;
    ta->core = Core;

    do { status = gctaHARDWARE_Construct(ta, &ta->hardware); if (((status) < 0)) { do { } while (0); ; goto OnError; } } while (0);

    if (gctaHARDWARE_IsFeatureAvailable(ta->hardware, gcvFEATURE_SECURITY)) {
        if (SharedMmu == ((void *)0)) {
            do { status = gctaMMU_Construct(ta, &ta->mmu); if (((status) < 0)) { do { } while (0); ; goto OnError; } } while (0);


            SharedMmu = ta->mmu;
            ta->destoryMmu = 1;
        } else {
            ta->mmu = SharedMmu;
            ta->destoryMmu = 0;
        }

        do { status = gctaHARDWARE_PrepareFunctions(ta->hardware); if (((status) < 0)) { do { } while (0); ; goto OnError; } } while (0);
    }

    *TA = ta;

    do { ; ; } while (0);
    return 0;

OnError:
    if (ta) {
        if (ta->mmu && ta->destoryMmu) {
            gctaMMU_Destory(ta->mmu);
        }

        if (ta->hardware) {
            gctaHARDWARE_Destroy(ta->hardware);
        }

        gctaOS_Free(ta);
    }
    do { ; ; } while (0);
    return status;
}







int
gcTA_Destroy(
    gcTA TA
    )
{
    if (TA->mmu && TA->destoryMmu) {
        gctaMMU_Destory(TA->mmu);
    }

    if (TA->hardware) {
        gctaHARDWARE_Destroy(TA->hardware);
    }

    gctaOS_Free(TA);


    return 0;
}






gceSTATUS
gcTA_MapMemory(
    gcTA TA,
    gctUINT32 *PhysicalArray,
    gctPHYS_ADDR_T Physical,
    gctUINT32 PageCount,
    gctUINT32 *GPUAddress
    )
{
    gceSTATUS status;
    gcTA_MMU mmu;
    gctUINT32 pageCount = PageCount;
    gctUINT32 i;
    gctUINT32 gpuAddress = *GPUAddress;
    gctBOOL mtlbSecure = 0;
    gctBOOL physicalSecure = 0;

    mmu = TA->mmu;


    for (i = 0; i < pageCount; i++) {
        gctUINT32 physical;
        gctUINT32_PTR entry;

        if (PhysicalArray)
            physical = PhysicalArray[i];
        else
            physical = (gctUINT32)Physical + 4096 * i;

        do { status = gctaMMU_GetPageEntry(mmu, gpuAddress, ((void *)0), &entry, &mtlbSecure); if (((status) < 0)) { do { } while (0); ; goto OnError; } } while (0);

        status = gctaOS_IsPhysicalSecure(TA->os, physical, &physicalSecure);

        if (((status) == gcvSTATUS_OK) && physicalSecure != mtlbSecure) {
            do { status = gcvSTATUS_NOT_SUPPORTED; if (((status) < 0)) { do { } while (0); ; goto OnError; } } while (0);
        }

        gctaMMU_SetPage(mmu, physical, entry);

        gpuAddress += 4096;
    }

    return gcvSTATUS_OK;

OnError:
    return status;
}

gceSTATUS
gcTA_UnmapMemory(
    gcTA TA,
    gctUINT32 GPUAddress,
    gctUINT32 PageCount
    )
{
    gceSTATUS status;

    do { status = gctaMMU_FreePages(TA->mmu, GPUAddress, PageCount); if (((status) < 0)) { do { } while (0); ; goto OnError; } } while (0);

    return gcvSTATUS_OK;

OnError:
    return status;
}

gceSTATUS
gcTA_StartCommand(
    gcTA TA,
    gctUINT32 Address,
    gctUINT32 Bytes
    )
{
    gctaHARDWARE_Execute(TA, Address, Bytes);
    return gcvSTATUS_OK;
}

int
gcTA_Dispatch(
    gcTA TA,
    gcsTA_INTERFACE *Interface
    )
{
    int command = Interface->command;

    gceSTATUS status = gcvSTATUS_OK;

    switch (command) {
    case KERNEL_START_COMMAND:



        do { status = gctaHARDWARE_SetMMU(TA->hardware, TA->mmu->mtlbLogical); if (((status) < 0)) { do { } while (0); ; goto OnError; } } while (0);

        do { status = gcTA_StartCommand( TA, (gctUINT32)Interface->u.StartCommand.address, Interface->u.StartCommand.bytes ); if (((status) < 0)) { do { } while (0); ; goto OnError; } } while (0)



              ;
        break;

    case KERNEL_MAP_MEMORY:
        do { status = gcTA_MapMemory( TA, Interface->u.MapMemory.physicals, Interface->u.MapMemory.physical, Interface->u.MapMemory.pageCount, (gctUINT32 *)&Interface->u.MapMemory.gpuAddress ); if (((status) < 0)) { do { } while (0); ; goto OnError; } } while (0)





              ;

        break;

    case KERNEL_UNMAP_MEMORY:
        status = gcTA_UnmapMemory(
            TA,
            (gctUINT32)Interface->u.UnmapMemory.gpuAddress,
            Interface->u.UnmapMemory.pageCount
            );
        break;

    case KERNEL_DUMP_MMU_EXCEPTION:
        status = gctaHARDWARE_DumpMMUException(TA->hardware);
        break;

    case KERNEL_HANDLE_MMU_EXCEPTION:
        status = gctaHARDWARE_HandleMMUException(
            TA->hardware,
            Interface->u.HandleMMUException.mmuStatus,
            Interface->u.HandleMMUException.physical,
            (gctUINT32)Interface->u.HandleMMUException.gpuAddress
            );
        break;

    case KERNEL_READ_MMU_EXCEPTION:
        status = gctaHARDWARE_ReadMMUException(
            TA->hardware,
            &Interface->u.ReadMMUException.mmuStatus,
            &Interface->u.ReadMMUException.mmuException
            );
        break;

    default:
        ;

        status = gcvSTATUS_INVALID_ARGUMENT;
        break;
    }

OnError:
    Interface->result = status;

    return 0;
}
