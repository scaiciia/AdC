;Modificar el programa anterior agregando una subrutina llamada 
;ES_NUM que verifique si el caracter ingresado es realmente un 
;número. De no serlo, el programa debe mostrar el mensaje 
;“CARACTER NO VALIDO”. La subrutina debe recibir el código del 
;caracter por referencia desde el programa principal y debe 
;devolver vía registro el valor 0FFH en caso de tratarse de un 
;número o el valor 00H en caso contrario. Tener en cuenta que el 
;código del “0” es 30H y el del “9” es 39H.

                org 1000h
                mensaje1 db "Digite un numero: "
                mensaje2 db "Caracter no vaido"
                num db ?

                org 3000h
        ES_NUM: mov cl, 0ffh
                mov ah, num
                cmp ah, 30h
                js noes
                cmp ah, 40h
                jns noes
                jmp fin
          noes: mov cl, 00h
           fin: ret

                org 2000h
                mov bx, offset mensaje1
                mov al, offset mensaje2 - offset mensaje1
                int 7
                mov bx, offset num
                int 6
                call ES_NUM
                cmp cl, 00h
                jz saltar
                mov al, 1
                jmp final
        saltar: mov bx, offset mensaje2
                mov al, offset num - offset mensaje2
         final: int 7
                int 0
                end