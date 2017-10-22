; THIS ASSEMBLY CODE CONVERTS PACKED BCD NUMBER TO UNPACKED BCD NUMBER USING MASKING.

DATA SEGMENT               				; A SEGMENT NAMED AS DATA

    PACKED      DB  78H,56H,34H,12H,13H,54H,28H,94H	; INTIALIZING PACKED ARRAY WIH 8 DIFFERENT NUMBERS
    UNPACKED    DB  16 DUP(?)				; UNPACKED ARRAY OF SIZE 16 TO STORE 16 DIGITS UNPACKED BCD
    
DATA ENDS						; END OF DATA SEGMENT

CODE SEGMENT						; A SEGMENT NAMED AS CODE

    ASSUME  DS:DATA , CS:CODE
    ; INFORM TO ASSEMBLER THAT DATA SEGMENT IS ASSOCIATED WITH DS AND CODE SEGMENT IS ASSOCIATED WITH CS
    
    START:						; MAIN OF THE PROGRAM
            MOV AX , DATA
            MOV DS , AX					; LOADS DS WITH THE ADDRESS OF DATA SEGMENT
            
            MOV CX , 08H				; CX IS INTIALIZED WITH 8 TO EXECUTE LOOP 8 TIMES
	    MOV AX , 0H 				; CLEARING AX
            MOV SI , 0H 				; CLEARING SI
            MOV DI , 0H 				; CLEARING DI
	    MOV DL , 0FH				; FOR MASKING PURPOSE
            
    NEXT:
	    MOV AL , PACKED[SI]				; MOVE THE CONTENT OF PACKED ARRAY TO AL REGISTER
	    MOV AH , PACKED[SI]				; MOVE THE CONTENT OF PACKED ARRAY TO AH REGISTER
            INC SI    					; SI IS INCREMENTED BY 1.  

	    ROR AH , 4					; ROTATE RIGHT AH REGISTER BY 4 BIT.
	    AND AL , DL					; AND THE CONTENT OF AL WITH MASK
	    AND AH , DL					; AND THE CONTENT OF AH WITH MASK

	    MOV UNPACKED[DI] , AH			; MOVE THE CONTENT OF AH REGISTER TO UNPACKED ARRAY
	    INC DI					; DI IS INCREMENTED BY 1.
	    MOV UNPACKED[DI] , AL			; MOVE THE CONTENT OF AL REGISTER TO UNPACKED ARRAY
	    INC DI					; DI IS INCREMENTED BY 1.

            LOOP NEXT					; REPEAT UNTIL CX != 0H

CODE ENDS  						; END OF CODE SEGMENT
    END START						; END OF THE PROGRAM
