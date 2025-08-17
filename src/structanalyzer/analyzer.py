"""
Main C Structure Analyzer class with comprehensive union support
"""

import time
from typing import Dict, List, Any, Optional, Set
from .types import StructureInfo, AnalysisResult, FieldType
from .parser import TreeSitterParser
from .primitives import PrimitiveTypeManager


class CStructureAnalyzer:
    """Main C structure and union analyzer using Tree-sitter"""
    
    def __init__(self, file_path: str, custom_primitives: Optional[Set[str]] = None):
        """Initialize analyzer with file path and optional custom primitive types"""
        self.file_path = file_path
        self.primitive_manager = PrimitiveTypeManager(custom_primitives)
        self.parser = TreeSitterParser(file_path, self.primitive_manager)
        self.analysis_cache: Dict[str, StructureInfo] = {}
    
    @property  
    def tree(self):
        """Get the AST tree from the parser"""
        return self.parser.ast_root
    
    def analyze_structure(self, structure_name: str, max_depth: int = 3, 
                         verbose: bool = False) -> AnalysisResult:
        """Analyze a structure/union and its nested components up to max_depth"""
        
        if verbose:
            print(f"🔍 Analyzing: {structure_name} (max depth: {max_depth})")
        
        start_time = time.time()
        structures = {}
        errors = []
        
        # Start recursive analysis
        try:
            self._analyze_recursive(structure_name, structures, 0, max_depth, verbose, errors)
        except Exception as e:
            errors.append(f"Analysis failed: {str(e)}")
            if verbose:
                print(f"❌ Analysis error: {e}")
        
        analysis_time = time.time() - start_time
        
        return AnalysisResult(
            structure_name=structure_name,
            file_path=self.file_path,
            max_depth=max_depth,
            analysis_complete=True,
            timestamp=start_time,
            structures=structures,
            total_structures=len(structures),
            analysis_time=analysis_time,
            errors=errors
        )
    
    def _analyze_recursive(self, struct_name: str, structures: Dict[str, StructureInfo], 
                          current_depth: int, max_depth: int, verbose: bool = False,
                          errors: List[str] = None) -> bool:
        """Recursively analyze structure and its dependencies"""
        
        if errors is None:
            errors = []
        
        indent = "  " * current_depth
        
        if verbose:
            print(f"{indent}🔍 Analyzing: {struct_name} (depth {current_depth})")
        
        # Check if already analyzed
        if struct_name in structures:
            if verbose:
                print(f"{indent}✅ Already analyzed: {struct_name}")
            return True
        
        # Check if in cache
        if struct_name in self.analysis_cache:
            structures[struct_name] = self.analysis_cache[struct_name]
            if verbose:
                print(f"{indent}💾 Found in cache: {struct_name}")
            return True
        
        # Check depth limit - but allow analyzing the root structure even at depth 0
        if current_depth > max_depth:
            if verbose:
                print(f"{indent}⚠️ Depth limit reached for: {struct_name}")
            structures[struct_name] = StructureInfo(
                name=struct_name,
                found=False,
                depth=current_depth,
                error="Depth limit reached"
            )
            return False
        
        # Find structure definition
        try:
            struct_info = self.parser.find_structure(struct_name, verbose=False)
        except Exception as e:
            error_msg = f"Failed to parse {struct_name}: {str(e)}"
            errors.append(error_msg)
            if verbose:
                print(f"{indent}❌ Parse error: {struct_name} - {error_msg}")
            structures[struct_name] = StructureInfo(
                name=struct_name,
                found=False,
                depth=current_depth,
                error=error_msg
            )
            return False
        
        if not struct_info or not struct_info.found:
            if verbose:
                print(f"{indent}❌ Structure not found: {struct_name}")
            structures[struct_name] = StructureInfo(
                name=struct_name,
                found=False,
                depth=current_depth,
                error=f"Structure '{struct_name}' not found"
            )
            return False
        
        # Set depth and cache
        struct_info.depth = current_depth
        structures[struct_name] = struct_info
        self.analysis_cache[struct_name] = struct_info
        
        type_str = "union" if struct_info.is_union else "struct"
        if verbose:
            print(f"{indent}✅ Found {type_str}: {struct_name} ({struct_info.field_count} fields)")
            if struct_info.union_count > 0:
                print(f"{indent}   🔀 Contains {struct_info.union_count} union fields")
        
        # Analyze nested structures and unions
        for field in struct_info.fields:
            if not field.is_primitive:
                nested_name = self._extract_nested_type_name(field.type_name)
                if nested_name and nested_name != struct_name:  # Avoid infinite recursion
                    if verbose:
                        field_type_str = field.field_type.value
                        print(f"{indent}   🔗 Nested {field_type_str}: {field.name} -> {nested_name}")
                    self._analyze_recursive(nested_name, structures, current_depth + 1, 
                                          max_depth, verbose, errors)
            
            # Special handling for union fields - analyze each union member
            if field.field_type == FieldType.UNION:
                union_members = self._extract_union_members(field, struct_name)
                for member_name in union_members:
                    if member_name and member_name != struct_name:  # Avoid infinite recursion
                        if verbose:
                            print(f"{indent}   🔀 Union member: {field.name}.{member_name}")
                        self._analyze_recursive(member_name, structures, current_depth + 1, 
                                              max_depth, verbose, errors)
        
        return True
    
    def _extract_nested_type_name(self, type_name: str) -> Optional[str]:
        """Extract the base type name from a complex type declaration"""
        if not type_name:
            return None
        
        # Remove common keywords and modifiers
        clean_name = type_name.strip()
        
        # Remove struct/union/enum keywords
        for keyword in ['struct ', 'union ', 'enum ']:
            clean_name = clean_name.replace(keyword, '')
        
        # Remove pointers and arrays
        clean_name = clean_name.split('*')[0].split('[')[0].strip()
        
        # Remove modifiers
        modifiers = ['const', 'volatile', 'restrict', 'static', 'extern']
        for modifier in modifiers:
            clean_name = clean_name.replace(f'{modifier} ', '').replace(f' {modifier}', '')
        
        clean_name = clean_name.strip()
        
        # Skip if it looks like a primitive
        if self.primitive_manager.is_primitive(clean_name):
            return None
        
        # Skip anonymous structs/unions
        if clean_name in ['anonymous_struct', 'anonymous_union']:
            return None
        
        return clean_name if clean_name else None
    
    def _extract_union_members(self, union_field: 'FieldInfo', parent_struct_name: str) -> List[str]:
        """Extract member type names from a union field"""
        from .types import FieldType
        
        members = []
        
        if union_field.field_type != FieldType.UNION:
            return members
        
        # Parse the union declaration to extract member types
        declaration = union_field.declaration
        if not declaration:
            return members
        
        try:
            # Look for lines that contain member declarations
            # Example: "gcsHAL_CHIP_INFO ChipInfo;"
            lines = declaration.split('\n')
            for line in lines:
                line = line.strip()
                if ';' in line and not line.startswith('//') and not line.startswith('/*'):
                    # Remove comments and preprocessing directives
                    if '#' in line:
                        line = line.split('#')[0].strip()
                    if '//' in line:
                        line = line.split('//')[0].strip()
                    
                    # Extract type name (first word before variable name)
                    parts = line.replace(';', '').strip().split()
                    if len(parts) >= 2:
                        potential_type = parts[0]
                        # Clean up the type name
                        clean_type = self._extract_nested_type_name(potential_type)
                        if clean_type and clean_type != parent_struct_name:
                            members.append(clean_type)
        
        except Exception as e:
            # If parsing fails, just return empty list
            pass
        
        return members
    
    def find_structure(self, structure_name: str, verbose: bool = False) -> StructureInfo:
        """Find a single structure/union without recursive analysis"""
        return self.parser.find_structure(structure_name, verbose)
    
    def add_primitive_types(self, types: Set[str]) -> None:
        """Add custom primitive types"""
        self.primitive_manager.add_primitives(types)
        # Clear cache since primitive detection may have changed
        self.analysis_cache.clear()
    
    def get_primitive_types(self) -> Set[str]:
        """Get all primitive types"""
        return self.primitive_manager.get_all_primitives()
    
    def list_all_structures(self, max_results: int = 100) -> List[str]:
        """List all structure and union names found in the file"""
        return self.parser.list_all_structures(max_results)
    
    def get_file_statistics(self) -> Dict[str, Any]:
        """Get file parsing and analysis statistics"""
        return self.parser.get_file_statistics()
    
    def clear_cache(self) -> None:
        """Clear the analysis cache"""
        self.analysis_cache.clear()
    
    def get_cache_size(self) -> int:
        """Get the number of cached analyses"""
        return len(self.analysis_cache)
    
    def analyze_multiple_structures(self, structure_names: List[str], max_depth: int = 3,
                                  verbose: bool = False) -> Dict[str, AnalysisResult]:
        """Analyze multiple structures efficiently"""
        results = {}
        
        if verbose:
            print(f"🔍 Analyzing {len(structure_names)} structures...")
        
        for i, struct_name in enumerate(structure_names, 1):
            if verbose:
                print(f"\n📊 Analysis {i}/{len(structure_names)}: {struct_name}")
            
            result = self.analyze_structure(struct_name, max_depth, verbose)
            results[struct_name] = result
        
        return results
    
    def find_structures_containing_field(self, field_name: str, 
                                       field_type: Optional[str] = None) -> List[str]:
        """Find all structures that contain a field with the given name/type"""
        # This would require traversing all structures - simplified implementation
        all_structures = self.list_all_structures(1000)
        matching_structures = []
        
        for struct_name in all_structures:
            try:
                struct_info = self.find_structure(struct_name)
                if struct_info.found:
                    for field in struct_info.fields:
                        if field.name == field_name:
                            if field_type is None or field_type in field.type_name:
                                matching_structures.append(struct_name)
                                break
            except Exception:
                # Skip structures that can't be parsed
                continue
        
        return matching_structures
    
    def get_structure_dependencies(self, structure_name: str, max_depth: int = 10) -> Dict[str, List[str]]:
        """Get dependency graph for a structure"""
        result = self.analyze_structure(structure_name, max_depth, verbose=False)
        dependencies = {}
        
        for struct_name, struct_info in result.structures.items():
            if struct_info.found:
                deps = []
                for field in struct_info.fields:
                    if not field.is_primitive:
                        nested_name = self._extract_nested_type_name(field.type_name)
                        if nested_name and nested_name != struct_name:
                            deps.append(nested_name)
                dependencies[struct_name] = deps
        
        return dependencies
