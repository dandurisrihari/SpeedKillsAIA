#!/usr/bin/env python3
"""
LLM Tool Calling Framework for Code Analysis

This module provides tools for LLMs to request additional code information
during analysis, including function source code and struct definitions.
"""

import json
import logging
import os
import re
from dataclasses import dataclass, asdict
from pathlib import Path
from typing import Dict, List, Optional, Any, Union, Tuple, Callable
from enum import Enum
import tiktoken  # For token counting

try:
    import tiktoken
    TIKTOKEN_AVAILABLE = True
except ImportError:
    TIKTOKEN_AVAILABLE = False
    logging.warning("tiktoken not available, using character-based token estimation")

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
    logging.warning("LangChain not available, using custom tool implementation")


class RequestType(Enum):
    """Types of code information requests"""
    FUNCTION = "function"
    STRUCT = "struct"
    TYPEDEF = "typedef"
    MACRO = "macro"
    INCLUDE = "include"


@dataclass
class CodeRequest:
    """Represents a request for code information"""
    type: RequestType
    name: str
    file_path: Optional[str] = None
    line_number: Optional[int] = None
    context: Optional[str] = None
    depth: int = 0
    request_id: str = ""


@dataclass
class CodeResponse:
    """Represents the response to a code request"""
    request: CodeRequest
    status: str  # "success", "not_found", "error", "too_large", "user_confirmation_required"
    content: Optional[str] = None
    location: Optional[Dict[str, Any]] = None
    error: Optional[str] = None
    related_items: List[str] = None
    token_count: Optional[int] = None
    size_warning: bool = False
    truncated: bool = False
    
    def __post_init__(self):
        if self.related_items is None:
            self.related_items = []
        
        # Calculate token count if content is available
        if self.content and not self.token_count:
            self.token_count = estimate_token_count(self.content)


def estimate_token_count(text: str, model: str = "gpt-3.5-turbo") -> int:
    """Estimate token count for given text"""
    if not text:
        return 0
    
    if TIKTOKEN_AVAILABLE:
        try:
            encoding = tiktoken.encoding_for_model(model)
            return len(encoding.encode(text))
        except Exception:
            # Fallback if model not found
            encoding = tiktoken.get_encoding("cl100k_base")
            return len(encoding.encode(text))
    else:
        # Rough estimation: ~4 characters per token
        return len(text) // 4


def should_request_user_confirmation(response: CodeResponse, max_tokens: int = 4000) -> bool:
    """Check if user confirmation should be requested due to size"""
    if not response.content or response.status != "success":
        return False
    
    # Check token count
    if response.token_count and response.token_count > max_tokens:
        return True
    
    # Check character count (fallback)
    if len(response.content) > max_tokens * 4:  # Rough estimation
        return True
    
    return False


def should_request_confirmation_for_content(content_length: int, estimated_tokens: int, 
                                           model_id: str = "gpt-3.5-turbo") -> bool:
    """Check if user confirmation should be requested for raw content"""
    # Model-specific thresholds
    token_limits = {
        "gpt-3.5-turbo": 3000,   # Conservative limit to leave room for response
        "gpt-4": 6000,
        "gpt-4-turbo-preview": 100000
    }
    
    max_tokens = token_limits.get(model_id, 3000)
    
    # Check estimated tokens
    if estimated_tokens > max_tokens:
        return True
    
    # Check character count (fallback) - roughly 4 chars per token
    if content_length > max_tokens * 4:
        return True
    
    return False


def truncate_content(content: str, max_tokens: int = 2000) -> Tuple[str, bool]:
    """Truncate content to fit within token limits"""
    if not content:
        return content, False
    
    if TIKTOKEN_AVAILABLE:
        try:
            encoding = tiktoken.encoding_for_model("gpt-3.5-turbo")
            tokens = encoding.encode(content)
            if len(tokens) <= max_tokens:
                return content, False
            
            # Truncate tokens and decode back
            truncated_tokens = tokens[:max_tokens]
            truncated_content = encoding.decode(truncated_tokens)
            return truncated_content + "\n\n... [TRUNCATED]", True
        except Exception:
            pass
    
    # Character-based fallback
    max_chars = max_tokens * 4
    if len(content) <= max_chars:
        return content, False
    
    return content[:max_chars] + "\n\n... [TRUNCATED]", True


