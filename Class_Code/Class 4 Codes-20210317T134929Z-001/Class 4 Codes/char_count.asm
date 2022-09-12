;count the number of characters input by the user until
;a enter is pressed 

.model small
.stack 100h

.data
cnt db 0
.code
main proc
    mov ax, @data
    mov ds, ax
    
    take_input:
    mov ah, 1
    int 21h
    
    cmp al, 0Dh
    je exit_loop
    
    inc cnt
    jmp take_input
    
    exit_loop:
    
main endp
end main