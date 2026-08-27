#!/usr/bin/env python3
"""
Counts the ioctl codes a driver exposes.

Three counts are reported, because they answer different questions and can
differ by an order of magnitude on the same driver:

    declared    codes the driver defines with _IO/_IOR/_IOW/_IOWR, including
                through its own wrapper macros
    dispatched  codes the driver handles, read off the switch on the ioctl cmd
                argument; covers framework codes the driver handles but does
                not define, which is the only number a driver like TI has
    effective   dispatched, plus the commands of any second-level dispatch,
                where one code multiplexes many operations through a field of
                the argument struct

Nothing here keys off a driver name. A wrapper macro is found by resolving
definitions until they bottom out in _IO*, and a dispatch switch is found by
its controlling expression, so a driver that spells things differently is still
counted.

Usage:
    python ioctl_codes.py data/kernel_sources --each
    python ioctl_codes.py data/kernel_sources/nxp --list
    python ioctl_codes.py data/kernel_sources --each --csv ioctl-codes.csv
"""

import argparse
import csv
import re
import sys
from pathlib import Path
from typing import Dict, Iterable, List, NamedTuple, Optional, Sequence, Set, Tuple

# Preprocessed .i files repeat every header they pulled in, so reading them
# would count the same code many times over.
SOURCE_SUFFIXES = {".c", ".h"}
SKIP_DIRECTORIES = {".git", "__pycache__"}

# _IOC is the raw builder the others are written in terms of.
SEED_BUILDERS = {"_IO", "_IOR", "_IOW", "_IOWR", "_IOC"}
# Catches builders defined outside the tree being scanned, such as DRM_IOWR.
BUILDER_NAME = re.compile(r"^(?:[A-Za-z_]\w*_)?_?IO[WR]{0,2}_?$")

DEFINE = re.compile(r"^\s*#\s*define\s+([A-Za-z_]\w*)(\([^)]*\))?\s*(.*)$")
IDENTIFIER = re.compile(r"[A-Za-z_]\w*")
CALL = re.compile(r"^([A-Za-z_]\w*)\s*\(")
CASE_LABEL = re.compile(r"\bcase\s+([A-Za-z_]\w*)\s*(?:\.\.\.\s*[A-Za-z_]\w*\s*)?:")
CONDITIONAL = re.compile(r"^#\s*(if|ifdef|ifndef|elif|else|endif)\b(.*)$")
SWITCH = re.compile(r"\bswitch\s*\(")
# The cmd argument is named cmd, ucmd, kcmd or ioctl depending on the driver, so
# the handler is found by its own name and the switch by its shape instead.
IOCTL_FUNCTION = re.compile(r"ioctl", re.IGNORECASE)
COMMAND_FIELD = re.compile(r"^(?:cmd|command)s?$", re.IGNORECASE)
BARE_IDENTIFIER = re.compile(r"^[A-Za-z_]\w*$")
MEMBER_FIELD = re.compile(r"(?:->|\.)\s*([A-Za-z_]\w*)\s*$")
CALL_OPEN = re.compile(r"\b([A-Za-z_]\w*)\s*\(")
# A table of handlers, such as drm_ioctl_desc, dispatches without a switch.
IOCTL_TABLE = re.compile(r"struct\s+\w*ioctl\w*\s+\w+\s*\[[^\]]*\]\s*=\s*\{", re.IGNORECASE)
NOT_A_FUNCTION = {"if", "for", "while", "switch", "return", "sizeof", "do", "else",
                 "case", "defined", "catch"}


class Definition(NamedTuple):
    name: str
    params: Optional[str]
    body: str
    path: Path
    line: int


class Code(NamedTuple):
    name: str
    builder: str
    arguments: Tuple[str, ...]
    path: Path
    line: int


class Driver(NamedTuple):
    name: str
    declared: List[Code]
    dispatched: Set[str]
    external: Set[str]
    second_level: Set[str]

    @property
    def effective(self) -> Set[str]:
        return self.dispatched | self.second_level

    @property
    def undispatched(self) -> Set[str]:
        return {code.name for code in self.declared} - self.dispatched


def strip_comments(text: str) -> str:
    """Blanks comments while keeping every newline, so line numbers still hold."""
    out: List[str] = []
    state: Optional[str] = None
    index, end = 0, len(text)
    while index < end:
        char = text[index]
        following = text[index + 1] if index + 1 < end else ""
        if state is None:
            if char == "/" and following == "*":
                state, index = "block", index + 2
                out.append(" ")
                continue
            if char == "/" and following == "/":
                state, index = "line", index + 2
                continue
            if char in ('"', "'"):
                state = "string" if char == '"' else "char"
            out.append(char)
            index += 1
            continue
        if state == "block":
            if char == "*" and following == "/":
                state, index = None, index + 2
                continue
            out.append("\n" if char == "\n" else " ")
            index += 1
            continue
        if state == "line":
            if char == "\n":
                state = None
                out.append(char)
            index += 1
            continue
        if char == "\\":
            out.append(char)
            if index + 1 < end:
                out.append(following)
            index += 2
            continue
        if (state == "string" and char == '"') or (state == "char" and char == "'"):
            state = None
        out.append(char)
        index += 1
    return "".join(out)


