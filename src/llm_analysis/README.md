# LLM Analysis Module

A comprehensive Python module for analyzing kernel driver code using Large Language Models (LLMs) to assess AI Accelerator (AIA) relevance, kernel driver entry points, and message structure handling.

## Features

- **Multi-Model Support**: Compatible with multiple OpenAI GPT models
- **Specialized Analysis**: Tailored for AI Accelerator kernel driver patterns
- **Function Calling**: Enhanced analysis with structured tool integration
- **Comprehensive Logging**: Detailed interaction logs for debugging and audit
- **Flexible Output**: YAML export and console summaries
- **Modular Architecture**: Clean separation of concerns for extensibility

## Installation

Ensure you have the required dependencies:

```bash
pip install openai tiktoken python-dotenv pyyaml
```

Set up your OpenAI API key in a `.env` file:

```bash
OPENAI_API_KEY=your_api_key_here
```

## Quick Start

### Command Line Usage

```bash
# Basic analysis
python -m src.llm_analysis data/json_files/your_file.json

# With custom settings
python -m src.llm_analysis data/json_files/your_file.json \
    --model gpt-4 \
    --output results.yaml \
    --verbose \
    --verbose-log analysis.log
```

### Python Module Usage

```python
from src.llm_analysis import JSONAnalyzer, GPTModel

# Create analyzer
analyzer = JSONAnalyzer(
    model=GPTModel.GPT_4O_MINI.value,
    verbose=True,
    enable_tools=True,
    verbose_log_file="analysis.log"
)

# Analyze JSON file
results = analyzer.analyze_json_file("data/json_files/your_file.json")

# Export results
analyzer.export_results_to_yaml(results, "results.yaml")
analyzer.print_results_summary(results)
```

## Module Structure

```
src/llm_analysis/
├── __init__.py          # Module interface and exports
├── json_analyzer.py     # Main analysis orchestrator
├── models.py           # Data structures and enums
├── openai_client.py    # LLM API client with conversation management
├── processors.py       # Specialized operation processors
├── output.py          # Result formatting and export
├── parsers.py         # JSON input parsing and validation
├── response_parser.py # LLM response parsing
├── tools.py           # Function calling tools
├── prompts.py         # LLM prompt engineering
├── llm_logger.py      # Comprehensive logging system
└── cli.py             # Command-line interface
```

## Core Classes

### JSONAnalyzer
Main orchestrator class that coordinates the entire analysis pipeline.

```python
analyzer = JSONAnalyzer(
    model="gpt-4o-mini",     # OpenAI model to use
    verbose=False,           # Enable detailed logging
    enable_tools=True,       # Enable function calling
    verbose_log_file=None    # Custom log file path
)
```

### AnalysisResult
Data structure containing analysis findings for a single function.

```python
result = AnalysisResult(
    function_name="example_function",
    aia_relevant_function=85,           # 0-100 score
    relevant_kd_entry_point=0,          # 0-100 score  
    message_structure_handling=70,      # 0-100 score
    message_structures_identified=["struct_name"],
    smids_identified=["dma_addr", "size"],
    reasoning=["Explanation of analysis"]
)
```

### OpenAIClient
Advanced LLM client with conversation management and tool integration.

```python
client = OpenAIClient(
    model="gpt-4o-mini",
    verbose=False,
    enable_tools=True,
    logger=custom_logger  # Optional
)
```

## Specialized Processors

### FunctionProcessor
Analyzes general kernel functions organized by file.

### DMAProcessor  
Specialized for DMA operation analysis - critical for AI Accelerator integration.

### IOCTLProcessor
Analyzes IOCTL handlers - key entry points from user space to kernel.

## Analysis Metrics

The module analyzes functions across three key dimensions:

1. **AIA Relevant Function (0-100%)**: How relevant the function is for AI Accelerator operations
2. **Relevant KD Entry Point (0-100%)**: Whether the function serves as a kernel driver entry point
3. **Message Structure Handling (0-100%)**: How well the function handles message structures and SMIDs

## Output Formats

### YAML Export
Structured export with consistent field ordering:

```yaml
dma_operations:
- Function/Code_Block_Name: gasket_perform_mapping
  AIARelevantFunction: 90
  Relevant_KD_Entry_Point: 0
  Message_Structure_Handling: 80
  Message_Structures_identified: ["struct gasket_page_table_entry"]
  SMIDs_identified: ["dma_addr", "paddr"]
  Reasoning: ["Detailed analysis explanation..."]
```

### Console Summary
Human-readable summary with statistics and highlights.

## Logging

Comprehensive logging system captures:
- Analysis session metadata
- Function analysis start/completion
- LLM prompts and responses
- Tool calling interactions
- Error handling and debugging information

## Advanced Usage

### Custom Processors
Extend the base processor for new operation types:

```python
from src.llm_analysis.processors import BaseProcessor

class CustomProcessor(BaseProcessor):
    def process(self, operations):
        # Implement custom analysis logic
        return analysis_results
```

### Direct Component Access
Use individual components for specialized workflows:

```python
from src.llm_analysis import JSONParser, OutputFormatter

parser = JSONParser(verbose=True)
data = parser.parse_file("input.json")

formatter = OutputFormatter(verbose=True)
formatter.export_to_yaml(results, "output.yaml")
```

## Configuration

### Environment Variables
- `OPENAI_API_KEY`: Required OpenAI API key

### Model Selection
Supported models via `GPTModel` enum:
- `GPT_4O_MINI`: Cost-effective, recommended for most use cases
- `GPT_4O`: Latest GPT-4 with enhanced capabilities
- `GPT_4`: Standard GPT-4 model
- `GPT_4_TURBO`: High-performance variant
- `GPT_3_5_TURBO`: Legacy compatibility

## Error Handling

The module includes comprehensive error handling:
- JSON parsing and validation errors
- LLM API communication failures
- Tool calling errors
- File I/O issues
- Token limit management

## Examples

See `examples/module_usage_example.py` for comprehensive usage demonstrations.

## Contributing

When extending the module:
1. Follow the established processor pattern for new operation types
2. Add comprehensive docstrings following the existing style
3. Update the `__init__.py` exports for new public classes
4. Include error handling and logging
5. Add examples for new functionality

## License

Part of the SpeedKillsAIA research project.
