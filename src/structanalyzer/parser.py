"""
Tree-sitter parser for C structures and unions with comprehensive support
"""

import re
import os
from pathlib import Path
from typing import Dict, List, Any, Optional, Set, Tuple
from .types import FieldInfo, StructureInfo, FieldType, EnumInfo
from .primitives import PrimitiveTypeManager

# Tree-sitter imports with fallback
try:
    import tree_sitter_c as tsc
    from tree_sitter import Language, Parser, Node
    TREE_SITTER_AVAILABLE = True
except ImportError:
    TREE_SITTER_AVAILABLE = False
    Node = Any  # Fallback type
    Language = Any
    Parser = Any


class TreeSitterParser:
    """Enhanced Tree-sitter based C structure and union parser"""
    
    def __init__(self, file_path: Optional[str] = None, primitive_manager: Optional[PrimitiveTypeManager] = None):
        """Initialize parser with optional file path and primitive manager"""
        self.file_path = file_path
        self.primitive_manager = primitive_manager or PrimitiveTypeManager()
        
        # Initialize Tree-sitter
        if not TREE_SITTER_AVAILABLE:
            raise RuntimeError(
                "Tree-sitter not available. Install with: pip install tree-sitter tree-sitter-c"
            )
        
        try:
            self.language = Language(tsc.language())
            self.parser = Parser(self.language)
            
            # Read file content if file_path provided
            if self.file_path:
                self.file_content = self._read_file()
                self.source_bytes = self.file_content.encode('utf8')
                tree = self.parser.parse(self.source_bytes)
                self.ast_root = tree.root_node
                
                # Extract and process typedefs automatically
                self._extract_and_process_typedefs()
            else:
                self.file_content = ""
                self.source_bytes = b""
                self.ast_root = None
            
        except Exception as e:
            raise RuntimeError(f"Failed to initialize Tree-sitter parser: {e}")
    
    def _extract_and_process_typedefs(self) -> None:
        """Extract typedef declarations and add them to primitive manager"""
        typedefs = self.extract_typedefs()
        self.primitive_manager.add_typedefs(typedefs)
    
    def extract_typedefs(self) -> Dict[str, str]:
        """Extract all typedef declarations from the file"""
        typedefs = {}
        
        def traverse_node(node: Node):
            if node.type == 'type_definition':
                typedef_info = self._extract_typedef_info(node)
                if typedef_info:
                    typedef_name, underlying_type = typedef_info
                    typedefs[typedef_name] = underlying_type
            
            # Recursively search children
            for child in node.children:
                traverse_node(child)
        
        traverse_node(self.ast_root)
        return typedefs
    
    def _extract_typedef_info(self, typedef_node: Node) -> Optional[Tuple[str, str]]:
        """Extract typedef name and underlying type from a typedef node"""
        try:
            # Find the typedef name (usually the last identifier)
            typedef_name = None
            underlying_type = None
            
            # Look for type_identifier (the new type name)
            primitive_type_texts = []
            for child in typedef_node.children:
                if child.type == 'type_identifier':
                    typedef_name = self._get_node_text(child)
                elif child.type == 'primitive_type':
                    text = self._get_node_text(child)
                    primitive_type_texts.append(text)
                elif child.type in ['sized_type_specifier', 'type_descriptor']:
                    # Handle complex types like "unsigned int", "long long"
                    underlying_type = self._get_node_text(child)
            
            # If no type_identifier found, use the last primitive_type as typedef name
            if not typedef_name and primitive_type_texts:
                typedef_name = primitive_type_texts[-1]
                # And if there are multiple primitive_types, the first ones might be underlying type
                if len(primitive_type_texts) > 1:
                    underlying_type = ' '.join(primitive_type_texts[:-1])
            
            # Handle more complex typedef patterns
            if not underlying_type:
                # Try to extract from the full declaration
                full_text = self._get_node_text(typedef_node)
                # Pattern: typedef <underlying_type> <new_type>;
                import re
                match = re.match(r'typedef\s+(.+?)\s+(\w+)\s*;', full_text.strip())
                if match:
                    underlying_type = match.group(1).strip()
                    if not typedef_name:
                        typedef_name = match.group(2).strip()
            
            if typedef_name and underlying_type:
                return (typedef_name, underlying_type)
                
        except Exception:
            pass
        
        return None
    
    def _read_file(self) -> str:
        """Read file content safely"""
        if not self.file_path:
            return ""
        try:
            with open(self.file_path, 'r', encoding='utf-8', errors='ignore') as f:
                return f.read()
        except Exception as e:
            raise RuntimeError(f"Failed to read file {self.file_path}: {e}")
    
    # Methods expected by tests
    def parse(self, content: str):
        """Parse C content and return AST tree"""
        if not TREE_SITTER_AVAILABLE:
            raise RuntimeError("Tree-sitter not available")
        
        source_bytes = content.encode('utf8')
        return self.parser.parse(source_bytes)
    
    def find_structures(self, tree=None):
        """Find all structures and unions in the tree"""
        if tree is None:
            # Use original instance method if no tree provided
            return self.find_structures_original()
        
        # Handle tree parameter
        structures = []
        
        def traverse_node(node):
            if node.type in ['struct_specifier', 'union_specifier']:
                name = self._extract_structure_name(node)
                if name:
                    structures.append({
                        "name": name,
                        "type": "union" if node.type == 'union_specifier' else "struct",
                        "node": node,
                        "start_line": node.start_point[0] + 1,
                        "end_line": node.end_point[0] + 1
                    })
            
            for child in node.children:
                traverse_node(child)
        
        traverse_node(tree.root_node)
        return structures
    
    def find_specific_structure(self, tree, name: str) -> Optional[Dict]:
        """Find a specific structure by name"""
        if not name:
            return None
        
        structures = self.find_structures(tree)
        for struct in structures:
            if struct.get("name") == name:
                return struct
        return None
    

    
    def get_typedef_declarations(self, tree) -> List[Dict]:
        """Get all typedef declarations from tree"""
        typedefs = []
        
        def traverse_node(node):
            if node.type == 'type_definition':
                typedef_info = self._extract_typedef_info(node)
                if typedef_info:
                    name, underlying_type = typedef_info
                    typedefs.append({
                        "name": name,
                        "underlying_type": underlying_type
                    })
            
            for child in node.children:
                traverse_node(child)
        
        traverse_node(tree.root_node)
        return typedefs
    
    def get_enum_declarations(self, tree) -> List[Dict]:
        """Get all enum declarations from tree"""
        enums = []
        
        def traverse_node(node):
            if node.type == 'enum_specifier':
                name = self._extract_enum_name(node)
                if name:
                    enums.append({
                        "name": name,
                        "type": "enum"
                    })
            
            for child in node.children:
                traverse_node(child)
        
        traverse_node(tree.root_node)
        return enums
    
    def _extract_structure_name(self, node) -> Optional[str]:
        """Extract structure name from node"""
        for child in node.children:
            if child.type == 'type_identifier':
                return self._get_node_text(child)
        return None
    
    def _extract_enum_name(self, node) -> Optional[str]:
        """Extract enum name from node"""
        for child in node.children:
            if child.type == 'type_identifier':
                return self._get_node_text(child)
        return None
    
    def find_enum_definition(self, enum_name: str) -> Optional[EnumInfo]:
        """Find and extract a specific enum definition by name"""
        
        def traverse_node(node):
            # Look for typedef enum patterns: typedef enum _NAME { ... } NAME;
            if node.type == 'type_definition':
                typedef_name = None
                enum_node = None
                
                for child in node.children:
                    if child.type == 'type_identifier':
                        typedef_name = self._get_node_text(child)
                    elif child.type == 'enum_specifier':
                        enum_node = child
                
                if typedef_name == enum_name and enum_node:
                    return self._extract_enum_definition(enum_node, typedef_name)
            
            # Look for direct enum definitions: enum NAME { ... };
            elif node.type == 'enum_specifier':
                name = self._extract_enum_name(node)
                if name == enum_name:
                    return self._extract_enum_definition(node, name)
            
            # Recursively search children
            for child in node.children:
                result = traverse_node(child)
                if result:
                    return result
            return None
        
        return traverse_node(self.ast_root)
    
    def _extract_enum_definition(self, enum_node, name: str) -> EnumInfo:
        """Extract enum definition details from an enum_specifier node"""
        
        values = []
        
        # Get the full text of the enum
        enum_text = self._get_node_text(enum_node)
        
        # Extract enum values
        for child in enum_node.children:
            if child.type == 'enumerator_list':
                for enumerator in child.children:
                    if enumerator.type == 'enumerator':
                        # Extract the enumerator name
                        for grandchild in enumerator.children:
                            if grandchild.type == 'identifier':
                                values.append(self._get_node_text(grandchild))
                                break
        
        return EnumInfo(
            name=name,
            values=values,
            found=True,
            start_line=enum_node.start_point[0] + 1,
            end_line=enum_node.end_point[0] + 1,
            definition=enum_text
        )
    
    def _extract_field_from_declaration(self, field_decl_node) -> List[Dict]:
        """Extract field information from field declaration node"""
        fields = []
        
        # Get type information
        type_name = ""
        field_names = []
        
        # Look for type information in the declaration
        for child in field_decl_node.children:
            if child.type in ['primitive_type', 'type_identifier', 'sized_type_specifier']:
                type_name = self._get_node_text(child)
            elif child.type == 'field_declarator':
                field_name = self._extract_field_name(child)
                if field_name:
                    field_names.append(field_name)
            elif child.type == 'field_identifier':
                field_names.append(self._get_node_text(child))
            elif child.type == 'array_declarator':
                # Handle array declarations like "name[50]" or "matrix[5][5]"
                field_name = self._extract_field_name_from_array(child)
                if field_name:
                    field_names.append(field_name)
            elif child.type == 'pointer_declarator':
                # Handle pointer declarations like "* ptr" or "* array[20]"
                field_name = self._extract_field_name_from_pointer(child)
                if field_name:
                    field_names.append(field_name)
        
        # Handle cases where type and field are in same line
        if not type_name and not field_names:
            # Try to parse the full text
            full_text = self._get_node_text(field_decl_node).strip()
            if full_text:
                parts = full_text.split()
                if len(parts) >= 2:
                    type_name = parts[0] 
                    field_name = parts[1].rstrip(';')
                    field_names = [field_name]
        
        # Create field info for each field name
        for field_name in field_names:
            fields.append({
                "name": field_name,
                "type": type_name or "unknown"
            })
        
        return fields
    
    def _extract_field_name(self, declarator_node) -> Optional[str]:
        """Extract field name from declarator node"""
        if declarator_node.type == 'field_declarator':
            for child in declarator_node.children:
                if child.type == 'field_identifier':
                    return self._get_node_text(child)
        elif declarator_node.type == 'field_identifier':
            return self._get_node_text(declarator_node)
        return None
    
    def _extract_field_name_from_array(self, array_node) -> Optional[str]:
        """Extract field name from array declarator node"""
        # For array_declarator like "name[50]" or nested like "matrix[5][5]", get the field name
        for child in array_node.children:
            if child.type == 'field_identifier':
                return self._get_node_text(child)
            elif child.type == 'array_declarator':
                # Recursively handle nested arrays like matrix[5][5]
                return self._extract_field_name_from_array(child)
        return None
    
    def _extract_field_name_from_pointer(self, pointer_node) -> Optional[str]:
        """Extract field name from pointer declarator node"""
        # For pointer_declarator like "* ptr" or "* array[20]", get the field name
        for child in pointer_node.children:
            if child.type == 'field_identifier':
                return self._get_node_text(child)
            elif child.type == 'array_declarator':
                # Handle pointer to array like "* array[20]"
                return self._extract_field_name_from_array(child)
            elif child.type == 'pointer_declarator':
                # Handle double pointers like "** ptr"
                return self._extract_field_name_from_pointer(child)
        return None
    
    def find_structures_internal(self) -> List[StructureInfo]:
        """Internal method to find structures using existing logic"""
        try:
            return self.find_structures()
        except:
            return []
    
    def find_structure_by_name(self, name: str, tree=None) -> Optional[StructureInfo]:
        """Find structure by name, compatible with test expectations"""
        if tree:
            # Use tree-based search
            specific = self.find_specific_structure(tree, name)
            if specific:
                # Convert to StructureInfo format
                return StructureInfo(
                    name=name,
                    found=True,
                    is_union=specific.get("type") == "union"
                )
        return self.find_structure_by_name_internal(name)
    
    def find_structure_by_name_internal(self, name: str) -> Optional[StructureInfo]:
        """Internal method using existing logic"""
        try:
            return self.find_structure_by_name(name)  
        except:
            return None
    
    def find_typedefs(self, tree=None) -> Dict[str, str]:
        """Find typedefs, compatible with test expectations"""
        if tree:
            typedefs = self.get_typedef_declarations(tree)
            return {t["name"]: t["underlying_type"] for t in typedefs}
        return self.find_typedefs_internal()
    
    def find_typedefs_internal(self) -> Dict[str, str]:
        """Internal method using existing logic"""
        try:
            return self.find_typedefs()
        except:
            return {}
    
    def parse_file(self, file_path: str):
        """Parse file and return tree"""
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"File not found: {file_path}")
        
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        return self.parse(content)
    
    def parse_string(self, content: str):
        """Parse string content and return tree"""
        return self.parse(content)
    
    def find_structure(self, structure_name: str, verbose: bool = False) -> StructureInfo:
        """Find a structure or union definition"""
        if verbose:
            print(f"🔍 Searching for: {structure_name}")
        
        # Search for structure/union definitions
        candidates = []
        
        def traverse_node(node: Node):
            # Look for struct and union specifiers
            if node.type in ['struct_specifier', 'union_specifier']:
                candidates.append(node)
            
            # Look for typedef declarations
            elif node.type == 'type_definition':
                for child in node.children:
                    if child.type in ['struct_specifier', 'union_specifier']:
                        candidates.append((node, child))
            
            # Recursively search children
            for child in node.children:
                traverse_node(child)
        
        traverse_node(self.ast_root)
        
        if verbose:
            print(f"   Found {len(candidates)} struct/union candidates")
        
        # Sort candidates to prioritize full definitions over forward declarations
        def has_field_list(candidate):
            """Check if candidate has field declarations (not just forward declaration)"""
            if isinstance(candidate, tuple):
                _, struct_node = candidate
            else:
                struct_node = candidate
            
            # Look for field_declaration_list in the struct/union
            for child in struct_node.children:
                if child.type == 'field_declaration_list':
                    return True
            return False
        
        # Sort candidates: full definitions first, then forward declarations
        candidates.sort(key=has_field_list, reverse=True)
        
        # Process candidates to find matching structure
        for candidate in candidates:
            if isinstance(candidate, tuple):
                # Typedef case
                typedef_node, struct_node = candidate
                result = self._process_typedef_candidate(typedef_node, struct_node, structure_name, verbose)
            else:
                # Direct struct/union case
                result = self._process_struct_candidate(candidate, structure_name, verbose)
            
            if result and result.found:
                if verbose:
                    print(f"   ✅ Found {structure_name}")
                return result
        
        if verbose:
            print(f"   ❌ Structure {structure_name} not found")
        
        return StructureInfo(
            name=structure_name,
            found=False,
            error=f"Structure '{structure_name}' not found"
        )
    
    def _process_typedef_candidate(self, typedef_node: Node, struct_node: Node, 
                                 target_name: str, verbose: bool = False) -> Optional[StructureInfo]:
        """Process a typedef struct/union candidate"""
        # Get typedef name
        typedef_name = None
        for child in typedef_node.children:
            if child.type == 'type_identifier':
                typedef_name = self._get_node_text(child)
                break
        
        if not typedef_name or not self._name_matches(typedef_name, target_name):
            return None
        
        if verbose:
            print(f"      Checking typedef: {typedef_name}")
        
        return self._extract_structure_info(struct_node, typedef_name)
    
    def _process_struct_candidate(self, struct_node: Node, target_name: str, 
                                verbose: bool = False) -> Optional[StructureInfo]:
        """Process a direct struct/union candidate"""
        # Get struct/union name
        struct_name = None
        for child in struct_node.children:
            if child.type == 'type_identifier':
                struct_name = self._get_node_text(child)
                break
        
        if not struct_name or not self._name_matches(struct_name, target_name):
            return None
        
        if verbose:
            print(f"      Checking {struct_node.type}: {struct_name}")
        
        return self._extract_structure_info(struct_node, struct_name)
    
    def _name_matches(self, actual_name: str, target_name: str) -> bool:
        """Check if structure names match (flexible matching)"""
        if not actual_name or not target_name:
            return False
        
        # Exact match
        if actual_name == target_name:
            return True
        
        # Remove leading underscores and compare
        clean_actual = actual_name.lstrip('_')
        clean_target = target_name.lstrip('_')
        
        if clean_actual == clean_target:
            return True
        
        # Add underscore prefix and compare
        if f"_{clean_actual}" == target_name or actual_name == f"_{clean_target}":
            return True
        
        return False
    
    def _extract_structure_info(self, node: Node, struct_name: str) -> StructureInfo:
        """Extract comprehensive information from a struct/union node"""
        is_union = node.type == 'union_specifier'
        
        # Get source code
        source_code = self._get_node_text(node)
        
        # Get line numbers
        start_line = self._get_line_number(node.start_byte)
        end_line = self._get_line_number(node.end_byte)
        
        # Find field list
        field_list = None
        for child in node.children:
            if child.type == 'field_declaration_list':
                field_list = child
                break
        
        fields = []
        if field_list:
            fields = self._extract_fields(field_list)
        
        # Analyze field statistics
        primitive_count = sum(1 for f in fields if f.is_primitive)
        nested_count = sum(1 for f in fields if f.field_type == FieldType.STRUCT)
        union_count = sum(1 for f in fields if f.field_type == FieldType.UNION)
        
        return StructureInfo(
            name=struct_name,
            found=True,
            is_union=is_union,
            fields=fields,
            field_count=len(fields),
            primitive_count=primitive_count,
            nested_count=nested_count,
            union_count=union_count,
            start_line=start_line,
            end_line=end_line,
            start_byte=node.start_byte,
            end_byte=node.end_byte,
            definition=source_code
        )
    
    def _extract_fields(self, field_list: Node) -> List[FieldInfo]:
        """Extract field information from field declaration list"""
        fields = []
        
        for child in field_list.children:
            if child.type == 'field_declaration':
                field_infos = self._parse_field_declaration(child)
                fields.extend(field_infos)
        
        return fields
    
    def _parse_field_declaration(self, field_node: Node) -> List[FieldInfo]:
        """Parse a field declaration (may contain multiple fields)"""
        fields = []
        declaration_text = self._get_node_text(field_node)
        
        # Find type and declarators
        type_info = self._extract_type_info(field_node)
        declarators = self._extract_declarators(field_node)
        
        # Create field info for each declarator
        for declarator in declarators:
            field_type = self._determine_field_type(type_info, declarator)
            is_primitive = self._is_field_primitive(type_info, declarator)
            type_name = self._build_type_name(type_info, declarator)
            
            # Get resolved type through typedef chain
            resolved_type = self.primitive_manager.resolve_type(type_name)
            
            field_info = FieldInfo(
                name=declarator['name'],
                type_name=type_name,
                field_type=field_type,
                is_primitive=is_primitive,
                array_size=declarator.get('array_size'),
                pointer_depth=declarator.get('pointer_depth', 0),
                bit_field_size=declarator.get('bit_field_size'),
                declaration=declaration_text.strip(),
                resolved_type=resolved_type
            )
            
            fields.append(field_info)
        
        return fields
    
    def _extract_type_info(self, field_node: Node) -> Dict[str, Any]:
        """Extract type information from field declaration"""
        type_info = {
            'base_type': '',
            'is_struct': False,
            'is_union': False,
            'is_enum': False,
            'modifiers': []
        }
        
        for child in field_node.children:
            if child.type == 'primitive_type':
                type_info['base_type'] = self._get_node_text(child)
            elif child.type == 'type_identifier':
                type_info['base_type'] = self._get_node_text(child)
            elif child.type == 'struct_specifier':
                type_info['is_struct'] = True
                # Try to get struct name
                for subchild in child.children:
                    if subchild.type == 'type_identifier':
                        type_info['base_type'] = self._get_node_text(subchild)
                        break
                else:
                    type_info['base_type'] = 'anonymous_struct'
            elif child.type == 'union_specifier':
                type_info['is_union'] = True
                # Try to get union name
                for subchild in child.children:
                    if subchild.type == 'type_identifier':
                        type_info['base_type'] = self._get_node_text(subchild)
                        break
                else:
                    type_info['base_type'] = 'anonymous_union'
            elif child.type == 'enum_specifier':
                type_info['is_enum'] = True
                type_info['base_type'] = 'enum'
            elif child.type in ['const', 'volatile', 'restrict']:
                type_info['modifiers'].append(child.type)
        
        return type_info
    
    def _extract_declarators(self, field_node: Node) -> List[Dict[str, Any]]:
        """Extract declarator information (field names, arrays, pointers, etc.)"""
        declarators = []
        
        for child in field_node.children:
            if child.type == 'field_identifier':
                declarators.append({
                    'name': self._get_node_text(child),
                    'pointer_depth': 0,
                    'array_size': None,
                    'bit_field_size': None
                })
            elif child.type == 'pointer_declarator':
                decl_info = self._parse_pointer_declarator(child)
                if decl_info:
                    declarators.append(decl_info)
            elif child.type == 'array_declarator':
                decl_info = self._parse_array_declarator(child)
                if decl_info:
                    declarators.append(decl_info)
            elif child.type == 'bitfield_clause':
                # Handle bit fields (attach to previous declarator)
                if declarators:
                    size_text = self._get_node_text(child)
                    # Extract number from bit field size
                    size_match = re.search(r':\s*(\d+)', size_text)
                    if size_match:
                        declarators[-1]['bit_field_size'] = int(size_match.group(1))
        
        return declarators
    
    def _parse_pointer_declarator(self, pointer_node: Node) -> Optional[Dict[str, Any]]:
        """Parse pointer declarator"""
        pointer_depth = 0
        name = None
        
        # Count pointer depth
        current = pointer_node
        while current and current.type == 'pointer_declarator':
            pointer_depth += 1
            # Find the next level
            for child in current.children:
                if child.type in ['field_identifier', 'pointer_declarator', 'array_declarator']:
                    if child.type == 'field_identifier':
                        name = self._get_node_text(child)
                        current = None
                        break
                    else:
                        current = child
                        break
            else:
                break
        
        if name:
            return {
                'name': name,
                'pointer_depth': pointer_depth,
                'array_size': None,
                'bit_field_size': None
            }
        
        return None
    
    def _parse_array_declarator(self, array_node: Node) -> Optional[Dict[str, Any]]:
        """Parse array declarator"""
        name = None
        array_size = None
        
        for child in array_node.children:
            if child.type == 'field_identifier':
                name = self._get_node_text(child)
            elif child.type == 'number_literal':
                try:
                    array_size = int(self._get_node_text(child))
                except ValueError:
                    array_size = None
        
        if name:
            return {
                'name': name,
                'pointer_depth': 0,
                'array_size': array_size,
                'bit_field_size': None
            }
        
        return None
    
    def _determine_field_type(self, type_info: Dict[str, Any], declarator: Dict[str, Any]) -> FieldType:
        """Determine the field type based on type info and declarator"""
        if declarator['pointer_depth'] > 0:
            return FieldType.POINTER
        
        if declarator['array_size'] is not None:
            return FieldType.ARRAY
        
        if type_info['is_struct']:
            return FieldType.STRUCT
        
        if type_info['is_union']:
            return FieldType.UNION
        
        if type_info['is_enum']:
            return FieldType.ENUM
        
        base_type = type_info['base_type']
        if self.primitive_manager.is_primitive(base_type):
            return FieldType.PRIMITIVE
        
        # Check if it looks like a function pointer
        if 'function' in base_type.lower() or '(' in base_type:
            return FieldType.FUNCTION_POINTER
        
        # Default to unknown for complex types
        return FieldType.UNKNOWN
    
    def _is_field_primitive(self, type_info: Dict[str, Any], declarator: Dict[str, Any]) -> bool:
        """Check if field is primitive"""
        # Pointers and arrays of primitives are not considered primitive
        if declarator['pointer_depth'] > 0 or declarator['array_size'] is not None:
            return False
        
        # Struct/union/enum are not primitive
        if type_info['is_struct'] or type_info['is_union'] or type_info['is_enum']:
            return False
        
        return self.primitive_manager.is_primitive(type_info['base_type'])
    
    def _build_type_name(self, type_info: Dict[str, Any], declarator: Dict[str, Any]) -> str:
        """Build complete type name including modifiers, pointers, arrays"""
        parts = []
        
        # Add modifiers
        if type_info['modifiers']:
            parts.extend(type_info['modifiers'])
        
        # Add struct/union/enum keyword if applicable
        if type_info['is_struct']:
            parts.append('struct')
        elif type_info['is_union']:
            parts.append('union')
        elif type_info['is_enum']:
            parts.append('enum')
        
        # Add base type
        parts.append(type_info['base_type'])
        
        # Build type string
        type_str = ' '.join(parts)
        
        # Add pointer indicators
        if declarator['pointer_depth'] > 0:
            type_str += '*' * declarator['pointer_depth']
        
        # Add array indicators
        if declarator['array_size'] is not None:
            type_str += f"[{declarator['array_size']}]"
        
        return type_str
    
    def _get_node_text(self, node: Node) -> str:
        """Get text content of a node"""
        return self.source_bytes[node.start_byte:node.end_byte].decode('utf8')
    
    def _get_line_number(self, byte_offset: int) -> int:
        """Get line number for a byte offset"""
        return self.source_bytes[:byte_offset].count(b'\n') + 1
    
    def list_all_structures(self, max_results: int = 10000) -> List[str]:
        """List all structure and union names in the file"""
        structures = set()
        
        def traverse_node(node):
            if max_results > 0 and len(structures) >= max_results:
                return
            
            if node.type in ['struct_specifier', 'union_specifier']:
                # Look for named structures
                for child in node.children:
                    if child.type == 'type_identifier':
                        name = self._get_node_text(child)
                        if name:
                            structures.add(name)
                        break
            
            elif node.type == 'type_definition':
                # Look for typedef structures
                typedef_name = None
                has_struct_union = False
                
                for child in node.children:
                    if child.type == 'type_identifier':
                        typedef_name = self._get_node_text(child)
                    elif child.type in ['struct_specifier', 'union_specifier']:
                        has_struct_union = True
                
                if typedef_name and has_struct_union:
                    structures.add(typedef_name)
            
            # Recursively traverse children
            for child in node.children:
                if max_results > 0 and len(structures) >= max_results:
                    break
                traverse_node(child)
        
        traverse_node(self.ast_root)
        return sorted(list(structures))
    
    def get_all_structure_names(self) -> List[str]:
        """Get all structure and union names without any limit"""
        structures = set()
        
        def traverse_node(node):
            if node.type in ['struct_specifier', 'union_specifier']:
                # Look for named structures
                for child in node.children:
                    if child.type == 'type_identifier':
                        name = self._get_node_text(child)
                        if name:
                            structures.add(name)
                        break
            
            elif node.type == 'type_definition':
                # Look for typedef structures
                typedef_name = None
                has_struct_union = False
                
                for child in node.children:
                    if child.type == 'type_identifier':
                        typedef_name = self._get_node_text(child)
                    elif child.type in ['struct_specifier', 'union_specifier']:
                        has_struct_union = True
                
                if typedef_name and has_struct_union:
                    structures.add(typedef_name)
            
            # Recursively traverse children
            for child in node.children:
                traverse_node(child)
        
        traverse_node(self.ast_root)
        return sorted(list(structures))
    
    def get_file_statistics(self) -> Dict[str, Any]:
        """Get file parsing statistics"""
        structures = self.list_all_structures(1000)  # Get more for stats
        
        struct_count = 0
        union_count = 0
        typedef_count = 0
        
        # This is a simplified count - full implementation would traverse AST more carefully
        content_lower = self.file_content.lower()
        struct_count = content_lower.count('struct ')
        union_count = content_lower.count('union ')
        typedef_count = content_lower.count('typedef ')
        
        return {
            'file_path': self.file_path,
            'file_size_bytes': len(self.source_bytes),
            'file_size_lines': self.file_content.count('\n') + 1,
            'named_structures': len(structures),
            'estimated_structs': struct_count,
            'estimated_unions': union_count,
            'estimated_typedefs': typedef_count,
            'ast_node_count': self._count_ast_nodes()
        }
    
    def _count_ast_nodes(self) -> int:
        """Count total AST nodes"""
        count = 0
        
        def traverse(node: Node):
            nonlocal count
            count += 1
            for child in node.children:
                traverse(child)
        
        traverse(self.ast_root)
        return count
    
    def parse_file(self, file_path: str):
        """Parse a C file and return the tree"""
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"File not found: {file_path}")
        
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        return self.parse_string(content)
    
    def parse_string(self, content: str):
        """Parse C content string and return the tree"""
        source_bytes = content.encode('utf8')
        tree = self.parser.parse(source_bytes)
        
        # Update internal state if this is the primary parse
        if not self.file_path:
            self.file_content = content
            self.source_bytes = source_bytes
            self.ast_root = tree.root_node
        
        return tree

    def parse(self, content: str):
        """Parse C content string and return the tree (alias for parse_string)"""
        return self.parse_string(content)
    
    def find_structures_original(self) -> List[StructureInfo]:
        """Find all structures in the parsed content"""
        structures = []
        if not self.ast_root:
            return structures
        
        def traverse(node: Node):
            if node.type in ['struct_specifier', 'union_specifier']:
                struct_info = self._extract_structure_from_node(node)
                if struct_info and struct_info.found:
                    structures.append(struct_info)
            
            for child in node.children:
                traverse(child)
        
        traverse(self.ast_root)
        return structures
    
    def find_structure_by_name(self, name: str) -> Optional[StructureInfo]:
        """Find a specific structure by name"""
        return self.find_structure(name)
    
    def find_typedefs(self) -> Dict[str, str]:
        """Find all typedef declarations (alias for extract_typedefs)"""
        return self.extract_typedefs()
    
    def extract_fields(self, struct_node) -> List[Dict]:
        """Extract field information from a structure node"""
        if not struct_node or not hasattr(struct_node, 'children'):
            return []
            
        fields = []
        
        # Find field_declaration_list
        field_list = None
        for child in struct_node.children:
            if child.type == 'field_declaration_list':
                field_list = child
                break
        
        if not field_list:
            return fields
        
        # Process each field declaration
        for field_decl in field_list.children:
            if field_decl.type == 'field_declaration':
                field_info_list = self._extract_field_from_declaration(field_decl)
                if field_info_list:
                    # field_info_list is a list of dictionaries, extend to flatten
                    fields.extend(field_info_list)
        
        return fields

    def _extract_structure_from_node(self, struct_node: Node) -> Optional[StructureInfo]:
        """Extract structure information from a struct/union node"""
        # Get structure name
        struct_name = None
        for child in struct_node.children:
            if child.type == 'type_identifier':
                struct_name = self._get_node_text(child)
                break
        
        if not struct_name:
            return None
        
        # Extract fields
        fields = self.extract_fields(struct_node)
        
        # Determine if it's a union
        is_union = struct_node.type == 'union_specifier'
        
        # Get line information
        start_line = struct_node.start_point[0] + 1
        end_line = struct_node.end_point[0] + 1
        
        return StructureInfo(
            name=struct_name,
            found=True,
            is_union=is_union,
            fields=fields,
            field_count=len(fields),
            start_line=start_line,
            end_line=end_line
        )
