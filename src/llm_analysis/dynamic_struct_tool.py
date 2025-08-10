#!/usr/bin/env python3
"""
Dynamic Struct Definition Tool for LLM Analysis

This module provides tools for LLMs to dynamically request specific struct definitions
during analysis using tree-sitter parsing of .i files.
"""

import json
import logging
import os
import re
from dataclasses import dataclass, asdict
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Any, Union, Tuple
from enum import Enum

try:
    import tree_sitter
    import tree_sitter_c as tsc
    TREE_SITTER_AVAILABLE = True
except ImportError:
    TREE_SITTER_AVAILABLE = False
    logging.warning("tree-sitter not available, falling back to text parsing")

try:
    from langchain.tools import BaseTool
    from langchain.schema import BaseMessage
    from langchain.tools.base import ToolException
    LANGCHAIN_AVAILABLE = True
except ImportError:
    LANGCHAIN_AVAILABLE = False
    BaseTool = object


logger = logging.getLogger(__name__)


@dataclass
class StructRequest:
    """Represents a request for struct definition"""
    struct_name: str
    file_hint: Optional[str] = None
    context: Optional[str] = None
    request_id: str = ""


@dataclass
class StructResponse:
    """Represents the response to a struct request"""
    request: StructRequest
    status: str  # "success", "not_found", "error"
    definition: Optional[str] = None
    file_path: Optional[str] = None
    line_number: Optional[int] = None
    related_structs: List[str] = None
    error: Optional[str] = None
    
    def __post_init__(self):
        if self.related_structs is None:
            self.related_structs = []


