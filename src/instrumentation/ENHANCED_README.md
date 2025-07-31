# Enhanced Kernel Instrumentation System

A comprehensive modular system for instrumenting kernel code with support for multiple instrumentation types: DMA APIs, user copy operations, and function entries.

## Features

- **Multi-Type Instrumentation**: Support for DMA APIs, copy_from_user/copy_to_user operations, and function entry points
- **Modular Architecture**: Type-based configuration system with specialized analyzers and instrumenters
- **Granular Control**: Choose exactly which instrumentation types to enable/disable
- **Automatic Header Management**: Automatically includes required kernel headers (linux/printk.h, etc.)
- **Dry Run Mode**: Preview changes without modifying files
- **Backup System**: Automatic backup of original files before instrumentation

## Architecture

### Type System (`types/`)
- `base.py`: Abstract base class for all instrumentation types
- `dma_config.py`: Configuration for DMA API instrumentation
- `user_copy_config.py`: Configuration for user copy operation instrumentation  
- `function_config.py`: Configuration for function entry instrumentation

### Analyzers (`analyzers/`)
- `base_analyzer.py`: Abstract analyzer base class
- `dma_analyzer.py`: Specialized DMA API call analyzer
- `user_copy_analyzer.py`: User copy operation analyzer
- `function_analyzer.py`: Function entry point analyzer
- `multi_analyzer.py`: Coordinator for multiple analyzer types

### Instrumenters (`instrumenters/`)
- `multi_instrumenter.py`: Handles instrumentation across all enabled types

### Core Components
- `enhanced_cli.py`: Command-line interface with granular options
- `enhanced_core.py`: Main coordination and processing facade

## Supported Instrumentation Types

### DMA APIs
- `dma_alloc_coherent`
- `dma_free_coherent`
- `dma_map_single`
- `dma_unmap_single`
- `dma_map_page`
- `dma_unmap_page`
- `dma_sync_single_for_cpu`
- `dma_sync_single_for_device`

### User Copy Operations
- `copy_from_user`
- `copy_to_user`
- `__copy_from_user`
- `__copy_to_user`
- `get_user`
- `put_user`

### Function Entries
- All function definitions in processed files

## Usage

### Basic Usage
```bash
# Instrument all types (default behavior)
python kernel_instrument.py /path/to/kernel/source

# Help and options
python kernel_instrument.py --help
```

### Type Selection
```bash
# Only DMA APIs
python kernel_instrument.py --only-dma /path/to/kernel/source

# Only user copy operations
python kernel_instrument.py --only-user-copy /path/to/kernel/source

# Only function entries
python kernel_instrument.py --only-functions /path/to/kernel/source

# DMA and user copy (no functions)
python kernel_instrument.py --no-functions /path/to/kernel/source

# User copy and functions (no DMA)
python kernel_instrument.py --no-dma /path/to/kernel/source
```

### Additional Options
```bash
# Dry run (preview changes without modifying files)
python kernel_instrument.py --dry-run /path/to/kernel/source

# Custom backup directory
python kernel_instrument.py --backup-dir /custom/backup/path /path/to/kernel/source

# Verbose output
python kernel_instrument.py --verbose /path/to/kernel/source
```

### Combination Examples
```bash
# Only DMA and user copy operations (no function entries), with dry run
python kernel_instrument.py --only-dma --only-user-copy --dry-run /path/to/kernel/source

# All types except functions, verbose mode
python kernel_instrument.py --no-functions --verbose /path/to/kernel/source
```

## CLI Options Reference

### Type Selection (Exclusive - only specified types enabled)
- `--only-dma`: Enable only DMA API instrumentation
- `--only-user-copy`: Enable only user copy operation instrumentation  
- `--only-functions`: Enable only function entry instrumentation

### Type Exclusion (Inclusive - all except specified types enabled)
- `--no-dma`: Disable DMA API instrumentation
- `--no-user-copy`: Disable user copy operation instrumentation
- `--no-functions`: Disable function entry instrumentation

### Processing Options
- `--dry-run`: Preview changes without modifying files
- `--backup-dir PATH`: Custom directory for backup files (default: creates backup/ in target)
- `--verbose`: Enable verbose output
- `--help`: Show help message

## Output Format

The instrumentation adds printk statements with the following format:

### DMA APIs
```c
printk(KERN_INFO "[DMA_TRACE] dma_alloc_coherent called from function_name at file.c:line");
```

### User Copy Operations
```c
printk(KERN_INFO "[USER_COPY_TRACE] copy_from_user called from function_name at file.c:line");
```

### Function Entries
```c
printk(KERN_INFO "[FUNCTION_TRACE] Entering function_name at file.c:line");
```

## Example Workflow

1. **Preview changes**:
   ```bash
   python kernel_instrument.py --dry-run /path/to/driver/source
   ```

2. **Instrument specific types**:
   ```bash
   python kernel_instrument.py --only-dma --only-user-copy /path/to/driver/source
   ```

3. **Build and test** your instrumented kernel module

4. **Analyze logs** using dmesg or kernel log analysis tools

5. **Restore original files** from backup if needed

## Dependencies

- Python 3.7+
- tree-sitter
- tree-sitter-c

## Installation

1. Install Python dependencies:
   ```bash
   pip install tree-sitter tree-sitter-c
   ```

2. The tool is ready to use directly from the source directory.

## Troubleshooting

### Common Issues

1. **Tree-sitter parsing errors**: Ensure the C source files are syntactically valid
2. **Header not found**: The tool automatically includes `linux/printk.h` but some files may need additional headers
3. **Backup conflicts**: Use `--backup-dir` to specify a custom backup location

### Debugging

Use `--verbose` flag to see detailed processing information:
```bash
python kernel_instrument.py --verbose --dry-run /path/to/source
```

## Contributing

The modular architecture makes it easy to add new instrumentation types:

1. Create a new type configuration in `types/`
2. Implement a specialized analyzer in `analyzers/`
3. Update the CLI to include new options
4. Add the type to the multi-analyzer and multi-instrumenter

## License

[Add your license information here]
