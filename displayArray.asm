#Display Element of Array
.model small
.386
.data
array db 100 dup(?),'$'
msg1 db "Enter array elements(Tap enter to stop): $"
msg2 db "Array entered is: $"

.code
.startup

xor cx,cx

mov ax,ds
mov es,ax

lea dx, msg1
mov ah, 09h
int 21h

call newLine

mov di, offset array
cld

.while al!=0dh
    mov ah,01h
    int 21h
    .if al==0dh
    	jmp printMsg2  
    .else
    	stosb
    	inc cx 
    	call nline
    .endif
.endw

printMsg2:
lea dx, msg2
mov ah,09h
int 21h

xor dx,dx
lea dx, array
mov ah, 09h
int 21h

.exit

newLine proc near
    mov dl, 10
    mov ah,02h
    int 21h
    ret 
newLine endp

end
