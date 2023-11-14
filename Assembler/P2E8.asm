;Escribir un programa que efectúe la resta de dos números (de un 
;dígito cada uno) ingresados por teclado y muestre el resultado 
;en la pantalla de comandos. Antes de visualizarlo el programa 
;debe verificar si el resultado es positivo o negativoy anteponer 
;al valor el signo correspondiente.

                org 1000h
                mensaje db "Digite un numero: "
                num1 db ?
                num2 db ?
                sig db 2bh
                resu db ?
                enter db 0ah

                org 2000h
                mov cx, 0
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
                mov bx, offset enter
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
                sub cl, num2
                jns imprimir
                neg cl
                add sig, 2
      imprimir: add cl, 30h
                mov resu, cl
                mov al, 1
                mov bx, offset enter
                int 7
                mov al, 2
                mov bx, offset sig
                int 7
                int 0
                end