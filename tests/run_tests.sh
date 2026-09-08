#include <stdio.h>
#include <assert.h>
#include "mycat_core.h"

void test_buffer_valid_size() {
    int result = mock_cat_buffer(10); 
    assert(result == 1); 
}

void test_buffer_invalid_size() {
    int result = mock_cat_buffer(-5);
    assert(result == 0); 
}

int main() {
    printf("Running unit tests...\n");
    
    test_buffer_valid_size();
    test_buffer_invalid_size();
    
    printf("All tests passed successfully!\n");
    return 0;
}

