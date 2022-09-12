.model small
.stack 100h

.data

.code
main proc
    mov ax, 1234h
    mov bx, 5678h
    
    push ax
    push bx
    
    pop cx
    pop dx    
main endp
end main