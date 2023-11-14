;Escribir un programa que imprime “INGENIERIA E INFORMATICA” en la 
;impresora a través del HAND-SHAKE. La comunicación se establece 
;por consulta de estado (polling).

                org 1000h
                datos equ 40h
                estado equ 41h
                msj db "INGENIERIA E INFORMATICA"
                fin db ?
                
                org 2000h
                in al, estado
                and al, 01111111b
                out estado, al
                mov bx, offset msj
                mov cl, offset fin - offset msj
          poll: in al, estado
                and al, 1
                jnz poll
                mov al, [bx]
                out datos, al
                inc bx
                dec cl
                jnz poll
                int 0
                end