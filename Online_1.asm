
.model small
.stack 100h


.data
msg1 db 0Ah, 0Dh, "Equilateral Triangle$"
msg2 db 0Ah, 0Dh, "Isoscelal Triangle$"
msg3 db 0Ah, 0Dh, "Scalene Triangle$"
msg4 db 0Ah, 0Dh, "Not a Triangle$"

inp1 db 5
inp2 db 6
inp3 db 15

.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov bl,inp1
    cmp bl,inp2
    je cond1
    jne cond1 
    
    cond1:
    cmp inp3,bl
    je cond2
    jne cond3
    
    cond2:
    mov cl,inp3
    cmp cl,inp2
    je print_1
    jne print_2
    
    cond3:
    add bl,inp2
    cmp bl,inp3
    jg print_3
    jl print_4
    
    print_1:
    mov ah,9
    lea dx,msg1
    int 21h
    jmp exit
    
    print_2:
    mov ah,9
    lea dx,msg2
    int 21h
    jmp exit
    
    print_3:
    mov ah,9
    lea dx,msg3
    int 21h
    jmp exit 
    
    print_4:
    mov ah,9
    lea dx,msg4
    int 21h
    jmp exit 
    
    exit:
    
main endp
end main




