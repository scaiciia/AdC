;Escribir un programa que implemente un encendido y apagado 
;sincronizado de las luces. Un contador, que inicializa en cero, se 
;incrementa en uno una vez por segundo. Por cada incremento, se 
;muestra a través de las luces, prendiendo solo aquellas luces 
;donde el valor de las llaves es 1. Entonces, primero se enciende 
;solo la luz de más a la derecha, correspondiente al patrón 
;00000001. Luego se continúa con los patrones 00000010, 00000011, y 
;así sucesivamente. El programa termina al llegar al patrón 11111111

                org 1000h
                cont equ 10h
                comp equ 11h
                eoi equ 20h
                imr equ 21h
                int1 equ 25h
                pb equ 31h
                cb equ 33h
                n_timer equ 10

                org 40
                ip_timer dw rut_timer

                org 3000h
     rut_timer: push ax
                inc dl
                mov al, dl
                out pb, al
                cmp dl, 0ffh
                jnz salto
                mov dl, 0
         salto: mov al, 0
                out cont, al
                mov al, eoi
                out eoi, al
                pop ax
                iret
                
                org 2000h
                cli
                mov al, 0
                out cb, al
                mov al, 11111101b
                out imr, al
                mov al, n_timer
                out int1, al
                mov al, 1
                out comp, al
                mov al, 0
                out cont, al
                mov dl, 0
                sti
          loop: jmp loop
                int 0
                end