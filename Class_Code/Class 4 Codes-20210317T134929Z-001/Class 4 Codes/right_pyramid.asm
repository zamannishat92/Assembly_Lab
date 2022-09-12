.model small
.stack 100h

.data
line db 10

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cl, 1              ;cl is keeping track of current line
    
    outer_loop:
    cmp cl, line
    jg exit
    
    mov bh, line
    sub bh, cl            ;bh = line - cl
    
    mov bl, 0             ;bl is keeping track of spaces printed
    mov dh, 0             ;dh is keeping track of stars printed
    space_print:
    cmp bl, bh
    je star_print
    
    mov ah, 2
    mov dl, ' '
    int 21h
    
    inc bl
    jmp space_print
    
    star_print:
    cmp dh, cl
    je newline_print
    mov ah, 2
    mov dl, '*'
    int 21h
    
    inc dh
    jmp star_print
    
    newline_print:
    mov ah, 2
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    
    inc cl
    jmp outer_loop
    
    exit:
main endp
end main