section .text
    global _start

    _start:
        mov edx,len1    ;storing len in edx
        mov ecx,msg1    ;storing message
        mov ebx,1       
        mov eax,4
        int 0x80

        mov edx,len2    ;storing len in edx
        mov ecx,msg2    ;storing message
        mov ebx,1       
        mov eax,4
        int 0x80

        mov edx,len3    ;storing len in edx
        mov ecx,msg3    ;storing message
        mov ebx,1       
        mov eax,4
        int 0x80

        mov ebx,0
        mov eax,1
        int 0x80

    section .data
    msg1 db "Hello I am aditya!"
    len1 equ $ - msg1

    msg2 db "These are 10 stars"
    len2 equ $ - msg2

    msg3 times 9 db "*",0xa
    len3 equ $ - msg3