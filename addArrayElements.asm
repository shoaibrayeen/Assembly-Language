;This assembly code finds the sum of double word sized elements of array of length ten


data segment                  ;starts data segment named data
    index db 10h              ;preassigns constant 10 i.e.size of array to index variable
    sum dd ?                  ;reserves a 4byte space to sum
    array dd 1234543h,21234211h,45732114h,32444h,222222h,12345678h,765432h,9076CA2h,AB3421Fh,4682ADh  ;preassigns ten constants to 40 consecutive bytes and associates variable "array"
data ends                     ;end of data segment

code segment                  ;start code segment named code
    
      assume ds:data,cs:code        ;inform the assembler that address of data is in ds and that of code is in cs registers
 start:                       ; start of code
      mov ax,data
      mov ds,ax               ;loads ds with address of data segment
      mov ax,0 
      mov si,0h
      lea bx,array            ;loads effective address of array to bx register

      add ax,word ptr bx[si]  ;adds to ax lower order word of first double word element
      mov word ptr sum,ax     ;transfers the sum of above result in lower order word of sum
      mov ax,0h
      add ax,word ptr bx[si+2];adds to ax the higher order word of first element of array
      mov word ptr sum+2,ax
 
      mov cx,9h               ;number of times the loop to be executed is transfered in cx register
 next:  
       inc si
       inc si
       inc si
       inc si                 ; to move to the next element of the array
       mov ax,word ptr sum    
       adc ax,word ptr bx[si] ; adds to ax lower order word of first double word elemen
                              
       
       mov word ptr sum,ax     ;transfers the sum of above result in lower order word of sum
       mov ax,word ptr sum+2
       adc ax,word ptr bx[si+2] 
       mov word ptr sum+2,ax  
       loop next                ;repeat if cx is nonzero
 
code ends                      ;end of code segment
       end start                     ;end of proram




 
