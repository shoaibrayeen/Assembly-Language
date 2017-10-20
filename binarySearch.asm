;Binary Search

data segment
    array db 02h,15h,21h,42h,50h 
    idx dw ?
    lower dw ?
    upper dw ?
    var db 50h
data ends 

code segment
    assume ds:data , cs:code  
    
    start:
          mov ax,data
          mov ds,ax
          mov ax,0h
          lea bx,array
          mov lower,0h
          mov upper,4h 
          
      nxt:
          mov dx,upper 
          add dx,lower
          mov ax,dx 
          mov dl,var
          mov cx,2h
          div cl
          mov ah,0h
          mov si,ax  
          cmp dl,byte ptr bx[si] 
          je equal
          ja nxt1
          jl nxt2 
          
    nxt1:
        
         inc si
         mov lower, si
         jmp nxt
         
    nxt2:
        
        dec si 
        mov upper, si
        jmp nxt
          
    equal:
         inc si 
         mov idx,si
              
code ends
   end start
