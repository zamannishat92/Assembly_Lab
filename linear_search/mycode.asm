;for (int i = 0; i < n; i++) {
;    if (arr[i] == x){                 // Return the index of the element if the element
;                                    // is found
;        return i;        
;     }
;     return -1;
;}
;if (index == -1)
;            System.out.println("Element is not present in the array");
;        else
;            System.out.println("Element found at position " + index);  

.MODEL SMALL
.STACK 100H
.DATA                                                
   W DW 0,0,0,0,0,0,0,0,0,0 
   key   dw 0  
   MSG_P DB "INPUT 10TH LENGTH ARRAY PLEASE  $"
   MSG_S DB "SEARCH KEY $"
   MSG  DB  "FOUND $"
   MSG1 DB  "NOT FOUND $"
        
.CODE
    MAIN PROC        
        MOV AX, @DATA
        MOV DS, AX  
        
        MOV AH , 9
        LEA DX , MSG_P          ; LEA - Load effective address
        INT 21H 
        
        MOV AH,2
        MOV Dl,0DH
        INT 21H
        MOV DL,0AH
        INT 21H             
                     
        LEA SI,W  
        
        MOV CX,10
        
        loop1:
        
        CALL INDEC              ; number in AX   
        PUSH AX    
        POP AX
        MOV [SI] ,AX 
        
        MOV AH,2
        MOV Dl,0DH
        INT 21H
        MOV DL,0AH
        INT 21H 
         
        ADD BX,[SI]
        
        ADD SI,2
        
        LOOP loop1 
        
        MOV AH , 9
        LEA DX , MSG_S      
        INT 21H    
        
        MOV AH,2
        MOV Dl,0DH
        INT 21H
        MOV DL,0AH
        INT 21H   
        
        CALL INDEC
        PUSH AX
        POP AX
        
        MOV key, AX          ; Search key store 
        
        MOV SI, 0
        MOV CX,10  
        
        linear_search:
              
                         
                      MOV AX, [SI]
                        
                      CMP AX,key
                      JE RESULT
                        
                      ADD SI,2   
                      LOOP linear_search
                              
                              MOV AH,2
                              MOV Dl,0DH
                              INT 21H
                              MOV DL,0AH
                              INT 21H
                              
                              MOV AH , 9
                              LEA DX , MSG1            ; Data Not Found
                              INT 21H 
                              
                              MOV AH,4CH
                              INT 21H
                              jmp exit   
                                      
                                      RESULT:
                                      
                                          MOV AH,2
                                          MOV Dl,0DH
                                          INT 21H
                                          MOV DL,0AH
                                          INT 21H
                                             
                                          MOV AH , 9
                                          LEA DX , MSG            ; Data Found
                                          INT 21H
                                           
                                          MOV AH,4CH
                                          INT 21H
                                      
                      exit:  
                        
INCLUDE INDEC.ASM  
                        
                        
                            
END MAIN        