#!/usr/bin/env python3
"""
Struct Context Provider - Provides struct definitions from precompiled JSON files
"""

import json
import os
import re
from pathlib import Path
from typing import Dict, List, Optional, Set, Any
import logging

logger = logging.getLogger(__name__)

class StructContextProvider:
    """Provides struct definitions from precompiled JSON files for function analysis"""
    
    def __init__(self, struct_json_path: str = None):
        """Initialize the struct context provider.
        
        Args:
            struct_json_path: Optional custom path to struct definitions JSON file.
                             If None, will check for existing files in data/
        """
        if struct_json_path:
            self.struct_json_path = struct_json_path
        else:
            # Default search locations for struct JSON files
            search_paths = [
                Path("data/coral_structs.json"),
                Path("data/nxp_structs.json"), 
                Path("data/ti_structs.json"),
                Path("data/structs.json"),  # Fallback generic name
                # Also check for new format files
                Path("test_structs_new_format.json")
            ]
            
            self.struct_json_path = None
            for path in search_paths:
                if path.exists():
                    self.struct_json_path = path
                    break
            
            if not self.struct_json_path:
                logger.warning("No struct JSON file found in data/ directory")
        
        self._struct_data_by_file = None
        self._load_struct_definitions_by_file()

    def _load_struct_definitions_by_file(self):
        """Load struct definitions organized by file"""
        if not self.struct_json_path or not Path(self.struct_json_path).exists():
            logger.error(f"Struct JSON file not found: {self.struct_json_path}")
            self._struct_data_by_file = {}
            return
        
        try:
            with open(self.struct_json_path, 'r', encoding='utf-8') as f:
                data = json.load(f)
            
            # Check if this is the new file-based format
            if 'struct_definitions' in data and isinstance(data['struct_definitions'], list):
                # New format: list of file entries with all_struct_definitions
                self._struct_data_by_file = {}
                for entry in data['struct_definitions']:
                    file_path = entry.get('file', '')
                    all_struct_definitions = entry.get('all_struct_definitions', '')
                    if file_path and all_struct_definitions:
                        self._struct_data_by_file[file_path] = all_struct_definitions
                
                logger.info(f"Loaded struct definitions for {len(self._struct_data_by_file)} files from {self.struct_json_path}")
            
            else:
                # Legacy format or other format - convert to file-based format
                logger.warning(f"Unknown struct JSON format in {self.struct_json_path}")
                self._struct_data_by_file = {}
                
        except Exception as e:
            logger.error(f"Error loading struct definitions from {self.struct_json_path}: {e}")
            self._struct_data_by_file = {}

    def get_all_structs_for_file(self, file_path: str) -> Dict[str, Any]:
        """Get ALL struct definitions for a .c file from its corresponding .i file
        
        Args:
            file_path: Path to .c file
            
        Returns:
            Dict with file path and struct definitions, or empty dict if not found
        """
        if not self._struct_data_by_file:
            return {}
        
        # Find corresponding .i file
        i_file_path = self._find_corresponding_i_file(file_path)
        if not i_file_path:
            logger.debug(f"No corresponding .i file found for {file_path}")
            return {}
        
        # Get struct definitions for this .i file
        struct_definitions = self._struct_data_by_file.get(i_file_path, '')
        if not struct_definitions:
            logger.debug(f"No struct definitions found for {i_file_path}")
            return {}
        
        logger.info(f"Found struct definitions for {file_path} from {Path(i_file_path).name}")
        
        return {
            "file": i_file_path,
            "all_struct_definitions": struct_definitions
        }

    def _find_corresponding_i_file(self, file_path: str) -> Optional[str]:
        """Find the corresponding .i file for a .c file"""
        if not file_path:
            return None
        
        # Extract base name without extension
        c_file_base = Path(file_path).stem
        
        # Look through all available .i files
        for i_file_path in self._struct_data_by_file.keys():
            i_file_base = Path(i_file_path).stem
            
            # Check if base names match
            if c_file_base == i_file_base:
                return i_file_path
        
        # No exact match found
        return None

    def _extract_relevant_structs(self, function_code: str, all_structs: str) -> str:
        """Extract only struct definitions that are referenced in the function code
        
        Args:
            function_code: The function source code to analyze
            all_structs: All available struct definitions from .i file
            
        Returns:
            String containing only relevant struct definitions
        """
        if not function_code or not all_structs:
            return ""
        
        # Step 1: Find all struct/type references in the function code
        struct_references = self._find_struct_references(function_code)
        
        if not struct_references:
            return ""
        
        logger.debug(f"Found struct references: {struct_references}")
        
        # Step 2: Extract definitions for referenced structs
        relevant_structs = []
        processed_structs = set()  # Avoid duplicates
        
        # Parse all struct definitions from the .i file
        struct_definitions = self._parse_struct_definitions(all_structs)
        
        # Step 3: Recursively collect related structs
        for struct_name in struct_references:
            self._collect_related_structs(struct_name, struct_definitions, 
                                        relevant_structs, processed_structs)
        
        if not relevant_structs:
            return ""
        
        # Step 4: Format the relevant structs
        result = []
        result.append("/* Relevant struct definitions for this function */")
        result.extend(relevant_structs)
        result.append("/* End of relevant struct definitions */")
        
        return "\n\n".join(result)
    
    def _find_struct_references(self, function_code: str) -> Set[str]:
        """Find all struct and type references in function code
        
        Returns:
            Set of struct/type names referenced in the code
        """
        references = set()
        
        # Pattern 1: struct struct_name usage (e.g., "struct my_struct *ptr")
        struct_pattern = r'\bstruct\s+([a-zA-Z_][a-zA-Z0-9_]*)\b'
        for match in re.finditer(struct_pattern, function_code):
            references.add(match.group(1))
        
        # Pattern 2: typedef names (e.g., "my_struct_t *ptr")
        # Look for common patterns that indicate type usage
        typedef_patterns = [
            r'\b([a-zA-Z_][a-zA-Z0-9_]*_t)\s*[\*\s]',  # Common _t suffix
            r'\b([A-Z][A-Z0-9_]*)\s*[\*\s]',           # ALL_CAPS types
            r'sizeof\s*\(\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*\)',  # sizeof usage
            r'->([a-zA-Z_][a-zA-Z0-9_]*)',              # Member access
            r'\.([a-zA-Z_][a-zA-Z0-9_]*)',              # Direct member access
        ]
        
        for pattern in typedef_patterns:
            for match in re.finditer(pattern, function_code):
                references.add(match.group(1))
        
        # Pattern 3: Function parameters and local variables with type hints
        # Look for variable declarations that might use custom types
        var_decl_pattern = r'\b([a-zA-Z_][a-zA-Z0-9_]*)\s+[a-zA-Z_][a-zA-Z0-9_]*\s*[;\[\=\)]'
        for match in re.finditer(var_decl_pattern, function_code):
            type_name = match.group(1)
            # Filter out common C keywords
            if type_name not in {'int', 'char', 'void', 'long', 'short', 'float', 'double', 
                               'unsigned', 'signed', 'const', 'static', 'volatile', 'register',
                               'auto', 'extern', 'inline', 'return', 'if', 'else', 'for', 
                               'while', 'do', 'switch', 'case', 'break', 'continue', 'goto'}:
                references.add(type_name)
        
        # Clean up references - remove very short or obviously wrong ones
        references = {ref for ref in references if len(ref) > 2 and not ref.isdigit()}
        
        return references
    
    def _parse_struct_definitions(self, all_structs: str) -> Dict[str, str]:
        """Parse struct definitions from the .i file content
        
        Returns:
            Dict mapping struct names to their full definitions
        """
        struct_definitions = {}
        
        # Enhanced patterns to match various struct and typedef formats
        patterns = [
            # Pattern 1: typedef struct name { ... } typedef_name;
            r'(typedef\s+struct\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*;)',
            
            # Pattern 2: typedef struct { ... } name;
            r'(typedef\s+struct\s*\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*;)',
            
            # Pattern 3: struct name { ... };
            r'(struct\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}\s*;)',
            
            # Pattern 4: typedef enum { ... } name;
            r'(typedef\s+enum\s*\{[^{}]*\}\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*;)',
            
            # Pattern 5: typedef existing_type new_type;
            r'(typedef\s+([a-zA-Z_][a-zA-Z0-9_*\s]+)\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*;)',
            
            # Pattern 6: union definitions
            r'(typedef\s+union\s*\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*;)',
            
            # Pattern 7: simple struct forward declaration context  
            r'(struct\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}[^;]*;)',
            
            # Pattern 8: struct definitions with underscore (GPU pattern)
            r'(struct\s+(_{1,2}[a-zA-Z_][a-zA-Z0-9_]*)\s*\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\})',
        ]
        
        for pattern_idx, pattern in enumerate(patterns, 1):
            matches = re.finditer(pattern, all_structs, re.DOTALL | re.MULTILINE)
            for match in matches:
                full_definition = match.group(1)
                
                # Extract the type name(s) based on the pattern
                if pattern_idx in [1]:  # typedef struct name { ... } typedef_name;
                    if len(match.groups()) >= 3:
                        struct_name = match.group(2)
                        typedef_name = match.group(3)
                        struct_definitions[struct_name] = full_definition
                        struct_definitions[typedef_name] = full_definition
                        
                elif pattern_idx in [2, 4, 6]:  # typedef struct/enum/union { ... } name;
                    if len(match.groups()) >= 2:
                        typedef_name = match.group(2)
                        struct_definitions[typedef_name] = full_definition
                        
                elif pattern_idx in [3, 7, 8]:  # struct name { ... };
                    if len(match.groups()) >= 2:
                        struct_name = match.group(2)
                        struct_definitions[struct_name] = full_definition
                        
                        # For GPU structs with underscore prefix, also create mapping without underscore
                        if struct_name.startswith('_gck') or struct_name.startswith('_gce') or struct_name.startswith('_gcs'):
                            clean_name = struct_name[1:]  # Remove leading underscore
                            struct_definitions[clean_name] = full_definition
                        
                elif pattern_idx == 5:  # typedef existing_type new_type;
                    if len(match.groups()) >= 3:
                        # For simple typedefs, store a simple reference
                        existing_type = match.group(2).strip()
                        new_type = match.group(3)
                        
                        # Only store if it looks like a meaningful typedef
                        if not any(keyword in existing_type.lower() 
                                 for keyword in ['int', 'char', 'void', 'long', 'short', 'float', 'double']):
                            struct_definitions[new_type] = f"typedef {existing_type} {new_type};"
        
        # Add some common GPU types that might be simple pointer typedefs
        gpu_type_patterns = [
            r'(gck[A-Z_][A-Z0-9_]*)',
            r'(gce[A-Z_][A-Z0-9_]*)',
            r'(gcs[A-Z_][A-Z0-9_]*)',
            r'(gcv[A-Z_][A-Z0-9_]*)',
        ]
        
        # Look for simple pointer typedefs for GPU types
        for gpu_pattern in gpu_type_patterns:
            typedef_pattern = rf'typedef\s+[^;]*\*\s*({gpu_pattern[1:-1]})\s*;'
            matches = re.finditer(typedef_pattern, all_structs, re.IGNORECASE)
            for match in matches:
                gpu_type = match.group(1)
                full_match = match.group(0)
                if gpu_type not in struct_definitions:
                    struct_definitions[gpu_type] = full_match
        
        logger.debug(f"Parsed {len(struct_definitions)} struct definitions")
        if struct_definitions:
            logger.debug(f"Sample definitions: {list(struct_definitions.keys())[:10]}")
        
        return struct_definitions
    
    def _collect_related_structs(self, struct_name: str, struct_definitions: Dict[str, str],
                               relevant_structs: List[str], processed_structs: Set[str],
                               max_depth: int = 2, current_depth: int = 0):
        """Recursively collect struct definitions and their dependencies
        
        Args:
            struct_name: Name of struct to collect
            struct_definitions: All available struct definitions
            relevant_structs: List to append relevant struct definitions to
            processed_structs: Set of already processed struct names
            max_depth: Maximum recursion depth to prevent infinite loops
            current_depth: Current recursion depth
        """
        if (struct_name in processed_structs or current_depth > max_depth):
            return
        
        processed_structs.add(struct_name)
        
        # First, try to find exact match
        if struct_name in struct_definitions:
            struct_def = struct_definitions[struct_name]
            relevant_structs.append(struct_def)
            
            # Find nested struct references in this definition
            if current_depth < max_depth:
                nested_refs = self._find_struct_references(struct_def)
                for nested_ref in nested_refs:
                    if nested_ref != struct_name:  # Avoid self-reference
                        self._collect_related_structs(nested_ref, struct_definitions, 
                                                    relevant_structs, processed_structs,
                                                    max_depth, current_depth + 1)
            return
        
        # If no exact match, try variations for GPU types
        variations = []
        
        # For GPU types, try with underscore prefix (e.g., gckKERNEL -> _gckKERNEL)
        if struct_name.startswith(('gck', 'gce', 'gcs', 'gcv')):
            variations.append(f'_{struct_name}')
            variations.append(f'struct _{struct_name}')
        
        # Try with struct prefix
        variations.append(f'struct {struct_name}')
        
        # Try without _t suffix
        if struct_name.endswith('_t'):
            base_name = struct_name[:-2]
            variations.extend([base_name, f'struct {base_name}', f'_{base_name}'])
        
        # Try with _t suffix
        if not struct_name.endswith('_t'):
            variations.append(f'{struct_name}_t')
        
        for variation in variations:
            if variation in struct_definitions:
                struct_def = struct_definitions[variation]
                relevant_structs.append(struct_def)
                
                # Find nested references
                if current_depth < max_depth:
                    nested_refs = self._find_struct_references(struct_def)
                    for nested_ref in nested_refs:
                        if nested_ref != struct_name:
                            self._collect_related_structs(nested_ref, struct_definitions, 
                                                        relevant_structs, processed_structs,
                                                        max_depth, current_depth + 1)
                return
        
        # If still no match found, create a placeholder comment for GPU types
        if struct_name.startswith(('gck', 'gce', 'gcs', 'gcv')) and len(struct_name) > 5:
            placeholder = f"/* {struct_name} - GPU type (definition not available in current context) */"
            relevant_structs.append(placeholder)
            logger.debug(f"Added placeholder for GPU type: {struct_name}")
        else:
            logger.debug(f"No definition found for struct: {struct_name}")

    def get_relevant_structs_for_function(self, function_name: str, file_path: str, 
                                        function_code: str = "") -> Dict[str, Any]:
        """Get ONLY relevant struct definitions that are referenced in the function code
        
        This is the main method used by the LLM analyzer. It intelligently extracts
        only the structs that are actually used in the function to prevent context overflow.
        
        Args:
            function_name: Name of the function being analyzed
            file_path: Path to the source file
            function_code: The actual function source code to analyze
            
        Returns:
            Dict with relevant struct definitions (much smaller than get_all_structs_for_file)
        """
        # Get all available struct definitions
        all_struct_data = self.get_all_structs_for_file(file_path)
        if not all_struct_data or not function_code:
            return all_struct_data
        
        all_structs = all_struct_data.get("all_struct_definitions", "")
        if not all_structs:
            return all_struct_data
        
        # Extract relevant structs based on function code analysis
        relevant_structs = self._extract_relevant_structs(function_code, all_structs)
        
        if not relevant_structs:
            logger.info(f"No relevant structs found for function {function_name}, using limited context")
            # Return empty context to prevent overwhelming the LLM
            return {
                "file": all_struct_data.get("file", ""),
                "all_struct_definitions": "/* No directly referenced structs found */",
                "extraction_method": "smart_filtering",
                "original_size": len(all_structs),
                "filtered_size": 0
            }
        
        logger.info(f"Extracted {len(relevant_structs.split('struct '))-1} relevant structs for {function_name} "
                   f"(reduced from {len(all_structs)} to {len(relevant_structs)} chars)")
        
        return {
            "file": all_struct_data.get("file", ""),
            "all_struct_definitions": relevant_structs,
            "extraction_method": "smart_filtering",
            "original_size": len(all_structs),
            "filtered_size": len(relevant_structs)
        }

    def format_structs_for_llm(self, struct_data: Dict[str, Any]) -> str:
        """Format struct definitions for inclusion in LLM prompt"""
        if not struct_data:
            return ""
            
        file_path = struct_data.get("file", "")
        all_structs = struct_data.get("all_struct_definitions", "")
        extraction_method = struct_data.get("extraction_method", "")
        original_size = struct_data.get("original_size", 0)
        filtered_size = struct_data.get("filtered_size", 0)
        
        if not all_structs:
            return ""
        
        formatted = [
            "\n=== RELEVANT STRUCT DEFINITIONS ===",
            f"From file: {Path(file_path).name if file_path else 'Unknown'}"
        ]
        
        # Add smart filtering information if available
        if extraction_method == "smart_filtering":
            reduction_pct = ((original_size - filtered_size) / original_size * 100) if original_size > 0 else 0
            formatted.extend([
                f"Content: Smart-filtered struct definitions (reduced by {reduction_pct:.1f}%)",
                f"Original size: {original_size:,} chars → Filtered size: {filtered_size:,} chars",
                "Note: Only showing structs referenced in the function being analyzed"
            ])
        
        formatted.extend([
            "",
            all_structs.strip(),
            "",
            "=== END STRUCT DEFINITIONS ===\n"
        ])
            
        return "\n".join(formatted)

    def get_structs_summary(self, struct_data: Dict[str, Any]) -> Dict[str, Any]:
        """Get a summary of struct definitions for JSON response"""
        if not struct_data:
            return {"count": 0, "file": "", "has_definitions": False}
        
        file_path = struct_data.get("file", "")
        all_structs = struct_data.get("all_struct_definitions", "")
        extraction_method = struct_data.get("extraction_method", "")
        original_size = struct_data.get("original_size", 0)
        filtered_size = struct_data.get("filtered_size", 0)
        
        # Count struct definitions
        struct_count = 0
        if all_structs:
            # Count occurrences of "struct" keyword at beginning of definitions
            struct_count = len(re.findall(r'(?:^|\n)(?:typedef\s+)?struct\s+', all_structs, re.MULTILINE))
        
        summary = {
            "count": struct_count,
            "file": Path(file_path).name if file_path else "",
            "full_path": file_path,
            "has_definitions": bool(all_structs),
            "content_length": len(all_structs) if all_structs else 0
        }
        
        # Add smart filtering information if available
        if extraction_method == "smart_filtering":
            reduction_pct = ((original_size - filtered_size) / original_size * 100) if original_size > 0 else 0
            summary.update({
                "extraction_method": extraction_method,
                "original_size": original_size,
                "filtered_size": filtered_size,
                "size_reduction_percent": round(reduction_pct, 1),
                "smart_filtered": True
            })
        else:
            summary["smart_filtered"] = False
        
        return summary
