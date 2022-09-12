;1 + 2 + 3 + .... + n = ?


.model small
.stack 100h

.data
n db 6
sum db 0

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov bl, 1
    
    loop_start:
    cmp bl, n
    jg exit
    
    add sum, bl     ;sum = sum + bl
    inc bl
    jmp loop_start
    
    
    exit:
main endp
end main