"""
Tests for ioctl_stats.

These guard the manifest rather than the counting: a driver silently dropping
out of the report is the failure that would go unnoticed.
"""

import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

from src.ioctlsurface.ioctl_stats import (  # noqa: E402
    MANIFEST,
    build_script_roots,
    declared_roots,
    roots_of,
)


def test_driver_names_are_unique():
    names = [source.name for source in MANIFEST]
    assert len(names) == len(set(names))


def test_every_root_exists():
    absent = [root for source in MANIFEST for root in roots_of(source) if not root.is_dir()]
    assert absent == []


def test_every_driver_has_sources():
    for source in MANIFEST:
        files = [p for root in roots_of(source) for p in root.rglob("*") if p.suffix in {".c", ".h"}]
        assert files, f"{source.name} has no sources"


@pytest.mark.parametrize("platform", ["ti", "nvidia"])
def test_manifest_matches_build_drivers(platform):
    """The two platforms whose drivers build-drivers.sh decides, not the profile."""
    built = build_script_roots(platform)
    if built is None:
        pytest.skip(f"{platform} build-drivers.sh is not on this machine")
    assert built == declared_roots(platform)
