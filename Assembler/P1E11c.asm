;Escribir un programa que calcule la suma de dos números de 
;32 bits almacenados en la memoria sin hacer llamados a subrutinas,
;resolviendo el problema desde el programa principal.

                org 1000h
                num1h dw 0001h
                num1l dw 0FFFFh
                num2h dw 0
                num2l dw 0011h
                resh dw ?
                resl dw ?

                org 2000h
                mov ax, num1l
                mov dx, num1h
                add ax, num2l
                adc dx, num2h
                mov resh, dx
                mov resl, ax
                hlt
                end