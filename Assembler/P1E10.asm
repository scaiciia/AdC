;SWAP Escribir una subrutina SWAP que intercambie dos datos de 
;16 bits almacenados en memoria. Los parámetros deben ser pasados 
;por referencia desde el programa principal a través de la pila.
;Para hacer este ejercicio, tener en cuenta que los parámetros 
;que se pasan por la pila son las direcciones de memoria, por lo 
;tanto para acceder a los datos a intercambiar se requieren 
;accesos indirectos, además de los que ya se deben realizar para 
;acceder a los parámetros de la pila.

                org 1000h
                DATO1 dw 0ABCDh
                DATO2 dw 0FFFFh

                org 3000h
          SWAP: mov bx, sp
                add bx, 2
                mov bx, [bx]
                mov cx, [bx]
                mov bx, sp
                add bx, 4
                mov bx, [bx]
                mov dx, [bx]
                mov bx, sp
                add bx, 2
                mov bx, [bx]
                mov [bx], dx
                mov bx, sp
                add bx, 4
                mov bx, [bx]
                mov [bx], cx
                ret

                org 2000h
                mov bx, offset DATO1
                push bx
                mov bx, offset DATO2
                push bx
                call SWAP
                hlt
                end