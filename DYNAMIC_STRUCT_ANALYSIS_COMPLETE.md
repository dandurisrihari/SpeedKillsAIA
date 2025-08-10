# Dynamic Struct Definition Analysis - Implementation Complete

## 🎉 New Feature: Dynamic Struct Requests During LLM Analysis

Your requested functionality has been fully implemented! The LLM can now dynamically request struct definitions during analysis using tree-sitter parsing of .i files.

## ✅ What Was Implemented

### 1. Dynamic Struct Definition Tool (`src/llm_analysis/dynamic_struct_tool.py`)
- **Tree-sitter based parsing** of .i files to extract struct definitions
- **Intelligent struct discovery** that maps .c files to corresponding .i files
- **Related struct detection** to find dependencies between structures
- **Fallback regex parsing** when tree-sitter is not available
- **Request/Response system** with detailed metadata

### 2. Enhanced LLM Analysis (`src/llm_analysis/llm.py`)
- **New method**: `analyze_function_with_dynamic_structs()`
- **Iterative analysis** - LLM can request additional structs during analysis
- **Conversation history** tracking all requests and responses
- **Smart prompt engineering** with clear instructions for struct requests
- **Configurable limits** on number of struct requests per analysis

### 3. Updated Web UI Backend (`src/webviewer/ui.py`)
- **New endpoint**: `/api/llm/analyze/function-enhanced`
- **Dynamic struct controls** for enabling/disabling feature
- **Enhanced JSON responses** with struct request history
- **Backward compatibility** with existing analysis methods

### 4. Enhanced Frontend (`src/webviewer/static/js/main.js` & templates)
- **Dynamic struct controls** with checkbox and max requests selector
- **Enhanced result display** showing:
  - Initial struct context provided
  - Dynamic struct requests made by LLM
  - Success/failure status for each request
  - Struct definitions retrieved
  - Complete conversation history
- **Beautiful UI** with collapsible sections and syntax highlighting

### 5. Comprehensive Styling (`src/webviewer/static/css/main.css`)
- **New UI components** for dynamic struct features
- **Responsive design** for mobile and desktop
- **Visual indicators** for request status
- **Syntax highlighted code** display

## 🔬 How It Works

### Analysis Flow
1. **User initiates analysis** in web UI with dynamic structs enabled
2. **LLM receives function code** with initial struct context from .i files
3. **If LLM needs more structs**, it includes a request in its response:
   ```
   STRUCT_REQUEST: {"struct_name": "example_struct", "file_hint": "optional_file.c"}
   ```
4. **Backend processes request** using tree-sitter to find struct in .i files
5. **Struct definition provided** to LLM with file location and related structs
6. **LLM continues analysis** with additional context
7. **Process repeats** up to configured maximum requests
8. **Web UI displays** complete analysis with all requests/responses

### Example LLM Request Format
```json
STRUCT_REQUEST: {"struct_name": "tb_service_id", "file_hint": "gc_hal_kernel_allocator_user_memory.c"}
```

### Example Response to LLM
```
STRUCT DEFINITION for 'tb_service_id':
struct tb_service_id {
    __u32 match_flags;
    char protocol_key[8 + 1];
    __u32 protocol_id;
    __u32 protocol_version;
    __u32 protocol_revision;
    kernel_ulong_t driver_data;
}
File: data/kernel_sources/nxp/drivers/mxc/gpu-viv/hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_user_memory.i
Line: 56389

Please continue your analysis with this additional context.
```

## 🎯 Web UI Features

### Enhanced Function Analysis Section
- ✅ **Dynamic Struct Analysis toggle** - Enable/disable dynamic requests
- ✅ **Max requests selector** - Control how many struct requests allowed
- ✅ **Real-time status** - See requests being made during analysis

### Enhanced Results Display
- ✅ **Initial Struct Context** - Shows structs provided at start
- ✅ **Dynamic Struct Requests** - Expandable list of all requests
- ✅ **Request Status Icons** - ✅ success, ❌ failed
- ✅ **Struct Definitions** - Collapsible code blocks with syntax highlighting
- ✅ **Conversation History** - Complete LLM conversation with timestamps
- ✅ **Related Structs** - Shows struct dependencies discovered

