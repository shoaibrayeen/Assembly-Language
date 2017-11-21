;ALP to perform matrix multiplication
DATA SEGMENT
    M1 DB 01H,02H
       DB 03H,04H 
       DB 05H,06H 
       DB 07H,08H
       
    M2 DB 01H,02H,03H
       DB 04H,05H,06H
    M3 DB 9 DUP(?)            ;product matrix
                
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA , CS:CODE  
    
    START: 
	MOV AX , DATA
    	MOV DS , AX
    
    	MOV AX , AX
    	MOV BP , 0H 
    	MOV DI , 0H
    	MOV SI , 0H
    	MOV CX , 04H		;NUMBER OF ROW OF 1ST MATRIX
    	MOV DH , 0H 
     
    
    	LOOP1: 
        	PUSH CX 
        	MOV CX , 03H	; NUMBER OF COLUMNS IN 2ND MATRIX
        	LOOP2:
            		PUSH CX
            		MOV CX , 02H ;NUMBER OF COLUMNS IN 1ST MATRIX
            		Loop3: 
                		MOV AL , M1[SI] 
                		IMUL M2[DI] 
                		ADD DH , AL
    				    INC SI		    ;FOR ROW ITERATION
                		ADD DI , 03H     ;ADD NUMBER OF COLUMNS OF 2ND MATRIX IN DI
                		LOOP LOOP3 
    
  			        POP CX
            		MOV M3[BP],DH     	;SAVING RESULT  
            		MOV DH ,0H
            		INC BP
            		SUB SI , 2H		;SUB NUMBER OF COLUMNS OF 1ST MATRIX FROM SI
            		SUB DI , 5H		;SUB (2*NUMBER OF COLUMNS -1) OF 2ND MATRIX FROM DI TO MULTIPLY WITH NEXT COLUMN
            		LOOP LOOP2
            
            	POP CX
            	ADD SI , 02H        ;ADD NUMBER OF COLUMNS OF 1ST MATRIX
            	MOV DI , 0H			;INTIALIZE IT TO ZERO TO COMPUTE IT
            	LOOP LOOP1 
    
CODE ENDS
    END START;ALP to perform matrix multiplication
DATA SEGMENT
    M1 DB 01H,02H
       DB 03H,04H 
       DB 05H,06H 
       DB 07H,08H
       
    M2 DB 01H,02H,03H
       DB 04H,05H,06H
    M3 DB 9 DUP(?)            ;product matrix
                
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA , CS:CODE  
    
    START: 
	MOV AX , DATA
    	MOV DS , AX
    
    	MOV AX , AX
    	MOV BP , 0H 
    	MOV DI , 0H
    	MOV SI , 0H
    	MOV CX , 04H		;NUMBER OF ROW OF 1ST MATRIX
    	MOV DH , 0H 
     
    
    	LOOP1: 
        	PUSH CX 
        	MOV CX , 03H	; NUMBER OF COLUMNS IN 2ND MATRIX
        	LOOP2:
            		PUSH CX
            		MOV CX , 02H ;NUMBER OF COLUMNS IN 1ST MATRIX
            		Loop3: 
                		MOV AL , M1[SI] 
                		IMUL M2[DI] 
                		ADD DH , AL
    				    INC SI		    ;FOR ROW ITERATION
                		ADD DI , 03H     ;ADD NUMBER OF COLUMNS OF 2ND MATRIX IN DI
                		LOOP LOOP3 
    
  			        POP CX
            		MOV M3[BP],DH     	;SAVING RESULT  
            		MOV DH ,0H
            		INC BP
            		SUB SI , 2H		;SUB NUMBER OF COLUMNS OF 1ST MATRIX FROM SI
            		SUB DI , 5H		;SUB (2*NUMBER OF COLUMNS -1) OF 2ND MATRIX FROM DI TO MULTIPLY WITH NEXT COLUMN
            		LOOP LOOP2
            
            	POP CX
            	ADD SI , 02H        ;ADD NUMBER OF COLUMNS OF 1ST MATRIX
            	MOV DI , 0H			;INTIALIZE IT TO ZERO TO COMPUTE IT
            	LOOP LOOP1 
    
CODE ENDS
    END START
