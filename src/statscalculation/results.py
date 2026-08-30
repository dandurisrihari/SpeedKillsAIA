#!/usr/bin/env python3
"""
Ground-truth scoring for the LLM analysis runs

For each run directory this fills in NER.csv and writes a results.csv holding
every figure in one place.

Manual effort. Within a category the merged unique_<platform>_llm_analysis.csv is
ranked by score, so the rank of the lowest-ranked target function is how far a
reviewer must read to have seen them all. That maximum is written to
Manually_Analyzed_Functions, and NER follows from it:

    NER = (total_functions - manually_analyzed_functions) / total_functions * 100

Threshold sweep. Treating "score >= threshold" as the retrieved set, for each
threshold from 50 to 100 in steps of 2.5:

    precision = |retrieved n targets| / |retrieved|
    recall    = |retrieved n targets| / |targets|
    f1        = harmonic mean of the two

Note the sweep thresholds the LLM's Score column. VRC is the separate hand-scored
confidence, averaged per category and reported as vrc_avg.

Usage:
    python results.py data/llmanalysis/run2
    python results.py data/llmanalysis --recursive
"""

import argparse
import csv
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple

MERGED_TEMPLATE = "unique_{platform}_llm_analysis.csv"
NER_NAME = "NER.csv"
BER_NAME = "BER.csv"
RESULTS_NAME = "results.csv"

PLATFORMS = ["coral", "nxp", "ti", "hailo", "nvidia", "aws"]

PLATFORM_DISPLAY_NAMES = {
    "coral": "Google TPU",
    "nxp": "NXP NPU",
    "ti": "TMMA",
    "hailo": "HAILO NPU",
    "nvidia": "NVIDIA GPU",
    "aws": "AWS INF",
}

TOTAL_FUNCTIONS = {
    "coral": 159,
    "nxp": 1273,
    "ti": 6138,
    "hailo": 296,
    "nvidia": 7624,
    "aws": 635,
}

# Report category -> the category label used inside the analysis CSVs.
CATEGORIES = {
    "Relevant Functions": "AIARelevantFunction",
    "KD Entry Point": "Relevant_KD_Entry_Point",
    "SMem Handling": "Message_Structure_Handling",
}

# Target functions per platform and category, against how much of the ground
# truth each one accounts for. One function often covers several: finding
# gasket_handle_ioctl finds both GASKET_IOCTL_MAP_BUFFER and
# GASKET_IOCTL_MAP_BUFFER_FLAGS, and finding _GFPAlloc is finding
# gckMMU_FillFlatMappingWithPage16M with it. |G| is these added up, so recall is
# whole when every target is retrieved. The scores these once held are read off
# each run instead.
GROUND_TRUTH: Dict[Tuple[str, str], Dict[str, int]] = {
    ("coral", "Relevant Functions"): {"gasket_perform_mapping": 1},
    # GASKET_IOCTL_MAP_BUFFER, GASKET_IOCTL_MAP_BUFFER_FLAGS
    ("coral", "KD Entry Point"): {"gasket_handle_ioctl": 2},
    ("coral", "SMem Handling"): {"gasket_map_buffers_flags": 1},

    # _GFPAlloc covers gckMMU_FillFlatMappingWithPage16M, import_page_map covers
    # gckOS_MapPagesEx.
    ("nxp", "Relevant Functions"): {"_GFPAlloc": 2, "import_page_map": 2},
    ("nxp", "KD Entry Point"): {
        "gckVIDMEM_NODE_WrapUserMemory": 1,
        "gckVIDMEM_NODE_LockCPU": 1,
    },
    ("nxp", "SMem Handling"): {
        "gckVIDMEM_NODE_WrapUserMemory": 1,
        "gckVIDMEM_NODE_LockCPU": 1,
    },

    ("ti", "Relevant Functions"): {"dma_heap_map_dma_buf": 1, "dma_buf_phys_convert": 1},
    ("ti", "KD Entry Point"): {"dma_heap_ioctl": 1, "dma_buf_phys_ioctl": 1},
    ("ti", "SMem Handling"): {"dma_buf_phys_ioctl": 1, "dma_heap_ioctl_allocate": 1},

    ("hailo", "Relevant Functions"): {"hailo_desc_list_create": 1, "hailo_vdma_buffer_map": 1},
    ("hailo", "KD Entry Point"): {
        "hailo_desc_list_create_ioctl": 1,
        "hailo_vdma_buffer_map_ioctl": 1,
    },
    ("hailo", "SMem Handling"): {"hailo_desc_list_create_ioctl": 1},

    ("nvidia", "Relevant Functions"): {
        "nvmap_ioctl_create_from_va": 1,
        "nvgpu_vm_map_buffer": 1,
    },
    # nvmap_ioctl covers NVMAP_IOC_FROM_VA and NVMAP_IOC_GET_FD.
    ("nvidia", "KD Entry Point"): {"nvmap_ioctl": 2, "gk20a_as_dev_ioctl": 1},
    ("nvidia", "SMem Handling"): {
        "nvmap_ioctl_create_from_va": 1,
        "nvmap_ioctl_getfd": 1,
        "gk20a_as_ioctl_map_buffer_ex": 1,
    },

    ("aws", "Relevant Functions"): {
        "mc_alloc_internal": 1,
        "ncdev_mem_buf_copy": 1,
        "ncdev_mem_get_pa_deprecated": 1,
    },
    # NEURON_IOCTL_MEM_GET_PA, NEURON_IOCTL_MEM_ALLOC, NEURON_IOCTL_MEM_BUF_COPY
    ("aws", "KD Entry Point"): {"ncdev_ioctl": 3},
    ("aws", "SMem Handling"): {
        "ncdev_mem_get_pa_deprecated": 1,
        "ncdev_mem_buf_copy": 1,
        "mc_alloc_internal": 1,
    },
}

