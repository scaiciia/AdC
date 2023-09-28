;Implementar un reloj similar al utilizado en los partidos de 
;básquet, que arranque y detenga su marcha al presionar sucesivas 
;veces la tecla F10 y que finalice el conteo al alcanzar los 30 
;segundos.

                org 1000h
                num db 30h
                    db 30h
                limpiar db 0ch
                cont equ 10h
                comp equ 11h
                eoi equ 20h
                imr equ 21h
                int0 equ 24h
                int1 equ 25h
                n_f10 equ 10
                n_timer equ 11

                org 40
                ip_f10 dw rut_f10

                org 44
                ip_timer dw rut_timer

                org 3000h
       rut_f10: push ax
                push bx
                in al, imr
                xor al, 00000010b
                out imr, al
                mov al, eoi
                out eoi, al
                pop bx
                pop ax
                iret

                org 4000h
     rut_timer: push ax
                inc num + 1
                cmp num + 1, 3ah
                jnz reset
                mov num + 1, 30h
                inc num
                cmp num, 33h
                jnz reset
                mov dl, 1
                mov al, 11111111b
                out imr, al
         reset: mov al, 1
                mov bx, offset limpiar
                int 7
                mov al, 2
                mov bx, offset num
                int 7
                mov al, 0
                out cont, al
                mov al, eoi
                out eoi, al
                pop ax
                iret

                org 2000h
                cli
                mov al, 11111110b
                out imr, al
                mov al, n_f10
                out int0, al
                mov al, n_timer
                out int1, al
                mov al, 1
                out comp, al
                mov al, 0
                out cont, al
                mov dl, 0
                sti
          loop: cmp dl, 0
                jz loop
                int 0
                end