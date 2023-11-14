;Escriba la subrutina CONTAR_CAR que cuenta la cantidad de veces 
;que aparece un carácter dado en una cadena terminada en cero. 
;El carácter a buscar se debe pasar por valor mientras que la 
;cadena a analizar por referencia, ambos a través de la pila.
;Ejemplo: CONTAR_CAR de ‘abbcde!’ y ‘b’ debe retornar 2, 
;mientras que CONTAR_CAR de ‘abbcde!’ y ‘z’ debe retornar 0.

            org 1000h
            caracter db "a"
            cadena db "Hola Mundo"
            fin db 00h
            RES db ?

            org 3000h
CONTAR_CAR: mov bx, sp
            add bx, 2
            mov al, [bx]
            add bx, 2
            mov bx, [bx]
            mov dl, [bx]
            mov cx, 0
     salto: cmp dl, al
            jnz sigue
            inc cx
     sigue: inc bx
            mov dl, [bx]
            cmp dl, 00h
            jnz salto
            ret

            org 2000h
            mov al, caracter
            mov bx, offset cadena
            push bx
            push ax
            call CONTAR_CAR
            mov RES, dh
            hlt
            end