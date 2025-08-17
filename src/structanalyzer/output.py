"""
Output formatting and management for C structure analysis
"""

import json
import time
from pathlib import Path
from typing import Dict, Any, Optional, List
from .types import AnalysisResult, StructureInfo, FieldType


class OutputFormatter:
    """Formats analysis results for various output types"""
    
    @staticmethod
    def format_text_report(result: AnalysisResult, detailed: bool = True) -> str:
        """Format analysis result as human-readable text report"""
        lines = []
        
        # Header
        lines.append("C Structure Analysis Report")
        lines.append("=" * 50)
        lines.append("")
        lines.append(f"Structure: {result.structure_name}")
        lines.append(f"File: {result.file_path}")
        lines.append(f"Max Depth: {result.max_depth}")
        lines.append(f"Analysis Time: {result.analysis_time:.3f}s")
        lines.append(f"Timestamp: {time.ctime(result.timestamp)}")
        lines.append(f"Structures Found: {result.total_structures}")
        
        if result.errors:
            lines.append(f"Errors: {len(result.errors)}")
        
        lines.append("")
        lines.append("-" * 50)
        lines.append("")
        
        # Statistics
        stats = result.get_statistics()
        lines.append("📊 Analysis Statistics")
        lines.append("-" * 25)
        lines.append(f"Total Structures: {stats['total_structures']}")
        lines.append(f"Total Fields: {stats['total_fields']}")
        lines.append(f"Primitive Fields: {stats['total_primitives']}")
        lines.append(f"Nested Structures: {stats['total_nested']}")
        lines.append(f"Union Fields: {stats['total_unions']}")
        lines.append(f"Success Rate: {stats['success_rate']:.1%}")
        lines.append("")
        
        # Main structure details
        main_struct = result.get_main_structure()
        if main_struct and main_struct.found:
            lines.extend(OutputFormatter._format_structure_details(main_struct, detailed))
        
        # Nested structures
        nested = result.get_nested_structures()
        if nested:
            lines.append("\n🔗 Nested Structures")
            lines.append("-" * 20)
            for struct_info in nested:
                if struct_info.found:
                    lines.extend(OutputFormatter._format_structure_details(struct_info, detailed, indent="  "))
        
        # Errors
        if result.errors:
            lines.append("\n❌ Errors")
            lines.append("-" * 10)
            for error in result.errors:
                lines.append(f"  • {error}")
        
        return "\n".join(lines)
    
    @staticmethod
    def _format_structure_details(struct_info: StructureInfo, detailed: bool = True, 
                                indent: str = "") -> List[str]:
        """Format details for a single structure"""
        lines = []
        
        # Structure header
        type_str = "Union" if struct_info.is_union else "Structure"
        lines.append(f"{indent}{type_str}: {struct_info.name}")
        lines.append(f"{indent}{'-' * (len(type_str) + len(struct_info.name) + 2)}")
        
        if not struct_info.found:
            lines.append(f"{indent}❌ Not found: {struct_info.error or 'Unknown error'}")
            lines.append("")
            return lines
        
        # Basic info
        lines.append(f"{indent}📍 Location: Lines {struct_info.start_line}-{struct_info.end_line}")
        lines.append(f"{indent}📊 Fields: {struct_info.field_count} total, "
                    f"{struct_info.primitive_count} primitive, "
                    f"{struct_info.nested_count} nested")
        
        if struct_info.union_count > 0:
            lines.append(f"{indent}🔀 Union Fields: {struct_info.union_count}")
        
        lines.append(f"{indent}🌱 Depth: {struct_info.depth}")
        lines.append("")
        
        if not detailed:
            return lines
        
        # Field details
        if struct_info.fields:
            # Group fields by type
            primitives = [f for f in struct_info.fields if f.is_primitive]
            nested_structs = [f for f in struct_info.fields if f.field_type == FieldType.STRUCT]
            nested_unions = [f for f in struct_info.fields if f.field_type == FieldType.UNION]
            pointers = [f for f in struct_info.fields if f.field_type == FieldType.POINTER]
            arrays = [f for f in struct_info.fields if f.field_type == FieldType.ARRAY]
            others = [f for f in struct_info.fields if f not in primitives + nested_structs + 
                     nested_unions + pointers + arrays]
            
            # Primitive fields
            if primitives:
                lines.append(f"{indent}🔹 Primitive Fields:")
                for field in primitives:
                    bit_info = f" : {field.bit_field_size}" if field.bit_field_size else ""
                    lines.append(f"{indent}  • {field.name}: {field.type_name}{bit_info}")
                lines.append("")
            
            # Nested structures
            if nested_structs:
                lines.append(f"{indent}🏗️ Nested Structures:")
                for field in nested_structs:
                    lines.append(f"{indent}  🔗 {field.name}: {field.type_name}")
                lines.append("")
            
            # Nested unions
            if nested_unions:
                lines.append(f"{indent}🔀 Nested Unions:")
                for field in nested_unions:
                    lines.append(f"{indent}  🔗 {field.name}: {field.type_name}")
                lines.append("")
            
            # Pointers
            if pointers:
                lines.append(f"{indent}👉 Pointer Fields:")
                for field in pointers:
                    ptr_str = "*" * field.pointer_depth
                    lines.append(f"{indent}  • {field.name}: {field.type_name}")
                lines.append("")
            
            # Arrays
            if arrays:
                lines.append(f"{indent}📋 Array Fields:")
                for field in arrays:
                    size_str = f"[{field.array_size}]" if field.array_size else "[]"
                    lines.append(f"{indent}  • {field.name}: {field.type_name}")
                lines.append("")
            
            # Other fields
            if others:
                lines.append(f"{indent}❓ Other Fields:")
                for field in others:
                    lines.append(f"{indent}  • {field.name}: {field.type_name} ({field.field_type.value})")
                lines.append("")
        
        return lines
    
    @staticmethod
    def format_json(result: AnalysisResult, pretty: bool = True) -> str:
        """Format analysis result as JSON"""
        # Convert dataclasses to dictionaries
        json_data = OutputFormatter._result_to_dict(result)
        
        if pretty:
            return json.dumps(json_data, indent=2, ensure_ascii=False)
        else:
            return json.dumps(json_data, ensure_ascii=False)
    
    @staticmethod
    def _result_to_dict(result: AnalysisResult) -> Dict[str, Any]:
        """Convert AnalysisResult to dictionary"""
        structures_dict = {}
        
        for name, struct_info in result.structures.items():
            structures_dict[name] = OutputFormatter._struct_to_dict(struct_info)
        
        return {
            "structure_name": result.structure_name,
            "file_path": result.file_path,
            "max_depth": result.max_depth,
            "analysis_complete": result.analysis_complete,
            "timestamp": result.timestamp,
            "analysis_time": result.analysis_time,
            "total_structures": result.total_structures,
            "errors": result.errors,
            "statistics": result.get_statistics(),
            "structures": structures_dict
        }
    
    @staticmethod
    def _struct_to_dict(struct_info: StructureInfo) -> Dict[str, Any]:
        """Convert StructureInfo to dictionary"""
        fields_list = []
        
        for field in struct_info.fields:
            field_dict = {
                "name": field.name,
                "type_name": field.type_name,
                "field_type": field.field_type.value,
                "is_primitive": field.is_primitive
            }
            
            # Add optional fields if they have values
            if field.size_bytes is not None:
                field_dict["size_bytes"] = field.size_bytes
            if field.array_size is not None:
                field_dict["array_size"] = field.array_size
            if field.pointer_depth > 0:
                field_dict["pointer_depth"] = field.pointer_depth
            if field.bit_field_size is not None:
                field_dict["bit_field_size"] = field.bit_field_size
            if field.offset is not None:
                field_dict["offset"] = field.offset
            if field.declaration:
                field_dict["declaration"] = field.declaration
            if field.resolved_type:
                field_dict["resolved_type"] = field.resolved_type
            
            fields_list.append(field_dict)
        
        struct_dict = {
            "name": struct_info.name,
            "found": struct_info.found,
            "is_union": struct_info.is_union,
            "fields": fields_list,
            "field_count": struct_info.field_count,
            "primitive_count": struct_info.primitive_count,
            "nested_count": struct_info.nested_count,
            "union_count": struct_info.union_count,
            "start_line": struct_info.start_line,
            "end_line": struct_info.end_line,
            "start_byte": struct_info.start_byte,
            "end_byte": struct_info.end_byte,
            "depth": struct_info.depth
        }
        
        # Add optional fields
        if struct_info.definition:
            struct_dict["definition"] = struct_info.definition
        if struct_info.size_bytes is not None:
            struct_dict["size_bytes"] = struct_info.size_bytes
        if struct_info.alignment is not None:
            struct_dict["alignment"] = struct_info.alignment
        if struct_info.error:
            struct_dict["error"] = struct_info.error
        
        return struct_dict
    
    @staticmethod
    def format_struct_to_dict(struct_info: StructureInfo) -> Dict[str, Any]:
        """Convert StructureInfo to dictionary (public method for compatibility)"""
        return OutputFormatter._struct_to_dict(struct_info)
    
    @staticmethod
    def format_struct_to_dict(struct_info: StructureInfo) -> Dict[str, Any]:
        """Format a single StructureInfo to dictionary (compatibility method)"""
        return OutputFormatter._struct_to_dict(struct_info)
    
    @staticmethod
    def format_c_header(result: AnalysisResult) -> str:
        """Format analysis result as C header file"""
        lines = []
        
        # Header guard and includes
        guard_name = f"_ANALYZED_STRUCTURES_H_"
        lines.append(f"#ifndef {guard_name}")
        lines.append(f"#define {guard_name}")
        lines.append("")
        lines.append("/* Auto-generated C header from structure analysis */")
        lines.append("")
        
        # Add typedef declarations first
        typedefs_added = set()
        
        # Add typedef definitions for basic types
        if result.typedefs:
            lines.append("/* Basic type definitions */")
            for typedef_name, typedef_info in result.typedefs.items():
                if typedef_info.found and typedef_info.definition:
                    lines.append(typedef_info.definition)
                    typedefs_added.add(typedef_name)
            lines.append("")
        
        # Add additional typedef declarations from field types
        for struct_name, struct_info in result.structures.items():
            if not struct_info.found:
                continue
                
            for field in struct_info.fields:
                if field.resolved_type and field.resolved_type != field.type_name:
                    if field.type_name not in typedefs_added and not field.is_primitive:
                        lines.append(f"typedef {field.resolved_type} {field.type_name};")
                        typedefs_added.add(field.type_name)

        if typedefs_added:
            lines.append("")        # Add enum definitions
        if result.enums:
            lines.append("/* Enum definitions */")
            for enum_name, enum_info in result.enums.items():
                if enum_info.found and enum_info.definition:
                    # Add the full enum definition
                    lines.append(f"typedef {enum_info.definition} {enum_name};")
                elif enum_info.found and enum_info.values:
                    # Reconstruct enum from values
                    lines.append(f"typedef enum _{enum_name} {{")
                    for i, value in enumerate(enum_info.values):
                        comma = "," if i < len(enum_info.values) - 1 else ""
                        lines.append(f"    {value}{comma}")
                    lines.append(f"}} {enum_name};")
                else:
                    # Add a placeholder comment for missing enum
                    lines.append(f"/* enum {enum_name} - definition not found */")
            lines.append("")
        
        # Forward declarations
        lines.append("/* Forward declarations */")
        for struct_name, struct_info in result.structures.items():
            if struct_info.found:
                struct_type = "union" if struct_info.is_union else "struct"
                lines.append(f"{struct_type} {struct_name};")
        lines.append("")
        
        # Structure definitions
        lines.append("/* Structure definitions */")
        for struct_name, struct_info in result.structures.items():
            if not struct_info.found:
                continue
            
            struct_type = "union" if struct_info.is_union else "struct"
            lines.append(f"{struct_type} {struct_name} {{")
            
            for field in struct_info.fields:
                # Build field declaration
                type_str = field.resolved_type if field.resolved_type else field.type_name
                
                # Add pointer asterisks
                if field.pointer_depth > 0:
                    type_str += "*" * field.pointer_depth
                
                field_decl = f"    {type_str} {field.name}"
                
                # Add array dimensions
                if field.array_size is not None:
                    field_decl += f"[{field.array_size}]"
                
                # Add bit field size
                if field.bit_field_size is not None:
                    field_decl += f" : {field.bit_field_size}"
                
                field_decl += ";"
                lines.append(field_decl)
            
            lines.append("};")
            lines.append("")
        
        # End header guard
        lines.append(f"#endif /* {guard_name} */")
        
        return "\n".join(lines)
    
    @staticmethod
    def format_csv(result: AnalysisResult) -> str:
        """Format analysis result as CSV (field-based view)"""
        lines = []
        
        # CSV header
        lines.append("structure_name,structure_type,field_name,field_type,type_name,is_primitive,"
                    "array_size,pointer_depth,bit_field_size,resolved_type,line_start,line_end,depth")
        
        for struct_name, struct_info in result.structures.items():
            if not struct_info.found:
                continue
            
            struct_type = "union" if struct_info.is_union else "struct"
            
            for field in struct_info.fields:
                line_parts = [
                    struct_name,
                    struct_type,
                    field.name,
                    str(field.field_type.name),  # Convert enum to string name
                    f'"{field.type_name}"',  # Quote to handle commas in type names
                    str(field.is_primitive).lower(),
                    str(field.array_size) if field.array_size is not None else "",
                    str(field.pointer_depth),
                    str(field.bit_field_size) if field.bit_field_size is not None else "",
                    f'"{field.resolved_type}"' if field.resolved_type else "",  # Quote resolved type
                    str(struct_info.start_line),
                    str(struct_info.end_line),
                    str(getattr(struct_info, 'depth', 0))  # Safe access to depth
                ]
                lines.append(",".join(line_parts))
        
        return "\n".join(lines)


