.model small
.data

	input db "Enter number: $"
	output db "Sum= $"
	array db 100 dup(?)
	ten dw 10
	num1 dw 0
	num2 dw 0


.code
.startup
	xor cx,cx

	mov ax,ds
	mov es,ax


	mov di, offset array
	cld
	lea dx, input
	mov ah, 09h
	int 21h
	.while al!=0dh
		mov ah, 01h
    		int 21h
    		stosb
    		inc cx
	.endw
	
	mov si, offset array
	xor bx,bx
	xor dx,dx
	xor ax, ax
	.while cx!=1
    		mov dl, [si+bx]
    		sub dl, 48
    		add ax, dx
    		mul ten
    		mov num1, ax
    		dec cx
    	inc bx
	.endw
	div ten
	mov num1, ax

	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
	lea dx, input
	mov ah, 09h
	int 21h
	mov di, offset array
	cld
	.while al!=0dh
    		mov ah, 01h
    		int 21h
    		stosb
    		inc cx
	.endw

	mov si, offset array
	xor bx,bx	
	xor dx,dx
	xor ax, ax
	.while cx!=1
    		mov dl, [si+bx]
    		sub dl, 48
    		add ax, dx
    		mul ten
    		mov num2, ax
    		dec cx
    		inc bx
	.endw
	div ten
	mov num2, ax

	add ax, num1

	xor bx,bx
	.while ax!=0
    		xor dx, dx
    		mov si, 10
    		div si
    		add dx, 48
    		push dx
    		inc bx
	.endw


	mov di, offset array
	mov cx,bx
	xor bx,bx
	.while cx!=0
    		pop dx
    		mov [di+bx], dx
    		dec cx
    		inc bx
	.endw    
	mov ax, '$'
	mov [di+bx], ax

	lea dx, output
	mov ah,09h
	int 21h

	lea dx, array
	mov ah,09h
	int 21h

.exit
end