THRESHOLD_STEP = 2.5
THRESHOLDS = [50 + THRESHOLD_STEP * step for step in range(int(50 / THRESHOLD_STEP) + 1)]

# Repeated under each category in the second header row.
METRIC_COLUMNS = [
    "Total", "Flagged", "BER", "Manual", "NER", "VRC",
    "Retrieved", "TP", "Precision", "Recall", "F1",
]
INDEX_COLUMNS = ["Accelerator", "Platform", "Threshold"]


def parse_number(raw: str) -> Optional[float]:
    try:
        return float(raw)
    except (TypeError, ValueError):
        return None


def read_category_rows(run_dir: Path, platform: str) -> Dict[str, List[Tuple[int, str, float]]]:
    """Maps each CSV category label to its (rank, name, score) rows."""
    path = run_dir / MERGED_TEMPLATE.format(platform=platform)
    if not path.exists():
        return {}

    rows: Dict[str, List[Tuple[int, str, float]]] = {}
    with open(path, "r", encoding="utf-8", newline="") as handle:
        for row in csv.DictReader(handle):
            rank = parse_number(row.get("Rank", ""))
            score = parse_number(row.get("Score", ""))
            rows.setdefault(row.get("Category", ""), []).append(
                (int(rank) if rank is not None else 0, row.get("Function_Name", "").strip(), score or 0.0)
            )
    return rows


def read_flagged(run_dir: Path) -> Dict[Tuple[str, str], str]:
    path = run_dir / BER_NAME
    if not path.exists():
        return {}
    flagged: Dict[Tuple[str, str], str] = {}
    with open(path, "r", encoding="utf-8", newline="") as handle:
        for row in csv.DictReader(handle):
            key = (row.get("Platform", "").strip(), row.get("Category", "").strip())
            flagged[key] = row.get("Flagged_Functions", "").strip()
    return flagged


def score_category(
    entries: List[Tuple[int, str, float]], targets: Dict[str, int]
) -> Tuple[Optional[int], Optional[float], List[str], List[str], List[Dict[str, object]]]:
    """Returns the manual effort, mean target score, present/missing targets and the sweep."""
    by_name = {name: (rank, score) for rank, name, score in entries}
    present = [name for name in targets if name in by_name]
    missing = [name for name in targets if name not in by_name]
    ground_truth = sum(targets.values())

    manual: Optional[int] = None
    position = 0
    for _, name, _ in entries:
        # A target standing for several findings is that many to work through:
        # _GFPAlloc is read, then gckMMU_FillFlatMappingWithPage16M with it. That
        # keeps the effort at least as large as |G|, so |G|/manual stays a rate.
        position += targets.get(name, 1)
        if name in targets:
            manual = position
    # VRC is read off this run rather than the hand-assigned table, so it varies
    # run to run and is worth averaging. A function standing for several of the
    # ground truth weighs that many times.
    found = sum(targets[name] for name in present)
    vrc = (
        sum(by_name[name][1] * targets[name] for name in present) / found
        if found else None
    )

    sweep: List[Dict[str, object]] = []
    for threshold in THRESHOLDS:
        retrieved = [name for _, name, score in entries if score >= threshold]
        true_positives = sum(targets.get(name, 0) for name in retrieved)
        # Counted the same way on both sides: a retrieved target stands for as
        # much of the ground truth as it covers, anything else for one function.
        returned = sum(targets.get(name, 1) for name in retrieved)
        precision = true_positives / returned if returned else 0.0
        recall = true_positives / ground_truth if ground_truth else 0.0
        f1 = (
            2 * precision * recall / (precision + recall)
            if precision + recall > 0
            else 0.0
        )
        sweep.append({
            "threshold": threshold,
            "retrieved": len(retrieved),
            "true_positives": true_positives,
            "precision": f"{precision:.4f}",
            "recall": f"{recall:.4f}",
            "f1": f"{f1:.4f}",
        })
    return manual, vrc, present, missing, sweep