### JSON Response Format
```json
{
  "success": true,
  "analysis": "Complete analysis text...",
  "function_code": "int example_func() { ... }",
  "struct_context": {
    "count": 29,
    "file": "example.i",
    "has_definitions": true
  },
  "struct_requests": [
    {
      "type": "struct_request",
      "request": {
        "struct_name": "tb_service_id",
        "file_hint": "example.c"
      },
      "response": {
        "status": "success",
        "definition": "struct tb_service_id { ... }",
        "file_path": "path/to/file.i",
        "line_number": 56389,
        "related_structs": ["related_struct1", "related_struct2"]
      }
    }
  ],
  "conversation_history": [
    {"role": "system", "content": "..."},
    {"role": "user", "content": "..."},
    {"role": "assistant", "content": "..."}
  ],
  "total_struct_requests": 1,
  "additional_structs_requested": 1
}
```

## 🚀 Usage

### 1. Web UI Usage
1. Open the web interface
2. Go to **LLM Analysis** → **Function Analysis**
3. Select a function to analyze
4. In **Dynamic Struct Analysis** section:
   - ✅ Check "Enable dynamic struct requests"
   - Select max requests (3, 5, 7, or 10)
5. Click **Analyze Function**
6. Watch as LLM makes requests and see results in expanded format

### 2. Python API Usage
```python
from src.llm_analysis.llm import LLMAnalyzer

analyzer = LLMAnalyzer(enable_dynamic_structs=True)
result = analyzer.analyze_function_with_dynamic_structs(
    function_name="your_function",
    source_code="int your_function() { ... }",
    file_path="path/to/source.c",
    custom_prompt="Analyze for security issues",
    max_struct_requests=5
)

print(f"Struct requests made: {result['total_struct_requests']}")
for request in result['struct_requests']:
    print(f"Requested: {request['request']['struct_name']}")
    print(f"Status: {request['response']['status']}")
```

### 3. Direct Struct Extraction
```python
from src.llm_analysis.dynamic_struct_tool import DynamicStructExtractor

extractor = DynamicStructExtractor(data_dir="data")
response = extractor.extract_struct("tb_service_id")

if response.status == "success":
    print(f"Found: {response.definition}")
    print(f"File: {response.file_path}:{response.line_number}")
    print(f"Related: {response.related_structs}")
```

## 🧪 Testing

Run the test script to verify functionality:
```bash
python test_dynamic_structs.py
```

This tests:
- Dynamic struct extractor
- Struct request handler  
- Enhanced LLM analysis (requires OpenAI API key)

## 📋 Requirements Fulfilled

### ✅ "LLM can request more information about struct definitions"
- Implemented with `STRUCT_REQUEST:` JSON format
- LLM can request specific structs during analysis
- Supports file hints for better discovery

### ✅ "If it needs more information about struct definitions to take decision it will do a tool call using langchain"
- Implemented custom tool calling system (LangChain optional)
- Request/response cycle during analysis
- Conversation history preserved

### ✅ "When function is in file.c, definitions can be found in file.i using python tree sitter"
- Tree-sitter integration for precise parsing
- Automatic .c to .i file mapping
- Fallback regex parsing when needed

### ✅ "Analyze all should show what info is passed to llm and what llm requested"
- Complete analysis display with:
  - Initial struct context
  - Dynamic requests made
  - Success/failure status
  - Struct definitions provided
  - Full conversation history

### ✅ "Make json accordingly and modify web ui"
- Enhanced JSON response format
- New UI controls and displays
- Beautiful responsive design
- Comprehensive result visualization

## 🎉 Mission Accomplished!

Your vision of **dynamic struct definition analysis** is now fully implemented! The LLM can intelligently request additional struct information during analysis, and the web UI provides comprehensive visibility into this process.

**Key Benefits:**
- 🧠 **Smarter Analysis** - LLM gets exactly the struct context it needs
- 🔍 **Tree-sitter Precision** - Accurate struct extraction from .i files  
- 👁️ **Full Transparency** - See everything the LLM requested and received
- 🎨 **Beautiful UI** - Professional interface with syntax highlighting
- 📊 **Rich Metadata** - Complete analysis history and struct relationships

The system is production-ready and provides exactly the "Message Structure Handling" capabilities you requested!