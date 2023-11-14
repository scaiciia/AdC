;Escribir un programa que muestre en pantalla todos los caracteres
;disponibles en el simulador VonSim, comenzando con el caracter 
;cuyo código es el número 01H.

                org 1000h
                caracter db 01h

                org 2000h
                mov cx, 254
         salto: mov bx, offset caracter
                mov al, 1
                int 7
                inc caracter
                dec cx
                jnz salto
                int 0
                end