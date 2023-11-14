;Escribir un programa que muestre en pantalla las letras del 
;abecedario, sin espacios, intercalando mayúsculas y minúsculas 
;(AaBb…), sin incluir texto en la memoria de datos del programa. 
;Tener en cuenta que el código de “A” es 41H, el de “a” es 61H y 
;que el resto de los códigos son correlativos según el abecedario.

                org 1000h
                mayus db 41h
                minus db 61h

                org 2000h
                mov cx, 25
         salto: mov bx, offset mayus
                mov al, 2
                int 7
                inc mayus
                inc minus
                dec cx
                jnz salto
                int 0
                end