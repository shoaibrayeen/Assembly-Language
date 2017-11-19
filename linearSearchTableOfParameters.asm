; THIS ASSEMBLY CODE FOR LINEAR SEARCH

DATA SEGMENT                            ; A SEGMENT NAMED AS DATA

    ARRAY     DW 09H,04H,06H,13H,08H,21H; INITIALIZING THE ELEMENTS OF ARRAY
    ELEMENT   DW 21H                    ; THE ELEMENT WHICH WE WANT TO SEARCH
    INDEX     DW ?                      ; VARIABLE TO SAVE THE INDEX FOR SEARCHING ELEMENT 
    TABLE     DW 3 DUP(?)
DATA ENDS  ; END OF DATA SEGMENT 

STACK SEGMENT
    DW 100 DUP(?)
    TOS LABEL WORD
    
STACK ENDS

CODE SEGMENT                            ; A SEGMENT NAMED AS CODE

    ASSUME DS:DATA , CS:CODE , SS:STACK
    ; INFORM TO ASSEMBLER THAT DATA SEGMENT IS ASSOCIATED WITH DS AND CODE SEGMENT IS ASSOCIATED WITH CS
    
    START:                              ; MAIN OF THE PROGRAM
            MOV AX , DATA               
            MOV DS , AX                 ; LOADS DS WITH THE ADDRESS OF DATA SEGMENT 
            
            MOV AX , STACK
            MOV SS , AX
            
            MOV SI , 0H                 ; SI IS INITIALIZED WITH 0. 
            MOV SP , OFFSET TOS
            MOV TABLE , OFFSET ARRAY
            MOV TABLE+2 , OFFSET ELEMENT
            MOV TABLE+4 , OFFSET INDEX 
            
            CALL LINEAR_SEARCH
            MOV AH , 4CH                ;HALTING THE PROGRAM
	          INT 21H
	        

	          LINEAR_SEARCH PROC NEAR
	            
              	MOV BX , OFFSET TABLE 
              	XOR AX , AX                 ; AX IS INITIALIZED WITH 0.   
              	MOV SI , [BX]
              	MOV DI , [BX+2]            ; MOVE THE SEARCHING ELEMENT TO AL REGISTER 
              	MOV CX , 06H                ; CX IS INTIALIZED WITH 6 TO EXECUTE LOOP 6 TIMES
	
          
    		    NEXT:       
    		        MOV AX , [DI]
            		CMP AX,WORD PTR [SI]      ; COMPARE THE CONTENT OF AL TO CONTENT OF ARRAY
		            JE FOUND                    ; IF EQUAL , THEN JUMP TO FOUND LABEL
        	    	INC SI
            		INC SI                      ; SI IS INCREMENTED BY 1
            		LOOP NEXT                   ; REPEAT TILL CX = 0H
            		JMP NOTFOUND                ; AFTER ENDING OF LOOP JUMP TO NOTFOUND LABEL
            
            FOUND:     
            		MOV DL , 2		    ; FOR SAVING CORRECT INDEX
            		MOV AX , SI
            		DIV DL
            		MOV SI , [BX+4]
            		MOV WORD PTR [SI] , AX              ; MOVE THE VALUE OF SI REGISTER TO INDEX AFTER FINDING THE ELEMENT IN ARRAY
	    		      JMP EXIT			        ; EXIT AFTER MOVING THE VALUE OF SI TO INDEXT
            
    		    NOTFOUND:
	    		      MOV SI , [BX+4]
            		MOV WORD PTR [SI] , -1              ; MOVE -1 TO INDEX AFTER NOT FINDING THE ELEMENT IN ARRAY
    		    EXIT:
			          RET
	          LINEAR_SEARCH ENDP
           
 CODE ENDS                              ; END OF CODE SEGMENT
    END START                           ; END OF PRORAM 
