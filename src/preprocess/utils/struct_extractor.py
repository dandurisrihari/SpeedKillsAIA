#!/usr/bin/env python3
"""Structure definition extractor using tree-sitter C parser.

Goal: From preprocessed .i (or .c/.h) files extract only top-level struct/union declarations
(including nested anonymous struct/union blocks contained inside a named struct) and return
as serializable data for embedding into JSON outputs.

We restrict to forms like:
    struct name { ... };
    union name { ... };
Anonymous structs/unions directly inside another struct are preserved as raw code text within
that parent; we don't emit separate entries for anonymous types lacking a tag.

If tree-sitter is unavailable, falls back to a simple regex heuristic (best effort).
"""
from __future__ import annotations
import re
from dataclasses import dataclass, asdict
from pathlib import Path
from typing import List, Optional, Dict, Any

try:
    import tree_sitter_c as tsc
    import tree_sitter as ts
    TREE_SITTER_AVAILABLE = True
except ImportError:
    TREE_SITTER_AVAILABLE = False
    tsc = None
    ts = None

@dataclass
class StructField:
    text: str  # raw field declaration text

@dataclass
class StructDefinition:
    kind: str  # 'struct' or 'union'
    name: str  # tag name
    code: str  # full text of the definition including braces & semicolon
    fields: List[StructField]
    file: str
    start_line: int
    end_line: int

    def to_dict(self) -> Dict[str, Any]:
        d = asdict(self)
        d['fields'] = [f.text for f in self.fields]
        return d

