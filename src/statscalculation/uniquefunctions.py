#!/usr/bin/env python3
"""
Unique Functions Extractor

Reads CSV files for all platforms and prints unique functions from each category
for both boot and dmesg CSV files with score > 0.

Usage:
    python uniquefunctions.py
"""

import csv
from pathlib import Path
from typing import Dict, Set, List, Tuple
from dataclasses import dataclass


# =============================================================================
# CONFIGURATION
# =============================================================================

SCRIPT_DIR = Path(__file__).parent.resolve()
PROJECT_ROOT = SCRIPT_DIR.parent.parent
LLM_ANALYSIS_DIR = PROJECT_ROOT / "data" / "llmanalysis" / "run2"

# Platforms to analyze
PLATFORMS = ["coral", "nxp", "ti", "hailo", "nvidia", "aws"]

# Platform display names
PLATFORM_DISPLAY_NAMES = {
    "coral": "Google TPU",
    "nxp": "NXP NPU",
    "ti": "TMMA",
    "hailo": "HAILO NPU",
    "nvidia": "NVIDIA GPU",
    "aws": "AWS INF",
}

# CSV category names mapping
CATEGORY_MAPPING = {
    "AIARelevantFunction": "AIA Relevant Functions",
    "Relevant_KD_Entry_Point": "KD Entry Point",
    "Message_Structure_Handling": "SMem Handling",
}

# Categories in order
CATEGORIES = ["AIA Relevant Functions", "KD Entry Point", "SMem Handling"]


# =============================================================================
# DATA CLASSES
# =============================================================================

@dataclass
class FunctionInfo:
    """Information about a unique function."""
    name: str
    rank: int
    score: float
    source_file: str  # 'dmesg', 'boot', or 'both'
    message_structures: str = ""  # For SMem Handling category
    smids_identified: str = ""  # For SMem Handling category


# =============================================================================
# FUNCTIONS
# =============================================================================

def extract_function_name(raw_name: str) -> str:
    """
    Extract clean function name from various formats.
    
    Examples:
        'path/to/file.c:function_name' -> 'function_name'
        'user_copy:function_name' -> 'function_name'
        'dma:function_name' -> 'function_name'
        'function_name' -> 'function_name'
    """
    if ':' in raw_name:
        parts = raw_name.split(':')
        return parts[-1].strip()
    return raw_name.strip()


def parse_csv_file(csv_path: Path) -> Dict[str, Dict[str, FunctionInfo]]:
    """
    Parse a single CSV file and extract unique functions per category.
    
    Args:
        csv_path: Path to CSV file
        
    Returns:
        Dict of category -> {func_name -> FunctionInfo}
    """
    result: Dict[str, Dict[str, FunctionInfo]] = {cat: {} for cat in CATEGORIES}
    
    if not csv_path.exists():
        return result
    
    try:
        with open(csv_path, 'r', encoding='utf-8', errors='ignore') as f:
            reader = csv.DictReader(f)
            
            for row in reader:
                try:
                    # Get category
                    csv_category = row.get('Category', '').strip()
                    category = CATEGORY_MAPPING.get(csv_category)
                    if not category:
                        continue
                    
                    # Get score - only include if > 0
                    try:
                        score = float(row.get('Score', 0))
                    except (ValueError, TypeError):
                        score = 0.0
                    
                    if score <= 0:
                        continue
                    
                    # Extract function name
                    raw_name = row.get('Function_Name', '').strip()
                    if not raw_name:
                        continue
                    func_name = extract_function_name(raw_name)
                    
                    # Get rank
                    try:
                        rank = int(row.get('Rank', 999))
                    except (ValueError, TypeError):
                        rank = 999
                    
                    # Get Message_Structures and SMIDs_Identified for SMem Handling
                    message_structures = row.get('Message_Structures', '').strip()
                    smids_identified = row.get('SMIDs_Identified', '').strip()
                    
                    # Keep entry with best (lowest) rank for duplicates
                    if func_name not in result[category]:
                        result[category][func_name] = FunctionInfo(
                            name=func_name,
                            rank=rank,
                            score=score,
                            source_file=csv_path.stem,
                            message_structures=message_structures,
                            smids_identified=smids_identified
                        )
                    elif rank < result[category][func_name].rank:
                        result[category][func_name] = FunctionInfo(
                            name=func_name,
                            rank=rank,
                            score=score,
                            source_file=csv_path.stem,
                            message_structures=message_structures,
                            smids_identified=smids_identified
                        )
                        
                except Exception:
                    continue
                    
    except Exception as e:
        print(f"  Error reading {csv_path.name}: {e}")
    
    return result


