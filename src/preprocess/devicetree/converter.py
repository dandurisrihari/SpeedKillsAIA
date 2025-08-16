#!/usr/bin/env python3
"""DTB -> DTS conversion utilities using pyfdt.

Primary abstraction: DeviceTreeConverter

We avoid shelling out to dtc where possible, relying on pyfdt to parse the
binary blob. Fallback to calling dtc can be added later if needed.
"""
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Optional, Union

try:
    from pyfdt import FdtBlobParse
except ImportError:  # pragma: no cover - handled at runtime
    FdtBlobParse = None  # type: ignore


@dataclass
class DeviceTreeConverter:
    """Converter for DTB blobs to pyfdt tree and textual DTS.

    Attributes:
        path: Path to the .dtb file
        blob: Raw bytes (lazy loaded)
        fdt: Parsed pyfdt object
    """
    path: Path
    blob: Optional[bytes] = None
    fdt: Optional[object] = None

    def load(self) -> 'DeviceTreeConverter':
        if self.blob is None:
            self.blob = self.path.read_bytes()
        if FdtBlobParse is None:
            raise RuntimeError("pyfdt is not installed. Add 'pyfdt' to requirements and pip install.")
        self.fdt = FdtBlobParse(self.blob).to_fdt()
        return self

    def to_dts(self) -> str:
        if self.fdt is None:
            self.load()
        # pyfdt provides to_dts() on the tree root
        return self.fdt.to_dts()  # type: ignore

    def save_dts(self, out_path: Union[str, Path]) -> Path:
        dts_text = self.to_dts()
        out_path = Path(out_path)
        out_path.write_text(dts_text)
        return out_path


def load_dtb(path: Union[str, Path]) -> DeviceTreeConverter:
    return DeviceTreeConverter(Path(path)).load()


def dtb_to_dts(dtb_path: Union[str, Path], dts_out: Optional[Union[str, Path]] = None) -> str:
    """High-level helper: convert dtb file to DTS string (and optionally save).

    Args:
        dtb_path: Path to the .dtb file
        dts_out: Optional output path to save the generated .dts
    Returns:
        DTS textual representation
    """
    conv = load_dtb(dtb_path)
    dts_text = conv.to_dts()
    if dts_out:
        Path(dts_out).write_text(dts_text)
    return dts_text
