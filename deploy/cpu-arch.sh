#!/bin/bash

# Get the current architecture
current_arch=$(dpkg --print-architecture)
echo "Current architecture detected: $current_arch"

# Define architectures to add based on your platform list
# Mapping Docker platform -> Debian architecture
declare -a archs_to_add=(
  "amd64"      # linux/amd64
  "arm64"      # linux/arm64, linux/arm64/v8
  "armhf"      # linux/arm/v7 (armhf)
  "ppc64el"    # linux/ppc64le (Debian uses ppc64el)
  "riscv64"    # linux/riscv64
  "s390x"      # linux/s390x
  # Windows platforms usually don't require adding architectures here
)

# Function to add architecture if not present
add_architecture() {
  local arch=$1
  if ! dpkg --print-foreign-architectures | grep -qw "$arch"; then
    echo "Adding architecture: $arch"
    sudo dpkg --add-architecture "$arch"
  else
    echo "Architecture $arch already added"
  fi
}

# Add architectures
for arch in "${archs_to_add[@]}"; do
  add_architecture "$arch"
done

# Update apt repositories
echo "Updating apt repositories..."
sudo apt-get update