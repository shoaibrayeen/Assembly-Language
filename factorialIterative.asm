DATA SEGMENT
    NUMBER DW 04H
    RESULT DW ?
    
DATA ENDS      

CODE SEGMENT     
    ASSUME DS:DATA ,CS:CODE   
    
    START:
        MOV AX , DATA
        MOV DS , AX
           
        CALL FACT
        MOV AH,4CH
        INT 21H
        
        FACT PROC NEAR   
            PUSH CX
            PUSH AX
            MOV CX , NUMBER 
            MOV AX , 1H 
            
            NEXT:       
                IMUL CX
                LOOP NEXT
            MOV RESULT , AX  
            POP AX
            POP CX
            RET
        FACT ENDP
             
    
CODE ENDS    
    END START
