;Escribir un programa que calcule la suma de dos números de 
;32 bits almacenados en la memoria llamando a una subrutina SUM32, 
;que reciba los parámetros de entrada por valor a través de la 
;pila, y devuelva el resultado también por referencia a través de 
;la pila.

                org 1000h
                num1h dw 0001h
                num1l dw 0FFFFh
                num2h dw 0
                num2l dw 0011h
                resh dw ?
                resl dw ?

                org 3000h
         SUM32: mov bx, sp
                add bx, 12
                mov ax, [bx]
                sub bx, 2
                add ax, [bx]
                mov cx, 0
                adc cx, 0
                sub bx, 2
                mov dx, [bx]
                sub bx, 2
                add dx, [bx]
                add dx, cx
                sub bx, 2
                mov [bx], ax
                sub bx, 2
                mov [bx], dx
                ret

                org 2000h
                mov ax, num1l
                push ax
                mov ax, num2l
                push ax
                mov ax, num1h
                push ax
                mov ax, num2h
                push ax
                mov ax, resl
                push ax
                mov ax, resh
                push ax
                call SUM32
                pop ax
                mov resh, ax
                pop ax
                mov resl, ax
                pop ax
                pop ax
                pop ax
                pop ax
                hlt
                end