class StructExtractor:
    def __init__(self):
        if TREE_SITTER_AVAILABLE:
            self.language = ts.Language(tsc.language())
            self.parser = ts.Parser(self.language)
        else:
            self.language = None
            self.parser = None

    def extract_from_file(self, path: str | Path) -> List[StructDefinition]:
        path = Path(path)
        if not path.exists():
            return []
        try:
            content = path.read_text(encoding='utf-8', errors='ignore')
        except Exception:
            return []
        if TREE_SITTER_AVAILABLE:
            return self._extract_tree_sitter(content, path)
        return self._extract_regex(content, path)

    # ---------------- Tree-sitter path -----------------
    def _extract_tree_sitter(self, content: str, path: Path) -> List[StructDefinition]:
        tree = self.parser.parse(content.encode('utf-8'))
        root = tree.root_node
        bytes_src = content.encode('utf-8')
        results: List[StructDefinition] = []
        
        for child in root.children:
            # Handle typedef struct patterns
            if child.type == 'type_definition':
                # Check if this is a typedef struct
                struct_def = self._extract_typedef_struct(child, bytes_src, path)
                if struct_def:
                    results.append(struct_def)
            
            # Handle bare struct/union declarations
            elif child.type in ['struct_specifier', 'union_specifier']:
                struct_def = self._extract_bare_struct(child, bytes_src, path)
                if struct_def:
                    results.append(struct_def)
                    
            # Handle declarations that might contain struct definitions
            elif child.type == 'declaration':
                struct_def = self._extract_from_declaration(child, bytes_src, path)
                if struct_def:
                    results.append(struct_def)
                    
        return results
    
    def _extract_typedef_struct(self, node, bytes_src: bytes, path: Path) -> Optional[StructDefinition]:
        """Extract typedef struct definitions"""
        # Look for pattern: typedef struct _name { ... } name;
        struct_specifier = None
        typedef_name = None
        
        for child in node.children:
            if child.type in ['struct_specifier', 'union_specifier']:
                struct_specifier = child
            elif child.type == 'type_identifier':
                # This is the typedef name
                typedef_name = bytes_src[child.start_byte:child.end_byte].decode('utf-8', errors='ignore')
        
        if struct_specifier and typedef_name:
            # Get the full typedef declaration
            code = bytes_src[node.start_byte:node.end_byte].decode('utf-8', errors='ignore')
            fields = self._collect_fields(struct_specifier, bytes_src)
            
            return StructDefinition(
                kind='struct' if struct_specifier.type == 'struct_specifier' else 'union',
                name=typedef_name,  # Use typedef name as the primary name
                code=code,
                fields=[StructField(text=f) for f in fields],
                file=str(path),
                start_line=node.start_point[0] + 1,
                end_line=node.end_point[0] + 1,
            )
        return None
    
    def _extract_bare_struct(self, node, bytes_src: bytes, path: Path) -> Optional[StructDefinition]:
        """Extract bare struct/union definitions"""
        name = self._get_tag_name(node, bytes_src)
        if not name:
            return None
            
        code = bytes_src[node.start_byte:node.end_byte].decode('utf-8', errors='ignore')
        fields = self._collect_fields(node, bytes_src)
        
        return StructDefinition(
            kind='struct' if node.type == 'struct_specifier' else 'union',
            name=name,
            code=code,
            fields=[StructField(text=f) for f in fields],
            file=str(path),
            start_line=node.start_point[0] + 1,
            end_line=node.end_point[0] + 1,
        )
    
    def _extract_from_declaration(self, node, bytes_src: bytes, path: Path) -> Optional[StructDefinition]:
        """Extract struct definitions from declarations"""
        for child in node.children:
            if child.type in ['struct_specifier', 'union_specifier']:
                return self._extract_bare_struct(child, bytes_src, path)
        return None

    def _get_tag_name(self, node, bytes_src: bytes) -> Optional[str]:
        # struct_specifier: 'struct' identifier? field_declaration_list?
        for c in node.children:
            if c.type == 'type_identifier' or c.type == 'identifier':
                return bytes_src[c.start_byte:c.end_byte].decode('utf-8', errors='ignore')
        return None

    def _collect_fields(self, spec_node, bytes_src: bytes) -> List[str]:
        fields: List[str] = []
        for c in spec_node.children:
            if c.type == 'field_declaration_list':
                for fd in c.children:
                    if fd.type == 'field_declaration':
                        text = bytes_src[fd.start_byte:fd.end_byte].decode('utf-8', errors='ignore').strip()
                        fields.append(text)
        return fields

    # ---------------- Fallback regex path -----------------
    # More robust regex that handles nested braces properly
    def _extract_regex(self, content: str, path: Path) -> List[StructDefinition]:
        results: List[StructDefinition] = []
        
        # Pattern 1: typedef struct patterns
        typedef_pattern = r'typedef\s+(struct|union)\s+([A-Za-z_][A-Za-z0-9_]*)\s*\{'
        for match in re.finditer(typedef_pattern, content):
            result = self._extract_single_struct_regex(content, match, path, is_typedef=True)
            if result:
                results.append(result)
        
        # Pattern 2: bare struct/union declarations  
        bare_pattern = r'\b(struct|union)\s+([A-Za-z_][A-Za-z0-9_]*)\s*\{'
        for match in re.finditer(bare_pattern, content):
            # Skip if this is part of a typedef (already handled above)
            preceding_text = content[max(0, match.start()-20):match.start()]
            if 'typedef' in preceding_text:
                continue
                
            result = self._extract_single_struct_regex(content, match, path, is_typedef=False)
            if result:
                results.append(result)
                
        return results
    
    def _extract_single_struct_regex(self, content: str, match, path: Path, is_typedef: bool) -> Optional[StructDefinition]:
        """Extract a single struct using regex with balanced brace matching"""
        kind, tag_name = match.group(1), match.group(2)
        start_pos = match.start()
        
        # If typedef, we need to find the typedef name at the end
        if is_typedef:
            # Find the typedef declaration start
            typedef_start = content.rfind('typedef', 0, start_pos)
            if typedef_start != -1:
                start_pos = typedef_start
        
        brace_start = match.end() - 1  # Position of opening brace
        
        # Find matching closing brace
        brace_count = 1
        pos = brace_start + 1
        while pos < len(content) and brace_count > 0:
            if content[pos] == '{':
                brace_count += 1
            elif content[pos] == '}':
                brace_count -= 1
            pos += 1
        
        if brace_count == 0:
            # Find the end of the declaration (semicolon or typedef name)
            end_pos = pos
            if is_typedef:
                # Look for typedef name after closing brace
                remaining = content[pos:pos+200]  # Look ahead 200 chars
                typedef_end_match = re.match(r'\s*([A-Za-z_][A-Za-z0-9_]*)\s*;', remaining)
                if typedef_end_match:
                    typedef_name = typedef_end_match.group(1)
                    end_pos = pos + typedef_end_match.end()
                    name = typedef_name  # Use typedef name
                else:
                    name = tag_name  # Fallback to tag name
            else:
                # Look for semicolon
                while end_pos < len(content) and content[end_pos] in ' \t\n\r':
                    end_pos += 1
                if end_pos < len(content) and content[end_pos] == ';':
                    end_pos += 1
                name = tag_name
            
            # Extract the full declaration
            declaration = content[start_pos:end_pos]
            
            # Calculate line numbers
            pre_content = content[:start_pos]
            start_line = pre_content.count('\n') + 1
            end_line = start_line + declaration.count('\n')
            
            # Extract fields (simple approach)
            body_start = declaration.find('{') + 1
            body_end = declaration.rfind('}')
            body_content = declaration[body_start:body_end].strip()
            
            fields = []
            if body_content:
                # Split by semicolon, but be careful with nested structures
                field_parts = []
                current_field = ""
                brace_depth = 0
                
                for char in body_content:
                    if char == '{':
                        brace_depth += 1
                    elif char == '}':
                        brace_depth -= 1
                    elif char == ';' and brace_depth == 0:
                        field_parts.append(current_field.strip())
                        current_field = ""
                        continue
                    current_field += char
                
                if current_field.strip():
                    field_parts.append(current_field.strip())
                
                for field in field_parts:
                    if field and not field.startswith('#'):  # Skip preprocessor directives
                        fields.append(StructField(text=field + ';'))
            
            return StructDefinition(
                kind=kind,
                name=name, 
                code=declaration,
                fields=fields,
                file=str(path),
                start_line=start_line,
                end_line=end_line
            )
        
        return None

# Convenience function for bulk extraction

def extract_structs(paths: List[str | Path]) -> List[Dict[str, Any]]:
    extractor = StructExtractor()
    all_defs: List[Dict[str, Any]] = []
    for p in paths:
        for sd in extractor.extract_from_file(p):
            all_defs.append(sd.to_dict())
    return all_defs

def extract_structs_by_file(paths: List[str | Path]) -> List[Dict[str, Any]]:
    """
    Extract struct definitions grouped by file.
    
    Returns format:
    [
        {
            "file": "path/to/file.i",
            "all_struct_definitions": "combined struct code"
        },
        ...
    ]
    """
    extractor = StructExtractor()
    result = []
    
    for path in paths:
        file_path = str(Path(path).resolve())
        structs = extractor.extract_from_file(path)
        
        if structs:
            # Combine all struct definitions into one string
            all_struct_code = ""
            for struct in structs:
                all_struct_code += f"{struct.code}\n\n"
            
            result.append({
                "file": file_path,
                "all_struct_definitions": all_struct_code.strip()
            })
    
    return result

if __name__ == '__main__':
    import sys, json
    files = sys.argv[1:]
    
    # Check if --by-file flag is provided
    if '--by-file' in files:
        files.remove('--by-file')
        data = extract_structs_by_file(files)
    else:
        data = extract_structs(files)
    
    print(json.dumps(data, indent=2))
