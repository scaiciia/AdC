;Escribir un programa que permita seleccionar una letra del 
;abecedario al azar. El código de la letra debe generarse en un
;registro que incremente su valor desde el código de A hasta el 
;de Z continuamente. La letra debe quedar seleccionada al
;presionarse la tecla F10 y debe mostrarse de inmediato en la 
;pantalla de comandos.

                org 1000h
                letra db ?
                eoi equ 20h
                imr equ 21h
                int0 equ 24h
                n_f10 equ 10

                org 40
                ip_f10 dw rut_f10

                org 3000h
       rut_f10: push ax
                push bx
                mov bx, offset letra
                mov al, 1
                int 7
                mov al, eoi
                out eoi, al
                pop bx
                pop ax
                iret

                org 2000h
                cli
                mov al, 11111110b
                out imr, al
                mov al, n_f10
                out int0, al
                sti
        reboot: mov letra, 61h
          loop: add letra, 1
                cmp letra, 7ah
                jnz loop
                jmp reboot
                int 0
                end