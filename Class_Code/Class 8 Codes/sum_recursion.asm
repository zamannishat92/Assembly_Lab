;int sum(int n){
;    if (n == 1) {
;        return 1;
;    }
;    else {
;        return sum(n-1) + n;
;    }
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
    call sum
    
    mov ah, 4ch
    int 21h
main endp

;push the parameter n in the stack before calling
;return the sum in DX register
sum proc
    push bp
    mov bp, sp
    push bx
    
    ;[bp+4] has the value of n
    cmp [bp+4], 1
    je ret_1
    
    mov bx, [bp+4]   ;bx will have the value of n
    dec bx           ;n-1
    push bx
    call sum         ;dx = sum(n-1) 
    add dx, [bp+4]   ;dx = sum(n-1) + n
    jmp sum_exit
    
    ret_1:
    mov dx, 1
    
    sum_exit:
    pop bx
    pop bp
    ret 2
sum endp    

end main