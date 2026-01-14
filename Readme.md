# SpeedKillsAIA (DeputyHunt)

**LLM-Assisted Framework for Confused Deputy Attack Detection on AI Accelerators**

SpeedKillsAIA (DeputyHunt) is a framework designed to detect and analyze confused deputy attacks targeting AI accelerator systems.

## Overview

The framework consists of four main components:

| Component | Description |
|-----------|-------------|
| **`src/kernel_instrumenter`** | Instruments kernel driver source code with tracing probes |
| **`src/preprocess`** | Parses log files and extracts relevant information into JSON format |
| **`src/llm_analysis`** | Analyzes gathered data (JSON) using LLM and produces CSV, YAML, log reports |
| **`src/structanalyzer`** | Performs C structure analysis to assist LLM (can be used independently) |

---

## Complete Workflow

The analysis pipeline consists of 5 main steps:

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  1. Instrument  │ -> │  2. Build       │ -> │  3. Collect     │ -> │  4. Preprocess  │ -> │  5. LLM         │
│     Kernel      │    │     Kernel      │    │     Logs        │    │     JSON        │    │     Analysis    │
└─────────────────┘    └─────────────────┘    └─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## Step 1: Environment Setup

```bash
source setup.sh
```

---

## Step 2: Instrument Kernel Source Code

Use the kernel instrumenter to add tracing probes to kernel driver source code.

```bash
python3 -m src.kernel_instrumenter \
    --directory <path_to_kernel_source> \
    --summary data/instrumentation/<platform>_kernelinstrumenter_stats.txt
```

**Example for Hailo:**
```bash
python3 -m src.kernel_instrumenter \
    --directory data/kernel_sources/hailo \
    --summary data/instrumentation/hailo_kernelinstrumenter_stats.txt
```

**Output:**
- Instrumented kernel source files (modified in place)
- Summary statistics file in `data/instrumentation/`

---

## Step 3: Build Instrumented Kernel

Build the kernel with debug symbols and preprocessed output preserved:

```bash
make KCFLAGS="-save-temps=obj" -j$(nproc)
```

> **Note:** The `-save-temps=obj` flag preserves `.i` (preprocessed) files which are needed for structure analysis.

---

## Step 4: Collect Logs on Target Device

After deploying the instrumented kernel to your target device:

1. **Run inference workload** on the AI accelerator
2. **Collect the following logs:**

### Log File Naming Convention

Store logs in `data/logs/<platform>/` following this exact naming pattern:

| Log Type | Filename Pattern | Description |
|----------|-----------------|-------------|
| **UART/Boot Log** | `<platform>_uart_boot_dma_userapi_dmafilefuncs_ioctl.log` | Serial console output during boot and inference |
| **Dmesg Log** | `<platform>_dmesg_dma_userapi_dmafilefuncs_ioctl.log` | Kernel ring buffer (`dmesg`) output |
| **Strace Log** | `<platform>_strace.log` | System call trace of inference application |

### Example for Hailo:
```
data/logs/hailo/
├── hailo_uart_boot_dma_userapi_dmafilefuncs_ioctl.log
├── hailo_dmesg_dma_userapi_dmafilefuncs_ioctl.log
└── hailo_strace.log
```

### Collecting Logs Commands:

```bash
# On target device:

# 1. Capture dmesg (run after inference)
dmesg > hailo_dmesg_dma_userapi_dmafilefuncs_ioctl.log

# 2. Capture strace (run with inference application)
strace -f -o hailo_strace.log ./inference_app

# 3. UART boot log - capture from serial console during boot
```

---

## Step 5: Generate JSON from Logs

> ** Important:** Before processing, ensure all file paths in your log files are **relative to the kernel source directory** (`data/kernel_sources/<platform>/`).
>
> **Example path conversion:**
> ```
> # Absolute path in raw log (WRONG):
> /mnt/8e8fbd72-3ef4-4af6-854c-33dbfb634ac7/jetson_linux_r35_6_1/Linux_for_Tegra/source/public/kernel/nvgpu/drivers/gpu/nvgpu/os/linux/vm.c:436
>
> # Relative path required (CORRECT):
> drivers/gpu/nvgpu/os/linux/vm.c:436
> ```
> Use `sed` or similar tools to convert paths before processing.

### Option A: Using Helper Script (Recommended)

1. **Add platform entry to `processjson.sh`:**

```bash
PLATFORMS=("hailo" "nxp" "ti" "coral" "aws" "nvidia")  # Add your platform
```

2. **Run the script:**
```bash
./processjson.sh
```

### Option B: Manual Execution

```bash
python3 -m src.preprocess \
    --source-root "data/kernel_sources/<platform>/" \
    -o "data/json_files/<platform>_dmesg.json" \
    --strace-log "data/logs/<platform>/<platform>_strace.log" \
    --log "data/logs/<platform>/<platform>_dmesg_dma_userapi_dmafilefuncs_ioctl.log"
```

**Example for Hailo (dmesg):**
```bash
python3 -m src.preprocess \
    --source-root "data/kernel_sources/hailo/" \
    -o "data/json_files/hailo_dmesg.json" \
    --strace-log "data/logs/hailo/hailo_strace.log" \
    --log "data/logs/hailo/hailo_dmesg_dma_userapi_dmafilefuncs_ioctl.log"
```

**Example for Hailo (boot):**
```bash
python3 -m src.preprocess \
    --source-root "data/kernel_sources/hailo/" \
    -o "data/json_files/hailo_boot.json" \
    --strace-log "data/logs/hailo/hailo_strace.log" \
    --log "data/logs/hailo/hailo_uart_boot_dma_userapi_dmafilefuncs_ioctl.log"
```

