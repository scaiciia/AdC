;Usando la subrutina anterior escribir la subrutina CONTAR_VOC, 
;que recibe una cadena terminada en cero por referencia a través de 
;un registro, y devuelve, en un registro, la cantidad de vocales 
;que tiene esa cadena. Ejemplo: CONTAR_VOC de ‘contar1#!’ debe 
;retornar 2 

            org 1000h
            cadena db "Hola Mundo"
            vocales db "AaEeIiOoUu"
            RES db ?

            org 3000h
  ES_VOCAL: push bx
            mov dl, 0FFh
            mov bx, offset vocales
            mov cl, 10
     salto: mov al, [bx]
            cmp ah, al
            jz fin
            inc bx
            dec cl
            jnz salto
            mov dl, 00h
       fin: pop bx
            ret

            org 4000h  
CONTAR_VOC: mov dh, 0
     sigue: mov ah, [bx]
            call ES_VOCAL
            cmp dl, 00h
            jz no_vocal
            inc dh
  no_vocal: inc bx
            dec ch
            jnz sigue
            ret

            org 2000h
            mov bx, offset cadena
            mov ch, offset vocales - offset cadena
            call CONTAR_VOC
            mov RES, dh
            hlt
            end