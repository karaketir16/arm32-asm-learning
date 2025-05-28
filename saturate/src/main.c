#include <stdio.h>
#include <stdlib.h>

unsigned short saturate(unsigned int n);

int main(void) {
    srand(0); // Seed the random number generator for reproducibility
    unsigned int n;

    while(1) {
        n = rand() % 0x100000000; // Generate a random number in the range [0, 2^32 - 1]
        unsigned short result = saturate(n);
        printf("saturate(%x) = %x\n", n, result);
        if(n > 0xffff && result != 0xffff) {
            printf("Error: saturate(%x) returned %hu, expected 0xffff\n", n, result);
            return 1;
        } else if(n <= 0xffff && result != (unsigned short)n) {
            printf("Error: saturate(%x) returned %hu, expected %u\n", n, result, (unsigned short)n);
            return 1;   
        }
    }
    
    return 0;
}
