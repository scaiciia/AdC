;Usando la subrutina ROTARIZQ del ejercicio anterior, escriba una 
;subrutina ROTARIZQ_N que realice N rotaciones a la izquierda de 
;un byte. La forma de pasaje de parámetros es la misma, pero se 
;agrega el parámetro N que se recibe por valor y registro. 
;Por ejemplo, al rotar a la izquierda 2 veces el byte 10010100, 
;se obtiene el byte 01010010.

                org 1000h
                cant db 2
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

                org 2000h
                call ROTARIZQ_N
                hlt
                end