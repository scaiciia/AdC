;Escribir un programa que dados los valores etiquetados como A, B
;y C y almacenados en la memoria de datos,
;calcule A+B-C y guarde el resultado en la memoria con etiqueta D,
;sin utilizar subrutinas.

        org 1000h
        A dw 8
        B dw 4
        C dw 6
        D dw ?

        org 2000h
        mov ax, A
        add ax, B
        sub ax, C
        mov D, ax
        hlt
        end