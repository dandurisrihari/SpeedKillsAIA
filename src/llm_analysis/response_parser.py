#!/usr/bin/env python3
"""
Response parser for OpenAI API responses
"""

import yaml
import json
import re
from typing import Optional

from .models import AnalysisResult


class ResponseParser:
    """Parser for OpenAI API responses"""
    
    def __init__(self, verbose: bool = False):
        self.verbose = verbose
    
    def _log_verbose(self, message: str):
        """Log verbose messages if verbose mode is enabled"""
        if self.verbose:
            print(f"[VERBOSE] {message}")
    
    def parse_response(self, response_text: str, function_name_override: Optional[str] = None) -> AnalysisResult:
        """Parse structured text response from OpenAI into AnalysisResult"""
        try:
            # First try JSON parsing if present
            json_start = response_text.find("```json")
            json_end = response_text.find("```", json_start + 7) if json_start != -1 else -1
            
            if json_start != -1 and json_end != -1:
                json_content = response_text[json_start + 7:json_end].strip()
                self._log_verbose("Attempting JSON parsing")
                data = json.loads(json_content)
                result = self._extract_analysis_result_from_json(data)
                # Override function name if provided
                if function_name_override:
                    result.function_name = function_name_override
                return result
            
            # Check for YAML code blocks first (priority over structured text)
            yaml_start = response_text.find("```yaml")
            yaml_end = response_text.find("```", yaml_start + 7) if yaml_start != -1 else -1
            
            if yaml_start != -1 and yaml_end != -1:
                yaml_content = response_text[yaml_start + 7:yaml_end].strip()
                self._log_verbose("Attempting YAML parsing with code blocks")
                
                # Clean up common YAML formatting issues from OpenAI responses
                yaml_content = self._clean_yaml_content(yaml_content)
                
                # Parse YAML
                data = yaml.safe_load(yaml_content)
                
                if not data or not isinstance(data, dict):
                    raise ValueError("Invalid YAML structure returned")
                
                result = self._extract_analysis_result(data)
                # Override function name if provided
                if function_name_override:
                    result.function_name = function_name_override
                return result
            
            # Try structured text parsing for simple formats
            if "Function/Code_Block_Name:" in response_text:
                self._log_verbose("Attempting structured text parsing")
                result = self._parse_structured_text(response_text)
                # Override function name if provided
                if function_name_override:
                    result.function_name = function_name_override
                return result
            
            # Fallback to YAML parsing without code blocks
            yaml_content = response_text
            self._log_verbose("Attempting YAML parsing without code blocks")
            
            # Clean up common YAML formatting issues from OpenAI responses
            yaml_content = self._clean_yaml_content(yaml_content)
            
            # Parse YAML
            data = yaml.safe_load(yaml_content)
            
            if not data or not isinstance(data, dict):
                raise ValueError("Invalid YAML structure returned")
            
            result = self._extract_analysis_result(data)
            # Override function name if provided
            if function_name_override:
                result.function_name = function_name_override
            return result
            
        except json.JSONDecodeError as e:
            self._log_verbose(f"JSON parsing error: {e}")
            result = self._fallback_parse(response_text)
            if function_name_override:
                result.function_name = function_name_override
            return result
        except yaml.YAMLError as e:
            self._log_verbose(f"YAML parsing error: {e}")
            result = self._fallback_parse(response_text)
            if function_name_override:
                result.function_name = function_name_override
            return result
        except Exception as e:
            self._log_verbose(f"Error parsing response: {e}")
            result = self._fallback_parse(response_text)
            if function_name_override:
                result.function_name = function_name_override
            return result
    
    def _clean_yaml_content(self, yaml_content: str) -> str:
        """Clean up common YAML formatting issues from OpenAI responses"""
        lines = yaml_content.split('\n')
        cleaned_lines = []
        in_reasoning_section = False
        
        for line in lines:
            stripped_line = line.strip()
            
            # Skip empty lines
            if not stripped_line:
                cleaned_lines.append(line)
                continue
            
            # Detect start of Reasoning section
            if stripped_line.startswith('Reasoning:'):
                in_reasoning_section = True
                cleaned_lines.append(line)
                continue
            
            # If we're in reasoning section and find a new field, we're out of reasoning
            if in_reasoning_section and ':' in stripped_line and not stripped_line.startswith('-'):
                in_reasoning_section = False
            
            # Clean markdown formatting that causes YAML parse errors
            cleaned_line = line
            if in_reasoning_section:
                # Remove markdown bold/italic formatting
                cleaned_line = re.sub(r'\*\*(.*?)\*\*', r'\1', cleaned_line)  # **bold** -> bold
                cleaned_line = re.sub(r'\*(.*?)\*', r'\1', cleaned_line)      # *italic* -> italic
                cleaned_line = re.sub(r'`(.*?)`', r'\1', cleaned_line)        # `code` -> code
                
                # Fix reasoning section formatting
                stripped_cleaned = cleaned_line.strip()
                if stripped_cleaned.startswith('- '):
                    # Get the base indentation from the Reasoning: line
                    content = stripped_cleaned[2:]  # Remove '- ' prefix
                    
                    # Escape content that might cause YAML issues
                    # Quote the entire content if it contains problematic characters
                    if any(char in content for char in [': ', '%', '&', '*', '!', '|', '>', '@', '`', '"', "'"]):
                        # Escape internal quotes and wrap in quotes
                        content = content.replace('"', '\\"')
                        content = f'"{content}"'
                    
                    # Use consistent indentation for YAML list items
                    cleaned_lines.append(f'  - {content}')
                elif stripped_cleaned and not stripped_cleaned.startswith(' '):
                    # This might be continuation of previous item - treat as quoted content
                    content = stripped_cleaned.replace('"', '\\"')
                    cleaned_lines.append(f'    "{content}"')
                else:
                    cleaned_lines.append(cleaned_line)
            else:
                cleaned_lines.append(cleaned_line)
        
        return '\n'.join(cleaned_lines)
    
    def _parse_structured_text(self, response_text: str) -> AnalysisResult:
        """Parse the structured text format that matches your required output"""
        lines = response_text.split('\n')
        
        # Initialize default values
        function_name = "Unknown"
        aia_relevant = 0
        kd_entry_point = 0
        msg_handling = 0
        message_structures = []
        smids = []
        reasoning = []
        
        # Track parsing state
        in_reasoning = False
        in_message_structures = False
        in_smids = False
        
        for line in lines:
            line = line.strip()
            
            # Skip empty lines
            if not line:
                continue
            
            # Parse function name
            if line.startswith("Function/Code_Block_Name:"):
                function_name = line.split(":", 1)[1].strip()
                in_message_structures = False
                in_smids = False
                in_reasoning = False
            
            # Parse scores
            elif line.startswith("AIARelevantFunction:"):
                try:
                    score_str = line.split(":", 1)[1].strip().rstrip('%')
                    aia_relevant = int(score_str)
                except (ValueError, IndexError):
                    pass
                in_message_structures = False
                in_smids = False
                in_reasoning = False
            
            elif line.startswith("Relevant_KD_Entry_Point:"):
                try:
                    score_str = line.split(":", 1)[1].strip().rstrip('%')
                    kd_entry_point = int(score_str)
                except (ValueError, IndexError):
                    pass
                in_message_structures = False
                in_smids = False
                in_reasoning = False
            
            elif line.startswith("Message_Structure_Handling:"):
                try:
                    score_str = line.split(":", 1)[1].strip().rstrip('%')
                    msg_handling = int(score_str)
                except (ValueError, IndexError):
                    pass
                in_message_structures = False
                in_smids = False
                in_reasoning = False
            
            # Parse Message Structures
            elif line.startswith("Message_Structures identified:"):
                msg_struct_str = line.split(":", 1)[1].strip()
                if msg_struct_str and msg_struct_str.lower() not in ["none identified", "none", ""]:
                    # Handle JSON-style list format like ["struct1", "struct2"]
                    if msg_struct_str.startswith('[') and msg_struct_str.endswith(']'):
                        try:
                            import ast
                            message_structures = ast.literal_eval(msg_struct_str)
                            if not isinstance(message_structures, list):
                                message_structures = [str(message_structures)]
                        except (ValueError, SyntaxError):
                            # Fallback to comma-separated parsing
                            message_structures = [s.strip() for s in msg_struct_str.split(",") if s.strip()]
                    else:
                        # Handle comma-separated message structures
                        message_structures = [s.strip() for s in msg_struct_str.split(",") if s.strip()]
                    in_message_structures = False
                else:
                    # Empty or none - expect YAML-style list items on following lines
                    in_message_structures = True
                in_smids = False
                in_reasoning = False
            
            # Parse SMIDs
            elif line.startswith("SMID's identified:"):
                smid_str = line.split(":", 1)[1].strip()
                if smid_str and smid_str.lower() not in ["none identified", "none", ""]:
                    # Handle JSON-style list format like ["SMID1", "SMID2"]
                    if smid_str.startswith('[') and smid_str.endswith(']'):
                        try:
                            import ast
                            smids = ast.literal_eval(smid_str)
                            if not isinstance(smids, list):
                                smids = [str(smids)]
                        except (ValueError, SyntaxError):
                            # Fallback to comma-separated parsing
                            smids = [s.strip() for s in smid_str.split(",") if s.strip()]
                    else:
                        # Handle comma-separated SMIDs
                        smids = [s.strip() for s in smid_str.split(",") if s.strip()]
                    in_smids = False
                else:
                    # Empty or none - expect YAML-style list items on following lines
                    in_smids = True
                in_message_structures = False
                in_reasoning = False
            
            # Parse reasoning section
            elif line.startswith("Reasoning:"):
                in_reasoning = True
                in_message_structures = False
                in_smids = False
            
            # Handle list items (YAML style with dashes)
            elif line.startswith("-") or line.startswith("•"):
                item = line[1:].strip()
                if in_reasoning:
                    reasoning.append(item)
                elif in_message_structures:
                    message_structures.append(item)
                elif in_smids:
                    smids.append(item)
            
            # Handle continuation lines or reset state
            elif in_reasoning and line and reasoning:
                # Continuation of previous reasoning point
                reasoning[-1] += " " + line
            elif line.startswith(" ") and (in_message_structures or in_smids):
                # Indented line might be a list item without dash
                item = line.strip()
                if in_message_structures:
                    message_structures.append(item)
                elif in_smids:
                    smids.append(item)
            else:
                # Reset states when we encounter a new field
                in_reasoning = False
                in_message_structures = False
                in_smids = False
        
        return AnalysisResult(
            function_name=function_name,
            aia_relevant_function=aia_relevant,
            relevant_kd_entry_point=kd_entry_point,
            message_structure_handling=msg_handling,
            message_structures_identified=message_structures,
            smids_identified=smids,
            reasoning=reasoning
        )
    
    def _extract_analysis_result_from_json(self, data: dict) -> AnalysisResult:
        """Extract AnalysisResult from parsed JSON data"""
        # Extract values with defaults - JSON format is cleaner
        function_name = data.get('function_name', 'Unknown')
        
        # Handle values (should already be integers in JSON)
        aia_relevant = int(data.get('aia_relevant_function', 0))
        kd_entry_point = int(data.get('relevant_kd_entry_point', 0))
        msg_handling = int(data.get('message_structure_handling', 0))
        
        # Handle Message Structures
        message_structures = data.get('message_structures_identified', [])
        if isinstance(message_structures, str):
            message_structures = [message_structures] if message_structures else []
        elif message_structures is None:
            message_structures = []
        
        # Handle SMIDs
        smids = data.get('smids_identified', [])
        if isinstance(smids, str):
            smids = [smids] if smids else []
        elif smids is None:
            smids = []
        
        # Handle reasoning
        reasoning = data.get('reasoning', [])
        if isinstance(reasoning, str):
            reasoning = [reasoning]
        elif reasoning is None:
            reasoning = []
        
        return AnalysisResult(
            function_name=function_name,
            aia_relevant_function=aia_relevant,
            relevant_kd_entry_point=kd_entry_point,
            message_structure_handling=msg_handling,
            message_structures_identified=message_structures,
            smids_identified=smids,
            reasoning=reasoning
        )
    
    def _extract_analysis_result(self, data: dict) -> AnalysisResult:
        """Extract AnalysisResult from parsed YAML data"""
        # Extract values with defaults
        function_name = data.get('Function/Code_Block_Name', 'Unknown')
        
        # Handle percentage values (remove % if present and convert to int)
        def parse_percentage(value):
            if isinstance(value, str):
                value = value.strip().rstrip('%')
            try:
                return int(float(value))
            except (ValueError, TypeError):
                return 0
        
        aia_relevant = parse_percentage(data.get('AIARelevantFunction', 0))
        kd_entry_point = parse_percentage(data.get('Relevant_KD_Entry_Point', 0))
        msg_handling = parse_percentage(data.get('Message_Structure_Handling', 0))
        
        # Handle Message Structures
        message_structures = data.get("Message_Structures identified", [])
        if isinstance(message_structures, str):
            message_structures = [message_structures] if message_structures else []
        elif message_structures is None:
            message_structures = []
        
        # Handle SMIDs
        smids = data.get("SMID's identified", [])
        if isinstance(smids, str):
            smids = [smids] if smids else []
        elif smids is None:
            smids = []
        
        # Handle reasoning
        reasoning = data.get('Reasoning', [])
        if isinstance(reasoning, str):
            reasoning = [reasoning]
        elif isinstance(reasoning, list):
            # Handle mixed list content (strings and dicts)
            processed_reasoning = []
            for item in reasoning:
                if isinstance(item, str):
                    processed_reasoning.append(item)
                elif isinstance(item, dict):
                    # Convert dict to string representation
                    processed_reasoning.append(str(item))
                else:
                    processed_reasoning.append(str(item))
            reasoning = processed_reasoning
        elif reasoning is None:
            reasoning = []
        
        return AnalysisResult(
            function_name=function_name,
            aia_relevant_function=aia_relevant,
            relevant_kd_entry_point=kd_entry_point,
            message_structure_handling=msg_handling,
            message_structures_identified=message_structures,
            smids_identified=smids,
            reasoning=reasoning
        )
    
    def _fallback_parse(self, response_text: str) -> AnalysisResult:
        """Fallback parsing when YAML parsing fails"""
        # Try to extract basic information using regex
        function_name = "Parse Error"
        aia_relevant = 0
        kd_entry_point = 0
        msg_handling = 0
        message_structures = []
        smids = []
        reasoning = []
        
        # Try to extract function name
        func_patterns = [
            r'Function[/_]Code[/_]Block[/_]Name:\s*(.+)',
            r'Function:\s*(.+)',
            r'analyzing function[:\s]+(\w+)',
            r'function\s+(\w+)\s*\('
        ]
        for pattern in func_patterns:
            func_match = re.search(pattern, response_text, re.IGNORECASE)
            if func_match:
                function_name = func_match.group(1).strip()
                break
        
        # Try to extract percentages with multiple patterns
        aia_patterns = [
            r'AIARelevantFunction[:\s]*(\d+)%?',
            r'AIA[:\s]*(\d+)%?',
            r'AI Accelerator[:\s]*(\d+)%?'
        ]
        for pattern in aia_patterns:
            aia_match = re.search(pattern, response_text, re.IGNORECASE)
            if aia_match:
                aia_relevant = int(aia_match.group(1))
                break
        
        kd_patterns = [
            r'Relevant[/_]KD[/_]Entry[/_]Point[:\s]*(\d+)%?',
            r'Entry[/_]Point[:\s]*(\d+)%?',
            r'KD Entry[:\s]*(\d+)%?'
        ]
        for pattern in kd_patterns:
            kd_match = re.search(pattern, response_text, re.IGNORECASE)
            if kd_match:
                kd_entry_point = int(kd_match.group(1))
                break
        
        msg_patterns = [
            r'Message[/_]Structure[/_]Handling[:\s]*(\d+)%?',
            r'Message[:\s]*(\d+)%?',
            r'Structure Handling[:\s]*(\d+)%?'
        ]
        for pattern in msg_patterns:
            msg_match = re.search(pattern, response_text, re.IGNORECASE)
            if msg_match:
                msg_handling = int(msg_match.group(1))
                break
        
        # Try to extract reasoning points
        reasoning_patterns = [
            r'[-•]\s*(.+?)(?=[-•]|\n\n|\Z)',  # Bullet points
            r'(\d+\.)\s*(.+?)(?=\d+\.|\n\n|\Z)',  # Numbered lists
        ]
        for pattern in reasoning_patterns:
            reasoning_matches = re.findall(pattern, response_text, re.DOTALL)
            if reasoning_matches:
                reasoning = [match[1].strip() if isinstance(match, tuple) else match.strip() 
                           for match in reasoning_matches]
                break
        
        # If no reasoning found, add the parsing error info
        if not reasoning:
            reasoning = [f"YAML parsing failed. Response contained: {response_text[:100]}..."]
        
        return AnalysisResult(
            function_name=function_name,
            aia_relevant_function=aia_relevant,
            relevant_kd_entry_point=kd_entry_point,
            message_structure_handling=msg_handling,
            message_structures_identified=message_structures,
            smids_identified=smids,
            reasoning=reasoning
        )
