#!/usr/bin/env python3
"""
NER CSV Generator

Writes a ``NER.csv`` into every LLM analysis run directory with a blank
``Manually_Analyzed_Functions`` column to be filled in by hand. Re-running the
script keeps whatever has already been filled in and computes:

    NER = (total_functions - manually_analyzed_functions) / total_functions * 100

Usage:
    python ner.py data/llmanalysis/run2
    python ner.py data/llmanalysis --recursive
    python ner.py data/llmanalysis --recursive --reset   # blank the manual column
"""

import argparse
import csv
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple

OUTPUT_NAME = "NER.csv"

PLATFORMS = ["coral", "nxp", "ti", "hailo", "nvidia", "aws"]

PLATFORM_DISPLAY_NAMES = {
    "coral": "Google TPU",
    "nxp": "NXP NPU",
    "ti": "TMMA",
    "hailo": "HAILO NPU",
    "nvidia": "NVIDIA GPU",
    "aws": "AWS INF",
}

# Total functions in the driver source, from data/instrumentation/*_stats.txt.
# nvidia = nvgpu (7357) + nvmap (267); ti = dmabuf (315) + misc (4928) + remoteproc (650) + rpmsg (245).
TOTAL_FUNCTIONS = {
    "coral": 159,
    "nxp": 1273,
    "ti": 6138,
    "hailo": 296,
    "nvidia": 7624,
    "aws": 635,
}

CATEGORIES = ["Relevant Functions", "KD Entry Point", "SMem Handling"]

MANUAL_COLUMN = "Manually_Analyzed_Functions"
FIELDNAMES = ["Accelerator", "Platform", "Category", "Total_Functions", MANUAL_COLUMN, "NER"]


def read_existing_manual(run_dir: Path) -> Dict[Tuple[str, str], str]:
    """Carry over hand-filled manual counts from an existing NER.csv."""
    path = run_dir / OUTPUT_NAME
    if not path.exists():
        return {}

    existing: Dict[Tuple[str, str], str] = {}
    with open(path, "r", encoding="utf-8", newline="") as handle:
        for row in csv.DictReader(handle):
            key = (row.get("Platform", "").strip(), row.get("Category", "").strip())
            existing[key] = row.get(MANUAL_COLUMN, "").strip()
    return existing


def build_rows(run_dir: Path, reset: bool) -> List[Dict[str, object]]:
    existing = {} if reset else read_existing_manual(run_dir)

    rows: List[Dict[str, object]] = []
    for platform in PLATFORMS:
        if not any(run_dir.glob(f"{platform}_*_llm_analysis.csv")):
            continue
        total = TOTAL_FUNCTIONS.get(platform)
        for category in CATEGORIES:
            manual_raw = existing.get((platform, category), "")
            try:
                manual = float(manual_raw)
            except (TypeError, ValueError):
                manual = None

            rows.append({
                "Accelerator": PLATFORM_DISPLAY_NAMES.get(platform, platform),
                "Platform": platform,
                "Category": category,
                "Total_Functions": total if total else "",
                MANUAL_COLUMN: manual_raw,
                "NER": f"{(total - manual) / total * 100:.2f}" if total and manual is not None else "",
            })
    return rows


def process_run_dir(run_dir: Path, reset: bool) -> Optional[Tuple[Path, int, int]]:
    rows = build_rows(run_dir, reset)
    if not rows:
        return None
    output_path = run_dir / OUTPUT_NAME
    with open(output_path, "w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(rows)
    filled = sum(1 for row in rows if row["NER"] != "")
    return output_path, filled, len(rows)


def collect_run_dirs(paths: List[Path], recursive: bool) -> List[Path]:
    run_dirs: List[Path] = []
    for path in paths:
        if not path.is_dir():
            print(f"[skip] {path}: not a directory", file=sys.stderr)
            continue
        candidates = [path]
        if recursive:
            candidates += sorted(p for p in path.rglob("*") if p.is_dir())
        run_dirs += [d for d in candidates if any(d.glob("*_llm_analysis.csv"))]
    return run_dirs


def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(
        description="Create NER.csv in each run directory and compute NER from the manually filled counts."
    )
    parser.add_argument("inputs", nargs="+", type=Path, help="run directory/directories")
    parser.add_argument("-r", "--recursive", action="store_true", help="also search subdirectories for run directories")
    parser.add_argument("--reset", action="store_true", help="blank the manual column instead of keeping filled values")
    args = parser.parse_args(argv)

    run_dirs = collect_run_dirs(args.inputs, args.recursive)
    if not run_dirs:
        print("No analysis run directories found.", file=sys.stderr)
        return 1

    for run_dir in run_dirs:
        result = process_run_dir(run_dir, args.reset)
        if result is None:
            print(f"[skip] {run_dir}: no platform CSVs matched", file=sys.stderr)
            continue
        output_path, filled, total_rows = result
        print(f"{run_dir} -> {output_path} ({filled}/{total_rows} rows with NER)")

    return 0


if __name__ == "__main__":
    sys.exit(main())
