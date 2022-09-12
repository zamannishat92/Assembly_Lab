.model small

.stack 100h


.data
alpha  db  10  

beta   dw   345

a   db   1010b

b   dw   0FFFFh

c   db   'a'


str db   'hello' 

letters db 97, 'bc'


.code
main proc       ;procedure
    
    mov ax, @data     ;@data here is basically a constant           
    mov ds, ax               

    ;MOV Al, alpha
    ;mov ah, 0
    
    ;mov ax, bx
    
    ;mov ax, 5       
    
    ;mov beta, b   ;beta = b    
    
    ;mov ah, 19h
    
    ;mov bl, 15h
    
    ;xchg ah, bl 
     
    ;add ah, 5   ;ah = ah + 5
    
    ;add beta, 10 ;beta = beta + 5 
     
    ;mov ax, b       ;ax = b
    ;add beta, ax   ;beta = beta + ax 
     
    ;mov bh, 2
    ;mov bl, 3 
     
     ;add bh, bl       ; bh = bh + bl
     ;mov ah, bh
     
    ;sub bl, bh       ; bl = bl - bh
    
    
    ;inc = increment   ++
    
    ;dec = decrement   --
    
    ;inc beta   ;beta++
    
    ;dec beta   ;beta-- 
    
    
    mov ah, 5
    neg ah
           
main endp        ;end procedure  


end main