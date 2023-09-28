;Escribir una subrutina ROTARIZQ que haga una rotación hacia la 
;izquierda de los bits de un byte almacenado en la memoria. 
;Dicho byte debe pasarse por valor desde el programa principal a 
;la subrutina a través de registros y por referencia. 
;No hay valor de retorno, sino que se modifica directamente la 
;memoria.

                org 1000h
                DATO db 10010100b

                org 3000h
      ROTARIZQ: mov al, DATO
                add al, al
                adc al, 0
                mov DATO, al
                ret

                org 2000h
                call ROTARIZQ
                hlt
                end