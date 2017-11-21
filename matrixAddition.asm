DATA SEGMENT
    M1 DB 1H,2H,3H
       DB 4H,5H,6H
       DB 7H,8H,9H
    M2 DB 9H,8H,7H
       DB 6H,5H,4H
       DB 3H,2H,1H
    M3 DB 9DUP(0)
    
DATA ENDS  

CODE SEGMENT
    ASSUME DS:DATA,CS:CODE
 START:
     MOV AX,DATA
     MOV DS,AX 
     MOV AX,0H 
     MOV SI,0H          ; FOR INDEXING ROWS
     MOV DI,0H          ;FOR INDEXING COLUMNS
     MOV CX,3H
  NEXT1:
        PUSH CX             ;TO SAVE CX VALUE FOR LOOP1
        MOV CX,3H
        NEXT2:    
            MOV BP,DI
            MOV AL,M1[BP][SI]
            ADD AL,M2[BP][SI]
            MOV M3[BP][SI],AL 
            INC DI
            LOOP NEXT2
     
        DEC DI
        INC SI             ;TO MOVE TO NEXT ROW
        POP CX             ;USES THE VALUE OF CX FOR LOOP1
        LOOP NEXT1   
     
     
CODE ENDS
END START      
