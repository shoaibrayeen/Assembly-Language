;code to move a block of data from one memory location to another

data segment
    array1 db 01h,03h,04h,05h,06h
    array2 db 5dup(0) 

data ends

code segment
    assume ds:data , cs:code  ;associates segments with the segment registers
    start:
          mov ax,data
          mov ds,ax         ;transfers address of data segment to data segment register
          mov si,0
          mov di,0
          
          lea bx,array1     ;loads effective address of memory loaction named array1 to bx register
          lea bp,array2     ;loads effective address of memory loaction named array2 to bp register
          
          mov cx,05h        ;number of times the loop to be executed
     next: 
          mov al,bx[si]     ;copies the byte content addressed by bx and si registers to al register
          mov bp[di],al     ;copies the content of al register to memory location addressed by bp and di registers
          inc si            ; si=si+1
          inc di            ; di=di+1
          loop next        ;repeat until cx is nonzero
 code ends
      end start
