# Hello, World! in Assembly

This document explains how to write, assemble, and run a "Hello, World!" program in x86-64 assembly on a Linux system.

## The Assembly Code (`hello.asm`)

```assembly
section .data
    hello db 'Hello, World!', 0ah

section .text
    global _start

_start:
    ; write(1, hello, 13)
    mov rax, 1
    mov rdi, 1
    mov rsi, hello
    mov rdx, 13
    syscall

    ; exit(0)
    mov rax, 60
    xor rdi, rdi
    syscall
```

### Code Explanation

*   **`section .data`**: This section is for declaring initialized data.
    *   `hello db 'Hello, World!', 0ah`: This defines a byte string named `hello` containing "Hello, World!" and a newline character (`0ah`).
*   **`section .text`**: This section contains the program's code.
    *   `global _start`: This makes the `_start` label visible to the linker, marking it as the program's entry point.
    *   `_start:`: This is where the program begins execution.
*   **Printing "Hello, World!"**: This part of the code uses a system call to write the string to the console.
    *   `mov rax, 1`: Sets `rax` to `1`, the syscall number for `write`.
    *   `mov rdi, 1`: Sets `rdi` to `1`, the file descriptor for `stdout`.
    *   `mov rsi, hello`: Sets `rsi` to the memory address of our `hello` string.
    *   `mov rdx, 13`: Sets `rdx` to `13`, the length of the string.
    *   `syscall`: Executes the `write` system call.
*   **Exiting the program**: This part of the code uses a system call to terminate the program.
    *   `mov rax, 60`: Sets `rax` to `60`, the syscall number for `exit`.
    *   `xor rdi, rdi`: Sets `rdi` to `0` (the exit code) by XORing it with itself.
    *   `syscall`: Executes the `exit` system call.

## Assembling and Running

To run the assembly program, you need to assemble it into an object file and then link it to create an executable.

### Commands

1.  **Assemble with `nasm`**:
    ```bash
    nasm -f elf64 hello.asm -o hello.o
    ```
2.  **Link with `ld`**:
    ```bash
    ld hello.o -o hello
    ```
3.  **Run the executable**:
    ```bash
    ./hello
    ```

### Command Explanations

*   `nasm -f elf64 hello.asm -o hello.o`: This command assembles the `hello.asm` file.
    *   `nasm`: The Netwide Assembler.
    *   `-f elf64`: Specifies the output format as ELF64, the standard for 64-bit Linux executables.
    *   `hello.asm`: The input assembly file.
    *   `-o hello.o`: Specifies the output object file name.
*   `ld hello.o -o hello`: This command links the `hello.o` object file.
    *   `ld`: The GNU linker.
    *   `hello.o`: The input object file.
    *   `-o hello`: Specifies the output executable file name.
*   `./hello`: This command executes the `hello` program.