def update_ner(run_dir: Path, cell_by_key: Dict[Tuple[str, str], Dict[str, Optional[float]]]) -> int:
    """Fills the derived columns in place, leaving anything else in the file alone."""
    path = run_dir / NER_NAME
    if not path.exists():
        return 0

    with open(path, "r", encoding="utf-8", newline="") as handle:
        reader = csv.DictReader(handle)
        fieldnames = list(reader.fieldnames or [])
        rows = list(reader)

    filled = 0
    for row in rows:
        key = (row.get("Platform", "").strip(), row.get("Category", "").strip())
        cell = cell_by_key.get(key)
        total = parse_number(row.get("Total_Functions", ""))
        if cell is None or total is None or not total:
            continue
        manual, vrc = cell["manual"], cell["vrc"]
        if vrc is not None and "VRC" in fieldnames:
            row["VRC"] = f"{vrc:.2f}"
        if manual is None:
            continue
        row["Manually_Analyzed_Functions"] = str(int(manual))
        row["NER"] = f"{(total - manual) / total * 100:.2f}"
        filled += 1

    with open(path, "w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)
    return filled


def process_run_dir(run_dir: Path) -> List[str]:
    messages: List[str] = []
    flagged_counts = read_flagged(run_dir)
    cell_by_key: Dict[Tuple[str, str], Dict[str, Optional[float]]] = {}

    # platform -> category -> {"scalars": {...}, "sweep": {threshold: {...}}}
    table: Dict[str, Dict[str, Dict[str, object]]] = {}
    covered: List[str] = []

    for platform in PLATFORMS:
        category_rows = read_category_rows(run_dir, platform)
        if not category_rows:
            continue
        covered.append(platform)
        total = TOTAL_FUNCTIONS.get(platform)
        table[platform] = {}

        for category, csv_label in CATEGORIES.items():
            targets = GROUND_TRUTH.get((platform, category), {})
            entries = sorted(category_rows.get(csv_label, []))
            manual, vrc, present, missing, sweep = score_category(entries, targets)
            cell_by_key[(platform, category)] = {"manual": manual, "vrc": vrc}

            if missing:
                messages.append(
                    f"warning: {platform}/{category}: not in CSV: {', '.join(missing)}"
                )

            flagged = flagged_counts.get((platform, category), "")
            flagged_value = parse_number(flagged)
            ber = f"{(total - flagged_value) / total * 100:.2f}" if total and flagged_value is not None else ""
            ner = f"{(total - manual) / total * 100:.2f}" if total and manual is not None else ""
            vrc_text = f"{vrc:.2f}" if vrc is not None else ""

            table[platform][category] = {
                "scalars": {
                    "Total": total or "",
                    "Flagged": flagged,
                    "BER": ber,
                    "Manual": manual if manual is not None else "",
                    "NER": ner,
                    "VRC": vrc_text,
                },
                "sweep": {point["threshold"]: point for point in sweep},
            }

    if not table:
        return messages

    filled = update_ner(run_dir, cell_by_key)
    rows = write_results(run_dir, table, covered)

    messages.append(f"{NER_NAME}: {filled} rows filled")
    messages.append(f"{RESULTS_NAME}: {len(covered)} platforms x {len(THRESHOLDS)} thresholds = {rows} rows")
    return messages


def write_results(
    run_dir: Path, table: Dict[str, Dict[str, Dict[str, object]]], covered: List[str]
) -> int:
    """Writes the platform-by-category matrix, one row per platform and threshold.

    Uses a two-row header so each category owns a block of columns; read it with
    ``pandas.read_csv(path, header=[0, 1])``.
    """
    categories = list(CATEGORIES)

    top = [""] * len(INDEX_COLUMNS)
    bottom = list(INDEX_COLUMNS)
    for category in categories:
        top += [category] + [""] * (len(METRIC_COLUMNS) - 1)
        bottom += METRIC_COLUMNS

    body: List[List[object]] = []
    for platform in covered:
        for threshold in THRESHOLDS:
            row: List[object] = [
                PLATFORM_DISPLAY_NAMES.get(platform, platform),
                platform,
                f"{threshold:g}",
            ]
            for category in categories:
                cell = table[platform].get(category)
                if cell is None:
                    row += [""] * len(METRIC_COLUMNS)
                    continue
                scalars = cell["scalars"]
                point = cell["sweep"][threshold]
                # Scalars do not vary with the threshold; they repeat so that any
                # single row is self-contained.
                row += [
                    scalars["Total"], scalars["Flagged"], scalars["BER"],
                    scalars["Manual"], scalars["NER"], scalars["VRC"],
                    point["retrieved"], point["true_positives"],
                    point["precision"], point["recall"], point["f1"],
                ]
            body.append(row)

    with open(run_dir / RESULTS_NAME, "w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(top)
        writer.writerow(bottom)
        writer.writerows(body)
    return len(body)


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
        description="Fill NER.csv from the ground-truth ranks and write a combined results.csv."
    )
    parser.add_argument("inputs", nargs="+", type=Path, help="run directory/directories")
    parser.add_argument("-r", "--recursive", action="store_true", help="also search subdirectories for run directories")
    args = parser.parse_args(argv)

    run_dirs = collect_run_dirs(args.inputs, args.recursive)
    if not run_dirs:
        print("No analysis run directories found.", file=sys.stderr)
        return 1

    for run_dir in run_dirs:
        print(f"\n{run_dir}")
        for message in process_run_dir(run_dir):
            print(f"  {message}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
