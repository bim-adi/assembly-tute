section	.text
  global _start
	
    _start:
      mov	edx, len1
      mov	ecx, msg1
      mov	ebx, 1
      mov	eax, 4
      int	0x80
	
      mov	edx, len2
      mov	ecx, msg2
      mov	ebx, 1
      mov	eax, 4
      int	0x80
	
      mov	eax,1
      int	0x80
section	.data
  msg1 dw "hello this is bimbok!", 0xa
  len1 equ $ - msg1
  msg2 times 9 dw "sizuka", 0xa
  len2 equ $ - msg2
