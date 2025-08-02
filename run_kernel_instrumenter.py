#!/usr/bin/env python3
"""
Standalone Kernel Instrumenter Runner

This script automatically sources setup.sh and runs the kernel instrumenter with proper environment setup.
Use this script instead of calling the module directly to avoid import issues.
"""

import os
import sys
import subprocess
from pathlib import Path

def run_with_setup():
    """Run the kernel instrumenter with proper environment setup"""
    # Get the directory containing this script
    script_dir = Path(__file__).parent.absolute()
    
    # Path to setup.sh
    setup_script = script_dir / "setup.sh"
    
    if not setup_script.exists():
        print(f"❌ Setup script not found: {setup_script}")
        sys.exit(1)
    
    # Build the command to source setup.sh and run the instrumenter
    tool_args = " ".join(sys.argv[1:])  # Pass through all arguments
    
    # Create the bash command that sources setup.sh and then runs the tool
    bash_command = f"""
    cd "{script_dir}" && 
    source setup.sh && 
    python -m src.kernel_instrumenter {tool_args}
    """
    
    print("🔄 Setting up environment and running kernel instrumenter...")
    
    try:
        # Run the command in bash
        result = subprocess.run(
            ["bash", "-c", bash_command],
            cwd=script_dir,
            text=True
        )
        sys.exit(result.returncode)
        
    except KeyboardInterrupt:
        print("\n👋 Operation cancelled")
        sys.exit(1)
    except Exception as e:
        print(f"❌ Error running kernel instrumenter: {e}")
        sys.exit(1)

if __name__ == "__main__":
    run_with_setup()
