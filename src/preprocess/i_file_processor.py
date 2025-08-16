#!/usr/bin/env python3
"""
Enhanced I File Processor - Extract all .i file content to JSON

This module processes all .i files corresponding to .c files and stores
their struct definitions and content in a structured JSON format for
efficient LLM analysis tool calls.

Usage:
    python -m src.preprocess.i_file_processor --source-dir data/kernel_sources --output data/i_files.json
"""

import json
import logging
import re
import sys
from dataclasses import dataclass, asdict
from pathlib import Path
from typing import Dict, List, Optional, Any, Set
from datetime import datetime

# Add parent directories to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

try:
    import tree_sitter
    import tree_sitter_c as tsc
    TREE_SITTER_AVAILABLE = True
except ImportError:
    TREE_SITTER_AVAILABLE = False
    logging.warning("tree-sitter not available, falling back to regex parsing")

logger = logging.getLogger(__name__)

@dataclass
class StructInfo:
    """Information about a struct definition"""
    name: str
    definition: str
    line_number: int
    file_path: str
    related_structs: List[str]
    kind: str = "struct"  # "struct", "union", "typedef"

@dataclass
class IFileContent:
    """Content and metadata for a .i file"""
    file_path: str
    c_file_path: str
    structs: List[StructInfo]
    file_size: int
    line_count: int
    processed_timestamp: str

@dataclass
class IFilesDatabase:
    """Complete database of .i file contents"""
    metadata: Dict[str, Any]
    files: List[IFileContent]
    struct_index: Dict[str, List[str]]  # struct_name -> list of file_paths containing it

