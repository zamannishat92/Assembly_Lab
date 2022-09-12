;int  GCD  (int a , int  b ){
;    if ( b == 0 ) return a ;
;    else return GCD( b , a%b )
;}

.model small
.stack 100h

.data

a dw ?
b dw ?

.code 
main proc
    mov ax,@data
    mov ds,ax
    
    push a
    push b
    call gcd
    
    mov ah,4ch
    int 21h
main endp

;result will be stored in DX
gcd proc
    push bp
    mov bp.sp 
    
    push ax
    push bx
    
    mov bx,[bp+4]  ;bx will have b
    mov ax,[bp+6]  ;ax will have a
    
    cmp bx,0
    je ret_ax 
    
    
    ret_ax:
    mov dx,ax
    
     
gcd endp

end main

    