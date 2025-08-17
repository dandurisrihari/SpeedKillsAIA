"""
Primitive type management for C structure analysis with typedef resolution
"""

from typing import Set, Optional, Dict


class PrimitiveTypeManager:
    """Manages primitive type detection and categorization with typedef resolution"""
    
    # Standard C primitive types
    STANDARD_PRIMITIVES = {
        # Basic C types
        'void', 'char', 'short', 'int', 'long', 'float', 'double',
        'signed', 'unsigned',
        
        # Sized integer types
        'int8_t', 'int16_t', 'int32_t', 'int64_t',
        'uint8_t', 'uint16_t', 'uint32_t', 'uint64_t',
        'intptr_t', 'uintptr_t', 'size_t', 'ssize_t', 'ptrdiff_t',
        
        # Wide character types
        'wchar_t', 'char16_t', 'char32_t',
        
        # Boolean types
        'bool', '_Bool',
        
        # Windows types
        'BYTE', 'WORD', 'DWORD', 'QWORD', 'HANDLE', 'HWND',
        'BOOL', 'UINT', 'LONG', 'ULONG', 'SHORT', 'USHORT',
    
    }
    
    def __init__(self, custom_primitives: Optional[Set[str]] = None):
        """Initialize with optional custom primitive types"""
        self._primitives = self.STANDARD_PRIMITIVES.copy()
        self._typedef_map: Dict[str, str] = {}  # Maps typedef name to underlying type
        
        if custom_primitives:
            self._primitives.update(custom_primitives)
    
    def add_typedef(self, typedef_name: str, underlying_type: str) -> None:
        """Add a typedef mapping"""
        if typedef_name and underlying_type:
            clean_typedef = typedef_name.strip()
            clean_underlying = underlying_type.strip()  # Don't clean the underlying type
            self._typedef_map[clean_typedef] = clean_underlying
            
            # If the underlying type resolves to a primitive, add the typedef as primitive
            if self._resolve_type_recursive(clean_underlying):
                self._primitives.add(clean_typedef)
    
    def add_typedefs(self, typedef_dict: Dict[str, str]) -> None:
        """Add multiple typedef mappings"""
        for typedef_name, underlying_type in typedef_dict.items():
            self.add_typedef(typedef_name, underlying_type)
    
    def _resolve_type_recursive(self, type_name: str, visited: Optional[Set[str]] = None) -> bool:
        """Recursively resolve a type through typedef chain to check if it's primitive"""
        if visited is None:
            visited = set()
        
        if not type_name or type_name in visited:
            return False
        
        visited.add(type_name)
        clean_name = self._clean_type_name(type_name)
        
        # Check if it's a standard primitive
        if self._is_standard_primitive(clean_name):
            return True
        
        # Check typedef mapping
        if clean_name in self._typedef_map:
            underlying = self._typedef_map[clean_name]
            return self._resolve_type_recursive(underlying, visited)
        
        return False
    
    def _is_standard_primitive(self, type_name: str) -> bool:
        """Check if a type is a standard C primitive (including common variations)"""
        if not type_name:
            return False
        
        clean = type_name.strip()
        
        # Direct match with standard primitives (case sensitive)
        if clean in self.STANDARD_PRIMITIVES:
            return True
        
        # Check for common variations (case sensitive)
        primitive_patterns = [
            'unsigned int', 'signed int', 'unsigned long', 'signed long',
            'unsigned short', 'signed short', 'unsigned char', 'signed char',
            'long long', 'unsigned long long', 'signed long long',
            'long double', 'long int', 'short int', 'signed short int',
            'unsigned short int', 'signed long int', 'unsigned long int',
            'signed long long int', 'unsigned long long int'
        ]
        
        for pattern in primitive_patterns:
            if clean == pattern or clean.replace(' ', '') == pattern.replace(' ', ''):
                return True
        
        return False
    
    def is_primitive(self, type_name: str) -> bool:
        """Check if a type is considered primitive (including typedef resolution)"""
        if not type_name:
            return False
        
        # Clean the type name
        clean_name = self._clean_type_name(type_name)
        
        # Direct match in primitives set (case sensitive)
        if clean_name in self._primitives:
            return True
        
        # Check typedef resolution
        if self._resolve_type_recursive(clean_name):
            return True
        
        # Check for _t suffix (common convention for primitive types)
        if clean_name.endswith('_t') and len(clean_name) > 2:
            return True
        
        # Check for enum-like patterns (usually treated as primitives)
        if self._looks_like_enum(clean_name):
            return True

        # Additional complex type patterns (case sensitive)
        complex_patterns = [
            'short int', 'unsigned long long int', 'unsigned long long',
            'signed long long', 'long long int', 'long double'
        ]
        
        for pattern in complex_patterns:
            if clean_name == pattern or clean_name.replace(' ', '') == pattern.replace(' ', ''):
                return True
        
        return False
    
    def _clean_type_name(self, type_name: str) -> str:
        """Clean type name by removing modifiers and whitespace"""
        if not type_name:
            return ""
        
        # Remove common modifiers
        clean = type_name.strip()
        
        # Remove const, volatile, restrict, static, extern, etc.
        modifiers = ['const', 'volatile', 'restrict', 'static', 'extern', 'register', 'auto']
        for modifier in modifiers:
            clean = clean.replace(f'{modifier} ', '').replace(f' {modifier}', '')
        
        # Remove struct/union/enum keywords
        clean = clean.replace('struct ', '').replace('union ', '').replace('enum ', '')
        
        # Remove pointer indicators and array brackets
        clean = clean.split('*')[0].split('[')[0].strip()
        
        # Don't remove underscores from type names like _Bool, since they're part of the type
        return clean
    
    def _looks_like_enum(self, type_name: str) -> bool:
        """Check if type name looks like an enum (heuristic)"""
        if not type_name:
            return False
        
        # Common enum prefixes in graphics/driver code (but not struct prefixes)
        enum_prefixes = ['gce', 'gct', 'VK_', 'GL_', 'CL_']
        
        for prefix in enum_prefixes:
            if type_name.startswith(prefix):
                return True
        
        # Check for ALL_CAPS pattern (common for enums) but exclude common struct patterns
        if type_name.isupper() and '_' in type_name:
            # Exclude common struct prefixes that might be in all caps
            struct_patterns = ['gcsHAL_', 'gcoOS_', 'gcsSURF_', 'gcs_']
            if not any(type_name.startswith(pattern.upper()) for pattern in struct_patterns):
                return True
        
        return False
    
    def add_primitive(self, type_name: str) -> None:
        """Add a custom primitive type"""
        if type_name:
            self._primitives.add(type_name.strip())
    
    def add_primitives(self, type_names: Set[str]) -> None:
        """Add multiple primitive types"""
        for type_name in type_names:
            self.add_primitive(type_name)
    
    def remove_primitive(self, type_name: str) -> bool:
        """Remove a primitive type. Returns True if removed, False if not found"""
        try:
            self._primitives.remove(type_name.strip())
            return True
        except KeyError:
            return False
    
    def get_all_primitives(self) -> Set[str]:
        """Get all primitive types"""
        return self._primitives.copy()
    
    def get_custom_primitives(self) -> Set[str]:
        """Get only custom primitive types (not standard ones)"""
        return self._primitives - self.STANDARD_PRIMITIVES
    
    def get_typedef_map(self) -> Dict[str, str]:
        """Get all typedef mappings"""
        return self._typedef_map.copy()
    
    def resolve_type(self, type_name: str) -> Optional[str]:
        """Resolve a type through typedef chain to its ultimate underlying type"""
        if not type_name:
            return ""
        
        clean_name = self._clean_type_name(type_name)
        visited = set()
        
        current = clean_name
        while current and current not in visited:
            visited.add(current)
            if current in self._typedef_map:
                current = self._typedef_map[current]
            else:
                break
        
        # Return the resolved type, or original type if no resolution found
        return current if current else type_name
    
    def clear_custom_primitives(self) -> None:
        """Remove all custom primitive types, keeping only standard ones"""
        self._primitives = self.STANDARD_PRIMITIVES.copy()
    
    def clear_typedefs(self) -> None:
        """Clear all typedef mappings"""
        self._typedef_map.clear()
        # Rebuild primitive set to exclude typedef-derived primitives
        self._primitives = self.STANDARD_PRIMITIVES.copy()
    
    def categorize_type(self, type_name: str) -> str:
        """Categorize a type name into primitive categories"""
        if not self.is_primitive(type_name):
            return "non_primitive"
        
        clean_name = self._clean_type_name(type_name)
        
        # Integer types
        if any(t in clean_name.lower() for t in ['int', 'uint', 'long', 'short', 'byte']):
            return "integer"
        
        # Floating point types
        if any(t in clean_name.lower() for t in ['float', 'double']):
            return "floating_point"
        
        # Character types
        if any(t in clean_name.lower() for t in ['char', 'wchar']):
            return "character"
        
        # Boolean types
        if any(t in clean_name.lower() for t in ['bool', 'boolean']):
            return "boolean"
        
        # Handle/pointer types
        if any(t in clean_name.lower() for t in ['handle', 'pointer', 'addr']):
            return "handle"
        
        # Size types
        if any(t in clean_name.lower() for t in ['size', 'len']):
            return "size"
        
        return "other_primitive"

    # Add missing properties and methods for tests
    @property
    def primitives(self) -> Set[str]:
        """Get all primitive types (for compatibility)"""
        return self._primitives.copy()
    
    @property
    def typedef_map(self) -> Dict[str, str]:
        """Get typedef map (for compatibility)"""
        return self._typedef_map.copy()
    
    def add_types(self, types: Set[str]) -> None:
        """Add multiple types (for compatibility)"""
        self.add_primitives(types)
    
    def get_type_category(self, type_name: str) -> str:
        """Get type category (for compatibility)"""
        return self.categorize_type(type_name)
