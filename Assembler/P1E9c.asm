;Usando la subrutina ROTARIZQ_N del ejercicio anterior, escriba 
;una subrutina ROTARDER_N que sea similar pero que realice N 
;rotaciones hacia la derecha.

                org 1000h
                cant db 6
                DATO db 10010100b

                org 3000h
      ROTARIZQ: mov al, DATO
                add al, al
                adc al, 0
                mov DATO, al
                ret

                org 4000h
    ROTARIZQ_N: mov cl, cant
         salto: call ROTARIZQ
                dec cl
                jnz salto
                ret

                org 5000h
    ROTARDER_N: mov cl, 8
                sub cl, cant
                mov cant, cl
                call ROTARIZQ_N
                ret

                org 2000h
                call ROTARDER_N
                hlt
                end