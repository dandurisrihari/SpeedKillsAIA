## Project Structure

```
cdaframework/
├── src/
│   ├── __init__.py
│   ├── preprocess/                  # Preprocessing pipeline for logs, source, etc.
│   │   ├── __init__.py
│   │   ├── log_filter.py
│   │   ├── strace_filter.py
│   │   └── source_filter.py
│   ├── parsers/                     # Raw parsing utilities
│   │   ├── __init__.py
│   │   ├── dmesg_parser.py
│   │   ├── strace_parser.py
│   │   └── driver_source_parser.py
│   ├── instrumentation/             # Source code instrumentation logic
│   │   ├── __init__.py
│   │   ├── injector.py
│   │   └── tracker.py
│   ├── llm_analysis/                # LLM-based interpretation
│   │   ├── __init__.py
│   │   ├── analyze_logs.py
│   │   ├── analyze_strace.py
│   │   ├── analyze_source.py
│   │   └── analyze_docs.py
│   ├── detection/                   # Confused deputy vulnerability detection
│   │   ├── __init__.py
│   │   └── detector.py
│   └── utils/
│       ├── __init__.py
│       └── logger.py
├── exploits/                        # Exploit PoCs and validation scripts
│   ├── dma_privilege_escalation.py
│   └── unvalidated_copy_trigger.py
├── scripts/                         # CLI, orchestration, or pipelines
│   ├── run_pipeline.py
│   └── instrument_and_analyze.py
├── data/                            # Input artifacts
│   ├── kernel_sources/
│   ├── logs/
│   └── docs/
├── results/                         # Output artifacts
│   ├── reports/
│   ├── findings/
│   └── annotated_sources/
├── tests/                           # Unit/integration tests
│   ├── test_parsers.py
│   ├── test_instrumentation.py
│   ├── test_detection.py
│   └── test_llm_analysis.py
├── .gitignore
├── requirements.txt
├── README.md
└── setup.sh
```

### Core Components

- **`src/`** - Core framework modules
  - **`preprocess/`** - Data preprocessing pipeline for logs, source code, and system traces
  - **`parsers/`** - Raw parsing utilities for different data formats
  - **`instrumentation/`** - Source code instrumentation and tracking logic
  - **`llm_analysis/`** - LLM-powered analysis modules for different artifact types
  - **`detection/`** - Confused deputy vulnerability detection algorithms
  - **`utils/`** - Common utilities and logging

- **`exploits/`** - Proof-of-concept exploits and validation scripts

- **`scripts/`** - Command-line interfaces and pipeline orchestration

- **`data/`** - Input artifacts (kernel sources, logs, documentation)

- **`results/`** - Generated output (reports, findings, annotated code)

- **`tests/`** - Comprehensive test suite