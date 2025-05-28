// src/main.s
// Runs on 32-bit ARM Linux (in Docker or native)
// Hello world using Linux syscall

.global _start

.section .text
_start:
    // write(1, msg, 13)
    mov     r7, #4          @ syscall number: write (32-bit ARM)
    mov     r0, #1          @ fd: stdout
    ldr     r1, =msg        @ pointer to message
    mov     r2, #13         @ length
    svc     #0              @ syscall (32-bit ARM uses swi)

    // exit(0)
    mov     r7, #1          @ syscall number: exit (32-bit ARM)
    mov     r0, #0          @ exit code 0
    svc     #0              @ syscall

.section .rodata
msg:
    .ascii "Hello, world!\n"
