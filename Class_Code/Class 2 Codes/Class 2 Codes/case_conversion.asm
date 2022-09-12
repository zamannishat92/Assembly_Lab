;The user will give a character as input
;if the character is a lowercase character, we will print the uppercase version of it
;and vice versa

;'a' <= c <= 'z' if true, lowercase
;otherwise, uppercase


.model small
.stack 100h

.data
input_msg db "Enter your character here: $"
msg1 db 0ah, 0dh, "Your input character is an uppercase letter", 0ah, 0dh, "$"
msg2 db 0ah, 0dh, "Your input character is a lowercase letter", 0ah, 0dh, "$"

msg3 db "The lowercase version of your input is $"
msg4 db "The uppercase version of your input is $"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, input_msg
    int 21h
    
    mov ah, 1
    int 21h
    
    mov cl, al
    
    cond1:
    cmp cl, 'a'
    jg cond2
    jmp uppercase
    
    cond2:
    cmp cl, 'z'
    jle lowercase
    jmp uppercase
    
    uppercase:
    mov ah, 9
    lea dx, msg1
    int 21h
    
    add cl, 32
    
    lea dx, msg3
    int 21h
    
    mov ah, 2
    mov dl, cl
    int 21h
    
    jmp exit
    
    lowercase:
    mov ah, 9
    lea dx, msg2
    int 21h
    
    sub cl, 32 
    
    lea dx, msg4
    int 21h
    
    mov ah, 2
    mov dl, cl
    int 21h
    
    exit:
    
main endp
end main 

