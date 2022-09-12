.MODEL SMALL
.STACK 100H

 .DATA
 
   PROMPT_1  DB  'Enter a Decimal number (-32767 to 32767) : $' 
   
   PROMPT_2  DB  0DH,0AH,'The given Decimal number is : $'

 .CODE
 
   MAIN PROC
    
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, PROMPT_1             ; load and display the string PROMPT_1
     MOV AH, 9
     INT 21H

     CALL INDEC                   ; call the procedure INDEC

     PUSH AX                      ; push AX onto the STACK

     LEA DX, PROMPT_2             ; load and display the string PROMPT_2
     MOV AH, 9 
     INT 21H

     POP AX                       ; pop a value from STACK into AX

     CALL OUTDEC                  ; call the procedure OUTDEC

     ;MOV AH, 4CH                  ; return control to DOS
     ;INT 21H
     
   MAIN ENDP

   INCLUDE INDEC.ASM              ; include the file INDEC.ASM
   INCLUDE OUTDEC.ASM             ; include the file OUTDEC.ASM

 END MAIN