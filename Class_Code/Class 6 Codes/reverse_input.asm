;take input until '\n' is found
;while taking input, count the number characters
;while taking each input, immediately push it to the stack
;depending on the character count, pop the characters and display 

.model small

.stack 100h

.data

.code
main proc
    mov cx, 0     ;for counting characters
    
    take_input:
    mov ah, 1
    int 21h
    cmp al, 0dh
    je print_newline
    inc cx
    push ax        
    jmp take_input
    
    print_newline:
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    jcxz exit
    
    display_character:
    mov ah, 2
    pop dx
    int 21h
    loop display_character
    
    exit:           
main endp
end main