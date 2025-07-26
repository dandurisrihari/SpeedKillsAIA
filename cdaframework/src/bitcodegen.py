#!/usr/bin/env python3
"""
Linux Kernel Module Builder with Clang and LLVM Bitcode Generation

This script provides a clang wrapper that replaces GCC-specific flags
and generates both .bc and .ll bitcode files during kernel module compilation.

Usage:
    python3 bitcodegen.py M=drivers/mxc/gpu-viv modules
    python3 bitcodegen.py clean
"""

import os
import sys
import subprocess
import shutil
import tempfile
import argparse
from pathlib import Path
import re
import glob

class ClangWrapper:
    def __init__(self, bitcode_dir="bitcode_output"):
        self.bitcode_dir = Path(bitcode_dir)
        self.bitcode_dir.mkdir(exist_ok=True)
        
        # Track .bc files for linking
        self.bc_files_created = []
        
        # ONLY GCC-specific compiler flags that clang doesn't understand
        # DO NOT remove program-specific defines, includes, or logic flags
        self.gcc_only_flags = {
            # GCC-specific optimization flags
            '-fconserve-stack',
            '-femit-struct-debug-baseonly',
            '-fno-delete-null-pointer-checks',
            '-fno-allow-store-data-races',
            '-fno-ipa-sra',
            '-funit-at-a-time',
            '-fno-caller-saves',
            '-fno-reorder-blocks',
            '-fno-reorder-blocks-and-partition',
            '-fno-prefetch-loop-arrays',
            '-fno-tree-vrp',
            '-fno-partial-inlining',
            '-fno-tree-pre',
            '-fno-tree-switch-conversion',
            '-fno-tree-loop-im',
            '-fno-tree-loop-ivcanon',
            '-fno-merge-all-constants',
            '-fmerge-constants',
            '-fno-gcse',
            '-fno-jump-tables',
            '-fno-toplevel-reorder',
            '-fno-tree-ch',
            '-fno-guess-branch-probability',
            '-fno-cprop-registers',
            '-fno-crossjumping',
            '-fno-cse-follow-jumps',
            '-fno-cse-skip-blocks',
            '-fno-expensive-optimizations',
            '-fno-gcse-lm',
            '-fno-hoist-adjacent-loads',
            '-fno-modulo-sched',
            '-fno-move-loop-invariants',
            '-fno-peephole2',
            '-fno-regmove',
            '-fno-rename-registers',
            '-fno-rerun-cse-after-loop',
            '-fno-schedule-insns',
            '-fno-schedule-insns2',
            '-fno-thread-jumps',
            '-fno-tree-dce',
            '-fno-tree-dominator-opts',
            '-fno-tree-forwprop',
            '-fno-tree-loop-optimize',
            '-fno-tree-parallelize-loops',
            '-fno-tree-phiprop',
            '-fno-tree-reassoc',
            '-fno-tree-sink',
            '-fno-tree-sra',
            '-fno-tree-ter',
            '-fno-web',
            '-fno-var-tracking',
            '-fno-var-tracking-assignments',
            
            # GCC-specific debug flags
            '-gz=zlib',
            
            # GCC-specific architecture flags
            '-mindirect-branch=thunk-extern',
            '-mindirect-branch-register',
            '-mno-fp-ret-in-387',
            '-mpreferred-stack-boundary=3',
            '-mskip-rax-setup',
            '-mno-80387',
            '-maccumulate-outgoing-args',
            '-mregparm=3',
            '-freg-struct-return',
            
            # GCC-specific warning flags that don't exist in clang
            '-Wno-frame-address',
            '-Wno-format-truncation',
            '-Wno-format-overflow',
            '-Wno-int-in-bool-context',
            '-Wno-attribute-alias',
            '-Wno-stringop-truncation',
            '-Wno-zero-length-bounds',
            '-Wno-stringop-overflow',
            '-Wno-restrict',
            '-Wno-maybe-uninitialized',
            '-Wno-unused-but-set-variable',
            '-Wno-unused-but-set-parameter',
            '-Wno-cast-function-type',
            '-Wno-packed-not-aligned',
            '-Wno-missing-attributes',
            '-Wno-alloc-size-larger-than',
            '-Wno-stringop-overread',
            '-Wno-dangling-pointer',
            
            # GCC-specific stack protection variants
            '-fstack-protector-strong',
            '-fstack-protector-all',
        }
        
        # GCC flag prefixes that should be removed (with their values)
        self.gcc_flag_prefixes = {
            '-mtune=',      # GCC-specific CPU tuning
            '-falign-',     # GCC-specific alignment flags
        }
        
        # Warning flags that need conversion from GCC format to clang format
        self.warning_conversions = {
            # Convert GCC warning levels to clang equivalents
            '-Wimplicit-fallthrough=5': '-Wno-implicit-fallthrough',
            '-Wimplicit-fallthrough=4': '-Wno-implicit-fallthrough',
            '-Wimplicit-fallthrough=3': '-Wno-implicit-fallthrough',
            '-Wimplicit-fallthrough=2': '-Wno-implicit-fallthrough',
            '-Wimplicit-fallthrough=1': '-Wno-implicit-fallthrough',
            '-Wformat-overflow=2': '-Wno-format-overflow',
            '-Wformat-truncation=2': '-Wno-format-truncation',
            '-Wstringop-overflow=4': '-Wno-stringop-overflow',
            '-Warray-bounds=1': '-Wno-array-bounds',
            '-Wrestrict': '-Wno-restrict',
        }

    def is_gcc_only_flag(self, flag):
        """Check if a flag is GCC-specific and should be removed for clang."""
        # Direct match for known GCC-only flags
        if flag in self.gcc_only_flags:
            return True
            
        # Check prefixes (like -mtune=, -falign-=)
        for prefix in self.gcc_flag_prefixes:
            if flag.startswith(prefix):
                return True
                
        # Check for GCC-specific warning flags with levels
        if '=' in flag and flag.startswith('-W'):
            # Handle warning flags like -Wimplicit-fallthrough=5
            base_flag = flag.split('=')[0]
            gcc_level_warnings = {
                '-Wimplicit-fallthrough',
                '-Wformat-overflow', 
                '-Wformat-truncation',
                '-Wstringop-overflow', 
                '-Warray-bounds'
            }
            if base_flag in gcc_level_warnings:
                return True
        
        return False

    def convert_warning_flag(self, flag):
        """Convert GCC warning flags to clang equivalents."""
        # Direct conversion
        if flag in self.warning_conversions:
            return self.warning_conversions[flag]
        
        # Handle pattern-based conversions for warning flags with levels
        if '=' in flag and flag.startswith('-W'):
            base_flag = flag.split('=')[0]
            warning_name = base_flag[2:]  # Remove '-W'
            
            # For GCC warning levels, convert to clang disable flag for kernel builds
            gcc_level_warnings = {
                'implicit-fallthrough', 'format-overflow', 'format-truncation',
                'stringop-overflow', 'array-bounds', 'restrict'
            }
            
            if warning_name in gcc_level_warnings:
                return f'-Wno-{warning_name}'
        
        return flag  # Return unchanged if no conversion needed

    def filter_and_convert_flags(self, args):
        """Filter out ONLY GCC-specific compiler flags, keep everything else."""
        filtered_args = []
        
        for arg in args:
            # Skip ONLY GCC-specific flags that clang doesn't understand
            if self.is_gcc_only_flag(arg):
                continue
            
            # Convert warning flags if needed
            converted_arg = self.convert_warning_flag(arg)
            if converted_arg != arg:
                filtered_args.append(converted_arg)
                continue
            
            # For architecture flags, only remove truly problematic ones
            if arg.startswith('-m'):
                # Remove only known problematic GCC-specific flags
                problematic_m_flags = {
                    '-mno-fp-ret-in-387',
                    '-mpreferred-stack-boundary=3',
                    '-mskip-rax-setup',
                    '-mno-80387',
                    '-maccumulate-outgoing-args',
                    '-mregparm=3'
                }
                if arg in problematic_m_flags or arg.startswith('-mtune='):
                    continue
                # Keep all other -m flags (including -march=, -mcmodel=, etc.)
                filtered_args.append(arg)
                continue
            
            # Keep ALL other flags (includes, defines, standards, optimizations, etc.)
            filtered_args.append(arg)
            
        return filtered_args

    def add_clang_specific_flags(self, args):
        """Add clang-specific flags to improve compatibility."""
        clang_flags = [
            '-Wno-unknown-warning-option',
            '-Wno-unused-command-line-argument',
            '-Wno-gnu',  # Suppress GNU extension warnings for kernel code
            '-Wno-tautological-compare',
            '-Wno-address-of-packed-member',  # Common in kernel code
        ]
        
        # Add flags that aren't already present
        for flag in clang_flags:
            if flag not in args:
                args.insert(0, flag)
        
        return args

    def filter_flags_for_bitcode(self, args):
        """Filter flags specifically for bitcode generation - remove output files, linker flags, and source files."""
        filtered = []
        skip_next = False
        
        for i, arg in enumerate(args):
            if skip_next:
                skip_next = False
                continue
                
            # Skip -o and its argument (the output file)
            if arg == '-o':
                skip_next = True  # Skip the next argument (output file)
                continue
                
            # Skip ALL source and object files since we'll specify the exact source file
            if arg.endswith('.c') or arg.endswith('.o') or arg.endswith('.s') or arg.endswith('.S'):
                continue
                
            # Skip linker-specific flags
            if arg.startswith('-Wl,'):
                continue
                
            # Skip -c flag since we'll add it with -emit-llvm
            if arg == '-c':
                continue
                
            # Keep everything else (includes, defines, warning flags, etc.)
            filtered.append(arg)
            
        return filtered

    def generate_bitcode(self, source_file, output_base, original_args):
        """Generate both .bc and .ll files from source."""
        if not source_file.endswith('.c'):
            return
            
        source_path = Path(source_file)
        if not source_path.exists():
            return
            
        # Create output paths
        bc_file = self.bitcode_dir / f"{output_base}.bc"
        ll_file = self.bitcode_dir / f"{output_base}.ll"
        
        # Filter original args for bitcode generation
        # Remove output files, linker flags, and ALL source files
        filtered_args = self.filter_flags_for_bitcode(original_args)
        
        # Prepare clang command for bitcode generation
        clang_cmd = ['clang']
        clang_cmd.extend(['-emit-llvm', '-c'])  # -c is handled here
        clang_cmd.extend(filtered_args)
        clang_cmd.extend(['-o', str(bc_file)])  # Output file
        clang_cmd.append(source_file)  # Single source file
        
        try:
            # Generate .bc file
            print(f"Generating bitcode: {bc_file}")
            result = subprocess.run(clang_cmd, check=True, capture_output=True, text=True)
            
            # Track this .bc file for potential linking
            self.bc_files_created.append(bc_file)
            
            # Generate .ll file from .bc
            print(f"Generating LLVM IR: {ll_file}")
            subprocess.run(['llvm-dis', str(bc_file), '-o', str(ll_file)], 
                         check=True, capture_output=True)
                         
        except subprocess.CalledProcessError as e:
            print(f"Warning: Failed to generate bitcode for {source_file}")
            if e.stderr:
                print(f"Error: {e.stderr}")
            if os.environ.get('DEBUG_CLANG_WRAPPER'):
                print(f"Bitcode command was: {' '.join(clang_cmd)}", file=sys.stderr)
        except FileNotFoundError:
            print("Warning: llvm-dis not found, skipping .ll generation")

    def detect_module_linking(self, args):
        """Detect if this is a module linking step that creates a .ko file."""
        # Look for .ko output file
        ko_files = []
        object_files = []
        
        skip_next = False
        for i, arg in enumerate(args):
            if skip_next:
                skip_next = False
                continue
                
            if arg == '-o':
                if i + 1 < len(args) and args[i + 1].endswith('.ko'):
                    ko_files.append(args[i + 1])
                skip_next = True
            elif arg.endswith('.o'):
                object_files.append(arg)
        
        return ko_files, object_files

    def wrap_clang(self, args):
        """Main clang wrapper function."""
        # Always log to a file for debugging
        debug_file = Path('/tmp/clang_wrapper_debug.log')
        with open(debug_file, 'a') as f:
            f.write(f"WRAPPER CALLED: {' '.join(args)}\n")
        
        # Also log to stderr if debug is enabled
        if os.environ.get('DEBUG_CLANG_WRAPPER'):
            print(f"WRAPPER DEBUG: Original args: {args}", file=sys.stderr)
            
        if len(args) < 1:
            return subprocess.run(['clang'] + args).returncode
        
        # Check if this is module linking (creates .ko files)
        ko_files, object_files = self.detect_module_linking(args)
        if ko_files and os.environ.get('DEBUG_CLANG_WRAPPER'):
            print(f"WRAPPER DEBUG: Detected .ko linking: {ko_files} from {object_files}", file=sys.stderr)
        
        # Filter and convert arguments - ONLY remove GCC-specific flags
        filtered_args = self.filter_and_convert_flags(args)
        
        # Debug: log what was filtered
        if os.environ.get('DEBUG_CLANG_WRAPPER'):
            removed_args = set(args) - set(filtered_args)
            if removed_args:
                print(f"WRAPPER DEBUG: Removed GCC-only flags: {removed_args}", file=sys.stderr)
        
        # Add clang-specific compatibility flags
        filtered_args = self.add_clang_specific_flags(filtered_args)
        
        # Check if this is a compilation step (not linking)
        source_files = [arg for arg in args if arg.endswith('.c')]
        is_compile = '-c' in args and source_files
        
        # Generate bitcode for compilation steps
        if is_compile and source_files:
            for source in source_files:
                output_base = Path(source).stem
                # Pass the filtered args (after GCC flag removal) to bitcode generation
                self.generate_bitcode(source, output_base, filtered_args)
        
        # Execute the actual clang command
        clang_cmd = ['clang'] + filtered_args
        
        # Log final command
        with open(debug_file, 'a') as f:
            f.write(f"EXECUTING: {' '.join(clang_cmd)}\n")
        
        if os.environ.get('DEBUG_CLANG_WRAPPER'):
            print(f"WRAPPER DEBUG: Executing: {' '.join(clang_cmd)}", file=sys.stderr)
        
        # Execute the command
        result = subprocess.run(clang_cmd)
            
        return result.returncode


