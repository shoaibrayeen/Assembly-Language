DATA SEGMENT
    UNPACKED    DB  08h,07h,06h,05h,04h,03h,02h,01h,09h,02h,03h,04h,05h,06h,07h,08h
    PACKED      DB  8 DUP(?)
DATA ENDS

CODE SEGMENT
    ASSUME  DS:DATA 
    
    START :
           MOV AX, DATA
           MOV DS, AX
            
           MOV CX,8
           MOV SI,0 
           MOV DI,0 
           XOR AX,AX
    NEXT:
           MOV AH,UNPACKED[SI]
           INC SI                           
           MOV AL,UNPACKED[SI]
           INC SI
           SHL AL,4
           SHR AX,4
           MOV PACKED[DI],AL   
           INC DI
           LOOP NEXT
CODE ENDS  
    END START