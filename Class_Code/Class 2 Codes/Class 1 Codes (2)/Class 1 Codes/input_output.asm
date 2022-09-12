.model small

.stack 100h

.data

inp1 db 0

inp2 db 0

inp3 db 0

msg db 'hello$'

msg1 db 'world$' 

.code

main proc
    mov ax, @data
    mov ds, ax
    
    ;mov ah, 1
    ;int 21h
    
    ;mov inp1, al
    
    ;mov ah, 1
    ;int 21h
    
    ;mov inp2, al
    
    ;int 21h
    
    ;mov inp3, al
    
    ;mov al, 10
    
    ;mov bl, al
    
    ;mov ah, 2
    ;mov dl, 102
    ;int 21h
    
    ;mov dl, inp3
    ;int 21h
    
    ;mov al, bl
    ;add al, 5 
    
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    
    mov dl, 0dh
    int 21h
    
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
main endp

end main