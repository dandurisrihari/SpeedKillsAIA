#!/usr/bin/env python3
"""Device Tree utilities (DTB -> DTS conversion and accelerator node extraction).

This module provides a modular interface to:
- Convert a compiled Device Tree Blob (.dtb) to a Device Tree Source (.dts)
- Extract relevant accelerator/memory region nodes (GPU, NPU, AI, reserved-memory)

Uses pyfdt for parsing. Public entrypoints keep side effects minimal.
"""

from .converter import dtb_to_dts, load_dtb, DeviceTreeConverter
from .extractor import AcceleratorInfo, MemoryRegion, extract_accelerator_info

__all__ = [
    'dtb_to_dts', 'load_dtb', 'DeviceTreeConverter',
    'AcceleratorInfo', 'MemoryRegion', 'extract_accelerator_info'
]
