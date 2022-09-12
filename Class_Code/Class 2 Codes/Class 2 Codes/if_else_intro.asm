.model small
.stack 100h


.data
msg1 db 0Ah, 0Dh, "1st input is greater than 2nd input$"
msg2 db 0Ah, 0Dh, "2nd input is greater than 1st input$"
msg3 db 0Ah, 0Dh, "Both inputs are equal$"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    
    mov bl, al    ;the first input is in register BL
    
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    mov ah, 1
    int 21h       ;the second input is in register AL
    
    CMP BL, AL
    JG GREATER     ;jump if greater than
    jl lesser      ;jump if lesser than
    je equal       ;jump if equal
    
    ;conditional jump
    
    greater:
    mov ah, 9
    lea dx, msg1
    int 21h
    jmp exit       ;jump (without any condition), unconditional jump
    
    lesser:
    mov ah, 9
    lea dx, msg2
    int 21h
    jmp exit
    
    equal:
    mov ah, 9
    lea dx, msg3
    int 21h
    
    exit:
    
    
main endp
end main