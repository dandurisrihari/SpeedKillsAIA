#!/usr/bin/env python3
"""
DeputyHunt Instrumentation-Only Dynamic Analysis

Counts the unique kernel functions that actually executed during dynamic
analysis, per accelerator, from the instrumentation markers in the boot and
dmesg logs:

    IOCTL_HANDLER    Function <name> called at <file>:<line>
    FUNC_ENTRY       Entering function <name> at <file>:<line>
    DMA_INSTRUMENT   About to call <api> from function <name> at <file>:<line>
    USER_COPY        About to call <api> from function <name> at <file>:<line>

Only these two files per platform are read (other logs in the directory,
e.g. *_strace.log or *_boot_and_dmesg_*.log, are ignored):

    <platform>_dmesg_dma_userapi_dmafilefuncs_ioctl.log
    <platform>_uart_boot_dma_userapi_dmafilefuncs_ioctl.log

Each count is a set of function names, so a function seen many times, or in
both log files, is counted once. The per-marker columns overlap (a function can
be both a FUNC_ENTRY and a DMA_INSTRUMENT), so they do not sum to
Union_Unique_Functions -- that column is the de-duplicated total.

Usage:
    python deputyhunt_dynamic.py
    python deputyhunt_dynamic.py --logs-dir data/logs -o out.csv
"""

import argparse
import csv
import re
import sys
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple

SCRIPT_DIR = Path(__file__).parent.resolve()
PROJECT_ROOT = SCRIPT_DIR.parent.parent
DEFAULT_LOGS_DIR = PROJECT_ROOT / "data" / "logs"
DEFAULT_OUTPUT = PROJECT_ROOT / "data" / "instrumentation" / "deputyhunt_instrumentation_only_dynamic_analysis.csv"

PLATFORMS = ["coral", "nxp", "ti", "hailo", "nvidia", "aws"]

PLATFORM_DISPLAY_NAMES = {
    "coral": "Google TPU",
    "nxp": "NXP NPU",
    "ti": "TMMA",
    "hailo": "HAILO NPU",
    "nvidia": "NVIDIA GPU",
    "aws": "AWS INF",
}

LOG_SUFFIXES = [
    "dmesg_dma_userapi_dmafilefuncs_ioctl.log",
    "uart_boot_dma_userapi_dmafilefuncs_ioctl.log",
]

# Each marker carries its own message shape, so a name can never be credited to a
# different marker. The trailing ':' keeps USER_COPY from matching USER_COPY_CONTEXT.
MARKER_PATTERNS = {
    "IOCTL_HANDLER": re.compile(r"\bIOCTL_HANDLER: Function (\S+) called at \S+"),
    "FUNC_ENTRY": re.compile(r"\bFUNC_ENTRY: Entering function (\S+) at \S+"),
    "DMA_INSTRUMENT": re.compile(r"\bDMA_INSTRUMENT: About to call \S+ from function (\S+) at \S+"),
    "USER_COPY": re.compile(r"\bUSER_COPY: About to call \S+ from function (\S+) at \S+"),
}
MARKERS = list(MARKER_PATTERNS)

FIELDNAMES = (
    ["Accelerator", "Platform"]
    + MARKERS
    + ["Union_Unique_Functions", "Log_Files_Used", "Missing_Log_Files"]
)


def scan_log(path: Path, functions: Dict[str, Set[str]]) -> None:
    with open(path, "r", encoding="utf-8", errors="ignore") as handle:
        for line in handle:
            for marker, pattern in MARKER_PATTERNS.items():
                functions[marker].update(pattern.findall(line))


def collect_platform(logs_dir: Path, platform: str) -> Tuple[Dict[str, Set[str]], List[str], List[str]]:
    functions: Dict[str, Set[str]] = {marker: set() for marker in MARKERS}
    used: List[str] = []
    missing: List[str] = []

    for suffix in LOG_SUFFIXES:
        path = logs_dir / platform / f"{platform}_{suffix}"
        if not path.exists():
            missing.append(path.name)
            continue
        scan_log(path, functions)
        used.append(path.name)

    return functions, used, missing


def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(
        description="Count unique functions executed during dynamic analysis, per accelerator."
    )
    parser.add_argument("--logs-dir", type=Path, default=DEFAULT_LOGS_DIR, help=f"default: {DEFAULT_LOGS_DIR}")
    parser.add_argument("-o", "--output", type=Path, default=DEFAULT_OUTPUT, help=f"default: {DEFAULT_OUTPUT}")
    args = parser.parse_args(argv)

    if not args.logs_dir.is_dir():
        print(f"{args.logs_dir} is not a directory", file=sys.stderr)
        return 1

    rows: List[Dict[str, object]] = []
    for platform in PLATFORMS:
        functions, used, missing = collect_platform(args.logs_dir, platform)
        if not used:
            print(f"[skip] {platform}: no matching log files in {args.logs_dir / platform}", file=sys.stderr)
            continue

        row: Dict[str, object] = {
            "Accelerator": PLATFORM_DISPLAY_NAMES.get(platform, platform),
            "Platform": platform,
        }
        union: Set[str] = set()
        for marker in MARKERS:
            row[marker] = len(functions[marker])
            union |= functions[marker]
        row["Union_Unique_Functions"] = len(union)
        row["Log_Files_Used"] = "; ".join(used)
        row["Missing_Log_Files"] = "; ".join(missing)
        rows.append(row)

        print(f"{platform}: {len(union)} unique functions from {len(used)} log(s)")
        for name in used:
            print(f"    {name}")

    if not rows:
        print("No log files found.", file=sys.stderr)
        return 1

    args.output.parent.mkdir(parents=True, exist_ok=True)
    with open(args.output, "w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(rows)

    print(f"\n-> {args.output}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
