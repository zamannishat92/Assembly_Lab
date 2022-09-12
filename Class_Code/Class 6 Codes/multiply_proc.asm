;multiplication(int multiplicand, int multiplier){
;   result = 0
;   for(i = 1; i <= multiplier; i++){
;      result += multiplicand             
;   }
;   return result    (this returns multiplicand*multiplier)    
;} 

;5*3 = 5 + 5 + 5

;2*4 = 2 + 2 + 2 + 2

.model small
.stack 100h

.data

.code
main proc
     mov cx, 100
    
     mov al, 5
     mov bl, 3
     call mult
     
     mov ah, 4ch
     int 21h
main endp


;multiplicand should be in al register
;multiplier should be in bl register
;result will be in dl register
mult proc
    push ax
    push bx
    push cx
    
    mov dl, 0
    
    mov cl, bl
    mov ch, 0      ;cx will hold the value bl
    
    mult_loop:
    add dl, al
    loop mult_loop

    pop cx
    pop bx
    pop ax
    ret
mult endp    

end main
