# LLM Analysis Integration

This document describes the LLM (Large Language Model) analysis integration for the Kernel Log Analysis Web UI. The integration provides LLM Assisted security analysis capabilities using OpenAI's GPT models.

## Features

### Core Functionality
- **Function Analysis**: Analyze individual kernel functions for security vulnerabilities, code quality, and best practices
- **DMA Operation Analysis**: Analyze DMA operations with associated function code and call graphs
- **Log Analysis**: Comprehensive analysis of all instrumentation logs with different focus areas (security, performance, general)
- **Security Report Generation**: Generate comprehensive security reports based on all collected data

### Data Persistence
- **Local Storage**: User prompts and preferences saved in browser localStorage
- **Server-side Storage**: Analysis results automatically saved as JSON files
- **Analysis History**: Maintain history of all analyses with timestamps and metadata
- **Export Functionality**: Export analysis history and individual results

## Architecture

### Modular Structure
```
src/webviewer/
├── static/
│   ├── css/
│   │   ├── main.css       # Main UI styles
│   │   └── llm.css        # LLM-specific styles
│   └── js/
│       ├── main.js        # Core UI functionality
│       └── llm.js         # LLM analysis functionality
├── templates/
│   └── index.html         # Main HTML template
├── data/
│   └── llm_analyses/      # Stored analysis results
└── ui.py                  # Flask application
```

### API Endpoints

#### LLM Status and Configuration
- `GET /api/llm/status` - Check LLM availability and get model list
- `GET /api/llm/models` - Get available AI models

#### Analysis Endpoints
- `POST /api/llm/analyze/function` - Analyze function code
- `POST /api/llm/analyze/dma` - Analyze DMA operations
- `POST /api/llm/analyze/logs` - Analyze instrumentation logs
- `POST /api/llm/security-report` - Generate security report

#### Data Management
- `POST /api/llm/save-analysis` - Save analysis results to file

## Configuration

### Environment Variables
```bash
# Required for LLM functionality
export OPENAI_API_KEY="your-openai-api-key"
```

### Model Selection
The integration supports multiple OpenAI models:
- **GPT-3.5 Turbo**: Fast and cost-effective for most analysis tasks
- **GPT-4**: More capable for complex analysis, slower and more expensive
- **GPT-4 Turbo**: Latest model with improved performance and larger context

## Usage

### Web Interface

1. **Access LLM Tab**: Navigate to the "LLM Analysis" tab in the web UI
2. **Check Status**: Verify LLM availability (green indicator)
3. **Select Model**: Choose appropriate AI model for your analysis needs
4. **Choose Analysis Type**: Select from Function, DMA, Log, or Security Report analysis

### Function Analysis
1. Select a function from the dropdown (populated from parsed data)
2. Function code is automatically loaded
3. Optionally add custom analysis prompts
4. Click "Analyze Function" to start analysis
5. Results displayed with structured analysis and recommendations

### DMA Analysis
1. Select a DMA operation from available operations
2. Associated function code and call graph loaded automatically
3. Add custom prompts focusing on DMA-specific concerns
4. Analyze for security implications, race conditions, etc.

### Log Analysis
1. Choose analysis type (General, Security, Performance)
2. Add custom prompts for specific focus areas
3. Analyzes all collected instrumentation data
4. Provides comprehensive insights and recommendations

### Security Report
1. Click "Generate Security Report" for comprehensive analysis
2. Processes all functions, DMA ops, IOCTL handlers, etc.
3. Provides executive summary, risk assessment, and recommendations

## Data Storage

### Analysis Results
Each analysis is automatically saved with the following structure:
```json
{
  "type": "function|dma|logs|security-report",
  "timestamp": "2023-01-01T10:00:00Z",
  "request": {
    "function_name": "example_function",
    "source_code": "int example_function() { ... }",
    "custom_prompt": "Check for buffer overflows",
    "model_id": "gpt-4"
  },
  "result": {
    "status": "success",
    "analysis": "Detailed analysis text...",
    "model_used": "gpt-4",
    "custom_prompt": "Check for buffer overflows"
  },
  "metadata": {
    "user_agent": "Mozilla/5.0...",
    "url": "http://localhost:5000"
  }
}
```

### File Organization
- Analysis files saved in `src/webviewer/data/llm_analyses/`
- Filename format: `llm_analysis_{type}_{timestamp}.json`
- Browser localStorage used for temporary data and preferences

### Data Export
- Individual analysis results can be viewed and copied
- Analysis history can be exported as JSON
- Results include full context for reproducibility

## API Reference

