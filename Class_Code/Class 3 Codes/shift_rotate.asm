.model small
.stack 100h

.data

.code
main proc
    mov al, 0C3h
    
    ;mov cl, 2     
    ;shl al, cl    ;only constant or cl is allowed
    
    ;mov bl, 9Ch
    
    ;sar bl, 1
    
    ;mov al, 0C3h
    
    ;rol al, 1
    
     rcl al, 2
main endp
end main