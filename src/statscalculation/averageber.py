#!/usr/bin/env python3
"""
Average BER CSV Generator

Averages the per-run ``BER.csv`` files across every timestamped analysis run
directory (e.g. ``20260813_050011_616064489_4040162``) and writes
``average_BER.csv`` at the top of the analysis directory.

Usage:
    python averageber.py                       # defaults to data/llmanalysis
    python averageber.py path/to/llmanalysis
"""

import argparse
import csv
import re
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple

SCRIPT_DIR = Path(__file__).parent.resolve()
PROJECT_ROOT = SCRIPT_DIR.parent.parent
DEFAULT_ANALYSIS_DIR = PROJECT_ROOT / "data" / "llmanalysis"

BER_NAME = "BER.csv"
OUTPUT_NAME = "average_BER.csv"

# Matches run directories such as 20260813_050011_616064489_4040162
RUN_DIR_PATTERN = re.compile(r"^\d+_\d+_\d+_\d+$")

FIELDNAMES = [
    "Accelerator",
    "Platform",
    "Category",
    "Total_Functions",
    "Avg_Flagged_Functions",
    "Avg_BER",
    "Runs",
]


def find_run_dirs(analysis_dir: Path) -> List[Path]:
    return sorted(
        d for d in analysis_dir.iterdir()
        if d.is_dir() and RUN_DIR_PATTERN.match(d.name) and (d / BER_NAME).exists()
    )


def to_float(value: str) -> Optional[float]:
    try:
        return float(value)
    except (TypeError, ValueError):
        return None


def collect(run_dirs: List[Path]) -> Tuple[List[Tuple[str, str, str]], Dict, Dict, Dict]:
    """Gather flagged counts, BER values and totals keyed by (accelerator, platform, category)."""
    order: List[Tuple[str, str, str]] = []
    flagged: Dict[Tuple[str, str, str], List[float]] = {}
    bers: Dict[Tuple[str, str, str], List[float]] = {}
    totals: Dict[Tuple[str, str, str], str] = {}

    for run_dir in run_dirs:
        with open(run_dir / BER_NAME, "r", encoding="utf-8", newline="") as handle:
            for row in csv.DictReader(handle):
                key = (
                    row.get("Accelerator", "").strip(),
                    row.get("Platform", "").strip(),
                    row.get("Category", "").strip(),
                )
                if key not in flagged:
                    order.append(key)
                    flagged[key] = []
                    bers[key] = []
                    totals[key] = row.get("Total_Functions", "").strip()

                count = to_float(row.get("Flagged_Functions", ""))
                if count is not None:
                    flagged[key].append(count)
                ber = to_float(row.get("BER", ""))
                if ber is not None:
                    bers[key].append(ber)

    return order, flagged, bers, totals


def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(
        description="Average the per-run BER.csv files into average_BER.csv."
    )
    parser.add_argument(
        "analysis_dir",
        nargs="?",
        type=Path,
        default=DEFAULT_ANALYSIS_DIR,
        help=f"directory holding the timestamped run folders (default: {DEFAULT_ANALYSIS_DIR})",
    )
    args = parser.parse_args(argv)

    if not args.analysis_dir.is_dir():
        print(f"{args.analysis_dir} is not a directory", file=sys.stderr)
        return 1

    run_dirs = find_run_dirs(args.analysis_dir)
    if not run_dirs:
        print(f"No timestamped run directories with {BER_NAME} found in {args.analysis_dir}", file=sys.stderr)
        return 1

    order, flagged, bers, totals = collect(run_dirs)

    output_path = args.analysis_dir / OUTPUT_NAME
    with open(output_path, "w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        for key in order:
            accelerator, platform, category = key
            counts = flagged[key]
            values = bers[key]
            writer.writerow({
                "Accelerator": accelerator,
                "Platform": platform,
                "Category": category,
                "Total_Functions": totals[key],
                # Rounded half-up rather than Python's banker's rounding.
                "Avg_Flagged_Functions": int(sum(counts) / len(counts) + 0.5) if counts else "",
                "Avg_BER": f"{sum(values) / len(values):.2f}" if values else "",
                "Runs": len(counts),
            })

    print(f"Averaged {len(run_dirs)} run(s) -> {output_path}")
    for run_dir in run_dirs:
        print(f"  {run_dir.name}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
