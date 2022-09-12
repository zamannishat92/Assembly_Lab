;is_even

;func is_even(a):
;   if a%2 == 0:
;        return true    
;return false

;b = 10
;is_even(b)
;print(b)

.model small

.stack 100h

.data
even_msg db "The number is even$"
odd_msg db "The number is odd$"

.code
main proc
      mov ax, @data
      mov ds, ax
      
      mov al, 5
      call is_even
      
      cmp bl, 1
      je print_even
      
      print_odd:
      mov ah, 9
      lea dx, odd_msg
      int 21h
      jmp exit
      
      print_even:
      mov ah, 9
      lea dx, even_msg
      int 21h
      
      exit:
      mov ah, 4ch
      int 21h
main endp


;input should be in al register
;output will be in bl register 
is_even proc
      push ax  
    
      and al, 1
      
      cmp al, 0
      je even
      
      odd:
      mov bl, 0
      jmp is_even_exit
      
      even:
      mov bl, 1
      
      is_even_exit:
      pop ax
      ret
is_even endp    

end main