class DynamicStructExtractor:
    """Dynamic struct definition extractor using preprocessed JSON database"""
    
    def __init__(self, data_dir: str = "data", kernel_sources_dir: str = None):
        self.data_dir = Path(data_dir)
        self.kernel_sources_dir = Path(kernel_sources_dir) if kernel_sources_dir else None
        self.parser = None
        self.language = None
        
        # Load preprocessed .i file database
        self.i_files_db = None
        self._load_i_files_database()
        
        if TREE_SITTER_AVAILABLE:
            self._init_tree_sitter()
        
        # Cache for parsed files
        self._file_cache = {}
        
        # Find kernel sources automatically if not provided
        if not self.kernel_sources_dir:
            self.kernel_sources_dir = self._find_kernel_sources()
    
    def _load_i_files_database(self):
        """Load preprocessed .i files database"""
        db_paths = [
            self.data_dir / "i_files.json",
            Path("data/i_files.json"),
            Path("i_files.json")
        ]
        
        for db_path in db_paths:
            if db_path.exists():
                try:
                    with open(db_path, 'r', encoding='utf-8') as f:
                        self.i_files_db = json.load(f)
                    logger.info(f"Loaded .i files database from: {db_path}")
                    logger.info(f"Database contains {len(self.i_files_db.get('files', []))} files with {self.i_files_db.get('metadata', {}).get('total_structs', 0)} structs")
                    return
                except Exception as e:
                    logger.warning(f"Failed to load .i files database from {db_path}: {e}")
                    continue
        
        logger.warning("No .i files database found. Run: python -m src.preprocess.i_file_processor --source-dir data/kernel_sources --output data/i_files.json")
    
    def _init_tree_sitter(self):
        """Initialize tree-sitter parser for C"""
        try:
            # Try the newer tree-sitter API first
            try:
                import tree_sitter_c as tsc
                language = tree_sitter.Language(tsc.language())
            except:
                # Fallback to older API
                language = tree_sitter.Language(tsc.language(), "c")
            
            self.language = language
            self.parser = tree_sitter.Parser()
            # Use newer tree-sitter API
            self.parser.language = self.language
            logger.info("Tree-sitter C parser initialized")
        except Exception as e:
            logger.warning(f"Failed to initialize tree-sitter: {e}")
            self.parser = None
    
    def _find_kernel_sources(self) -> Optional[Path]:
        """Find kernel sources directory"""
        search_paths = [
            self.data_dir / "kernel_sources",
            Path("data/kernel_sources"),
            Path("kernel_sources")
        ]
        
        for path in search_paths:
            if path.exists() and path.is_dir():
                logger.info(f"Found kernel sources at: {path}")
                return path
        
        logger.warning("Kernel sources directory not found")
        return None
    
    def extract_struct(self, struct_name: str, file_hint: Optional[str] = None) -> StructResponse:
        """Extract struct definition from preprocessed database"""
        request = StructRequest(
            struct_name=struct_name,
            file_hint=file_hint,
            request_id=f"struct_{struct_name}_{hash(file_hint or '')}"
        )
        
        # First try to find in preprocessed database
        if self.i_files_db:
            result = self._extract_from_database(struct_name, file_hint, request)
            if result.status == "success":
                return result
        
        # Fallback to old method if database not available or struct not found
        logger.warning(f"Struct '{struct_name}' not found in database, falling back to direct .i file parsing")
        return self._extract_from_files_fallback(struct_name, file_hint, request)
    
    def _extract_from_database(self, struct_name: str, file_hint: Optional[str], request: StructRequest) -> StructResponse:
        """Extract struct definition from preprocessed database"""
        # Check struct index for quick lookup
        struct_index = self.i_files_db.get('struct_index', {})
        if struct_name not in struct_index:
            return StructResponse(
                request=request,
                status="not_found",
                error=f"Struct '{struct_name}' not found in database index"
            )
        
        # Get files containing the struct
        candidate_files = struct_index[struct_name]
        
        # If we have a file hint, try to prioritize matching files
        if file_hint:
            prioritized_files = []
            for file_path in candidate_files:
                if file_hint in file_path or Path(file_hint).stem in Path(file_path).stem:
                    prioritized_files.append(file_path)
            
            # Add remaining files
            for file_path in candidate_files:
                if file_path not in prioritized_files:
                    prioritized_files.append(file_path)
            
            candidate_files = prioritized_files
        
        # Find the struct definition in the database
        for file_data in self.i_files_db.get('files', []):
            if file_data['file_path'] in candidate_files:
                for struct in file_data['structs']:
                    if struct['name'] == struct_name:
                        return StructResponse(
                            request=request,
                            status="success",
                            definition=struct['definition'],
                            file_path=struct['file_path'],
                            line_number=struct['line_number'],
                            related_structs=struct['related_structs']
                        )
        
        return StructResponse(
            request=request,
            status="not_found",
            error=f"Struct '{struct_name}' not found in database files"
        )
    
    def _extract_from_files_fallback(self, struct_name: str, file_hint: Optional[str], request: StructRequest) -> StructResponse:
        """Fallback to direct .i file parsing when database is not available"""
        # Find candidate .i files containing the struct
        candidates = self._find_struct_candidates(struct_name, file_hint)
        
        if not candidates:
            return StructResponse(
                request=request,
                status="not_found",
                error=f"Struct '{struct_name}' not found in any .i files"
            )
        
        # Try to extract using tree-sitter first
        for candidate_file in candidates:
            if self.parser:
                result = self._extract_struct_tree_sitter(struct_name, candidate_file)
                if result.status == "success":
                    result.request = request
                    return result
            
            # Fallback to regex-based extraction
            result = self._extract_struct_regex(struct_name, candidate_file)
            if result.status == "success":
                result.request = request
                return result
        
        return StructResponse(
            request=request,
            status="error",
            error=f"Failed to extract struct '{struct_name}' from candidates"
        )
    
    def _find_struct_candidates(self, struct_name: str, file_hint: Optional[str] = None) -> List[Path]:
        """Find .i files that likely contain the struct definition"""
        candidates = []
        
        if not self.kernel_sources_dir or not self.kernel_sources_dir.exists():
            return candidates
        
        # If we have a file hint, look for corresponding .i file first
        if file_hint:
            hint_i_file = self._get_i_file_for_c_file(file_hint)
            if hint_i_file and hint_i_file.exists():
                candidates.append(hint_i_file)
        
        # Search all .i files for the struct
        for i_file in self.kernel_sources_dir.rglob("*.i"):
            if file_hint and i_file == candidates[0] if candidates else False:
                continue  # Already added
            
            # Quick text search to see if struct is mentioned
            try:
                with open(i_file, 'r', encoding='utf-8', errors='ignore') as f:
                    # For smaller files, read entirely. For larger files, search in chunks
                    file_size = i_file.stat().st_size
                    if file_size < 500000:  # 500KB
                        content = f.read()
                        if f"struct {struct_name}" in content or re.search(rf"struct\s+{struct_name}", content):
                            candidates.append(i_file)
                    else:
                        # For large files, search in chunks
                        found = False
                        while True:
                            chunk = f.read(100000)  # 100KB chunks
                            if not chunk:
                                break
                            if f"struct {struct_name}" in chunk or re.search(rf"struct\s+{struct_name}", chunk):
                                found = True
                                break
                        if found:
                            candidates.append(i_file)
            except Exception as e:
                logger.debug(f"Error reading {i_file}: {e}")
                continue
        
        logger.info(f"Found {len(candidates)} candidate files for struct '{struct_name}'")
        return candidates
    
    def _get_i_file_for_c_file(self, c_file_path: str) -> Optional[Path]:
        """Get corresponding .i file for a .c file"""
        if not self.kernel_sources_dir:
            return None
        
        # Extract relative path and change extension
        c_path = Path(c_file_path)
        if c_path.suffix == '.c':
            i_file_name = c_path.stem + '.i'
            
            # Search for the .i file with same name in kernel sources
            for i_file in self.kernel_sources_dir.rglob(i_file_name):
                return i_file
        
        return None
    
    def _extract_struct_tree_sitter(self, struct_name: str, file_path: Path) -> StructResponse:
        """Extract struct using tree-sitter"""
        if not self.parser:
            return StructResponse(
                request=StructRequest(struct_name=struct_name),
                status="error",
                error="Tree-sitter not available"
            )
        
        try:
            # Load file content
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
            
            # Parse with tree-sitter
            tree = self.parser.parse(content.encode('utf-8'))
            
            # Find struct definitions
            struct_def = self._find_struct_in_tree(tree.root_node, struct_name, content)
            
            if struct_def:
                definition, line_number, related = struct_def
                return StructResponse(
                    request=StructRequest(struct_name=struct_name),
                    status="success",
                    definition=definition,
                    file_path=str(file_path),
                    line_number=line_number,
                    related_structs=related
                )
            
        except Exception as e:
            logger.error(f"Tree-sitter parsing error for {file_path}: {e}")
        
        return StructResponse(
            request=StructRequest(struct_name=struct_name),
            status="not_found",
            error=f"Struct not found in {file_path}"
        )
    
    def _find_struct_in_tree(self, node, struct_name: str, content: str) -> Optional[Tuple[str, int, List[str]]]:
        """Find struct definition in syntax tree"""
        if node.type == 'struct_specifier':
            # Check if this is our struct
            name_node = None
            for child in node.children:
                if child.type == 'type_identifier':
                    name_node = child
                    break
            
            if name_node:
                actual_name = content[name_node.start_byte:name_node.end_byte]
                if actual_name == struct_name:
                    # Found the struct, extract its definition
                    struct_text = content[node.start_byte:node.end_byte]
                    line_number = node.start_point[0] + 1
                    
                    # Find related structs referenced in this struct
                    related = self._find_related_structs_in_definition(struct_text)
                    
                    return struct_text, line_number, related
        
        # Recursively search children
        for child in node.children:
            result = self._find_struct_in_tree(child, struct_name, content)
            if result:
                return result
        
        return None
    
    def _find_related_structs_in_definition(self, struct_definition: str) -> List[str]:
        """Find other structs referenced in this struct definition"""
        related = []
        
        # Find struct member types
        struct_pattern = r'\bstruct\s+(\w+)'
        matches = re.findall(struct_pattern, struct_definition)
        
        for match in matches:
            if match not in related:
                related.append(match)
        
        return related
    
    def _extract_struct_regex(self, struct_name: str, file_path: Path) -> StructResponse:
        """Fallback struct extraction using regex"""
        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
            
            # Pattern to match struct definitions
            pattern = rf'struct\s+{re.escape(struct_name)}\s*\{{[^}}]*\}}'
            match = re.search(pattern, content, re.MULTILINE | re.DOTALL)
            
            if match:
                definition = match.group(0)
                # Find line number
                lines_before = content[:match.start()].count('\n')
                line_number = lines_before + 1
                
                # Find related structs
                related = self._find_related_structs_in_definition(definition)
                
                return StructResponse(
                    request=StructRequest(struct_name=struct_name),
                    status="success",
                    definition=definition,
                    file_path=str(file_path),
                    line_number=line_number,
                    related_structs=related
                )
            
        except Exception as e:
            logger.error(f"Regex parsing error for {file_path}: {e}")
        
        return StructResponse(
            request=StructRequest(struct_name=struct_name),
            status="not_found",
            error=f"Struct not found in {file_path}"
        )