class SourceCodeExtractor:
    """Enhanced source code extractor with tree-sitter support"""
    
    def __init__(self, source_root: str, use_preprocessed: bool = True):
        self.source_root = Path(source_root)
        self.use_preprocessed = use_preprocessed
        self.parser = None
        self.language = None
        
        if TREE_SITTER_AVAILABLE:
            self._init_tree_sitter()
    
    def _init_tree_sitter(self):
        """Initialize tree-sitter parser for C"""
        try:
            self.language = tree_sitter.Language(tsc.language(), "c")
            self.parser = tree_sitter.Parser()
            # Use newer tree-sitter API
            self.parser.language = self.language
        except Exception as e:
            logging.warning(f"Failed to initialize tree-sitter: {e}")
            self.parser = None
    
    def extract_function(self, function_name: str, file_path: Optional[str] = None, 
                        line_number: Optional[int] = None) -> CodeResponse:
        """Extract function source code"""
        request = CodeRequest(
            type=RequestType.FUNCTION,
            name=function_name,
            file_path=file_path,
            line_number=line_number
        )
        
        # Find the function in source files
        candidates = self._find_function_candidates(function_name, file_path)
        
        if not candidates:
            return CodeResponse(
                request=request,
                status="not_found",
                error=f"Function '{function_name}' not found"
            )
        
        # Try to extract using tree-sitter first
        for candidate_file, candidate_line in candidates:
            if self.parser:
                result = self._extract_function_tree_sitter(
                    function_name, candidate_file, candidate_line
                )
                if result.status == "success":
                    return result
            
            # Fallback to text-based extraction
            result = self._extract_function_text_based(
                function_name, candidate_file, candidate_line
            )
            if result.status == "success":
                return result
        
        return CodeResponse(
            request=request,
            status="error",
            error=f"Failed to extract function '{function_name}'"
        )
    
    def extract_struct(self, struct_name: str, file_path: Optional[str] = None) -> CodeResponse:
        """Extract struct definition from .h or .i files"""
        request = CodeRequest(
            type=RequestType.STRUCT,
            name=struct_name,
            file_path=file_path
        )
        
        # Look for struct in .h and .i files
        candidates = self._find_struct_candidates(struct_name, file_path)
        
        for candidate_file in candidates:
            if self.parser:
                result = self._extract_struct_tree_sitter(struct_name, candidate_file)
                if result.status == "success":
                    return result
            
            # Fallback to text-based extraction
            result = self._extract_struct_text_based(struct_name, candidate_file)
            if result.status == "success":
                return result
        
        return CodeResponse(
            request=request,
            status="not_found",
            error=f"Struct '{struct_name}' not found"
        )
    
    def _find_function_candidates(self, function_name: str, 
                                 hint_file: Optional[str] = None) -> List[Tuple[Path, Optional[int]]]:
        """Find potential files containing the function"""
        candidates = []
        
        # If we have a hint file, check it first
        if hint_file:
            hint_path = self._resolve_file_path(hint_file)
            if hint_path and hint_path.exists():
                candidates.append((hint_path, None))
        
        # Search in all .c files
        for c_file in self.source_root.rglob("*.c"):
            if hint_file and c_file == hint_path:
                continue  # Already added
            
            try:
                with open(c_file, 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
                    if re.search(rf'\b{re.escape(function_name)}\s*\(', content):
                        candidates.append((c_file, None))
            except Exception:
                continue
        
        return candidates
    
    def _find_struct_candidates(self, struct_name: str, 
                               hint_file: Optional[str] = None) -> List[Path]:
        """Find potential files containing the struct"""
        candidates = []
        search_patterns = [f"*.h", f"*.i"]
        
        if self.use_preprocessed:
            search_patterns = [f"*.i", f"*.h"]  # Prefer .i files
        
        for pattern in search_patterns:
            for header_file in self.source_root.rglob(pattern):
                try:
                    with open(header_file, 'r', encoding='utf-8', errors='ignore') as f:
                        content = f.read()
                        if re.search(rf'\bstruct\s+{re.escape(struct_name)}\b', content):
                            candidates.append(header_file)
                            break  # Found in this pattern, prefer it
                except Exception:
                    continue
        
        return candidates
    
    def _extract_function_tree_sitter(self, function_name: str, file_path: Path, 
                                     line_hint: Optional[int] = None) -> CodeResponse:
        """Extract function using tree-sitter"""
        request = CodeRequest(
            type=RequestType.FUNCTION,
            name=function_name,
            file_path=str(file_path)
        )
        
        try:
            with open(file_path, 'rb') as f:
                source_code = f.read()
            
            tree = self.parser.parse(source_code)
            
            # Find function definition
            function_node = self._find_function_node(tree.root_node, function_name, source_code)
            
            if function_node:
                start_line = function_node.start_point[0] + 1
                end_line = function_node.end_point[0] + 1
                
                # Extract the function text
                lines = source_code.decode('utf-8', errors='ignore').split('\n')
                function_code = '\n'.join(lines[function_node.start_point[0]:function_node.end_point[0] + 1])
                
                return CodeResponse(
                    request=request,
                    status="success",
                    content=function_code,
                    location={
                        "file": str(file_path),
                        "start_line": start_line,
                        "end_line": end_line
                    }
                )
        except Exception as e:
            logging.error(f"Tree-sitter extraction failed: {e}")
        
        return CodeResponse(
            request=request,
            status="error",
            error="Tree-sitter extraction failed"
        )
    
    def _extract_struct_tree_sitter(self, struct_name: str, file_path: Path) -> CodeResponse:
        """Extract struct using tree-sitter"""
        request = CodeRequest(
            type=RequestType.STRUCT,
            name=struct_name,
            file_path=str(file_path)
        )
        
        try:
            with open(file_path, 'rb') as f:
                source_code = f.read()
            
            tree = self.parser.parse(source_code)
            
            # Find struct definition
            struct_node = self._find_struct_node(tree.root_node, struct_name, source_code)
            
            if struct_node:
                start_line = struct_node.start_point[0] + 1
                end_line = struct_node.end_point[0] + 1
                
                # Extract the struct text
                lines = source_code.decode('utf-8', errors='ignore').split('\n')
                struct_code = '\n'.join(lines[struct_node.start_point[0]:struct_node.end_point[0] + 1])
                
                return CodeResponse(
                    request=request,
                    status="success",
                    content=struct_code,
                    location={
                        "file": str(file_path),
                        "start_line": start_line,
                        "end_line": end_line
                    }
                )
        except Exception as e:
            logging.error(f"Tree-sitter struct extraction failed: {e}")
        
        return CodeResponse(
            request=request,
            status="error",
            error="Tree-sitter struct extraction failed"
        )
    
    def _find_function_node(self, node, function_name: str, source_code: bytes):
        """Find function definition node in tree"""
        if node.type == "function_definition":
            # Check if this is the function we're looking for
            declarator = self._find_node_by_type(node, "function_declarator")
            if declarator:
                identifier = self._find_node_by_type(declarator, "identifier")
                if identifier:
                    name = source_code[identifier.start_byte:identifier.end_byte].decode('utf-8')
                    if name == function_name:
                        return node
        
        for child in node.children:
            result = self._find_function_node(child, function_name, source_code)
            if result:
                return result
        
        return None
    
    def _find_struct_node(self, node, struct_name: str, source_code: bytes):
        """Find struct definition node in tree"""
        if node.type == "struct_specifier":
            # Check if this is the struct we're looking for
            for child in node.children:
                if child.type == "type_identifier":
                    name = source_code[child.start_byte:child.end_byte].decode('utf-8')
                    if name == struct_name:
                        return node
        
        for child in node.children:
            result = self._find_struct_node(child, struct_name, source_code)
            if result:
                return result
        
        return None
    
    def _find_node_by_type(self, node, node_type: str):
        """Find first child node of specified type"""
        if node.type == node_type:
            return node
        
        for child in node.children:
            result = self._find_node_by_type(child, node_type)
            if result:
                return result
        
        return None
    
    def _extract_function_text_based(self, function_name: str, file_path: Path, 
                                   line_hint: Optional[int] = None) -> CodeResponse:
        """Extract function using text-based parsing"""
        request = CodeRequest(
            type=RequestType.FUNCTION,
            name=function_name,
            file_path=str(file_path)
        )
        
        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                lines = f.readlines()
            
            # Find function definition
            start_line = None
            for i, line in enumerate(lines):
                if re.search(rf'\b{re.escape(function_name)}\s*\(', line) and '{' in line:
                    start_line = i
                    break
                elif re.search(rf'\b{re.escape(function_name)}\s*\(', line):
                    # Check next few lines for opening brace
                    for j in range(i + 1, min(i + 5, len(lines))):
                        if '{' in lines[j]:
                            start_line = i
                            break
                    if start_line is not None:
                        break
            
            if start_line is None:
                return CodeResponse(
                    request=request,
                    status="not_found",
                    error=f"Function definition for '{function_name}' not found"
                )
            
            # Find end of function (matching braces)
            brace_count = 0
            end_line = None
            
            for i in range(start_line, len(lines)):
                line = lines[i]
                brace_count += line.count('{') - line.count('}')
                if brace_count == 0 and '{' in ''.join(lines[start_line:i+1]):
                    end_line = i
                    break
            
            if end_line is None:
                return CodeResponse(
                    request=request,
                    status="error",
                    error=f"Could not find end of function '{function_name}'"
                )
            
            function_code = ''.join(lines[start_line:end_line + 1])
            
            return CodeResponse(
                request=request,
                status="success",
                content=function_code.strip(),
                location={
                    "file": str(file_path),
                    "start_line": start_line + 1,
                    "end_line": end_line + 1
                }
            )
            
        except Exception as e:
            return CodeResponse(
                request=request,
                status="error",
                error=f"Failed to extract function: {e}"
            )
    
    def _extract_struct_text_based(self, struct_name: str, file_path: Path) -> CodeResponse:
        """Extract struct using text-based parsing"""
        request = CodeRequest(
            type=RequestType.STRUCT,
            name=struct_name,
            file_path=str(file_path)
        )
        
        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
            
            # Pattern to match struct definition
            pattern = rf'struct\s+{re.escape(struct_name)}\s*\{{[^}}]*\}}'
            match = re.search(pattern, content, re.DOTALL)
            
            if match:
                struct_code = match.group(0)
                start_pos = match.start()
                
                # Calculate line numbers
                lines_before = content[:start_pos].count('\n')
                lines_in_struct = struct_code.count('\n')
                
                return CodeResponse(
                    request=request,
                    status="success",
                    content=struct_code,
                    location={
                        "file": str(file_path),
                        "start_line": lines_before + 1,
                        "end_line": lines_before + lines_in_struct + 1
                    }
                )
            
            return CodeResponse(
                request=request,
                status="not_found",
                error=f"Struct '{struct_name}' not found in {file_path}"
            )
            
        except Exception as e:
            return CodeResponse(
                request=request,
                status="error",
                error=f"Failed to extract struct: {e}"
            )
    
    def _resolve_file_path(self, file_path: str) -> Optional[Path]:
        """Resolve relative file path to absolute path"""
        if os.path.isabs(file_path):
            return Path(file_path)
        
        # Try relative to source root
        abs_path = self.source_root / file_path
        if abs_path.exists():
            return abs_path
        
        # Try finding the file by name
        file_name = os.path.basename(file_path)
        for found_file in self.source_root.rglob(file_name):
            return found_file
        
        return None


class LLMToolCaller:
    """Main class for handling LLM tool calling requests"""
    
    def __init__(self, source_root: str, max_depth: int = 3, 
                 use_preprocessed: bool = True, max_tokens: int = 4000,
                 user_confirmation_callback: Optional[Callable] = None):
        self.source_root = source_root
        self.max_depth = max_depth
        self.max_tokens = max_tokens
        self.user_confirmation_callback = user_confirmation_callback
        self.extractor = SourceCodeExtractor(source_root, use_preprocessed)
        self.request_log: List[Dict] = []
        self.response_log: List[Dict] = []
    
    def handle_request(self, request_data: Dict[str, Any]) -> Dict[str, Any]:
        """Handle a tool calling request from LLM"""
        try:
            # Parse request
            request = CodeRequest(
                type=RequestType(request_data.get('type', 'function')),
                name=request_data['name'],
                file_path=request_data.get('file_path'),
                line_number=request_data.get('line_number'),
                context=request_data.get('context'),
                depth=request_data.get('depth', 0),
                request_id=request_data.get('request_id', '')
            )
            
            # Check depth limit
            if request.depth >= self.max_depth:
                response = CodeResponse(
                    request=request,
                    status="error",
                    error=f"Maximum depth ({self.max_depth}) exceeded"
                )
            elif request.type == RequestType.FUNCTION:
                response = self._handle_function_request(request)
            elif request.type == RequestType.STRUCT:
                response = self._handle_struct_request(request)
            else:
                response = CodeResponse(
                    request=request,
                    status="error",
                    error=f"Request type '{request.type.value}' not supported"
                )
            
            # Check if user confirmation is needed
            if should_request_user_confirmation(response, self.max_tokens):
                if self.user_confirmation_callback:
                    should_continue = self.user_confirmation_callback(request, response)
                    if not should_continue:
                        response = CodeResponse(
                            request=request,
                            status="user_cancelled",
                            error="User cancelled due to size concerns",
                            token_count=response.token_count
                        )
                else:
                    # Mark as requiring confirmation
                    response.status = "user_confirmation_required"
                    response.size_warning = True
            
            # Log the request and response
            request_dict = asdict(request)
            response_dict = asdict(response)
            
            self.request_log.append(request_dict)
            self.response_log.append(response_dict)
            
            return response_dict
            
        except Exception as e:
            error_response = {
                "status": "error",
                "error": f"Failed to process request: {e}",
                "request": request_data
            }
            self.response_log.append(error_response)
            return error_response
    
    def _handle_function_request(self, request: CodeRequest) -> CodeResponse:
        """Handle function extraction request with size management"""
        response = self.extractor.extract_function(
            request.name, request.file_path, request.line_number
        )
        
        # Check size and potentially truncate
        if response.content and response.status == "success":
            if should_request_user_confirmation(response, self.max_tokens):
                response.size_warning = True
                
                # Auto-truncate if no user callback
                if not self.user_confirmation_callback:
                    truncated_content, was_truncated = truncate_content(
                        response.content, self.max_tokens // 2
                    )
                    response.content = truncated_content
                    response.truncated = was_truncated
                    response.token_count = estimate_token_count(response.content)
        
        return response
    
    def _handle_struct_request(self, request: CodeRequest) -> CodeResponse:
        """Handle struct extraction request with size management"""
        response = self.extractor.extract_struct(request.name, request.file_path)
        
        # Check size and potentially truncate
        if response.content and response.status == "success":
            if should_request_user_confirmation(response, self.max_tokens):
                response.size_warning = True
                
                # Auto-truncate if no user callback
                if not self.user_confirmation_callback:
                    truncated_content, was_truncated = truncate_content(
                        response.content, self.max_tokens // 2
                    )
                    response.content = truncated_content
                    response.truncated = was_truncated
                    response.token_count = estimate_token_count(response.content)
        
        return response
    
    def get_request_history(self) -> List[Dict[str, Any]]:
        """Get the history of requests and responses"""
        history = []
        for req, resp in zip(self.request_log, self.response_log):
            history.append({
                "request": req,
                "response": resp,
                "timestamp": resp.get("timestamp", "")
            })
        return history
    
    def clear_history(self):
        """Clear request/response history"""
        self.request_log.clear()
        self.response_log.clear()
    
    def get_request_stats(self) -> Dict[str, Any]:
        """Get statistics about requests and responses"""
        total_requests = len(self.request_log)
        successful_requests = sum(1 for r in self.response_log if r.get("status") == "success")
        size_warnings = sum(1 for r in self.response_log if r.get("size_warning", False))
        truncated_responses = sum(1 for r in self.response_log if r.get("truncated", False))
        
        total_tokens = sum(r.get("token_count", 0) for r in self.response_log if r.get("token_count"))
        
        return {
            "total_requests": total_requests,
            "successful_requests": successful_requests,
            "size_warnings": size_warnings,
            "truncated_responses": truncated_responses,
            "total_tokens": total_tokens,
            "average_tokens": total_tokens / max(successful_requests, 1)
        }


# LangChain tool integration (if available)
if LANGCHAIN_AVAILABLE:
    class CodeExtractionTool(BaseTool):
        """LangChain tool for code extraction"""
        
        name: str = "code_extractor"
        description: str = """
        Extract source code for functions or struct definitions.
        Input should be a JSON string with:
        - type: "function" or "struct"
        - name: name of the function/struct
        - file_path: optional file path hint
        - line_number: optional line number hint
        """
        
        def __init__(self, tool_caller: LLMToolCaller, **kwargs):
            super().__init__(**kwargs)
            self.tool_caller = tool_caller
        
        def _run(self, query: str) -> str:
            try:
                request_data = json.loads(query)
                response = self.tool_caller.handle_request(request_data)
                return json.dumps(response, indent=2)
            except Exception as e:
                return f"Error: {e}"
        
        async def _arun(self, query: str) -> str:
            return self._run(query)


def create_llm_tools(source_root: str, max_depth: int = 3, 
                    use_preprocessed: bool = True, max_tokens: int = 4000,
                    user_confirmation_callback: Optional[Callable] = None) -> Tuple[LLMToolCaller, Optional[List]]:
    """Create LLM tools for code extraction"""
    tool_caller = LLMToolCaller(source_root, max_depth, use_preprocessed, max_tokens, user_confirmation_callback)
    
    langchain_tools = None
    if LANGCHAIN_AVAILABLE:
        code_tool = CodeExtractionTool(tool_caller)
        langchain_tools = [code_tool]
    
    return tool_caller, langchain_tools