class IFileProcessor:
    """Processes .i files and extracts struct definitions"""
    
    def __init__(self):
        self.parser = None
        self.language = None
        
        if TREE_SITTER_AVAILABLE:
            self._init_tree_sitter()
    
    def _init_tree_sitter(self):
        """Initialize tree-sitter C parser"""
        try:
            self.language = tree_sitter.Language(tsc.language())
            self.parser = tree_sitter.Parser()
            # Use newer tree-sitter API
            self.parser.language = self.language
            logger.info("Tree-sitter C parser initialized")
        except Exception as e:
            logger.warning(f"Failed to initialize tree-sitter: {e}")
            self.parser = None
    
    def process_source_directory(self, source_dir: Path, output_path: Path) -> IFilesDatabase:
        """Process all .i files in source directory"""
        logger.info(f"Processing source directory: {source_dir}")
        
        # Find all .c files and their corresponding .i files
        c_to_i_mapping = self._map_c_to_i_files(source_dir)
        logger.info(f"Found {len(c_to_i_mapping)} .c -> .i mappings")
        
        # Process each .i file
        i_file_contents = []
        struct_index = {}
        
        for c_file, i_file in c_to_i_mapping.items():
            if i_file.exists():
                content = self._process_i_file(i_file, c_file)
                if content:
                    i_file_contents.append(content)
                    
                    # Update struct index
                    for struct in content.structs:
                        if struct.name not in struct_index:
                            struct_index[struct.name] = []
                        struct_index[struct.name].append(content.file_path)
        
        # Create database
        database = IFilesDatabase(
            metadata={
                "processed_timestamp": datetime.now().isoformat(),
                "source_directory": str(source_dir),
                "total_files": len(i_file_contents),
                "total_structs": sum(len(content.structs) for content in i_file_contents),
                "tree_sitter_available": TREE_SITTER_AVAILABLE,
                "processor_version": "1.0"
            },
            files=i_file_contents,
            struct_index=struct_index
        )
        
        # Save to JSON
        self._save_database(database, output_path)
        return database
    
    def _map_c_to_i_files(self, source_dir: Path) -> Dict[Path, Path]:
        """Map .c files to their corresponding .i files"""
        c_to_i = {}
        
        # Find all .c files
        c_files = list(source_dir.rglob("*.c"))
        
        for c_file in c_files:
            # Look for corresponding .i file
            i_file_name = c_file.stem + ".i"
            
            # Search for .i file in same directory first
            i_file = c_file.parent / i_file_name
            if i_file.exists():
                c_to_i[c_file] = i_file
                continue
            
            # Search recursively in source directory
            for i_file in source_dir.rglob(i_file_name):
                c_to_i[c_file] = i_file
                break
        
        return c_to_i
    
    def _process_i_file(self, i_file: Path, c_file: Path) -> Optional[IFileContent]:
        """Process a single .i file and extract struct definitions"""
        try:
            with open(i_file, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
            
            # Extract struct definitions
            structs = []
            if self.parser:
                structs = self._extract_structs_tree_sitter(content, str(i_file))
            else:
                structs = self._extract_structs_regex(content, str(i_file))
            
            return IFileContent(
                file_path=str(i_file),
                c_file_path=str(c_file),
                structs=structs,
                file_size=i_file.stat().st_size,
                line_count=content.count('\n') + 1,
                processed_timestamp=datetime.now().isoformat()
            )
        
        except Exception as e:
            logger.error(f"Error processing {i_file}: {e}")
            return None
    
    def _extract_structs_tree_sitter(self, content: str, file_path: str) -> List[StructInfo]:
        """Extract struct definitions using tree-sitter"""
        structs = []
        
        try:
            tree = self.parser.parse(content.encode('utf-8'))
            structs_found = self._find_all_structs_in_tree(tree.root_node, content, file_path)
            structs.extend(structs_found)
        except Exception as e:
            logger.error(f"Tree-sitter parsing error in {file_path}: {e}")
            # Fallback to regex
            structs = self._extract_structs_regex(content, file_path)
        
        return structs
    
    def _find_all_structs_in_tree(self, node, content: str, file_path: str) -> List[StructInfo]:
        """Find all struct definitions in syntax tree"""
        structs = []
        
        # Check if this node is a struct/union specifier
        if node.type in ['struct_specifier', 'union_specifier']:
            struct_info = self._extract_struct_from_node(node, content, file_path)
            if struct_info:
                structs.append(struct_info)
        
        # Recursively search children
        for child in node.children:
            child_structs = self._find_all_structs_in_tree(child, content, file_path)
            structs.extend(child_structs)
        
        return structs
    
    def _extract_struct_from_node(self, node, content: str, file_path: str) -> Optional[StructInfo]:
        """Extract struct information from a tree-sitter node"""
        try:
            # Get struct name
            name = None
            for child in node.children:
                if child.type == 'type_identifier':
                    name = content[child.start_byte:child.end_byte]
                    break
            
            if not name:
                return None
            
            # Get full definition
            definition = content[node.start_byte:node.end_byte]
            line_number = node.start_point[0] + 1
            
            # Find related structs
            related_structs = self._find_related_structs(definition)
            
            return StructInfo(
                name=name,
                definition=definition,
                line_number=line_number,
                file_path=file_path,
                related_structs=related_structs,
                kind=node.type.replace('_specifier', '')
            )
        
        except Exception as e:
            logger.error(f"Error extracting struct from node: {e}")
            return None
    
    def _extract_structs_regex(self, content: str, file_path: str) -> List[StructInfo]:
        """Extract struct definitions using regex (fallback)"""
        structs = []
        
        # Patterns for struct definitions
        patterns = [
            # struct name { ... };
            r'\b(struct|union)\s+(\w+)\s*\{[^}]*\};',
            # typedef struct { ... } name;
            r'typedef\s+(struct|union)\s*\{[^}]*\}\s*(\w+);',
            # typedef struct name { ... } alias;
            r'typedef\s+(struct|union)\s+(\w+)\s*\{[^}]*\}\s*(\w+);'
        ]
        
        lines = content.split('\n')
        
        for pattern in patterns:
            for match in re.finditer(pattern, content, re.MULTILINE | re.DOTALL):
                try:
                    groups = match.groups()
                    kind = groups[0]
                    name = groups[1] if len(groups) >= 2 else "anonymous"
                    
                    # Skip if name is empty or invalid
                    if not name or not name.isidentifier():
                        continue
                    
                    definition = match.group(0)
                    
                    # Find line number
                    line_number = content[:match.start()].count('\n') + 1
                    
                    # Find related structs
                    related_structs = self._find_related_structs(definition)
                    
                    structs.append(StructInfo(
                        name=name,
                        definition=definition,
                        line_number=line_number,
                        file_path=file_path,
                        related_structs=related_structs,
                        kind=kind
                    ))
                
                except Exception as e:
                    logger.debug(f"Error processing regex match: {e}")
                    continue
        
        return structs
    
    def _find_related_structs(self, definition: str) -> List[str]:
        """Find other struct names referenced in this definition"""
        related = []
        
        # Find struct references in the definition
        struct_refs = re.findall(r'\bstruct\s+(\w+)', definition)
        union_refs = re.findall(r'\bunion\s+(\w+)', definition)
        
        for ref in struct_refs + union_refs:
            if ref not in related and ref.isidentifier():
                related.append(ref)
        
        return related
    
    def _save_database(self, database: IFilesDatabase, output_path: Path):
        """Save database to JSON file"""
        logger.info(f"Saving database to {output_path}")
        
        # Convert to dictionary
        db_dict = {
            "metadata": database.metadata,
            "files": [asdict(f) for f in database.files],
            "struct_index": database.struct_index
        }
        
        # Save to JSON with pretty printing
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(db_dict, f, indent=2, ensure_ascii=False)
        
        logger.info(f"Database saved: {len(database.files)} files, {database.metadata['total_structs']} structs")

def main():
    """Main entry point for the I file processor"""
    import argparse
    
    parser = argparse.ArgumentParser(description="Extract .i file content to JSON for LLM analysis")
    parser.add_argument("--source-dir", required=True, help="Source directory containing kernel sources")
    parser.add_argument("--output", "-o", required=True, help="Output JSON file path")
    parser.add_argument("--verbose", "-v", action="store_true", help="Enable verbose logging")
    
    args = parser.parse_args()
    
    # Set up logging
    log_level = logging.DEBUG if args.verbose else logging.INFO
    logging.basicConfig(level=log_level, format='%(levelname)s: %(message)s')
    
    # Process files
    processor = IFileProcessor()
    source_dir = Path(args.source_dir)
    output_path = Path(args.output)
    
    if not source_dir.exists():
        logger.error(f"Source directory does not exist: {source_dir}")
        sys.exit(1)
    
    try:
        database = processor.process_source_directory(source_dir, output_path)
        
        print(f"✅ Successfully processed {len(database.files)} .i files")
        print(f"📊 Found {database.metadata['total_structs']} struct definitions")
        print(f"💾 Database saved to: {output_path}")
        
    except Exception as e:
        logger.error(f"Processing failed: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
