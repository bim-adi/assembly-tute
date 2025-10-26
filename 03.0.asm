%define SYS_EXIT 1
%define SYS_READ 3
%define SYS_WRITE 4

%define STDOUT 1
%define STDIN 0

%define NUM1 8
%define NUM2 5
%define NUM3 9

section .data
    msg db "The largest number is: ", 0
    msg_len equ $ - msg

section .bss
    largest resb 1

section .text
    global _start
      _start:
        mov ecx, NUM1
        cmp ecx, NUM2
        jg _check_num3
        mov ecx, NUM2
      _check_num3: 
        cmp ecx, NUM3
        jg _store_largest
        mov ecx, NUM3
      _store_largest:
        add ecx, '0'
        mov [largest], ecx
      _print_res:
        movrrax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, msg
        mov edx, msg_len
        int 0x80

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, largest
        mov edx, 1
        int 0x80

        mov eax, SYS_EXIT
        xor ebx, ebx
        int 0x80