### Function Analysis
```http
POST /api/llm/analyze/function
Content-Type: application/json

{
  "function_name": "vulnerable_function",
  "source_code": "int vulnerable_function(char *input) { ... }",
  "file_path": "/path/to/file.c",
  "custom_prompt": "Focus on buffer overflow vulnerabilities",
  "model_id": "gpt-4"
}
```

**Response:**
```json
{
  "status": "success",
  "analysis": "This function contains a potential buffer overflow...",
  "function_name": "vulnerable_function",
  "file_path": "/path/to/file.c",
  "model_used": "gpt-4",
  "custom_prompt": "Focus on buffer overflow vulnerabilities"
}
```

### DMA Analysis
```http
POST /api/llm/analyze/dma
Content-Type: application/json

{
  "dma_operation": {
    "dma_function": "dma_alloc_coherent",
    "caller_function": "driver_init",
    "file_path": "/driver/example.c",
    "line_number": 123
  },
  "function_code": "void driver_init() { ... }",
  "call_graph": ["driver_init", "module_init", "kernel_init"],
  "custom_prompt": "Check for DMA coherency issues",
  "model_id": "gpt-4"
}
```

### Error Handling
All endpoints return structured error responses:
```json
{
  "status": "error",
  "error": "Description of the error"
}
```

Common error scenarios:
- `status: "unavailable"` - LLM service not configured or available
- `status: "error"` - API error or processing failure
- HTTP 400 - Invalid request data
- HTTP 503 - Service unavailable

## Security Considerations

### API Key Management
- OpenAI API key stored as environment variable
- Never exposed in client-side code or logs
- Key validation performed server-side

### Data Privacy
- Analysis requests sent to OpenAI API (review OpenAI's privacy policy)
- Local storage used for user preferences only
- Sensitive code analysis should consider data sensitivity

### Rate Limiting
- OpenAI API has rate limits based on subscription tier
- Consider implementing client-side rate limiting for heavy usage
- Error handling for rate limit exceeded scenarios

## Testing

### Test Suite
Comprehensive test coverage includes:
- Unit tests for LLM analyzer functionality
- Integration tests for web API endpoints
- Error handling and edge case testing
- Data persistence and validation testing

### Running Tests
```bash
# Run LLM analysis tests
python -m pytest tests/llm_analysis/ -v

# Run specific test files
python -m pytest tests/llm_analysis/test_llm.py -v
python -m pytest tests/llm_analysis/test_webviewer_integration.py -v
```

### Test Coverage
- LLMAnalyzer class functionality
- API endpoint behavior
- Data validation and serialization
- Error handling scenarios
- Integration with webviewer components

## Troubleshooting

### Common Issues

1. **LLM Unavailable**
   - Check OPENAI_API_KEY environment variable
   - Verify API key has sufficient credits
   - Check network connectivity

2. **Analysis Fails**
   - Review error messages in browser console
   - Check server logs for detailed error information
   - Verify input data format and completeness

3. **Slow Performance**
   - Consider using faster models (GPT-3.5 Turbo)
   - Reduce input size for large functions/logs
   - Check OpenAI API status

4. **Data Not Saving**
   - Verify write permissions to data directory
   - Check disk space availability
   - Review server error logs

### Debug Mode
Enable debug logging by setting Flask debug mode:
```python
app.run(debug=True)
```

## Future Enhancements

### Planned Features
- Custom model fine-tuning for kernel-specific analysis
- Batch analysis capabilities for multiple functions
- Integration with static analysis tools
- Advanced visualization of analysis results
- Collaborative analysis sharing

### Performance Optimizations
- Caching of analysis results
- Incremental analysis for large codebases
- Background processing for long-running analyses
- Result streaming for real-time feedback

### Security Enhancements
- Local LLM deployment options
- Enhanced data sanitization
- Analysis result encryption
- Audit logging for compliance

## Contributing

### Development Setup
1. Install dependencies: `pip install -r requirements.txt`
2. Set up OpenAI API key: `export OPENAI_API_KEY="your-key"`
3. Run tests: `python -m pytest tests/llm_analysis/ -v`
4. Start development server: `python -m src.webviewer.ui`

### Code Style
- Follow PEP 8 for Python code
- Use ESLint configuration for JavaScript
- Add comprehensive docstrings and comments
- Include test coverage for new features

### Submitting Changes
1. Create feature branch
2. Add tests for new functionality
3. Update documentation
4. Submit pull request with detailed description

## License

This LLM analysis integration is part of the SpeedKillsAIA project and follows the same licensing terms.