def drop_disabled(text: str) -> str:
    """Blanks #if 0 blocks, which are how dead ioctl codes are usually retired."""
    lines = text.split("\n")
    kept: List[str] = []
    depth, skipping = 0, None
    for line in lines:
        match = CONDITIONAL.match(line.strip())
        if match:
            kind, rest = match.group(1), match.group(2).strip()
            if kind in ("if", "ifdef", "ifndef"):
                depth += 1
                if skipping is None and kind == "if" and re.fullmatch(r"0+", rest):
                    skipping = depth
            elif kind in ("else", "elif") and skipping == depth:
                skipping = None
            elif kind == "endif":
                if skipping == depth:
                    skipping = None
                depth -= 1
        kept.append("" if skipping is not None else line)
    return "\n".join(kept)


def logical_lines(text: str) -> List[Tuple[int, str]]:
    """Joins backslash continuations, reporting the line the definition starts on."""
    joined: List[Tuple[int, str]] = []
    buffer: Optional[str] = None
    start = 0
    for number, line in enumerate(text.split("\n"), 1):
        if buffer is None:
            start, buffer = number, line
        else:
            buffer += " " + line
        if buffer.rstrip().endswith("\\"):
            buffer = buffer.rstrip()[:-1]
        else:
            joined.append((start, buffer))
            buffer = None
    if buffer is not None:
        joined.append((start, buffer))
    return joined


def split_arguments(text: str) -> Tuple[str, ...]:
    """Splits a macro argument list on commas that are not nested."""
    arguments: List[str] = []
    depth, current = 0, ""
    for char in text:
        if char in "([{":
            depth += 1
        elif char in ")]}":
            depth -= 1
        if char == "," and depth == 0:
            arguments.append(current.strip())
            current = ""
            continue
        current += char
    if current.strip():
        arguments.append(current.strip())
    return tuple(arguments)


def balanced(text: str, start: int, opening: str, closing: str) -> Tuple[str, int]:
    """Returns the span opened at start and the index just past its close."""
    depth, index = 0, start
    while index < len(text):
        char = text[index]
        if char == opening:
            depth += 1
        elif char == closing:
            depth -= 1
            if depth == 0:
                return text[start + 1:index], index + 1
        index += 1
    return text[start + 1:], len(text)


def source_files(root: Path) -> List[Path]:
    return sorted(
        path
        for path in root.rglob("*")
        if path.suffix in SOURCE_SUFFIXES
        and path.is_file()
        and not any(part in SKIP_DIRECTORIES for part in path.parts)
    )


def read_definitions(paths: Iterable[Path]) -> Tuple[List[Definition], Dict[Path, str]]:
    definitions: List[Definition] = []
    prepared: Dict[Path, str] = {}
    for path in paths:
        try:
            raw = path.read_text(encoding="utf-8", errors="replace")
        except OSError as error:
            print(f"[skip] {path}: {error}", file=sys.stderr)
            continue
        text = drop_disabled(strip_comments(raw))
        prepared[path] = text
        for line, content in logical_lines(text):
            match = DEFINE.match(content)
            if match:
                definitions.append(
                    Definition(match.group(1), match.group(2), match.group(3).strip(), path, line)
                )
    return definitions, prepared


def resolve_builders(definitions: Sequence[Definition]) -> Set[str]:
    """Follows definitions until they bottom out in _IO*, so wrappers are found."""
    builders = set(SEED_BUILDERS)
    builders |= {d.name for d in definitions if BUILDER_NAME.match(d.name)}
    changed = True
    while changed:
        changed = False
        for definition in definitions:
            if definition.name in builders:
                continue
            # Taking a builder's name is what separates a wrapper from a code:
            # a wrapper either takes arguments or renames the builder outright,
            # whereas a code calls it.
            if definition.params is not None:
                wrapper = bool(builders & set(IDENTIFIER.findall(definition.body)))
            else:
                wrapper = definition.body.strip() in builders
            if wrapper:
                builders.add(definition.name)
                changed = True
    return builders


def is_builder(name: str, builders: Set[str]) -> bool:
    """A builder the tree defines, or one it only uses, such as DRM_IOWR."""
    return name in builders or BUILDER_NAME.match(name) is not None


