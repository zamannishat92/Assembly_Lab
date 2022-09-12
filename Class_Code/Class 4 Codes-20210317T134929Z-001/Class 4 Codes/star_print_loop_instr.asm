.model small
.stack 100h

.data
num_of_stars dw 15
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, num_of_stars
    
    jcxz skip
    
    print:
    mov ah, 2
    mov dl, '*'
    int 21h
    
    loop print
    
    skip:
main endp
end main