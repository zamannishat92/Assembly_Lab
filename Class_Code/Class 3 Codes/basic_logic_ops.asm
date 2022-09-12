.model small
.stack 100h

.data

.code
main proc
    mov ah, 10110011b
    mov bh, 11101110b
    
    ;and ah, bh        ;and 1.1 = 1, 0.1 = 1.0 = 0.0 = 0
    
    ;or  ah, bh        ;or 0+1 = 1+0 = 1+1 = 1, 0 + 0 = 0
    
    xor ah, bh        ;xor 0 xor 0 = 1 xor 1 = 0
                      ; 0 xor 1 = 1 xor 0 = 1
    not ah            ;not 1 = 0; not 0 = 1                   
    
     
main endp
end main

;1011 0011b
;1110 1110b

;0101 1101b = 05Dh

;1010 0010b = 0A2h