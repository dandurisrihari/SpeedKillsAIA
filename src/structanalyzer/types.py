"""
Core data types for C structure analysis
"""

from dataclasses import dataclass
from typing import List, Dict, Any, Optional
from enum import Enum, IntEnum


class ValidationError(Exception):
    """Exception raised for validation errors"""
    pass


class FieldType(IntEnum):
    """Field type enumeration"""
    PRIMITIVE = 1
    STRUCT = 2
    UNION = 3
    ARRAY = 4
    POINTER = 5
    FUNCTION_POINTER = 6
    ENUM = 7
    TYPEDEF = 8
    BITFIELD = 9
    UNKNOWN = 10


@dataclass(frozen=True)
class FieldInfo:
    """Information about a structure field"""
    name: str
    type_name: str
    field_type: FieldType
    line_number: int = 0
    is_primitive: bool = False
    size_bytes: Optional[int] = None
    array_size: Optional[int] = None
    pointer_depth: int = 0
    bit_field_size: Optional[int] = None
    offset: Optional[int] = None
    declaration: Optional[str] = None
    resolved_type: Optional[str] = None  # What the type resolves to via typedef
    
    def __str__(self) -> str:
        return f"{self.name}: {self.type_name} ({self.field_type.name})"


@dataclass
class StructureInfo:
    """Information about a C structure or union"""
    name: str
    found: bool
    is_union: bool = False
    fields: List[FieldInfo] = None
    field_count: int = 0
    primitive_count: int = 0
    nested_count: int = 0
    union_count: int = 0
    start_line: int = 0
    end_line: int = 0
    start_byte: int = 0
    end_byte: int = 0
    definition: str = ""
    size_bytes: Optional[int] = None
    alignment: Optional[int] = None
    depth: int = 0
    error: Optional[str] = None
    typedef_name: Optional[str] = None
    nested_structures: List['StructureInfo'] = None
    errors: List[str] = None
    size_info: Optional[Dict[str, Any]] = None
    
    def __post_init__(self):
        if self.fields is None:
            self.fields = []
        if self.nested_structures is None:
            self.nested_structures = []
        if self.errors is None:
            self.errors = []
        if self.size_info is None:
            self.size_info = {}
    
    def __str__(self) -> str:
        type_str = "union" if self.is_union else "struct"
        return f"{type_str} {self.name} ({self.field_count} fields)"


@dataclass
class EnumInfo:
    """Information about an enum definition"""
    name: str
    values: List[str]
    found: bool = False
    start_line: int = 0
    end_line: int = 0
    definition: Optional[str] = None  # Full enum definition as text
    error: Optional[str] = None


@dataclass
class TypedefInfo:
    """Information about a typedef definition"""
    name: str
    underlying_type: str
    found: bool = True
    start_line: int = 0
    end_line: int = 0
    definition: Optional[str] = None  # Full typedef definition as text
    is_primitive: bool = False  # Whether it resolves to a primitive type


@dataclass
@dataclass
class AnalysisResult:
    """Result of structure analysis"""
    structure_name: str
    file_path: str
    max_depth: int
    analysis_complete: bool
    timestamp: float
    structures: Dict[str, StructureInfo]
    enums: Dict[str, EnumInfo] = None  # Add enum information
    typedefs: Dict[str, TypedefInfo] = None  # Add typedef information
    total_structures: int = 0
    analysis_time: float = 0.0
    errors: List[str] = None
    start_time: Optional[float] = None
    end_time: Optional[float] = None
    warnings: List[str] = None
    parsing_time: Optional[float] = None
    
    def __post_init__(self):
        if self.errors is None:
            self.errors = []
        if self.warnings is None:
            self.warnings = []
        if self.enums is None:
            self.enums = {}
        if self.typedefs is None:
            self.typedefs = {}
        if self.total_structures == 0:
            self.total_structures = len(self.structures)
    
    def get_main_structure(self) -> Optional[StructureInfo]:
        """Get the main structure that was analyzed"""
        return self.structures.get(self.structure_name)
    
    def get_nested_structures(self) -> List[StructureInfo]:
        """Get all nested structures found during analysis"""
        main_struct = self.get_main_structure()
        if not main_struct:
            return []
        
        nested = []
        for struct_info in self.structures.values():
            if struct_info.name != self.structure_name and struct_info.found:
                nested.append(struct_info)
        return nested
    
    def get_statistics(self) -> Dict[str, Any]:
        """Get analysis statistics"""
        total_fields = sum(s.field_count for s in self.structures.values() if s.found)
        total_primitives = sum(s.primitive_count for s in self.structures.values() if s.found)
        total_nested = sum(s.nested_count for s in self.structures.values() if s.found)
        total_unions = sum(s.union_count for s in self.structures.values() if s.found)
        
        return {
            "total_structures": self.total_structures,
            "total_fields": total_fields,
            "total_primitives": total_primitives,
            "total_nested": total_nested,
            "total_unions": total_unions,
            "analysis_time": self.analysis_time,
            "max_depth": self.max_depth,
            "success_rate": len([s for s in self.structures.values() if s.found]) / len(self.structures) if self.structures else 0.0
        }
    
    def add_warning(self, warning: str) -> None:
        """Add a warning to the result"""
        if warning:
            self.warnings.append(warning)
    
    @property
    def success(self) -> bool:
        """Check if analysis was successful"""
        return self.analysis_complete and len(self.errors) == 0


@dataclass
class CommentInfo:
    """Information about C comments"""
    text: str
    line_number: int
    comment_type: str = "single_line"
    is_multiline: bool = False
    start_pos: int = 0
    end_pos: int = 0


@dataclass
class MacroInfo:
    """Information about C macros"""
    name: str
    value: str
    line_number: int
    parameters: Optional[List[str]] = None
    is_function_like: bool = False
