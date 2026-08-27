#!/usr/bin/env python3
"""
Collects ioctl statistics for the drivers it is given.

The driver list lives in collect-ioctl-stats.sh, next to the codeql profiles it
mirrors, so the source paths are configured in one place and this only analyses
what it is handed. Repeat --driver with one name to give that driver several
roots.

Writes a summary csv and one detail file per driver into the output directory.

Usage:
    python ioctl_stats.py --driver coral=/path/to/gasket-driver --output data/ioctl-stats
"""

import argparse
import csv
import sys
from pathlib import Path
from typing import Dict, List, NamedTuple, Optional, Sequence, Tuple

sys.path.insert(0, str(Path(__file__).resolve().parent))

from ioctl_codes import analyse, collisions, source_files  # noqa: E402

SUMMARY_NAME = "ioctl-stats.csv"


class Result(NamedTuple):
    name: str
    roots: List[Path]
    files: int
    driver: object


def parse_driver(spec: str) -> Tuple[str, Path]:
    name, separator, path = spec.partition("=")
    if not separator or not name or not path:
        raise argparse.ArgumentTypeError(f"expected NAME=PATH, got {spec!r}")
    return name, Path(path)


def collect(specs: Sequence[Tuple[str, Path]]) -> Tuple[List[Result], int]:
    ordered: Dict[str, List[Path]] = {}
    for name, path in specs:
        ordered.setdefault(name, []).append(path)

    results: List[Result] = []
    missing = 0
    for name, roots in ordered.items():
        present = [root for root in roots if root.exists()]
        for root in roots:
            if not root.exists():
                print(f"[warn] {name}: missing source root {root}", file=sys.stderr)
                missing += 1
        if not present:
            print(f"[skip] {name}: no sources", file=sys.stderr)
            continue
        results.append(Result(name, present, len(source_files(*present)),
                              analyse(*present, name=name)))
    return results, missing


def report(results: Sequence[Result]) -> None:
    header = (f"{'driver':<15}{'files':>7}{'declared':>10}{'dispatched':>12}"
              f"{'external':>10}{'2nd level':>11}{'effective':>11}")
    print(header)
    print("-" * len(header))
    for result in results:
        driver = result.driver
        print(f"{result.name:<15}{result.files:>7}{len(driver.declared):>10}"
              f"{len(driver.dispatched):>12}{len(driver.external):>10}"
              f"{len(driver.second_level):>11}{len(driver.effective):>11}")

    print("\ndeclared    codes the driver defines with _IO/_IOR/_IOW/_IOWR")
    print("dispatched  codes handled by the switch on the ioctl cmd argument")
    print("external    dispatched codes the driver handles but does not define")
    print("2nd level   commands behind a single code, via a field of the argument struct")
    print("effective   dispatched plus second level")


def write_detail(result: Result, path: Path) -> None:
    driver = result.driver
    lines: List[str] = [f"driver: {result.name}", "", "sources:"]
    lines += [f"  {root}" for root in result.roots]
    lines += [f"  {result.files} .c/.h files", ""]
    lines += [
        f"declared:   {len(driver.declared)}",
        f"dispatched: {len(driver.dispatched)}",
        f"external:   {len(driver.external)}",
        f"2nd level:  {len(driver.second_level)}",
        f"effective:  {len(driver.effective)}",
        "",
    ]

    shared = collisions(driver.declared)
    if shared:
        lines.append("codes sharing a type and number:")
        lines += [f"  {', '.join(names)}" for names in shared]
        lines.append("")
    if driver.dispatched and not driver.declared:
        lines += ["this driver declares no codes of its own: it handles codes defined",
                  "outside the trees above, so only the dispatched count is measurable",
                  ""]

    for title, names in (
        ("declared codes", sorted(code.name for code in driver.declared)),
        ("dispatched codes", sorted(driver.dispatched)),
        ("declared but never dispatched", sorted(driver.undispatched)),
        ("handled but declared elsewhere", sorted(driver.external)),
        ("second level commands", sorted(driver.second_level)),
    ):
        if not names:
            continue
        lines.append(f"{title} ({len(names)}):")
        lines += [f"  {name}" for name in names]
        lines.append("")

    path.write_text("\n".join(lines), encoding="utf-8")


def write_summary(results: Sequence[Result], path: Path) -> None:
    with open(path, "w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["Driver", "SourceFiles", "Declared", "Dispatched", "External",
                         "SecondLevel", "Effective", "DeclaredNotDispatched", "Roots"])
        for result in results:
            driver = result.driver
            writer.writerow([result.name, result.files, len(driver.declared),
                             len(driver.dispatched), len(driver.external),
                             len(driver.second_level), len(driver.effective),
                             len(driver.undispatched),
                             " ".join(str(root) for root in result.roots)])


def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(description="Collect ioctl statistics per driver.")
    parser.add_argument("-d", "--driver", action="append", type=parse_driver, required=True,
                        metavar="NAME=PATH", help="repeat per driver, and to add roots to one")
    parser.add_argument("-o", "--output", type=Path, help="write the csv and detail files here")
    args = parser.parse_args(argv)

    results, missing = collect(args.driver)
    if not results:
        return 1

    report(results)

    if args.output:
        args.output.mkdir(parents=True, exist_ok=True)
        for result in results:
            write_detail(result, args.output / f"{result.name}-ioctl-codes.txt")
        write_summary(results, args.output / SUMMARY_NAME)
        print(f"\nwrote {len(results)} detail files and {SUMMARY_NAME} to {args.output}")

    return 1 if missing else 0


if __name__ == "__main__":
    sys.exit(main())
