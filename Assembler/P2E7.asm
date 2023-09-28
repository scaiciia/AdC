;Escribir un programa que efectúe la suma de dos números (de un 
;dígito cada uno) ingresados por teclado y muestre el resultado 
;en la pantalla de comandos. Recordar que el código de cada 
;caracter ingresado no coincide con el número que representa y 
;que el resultado puede necesitar ser expresado con 2 dígitos.

                org 1000h
                mensaje db "Digite un numero: "
                num1 db ?
                num2 db ?
                resd db 30h
                resu db ?
                limpiar db 0ah

                org 2000h
                mov bx, offset mensaje
                mov al, offset num1 - offset mensaje
                int 7
                mov bx, offset num1
                int 6
                mov al, 1
                mov bx, offset num1
                int 7
                sub num1, 30h
                mov al, 1
                mov bx, offset limpiar
                int 7
                mov bx, offset mensaje
                mov al, offset num1 - offset mensaje
                int 7
                mov bx, offset num2
                int 6
                mov al, 1
                mov bx, offset num2
                int 7
                sub num2, 30h
                mov cl, num1
                add cl, num2
                cmp cl, 0ah
                js imprimir
                sub cl, 0ah
                inc resd
      imprimir: add cl, 30h
                mov resu, cl
                mov al, 1
                mov bx, offset limpiar
                int 7
                mov al, 2
                mov bx, offset resd
                int 7
                int 0
                end