.model small
.stack 100h

.data
n db 5
sum dw 0

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov bh,0
    
    outer_loop:
    inc bh
    cmp bh,n
    jg exit
    
    mov bl, 1
    mov cx, 2
    
        inner_loop:
        cmp bl, bh
        jg outer_loop
    
        add sum, cx    ;sum = sum + bl
        mov AX,sum     
        add cx,2
        inc bl
        jmp inner_loop
    
    
    exit:
main endp
end main