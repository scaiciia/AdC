;Escribir un programa que imprime “UNIVERSIDAD NACIONAL DE LA PLATA” 
;en la impresora a través del HAND-SHAKE. La comunicación se 
;establece por interrupciones emitidas desde el HAND-SHAKE cada vez 
;que la impresora se desocupa.

                org 1000h
                eoi equ 20h
                imr equ 21h
                int2 equ 26h
                datos equ 40h
                estado equ 41h
                msj db "UNIVERSIDAD NACIONAL DE LA PLATA"
                fin db ?
                n_hnd equ 10

                org 40
                ip_hnd dw rut_hnd

                org 3000h
       rut_hnd: push ax
                mov al, [bx]
                out datos, al
                inc bx
                dec cl
                jnz final
                mov al, 0ffh
                out imr, al
         final: mov al, eoi
                out eoi, al
                pop ax
                iret
                
                org 2000h
                mov bx, offset msj
                mov cl, offset fin - offset msj
                cli
                mov al, 11111011b
                out imr, al
                mov al, n_hnd
                out int2, al
                mov al, 80h
                out estado, al
                sti
          lazo: cmp cl, 0
                jnz lazo
                in al, estado
                and al, 7fh
                out estado, al
                int 0
                end