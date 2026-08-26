#!/usr/bin/env python3
"""
Plots F1 against the VRC threshold for each category.

Reads the results.csv written by results.py and produces one image per run
directory holding three side-by-side plots, one per category, with a line per
accelerator.

Usage:
    python plotresults.py data/llmanalysis/run2
    python plotresults.py data/llmanalysis --recursive
"""

import argparse
import csv
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple

import matplotlib

# Chosen before pyplot is imported so the script runs without a display.
matplotlib.use("Agg")
import matplotlib.pyplot as plt  # noqa: E402

RESULTS_NAME = "results.csv"
OUTPUT_NAME = "results_plots.png"
# Aggregates live beside the run directories rather than inside one.
AGGREGATE_LABELS = ["average", "median"]

CATEGORIES = ["Relevant Functions", "KD Entry Point", "SMem Handling"]

THRESHOLD_COLUMN = "Threshold"
ACCELERATOR_COLUMN = "Accelerator"
RUNS_COLUMN = "Runs"
METRIC = "F1"


def read_run_count(path: Path) -> Optional[int]:
    """Aggregates record how many runs sit behind each cell in a Runs column."""
    with open(path, "r", encoding="utf-8", newline="") as handle:
        rows = list(csv.reader(handle))
    if len(rows) < 3 or RUNS_COLUMN not in rows[1]:
        return None
    position = rows[1].index(RUNS_COLUMN)
    counts = [
        int(row[position])
        for row in rows[2:]
        if len(row) > position and row[position].strip().isdigit()
    ]
    return max(counts) if counts else None


def read_results(path: Path) -> Tuple[List[str], Dict[str, Dict[str, List[Tuple[float, float]]]]]:
    """Returns the accelerators in file order and category -> accelerator -> points."""
    with open(path, "r", encoding="utf-8", newline="") as handle:
        rows = list(csv.reader(handle))
    if len(rows) < 3:
        return [], {}

    group_row, metric_row = rows[0], rows[1]

    # The category name only appears above the first column of its block.
    groups: List[str] = []
    current = ""
    for cell in group_row:
        current = cell or current
        groups.append(current)

    index = {name: position for position, name in enumerate(metric_row) if not groups[position]}
    metric_columns: Dict[str, int] = {}
    for position, (group, metric) in enumerate(zip(groups, metric_row)):
        if group and metric == METRIC:
            metric_columns[group] = position

    accelerators: List[str] = []
    series: Dict[str, Dict[str, List[Tuple[float, float]]]] = {c: {} for c in metric_columns}

    for row in rows[2:]:
        if not row or len(row) < len(metric_row):
            continue
        accelerator = row[index[ACCELERATOR_COLUMN]]
        if accelerator not in accelerators:
            accelerators.append(accelerator)
        try:
            threshold = float(row[index[THRESHOLD_COLUMN]])
        except ValueError:
            continue
        for category, position in metric_columns.items():
            try:
                value = float(row[position])
            except ValueError:
                continue
            series[category].setdefault(accelerator, []).append((threshold, value))

    for category in series:
        for accelerator in series[category]:
            series[category][accelerator].sort()
    return accelerators, series


def plot_run(run_dir: Path, results_name: str = RESULTS_NAME, output_name: str = OUTPUT_NAME,
             title: Optional[str] = None) -> Optional[Path]:
    results_path = run_dir / results_name
    if not results_path.exists():
        return None

    accelerators, series = read_results(results_path)
    if not series:
        return None

    categories = [c for c in CATEGORIES if c in series] or list(series)
    colours = plt.get_cmap("tab10").colors
    colour_of = {name: colours[i % len(colours)] for i, name in enumerate(accelerators)}

    figure, axes = plt.subplots(1, len(categories), figsize=(5.2 * len(categories), 4.4), sharey=True)
    if len(categories) == 1:
        axes = [axes]

    for axis, category in zip(axes, categories):
        for accelerator in accelerators:
            points = series[category].get(accelerator)
            if not points:
                continue
            axis.plot(
                [p[0] for p in points],
                [p[1] for p in points],
                marker="o",
                markersize=4,
                linewidth=1.6,
                label=accelerator,
                color=colour_of[accelerator],
            )
        axis.set_title(category)
        axis.set_xlabel("VRC threshold")
        axis.set_xticks(range(50, 101, 10))
        axis.set_xlim(48, 102)
        axis.grid(True, linewidth=0.4, alpha=0.5)

    axes[0].set_ylabel("F1 score")
    axes[0].set_ylim(-0.02, 1.02)

    handles, labels = axes[0].get_legend_handles_labels()
    figure.legend(handles, labels, loc="lower center", ncol=len(labels) or 1, frameon=False)
    figure.suptitle(title or f"F1 against VRC threshold - {run_dir.name}")
    # Leave room for the suptitle and the shared legend beneath the axes.
    figure.tight_layout(rect=(0, 0.09, 1, 0.94))

    output_path = run_dir / output_name
    figure.savefig(output_path, dpi=150)
    plt.close(figure)
    return output_path


def collect_run_dirs(paths: List[Path], recursive: bool) -> List[Path]:
    run_dirs: List[Path] = []
    for path in paths:
        if not path.is_dir():
            print(f"[skip] {path}: not a directory", file=sys.stderr)
            continue
        candidates = [path]
        if recursive:
            candidates += sorted(p for p in path.rglob("*") if p.is_dir())
        run_dirs += [d for d in candidates if (d / RESULTS_NAME).exists()]
    return run_dirs


def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(description="Plot F1 against the VRC threshold per category.")
    parser.add_argument("inputs", nargs="+", type=Path, help="run directory/directories")
    parser.add_argument("-r", "--recursive", action="store_true", help="also search subdirectories for run directories")
    args = parser.parse_args(argv)

    run_dirs = collect_run_dirs(args.inputs, args.recursive)
    if not run_dirs:
        print(f"No directories containing {RESULTS_NAME} found.", file=sys.stderr)
        return 1

    for run_dir in run_dirs:
        output_path = plot_run(run_dir)
        if output_path is None:
            print(f"[skip] {run_dir}: no plottable rows", file=sys.stderr)
            continue
        print(f"{run_dir.name} -> {output_path.name}")

    # The averaged and median files live beside the run directories.
    for path in args.inputs:
        for label in AGGREGATE_LABELS:
            aggregate_path = path / f"{label}_{RESULTS_NAME}"
            if not aggregate_path.exists():
                continue
            runs = read_run_count(aggregate_path)
            span = f"across {runs} runs" if runs else "across runs"
            output_path = plot_run(
                path, f"{label}_{RESULTS_NAME}", f"{label}_{OUTPUT_NAME}",
                title=f"F1 against VRC threshold - {label} {span}",
            )
            if output_path is not None:
                print(f"{path.name} -> {output_path.name}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
