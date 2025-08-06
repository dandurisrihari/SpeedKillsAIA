# Webviewer Module

A modular web interface for kernel log analysis with integrated LLM-powered security analysis capabilities.

## Overview

This webviewer provides a comprehensive web-based interface for analyzing kernel instrumentation logs with AI-powered insights. The interface is built with a modular architecture using Flask, with separate CSS, JavaScript, and HTML template files for maintainability.

## Features

### Core Functionality
- **Real-time Log Analysis**: View and analyze kernel instrumentation logs
- **Function Explorer**: Browse and examine instrumented functions
- **DMA Operations**: Track and analyze DMA-related operations
- **IOCTL Handlers**: Monitor system call interactions
- **Search & Filter**: Powerful search across all collected data

### AI-Powered Analysis
- **LLM Integration**: OpenAI GPT models for intelligent code analysis
- **Security Assessment**: Automated vulnerability detection
- **Performance Insights**: AI-driven performance recommendations
- **Custom Prompts**: User-defined analysis focus areas

### Data Management
- **Persistent Storage**: All analysis results saved as JSON files
- **Export Capabilities**: Export logs and analysis results
- **History Tracking**: Maintain complete analysis history
- **Real-time Updates**: Live data updates during instrumentation

## Architecture

### File Structure
```
src/webviewer/
├── static/
│   ├── css/
│   │   ├── main.css       # Core UI styles
│   │   └── llm.css        # LLM-specific interface styles
│   └── js/
│       ├── main.js        # Core JavaScript functionality
│       └── llm.js         # LLM analysis JavaScript
├── templates/
│   └── index.html         # Main application template
├── data/
│   ├── llm_analyses/      # LLM analysis results
│   └── instrumentation/   # Raw instrumentation data
├── ui.py                  # Flask application
├── README.md             # This file
└── LLM_INTEGRATION.md    # Detailed LLM documentation
```

### Component Design

#### CSS Modules
- **main.css**: Core styling for tabs, search, grids, responsive design
- **llm.css**: Specialized styling for LLM analysis interface

#### JavaScript Modules
- **main.js**: Tab management, search functionality, data persistence utilities
- **llm.js**: LLM API interactions, analysis result handling

#### Flask Application
- **ui.py**: Modular Flask app with API endpoints and template rendering

## Quick Start

### Prerequisites
```bash
pip install flask openai
export OPENAI_API_KEY="your-openai-api-key"
```

### Running the Webviewer
```bash
# From project root
cd src/webviewer
python ui.py

# Or using module syntax
python -m src.webviewer.ui
```

### Accessing the Interface
Open your browser to `http://localhost:5000`

## Usage

### Basic Navigation
1. **Overview Tab**: Main dashboard with system status
2. **Functions Tab**: Browse instrumented functions
3. **DMA Operations Tab**: View DMA-related activities
4. **IOCTL Handlers Tab**: Monitor system call interactions
5. **Logs Tab**: Raw log viewer with search and filtering
6. **LLM Analysis Tab**: AI-powered code analysis

### LLM Analysis Workflow
1. Navigate to the 🤖 LLM Analysis tab
2. Check LLM status (should show green if available)
3. Select your preferred AI model
4. Choose analysis type:
   - **Function Analysis**: Analyze specific functions
   - **DMA Analysis**: Analyze DMA operations with context
   - **Log Analysis**: Comprehensive log analysis
   - **Security Report**: Generate full security assessment

### Data Persistence
- All user interactions automatically saved to localStorage
- Analysis results saved as JSON files in `data/llm_analyses/`
- Export functionality available for all data types

## API Endpoints

### Core Data
- `GET /api/data` - Get all instrumentation data
- `GET /api/functions` - Get function list
- `GET /api/dma` - Get DMA operations
- `GET /api/ioctl` - Get IOCTL handlers
- `GET /api/logs` - Get formatted logs

### LLM Analysis
- `GET /api/llm/status` - Check LLM availability
- `POST /api/llm/analyze/function` - Analyze function code
- `POST /api/llm/analyze/dma` - Analyze DMA operations
- `POST /api/llm/analyze/logs` - Analyze instrumentation logs
- `POST /api/llm/security-report` - Generate security report

### Data Management
- `POST /api/llm/save-analysis` - Save analysis results

## Configuration

### Environment Variables
```bash
# Required for LLM functionality
export OPENAI_API_KEY="your-openai-api-key"

# Optional Flask configuration
export FLASK_ENV="development"
export FLASK_DEBUG="1"
```

### File Paths
The webviewer expects instrumentation data in standard locations:
- Functions: `data/logs/*/functions.json`
- DMA operations: `data/logs/*/dma_operations.json`
- IOCTL handlers: `data/logs/*/ioctl_handlers.json`
- Raw logs: `data/logs/*/instrumentation.log`

## Development

### Adding New Features
1. **Frontend**: Add UI components to `templates/index.html`
2. **Styling**: Add styles to appropriate CSS files
3. **JavaScript**: Add functionality to appropriate JS files
4. **Backend**: Add API endpoints to `ui.py`
5. **Testing**: Add tests to `tests/webviewer/`

### Code Style
- Use semantic HTML5 elements
- Follow BEM methodology for CSS
- Use modern JavaScript (ES6+)
- Add comprehensive error handling
- Include JSDoc comments for functions

### Testing
```bash
# Run webviewer tests
python -m pytest tests/webviewer/ -v

# Run specific test file
python -m pytest tests/webviewer/test_ui.py -v
```

## Troubleshooting

### Common Issues

1. **Port Already in Use**
   ```bash
   # Change port in ui.py or kill existing process
   lsof -ti:5000 | xargs kill -9
   ```

2. **Static Files Not Loading**
   - Check file paths in `ui.py`
   - Verify static directory structure
   - Clear browser cache

3. **LLM Not Available**
   - Verify `OPENAI_API_KEY` environment variable
   - Check API key validity and credits
   - Review network connectivity

4. **Data Not Loading**
   - Check instrumentation data file paths
   - Verify JSON file formats
   - Review Flask console for errors

### Debug Mode
```python
# Enable debug mode in ui.py
app.run(debug=True, port=5000)
```

### Browser Console
Use browser developer tools to:
- Check for JavaScript errors
- Monitor network requests
- Debug API responses
- Inspect local storage data

## Security Notes

### API Key Protection
- Never commit API keys to version control
- Use environment variables for sensitive data
- Consider using `.env` files for development

### Data Sensitivity
- Be aware that code sent to OpenAI API may be logged
- Consider using local LLM models for sensitive analysis
- Review OpenAI's data usage policies

### Network Security
- Use HTTPS in production
- Implement proper authentication if needed
- Consider rate limiting for API endpoints

## Contributing

### Development Workflow
1. Fork the repository
2. Create feature branch: `git checkout -b feature/new-feature`
3. Make changes following code style guidelines
4. Add tests for new functionality
5. Update documentation as needed
6. Submit pull request with detailed description

### Code Review Guidelines
- Ensure modular design principles
- Verify proper error handling
- Check responsive design compatibility
- Validate security considerations
- Test cross-browser compatibility

## Support

For issues and questions:
1. Check this README and `LLM_INTEGRATION.md`
2. Review existing issues in the repository
3. Create new issue with detailed reproduction steps
4. Include browser/system information for UI issues

## License

This webviewer module is part of the SpeedKillsAIA project and follows the same licensing terms.
