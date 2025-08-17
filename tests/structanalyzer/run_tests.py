"""
Test runner for structanalyzer module
"""
import pytest
import sys
from pathlib import Path

# Add src to path for imports
src_path = Path(__file__).parent.parent.parent / "src"
sys.path.insert(0, str(src_path))

if __name__ == "__main__":
    # Run tests for structanalyzer module only
    pytest.main([
        "tests/structanalyzer/",
        "-v",
        "--tb=short",
        "--cov=src.structanalyzer",
        "--cov-report=term-missing",
        "--cov-report=html:htmlcov"
    ])
