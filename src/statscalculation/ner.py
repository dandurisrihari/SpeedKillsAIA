#!/usr/bin/env python3
"""
NER CSV Generator

Writes a ``NER.csv`` into every LLM analysis run directory with a blank
``Manually_Analyzed_Functions`` column to be filled in by hand, and computes:

    NER = (total_functions - manually_analyzed_functions) / total_functions * 100

``Flagged_Functions`` is carried across from the ``BER.csv`` in the same run
directory so both rates can be read from one file. It is reference data; the rate
itself is measured against the whole driver, exactly as BER is, which keeps the
two directly comparable.

An existing NER.csv is never overwritten. Pass --force to regenerate it, which
still preserves any hand-filled counts, or --reset to blank them.

Usage:
    python ner.py data/llmanalysis/run2
    python ner.py data/llmanalysis --recursive
    python ner.py data/llmanalysis --recursive --force   # recompute after filling counts
    python ner.py data/llmanalysis --recursive --force --reset
"""

import argparse
import csv
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple

OUTPUT_NAME = "NER.csv"
FLAGGED_SOURCE_NAME = "BER.csv"

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
FLAGGED_COLUMN = "Flagged_Functions"
VRC_COLUMN = "VRC"
FIELDNAMES = [
    "Accelerator",
    "Platform",
    "Category",
    "Total_Functions",
    FLAGGED_COLUMN,
    MANUAL_COLUMN,
    VRC_COLUMN,
    "NER",
]


def read_flagged(run_dir: Path) -> Dict[Tuple[str, str], str]:
    """Reads the flagged counts from the run's BER.csv."""
    path = run_dir / FLAGGED_SOURCE_NAME
    if not path.exists():
        return {}

    flagged: Dict[Tuple[str, str], str] = {}
    with open(path, "r", encoding="utf-8", newline="") as handle:
        for row in csv.DictReader(handle):
            key = (row.get("Platform", "").strip(), row.get("Category", "").strip())
            flagged[key] = row.get(FLAGGED_COLUMN, "").strip()
    return flagged


def read_existing_column(run_dir: Path, column: str) -> Dict[Tuple[str, str], str]:
    """Carries over a column from an existing NER.csv."""
    path = run_dir / OUTPUT_NAME
    if not path.exists():
        return {}

    existing: Dict[Tuple[str, str], str] = {}
    with open(path, "r", encoding="utf-8", newline="") as handle:
        for row in csv.DictReader(handle):
            key = (row.get("Platform", "").strip(), row.get("Category", "").strip())
            existing[key] = row.get(column, "").strip()
    return existing


def parse_count(raw: str) -> Optional[float]:
    try:
        return float(raw)
    except (TypeError, ValueError):
        return None


def build_rows(run_dir: Path, reset: bool) -> List[Dict[str, object]]:
    existing = {} if reset else read_existing_column(run_dir, MANUAL_COLUMN)
    # results.py fills these two, so a regeneration must not discard them.
    existing_vrc = {} if reset else read_existing_column(run_dir, VRC_COLUMN)
    # BER.csv is authoritative; a previously written NER.csv only covers for it.
    flagged_counts = read_flagged(run_dir) or read_existing_column(run_dir, FLAGGED_COLUMN)

    rows: List[Dict[str, object]] = []
    for platform in PLATFORMS:
        if not any(run_dir.glob(f"{platform}_*_llm_analysis.csv")):
            continue
        total = TOTAL_FUNCTIONS.get(platform)
        for category in CATEGORIES:
            manual_raw = existing.get((platform, category), "")
            flagged_raw = flagged_counts.get((platform, category), "")
            manual = parse_count(manual_raw)

            if total and manual is not None:
                ner = f"{(total - manual) / total * 100:.2f}"
            else:
                ner = ""

            rows.append({
                "Accelerator": PLATFORM_DISPLAY_NAMES.get(platform, platform),
                "Platform": platform,
                "Category": category,
                "Total_Functions": total if total else "",
                FLAGGED_COLUMN: flagged_raw,
                MANUAL_COLUMN: manual_raw,
                VRC_COLUMN: existing_vrc.get((platform, category), ""),
                "NER": ner,
            })
    return rows


def process_run_dir(run_dir: Path, reset: bool, force: bool) -> Optional[Tuple[Path, int, int]]:
    output_path = run_dir / OUTPUT_NAME
    if output_path.exists() and not force:
        return None
    rows = build_rows(run_dir, reset)
    if not rows:
        return None
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
    parser.add_argument("-f", "--force", action="store_true", help="regenerate an existing NER.csv instead of leaving it alone")
    parser.add_argument("--reset", action="store_true", help="blank the manual column instead of keeping filled values")
    args = parser.parse_args(argv)

    run_dirs = collect_run_dirs(args.inputs, args.recursive)
    if not run_dirs:
        print("No analysis run directories found.", file=sys.stderr)
        return 1

    for run_dir in run_dirs:
        if (run_dir / OUTPUT_NAME).exists() and not args.force:
            print(f"[keep] {run_dir / OUTPUT_NAME} already exists; --force to regenerate")
            continue
        result = process_run_dir(run_dir, args.reset, args.force)
        if result is None:
            print(f"[skip] {run_dir}: no platform CSVs matched", file=sys.stderr)
            continue
        output_path, filled, total_rows = result
        print(f"{run_dir} -> {output_path} ({filled}/{total_rows} rows with NER)")

    return 0


if __name__ == "__main__":
    sys.exit(main())
