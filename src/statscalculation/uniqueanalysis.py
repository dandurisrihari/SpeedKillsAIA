#!/usr/bin/env python3
"""
Unique Analysis CSV Generator

Reads an LLM analysis CSV (``*_llm_analysis.csv`` / ``analysis.csv``), strips the
file-path (or ``user_copy:``) prefix from ``Function_Name``, drops rows scored 0
and, within each scoring category, keeps one row per function name (the highest
scoring one) sorted by ``Score`` in descending order.

Usage:
    python uniqueanalysis.py analysis.csv
    python uniqueanalysis.py analysis.csv -o unique_analysis.csv
    python uniqueanalysis.py data/llmanalysis/run2            # every CSV in the dir
    python uniqueanalysis.py data/llmanalysis --recursive
"""

import argparse
import csv
import sys
from pathlib import Path
from typing import Dict, Iterable, List, Optional

FUNCTION_COLUMN = "Function_Name"
SCORE_COLUMN = "Score"
RANK_COLUMN = "Rank"
CATEGORY_COLUMN = "Category"

# Emitted in this order; any other category found is appended after these.
CATEGORY_ORDER = [
    "AIARelevantFunction",
    "Relevant_KD_Entry_Point",
    "Message_Structure_Handling",
]

CSV_GLOB = "*.csv"
OUTPUT_PREFIX = "unique_"
# Reports written by the other scripts in this directory, not analysis input.
EXCLUDED_NAMES = {
    "BER.csv",
    "NER.csv",
    "results.csv",
    "average_BER.csv",
    "average_NER.csv",
    "average_results.csv",
}


def extract_function_name(raw_name: str) -> str:
    """Return the bare function name, dropping any path or tag prefix.

    ``gasket-driver/src/gasket_core.c:gasket_pci_add_device`` -> ``gasket_pci_add_device``
    ``user_copy:dma_heap_ioctl``                              -> ``dma_heap_ioctl``
    ``dma_buf_phys_convert``                                  -> ``dma_buf_phys_convert``
    """
    return raw_name.split(":")[-1].strip()


def parse_score(raw_score: str) -> float:
    try:
        return float(raw_score)
    except (TypeError, ValueError):
        return 0.0


def deduplicate(rows: Iterable[Dict[str, str]]) -> List[Dict[str, str]]:
    """Keep one row per function name *within each category*, score descending.

    Rows scored 0 are dropped, categories are emitted in ``CATEGORY_ORDER`` and
    ``Rank`` restarts at 1 for each of them.
    """
    by_category: Dict[str, List[Dict[str, str]]] = {}
    for row in rows:
        name = extract_function_name(row.get(FUNCTION_COLUMN, ""))
        if not name or parse_score(row.get(SCORE_COLUMN, "")) <= 0:
            continue
        row = dict(row)
        row[FUNCTION_COLUMN] = name
        by_category.setdefault(row.get(CATEGORY_COLUMN, "").strip(), []).append(row)

    ordered = [c for c in CATEGORY_ORDER if c in by_category]
    ordered += [c for c in by_category if c not in CATEGORY_ORDER]

    unique: List[Dict[str, str]] = []
    for category in ordered:
        category_rows = by_category[category]
        # Stable sort keeps the original file order for equal scores.
        category_rows.sort(key=lambda r: parse_score(r.get(SCORE_COLUMN, "")), reverse=True)

        seen = set()
        rank = 0
        for row in category_rows:
            name = row[FUNCTION_COLUMN]
            if name in seen:
                continue
            seen.add(name)
            rank += 1
            if RANK_COLUMN in row:
                row[RANK_COLUMN] = str(rank)
            unique.append(row)
    return unique


def process_file(input_path: Path, output_path: Path) -> Dict[str, int]:
    """Write the de-duplicated version of ``input_path`` to ``output_path``."""
    with open(input_path, "r", encoding="utf-8", errors="ignore", newline="") as handle:
        reader = csv.DictReader(handle)
        if not reader.fieldnames:
            raise ValueError(f"{input_path} is empty or has no header row")
        if FUNCTION_COLUMN not in reader.fieldnames:
            raise ValueError(f"{input_path} has no '{FUNCTION_COLUMN}' column")
        fieldnames = list(reader.fieldnames)
        unique_rows = deduplicate(reader)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(unique_rows)

    counts: Dict[str, int] = {}
    for row in unique_rows:
        category = row.get(CATEGORY_COLUMN, "").strip()
        counts[category] = counts.get(category, 0) + 1
    return counts


def default_output_path(input_path: Path) -> Path:
    """``analysis.csv`` -> ``unique_analysis.csv`` next to the input file."""
    return input_path.with_name(OUTPUT_PREFIX + input_path.name)


def collect_inputs(paths: Iterable[Path], recursive: bool) -> List[Path]:
    inputs: List[Path] = []
    for path in paths:
        if path.is_dir():
            found = sorted(path.rglob(CSV_GLOB) if recursive else path.glob(CSV_GLOB))
            inputs.extend(
                p for p in found
                if not p.name.startswith(OUTPUT_PREFIX) and p.name not in EXCLUDED_NAMES
            )
        else:
            inputs.append(path)
    return inputs


def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(
        description="Create unique_<name>.csv with unique, path-stripped function names per category, sorted by score."
    )
    parser.add_argument("inputs", nargs="+", type=Path, help="analysis CSV file(s) or directory/directories")
    parser.add_argument("-o", "--output", type=Path, help="output CSV path (only valid for a single input file)")
    parser.add_argument("-r", "--recursive", action="store_true", help="recurse into subdirectories of input dirs")
    args = parser.parse_args(argv)

    inputs = collect_inputs(args.inputs, args.recursive)
    if not inputs:
        print("No CSV files found.", file=sys.stderr)
        return 1
    if args.output and len(inputs) > 1:
        parser.error("--output can only be used with a single input file")

    failures = 0
    for input_path in inputs:
        output_path = args.output if args.output else default_output_path(input_path)
        try:
            counts = process_file(input_path, output_path)
        except (OSError, ValueError) as exc:
            print(f"[skip] {input_path}: {exc}", file=sys.stderr)
            failures += 1
            continue
        breakdown = ", ".join(f"{cat}={n}" for cat, n in counts.items())
        print(f"{input_path} -> {output_path} ({sum(counts.values())} rows: {breakdown})")

    return 1 if failures == len(inputs) else 0


if __name__ == "__main__":
    sys.exit(main())
