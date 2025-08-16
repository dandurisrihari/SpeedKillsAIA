#!/usr/bin/env python3
"""Accelerator & memory region extraction from Device Tree.

We focus on nodes representing GPU, NPU, TPU, AI accelerators and reserved-memory
entries that denote carveouts for these blocks.
"""
from __future__ import annotations

from dataclasses import dataclass, field
from pathlib import Path
from typing import List, Optional, Dict, Any, Iterable
import re

try:
    from pyfdt import FdtBlobParse
except ImportError:  # pragma: no cover
    FdtBlobParse = None  # type: ignore


ACCEL_KEYWORDS = [
    'gpu', 'npu', 'tpu', 'vpu', 'dsp', 'ai', 'accelerator'
]


@dataclass
class MemoryRegion:
    name: str
    base: Optional[int] = None
    size: Optional[int] = None
    compatible: Optional[str] = None
    phandle: Optional[int] = None
    raw: Dict[str, Any] = field(default_factory=dict)


@dataclass
class AcceleratorInfo:
    node_name: str
    path: str
    compatible: List[str]
    memory_regions: List[MemoryRegion] = field(default_factory=list)
    interrupts: Optional[List[int]] = None
    clocks: Optional[List[str]] = None
    status: Optional[str] = None
    raw: Dict[str, Any] = field(default_factory=dict)


def _iter_nodes(fdt_root) -> Iterable[Any]:  # type: ignore
    # pyfdt node structure: root.subnodes = list
    stack = [("/", fdt_root)]
    while stack:
        path, node = stack.pop()
        yield path, node
        for sub in getattr(node, 'subnodes', []) or []:
            new_path = path.rstrip('/') + '/' + getattr(sub, 'name', 'unknown')
            stack.append((new_path, sub))


def _prop_dict(node) -> Dict[str, Any]:
    props = {}
    for p in getattr(node, 'props', []) or []:
        name = getattr(p, 'name', '')
        val = getattr(p, 'value', None)
        # Normalize byte arrays
        if isinstance(val, (bytes, bytearray)):
            try:
                # Attempt ASCII decode, fallback to hex
                val_dec = val.decode('ascii')
                if all(c.isprintable() or c.isspace() for c in val_dec):
                    val = val_dec
                else:
                    raise ValueError
            except Exception:
                val = '0x' + val.hex()
        props[name] = val
    return props


def _matches_accel(name: str, compat: List[str]) -> bool:
    lowered = name.lower()
    if any(k in lowered for k in ACCEL_KEYWORDS):
        return True
    for c in compat:
        lc = c.lower()
        if any(k in lc for k in ACCEL_KEYWORDS):
            return True
    return False


def _parse_reg(props: Dict[str, Any]) -> List[MemoryRegion]:
    regions: List[MemoryRegion] = []
    reg = props.get('reg')
    if reg is None:
        return regions

    # reg from pyfdt might already be list of ints or bytes string
    if isinstance(reg, str) and re.match(r'^0x[0-9a-fA-F]+(\s+0x[0-9a-fA-F]+)*$', reg):
        parts = reg.split()
        nums = [int(p, 16) for p in parts]
    elif isinstance(reg, (list, tuple)):
        nums = []
        for v in reg:
            if isinstance(v, (bytes, bytearray)):
                nums.append(int.from_bytes(v, 'big'))
            else:
                nums.append(int(v))
    else:
        nums = []

    # Interpret pairs base,size
    for i in range(0, len(nums), 2):
        base = nums[i]
        size = nums[i+1] if i+1 < len(nums) else None
        regions.append(MemoryRegion(name='reg', base=base, size=size, raw={'pair_index': i//2}))
    return regions


def extract_accelerator_info(dtb_path: Path) -> Dict[str, Any]:
    if FdtBlobParse is None:
        raise RuntimeError("pyfdt is not installed.")

    blob = Path(dtb_path).read_bytes()
    fdt = FdtBlobParse(blob).to_fdt()

    accelerators: List[AcceleratorInfo] = []
    reserved: List[MemoryRegion] = []

    # Pass 1: collect accelerators & reserved-memory subnodes
    for path, node in _iter_nodes(fdt):
        props = _prop_dict(node)
        compat_raw = props.get('compatible')
        if isinstance(compat_raw, str):
            compat = [c.strip() for c in compat_raw.split('\0') if c.strip()]  # dt strings are \0 separated
        elif isinstance(compat_raw, (list, tuple)):
            compat = []
            for v in compat_raw:
                if isinstance(v, (bytes, bytearray)):
                    try:
                        compat.append(v.decode('ascii'))
                    except Exception:
                        compat.append('0x'+v.hex())
                else:
                    compat.append(str(v))
        else:
            compat = []

        name = getattr(node, 'name', '')

        if _matches_accel(name, compat):
            info = AcceleratorInfo(
                node_name=name,
                path=path,
                compatible=compat,
                status=props.get('status'),
                raw=props
            )
            info.memory_regions.extend(_parse_reg(props))
            accelerators.append(info)

        # reserved-memory children appear under /reserved-memory
        if path.startswith('/reserved-memory/'):
            # Each child often has reg + size
            mem_regs = _parse_reg(props)
            for mr in mem_regs:
                mr.name = name or props.get('label', 'reserved')
                mr.compatible = ','.join(compat) if compat else None
                reserved.append(mr)

    # Link reserved regions to accelerators by address overlap
    for acc in accelerators:
        for mr in reserved:
            for reg in acc.memory_regions:
                if reg.base is not None and mr.base is not None and reg.base == mr.base:
                    acc.memory_regions.append(mr)

    return {
        'accelerators': [
            {
                'node_name': a.node_name,
                'path': a.path,
                'compatible': a.compatible,
                'status': a.status,
                'memory_regions': [
                    {
                        'name': r.name,
                        'base': hex(r.base) if r.base is not None else None,
                        'size': r.size,
                        'size_hex': hex(r.size) if isinstance(r.size, int) else None,
                        'compatible': r.compatible
                    } for r in a.memory_regions
                ],
                'raw': a.raw
            } for a in accelerators
        ],
        'reserved_memory': [
            {
                'name': r.name,
                'base': hex(r.base) if r.base is not None else None,
                'size': r.size,
                'size_hex': hex(r.size) if isinstance(r.size, int) else None,
                'compatible': r.compatible
            } for r in reserved
        ]
    }
