#!/usr/bin/env python3
"""
JSON parsing utilities for LLM analysis
"""

import json
from typing import Dict, List, Any, Optional
from .models import FunctionEntry, DMAOperation, UserCopyOperation, IOCTLOperation


class JSONParser:
    """Parser for JSON files containing kernel operation data"""
    
    def __init__(self, verbose: bool = False):
        self.verbose = verbose
    
    def _log_verbose(self, message: str):
        """Log verbose messages if verbose mode is enabled"""
        if self.verbose:
            print(f"[VERBOSE] {message}")
    
    def parse_file(self, json_file_path: str) -> Dict[str, Any]:
        """Parse JSON file and return structured data"""
        self._log_verbose(f"Loading JSON file: {json_file_path}")
        
        try:
            with open(json_file_path, 'r') as f:
                data = json.load(f)
        except Exception as e:
            raise ValueError(f"Error loading JSON file: {e}")
        
        parsed_data = {
            'metadata': data.get('metadata', {}),
            'functions_by_file': self._parse_functions_by_file(data),
            'dma_operations': self._parse_dma_operations(data),
            'user_copy_operations': self._parse_user_copy_operations(data),
            'ioctl_operations': self._parse_ioctl_operations(data)
        }
        
        return parsed_data
    
    def _parse_functions_by_file(self, data: Dict[str, Any]) -> List[FunctionEntry]:
        """Parse functions_by_file section"""
        functions = []
        
        # Handle both legacy format (function_entries) and new format (functions_by_file)
        if 'function_entries' in data:
            self._log_verbose("Found function_entries section (legacy format)")
            for entry in data['function_entries']:
                functions.append(self._create_function_entry(entry))
        
        elif 'functions_by_file' in data:
            self._log_verbose("Found functions_by_file section")
            functions_by_file = data['functions_by_file']
            
            if isinstance(functions_by_file, dict):
                # New format: {file_path: [function_entries]}
                total_files = len(functions_by_file)
                total_functions = sum(len(file_functions) for file_functions in functions_by_file.values())
                self._log_verbose(f"Processing {total_functions} function entries across {total_files} files")
                
                for file_path, file_functions in functions_by_file.items():
                    self._log_verbose(f"Processing file: {file_path} ({len(file_functions)} functions)")
                    for entry in file_functions:
                        functions.append(self._create_function_entry(entry, file_path))
            
            elif isinstance(functions_by_file, list):
                # Legacy format: [function_entries]
                self._log_verbose(f"Processing {len(functions_by_file)} function entries")
                for entry in functions_by_file:
                    functions.append(self._create_function_entry(entry))
        
        return functions
    
    def _create_function_entry(self, entry: Dict[str, Any], file_path: Optional[str] = None) -> FunctionEntry:
        """Create FunctionEntry from JSON entry"""
        return FunctionEntry(
            function_name=entry.get('function_name', 'Unknown'),
            file_path=file_path or entry.get('file_path', 'Unknown'),
            function_code=entry.get('function_code', ''),
            preprocessed_code=entry.get('preprocessed_code', ''),
            preprocessed_file_path=entry.get('preprocessed_file_code', ''),  # Extract from JSON
            line_number=entry.get('line_number', 0)
        )
    
    def _parse_dma_operations(self, data: Dict[str, Any]) -> List[DMAOperation]:
        """Parse dma_operations section"""
        dma_ops = []
        
        if 'dma_operations' in data:
            self._log_verbose("Found dma_operations section")
            for entry in data['dma_operations']:
                # Use caller_function as the function name for DMA operations
                function_name = entry.get('caller_function', entry.get('function_name', 'Unknown'))
                dma_ops.append(DMAOperation(
                    function_name=function_name,
                    function_code=entry.get('function_code', ''),
                    stack_trace=entry.get('stack_trace', ''),
                    preprocessed_code=entry.get('preprocessed_code', ''),
                    preprocessed_file_path=entry.get('preprocessed_file_code', '')
                ))
            self._log_verbose(f"Processing {len(dma_ops)} DMA operation entries")
        
        return dma_ops
    
    def _parse_user_copy_operations(self, data: Dict[str, Any]) -> List[UserCopyOperation]:
        """Parse user_copy_operations section"""
        copy_ops = []
        
        if 'user_copy_operations' in data:
            self._log_verbose("Found user_copy_operations section")
            for entry in data['user_copy_operations']:
                # Use caller_function as the function name for user copy operations
                function_name = entry.get('caller_function', entry.get('function_name', 'Unknown'))
                copy_ops.append(UserCopyOperation(
                    function_name=function_name,
                    function_code=entry.get('function_code', ''),
                    preprocessed_code=entry.get('preprocessed_code', ''),
                    preprocessed_file_path=entry.get('preprocessed_file_code', ''),
                    operation=entry.get('operation', ''),
                    source=entry.get('source', ''),
                    destination=entry.get('destination', '')
                ))
            self._log_verbose(f"Processing {len(copy_ops)} user copy operation entries")
        
        return copy_ops
    
    def _parse_ioctl_operations(self, data: Dict[str, Any]) -> List[IOCTLOperation]:
        """Parse ioctl_operations section"""
        ioctl_ops = []
        
        if 'ioctl_operations' in data:
            self._log_verbose("Found ioctl_operations section")
            for entry in data['ioctl_operations']:
                ioctl_ops.append(IOCTLOperation(
                    function_name=entry.get('function_name', 'Unknown'),
                    function_code=entry.get('function_code', ''),
                    preprocessed_code=entry.get('preprocessed_code', ''),
                    preprocessed_file_path=entry.get('preprocessed_file_code', ''),
                    ioctl_cmd=entry.get('ioctl_cmd', ''),
                    handler=entry.get('handler', '')
                ))
            self._log_verbose(f"Processing {len(ioctl_ops)} ioctl operation entries")
        
        return ioctl_ops
