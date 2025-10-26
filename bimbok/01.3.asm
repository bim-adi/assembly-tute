%define SYS_EXIT 1
SYS_WRITE equ 4
STDOUT equ 1
STDIN equ 0

section .data
    msg db "hello this is bimbok!", 0xa
    len equ $ - msg

    msg2 db "sizuka", 0xa
    len2 equ $ - msg2
section .text
    global _start
      _start:
        mov edx, len
        mov ecx, msg
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        int 0x80

        mov edx, len2
        mov ecx, msg2
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        int 0x80

        mov eax, SYS_EXIT
        int 0x80

