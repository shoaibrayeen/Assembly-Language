; ASSEMBLY PROGRAM FOR BINARY SEARCH

DATA SEGMENT                            ; A SEGMENT NAMED AS DATA
    ARRAY     DB 01H,02H,05H,16H,39H    ; INITIALIZING THE ELEMENTS OF ARRAY 
    INDEX     DW ?                      ; VARIABLE TO SAVE THE INDEX FOR SEARCHING ELEMENT
    LOW       DW 0H                     ; INTIALIZED LOW WITH 0H
    HIGH      DW 4H                     ; INTIALIZED HIGH WITH LENGTH OF ARRAY MINUS ONE
    ELEMENT   DB 16H                    ; WHICH WE HAVE TO SEARCH
    
DATA ENDS                               ; END OF DATA SEGMENT

CODE SEGMENT                            ; A SEGMENT NAMED AS CODE
    ASSUME DS:DATA , CS:CODE  
    ; INFORM TO ASSEMBLER THAT DATA SEGMENT IS ASSOCIATED WITH DS AND CODE SEGMENT IS ASSOCIATED WITH CS
    
    START:                              ; MAIN OF THE PROGRAM
            MOV AX , DATA
            MOV DS , AX                 ; LOADS DS WITH THE ADDRESS OF DATA SEGMENT  
      
            XOR AX , AX                 ; AX IS INITIALIZED WITH 0.
            LEA BX , ARRAY              ; LOADS EFFECTIVE ADDRESS OF ARRAY TO BX REGISTER
            
    NEXT:
	    MOV DX , HIGH
            CMP DX , LOW              
            JL  NOTFOUND                ; IF LOW > HIGH , THEN ELEMENT IS NOT FOUND IN THE ARRAY.

            MOV DX , HIGH               ; MOVE UPPER TO DX
            ADD DX , LOW                ; ADD LOWER TO DX
            MOV AX , DX			        ; MOVE CONTENT OF DX TO AX
           
            MOV DL , ELEMENT            ; MOVE ELEMENT WHICH WE HAVE TO SEARCH IN DL REGISTER
            MOV CX , 2H                 ; CX IS INITIALIZED BY 2.
            DIV CL                      ; DIVIDE THE CONTENT OF AX BY 2
 	        MOV AH , 0H			        ; CLEARING AH

            MOV SI , AX                 ; MOVE VALUE OF AX TO SI ( SI IS WORKING AS MID VALUE OF LOW AND HIGH )
            CMP DL , BYTE PTR BX[SI]    ; COMPARE THE CONTENT OF DL TO CONTENT OF ARRAY
            JE  FOUND                   ; IF EQUAL , THEN JUMP TO FOUND LABEL
            JA  NEXT1                   ; IF ABOVE , THEN JUMP TO NEXT1 LABEL
            JL  NEXT2                   ; IF EQUAL , THEN JUMP TO NEXT2 LABEL
          
    NEXT1:                              ; FOR SEARCHING ELEMENT IN UPPER HALF PART OF ARRAY
     
            INC SI                      ; SI IS INCREMENTED BY 1.
            MOV LOW , SI                ; MOVE CONTENT OF SI TO LOW.
            JMP NEXT                    ; JUMP TO NEXT LABEL
         
    NEXT2:                              ; FOR SEARCHING ELEMENT IN UPPER HALF PART OF ARRAY
        
            DEC SI                      ; SI IS DECREMENTED BY 1
            MOV HIGH , SI               ; MOVE CONTENT OF SI TO HIGH
            JMP NEXT                    ; JUMP TO NEXT LABEL
          
    FOUND: 
            MOV INDEX , SI              ; MOVE THE VALUE OF SI REGISTER TO INDEX AFTER FINDING THE ELEMENT IN ARRAY
 	        JMP EXIT			        ; EXIT OF PROGRAM AFTER FINDING THE ELEMENT IN THE ARRAY
            
    NOTFOUND:
            MOV INDEX , -1              ; MOVE -1 TO INDEX AFTER NOT FINDING THE ELEMENT IN ARRAY

    EXIT:
              
 CODE ENDS                              ; END OF CODE SEGMENT
    END START                           ; END OF PRORAM 
