.MODEL SMALL
.STACK 100H
.DATA
                                                
   W DW 0,0,0,0,0,0,0,0,0,0 
   high  dw 10
   var   dw 1  
   low   dw 1 
   key   dw 0  
   mid   dw 0 
   index_value dw 0 
   MSG_i DB "ENTER THE NUMBER (1-LINEAR)/(2-BINARY) $"
   MSG_P DB "ENTER 10TH LENGTH ARRAY FOR LINEAR SEARCH $"
   MSG_Q DB "ENTER 10TH LENGTH ARRAY FOR BINARY SEARCH $"
   MSG_S DB "SEARCH KEY $"
   MSG  DB  "FOUND $"
   MSG1 DB  "NOT FOUND $" 
        
.CODE 
    main proc
        
        mov ax, @data
        mov ds, ax 
        
        MOV AH , 9
        LEA DX , MSG_i          ; LEA - Load effective address
        INT 21H
        CALL M2 
        
        MOV ah,1
        INT 21h
        CALL M2
        
        CMP al,49
        je return_1
        
        
        
        return_2:
        call binary
        jmp exit1
        
        return_1:
        call linear
        
        exit1:
        mov ah, 4ch
        int 21h
        
    main endp
    
    linear PROC 
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
    ret  
    linear endp
    
    binary PROC        
        MOV AX, @DATA
        MOV DS, AX  
        
        MOV AH , 9
        LEA DX , MSG_Q          ; LEA - Load effective address
        INT 21H 
        CALL M2            
                     
        LEA SI,W  
        
        MOV CX,10
        
        loop2:
        
        CALL INDEC              ; number in AX   
        PUSH AX    
        POP AX
        MOV [SI] ,AX 
        
        CALL M2
         
        ADD BX,[SI]
        
        ADD SI,2
        
        LOOP loop2 
        
        MOV AH , 9
        LEA DX , MSG_S      
        INT 21H    
        
        CALL M2  
        
        CALL INDEC
        PUSH AX
        POP AX
        
        MOV key, AX          ; Search key store   
        
        
        binary_search:    
        
        MOV AX,low	    ; low nilam
        
        CMP high,AX	    ; low compare with high
        JL END2		    ; high jodi low theke choto hoea jai tobe search key exist kore na.	
        
                        ; Mid calculation
        
        MOV BX,high	    ; high akhn bx er modea
        
        MOV CX,0	    ; cx clean kore nilam
        MOV CX,AX	    ; cx e low raklam
        SUB BX,AX	    ; bx=bx-ax korlam (high-low) korlam
        
        MOV AL,BL	    ; DIV er jnno bx ke ax er maje nilam	
        MOV BL,2	    ; bl 2 dilam	
        DIV BL		    ; al= result , ah = remainder	
        
        MOV AH,0	    ; ah = remainder baad	

        MOV BX,low	    ; bx low ta nilam 	
        
        
        ADD AX,BX    	; add korlam ax,bx (midPoint = lowerBound + ( upperBound - lowerBound ) / 2)    
        MOV mid,AX	    ; mid pelam
        
        CALL work       ; index search
        
        MOV BX,key
        MOV CX,index_value
        
        CMP CX,BX       

        JE END          ; DATA Found   (if search = index value)
        
        CMP CX,BX       ; A[midPoint] < x
        
        JL work2        ; lowerBound = midPoint + 1
        
        CMP CX,BX       ; A[midPoint] > x
        
        JG work3        ; upperBound = midPoint - 1 
        
        work2:
        
        MOV AX,mid    
        INC AX
        MOV low,AX
        JMP binary_search
        
        
        work3:
        
        MOV AX,mid   
        MOV CX,var 
        SUB AX,CX
        MOV high,AX
        JMP binary_search

        
        END: 
        CALL M2
        MOV AH , 9
        LEA DX , MSG            ; Data Found
        INT 21H    
        MOV AH,4CH
        INT 21H
        
        END2:
        CALL M2
        MOV AH , 9
        LEA DX , MSG1           ; Data Not Found.
        INT 21H  
        MOV AH,4CH
        INT 21H
        ret
        binary endp
                  
         
        
        INCLUDE INDEC.ASM           ; Use the INDEC procedure (from the book) for taking an user input
 
    M2  PROC
                                ; move cursor to a new line
    MOV AH,2
    MOV Dl,0DH
    INT 21H
    MOV DL,0AH
    INT 21H        	
	RET
    M2 ENDP
    
    work PROC 
        
    MOV CX,mid
    
    LEA SI,W 
    
    index:
    MOV BX,[SI]
    ADD SI,2
    LOOP index
    
    MOV index_value,BX
    RET
    
    work ENDP    
        
END MAIN       