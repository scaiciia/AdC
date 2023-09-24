;Escriba la subrutina ES_VOCAL, que determina si un carácter es 
;vocal o no, ya sea mayúscula o minúscula. La rutina debe recibir 
;el carácter por valor vía registro, y debe retornar, 
;también vía registro, el valor 0FFH si el carácter es una vocal,
;o 00H en caso contrario.
;Ejemplos: ES_VOCAL de ‘a’ o ‘A’ debe retornar 0FFh 
;y ES_VOCAL de ‘b’ o de ‘4’ debe retornar 00h

            org 1000h
            caracter db "u"
            vocales db "AaEeIiOoUu"
            RES dw ?

            org 3000h
  ES_VOCAL: mov dx, 0FFh
            mov bx, offset vocales
            mov cl, 10
     salto: mov al, [bx]
            cmp ah, al
            jz fin
            inc bx
            dec cl
            jnz salto
            mov dx, 00h
       fin: ret

            org 2000h
            mov ah, caracter
            call ES_VOCAL
            mov RES, dx
            hlt
            end