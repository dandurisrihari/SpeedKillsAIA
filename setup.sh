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
if [ -f "requirements.txt" ]; then
    echo "Installing packages from requirements.txt..."
    pip install -r requirements.txt
    
    # Check if pip install was successful
    if [ $? -eq 0 ]; then
        echo "✅ All packages installed successfully."
    else
        echo "❌ Error: Failed to install some packages from requirements.txt"
        echo "Please check the error messages above and try:"
        echo "  - Updating pip: pip install --upgrade pip"
        echo "  - Installing packages individually: pip install <package_name>"
        echo "  - Checking if all package names are correct in requirements.txt"
        exit 1
    fi
else
    echo "⚠️  requirements.txt not found. Skipping package installation."
fi

echo "✅ Setup complete. Python environment is active."