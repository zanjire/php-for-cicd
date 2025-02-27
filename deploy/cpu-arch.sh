#!/bin/bash

# Get the current architecture
current_arch=$(dpkg --print-architecture)

# Check if the current architecture is ARM-based
if [[ $current_arch == "arm"* ]]; then
    echo "ARM architecture detected: $current_arch"
    
    # Check if armhf is already added
    if ! dpkg --print-foreign-architectures | grep -q "armhf"; then
        echo "Adding armhf architecture..."
        sudo dpkg --add-architecture armhf
        echo "armhf architecture added successfully."
    else
        echo "armhf architecture is already added."
    fi
else
    echo "Not an ARM architecture. Current architecture: $current_arch"
fi
