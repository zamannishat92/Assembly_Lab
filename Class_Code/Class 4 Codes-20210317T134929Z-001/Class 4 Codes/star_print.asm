.model small
.stack 100h

.data
num_of_stars dw 80

.code
main proc
     mov ax, @data
     mov ds, ax
        
     mov cx, 0    ;i = 0  ;num of stars printed so far
     
     loop_cond:
     cmp cx, num_of_stars
     je exit
     
     mov ah, 2
     mov dl, '*'
     int 21h
     
     inc cx
     jmp loop_cond
     
     exit:
main endp
end main
