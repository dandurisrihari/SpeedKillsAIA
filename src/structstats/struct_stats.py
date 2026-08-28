#!/usr/bin/env python3
"""
Counts the C structures a driver defines.

The sources are parsed with tree-sitter rather than matched, so a tag that
looks like an attribute, a struct returned from a function, and a brace inside
a string are all read as C rather than guessed at.

A structure is counted where it is defined, meaning a struct or union with a
body. C gives a driver three ways to write one and they are reported apart,
because only the first two give the structure a name:

    tagged      struct gasket_page_table_ioctl { ... }
    typedef     typedef struct { ... } gcsHAL_INTERFACE
    anonymous   a struct or union embedded as a member of another

A declaration with no body, struct foo;, defines nothing, and is reported only
where the driver never defines that structure, since it belongs to something
the driver builds against.

Tagged and typedef structures are counted once per name however often the
sources define them, which matters where a driver carries one header under
several platform ifdefs. Anonymous ones have no name to merge on and are
counted where they appear.

Usage:
    python struct_stats.py --driver coral=/path/to/gasket-driver --output data/struct-stats
"""

import argparse
import csv
import re
import sys
from pathlib import Path
from typing import Dict, List, NamedTuple, Optional, Sequence, Set, Tuple

# The C reading is shared with the ioctl counter rather than written twice.
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "ioctlsurface"))

from ioctl_codes import source_files, strip_comments  # noqa: E402

try:
    import tree_sitter_c
    from tree_sitter import Language, Node, Parser
except ImportError:  # pragma: no cover - depends on the interpreter in use
    print("tree-sitter is required: pip install tree_sitter tree_sitter-c", file=sys.stderr)
    raise

SUMMARY_NAME = "struct-stats.csv"
SPECIFIERS = {"struct_specifier": "struct", "union_specifier": "union"}
# Kernel drivers write struct bodies as macros, which no C grammar can read
# unexpanded, so tagged definitions are also looked for directly. Requiring the
# brace to follow the tag keeps "struct foo *fn(void) {" and "struct foo x = {"
# out, neither of which defines anything.
TAGGED = re.compile(r"\b(struct|union)\s+([A-Za-z_]\w*)\s*(?:__\w+\s*)?\{")
LITERAL = re.compile(r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'', re.S)


def blank_literals(text: str) -> str:
    """Empties string and character literals, keeping length and newlines."""
    return LITERAL.sub(lambda m: "".join(c if c == "\n" else " " for c in m.group()), text)


class Structure(NamedTuple):
    kind: str
    form: str
    name: Optional[str]
    path: Path
    line: int


class Counts(NamedTuple):
    name: str
    roots: List[Path]
    files: int
    structures: List[Structure]
    forward_only: Set[str]
    unparsed: int

    def of(self, kind: str, form: Optional[str] = None) -> List[Structure]:
        return [s for s in self.structures
                if s.kind == kind and (form is None or s.form == form)]


def build_parser() -> Parser:
    return Parser(Language(tree_sitter_c.language()))


def text_of(node: Optional[Node]) -> Optional[str]:
    return node.text.decode("utf-8", "replace") if node is not None else None


def typedef_name(node: Node) -> Optional[str]:
    """The name a typedef gives a body that carries no tag of its own."""
    parent = node.parent
    while parent is not None and parent.type != "type_definition":
        # Only the declaration the body sits directly in can name it.
        if parent.type in ("field_declaration_list", "function_definition", "parameter_list"):
            return None
        parent = parent.parent
    if parent is None:
        return None
    for declarator in parent.children_by_field_name("declarator"):
        while declarator is not None and declarator.type != "type_identifier":
            declarator = declarator.child_by_field_name("declarator")
        if declarator is not None:
            return text_of(declarator)
    return None


def walk(node: Node, path: Path, found: List[Structure], referenced: Set[str]) -> None:
    kind = SPECIFIERS.get(node.type)
    if kind is not None:
        tag = text_of(node.child_by_field_name("name"))
        if node.child_by_field_name("body") is None:
            # struct foo; or a use such as struct foo *p; neither defines it.
            if tag:
                referenced.add(tag)
        elif tag:
            found.append(Structure(kind, "tagged", tag, path, node.start_point[0] + 1))
        else:
            name = typedef_name(node)
            found.append(Structure(kind, "typedef" if name else "anonymous", name,
                                   path, node.start_point[0] + 1))
    for child in node.children:
        walk(child, path, found, referenced)


def analyse(*roots: Path, name: Optional[str] = None) -> Counts:
    paths = source_files(*roots)
    reader = build_parser()
    merged: Dict[Tuple[str, str, str], Structure] = {}
    anonymous: List[Structure] = []
    defined: Set[str] = set()
    referenced: Set[str] = set()
    unparsed = 0

    for path in paths:
        try:
            source = path.read_bytes()
        except OSError as error:
            print(f"[skip] {path}: {error}", file=sys.stderr)
            continue
        found: List[Structure] = []
        walk(reader.parse(source).root_node, path, found, referenced)

        parsed = {(s.kind, s.name) for s in found if s.name}
        readable = blank_literals(strip_comments(source.decode("utf-8", "replace")))
        for match in TAGGED.finditer(readable):
            key = (match.group(1), match.group(2))
            if key in parsed:
                continue
            parsed.add(key)
            unparsed += 1
            found.append(Structure(key[0], "tagged", key[1], path,
                                   readable.count("\n", 0, match.start()) + 1))

        for structure in found:
            if structure.name:
                defined.add(structure.name)
                merged.setdefault((structure.kind, structure.form, structure.name), structure)
            else:
                anonymous.append(structure)

    ordered = sorted(merged.values()) + anonymous
    return Counts(name or roots[0].name, list(roots), len(paths), ordered,
                  referenced - defined, unparsed)