class KernelModuleBuilder:
    def __init__(self):
        self.wrapper = ClangWrapper()
        self.script_dir = Path(__file__).parent.absolute()
        self.wrapper_script = self.script_dir / "clang_wrapper.sh"
        
    def find_ko_files(self, search_dirs):
        """Find all .ko files that were built."""
        ko_files = []
        for search_dir in search_dirs:
            ko_pattern = os.path.join(search_dir, "**/*.ko")
            ko_files.extend(glob.glob(ko_pattern, recursive=True))
        return ko_files

    def generate_module_bitcode_from_ko(self, ko_file):
        """Generate module bitcode by finding all related .bc files."""
        try:
            ko_path = Path(ko_file)
            module_name = ko_path.stem
            
            # Find all .bc files in the bitcode directory (excluding existing module files)
            all_bc_files = list(self.wrapper.bitcode_dir.glob("*.bc"))
            bc_files = [f for f in all_bc_files if not f.name.endswith('_module.bc')]
            
            if not bc_files:
                print(f"No .bc files found for module {module_name}")
                return
            
            # Create output paths for the module
            module_bc_file = self.wrapper.bitcode_dir / f"{module_name}.bc"
            module_ll_file = self.wrapper.bitcode_dir / f"{module_name}.ll"
            
            # Use llvm-link to combine all .bc files
            llvm_link_cmd = ['llvm-link']
            llvm_link_cmd.extend([str(bc) for bc in bc_files])
            llvm_link_cmd.extend(['-o', str(module_bc_file)])
            
            print(f"\nLinking module bitcode: {module_bc_file}")
            print(f"  Linking {len(bc_files)} .bc files: {[bc.name for bc in bc_files]}")
            
            result = subprocess.run(llvm_link_cmd, check=True, capture_output=True, text=True)
            
            # Generate .ll file from the linked .bc
            print(f"Generating module LLVM IR: {module_ll_file}")
            subprocess.run(['llvm-dis', str(module_bc_file), '-o', str(module_ll_file)], 
                         check=True, capture_output=True)
            
            print(f"✓ Module bitcode generated: {module_bc_file}")
            return module_bc_file
            
        except subprocess.CalledProcessError as e:
            print(f"Warning: Failed to generate module bitcode for {ko_file}")
            if e.stderr:
                print(f"Error: {e.stderr}")
        except FileNotFoundError:
            print(f"Warning: llvm-link not found, skipping module bitcode generation")
        
        return None

    def create_wrapper_script(self):
        """Create a shell script wrapper for clang."""
        try:
            print(f"Creating wrapper script at: {self.wrapper_script}")
            
            wrapper_content = f'''#!/bin/bash
# Auto-generated clang wrapper script

# Log to file for debugging
echo "WRAPPER SHELL CALLED: $@" >> /tmp/clang_wrapper_debug.log

# Debug to stderr if enabled
if [ "$DEBUG_CLANG_WRAPPER" = "1" ]; then
    echo "WRAPPER SHELL: Called with args: $@" >&2
fi

# Call the Python wrapper
exec python3 "{__file__}" --wrap-clang "$@"
'''
            
            with open(self.wrapper_script, 'w') as f:
                f.write(wrapper_content)
            
            os.chmod(self.wrapper_script, 0o755)
            
            # Clear debug log
            debug_file = Path('/tmp/clang_wrapper_debug.log')
            debug_file.write_text("")
            
            if self.wrapper_script.exists():
                print(f"✓ Wrapper script created successfully")
                return True
            else:
                print(f"✗ Failed to create wrapper script")
                return False
                
        except Exception as e:
            print(f"✗ Error creating wrapper script: {e}")
            return False
        
    def setup_environment(self):
        """Setup environment variables for kernel build."""
        env = os.environ.copy()
        
        # Override compiler settings
        env['CC'] = str(self.wrapper_script)
        env['HOSTCC'] = str(self.wrapper_script)
        env['CROSS_COMPILE'] = ''
        
        # Force LLVM tools
        env['LLVM'] = '1'
        env['LLVM_IAS'] = '1'
        
        print(f"Environment: CC={env['CC']}, LLVM={env['LLVM']}")
        
        return env
        
    def build_modules(self, make_args):
        """Build kernel modules with clang."""
        print("=" * 60)
        print("Linux Kernel Module Builder with Clang")
        print("=" * 60)
        
        if not self.create_wrapper_script():
            return 1
        
        env = self.setup_environment()
        make_cmd = ['make'] + [f'CC={self.wrapper_script}'] + make_args
        
        print(f"Building: {' '.join(make_cmd)}")
        print(f"Bitcode output: {self.wrapper.bitcode_dir}")
        
        try:
            print("\n" + "=" * 60)
            print("Starting build...")
            print("=" * 60)
            
            result = subprocess.run(make_cmd, env=env)
            
            if result.returncode == 0:
                print(f"\n✓ Build completed successfully!")
                
                # Post-build: Find .ko files and generate module bitcode
                print("\n" + "=" * 60)
                print("Generating module bitcode...")
                print("=" * 60)
                
                # Look for .ko files in common locations
                search_dirs = ['.', 'drivers']
                if 'M=' in ' '.join(make_args):
                    # Extract the module directory from M= argument
                    for arg in make_args:
                        if arg.startswith('M='):
                            module_dir = arg[2:]
                            search_dirs.insert(0, module_dir)
                            break
                
                ko_files = self.find_ko_files(search_dirs)
                module_bc_files = []
                
                if ko_files:
                    print(f"Found {len(ko_files)} .ko files:")
                    for ko_file in ko_files:
                        print(f"  - {ko_file}")
                        module_bc = self.generate_module_bitcode_from_ko(ko_file)
                        if module_bc:
                            module_bc_files.append(module_bc)
                else:
                    print("No .ko files found. Generating generic module bitcode from all .bc files...")
                    # Fallback: create a combined bitcode from all available .bc files
                    all_bc_files = list(self.wrapper.bitcode_dir.glob("*.bc"))
                    if all_bc_files:
                        generic_bc = self.wrapper.bitcode_dir / "combined_module.bc"
                        generic_ll = self.wrapper.bitcode_dir / "combined_module.ll"
                        
                        try:
                            llvm_link_cmd = ['llvm-link'] + [str(bc) for bc in all_bc_files] + ['-o', str(generic_bc)]
                            subprocess.run(llvm_link_cmd, check=True, capture_output=True)
                            subprocess.run(['llvm-dis', str(generic_bc), '-o', str(generic_ll)], check=True, capture_output=True)
                            print(f"✓ Generated combined module bitcode: {generic_bc}")
                            module_bc_files.append(generic_bc)
                        except subprocess.CalledProcessError as e:
                            print(f"Warning: Failed to generate combined module bitcode")
                
                # Show final summary
                print(f"\n✓ Bitcode files saved in: {self.wrapper.bitcode_dir}")
                
                bc_files = list(self.wrapper.bitcode_dir.glob("*.bc"))
                ll_files = list(self.wrapper.bitcode_dir.glob("*.ll"))
                individual_bc_files = [f for f in bc_files if f not in module_bc_files]
                
                print(f"✓ Generated {len(individual_bc_files)} individual .bc files")
                print(f"✓ Generated {len(module_bc_files)} module .bc files")
                print(f"✓ Generated {len(ll_files)} .ll files")
                
                # List the files
                if individual_bc_files:
                    print("\nIndividual bitcode files:")
                    for bc_file in sorted(individual_bc_files):
                        print(f"  - {bc_file.name}")
                
                if module_bc_files:
                    print("\nModule bitcode files:")
                    for bc_file in sorted(module_bc_files):
                        print(f"  - {bc_file.name}")
            else:
                print(f"\n✗ Build failed with error code: {result.returncode}")
                
            return result.returncode
            
        except KeyboardInterrupt:
            print(f"\n⚠ Build interrupted by user")
            return 130
        finally:
            try:
                if self.wrapper_script.exists():
                    self.wrapper_script.unlink()
            except:
                pass


