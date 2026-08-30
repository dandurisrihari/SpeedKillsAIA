#!/usr/bin/env python3
"""
Totals the instrumentation reports into one row per device.

Each run of the kernel instrumenter leaves a <driver>_kernelinstrumenter_stats.txt
beside this, and a device may have taken several runs: TMMA is instrumented as
four drivers and NVIDIA as two, so those are added up. The allfuncs reports are
a separate experiment that instruments everything, and are not read here.

Usage:
    python instrumentationstats.py data/instrumentation
"""

import argparse
import csv
import re
import sys
from pathlib import Path
from typing import Dict, List, Optional, Sequence, Tuple

OUTPUT_NAME = "instrumentation-stats.csv"
FIELDNAMES = ["Device", "Instrumented Fns.", "Instrumented Files"]

# Device to the instrumentation runs it took, in the order they are reported.
DEVICES: List[Tuple[str, Tuple[str, ...]]] = [
    ("Google TPU", ("coral",)),
    ("NXP NPU", ("nxp",)),
    ("TMMA", ("ti_dmabuf", "ti_misc", "ti_remoteproc", "ti_rpmsg")),
    ("HAILO NPU", ("hailo",)),
    ("NVIDIA GPU", ("nvidia", "nvidia_nvmap")),
    ("AWS INF", ("aws",)),
]

FIELDS = {
    "files": r"Total C files in directory:\s+(\d+)",
    "files_instrumented": r"Files modified:\s+(\d+)",
    "functions": r"Total functions in source code:\s+(\d+)",
    "functions_instrumented": r"Functions instrumented:\s+(\d+)",
}


def read_report(path: Path) -> Dict[str, int]:
    text = path.read_text(encoding="utf-8", errors="replace")
    counts: Dict[str, int] = {}
    for field, pattern in FIELDS.items():
        match = re.search(pattern, text)
        if match is None:
            raise ValueError(f"{path.name}: no {field}")
        counts[field] = int(match.group(1))
    return counts


def share(part: int, whole: int) -> str:
    return f"{part} out of {whole} ({part / whole * 100:.1f}%)" if whole else ""


def build_rows(directory: Path) -> List[Dict[str, str]]:
    rows: List[Dict[str, str]] = []
    for device, drivers in DEVICES:
        totals = dict.fromkeys(FIELDS, 0)
        for driver in drivers:
            path = directory / f"{driver}_kernelinstrumenter_stats.txt"
            if not path.exists():
                print(f"[warn] {device}: no report at {path.name}", file=sys.stderr)
                continue
            for field, value in read_report(path).items():
                totals[field] += value
        rows.append({
            "Device": device,
            "Instrumented Fns.": share(totals["functions_instrumented"], totals["functions"]),
            "Instrumented Files": share(totals["files_instrumented"], totals["files"]),
        })
    return rows


def main(argv: Optional[Sequence[str]] = None) -> int:
    parser = argparse.ArgumentParser(description="Total the instrumentation reports per device.")
    parser.add_argument("directory", nargs="?", type=Path, default=Path("data/instrumentation"),
                        help="where the reports are")
    parser.add_argument("--force", action="store_true", help="overwrite an existing csv")
    args = parser.parse_args(argv)

    if not args.directory.is_dir():
        print(f"{args.directory}: not a directory", file=sys.stderr)
        return 1

    output = args.directory / OUTPUT_NAME
    if output.exists() and not args.force:
        print(f"[skip] {output} exists; pass --force to overwrite", file=sys.stderr)
        return 1

    rows = build_rows(args.directory)
    with open(output, "w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(rows)

    width = max(len(row["Device"]) for row in rows)
    for row in rows:
        print(f"{row['Device']:<{width}}  {row['Instrumented Fns.']:<26}{row['Instrumented Files']}")
    print(f"\nwrote {output}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