class OutputManager:
    """Manages output file generation and formatting"""
    
    def __init__(self, base_path: Optional[str] = None):
        """Initialize with optional base output path"""
        self.base_path = Path(base_path) if base_path else Path.cwd()
    
    def save_analysis(self, result: AnalysisResult, output_path: Optional[str] = None,
                     format_type: str = "text", detailed: bool = True) -> str:
        """Save analysis result to file"""
        
        # Generate output path if not provided
        if not output_path:
            output_path = self._generate_output_path(result, format_type)
        
        output_file = Path(output_path)
        
        # Ensure directory exists
        output_file.parent.mkdir(parents=True, exist_ok=True)
        
        # Format content based on type
        if format_type.lower() == "json":
            content = OutputFormatter.format_json(result, pretty=True)
        elif format_type.lower() == "csv":
            content = OutputFormatter.format_csv(result)
        elif format_type.lower() == "c":
            content = OutputFormatter.format_c_header(result)
        else:  # Default to text
            content = OutputFormatter.format_text_report(result, detailed)
        
        # Write file
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(content)
        
        return str(output_file)
    
    def save_result(self, result: AnalysisResult, format_type: str = "text", 
                   output_path: Optional[str] = None) -> str:
        """Save analysis result (compatibility method)"""
        return self.save_analysis(result, output_path, format_type)
    
    def _generate_output_path(self, result: AnalysisResult, format_type: str) -> str:
        """Generate output file path"""
        # Get base filename from source file
        source_path = Path(result.file_path)
        base_name = source_path.stem.replace('.', '_')
        
        # Generate timestamp
        timestamp = time.strftime("%Y%m%d_%H%M%S")
        
        # Determine extension
        extensions = {
            "json": ".json",
            "csv": ".csv",
            "c": ".h",
            "text": ".txt"
        }
        ext = extensions.get(format_type.lower(), ".txt")
        
        # Build filename
        filename = f"{base_name}_{result.structure_name}_analysis_{timestamp}{ext}"
        
        return str(self.base_path / filename)
    
    def save_multiple_formats(self, result: AnalysisResult, base_name: Optional[str] = None) -> Dict[str, str]:
        """Save analysis in multiple formats"""
        if not base_name:
            base_name = self._generate_base_name(result)
        
        formats = ["text", "json", "csv", "c"]
        saved_files = {}
        
        for fmt in formats:
            # Use .h extension for C header files
            extension = "h" if fmt == "c" else fmt
            output_path = f"{base_name}.{extension}"
            try:
                saved_path = self.save_analysis(result, output_path, fmt)
                saved_files[fmt] = saved_path
            except Exception as e:
                saved_files[fmt] = f"Error: {str(e)}"
        
        return saved_files
    
    def _generate_base_name(self, result: AnalysisResult) -> str:
        """Generate base name for multiple format output"""
        source_path = Path(result.file_path)
        base_name = source_path.stem.replace('.', '_')
        timestamp = time.strftime("%Y%m%d_%H%M%S")
        
        return str(self.base_path / f"{base_name}_{result.structure_name}_analysis_{timestamp}")
    
    def create_summary_report(self, results: Dict[str, AnalysisResult], 
                            output_path: Optional[str] = None) -> str:
        """Create summary report for multiple structure analyses"""
        
        if not output_path:
            timestamp = time.strftime("%Y%m%d_%H%M%S")
            output_path = str(self.base_path / f"structure_analysis_summary_{timestamp}.txt")
        
        lines = []
        
        # Header
        lines.append("C Structure Analysis Summary Report")
        lines.append("=" * 50)
        lines.append(f"Generated: {time.ctime()}")
        lines.append(f"Total Structures Analyzed: {len(results)}")
        lines.append("")
        
        # Overall statistics
        total_structures = sum(r.total_structures for r in results.values())
        total_time = sum(r.analysis_time for r in results.values())
        successful = len([r for r in results.values() if r.analysis_complete and not r.errors])
        
        lines.append("📊 Overall Statistics")
        lines.append("-" * 20)
        lines.append(f"Total Analyzed: {len(results)}")
        lines.append(f"Successful: {successful}")
        lines.append(f"Success Rate: {successful/len(results)*100:.1f}%")
        lines.append(f"Total Structures Found: {total_structures}")
        lines.append(f"Total Analysis Time: {total_time:.3f}s")
        lines.append(f"Average Time per Structure: {total_time/len(results):.3f}s")
        lines.append("")
        
        # Individual results
        lines.append("📋 Individual Results")
        lines.append("-" * 20)
        
        for struct_name, result in results.items():
            status = "✅" if result.analysis_complete and not result.errors else "❌"
            lines.append(f"{status} {struct_name}")
            lines.append(f"   📁 File: {result.file_path}")
            lines.append(f"   ⏱️ Time: {result.analysis_time:.3f}s")
            lines.append(f"   📊 Structures: {result.total_structures}")
            
            if result.errors:
                lines.append(f"   ❌ Errors: {len(result.errors)}")
                for error in result.errors[:3]:  # Show first 3 errors
                    lines.append(f"      • {error}")
                if len(result.errors) > 3:
                    lines.append(f"      ... and {len(result.errors) - 3} more")
            
            lines.append("")
        
        # Write file
        output_file = Path(output_path)
        output_file.parent.mkdir(parents=True, exist_ok=True)
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write("\n".join(lines))
        
        return str(output_file)
