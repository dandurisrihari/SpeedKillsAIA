"""
Tests for ioctl_codes.

Each case here is one of the ways a real driver in this repo hides an ioctl
code from a plain grep, so a regression means a driver gets undercounted.
"""

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

from src.ioctlsurface.ioctl_codes import analyse, collisions  # noqa: E402


def build(tmp_path, **files):
    root = tmp_path / "driver"
    root.mkdir()
    for name, text in files.items():
        (root / name).write_text(text)
    return root


def names(driver):
    return {code.name for code in driver.declared}


def test_plain_definitions(tmp_path):
    driver = analyse(build(tmp_path, **{"d.h": """
#define DRV_IOCTL_BASE 0xDC
#define DRV_IOCTL_RESET _IO(DRV_IOCTL_BASE, 0)
#define DRV_IOCTL_MAP   _IOW(DRV_IOCTL_BASE, 1, struct drv_map)
#define DRV_IOCTL_STAT  _IOWR(DRV_IOCTL_BASE, 2, struct drv_stat)
"""}))
    assert names(driver) == {"DRV_IOCTL_RESET", "DRV_IOCTL_MAP", "DRV_IOCTL_STAT"}


def test_wrapper_macro_is_followed(tmp_path):
    """Hailo declares every code through _IOW_ rather than _IOW."""
    driver = analyse(build(tmp_path, **{"d.h": """
#define _IOW_   _IOW
#define _IOWR_  _IOWR
#define DRV_A _IOW_('g', 0, struct a)
#define DRV_B _IOWR_('g', 1, struct b)
"""}))
    assert names(driver) == {"DRV_A", "DRV_B"}


def test_builder_defined_outside_the_tree(tmp_path):
    """NXP uses DRM_IOWR, which drm.h defines and the driver never does."""
    driver = analyse(build(tmp_path, **{"d.h": """
#define DRM_IOCTL_VIV_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + 0, struct c)
"""}))
    assert names(driver) == {"DRM_IOCTL_VIV_GEM_CREATE"}


def test_wrapper_itself_is_not_a_code(tmp_path):
    driver = analyse(build(tmp_path, **{"d.h": """
#define _IOW_(t, n, s) _IOC(_IOC_WRITE, t, n, sizeof(s))
#define DRV_A _IOW_('g', 0, struct a)
"""}))
    assert names(driver) == {"DRV_A"}


def test_line_continuation(tmp_path):
    """Coral splits the builder onto the next line."""
    driver = analyse(build(tmp_path, **{"d.h": """
#define DRV_A \\
\t_IOW(0xDC, 1, struct gasket_interrupt_eventfd)
"""}))
    assert names(driver) == {"DRV_A"}


def test_comments_and_disabled_blocks_are_ignored(tmp_path):
    driver = analyse(build(tmp_path, **{"d.h": """
#define DRV_LIVE _IOW('g', 0, struct a)
// #define DRV_LINE _IOW('g', 1, struct a)
/* #define DRV_BLOCK _IOW('g', 2, struct a) */
#if 0
#define DRV_DISABLED _IOW('g', 3, struct a)
#endif
"""}))
    assert names(driver) == {"DRV_LIVE"}


def test_disabled_block_else_branch_is_live(tmp_path):
    driver = analyse(build(tmp_path, **{"d.h": """
#if 0
#define DRV_DEAD _IOW('g', 0, struct a)
#else
#define DRV_LIVE _IOW('g', 1, struct a)
#endif
"""}))
    assert names(driver) == {"DRV_LIVE"}


def test_dispatch_switch_however_the_variable_is_named(tmp_path):
    """TI switches on kcmd in dma-heap and on ioctl in remoteproc."""
    driver = analyse(build(tmp_path, **{"d.c": """
static long drv_heap_ioctl(struct file *f, unsigned int ucmd, unsigned long arg)
{
\tswitch (kcmd) {
\tcase DMA_HEAP_IOCTL_ALLOC:
\t\treturn 0;
\t}
}
static long drv_device_ioctl(struct file *f, unsigned int ioctl, unsigned long arg)
{
\tswitch (ioctl) {
\tcase RPROC_SET_SHUTDOWN_ON_RELEASE:
\t\treturn 0;
\t}
}
"""}))
    assert driver.dispatched == {"DMA_HEAP_IOCTL_ALLOC", "RPROC_SET_SHUTDOWN_ON_RELEASE"}


