DATA SEGMENT                
    PACKED      DB  78h,56h,34h,12h,13h,54h,28h,94h
    UNPACKED    DB  16 DUP(?)
    
DATA ENDS

CODE SEGMENT
    ASSUME  DS:DATA , CS:CODE
    
    START :
            MOV AX, DATA
            MOV DS, AX
            
            MOV CX,8
            MOV SI,0 
            MOV DI,0 
            
    NEXT:
            XOR AX,AX 
	    MOV AL,PACKED[SI]
   	    INC SI
	    SHL AX,4
   	    SHR AL,4
	    MOV UNPACKED[DI], AH
	    INC DI
	    MOV UNPACKED[DI],AL
	    INC DI
            LOOP NEXT
CODE ENDS  
    END START
