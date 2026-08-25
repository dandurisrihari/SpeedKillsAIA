#!/usr/bin/env python3
"""
Unique Analysis Merger

Combines the per-log unique analysis CSVs for each accelerator into one file:

    unique_<platform>_boot_llm_analysis.csv
    unique_<platform>_dmesg_llm_analysis.csv
        -> unique_<platform>_llm_analysis.csv

Rows are grouped by category, and within a category sorted by score from high to
low. Boot rows are taken first, so a function scored the same in both logs keeps
its boot-log row. A function appearing in both logs under the same category is
kept once, with its higher-scoring row; the same name under a different category
is a separate finding and is preserved.

``Rank`` is renumbered per category to match the merged ordering, since the
source ranks are per-log and would otherwise collide.

An existing merged file is never overwritten. Pass --force to regenerate it.

Usage:
    python mergeunique.py data/llmanalysis/run2
    python mergeunique.py data/llmanalysis --recursive
    python mergeunique.py data/llmanalysis --recursive --force
"""

import argparse
import csv
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple

LOG_KINDS = ["boot", "dmesg"]

PLATFORMS = ["coral", "nxp", "ti", "hailo", "nvidia", "aws"]

# Emitted in this order; anything unrecognised is appended, sorted by name.
CATEGORY_ORDER = [
    "AIARelevantFunction",
    "Relevant_KD_Entry_Point",
    "Message_Structure_Handling",
]

RANK_FIELD = "Rank"
NAME_FIELD = "Function_Name"
CATEGORY_FIELD = "Category"
SCORE_FIELD = "Score"


def source_path(run_dir: Path, platform: str, log_kind: str) -> Path:
    return run_dir / f"unique_{platform}_{log_kind}_llm_analysis.csv"


def output_path(run_dir: Path, platform: str) -> Path:
    return run_dir / f"unique_{platform}_llm_analysis.csv"


def parse_score(raw: str) -> float:
    try:
        return float(raw)
    except (TypeError, ValueError):
        return 0.0


def read_rows(path: Path) -> Tuple[List[str], List[Dict[str, str]]]:
    if not path.exists():
        return [], []
    with open(path, "r", encoding="utf-8", newline="") as handle:
        reader = csv.DictReader(handle)
        return list(reader.fieldnames or []), list(reader)


def merge_platform(run_dir: Path, platform: str) -> Optional[Tuple[List[str], List[Dict[str, str]], int]]:
    """Returns the merged fieldnames, rows and the number of duplicates dropped."""
    fieldnames: List[str] = []
    combined: List[Dict[str, str]] = []
    for log_kind in LOG_KINDS:
        names, rows = read_rows(source_path(run_dir, platform, log_kind))
        if names and not fieldnames:
            fieldnames = names
        combined.extend(rows)

    if not fieldnames or not combined:
        return None

    # Insertion order encodes the boot-before-dmesg preference, so it doubles as
    # the tie-break once rows are sorted by score.
    best: Dict[Tuple[str, str], Tuple[float, int, Dict[str, str]]] = {}
    for order, row in enumerate(combined):
        key = (row.get(CATEGORY_FIELD, ""), row.get(NAME_FIELD, ""))
        score = parse_score(row.get(SCORE_FIELD, ""))
        if key not in best or score > best[key][0]:
            best[key] = (score, order, row)

    duplicates = len(combined) - len(best)

    by_category: Dict[str, List[Tuple[float, int, Dict[str, str]]]] = {}
    for (category, _), entry in best.items():
        by_category.setdefault(category, []).append(entry)

    known = [c for c in CATEGORY_ORDER if c in by_category]
    extra = sorted(c for c in by_category if c not in CATEGORY_ORDER)

    merged: List[Dict[str, str]] = []
    for category in known + extra:
        entries = sorted(by_category[category], key=lambda item: (-item[0], item[1]))
        for rank, (_, _, row) in enumerate(entries, start=1):
            row = dict(row)
            if RANK_FIELD in row:
                row[RANK_FIELD] = str(rank)
            merged.append(row)

    return fieldnames, merged, duplicates


def process_run_dir(run_dir: Path, force: bool) -> List[str]:
    messages: List[str] = []
    for platform in PLATFORMS:
        if not any(source_path(run_dir, platform, kind).exists() for kind in LOG_KINDS):
            continue

        target = output_path(run_dir, platform)
        if target.exists() and not force:
            messages.append(f"[keep] {target.name} already exists; --force to regenerate")
            continue

        result = merge_platform(run_dir, platform)
        if result is None:
            messages.append(f"[skip] {platform}: source CSVs had no rows")
            continue

        fieldnames, rows, duplicates = result
        with open(target, "w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(rows)

        note = f", {duplicates} duplicate(s) dropped" if duplicates else ""
        messages.append(f"{target.name}: {len(rows)} rows{note}")
    return messages


def collect_run_dirs(paths: List[Path], recursive: bool) -> List[Path]:
    run_dirs: List[Path] = []
    for path in paths:
        if not path.is_dir():
            print(f"[skip] {path}: not a directory", file=sys.stderr)
            continue
        candidates = [path]
        if recursive:
            candidates += sorted(p for p in path.rglob("*") if p.is_dir())
        run_dirs += [d for d in candidates if any(d.glob("unique_*_llm_analysis.csv"))]
    return run_dirs


def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(
        description="Merge the boot and dmesg unique analysis CSVs into one file per accelerator."
    )
    parser.add_argument("inputs", nargs="+", type=Path, help="run directory/directories")
    parser.add_argument("-r", "--recursive", action="store_true", help="also search subdirectories for run directories")
    parser.add_argument("-f", "--force", action="store_true", help="regenerate an existing merged file instead of leaving it alone")
    args = parser.parse_args(argv)

    run_dirs = collect_run_dirs(args.inputs, args.recursive)
    if not run_dirs:
        print("No analysis run directories found.", file=sys.stderr)
        return 1

    for run_dir in run_dirs:
        print(f"\n{run_dir}")
        for message in process_run_dir(run_dir, args.force):
            print(f"  {message}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