class StructDefinitionTool(BaseTool if LANGCHAIN_AVAILABLE else object):
    """LangChain tool for requesting struct definitions"""
    
    name: str = "get_struct_definition"
    description: str = """Get the definition of a C struct. 
    Args:
        struct_name (str): Name of the struct to get definition for
        file_hint (str, optional): Hint about which file the struct might be in
    """
    
    def __init__(self, extractor: DynamicStructExtractor):
        super().__init__() if LANGCHAIN_AVAILABLE else None
        self.extractor = extractor
    
    def _run(self, struct_name: str, file_hint: str = None) -> str:
        """Execute the tool"""
        response = self.extractor.extract_struct(struct_name, file_hint)
        
        if response.status == "success":
            result = {
                "status": "success",
                "struct_name": struct_name,
                "definition": response.definition,
                "file_path": response.file_path,
                "line_number": response.line_number,
                "related_structs": response.related_structs
            }
        else:
            result = {
                "status": response.status,
                "struct_name": struct_name,
                "error": response.error
            }
        
        return json.dumps(result, indent=2)
    
    def _arun(self, struct_name: str, file_hint: str = None) -> str:
        """Async version (not implemented)"""
        raise NotImplementedError("StructDefinitionTool does not support async")


class LLMStructRequestHandler:
    """Handles struct definition requests from LLM during analysis with enhanced tracking"""
    
    def __init__(self, data_dir: str = "data", kernel_sources_dir: str = None):
        self.extractor = DynamicStructExtractor(data_dir, kernel_sources_dir)
        self.request_history = []
        self.session_id = datetime.now().strftime("%Y%m%d_%H%M%S")
    
    def handle_struct_request(self, request_data: Dict[str, Any]) -> Dict[str, Any]:
        """Handle a struct definition request from LLM with enhanced tracking"""
        struct_name = request_data.get('struct_name')
        file_hint = request_data.get('file_hint')
        context = request_data.get('context', '')
        
        if not struct_name:
            return {
                "success": False,
                "error": "struct_name is required"
            }
        
        # Extract the struct
        response = self.extractor.extract_struct(struct_name, file_hint)
        
        # Enhanced request tracking
        request_record = {
            "type": "struct_request",
            "session_id": self.session_id,
            "request_number": len(self.request_history) + 1,
            "request": {
                "struct_name": struct_name,
                "file_hint": file_hint,
                "context": context,
                "request_id": response.request.request_id,
                "timestamp": datetime.now().isoformat()
            },
            "response": {
                "status": response.status,
                "definition": response.definition,
                "file_path": response.file_path,
                "line_number": response.line_number,
                "related_structs": response.related_structs,
                "error": response.error,
                "source": "database" if self.extractor.i_files_db and response.status == "success" else "file_parsing"
            },
            "timestamp": datetime.now().isoformat()
        }
        
        self.request_history.append(request_record)
        
        # Return formatted response
        if response.status == "success":
            return {
                "success": True,
                "struct_name": struct_name,
                "definition": response.definition,
                "file_path": response.file_path,
                "line_number": response.line_number,
                "related_structs": response.related_structs,
                "source": request_record["response"]["source"],
                "request_number": request_record["request_number"]
            }
        else:
            return {
                "success": False,
                "struct_name": struct_name,
                "error": response.error,
                "request_number": request_record["request_number"]
            }
    
    def get_request_history(self) -> List[Dict[str, Any]]:
        """Get history of all struct requests"""
        return self.request_history.copy()
    
    def clear_history(self):
        """Clear request history"""
        self.request_history.clear()


# Import datetime for timestamps
from datetime import datetime
