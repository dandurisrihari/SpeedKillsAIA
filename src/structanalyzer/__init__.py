"""
C Structure Analyzer - Modular Tree-sitter Based Library

A clean, efficient library for analyzing C structures and unions using Tree-sitter AST parsing.
Supports comprehensive structure analysis with configurable depth and custom primitive types.
"""

from .analyzer import CStructureAnalyzer
from .types import FieldInfo, StructureInfo, AnalysisResult, FieldType
from .parser import TreeSitterParser
from .primitives import PrimitiveTypeManager
from .output import OutputFormatter, OutputManager

__version__ = "2.0.0"
__author__ = "C Structure Analyzer Team"
__description__ = "Modular Tree-sitter based C structure analysis library"

__all__ = [
    "CStructureAnalyzer",
    "FieldInfo",
    "StructureInfo", 
    "AnalysisResult",
    "FieldType",
    "TreeSitterParser",
    "PrimitiveTypeManager",
    "OutputFormatter",
    "OutputManager"
]
