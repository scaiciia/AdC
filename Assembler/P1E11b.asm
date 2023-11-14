;Escriba la subrutina RESTO que calcule el resto de la división 
;entre 2 números positivos. Dichos números deben pasarse por valor 
;desde el programa principal a la subrutina a través de registros. 
;El resultado debe devolverse también a través de un registro 
;por referencia.

                org 1000h
                dividendo dw 28
                divisor dw 3
                res dw ?

                org 3000h
         RESTO: mov cx, 1
                mov bx, 0
           sig: sub ax, dx
                js ant
                jz fin
                inc cx
                jmp sig
           ant: dec cx
                mov bx, ax
                add bx, dx
           fin: ret

                org 2000h
                mov ax, dividendo
                mov dx, divisor
                call RESTO
                mov res, bx
                hlt
                end