#!/bin/bash

# Script to delete all 'build' directories found under the SPECCPU2017 benchmarks
# WARNING: This permanently deletes files. Use with caution.

TARGET_DIR="/home/tomlord/workspace/SPECCPU2017/benchspec/CPU/"

echo "This script will delete the 'build' directories under all benchmark directories in:"
echo "${TARGET_DIR}"
read -p "Are you sure you want to continue? (y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

echo "Searching for and deleting 'build' directories..."

# Find all directories named 'build' directly under any benchmark directory in TARGET_DIR
find "${TARGET_DIR}" -type d -path "*/build/*" -exec rm -rf {} \; 2>/dev/null || true

echo "Cleanup complete."
exit 0