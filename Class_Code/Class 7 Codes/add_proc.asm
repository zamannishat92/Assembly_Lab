.model small
.stack 100h

.data
a dw 10
b dw 20

.code
main proc
    mov ax, @data
    mov ds, ax
    
    push a
    push b
    call add2
    
    mov ah, 4ch
    int 21h
main endp


;this has two parameters, push them onto the stack
;the result will be returned via AX register
add2 proc
    push bp
    mov bp, sp
    push bx
    
    mov ax, [bp+4]
    mov bx, [bp+6]
    
    add ax, bx
    
    pop bx
    pop bp 
    ret 4
add2 endp

end main