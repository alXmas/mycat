#!/usr/bin/env bash

# Exit immediately if any command fails, treats unset variables as errors
set -euo pipefail

# 1. Colors for beautiful terminal output
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

BUILD_DIR="build"

echo -e "${BLUE}==> Preparing build environment...${NC}"

# 2. Setup build directory cleanly
if [ ! -d "$BUILD_DIR" ]; then
    mkdir "$BUILD_DIR"
fi

cd "$BUILD_DIR"

echo -e "${BLUE}==> Configuring project with CMake...${NC}"
# Configure the project, suppressing unnecessary clutter unless there's an error
cmake .. > /dev/null

echo -e "${BLUE}==> Building application and tests...${NC}"
# Compile the targets
cmake --build .

echo -e "${BLUE}==> Executing unit tests via CTest...${NC}"
echo "--------------------------------------------------"

# 3. Run CTest and capture output. 
# --output-on-failure: Shows stdout/stderr ONLY if a test fails.
# --test-output-size-passed: Increases log limit for large prints.
if ctest --output-on-failure --test-output-size-passed 65536; then
    echo "--------------------------------------------------"
    echo -e "${GREEN}✔ SUCCESS: All MyCat tests passed successfully!${NC}"
    exit 0
else
    echo "--------------------------------------------------"
    echo -e "${RED}✘ FAILURE: One or more tests failed. Check the logs above.${NC}"
    exit 1
fi