**Output:**
- JSON files in `data/json_files/` (e.g., `hailo_dmesg.json`, `hailo_boot.json`)

---

## Step 6: Run LLM Analysis

### Option A: Using Helper Script (Recommended)

1. **Add platform entry to `llmanalysis.sh`:**

```bash
PLATFORMS=("nxp" "ti" "coral" "aws" "hailo" "nvidia")  # Add your platform
```

2. **Run the script:**
```bash
./llmanalysis.sh
```

### Option B: Manual Execution

```bash
python3 -m src.llm_analysis \
    "data/json_files/<platform>_<type>.json" \
    --output "data/llmanalysis/<platform>_<type>_llm_analysis.yaml" \
    -v --verbose-log "data/llmanalysis/<platform>_<type>_llm_analysis.log" \
    --csv-export
```

**Example for Hailo:**
```bash
python3 -m src.llm_analysis \
    "data/json_files/hailo_dmesg.json" \
    --output "data/llmanalysis/hailo_dmesg_llm_analysis.yaml" \
    -v --verbose-log "data/llmanalysis/hailo_dmesg_llm_analysis.log" \
    --csv-export
```

**Output:**
- YAML analysis report: `data/llmanalysis/<platform>_<type>_llm_analysis.yaml`
- CSV export: `data/llmanalysis/<platform>_<type>_llm_analysis.csv`
- Detailed log: `data/llmanalysis/<platform>_<type>_llm_analysis.log`

---

## Directory Structure

```
SpeedKillsAIA/
├── src/
│   ├── kernel_instrumenter/    # Kernel instrumentation module
│   ├── preprocess/             # Log preprocessing module
│   ├── llm_analysis/           # LLM analysis module
│   └── structanalyzer/         # C structure analyzer
├── data/
│   ├── kernel_sources/         # Kernel source code per platform
│   │   ├── aws/
│   │   ├── coral/
│   │   ├── hailo/
│   │   ├── nvidia/
│   │   ├── nxp/
│   │   └── ti/
│   ├── logs/                   # Collected logs per platform
│   │   ├── aws/
│   │   ├── coral/
│   │   ├── hailo/
│   │   ├── nvidia/
│   │   ├── nxp/
│   │   └── ti/
│   ├── json_files/             # Preprocessed JSON files
│   ├── llmanalysis/            # LLM analysis output
│   └── instrumentation/        # Instrumentation statistics
├── exploits/                   # Exploit scripts per AIA
│   ├── aws/
│   ├── coral/
│   ├── hailo/
│   ├── nvidia/
│   ├── nxp/
│   └── ti/
├── overhead/                   # Overhead calculation tools
│   ├── gem5-SALAM/             # gem5 accelerator simulator
│   └── ticks_calc/             # Cycle-accurate timing drivers
├── processjson.sh              # Helper script for preprocessing
├── llmanalysis.sh              # Helper script for LLM analysis
└── setup.sh                    # Environment setup script
```

---

## Supported AI Accelerators

| Platform | Vendor | Accelerator Type |
|----------|--------|-----------------|
| **AWS** | Amazon | AWS Neuron (Inferentia) |
| **Coral** | Google | Edge TPU |
| **Hailo** | Hailo | Hailo-8 || **NVIDIA** | NVIDIA | Jetson (NVGPU) || **NXP** | NXP | i.MX NPU |
| **TI** | Texas Instruments | TDA4VM TIDL |

---

## Component Help

```bash
python3 -m src.kernel_instrumenter --help
python3 -m src.preprocess --help
python3 -m src.llm_analysis --help
python3 -m src.structanalyzer --help
```

---

## Exploit Scripts

The `exploits/` directory contains proof-of-concept exploit scripts for confused deputy attacks on each AI Accelerator:

- **`exploits/aws/`** - AWS Neuron exploits
- **`exploits/coral/`** - Google Edge TPU exploits
- **`exploits/hailo/`** - Hailo-8 exploits
- **`exploits/nvidia/`** - NVIDIA Jetson exploits
- **`exploits/nxp/`** - NXP NPU exploits
- **`exploits/ti/`** - TI TIDL exploits

---

## Overhead Calculations

The `overhead/` directory contains tools for measuring and calculating the performance overhead of the instrumentation:

```
overhead/
├── gem5-SALAM/     # gem5 simulator with SALAM accelerator modeling
└── ticks_calc/     # Cycle-accurate timing measurement drivers
```

### ticks_calc - Timing Measurement Drivers

Kernel drivers for precise timing measurements on NXP i.MX8M Plus using ARM64 cycle counter (PMCCNTR_EL0).

**Features:**
- Page Table Walk Timing measurement
- Software Interrupt Latency measurement  
- Cycle-accurate measurements using ARM64 Performance Monitor

**Usage:**
```bash
cd overhead/ticks_calc
make                    # Build kernel modules and userspace tools
./scripts/load_module.sh
./scripts/run_tests.sh
```

> See [`overhead/ticks_calc/README.md`](overhead/ticks_calc/README.md) for detailed setup and usage instructions.

### gem5-SALAM - Accelerator Simulation

gem5-SALAM (System Architecture for LLVM-based Accelerator Modeling) enables simulation of custom hardware accelerators for overhead analysis.

**Building:**
```bash
cd overhead/gem5-SALAM
scons build/ARM/gem5.opt -j$(nproc)
```

> See [`overhead/gem5-SALAM/README.md`](overhead/gem5-SALAM/README.md) for detailed setup and usage instructions.

---