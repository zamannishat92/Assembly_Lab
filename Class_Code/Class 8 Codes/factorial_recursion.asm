;int fact(int n){
;   if (n == 0) return 1;
;   else return fact(n-1)*n; 
;}

.model small
.stack 100h

.data
n dw 4

.code
main proc
    mov ax, @data
    mov ds, ax
    
    push n
    call fact
    
    mov ah, 4ch
    int 21h
main endp

;the result will be stored in DX
fact proc
    push bp
    mov bp, sp
    
    push bx
    push ax
    
    cmp [bp+4], 0
    je  ret_1
    
    mov bx, [bp+4]   ;bx = n
    dec bx
    push bx
    call fact        ;dx = fact(n-1)
    mov ax, [bp+4]   ;ax = n
    mul dx           ;ax*dx = n*fact(n-1)
    ;result will be in dx:ax 
    mov dx, ax
    jmp fact_exit
    
    ret_1:
    mov dx, 1
    
    fact_exit:
    pop ax
    pop bx
    pop bp
    ret 2
fact endp    

end main