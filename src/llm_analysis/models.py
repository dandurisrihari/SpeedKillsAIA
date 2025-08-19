#!/usr/bin/env python3
"""
Core models and data structures for LLM analysis
"""

from dataclasses import dataclass
from collections import OrderedDict
from typing import List
from enum import Enum


class GPTModel(Enum):
    """Supported GPT models"""
    GPT_4O_MINI = "gpt-4o-mini"
    GPT_4O = "gpt-4o"
    GPT_4 = "gpt-4"
    GPT_4_TURBO = "gpt-4-turbo"
    GPT_3_5_TURBO = "gpt-3.5-turbo"
    
    @classmethod
    def all_models(cls) -> List[str]:
        return [model.value for model in cls]


@dataclass
class AnalysisResult:
    """Result of function analysis"""
    function_name: str
    aia_relevant_function: int
    relevant_kd_entry_point: int
    message_structure_handling: int
    message_structures_identified: List[str]
    smids_identified: List[str]
    reasoning: List[str]
    
    def to_dict(self) -> OrderedDict:
        """Convert to ordered dictionary for YAML export"""
        return OrderedDict([
            ('Function/Code_Block_Name', self.function_name),
            ('AIARelevantFunction', self.aia_relevant_function),
            ('Relevant_KD_Entry_Point', self.relevant_kd_entry_point),
            ('Message_Structure_Handling', self.message_structure_handling),
            ('Message_Structures_identified', self.message_structures_identified),
            ('SMIDs_identified', self.smids_identified),
            ('Reasoning', self.reasoning)
        ])


@dataclass
class FunctionEntry:
    """Represents a function entry from JSON"""
    function_name: str
    file_path: str
    function_code: str
    preprocessed_code: str = ""
    preprocessed_file_path: str = ""  # Path to .i file for struct analysis
    line_number: int = 0
    
    def get_code(self) -> str:
        """Get the best available code (prefer function_code over preprocessed_code)"""
        return self.function_code if self.function_code else self.preprocessed_code


@dataclass
class DMAOperation:
    """Represents a DMA operation from JSON"""
    function_name: str
    function_code: str
    stack_trace: str = ""
    preprocessed_code: str = ""
    preprocessed_file_path: str = ""  # Path to .i file for struct analysis
    
    def get_code(self) -> str:
        """Get the best available code"""
        return self.function_code if self.function_code else self.preprocessed_code


@dataclass
class UserCopyOperation:
    """Represents a user copy operation from JSON"""
    function_name: str
    function_code: str
    preprocessed_code: str = ""
    preprocessed_file_path: str = ""  # Path to .i file for struct analysis
    operation: str = ""
    source: str = ""
    destination: str = ""
    
    def get_code(self) -> str:
        """Get the best available code"""
        return self.function_code if self.function_code else self.preprocessed_code


@dataclass
class IOCTLOperation:
    """Represents an IOCTL operation from JSON"""
    function_name: str
    function_code: str
    preprocessed_code: str = ""
    preprocessed_file_path: str = ""  # Path to .i file for struct analysis
    ioctl_cmd: str = ""
    handler: str = ""
    
    def get_code(self) -> str:
        """Get the best available code"""
        return self.function_code if self.function_code else self.preprocessed_code