def main():
    if len(sys.argv) >= 2 and sys.argv[1] == '--wrap-clang':
        bitcode_dir = os.environ.get('BITCODE_DIR', 'bitcode_output')
        wrapper = ClangWrapper(bitcode_dir)
        wrapper_args = sys.argv[2:]
        return wrapper.wrap_clang(wrapper_args)
    
    parser = argparse.ArgumentParser(description='Linux Kernel Module Builder with Clang')
    parser.add_argument('--bitcode-dir', default='bitcode_output',
                       help='Directory to save bitcode files')
    parser.add_argument('--debug', action='store_true',
                       help='Enable debug output')
    parser.add_argument('make_args', nargs='*', 
                       help='Arguments to pass to make')
    
    args = parser.parse_args()
    
    if args.debug:
        os.environ['DEBUG_CLANG_WRAPPER'] = '1'
        print("Debug mode enabled")
    
    if not args.make_args:
        print("Usage: python3 bitcodegen.py [options] [make arguments]")
        print("Example: python3 bitcodegen.py M=drivers/mxc/gpu-viv modules")
        return 1
        
    builder = KernelModuleBuilder()
    builder.wrapper.bitcode_dir = Path(args.bitcode_dir)
    builder.wrapper.bitcode_dir.mkdir(exist_ok=True)
    
    os.environ['BITCODE_DIR'] = str(args.bitcode_dir)
    
    return builder.build_modules(args.make_args)


if __name__ == '__main__':
    sys.exit(main())