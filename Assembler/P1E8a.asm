;Escribir una subrutina LONGITUD que cuente el número de caracteres
;de una cadena de caracteres terminada encero (00H) 
;almacenada en la memoria. La cadena se pasa a la subrutina por 
;referencia vía registro, y el resultado
;se retorna por valor también a través de un registro.
;Ejemplo: la longitud de ‘abcd’00h es 4 (el 00h final no cuenta)

          org 1000h
          cadena db "Hola Mundo"
          final db 00h
          RES dw ?

          org 3000h
LONGITUD: mov cx, 0
   salto: mov al, [bx]
          cmp al, 00h
          jz fin
          inc cx
          inc bx
          jmp salto
     fin: ret

          org 2000h
          mov bx, offset cadena
          call LONGITUD
          mov RES, cx
          hlt
          end