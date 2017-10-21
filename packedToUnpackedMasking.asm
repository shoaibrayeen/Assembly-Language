DATA SEGMENT                
    PACKED      DB  78H,56H,34H,12H,13H,54H,28H,94H			;PACKED NUMBER
    UNPACKED    DB  16 DUP(?)       					;UNPACKED NUMBER
DATA ENDS

CODE SEGMENT
    ASSUME  DS:DATA  , CS:CODE
    
    START :
            MOV AX, DATA
            MOV DS, AX
            
            MOV CX,8H
            MOV DL,0FH							;MASK : 00001111
            MOV SI,0 
            MOV DI,0 
            
    NEXT:
            XOR AX,AX 
	    MOV AL,PACKED[SI]
	    MOV AH,PACKED[SI]
            INC SI      
	    ROR AH,4
	    AND AL,DL
	    AND AH,DL
	    MOV UNPACKED[DI], AH
	    INC DI
	    MOV UNPACKED[DI],AL
	    INC DI
            LOOP NEXT
CODE ENDS  
END START
