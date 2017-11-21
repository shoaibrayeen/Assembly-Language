DATA SEGMENT                  ;Start of data segment
    NUMBER DW 4H              ;NUMBER
    RESULT DW ?               ;Result OF FACTORIAL OF NUMBER
DATA ENDS                     ;End of data data segment    

CODE SEGMENT                  ;Start segment 
    
    ASSUME DS:DATA CS:CODE
    START:                    ;Start of main program
           MOV AX,DATA        ;LOADS DS WITH THE ADDRESS OF DATA SEGMENT 
           MOV DS,AX  
           
           XOR AX,AX          ;AX is initialised with 0
           MOV AX,1H          ;Mov 1 in the ax 
           MOV CX,NUMBER      ;Mov NUMBER in the CX register                                             
                                                        
           CALL FACT          ;Calling the proceure 
              
           MOV AH,4CH
           INT 21H
           
           FACT PROC NEAR         ;Starting of the procedure
                CMP CX,1          ;Compare BX with 1
                JE  EXIT         ;if bx is 1 jump to finish label
                IMUL CX           ;otherwise multiply no by ax
                DEC CX            ;and decrease the no
                CALL FACT         ;calling function recursivey  
           EXIT:
                 MOV RESULT,AX      ;move the factorial in AX to result
                 RET   
                
           FACT ENDP          ;end of procedure
           
CODE ENDS                     ;end of code segment 
END START
