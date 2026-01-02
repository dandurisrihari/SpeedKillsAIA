# 0 "/home/sri/hailort-drivers/linux/pcie/../utils/logs.c"
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
# 1 "/home/sri/hailort-drivers/linux/pcie/../utils/logs.c"





# 1 "/home/sri/hailort-drivers/linux/pcie/../utils/logs.h" 1
# 9 "/home/sri/hailort-drivers/linux/pcie/../utils/logs.h"
# 1 "/usr/src/linux-headers-6.12.47+rpt-common-rpi/include/linux/kern_levels.h" 1
# 10 "/home/sri/hailort-drivers/linux/pcie/../utils/logs.h" 2



extern int o_dbg;
# 7 "/home/sri/hailort-drivers/linux/pcie/../utils/logs.c" 2

int o_dbg = 5;
