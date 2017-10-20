;Linear Search

data segment
    array db 2h,5h,3h,1h,7h
    var db 7h 
    index dw ?
data ends

code segment
    assume ds:data,cs:code
    start:
          mov ax,data
          mov ds,ax 
          mov si,0h
          mov ax,0h 
          lea bx,array
          mov al,var 
          mov cx,5h 
          
      next:
           
           cmp al,byte ptr bx[si] 
           je nxt
           inc si
           loop next
    
       nxt: 
           inc si
           mov index,si
     
code ends
    end start    
     
    
