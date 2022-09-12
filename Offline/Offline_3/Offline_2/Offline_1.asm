;0, 1, 2, 3, 6, 11, 20, 37, 68

;int fib(int n){
;    if (n == 3) return 0;
;    else if (n == 6) return 1;
;    else return fib(n - 1) + fib(n - 2) + fib(n-3);
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

;result will be stored in BX
fib proc
    push bp
    mov bp, sp
    
    push ax
    push cx
    
    cmp [bp+4], 3
    je ret_0
    cmp [bp+4], 6
    je ret_1
    
    mov ax, [bp+4]  ;ax = n
    dec ax          ;ax = n - 1
    push ax
    call fib        ;bx = fib(n - 1)
    mov cx, bx
    
    dec ax          ;ax = n - 2
    push ax
    call fib        ;bx = fib(n - 2)
    add bx, cx      ;bx = bx + cx = fib(n-2) + fib(n-1)
    mov cx,bx
    
    dec ax
    push ax
    call fib
    add bx,cx
    jmp fib_exit
    
    ret_0:
    mov bx, 0
    jmp fib_exit
    
    ret_1:
    mov bx, 1
    
    fib_exit:
    pop cx
    pop ax
    pop bp
    ret 2 
fib endp    

end main

