;Escribir una subrutina CONTAR_MIN que cuente el número de letras 
;minúsculas de la ‘a’ a la ‘z’ de una cadena de caracteres 
;terminada en cero almacenada en la memoria. La cadena se pasa a 
;la subrutina por referencia vía registro, y el resultado se 
;retorna por valor también a través de un registro.
;Ejemplo: CONTAR_MIN de ‘aBcDE1#!’ debe retornar 2.

            org 1000h
            caracter equ 61h
            cadena db "Hola Mundo"
            fin db 00h
            RES db ?

            org 3000h
CONTAR_MIN: mov ah, [bx]
            mov cl, 0
     salto: mov ch, 25
            mov al, caracter
       sig: cmp ah, al
            jnz sigue
            inc cl
            jmp otro
     sigue: inc al
            dec ch
            jnz sig
      otro: inc bx
            mov ah, [bx]
            cmp ah, 00h
            jnz salto
            ret

            org 2000h
            mov bx, offset cadena
            call CONTAR_MIN
            mov RES, cl
            hlt
            end