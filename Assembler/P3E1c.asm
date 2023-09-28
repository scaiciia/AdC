;Escribir un programa que permite encender y apagar las luces 
;mediante las llaves. El programa no deberá terminar nunca, y 
;continuamente revisar el estado de las llaves, y actualizar de 
;forma consecuente el estado de las luces. La actualización se 
;realiza simplemente prendiendo la luz i si la llave i 
;correspondiente está encendida (valor 1), y apagándola en caso 
;contrario. Por ejemplo, si solo la primera llave está encendida, 
;entonces solo la primera luz se debe quedar encendida.

                org 1000h
                pa equ 30h
                pb equ 31h
                ca equ 32h
                cb equ 33h
                

                org 2000h
                cli
                mov al, 0ffh
                out ca, al
                mov al, 0
                out cb, al
                sti
          loop: in al, pa
                out pb, al
                jmp loop
                int 0
                end