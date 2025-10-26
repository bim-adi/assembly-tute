%define SYS_EXIT 1
%define SYS_READ 3
%define SYS_WRITE 4

%define STDOUT 1
%define STDIN 0

section .bss
    num1 resb 2
    num2 resb 2
    res resb 1


section .data
  msg db "enter first number:", 0xa
  len equ $ - msg
  msg2 db "enter second number: ", 0xa
  len2 equ $ - msg2
  msg3 db "result is:" , 0xa
  len3 equ $ - msg3

section .text
    global _start
      _start:
        mov edx, len
        mov ecx, msg
        mov ebx, STDOUT
        mov eax, SYS_WRITE
        int 0x80

        mov edx, 2
        mov ecx, num1
        mov ebx, STDIN
        mov eax, SYS_READ
        int 0x80


        mov edx, len2
        mov ecx, msg2
        mov ebx, STDOUT
        mov eax, SYS_WRITE
        int 0x80

        mov edx, 2
        mov ecx, num2
        mov ebx, STDIN
        mov eax, SYS_READ
        int 0x80

        mov eax, [num1]
        sub eax, '0'
        mov ebx, [num2]
        sub ebx, '0'

        add eax, ebx
        add eax, '0'
        mov [res], eax

        mov edx, len3
        mov ecx, msg3
        mov ebx, STDOUT
        mov eax, SYS_WRITE
        int 0x80

        mov edx, 2
        mov ecx, res
        mov ebx, STDOUT
        mov eax, SYS_WRITE
        int 0x80

        mov eax, SYS_EXIT
        xor ebx, ebx
        int 0x80
