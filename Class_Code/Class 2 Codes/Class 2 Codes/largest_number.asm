
;if (ax >= bx and ax >= cx){
;    print ("ax")    
;}

;else if (bx >= ax and bx >= cx){
;
;}

;else cx largest


.model small
.stack 100h

.data

.code
main proc
    mov ax, 50
    mov bx, 25
    mov cx, 10
    
    cond1:
    cmp ax, bx
    jge cond2
    jmp cond3
    
    cond2:
    cmp ax, cx
    jge ax_l
    jmp cond3
    
    cond3:
    cmp bx, ax
    jge cond4
    jmp cx_l
    
    cond4:
    cmp bx, cx
    jge bx_l
    jmp cx_l
    
    ax_l:
    mov ah, 2
    mov dl, 'a'
    int 21h
    jmp exit
    
    bx_l:
    mov ah, 2
    mov dl, 'b'
    int 21h
    jmp exit
    
    cx_l:
    mov ah, 2
    mov dl, 'c'
    int 21h
    
    exit:
    
main endp
end main