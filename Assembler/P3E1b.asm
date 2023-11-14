;Escribir un programa que verifique si la llave de más a la 
;izquierda está prendida. Si es así, mostrar en pantalla el mensaje 
;“Llave prendida”, y de lo contrario mostrar “Llave apagada”. Solo 
;importa el valor de la llave de más a la izquierda (bit más 
;significativo). Recordar que las llaves se manejan con las teclas 
;0-7.

                org 1000h
                on db "Llave prendida"
                off db "Llave apagada"
                limpiar db 0ch
                pa equ 30h
                pb equ 31h
                ca equ 32h
                cb equ 33h
                

                org 2000h
                cli
                mov al, 0ffh
                out ca, al
                mov al, 0
                out cb, al
                sti
          loop: mov al, 1
                mov bx, offset limpiar
                int 7
                in al, pa
                and al, 10000000b
                cmp al, 10000000b
                jnz salto
                mov al, offset off - offset on
                mov bx, offset on
                int 7
                jmp loop
         salto: mov al, offset limpiar - offset off
                mov bx, offset off
                int 7
                jmp loop
                int 0
                end