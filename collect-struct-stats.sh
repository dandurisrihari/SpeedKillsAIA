#!/usr/bin/env bash

set -Eeuo pipefail

# Configuration: add one driver block for each driver you want structure stats
# for. The drivers are the same ones collect-ioctl-stats.sh reports on, read
# from the same trees create-codeql-database.sh builds.
PYTHON_BIN="${PYTHON_BIN:-}"
SOURCE_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
# tree-sitter is a requirement of this one, and it lives in the project venv.
if [[ -z "${PYTHON_BIN}" ]]; then
	if [[ -x "${SOURCE_ROOT}/venv/bin/python" ]]; then
		PYTHON_BIN="${SOURCE_ROOT}/venv/bin/python"
	else
		PYTHON_BIN="python3"
	fi
fi
OUTPUT_DIR="${OUTPUT_DIR:-${SOURCE_ROOT}/data/struct-stats}"
ANALYSER="${SOURCE_ROOT}/src/structstats/struct_stats.py"

RESEARCH_ROOT="/home/sri/Desktop/Research/Accelerators_Research"
TI_KERNEL="${RESEARCH_ROOT}/ti_tda4vm/kernel_source/board-support/ti-linux-kernel-6.1.80+gitAUTOINC+2e423244f8-ti"
L4T_ROOT="${L4T_ROOT:-/media/sri/D/l4t-r35.6.1}"

DRIVER_NAMES=()
DRIVER_ROOTS=()

add_driver() {
	DRIVER_NAMES+=("$1")
	DRIVER_ROOTS+=("$2")
}

# Google Coral, from the google-codeql-db profile. The profile builds src, but
# the codes are declared alongside it, so the driver is the tree.
add_driver \
	"coral" \
	"${RESEARCH_ROOT}/google_coral_dev/gasket-driver"

# Hailo, from the hailo-codeql-db profile. It compiles in linux/pcie and
# declares its codes in common, so again the tree rather than the build dir.
add_driver \
	"hailo" \
	"${RESEARCH_ROOT}/halio/hailort-drivers"

# AWS Inferentia, from the aws-codeql-db profile.
add_driver \
	"aws" \
	"${RESEARCH_ROOT}/aws_inferentia/major_rev_codeql/aws-neuronx-2.20.28.0"

# NXP, from the nxp-codeql-db profile: make M=drivers/mxc/gpu-viv.
add_driver \
	"nxp" \
	"${RESEARCH_ROOT}/nxp_8mplusbb/linux-imx/drivers/mxc/gpu-viv"

# NVIDIA, from build-drivers.sh DRIVER_PATH. Those in-tree paths are what
# KERNEL_OVERLAYS maps source/kernel/{nvgpu,nvidia} onto, so the sources are
# read from the overlay trees the build actually compiles. Both keep their uapi
# headers outside the driver directory, so those are a second root.
add_driver \
	"nvidia_nvgpu" \
	"${L4T_ROOT}/source/kernel/nvgpu/drivers/gpu/nvgpu"

add_driver \
	"nvidia_nvgpu" \
	"${L4T_ROOT}/source/kernel/nvgpu/include/uapi"

add_driver \
	"nvidia_nvmap" \
	"${L4T_ROOT}/source/kernel/nvidia/drivers/video/tegra/nvmap"

add_driver \
	"nvidia_nvmap" \
	"${L4T_ROOT}/source/kernel/nvidia/include/uapi/linux/nvmap.h"

# TI, from build-drivers.sh DIRS. Kbuild compiles those directories whole and
# the instrumentation run processed them whole, so every C file in them counts
# here too. Only structures defined in these folders are counted; the kernel's
# own, which the driver merely refers to, are reported apart as defined
# elsewhere. drivers/misc carries other vendors' drivers, so its structures are
# not all TI's; the per-driver detail files name them.
add_driver \
	"ti_dmabuf" \
	"${TI_KERNEL}/drivers/dma-buf"

add_driver \
	"ti_misc" \
	"${TI_KERNEL}/drivers/misc"

add_driver \
	"ti_remoteproc" \
	"${TI_KERNEL}/drivers/remoteproc"

add_driver \
	"ti_rpmsg" \
	"${TI_KERNEL}/drivers/rpmsg"

# Copy this block to add another driver. Repeat a name to give it several roots,
# and a root may be a directory or a single file.
# add_driver \
# 	"my-driver" \
# 	"${RESEARCH_ROOT}/my_driver/src"

usage() {
	cat <<EOF
Usage: $(basename -- "$0") [--help]

Collects structure statistics for the drivers configured near the top of this
script, writing a summary csv and one detail file per driver.

  Python executable: ${PYTHON_BIN}
  Analyser:          ${ANALYSER}
  Output directory:  ${OUTPUT_DIR}

Configured drivers:
EOF

	for index in "${!DRIVER_NAMES[@]}"; do
		printf '  %-15s %s\n' "${DRIVER_NAMES[$index]}" "${DRIVER_ROOTS[$index]}"
	done
}

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
	usage
	exit 0
fi

if [[ $# -ne 0 ]]; then
	usage >&2
	exit 2
fi

if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
	printf 'Error: Python executable not found: %s\n' "${PYTHON_BIN}" >&2
	exit 1
fi

if [[ ! -f "${ANALYSER}" ]]; then
	printf 'Error: analyser not found: %s\n' "${ANALYSER}" >&2
	exit 1
fi

if [[ ${#DRIVER_NAMES[@]} -eq 0 ]]; then
	printf 'Error: no drivers are configured.\n' >&2
	exit 1
fi

missing=0
for index in "${!DRIVER_NAMES[@]}"; do
	if [[ ! -e "${DRIVER_ROOTS[$index]}" ]]; then
		printf 'Error: %s: source root not found: %s\n' \
			"${DRIVER_NAMES[$index]}" "${DRIVER_ROOTS[$index]}" >&2
		missing=1
	fi
done

if [[ ${missing} -ne 0 ]]; then
	printf 'Refusing to report on a partial driver list.\n' >&2
	exit 1
fi

ARGUMENTS=()
for index in "${!DRIVER_NAMES[@]}"; do
	ARGUMENTS+=(--driver "${DRIVER_NAMES[$index]}=${DRIVER_ROOTS[$index]}")
done

mkdir -p "${OUTPUT_DIR}"

UNIQUE_DRIVERS=$(printf '%s\n' "${DRIVER_NAMES[@]}" | sort -u | wc -l)
printf 'Collecting structure statistics for %d drivers over %d source roots into %s\n\n' \
	"${UNIQUE_DRIVERS}" "${#DRIVER_NAMES[@]}" "${OUTPUT_DIR}"

"${PYTHON_BIN}" "${ANALYSER}" "${ARGUMENTS[@]}" --output "${OUTPUT_DIR}"
