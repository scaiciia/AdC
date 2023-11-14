;Escriba la subrutina REEMPLAZAR_CAR que reciba dos caracteres 
;(ORIGINAL y REEMPLAZO) por valor a través de la pila, y una 
;cadena terminada en cero también a través de la pila. 
;La subrutina debe reemplazar el carácter ORIGINAL por el 
;carácter REEMPLAZO.

                org 1000h
                ORIGINAL db "o"
                REEMPLAZO db "0"
                cadena db "Hola Mundo"
                fin db 00h

                org 3000h
REEMPLAZAR_CAR: mov bx, sp
                add bx, 4
                mov ax, [bx]
                sub bx, 2
                mov bx, [bx]
         salto: mov dl, [bx]
                cmp dl, ah
                jnz sigue
                mov [bx], al
         sigue: inc bx
                cmp byte ptr [bx], 00h
                jnz salto
                ret

                org 2000h
                mov ah, ORIGINAL
                mov al, REEMPLAZO
                mov bx, offset cadena
                push ax
                push bx
                call REEMPLAZAR_CAR
                hlt
                end