def declared_codes(definitions: Sequence[Definition], builders: Set[str]) -> List[Code]:
    codes: Dict[str, Code] = {}
    for definition in definitions:
        # A function-like define is the wrapper itself, not one of its codes.
        if definition.params is not None or definition.name in builders:
            continue
        match = CALL.match(definition.body)
        if not match or not is_builder(match.group(1), builders):
            continue
        arguments, _ = balanced(definition.body, definition.body.index("("), "(", ")")
        # The same code redefined under a different #ifdef is still one code.
        codes.setdefault(
            definition.name,
            Code(definition.name, match.group(1), split_arguments(arguments),
                 definition.path, definition.line),
        )
    return sorted(codes.values())


def switches(text: str) -> List[Tuple[str, str, int, int]]:
    """Returns every switch as (expression, body, body start, body end)."""
    found: List[Tuple[str, str, int, int]] = []
    for match in SWITCH.finditer(text):
        expression, after = balanced(text, match.end() - 1, "(", ")")
        brace = text.find("{", after)
        if brace == -1:
            continue
        body, end = balanced(text, brace, "{", "}")
        found.append((expression.strip(), body, brace + 1, end))
    return found


def case_labels(text: str, body: str, start: int, nested: Sequence[Tuple[int, int]]) -> Set[str]:
    """Case labels of one switch, skipping any switch nested inside it."""
    labels: Set[str] = set()
    for match in CASE_LABEL.finditer(body):
        position = start + match.start()
        if any(inner_start <= position < inner_end for inner_start, inner_end in nested):
            continue
        labels.add(match.group(1))
    return labels


def functions(text: str) -> List[Tuple[str, int, int]]:
    """Returns each function as (name, body start, body end)."""
    found: List[Tuple[str, int, int]] = []
    for match in CALL_OPEN.finditer(text):
        name = match.group(1)
        if name in NOT_A_FUNCTION:
            continue
        _, after = balanced(text, match.end() - 1, "(", ")")
        remainder = text[after:]
        stripped = remainder.lstrip()
        if not stripped.startswith("{"):
            continue
        brace = after + (len(remainder) - len(stripped))
        _, end = balanced(text, brace, "{", "}")
        found.append((name, brace + 1, end))
    return found


def dispatch_sites(text: str, declared: Set[str]) -> Tuple[Set[str], Set[str]]:
    """Case labels of the cmd switch, and of any second-level command switch."""
    first: Set[str] = set()
    second: Set[str] = set()
    found = switches(text)
    handlers = [(start, end) for name, start, end in functions(text)
                if IOCTL_FUNCTION.search(name)]
    for expression, body, start, end in found:
        inner = [(s, e) for _, _, s, e in found if s > start and e <= end]
        labels = case_labels(text, body, start, inner)
        member = MEMBER_FIELD.search(expression)
        if member and COMMAND_FIELD.match(member.group(1)):
            # One code multiplexing many operations through the argument struct.
            second |= labels
            continue
        if not BARE_IDENTIFIER.match(expression):
            # A switch on _IOC_TYPE(cmd) or on sync.flags is not on the code.
            continue
        # Either the switch sits in the handler, or it decides on codes the
        # driver declared, which is evidence enough for one that does not.
        if any(s <= start < e for s, e in handlers) or labels & declared:
            first |= labels
    return first, second


def table_dispatch(text: str, declared: Set[str]) -> Set[str]:
    """Codes dispatched through a handler table rather than a switch."""
    matched: Set[str] = set()
    for match in IOCTL_TABLE.finditer(text):
        body, _ = balanced(text, match.end() - 1, "{", "}")
        for entry in split_arguments(body):
            call = CALL.match(entry)
            # DRM_IOCTL_DEF_DRV(VIV_GEM_CREATE, ...) pastes its argument onto a
            # prefix, so the declared name never appears here in full.
            argument = split_arguments(balanced(entry, entry.index("("), "(", ")")[0])[0] if call else entry
            if not IDENTIFIER.fullmatch(argument or ""):
                continue
            matched |= {name for name in declared
                        if name == argument or name.endswith("_" + argument)}
    return matched


def comparison_dispatch(text: str, declared: Set[str]) -> Set[str]:
    """Drivers that test the cmd with if/else rather than a switch."""
    matched: Set[str] = set()
    # An operand can be wrapped, as in _IOC_NR(cmd) == _IOC_NR(SOME_CODE), so
    # both sides are searched rather than required to be bare identifiers.
    for match in re.finditer(r"==|!=", text):
        before = re.split(r"[;{}]", text[max(0, match.start() - 120):match.start()])[-1]
        after = re.split(r"[;{}]", text[match.end():match.end() + 120])[0]
        matched |= declared & set(IDENTIFIER.findall(before + " " + after))
    return matched


