.model small
.stack 100h

.data


.code
main proc
    ;10000000 and 11111111
    mov al, 11111111b
    mov bl, 10000000b
    ;mul bl
    imul bl
    
    ;300 and 400
    mov ax, 300
    mov bx, 400
    mul bx
    
    
    ;200/30    dividend = 200, divisor = 30
    ;quotient = 6, remainder = 20
    mov ax, 200
    mov bl, 30
    div bl 
main endp

end main