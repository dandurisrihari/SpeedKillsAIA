#!/usr/bin/env python3
"""
Collects ioctl statistics for the drivers this project builds.

create-codeql-database.sh names the source tree for each accelerator, but two
of its profiles hand off to a build-drivers.sh that decides which subtrees are
actually compiled, so the accelerator is not the unit to report on: ti builds
four drivers and nvidia two. Those ten are the drivers with their own stats in
data/instrumentation, and they are the ten reported here.

Every root below records where it came from, and --verify re-reads the two
build-drivers.sh scripts to check the lists still agree.

Usage:
    python ioctl_stats.py                 # the table
    python ioctl_stats.py --files         # what is being read
    python ioctl_stats.py --verify        # check against build-drivers.sh
    python ioctl_stats.py --csv ioctl-stats.csv
"""

import argparse
import csv
import re
import sys
from pathlib import Path
from typing import Dict, List, NamedTuple, Optional, Sequence, Tuple

sys.path.insert(0, str(Path(__file__).resolve().parent))

from ioctl_codes import analyse, source_files  # noqa: E402

REPOSITORY = Path(__file__).resolve().parents[2]
KERNEL_SOURCES = REPOSITORY / "data" / "kernel_sources"


class Source(NamedTuple):
    name: str
    platform: str
    roots: Tuple[str, ...]
    origin: str


# hailo compiles in linux/pcie but declares its codes in common, so the whole
# hailort-drivers tree is the unit, matching the codeql path filter.
MANIFEST: List[Source] = [
    Source("aws", "aws", ("aws-neuronx-2.20.28.0",),
           "create-codeql-database.sh: aws-codeql-db"),
    Source("coral", "coral", ("gasket-driver",),
           "create-codeql-database.sh: google-codeql-db"),
    Source("hailo", "hailo", ("hailort-drivers",),
           "create-codeql-database.sh: hailo-codeql-db"),
    Source("nxp", "nxp", ("drivers/mxc/gpu-viv",),
           "create-codeql-database.sh: nxp-codeql-db"),
    Source("nvidia_nvgpu", "nvidia", ("drivers/gpu/nvgpu",),
           "build-drivers.sh: DRIVER_PATH[nvgpu]"),
    Source("nvidia_nvmap", "nvidia", ("drivers/video/tegra/nvmap",),
           "build-drivers.sh: DRIVER_PATH[nvmap]"),
    Source("ti_dmabuf", "ti", ("drivers/dma-buf",), "build-drivers.sh: DIRS"),
    Source("ti_misc", "ti", ("drivers/misc",), "build-drivers.sh: DIRS"),
    Source("ti_remoteproc", "ti", ("drivers/remoteproc",), "build-drivers.sh: DIRS"),
    Source("ti_rpmsg", "ti", ("drivers/rpmsg",), "build-drivers.sh: DIRS"),
]

BUILD_SCRIPTS = {
    "ti": Path("/home/sri/Desktop/Research/Accelerators_Research/ti_tda4vm/kernel_source"
               "/board-support/ti-linux-kernel-6.1.80+gitAUTOINC+2e423244f8-ti/build-drivers.sh"),
    "nvidia": Path("/home/sri/Desktop/Research/Accelerators_Research/nvidia/speedkillseval"
                   "/build-drivers.sh"),
}

TI_DIRS = re.compile(r"DIRS=\(([^)]*)\)")
NVIDIA_PATHS = re.compile(r"\[(\w+)\]=(\S+)")


def roots_of(source: Source) -> List[Path]:
    return [KERNEL_SOURCES / source.platform / root for root in source.roots]


def declared_roots(platform: str) -> List[str]:
    return sorted({root for s in MANIFEST if s.platform == platform for root in s.roots})


def build_script_roots(platform: str) -> Optional[List[str]]:
    """Reads the subtrees straight out of build-drivers.sh, if it is reachable."""
    path = BUILD_SCRIPTS.get(platform)
    if path is None or not path.is_file():
        return None
    text = path.read_text(errors="replace")
    if platform == "ti":
        match = TI_DIRS.search(text)
        return sorted(d.rstrip("/") for d in match.group(1).split()) if match else []
    return sorted(value.rstrip("/") for _, value in NVIDIA_PATHS.findall(text))


