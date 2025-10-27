 section .text
    global _start

    _start:
    mov edx,len ;message length is stored in edx
    mov ecx,msg ;msg is the pointer
    mov ebx,1   ;file descriptor
    mov eax,4   ;system call
    int 0x80    ;call the kernel(interrupt)
    
    mov ebx,0   ;store the exit code
    mov eax,1   ;system call for exit
    int 0x80    ;call kernel

    section .data
    msg db 'Hello everyone!',0xa ;string+newline
    len equ $ - msg              ;calculate the length of the string