def merge_results(
    dmesg_result: Dict[str, Dict[str, FunctionInfo]],
    boot_result: Dict[str, Dict[str, FunctionInfo]]
) -> Dict[str, Dict[str, FunctionInfo]]:
    """
    Merge results from dmesg and boot CSVs.
    
    Args:
        dmesg_result: Results from dmesg CSV
        boot_result: Results from boot CSV
        
    Returns:
        Merged results with source tracking
    """
    merged: Dict[str, Dict[str, FunctionInfo]] = {cat: {} for cat in CATEGORIES}
    
    for category in CATEGORIES:
        dmesg_funcs = dmesg_result.get(category, {})
        boot_funcs = boot_result.get(category, {})
        
        # All function names from both
        all_func_names = set(dmesg_funcs.keys()) | set(boot_funcs.keys())
        
        for func_name in all_func_names:
            in_dmesg = func_name in dmesg_funcs
            in_boot = func_name in boot_funcs
            
            if in_dmesg and in_boot:
                # Use the one with better rank, mark as 'both'
                dmesg_info = dmesg_funcs[func_name]
                boot_info = boot_funcs[func_name]
                
                if dmesg_info.rank <= boot_info.rank:
                    merged[category][func_name] = FunctionInfo(
                        name=func_name,
                        rank=dmesg_info.rank,
                        score=dmesg_info.score,
                        source_file='both',
                        message_structures=dmesg_info.message_structures,
                        smids_identified=dmesg_info.smids_identified
                    )
                else:
                    merged[category][func_name] = FunctionInfo(
                        name=func_name,
                        rank=boot_info.rank,
                        score=boot_info.score,
                        source_file='both',
                        message_structures=boot_info.message_structures,
                        smids_identified=boot_info.smids_identified
                    )
            elif in_dmesg:
                info = dmesg_funcs[func_name]
                merged[category][func_name] = FunctionInfo(
                    name=func_name,
                    rank=info.rank,
                    score=info.score,
                    source_file='dmesg',
                    message_structures=info.message_structures,
                    smids_identified=info.smids_identified
                )
            else:
                info = boot_funcs[func_name]
                merged[category][func_name] = FunctionInfo(
                    name=func_name,
                    rank=info.rank,
                    score=info.score,
                    source_file='boot',
                    message_structures=info.message_structures,
                    smids_identified=info.smids_identified
                )
    
    return merged


def print_platform_results(
    platform: str,
    display_name: str,
    dmesg_result: Dict[str, Dict[str, FunctionInfo]],
    boot_result: Dict[str, Dict[str, FunctionInfo]],
    merged_result: Dict[str, Dict[str, FunctionInfo]]
):
    """Print results for a platform."""
    print(f"\n{'=' * 80}")
    print(f"  {display_name} ({platform})")
    print(f"{'=' * 80}")
    
    for category in CATEGORIES:
        dmesg_funcs = dmesg_result.get(category, {})
        boot_funcs = boot_result.get(category, {})
        merged_funcs = merged_result.get(category, {})
        
        print(f"\n  📁 {category}")
        print(f"  {'-' * 70}")
        print(f"  Unique functions: {len(merged_funcs)} (dmesg: {len(dmesg_funcs)}, boot: {len(boot_funcs)})")
        print(f"  {'-' * 70}")
        
        if not merged_funcs:
            print("    (no functions with score > 0)")
            continue
        
        # Sort by score (highest to lowest), then by rank (lowest first) for ties
        sorted_funcs = sorted(merged_funcs.values(), key=lambda x: (-x.score, x.rank))
        
        # Different output format for SMem Handling (includes Message_Structures and SMIDs)
        if category == "SMem Handling":
            print(f"  {'#':<4} {'Score':<8} {'Rank':<6} {'Source':<10} {'Function Name':<40} {'Message Structures':<50} {'SMIDs Identified'}")
            print(f"  {'-' * 185}")
            
            for idx, func in enumerate(sorted_funcs, 1):
                msg_struct = func.message_structures if func.message_structures else "None"
                smids = func.smids_identified if func.smids_identified else "None"
                print(f"  {idx:<4} {func.score:<8.0f} {func.rank:<6} {func.source_file:<10} {func.name:<40} {msg_struct:<50} {smids}")
        else:
            print(f"  {'#':<4} {'Score':<8} {'Rank':<6} {'Source':<10} {'Function Name'}")
            print(f"  {'-' * 75}")
            
            for idx, func in enumerate(sorted_funcs, 1):
                print(f"  {idx:<4} {func.score:<8.0f} {func.rank:<6} {func.source_file:<10} {func.name}")


def main():
    """Main entry point."""
    print("\n" + "=" * 80)
    print("              UNIQUE FUNCTIONS EXTRACTOR")
    print("              (Score > 0 only)")
    print("=" * 80)
    print(f"LLM Analysis Dir: {LLM_ANALYSIS_DIR}")
    
    # Summary stats
    total_stats = {cat: {'total': 0, 'platforms': 0} for cat in CATEGORIES}
    
    for platform in PLATFORMS:
        display_name = PLATFORM_DISPLAY_NAMES.get(platform, platform)
        
        # CSV file paths
        dmesg_csv = LLM_ANALYSIS_DIR / f"{platform}_dmesg_llm_analysis.csv"
        boot_csv = LLM_ANALYSIS_DIR / f"{platform}_boot_llm_analysis.csv"
        
        # Check if at least one exists
        dmesg_exists = dmesg_csv.exists()
        boot_exists = boot_csv.exists()
        
        if not dmesg_exists and not boot_exists:
            print(f"\n⚠ {display_name}: No CSV files found")
            continue
        
        # Parse CSVs
        dmesg_result = parse_csv_file(dmesg_csv) if dmesg_exists else {cat: {} for cat in CATEGORIES}
        boot_result = parse_csv_file(boot_csv) if boot_exists else {cat: {} for cat in CATEGORIES}
        
        # Merge results
        merged_result = merge_results(dmesg_result, boot_result)
        
        # Print results
        print_platform_results(platform, display_name, dmesg_result, boot_result, merged_result)
        
        # Update summary stats
        for category in CATEGORIES:
            count = len(merged_result.get(category, {}))
            if count > 0:
                total_stats[category]['total'] += count
                total_stats[category]['platforms'] += 1
    
    # Print summary
    print("\n" + "=" * 80)
    print("  SUMMARY")
    print("=" * 80)
    
    for category in CATEGORIES:
        stats = total_stats[category]
        avg = stats['total'] / stats['platforms'] if stats['platforms'] > 0 else 0
        print(f"  {category}:")
        print(f"    Total unique functions: {stats['total']}")
        print(f"    Platforms with data: {stats['platforms']}")
        print(f"    Average per platform: {avg:.1f}")
    
    print("\n" + "=" * 80)


if __name__ == "__main__":
    main()