def report(results: Sequence[Counts]) -> None:
    header = (f"{'driver':<15}{'files':>7}{'tagged':>9}{'typedef':>9}{'anonymous':>11}"
              f"{'unions':>8}{'structs':>9}{'total':>8}{'elsewhere':>11}")
    print(header)
    print("-" * len(header))
    for result in results:
        print(f"{result.name:<15}{result.files:>7}"
              f"{len(result.of('struct', 'tagged')):>9}"
              f"{len(result.of('struct', 'typedef')):>9}"
              f"{len(result.of('struct', 'anonymous')):>11}"
              f"{len(result.of('union')):>8}"
              f"{len(result.of('struct')):>9}"
              f"{len(result.structures):>8}"
              f"{len(result.forward_only):>11}")

    print("\ntagged      struct foo { ... }, counted once per name")
    print("typedef     typedef struct { ... } foo, counted once per name")
    print("anonymous   a struct or union embedded in another, counted where it appears")
    print("unions      the same three forms, for union rather than struct")
    print("structs     tagged plus typedef plus anonymous, structs only")
    print("total       structs plus unions")
    print("elsewhere   named in the sources but never defined there")
    recovered = sum(r.unparsed for r in results)
    if recovered:
        print(f"\ndefinitions with a macro for a body, read without the parser: {recovered}")


def write_detail(result: Counts, path: Path) -> None:
    lines: List[str] = [f"driver: {result.name}", "", "sources:"]
    lines += [f"  {root}" for root in result.roots]
    lines += [f"  {result.files} .c/.h files", ""]
    for kind in ("struct", "union"):
        lines.append(f"{kind}:")
        for form in ("tagged", "typedef", "anonymous"):
            lines.append(f"  {form:<10} {len(result.of(kind, form))}")
    lines += ["", f"structs: {len(result.of('struct'))}",
              f"unions:  {len(result.of('union'))}",
              f"total:   {len(result.structures)}", ""]
    if result.unparsed:
        lines += [f"definitions with a macro for a body, read without the parser: {result.unparsed}",
                  ""]

    if result.forward_only:
        lines.append(f"named but defined elsewhere ({len(result.forward_only)}):")
        lines += [f"  {name}" for name in sorted(result.forward_only)]
        lines.append("")

    for kind in ("struct", "union"):
        named = sorted(s.name for s in result.of(kind) if s.name)
        if not named:
            continue
        lines.append(f"named {kind}s ({len(named)}):")
        lines += [f"  {name}" for name in named]
        lines.append("")

    path.write_text("\n".join(lines), encoding="utf-8")


def write_summary(results: Sequence[Counts], path: Path) -> None:
    with open(path, "w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["Driver", "SourceFiles", "Tagged", "Typedef", "Anonymous",
                         "Unions", "Structs", "Total", "DefinedElsewhere", "Roots"])
        for result in results:
            writer.writerow([result.name, result.files,
                             len(result.of("struct", "tagged")),
                             len(result.of("struct", "typedef")),
                             len(result.of("struct", "anonymous")),
                             len(result.of("union")),
                             len(result.of("struct")),
                             len(result.structures),
                             len(result.forward_only),
                             " ".join(str(root) for root in result.roots)])


def parse_driver(spec: str) -> Tuple[str, Path]:
    name, separator, path = spec.partition("=")
    if not separator or not name or not path:
        raise argparse.ArgumentTypeError(f"expected NAME=PATH, got {spec!r}")
    return name, Path(path)


def collect(specs: Sequence[Tuple[str, Path]]) -> Tuple[List[Counts], int]:
    ordered: Dict[str, List[Path]] = {}
    for name, path in specs:
        ordered.setdefault(name, []).append(path)

    results: List[Counts] = []
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
        results.append(analyse(*present, name=name))
    return results, missing


def main(argv: Optional[List[str]] = None) -> int:
    arguments = argparse.ArgumentParser(description="Count the C structures a driver defines.")
    arguments.add_argument("-d", "--driver", action="append", type=parse_driver, required=True,
                           metavar="NAME=PATH", help="repeat per driver, and to add roots to one")
    arguments.add_argument("-o", "--output", type=Path, help="write the csv and detail files here")
    args = arguments.parse_args(argv)

    results, missing = collect(args.driver)
    if not results:
        return 1

    report(results)

    if args.output:
        args.output.mkdir(parents=True, exist_ok=True)
        for result in results:
            write_detail(result, args.output / f"{result.name}-structures.txt")
        write_summary(results, args.output / SUMMARY_NAME)
        print(f"\nwrote {len(results)} detail files and {SUMMARY_NAME} to {args.output}")

    return 1 if missing else 0


if __name__ == "__main__":
    sys.exit(main())
