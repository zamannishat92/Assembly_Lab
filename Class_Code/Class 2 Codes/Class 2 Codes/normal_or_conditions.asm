;if (al == 30 OR bl == 50)
;    print('1')
;else print('2')    



.model small
.stack 100h

.data

.code
main proc
    mov al, 10
    mov bl, 10
    
    cond1:
    cmp al, 30
    je print_1
    jmp cond2
    
    cond2:
    cmp bl, 50
    je print_1
    jmp print_2
    
    print_1:
    mov ah, 2
    mov dl, '1'
    int 21h
    jmp exit
    
    print_2:
    mov ah, 2
    mov dl, '2'
    int 21h
    
    exit:
    
main endp

end main