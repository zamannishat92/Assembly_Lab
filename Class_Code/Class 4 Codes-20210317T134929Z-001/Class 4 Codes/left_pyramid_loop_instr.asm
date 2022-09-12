.model small
.stack 100h

.data
line db 9      ;this variable is the target line

.code
main proc
     mov ax, @data
     mov ds, ax
     
     mov cl, 1  ;cl is keeping track of the current line
     
     outer_loop:  
     cmp cl, line
     jg exit
     
     mov ch, 0
     
     mov bl, cl
     
     star_print:
     mov ah, 2
     mov dl, '*'
     int 21h
  
     loop star_print
     
     mov cl, bl
     
     mov ah, 2
     mov dl, 0ah
     int 21h
     mov ah, 2
     mov dl, 0dh
     int 21h
     
     inc cl
     jmp outer_loop
      
     exit:
main endp
end main
