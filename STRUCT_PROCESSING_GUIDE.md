# Struct Processing Guide

## Overview

This guide documents the comprehensive struct extraction system that processes JSON files containing **Function Entries**, **DMA Operations**, **User Copy Operations**, and **IOCTL handlers** to extract and include struct definitions from related `.i` files.

## Files Processed Successfully

### ✅ NXP Platform
- **nxp_boot.json**: 54 functions, 3 DMA ops → **2,032 struct definitions**
- **nxp_dmesg.json**: 72 functions, 8 DMA ops, 5 user copy ops, 3 IOCTL ops → **8,026 struct definitions**

### ✅ TI Platform  
- **ti_boot.json**: 84 functions, 2 DMA ops → **2,032 struct definitions**
- **ti_dmesg.json**: 30 functions, 8 DMA ops, 5 user copy ops, 13 IOCTL ops → **2,032 struct definitions**

### ⚠️ Coral Platform
- **coral_boot.json**: 56 functions → No struct definitions (gasket driver - no .i files available)
- **coral_dmesg.json**: 116 functions, 8 DMA ops, 7 user copy ops, 9 IOCTL ops → No struct definitions (gasket driver - no .i files available)

## Processing Script

### Usage
```bash
# Process all JSON files
python process_all_structs.py

# Process a single file
python process_all_structs.py --file nxp_boot.json

# Dry run to see what would be processed
python process_all_structs.py --dry-run
```

### Features
- ✅ **Automatic Detection**: Finds files with Function Entries, DMA Operations, User Copy Operations, and IOCTL handlers
- ✅ **Smart Matching**: Associates source files with related .i preprocessed files
- ✅ **Comprehensive Extraction**: Uses tree-sitter C parser with regex fallback for robust struct extraction
- ✅ **Deduplication**: Removes duplicate struct definitions across multiple .i files
- ✅ **Safe Processing**: Creates backups before modifying JSON files
- ✅ **Progress Tracking**: Detailed logging of extraction process

## JSON Structure Enhanced

Each processed JSON file now includes:

```json
{
  "functions_by_file": { ... },
  "dma_operations": [ ... ],
  "user_copy_operations": [ ... ],
  "ioctl_operations": [ ... ],
  "struct_definitions": [
    {
      "kind": "struct",
      "name": "structure_name",
      "code": "struct structure_name { ... };",
      "fields": ["field1;", "field2;", ...],
      "file": "path/to/source.i",
      "start_line": 123,
      "end_line": 145
    }
  ],
  "metadata": {
    "struct_files_processed": ["file1.i", "file2.i"],
    "total_struct_definitions": 2032
  },
  "statistics": {
    "struct_definitions_found": 2032,
    "struct_files_processed": 42
  }
}
```

## Struct Definition Types Captured

### ✅ Supported Patterns
- `struct name { ... };` - Basic struct declarations
- `union name { ... };` - Union declarations  
- `typedef struct _name { ... } name;` - Typedef struct patterns
- Anonymous structs within named structs (preserved as code)

### 📊 Extraction Statistics
- **Tree-sitter parsing**: Primary method with full AST analysis
- **Regex fallback**: Backup method for complex nested structures
- **Field extraction**: Individual field declarations parsed and stored
- **Location tracking**: Line numbers and source file paths preserved

## Related .i Files Processed

From `data/kernel_sources/nxp/` and `data/kernel_sources/ti/`:
- `gc_hal_kernel_*.i` - GPU HAL kernel modules (42 files)
- Comprehensive coverage of NXP i.MX and TI GPU driver structs
- Includes memory management, DMA, IOCTL, and hardware abstraction structs

## Backup Files

All original JSON files are automatically backed up:
- `nxp_boot.json.backup`
- `nxp_dmesg.json.backup`  
- `ti_boot.json.backup`
- `ti_dmesg.json.backup`

## Usage Examples

### Query Operations with Structs
```bash
# Find files with both IOCTL operations and struct definitions
jq 'select((.ioctl_operations | length) > 0 and (.struct_definitions | length) > 0)' data/json_files/*.json

# Count total operations and structs per file
jq '{
  file: input_filename,
  functions: (.functions_by_file | to_entries | map(.value | length) | add // 0),
  dma_ops: (.dma_operations | length),
  user_copy_ops: (.user_copy_operations | length), 
  ioctl_ops: (.ioctl_operations | length),
  structs: (.struct_definitions | length)
}' data/json_files/*.json

# Find specific struct definitions
jq '.struct_definitions[] | select(.name == "gcsHAL_FREE_NON_PAGED_MEMORY")' data/json_files/*.json
```

### Integration with Analysis Tools
The enhanced JSON files can now be used with:
- **LLM Analysis**: Struct definitions provide context for function analysis
- **Vulnerability Research**: Complete data structure definitions for memory analysis
- **Reverse Engineering**: Comprehensive struct layout information
- **Code Generation**: Struct definitions for creating test harnesses

## Implementation Details

### Core Components
- `process_all_structs.py` - Main processing script
- `src/preprocess/utils/struct_extractor.py` - Struct extraction engine
- `extract_all_structs.py` - Standalone utility for single-file processing

### Dependencies
- `tree-sitter-c` - C language parsing
- `tree-sitter` - AST parsing framework  
- Python 3.12+ with dataclasses and pathlib

## Next Steps

1. **Coral Support**: Add gasket driver .i files to enable struct extraction for Coral platform
2. **Cross-Platform Analysis**: Compare struct definitions across NXP/TI platforms
3. **Automated Updates**: Integrate struct extraction into preprocessing pipeline
4. **Visualization**: Create struct dependency graphs and relationship maps

---

**Processing Complete**: 4/6 JSON files successfully enhanced with comprehensive struct definitions from kernel .i files.
