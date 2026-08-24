#!/usr/bin/env python3
"""
BER CSV Generator

For each LLM analysis run directory, counts the unique functions flagged per
category (score > 0, function names de-duplicated across the boot and dmesg
CSVs) for every accelerator and writes a ``BER.csv`` next to those CSVs.

    BER = (total_functions - flagged_functions) / total_functions * 100

Usage:
    python ber.py data/llmanalysis/run2
    python ber.py data/llmanalysis --recursive
"""

import argparse
import csv
import sys
from pathlib import Path
from typing import Dict, List, Optional, Set

OUTPUT_NAME = "BER.csv"
LOG_KINDS = ["boot", "dmesg"]

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

CATEGORY_MAPPING = {
    "AIARelevantFunction": "Relevant Functions",
    "Relevant_KD_Entry_Point": "KD Entry Point",
    "Message_Structure_Handling": "SMem Handling",
}
CATEGORIES = ["Relevant Functions", "KD Entry Point", "SMem Handling"]

FIELDNAMES = ["Accelerator", "Platform", "Category", "Total_Functions", "Flagged_Functions", "BER"]


def extract_function_name(raw_name: str) -> str:
    """``drivers/foo.c:bar`` and ``user_copy:bar`` both become ``bar``."""
    return raw_name.split(":")[-1].strip()


def parse_score(raw_score: str) -> float:
    try:
        return float(raw_score)
    except (TypeError, ValueError):
        return 0.0


def collect_flagged(run_dir: Path, platform: str) -> Optional[Dict[str, Set[str]]]:
    """Union the score>0 function names of the boot and dmesg CSVs, per category."""
    flagged: Dict[str, Set[str]] = {category: set() for category in CATEGORIES}
    found = False

    for kind in LOG_KINDS:
        csv_path = run_dir / f"{platform}_{kind}_llm_analysis.csv"
        if not csv_path.exists():
            continue
        found = True
        with open(csv_path, "r", encoding="utf-8", errors="ignore", newline="") as handle:
            for row in csv.DictReader(handle):
                category = CATEGORY_MAPPING.get(row.get("Category", "").strip())
                if not category or parse_score(row.get("Score", "")) <= 0:
                    continue
                name = extract_function_name(row.get("Function_Name", ""))
                if name:
                    flagged[category].add(name)

    return flagged if found else None


def build_rows(run_dir: Path) -> List[Dict[str, object]]:
    rows: List[Dict[str, object]] = []
    for platform in PLATFORMS:
        flagged = collect_flagged(run_dir, platform)
        if flagged is None:
            continue
        total = TOTAL_FUNCTIONS.get(platform)
        for category in CATEGORIES:
            count = len(flagged[category])
            rows.append({
                "Accelerator": PLATFORM_DISPLAY_NAMES.get(platform, platform),
                "Platform": platform,
                "Category": category,
                "Total_Functions": total if total else "",
                "Flagged_Functions": count,
                "BER": f"{(total - count) / total * 100:.2f}" if total else "",
            })
    return rows


def process_run_dir(run_dir: Path) -> Optional[Path]:
    rows = build_rows(run_dir)
    if not rows:
        return None
    output_path = run_dir / OUTPUT_NAME
    with open(output_path, "w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(rows)
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
        run_dirs += [d for d in candidates if any(d.glob("*_llm_analysis.csv"))]
    return run_dirs


def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(
        description="Write BER.csv (unique flagged functions per category) into each analysis run directory."
    )
    parser.add_argument("inputs", nargs="+", type=Path, help="run directory/directories")
    parser.add_argument("-r", "--recursive", action="store_true", help="also search subdirectories for run directories")
    args = parser.parse_args(argv)

    run_dirs = collect_run_dirs(args.inputs, args.recursive)
    if not run_dirs:
        print("No analysis run directories found.", file=sys.stderr)
        return 1

    for run_dir in run_dirs:
        output_path = process_run_dir(run_dir)
        if output_path is None:
            print(f"[skip] {run_dir}: no platform CSVs matched", file=sys.stderr)
            continue
        print(f"{run_dir} -> {output_path}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