def test_switch_on_a_component_of_the_code_is_not_dispatch(tmp_path):
    """Hailo switches on _IOC_TYPE(cmd); those labels are magics, not codes."""
    driver = analyse(build(tmp_path, **{"d.c": """
static long drv_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
{
\tswitch (_IOC_TYPE(cmd)) {
\tcase HAILO_GENERAL_IOCTL_MAGIC:
\t\treturn 0;
\t}
}
"""}))
    assert driver.dispatched == set()


def test_unrelated_switch_in_a_handler_is_not_dispatch(tmp_path):
    """dma_buf_ioctl also switches on sync.flags, which are not codes."""
    driver = analyse(build(tmp_path, **{"d.c": """
static long drv_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
{
\tswitch (cmd) {
\tcase DMA_BUF_IOCTL_SYNC:
\t\tswitch (sync.flags & DMA_BUF_SYNC_RW) {
\t\tcase DMA_BUF_SYNC_READ:
\t\t\tbreak;
\t\t}
\t\treturn 0;
\t}
}
"""}))
    assert driver.dispatched == {"DMA_BUF_IOCTL_SYNC"}
    assert "DMA_BUF_SYNC_READ" not in driver.dispatched


def test_helper_switch_in_an_ioctl_named_function_is_not_dispatch(tmp_path):
    """nvgpu_event_id_to_ioctl_channel_event_id switches on an event, not a code."""
    driver = analyse(build(tmp_path, **{"d.c": """
static u32 nvgpu_event_id_to_ioctl_channel_event_id(enum nvgpu_event_id_type event_id)
{
\tswitch (event_id) {
\tcase NVGPU_EVENT_ID_BPT_INT:
\t\treturn 0;
\t}
}
static int nvgpu_prof_ioctl_get_pm_resource_type(u32 resource, int *out)
{
\tswitch (resource) {
\tcase NVGPU_PROFILER_PM_RESOURCE_ARG_SMPC:
\t\treturn 0;
\t}
}
"""}))
    assert driver.dispatched == set()


def test_codes_defined_as_plain_integers_still_count(tmp_path):
    """nxp defines IOCTL_GCHAL_INTERFACE as 30000, not with _IO*."""
    driver = analyse(build(tmp_path, **{"d.c": """
#define IOCTL_GCHAL_INTERFACE 30000
static long drv_ioctl(struct file *f, unsigned int ioctlCode, unsigned long arg)
{
\tswitch (ioctlCode) {
\tcase IOCTL_GCHAL_INTERFACE:
\t\treturn 0;
\t}
}
"""}))
    assert driver.dispatched == {"IOCTL_GCHAL_INTERFACE"}


def test_dispatch_on_a_variable_named_for_nothing(tmp_path):
    """gru switches on req; the declared labels are what identify it."""
    driver = analyse(build(tmp_path, **{
        "d.h": "#define GRU_CREATE_CONTEXT _IOWR('G', 1, void *)\n",
        "d.c": """
static long gru_file_unlocked_ioctl(struct file *file, unsigned int req, unsigned long arg)
{
\tswitch (req) {
\tcase GRU_CREATE_CONTEXT:
\t\treturn 0;
\t}
}
"""}))
    assert driver.dispatched == {"GRU_CREATE_CONTEXT"}
    assert driver.undispatched == set()


def test_second_level_dispatch(tmp_path):
    """NXP runs ~79 operations behind one code, keyed on a field."""
    driver = analyse(build(tmp_path, **{"d.c": """
gceSTATUS gckKERNEL_Dispatch(gckKERNEL Kernel, gcsHAL_INTERFACE * Interface)
{
\tswitch (Interface->command) {
\tcase gcvHAL_ALLOCATE_LINEAR_VIDEO_MEMORY:
\t\tbreak;
\tcase gcvHAL_LOCK_VIDEO_MEMORY:
\t\tbreak;
\t}
}
"""}))
    assert driver.second_level == {"gcvHAL_ALLOCATE_LINEAR_VIDEO_MEMORY",
                                   "gcvHAL_LOCK_VIDEO_MEMORY"}
    assert driver.dispatched == set()


