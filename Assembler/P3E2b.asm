;Escribir un programa para imprimir el mensaje “ORGANIZACION Y 
;ARQUITECTURA DE COMPUTADORAS” utilizando la impresora a través 
;de la PIO.

                org 1000h
                pa equ 30h
                pb equ 31h
                ca equ 32h
                cb equ 33h
                msj db "ORGANIZACION Y ARQUITECTURA DE COMPUTADORAS"
                fin db ?
                
                org 2000h
                mov al, 11111101b
                out ca, al
                mov al, 0
                out cb, al
                in al, pa
                and al, 11111101b
                out pa, al
                mov bx, offset msj
                mov cl, offset fin - offset msj
          poll: in al, pa
                and al, 1
                jnz poll
                mov al, [bx]
                out pb, al
                in al, pa
                or al, 2
                out pa, al
                in al, pa
                and al, 11111101b
                out pa, al
                inc bx
                dec cl
                jnz poll
                int 0
                end