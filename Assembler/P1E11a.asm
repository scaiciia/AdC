;Escriba la subrutina DIV que calcule el resultado de la división 
;entre 2 números positivos. Dichos números deben pasarse por valor
;desde el programa principal a la subrutina a través de la pila. 
;El resultado debe devolverse también a través de la pila por valor

                org 1000h
                dividendo dw 60
                divisor dw 2
                cociente dw ?

                org 3000h
           DIV: mov bx, sp
                mov cx, 1
                add bx, 4
                mov ax, [bx]
                sub bx, 2
                mov dx, [bx]
           sig: sub ax, dx
                js ant
                jz fin
                inc cx
                jmp sig
           ant: dec cx
           fin: ret

                org 2000h
                mov ax, dividendo
                push ax
                mov ax, divisor
                push ax
                call DIV
                pop ax
                pop ax
                mov cociente, cx
                hlt
                end