;Implementar un reloj similar al utilizado en los partidos de 
;Escribir un programa que encienda las luces con el patrón 
;11000011, o sea, solo las primeras y las últimas dos luces deben 
;prenderse, y el resto deben apagarse.

                org 1000h
                pa equ 30h
                pb equ 31h
                ca equ 32h
                cb equ 33h
                

                org 2000h
                cli
                mov al, 0
                out cb, al
                sti
                mov al, 11000011b
                out pb, al
                int 0
                end