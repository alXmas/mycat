#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -euo pipefail

# Visual terminal colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

BUILD_DIR="build"
TEST_DIR="test_artifacts"

echo -e "${BLUE}==> 1. Compiling MyCat program via CMake...${NC}"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"
cmake .. > /dev/null
cmake --build .
cd ..

# Determine where the executable was built
if [ -f "$BUILD_DIR/mycat" ]; then
    MYCAT_EXEC="./$BUILD_DIR/mycat"
else
    echo -e "${RED}Error: mycat executable not found inside build directory.${NC}"
    exit 1
fi

echo -e "${BLUE}==> 2. Setting up test files...${NC}"
mkdir -p "$TEST_DIR"
echo "Hello, world!" > "$TEST_DIR/file1.txt"
echo -e "Line 1\nLine 2\nLine 3" > "$TEST_DIR/file2.txt"

# Track test statuses
FAILED_TESTS=0

run_assertion() {
    local test_name="$1"
    local mycat_out="$2"
    local system_out="$3"
    
    if diff "$mycat_out" "$system_out" > /dev/null; then
        echo -e "${GREEN}  ✔ PASS: $test_name${NC}"
    else
        echo -e "${RED}  ✘ FAIL: $test_name (Outputs do not match!)${NC}"
        FAILED_TESTS=$((FAILED_TESTS + 1))
    fi
}

echo -e "${BLUE}==> 3. Running functional test cases...${NC}"

# Test Case 1: Single file reading
$MYCAT_EXEC "$TEST_DIR/file1.txt" > "$TEST_DIR/out_mycat_1.txt"
cat "$TEST_DIR/file1.txt" > "$TEST_DIR/out_sys_1.txt"
run_assertion "Single file parsing" "$TEST_DIR/out_mycat_1.txt" "$TEST_DIR/out_sys_1.txt"

# Test Case 2: Multi-file concatenation
$MYCAT_EXEC "$TEST_DIR/file1.txt" "$TEST_DIR/file2.txt" > "$TEST_DIR/out_mycat_2.txt"
cat "$TEST_DIR/file1.txt" "$TEST_DIR/file2.txt" > "$TEST_DIR/out_sys_2.txt"
run_assertion "Multiple file concatenation" "$TEST_DIR/out_mycat_2.txt" "$TEST_DIR/out_sys_2.txt"

# Test Case 3: Standard Input Stream (Piping data)
echo "Piped content input test" | $MYCAT_EXEC > "$TEST_DIR/out_mycat_3.txt"
echo "Piped content input test" | cat > "$TEST_DIR/out_sys_3.txt"
run_assertion "Stdin stream piping" "$TEST_DIR/out_mycat_3.txt" "$TEST_DIR/out_sys_3.txt"

echo "--------------------------------------------------"
# Clean up temporary test files
rm -rf "$TEST_DIR"

if [ "$FAILED_TESTS" -eq 0 ]; then
    echo -e "${GREEN}🎉 SUCCESS: All automated text behavior tests passed successfully!${NC}"
    exit 0
else
    echo -e "${RED}💥 FAILURE: $FAILED_TESTS test cases failed validation checks.${NC}"
    exit 1
fi

