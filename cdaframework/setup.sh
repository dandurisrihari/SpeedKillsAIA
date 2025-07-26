#!/bin/bash

# This script should be sourced: `source setup.sh` or `. setup.sh`

# Create virtual environment if not exists
if [ ! -d "venv" ]; then
    echo "Creating Python virtual environment..."
    python3 -m venv venv
else
    echo "Virtual environment 'venv' already exists."
fi

# Activate the virtual environment

echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install required packages
echo "Installing tree_sitter and tree_sitter_c..."
pip install tree_sitter tree_sitter_c

echo "✅ Setup complete. Python environment is active."
