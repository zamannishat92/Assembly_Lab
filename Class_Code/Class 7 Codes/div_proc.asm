;10/3    quotient, remainder

;10-3 = 7 > 3
;7-3 = 4 > 3
;4-3 = 1 < 3

;12/3
;12-3 = 9>3
;9-3 = 6>3
;6-3 = (3==3)
;3-3 = 0<3

;func divide(dividend, divisor):
;   quotient = 0
;   while(dividend >= divisor):
;       dividend = dividend - divisor
;       quotient++
;   remainder = dividend


.model small
.stack 100h

.data
dividend dw 100
divisor dw 30 

.code
main proc
    mov ax, @data
    mov ds, ax
    
    push dividend
    push divisor
    call divide
    
    mov ah, 4ch
    int 21h    
main endp

;it takes two parameters dividend and divisor
;first dividend will be pushed
;then divisor will be pushed
;quotient will be in DL register
;remainder will be in DH register
divide proc
    push bp
    mov bp, sp
    
    push ax
    push bx
    
    mov bx, [bp+4]     ;bx will have the divisor
    mov ax, [bp+6]     ;ax will have the dividend
    
    mov dl, 0          ;quotient = 0
    
    divide_loop:
    cmp ax, bx         ;while(dividend >= divisor)
    jl exit_divide_loop
    
    sub ax, bx         ;ax = ax - bx = dividend - divisor
    inc dl             ;quotient++
    
    jmp divide_loop
    
    exit_divide_loop:
    ;the value of dividend will be so small that it fits in AL
    mov dh, al         ;remainder = dividend   
    
    pop bx
    pop ax
    pop bp
    ret 4
divide endp

end main