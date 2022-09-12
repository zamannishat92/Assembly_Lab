;13 is prime (because only divisible by 1 and 13)
;6 is not prime

;int is_prime(int n){
;   if (n == 2) return 1;
;   for (int i = 2; i < n; ++i){
;       if (n%i == 0)
;           return 0;            
;   }
;   return 1;   
;}

.model small
.stack 100h

.data
n db 53

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 0
    mov al, n    ;ax = n
    
    push ax
    call is_prime
    
    mov ah, 4ch
    int 21h
main endp    

;it takes only one parameter, the number to be checked
;the returned value will be AL register
is_prime proc
    push BP
    mov bp, sp
    
    push cx
    push dx
    
    cmp [bp+4], 2
    je return_prime
    
    mov cx, 2     ;i = 2
    
    is_prime_loop:
    cmp cx, [bp+4]   ;i < n
    jge return_prime
    
    push [bp+4]    ;this is the dividend
    push cx        ;this is the divisor
    call divide
    
    cmp dh, 0     ;check if the remainder is 0 
    je return_not_prime
    
    inc cx
    
    jmp is_prime_loop
    
    return_prime:
    mov al, 1
    jmp exit_is_prime
    
    return_not_prime:
    mov al, 0
    
    exit_is_prime:
    pop dx
    pop cx
    pop bx
    ret 2
is_prime endp    


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