;check if a number is even or odd
;if (num%2 == 0){
;    then even
;}
;otherwise odd


;5 = 0000 0101b
;4 = 0000 0100b 

;7 = 0000 0111b

;mask = 0000 0001b

;k = number AND mask

;if k == 0: even
;else: odd

.model small
.stack 100h 

.data
mask db 1
even db "The number is even$"
odd db "The number is odd$"
                                                                                 
    mov ds, ax
    
    mov al, 100
    
    and al, mask    ;al = al AND mask                 
    
    cmp al, 0
    je print_even
    
    mov ah, 9
    lea dx, odd
    int 21h
    jmp exit
    
    print_even:
    mov ah, 9
    lea dx, even
    int 21h
    
    exit:
    
main endp
end main