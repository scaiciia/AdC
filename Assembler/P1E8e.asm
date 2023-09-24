;Escriba la subrutina CONTAR_CAR que cuenta la cantidad de veces que 
;aparece un carácter dado en una cadena terminada en cero. 
;El carácter a buscar se debe pasar por valor mientras que la 
;cadena a analizar por referencia, ambos a través de la pila.
;Ejemplo: CONTAR_CAR de ‘abbcde!’ y ‘b’ debe retornar 2, 
;mientras que CONTAR_CAR de ‘abbcde!’ y ‘z’ debe retornar 0.

            org 1000h
            carcacter db "o"
            cadena db "Hola Mundo"
            fin db 00h
            RES db ?

            org 3000h
CONTAR_CAR: 

            org 2000h
            mov ax, caracter
            mov bx, offset cadena
            push ax
            push bx
            call CONTAR_CAR
            mov RES, dh
            hlt
            end