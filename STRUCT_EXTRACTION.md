# Struct Extraction Feature

## Overview
The preprocess module now automatically extracts C struct and union definitions from preprocessed `.i` files and embeds them in the JSON output. This provides essential type information needed for analyzing kernel code and data structures.

## How It Works

1. **During log parsing**: When the preprocess tool encounters function entries, DMA operations, user copy operations, or IOCTL calls, it tracks the source files involved.

2. **Preprocessed file discovery**: For each source file referenced, the system locates the corresponding `.i` (preprocessed) file using the source root path.

3. **Struct extraction**: Using Python tree-sitter (or regex fallback), the system parses each `.i` file to extract top-level struct and union definitions.

4. **JSON embedding**: All discovered struct definitions are included in the `struct_definitions` array in the JSON output.

## Example Output

```json
{
  "struct_definitions": [
    {
      "kind": "struct",
      "name": "ftrace_branch_data",
      "file": "path/to/file.i",
      "start_line": 27,
      "end_line": 42,
      "code": "struct ftrace_branch_data {\n const char *func;\n const char *file;\n unsigned line;\n union {\n  struct {\n   unsigned long correct;\n   unsigned long incorrect;\n  };\n  struct {\n   unsigned long miss;\n   unsigned long hit;\n  };\n  unsigned long miss_hit[2];\n };\n}"
    }
  ]
}
```

## Usage

```bash
# Parse kernel logs with struct extraction enabled
python -m src.preprocess --log kernel.log --source-root /path/to/kernel/src -o results.json

# Count extracted structs
jq '.struct_definitions | length' results.json

# Find a specific struct
jq '.struct_definitions[] | select(.name == "ftrace_branch_data")' results.json

# List all unique struct names
jq -r '.struct_definitions[].name' results.json | sort | uniq

# Get structs from a specific file
jq '.struct_definitions[] | select(.file | contains("specific_file.i"))' results.json
```

## Fields in Each Struct Definition

- `kind`: Either "struct" or "union"
- `name`: The tag name of the struct/union
- `file`: Path to the `.i` file where it was found
- `start_line`: Starting line number in the file
- `end_line`: Ending line number in the file  
- `code`: Complete source code of the definition

## Performance Notes

- Struct extraction only processes `.i` files that correspond to source files referenced in the log parsing results
- Each `.i` file is processed only once, even if referenced by multiple operations
- The system uses tree-sitter for parsing when available, falling back to regex for robustness

## Example: ftrace_branch_data

This structure is commonly found in kernel code for branch prediction profiling:

```c
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
```

The extraction captures this complete definition with proper nesting and formatting preserved.
