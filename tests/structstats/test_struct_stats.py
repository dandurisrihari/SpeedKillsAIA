"""
Tests for struct_stats.

Each case is a way C lets a driver write something that looks like a structure
definition and is not, or write one that is easy to miss. Needs the project
venv, since tree-sitter lives there.
"""

import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

pytest.importorskip("tree_sitter")

from src.structstats.struct_stats import analyse  # noqa: E402


def build(tmp_path, **files):
    root = tmp_path / "driver"
    root.mkdir()
    for name, text in files.items():
        (root / name).write_text(text)
    return root


def names(result, kind="struct"):
    return {s.name for s in result.of(kind) if s.name}


def test_tagged(tmp_path):
    r = analyse(build(tmp_path, **{"d.h": "struct gasket_page_table_ioctl { int a; };\n"}))
    assert names(r) == {"gasket_page_table_ioctl"}
    assert len(r.of("struct", "tagged")) == 1


def test_typedef_of_an_untagged_body(tmp_path):
    r = analyse(build(tmp_path, **{"d.h": "typedef struct { int a; } gcsHAL_INTERFACE;\n"}))
    assert names(r) == {"gcsHAL_INTERFACE"}
    assert len(r.of("struct", "typedef")) == 1


def test_tag_and_typedef_together_count_once(tmp_path):
    r = analyse(build(tmp_path, **{"d.h": "typedef struct _iface { int a; } iface;\n"}))
    assert len(r.of("struct")) == 1
    assert names(r) == {"_iface"}


def test_embedded_bodies_are_anonymous(tmp_path):
    r = analyse(build(tmp_path, **{"d.h": """
struct outer {
\tstruct { int x; } point;
\tunion { int i; long l; } value;
};
"""}))
    assert names(r) == {"outer"}
    assert len(r.of("struct", "anonymous")) == 1
    assert len(r.of("union", "anonymous")) == 1


def test_a_declaration_defines_nothing(tmp_path):
    r = analyse(build(tmp_path, **{"d.h": "struct gasket_dev;\nstruct known { int a; };\n"}))
    assert names(r) == {"known"}
    assert r.forward_only == {"gasket_dev"}


def test_a_use_is_not_a_definition(tmp_path):
    """struct file and struct device belong to the kernel, not the driver."""
    r = analyse(build(tmp_path, **{"d.c": """
static long drv_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
{
\tstruct device *dev = NULL;
\treturn 0;
}
"""}))
    assert r.of("struct") == []
    assert r.forward_only == {"file", "device"}


def test_a_function_returning_a_struct_is_not_a_definition(tmp_path):
    r = analyse(build(tmp_path, **{"d.c": """
struct gasket_dev *gasket_get(void)
{
\treturn NULL;
}
"""}))
    assert r.of("struct") == []


def test_an_initialiser_is_not_a_definition(tmp_path):
    r = analyse(build(tmp_path, **{"d.c": """
static const struct file_operations gasket_fops = {
\t.owner = THIS_MODULE,
};
"""}))
    assert r.of("struct") == []


def test_a_tag_that_looks_like_an_attribute(tmp_path):
    """nxp writes struct __BITFIELDINFO, which is a tag and not an attribute."""
    r = analyse(build(tmp_path, **{"d.h": "struct __BITFIELDINFO { int a; };\n"}))
    assert names(r) == {"__BITFIELDINFO"}


def test_attributes_do_not_hide_the_tag(tmp_path):
    r = analyse(build(tmp_path, **{"d.h": """
struct __attribute__((packed)) packed_one { int a; };
struct plain_one { int a; } __attribute__((packed));
"""}))
    assert names(r) == {"packed_one", "plain_one"}


def test_a_macro_for_a_body_is_still_a_definition(tmp_path):
    """aws builds neuron_ioctl_device_basic_info out of a macro."""
    r = analyse(build(tmp_path, **{"d.h": """
#define DEVICE_BASIC_INFO \\
\t__u32 architecture; \\
\t__u32 revision;

struct neuron_ioctl_device_basic_info {
\tDEVICE_BASIC_INFO
};
"""}))
    assert "neuron_ioctl_device_basic_info" in names(r)
    assert len(r.of("struct")) == 1


def test_one_name_under_two_ifdefs_counts_once(tmp_path):
    r = analyse(build(tmp_path, **{"d.h": """
#ifdef __linux__
struct iface { int a; };
#else
struct iface { long a; };
#endif
"""}))
    assert len(r.of("struct")) == 1


def test_the_same_header_in_two_places_counts_once(tmp_path):
    root = build(tmp_path, **{"a.h": "struct shared { int a; };\n"})
    (root / "sub").mkdir()
    (root / "sub" / "a.h").write_text("struct shared { int a; };\n")
    assert len(analyse(root).of("struct")) == 1


def test_unions_are_counted_apart(tmp_path):
    r = analyse(build(tmp_path, **{"d.h": """
struct a_struct { int a; };
union a_union { int i; long l; };
"""}))
    assert names(r, "struct") == {"a_struct"}
    assert names(r, "union") == {"a_union"}
    assert len(r.structures) == 2


def test_comments_and_strings_are_not_code(tmp_path):
    r = analyse(build(tmp_path, **{"d.c": """
/* struct commented_out { int a; }; */
// struct also_commented { int a; };
static const char *s = "struct in_a_string { int a; };";
struct real_one { int a; };
"""}))
    assert names(r) == {"real_one"}
