#!/usr/bin/env python3
"""
Prompt templates for OpenAI analysis
"""

from typing import Optional


def create_analysis_prompt(function_code: str, stack_trace: Optional[str] = None, operation_type: str = "") -> str:
    """Create the analysis prompt for OpenAI"""
    
    base_prompt = """You are an expert in Linux Kernel Driver (KD) development with specialization in AI Accelerator (AIA) integration. Analyze the given kernel source code and assign confidence scores (0-100%) across three categories.

1. AIARelevantFunction (PRIMARY FOCUS)
Assign a confidence score for whether the given function or code block is involved in sharing shared memory (SMem) with an AI Accelerator (AIA). Such functions often:
- Pin user pages to memory (get_user_pages, pin_user_pages)
- Obtain physical or DMA addresses of user pages
- Program these addresses into:
  - AIA device page tables (for memory mapping inside the AIA)
  - AIA MMIO (Memory Mapped I/O) registers to notify AIA of accessible memory
- Manage DMA buffers for communication between CPU and AIA

These functions are typically critical for giving the AIA access to host memory regions.

2. Relevant KD Entry Point (SECONDARY FOCUS)
Assign a confidence score if the code block represents an entry point from user space to kernel, commonly through ioctl() functions. These:
- Act as dispatch points in a switch-case over ioctl codes
- Handle user commands and trigger deeper kernel logic leading to AIARelevantFunction
- Identify which ioctl code is being handled (e.g., IOCTL_AIA_ALLOC_SMEM, IOCTL_AIA_SEND_MSG)

If you find such code, identify the ioctl name or code value used and how the call flows into memory management or messaging logic.

3. Message Structure Handling (PRIMARY FOCUS)
Assign a confidence score if the code block handles message structures exchanged between user space and kernel, especially involving Shared Memory Identifiers (SMIDs). These are usually detected via:
- Use of copy_from_user() / copy_to_user()
- SMID (Shared Memory Identifier) acts as way of userspace letting know your user virtual address pages are accessed by AIA using this SMID
If SMID appears to be in structs used in copy_from_user or copy_to_user then that is interesting to analyze further
Examine fields in structure that usually contains fields like device address, physical address etc copied to userspace that is our SMID
- Structures passed between user space and kernel that include:
  - SMID (shared memory identifier)
  - Device virtual address, physical address, DMA address
  - Memory size, flags, or similar metadata

These structures may represent requests by user space for AIA to access certain memory pages, or responses from kernel about memory regions accessible to the AIA.

User space can only access memory using user virtual address, AIA can access memory using AIA virtual address or physical or dma address.
You need to identify SMID if present

OUTPUT FORMAT (YAML):
```yaml
Function/Code_Block_Name: <function_name_or_description>
AIARelevantFunction: <0-100%>
Relevant_KD_Entry_Point: <0-100%>
Message_Structure_Handling: <0-100%>
SMID's identified: [list any identified SMIDs or potential SMIDs]
Reasoning:
  - Describe the rationale behind each confidence score
  - Reference specific APIs used (e.g., get_user_pages, dma_map_page, copy_from_user)
  - Mention any relevant ioctl code names or struct fields (e.g., smid, phys_addr)
  - Indicate if there's a flow from user space to kernel to AIA
  - what can be potential SMID's
```

"""
    
    prompt = base_prompt + f"\nOperation Type: {operation_type}\n"
    prompt += f"\nFunction Code to analyze:\n```c\n{function_code}\n```\n"
    
    if stack_trace:
        prompt += f"\nStack Trace (for DMA operations):\n```\n{stack_trace}\n```\n"
    
    return prompt
