;Escriba la subrutina ROTARDER del ejercicio anterior, 
;pero sin usar la subrutina ROTARIZ.

                org 1000h
                DATO db 10010100b

                org 3000h
      ROTARDER: mov cl, 7
         salto: mov al, DATO
                add al, al
                adc al, 0
                mov DATO, al
                dec cl
                jnz salto
                ret

                org 2000h
                call ROTARDER
                hlt
                end