def analyse(root: Path) -> Driver:
    paths = source_files(root)
    definitions, prepared = read_definitions(paths)
    builders = resolve_builders(definitions)
    declared = declared_codes(definitions, builders)
    names = {code.name for code in declared}

    first: Set[str] = set()
    second: Set[str] = set()
    for path in paths:
        if path.suffix != ".c":
            continue
        text = prepared[path]
        switch_first, switch_second = dispatch_sites(text, names)
        first |= switch_first
        second |= switch_second
        first |= comparison_dispatch(text, names)
        first |= table_dispatch(text, names)

    # A label that is not a code the driver defines is either a framework code
    # it handles or an unrelated constant; only the former reaches an ioctl.
    external = {name for name in first if name not in names}
    return Driver(root.name, declared, first, external, second - first)


def collisions(declared: Sequence[Code]) -> List[List[str]]:
    """Codes sharing a type and number, which alias to the same or near code."""
    groups: Dict[Tuple[str, ...], List[str]] = {}
    for code in declared:
        if len(code.arguments) < 2:
            continue
        groups.setdefault(code.arguments[:2], []).append(code.name)
    return [sorted(names) for names in groups.values() if len(names) > 1]


def report(drivers: Sequence[Driver], show_list: bool) -> None:
    header = f"{'driver':<10}{'declared':>10}{'dispatched':>12}{'external':>10}{'2nd level':>11}{'effective':>11}"
    print(header)
    print("-" * len(header))
    for driver in drivers:
        print(f"{driver.name:<10}{len(driver.declared):>10}{len(driver.dispatched):>12}"
              f"{len(driver.external):>10}{len(driver.second_level):>11}{len(driver.effective):>11}")

    print("\ndeclared    codes the driver defines with _IO/_IOR/_IOW/_IOWR")
    print("dispatched  codes handled by the switch on the ioctl cmd argument")
    print("external    dispatched codes the driver handles but does not define")
    print("2nd level   commands behind a single code, via a field of the argument struct")
    print("effective   dispatched plus second level")

    for driver in drivers:
        shared = collisions(driver.declared)
        unused = driver.undispatched
        elsewhere = driver.dispatched and not driver.declared
        if not shared and not unused and not elsewhere and not show_list:
            continue
        print(f"\n{driver.name}")
        if elsewhere:
            print("  declares no codes of its own: it handles codes defined outside")
            print("  this tree, so only the dispatched count is measurable here")
        for names in shared:
            print(f"  same type and number: {', '.join(names)}")
        if unused:
            print(f"  declared but never dispatched: {len(unused)}")
            if show_list:
                for name in sorted(unused):
                    print(f"    {name}")
        if show_list:
            if driver.external:
                print(f"  framework codes handled: {', '.join(sorted(driver.external))}")
            if driver.second_level:
                print(f"  second level commands: {len(driver.second_level)}")
                for name in sorted(driver.second_level):
                    print(f"    {name}")


def write_csv(drivers: Sequence[Driver], path: Path, force: bool) -> bool:
    if path.exists() and not force:
        print(f"[skip] {path} exists; pass --force to overwrite", file=sys.stderr)
        return False
    with open(path, "w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["Driver", "Declared", "Dispatched", "External", "SecondLevel",
                         "Effective", "DeclaredNotDispatched"])
        for driver in drivers:
            writer.writerow([driver.name, len(driver.declared), len(driver.dispatched),
                             len(driver.external), len(driver.second_level),
                             len(driver.effective), len(driver.undispatched)])
    print(f"wrote {path}")
    return True


def driver_roots(path: Path, each: bool) -> List[Path]:
    if not each:
        return [path]
    return sorted(p for p in path.iterdir() if p.is_dir() and p.name not in SKIP_DIRECTORIES)


def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(description="Count the ioctl codes a driver exposes.")
    parser.add_argument("root", type=Path, help="a driver source tree")
    parser.add_argument("-e", "--each", action="store_true",
                        help="treat each subdirectory of root as its own driver")
    parser.add_argument("-l", "--list", action="store_true", help="name the codes, not just count them")
    parser.add_argument("--csv", type=Path, help="also write the counts to this file")
    parser.add_argument("--force", action="store_true", help="overwrite an existing csv")
    args = parser.parse_args(argv)

    if not args.root.is_dir():
        print(f"{args.root}: not a directory", file=sys.stderr)
        return 1

    drivers = [analyse(root) for root in driver_roots(args.root, args.each)]
    if not drivers:
        print("no driver sources found", file=sys.stderr)
        return 1

    report(drivers, args.list)
    if args.csv and not write_csv(drivers, args.csv, args.force):
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
