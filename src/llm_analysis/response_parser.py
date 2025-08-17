#!/usr/bin/env python3
"""
Response parser for OpenAI API responses
"""

import yaml
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
    
    def parse_response(self, response_text: str) -> AnalysisResult:
        """Parse YAML response from OpenAI into AnalysisResult"""
        try:
            # Extract YAML content from response
            yaml_start = response_text.find("```yaml")
            yaml_end = response_text.find("```", yaml_start + 7)
            
            if yaml_start == -1 or yaml_end == -1:
                # Try without code blocks
                yaml_content = response_text
            else:
                yaml_content = response_text[yaml_start + 7:yaml_end].strip()
            
            # Clean up common YAML formatting issues from OpenAI responses
            yaml_content = self._clean_yaml_content(yaml_content)
            
            # Parse YAML
            data = yaml.safe_load(yaml_content)
            
            if not data or not isinstance(data, dict):
                raise ValueError("Invalid YAML structure returned")
            
            return self._extract_analysis_result(data)
            
        except yaml.YAMLError as e:
            self._log_verbose(f"YAML parsing error: {e}")
            # Try to extract basic information even if YAML is malformed
            return self._fallback_parse(response_text)
        except Exception as e:
            self._log_verbose(f"Error parsing YAML response: {e}")
            return self._fallback_parse(response_text)
    
    def _clean_yaml_content(self, yaml_content: str) -> str:
        """Clean up common YAML formatting issues from OpenAI responses"""
        lines = yaml_content.split('\n')
        cleaned_lines = []
        in_reasoning_section = False
        
        for line in lines:
            stripped_line = line.strip()
            
            # Detect start of Reasoning section
            if stripped_line.startswith('Reasoning:'):
                in_reasoning_section = True
                cleaned_lines.append(line)
                continue
            
            # If we're in reasoning section and find a new field, we're out of reasoning
            if in_reasoning_section and ':' in stripped_line and not stripped_line.startswith('-'):
                in_reasoning_section = False
            
            # Fix reasoning section formatting
            if in_reasoning_section and stripped_line.startswith('- '):
                # Convert '- text' to proper YAML list item
                indent = len(line) - len(line.lstrip())
                cleaned_lines.append(' ' * (indent + 2) + stripped_line)
            else:
                cleaned_lines.append(line)
        
        return '\n'.join(cleaned_lines)
    
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
        smids = []
        reasoning = [f"Failed to parse YAML response. Raw response: {response_text[:200]}..."]
        
        # Try to extract function name
        func_match = re.search(r'Function[/_]Code[/_]Block[/_]Name:\s*(.+)', response_text)
        if func_match:
            function_name = func_match.group(1).strip()
        
        # Try to extract percentages
        aia_match = re.search(r'AIARelevantFunction:\s*(\d+)', response_text)
        if aia_match:
            aia_relevant = int(aia_match.group(1))
        
        kd_match = re.search(r'Relevant[/_]KD[/_]Entry[/_]Point:\s*(\d+)', response_text)
        if kd_match:
            kd_entry_point = int(kd_match.group(1))
        
        msg_match = re.search(r'Message[/_]Structure[/_]Handling:\s*(\d+)', response_text)
        if msg_match:
            msg_handling = int(msg_match.group(1))
        
        return AnalysisResult(
            function_name=function_name,
            aia_relevant_function=aia_relevant,
            relevant_kd_entry_point=kd_entry_point,
            message_structure_handling=msg_handling,
            smids_identified=smids,
            reasoning=reasoning
        )
