
.model small

.stack 100h


.data
 
msg1  db "Enter The 1st Number: $"
msg2  db 0ah,0dh,"Enter The 2nd Number: $"
msg3  db 0ah,0dh,"Enter The 3rd Number: $"
msg4  db 0ah,0dh,"Enter The 4th Number: $"
msg5  db 0ah,0dh,"Enter The 5th Number: $"

inp1 db 0
inp2 db 0
inp3 db 0
inp4 db 0
inp5 db 0
sum  db 0

.code

main proc 
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    mov inp1,al
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,1
    int 21h
    mov inp2,al
    
    mov ah,9
    lea dx,msg3
    int 21h
    
    mov ah,1
    int 21h
    mov inp3,al
    
    mov ah,9
    lea dx,msg4
    int 21h
    
    mov ah,1
    int 21h
    mov inp4,al
    
    mov ah,9
    lea dx,msg5
    int 21h
   
    mov ah,1
    int 21h
    mov inp5,al
    
    cond1:
    mov bl,inp1
    mov cl,48
    sub cl,bl
    mov inp1,bl
    
    mov bl,0
    mov cl,9
    
    cmp inp1,bl
    jge cond2
    jmp exit
    
    cond2:
    cmp cl,inp1
    jle Addition1
    jmp exit
    
    Addition1:
    mov al,inp1
    add sum,al
    
    cond3:
    mov bl,inp2
    mov cl,48
    sub cl,bl
    mov inp2,bl
    
    mov bl,0
    mov cl,9
    
    cmp inp2,bl
    jge cond4
    jmp exit
    
    cond4:
    cmp cl,inp2
    jle Addition2
    jmp exit
    
    Addition2:
    mov al,inp2
    add sum,al
    
    cond5:
    mov bl,inp3
    mov cl,48
    sub cl,bl
    mov inp3,bl
    
    mov bl,0
    mov cl,9
    
    cmp inp3,bl
    jge cond6
    jmp exit
    
    cond6:
    cmp cl,inp3
    jle Addition3
    jmp exit
    
    Addition3:
    mov al,inp3
    add sum,al
    
    cond7:
    mov bl,inp4
    mov cl,48
    sub cl,bl
    mov inp4,bl
    
    mov bl,0
    mov cl,9
    
    cmp inp4,bl
    jge cond8
    jmp exit
    
    cond8:
    cmp cl,inp4
    jle Addition4
    jmp exit
    
    Addition4:
    mov al,inp4
    add sum,al
    
    cond9:
    mov bl,inp5
    mov cl,48
    sub cl,bl
    mov inp5,bl
    
    mov bl,0
    mov cl,9
    
    cmp inp5,bl
    jge cond10
    jmp exit
    
    cond10:
    cmp cl,inp5
    jle Addition5
    jmp exit
    
    Addition5:
    mov al,inp5
    add sum,al
    
    mov cl,48
    add sum,cl
    
    mov ah,2
    mov dl,sum
    int 21h
    
    
    exit:
    
   
    
    
    
    
    
main endp
end main



