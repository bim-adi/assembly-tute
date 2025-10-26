section .text
  global _start

    _start:
      mov edx, len
      mov ecx, msg
      mov ebx, 1
      mov eax, 4
      int 0x80

      mov eax, 1
      int 0x80
section .data
  msg db "12345", 0xa
  ; bro here is case one where output is only: 12345
  ; len equ $ - msg
  msg2 times 5 db "6", 0xa

  ; here is case two where output is: 12345
  ;                                   6
  ;                                   6
  ;                                   6
  ;                                   6
  ;                                   6
  ; msg2 times 5 db "6", 0xa
  len equ $ - msg
