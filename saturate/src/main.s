// src/main.s
// Runs on 32-bit ARM Linux (in Docker or native)
// Hello world using Linux syscall

.global saturate

.section .text
saturate:
    USAT	r0, #16, r0
    bx 		lr