def test_comparison_dispatch_through_a_call(tmp_path):
    """AWS compares _IOC_NR(cmd) with _IOC_NR(CODE), and also uses !=."""
    driver = analyse(build(tmp_path, **{
        "d.h": """
#define NEURON_IOCTL_POD_CTRL _IOR('N', 1, struct a)
#define NEURON_IOCTL_DRIVER_INFO_GET _IOR('N', 2, struct b)
""",
        "d.c": """
static long ncdev_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
{
\tif (cmd != NEURON_IOCTL_POD_CTRL) {
\t\treturn -EINVAL;
\t} else if (_IOC_NR(cmd) == _IOC_NR(NEURON_IOCTL_DRIVER_INFO_GET)) {
\t\treturn 0;
\t}
}
"""}))
    assert driver.dispatched == {"NEURON_IOCTL_POD_CTRL", "NEURON_IOCTL_DRIVER_INFO_GET"}


def test_size_check_is_not_dispatch(tmp_path):
    """_IOC_SIZE(CODE) in a >= test says nothing about the code being handled."""
    driver = analyse(build(tmp_path, **{
        "d.h": "#define DRV_A _IOR('N', 1, struct a)\n",
        "d.c": """
static void helper(void)
{
\tif (size >= _IOC_SIZE(DRV_A)) {
\t\treturn;
\t}
}
"""}))
    assert driver.dispatched == set()
    assert driver.undispatched == {"DRV_A"}


def test_table_dispatch_with_token_pasting(tmp_path):
    """DRM_IOCTL_DEF_DRV pastes its argument onto DRM_IOCTL_."""
    driver = analyse(build(tmp_path, **{
        "d.h": """
#define DRM_IOCTL_VIV_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + 0, struct c)
#define DRM_IOCTL_VIV_GEM_LOCK   DRM_IOWR(DRM_COMMAND_BASE + 1, struct l)
""",
        "d.c": """
static const struct drm_ioctl_desc viv_ioctls[] = {
\tDRM_IOCTL_DEF_DRV(VIV_GEM_CREATE, viv_ioctl_gem_create, DRM_AUTH),
\tDRM_IOCTL_DEF_DRV(VIV_GEM_LOCK,   viv_ioctl_gem_lock,   DRM_AUTH),
};
"""}))
    assert driver.dispatched == {"DRM_IOCTL_VIV_GEM_CREATE", "DRM_IOCTL_VIV_GEM_LOCK"}


def test_codes_sharing_a_type_and_number(tmp_path):
    """AWS versions codes onto the same nr."""
    driver = analyse(build(tmp_path, **{"d.h": """
#define DRV_MEM_ALLOC     _IOR('N', 21, struct a)
#define DRV_MEM_ALLOC_V2  _IOR('N', 21, struct b)
#define DRV_MEM_FREE      _IOR('N', 22, struct c)
"""}))
    assert collisions(driver.declared) == [["DRV_MEM_ALLOC", "DRV_MEM_ALLOC_V2"]]


def test_redefinition_counts_once(tmp_path):
    driver = analyse(build(tmp_path, **{"d.h": """
#ifdef __linux__
#define DRV_A _IOW('g', 0, struct a)
#else
#define DRV_A _IOW('w', 0, struct a)
#endif
"""}))
    assert len(driver.declared) == 1


def test_preprocessed_files_are_skipped(tmp_path):
    """NXP ships .i dumps that repeat every header they included."""
    root = build(tmp_path, **{"d.h": "#define DRV_A _IOW('g', 0, struct a)\n"})
    (root / "d.i").write_text("#define DRV_COPY _IOW('g', 9, struct z)\n")
    assert names(analyse(root)) == {"DRV_A"}


def test_a_root_can_be_a_single_file(tmp_path):
    """nvmap's uapi header is one file in a directory of unrelated headers."""
    root = build(tmp_path, **{
        "mine.c": """
static long drv_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
{
\tswitch (cmd) {
\tcase DMA_BUF_PHYS_IOC_CONVERT:
\t\treturn 0;
\t}
}
""",
        "theirs.c": """
static long other_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
{
\tswitch (cmd) {
\tcase XSDFEC_START_DEV:
\t\treturn 0;
\t}
}
"""})
    driver = analyse(root / "mine.c", name="ti_misc")
    assert driver.dispatched == {"DMA_BUF_PHYS_IOC_CONVERT"}
    assert driver.name == "ti_misc"
