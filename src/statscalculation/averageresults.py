#!/usr/bin/env python3
"""
Average NER and results across the timestamped analysis runs

Averages the per-run ``NER.csv`` and ``results.csv`` over every timestamped run
directory (e.g. ``20260813_050011_616064489_4040162``), matching the runs that
``averageber.py`` uses, and writes ``average_NER.csv`` and
``average_results.csv`` at the top of the analysis directory.

Counts are rounded to the nearest whole function; rates keep their decimals.

Usage:
    python averageresults.py                       # defaults to data/llmanalysis
    python averageresults.py path/to/llmanalysis
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

NER_NAME = "NER.csv"
RESULTS_NAME = "results.csv"
AVERAGE_NER_NAME = "average_NER.csv"
AVERAGE_RESULTS_NAME = "average_results.csv"

RUN_DIR_PATTERN = re.compile(r"^\d+_\d+_\d+_\d+$")

NER_FIELDNAMES = [
    "Accelerator",
    "Platform",
    "Category",
    "Total_Functions",
    "Avg_Flagged_Functions",
    "Avg_Manually_Analyzed_Functions",
    "Avg_NER",
    "Runs",
]

# Metrics counted in whole functions; everything else is a rate.
COUNT_METRICS = {"Total", "Flagged", "Manual", "Retrieved", "TP"}
RATE_DECIMALS = {"BER": 2, "NER": 2, "VRC": 2, "Precision": 4, "Recall": 4, "F1": 4}


def to_float(value: str) -> Optional[float]:
    try:
        return float(value)
    except (TypeError, ValueError):
        return None


def mean(values: List[float]) -> Optional[float]:
    return sum(values) / len(values) if values else None


def format_metric(metric: str, value: Optional[float]) -> str:
    if value is None:
        return ""
    if metric in COUNT_METRICS:
        # Half-up, matching averageber.py; round() would break ties to even and
        # the two files disagree on Avg_Flagged_Functions for means like 12.5.
        return str(int(value + 0.5))
    return f"{value:.{RATE_DECIMALS.get(metric, 2)}f}"


def find_run_dirs(analysis_dir: Path, filename: str) -> List[Path]:
    return sorted(
        d for d in analysis_dir.iterdir()
        if d.is_dir() and RUN_DIR_PATTERN.match(d.name) and (d / filename).exists()
    )


def average_ner(analysis_dir: Path) -> Optional[Tuple[Path, int, int]]:
    run_dirs = find_run_dirs(analysis_dir, NER_NAME)
    if not run_dirs:
        return None

    order: List[Tuple[str, str, str]] = []
    totals: Dict[Tuple[str, str, str], str] = {}
    columns: Dict[str, Dict[Tuple[str, str, str], List[float]]] = {
        "Flagged_Functions": {},
        "Manually_Analyzed_Functions": {},
        "NER": {},
    }

    for run_dir in run_dirs:
        with open(run_dir / NER_NAME, "r", encoding="utf-8", newline="") as handle:
            for row in csv.DictReader(handle):
                key = (
                    row.get("Accelerator", "").strip(),
                    row.get("Platform", "").strip(),
                    row.get("Category", "").strip(),
                )
                if key not in totals:
                    order.append(key)
                    totals[key] = row.get("Total_Functions", "").strip()
                for column in columns:
                    value = to_float(row.get(column, ""))
                    if value is not None:
                        columns[column].setdefault(key, []).append(value)

    output_path = analysis_dir / AVERAGE_NER_NAME
    with open(output_path, "w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=NER_FIELDNAMES)
        writer.writeheader()
        for key in order:
            accelerator, platform, category = key
            flagged = mean(columns["Flagged_Functions"].get(key, []))
            manual = mean(columns["Manually_Analyzed_Functions"].get(key, []))
            ner = mean(columns["NER"].get(key, []))
            writer.writerow({
                "Accelerator": accelerator,
                "Platform": platform,
                "Category": category,
                "Total_Functions": totals[key],
                "Avg_Flagged_Functions": format_metric("Flagged", flagged),
                "Avg_Manually_Analyzed_Functions": format_metric("Manual", manual),
                "Avg_NER": format_metric("NER", ner),
                "Runs": len(columns["NER"].get(key, [])),
            })
    return output_path, len(order), len(run_dirs)


def read_results(path: Path) -> Tuple[List[str], List[str], List[List[str]]]:
    with open(path, "r", encoding="utf-8", newline="") as handle:
        rows = list(csv.reader(handle))
    if len(rows) < 3:
        return [], [], []

    groups: List[str] = []
    current = ""
    for cell in rows[0]:
        current = cell or current
        groups.append(current)
    return groups, rows[1], rows[2:]


def average_results(analysis_dir: Path) -> Optional[Tuple[Path, int, int]]:
    run_dirs = find_run_dirs(analysis_dir, RESULTS_NAME)
    if not run_dirs:
        return None

    groups: List[str] = []
    metrics: List[str] = []
    order: List[Tuple[str, str, str]] = []
    # (accelerator, platform, threshold) -> column index -> values
    cells: Dict[Tuple[str, str, str], Dict[int, List[float]]] = {}

    for run_dir in run_dirs:
        run_groups, run_metrics, body = read_results(run_dir / RESULTS_NAME)
        if not body:
            continue
        if not groups:
            groups, metrics = run_groups, run_metrics
        for row in body:
            key = (row[0], row[1], row[2])
            if key not in cells:
                order.append(key)
                cells[key] = {}
            for position in range(3, min(len(row), len(metrics))):
                value = to_float(row[position])
                if value is not None:
                    cells[key].setdefault(position, []).append(value)

    if not order:
        return None

    # groups was forward-filled on read; collapse it back so each category name
    # appears only above the first column of its block.
    header_top = ["", "", "", ""]
    previous = ""
    for group in groups[3:]:
        header_top.append(group if group != previous else "")
        previous = group
    header_bottom = metrics[:3] + ["Runs"] + metrics[3:]

    output_path = analysis_dir / AVERAGE_RESULTS_NAME
    with open(output_path, "w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(header_top)
        writer.writerow(header_bottom)
        for key in order:
            accelerator, platform, threshold = key
            counted = max((len(v) for v in cells[key].values()), default=0)
            row: List[str] = [accelerator, platform, threshold, str(counted)]
            for position in range(3, len(metrics)):
                row.append(format_metric(metrics[position], mean(cells[key].get(position, []))))
            writer.writerow(row)
    return output_path, len(order), len(run_dirs)


def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(
        description="Average NER.csv and results.csv across the timestamped analysis runs."
    )
    parser.add_argument(
        "analysis_dir", nargs="?", type=Path, default=DEFAULT_ANALYSIS_DIR,
        help="analysis directory holding the run directories",
    )
    args = parser.parse_args(argv)

    if not args.analysis_dir.is_dir():
        print(f"error: not a directory: {args.analysis_dir}", file=sys.stderr)
        return 1

    for averager in (average_ner, average_results):
        result = averager(args.analysis_dir)
        if result is None:
            print(f"[skip] {averager.__name__}: no matching run directories", file=sys.stderr)
            continue
        output_path, rows, runs = result
        print(f"{output_path.name}: {rows} rows averaged over {runs} runs")
    return 0


if __name__ == "__main__":
    sys.exit(main())
