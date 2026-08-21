#!/usr/bin/env bash

set -Eeuo pipefail

# Configuration: add one profile block for each database you want to create.
CODEQL_BIN="${CODEQL_BIN:-codeql}"
SOURCE_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

PROFILE_NAMES=()
DATABASE_PATHS=()
BUILD_COMMANDS=()

add_profile() {
	PROFILE_NAMES+=("$1")
	DATABASE_PATHS+=("$2")
	BUILD_COMMANDS+=("$3")
}

# The build command must run from src: the Makefile uses $(PWD), so "make -C src" sets the wrong module path.

# Example profile for a Google CodeQL database:
add_profile \
	"google-codeql-db" \
	"/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/data/codeql-dbs/google-codeql-db" \
	"cd \"/home/sri/Desktop/Research/Accelerators_Research/google_coral_dev/gasket-driver/src\" && make clean && make -j$(nproc)"

# Example profile for a Hailo CodeQL database:
add_profile \
	"hailo-codeql-db" \
	"/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/data/codeql-dbs/hailo-codeql-db" \
	"cd \"/home/sri/Desktop/Research/Accelerators_Research/halio/hailort-drivers/linux/pcie\" && make clean && make -j$(nproc) all"

# Example profile for an AWS CodeQL database:
add_profile \
	"aws-codeql-db" \
	"/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/data/codeql-dbs/aws-codeql-db" \
	"cd \"/home/sri/Desktop/Research/Accelerators_Research/aws_inferentia/major_rev_codeql/aws-neuronx-2.20.28.0\" && make clean && make -j$(nproc)"

# Example profile for an NXP CodeQL database:
# The Yocto SDK environment script reads unset variables, so -u is relaxed while sourcing it.
add_profile \
	"nxp-codeql-db" \
	"/home/sri/Desktop/Research/Accelerators_Research/SpeedKillsAIA/data/codeql-dbs/nxp-codeql-db" \
	"cd \"/home/sri/Desktop/Research/Accelerators_Research/nxp_8mplusbb/linux-imx\" && set +u && source /opt/fsl-imx-fb/6.6-scarthgap/environment-setup-armv8a-poky-linux && set -u && make M=drivers/mxc/gpu-viv clean && make -j$(nproc) drivers/mxc/gpu-viv/"

# Copy this block to add another database profile.
# add_profile \
# 	"google-custom" \
# 	"${SOURCE_ROOT}/google-custom-codeql-db" \
# 	"cd \"${SOURCE_ROOT}/src\" && make clean && make -j1"

usage() {
	cat <<EOF
Usage: $(basename -- "$0") [--help]

Creates a CodeQL database using the configuration near the top of this script.

  CodeQL executable: ${CODEQL_BIN}
  Source root:       ${SOURCE_ROOT}

Configured profiles:
EOF

	for index in "${!PROFILE_NAMES[@]}"; do
		printf '  Profile:       %s\n' "${PROFILE_NAMES[$index]}"
		printf '  Database path: %s\n' "${DATABASE_PATHS[$index]}"
		printf '  Build command: %s\n\n' "${BUILD_COMMANDS[$index]}"
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

if ! command -v "${CODEQL_BIN}" >/dev/null 2>&1; then
	printf 'Error: CodeQL executable not found: %s\n' "${CODEQL_BIN}" >&2
	exit 1
fi

if [[ ! -d "${SOURCE_ROOT}/src" ]]; then
	printf 'Error: source directory not found: %s\n' "${SOURCE_ROOT}/src" >&2
	exit 1
fi

if [[ ${#PROFILE_NAMES[@]} -eq 0 ]]; then
	printf 'Error: no database profiles are configured.\n' >&2
	exit 1
fi

BUILD_SCRIPT=""

remove_build_script() {
	if [[ -n "${BUILD_SCRIPT}" && -f "${BUILD_SCRIPT}" ]]; then
		rm -f "${BUILD_SCRIPT}"
	fi
}

trap remove_build_script EXIT

for index in "${!PROFILE_NAMES[@]}"; do
	profile_name="${PROFILE_NAMES[$index]}"
	database_path="${DATABASE_PATHS[$index]}"
	build_command="${BUILD_COMMANDS[$index]}"

	mkdir -p "$(dirname -- "${database_path}")"

	# CodeQL splits --command on whitespace and execs it without a shell, so shell syntax needs a wrapper.
	remove_build_script
	BUILD_SCRIPT="$(mktemp "${TMPDIR:-/tmp}/codeql-build-XXXXXX")"
	printf '#!/usr/bin/env bash\nset -Eeuo pipefail\n%s\n' "${build_command}" >"${BUILD_SCRIPT}"
	chmod +x "${BUILD_SCRIPT}"

	printf '[%s] Creating CodeQL database at %s\n' "${profile_name}" "${database_path}"
	printf '[%s] Build command: %s\n' "${profile_name}" "${build_command}"

	"${CODEQL_BIN}" database create "${database_path}" \
		--language=cpp \
		--source-root="${SOURCE_ROOT}" \
		--overwrite \
		--command="${BUILD_SCRIPT}"

	printf '[%s] CodeQL database created successfully: %s\n' \
		"${profile_name}" "${database_path}"
done