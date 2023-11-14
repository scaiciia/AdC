;Lectura de datos desde el teclado.
;Escribir un programa que solicite el ingreso de un número (de un 
;dígito) por teclado e inmediatamente lo muestre en la pantalla de
;comandos, haciendo uso de las interrupciones por software INT 6 e
;INT 7.

                org 1000h
                mensaje db "Digite un numero: "
                num db ?

                org 2000h
                mov bx, offset mensaje
                mov al, offset num - offset mensaje
                int 7
                mov bx, offset num
                int 6
                mov al, 1
                int 7
                int 0
                end