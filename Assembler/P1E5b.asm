;Escribir un programa como en a) pero ahora el cálculo y el 
;almacenamiento del resultado debe realizarse en una
;subrutina llamada calculo, sin recibir ni devolver parámetros, 
;es decir, utilizando A, B, C y D como variables
;globales. Si bien esta técnica no está recomendada, 
;en ejercicio sirve para ver sus diferencias con el uso de
;parámetros.

         org 1000h
         A dw 8
         B dw 4
         C dw 6
         D dw ?

         org 3000h
calculo: mov ax, A
         add ax, B
         sub ax, C
         mov D, ax
         ret

         org 2000h
         call calculo
         hlt
         end