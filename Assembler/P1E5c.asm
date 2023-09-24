;Volver a escribir el programa, pero ahora con una subrutina 
;que reciba A, B y C por valor a través de los registros
;AX, BX y CX, calcule AX+BX-CX, y devuelva el resultado por 
;valor en el registro DX. El programa principal debe
;llamar a la subrutina y luego guardar el resultado en la 
;memoria con etiqueta D

         org 1000h
         A dw 8
         B dw 4
         C dw 6
         D dw ?

         org 3000h
calculo: add ax, bx
         sub ax, cx
         mov dx, ax
         ret

         org 2000h
         mov ax, A
         mov bx, B
         mov cx, C
         call calculo
         mov D, dx
         hlt
         end