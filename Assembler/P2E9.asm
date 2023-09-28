;Escribir un programa que aguarde el ingreso de una clave de 
;cuatro caracteres por teclado sin visualizarla en pantalla. 
;En caso de coincidir con una clave predefinida (y guardada en 
;memoria) que muestre el mensaje "Acceso permitido", caso
;contrario el mensaje "Acceso denegado".

                org 1000h
                mensaje db "Digite la clave: "
                corr db "Acceso permitido"
                incorr db "Acceso denegado"
                clave db "1234"
                ing db ?
                enter db 0ah

                org 2000h
                mov cx, 0
                mov bx, offset mensaje
                mov al, offset corr - offset mensaje
                int 7
                mov al, 1
                mov bx, offset enter
                int 7
          loop: mov bx, offset clave
                add bx, cx
                mov dh, [bx]
                mov bx, offset ing
                int 6
                mov dl, [bx]
                cmp dh, dl
                jnz noes
                inc cx
                cmp cx, 4
                jz es
                jmp loop
          noes: mov bx, offset incorr
                mov al, offset clave - offset incorr
                int 7
                jmp fin
            es: mov bx, offset corr
                mov al, offset incorr - offset corr
                int 7
           fin: int 0
                end