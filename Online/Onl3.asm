;1, 1, 2, 2, 4, 16, 128

;int fib(int n){
;    if (n == 2) return 0;
;    else if (n == 6) return 1;
;    else return fib(n - 1) * fib(n - 2) * fib(n-3);
;}

.model small
.stack 100h

.data
n dw 6

.code
main proc
    mov ax, @data
    mov ds, ax
    
    push n
    call fib
    
    mov ah, 4ch
    int 21h
main endp

;multiplicand should be in cl register
;multiplier should be in al register
;result will be stored in dx
fib proc
    push bp
    mov bp, sp
    
    push cx
    push ax
    
    cmp [bp+4], 2
    je ret_0
    cmp [bp+4], 4
    je ret_1
    
    mov cx, [bp+4]  ;cx = n
    dec cx          ;cx = n - 1
    push cx
    call fib        ;bx = fib(n - 1)
    mov ax, bx
    
    dec cx          ;cx = n - 2
    push cx
    call fib        ;bx = fib(n - 2)
    mul bx          ;bx = bx * ax = fib(n-2) * fib(n-1)
    
    dec cx
    push cx
    call fib
    mul bx
    mov dx,ax
    mov ah,2
    int 21h
    jmp fib_exit
    
    ret_0:
    mov dx, 0
    mov ah,2
    int 21h
    jmp fib_exit
    
    ret_1:
    mov dx, 1
    mov ah,2
    int 21h
    
    fib_exit:
    pop ax
    pop cx
    pop bp
    ret 2 
fib endp    

end main

