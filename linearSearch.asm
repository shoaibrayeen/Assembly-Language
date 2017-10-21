; THIS ASSEMBLY CODE SEARCHES AN ELEMENT IN THE ARRAY LINEARLY.

DATA SEGMENT                            ; A SEGMENT NAMED AS DATA

    ARRAY     DB 09H,04H,06H,03H,08H    ; INITIALIZING THE ELEMENTS OF ARRAY
    ELEMENT   DB 03H                    ; THE ELEMENT WHICH WE WANT TO SEARCH
    INDEX     DW ?                      ; VARIABLE TO SAVE THE INDEX FOR SEARCHING ELEMENT
DATA ENDS                               ; END OF DATA SEGMENT

CODE SEGMENT                            ; A SEGMENT NAMED AS CODE

    ASSUME DS:DATA , CS:CODE
    ; INFORM TO ASSEMBLER THAT DATA SEGMENT IS ASSOCIATED WITH DS AND CODE SEGMENT IS ASSOCIATED WITH CS
    
    START:                              ; MAIN OF THE PROGRAM
            MOV AX , DATA               
            MOV DS , AX                 ; LOADS DS WITH THE ADDRESS OF DATA SEGMENT
            
            MOV SI , 0H                 ; SI IS INITIALIZED WITH 0.
            XOR AX , AX                 ; AX IS INITIALIZED WITH 0.
            LEA BP , ARRAY              ; LOADS EFFECTIVE ADDRESS OF ARRAY TO BP REGISTER
            MOV AL , ELEMENT            ; MOVE THE SEARCHING ELEMENT TO AL REGISTER 
            MOV CX,5H                   ; CX IS INTIALIZED WITH 5 TO EXECUTE LOOP 5 TIMES
          
    NEXT:
            CMP AL,BYTE PTR BP[SI]      ; COMPARE THE CONTENT OF AL TO CONTENT OF ARRAY
            JE FOUND                    ; IF EQUAL , THEN JUMP TO FOUND LABEL
            INC SI                      ; SI IS INCREMENTED BY 1
            LOOP NEXT                   ; REPEAT TILL CX = 0H
            JMP NOTFOUND                ; AFTER ENDING OF LOOP JUMP TO NOTFOUND LABEL
            
    FOUND: 
            INC SI                      ; SI IS INCREMENTED BY 1
            MOV INDEX , SI              ; MOVE THE VALUE OF SI REGISTER TO INDEX AFTER FINDING THE ELEMENT IN ARRAY
            
    NOTFOUND:
            MOV INDEX , FFFFH           ; MOVE -1 TO INDEX AFTER NOT FINDING THE ELEMENT IN ARRAY
     
 CODE ENDS                              ; END OF CODE SEGMENT
    END START                           ; END OF PRORAM 