def verify() -> int:
    """Fails if build-drivers.sh has grown a driver the manifest does not have."""
    problems = 0
    for platform in sorted(BUILD_SCRIPTS):
        built = build_script_roots(platform)
        if built is None:
            print(f"  {platform:<8} build-drivers.sh not reachable, cannot check")
            continue
        listed = declared_roots(platform)
        if built == listed:
            print(f"  {platform:<8} agrees: {', '.join(listed)}")
            continue
        problems += 1
        print(f"  {platform:<8} DIFFERS")
        for root in sorted(set(built) - set(listed)):
            print(f"    built but not reported: {root}")
        for root in sorted(set(listed) - set(built)):
            print(f"    reported but not built: {root}")
    return problems


def missing(source: Source) -> List[Path]:
    return [path for path in roots_of(source) if not path.is_dir()]


def report_files(sources: Sequence[Source], show_each: bool) -> None:
    total = 0
    for source in sources:
        paths = source_files(*[p for p in roots_of(source) if p.is_dir()])
        total += len(paths)
        print(f"\n{source.name}  ({len(paths)} files)")
        print(f"  from {source.origin}")
        for root in roots_of(source):
            mark = "" if root.is_dir() else "   MISSING"
            print(f"  {root.relative_to(REPOSITORY)}{mark}")
        if show_each:
            for path in paths:
                print(f"    {path.relative_to(REPOSITORY)}")
    print(f"\n{total} source files across {len(sources)} drivers")


def collect(sources: Sequence[Source]) -> List[Tuple[Source, object, int]]:
    results = []
    for source in sources:
        present = [p for p in roots_of(source) if p.is_dir()]
        if not present:
            print(f"[skip] {source.name}: no sources at {roots_of(source)[0]}", file=sys.stderr)
            continue
        results.append((source, analyse(*present, name=source.name), len(source_files(*present))))
    return results


def report(results: Sequence[Tuple[Source, object, int]]) -> None:
    header = (f"{'driver':<15}{'files':>7}{'declared':>10}{'dispatched':>12}"
              f"{'external':>10}{'2nd level':>11}{'effective':>11}")
    print(header)
    print("-" * len(header))
    for source, driver, files in results:
        print(f"{source.name:<15}{files:>7}{len(driver.declared):>10}{len(driver.dispatched):>12}"
              f"{len(driver.external):>10}{len(driver.second_level):>11}{len(driver.effective):>11}")

    print("\ndeclared    codes the driver defines with _IO/_IOR/_IOW/_IOWR")
    print("dispatched  codes handled by the switch on the ioctl cmd argument")
    print("external    dispatched codes the driver handles but does not define")
    print("2nd level   commands behind a single code, via a field of the argument struct")
    print("effective   dispatched plus second level")


def write_csv(results: Sequence[Tuple[Source, object, int]], path: Path, force: bool) -> bool:
    if path.exists() and not force:
        print(f"[skip] {path} exists; pass --force to overwrite", file=sys.stderr)
        return False
    with open(path, "w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["Driver", "Platform", "SourceFiles", "Declared", "Dispatched",
                         "External", "SecondLevel", "Effective", "DeclaredNotDispatched",
                         "Roots"])
        for source, driver, files in results:
            writer.writerow([source.name, source.platform, files, len(driver.declared),
                             len(driver.dispatched), len(driver.external),
                             len(driver.second_level), len(driver.effective),
                             len(driver.undispatched), " ".join(source.roots)])
    print(f"wrote {path}")
    return True


def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(description="Collect ioctl statistics per driver.")
    parser.add_argument("-d", "--driver", action="append", help="limit to this driver, repeatable")
    parser.add_argument("-f", "--files", action="store_true", help="show the source files instead")
    parser.add_argument("-l", "--list", action="store_true", help="with --files, name every file")
    parser.add_argument("--verify", action="store_true", help="check the roots against build-drivers.sh")
    parser.add_argument("--csv", type=Path, help="also write the table to this file")
    parser.add_argument("--force", action="store_true", help="overwrite an existing csv")
    args = parser.parse_args(argv)

    sources = MANIFEST
    if args.driver:
        wanted = set(args.driver)
        sources = [s for s in MANIFEST if s.name in wanted]
        unknown = wanted - {s.name for s in MANIFEST}
        if unknown:
            print(f"unknown driver: {', '.join(sorted(unknown))}", file=sys.stderr)
            print(f"known: {', '.join(s.name for s in MANIFEST)}", file=sys.stderr)
            return 1

    if args.verify:
        return 1 if verify() else 0

    absent = [root for source in sources for root in missing(source)]
    if absent:
        for root in absent:
            print(f"[warn] missing source root: {root}", file=sys.stderr)

    if args.files:
        report_files(sources, args.list)
        return 0

    results = collect(sources)
    if not results:
        return 1
    report(results)
    if args.csv and not write_csv(results, args.csv, args.force):
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
