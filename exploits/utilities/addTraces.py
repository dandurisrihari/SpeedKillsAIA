import os
import re
import argparse

def add_printk_to_functions_in_file(filename):
    # Check if the file has already been instrumented
    with open(filename, 'rb') as file:
        first_line = file.readline().decode('utf-8', errors='ignore')
        if "// [Debug - Instrumented]" in first_line:
            print(f"Skipping {filename} (already instrumented)")
            return

    # Regular expression to find function definitions
    func_pattern = re.compile(
        r'^\s*([a-zA-Z_][a-zA-Z_0-9\* ]+)\s+([a-zA-Z_][a-zA-Z_0-9]*)\s*\(([^)]*)\)\s*{',
        re.MULTILINE
    )

    with open(filename, 'rb') as file:
        code = file.read().decode('utf-8', errors='ignore')

    # Prepare the instrumentation tag, include statements, extern declaration, and macro definition
    modified_code = "// [Debug - Instrumented]\n"
    modified_code += "#include <linux/types.h>\n"  # Include types.h for int support
    modified_code += "extern int debug__start_logging;\n"
    modified_code += "#define DEBUG_PRINTK(fmt, ...) \\\n"
    modified_code += "    do { if (debug__start_logging) printk(KERN_ERR \"[Debug] \" fmt, ##__VA_ARGS__); } while (0)\n\n"

    last_pos = 0

    # Iterate over each function found
    for match in func_pattern.finditer(code):
        func_name = match.group(2).strip()

        # Insert `DEBUG_PRINTK` statement at the start of each function
        start_of_function = match.end()
        debug_statement = f'    DEBUG_PRINTK("File: %s, Function: {func_name}\\n", __FILE__);\n'

        # Append code up to function start, then add `DEBUG_PRINTK`, then continue
        modified_code += code[last_pos:start_of_function] + debug_statement
        last_pos = start_of_function

    # Append the rest of the file after the last function
    modified_code += code[last_pos:]

    # Write modified code back to file
    with open(filename, 'w') as file:
        file.write(modified_code)

def process_directory(directory):
    # Iterate over all files in the directory
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".c"):
                file_path = os.path.join(root, file)
                print(f"Processing {file_path}")
                add_printk_to_functions_in_file(file_path)

def main():
    # Set up argument parsing
    parser = argparse.ArgumentParser(description="Add conditional printk statements to each function in C files within a directory.")
    parser.add_argument('directory', type=str, help="Path to the directory containing C files")
    
    args = parser.parse_args()
    directory = args.directory
    
    # Process the directory
    process_directory(directory)

if __name__ == "__main__":
    main()
